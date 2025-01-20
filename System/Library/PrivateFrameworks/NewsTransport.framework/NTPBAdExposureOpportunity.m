@interface NTPBAdExposureOpportunity
- (BOOL)hasAdCreativeId;
- (BOOL)hasAdCreativeType;
- (BOOL)hasAdErrorCode;
- (BOOL)hasAdOpportunityId;
- (BOOL)hasAdSlotId;
- (BOOL)hasAdType;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasDurationInFeed;
- (BOOL)hasErrorCode;
- (BOOL)hasEventId;
- (BOOL)hasExposureLocationType;
- (BOOL)hasExposureLocationTypeId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasIsExpanded;
- (BOOL)hasIsFilled;
- (BOOL)hasIsViewable;
- (BOOL)hasResponseTime;
- (BOOL)hasScreenfulsFromTop;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isFilled;
- (BOOL)isViewable;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSString)adCreativeId;
- (NSString)adOpportunityId;
- (NSString)adSlotId;
- (NSString)eventId;
- (NSString)exposureLocationTypeId;
- (id)adCreativeTypeAsString:(int)a3;
- (id)adTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (int)StringAsAdCreativeType:(id)a3;
- (int)StringAsAdType:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)adCreativeType;
- (int)adType;
- (int)durationInFeed;
- (int)errorCode;
- (int)exposureLocationType;
- (int)feedType;
- (int)responseTime;
- (int)screenfulsFromTop;
- (int64_t)adErrorCode;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdCreativeId:(id)a3;
- (void)setAdCreativeType:(int)a3;
- (void)setAdErrorCode:(int64_t)a3;
- (void)setAdOpportunityId:(id)a3;
- (void)setAdSlotId:(id)a3;
- (void)setAdType:(int)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setDurationInFeed:(int)a3;
- (void)setErrorCode:(int)a3;
- (void)setEventId:(id)a3;
- (void)setExposureLocationType:(int)a3;
- (void)setExposureLocationTypeId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setHasAdCreativeType:(BOOL)a3;
- (void)setHasAdErrorCode:(BOOL)a3;
- (void)setHasAdType:(BOOL)a3;
- (void)setHasDurationInFeed:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasExposureLocationType:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasIsExpanded:(BOOL)a3;
- (void)setHasIsFilled:(BOOL)a3;
- (void)setHasIsViewable:(BOOL)a3;
- (void)setHasResponseTime:(BOOL)a3;
- (void)setHasScreenfulsFromTop:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsFilled:(BOOL)a3;
- (void)setIsViewable:(BOOL)a3;
- (void)setResponseTime:(int)a3;
- (void)setScreenfulsFromTop:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAdExposureOpportunity

- (void)setIsExpanded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isExpanded = a3;
}

- (void)setHasIsExpanded:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsExpanded
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsFilled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isFilled = a3;
}

- (void)setHasIsFilled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsFilled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasAdSlotId
{
  return self->_adSlotId != 0;
}

- (void)setDurationInFeed:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationInFeed = a3;
}

- (void)setHasDurationInFeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationInFeed
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setResponseTime:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_responseTime = a3;
}

- (void)setHasResponseTime:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasResponseTime
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setScreenfulsFromTop:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_screenfulsFromTop = a3;
}

- (void)setHasScreenfulsFromTop:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasScreenfulsFromTop
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)errorCode
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_errorCode;
  }
  else {
    return 0;
  }
}

- (void)setErrorCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasErrorCode
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsViewable:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_isViewable = a3;
}

- (void)setHasIsViewable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasIsViewable
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)exposureLocationType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_exposureLocationType;
  }
  else {
    return 0;
  }
}

- (void)setExposureLocationType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_exposureLocationType = a3;
}

- (void)setHasExposureLocationType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasExposureLocationType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444C7D8[a3];
  }

  return v3;
}

- (int)StringAsFeedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_FEED_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAVORITES_FEED_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CHANNEL_FEED_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SECTION_FEED_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TOPIC_FEED_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RELATED_FEED_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MORE_PUB_ARTICLES_FEED_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"READING_HISTORY_FEED_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"READING_LIST_FEED_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_FEED_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ISSUE_FEED_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LIST_FEED_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"DEBUG_FEED_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"WIDGET_FEED_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SEARCH_RESULTS_FEED_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"SYMBOL_FEED_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"CATEGORY_FEED_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_FEED_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_FEED_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasExposureLocationTypeId
{
  return self->_exposureLocationTypeId != 0;
}

