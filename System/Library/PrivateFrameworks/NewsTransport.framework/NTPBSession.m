@interface NTPBSession
+ (Class)regionIdsType;
- (BOOL)hasAgeBracket;
- (BOOL)hasAgeBracketConfidenceLevel;
- (BOOL)hasAmsCampaignId;
- (BOOL)hasAmsPurchaseId;
- (BOOL)hasAppBuild;
- (BOOL)hasAppBuildNumber;
- (BOOL)hasAppConfigTreatmentId;
- (BOOL)hasAppProcessLifetimeId;
- (BOOL)hasAppVersion;
- (BOOL)hasBrowserLanguage;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCarrier;
- (BOOL)hasCellularRadioAccessTechnology;
- (BOOL)hasClientName;
- (BOOL)hasClientVersion;
- (BOOL)hasCountryCode;
- (BOOL)hasDeviceModel;
- (BOOL)hasDevicePlatform;
- (BOOL)hasEthnicity;
- (BOOL)hasEthnicityConfidenceLevel;
- (BOOL)hasGender;
- (BOOL)hasGenderConfidenceLevel;
- (BOOL)hasIncomeBracket;
- (BOOL)hasIncomeBracketConfidenceLevel;
- (BOOL)hasIosSettingsNotificationsBadgeAppIconEnabled;
- (BOOL)hasIosSettingsNotificationsEnabled;
- (BOOL)hasIosSettingsNotificationsShowAsBannersEnabled;
- (BOOL)hasIosSettingsNotificationsShowInHistoryEnabled;
- (BOOL)hasIosSettingsNotificationsShowOnLockScreenEnabled;
- (BOOL)hasIosSettingsNotificationsSoundEnabled;
- (BOOL)hasIsDiagnosticsUsageEnabled;
- (BOOL)hasIsNewUser;
- (BOOL)hasIsPaidSubscriber;
- (BOOL)hasIsPaidSubscriberFromAppStore;
- (BOOL)hasIsPaidSubscriberFromNews;
- (BOOL)hasIsPaidSubscriberFromThirdParty;
- (BOOL)hasIsStoreDemoModeEnabled;
- (BOOL)hasLanguageCode;
- (BOOL)hasLastAppOpenDate;
- (BOOL)hasLocationPermissionGranted;
- (BOOL)hasNewsWidgetModeGroup;
- (BOOL)hasNewsWidgetModeGroupId;
- (BOOL)hasNotificationsEnabled;
- (BOOL)hasNotwUserId;
- (BOOL)hasOriginatingCampaignId;
- (BOOL)hasOriginatingCampaignType;
- (BOOL)hasOriginatingCreativeId;
- (BOOL)hasOsInstallVariant;
- (BOOL)hasOsVersion;
- (BOOL)hasPaywallConfigType;
- (BOOL)hasPersonalizationPortraitVariantName;
- (BOOL)hasPreviousAppVersion;
- (BOOL)hasPreviousOsVersion;
- (BOOL)hasPrivateDataEncrypted;
- (BOOL)hasPrivateDataSyncOn;
- (BOOL)hasProductType;
- (BOOL)hasProgressivePersonalizationAllowed;
- (BOOL)hasReachabilityStatus;
- (BOOL)hasRunningObsolete;
- (BOOL)hasSessionId;
- (BOOL)hasSessionIdWatch;
- (BOOL)hasSignedIntoITunes;
- (BOOL)hasSignedIntoIcloud;
- (BOOL)hasTestBucket;
- (BOOL)hasTextSize;
- (BOOL)hasUpgradedFromObsolete;
- (BOOL)hasUserId;
- (BOOL)hasUserStartDate;
- (BOOL)hasUserStorefrontId;
- (BOOL)hasUtcOffset;
- (BOOL)hasWatchSessionId;
- (BOOL)hasWidgetDisplayMode;
- (BOOL)hasWidgetDisplayModeSessionEnd;
- (BOOL)hasWidgetModeType;
- (BOOL)hasWidgetSessionId;
- (BOOL)hasWidgetUserId;
- (BOOL)iosSettingsNotificationsBadgeAppIconEnabled;
- (BOOL)iosSettingsNotificationsEnabled;
- (BOOL)iosSettingsNotificationsShowAsBannersEnabled;
- (BOOL)iosSettingsNotificationsShowInHistoryEnabled;
- (BOOL)iosSettingsNotificationsShowOnLockScreenEnabled;
- (BOOL)iosSettingsNotificationsSoundEnabled;
- (BOOL)isDiagnosticsUsageEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewUser;
- (BOOL)isPaidSubscriber;
- (BOOL)isPaidSubscriberFromAppStore;
- (BOOL)isPaidSubscriberFromNews;
- (BOOL)isPaidSubscriberFromThirdParty;
- (BOOL)isStoreDemoModeEnabled;
- (BOOL)locationPermissionGranted;
- (BOOL)notificationsEnabled;
- (BOOL)privateDataEncrypted;
- (BOOL)privateDataSyncOn;
- (BOOL)progressivePersonalizationAllowed;
- (BOOL)readFrom:(id)a3;
- (BOOL)runningObsolete;
- (BOOL)signedIntoITunes;
- (BOOL)signedIntoIcloud;
- (BOOL)upgradedFromObsolete;
- (NSData)appProcessLifetimeId;
- (NSData)sessionId;
- (NSData)sessionIdWatch;
- (NSData)widgetSessionId;
- (NSMutableArray)regionIds;
- (NSString)amsCampaignId;
- (NSString)amsPurchaseId;
- (NSString)appBuildNumber;
- (NSString)appVersion;
- (NSString)browserLanguage;
- (NSString)campaignId;
- (NSString)carrier;
- (NSString)clientName;
- (NSString)clientVersion;
- (NSString)countryCode;
- (NSString)deviceModel;
- (NSString)devicePlatform;
- (NSString)languageCode;
- (NSString)newsWidgetModeGroupId;
- (NSString)notwUserId;
- (NSString)originatingCampaignId;
- (NSString)originatingCampaignType;
- (NSString)originatingCreativeId;
- (NSString)osVersion;
- (NSString)personalizationPortraitVariantName;
- (NSString)previousAppVersion;
- (NSString)previousOsVersion;
- (NSString)productType;
- (NSString)userId;
- (NSString)userStorefrontId;
- (NSString)watchSessionId;
- (NSString)widgetUserId;
- (float)ageBracketConfidenceLevel;
- (float)ethnicityConfidenceLevel;
- (float)genderConfidenceLevel;
- (float)incomeBracketConfidenceLevel;
- (id)campaignTypeAsString:(int)a3;
- (id)cellularRadioAccessTechnologyAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newsWidgetModeGroupAsString:(int)a3;
- (id)osInstallVariantAsString:(int)a3;
- (id)paywallConfigTypeAsString:(int)a3;
- (id)reachabilityStatusAsString:(int)a3;
- (id)regionIdsAtIndex:(unint64_t)a3;
- (id)widgetDisplayModeAsString:(int)a3;
- (id)widgetDisplayModeSessionEndAsString:(int)a3;
- (id)widgetModeTypeAsString:(int)a3;
- (int)StringAsCampaignType:(id)a3;
- (int)StringAsCellularRadioAccessTechnology:(id)a3;
- (int)StringAsNewsWidgetModeGroup:(id)a3;
- (int)StringAsOsInstallVariant:(id)a3;
- (int)StringAsPaywallConfigType:(id)a3;
- (int)StringAsReachabilityStatus:(id)a3;
- (int)StringAsWidgetDisplayMode:(id)a3;
- (int)StringAsWidgetDisplayModeSessionEnd:(id)a3;
- (int)StringAsWidgetModeType:(id)a3;
- (int)ageBracket;
- (int)campaignType;
- (int)cellularRadioAccessTechnology;
- (int)ethnicity;
- (int)gender;
- (int)incomeBracket;
- (int)newsWidgetModeGroup;
- (int)osInstallVariant;
- (int)paywallConfigType;
- (int)reachabilityStatus;
- (int)textSize;
- (int)userSegmentationSegmentSetIds;
- (int)userSegmentationSegmentSetIdsAtIndex:(unint64_t)a3;
- (int)utcOffset;
- (int)widgetDisplayMode;
- (int)widgetDisplayModeSessionEnd;
- (int)widgetModeType;
- (int64_t)appBuild;
- (int64_t)appConfigTreatmentId;
- (int64_t)lastAppOpenDate;
- (int64_t)testBucket;
- (int64_t)userSegmentationTreatmentIds;
- (int64_t)userSegmentationTreatmentIdsAtIndex:(unint64_t)a3;
- (int64_t)userStartDate;
- (unint64_t)hash;
- (unint64_t)regionIdsCount;
- (unint64_t)userSegmentationSegmentSetIdsCount;
- (unint64_t)userSegmentationTreatmentIdsCount;
- (void)addRegionIds:(id)a3;
- (void)addUserSegmentationSegmentSetIds:(int)a3;
- (void)addUserSegmentationTreatmentIds:(int64_t)a3;
- (void)clearRegionIds;
- (void)clearUserSegmentationSegmentSetIds;
- (void)clearUserSegmentationTreatmentIds;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAgeBracket:(int)a3;
- (void)setAgeBracketConfidenceLevel:(float)a3;
- (void)setAmsCampaignId:(id)a3;
- (void)setAmsPurchaseId:(id)a3;
- (void)setAppBuild:(int64_t)a3;
- (void)setAppBuildNumber:(id)a3;
- (void)setAppConfigTreatmentId:(int64_t)a3;
- (void)setAppProcessLifetimeId:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setBrowserLanguage:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(int)a3;
- (void)setCarrier:(id)a3;
- (void)setCellularRadioAccessTechnology:(int)a3;
- (void)setClientName:(id)a3;
- (void)setClientVersion:(id)a3;
- (void)setCountryCode:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDevicePlatform:(id)a3;
- (void)setEthnicity:(int)a3;
- (void)setEthnicityConfidenceLevel:(float)a3;
- (void)setGender:(int)a3;
- (void)setGenderConfidenceLevel:(float)a3;
- (void)setHasAgeBracket:(BOOL)a3;
- (void)setHasAgeBracketConfidenceLevel:(BOOL)a3;
- (void)setHasAppBuild:(BOOL)a3;
- (void)setHasAppConfigTreatmentId:(BOOL)a3;
- (void)setHasCampaignType:(BOOL)a3;
- (void)setHasCellularRadioAccessTechnology:(BOOL)a3;
- (void)setHasEthnicity:(BOOL)a3;
- (void)setHasEthnicityConfidenceLevel:(BOOL)a3;
- (void)setHasGender:(BOOL)a3;
- (void)setHasGenderConfidenceLevel:(BOOL)a3;
- (void)setHasIncomeBracket:(BOOL)a3;
- (void)setHasIncomeBracketConfidenceLevel:(BOOL)a3;
- (void)setHasIosSettingsNotificationsBadgeAppIconEnabled:(BOOL)a3;
- (void)setHasIosSettingsNotificationsEnabled:(BOOL)a3;
- (void)setHasIosSettingsNotificationsShowAsBannersEnabled:(BOOL)a3;
- (void)setHasIosSettingsNotificationsShowInHistoryEnabled:(BOOL)a3;
- (void)setHasIosSettingsNotificationsShowOnLockScreenEnabled:(BOOL)a3;
- (void)setHasIosSettingsNotificationsSoundEnabled:(BOOL)a3;
- (void)setHasIsDiagnosticsUsageEnabled:(BOOL)a3;
- (void)setHasIsNewUser:(BOOL)a3;
- (void)setHasIsPaidSubscriber:(BOOL)a3;
- (void)setHasIsPaidSubscriberFromAppStore:(BOOL)a3;
- (void)setHasIsPaidSubscriberFromNews:(BOOL)a3;
- (void)setHasIsPaidSubscriberFromThirdParty:(BOOL)a3;
- (void)setHasIsStoreDemoModeEnabled:(BOOL)a3;
- (void)setHasLastAppOpenDate:(BOOL)a3;
- (void)setHasLocationPermissionGranted:(BOOL)a3;
- (void)setHasNewsWidgetModeGroup:(BOOL)a3;
- (void)setHasNotificationsEnabled:(BOOL)a3;
- (void)setHasOsInstallVariant:(BOOL)a3;
- (void)setHasPaywallConfigType:(BOOL)a3;
- (void)setHasPrivateDataEncrypted:(BOOL)a3;
- (void)setHasPrivateDataSyncOn:(BOOL)a3;
- (void)setHasProgressivePersonalizationAllowed:(BOOL)a3;
- (void)setHasReachabilityStatus:(BOOL)a3;
- (void)setHasRunningObsolete:(BOOL)a3;
- (void)setHasSignedIntoITunes:(BOOL)a3;
- (void)setHasSignedIntoIcloud:(BOOL)a3;
- (void)setHasTestBucket:(BOOL)a3;
- (void)setHasTextSize:(BOOL)a3;
- (void)setHasUpgradedFromObsolete:(BOOL)a3;
- (void)setHasUserStartDate:(BOOL)a3;
- (void)setHasUtcOffset:(BOOL)a3;
- (void)setHasWidgetDisplayMode:(BOOL)a3;
- (void)setHasWidgetDisplayModeSessionEnd:(BOOL)a3;
- (void)setHasWidgetModeType:(BOOL)a3;
- (void)setIncomeBracket:(int)a3;
- (void)setIncomeBracketConfidenceLevel:(float)a3;
- (void)setIosSettingsNotificationsBadgeAppIconEnabled:(BOOL)a3;
- (void)setIosSettingsNotificationsEnabled:(BOOL)a3;
- (void)setIosSettingsNotificationsShowAsBannersEnabled:(BOOL)a3;
- (void)setIosSettingsNotificationsShowInHistoryEnabled:(BOOL)a3;
- (void)setIosSettingsNotificationsShowOnLockScreenEnabled:(BOOL)a3;
- (void)setIosSettingsNotificationsSoundEnabled:(BOOL)a3;
- (void)setIsDiagnosticsUsageEnabled:(BOOL)a3;
- (void)setIsNewUser:(BOOL)a3;
- (void)setIsPaidSubscriber:(BOOL)a3;
- (void)setIsPaidSubscriberFromAppStore:(BOOL)a3;
- (void)setIsPaidSubscriberFromNews:(BOOL)a3;
- (void)setIsPaidSubscriberFromThirdParty:(BOOL)a3;
- (void)setIsStoreDemoModeEnabled:(BOOL)a3;
- (void)setLanguageCode:(id)a3;
- (void)setLastAppOpenDate:(int64_t)a3;
- (void)setLocationPermissionGranted:(BOOL)a3;
- (void)setNewsWidgetModeGroup:(int)a3;
- (void)setNewsWidgetModeGroupId:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setNotwUserId:(id)a3;
- (void)setOriginatingCampaignId:(id)a3;
- (void)setOriginatingCampaignType:(id)a3;
- (void)setOriginatingCreativeId:(id)a3;
- (void)setOsInstallVariant:(int)a3;
- (void)setOsVersion:(id)a3;
- (void)setPaywallConfigType:(int)a3;
- (void)setPersonalizationPortraitVariantName:(id)a3;
- (void)setPreviousAppVersion:(id)a3;
- (void)setPreviousOsVersion:(id)a3;
- (void)setPrivateDataEncrypted:(BOOL)a3;
- (void)setPrivateDataSyncOn:(BOOL)a3;
- (void)setProductType:(id)a3;
- (void)setProgressivePersonalizationAllowed:(BOOL)a3;
- (void)setReachabilityStatus:(int)a3;
- (void)setRegionIds:(id)a3;
- (void)setRunningObsolete:(BOOL)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionIdWatch:(id)a3;
- (void)setSignedIntoITunes:(BOOL)a3;
- (void)setSignedIntoIcloud:(BOOL)a3;
- (void)setTestBucket:(int64_t)a3;
- (void)setTextSize:(int)a3;
- (void)setUpgradedFromObsolete:(BOOL)a3;
- (void)setUserId:(id)a3;
- (void)setUserSegmentationSegmentSetIds:(int *)a3 count:(unint64_t)a4;
- (void)setUserSegmentationTreatmentIds:(int64_t *)a3 count:(unint64_t)a4;
- (void)setUserStartDate:(int64_t)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)setUtcOffset:(int)a3;
- (void)setWatchSessionId:(id)a3;
- (void)setWidgetDisplayMode:(int)a3;
- (void)setWidgetDisplayModeSessionEnd:(int)a3;
- (void)setWidgetModeType:(int)a3;
- (void)setWidgetSessionId:(id)a3;
- (void)setWidgetUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBSession

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBSession;
  [(NTPBSession *)&v3 dealloc];
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasDevicePlatform
{
  return self->_devicePlatform != 0;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)setAppBuild:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_appBuild = a3;
}

