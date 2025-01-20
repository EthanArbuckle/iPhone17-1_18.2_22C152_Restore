@interface NTPBForYouTodaySectionSpecificConfig
- (BOOL)hasCutoffTime;
- (BOOL)hasFeedMaxCount;
- (BOOL)hasFetchingBin;
- (BOOL)hasHeadlinesPerFeedFetchCount;
- (BOOL)hasLocalNewsPromotionIndex;
- (BOOL)hasMinimumUpdateInterval;
- (BOOL)hasSubscriptionsFetchCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)fetchingBin;
- (unint64_t)cutoffTime;
- (unint64_t)feedMaxCount;
- (unint64_t)hash;
- (unint64_t)headlinesPerFeedFetchCount;
- (unint64_t)localNewsPromotionIndex;
- (unint64_t)minimumUpdateInterval;
- (unint64_t)subscriptionsFetchCount;
- (void)mergeFrom:(id)a3;
- (void)setCutoffTime:(unint64_t)a3;
- (void)setFeedMaxCount:(unint64_t)a3;
- (void)setFetchingBin:(int)a3;
- (void)setHasCutoffTime:(BOOL)a3;
- (void)setHasFeedMaxCount:(BOOL)a3;
- (void)setHasFetchingBin:(BOOL)a3;
- (void)setHasHeadlinesPerFeedFetchCount:(BOOL)a3;
- (void)setHasLocalNewsPromotionIndex:(BOOL)a3;
- (void)setHasMinimumUpdateInterval:(BOOL)a3;
- (void)setHasSubscriptionsFetchCount:(BOOL)a3;
- (void)setHeadlinesPerFeedFetchCount:(unint64_t)a3;
- (void)setLocalNewsPromotionIndex:(unint64_t)a3;
- (void)setMinimumUpdateInterval:(unint64_t)a3;
- (void)setSubscriptionsFetchCount:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBForYouTodaySectionSpecificConfig

- (void)setCutoffTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cutoffTime = a3;
}

- (void)setHasCutoffTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCutoffTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSubscriptionsFetchCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subscriptionsFetchCount = a3;
}

- (void)setHasSubscriptionsFetchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubscriptionsFetchCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHeadlinesPerFeedFetchCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_headlinesPerFeedFetchCount = a3;
}

- (void)setHasHeadlinesPerFeedFetchCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHeadlinesPerFeedFetchCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)fetchingBin
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_fetchingBin;
  }
  else {
    return 0;
  }
}

- (void)setFetchingBin:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_fetchingBin = a3;
}

- (void)setHasFetchingBin:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasFetchingBin
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMinimumUpdateInterval:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_minimumUpdateInterval = a3;
}

- (void)setHasMinimumUpdateInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumUpdateInterval
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLocalNewsPromotionIndex:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_localNewsPromotionIndex = a3;
}

- (void)setHasLocalNewsPromotionIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLocalNewsPromotionIndex
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFeedMaxCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_feedMaxCount = a3;
}

- (void)setHasFeedMaxCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedMaxCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBForYouTodaySectionSpecificConfig;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBForYouTodaySectionSpecificConfig description](&v3, sel_description), -[NTPBForYouTodaySectionSpecificConfig dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_cutoffTime), @"cutoff_time");
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_subscriptionsFetchCount), @"subscriptions_fetch_count");
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_headlinesPerFeedFetchCount), @"headlines_per_feed_fetch_count");
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_fetchingBin), @"fetching_bin");
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_15:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_localNewsPromotionIndex), @"local_news_promotion_index");
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v3;
    }
    goto LABEL_8;
  }
LABEL_14:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_minimumUpdateInterval), @"minimum_update_interval");
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_15;
  }
LABEL_7:
  if ((has & 2) != 0) {
LABEL_8:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_feedMaxCount), @"feed_max_count");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBForYouTodaySectionSpecificConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((has & 2) == 0) {
    return;
  }