- (BOOL)hasAdCreativeId
{
  return self->_adCreativeId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasAdOpportunityId
{
  return self->_adOpportunityId != 0;
}

- (BOOL)hasEventId
{
  return self->_eventId != 0;
}

- (void)setAdErrorCode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_adErrorCode = a3;
}

- (void)setHasAdErrorCode:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAdErrorCode
{
  return *(_WORD *)&self->_has & 1;
}

- (int)adType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_adType;
  }
  else {
    return 0;
  }
}

- (void)setAdType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_adType = a3;
}

- (void)setHasAdType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAdType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)adTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"NON_NATIVE_AD_TYPE";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"UNKNOWN_AD_TYPE";
  }
  return v4;
}

- (int)StringAsAdType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AD_TYPE"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"NON_NATIVE_AD_TYPE"];
  }

  return v4;
}

- (int)adCreativeType
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_adCreativeType;
  }
  else {
    return 0;
  }
}

- (void)setAdCreativeType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_adCreativeType = a3;
}

- (void)setHasAdCreativeType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdCreativeType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)adCreativeTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444C888[a3];
  }

  return v3;
}

- (int)StringAsAdCreativeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AD_CREATIVE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BANNER_AD_CREATIVE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"VIDEO_AD_CREATIVE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INTERSTITIAL_AD_CREATIVE_TYPE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)NTPBAdExposureOpportunity;
  int v4 = [(NTPBAdExposureOpportunity *)&v8 description];
  v5 = [(NTPBAdExposureOpportunity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_isExpanded];
    [v3 setObject:v5 forKey:@"is_expanded"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_isFilled];
    [v3 setObject:v6 forKey:@"is_filled"];
  }
  adSlotId = self->_adSlotId;
  if (adSlotId) {
    [v3 setObject:adSlotId forKey:@"ad_slot_id"];
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 8) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_durationInFeed];
    [v3 setObject:v9 forKey:@"duration_in_feed"];

    __int16 v8 = (__int16)self->_has;
    if ((v8 & 0x80) == 0)
    {
LABEL_9:
      if ((v8 & 0x100) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((v8 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  v10 = [NSNumber numberWithInt:self->_responseTime];
  [v3 setObject:v10 forKey:@"response_time"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x100) == 0)
  {
LABEL_10:
    if ((v8 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithInt:self->_screenfulsFromTop];
  [v3 setObject:v11 forKey:@"screenfuls_from_top"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x10) == 0)
  {
LABEL_11:
    if ((v8 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = [NSNumber numberWithInt:self->_errorCode];
  [v3 setObject:v12 forKey:@"error_code"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x800) == 0)
  {
LABEL_12:
    if ((v8 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_19:
  v13 = [NSNumber numberWithBool:self->_isViewable];
  [v3 setObject:v13 forKey:@"is_viewable"];

  __int16 v8 = (__int16)self->_has;
  if ((v8 & 0x20) == 0)
  {
LABEL_13:
    if ((v8 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }
LABEL_20:
  v14 = [NSNumber numberWithInt:self->_exposureLocationType];
  [v3 setObject:v14 forKey:@"exposure_location_type"];

  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = off_26444C7D8[feedType];
  }
  [v3 setObject:v16 forKey:@"feed_type"];

LABEL_25:
  exposureLocationTypeId = self->_exposureLocationTypeId;
  if (exposureLocationTypeId) {
    [v3 setObject:exposureLocationTypeId forKey:@"exposure_location_type_id"];
  }
  adCreativeId = self->_adCreativeId;
  if (adCreativeId) {
    [v3 setObject:adCreativeId forKey:@"ad_creative_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  adOpportunityId = self->_adOpportunityId;
  if (adOpportunityId) {
    [v3 setObject:adOpportunityId forKey:@"ad_opportunity_id"];
  }
  eventId = self->_eventId;
  if (eventId) {
    [v3 setObject:eventId forKey:@"event_id"];
  }
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 1) == 0)
  {
    if ((v23 & 4) == 0) {
      goto LABEL_39;
    }
LABEL_42:
    int adType = self->_adType;
    if (adType)
    {
      if (adType == 1)
      {
        v26 = @"NON_NATIVE_AD_TYPE";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adType);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v26 = @"UNKNOWN_AD_TYPE";
    }
    [v3 setObject:v26 forKey:@"ad_type"];

    if ((*(_WORD *)&self->_has & 2) == 0) {
      goto LABEL_52;
    }
    goto LABEL_48;
  }
  v24 = [NSNumber numberWithLongLong:self->_adErrorCode];
  [v3 setObject:v24 forKey:@"ad_error_code"];

  __int16 v23 = (__int16)self->_has;
  if ((v23 & 4) != 0) {
    goto LABEL_42;
  }
LABEL_39:
  if ((v23 & 2) != 0)
  {
LABEL_48:
    uint64_t adCreativeType = self->_adCreativeType;
    if (adCreativeType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_adCreativeType);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_26444C888[adCreativeType];
    }
    [v3 setObject:v28 forKey:@"ad_creative_type"];
  }
LABEL_52:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdExposureOpportunityReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_adSlotId) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_9:
      if ((v5 & 0x100) == 0) {
        goto LABEL_10;
      }
      goto LABEL_36;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
LABEL_13:
    if ((v5 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_14:
  }
    PBDataWriterWriteInt32Field();
LABEL_15:
  if (self->_exposureLocationTypeId) {
    PBDataWriterWriteStringField();
  }
  if (self->_adCreativeId) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_adOpportunityId) {
    PBDataWriterWriteStringField();
  }
  if (self->_eventId) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if (v6)
  {
    PBDataWriterWriteInt64Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_29:
      if ((v6 & 2) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 2) != 0) {
LABEL_30:
  }
    PBDataWriterWriteInt32Field();
LABEL_31:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 120) = self->_isExpanded;
    *(_WORD *)(v5 + 124) |= 0x200u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 121) = self->_isFilled;
    *(_WORD *)(v5 + 124) |= 0x400u;
  }
  uint64_t v8 = [(NSString *)self->_adSlotId copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_durationInFeed;
    *(_WORD *)(v6 + 124) |= 8u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_7:
      if ((v10 & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 112) = self->_responseTime;
  *(_WORD *)(v6 + 124) |= 0x80u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_8:
    if ((v10 & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(_DWORD *)(v6 + 116) = self->_screenfulsFromTop;
  *(_WORD *)(v6 + 124) |= 0x100u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x10) == 0)
  {
LABEL_9:
    if ((v10 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(_DWORD *)(v6 + 68) = self->_errorCode;
  *(_WORD *)(v6 + 124) |= 0x10u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) == 0)
  {
LABEL_10:
    if ((v10 & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(unsigned char *)(v6 + 122) = self->_isViewable;
  *(_WORD *)(v6 + 124) |= 0x800u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_11:
    if ((v10 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_23:
  *(_DWORD *)(v6 + 80) = self->_exposureLocationType;
  *(_WORD *)(v6 + 124) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_12:
    *(_DWORD *)(v6 + 96) = self->_feedType;
    *(_WORD *)(v6 + 124) |= 0x40u;
  }
LABEL_13:
  uint64_t v11 = [(NSString *)self->_exposureLocationTypeId copyWithZone:a3];
  v12 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v11;

  uint64_t v13 = [(NSString *)self->_adCreativeId copyWithZone:a3];
  v14 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v13;

  uint64_t v15 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v16 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v15;

  uint64_t v17 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v18 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v17;

  uint64_t v19 = [(NSString *)self->_adOpportunityId copyWithZone:a3];
  v20 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v19;

  uint64_t v21 = [(NSString *)self->_eventId copyWithZone:a3];
  v22 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v21;

  __int16 v23 = (__int16)self->_has;
  if ((v23 & 1) == 0)
  {
    if ((v23 & 4) == 0) {
      goto LABEL_15;
    }
LABEL_26:
    *(_DWORD *)(v6 + 48) = self->_adType;
    *(_WORD *)(v6 + 124) |= 4u;
    if ((*(_WORD *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_16;
  }
  *(void *)(v6 + 8) = self->_adErrorCode;
  *(_WORD *)(v6 + 124) |= 1u;
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 4) != 0) {
    goto LABEL_26;
  }
LABEL_15:
  if ((v23 & 2) != 0)
  {
LABEL_16:
    *(_DWORD *)(v6 + 24) = self->_adCreativeType;
    *(_WORD *)(v6 + 124) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_86;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0) {
      goto LABEL_86;
    }
    if (self->_isExpanded)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_86;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_86;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_86;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x400) == 0) {
      goto LABEL_86;
    }
    if (self->_isFilled)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_86;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_86;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x400) != 0)
  {
    goto LABEL_86;
  }
  adSlotId = self->_adSlotId;
  if ((unint64_t)adSlotId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](adSlotId, "isEqual:")) {
      goto LABEL_86;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_durationInFeed != *((_DWORD *)v4 + 16)) {
      goto LABEL_86;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_responseTime != *((_DWORD *)v4 + 28)) {
      goto LABEL_86;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) == 0 || self->_screenfulsFromTop != *((_DWORD *)v4 + 29)) {
      goto LABEL_86;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x100) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_errorCode != *((_DWORD *)v4 + 17)) {
      goto LABEL_86;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x800) != 0)
    {
      if (self->_isViewable)
      {
        if (!*((unsigned char *)v4 + 122)) {
          goto LABEL_86;
        }
        goto LABEL_49;
      }
      if (!*((unsigned char *)v4 + 122)) {
        goto LABEL_49;
      }
    }
LABEL_86:
    BOOL v16 = 0;
    goto LABEL_87;
  }
  if ((*((_WORD *)v4 + 62) & 0x800) != 0) {
    goto LABEL_86;
  }
LABEL_49:
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_exposureLocationType != *((_DWORD *)v4 + 20)) {
      goto LABEL_86;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_86;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_feedType != *((_DWORD *)v4 + 24)) {
      goto LABEL_86;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_86;
  }
  exposureLocationTypeId = self->_exposureLocationTypeId;
  if ((unint64_t)exposureLocationTypeId | *((void *)v4 + 11)
    && !-[NSString isEqual:](exposureLocationTypeId, "isEqual:"))
  {
    goto LABEL_86;
  }
  adCreativeId = self->_adCreativeId;
  if ((unint64_t)adCreativeId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](adCreativeId, "isEqual:")) {
      goto LABEL_86;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_86;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_86;
    }
  }
  adOpportunityId = self->_adOpportunityId;
  if ((unint64_t)adOpportunityId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](adOpportunityId, "isEqual:")) {
      goto LABEL_86;
    }
  }
  eventId = self->_eventId;
  if ((unint64_t)eventId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](eventId, "isEqual:")) {
      goto LABEL_86;
    }
  }
  __int16 v14 = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 62);
  if (v14)
  {
    if ((v15 & 1) == 0 || self->_adErrorCode != *((void *)v4 + 1)) {
      goto LABEL_86;
    }
  }
  else if (v15)
  {
    goto LABEL_86;
  }
  if ((v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_adType != *((_DWORD *)v4 + 12)) {
      goto LABEL_86;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_86;
  }
  if ((v14 & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_adCreativeType != *((_DWORD *)v4 + 6)) {
      goto LABEL_86;
    }
    BOOL v16 = 1;
  }
  else
  {
    BOOL v16 = (v15 & 2) == 0;
  }
LABEL_87:

  return v16;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v25 = 2654435761 * self->_isExpanded;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_isFilled;
      goto LABEL_6;
    }
  }
  uint64_t v24 = 0;
