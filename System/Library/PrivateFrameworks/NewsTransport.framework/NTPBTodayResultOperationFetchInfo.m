@interface NTPBTodayResultOperationFetchInfo
- (BOOL)hasAppConfigTreatmentIDInteger;
- (BOOL)hasBundleIap;
- (BOOL)hasCellularRadioAccessTechnology;
- (BOOL)hasClickThroughRateByPersonalizationFeatureIDData;
- (BOOL)hasContentEnvironment;
- (BOOL)hasContentStoreFrontID;
- (BOOL)hasIsBundleSubscriber;
- (BOOL)hasLocaleIdentifier;
- (BOOL)hasOnboardingVersion;
- (BOOL)hasReachabilityStatus;
- (BOOL)hasTodaySourceIdentifier;
- (BOOL)hasUserID;
- (BOOL)hasWidgetConfig;
- (BOOL)hasWifiReachable;
- (BOOL)isBundleSubscriber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wifiReachable;
- (NSData)clickThroughRateByPersonalizationFeatureIDData;
- (NSString)bundleIap;
- (NSString)contentEnvironment;
- (NSString)contentStoreFrontID;
- (NSString)localeIdentifier;
- (NSString)todaySourceIdentifier;
- (NSString)userID;
- (NTPBTodayWidgetConfig)widgetConfig;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)userSegmentationSegmentSetIds;
- (int)userSegmentationSegmentSetIdsAtIndex:(unint64_t)a3;
- (int64_t)appConfigTreatmentIDInteger;
- (int64_t)cellularRadioAccessTechnology;
- (int64_t)onboardingVersion;
- (int64_t)reachabilityStatus;
- (int64_t)userSegmentationTreatmentIds;
- (int64_t)userSegmentationTreatmentIdsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userSegmentationSegmentSetIdsCount;
- (unint64_t)userSegmentationTreatmentIdsCount;
- (void)addUserSegmentationSegmentSetIds:(int)a3;
- (void)addUserSegmentationTreatmentIds:(int64_t)a3;
- (void)clearUserSegmentationSegmentSetIds;
- (void)clearUserSegmentationTreatmentIds;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppConfigTreatmentIDInteger:(int64_t)a3;
- (void)setBundleIap:(id)a3;
- (void)setCellularRadioAccessTechnology:(int64_t)a3;
- (void)setClickThroughRateByPersonalizationFeatureIDData:(id)a3;
- (void)setContentEnvironment:(id)a3;
- (void)setContentStoreFrontID:(id)a3;
- (void)setHasAppConfigTreatmentIDInteger:(BOOL)a3;
- (void)setHasCellularRadioAccessTechnology:(BOOL)a3;
- (void)setHasIsBundleSubscriber:(BOOL)a3;
- (void)setHasOnboardingVersion:(BOOL)a3;
- (void)setHasReachabilityStatus:(BOOL)a3;
- (void)setHasWifiReachable:(BOOL)a3;
- (void)setIsBundleSubscriber:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setOnboardingVersion:(int64_t)a3;
- (void)setReachabilityStatus:(int64_t)a3;
- (void)setTodaySourceIdentifier:(id)a3;
- (void)setUserID:(id)a3;
- (void)setUserSegmentationSegmentSetIds:(int *)a3 count:(unint64_t)a4;
- (void)setUserSegmentationTreatmentIds:(int64_t *)a3 count:(unint64_t)a4;
- (void)setWidgetConfig:(id)a3;
- (void)setWifiReachable:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTodayResultOperationFetchInfo

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayResultOperationFetchInfo;
  [(NTPBTodayResultOperationFetchInfo *)&v3 dealloc];
}

- (BOOL)hasTodaySourceIdentifier
{
  return self->_todaySourceIdentifier != 0;
}

- (void)setAppConfigTreatmentIDInteger:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_appConfigTreatmentIDInteger = a3;
}

- (void)setHasAppConfigTreatmentIDInteger:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppConfigTreatmentIDInteger
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserID
{
  return self->_userID != 0;
}

- (BOOL)hasContentStoreFrontID
{
  return self->_contentStoreFrontID != 0;
}

- (void)setWifiReachable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_wifiReachable = a3;
}

- (void)setHasWifiReachable:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWifiReachable
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCellularRadioAccessTechnology:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setReachabilityStatus:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_reachabilityStatus = a3;
}

- (void)setHasReachabilityStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReachabilityStatus
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasWidgetConfig
{
  return self->_widgetConfig != 0;
}

- (void)setOnboardingVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_onboardingVersion = a3;
}

- (void)setHasOnboardingVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOnboardingVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasClickThroughRateByPersonalizationFeatureIDData
{
  return self->_clickThroughRateByPersonalizationFeatureIDData != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
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

- (void)setIsBundleSubscriber:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isBundleSubscriber = a3;
}