- (void)setHasAppBuild:(BOOL)a3
{
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAppBuild
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setUtcOffset:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_utcOffset = a3;
}

- (void)setHasUtcOffset:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasUtcOffset
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasCarrier
{
  return self->_carrier != 0;
}

- (int)reachabilityStatus
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_reachabilityStatus;
  }
  else {
    return 0;
  }
}

- (void)setReachabilityStatus:(int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_reachabilityStatus = a3;
}

- (void)setHasReachabilityStatus:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasReachabilityStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)reachabilityStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444AF60[a3];
  }

  return v3;
}

- (int)StringAsReachabilityStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_REACHABILITY_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNREACHABLE_REACHABILITY_STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"REACHABLE_VIA_WIFI_REACHABILITY_STATUS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REACHABLE_VIA_CELLULAR_REACHABILITY_STATUS"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"REACHABLE_VIA_OTHER_REACHABILITY_STATUS"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)cellularRadioAccessTechnology
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_cellularRadioAccessTechnology;
  }
  else {
    return 0;
  }
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)cellularRadioAccessTechnologyAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444AF88[a3];
  }

  return v3;
}

- (int)StringAsCellularRadioAccessTechnology:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GPRS_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EDGE_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WCDMA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HSDPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HSUPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CDMA1x_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CDMAEVDORev0_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CDMAEVDORevA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CDMAEVDORevB_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"eHRPD_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LTE_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"NRNSA_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"NR_CELLULAR_RADIO_ACCESS_TECHNOLOGY"])
  {
    int v4 = 13;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setTextSize:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_textSize = a3;
}

- (void)setHasTextSize:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTextSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)setIsNewUser:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_isNewUser = a3;
}

- (void)setHasIsNewUser:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsNewUser
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setUserStartDate:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_userStartDate = a3;
}

- (void)setHasUserStartDate:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasUserStartDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLastAppOpenDate:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_lastAppOpenDate = a3;
}

- (void)setHasLastAppOpenDate:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasLastAppOpenDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRunningObsolete:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_runningObsolete = a3;
}

- (void)setHasRunningObsolete:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasRunningObsolete
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setUpgradedFromObsolete:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_upgradedFromObsolete = a3;
}

- (void)setHasUpgradedFromObsolete:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUpgradedFromObsolete
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (BOOL)hasPreviousAppVersion
{
  return self->_previousAppVersion != 0;
}

- (BOOL)hasPreviousOsVersion
{
  return self->_previousOsVersion != 0;
}

- (void)setSignedIntoIcloud:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_signedIntoIcloud = a3;
}

- (void)setHasSignedIntoIcloud:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSignedIntoIcloud
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (int)osInstallVariant
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_osInstallVariant;
  }
  else {
    return 0;
  }
}

- (void)setOsInstallVariant:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_osInstallVariant = a3;
}

- (void)setHasOsInstallVariant:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasOsInstallVariant
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)osInstallVariantAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444AFF8[a3];
  }

  return v3;
}

- (int)StringAsOsInstallVariant:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_OS_INSTALL_VARIANT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERNAL_OS_INSTALL_VARIANT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_OS_INSTALL_VARIANT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (int)campaignType
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_campaignType;
  }
  else {
    return 0;
  }
}

- (void)setCampaignType:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_campaignType = a3;
}

- (void)setHasCampaignType:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCampaignType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)campaignTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444B010[a3];
  }

  return v3;
}

- (int)StringAsCampaignType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CAMPAIGN_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EMAIL_CAMPAIGN_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PUSH_NOTIFICATION_CAMPAIGN_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPrivateDataSyncOn:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_privateDataSyncOn = a3;
}

- (void)setHasPrivateDataSyncOn:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPrivateDataSyncOn
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setIsPaidSubscriber:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_isPaidSubscriber = a3;
}

- (void)setHasIsPaidSubscriber:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriber
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setIsPaidSubscriberFromNews:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_isPaidSubscriberFromNews = a3;
}

- (void)setHasIsPaidSubscriberFromNews:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriberFromNews
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setIsPaidSubscriberFromAppStore:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_isPaidSubscriberFromAppStore = a3;
}

- (void)setHasIsPaidSubscriberFromAppStore:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriberFromAppStore
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsPaidSubscriberFromThirdParty:(BOOL)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_isPaidSubscriberFromThirdParty = a3;
}

- (void)setHasIsPaidSubscriberFromThirdParty:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriberFromThirdParty
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_notificationsEnabled = a3;
}

- (void)setHasNotificationsEnabled:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasNotificationsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasOriginatingCampaignId
{
  return self->_originatingCampaignId != 0;
}

- (BOOL)hasOriginatingCampaignType
{
  return self->_originatingCampaignType != 0;
}

- (BOOL)hasOriginatingCreativeId
{
  return self->_originatingCreativeId != 0;
}

- (void)setIosSettingsNotificationsEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_iosSettingsNotificationsEnabled = a3;
}

- (void)setHasIosSettingsNotificationsEnabled:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (int)widgetModeType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x80) != 0) {
    return self->_widgetModeType;
  }
  else {
    return 0;
  }
}

- (void)setWidgetModeType:(int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_widgetModeType = a3;
}

- (void)setHasWidgetModeType:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasWidgetModeType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)widgetModeTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444B028[a3];
  }

  return v3;
}

- (int)StringAsWidgetModeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_MODE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PARSEC_WIDGET_MODE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NEWS_TODAY_WIDGET_MODE_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setLocationPermissionGranted:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_locationPermissionGranted = a3;
}

- (void)setHasLocationPermissionGranted:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasLocationPermissionGranted
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (int)newsWidgetModeGroup
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_newsWidgetModeGroup;
  }
  else {
    return 0;
  }
}

- (void)setNewsWidgetModeGroup:(int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_newsWidgetModeGroup = a3;
}

- (void)setHasNewsWidgetModeGroup:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasNewsWidgetModeGroup
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)newsWidgetModeGroupAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444B040[a3];
  }

  return v3;
}

- (int)StringAsNewsWidgetModeGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NEWS_WIDGET_MODE_GROUP"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GROUP_A_NEWS_WIDGET_MODE_GROUP"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GROUP_B_NEWS_WIDGET_MODE_GROUP"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasNewsWidgetModeGroupId
{
  return self->_newsWidgetModeGroupId != 0;
}

- (void)setAgeBracket:(int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_ageBracket = a3;
}

- (void)setHasAgeBracket:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAgeBracket
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAgeBracketConfidenceLevel:(float)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_ageBracketConfidenceLevel = a3;
}

- (void)setHasAgeBracketConfidenceLevel:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAgeBracketConfidenceLevel
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setGender:(int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_gender = a3;
}

- (void)setHasGender:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGender
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setGenderConfidenceLevel:(float)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_genderConfidenceLevel = a3;
}

- (void)setHasGenderConfidenceLevel:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasGenderConfidenceLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIncomeBracket:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_incomeBracket = a3;
}

- (void)setHasIncomeBracket:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasIncomeBracket
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIncomeBracketConfidenceLevel:(float)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_incomeBracketConfidenceLevel = a3;
}

- (void)setHasIncomeBracketConfidenceLevel:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIncomeBracketConfidenceLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setEthnicity:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_ethnicity = a3;
}

- (void)setHasEthnicity:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasEthnicity
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setEthnicityConfidenceLevel:(float)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_ethnicityConfidenceLevel = a3;
}

- (void)setHasEthnicityConfidenceLevel:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasEthnicityConfidenceLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppConfigTreatmentId:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_appConfigTreatmentId = a3;
}

- (void)setHasAppConfigTreatmentId:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAppConfigTreatmentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientName
{
  return self->_clientName != 0;
}

- (BOOL)hasClientVersion
{
  return self->_clientVersion != 0;
}

- (BOOL)hasBrowserLanguage
{
  return self->_browserLanguage != 0;
}

- (BOOL)hasNotwUserId
{
  return self->_notwUserId != 0;
}

- (void)setPrivateDataEncrypted:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_privateDataEncrypted = a3;
}

- (void)setHasPrivateDataEncrypted:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPrivateDataEncrypted
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setProgressivePersonalizationAllowed:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_progressivePersonalizationAllowed = a3;
}

- (void)setHasProgressivePersonalizationAllowed:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasProgressivePersonalizationAllowed
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (BOOL)hasWatchSessionId
{
  return self->_watchSessionId != 0;
}

- (BOOL)hasSessionIdWatch
{
  return self->_sessionIdWatch != 0;
}

- (BOOL)hasWidgetSessionId
{
  return self->_widgetSessionId != 0;
}

- (int)widgetDisplayMode
{
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    return self->_widgetDisplayMode;
  }
  else {
    return 0;
  }
}

- (void)setWidgetDisplayMode:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_widgetDisplayMode = a3;
}

- (void)setHasWidgetDisplayMode:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasWidgetDisplayMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)widgetDisplayModeAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444B058[a3];
  }

  return v3;
}

- (int)StringAsWidgetDisplayMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMPACT_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPANDED_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TWO_BY_TWO_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TWO_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOUR_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SIX_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ONE_BY_TWO_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPersonalizationPortraitVariantName
{
  return self->_personalizationPortraitVariantName != 0;
}

- (BOOL)hasAppProcessLifetimeId
{
  return self->_appProcessLifetimeId != 0;
}

- (void)setTestBucket:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_testBucket = a3;
}

- (void)setHasTestBucket:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTestBucket
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasWidgetUserId
{
  return self->_widgetUserId != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (unint64_t)userSegmentationTreatmentIdsCount
{
  return self->_userSegmentationTreatmentIds.count;
}

- (int64_t)userSegmentationTreatmentIds
{
  return self->_userSegmentationTreatmentIds.list;
}

- (void)clearUserSegmentationTreatmentIds
{
}

- (void)addUserSegmentationTreatmentIds:(int64_t)a3
{
}

- (int64_t)userSegmentationTreatmentIdsAtIndex:(unint64_t)a3
{
  p_userSegmentationTreatmentIds = &self->_userSegmentationTreatmentIds;
  unint64_t count = self->_userSegmentationTreatmentIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_userSegmentationTreatmentIds->list[a3];
}

- (void)setUserSegmentationTreatmentIds:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)userSegmentationSegmentSetIdsCount
{
  return self->_userSegmentationSegmentSetIds.count;
}

- (int)userSegmentationSegmentSetIds
{
  return self->_userSegmentationSegmentSetIds.list;
}

- (void)clearUserSegmentationSegmentSetIds
{
}

- (void)addUserSegmentationSegmentSetIds:(int)a3
{
}

- (int)userSegmentationSegmentSetIdsAtIndex:(unint64_t)a3
{
  p_userSegmentationSegmentSetIds = &self->_userSegmentationSegmentSetIds;
  unint64_t count = self->_userSegmentationSegmentSetIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_userSegmentationSegmentSetIds->list[a3];
}

- (void)setUserSegmentationSegmentSetIds:(int *)a3 count:(unint64_t)a4
{
}

- (void)setIosSettingsNotificationsSoundEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_iosSettingsNotificationsSoundEnabled = a3;
}

- (void)setHasIosSettingsNotificationsSoundEnabled:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsSoundEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setIosSettingsNotificationsBadgeAppIconEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_iosSettingsNotificationsBadgeAppIconEnabled = a3;
}

- (void)setHasIosSettingsNotificationsBadgeAppIconEnabled:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsBadgeAppIconEnabled
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIosSettingsNotificationsShowOnLockScreenEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_iosSettingsNotificationsShowOnLockScreenEnabled = a3;
}

- (void)setHasIosSettingsNotificationsShowOnLockScreenEnabled:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsShowOnLockScreenEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setIosSettingsNotificationsShowInHistoryEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_iosSettingsNotificationsShowInHistoryEnabled = a3;
}

- (void)setHasIosSettingsNotificationsShowInHistoryEnabled:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsShowInHistoryEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIosSettingsNotificationsShowAsBannersEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_iosSettingsNotificationsShowAsBannersEnabled = a3;
}

- (void)setHasIosSettingsNotificationsShowAsBannersEnabled:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsShowAsBannersEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (int)widgetDisplayModeSessionEnd
{
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    return self->_widgetDisplayModeSessionEnd;
  }
  else {
    return 0;
  }
}

- (void)setWidgetDisplayModeSessionEnd:(int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_widgetDisplayModeSessionEnd = a3;
}

- (void)setHasWidgetDisplayModeSessionEnd:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasWidgetDisplayModeSessionEnd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)widgetDisplayModeSessionEndAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444B058[a3];
  }

  return v3;
}

- (int)StringAsWidgetDisplayModeSessionEnd:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"COMPACT_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPANDED_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TWO_BY_TWO_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TWO_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FOUR_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SIX_BY_FOUR_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ONE_BY_TWO_WIDGET_DISPLAY_MODE"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setSignedIntoITunes:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_signedIntoITunes = a3;
}

- (void)setHasSignedIntoITunes:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSignedIntoITunes
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setIsStoreDemoModeEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_isStoreDemoModeEnabled = a3;
}

- (void)setHasIsStoreDemoModeEnabled:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasIsStoreDemoModeEnabled
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setIsDiagnosticsUsageEnabled:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_isDiagnosticsUsageEnabled = a3;
}

- (void)setHasIsDiagnosticsUsageEnabled:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsDiagnosticsUsageEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)clearRegionIds
{
}

- (void)addRegionIds:(id)a3
{
  id v4 = a3;
  regionIds = self->_regionIds;
  id v8 = v4;
  if (!regionIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v7 = self->_regionIds;
    self->_regionIds = v6;

    id v4 = v8;
    regionIds = self->_regionIds;
  }
  [(NSMutableArray *)regionIds addObject:v4];
}

- (unint64_t)regionIdsCount
{
  return [(NSMutableArray *)self->_regionIds count];
}

- (id)regionIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_regionIds objectAtIndex:a3];
}

+ (Class)regionIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppBuildNumber
{
  return self->_appBuildNumber != 0;
}

- (BOOL)hasAmsPurchaseId
{
  return self->_amsPurchaseId != 0;
}

- (BOOL)hasAmsCampaignId
{
  return self->_amsCampaignId != 0;
}

- (int)paywallConfigType
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_paywallConfigType;
  }
  else {
    return 0;
  }
}

- (void)setPaywallConfigType:(int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_paywallConfigType = a3;
}

- (void)setHasPaywallConfigType:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasPaywallConfigType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)paywallConfigTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_26444B098[a3];
  }

  return v3;
}

