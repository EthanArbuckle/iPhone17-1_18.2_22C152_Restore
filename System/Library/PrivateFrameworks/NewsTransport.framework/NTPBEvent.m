@interface NTPBEvent
+ (Class)userPaidSubscriptionStatusType;
- (BOOL)hasAppAnalyticsEventIdentifier;
- (BOOL)hasAppAnalyticsEventPath;
- (BOOL)hasAppConfigTreatmentId;
- (BOOL)hasBundleOfferId;
- (BOOL)hasBundlePurchaseId;
- (BOOL)hasBundleSubscriptionStatus;
- (BOOL)hasCellularRadioAccessTechnology;
- (BOOL)hasDeviceOrientation;
- (BOOL)hasDuration;
- (BOOL)hasEventObject;
- (BOOL)hasGestureType;
- (BOOL)hasInterfaceOrientation;
- (BOOL)hasIsAmplifyUser;
- (BOOL)hasIsBundlePurchaser;
- (BOOL)hasIsPaidSubscriberDuringEvent;
- (BOOL)hasIsPaidSubscriberFromAppStoreDuringEvent;
- (BOOL)hasIsPaidSubscriberFromNewsDuringEvent;
- (BOOL)hasIsPaidSubscriberFromThirdPartyDuringEvent;
- (BOOL)hasNotwUserId;
- (BOOL)hasPersonalizationTreatmentId;
- (BOOL)hasPersonalizedTreatmentId;
- (BOOL)hasReachabilityStatus;
- (BOOL)hasReferringSource;
- (BOOL)hasReferringType;
- (BOOL)hasSBundlePurchaseId;
- (BOOL)hasSessionId;
- (BOOL)hasSessionIdWatch;
- (BOOL)hasStartTimestamp;
- (BOOL)hasUserId;
- (BOOL)hasUserStorefrontId;
- (BOOL)hasWidgetSessionId;
- (BOOL)hasWidgetUserId;
- (BOOL)hasWindowFrameInScreen;
- (BOOL)isAmplifyUser;
- (BOOL)isBundlePurchaser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidSubscriberDuringEvent;
- (BOOL)isPaidSubscriberFromAppStoreDuringEvent;
- (BOOL)isPaidSubscriberFromNewsDuringEvent;
- (BOOL)isPaidSubscriberFromThirdPartyDuringEvent;
- (BOOL)readFrom:(id)a3;
- (NSData)sessionId;
- (NSData)sessionIdWatch;
- (NSData)widgetSessionId;
- (NSMutableArray)userPaidSubscriptionStatus;
- (NSString)appAnalyticsEventIdentifier;
- (NSString)appAnalyticsEventPath;
- (NSString)bundleOfferId;
- (NSString)bundlePurchaseId;
- (NSString)notwUserId;
- (NSString)referringSource;
- (NSString)referringType;
- (NSString)sBundlePurchaseId;
- (NSString)userId;
- (NSString)userStorefrontId;
- (NSString)widgetUserId;
- (NSString)windowFrameInScreen;
- (NTPBEventObject)eventObject;
- (id)bundleSubscriptionStatusAsString:(int)a3;
- (id)cellularRadioAccessTechnologyAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reachabilityStatusAsString:(int)a3;
- (id)userPaidSubscriptionStatusAtIndex:(unint64_t)a3;
- (int)StringAsBundleSubscriptionStatus:(id)a3;
- (int)StringAsCellularRadioAccessTechnology:(id)a3;
- (int)StringAsReachabilityStatus:(id)a3;
- (int)bundleSubscriptionStatus;
- (int)cellularRadioAccessTechnology;
- (int)deviceOrientation;
- (int)gestureType;
- (int)interfaceOrientation;
- (int)reachabilityStatus;
- (int64_t)appConfigTreatmentId;
- (int64_t)duration;
- (int64_t)personalizationTreatmentId;
- (int64_t)personalizedTreatmentId;
- (int64_t)startTimestamp;
- (unint64_t)hash;
- (unint64_t)userPaidSubscriptionStatusCount;
- (void)addUserPaidSubscriptionStatus:(id)a3;
- (void)clearUserPaidSubscriptionStatus;
- (void)mergeFrom:(id)a3;
- (void)setAppAnalyticsEventIdentifier:(id)a3;
- (void)setAppAnalyticsEventPath:(id)a3;
- (void)setAppConfigTreatmentId:(int64_t)a3;
- (void)setBundleOfferId:(id)a3;
- (void)setBundlePurchaseId:(id)a3;
- (void)setBundleSubscriptionStatus:(int)a3;
- (void)setCellularRadioAccessTechnology:(int)a3;
- (void)setDeviceOrientation:(int)a3;
- (void)setDuration:(int64_t)a3;
- (void)setEventObject:(id)a3;
- (void)setGestureType:(int)a3;
- (void)setHasAppConfigTreatmentId:(BOOL)a3;
- (void)setHasBundleSubscriptionStatus:(BOOL)a3;
- (void)setHasCellularRadioAccessTechnology:(BOOL)a3;
- (void)setHasDeviceOrientation:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasGestureType:(BOOL)a3;
- (void)setHasInterfaceOrientation:(BOOL)a3;
- (void)setHasIsAmplifyUser:(BOOL)a3;
- (void)setHasIsBundlePurchaser:(BOOL)a3;
- (void)setHasIsPaidSubscriberDuringEvent:(BOOL)a3;
- (void)setHasIsPaidSubscriberFromAppStoreDuringEvent:(BOOL)a3;
- (void)setHasIsPaidSubscriberFromNewsDuringEvent:(BOOL)a3;
- (void)setHasIsPaidSubscriberFromThirdPartyDuringEvent:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPersonalizedTreatmentId:(BOOL)a3;
- (void)setHasReachabilityStatus:(BOOL)a3;
- (void)setHasStartTimestamp:(BOOL)a3;
- (void)setInterfaceOrientation:(int)a3;
- (void)setIsAmplifyUser:(BOOL)a3;
- (void)setIsBundlePurchaser:(BOOL)a3;
- (void)setIsPaidSubscriberDuringEvent:(BOOL)a3;
- (void)setIsPaidSubscriberFromAppStoreDuringEvent:(BOOL)a3;
- (void)setIsPaidSubscriberFromNewsDuringEvent:(BOOL)a3;
- (void)setIsPaidSubscriberFromThirdPartyDuringEvent:(BOOL)a3;
- (void)setNotwUserId:(id)a3;
- (void)setPersonalizationTreatmentId:(int64_t)a3;
- (void)setPersonalizedTreatmentId:(int64_t)a3;
- (void)setReachabilityStatus:(int)a3;
- (void)setReferringSource:(id)a3;
- (void)setReferringType:(id)a3;
- (void)setSBundlePurchaseId:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionIdWatch:(id)a3;
- (void)setStartTimestamp:(int64_t)a3;
- (void)setUserId:(id)a3;
- (void)setUserPaidSubscriptionStatus:(id)a3;
- (void)setUserStorefrontId:(id)a3;
- (void)setWidgetSessionId:(id)a3;
- (void)setWidgetUserId:(id)a3;
- (void)setWindowFrameInScreen:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEvent

