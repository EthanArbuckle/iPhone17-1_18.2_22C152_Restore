@interface NTPBDiscoverMoreInterstitialExposure
- (BOOL)hasNextArticleAffordanceType;
- (BOOL)hasTappedNextArticleAffordanceFeedId;
- (BOOL)hasUserAction;
- (BOOL)hasWithNextArticleAffordance;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)withNextArticleAffordance;
- (NSString)tappedNextArticleAffordanceFeedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)nextArticleAffordanceTypeAsString:(int)a3;
- (int)StringAsNextArticleAffordanceType:(id)a3;
- (int)nextArticleAffordanceType;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasNextArticleAffordanceType:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setHasWithNextArticleAffordance:(BOOL)a3;
- (void)setNextArticleAffordanceType:(int)a3;
- (void)setTappedNextArticleAffordanceFeedId:(id)a3;
- (void)setUserAction:(int)a3;
- (void)setWithNextArticleAffordance:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBDiscoverMoreInterstitialExposure

- (int)userAction
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserAction
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWithNextArticleAffordance:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_withNextArticleAffordance = a3;
}

- (void)setHasWithNextArticleAffordance:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWithNextArticleAffordance
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)nextArticleAffordanceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_nextArticleAffordanceType;
  }
  else {
    return 0;
  }
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNextArticleAffordanceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C300[a3];
  }

  return v3;
}

- (int)StringAsNextArticleAffordanceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISCOVER_MORE_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NEWS_SPOTLIGHT_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_PUB_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NEWS_EDITORS_PICKS_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TOPIC_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DAILY_BRIEFINGS_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GREAT_STORIES_YOU_MISSED_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAVED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_FOR_YOU_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTION_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LATEST_AND_GREATEST_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FEATURED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LATEST_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasTappedNextArticleAffordanceFeedId
{
  return self->_tappedNextArticleAffordanceFeedId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBDiscoverMoreInterstitialExposure;
  int v4 = [(NTPBDiscoverMoreInterstitialExposure *)&v8 description];
  v5 = [(NTPBDiscoverMoreInterstitialExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v5 forKey:@"user_action"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithBool:self->_withNextArticleAffordance];
  [v3 setObject:v6 forKey:@"with_next_article_affordance"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nextArticleAffordanceType);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_26444C300[nextArticleAffordanceType];
  }
  [v3 setObject:v8 forKey:@"next_article_affordance_type"];

LABEL_11:
  tappedNextArticleAffordanceFeedId = self->_tappedNextArticleAffordanceFeedId;
  if (tappedNextArticleAffordanceFeedId) {
    [v3 setObject:tappedNextArticleAffordanceFeedId forKey:@"tapped_next_article_affordance_feed_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBDiscoverMoreInterstitialExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_tappedNextArticleAffordanceFeedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(unsigned char *)(v5 + 28) = self->_withNextArticleAffordance;
    *(unsigned char *)(v5 + 32) |= 4u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_userAction;
  *(unsigned char *)(v5 + 32) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 8) = self->_nextArticleAffordanceType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_tappedNextArticleAffordanceFeedId copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_userAction != *((_DWORD *)v4 + 6)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) != 0)
    {
      if (self->_withNextArticleAffordance)
      {
        if (!*((unsigned char *)v4 + 28)) {
          goto LABEL_22;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_15;
      }
    }
LABEL_22:
    char v6 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 32) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_15:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_22;
  }
  tappedNextArticleAffordanceFeedId = self->_tappedNextArticleAffordanceFeedId;
  if ((unint64_t)tappedNextArticleAffordanceFeedId | *((void *)v4 + 2)) {
    char v6 = -[NSString isEqual:](tappedNextArticleAffordanceFeedId, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_tappedNextArticleAffordanceFeedId hash];
  }
  uint64_t v2 = 2654435761 * self->_userAction;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_withNextArticleAffordance;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_nextArticleAffordanceType;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_tappedNextArticleAffordanceFeedId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_withNextArticleAffordance = *((unsigned char *)v4 + 28);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 32))
  {
LABEL_4:
    self->_uint64_t nextArticleAffordanceType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NTPBDiscoverMoreInterstitialExposure setTappedNextArticleAffordanceFeedId:](self, "setTappedNextArticleAffordanceFeedId:");
    id v4 = v6;
  }
}

- (BOOL)withNextArticleAffordance
{
  return self->_withNextArticleAffordance;
}

- (NSString)tappedNextArticleAffordanceFeedId
{
  return self->_tappedNextArticleAffordanceFeedId;
}

- (void)setTappedNextArticleAffordanceFeedId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end