- (int)StringAsPaywallConfigType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAYWALL_CONFIG_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEWS_PLUS_PAYWALL_CONFIG_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"B_OFFER_PAYWALL_CONFIG_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"S_BUNDLE_PAYWALL_CONFIG_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"P_DELTA_PAYWALL_CONFIG_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBSession;
  int v4 = [(NTPBSession *)&v8 description];
  v5 = [(NTPBSession *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"device_model"];
  }
  devicePlatform = self->_devicePlatform;
  if (devicePlatform) {
    [v5 setObject:devicePlatform forKey:@"device_platform"];
  }
  osVersion = self->_osVersion;
  if (osVersion) {
    [v5 setObject:osVersion forKey:@"os_version"];
  }
  appVersion = self->_appVersion;
  if (appVersion) {
    [v5 setObject:appVersion forKey:@"app_version"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  if (*(unsigned char *)&has)
  {
    v11 = [NSNumber numberWithLongLong:self->_appBuild];
    [v5 setObject:v11 forKey:@"app_build"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_utcOffset];
    [v5 setObject:v12 forKey:@"utc_offset"];
  }
  countryCode = self->_countryCode;
  if (countryCode) {
    [v5 setObject:countryCode forKey:@"country_code"];
  }
  languageCode = self->_languageCode;
  if (languageCode) {
    [v5 setObject:languageCode forKey:@"language_code"];
  }
  carrier = self->_carrier;
  if (carrier) {
    [v5 setObject:carrier forKey:@"carrier"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) != 0)
  {
    uint64_t reachabilityStatus = self->_reachabilityStatus;
    if (reachabilityStatus >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reachabilityStatus);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_26444AF60[reachabilityStatus];
    }
    [v5 setObject:v30 forKey:@"reachability_status"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x100) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v16 & 0x80000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&v16 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  uint64_t cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cellularRadioAccessTechnology);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_26444AF88[cellularRadioAccessTechnology];
  }
  [v5 setObject:v48 forKey:@"cellular_radio_access_technology"];

  if ((*(void *)&self->_has & 0x80000) != 0)
  {
LABEL_22:
    v17 = [NSNumber numberWithInt:self->_textSize];
    [v5 setObject:v17 forKey:@"text_size"];
  }