- (BOOL)hasEventObject
{
  return self->_eventObject != 0;
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

- (void)setStartTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasStartTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)deviceOrientation
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_deviceOrientation;
  }
  else {
    return 0;
  }
}

- (void)setDeviceOrientation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasDeviceOrientation
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasReferringType
{
  return self->_referringType != 0;
}

- (BOOL)hasReferringSource
{
  return self->_referringSource != 0;
}

- (BOOL)hasWindowFrameInScreen
{
  return self->_windowFrameInScreen != 0;
}

- (int)gestureType
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_gestureType;
  }
  else {
    return 0;
  }
}

- (void)setGestureType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_gestureType = a3;
}

- (void)setHasGestureType:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGestureType
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (int)interfaceOrientation
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_interfaceOrientation;
  }
  else {
    return 0;
  }
}

- (void)setInterfaceOrientation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_interfaceOrientation = a3;
}

- (void)setHasInterfaceOrientation:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasInterfaceOrientation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)reachabilityStatus
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_reachabilityStatus;
  }
  else {
    return 0;
  }
}

- (void)setReachabilityStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_reachabilityStatus = a3;
}

- (void)setHasReachabilityStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasReachabilityStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)reachabilityStatusAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444E528[a3];
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
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_cellularRadioAccessTechnology;
  }
  else {
    return 0;
  }
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)cellularRadioAccessTechnologyAsString:(int)a3
{
  if (a3 >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444E550[a3];
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

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPersonalizedTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_personalizedTreatmentId = a3;
}

- (void)setHasPersonalizedTreatmentId:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPersonalizedTreatmentId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsPaidSubscriberDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isPaidSubscriberDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberDuringEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsPaidSubscriberDuringEvent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsPaidSubscriberFromNewsDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isPaidSubscriberFromNewsDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberFromNewsDuringEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsPaidSubscriberFromNewsDuringEvent
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsPaidSubscriberFromAppStoreDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPaidSubscriberFromAppStoreDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberFromAppStoreDuringEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPaidSubscriberFromAppStoreDuringEvent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsPaidSubscriberFromThirdPartyDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isPaidSubscriberFromThirdPartyDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberFromThirdPartyDuringEvent:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberFromThirdPartyDuringEvent
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasNotwUserId
{
  return self->_notwUserId != 0;
}

- (BOOL)hasSessionIdWatch
{
  return self->_sessionIdWatch != 0;
}

- (void)setAppConfigTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appConfigTreatmentId = a3;
}

- (void)setHasAppConfigTreatmentId:(BOOL)a3
{
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppConfigTreatmentId
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasWidgetSessionId
{
  return self->_widgetSessionId != 0;
}

- (void)clearUserPaidSubscriptionStatus
{
}

- (void)addUserPaidSubscriptionStatus:(id)a3
{
  id v4 = a3;
  userPaidSubscriptionStatus = self->_userPaidSubscriptionStatus;
  id v8 = v4;
  if (!userPaidSubscriptionStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_userPaidSubscriptionStatus;
    self->_userPaidSubscriptionStatus = v6;

    id v4 = v8;
    userPaidSubscriptionStatus = self->_userPaidSubscriptionStatus;
  }
  [(NSMutableArray *)userPaidSubscriptionStatus addObject:v4];
}

- (unint64_t)userPaidSubscriptionStatusCount
{
  return [(NSMutableArray *)self->_userPaidSubscriptionStatus count];
}

- (id)userPaidSubscriptionStatusAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userPaidSubscriptionStatus objectAtIndex:a3];
}

+ (Class)userPaidSubscriptionStatusType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasWidgetUserId
{
  return self->_widgetUserId != 0;
}