- (void)setHasIsBundleSubscriber:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsBundleSubscriber
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasBundleIap
{
  return self->_bundleIap != 0;
}

- (BOOL)hasContentEnvironment
{
  return self->_contentEnvironment != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTodayResultOperationFetchInfo;
  v4 = [(NTPBTodayResultOperationFetchInfo *)&v8 description];
  v5 = [(NTPBTodayResultOperationFetchInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  todaySourceIdentifier = self->_todaySourceIdentifier;
  if (todaySourceIdentifier) {
    [v3 setObject:todaySourceIdentifier forKey:@"today_source_identifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithLongLong:self->_appConfigTreatmentIDInteger];
    [v4 setObject:v6 forKey:@"app_config_treatment_ID_integer"];
  }
  userID = self->_userID;
  if (userID) {
    [v4 setObject:userID forKey:@"user_ID"];
  }
  contentStoreFrontID = self->_contentStoreFrontID;
  if (contentStoreFrontID) {
    [v4 setObject:contentStoreFrontID forKey:@"content_store_front_ID"];
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_wifiReachable];
    [v4 setObject:v22 forKey:@"wifi_reachable"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v23 = [NSNumber numberWithLongLong:self->_cellularRadioAccessTechnology];
  [v4 setObject:v23 forKey:@"cellular_radio_access_technology"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    v10 = [NSNumber numberWithLongLong:self->_reachabilityStatus];
    [v4 setObject:v10 forKey:@"reachability_status"];
  }
LABEL_13:
  widgetConfig = self->_widgetConfig;
  if (widgetConfig)
  {
    v12 = [(NTPBTodayWidgetConfig *)widgetConfig dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"widget_config"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_onboardingVersion];
    [v4 setObject:v13 forKey:@"onboarding_version"];
  }
  clickThroughRateByPersonalizationFeatureIDData = self->_clickThroughRateByPersonalizationFeatureIDData;
  if (clickThroughRateByPersonalizationFeatureIDData) {
    [v4 setObject:clickThroughRateByPersonalizationFeatureIDData forKey:@"click_through_rate_by_personalization_feature_ID_data"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:@"locale_identifier"];
  }
  v16 = PBRepeatedInt32NSArray();
  [v4 setObject:v16 forKey:@"user_segmentation_segment_set_ids"];

  v17 = PBRepeatedInt64NSArray();
  [v4 setObject:v17 forKey:@"user_segmentation_treatment_ids"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v18 = [NSNumber numberWithBool:self->_isBundleSubscriber];
    [v4 setObject:v18 forKey:@"is_bundle_subscriber"];
  }
  bundleIap = self->_bundleIap;
  if (bundleIap) {
    [v4 setObject:bundleIap forKey:@"bundle_iap"];
  }
  contentEnvironment = self->_contentEnvironment;
  if (contentEnvironment) {
    [v4 setObject:contentEnvironment forKey:@"content_environment"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayResultOperationFetchInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_todaySourceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
  if (self->_userID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_contentStoreFrontID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v8;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
LABEL_13:
  if (self->_widgetConfig)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v8;
  }
  if (self->_clickThroughRateByPersonalizationFeatureIDData)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_userSegmentationSegmentSetIds.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v8;
      ++v6;
    }
    while (v6 < self->_userSegmentationSegmentSetIds.count);
  }
  if (self->_userSegmentationTreatmentIds.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      id v4 = v8;
      ++v7;
    }
    while (v7 < self->_userSegmentationTreatmentIds.count);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
  if (self->_bundleIap)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_contentEnvironment)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_todaySourceIdentifier copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 56) = self->_appConfigTreatmentIDInteger;
    *(unsigned char *)(v5 + 156) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_userID copyWithZone:a3];
  v9 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v8;

  uint64_t v10 = [(NSString *)self->_contentStoreFrontID copyWithZone:a3];
  v11 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v10;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 153) = self->_wifiReachable;
    *(unsigned char *)(v5 + 156) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v5 + 64) = self->_cellularRadioAccessTechnology;
  *(unsigned char *)(v5 + 156) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(void *)(v5 + 80) = self->_reachabilityStatus;
    *(unsigned char *)(v5 + 156) |= 8u;
  }