LABEL_23:
  sessionId = self->_sessionId;
  if (sessionId) {
    [v5 setObject:sessionId forKey:@"session_id"];
  }
  userId = self->_userId;
  if (userId) {
    [v5 setObject:userId forKey:@"user_id"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v5 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000000) != 0)
  {
    v31 = [NSNumber numberWithBool:self->_isNewUser];
    [v5 setObject:v31 forKey:@"is_new_user"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v21 = self->_has;
    if ((*(unsigned char *)&v21 & 0x10) == 0)
    {
LABEL_31:
      if ((*(unsigned char *)&v21 & 4) == 0) {
        goto LABEL_32;
      }
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&v21 & 0x10) == 0)
  {
    goto LABEL_31;
  }
  v32 = [NSNumber numberWithLongLong:self->_userStartDate];
  [v5 setObject:v32 forKey:@"user_start_date"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v21 = self->_has;
  if ((*(unsigned char *)&v21 & 4) == 0)
  {
LABEL_32:
    if ((*(void *)&v21 & 0x40000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
LABEL_48:
  v33 = [NSNumber numberWithLongLong:self->_lastAppOpenDate];
  [v5 setObject:v33 forKey:@"last_app_open_date"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v21 = self->_has;
  if ((*(void *)&v21 & 0x40000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v21 & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_49:
  v34 = [NSNumber numberWithBool:self->_runningObsolete];
  [v5 setObject:v34 forKey:@"running_obsolete"];

  if ((*(void *)&self->_has & 0x200000000000) != 0)
  {
LABEL_34:
    v22 = [NSNumber numberWithBool:self->_upgradedFromObsolete];
    [v5 setObject:v22 forKey:@"upgraded_from_obsolete"];
  }
LABEL_35:
  previousAppVersion = self->_previousAppVersion;
  if (previousAppVersion) {
    [v5 setObject:previousAppVersion forKey:@"previous_app_version"];
  }
  previousOsVersion = self->_previousOsVersion;
  if (previousOsVersion) {
    [v5 setObject:previousOsVersion forKey:@"previous_os_version"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v25 = self->_has;
  if ((*(void *)&v25 & 0x100000000000) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_signedIntoIcloud];
    [v5 setObject:v26 forKey:@"signed_into_icloud"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v25 = self->_has;
  }
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    uint64_t osInstallVariant = self->_osInstallVariant;
    if (osInstallVariant >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_osInstallVariant);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_26444AFF8[osInstallVariant];
    }
    [v5 setObject:v28 forKey:@"os_install_variant"];
  }
  campaignId = self->_campaignId;
  if (campaignId) {
    [v5 setObject:campaignId forKey:@"campaign_id"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x80) != 0)
  {
    uint64_t campaignType = self->_campaignType;
    if (campaignType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_campaignType);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_26444B010[campaignType];
    }
    [v5 setObject:v43 forKey:@"campaign_type"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
    if ((*(void *)&v36 & 0x10000000000) == 0)
    {
LABEL_57:
      if ((*(void *)&v36 & 0x100000000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_86;
    }
  }
  else if ((*(void *)&v36 & 0x10000000000) == 0)
  {
    goto LABEL_57;
  }
  v49 = [NSNumber numberWithBool:self->_privateDataSyncOn];
  [v5 setObject:v49 forKey:@"private_data_sync_on"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x100000000) == 0)
  {
LABEL_58:
    if ((*(void *)&v36 & 0x400000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_87;
  }
LABEL_86:
  v50 = [NSNumber numberWithBool:self->_isPaidSubscriber];
  [v5 setObject:v50 forKey:@"is_paid_subscriber"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x400000000) == 0)
  {
LABEL_59:
    if ((*(void *)&v36 & 0x200000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_88;
  }
LABEL_87:
  v51 = [NSNumber numberWithBool:self->_isPaidSubscriberFromNews];
  [v5 setObject:v51 forKey:@"is_paid_subscriber_from_news"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x200000000) == 0)
  {
LABEL_60:
    if ((*(void *)&v36 & 0x800000000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_89;
  }
LABEL_88:
  v52 = [NSNumber numberWithBool:self->_isPaidSubscriberFromAppStore];
  [v5 setObject:v52 forKey:@"is_paid_subscriber_from_app_store"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x800000000) == 0)
  {
LABEL_61:
    if ((*(void *)&v36 & 0x4000000000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_89:
  v53 = [NSNumber numberWithBool:self->_isPaidSubscriberFromThirdParty];
  [v5 setObject:v53 forKey:@"is_paid_subscriber_from_third_party"];

  if ((*(void *)&self->_has & 0x4000000000) != 0)
  {
LABEL_62:
    v37 = [NSNumber numberWithBool:self->_notificationsEnabled];
    [v5 setObject:v37 forKey:@"notifications_enabled"];
  }
LABEL_63:
  originatingCampaignId = self->_originatingCampaignId;
  if (originatingCampaignId) {
    [v5 setObject:originatingCampaignId forKey:@"originating_campaign_id"];
  }
  originatingCampaignType = self->_originatingCampaignType;
  if (originatingCampaignType) {
    [v5 setObject:originatingCampaignType forKey:@"originating_campaign_type"];
  }
  originatingCreativeId = self->_originatingCreativeId;
  if (originatingCreativeId) {
    [v5 setObject:originatingCreativeId forKey:@"originating_creative_id"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x2000000) != 0)
  {
    v44 = [NSNumber numberWithBool:self->_iosSettingsNotificationsEnabled];
    [v5 setObject:v44 forKey:@"ios_settings_notifications_enabled"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v41 = self->_has;
    if ((*(_DWORD *)&v41 & 0x800000) == 0)
    {
LABEL_71:
      if ((*(void *)&v41 & 0x2000000000) == 0) {
        goto LABEL_72;
      }
      goto LABEL_93;
    }
  }
  else if ((*(_DWORD *)&v41 & 0x800000) == 0)
  {
    goto LABEL_71;
  }
  uint64_t widgetModeType = self->_widgetModeType;
  if (widgetModeType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetModeType);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_26444B028[widgetModeType];
  }
  [v5 setObject:v46 forKey:@"widget_mode_type"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v41 = self->_has;
  if ((*(void *)&v41 & 0x2000000000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v41 & 0x8000) == 0) {
      goto LABEL_101;
    }
    goto LABEL_94;
  }
LABEL_93:
  v54 = [NSNumber numberWithBool:self->_locationPermissionGranted];
  [v5 setObject:v54 forKey:@"location_permission_granted"];

  if ((*(void *)&self->_has & 0x8000) == 0) {
    goto LABEL_101;
  }
LABEL_94:
  uint64_t newsWidgetModeGroup = self->_newsWidgetModeGroup;
  if (newsWidgetModeGroup >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_newsWidgetModeGroup);
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = off_26444B040[newsWidgetModeGroup];
  }
  [v5 setObject:v56 forKey:@"news_widget_mode_group"];

LABEL_101:
  newsWidgetModeGroupId = self->_newsWidgetModeGroupId;
  if (newsWidgetModeGroupId) {
    [v5 setObject:newsWidgetModeGroupId forKey:@"news_widget_mode_group_id"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(unsigned char *)&v58 & 0x20) != 0)
  {
    v72 = [NSNumber numberWithInt:self->_ageBracket];
    [v5 setObject:v72 forKey:@"age_bracket"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
    if ((*(unsigned char *)&v58 & 0x40) == 0)
    {
LABEL_105:
      if ((*(_WORD *)&v58 & 0x800) == 0) {
        goto LABEL_106;
      }
      goto LABEL_136;
    }
  }
  else if ((*(unsigned char *)&v58 & 0x40) == 0)
  {
    goto LABEL_105;
  }
  *(float *)&double v4 = self->_ageBracketConfidenceLevel;
  v73 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v73 forKey:@"age_bracket_confidence_level"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x800) == 0)
  {
LABEL_106:
    if ((*(_WORD *)&v58 & 0x1000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_137;
  }
LABEL_136:
  v74 = [NSNumber numberWithInt:self->_gender];
  [v5 setObject:v74 forKey:@"gender"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x1000) == 0)
  {
LABEL_107:
    if ((*(_WORD *)&v58 & 0x2000) == 0) {
      goto LABEL_108;
    }
    goto LABEL_138;
  }
LABEL_137:
  *(float *)&double v4 = self->_genderConfidenceLevel;
  v75 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v75 forKey:@"gender_confidence_level"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x2000) == 0)
  {
LABEL_108:
    if ((*(_WORD *)&v58 & 0x4000) == 0) {
      goto LABEL_109;
    }
    goto LABEL_139;
  }
LABEL_138:
  v76 = [NSNumber numberWithInt:self->_incomeBracket];
  [v5 setObject:v76 forKey:@"income_bracket"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x4000) == 0)
  {
LABEL_109:
    if ((*(_WORD *)&v58 & 0x200) == 0) {
      goto LABEL_110;
    }
    goto LABEL_140;
  }
LABEL_139:
  *(float *)&double v4 = self->_incomeBracketConfidenceLevel;
  v77 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v77 forKey:@"income_bracket_confidence_level"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x200) == 0)
  {
LABEL_110:
    if ((*(_WORD *)&v58 & 0x400) == 0) {
      goto LABEL_111;
    }
    goto LABEL_141;
  }
LABEL_140:
  v78 = [NSNumber numberWithInt:self->_ethnicity];
  [v5 setObject:v78 forKey:@"ethnicity"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x400) == 0)
  {
LABEL_111:
    if ((*(unsigned char *)&v58 & 2) == 0) {
      goto LABEL_113;
    }
    goto LABEL_112;
  }
LABEL_141:
  *(float *)&double v4 = self->_ethnicityConfidenceLevel;
  v79 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v79 forKey:@"ethnicity_confidence_level"];

  if ((*(void *)&self->_has & 2) != 0)
  {
LABEL_112:
    v59 = [NSNumber numberWithLongLong:self->_appConfigTreatmentId];
    [v5 setObject:v59 forKey:@"app_config_treatment_id"];
  }
LABEL_113:
  clientName = self->_clientName;
  if (clientName) {
    [v5 setObject:clientName forKey:@"client_name"];
  }
  clientVersion = self->_clientVersion;
  if (clientVersion) {
    [v5 setObject:clientVersion forKey:@"client_version"];
  }
  browserLanguage = self->_browserLanguage;
  if (browserLanguage) {
    [v5 setObject:browserLanguage forKey:@"browser_language"];
  }
  notwUserId = self->_notwUserId;
  if (notwUserId) {
    [v5 setObject:notwUserId forKey:@"notw_user_id"];
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v64 = self->_has;
  if ((*(void *)&v64 & 0x8000000000) != 0)
  {
    v65 = [NSNumber numberWithBool:self->_privateDataEncrypted];
    [v5 setObject:v65 forKey:@"private_data_encrypted"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v64 = self->_has;
  }
  if ((*(void *)&v64 & 0x20000000000) != 0)
  {
    v66 = [NSNumber numberWithBool:self->_progressivePersonalizationAllowed];
    [v5 setObject:v66 forKey:@"progressive_personalization_allowed"];
  }
  watchSessionId = self->_watchSessionId;
  if (watchSessionId) {
    [v5 setObject:watchSessionId forKey:@"watch_session_id"];
  }
  sessionIdWatch = self->_sessionIdWatch;
  if (sessionIdWatch) {
    [v5 setObject:sessionIdWatch forKey:@"session_id_watch"];
  }
  widgetSessionId = self->_widgetSessionId;
  if (widgetSessionId) {
    [v5 setObject:widgetSessionId forKey:@"widget_session_id"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    uint64_t widgetDisplayMode = self->_widgetDisplayMode;
    if (widgetDisplayMode >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetDisplayMode);
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = off_26444B058[widgetDisplayMode];
    }
    [v5 setObject:v71 forKey:@"widget_display_mode"];
  }
  personalizationPortraitVariantName = self->_personalizationPortraitVariantName;
  if (personalizationPortraitVariantName) {
    [v5 setObject:personalizationPortraitVariantName forKey:@"personalization_portrait_variant_name"];
  }
  appProcessLifetimeId = self->_appProcessLifetimeId;
  if (appProcessLifetimeId) {
    [v5 setObject:appProcessLifetimeId forKey:@"app_process_lifetime_id"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v82 = [NSNumber numberWithLongLong:self->_testBucket];
    [v5 setObject:v82 forKey:@"test_bucket"];
  }
  widgetUserId = self->_widgetUserId;
  if (widgetUserId) {
    [v5 setObject:widgetUserId forKey:@"widget_user_id"];
  }
  productType = self->_productType;
  if (productType) {
    [v5 setObject:productType forKey:@"product_type"];
  }
  v85 = PBRepeatedInt64NSArray();
  [v5 setObject:v85 forKey:@"user_segmentation_treatment_ids"];

  v86 = PBRepeatedInt32NSArray();
  [v5 setObject:v86 forKey:@"user_segmentation_segment_set_ids"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x20000000) != 0)
  {
    v95 = [NSNumber numberWithBool:self->_iosSettingsNotificationsSoundEnabled];
    [v5 setObject:v95 forKey:@"ios_settings_notifications_sound_enabled"];

    $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
    if ((*(_DWORD *)&v87 & 0x1000000) == 0)
    {
LABEL_157:
      if ((*(_DWORD *)&v87 & 0x10000000) == 0) {
        goto LABEL_158;
      }
      goto LABEL_178;
    }
  }
  else if ((*(_DWORD *)&v87 & 0x1000000) == 0)
  {
    goto LABEL_157;
  }
  v96 = [NSNumber numberWithBool:self->_iosSettingsNotificationsBadgeAppIconEnabled];
  [v5 setObject:v96 forKey:@"ios_settings_notifications_badge_app_icon_enabled"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x10000000) == 0)
  {
LABEL_158:
    if ((*(_DWORD *)&v87 & 0x8000000) == 0) {
      goto LABEL_159;
    }
    goto LABEL_179;
  }
LABEL_178:
  v97 = [NSNumber numberWithBool:self->_iosSettingsNotificationsShowOnLockScreenEnabled];
  [v5 setObject:v97 forKey:@"ios_settings_notifications_show_on_lock_screen_enabled"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x8000000) == 0)
  {
LABEL_159:
    if ((*(_DWORD *)&v87 & 0x4000000) == 0) {
      goto LABEL_160;
    }
    goto LABEL_180;
  }
LABEL_179:
  v98 = [NSNumber numberWithBool:self->_iosSettingsNotificationsShowInHistoryEnabled];
  [v5 setObject:v98 forKey:@"ios_settings_notifications_show_in_history_enabled"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x4000000) == 0)
  {
LABEL_160:
    if ((*(_DWORD *)&v87 & 0x400000) == 0) {
      goto LABEL_161;
    }
    goto LABEL_181;
  }
LABEL_180:
  v99 = [NSNumber numberWithBool:self->_iosSettingsNotificationsShowAsBannersEnabled];
  [v5 setObject:v99 forKey:@"ios_settings_notifications_show_as_banners_enabled"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x400000) == 0)
  {
LABEL_161:
    if ((*(void *)&v87 & 0x80000000000) == 0) {
      goto LABEL_162;
    }
    goto LABEL_188;
  }
LABEL_181:
  uint64_t widgetDisplayModeSessionEnd = self->_widgetDisplayModeSessionEnd;
  if (widgetDisplayModeSessionEnd >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetDisplayModeSessionEnd);
    v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v101 = off_26444B058[widgetDisplayModeSessionEnd];
  }
  [v5 setObject:v101 forKey:@"widget_display_mode_session_end"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(void *)&v87 & 0x80000000000) == 0)
  {
LABEL_162:
    if ((*(void *)&v87 & 0x1000000000) == 0) {
      goto LABEL_163;
    }
    goto LABEL_189;
  }
LABEL_188:
  v104 = [NSNumber numberWithBool:self->_signedIntoITunes];
  [v5 setObject:v104 forKey:@"signed_into_iTunes"];

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87 = self->_has;
  if ((*(void *)&v87 & 0x1000000000) == 0)
  {
LABEL_163:
    if ((*(_DWORD *)&v87 & 0x40000000) == 0) {
      goto LABEL_165;
    }
    goto LABEL_164;
  }
LABEL_189:
  v105 = [NSNumber numberWithBool:self->_isStoreDemoModeEnabled];
  [v5 setObject:v105 forKey:@"is_store_demo_mode_enabled"];

  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_164:
    v88 = [NSNumber numberWithBool:self->_isDiagnosticsUsageEnabled];
    [v5 setObject:v88 forKey:@"is_diagnostics_usage_enabled"];
  }
LABEL_165:
  regionIds = self->_regionIds;
  if (regionIds) {
    [v5 setObject:regionIds forKey:@"region_ids"];
  }
  appBuildNumber = self->_appBuildNumber;
  if (appBuildNumber) {
    [v5 setObject:appBuildNumber forKey:@"app_build_number"];
  }
  amsPurchaseId = self->_amsPurchaseId;
  if (amsPurchaseId) {
    [v5 setObject:amsPurchaseId forKey:@"ams_purchase_id"];
  }
  amsCampaignId = self->_amsCampaignId;
  if (amsCampaignId) {
    [v5 setObject:amsCampaignId forKey:@"ams_campaign_id"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    uint64_t paywallConfigType = self->_paywallConfigType;
    if (paywallConfigType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paywallConfigType);
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v94 = off_26444B098[paywallConfigType];
    }
    [v5 setObject:v94 forKey:@"paywall_config_type"];
  }
  id v102 = v5;

  return v102;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_devicePlatform) {
    PBDataWriterWriteStringField();
  }
  if (self->_osVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_appVersion) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteInt64Field();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_countryCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_languageCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_carrier) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x80000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x80000) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_sessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_userId) {
    PBDataWriterWriteStringField();
  }
  if (self->_userStorefrontId) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v7 = self->_has;
    if ((*(unsigned char *)&v7 & 0x10) == 0)
    {
LABEL_31:
      if ((*(unsigned char *)&v7 & 4) == 0) {
        goto LABEL_32;
      }
      goto LABEL_143;
    }
  }
  else if ((*(unsigned char *)&v7 & 0x10) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt64Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7 = self->_has;
  if ((*(unsigned char *)&v7 & 4) == 0)
  {
LABEL_32:
    if ((*(void *)&v7 & 0x40000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt64Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7 = self->_has;
  if ((*(void *)&v7 & 0x40000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&v7 & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x200000000000) != 0) {
LABEL_34:
  }
    PBDataWriterWriteBOOLField();
LABEL_35:
  if (self->_previousAppVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousOsVersion) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x10000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
    if ((*(void *)&v9 & 0x10000000000) == 0)
    {
LABEL_47:
      if ((*(void *)&v9 & 0x100000000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_148;
    }
  }
  else if ((*(void *)&v9 & 0x10000000000) == 0)
  {
    goto LABEL_47;
  }
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
  if ((*(void *)&v9 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(void *)&v9 & 0x400000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) == 0)
  {
LABEL_49:
    if ((*(void *)&v9 & 0x200000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
  if ((*(void *)&v9 & 0x200000000) == 0)
  {
LABEL_50:
    if ((*(void *)&v9 & 0x800000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
  if ((*(void *)&v9 & 0x800000000) == 0)
  {
LABEL_51:
    if ((*(void *)&v9 & 0x4000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x4000000000) != 0) {
LABEL_52:
  }
    PBDataWriterWriteBOOLField();
LABEL_53:
  if (self->_originatingCampaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_originatingCampaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_originatingCreativeId) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x800000) == 0)
    {
LABEL_61:
      if ((*(void *)&v10 & 0x2000000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_155;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x800000) == 0)
  {
    goto LABEL_61;
  }
  PBDataWriterWriteInt32Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v10 = self->_has;
  if ((*(void *)&v10 & 0x2000000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v10 & 0x8000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_155:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x8000) != 0) {
LABEL_63:
  }
    PBDataWriterWriteInt32Field();
LABEL_64:
  if (self->_newsWidgetModeGroupId) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x40) == 0)
    {
LABEL_68:
      if ((*(_WORD *)&v11 & 0x800) == 0) {
        goto LABEL_69;
      }
      goto LABEL_159;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x40) == 0)
  {
    goto LABEL_68;
  }
  PBDataWriterWriteFloatField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_69:
    if ((*(_WORD *)&v11 & 0x1000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt32Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_70:
    if ((*(_WORD *)&v11 & 0x2000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteFloatField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v11 & 0x4000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt32Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v11 & 0x200) == 0) {
      goto LABEL_73;
    }
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteFloatField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_73:
    if ((*(_WORD *)&v11 & 0x400) == 0) {
      goto LABEL_74;
    }
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteInt32Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v11 & 2) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_164:
  PBDataWriterWriteFloatField();
  if ((*(void *)&self->_has & 2) != 0) {
LABEL_75:
  }
    PBDataWriterWriteInt64Field();
LABEL_76:
  if (self->_clientName) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_browserLanguage) {
    PBDataWriterWriteStringField();
  }
  if (self->_notwUserId) {
    PBDataWriterWriteStringField();
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v12 = self->_has;
  if ((*(void *)&v12 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v12 = self->_has;
  }
  if ((*(void *)&v12 & 0x20000000000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_watchSessionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionIdWatch) {
    PBDataWriterWriteDataField();
  }
  if (self->_widgetSessionId) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_personalizationPortraitVariantName) {
    PBDataWriterWriteStringField();
  }
  if (self->_appProcessLifetimeId) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_widgetUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_productType) {
    PBDataWriterWriteStringField();
  }
  if (self->_userSegmentationTreatmentIds.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v13;
    }
    while (v13 < self->_userSegmentationTreatmentIds.count);
  }
  if (self->_userSegmentationSegmentSetIds.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v14;
    }
    while (v14 < self->_userSegmentationSegmentSetIds.count);
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x1000000) == 0)
    {
LABEL_114:
      if ((*(_DWORD *)&v15 & 0x10000000) == 0) {
        goto LABEL_115;
      }
      goto LABEL_168;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
    goto LABEL_114;
  }
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_115:
    if ((*(_DWORD *)&v15 & 0x8000000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x8000000) == 0)
  {
LABEL_116:
    if ((*(_DWORD *)&v15 & 0x4000000) == 0) {
      goto LABEL_117;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x4000000) == 0)
  {
LABEL_117:
    if ((*(_DWORD *)&v15 & 0x400000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_118:
    if ((*(void *)&v15 & 0x80000000000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteInt32Field();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(void *)&v15 & 0x80000000000) == 0)
  {
LABEL_119:
    if ((*(void *)&v15 & 0x1000000000) == 0) {
      goto LABEL_120;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteBOOLField();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15 = self->_has;
  if ((*(void *)&v15 & 0x1000000000) == 0)
  {
LABEL_120:
    if ((*(_DWORD *)&v15 & 0x40000000) == 0) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
LABEL_173:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x40000000) != 0) {
LABEL_121:
  }
    PBDataWriterWriteBOOLField();
LABEL_122:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v16 = self->_regionIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v22;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v22 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v18);
  }

  if (self->_appBuildNumber) {
    PBDataWriterWriteStringField();
  }
  if (self->_amsPurchaseId) {
    PBDataWriterWriteStringField();
  }
  if (self->_amsCampaignId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceModel copyWithZone:a3];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v6;

  uint64_t v8 = [(NSString *)self->_devicePlatform copyWithZone:a3];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v8;

  uint64_t v10 = [(NSString *)self->_osVersion copyWithZone:a3];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11 = *(void **)(v5 + 312);
  *(void *)(v5 + 312) = v10;

  uint64_t v12 = [(NSString *)self->_appVersion copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v12;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 56) = self->_appBuild;
    *(void *)(v5 + 488) |= 1uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 416) = self->_utcOffset;
    *(void *)(v5 + 488) |= 0x100000uLL;
  }
  uint64_t v15 = [(NSString *)self->_countryCode copyWithZone:a3];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v16 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v15;

  uint64_t v17 = [(NSString *)self->_languageCode copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v17;

  uint64_t v19 = [(NSString *)self->_carrier copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v19;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_reachabilityStatus;
    *(void *)(v5 + 488) |= 0x40000uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x100) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v21 & 0x80000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&v21 & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 176) = self->_cellularRadioAccessTechnology;
  *(void *)(v5 + 488) |= 0x100uLL;
  if ((*(void *)&self->_has & 0x80000) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 392) = self->_textSize;
    *(void *)(v5 + 488) |= 0x80000uLL;
  }
LABEL_9:
  uint64_t v22 = [(NSData *)self->_sessionId copyWithZone:a3];
  long long v23 = *(void **)(v5 + 376);
  *(void *)(v5 + 376) = v22;

  uint64_t v24 = [(NSString *)self->_userId copyWithZone:a3];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v25 = *(void **)(v5 + 400);
  *(void *)(v5 + 400) = v24;

  uint64_t v26 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  v27 = *(void **)(v5 + 408);
  *(void *)(v5 + 408) = v26;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 471) = self->_isNewUser;
    *(void *)(v5 + 488) |= 0x80000000uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v28 = self->_has;
    if ((*(unsigned char *)&v28 & 0x10) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&v28 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_75;
    }
  }
  else if ((*(unsigned char *)&v28 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(void *)(v5 + 88) = self->_userStartDate;
  *(void *)(v5 + 488) |= 0x10uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v28 = self->_has;
  if ((*(unsigned char *)&v28 & 4) == 0)
  {
LABEL_12:
    if ((*(void *)&v28 & 0x40000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(void *)(v5 + 72) = self->_lastAppOpenDate;
  *(void *)(v5 + 488) |= 4uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v28 = self->_has;
  if ((*(void *)&v28 & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(void *)&v28 & 0x200000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_76:
  *(unsigned char *)(v5 + 482) = self->_runningObsolete;
  *(void *)(v5 + 488) |= 0x40000000000uLL;
  if ((*(void *)&self->_has & 0x200000000000) != 0)
  {
LABEL_14:
    *(unsigned char *)(v5 + 485) = self->_upgradedFromObsolete;
    *(void *)(v5 + 488) |= 0x200000000000uLL;
  }
LABEL_15:
  uint64_t v29 = [(NSString *)self->_previousAppVersion copyWithZone:a3];
  v30 = *(void **)(v5 + 336);
  *(void *)(v5 + 336) = v29;

  uint64_t v31 = [(NSString *)self->_previousOsVersion copyWithZone:a3];
  v32 = *(void **)(v5 + 344);
  *(void *)(v5 + 344) = v31;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v33 = self->_has;
  if ((*(void *)&v33 & 0x100000000000) != 0)
  {
    *(unsigned char *)(v5 + 484) = self->_signedIntoIcloud;
    *(void *)(v5 + 488) |= 0x100000000000uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v33 = self->_has;
  }
  if ((*(_DWORD *)&v33 & 0x10000) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_osInstallVariant;
    *(void *)(v5 + 488) |= 0x10000uLL;
  }
  uint64_t v34 = [(NSString *)self->_campaignId copyWithZone:a3];
  v35 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v34;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(unsigned char *)&v36 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_campaignType;
    *(void *)(v5 + 488) |= 0x80uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
    if ((*(void *)&v36 & 0x10000000000) == 0)
    {
LABEL_21:
      if ((*(void *)&v36 & 0x100000000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_80;
    }
  }
  else if ((*(void *)&v36 & 0x10000000000) == 0)
  {
    goto LABEL_21;
  }
  *(unsigned char *)(v5 + 480) = self->_privateDataSyncOn;
  *(void *)(v5 + 488) |= 0x10000000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x100000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v36 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(unsigned char *)(v5 + 472) = self->_isPaidSubscriber;
  *(void *)(v5 + 488) |= 0x100000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v36 & 0x200000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(unsigned char *)(v5 + 474) = self->_isPaidSubscriberFromNews;
  *(void *)(v5 + 488) |= 0x400000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x200000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v36 & 0x800000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(unsigned char *)(v5 + 473) = self->_isPaidSubscriberFromAppStore;
  *(void *)(v5 + 488) |= 0x200000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36 = self->_has;
  if ((*(void *)&v36 & 0x800000000) == 0)
  {
LABEL_25:
    if ((*(void *)&v36 & 0x4000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_83:
  *(unsigned char *)(v5 + 475) = self->_isPaidSubscriberFromThirdParty;
  *(void *)(v5 + 488) |= 0x800000000uLL;
  if ((*(void *)&self->_has & 0x4000000000) != 0)
  {
LABEL_26:
    *(unsigned char *)(v5 + 478) = self->_notificationsEnabled;
    *(void *)(v5 + 488) |= 0x4000000000uLL;
  }
LABEL_27:
  uint64_t v37 = [(NSString *)self->_originatingCampaignId copyWithZone:a3];
  v38 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v37;

  uint64_t v39 = [(NSString *)self->_originatingCampaignType copyWithZone:a3];
  v40 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v39;

  uint64_t v41 = [(NSString *)self->_originatingCreativeId copyWithZone:a3];
  v42 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v41;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x2000000) != 0)
  {
    *(unsigned char *)(v5 + 465) = self->_iosSettingsNotificationsEnabled;
    *(void *)(v5 + 488) |= 0x2000000uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v43 = self->_has;
    if ((*(_DWORD *)&v43 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(void *)&v43 & 0x2000000000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_DWORD *)&v43 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(v5 + 440) = self->_widgetModeType;
  *(void *)(v5 + 488) |= 0x800000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v43 = self->_has;
  if ((*(void *)&v43 & 0x2000000000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v43 & 0x8000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_87:
  *(unsigned char *)(v5 + 477) = self->_locationPermissionGranted;
  *(void *)(v5 + 488) |= 0x2000000000uLL;
  if ((*(void *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    *(_DWORD *)(v5 + 256) = self->_newsWidgetModeGroup;
    *(void *)(v5 + 488) |= 0x8000uLL;
  }
LABEL_32:
  uint64_t v44 = [(NSString *)self->_newsWidgetModeGroupId copyWithZone:a3];
  v45 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v44;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(unsigned char *)&v46 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_ageBracket;
    *(void *)(v5 + 488) |= 0x20uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
    if ((*(unsigned char *)&v46 & 0x40) == 0)
    {
LABEL_34:
      if ((*(_WORD *)&v46 & 0x800) == 0) {
        goto LABEL_35;
      }
      goto LABEL_91;
    }
  }
  else if ((*(unsigned char *)&v46 & 0x40) == 0)
  {
    goto LABEL_34;
  }
  *(float *)(v5 + 100) = self->_ageBracketConfidenceLevel;
  *(void *)(v5 + 488) |= 0x40uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v46 & 0x1000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 232) = self->_gender;
  *(void *)(v5 + 488) |= 0x800uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x1000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v46 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(float *)(v5 + 236) = self->_genderConfidenceLevel;
  *(void *)(v5 + 488) |= 0x1000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x2000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v46 & 0x4000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v5 + 240) = self->_incomeBracket;
  *(void *)(v5 + 488) |= 0x2000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x4000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v46 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(float *)(v5 + 244) = self->_incomeBracketConfidenceLevel;
  *(void *)(v5 + 488) |= 0x4000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v46 & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v5 + 224) = self->_ethnicity;
  *(void *)(v5 + 488) |= 0x200uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x400) == 0)
  {
LABEL_40:
    if ((*(unsigned char *)&v46 & 2) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_96:
  *(float *)(v5 + 228) = self->_ethnicityConfidenceLevel;
  *(void *)(v5 + 488) |= 0x400uLL;
  if ((*(void *)&self->_has & 2) != 0)
  {
LABEL_41:
    *(void *)(v5 + 64) = self->_appConfigTreatmentId;
    *(void *)(v5 + 488) |= 2uLL;
  }
LABEL_42:
  uint64_t v47 = [(NSString *)self->_clientName copyWithZone:a3];
  v48 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v47;

  uint64_t v49 = [(NSString *)self->_clientVersion copyWithZone:a3];
  v50 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v49;

  uint64_t v51 = [(NSString *)self->_browserLanguage copyWithZone:a3];
  v52 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v51;

  uint64_t v53 = [(NSString *)self->_notwUserId copyWithZone:a3];
  v54 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v53;

  $D75F02CFEA0A7AA1FE16F60BA2FB852A v55 = self->_has;
  if ((*(void *)&v55 & 0x8000000000) != 0)
  {
    *(unsigned char *)(v5 + 479) = self->_privateDataEncrypted;
    *(void *)(v5 + 488) |= 0x8000000000uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v55 = self->_has;
  }
  if ((*(void *)&v55 & 0x20000000000) != 0)
  {
    *(unsigned char *)(v5 + 481) = self->_progressivePersonalizationAllowed;
    *(void *)(v5 + 488) |= 0x20000000000uLL;
  }
  uint64_t v56 = [(NSString *)self->_watchSessionId copyWithZone:a3];
  v57 = *(void **)(v5 + 424);
  *(void *)(v5 + 424) = v56;

  uint64_t v58 = [(NSData *)self->_sessionIdWatch copyWithZone:a3];
  v59 = *(void **)(v5 + 384);
  *(void *)(v5 + 384) = v58;

  uint64_t v60 = [(NSData *)self->_widgetSessionId copyWithZone:a3];
  v61 = *(void **)(v5 + 448);
  *(void *)(v5 + 448) = v60;

  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 432) = self->_widgetDisplayMode;
    *(void *)(v5 + 488) |= 0x200000uLL;
  }
  uint64_t v62 = [(NSString *)self->_personalizationPortraitVariantName copyWithZone:a3];
  v63 = *(void **)(v5 + 328);
  *(void *)(v5 + 328) = v62;

  uint64_t v64 = [(NSData *)self->_appProcessLifetimeId copyWithZone:a3];
  v65 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v64;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(void *)(v5 + 80) = self->_testBucket;
    *(void *)(v5 + 488) |= 8uLL;
  }
  uint64_t v66 = [(NSString *)self->_widgetUserId copyWithZone:a3];
  v67 = *(void **)(v5 + 456);
  *(void *)(v5 + 456) = v66;

  uint64_t v68 = [(NSString *)self->_productType copyWithZone:a3];
  v69 = *(void **)(v5 + 352);
  *(void *)(v5 + 352) = v68;

  PBRepeatedInt64Copy();
  PBRepeatedInt32Copy();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x20000000) != 0)
  {
    *(unsigned char *)(v5 + 469) = self->_iosSettingsNotificationsSoundEnabled;
    *(void *)(v5 + 488) |= 0x20000000uLL;
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
    if ((*(_DWORD *)&v70 & 0x1000000) == 0)
    {
LABEL_52:
      if ((*(_DWORD *)&v70 & 0x10000000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v70 & 0x1000000) == 0)
  {
    goto LABEL_52;
  }
  *(unsigned char *)(v5 + 464) = self->_iosSettingsNotificationsBadgeAppIconEnabled;
  *(void *)(v5 + 488) |= 0x1000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x10000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v70 & 0x8000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(unsigned char *)(v5 + 468) = self->_iosSettingsNotificationsShowOnLockScreenEnabled;
  *(void *)(v5 + 488) |= 0x10000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x8000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v70 & 0x4000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(unsigned char *)(v5 + 467) = self->_iosSettingsNotificationsShowInHistoryEnabled;
  *(void *)(v5 + 488) |= 0x8000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x4000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v70 & 0x400000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(unsigned char *)(v5 + 466) = self->_iosSettingsNotificationsShowAsBannersEnabled;
  *(void *)(v5 + 488) |= 0x4000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x400000) == 0)
  {
LABEL_56:
    if ((*(void *)&v70 & 0x80000000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_104;
  }
LABEL_103:
  *(_DWORD *)(v5 + 436) = self->_widgetDisplayModeSessionEnd;
  *(void *)(v5 + 488) |= 0x400000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(void *)&v70 & 0x80000000000) == 0)
  {
LABEL_57:
    if ((*(void *)&v70 & 0x1000000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_105;
  }
LABEL_104:
  *(unsigned char *)(v5 + 483) = self->_signedIntoITunes;
  *(void *)(v5 + 488) |= 0x80000000000uLL;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70 = self->_has;
  if ((*(void *)&v70 & 0x1000000000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v70 & 0x40000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_105:
  *(unsigned char *)(v5 + 476) = self->_isStoreDemoModeEnabled;
  *(void *)(v5 + 488) |= 0x1000000000uLL;
  if ((*(void *)&self->_has & 0x40000000) != 0)
  {
LABEL_59:
    *(unsigned char *)(v5 + 470) = self->_isDiagnosticsUsageEnabled;
    *(void *)(v5 + 488) |= 0x40000000uLL;
  }
LABEL_60:
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v71 = self->_regionIds;
  uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v85 objects:v89 count:16];
  if (v72)
  {
    uint64_t v73 = v72;
    uint64_t v74 = *(void *)v86;
    do
    {
      uint64_t v75 = 0;
      do
      {
        if (*(void *)v86 != v74) {
          objc_enumerationMutation(v71);
        }
        v76 = objc_msgSend(*(id *)(*((void *)&v85 + 1) + 8 * v75), "copyWithZone:", a3, (void)v85);
        [(id)v5 addRegionIds:v76];

        ++v75;
      }
      while (v73 != v75);
      uint64_t v73 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v85 objects:v89 count:16];
    }
    while (v73);
  }

  uint64_t v77 = [(NSString *)self->_appBuildNumber copyWithZone:a3];
  v78 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v77;

  uint64_t v79 = [(NSString *)self->_amsPurchaseId copyWithZone:a3];
  v80 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v79;

  uint64_t v81 = [(NSString *)self->_amsCampaignId copyWithZone:a3];
  v82 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v81;

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_paywallConfigType;
    *(void *)(v5 + 488) |= 0x20000uLL;
  }
  id v83 = (id)v5;

  return v83;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_366;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_366;
    }
  }
  devicePlatform = self->_devicePlatform;
  if ((unint64_t)devicePlatform | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](devicePlatform, "isEqual:")) {
      goto LABEL_366;
    }
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:")) {
      goto LABEL_366;
    }
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:")) {
      goto LABEL_366;
    }
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  uint64_t v10 = *((void *)v4 + 61);
  if (*(unsigned char *)&has)
  {
    if ((v10 & 1) == 0 || self->_appBuild != *((void *)v4 + 7)) {
      goto LABEL_366;
    }
  }
  else if (v10)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_utcOffset != *((_DWORD *)v4 + 104)) {
      goto LABEL_366;
    }
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_366;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 25)
    && !-[NSString isEqual:](countryCode, "isEqual:"))
  {
    goto LABEL_366;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:")) {
      goto LABEL_366;
    }
  }
  carrier = self->_carrier;
  if ((unint64_t)carrier | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](carrier, "isEqual:")) {
      goto LABEL_366;
    }
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v14 = self->_has;
  uint64_t v15 = *((void *)v4 + 61);
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_reachabilityStatus != *((_DWORD *)v4 + 90)) {
      goto LABEL_366;
    }
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)v4 + 44)) {
      goto LABEL_366;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_textSize != *((_DWORD *)v4 + 98)) {
      goto LABEL_366;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_366;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 47) && !-[NSData isEqual:](sessionId, "isEqual:")) {
    goto LABEL_366;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 50))
  {
    if (!-[NSString isEqual:](userId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((void *)v4 + 51))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v19 = self->_has;
  uint64_t v20 = *((void *)v4 + 61);
  if ((*(_DWORD *)&v19 & 0x80000000) != 0)
  {
    if ((v20 & 0x80000000) == 0) {
      goto LABEL_366;
    }
    if (self->_isNewUser)
    {
      if (!*((unsigned char *)v4 + 471)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 471))
    {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x80000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(unsigned char *)&v19 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0 || self->_userStartDate != *((void *)v4 + 11)) {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_366;
  }
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_lastAppOpenDate != *((void *)v4 + 9)) {
      goto LABEL_366;
    }
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v19 & 0x40000000000) != 0)
  {
    if ((v20 & 0x40000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_runningObsolete)
    {
      if (!*((unsigned char *)v4 + 482)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 482))
    {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x40000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v19 & 0x200000000000) != 0)
  {
    if ((v20 & 0x200000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_upgradedFromObsolete)
    {
      if (!*((unsigned char *)v4 + 485)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 485))
    {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x200000000000) != 0)
  {
    goto LABEL_366;
  }
  previousAppVersion = self->_previousAppVersion;
  if ((unint64_t)previousAppVersion | *((void *)v4 + 42)
    && !-[NSString isEqual:](previousAppVersion, "isEqual:"))
  {
    goto LABEL_366;
  }
  previousOsVersion = self->_previousOsVersion;
  if ((unint64_t)previousOsVersion | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](previousOsVersion, "isEqual:")) {
      goto LABEL_366;
    }
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v23 = self->_has;
  uint64_t v24 = *((void *)v4 + 61);
  if ((*(void *)&v23 & 0x100000000000) != 0)
  {
    if ((v24 & 0x100000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_signedIntoIcloud)
    {
      if (!*((unsigned char *)v4 + 484)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 484))
    {
      goto LABEL_366;
    }
  }
  else if ((v24 & 0x100000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v23 & 0x10000) != 0)
  {
    if ((v24 & 0x10000) == 0 || self->_osInstallVariant != *((_DWORD *)v4 + 76)) {
      goto LABEL_366;
    }
  }
  else if ((v24 & 0x10000) != 0)
  {
    goto LABEL_366;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_366;
    }
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v23 = self->_has;
  }
  uint64_t v26 = *((void *)v4 + 61);
  if ((*(unsigned char *)&v23 & 0x80) != 0)
  {
    if ((v26 & 0x80) == 0 || self->_campaignType != *((_DWORD *)v4 + 40)) {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x80) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v23 & 0x10000000000) != 0)
  {
    if ((v26 & 0x10000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_privateDataSyncOn)
    {
      if (!*((unsigned char *)v4 + 480)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 480))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x10000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v23 & 0x100000000) != 0)
  {
    if ((v26 & 0x100000000) == 0) {
      goto LABEL_366;
    }
    if (self->_isPaidSubscriber)
    {
      if (!*((unsigned char *)v4 + 472)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 472))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x100000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v23 & 0x400000000) != 0)
  {
    if ((v26 & 0x400000000) == 0) {
      goto LABEL_366;
    }
    if (self->_isPaidSubscriberFromNews)
    {
      if (!*((unsigned char *)v4 + 474)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 474))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x400000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v23 & 0x200000000) != 0)
  {
    if ((v26 & 0x200000000) == 0) {
      goto LABEL_366;
    }
    if (self->_isPaidSubscriberFromAppStore)
    {
      if (!*((unsigned char *)v4 + 473)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 473))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x200000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v23 & 0x800000000) != 0)
  {
    if ((v26 & 0x800000000) == 0) {
      goto LABEL_366;
    }
    if (self->_isPaidSubscriberFromThirdParty)
    {
      if (!*((unsigned char *)v4 + 475)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 475))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x800000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v23 & 0x4000000000) != 0)
  {
    if ((v26 & 0x4000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_notificationsEnabled)
    {
      if (!*((unsigned char *)v4 + 478)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 478))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x4000000000) != 0)
  {
    goto LABEL_366;
  }
  originatingCampaignId = self->_originatingCampaignId;
  if ((unint64_t)originatingCampaignId | *((void *)v4 + 35)
    && !-[NSString isEqual:](originatingCampaignId, "isEqual:"))
  {
    goto LABEL_366;
  }
  originatingCampaignType = self->_originatingCampaignType;
  if ((unint64_t)originatingCampaignType | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](originatingCampaignType, "isEqual:")) {
      goto LABEL_366;
    }
  }
  originatingCreativeId = self->_originatingCreativeId;
  if ((unint64_t)originatingCreativeId | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](originatingCreativeId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v30 = self->_has;
  uint64_t v31 = *((void *)v4 + 61);
  if ((*(_DWORD *)&v30 & 0x2000000) != 0)
  {
    if ((v31 & 0x2000000) == 0) {
      goto LABEL_366;
    }
    if (self->_iosSettingsNotificationsEnabled)
    {
      if (!*((unsigned char *)v4 + 465)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 465))
    {
      goto LABEL_366;
    }
  }
  else if ((v31 & 0x2000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
  {
    if ((v31 & 0x800000) == 0 || self->_widgetModeType != *((_DWORD *)v4 + 110)) {
      goto LABEL_366;
    }
  }
  else if ((v31 & 0x800000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v30 & 0x2000000000) != 0)
  {
    if ((v31 & 0x2000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_locationPermissionGranted)
    {
      if (!*((unsigned char *)v4 + 477)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 477))
    {
      goto LABEL_366;
    }
  }
  else if ((v31 & 0x2000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x8000) != 0)
  {
    if ((v31 & 0x8000) == 0 || self->_newsWidgetModeGroup != *((_DWORD *)v4 + 64)) {
      goto LABEL_366;
    }
  }
  else if ((v31 & 0x8000) != 0)
  {
    goto LABEL_366;
  }
  newsWidgetModeGroupId = self->_newsWidgetModeGroupId;
  if ((unint64_t)newsWidgetModeGroupId | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](newsWidgetModeGroupId, "isEqual:")) {
      goto LABEL_366;
    }
    $D75F02CFEA0A7AA1FE16F60BA2FB852A v30 = self->_has;
  }
  uint64_t v33 = *((void *)v4 + 61);
  if ((*(unsigned char *)&v30 & 0x20) != 0)
  {
    if ((v33 & 0x20) == 0 || self->_ageBracket != *((_DWORD *)v4 + 24)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x20) != 0)
  {
    goto LABEL_366;
  }
  if ((*(unsigned char *)&v30 & 0x40) != 0)
  {
    if ((v33 & 0x40) == 0 || self->_ageBracketConfidenceLevel != *((float *)v4 + 25)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x40) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x800) != 0)
  {
    if ((v33 & 0x800) == 0 || self->_gender != *((_DWORD *)v4 + 58)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x800) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x1000) != 0)
  {
    if ((v33 & 0x1000) == 0 || self->_genderConfidenceLevel != *((float *)v4 + 59)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x1000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x2000) != 0)
  {
    if ((v33 & 0x2000) == 0 || self->_incomeBracket != *((_DWORD *)v4 + 60)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x2000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x4000) != 0)
  {
    if ((v33 & 0x4000) == 0 || self->_incomeBracketConfidenceLevel != *((float *)v4 + 61)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x4000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x200) != 0)
  {
    if ((v33 & 0x200) == 0 || self->_ethnicity != *((_DWORD *)v4 + 56)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x200) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x400) != 0)
  {
    if ((v33 & 0x400) == 0 || self->_ethnicityConfidenceLevel != *((float *)v4 + 57)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 0x400) != 0)
  {
    goto LABEL_366;
  }
  if ((*(unsigned char *)&v30 & 2) != 0)
  {
    if ((v33 & 2) == 0 || self->_appConfigTreatmentId != *((void *)v4 + 8)) {
      goto LABEL_366;
    }
  }
  else if ((v33 & 2) != 0)
  {
    goto LABEL_366;
  }
  clientName = self->_clientName;
  if ((unint64_t)clientName | *((void *)v4 + 23)
    && !-[NSString isEqual:](clientName, "isEqual:"))
  {
    goto LABEL_366;
  }
  clientVersion = self->_clientVersion;
  if ((unint64_t)clientVersion | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](clientVersion, "isEqual:")) {
      goto LABEL_366;
    }
  }
  browserLanguage = self->_browserLanguage;
  if ((unint64_t)browserLanguage | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](browserLanguage, "isEqual:")) {
      goto LABEL_366;
    }
  }
  notwUserId = self->_notwUserId;
  if ((unint64_t)notwUserId | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](notwUserId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v38 = self->_has;
  uint64_t v39 = *((void *)v4 + 61);
  if ((*(void *)&v38 & 0x8000000000) != 0)
  {
    if ((v39 & 0x8000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_privateDataEncrypted)
    {
      if (!*((unsigned char *)v4 + 479)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 479))
    {
      goto LABEL_366;
    }
  }
  else if ((v39 & 0x8000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v38 & 0x20000000000) != 0)
  {
    if ((v39 & 0x20000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_progressivePersonalizationAllowed)
    {
      if (!*((unsigned char *)v4 + 481)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 481))
    {
      goto LABEL_366;
    }
  }
  else if ((v39 & 0x20000000000) != 0)
  {
    goto LABEL_366;
  }
  watchSessionId = self->_watchSessionId;
  if ((unint64_t)watchSessionId | *((void *)v4 + 53)
    && !-[NSString isEqual:](watchSessionId, "isEqual:"))
  {
    goto LABEL_366;
  }
  sessionIdWatch = self->_sessionIdWatch;
  if ((unint64_t)sessionIdWatch | *((void *)v4 + 48))
  {
    if (!-[NSData isEqual:](sessionIdWatch, "isEqual:")) {
      goto LABEL_366;
    }
  }
  widgetSessionId = self->_widgetSessionId;
  if ((unint64_t)widgetSessionId | *((void *)v4 + 56))
  {
    if (!-[NSData isEqual:](widgetSessionId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  uint64_t v43 = *((void *)v4 + 61);
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0)
  {
    if ((v43 & 0x200000) == 0 || self->_widgetDisplayMode != *((_DWORD *)v4 + 108)) {
      goto LABEL_366;
    }
  }
  else if ((v43 & 0x200000) != 0)
  {
    goto LABEL_366;
  }
  personalizationPortraitVariantName = self->_personalizationPortraitVariantName;
  if ((unint64_t)personalizationPortraitVariantName | *((void *)v4 + 41)
    && !-[NSString isEqual:](personalizationPortraitVariantName, "isEqual:"))
  {
    goto LABEL_366;
  }
  appProcessLifetimeId = self->_appProcessLifetimeId;
  if ((unint64_t)appProcessLifetimeId | *((void *)v4 + 16))
  {
    if (!-[NSData isEqual:](appProcessLifetimeId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  uint64_t v46 = *((void *)v4 + 61);
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v46 & 8) == 0 || self->_testBucket != *((void *)v4 + 10)) {
      goto LABEL_366;
    }
  }
  else if ((v46 & 8) != 0)
  {
    goto LABEL_366;
  }
  widgetUserId = self->_widgetUserId;
  if ((unint64_t)widgetUserId | *((void *)v4 + 57)
    && !-[NSString isEqual:](widgetUserId, "isEqual:"))
  {
    goto LABEL_366;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_366;
    }
  }
  if (!PBRepeatedInt64IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_366;
  }
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v49 = self->_has;
  uint64_t v50 = *((void *)v4 + 61);
  if ((*(_DWORD *)&v49 & 0x20000000) != 0)
  {
    if ((v50 & 0x20000000) == 0) {
      goto LABEL_366;
    }
    if (self->_iosSettingsNotificationsSoundEnabled)
    {
      if (!*((unsigned char *)v4 + 469)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 469))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x20000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x1000000) != 0)
  {
    if ((v50 & 0x1000000) == 0) {
      goto LABEL_366;
    }
    if (self->_iosSettingsNotificationsBadgeAppIconEnabled)
    {
      if (!*((unsigned char *)v4 + 464)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 464))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x1000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x10000000) != 0)
  {
    if ((v50 & 0x10000000) == 0) {
      goto LABEL_366;
    }
    if (self->_iosSettingsNotificationsShowOnLockScreenEnabled)
    {
      if (!*((unsigned char *)v4 + 468)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 468))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x10000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x8000000) != 0)
  {
    if ((v50 & 0x8000000) == 0) {
      goto LABEL_366;
    }
    if (self->_iosSettingsNotificationsShowInHistoryEnabled)
    {
      if (!*((unsigned char *)v4 + 467)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 467))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x8000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x4000000) != 0)
  {
    if ((v50 & 0x4000000) == 0) {
      goto LABEL_366;
    }
    if (self->_iosSettingsNotificationsShowAsBannersEnabled)
    {
      if (!*((unsigned char *)v4 + 466)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 466))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x4000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x400000) != 0)
  {
    if ((v50 & 0x400000) == 0 || self->_widgetDisplayModeSessionEnd != *((_DWORD *)v4 + 109)) {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x400000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v49 & 0x80000000000) != 0)
  {
    if ((v50 & 0x80000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_signedIntoITunes)
    {
      if (!*((unsigned char *)v4 + 483)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 483))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x80000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(void *)&v49 & 0x1000000000) != 0)
  {
    if ((v50 & 0x1000000000) == 0) {
      goto LABEL_366;
    }
    if (self->_isStoreDemoModeEnabled)
    {
      if (!*((unsigned char *)v4 + 476)) {
        goto LABEL_366;
      }
    }
    else if (*((unsigned char *)v4 + 476))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x1000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x40000000) == 0)
  {
    if ((v50 & 0x40000000) == 0) {
      goto LABEL_353;
    }
LABEL_366:
    BOOL v56 = 0;
    goto LABEL_367;
  }
  if ((v50 & 0x40000000) == 0) {
    goto LABEL_366;
  }
  if (!self->_isDiagnosticsUsageEnabled)
  {
    if (!*((unsigned char *)v4 + 470)) {
      goto LABEL_353;
    }
    goto LABEL_366;
  }
  if (!*((unsigned char *)v4 + 470)) {
    goto LABEL_366;
  }