LABEL_15:

  PBDataWriterWriteUint64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_cutoffTime;
    *((unsigned char *)result + 60) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 6) = self->_subscriptionsFetchCount;
  *((unsigned char *)result + 60) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 3) = self->_headlinesPerFeedFetchCount;
  *((unsigned char *)result + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 14) = self->_fetchingBin;
  *((unsigned char *)result + 60) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 5) = self->_minimumUpdateInterval;
  *((unsigned char *)result + 60) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((void *)result + 4) = self->_localNewsPromotionIndex;
  *((unsigned char *)result + 60) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_8:
  *((void *)result + 2) = self->_feedMaxCount;
  *((unsigned char *)result + 60) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 60) & 1) == 0 || self->_cutoffTime != *((void *)a3 + 1)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)a3 + 60))
    {
LABEL_36:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x20) == 0 || self->_subscriptionsFetchCount != *((void *)a3 + 6)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 0x20) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 4) == 0 || self->_headlinesPerFeedFetchCount != *((void *)a3 + 3)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 4) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x40) == 0 || self->_fetchingBin != *((_DWORD *)a3 + 14)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 0x40) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 0x10) == 0 || self->_minimumUpdateInterval != *((void *)a3 + 5)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 0x10) != 0)
    {
      goto LABEL_36;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 8) == 0 || self->_localNewsPromotionIndex != *((void *)a3 + 4)) {
        goto LABEL_36;
      }
    }
    else if ((*((unsigned char *)a3 + 60) & 8) != 0)
    {
      goto LABEL_36;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 60) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 60) & 2) == 0 || self->_feedMaxCount != *((void *)a3 + 2)) {
        goto LABEL_36;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_cutoffTime;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_subscriptionsFetchCount;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    unint64_t v4 = 2654435761u * self->_headlinesPerFeedFetchCount;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_fetchingBin;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    unint64_t v6 = 2654435761u * self->_minimumUpdateInterval;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    unint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
LABEL_15:
    unint64_t v8 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
  }
LABEL_13:
  unint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  unint64_t v7 = 2654435761u * self->_localNewsPromotionIndex;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_15;
  }
LABEL_8:
  unint64_t v8 = 2654435761u * self->_feedMaxCount;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 60);
  if (v3)
  {
    self->_cutoffTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 60);
    if ((v3 & 0x20) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 60) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_subscriptionsFetchCount = *((void *)a3 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v3 = *((unsigned char *)a3 + 60);
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  self->_headlinesPerFeedFetchCount = *((void *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v3 = *((unsigned char *)a3 + 60);
  if ((v3 & 0x40) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_fetchingBin = *((_DWORD *)a3 + 14);
  *(unsigned char *)&self->_has |= 0x40u;
  char v3 = *((unsigned char *)a3 + 60);
  if ((v3 & 0x10) == 0)
  {
LABEL_6:
    if ((v3 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_minimumUpdateInterval = *((void *)a3 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v3 = *((unsigned char *)a3 + 60);
  if ((v3 & 8) == 0)
  {
LABEL_7:
    if ((v3 & 2) == 0) {
      return;
    }
LABEL_15:
    self->_feedMaxCount = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
LABEL_14:
  self->_localNewsPromotionIndex = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 60) & 2) != 0) {
    goto LABEL_15;
  }
}

- (unint64_t)cutoffTime
{
  return self->_cutoffTime;
}

- (unint64_t)subscriptionsFetchCount
{
  return self->_subscriptionsFetchCount;
}

- (unint64_t)headlinesPerFeedFetchCount
{
  return self->_headlinesPerFeedFetchCount;
}

- (unint64_t)minimumUpdateInterval
{
  return self->_minimumUpdateInterval;
}

- (unint64_t)localNewsPromotionIndex
{
  return self->_localNewsPromotionIndex;
}

- (unint64_t)feedMaxCount
{
  return self->_feedMaxCount;
}

@end