LABEL_7:
  id v13 = [(NTPBTodayWidgetConfig *)self->_widgetConfig copyWithZone:a3];
  v14 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v13;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 72) = self->_onboardingVersion;
    *(unsigned char *)(v5 + 156) |= 4u;
  }
  uint64_t v15 = [(NSData *)self->_clickThroughRateByPersonalizationFeatureIDData copyWithZone:a3];
  v16 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v15;

  uint64_t v17 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  v18 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v17;

  PBRepeatedInt32Copy();
  PBRepeatedInt64Copy();
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_isBundleSubscriber;
    *(unsigned char *)(v5 + 156) |= 0x10u;
  }
  uint64_t v19 = [(NSString *)self->_bundleIap copyWithZone:a3];
  v20 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v19;

  uint64_t v21 = [(NSString *)self->_contentEnvironment copyWithZone:a3];
  v22 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_57;
  }
  todaySourceIdentifier = self->_todaySourceIdentifier;
  if ((unint64_t)todaySourceIdentifier | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](todaySourceIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 156) & 1) == 0 || self->_appConfigTreatmentIDInteger != *((void *)v4 + 7)) {
      goto LABEL_57;
    }
  }
  else if (*((unsigned char *)v4 + 156))
  {
    goto LABEL_57;
  }
  userID = self->_userID;
  if ((unint64_t)userID | *((void *)v4 + 17) && !-[NSString isEqual:](userID, "isEqual:")) {
    goto LABEL_57;
  }
  contentStoreFrontID = self->_contentStoreFrontID;
  if ((unint64_t)contentStoreFrontID | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](contentStoreFrontID, "isEqual:")) {
      goto LABEL_57;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 0x20) == 0) {
      goto LABEL_57;
    }
    if (self->_wifiReachable)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_57;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 156) & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 2) == 0 || self->_cellularRadioAccessTechnology != *((void *)v4 + 8)) {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 156) & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 8) == 0 || self->_reachabilityStatus != *((void *)v4 + 10)) {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 156) & 8) != 0)
  {
    goto LABEL_57;
  }
  widgetConfig = self->_widgetConfig;
  if ((unint64_t)widgetConfig | *((void *)v4 + 18))
  {
    if (!-[NTPBTodayWidgetConfig isEqual:](widgetConfig, "isEqual:")) {
      goto LABEL_57;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 4) == 0 || self->_onboardingVersion != *((void *)v4 + 9)) {
      goto LABEL_57;
    }
  }
  else if ((*((unsigned char *)v4 + 156) & 4) != 0)
  {
    goto LABEL_57;
  }
  clickThroughRateByPersonalizationFeatureIDData = self->_clickThroughRateByPersonalizationFeatureIDData;
  if ((unint64_t)clickThroughRateByPersonalizationFeatureIDData | *((void *)v4 + 12)
    && !-[NSData isEqual:](clickThroughRateByPersonalizationFeatureIDData, "isEqual:"))
  {
    goto LABEL_57;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_57;
    }
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt64IsEqual()) {
    goto LABEL_57;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 156) & 0x10) != 0)
    {
      if (self->_isBundleSubscriber)
      {
        if (!*((unsigned char *)v4 + 152)) {
          goto LABEL_57;
        }
        goto LABEL_53;
      }
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_53;
      }
    }
LABEL_57:
    char v14 = 0;
    goto LABEL_58;
  }
  if ((*((unsigned char *)v4 + 156) & 0x10) != 0) {
    goto LABEL_57;
  }
