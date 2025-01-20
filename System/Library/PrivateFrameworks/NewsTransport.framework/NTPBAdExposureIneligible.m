@interface NTPBAdExposureIneligible
- (BOOL)hasExposureIneligibleLocationType;
- (BOOL)hasExposureIneligibleLocationTypeId;
- (BOOL)hasExposureIneligibleReason;
- (BOOL)hasFeedType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)exposureIneligibleLocationTypeId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)exposureIneligibleLocationType;
- (int)exposureIneligibleReason;
- (int)feedType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setExposureIneligibleLocationType:(int)a3;
- (void)setExposureIneligibleLocationTypeId:(id)a3;
- (void)setExposureIneligibleReason:(int)a3;
- (void)setFeedType:(int)a3;
- (void)setHasExposureIneligibleLocationType:(BOOL)a3;
- (void)setHasExposureIneligibleReason:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAdExposureIneligible

- (int)exposureIneligibleLocationType
{
  if (*(unsigned char *)&self->_has) {
    return self->_exposureIneligibleLocationType;
  }
  else {
    return 0;
  }
}

- (void)setExposureIneligibleLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_exposureIneligibleLocationType = a3;
}

- (void)setHasExposureIneligibleLocationType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExposureIneligibleLocationType
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)feedType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264448EB0[a3];
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

- (BOOL)hasExposureIneligibleLocationTypeId
{
  return self->_exposureIneligibleLocationTypeId != 0;
}

- (int)exposureIneligibleReason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_exposureIneligibleReason;
  }
  else {
    return 0;
  }
}

- (void)setExposureIneligibleReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_exposureIneligibleReason = a3;
}

- (void)setHasExposureIneligibleReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExposureIneligibleReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAdExposureIneligible;
  int v4 = [(NTPBAdExposureIneligible *)&v8 description];
  v5 = [(NTPBAdExposureIneligible *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithInt:self->_exposureIneligibleLocationType];
    [v3 setObject:v5 forKey:@"exposure_ineligible_location_type"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_264448EB0[feedType];
    }
    [v3 setObject:v7 forKey:@"feed_type"];
  }
  exposureIneligibleLocationTypeId = self->_exposureIneligibleLocationTypeId;
  if (exposureIneligibleLocationTypeId) {
    [v3 setObject:exposureIneligibleLocationTypeId forKey:@"exposure_ineligible_location_type_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v9 = [NSNumber numberWithInt:self->_exposureIneligibleReason];
    [v3 setObject:v9 forKey:@"exposure_ineligible_reason"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAdExposureIneligibleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_exposureIneligibleLocationTypeId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_exposureIneligibleLocationType;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_feedType;
    *(unsigned char *)(v5 + 32) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_exposureIneligibleLocationTypeId copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_exposureIneligibleReason;
    *(unsigned char *)(v6 + 32) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_exposureIneligibleLocationType != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_feedType != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    goto LABEL_19;
  }
  exposureIneligibleLocationTypeId = self->_exposureIneligibleLocationTypeId;
  if ((unint64_t)exposureIneligibleLocationTypeId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](exposureIneligibleLocationTypeId, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_exposureIneligibleReason != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_exposureIneligibleLocationType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_feedType;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_exposureIneligibleLocationTypeId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_exposureIneligibleReason;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_exposureIneligibleLocationType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 4) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NTPBAdExposureIneligible setExposureIneligibleLocationTypeId:](self, "setExposureIneligibleLocationTypeId:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_exposureIneligibleReason = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)exposureIneligibleLocationTypeId
{
  return self->_exposureIneligibleLocationTypeId;
}

- (void)setExposureIneligibleLocationTypeId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end