LABEL_6:
  NSUInteger v23 = [(NSString *)self->_adSlotId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v22 = 2654435761 * self->_durationInFeed;
    if ((has & 0x80) != 0)
    {
LABEL_8:
      uint64_t v21 = 2654435761 * self->_responseTime;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_9;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v22 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_9:
    uint64_t v20 = 2654435761 * self->_screenfulsFromTop;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v20 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v19 = 2654435761 * self->_errorCode;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_11;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v19 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_11:
    uint64_t v17 = 2654435761 * self->_isViewable;
    if ((has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_19:
    uint64_t v4 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_18:
  uint64_t v17 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_19;
  }
LABEL_12:
  uint64_t v4 = 2654435761 * self->_exposureLocationType;
  if ((has & 0x40) != 0)
  {
LABEL_13:
    uint64_t v5 = 2654435761 * self->_feedType;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v5 = 0;
LABEL_21:
  NSUInteger v6 = [(NSString *)self->_exposureLocationTypeId hash];
  NSUInteger v7 = [(NSString *)self->_adCreativeId hash];
  uint64_t v8 = [(NSData *)self->_feedViewExposureId hash];
  uint64_t v9 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v10 = [(NSString *)self->_adOpportunityId hash];
  NSUInteger v11 = [(NSString *)self->_eventId hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
    uint64_t v13 = 0;
    if ((v12 & 4) != 0) {
      goto LABEL_23;
    }
LABEL_26:
    uint64_t v14 = 0;
    if ((v12 & 2) != 0) {
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v15 = 0;
    return v24 ^ v25 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v23 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
  }
  uint64_t v13 = 2654435761 * self->_adErrorCode;
  if ((v12 & 4) == 0) {
    goto LABEL_26;
  }
LABEL_23:
  uint64_t v14 = 2654435761 * self->_adType;
  if ((v12 & 2) == 0) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v15 = 2654435761 * self->_adCreativeType;
  return v24 ^ v25 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v23 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 62);
  if ((v5 & 0x200) != 0)
  {
    self->_isExpanded = *((unsigned char *)v4 + 120);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v5 = *((_WORD *)v4 + 62);
  }
  if ((v5 & 0x400) != 0)
  {
    self->_isFilled = *((unsigned char *)v4 + 121);
    *(_WORD *)&self->_has |= 0x400u;
  }
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[NTPBAdExposureOpportunity setAdSlotId:](self, "setAdSlotId:");
    id v4 = v8;
  }
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 8) != 0)
  {
    self->_durationInFeed = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 8u;
    __int16 v6 = *((_WORD *)v4 + 62);
    if ((v6 & 0x80) == 0)
    {
LABEL_9:
      if ((v6 & 0x100) == 0) {
        goto LABEL_10;
      }
      goto LABEL_36;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_9;
  }
  self->_responseTime = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x100) == 0)
  {
LABEL_10:
    if ((v6 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_screenfulsFromTop = *((_DWORD *)v4 + 29);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x10) == 0)
  {
LABEL_11:
    if ((v6 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_errorCode = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x800) == 0)
  {
LABEL_12:
    if ((v6 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_isViewable = *((unsigned char *)v4 + 122);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v6 = *((_WORD *)v4 + 62);
  if ((v6 & 0x20) == 0)
  {
LABEL_13:
    if ((v6 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_39:
  self->_exposureLocationType = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 62) & 0x40) != 0)
  {
LABEL_14:
    self->_uint64_t feedType = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_15:
  if (*((void *)v4 + 11))
  {
    -[NTPBAdExposureOpportunity setExposureLocationTypeId:](self, "setExposureLocationTypeId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBAdExposureOpportunity setAdCreativeId:](self, "setAdCreativeId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 13))
  {
    -[NTPBAdExposureOpportunity setFeedViewExposureId:](self, "setFeedViewExposureId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBAdExposureOpportunity setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBAdExposureOpportunity setAdOpportunityId:](self, "setAdOpportunityId:");
    id v4 = v8;
  }
  if (*((void *)v4 + 9))
  {
    -[NTPBAdExposureOpportunity setEventId:](self, "setEventId:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 62);
  if (v7)
  {
    self->_adErrorCode = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v7 = *((_WORD *)v4 + 62);
    if ((v7 & 4) == 0)
    {
LABEL_29:
      if ((v7 & 2) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_29;
  }
  self->_int adType = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 62) & 2) != 0)
  {
LABEL_30:
    self->_uint64_t adCreativeType = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_31:
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (BOOL)isFilled
{
  return self->_isFilled;
}

- (NSString)adSlotId
{
  return self->_adSlotId;
}

- (void)setAdSlotId:(id)a3
{
}

- (int)durationInFeed
{
  return self->_durationInFeed;
}

- (int)responseTime
{
  return self->_responseTime;
}

- (int)screenfulsFromTop
{
  return self->_screenfulsFromTop;
}

- (BOOL)isViewable
{
  return self->_isViewable;
}

- (NSString)exposureLocationTypeId
{
  return self->_exposureLocationTypeId;
}

- (void)setExposureLocationTypeId:(id)a3
{
}

- (NSString)adCreativeId
{
  return self->_adCreativeId;
}

- (void)setAdCreativeId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (NSString)adOpportunityId
{
  return self->_adOpportunityId;
}

- (void)setAdOpportunityId:(id)a3
{
}

- (NSString)eventId
{
  return self->_eventId;
}

- (void)setEventId:(id)a3
{
}

- (int64_t)adErrorCode
{
  return self->_adErrorCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_exposureLocationTypeId, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_adSlotId, 0);
  objc_storeStrong((id *)&self->_adOpportunityId, 0);

  objc_storeStrong((id *)&self->_adCreativeId, 0);
}

@end