LABEL_353:
  regionIds = self->_regionIds;
  if ((unint64_t)regionIds | *((void *)v4 + 46)
    && !-[NSMutableArray isEqual:](regionIds, "isEqual:"))
  {
    goto LABEL_366;
  }
  appBuildNumber = self->_appBuildNumber;
  if ((unint64_t)appBuildNumber | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](appBuildNumber, "isEqual:")) {
      goto LABEL_366;
    }
  }
  amsPurchaseId = self->_amsPurchaseId;
  if ((unint64_t)amsPurchaseId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](amsPurchaseId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  amsCampaignId = self->_amsCampaignId;
  if ((unint64_t)amsCampaignId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](amsCampaignId, "isEqual:")) {
      goto LABEL_366;
    }
  }
  uint64_t v55 = *((void *)v4 + 61);
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    if ((v55 & 0x20000) == 0 || self->_paywallConfigType != *((_DWORD *)v4 + 80)) {
      goto LABEL_366;
    }
    BOOL v56 = 1;
  }
  else
  {
    BOOL v56 = (v55 & 0x20000) == 0;
  }
LABEL_367:

  return v56;
}

- (unint64_t)hash
{
  NSUInteger v110 = [(NSString *)self->_deviceModel hash];
  NSUInteger v109 = [(NSString *)self->_devicePlatform hash];
  NSUInteger v108 = [(NSString *)self->_osVersion hash];
  NSUInteger v107 = [(NSString *)self->_appVersion hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has = self->_has;
  if (*(unsigned char *)&has)
  {
    uint64_t v106 = 2654435761 * self->_appBuild;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v106 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
LABEL_3:
      uint64_t v105 = 2654435761 * self->_utcOffset;
      goto LABEL_6;
    }
  }
  uint64_t v105 = 0;
LABEL_6:
  NSUInteger v104 = [(NSString *)self->_countryCode hash];
  NSUInteger v103 = [(NSString *)self->_languageCode hash];
  NSUInteger v102 = [(NSString *)self->_carrier hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) == 0)
  {
    uint64_t v101 = 0;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v100 = 0;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v101 = 2654435761 * self->_reachabilityStatus;
  if ((*(_WORD *)&v4 & 0x100) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v100 = 2654435761 * self->_cellularRadioAccessTechnology;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_9:
    uint64_t v99 = 2654435761 * self->_textSize;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v99 = 0;
LABEL_13:
  uint64_t v98 = [(NSData *)self->_sessionId hash];
  NSUInteger v97 = [(NSString *)self->_userId hash];
  NSUInteger v96 = [(NSString *)self->_userStorefrontId hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) != 0)
  {
    uint64_t v95 = 2654435761 * self->_isNewUser;
    if ((*(unsigned char *)&v5 & 0x10) != 0)
    {
LABEL_15:
      uint64_t v94 = 2654435761 * self->_userStartDate;
      if ((*(unsigned char *)&v5 & 4) != 0) {
        goto LABEL_16;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v95 = 0;
    if ((*(unsigned char *)&v5 & 0x10) != 0) {
      goto LABEL_15;
    }
  }
  uint64_t v94 = 0;
  if ((*(unsigned char *)&v5 & 4) != 0)
  {
LABEL_16:
    uint64_t v93 = 2654435761 * self->_lastAppOpenDate;
    if ((*(void *)&v5 & 0x40000000000) != 0) {
      goto LABEL_17;
    }
LABEL_22:
    uint64_t v92 = 0;
    if ((*(void *)&v5 & 0x200000000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v93 = 0;
  if ((*(void *)&v5 & 0x40000000000) == 0) {
    goto LABEL_22;
  }
LABEL_17:
  uint64_t v92 = 2654435761 * self->_runningObsolete;
  if ((*(void *)&v5 & 0x200000000000) != 0)
  {
LABEL_18:
    uint64_t v91 = 2654435761 * self->_upgradedFromObsolete;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v91 = 0;
LABEL_24:
  NSUInteger v90 = [(NSString *)self->_previousAppVersion hash];
  NSUInteger v89 = [(NSString *)self->_previousOsVersion hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000000) != 0)
  {
    uint64_t v88 = 2654435761 * self->_signedIntoIcloud;
    if ((*(_DWORD *)&v6 & 0x10000) != 0) {
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v88 = 0;
    if ((*(_DWORD *)&v6 & 0x10000) != 0)
    {
LABEL_26:
      uint64_t v87 = 2654435761 * self->_osInstallVariant;
      goto LABEL_29;
    }
  }
  uint64_t v87 = 0;
LABEL_29:
  NSUInteger v86 = [(NSString *)self->_campaignId hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) != 0)
  {
    uint64_t v85 = 2654435761 * self->_campaignType;
    if ((*(void *)&v7 & 0x10000000000) != 0)
    {
LABEL_31:
      uint64_t v84 = 2654435761 * self->_privateDataSyncOn;
      if ((*(void *)&v7 & 0x100000000) != 0) {
        goto LABEL_32;
      }
      goto LABEL_39;
    }
  }
  else
  {
    uint64_t v85 = 0;
    if ((*(void *)&v7 & 0x10000000000) != 0) {
      goto LABEL_31;
    }
  }
  uint64_t v84 = 0;
  if ((*(void *)&v7 & 0x100000000) != 0)
  {
LABEL_32:
    uint64_t v83 = 2654435761 * self->_isPaidSubscriber;
    if ((*(void *)&v7 & 0x400000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v83 = 0;
  if ((*(void *)&v7 & 0x400000000) != 0)
  {
LABEL_33:
    uint64_t v82 = 2654435761 * self->_isPaidSubscriberFromNews;
    if ((*(void *)&v7 & 0x200000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v82 = 0;
  if ((*(void *)&v7 & 0x200000000) != 0)
  {
LABEL_34:
    uint64_t v81 = 2654435761 * self->_isPaidSubscriberFromAppStore;
    if ((*(void *)&v7 & 0x800000000) != 0) {
      goto LABEL_35;
    }
LABEL_42:
    uint64_t v80 = 0;
    if ((*(void *)&v7 & 0x4000000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_43;
  }
LABEL_41:
  uint64_t v81 = 0;
  if ((*(void *)&v7 & 0x800000000) == 0) {
    goto LABEL_42;
  }
LABEL_35:
  uint64_t v80 = 2654435761 * self->_isPaidSubscriberFromThirdParty;
  if ((*(void *)&v7 & 0x4000000000) != 0)
  {
LABEL_36:
    uint64_t v79 = 2654435761 * self->_notificationsEnabled;
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v79 = 0;
LABEL_44:
  NSUInteger v78 = [(NSString *)self->_originatingCampaignId hash];
  NSUInteger v77 = [(NSString *)self->_originatingCampaignType hash];
  NSUInteger v76 = [(NSString *)self->_originatingCreativeId hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) != 0)
  {
    uint64_t v75 = 2654435761 * self->_iosSettingsNotificationsEnabled;
    if ((*(_DWORD *)&v8 & 0x800000) != 0)
    {
LABEL_46:
      uint64_t v74 = 2654435761 * self->_widgetModeType;
      if ((*(void *)&v8 & 0x2000000000) != 0) {
        goto LABEL_47;
      }
LABEL_51:
      uint64_t v73 = 0;
      if ((*(_WORD *)&v8 & 0x8000) != 0) {
        goto LABEL_48;
      }
      goto LABEL_52;
    }
  }
  else
  {
    uint64_t v75 = 0;
    if ((*(_DWORD *)&v8 & 0x800000) != 0) {
      goto LABEL_46;
    }
  }
  uint64_t v74 = 0;
  if ((*(void *)&v8 & 0x2000000000) == 0) {
    goto LABEL_51;
  }
LABEL_47:
  uint64_t v73 = 2654435761 * self->_locationPermissionGranted;
  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
LABEL_48:
    uint64_t v72 = 2654435761 * self->_newsWidgetModeGroup;
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v72 = 0;
LABEL_53:
  NSUInteger v71 = [(NSString *)self->_newsWidgetModeGroupId hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) != 0)
  {
    uint64_t v70 = 2654435761 * self->_ageBracket;
    if ((*(unsigned char *)&v9 & 0x40) != 0) {
      goto LABEL_55;
    }
LABEL_60:
    unint64_t v14 = 0;
    goto LABEL_63;
  }
  uint64_t v70 = 0;
  if ((*(unsigned char *)&v9 & 0x40) == 0) {
    goto LABEL_60;
  }
LABEL_55:
  float ageBracketConfidenceLevel = self->_ageBracketConfidenceLevel;
  float v11 = -ageBracketConfidenceLevel;
  if (ageBracketConfidenceLevel >= 0.0) {
    float v11 = self->_ageBracketConfidenceLevel;
  }
  float v12 = floorf(v11 + 0.5);
  float v13 = (float)(v11 - v12) * 1.8447e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabsf(v13);
  }
LABEL_63:
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    uint64_t v69 = 2654435761 * self->_gender;
    if ((*(_WORD *)&v9 & 0x1000) != 0) {
      goto LABEL_65;
    }
LABEL_70:
    unint64_t v19 = 0;
    goto LABEL_73;
  }
  uint64_t v69 = 0;
  if ((*(_WORD *)&v9 & 0x1000) == 0) {
    goto LABEL_70;
  }
LABEL_65:
  float genderConfidenceLevel = self->_genderConfidenceLevel;
  float v16 = -genderConfidenceLevel;
  if (genderConfidenceLevel >= 0.0) {
    float v16 = self->_genderConfidenceLevel;
  }
  float v17 = floorf(v16 + 0.5);
  float v18 = (float)(v16 - v17) * 1.8447e19;
  unint64_t v19 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0) {
      v19 += (unint64_t)v18;
    }
  }
  else
  {
    v19 -= (unint64_t)fabsf(v18);
  }
LABEL_73:
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    uint64_t v68 = 2654435761 * self->_incomeBracket;
    if ((*(_WORD *)&v9 & 0x4000) != 0) {
      goto LABEL_75;
    }
LABEL_80:
    unint64_t v24 = 0;
    goto LABEL_83;
  }
  uint64_t v68 = 0;
  if ((*(_WORD *)&v9 & 0x4000) == 0) {
    goto LABEL_80;
  }
LABEL_75:
  float incomeBracketConfidenceLevel = self->_incomeBracketConfidenceLevel;
  float v21 = -incomeBracketConfidenceLevel;
  if (incomeBracketConfidenceLevel >= 0.0) {
    float v21 = self->_incomeBracketConfidenceLevel;
  }
  float v22 = floorf(v21 + 0.5);
  float v23 = (float)(v21 - v22) * 1.8447e19;
  unint64_t v24 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0) {
      v24 += (unint64_t)v23;
    }
  }
  else
  {
    v24 -= (unint64_t)fabsf(v23);
  }
LABEL_83:
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    uint64_t v67 = 2654435761 * self->_ethnicity;
    if ((*(_WORD *)&v9 & 0x400) != 0) {
      goto LABEL_85;
    }
LABEL_90:
    unint64_t v29 = 0;
    goto LABEL_93;
  }
  uint64_t v67 = 0;
  if ((*(_WORD *)&v9 & 0x400) == 0) {
    goto LABEL_90;
  }
LABEL_85:
  float ethnicityConfidenceLevel = self->_ethnicityConfidenceLevel;
  float v26 = -ethnicityConfidenceLevel;
  if (ethnicityConfidenceLevel >= 0.0) {
    float v26 = self->_ethnicityConfidenceLevel;
  }
  float v27 = floorf(v26 + 0.5);
  float v28 = (float)(v26 - v27) * 1.8447e19;
  unint64_t v29 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0) {
      v29 += (unint64_t)v28;
    }
  }
  else
  {
    v29 -= (unint64_t)fabsf(v28);
  }
LABEL_93:
  unint64_t v66 = v29;
  if ((*(unsigned char *)&v9 & 2) != 0) {
    uint64_t v65 = 2654435761 * self->_appConfigTreatmentId;
  }
  else {
    uint64_t v65 = 0;
  }
  NSUInteger v64 = [(NSString *)self->_clientName hash];
  NSUInteger v63 = [(NSString *)self->_clientVersion hash];
  NSUInteger v62 = [(NSString *)self->_browserLanguage hash];
  NSUInteger v61 = [(NSString *)self->_notwUserId hash];
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v30 = self->_has;
  if ((*(void *)&v30 & 0x8000000000) != 0)
  {
    uint64_t v60 = 2654435761 * self->_privateDataEncrypted;
    if ((*(void *)&v30 & 0x20000000000) != 0) {
      goto LABEL_98;
    }
  }
  else
  {
    uint64_t v60 = 0;
    if ((*(void *)&v30 & 0x20000000000) != 0)
    {
LABEL_98:
      uint64_t v59 = 2654435761 * self->_progressivePersonalizationAllowed;
      goto LABEL_101;
    }
  }
  uint64_t v59 = 0;
LABEL_101:
  NSUInteger v58 = [(NSString *)self->_watchSessionId hash];
  uint64_t v57 = [(NSData *)self->_sessionIdWatch hash];
  uint64_t v56 = [(NSData *)self->_widgetSessionId hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    uint64_t v55 = 2654435761 * self->_widgetDisplayMode;
  }
  else {
    uint64_t v55 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_personalizationPortraitVariantName hash];
  uint64_t v53 = [(NSData *)self->_appProcessLifetimeId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v52 = 2654435761 * self->_testBucket;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_widgetUserId hash];
  NSUInteger v50 = [(NSString *)self->_productType hash];
  uint64_t v49 = PBRepeatedInt64Hash();
  uint64_t v48 = PBRepeatedInt32Hash();
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x20000000) != 0)
  {
    uint64_t v47 = 2654435761 * self->_iosSettingsNotificationsSoundEnabled;
    if ((*(_DWORD *)&v31 & 0x1000000) != 0)
    {
LABEL_109:
      uint64_t v46 = 2654435761 * self->_iosSettingsNotificationsBadgeAppIconEnabled;
      if ((*(_DWORD *)&v31 & 0x10000000) != 0) {
        goto LABEL_110;
      }
      goto LABEL_119;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v31 & 0x1000000) != 0) {
      goto LABEL_109;
    }
  }
  uint64_t v46 = 0;
  if ((*(_DWORD *)&v31 & 0x10000000) != 0)
  {
LABEL_110:
    uint64_t v45 = 2654435761 * self->_iosSettingsNotificationsShowOnLockScreenEnabled;
    if ((*(_DWORD *)&v31 & 0x8000000) != 0) {
      goto LABEL_111;
    }
    goto LABEL_120;
  }