- (int)bundleSubscriptionStatus
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_bundleSubscriptionStatus;
  }
  else {
    return 0;
  }
}

- (void)setBundleSubscriptionStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_bundleSubscriptionStatus = a3;
}

- (void)setHasBundleSubscriptionStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBundleSubscriptionStatus
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)bundleSubscriptionStatusAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444E5C0[a3];
  }

  return v3;
}

- (int)StringAsBundleSubscriptionStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNPAID_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PAID_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NO_BUNDLE_SUBSCRIPTION_STATUS"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundlePurchaseId
{
  return self->_bundlePurchaseId != 0;
}

- (BOOL)hasBundleOfferId
{
  return self->_bundleOfferId != 0;
}

- (void)setIsBundlePurchaser:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isBundlePurchaser = a3;
}

- (void)setHasIsBundlePurchaser:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsBundlePurchaser
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasAppAnalyticsEventIdentifier
{
  return self->_appAnalyticsEventIdentifier != 0;
}

- (BOOL)hasAppAnalyticsEventPath
{
  return self->_appAnalyticsEventPath != 0;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isAmplifyUser = a3;
}

- (void)setHasIsAmplifyUser:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsAmplifyUser
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasSBundlePurchaseId
{
  return self->_sBundlePurchaseId != 0;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEvent;
  int v4 = [(NTPBEvent *)&v8 description];
  v5 = [(NTPBEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  eventObject = self->_eventObject;
  if (eventObject)
  {
    v5 = [(NTPBEventObject *)eventObject dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"event_object"];
  }
  sessionId = self->_sessionId;
  if (sessionId) {
    [v3 setObject:sessionId forKey:@"session_id"];
  }
  userId = self->_userId;
  if (userId) {
    [v3 setObject:userId forKey:@"user_id"];
  }
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId) {
    [v3 setObject:userStorefrontId forKey:@"user_storefront_id"];
  }
  $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    v30 = [NSNumber numberWithLongLong:self->_startTimestamp];
    [v3 setObject:v30 forKey:@"start_timestamp"];

    $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_11;
  }
  v31 = [NSNumber numberWithLongLong:self->_duration];
  [v3 setObject:v31 forKey:@"duration"];

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    v10 = [NSNumber numberWithInt:self->_deviceOrientation];
    [v3 setObject:v10 forKey:@"device_orientation"];
  }
LABEL_13:
  referringType = self->_referringType;
  if (referringType) {
    [v3 setObject:referringType forKey:@"referring_type"];
  }
  referringSource = self->_referringSource;
  if (referringSource) {
    [v3 setObject:referringSource forKey:@"referring_source"];
  }
  windowFrameInScreen = self->_windowFrameInScreen;
  if (windowFrameInScreen) {
    [v3 setObject:windowFrameInScreen forKey:@"window_frame_in_screen"];
  }
  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    v32 = [NSNumber numberWithInt:self->_gestureType];
    [v3 setObject:v32 forKey:@"gesture_type"];

    $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v14 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  v33 = [NSNumber numberWithInt:self->_interfaceOrientation];
  [v3 setObject:v33 forKey:@"interface_orientation"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v14 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_78;
  }
LABEL_57:
  uint64_t reachabilityStatus = self->_reachabilityStatus;
  if (reachabilityStatus >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_reachabilityStatus);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = off_26444E528[reachabilityStatus];
  }
  [v3 setObject:v35 forKey:@"reachability_status"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v14 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_82;
  }
LABEL_78:
  uint64_t cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology >= 0xE)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cellularRadioAccessTechnology);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_26444E550[cellularRadioAccessTechnology];
  }
  [v3 setObject:v46 forKey:@"cellular_radio_access_technology"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 4) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v14 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_83;
  }
LABEL_82:
  v47 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
  [v3 setObject:v47 forKey:@"personalization_treatment_id"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_84;
  }
LABEL_83:
  v48 = [NSNumber numberWithLongLong:self->_personalizedTreatmentId];
  [v3 setObject:v48 forKey:@"personalized_treatment_id"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_85;
  }
LABEL_84:
  v49 = [NSNumber numberWithBool:self->_isPaidSubscriberDuringEvent];
  [v3 setObject:v49 forKey:@"is_paid_subscriber_during_event"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_86;
  }
LABEL_85:
  v50 = [NSNumber numberWithBool:self->_isPaidSubscriberFromNewsDuringEvent];
  [v3 setObject:v50 forKey:@"is_paid_subscriber_from_news_during_event"];

  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_86:
  v51 = [NSNumber numberWithBool:self->_isPaidSubscriberFromAppStoreDuringEvent];
  [v3 setObject:v51 forKey:@"is_paid_subscriber_from_app_store_during_event"];

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_29:
    v15 = [NSNumber numberWithBool:self->_isPaidSubscriberFromThirdPartyDuringEvent];
    [v3 setObject:v15 forKey:@"is_paid_subscriber_from_third_party_during_event"];
  }