LABEL_53:
  bundleIap = self->_bundleIap;
  if ((unint64_t)bundleIap | *((void *)v4 + 11) && !-[NSString isEqual:](bundleIap, "isEqual:")) {
    goto LABEL_57;
  }
  contentEnvironment = self->_contentEnvironment;
  if ((unint64_t)contentEnvironment | *((void *)v4 + 13)) {
    char v14 = -[NSString isEqual:](contentEnvironment, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_58:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v19 = [(NSString *)self->_todaySourceIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v18 = 2654435761 * self->_appConfigTreatmentIDInteger;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_userID hash];
  NSUInteger v16 = [(NSString *)self->_contentStoreFrontID hash];
  if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    uint64_t v15 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v15 = 2654435761 * self->_wifiReachable;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v3 = 2654435761 * self->_cellularRadioAccessTechnology;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_reachabilityStatus;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
LABEL_11:
  unint64_t v5 = [(NTPBTodayWidgetConfig *)self->_widgetConfig hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_onboardingVersion;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSData *)self->_clickThroughRateByPersonalizationFeatureIDData hash];
  NSUInteger v8 = [(NSString *)self->_localeIdentifier hash];
  uint64_t v9 = PBRepeatedInt32Hash();
  uint64_t v10 = PBRepeatedInt64Hash();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v11 = 2654435761 * self->_isBundleSubscriber;
  }
  else {
    uint64_t v11 = 0;
  }
  NSUInteger v12 = v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  NSUInteger v13 = v11 ^ [(NSString *)self->_bundleIap hash];
  return v12 ^ v13 ^ [(NSString *)self->_contentEnvironment hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  uint64_t v15 = v4;
  if (*((void *)v4 + 16))
  {
    -[NTPBTodayResultOperationFetchInfo setTodaySourceIdentifier:](self, "setTodaySourceIdentifier:");
    uint64_t v4 = v15;
  }
  if (v4[156])
  {
    self->_appConfigTreatmentIDInteger = *((void *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 17))
  {
    -[NTPBTodayResultOperationFetchInfo setUserID:](self, "setUserID:");
    uint64_t v4 = v15;
  }
  if (*((void *)v4 + 14))
  {
    -[NTPBTodayResultOperationFetchInfo setContentStoreFrontID:](self, "setContentStoreFrontID:");
    uint64_t v4 = v15;
  }
  BOOL v5 = v4[156];
  if ((v5 & 0x20) != 0)
  {
    self->_wifiReachable = v4[153];
    *(unsigned char *)&self->_has |= 0x20u;
    BOOL v5 = v4[156];
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v4[156] & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_cellularRadioAccessTechnology = *((void *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if ((v4[156] & 8) != 0)
  {
LABEL_12:
    self->_reachabilityStatus = *((void *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_13:
  widgetConfig = self->_widgetConfig;
  uint64_t v7 = *((void *)v4 + 18);
  if (widgetConfig)
  {
    if (!v7) {
      goto LABEL_22;
    }
    -[NTPBTodayWidgetConfig mergeFrom:](widgetConfig, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_22;
    }
    -[NTPBTodayResultOperationFetchInfo setWidgetConfig:](self, "setWidgetConfig:");
  }
  uint64_t v4 = v15;
LABEL_22:
  if ((v4[156] & 4) != 0)
  {
    self->_onboardingVersion = *((void *)v4 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 12))
  {
    -[NTPBTodayResultOperationFetchInfo setClickThroughRateByPersonalizationFeatureIDData:](self, "setClickThroughRateByPersonalizationFeatureIDData:");
    uint64_t v4 = v15;
  }
  if (*((void *)v4 + 15))
  {
    -[NTPBTodayResultOperationFetchInfo setLocaleIdentifier:](self, "setLocaleIdentifier:");
    uint64_t v4 = v15;
  }
  uint64_t v8 = [v4 userSegmentationSegmentSetIdsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
      -[NTPBTodayResultOperationFetchInfo addUserSegmentationSegmentSetIds:](self, "addUserSegmentationSegmentSetIds:", [v15 userSegmentationSegmentSetIdsAtIndex:i]);
  }
  uint64_t v11 = [v15 userSegmentationTreatmentIdsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t j = 0; j != v12; ++j)
      -[NTPBTodayResultOperationFetchInfo addUserSegmentationTreatmentIds:](self, "addUserSegmentationTreatmentIds:", [v15 userSegmentationTreatmentIdsAtIndex:j]);
  }
  char v14 = v15;
  if ((v15[156] & 0x10) != 0)
  {
    self->_isBundleSubscriber = v15[152];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v15 + 11))
  {
    -[NTPBTodayResultOperationFetchInfo setBundleIap:](self, "setBundleIap:");
    char v14 = v15;
  }
  if (*((void *)v14 + 13))
  {
    -[NTPBTodayResultOperationFetchInfo setContentEnvironment:](self, "setContentEnvironment:");
    char v14 = v15;
  }
}

- (NSString)todaySourceIdentifier
{
  return self->_todaySourceIdentifier;
}

- (void)setTodaySourceIdentifier:(id)a3
{
}

- (int64_t)appConfigTreatmentIDInteger
{
  return self->_appConfigTreatmentIDInteger;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
}

- (NSString)contentStoreFrontID
{
  return self->_contentStoreFrontID;
}

- (void)setContentStoreFrontID:(id)a3
{
}

- (BOOL)wifiReachable
{
  return self->_wifiReachable;
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (int64_t)reachabilityStatus
{
  return self->_reachabilityStatus;
}

- (NTPBTodayWidgetConfig)widgetConfig
{
  return self->_widgetConfig;
}

- (void)setWidgetConfig:(id)a3
{
}

- (int64_t)onboardingVersion
{
  return self->_onboardingVersion;
}

- (NSData)clickThroughRateByPersonalizationFeatureIDData
{
  return self->_clickThroughRateByPersonalizationFeatureIDData;
}

- (void)setClickThroughRateByPersonalizationFeatureIDData:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (BOOL)isBundleSubscriber
{
  return self->_isBundleSubscriber;
}

- (NSString)bundleIap
{
  return self->_bundleIap;
}

- (void)setBundleIap:(id)a3
{
}

- (NSString)contentEnvironment
{
  return self->_contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetConfig, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_todaySourceIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_contentStoreFrontID, 0);
  objc_storeStrong((id *)&self->_contentEnvironment, 0);
  objc_storeStrong((id *)&self->_clickThroughRateByPersonalizationFeatureIDData, 0);

  objc_storeStrong((id *)&self->_bundleIap, 0);
}

@end