@interface NTPBPrefetchConfig
- (BOOL)backgroundFetchEnabled;
- (BOOL)backgroundFetchEnabled2;
- (BOOL)feedPrefetchForYou;
- (BOOL)hasBackgroundFetchEnabled;
- (BOOL)hasBackgroundFetchEnabled2;
- (BOOL)hasBackgroundFetchMinimumInterval;
- (BOOL)hasFeedPrefetchFavoritesLimit;
- (BOOL)hasFeedPrefetchForYou;
- (BOOL)hasPrefetchedForYouExpiration;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)backgroundFetchMinimumInterval;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)feedPrefetchFavoritesLimit;
- (int64_t)prefetchedForYouExpiration;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBackgroundFetchEnabled2:(BOOL)a3;
- (void)setBackgroundFetchEnabled:(BOOL)a3;
- (void)setBackgroundFetchMinimumInterval:(double)a3;
- (void)setFeedPrefetchFavoritesLimit:(int64_t)a3;
- (void)setFeedPrefetchForYou:(BOOL)a3;
- (void)setHasBackgroundFetchEnabled2:(BOOL)a3;
- (void)setHasBackgroundFetchEnabled:(BOOL)a3;
- (void)setHasBackgroundFetchMinimumInterval:(BOOL)a3;
- (void)setHasFeedPrefetchFavoritesLimit:(BOOL)a3;
- (void)setHasFeedPrefetchForYou:(BOOL)a3;
- (void)setHasPrefetchedForYouExpiration:(BOOL)a3;
- (void)setPrefetchedForYouExpiration:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPrefetchConfig

- (void)setBackgroundFetchEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_backgroundFetchEnabled = a3;
}

- (void)setHasBackgroundFetchEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBackgroundFetchEnabled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBackgroundFetchMinimumInterval:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_backgroundFetchMinimumInterval = a3;
}

- (void)setHasBackgroundFetchMinimumInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackgroundFetchMinimumInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFeedPrefetchForYou:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_feedPrefetchForYou = a3;
}

- (void)setHasFeedPrefetchForYou:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasFeedPrefetchForYou
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setFeedPrefetchFavoritesLimit:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_feedPrefetchFavoritesLimit = a3;
}

- (void)setHasFeedPrefetchFavoritesLimit:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedPrefetchFavoritesLimit
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBackgroundFetchEnabled2:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_backgroundFetchEnabled2 = a3;
}

- (void)setHasBackgroundFetchEnabled2:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBackgroundFetchEnabled2
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPrefetchedForYouExpiration:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_prefetchedForYouExpiration = a3;
}

- (void)setHasPrefetchedForYouExpiration:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPrefetchedForYouExpiration
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPrefetchConfig;
  v4 = [(NTPBPrefetchConfig *)&v8 description];
  v5 = [(NTPBPrefetchConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_backgroundFetchEnabled];
    [v3 setObject:v7 forKey:@"background_fetch_enabled"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_backgroundFetchMinimumInterval];
  [v3 setObject:v8 forKey:@"background_fetch_minimum_interval"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  v9 = [NSNumber numberWithBool:self->_feedPrefetchForYou];
  [v3 setObject:v9 forKey:@"feed_prefetch_for_you"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = [NSNumber numberWithLongLong:self->_feedPrefetchFavoritesLimit];
  [v3 setObject:v10 forKey:@"feed_prefetch_favorites_limit"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  v11 = [NSNumber numberWithBool:self->_backgroundFetchEnabled2];
  [v3 setObject:v11 forKey:@"background_fetch_enabled_2"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    v5 = [NSNumber numberWithLongLong:self->_prefetchedForYouExpiration];
    [v3 setObject:v5 forKey:@"prefetched_for_you_expiration"];
  }
LABEL_8:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPrefetchConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt64Field();
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)result + 32) = self->_backgroundFetchEnabled;
    *((unsigned char *)result + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = *(void *)&self->_backgroundFetchMinimumInterval;
  *((unsigned char *)result + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((unsigned char *)result + 34) = self->_feedPrefetchForYou;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 2) = self->_feedPrefetchFavoritesLimit;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((unsigned char *)result + 33) = self->_backgroundFetchEnabled2;
  *((unsigned char *)result + 36) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_7:
  *((void *)result + 3) = self->_prefetchedForYouExpiration;
  *((unsigned char *)result + 36) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0) {
      goto LABEL_40;
    }
    if (self->_backgroundFetchEnabled)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_40;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_backgroundFetchMinimumInterval != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0) {
      goto LABEL_40;
    }
    if (self->_feedPrefetchForYou)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_feedPrefetchFavoritesLimit != *((void *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
    {
      if (self->_backgroundFetchEnabled2)
      {
        if (!*((unsigned char *)v4 + 33)) {
          goto LABEL_40;
        }
        goto LABEL_36;
      }
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_36;
      }
    }
LABEL_40:
    BOOL v5 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 36) & 0x10) != 0) {
    goto LABEL_40;
  }
LABEL_36:
  BOOL v5 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_prefetchedForYouExpiration != *((void *)v4 + 3)) {
      goto LABEL_40;
    }
    BOOL v5 = 1;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_backgroundFetchEnabled;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double backgroundFetchMinimumInterval = self->_backgroundFetchMinimumInterval;
  double v6 = -backgroundFetchMinimumInterval;
  if (backgroundFetchMinimumInterval >= 0.0) {
    double v6 = self->_backgroundFetchMinimumInterval;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_feedPrefetchForYou;
    if ((has & 2) != 0)
    {
LABEL_13:
      uint64_t v11 = 2654435761 * self->_feedPrefetchFavoritesLimit;
      if ((has & 0x10) != 0) {
        goto LABEL_14;
      }
LABEL_18:
      uint64_t v12 = 0;
      if ((has & 4) != 0) {
        goto LABEL_15;
      }
LABEL_19:
      uint64_t v13 = 0;
      return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((has & 2) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v11 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_18;
  }
LABEL_14:
  uint64_t v12 = 2654435761 * self->_backgroundFetchEnabled2;
  if ((has & 4) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v13 = 2654435761 * self->_prefetchedForYouExpiration;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_backgroundFetchEnabled = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double backgroundFetchMinimumInterval = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_feedPrefetchForYou = *((unsigned char *)v4 + 34);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_feedPrefetchFavoritesLimit = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_backgroundFetchEnabled2 = *((unsigned char *)v4 + 33);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
LABEL_7:
    self->_prefetchedForYouExpiration = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_8:
}

- (BOOL)backgroundFetchEnabled
{
  return self->_backgroundFetchEnabled;
}

- (double)backgroundFetchMinimumInterval
{
  return self->_backgroundFetchMinimumInterval;
}

- (BOOL)feedPrefetchForYou
{
  return self->_feedPrefetchForYou;
}

- (int64_t)feedPrefetchFavoritesLimit
{
  return self->_feedPrefetchFavoritesLimit;
}

- (BOOL)backgroundFetchEnabled2
{
  return self->_backgroundFetchEnabled2;
}

- (int64_t)prefetchedForYouExpiration
{
  return self->_prefetchedForYouExpiration;
}

@end