LABEL_30:
  notwUserId = self->_notwUserId;
  if (notwUserId) {
    [v3 setObject:notwUserId forKey:@"notw_user_id"];
  }
  sessionIdWatch = self->_sessionIdWatch;
  if (sessionIdWatch) {
    [v3 setObject:sessionIdWatch forKey:@"session_id_watch"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v18 = [NSNumber numberWithLongLong:self->_appConfigTreatmentId];
    [v3 setObject:v18 forKey:@"app_config_treatment_id"];
  }
  widgetSessionId = self->_widgetSessionId;
  if (widgetSessionId) {
    [v3 setObject:widgetSessionId forKey:@"widget_session_id"];
  }
  if ([(NSMutableArray *)self->_userPaidSubscriptionStatus count])
  {
    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_userPaidSubscriptionStatus, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v21 = self->_userPaidSubscriptionStatus;
    uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v53 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = [*(id *)(*((void *)&v52 + 1) + 8 * i) dictionaryRepresentation];
          [v20 addObject:v26];
        }
        uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v23);
    }

    [v3 setObject:v20 forKey:@"user_paid_subscription_status"];
  }
  widgetUserId = self->_widgetUserId;
  if (widgetUserId) {
    [v3 setObject:widgetUserId forKey:@"widget_user_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t bundleSubscriptionStatus = self->_bundleSubscriptionStatus;
    if (bundleSubscriptionStatus >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_bundleSubscriptionStatus);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_26444E5C0[bundleSubscriptionStatus];
    }
    [v3 setObject:v29 forKey:@"bundle_subscription_status"];
  }
  bundlePurchaseId = self->_bundlePurchaseId;
  if (bundlePurchaseId) {
    [v3 setObject:bundlePurchaseId forKey:@"bundle_purchase_id"];
  }
  bundleOfferId = self->_bundleOfferId;
  if (bundleOfferId) {
    [v3 setObject:bundleOfferId forKey:@"bundle_offer_id"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    v38 = [NSNumber numberWithBool:self->_isBundlePurchaser];
    [v3 setObject:v38 forKey:@"is_bundle_purchaser"];
  }
  appAnalyticsEventIdentifier = self->_appAnalyticsEventIdentifier;
  if (appAnalyticsEventIdentifier) {
    [v3 setObject:appAnalyticsEventIdentifier forKey:@"app_analytics_event_identifier"];
  }
  appAnalyticsEventPath = self->_appAnalyticsEventPath;
  if (appAnalyticsEventPath) {
    [v3 setObject:appAnalyticsEventPath forKey:@"app_analytics_event_path"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    v41 = [NSNumber numberWithBool:self->_isAmplifyUser];
    [v3 setObject:v41 forKey:@"is_amplify_user"];
  }
  sBundlePurchaseId = self->_sBundlePurchaseId;
  if (sBundlePurchaseId) {
    [v3 setObject:sBundlePurchaseId forKey:@"s_bundle_purchase_id"];
  }
  id v43 = v3;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_eventObject) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_userId) {
    PBDataWriterWriteStringField();
  }
  if (self->_userStorefrontId) {
    PBDataWriterWriteStringField();
  }
  $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_11:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_referringType) {
    PBDataWriterWriteStringField();
  }
  if (self->_referringSource) {
    PBDataWriterWriteStringField();
  }
  if (self->_windowFrameInScreen) {
    PBDataWriterWriteStringField();
  }
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x400) == 0) {
        goto LABEL_22;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt64Field();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  $D741C7B20A104483CE535A1F820EC5B8 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
LABEL_29:
  }
    PBDataWriterWriteBOOLField();
LABEL_30:
  if (self->_notwUserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sessionIdWatch) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_widgetSessionId) {
    PBDataWriterWriteDataField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v7 = self->_userPaidSubscriptionStatus;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (self->_widgetUserId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bundlePurchaseId) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleOfferId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_appAnalyticsEventIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_appAnalyticsEventPath) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sBundlePurchaseId) {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBEventObject *)self->_eventObject copyWithZone:a3];
  v7 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v6;

  uint64_t v8 = [(NSData *)self->_sessionId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v8;

  uint64_t v10 = [(NSString *)self->_userId copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v10;

  uint64_t v12 = [(NSString *)self->_userStorefrontId copyWithZone:a3];
  long long v13 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v12;

  $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_startTimestamp;
    *(_DWORD *)(v5 + 224) |= 0x10u;
    $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x80) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_duration;
  *(_DWORD *)(v5 + 224) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 88) = self->_deviceOrientation;
    *(_DWORD *)(v5 + 224) |= 0x80u;
  }
LABEL_5:
  uint64_t v15 = [(NSString *)self->_referringType copyWithZone:a3];
  v16 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v15;

  uint64_t v17 = [(NSString *)self->_referringSource copyWithZone:a3];
  v18 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v17;

  uint64_t v19 = [(NSString *)self->_windowFrameInScreen copyWithZone:a3];
  v20 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v19;

  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_gestureType;
    *(_DWORD *)(v5 + 224) |= 0x100u;
    $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v21 & 0x400) == 0) {
        goto LABEL_8;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&v21 & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 108) = self->_interfaceOrientation;
  *(_DWORD *)(v5 + 224) |= 0x200u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x400) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&v21 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 120) = self->_reachabilityStatus;
  *(_DWORD *)(v5 + 224) |= 0x400u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 0x40) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&v21 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 84) = self->_cellularRadioAccessTechnology;
  *(_DWORD *)(v5 + 224) |= 0x40u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 4) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v21 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(void *)(v5 + 24) = self->_personalizationTreatmentId;
  *(_DWORD *)(v5 + 224) |= 4u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 8) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v21 & 0x2000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(void *)(v5 + 32) = self->_personalizedTreatmentId;
  *(_DWORD *)(v5 + 224) |= 8u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v21 & 0x8000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(unsigned char *)(v5 + 218) = self->_isPaidSubscriberDuringEvent;
  *(_DWORD *)(v5 + 224) |= 0x2000u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v21 & 0x4000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(unsigned char *)(v5 + 220) = self->_isPaidSubscriberFromNewsDuringEvent;
  *(_DWORD *)(v5 + 224) |= 0x8000u;
  $D741C7B20A104483CE535A1F820EC5B8 v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v21 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_43:
  *(unsigned char *)(v5 + 219) = self->_isPaidSubscriberFromAppStoreDuringEvent;
  *(_DWORD *)(v5 + 224) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_15:
    *(unsigned char *)(v5 + 221) = self->_isPaidSubscriberFromThirdPartyDuringEvent;
    *(_DWORD *)(v5 + 224) |= 0x10000u;
  }
