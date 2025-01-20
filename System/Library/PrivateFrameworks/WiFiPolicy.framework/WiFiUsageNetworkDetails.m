@interface WiFiUsageNetworkDetails
- (BOOL)addedFromApp;
- (BOOL)addedFromUI;
- (BOOL)addedViaATJ;
- (BOOL)addedViaRecommendation;
- (BOOL)addedViaSharing;
- (BOOL)addedViaSync;
- (BOOL)autoJoinDisabled;
- (BOOL)autoLoginDisabled;
- (BOOL)canExposeImsi;
- (BOOL)controlCenterDisabled;
- (BOOL)hasAmbiguousSsid;
- (BOOL)hasCustomNetworkSettings;
- (BOOL)hasEnterpriseSecurity;
- (BOOL)hasLegacyEnterpriseSecurity;
- (BOOL)hasNoMap;
- (BOOL)hasWapi;
- (BOOL)hasWeakSecurity;
- (BOOL)hasWep;
- (BOOL)hasWpa3;
- (BOOL)isAdhoc;
- (BOOL)isAppBased;
- (BOOL)isAtNonPrimaryHMHome;
- (BOOL)isAtPrimaryHMHome;
- (BOOL)isAutoHotspot;
- (BOOL)isAutoJoined;
- (BOOL)isBlueAtlas;
- (BOOL)isCarPlay;
- (BOOL)isCarrierBased;
- (BOOL)isCurrentBssOnChannel:(id)a3;
- (BOOL)isHidden;
- (BOOL)isHome;
- (BOOL)isInstantHotspot;
- (BOOL)isInternal;
- (BOOL)isKnown;
- (BOOL)isLowQuality;
- (BOOL)isManaged;
- (BOOL)isMesh;
- (BOOL)isMetered;
- (BOOL)isMoving;
- (BOOL)isOpen;
- (BOOL)isPasspoint;
- (BOOL)isPersonalHotspot;
- (BOOL)isPublic;
- (BOOL)isStandalone6E;
- (BOOL)isWalletBased;
- (BOOL)isWidelyDeployed;
- (BOOL)isWork;
- (BOOL)lowDataModeEnabled;
- (BOOL)privateMacDisabledByProfile;
- (BOOL)privateMacFeatureToggled;
- (BOOL)privateMacNetworkTypeHome;
- (BOOL)privateMacUnderClassification;
- (BOOL)privateRelayEnabled;
- (BOOL)requiresIdentity;
- (BOOL)requiresOtp;
- (BOOL)requiresPassword;
- (BOOL)requiresUsername;
- (NSDate)lastJoinDate;
- (NSMutableArray)downloadSpeedResults;
- (NSString)bssEnvironment;
- (NSString)disable6eMode;
- (NSString)networkName;
- (NSString)privateMacType;
- (NSString)privateRelayBlockedReason;
- (WiFiUsageBssDetails)connectedBss;
- (WiFiUsageNetworkDetails)initWithNetworkName:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)eventDictionary:(BOOL)a3;
- (id)redactedDescription;
- (int64_t)joinFailCountInLastDay;
- (int64_t)joinFailCountInLastMonth;
- (int64_t)joinFailCountInLastWeek;
- (int64_t)joinSuccessCountInLastDay;
- (int64_t)joinSuccessCountInLastMonth;
- (int64_t)joinSuccessCountInLastWeek;
- (int64_t)networkScore;
- (int64_t)usageChargingDayTimeInLastDay;
- (int64_t)usageChargingDayTimeInLastMonth;
- (int64_t)usageChargingDayTimeInLastWeek;
- (int64_t)usageChargingNightTimeInLastDay;
- (int64_t)usageChargingNightTimeInLastMonth;
- (int64_t)usageChargingNightTimeInLastWeek;
- (int64_t)usageDayTimeInLastDay;
- (int64_t)usageDayTimeInLastMonth;
- (int64_t)usageDayTimeInLastWeek;
- (int64_t)usageNightTimeInLastDay;
- (int64_t)usageNightTimeInLastMonth;
- (int64_t)usageNightTimeInLastWeek;
- (int64_t)usageRank;
- (int64_t)usageStationaryDayTimeInLastDay;
- (int64_t)usageStationaryDayTimeInLastMonth;
- (int64_t)usageStationaryDayTimeInLastWeek;
- (int64_t)usageStationaryNightTimeInLastDay;
- (int64_t)usageStationaryNightTimeInLastMonth;
- (int64_t)usageStationaryNightTimeInLastWeek;
- (unint64_t)advertisedCountryCode;
- (unint64_t)appliedCountryCode;
- (unint64_t)captiveStatus;
- (unint64_t)colocatedNetworkCount;
- (unint64_t)colocatedScopeCount;
- (unint64_t)localeSource;
- (unint64_t)switchedAwayCount;
- (unint64_t)switchedToCount;
- (void)addDownloadSpeed:(double)a3;
- (void)setAddedFromApp:(BOOL)a3;
- (void)setAddedFromUI:(BOOL)a3;
- (void)setAddedViaATJ:(BOOL)a3;
- (void)setAddedViaRecommendation:(BOOL)a3;
- (void)setAddedViaSharing:(BOOL)a3;
- (void)setAddedViaSync:(BOOL)a3;
- (void)setAdvertisedCountryCode:(unint64_t)a3;
- (void)setAppliedCountryCode:(unint64_t)a3;
- (void)setAutoJoinDisabled:(BOOL)a3;
- (void)setAutoLoginDisabled:(BOOL)a3;
- (void)setBssEnvironment:(id)a3;
- (void)setCanExposeImsi:(BOOL)a3;
- (void)setCaptiveStatus:(unint64_t)a3;
- (void)setColocatedNetworkCount:(unint64_t)a3;
- (void)setColocatedScopeCount:(unint64_t)a3;
- (void)setConnectedBss:(id)a3;
- (void)setControlCenterDisabled:(BOOL)a3;
- (void)setDisable6eMode:(id)a3;
- (void)setDownloadSpeedResults:(id)a3;
- (void)setHasAmbiguousSsid:(BOOL)a3;
- (void)setHasCustomNetworkSettings:(BOOL)a3;
- (void)setHasEnterpriseSecurity:(BOOL)a3;
- (void)setHasLegacyEnterpriseSecurity:(BOOL)a3;
- (void)setHasNoMap:(BOOL)a3;
- (void)setHasWapi:(BOOL)a3;
- (void)setHasWeakSecurity:(BOOL)a3;
- (void)setHasWep:(BOOL)a3;
- (void)setHasWpa3:(BOOL)a3;
- (void)setIsAdhoc:(BOOL)a3;
- (void)setIsAppBased:(BOOL)a3;
- (void)setIsAtNonPrimaryHMHome:(BOOL)a3;
- (void)setIsAtPrimaryHMHome:(BOOL)a3;
- (void)setIsAutoHotspot:(BOOL)a3;
- (void)setIsAutoJoined:(BOOL)a3;
- (void)setIsBlueAtlas:(BOOL)a3;
- (void)setIsCarPlay:(BOOL)a3;
- (void)setIsCarrierBased:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsHome:(BOOL)a3;
- (void)setIsInstantHotspot:(BOOL)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setIsKnown:(BOOL)a3;
- (void)setIsLowQuality:(BOOL)a3;
- (void)setIsManaged:(BOOL)a3;
- (void)setIsMesh:(BOOL)a3;
- (void)setIsMetered:(BOOL)a3;
- (void)setIsMoving:(BOOL)a3;
- (void)setIsOpen:(BOOL)a3;
- (void)setIsPasspoint:(BOOL)a3;
- (void)setIsPersonalHotspot:(BOOL)a3;
- (void)setIsPublic:(BOOL)a3;
- (void)setIsStandalone6E:(BOOL)a3;
- (void)setIsWalletBased:(BOOL)a3;
- (void)setIsWidelyDeployed:(BOOL)a3;
- (void)setIsWork:(BOOL)a3;
- (void)setJoinFailCountInLastDay:(int64_t)a3;
- (void)setJoinFailCountInLastMonth:(int64_t)a3;
- (void)setJoinFailCountInLastWeek:(int64_t)a3;
- (void)setJoinSuccessCountInLastDay:(int64_t)a3;
- (void)setJoinSuccessCountInLastMonth:(int64_t)a3;
- (void)setJoinSuccessCountInLastWeek:(int64_t)a3;
- (void)setLastJoinDate:(id)a3;
- (void)setLocaleSource:(unint64_t)a3;
- (void)setLowDataModeEnabled:(BOOL)a3;
- (void)setNetworkName:(id)a3;
- (void)setNetworkScore:(int64_t)a3;
- (void)setPrivateMacDisabledByProfile:(BOOL)a3;
- (void)setPrivateMacFeatureToggled:(BOOL)a3;
- (void)setPrivateMacNetworkTypeHome:(BOOL)a3;
- (void)setPrivateMacType:(id)a3;
- (void)setPrivateMacUnderClassification:(BOOL)a3;
- (void)setPrivateRelayBlockedReason:(id)a3;
- (void)setPrivateRelayEnabled:(BOOL)a3;
- (void)setRequiresIdentity:(BOOL)a3;
- (void)setRequiresOtp:(BOOL)a3;
- (void)setRequiresPassword:(BOOL)a3;
- (void)setRequiresUsername:(BOOL)a3;
- (void)setSwitchedAwayCount:(unint64_t)a3;
- (void)setSwitchedToCount:(unint64_t)a3;
- (void)setUsageChargingDayTimeInLastDay:(int64_t)a3;
- (void)setUsageChargingDayTimeInLastMonth:(int64_t)a3;
- (void)setUsageChargingDayTimeInLastWeek:(int64_t)a3;
- (void)setUsageChargingNightTimeInLastDay:(int64_t)a3;
- (void)setUsageChargingNightTimeInLastMonth:(int64_t)a3;
- (void)setUsageChargingNightTimeInLastWeek:(int64_t)a3;
- (void)setUsageDayTimeInLastDay:(int64_t)a3;
- (void)setUsageDayTimeInLastMonth:(int64_t)a3;
- (void)setUsageDayTimeInLastWeek:(int64_t)a3;
- (void)setUsageNightTimeInLastDay:(int64_t)a3;
- (void)setUsageNightTimeInLastMonth:(int64_t)a3;
- (void)setUsageNightTimeInLastWeek:(int64_t)a3;
- (void)setUsageRank:(int64_t)a3;
- (void)setUsageStationaryDayTimeInLastDay:(int64_t)a3;
- (void)setUsageStationaryDayTimeInLastMonth:(int64_t)a3;
- (void)setUsageStationaryDayTimeInLastWeek:(int64_t)a3;
- (void)setUsageStationaryNightTimeInLastDay:(int64_t)a3;
- (void)setUsageStationaryNightTimeInLastMonth:(int64_t)a3;
- (void)setUsageStationaryNightTimeInLastWeek:(int64_t)a3;
@end