LABEL_119:
  uint64_t v45 = 0;
  if ((*(_DWORD *)&v31 & 0x8000000) != 0)
  {
LABEL_111:
    uint64_t v44 = 2654435761 * self->_iosSettingsNotificationsShowInHistoryEnabled;
    if ((*(_DWORD *)&v31 & 0x4000000) != 0) {
      goto LABEL_112;
    }
    goto LABEL_121;
  }
LABEL_120:
  uint64_t v44 = 0;
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
LABEL_112:
    uint64_t v43 = 2654435761 * self->_iosSettingsNotificationsShowAsBannersEnabled;
    if ((*(_DWORD *)&v31 & 0x400000) != 0) {
      goto LABEL_113;
    }
    goto LABEL_122;
  }
LABEL_121:
  uint64_t v43 = 0;
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
LABEL_113:
    uint64_t v42 = 2654435761 * self->_widgetDisplayModeSessionEnd;
    if ((*(void *)&v31 & 0x80000000000) != 0) {
      goto LABEL_114;
    }
    goto LABEL_123;
  }
LABEL_122:
  uint64_t v42 = 0;
  if ((*(void *)&v31 & 0x80000000000) != 0)
  {
LABEL_114:
    uint64_t v41 = 2654435761 * self->_signedIntoITunes;
    if ((*(void *)&v31 & 0x1000000000) != 0) {
      goto LABEL_115;
    }
LABEL_124:
    uint64_t v39 = 0;
    if ((*(_DWORD *)&v31 & 0x40000000) != 0) {
      goto LABEL_116;
    }
    goto LABEL_125;
  }