LABEL_16:
  uint64_t v22 = [(NSString *)self->_notwUserId copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v22;

  uint64_t v24 = [(NSData *)self->_sessionIdWatch copyWithZone:a3];
  v25 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v24;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_appConfigTreatmentId;
    *(_DWORD *)(v5 + 224) |= 1u;
  }
  uint64_t v26 = [(NSData *)self->_widgetSessionId copyWithZone:a3];
  v27 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v26;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v28 = self->_userPaidSubscriptionStatus;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v32), "copyWithZone:", a3, (void)v47);
        [(id)v5 addUserPaidSubscriptionStatus:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [(NSString *)self->_widgetUserId copyWithZone:a3];
  v35 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v34;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_bundleSubscriptionStatus;
    *(_DWORD *)(v5 + 224) |= 0x20u;
  }
  uint64_t v36 = -[NSString copyWithZone:](self->_bundlePurchaseId, "copyWithZone:", a3, (void)v47);
  v37 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v36;

  uint64_t v38 = [(NSString *)self->_bundleOfferId copyWithZone:a3];
  v39 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v38;

  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 217) = self->_isBundlePurchaser;
    *(_DWORD *)(v5 + 224) |= 0x1000u;
  }
  uint64_t v40 = [(NSString *)self->_appAnalyticsEventIdentifier copyWithZone:a3];
  v41 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v40;

  uint64_t v42 = [(NSString *)self->_appAnalyticsEventPath copyWithZone:a3];
  id v43 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v42;

  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *(unsigned char *)(v5 + 216) = self->_isAmplifyUser;
    *(_DWORD *)(v5 + 224) |= 0x800u;
  }
  uint64_t v44 = [(NSString *)self->_sBundlePurchaseId copyWithZone:a3];
  v45 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v44;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_133;
  }
  eventObject = self->_eventObject;
  if ((unint64_t)eventObject | *((void *)v4 + 12))
  {
    if (!-[NTPBEventObject isEqual:](eventObject, "isEqual:")) {
      goto LABEL_133;
    }
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](sessionId, "isEqual:")) {
      goto LABEL_133;
    }
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](userId, "isEqual:")) {
      goto LABEL_133;
    }
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:")) {
      goto LABEL_133;
    }
  }
  $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
  int v10 = *((_DWORD *)v4 + 56);
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_startTimestamp != *((void *)v4 + 5)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_duration != *((void *)v4 + 2)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_deviceOrientation != *((_DWORD *)v4 + 22)) {
      goto LABEL_133;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  referringType = self->_referringType;
  if ((unint64_t)referringType | *((void *)v4 + 17)
    && !-[NSString isEqual:](referringType, "isEqual:"))
  {
    goto LABEL_133;
  }
  referringSource = self->_referringSource;
  if ((unint64_t)referringSource | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](referringSource, "isEqual:")) {
      goto LABEL_133;
    }
  }
  windowFrameInScreen = self->_windowFrameInScreen;
  if ((unint64_t)windowFrameInScreen | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](windowFrameInScreen, "isEqual:")) {
      goto LABEL_133;
    }
  }
  $D741C7B20A104483CE535A1F820EC5B8 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 56);
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_gestureType != *((_DWORD *)v4 + 26)) {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_interfaceOrientation != *((_DWORD *)v4 + 27)) {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_reachabilityStatus != *((_DWORD *)v4 + 30)) {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)v4 + 21)) {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 3)) {
      goto LABEL_133;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_133;
  }
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_personalizedTreatmentId != *((void *)v4 + 4)) {
      goto LABEL_133;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0) {
      goto LABEL_133;
    }
    if (self->_isPaidSubscriberDuringEvent)
    {
      if (!*((unsigned char *)v4 + 218)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 218))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0) {
      goto LABEL_133;
    }
    if (self->_isPaidSubscriberFromNewsDuringEvent)
    {
      if (!*((unsigned char *)v4 + 220)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 220))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0) {
      goto LABEL_133;
    }
    if (self->_isPaidSubscriberFromAppStoreDuringEvent)
    {
      if (!*((unsigned char *)v4 + 219)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 219))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0) {
      goto LABEL_133;
    }
    if (self->_isPaidSubscriberFromThirdPartyDuringEvent)
    {
      if (!*((unsigned char *)v4 + 221)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 221))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_133;
  }
  notwUserId = self->_notwUserId;
  if ((unint64_t)notwUserId | *((void *)v4 + 14)
    && !-[NSString isEqual:](notwUserId, "isEqual:"))
  {
    goto LABEL_133;
  }
  sessionIdWatch = self->_sessionIdWatch;
  if ((unint64_t)sessionIdWatch | *((void *)v4 + 20))
  {
    if (!-[NSData isEqual:](sessionIdWatch, "isEqual:")) {
      goto LABEL_133;
    }
  }
  int v18 = *((_DWORD *)v4 + 56);
  if (*(unsigned char *)&self->_has)
  {
    if ((v18 & 1) == 0 || self->_appConfigTreatmentId != *((void *)v4 + 1)) {
      goto LABEL_133;
    }
  }
  else if (v18)
  {
    goto LABEL_133;
  }
  widgetSessionId = self->_widgetSessionId;
  if ((unint64_t)widgetSessionId | *((void *)v4 + 24)
    && !-[NSData isEqual:](widgetSessionId, "isEqual:"))
  {
    goto LABEL_133;
  }
  userPaidSubscriptionStatus = self->_userPaidSubscriptionStatus;
  if ((unint64_t)userPaidSubscriptionStatus | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](userPaidSubscriptionStatus, "isEqual:")) {
      goto LABEL_133;
    }
  }
  widgetUserId = self->_widgetUserId;
  if ((unint64_t)widgetUserId | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](widgetUserId, "isEqual:")) {
      goto LABEL_133;
    }
  }
  int v22 = *((_DWORD *)v4 + 56);
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_bundleSubscriptionStatus != *((_DWORD *)v4 + 20)) {
      goto LABEL_133;
    }
  }
  else if ((v22 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  bundlePurchaseId = self->_bundlePurchaseId;
  if ((unint64_t)bundlePurchaseId | *((void *)v4 + 9)
    && !-[NSString isEqual:](bundlePurchaseId, "isEqual:"))
  {
    goto LABEL_133;
  }
  bundleOfferId = self->_bundleOfferId;
  if ((unint64_t)bundleOfferId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](bundleOfferId, "isEqual:")) {
      goto LABEL_133;
    }
  }
  int v25 = *((_DWORD *)v4 + 56);
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v25 & 0x1000) == 0) {
      goto LABEL_133;
    }
    if (self->_isBundlePurchaser)
    {
      if (!*((unsigned char *)v4 + 217)) {
        goto LABEL_133;
      }
    }
    else if (*((unsigned char *)v4 + 217))
    {
      goto LABEL_133;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_133;
  }
  appAnalyticsEventIdentifier = self->_appAnalyticsEventIdentifier;
  if ((unint64_t)appAnalyticsEventIdentifier | *((void *)v4 + 6)
    && !-[NSString isEqual:](appAnalyticsEventIdentifier, "isEqual:"))
  {
    goto LABEL_133;
  }
  appAnalyticsEventPath = self->_appAnalyticsEventPath;
  if ((unint64_t)appAnalyticsEventPath | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](appAnalyticsEventPath, "isEqual:")) {
      goto LABEL_133;
    }
  }
  int v28 = *((_DWORD *)v4 + 56);
  if ((*((unsigned char *)&self->_has + 1) & 8) == 0)
  {
    if ((v28 & 0x800) == 0) {
      goto LABEL_139;
    }
LABEL_133:
    char v29 = 0;
    goto LABEL_134;
  }
  if ((v28 & 0x800) == 0) {
    goto LABEL_133;
  }
  if (!self->_isAmplifyUser)
  {
    if (!*((unsigned char *)v4 + 216)) {
      goto LABEL_139;
    }
    goto LABEL_133;
  }
  if (!*((unsigned char *)v4 + 216)) {
    goto LABEL_133;
  }