@implementation WiFiUsageNetworkDetails

- (NSString)disable6eMode
{
  return self->_disable6eMode;
}

- (WiFiUsageBssDetails)connectedBss
{
  return self->_connectedBss;
}

- (WiFiUsageNetworkDetails)initWithNetworkName:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageNetworkDetails;
  id v3 = a3;
  v4 = [(WiFiUsageNetworkDetails *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  networkName = v4->_networkName;
  v4->_networkName = (NSString *)v5;

  return v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"NetworkName:%@ BSSDetails:%@", self->_networkName, self->_connectedBss];
}

- (id)redactedDescription
{
  v2 = NSString;
  id v3 = [(WiFiUsageBssDetails *)self->_connectedBss redactedDescription];
  v4 = [v2 stringWithFormat:@"NetworkName:REDACTED BSSDetails:%@", v3];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc((Class)objc_opt_class());
  uint64_t v5 = [(WiFiUsageNetworkDetails *)self networkName];
  v6 = (void *)[v4 initWithNetworkName:v5];

  [v6 setIsKnown:self->_isKnown];
  [v6 setIsOpen:self->_isOpen];
  [v6 setIsOpen:self->_isOpen];
  [v6 setCaptiveStatus:self->_captiveStatus];
  [v6 setIsPublic:self->_isPublic];
  [v6 setIsLowQuality:self->_isLowQuality];
  [v6 setIsHome:self->_isHome];
  [v6 setIsWork:self->_isWork];
  [v6 setIsInternal:self->_isInternal];
  [v6 setIsManaged:self->_isManaged];
  [v6 setIsCarrierBased:self->_isCarrierBased];
  [v6 setIsCarPlay:self->_isCarPlay];
  [v6 setIsAppBased:self->_isAppBased];
  [v6 setIsWalletBased:self->_isWalletBased];
  [v6 setIsPersonalHotspot:self->_isPersonalHotspot];
  [v6 setIsMoving:self->_isMoving];
  [v6 setIsMesh:self->_isMesh];
  [v6 setIsWidelyDeployed:self->_isWidelyDeployed];
  [v6 setIsAutoJoined:self->_isAutoJoined];
  [v6 setIsAdhoc:self->_isAdhoc];
  [v6 setIsHidden:self->_isHidden];
  [v6 setIsPasspoint:self->_isPasspoint];
  [v6 setIsMetered:self->_isMetered];
  [v6 setIsBlueAtlas:self->_isBlueAtlas];
  [v6 setHasWapi:self->_hasWapi];
  [v6 setHasWeakSecurity:self->_hasWeakSecurity];
  [v6 setHasWpa3:self->_hasWpa3];
  [v6 setHasWep:self->_hasWep];
  [v6 setHasEnterpriseSecurity:self->_hasEnterpriseSecurity];
  [v6 setHasLegacyEnterpriseSecurity:self->_hasLegacyEnterpriseSecurity];
  [v6 setHasNoMap:self->_hasNoMap];
  [v6 setHasAmbiguousSsid:self->_hasAmbiguousSsid];
  [v6 setHasCustomNetworkSettings:self->_hasCustomNetworkSettings];
  [v6 setRequiresUsername:self->_requiresUsername];
  [v6 setRequiresPassword:self->_requiresPassword];
  [v6 setRequiresIdentity:self->_requiresIdentity];
  [v6 setRequiresOtp:self->_requiresOtp];
  [v6 setCanExposeImsi:self->_canExposeImsi];
  [v6 setAddedFromUI:self->_addedFromUI];
  [v6 setAddedFromApp:self->_addedFromApp];
  [v6 setAddedViaSync:self->_addedViaSync];
  [v6 setAddedViaATJ:self->_addedViaATJ];
  [v6 setAddedViaRecommendation:self->_addedViaRecommendation];
  [v6 setAddedViaSharing:self->_addedViaSharing];
  [v6 setUsageRank:self->_usageRank];
  [v6 setAutoJoinDisabled:self->_autoJoinDisabled];
  [v6 setAutoLoginDisabled:self->_autoLoginDisabled];
  [v6 setLowDataModeEnabled:self->_lowDataModeEnabled];
  [v6 setControlCenterDisabled:self->_controlCenterDisabled];
  [v6 setPrivateRelayEnabled:self->_privateRelayEnabled];
  [v6 setPrivateRelayBlockedReason:self->_privateRelayBlockedReason];
  [v6 setAdvertisedCountryCode:self->_advertisedCountryCode];
  [v6 setAppliedCountryCode:self->_appliedCountryCode];
  [v6 setLocaleSource:self->_localeSource];
  [v6 setBssEnvironment:self->_bssEnvironment];
  [v6 setLastJoinDate:self->_lastJoinDate];
  [v6 setConnectedBss:self->_connectedBss];
  [v6 setColocatedNetworkCount:self->_colocatedNetworkCount];
  [v6 setSwitchedToCount:self->_switchedToCount];
  [v6 setSwitchedAwayCount:self->_switchedAwayCount];
  [v6 setNetworkScore:self->_networkScore];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_downloadSpeedResults;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v11), "doubleValue", (void)v13);
        objc_msgSend(v6, "addDownloadSpeed:");
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  [v6 setPrivateMacType:self->_privateMacType];
  [v6 setPrivateMacFeatureToggled:self->_privateMacFeatureToggled];
  [v6 setPrivateMacUnderClassification:self->_privateMacUnderClassification];
  [v6 setPrivateMacDisabledByProfile:self->_privateMacDisabledByProfile];
  [v6 setPrivateMacNetworkTypeHome:self->_privateMacNetworkTypeHome];
  [v6 setUsageDayTimeInLastDay:self->_usageDayTimeInLastDay];
  [v6 setUsageDayTimeInLastWeek:self->_usageDayTimeInLastWeek];
  [v6 setUsageDayTimeInLastMonth:self->_usageDayTimeInLastMonth];
  [v6 setUsageNightTimeInLastDay:self->_usageNightTimeInLastDay];
  [v6 setUsageNightTimeInLastWeek:self->_usageNightTimeInLastWeek];
  [v6 setUsageNightTimeInLastMonth:self->_usageNightTimeInLastMonth];
  [v6 setUsageStationaryDayTimeInLastDay:self->_usageStationaryDayTimeInLastDay];
  [v6 setUsageStationaryDayTimeInLastWeek:self->_usageStationaryDayTimeInLastWeek];
  [v6 setUsageStationaryDayTimeInLastMonth:self->_usageStationaryDayTimeInLastMonth];
  [v6 setUsageStationaryNightTimeInLastDay:self->_usageStationaryNightTimeInLastDay];
  [v6 setUsageStationaryNightTimeInLastWeek:self->_usageStationaryNightTimeInLastWeek];
  [v6 setUsageStationaryNightTimeInLastMonth:self->_usageStationaryNightTimeInLastMonth];
  [v6 setUsageChargingDayTimeInLastDay:self->_usageChargingDayTimeInLastDay];
  [v6 setUsageChargingDayTimeInLastWeek:self->_usageChargingDayTimeInLastWeek];
  [v6 setUsageChargingDayTimeInLastMonth:self->_usageChargingDayTimeInLastMonth];
  [v6 setUsageChargingNightTimeInLastDay:self->_usageChargingNightTimeInLastDay];
  [v6 setUsageChargingNightTimeInLastWeek:self->_usageChargingNightTimeInLastWeek];
  [v6 setUsageChargingNightTimeInLastMonth:self->_usageChargingNightTimeInLastMonth];
  [v6 setIsAtPrimaryHMHome:self->_isAtPrimaryHMHome];
  [v6 setIsAtNonPrimaryHMHome:self->_isAtNonPrimaryHMHome];
  [v6 setJoinSuccessCountInLastDay:self->_joinSuccessCountInLastDay];
  [v6 setJoinSuccessCountInLastWeek:self->_joinSuccessCountInLastWeek];
  [v6 setJoinSuccessCountInLastMonth:self->_joinSuccessCountInLastMonth];
  [v6 setJoinFailCountInLastDay:self->_joinFailCountInLastDay];
  [v6 setJoinFailCountInLastWeek:self->_joinFailCountInLastWeek];
  [v6 setJoinFailCountInLastMonth:self->_joinFailCountInLastMonth];
  [v6 setColocatedScopeCount:self->_colocatedScopeCount];
  [v6 setDisable6eMode:self->_disable6eMode];
  [v6 setIsStandalone6E:self->_isStandalone6E];
  return v6;
}