LABEL_123:
  uint64_t v41 = 0;
  if ((*(void *)&v31 & 0x1000000000) == 0) {
    goto LABEL_124;
  }
LABEL_115:
  uint64_t v39 = 2654435761 * self->_isStoreDemoModeEnabled;
  if ((*(_DWORD *)&v31 & 0x40000000) != 0)
  {
LABEL_116:
    uint64_t v32 = 2654435761 * self->_isDiagnosticsUsageEnabled;
    goto LABEL_126;
  }
LABEL_125:
  uint64_t v32 = 0;
LABEL_126:
  uint64_t v33 = [(NSMutableArray *)self->_regionIds hash];
  NSUInteger v34 = [(NSString *)self->_appBuildNumber hash];
  NSUInteger v35 = [(NSString *)self->_amsPurchaseId hash];
  NSUInteger v36 = [(NSString *)self->_amsCampaignId hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v37 = 2654435761 * self->_paywallConfigType;
  }
  else {
    uint64_t v37 = 0;
  }
  return v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v14 ^ v69 ^ v19 ^ v68 ^ v24 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 26)) {
    -[NTPBSession setDeviceModel:](self, "setDeviceModel:");
  }
  if (*((void *)v4 + 27)) {
    -[NTPBSession setDevicePlatform:](self, "setDevicePlatform:");
  }
  if (*((void *)v4 + 39)) {
    -[NTPBSession setOsVersion:](self, "setOsVersion:");
  }
  if (*((void *)v4 + 17)) {
    -[NTPBSession setAppVersion:](self, "setAppVersion:");
  }
  uint64_t v5 = *((void *)v4 + 61);
  if (v5)
  {
    self->_appBuild = *((void *)v4 + 7);
    *(void *)&self->_has |= 1uLL;
    uint64_t v5 = *((void *)v4 + 61);
  }
  if ((v5 & 0x100000) != 0)
  {
    self->_utcOffset = *((_DWORD *)v4 + 104);
    *(void *)&self->_has |= 0x100000uLL;
  }
  if (*((void *)v4 + 25)) {
    -[NTPBSession setCountryCode:](self, "setCountryCode:");
  }
  if (*((void *)v4 + 31)) {
    -[NTPBSession setLanguageCode:](self, "setLanguageCode:");
  }
  if (*((void *)v4 + 21)) {
    -[NTPBSession setCarrier:](self, "setCarrier:");
  }
  uint64_t v6 = *((void *)v4 + 61);
  if ((v6 & 0x40000) != 0)
  {
    self->_uint64_t reachabilityStatus = *((_DWORD *)v4 + 90);
    *(void *)&self->_has |= 0x40000uLL;
    uint64_t v6 = *((void *)v4 + 61);
    if ((v6 & 0x100) == 0)
    {
LABEL_21:
      if ((v6 & 0x80000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  self->_uint64_t cellularRadioAccessTechnology = *((_DWORD *)v4 + 44);
  *(void *)&self->_has |= 0x100uLL;
  if ((*((void *)v4 + 61) & 0x80000) != 0)
  {
LABEL_22:
    self->_textSize = *((_DWORD *)v4 + 98);
    *(void *)&self->_has |= 0x80000uLL;
  }
LABEL_23:
  if (*((void *)v4 + 47)) {
    -[NTPBSession setSessionId:](self, "setSessionId:");
  }
  if (*((void *)v4 + 50)) {
    -[NTPBSession setUserId:](self, "setUserId:");
  }
  if (*((void *)v4 + 51)) {
    -[NTPBSession setUserStorefrontId:](self, "setUserStorefrontId:");
  }
  uint64_t v7 = *((void *)v4 + 61);
  if ((v7 & 0x80000000) != 0)
  {
    self->_isNewUser = *((unsigned char *)v4 + 471);
    *(void *)&self->_has |= 0x80000000uLL;
    uint64_t v7 = *((void *)v4 + 61);
    if ((v7 & 0x10) == 0)
    {
LABEL_31:
      if ((v7 & 4) == 0) {
        goto LABEL_32;
      }
      goto LABEL_143;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_31;
  }
  self->_userStartDate = *((void *)v4 + 11);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v7 = *((void *)v4 + 61);
  if ((v7 & 4) == 0)
  {
LABEL_32:
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_lastAppOpenDate = *((void *)v4 + 9);
  *(void *)&self->_has |= 4uLL;
  uint64_t v7 = *((void *)v4 + 61);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_33:
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_144:
  self->_runningObsolete = *((unsigned char *)v4 + 482);
  *(void *)&self->_has |= 0x40000000000uLL;
  if ((*((void *)v4 + 61) & 0x200000000000) != 0)
  {
LABEL_34:
    self->_upgradedFromObsolete = *((unsigned char *)v4 + 485);
    *(void *)&self->_has |= 0x200000000000uLL;
  }
LABEL_35:
  if (*((void *)v4 + 42)) {
    -[NTPBSession setPreviousAppVersion:](self, "setPreviousAppVersion:");
  }
  if (*((void *)v4 + 43)) {
    -[NTPBSession setPreviousOsVersion:](self, "setPreviousOsVersion:");
  }
  uint64_t v8 = *((void *)v4 + 61);
  if ((v8 & 0x100000000000) != 0)
  {
    self->_signedIntoIcloud = *((unsigned char *)v4 + 484);
    *(void *)&self->_has |= 0x100000000000uLL;
    uint64_t v8 = *((void *)v4 + 61);
  }
  if ((v8 & 0x10000) != 0)
  {
    self->_uint64_t osInstallVariant = *((_DWORD *)v4 + 76);
    *(void *)&self->_has |= 0x10000uLL;
  }
  if (*((void *)v4 + 19)) {
    -[NTPBSession setCampaignId:](self, "setCampaignId:");
  }
  uint64_t v9 = *((void *)v4 + 61);
  if ((v9 & 0x80) != 0)
  {
    self->_uint64_t campaignType = *((_DWORD *)v4 + 40);
    *(void *)&self->_has |= 0x80uLL;
    uint64_t v9 = *((void *)v4 + 61);
    if ((v9 & 0x10000000000) == 0)
    {
LABEL_47:
      if ((v9 & 0x100000000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_148;
    }
  }
  else if ((v9 & 0x10000000000) == 0)
  {
    goto LABEL_47;
  }
  self->_privateDataSyncOn = *((unsigned char *)v4 + 480);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v9 = *((void *)v4 + 61);
  if ((v9 & 0x100000000) == 0)
  {
LABEL_48:
    if ((v9 & 0x400000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_isPaidSubscriber = *((unsigned char *)v4 + 472);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v9 = *((void *)v4 + 61);
  if ((v9 & 0x400000000) == 0)
  {
LABEL_49:
    if ((v9 & 0x200000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_isPaidSubscriberFromNews = *((unsigned char *)v4 + 474);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v9 = *((void *)v4 + 61);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_50:
    if ((v9 & 0x800000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_isPaidSubscriberFromAppStore = *((unsigned char *)v4 + 473);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v9 = *((void *)v4 + 61);
  if ((v9 & 0x800000000) == 0)
  {
LABEL_51:
    if ((v9 & 0x4000000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_151:
  self->_isPaidSubscriberFromThirdParty = *((unsigned char *)v4 + 475);
  *(void *)&self->_has |= 0x800000000uLL;
  if ((*((void *)v4 + 61) & 0x4000000000) != 0)
  {
LABEL_52:
    self->_notificationsEnabled = *((unsigned char *)v4 + 478);
    *(void *)&self->_has |= 0x4000000000uLL;
  }
LABEL_53:
  if (*((void *)v4 + 35)) {
    -[NTPBSession setOriginatingCampaignId:](self, "setOriginatingCampaignId:");
  }
  if (*((void *)v4 + 36)) {
    -[NTPBSession setOriginatingCampaignType:](self, "setOriginatingCampaignType:");
  }
  if (*((void *)v4 + 37)) {
    -[NTPBSession setOriginatingCreativeId:](self, "setOriginatingCreativeId:");
  }
  uint64_t v10 = *((void *)v4 + 61);
  if ((v10 & 0x2000000) != 0)
  {
    self->_iosSettingsNotificationsEnabled = *((unsigned char *)v4 + 465);
    *(void *)&self->_has |= 0x2000000uLL;
    uint64_t v10 = *((void *)v4 + 61);
    if ((v10 & 0x800000) == 0)
    {
LABEL_61:
      if ((v10 & 0x2000000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_155;
    }
  }
  else if ((v10 & 0x800000) == 0)
  {
    goto LABEL_61;
  }
  self->_uint64_t widgetModeType = *((_DWORD *)v4 + 110);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v10 = *((void *)v4 + 61);
  if ((v10 & 0x2000000000) == 0)
  {
LABEL_62:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_63;
  }
LABEL_155:
  self->_locationPermissionGranted = *((unsigned char *)v4 + 477);
  *(void *)&self->_has |= 0x2000000000uLL;
  if ((*((void *)v4 + 61) & 0x8000) != 0)
  {
LABEL_63:
    self->_uint64_t newsWidgetModeGroup = *((_DWORD *)v4 + 64);
    *(void *)&self->_has |= 0x8000uLL;
  }
LABEL_64:
  if (*((void *)v4 + 33)) {
    -[NTPBSession setNewsWidgetModeGroupId:](self, "setNewsWidgetModeGroupId:");
  }
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x20) != 0)
  {
    self->_ageBracket = *((_DWORD *)v4 + 24);
    *(void *)&self->_has |= 0x20uLL;
    uint64_t v11 = *((void *)v4 + 61);
    if ((v11 & 0x40) == 0)
    {
LABEL_68:
      if ((v11 & 0x800) == 0) {
        goto LABEL_69;
      }
      goto LABEL_159;
    }
  }
  else if ((v11 & 0x40) == 0)
  {
    goto LABEL_68;
  }
  self->_float ageBracketConfidenceLevel = *((float *)v4 + 25);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x800) == 0)
  {
LABEL_69:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_160;
  }
LABEL_159:
  self->_gender = *((_DWORD *)v4 + 58);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x1000) == 0)
  {
LABEL_70:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_161;
  }
LABEL_160:
  self->_float genderConfidenceLevel = *((float *)v4 + 59);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x2000) == 0)
  {
LABEL_71:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_162;
  }
LABEL_161:
  self->_incomeBracket = *((_DWORD *)v4 + 60);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x4000) == 0)
  {
LABEL_72:
    if ((v11 & 0x200) == 0) {
      goto LABEL_73;
    }
    goto LABEL_163;
  }
LABEL_162:
  self->_float incomeBracketConfidenceLevel = *((float *)v4 + 61);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x200) == 0)
  {
LABEL_73:
    if ((v11 & 0x400) == 0) {
      goto LABEL_74;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_ethnicity = *((_DWORD *)v4 + 56);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v11 = *((void *)v4 + 61);
  if ((v11 & 0x400) == 0)
  {
LABEL_74:
    if ((v11 & 2) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_164:
  self->_float ethnicityConfidenceLevel = *((float *)v4 + 57);
  *(void *)&self->_has |= 0x400uLL;
  if ((*((void *)v4 + 61) & 2) != 0)
  {
LABEL_75:
    self->_appConfigTreatmentId = *((void *)v4 + 8);
    *(void *)&self->_has |= 2uLL;
  }
LABEL_76:
  if (*((void *)v4 + 23)) {
    -[NTPBSession setClientName:](self, "setClientName:");
  }
  if (*((void *)v4 + 24)) {
    -[NTPBSession setClientVersion:](self, "setClientVersion:");
  }
  if (*((void *)v4 + 18)) {
    -[NTPBSession setBrowserLanguage:](self, "setBrowserLanguage:");
  }
  if (*((void *)v4 + 34)) {
    -[NTPBSession setNotwUserId:](self, "setNotwUserId:");
  }
  uint64_t v12 = *((void *)v4 + 61);
  if ((v12 & 0x8000000000) != 0)
  {
    self->_privateDataEncrypted = *((unsigned char *)v4 + 479);
    *(void *)&self->_has |= 0x8000000000uLL;
    uint64_t v12 = *((void *)v4 + 61);
  }
  if ((v12 & 0x20000000000) != 0)
  {
    self->_progressivePersonalizationAllowed = *((unsigned char *)v4 + 481);
    *(void *)&self->_has |= 0x20000000000uLL;
  }
  if (*((void *)v4 + 53)) {
    -[NTPBSession setWatchSessionId:](self, "setWatchSessionId:");
  }
  if (*((void *)v4 + 48)) {
    -[NTPBSession setSessionIdWatch:](self, "setSessionIdWatch:");
  }
  if (*((void *)v4 + 56)) {
    -[NTPBSession setWidgetSessionId:](self, "setWidgetSessionId:");
  }
  if ((*((unsigned char *)v4 + 490) & 0x20) != 0)
  {
    self->_uint64_t widgetDisplayMode = *((_DWORD *)v4 + 108);
    *(void *)&self->_has |= 0x200000uLL;
  }
  if (*((void *)v4 + 41)) {
    -[NTPBSession setPersonalizationPortraitVariantName:](self, "setPersonalizationPortraitVariantName:");
  }
  if (*((void *)v4 + 16)) {
    -[NTPBSession setAppProcessLifetimeId:](self, "setAppProcessLifetimeId:");
  }
  if ((*((unsigned char *)v4 + 488) & 8) != 0)
  {
    self->_testBucket = *((void *)v4 + 10);
    *(void *)&self->_has |= 8uLL;
  }
  if (*((void *)v4 + 57)) {
    -[NTPBSession setWidgetUserId:](self, "setWidgetUserId:");
  }
  if (*((void *)v4 + 44)) {
    -[NTPBSession setProductType:](self, "setProductType:");
  }
  uint64_t v13 = [v4 userSegmentationTreatmentIdsCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t i = 0; i != v14; ++i)
      -[NTPBSession addUserSegmentationTreatmentIds:](self, "addUserSegmentationTreatmentIds:", [v4 userSegmentationTreatmentIdsAtIndex:i]);
  }
  uint64_t v16 = [v4 userSegmentationSegmentSetIdsCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t j = 0; j != v17; ++j)
      -[NTPBSession addUserSegmentationSegmentSetIds:](self, "addUserSegmentationSegmentSetIds:", [v4 userSegmentationSegmentSetIdsAtIndex:j]);
  }
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x20000000) != 0)
  {
    self->_iosSettingsNotificationsSoundEnabled = *((unsigned char *)v4 + 469);
    *(void *)&self->_has |= 0x20000000uLL;
    uint64_t v19 = *((void *)v4 + 61);
    if ((v19 & 0x1000000) == 0)
    {
LABEL_114:
      if ((v19 & 0x10000000) == 0) {
        goto LABEL_115;
      }
      goto LABEL_168;
    }
  }
  else if ((v19 & 0x1000000) == 0)
  {
    goto LABEL_114;
  }
  self->_iosSettingsNotificationsBadgeAppIconEnabled = *((unsigned char *)v4 + 464);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x10000000) == 0)
  {
LABEL_115:
    if ((v19 & 0x8000000) == 0) {
      goto LABEL_116;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_iosSettingsNotificationsShowOnLockScreenEnabled = *((unsigned char *)v4 + 468);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x8000000) == 0)
  {
LABEL_116:
    if ((v19 & 0x4000000) == 0) {
      goto LABEL_117;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_iosSettingsNotificationsShowInHistoryEnabled = *((unsigned char *)v4 + 467);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x4000000) == 0)
  {
LABEL_117:
    if ((v19 & 0x400000) == 0) {
      goto LABEL_118;
    }
    goto LABEL_171;
  }
LABEL_170:
  self->_iosSettingsNotificationsShowAsBannersEnabled = *((unsigned char *)v4 + 466);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x400000) == 0)
  {
LABEL_118:
    if ((v19 & 0x80000000000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_172;
  }
LABEL_171:
  self->_uint64_t widgetDisplayModeSessionEnd = *((_DWORD *)v4 + 109);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x80000000000) == 0)
  {
LABEL_119:
    if ((v19 & 0x1000000000) == 0) {
      goto LABEL_120;
    }
    goto LABEL_173;
  }
LABEL_172:
  self->_signedIntoITunes = *((unsigned char *)v4 + 483);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v19 = *((void *)v4 + 61);
  if ((v19 & 0x1000000000) == 0)
  {
LABEL_120:
    if ((v19 & 0x40000000) == 0) {
      goto LABEL_122;
    }
    goto LABEL_121;
  }
LABEL_173:
  self->_isStoreDemoModeEnabled = *((unsigned char *)v4 + 476);
  *(void *)&self->_has |= 0x1000000000uLL;
  if ((*((void *)v4 + 61) & 0x40000000) != 0)
  {
LABEL_121:
    self->_isDiagnosticsUsageEnabled = *((unsigned char *)v4 + 470);
    *(void *)&self->_has |= 0x40000000uLL;
  }
LABEL_122:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v20 = *((id *)v4 + 46);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        -[NTPBSession addRegionIds:](self, "addRegionIds:", *(void *)(*((void *)&v25 + 1) + 8 * k), (void)v25);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v22);
  }

  if (*((void *)v4 + 15)) {
    -[NTPBSession setAppBuildNumber:](self, "setAppBuildNumber:");
  }
  if (*((void *)v4 + 14)) {
    -[NTPBSession setAmsPurchaseId:](self, "setAmsPurchaseId:");
  }
  if (*((void *)v4 + 13)) {
    -[NTPBSession setAmsCampaignId:](self, "setAmsCampaignId:");
  }
  if ((*((unsigned char *)v4 + 490) & 2) != 0)
  {
    self->_uint64_t paywallConfigType = *((_DWORD *)v4 + 80);
    *(void *)&self->_has |= 0x20000uLL;
  }
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (void)setDevicePlatform:(id)a3
{
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
}

- (int64_t)appBuild
{
  return self->_appBuild;
}

- (int)utcOffset
{
  return self->_utcOffset;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
}

- (int)textSize
{
  return self->_textSize;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
}

- (BOOL)isNewUser
{
  return self->_isNewUser;
}

- (int64_t)userStartDate
{
  return self->_userStartDate;
}

- (int64_t)lastAppOpenDate
{
  return self->_lastAppOpenDate;
}

- (BOOL)runningObsolete
{
  return self->_runningObsolete;
}

- (BOOL)upgradedFromObsolete
{
  return self->_upgradedFromObsolete;
}

- (NSString)previousAppVersion
{
  return self->_previousAppVersion;
}

- (void)setPreviousAppVersion:(id)a3
{
}

- (NSString)previousOsVersion
{
  return self->_previousOsVersion;
}

- (void)setPreviousOsVersion:(id)a3
{
}

- (BOOL)signedIntoIcloud
{
  return self->_signedIntoIcloud;
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (BOOL)privateDataSyncOn
{
  return self->_privateDataSyncOn;
}

- (BOOL)isPaidSubscriber
{
  return self->_isPaidSubscriber;
}

- (BOOL)isPaidSubscriberFromNews
{
  return self->_isPaidSubscriberFromNews;
}

- (BOOL)isPaidSubscriberFromAppStore
{
  return self->_isPaidSubscriberFromAppStore;
}

- (BOOL)isPaidSubscriberFromThirdParty
{
  return self->_isPaidSubscriberFromThirdParty;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (NSString)originatingCampaignId
{
  return self->_originatingCampaignId;
}

- (void)setOriginatingCampaignId:(id)a3
{
}

- (NSString)originatingCampaignType
{
  return self->_originatingCampaignType;
}

- (void)setOriginatingCampaignType:(id)a3
{
}

- (NSString)originatingCreativeId
{
  return self->_originatingCreativeId;
}

- (void)setOriginatingCreativeId:(id)a3
{
}

- (BOOL)iosSettingsNotificationsEnabled
{
  return self->_iosSettingsNotificationsEnabled;
}

- (BOOL)locationPermissionGranted
{
  return self->_locationPermissionGranted;
}

- (NSString)newsWidgetModeGroupId
{
  return self->_newsWidgetModeGroupId;
}

- (void)setNewsWidgetModeGroupId:(id)a3
{
}

- (int)ageBracket
{
  return self->_ageBracket;
}

- (float)ageBracketConfidenceLevel
{
  return self->_ageBracketConfidenceLevel;
}

- (int)gender
{
  return self->_gender;
}

- (float)genderConfidenceLevel
{
  return self->_genderConfidenceLevel;
}

- (int)incomeBracket
{
  return self->_incomeBracket;
}

- (float)incomeBracketConfidenceLevel
{
  return self->_incomeBracketConfidenceLevel;
}

- (int)ethnicity
{
  return self->_ethnicity;
}

- (float)ethnicityConfidenceLevel
{
  return self->_ethnicityConfidenceLevel;
}

- (int64_t)appConfigTreatmentId
{
  return self->_appConfigTreatmentId;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
}

- (NSString)browserLanguage
{
  return self->_browserLanguage;
}

- (void)setBrowserLanguage:(id)a3
{
}

- (NSString)notwUserId
{
  return self->_notwUserId;
}

- (void)setNotwUserId:(id)a3
{
}

- (BOOL)privateDataEncrypted
{
  return self->_privateDataEncrypted;
}

- (BOOL)progressivePersonalizationAllowed
{
  return self->_progressivePersonalizationAllowed;
}

- (NSString)watchSessionId
{
  return self->_watchSessionId;
}

- (void)setWatchSessionId:(id)a3
{
}

- (NSData)sessionIdWatch
{
  return self->_sessionIdWatch;
}

- (void)setSessionIdWatch:(id)a3
{
}

- (NSData)widgetSessionId
{
  return self->_widgetSessionId;
}

- (void)setWidgetSessionId:(id)a3
{
}

- (NSString)personalizationPortraitVariantName
{
  return self->_personalizationPortraitVariantName;
}

- (void)setPersonalizationPortraitVariantName:(id)a3
{
}

- (NSData)appProcessLifetimeId
{
  return self->_appProcessLifetimeId;
}

- (void)setAppProcessLifetimeId:(id)a3
{
}

- (int64_t)testBucket
{
  return self->_testBucket;
}

- (NSString)widgetUserId
{
  return self->_widgetUserId;
}

- (void)setWidgetUserId:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (BOOL)iosSettingsNotificationsSoundEnabled
{
  return self->_iosSettingsNotificationsSoundEnabled;
}

- (BOOL)iosSettingsNotificationsBadgeAppIconEnabled
{
  return self->_iosSettingsNotificationsBadgeAppIconEnabled;
}

- (BOOL)iosSettingsNotificationsShowOnLockScreenEnabled
{
  return self->_iosSettingsNotificationsShowOnLockScreenEnabled;
}

- (BOOL)iosSettingsNotificationsShowInHistoryEnabled
{
  return self->_iosSettingsNotificationsShowInHistoryEnabled;
}

- (BOOL)iosSettingsNotificationsShowAsBannersEnabled
{
  return self->_iosSettingsNotificationsShowAsBannersEnabled;
}

- (BOOL)signedIntoITunes
{
  return self->_signedIntoITunes;
}

- (BOOL)isStoreDemoModeEnabled
{
  return self->_isStoreDemoModeEnabled;
}

- (BOOL)isDiagnosticsUsageEnabled
{
  return self->_isDiagnosticsUsageEnabled;
}

- (NSMutableArray)regionIds
{
  return self->_regionIds;
}

- (void)setRegionIds:(id)a3
{
}

- (NSString)appBuildNumber
{
  return self->_appBuildNumber;
}

- (void)setAppBuildNumber:(id)a3
{
}

- (NSString)amsPurchaseId
{
  return self->_amsPurchaseId;
}

- (void)setAmsPurchaseId:(id)a3
{
}

- (NSString)amsCampaignId
{
  return self->_amsCampaignId;
}

- (void)setAmsCampaignId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUserId, 0);
  objc_storeStrong((id *)&self->_widgetSessionId, 0);
  objc_storeStrong((id *)&self->_watchSessionId, 0);
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessionIdWatch, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_regionIds, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previousOsVersion, 0);
  objc_storeStrong((id *)&self->_previousAppVersion, 0);
  objc_storeStrong((id *)&self->_personalizationPortraitVariantName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_originatingCreativeId, 0);
  objc_storeStrong((id *)&self->_originatingCampaignType, 0);
  objc_storeStrong((id *)&self->_originatingCampaignId, 0);
  objc_storeStrong((id *)&self->_notwUserId, 0);
  objc_storeStrong((id *)&self->_newsWidgetModeGroupId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_browserLanguage, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appProcessLifetimeId, 0);
  objc_storeStrong((id *)&self->_appBuildNumber, 0);
  objc_storeStrong((id *)&self->_amsPurchaseId, 0);

  objc_storeStrong((id *)&self->_amsCampaignId, 0);
}

@end