LABEL_139:
  sBundlePurchaseId = self->_sBundlePurchaseId;
  if ((unint64_t)sBundlePurchaseId | *((void *)v4 + 18)) {
    char v29 = -[NSString isEqual:](sBundlePurchaseId, "isEqual:");
  }
  else {
    char v29 = 1;
  }
LABEL_134:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v38 = [(NTPBEventObject *)self->_eventObject hash];
  uint64_t v37 = [(NSData *)self->_sessionId hash];
  NSUInteger v36 = [(NSString *)self->_userId hash];
  NSUInteger v35 = [(NSString *)self->_userStorefrontId hash];
  $D741C7B20A104483CE535A1F820EC5B8 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
    uint64_t v34 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v33 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v34 = 2654435761 * self->_startTimestamp;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v33 = 2654435761 * self->_duration;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v32 = 2654435761 * self->_deviceOrientation;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v32 = 0;
LABEL_8:
  NSUInteger v31 = [(NSString *)self->_referringType hash];
  NSUInteger v30 = [(NSString *)self->_referringSource hash];
  NSUInteger v29 = [(NSString *)self->_windowFrameInScreen hash];
  $D741C7B20A104483CE535A1F820EC5B8 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    uint64_t v28 = 2654435761 * self->_gestureType;
    if ((*(_WORD *)&v4 & 0x200) != 0)
    {
LABEL_10:
      uint64_t v27 = 2654435761 * self->_interfaceOrientation;
      if ((*(_WORD *)&v4 & 0x400) != 0) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_10;
    }
  }
  uint64_t v27 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_11:
    uint64_t v26 = 2654435761 * self->_reachabilityStatus;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v26 = 0;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_12:
    uint64_t v25 = 2654435761 * self->_cellularRadioAccessTechnology;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v25 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_13:
    uint64_t v24 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_14;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v24 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_14:
    uint64_t v23 = 2654435761 * self->_personalizedTreatmentId;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_15:
    uint64_t v22 = 2654435761 * self->_isPaidSubscriberDuringEvent;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v22 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_16:
    uint64_t v21 = 2654435761 * self->_isPaidSubscriberFromNewsDuringEvent;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_17;
    }