- (void)addDownloadSpeed:(double)a3
{
  downloadSpeedResults = self->_downloadSpeedResults;
  if (!downloadSpeedResults)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    v7 = self->_downloadSpeedResults;
    self->_downloadSpeedResults = v6;

    downloadSpeedResults = self->_downloadSpeedResults;
  }
  id v8 = [NSNumber numberWithInt:(int)a3];
  [(NSMutableArray *)downloadSpeedResults addObject:v8];
}

- (BOOL)isCurrentBssOnChannel:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WiFiUsageNetworkDetails *)self connectedBss];
  char v6 = [v5 isOnChannel:v4];

  return v6;
}

- (id)eventDictionary:(BOOL)a3
{
  BOOL v3 = a3;
  v97[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!v3)
  {
    char v6 = +[WiFiUsagePrivacyFilter localTimestamp:self->_lastJoinDate];
    [v5 setObject:v6 forKeyedSubscript:@"NetworkJoinDate"];

LABEL_9:
    [v5 setObject:self->_networkName forKeyedSubscript:@"NetworkName"];
    goto LABEL_10;
  }
  if ((self->_isPublic || self->_isCarrierBased)
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1)|| +[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall")&& +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:3])
  {
    goto LABEL_9;
  }
LABEL_10:
  if (+[WiFiUsagePrivacyFilter isInternalInstall])
  {
    v7 = [NSNumber numberWithBool:self->_isHome];
    [v5 setObject:v7 forKeyedSubscript:@"NetworkIsHome"];

    id v8 = [NSNumber numberWithBool:self->_isWork];
    [v5 setObject:v8 forKeyedSubscript:@"NetworkIsWork"];
  }
  uint64_t v9 = [NSNumber numberWithBool:self->_isKnown];
  [v5 setObject:v9 forKeyedSubscript:@"NetworkIsKnown"];

  uint64_t v10 = [NSNumber numberWithBool:self->_isOpen];
  [v5 setObject:v10 forKeyedSubscript:@"NetworkIsOpen"];

  uint64_t v11 = [NSNumber numberWithBool:self->_captiveStatus == 2];
  [v5 setObject:v11 forKeyedSubscript:@"NetworkIsCaptive"];

  v12 = [NSNumber numberWithBool:self->_isPublic];
  [v5 setObject:v12 forKeyedSubscript:@"NetworkIsPublic"];

  long long v13 = [NSNumber numberWithBool:self->_isLowQuality];
  [v5 setObject:v13 forKeyedSubscript:@"NetworkIsLowQuality"];

  long long v14 = [NSNumber numberWithBool:self->_isInternal];
  [v5 setObject:v14 forKeyedSubscript:@"NetworkIsInternal"];

  long long v15 = [NSNumber numberWithBool:self->_isManaged];
  [v5 setObject:v15 forKeyedSubscript:@"NetworkIsManaged"];

  long long v16 = [NSNumber numberWithBool:self->_isCarrierBased];
  [v5 setObject:v16 forKeyedSubscript:@"NetworkIsCarrierBased"];

  v17 = [NSNumber numberWithBool:self->_isCarPlay];
  [v5 setObject:v17 forKeyedSubscript:@"NetworkIsCarPlay"];

  uint64_t v18 = [NSNumber numberWithBool:self->_isAppBased];
  [v5 setObject:v18 forKeyedSubscript:@"NetworkIsAppBased"];

  v19 = [NSNumber numberWithBool:self->_isWalletBased];
  [v5 setObject:v19 forKeyedSubscript:@"NetworkIsWalletBased"];

  v20 = [NSNumber numberWithBool:self->_isPersonalHotspot];
  [v5 setObject:v20 forKeyedSubscript:@"NetworkIsPersonalHotspot"];

  v21 = [NSNumber numberWithBool:self->_isMoving];
  [v5 setObject:v21 forKeyedSubscript:@"NetworkIsMoving"];

  v22 = [NSNumber numberWithBool:self->_isMesh];
  [v5 setObject:v22 forKeyedSubscript:@"NetworkIsMesh"];

  v23 = [NSNumber numberWithBool:self->_isWidelyDeployed];
  [v5 setObject:v23 forKeyedSubscript:@"NetworkIsWidelyDeployed"];

  v24 = [NSNumber numberWithBool:self->_isAutoJoined];
  [v5 setObject:v24 forKeyedSubscript:@"NetworkIsAutoJoined"];

  v25 = [NSNumber numberWithBool:self->_isAdhoc];
  [v5 setObject:v25 forKeyedSubscript:@"NetworkIsAdhoc"];

  v26 = [NSNumber numberWithBool:self->_isHidden];
  [v5 setObject:v26 forKeyedSubscript:@"NetworkIsHidden"];

  v27 = [NSNumber numberWithBool:self->_isPasspoint];
  [v5 setObject:v27 forKeyedSubscript:@"NetworkIsPasspoint"];

  v28 = [NSNumber numberWithBool:self->_isMetered];
  [v5 setObject:v28 forKeyedSubscript:@"NetworkIsMetered"];

  v29 = [NSNumber numberWithBool:self->_isBlueAtlas];
  [v5 setObject:v29 forKeyedSubscript:@"NetworkIsBlueAtlas"];

  v30 = [NSNumber numberWithBool:self->_hasWapi];
  [v5 setObject:v30 forKeyedSubscript:@"NetworkHasWapi"];

  v31 = [NSNumber numberWithBool:self->_hasWeakSecurity];
  [v5 setObject:v31 forKeyedSubscript:@"NetworkHasWeakSecurity"];

  v32 = [NSNumber numberWithBool:self->_hasWpa3];
  [v5 setObject:v32 forKeyedSubscript:@"NetworkHasWpa3"];

  v33 = [NSNumber numberWithBool:self->_hasWep];
  [v5 setObject:v33 forKeyedSubscript:@"NetworkHasWep"];

  v34 = [NSNumber numberWithBool:self->_hasEnterpriseSecurity];
  [v5 setObject:v34 forKeyedSubscript:@"NetworkHasEnterpriseSecurity"];

  v35 = [NSNumber numberWithBool:self->_hasLegacyEnterpriseSecurity];
  [v5 setObject:v35 forKeyedSubscript:@"NetworkHasLegacyEnterprise"];

  v36 = [NSNumber numberWithBool:self->_hasNoMap];
  [v5 setObject:v36 forKeyedSubscript:@"NetworkHasNoMap"];

  v37 = [NSNumber numberWithBool:self->_hasAmbiguousSsid];
  [v5 setObject:v37 forKeyedSubscript:@"NetworkHasAmbiguousName"];

  v38 = [NSNumber numberWithBool:self->_hasCustomNetworkSettings];
  [v5 setObject:v38 forKeyedSubscript:@"NetworkHasCustomSettings"];

  v39 = [NSNumber numberWithBool:self->_requiresUsername];
  [v5 setObject:v39 forKeyedSubscript:@"NetworkRequiresUsername"];

  v40 = [NSNumber numberWithBool:self->_requiresPassword];
  [v5 setObject:v40 forKeyedSubscript:@"NetworkRequiresPassword"];

  v41 = [NSNumber numberWithBool:self->_requiresIdentity];
  [v5 setObject:v41 forKeyedSubscript:@"NetworkRequiresIdentity"];

  v42 = [NSNumber numberWithBool:self->_requiresOtp];
  [v5 setObject:v42 forKeyedSubscript:@"NetworkRequiresOtp"];

  v43 = [NSNumber numberWithBool:self->_canExposeImsi];
  [v5 setObject:v43 forKeyedSubscript:@"NetworkCanExposeImsi"];

  v44 = [NSNumber numberWithBool:self->_addedFromUI];
  [v5 setObject:v44 forKeyedSubscript:@"NetworkAddedFromUi"];

  v45 = [NSNumber numberWithBool:self->_addedFromApp];
  [v5 setObject:v45 forKeyedSubscript:@"NetworkAddedFromApp"];

  v46 = [NSNumber numberWithBool:self->_addedViaSync];
  [v5 setObject:v46 forKeyedSubscript:@"NetworkAddedViaSync"];

  v47 = [NSNumber numberWithBool:self->_addedViaATJ];
  [v5 setObject:v47 forKeyedSubscript:@"NetworkAddedViaAtj"];

  v48 = [NSNumber numberWithBool:self->_addedViaRecommendation];
  [v5 setObject:v48 forKeyedSubscript:@"NetworkAddedViaRecommendation"];

  v49 = [NSNumber numberWithBool:self->_addedViaSharing];
  [v5 setObject:v49 forKeyedSubscript:@"NetworkAddedViaSharing"];

  v50 = [NSNumber numberWithInteger:self->_usageRank];
  [v5 setObject:v50 forKeyedSubscript:@"NetworkUsageRank"];

  v51 = [NSNumber numberWithBool:self->_autoJoinDisabled];
  [v5 setObject:v51 forKeyedSubscript:@"NetworkAutoJoinDisabled"];

  v52 = [NSNumber numberWithBool:self->_autoLoginDisabled];
  [v5 setObject:v52 forKeyedSubscript:@"NetworkAutoLoginDisabled"];

  v53 = [NSNumber numberWithBool:self->_lowDataModeEnabled];
  [v5 setObject:v53 forKeyedSubscript:@"NetworkLowDataModeEnabled"];

  v54 = [NSNumber numberWithBool:self->_controlCenterDisabled];
  [v5 setObject:v54 forKeyedSubscript:@"NetworkControlCenterDisabled"];

  v55 = [NSNumber numberWithBool:self->_privateRelayEnabled];
  [v5 setObject:v55 forKeyedSubscript:@"NetworkPrivateRelayEnabled"];

  [v5 setObject:self->_privateRelayBlockedReason forKeyedSubscript:@"NetworkPrivateRelayBlockedReason"];
  v97[0] = self->_advertisedCountryCode;
  v56 = [NSString stringWithCString:v97 encoding:4];
  [v5 setObject:v56 forKeyedSubscript:@"NetworkCountryCodeAdvertised"];

  v97[0] = self->_appliedCountryCode;
  v57 = [NSString stringWithCString:v97 encoding:4];
  [v5 setObject:v57 forKeyedSubscript:@"NetworkCountryCodeApplied"];

  v58 = [NSNumber numberWithUnsignedInteger:self->_localeSource];
  [v5 setObject:v58 forKeyedSubscript:@"NetworkCountryCodeSource"];

  v59 = [NSNumber numberWithUnsignedInteger:self->_colocatedNetworkCount];
  [v5 setObject:v59 forKeyedSubscript:@"NetworkColocatedCount"];

  v60 = [NSNumber numberWithUnsignedInteger:self->_switchedAwayCount];
  [v5 setObject:v60 forKeyedSubscript:@"NetworkSwitchedAwayCount"];

  v61 = [NSNumber numberWithUnsignedInteger:self->_switchedToCount];
  [v5 setObject:v61 forKeyedSubscript:@"NetworkSwitchedToCount"];

  v62 = [NSNumber numberWithInteger:self->_networkScore];
  [v5 setObject:v62 forKeyedSubscript:@"NetworkScore"];

  if ([(NSMutableArray *)self->_downloadSpeedResults count])
  {
    v63 = [(NSMutableArray *)self->_downloadSpeedResults objectAtIndexedSubscript:0];
    [v5 setObject:v63 forKeyedSubscript:@"NetworkDownloadSpeed"];
  }
  [v5 setObject:self->_privateMacType forKeyedSubscript:@"NetworkPrivateMacType"];
  v64 = [NSNumber numberWithBool:self->_privateMacFeatureToggled];
  [v5 setObject:v64 forKeyedSubscript:@"NetworkPrivateMacFeatureToggled"];

  v65 = [NSNumber numberWithBool:self->_privateMacUnderClassification];
  [v5 setObject:v65 forKeyedSubscript:@"NetworkPrivateMacUnderClassification"];

  v66 = [NSNumber numberWithBool:self->_privateMacDisabledByProfile];
  [v5 setObject:v66 forKeyedSubscript:@"NetworkPrivateMacDisabledByProfile"];

  v67 = [NSNumber numberWithBool:self->_privateMacNetworkTypeHome];
  [v5 setObject:v67 forKeyedSubscript:@"NetworkPrivateMacNetworkTypeHome"];

  v68 = [NSNumber numberWithInteger:self->_usageDayTimeInLastDay];
  [v5 setObject:v68 forKeyedSubscript:@"NetworkUsageDayTimeInLastDay"];

  v69 = [NSNumber numberWithInteger:self->_usageDayTimeInLastWeek];
  [v5 setObject:v69 forKeyedSubscript:@"NetworkUsageDayTimeInLastWeek"];

  v70 = [NSNumber numberWithInteger:self->_usageDayTimeInLastMonth];
  [v5 setObject:v70 forKeyedSubscript:@"NetworkUsageDayTimeInLastMonth"];

  v71 = [NSNumber numberWithInteger:self->_usageNightTimeInLastDay];
  [v5 setObject:v71 forKeyedSubscript:@"NetworkUsageNightTimeInLastDay"];

  v72 = [NSNumber numberWithInteger:self->_usageNightTimeInLastWeek];
  [v5 setObject:v72 forKeyedSubscript:@"NetworkUsageNightTimeInLastWeek"];

  v73 = [NSNumber numberWithInteger:self->_usageNightTimeInLastMonth];
  [v5 setObject:v73 forKeyedSubscript:@"NetworkUsageNightTimeInLastMonth"];

  v74 = [NSNumber numberWithInteger:self->_usageStationaryDayTimeInLastDay];
  [v5 setObject:v74 forKeyedSubscript:@"NetworkUsageStationaryDayTimeInLastDay"];

  v75 = [NSNumber numberWithInteger:self->_usageStationaryDayTimeInLastWeek];
  [v5 setObject:v75 forKeyedSubscript:@"NetworkUsageStationaryDayTimeInLastWeek"];

  v76 = [NSNumber numberWithInteger:self->_usageStationaryDayTimeInLastMonth];
  [v5 setObject:v76 forKeyedSubscript:@"NetworkUsageStationaryDayTimeInLastMonth"];

  v77 = [NSNumber numberWithInteger:self->_usageStationaryNightTimeInLastDay];
  [v5 setObject:v77 forKeyedSubscript:@"NetworkUsageStationaryNightTimeInLastDay"];

  v78 = [NSNumber numberWithInteger:self->_usageStationaryNightTimeInLastWeek];
  [v5 setObject:v78 forKeyedSubscript:@"NetworkUsageStationaryNightTimeInLastWeek"];

  v79 = [NSNumber numberWithInteger:self->_usageStationaryNightTimeInLastMonth];
  [v5 setObject:v79 forKeyedSubscript:@"NetworkUsageStationaryNightTimeInLastMonth"];

  v80 = [NSNumber numberWithInteger:self->_usageChargingDayTimeInLastDay];
  [v5 setObject:v80 forKeyedSubscript:@"NetworkUsageChargingDayTimeInLastDay"];

  v81 = [NSNumber numberWithInteger:self->_usageChargingDayTimeInLastWeek];
  [v5 setObject:v81 forKeyedSubscript:@"NetworkUsageChargingDayTimeInLastWeek"];

  v82 = [NSNumber numberWithInteger:self->_usageChargingDayTimeInLastMonth];
  [v5 setObject:v82 forKeyedSubscript:@"NetworkUsageChargingDayTimeInLastMonth"];

  v83 = [NSNumber numberWithInteger:self->_usageChargingNightTimeInLastDay];
  [v5 setObject:v83 forKeyedSubscript:@"NetworkUsageChargingNightTimeInLastDay"];

  v84 = [NSNumber numberWithInteger:self->_usageChargingNightTimeInLastWeek];
  [v5 setObject:v84 forKeyedSubscript:@"NetworkUsageChargingNightTimeInLastWeek"];

  v85 = [NSNumber numberWithInteger:self->_usageChargingNightTimeInLastMonth];
  [v5 setObject:v85 forKeyedSubscript:@"NetworkUsageChargingNightTimeInLastMonth"];

  v86 = [NSNumber numberWithBool:self->_isAtPrimaryHMHome];
  [v5 setObject:v86 forKeyedSubscript:@"NetworkAtPrimaryHMHome"];

  v87 = [NSNumber numberWithBool:self->_isAtNonPrimaryHMHome];
  [v5 setObject:v87 forKeyedSubscript:@"NetworkAtNonPrimaryHMHome"];

  v88 = [NSNumber numberWithInteger:self->_joinSuccessCountInLastDay];
  [v5 setObject:v88 forKeyedSubscript:@"NetworkJoinSuccessCountInLastDay"];

  v89 = [NSNumber numberWithInteger:self->_joinSuccessCountInLastWeek];
  [v5 setObject:v89 forKeyedSubscript:@"NetworkJoinSuccessCountInLastWeek"];

  v90 = [NSNumber numberWithInteger:self->_joinSuccessCountInLastMonth];
  [v5 setObject:v90 forKeyedSubscript:@"NetworkJoinSuccessCountInLastMonth"];

  v91 = [NSNumber numberWithInteger:self->_joinFailCountInLastDay];
  [v5 setObject:v91 forKeyedSubscript:@"NetworkJoinFailCountInLastDay"];

  v92 = [NSNumber numberWithInteger:self->_joinFailCountInLastWeek];
  [v5 setObject:v92 forKeyedSubscript:@"NetworkJoinFailCountInLastWeek"];

  v93 = [NSNumber numberWithInteger:self->_joinFailCountInLastMonth];
  [v5 setObject:v93 forKeyedSubscript:@"NetworkJoinFailCountInLastMonth"];

  v94 = [NSNumber numberWithUnsignedInteger:self->_colocatedScopeCount];
  [v5 setObject:v94 forKeyedSubscript:@"NetworkColocatedScopeCount"];

  [v5 setObject:self->_bssEnvironment forKeyedSubscript:@"NetworkBssEnvironment"];
  [v5 setObject:self->_bssEnvironment forKeyedSubscript:@"NetworkBssEnvironmentString"];
  [v5 setObject:self->_disable6eMode forKeyedSubscript:@"NetworkDisable6EMode"];
  v95 = [(WiFiUsageBssDetails *)self->_connectedBss eventDictionary:v3];
  [v5 addEntriesFromDictionary:v95];

  return v5;
}

- (BOOL)isKnown
{
  return self->_isKnown;
}

- (void)setIsKnown:(BOOL)a3
{
  self->_isKnown = a3;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (void)setIsPublic:(BOOL)a3
{
  self->_isPublic = a3;
}

- (BOOL)isLowQuality
{
  return self->_isLowQuality;
}

- (void)setIsLowQuality:(BOOL)a3
{
  self->_isLowQuality = a3;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (void)setIsHome:(BOOL)a3
{
  self->_isHome = a3;
}

- (BOOL)isWork
{
  return self->_isWork;
}

- (void)setIsWork:(BOOL)a3
{
  self->_isWork = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (void)setIsManaged:(BOOL)a3
{
  self->_isManaged = a3;
}

- (BOOL)isCarrierBased
{
  return self->_isCarrierBased;
}

- (void)setIsCarrierBased:(BOOL)a3
{
  self->_isCarrierBased = a3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isAppBased
{
  return self->_isAppBased;
}

- (void)setIsAppBased:(BOOL)a3
{
  self->_isAppBased = a3;
}

- (BOOL)isWalletBased
{
  return self->_isWalletBased;
}

- (void)setIsWalletBased:(BOOL)a3
{
  self->_isWalletBased = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_isPersonalHotspot;
}

- (void)setIsPersonalHotspot:(BOOL)a3
{
  self->_isPersonalHotspot = a3;
}

- (BOOL)isInstantHotspot
{
  return self->_isInstantHotspot;
}

- (void)setIsInstantHotspot:(BOOL)a3
{
  self->_isInstantHotspot = a3;
}

- (BOOL)isAutoHotspot
{
  return self->_isAutoHotspot;
}

- (void)setIsAutoHotspot:(BOOL)a3
{
  self->_isAutoHotspot = a3;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

- (BOOL)isMesh
{
  return self->_isMesh;
}

- (void)setIsMesh:(BOOL)a3
{
  self->_isMesh = a3;
}

- (BOOL)isWidelyDeployed
{
  return self->_isWidelyDeployed;
}

- (void)setIsWidelyDeployed:(BOOL)a3
{
  self->_isWidelyDeployed = a3;
}

- (BOOL)isAutoJoined
{
  return self->_isAutoJoined;
}

- (void)setIsAutoJoined:(BOOL)a3
{
  self->_isAutoJoined = a3;
}

- (BOOL)isAdhoc
{
  return self->_isAdhoc;
}

- (void)setIsAdhoc:(BOOL)a3
{
  self->_isAdhoc = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (BOOL)isMetered
{
  return self->_isMetered;
}

- (void)setIsMetered:(BOOL)a3
{
  self->_isMetered = a3;
}

- (BOOL)isBlueAtlas
{
  return self->_isBlueAtlas;
}

- (void)setIsBlueAtlas:(BOOL)a3
{
  self->_isBlueAtlas = a3;
}

- (BOOL)isStandalone6E
{
  return self->_isStandalone6E;
}

- (void)setIsStandalone6E:(BOOL)a3
{
  self->_isStandalone6E = a3;
}

- (BOOL)hasWapi
{
  return self->_hasWapi;
}

- (void)setHasWapi:(BOOL)a3
{
  self->_hasWapi = a3;
}

- (BOOL)hasWeakSecurity
{
  return self->_hasWeakSecurity;
}

- (void)setHasWeakSecurity:(BOOL)a3
{
  self->_hasWeakSecurity = a3;
}

- (BOOL)hasWpa3
{
  return self->_hasWpa3;
}

- (void)setHasWpa3:(BOOL)a3
{
  self->_hasWpa3 = a3;
}

- (BOOL)hasWep
{
  return self->_hasWep;
}

- (void)setHasWep:(BOOL)a3
{
  self->_hasWep = a3;
}

- (BOOL)hasEnterpriseSecurity
{
  return self->_hasEnterpriseSecurity;
}

- (void)setHasEnterpriseSecurity:(BOOL)a3
{
  self->_hasEnterpriseSecurity = a3;
}

- (BOOL)hasLegacyEnterpriseSecurity
{
  return self->_hasLegacyEnterpriseSecurity;
}

- (void)setHasLegacyEnterpriseSecurity:(BOOL)a3
{
  self->_hasLegacyEnterpriseSecurity = a3;
}

- (BOOL)hasNoMap
{
  return self->_hasNoMap;
}

- (void)setHasNoMap:(BOOL)a3
{
  self->_hasNoMap = a3;
}

- (BOOL)hasAmbiguousSsid
{
  return self->_hasAmbiguousSsid;
}

- (void)setHasAmbiguousSsid:(BOOL)a3
{
  self->_hasAmbiguousSsid = a3;
}

- (BOOL)hasCustomNetworkSettings
{
  return self->_hasCustomNetworkSettings;
}

- (void)setHasCustomNetworkSettings:(BOOL)a3
{
  self->_hasCustomNetworkSettings = a3;
}

- (BOOL)requiresUsername
{
  return self->_requiresUsername;
}

- (void)setRequiresUsername:(BOOL)a3
{
  self->_requiresUsername = a3;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (BOOL)requiresIdentity
{
  return self->_requiresIdentity;
}

- (void)setRequiresIdentity:(BOOL)a3
{
  self->_requiresIdentity = a3;
}

- (BOOL)requiresOtp
{
  return self->_requiresOtp;
}

- (void)setRequiresOtp:(BOOL)a3
{
  self->_requiresOtp = a3;
}

- (BOOL)canExposeImsi
{
  return self->_canExposeImsi;
}

- (void)setCanExposeImsi:(BOOL)a3
{
  self->_canExposeImsi = a3;
}

- (BOOL)addedFromUI
{
  return self->_addedFromUI;
}

- (void)setAddedFromUI:(BOOL)a3
{
  self->_addedFromUI = a3;
}

- (BOOL)addedFromApp
{
  return self->_addedFromApp;
}

- (void)setAddedFromApp:(BOOL)a3
{
  self->_addedFromApp = a3;
}

- (BOOL)addedViaSync
{
  return self->_addedViaSync;
}

- (void)setAddedViaSync:(BOOL)a3
{
  self->_addedViaSync = a3;
}

- (BOOL)addedViaATJ
{
  return self->_addedViaATJ;
}

- (void)setAddedViaATJ:(BOOL)a3
{
  self->_addedViaATJ = a3;
}

- (BOOL)addedViaRecommendation
{
  return self->_addedViaRecommendation;
}

- (void)setAddedViaRecommendation:(BOOL)a3
{
  self->_addedViaRecommendation = a3;
}

- (BOOL)addedViaSharing
{
  return self->_addedViaSharing;
}

- (void)setAddedViaSharing:(BOOL)a3
{
  self->_addedViaSharing = a3;
}

- (int64_t)usageRank
{
  return self->_usageRank;
}

- (void)setUsageRank:(int64_t)a3
{
  self->_usageRank = a3;
}

- (BOOL)autoJoinDisabled
{
  return self->_autoJoinDisabled;
}

- (void)setAutoJoinDisabled:(BOOL)a3
{
  self->_autoJoinDisabled = a3;
}

- (BOOL)autoLoginDisabled
{
  return self->_autoLoginDisabled;
}

- (void)setAutoLoginDisabled:(BOOL)a3
{
  self->_autoLoginDisabled = a3;
}

- (BOOL)lowDataModeEnabled
{
  return self->_lowDataModeEnabled;
}

- (void)setLowDataModeEnabled:(BOOL)a3
{
  self->_lowDataModeEnabled = a3;
}

- (BOOL)controlCenterDisabled
{
  return self->_controlCenterDisabled;
}

- (void)setControlCenterDisabled:(BOOL)a3
{
  self->_controlCenterDisabled = a3;
}

- (BOOL)privateRelayEnabled
{
  return self->_privateRelayEnabled;
}

- (void)setPrivateRelayEnabled:(BOOL)a3
{
  self->_privateRelayEnabled = a3;
}

- (NSString)privateRelayBlockedReason
{
  return self->_privateRelayBlockedReason;
}

- (void)setPrivateRelayBlockedReason:(id)a3
{
}

- (unint64_t)advertisedCountryCode
{
  return self->_advertisedCountryCode;
}

- (void)setAdvertisedCountryCode:(unint64_t)a3
{
  self->_advertisedCountryCode = a3;
}

- (unint64_t)appliedCountryCode
{
  return self->_appliedCountryCode;
}

- (void)setAppliedCountryCode:(unint64_t)a3
{
  self->_appliedCountryCode = a3;
}

- (unint64_t)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(unint64_t)a3
{
  self->_localeSource = a3;
}

- (NSString)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(id)a3
{
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
}

- (unint64_t)colocatedNetworkCount
{
  return self->_colocatedNetworkCount;
}

- (void)setColocatedNetworkCount:(unint64_t)a3
{
  self->_colocatedNetworkCount = a3;
}

- (void)setConnectedBss:(id)a3
{
}

- (unint64_t)switchedAwayCount
{
  return self->_switchedAwayCount;
}

- (void)setSwitchedAwayCount:(unint64_t)a3
{
  self->_switchedAwayCount = a3;
}

- (unint64_t)switchedToCount
{
  return self->_switchedToCount;
}

- (void)setSwitchedToCount:(unint64_t)a3
{
  self->_switchedToCount = a3;
}

- (int64_t)networkScore
{
  return self->_networkScore;
}

- (void)setNetworkScore:(int64_t)a3
{
  self->_networkScore = a3;
}

- (NSMutableArray)downloadSpeedResults
{
  return self->_downloadSpeedResults;
}

- (void)setDownloadSpeedResults:(id)a3
{
}

- (NSDate)lastJoinDate
{
  return self->_lastJoinDate;
}

- (void)setLastJoinDate:(id)a3
{
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
}

- (BOOL)privateMacFeatureToggled
{
  return self->_privateMacFeatureToggled;
}

- (void)setPrivateMacFeatureToggled:(BOOL)a3
{
  self->_privateMacFeatureToggled = a3;
}

- (BOOL)privateMacUnderClassification
{
  return self->_privateMacUnderClassification;
}

- (void)setPrivateMacUnderClassification:(BOOL)a3
{
  self->_privateMacUnderClassification = a3;
}

- (BOOL)privateMacDisabledByProfile
{
  return self->_privateMacDisabledByProfile;
}

- (void)setPrivateMacDisabledByProfile:(BOOL)a3
{
  self->_privateMacDisabledByProfile = a3;
}

- (BOOL)privateMacNetworkTypeHome
{
  return self->_privateMacNetworkTypeHome;
}

- (void)setPrivateMacNetworkTypeHome:(BOOL)a3
{
  self->_privateMacNetworkTypeHome = a3;
}

- (unint64_t)captiveStatus
{
  return self->_captiveStatus;
}

- (void)setCaptiveStatus:(unint64_t)a3
{
  self->_captiveStatus = a3;
}

- (int64_t)usageDayTimeInLastDay
{
  return self->_usageDayTimeInLastDay;
}

- (void)setUsageDayTimeInLastDay:(int64_t)a3
{
  self->_usageDayTimeInLastDay = a3;
}

- (int64_t)usageDayTimeInLastWeek
{
  return self->_usageDayTimeInLastWeek;
}

- (void)setUsageDayTimeInLastWeek:(int64_t)a3
{
  self->_usageDayTimeInLastWeek = a3;
}

- (int64_t)usageDayTimeInLastMonth
{
  return self->_usageDayTimeInLastMonth;
}

- (void)setUsageDayTimeInLastMonth:(int64_t)a3
{
  self->_usageDayTimeInLastMonth = a3;
}

- (int64_t)usageNightTimeInLastDay
{
  return self->_usageNightTimeInLastDay;
}

- (void)setUsageNightTimeInLastDay:(int64_t)a3
{
  self->_usageNightTimeInLastDay = a3;
}

- (int64_t)usageNightTimeInLastWeek
{
  return self->_usageNightTimeInLastWeek;
}

- (void)setUsageNightTimeInLastWeek:(int64_t)a3
{
  self->_usageNightTimeInLastWeek = a3;
}

- (int64_t)usageNightTimeInLastMonth
{
  return self->_usageNightTimeInLastMonth;
}

- (void)setUsageNightTimeInLastMonth:(int64_t)a3
{
  self->_usageNightTimeInLastMonth = a3;
}

- (int64_t)usageStationaryDayTimeInLastDay
{
  return self->_usageStationaryDayTimeInLastDay;
}

- (void)setUsageStationaryDayTimeInLastDay:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastDay = a3;
}

- (int64_t)usageStationaryDayTimeInLastWeek
{
  return self->_usageStationaryDayTimeInLastWeek;
}

- (void)setUsageStationaryDayTimeInLastWeek:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastWeek = a3;
}

- (int64_t)usageStationaryDayTimeInLastMonth
{
  return self->_usageStationaryDayTimeInLastMonth;
}

- (void)setUsageStationaryDayTimeInLastMonth:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastMonth = a3;
}

- (int64_t)usageStationaryNightTimeInLastDay
{
  return self->_usageStationaryNightTimeInLastDay;
}

- (void)setUsageStationaryNightTimeInLastDay:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastDay = a3;
}

- (int64_t)usageStationaryNightTimeInLastWeek
{
  return self->_usageStationaryNightTimeInLastWeek;
}

- (void)setUsageStationaryNightTimeInLastWeek:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastWeek = a3;
}

- (int64_t)usageStationaryNightTimeInLastMonth
{
  return self->_usageStationaryNightTimeInLastMonth;
}

- (void)setUsageStationaryNightTimeInLastMonth:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastMonth = a3;
}

- (int64_t)usageChargingDayTimeInLastDay
{
  return self->_usageChargingDayTimeInLastDay;
}

- (void)setUsageChargingDayTimeInLastDay:(int64_t)a3
{
  self->_usageChargingDayTimeInLastDay = a3;
}

- (int64_t)usageChargingDayTimeInLastWeek
{
  return self->_usageChargingDayTimeInLastWeek;
}

- (void)setUsageChargingDayTimeInLastWeek:(int64_t)a3
{
  self->_usageChargingDayTimeInLastWeek = a3;
}

- (int64_t)usageChargingDayTimeInLastMonth
{
  return self->_usageChargingDayTimeInLastMonth;
}

- (void)setUsageChargingDayTimeInLastMonth:(int64_t)a3
{
  self->_usageChargingDayTimeInLastMonth = a3;
}

- (int64_t)usageChargingNightTimeInLastDay
{
  return self->_usageChargingNightTimeInLastDay;
}

- (void)setUsageChargingNightTimeInLastDay:(int64_t)a3
{
  self->_usageChargingNightTimeInLastDay = a3;
}

- (int64_t)usageChargingNightTimeInLastWeek
{
  return self->_usageChargingNightTimeInLastWeek;
}

- (void)setUsageChargingNightTimeInLastWeek:(int64_t)a3
{
  self->_usageChargingNightTimeInLastWeek = a3;
}

- (int64_t)usageChargingNightTimeInLastMonth
{
  return self->_usageChargingNightTimeInLastMonth;
}

- (void)setUsageChargingNightTimeInLastMonth:(int64_t)a3
{
  self->_usageChargingNightTimeInLastMonth = a3;
}

- (BOOL)isAtPrimaryHMHome
{
  return self->_isAtPrimaryHMHome;
}

- (void)setIsAtPrimaryHMHome:(BOOL)a3
{
  self->_isAtPrimaryHMHome = a3;
}

- (BOOL)isAtNonPrimaryHMHome
{
  return self->_isAtNonPrimaryHMHome;
}

- (void)setIsAtNonPrimaryHMHome:(BOOL)a3
{
  self->_isAtNonPrimaryHMHome = a3;
}

- (int64_t)joinSuccessCountInLastDay
{
  return self->_joinSuccessCountInLastDay;
}

- (void)setJoinSuccessCountInLastDay:(int64_t)a3
{
  self->_joinSuccessCountInLastDay = a3;
}

- (int64_t)joinSuccessCountInLastWeek
{
  return self->_joinSuccessCountInLastWeek;
}

- (void)setJoinSuccessCountInLastWeek:(int64_t)a3
{
  self->_joinSuccessCountInLastWeek = a3;
}

- (int64_t)joinSuccessCountInLastMonth
{
  return self->_joinSuccessCountInLastMonth;
}

- (void)setJoinSuccessCountInLastMonth:(int64_t)a3
{
  self->_joinSuccessCountInLastMonth = a3;
}

- (int64_t)joinFailCountInLastDay
{
  return self->_joinFailCountInLastDay;
}

- (void)setJoinFailCountInLastDay:(int64_t)a3
{
  self->_joinFailCountInLastDay = a3;
}

- (int64_t)joinFailCountInLastWeek
{
  return self->_joinFailCountInLastWeek;
}

- (void)setJoinFailCountInLastWeek:(int64_t)a3
{
  self->_joinFailCountInLastWeek = a3;
}

- (int64_t)joinFailCountInLastMonth
{
  return self->_joinFailCountInLastMonth;
}

- (void)setJoinFailCountInLastMonth:(int64_t)a3
{
  self->_joinFailCountInLastMonth = a3;
}

- (unint64_t)colocatedScopeCount
{
  return self->_colocatedScopeCount;
}

- (void)setColocatedScopeCount:(unint64_t)a3
{
  self->_colocatedScopeCount = a3;
}

- (void)setDisable6eMode:(id)a3
{
  self->_disable6eMode = (NSString *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMacType, 0);
  objc_storeStrong((id *)&self->_lastJoinDate, 0);
  objc_storeStrong((id *)&self->_downloadSpeedResults, 0);
  objc_storeStrong((id *)&self->_connectedBss, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_bssEnvironment, 0);

  objc_storeStrong((id *)&self->_privateRelayBlockedReason, 0);
}

@end