LABEL_27:
    uint64_t v20 = 0;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_28;
  }
LABEL_26:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0) {
    goto LABEL_27;
  }
LABEL_17:
  uint64_t v20 = 2654435761 * self->_isPaidSubscriberFromAppStoreDuringEvent;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v19 = 2654435761 * self->_isPaidSubscriberFromThirdPartyDuringEvent;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v19 = 0;
LABEL_29:
  NSUInteger v18 = [(NSString *)self->_notwUserId hash];
  uint64_t v17 = [(NSData *)self->_sessionIdWatch hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v16 = 2654435761 * self->_appConfigTreatmentId;
  }
  else {
    uint64_t v16 = 0;
  }
  uint64_t v15 = [(NSData *)self->_widgetSessionId hash];
  uint64_t v5 = [(NSMutableArray *)self->_userPaidSubscriptionStatus hash];
  NSUInteger v6 = [(NSString *)self->_widgetUserId hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v7 = 2654435761 * self->_bundleSubscriptionStatus;
  }
  else {
    uint64_t v7 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_bundlePurchaseId hash];
  NSUInteger v9 = [(NSString *)self->_bundleOfferId hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v10 = 2654435761 * self->_isBundlePurchaser;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_appAnalyticsEventIdentifier hash];
  NSUInteger v12 = [(NSString *)self->_appAnalyticsEventPath hash];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    uint64_t v13 = 2654435761 * self->_isAmplifyUser;
  }
  else {
    uint64_t v13 = 0;
  }
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSString *)self->_sBundlePurchaseId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  eventObject = self->_eventObject;
  uint64_t v6 = *((void *)v4 + 12);
  if (eventObject)
  {
    if (v6) {
      -[NTPBEventObject mergeFrom:](eventObject, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[NTPBEvent setEventObject:](self, "setEventObject:");
  }
  if (*((void *)v4 + 19)) {
    -[NTPBEvent setSessionId:](self, "setSessionId:");
  }
  if (*((void *)v4 + 21)) {
    -[NTPBEvent setUserId:](self, "setUserId:");
  }
  if (*((void *)v4 + 23)) {
    -[NTPBEvent setUserStorefrontId:](self, "setUserStorefrontId:");
  }
  int v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x10) != 0)
  {
    self->_startTimestamp = *((void *)v4 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
    int v7 = *((_DWORD *)v4 + 56);
    if ((v7 & 2) == 0)
    {
LABEL_14:
      if ((v7 & 0x80) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_14;
  }
  self->_duration = *((void *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 56) & 0x80) != 0)
  {
LABEL_15:
    self->_deviceOrientation = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_16:
  if (*((void *)v4 + 17)) {
    -[NTPBEvent setReferringType:](self, "setReferringType:");
  }
  if (*((void *)v4 + 16)) {
    -[NTPBEvent setReferringSource:](self, "setReferringSource:");
  }
  if (*((void *)v4 + 26)) {
    -[NTPBEvent setWindowFrameInScreen:](self, "setWindowFrameInScreen:");
  }
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x100) != 0)
  {
    self->_gestureType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x100u;
    int v8 = *((_DWORD *)v4 + 56);
    if ((v8 & 0x200) == 0)
    {
LABEL_24:
      if ((v8 & 0x400) == 0) {
        goto LABEL_25;
      }
      goto LABEL_72;
    }
  }
  else if ((v8 & 0x200) == 0)
  {
    goto LABEL_24;
  }
  self->_interfaceOrientation = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x200u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x400) == 0)
  {
LABEL_25:
    if ((v8 & 0x40) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_uint64_t reachabilityStatus = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x400u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x40) == 0)
  {
LABEL_26:
    if ((v8 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_uint64_t cellularRadioAccessTechnology = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 4) == 0)
  {
LABEL_27:
    if ((v8 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_personalizationTreatmentId = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 8) == 0)
  {
LABEL_28:
    if ((v8 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_personalizedTreatmentId = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x2000) == 0)
  {
LABEL_29:
    if ((v8 & 0x8000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_isPaidSubscriberDuringEvent = *((unsigned char *)v4 + 218);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x8000) == 0)
  {
LABEL_30:
    if ((v8 & 0x4000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_isPaidSubscriberFromNewsDuringEvent = *((unsigned char *)v4 + 220);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x4000) == 0)
  {
LABEL_31:
    if ((v8 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_78:
  self->_isPaidSubscriberFromAppStoreDuringEvent = *((unsigned char *)v4 + 219);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 56) & 0x10000) != 0)
  {
LABEL_32:
    self->_isPaidSubscriberFromThirdPartyDuringEvent = *((unsigned char *)v4 + 221);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_33:
  if (*((void *)v4 + 14)) {
    -[NTPBEvent setNotwUserId:](self, "setNotwUserId:");
  }
  if (*((void *)v4 + 20)) {
    -[NTPBEvent setSessionIdWatch:](self, "setSessionIdWatch:");
  }
  if (*((unsigned char *)v4 + 224))
  {
    self->_appConfigTreatmentId = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 24)) {
    -[NTPBEvent setWidgetSessionId:](self, "setWidgetSessionId:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v4 + 22);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[NTPBEvent addUserPaidSubscriptionStatus:](self, "addUserPaidSubscriptionStatus:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  if (*((void *)v4 + 25)) {
    -[NTPBEvent setWidgetUserId:](self, "setWidgetUserId:");
  }
  if ((*((unsigned char *)v4 + 224) & 0x20) != 0)
  {
    self->_uint64_t bundleSubscriptionStatus = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 9)) {
    -[NTPBEvent setBundlePurchaseId:](self, "setBundlePurchaseId:");
  }
  if (*((void *)v4 + 8)) {
    -[NTPBEvent setBundleOfferId:](self, "setBundleOfferId:");
  }
  if ((*((unsigned char *)v4 + 225) & 0x10) != 0)
  {
    self->_isBundlePurchaser = *((unsigned char *)v4 + 217);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v4 + 6)) {
    -[NTPBEvent setAppAnalyticsEventIdentifier:](self, "setAppAnalyticsEventIdentifier:");
  }
  if (*((void *)v4 + 7)) {
    -[NTPBEvent setAppAnalyticsEventPath:](self, "setAppAnalyticsEventPath:");
  }
  if ((*((unsigned char *)v4 + 225) & 8) != 0)
  {
    self->_isAmplifyUser = *((unsigned char *)v4 + 216);
    *(_DWORD *)&self->_has |= 0x800u;
  }
  if (*((void *)v4 + 18)) {
    -[NTPBEvent setSBundlePurchaseId:](self, "setSBundlePurchaseId:");
  }
}

- (NTPBEventObject)eventObject
{
  return self->_eventObject;
}

- (void)setEventObject:(id)a3
{
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

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (int64_t)duration
{
  return self->_duration;
}

- (NSString)referringType
{
  return self->_referringType;
}

- (void)setReferringType:(id)a3
{
}

- (NSString)referringSource
{
  return self->_referringSource;
}

- (void)setReferringSource:(id)a3
{
}

- (NSString)windowFrameInScreen
{
  return self->_windowFrameInScreen;
}

- (void)setWindowFrameInScreen:(id)a3
{
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (int64_t)personalizedTreatmentId
{
  return self->_personalizedTreatmentId;
}

- (BOOL)isPaidSubscriberDuringEvent
{
  return self->_isPaidSubscriberDuringEvent;
}

- (BOOL)isPaidSubscriberFromNewsDuringEvent
{
  return self->_isPaidSubscriberFromNewsDuringEvent;
}

- (BOOL)isPaidSubscriberFromAppStoreDuringEvent
{
  return self->_isPaidSubscriberFromAppStoreDuringEvent;
}

- (BOOL)isPaidSubscriberFromThirdPartyDuringEvent
{
  return self->_isPaidSubscriberFromThirdPartyDuringEvent;
}

- (NSString)notwUserId
{
  return self->_notwUserId;
}

- (void)setNotwUserId:(id)a3
{
}

- (NSData)sessionIdWatch
{
  return self->_sessionIdWatch;
}

- (void)setSessionIdWatch:(id)a3
{
}

- (int64_t)appConfigTreatmentId
{
  return self->_appConfigTreatmentId;
}

- (NSData)widgetSessionId
{
  return self->_widgetSessionId;
}

- (void)setWidgetSessionId:(id)a3
{
}

- (NSMutableArray)userPaidSubscriptionStatus
{
  return self->_userPaidSubscriptionStatus;
}

- (void)setUserPaidSubscriptionStatus:(id)a3
{
}

- (NSString)widgetUserId
{
  return self->_widgetUserId;
}

- (void)setWidgetUserId:(id)a3
{
}

- (NSString)bundlePurchaseId
{
  return self->_bundlePurchaseId;
}

- (void)setBundlePurchaseId:(id)a3
{
}

- (NSString)bundleOfferId
{
  return self->_bundleOfferId;
}

- (void)setBundleOfferId:(id)a3
{
}

- (BOOL)isBundlePurchaser
{
  return self->_isBundlePurchaser;
}

- (NSString)appAnalyticsEventIdentifier
{
  return self->_appAnalyticsEventIdentifier;
}

- (void)setAppAnalyticsEventIdentifier:(id)a3
{
}

- (NSString)appAnalyticsEventPath
{
  return self->_appAnalyticsEventPath;
}

- (void)setAppAnalyticsEventPath:(id)a3
{
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSString)sBundlePurchaseId
{
  return self->_sBundlePurchaseId;
}

- (void)setSBundlePurchaseId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowFrameInScreen, 0);
  objc_storeStrong((id *)&self->_widgetUserId, 0);
  objc_storeStrong((id *)&self->_widgetSessionId, 0);
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userPaidSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessionIdWatch, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_sBundlePurchaseId, 0);
  objc_storeStrong((id *)&self->_referringType, 0);
  objc_storeStrong((id *)&self->_referringSource, 0);
  objc_storeStrong((id *)&self->_notwUserId, 0);
  objc_storeStrong((id *)&self->_eventObject, 0);
  objc_storeStrong((id *)&self->_bundlePurchaseId, 0);
  objc_storeStrong((id *)&self->_bundleOfferId, 0);
  objc_storeStrong((id *)&self->_appAnalyticsEventPath, 0);

  objc_storeStrong((id *)&self->_appAnalyticsEventIdentifier, 0);
}

@end