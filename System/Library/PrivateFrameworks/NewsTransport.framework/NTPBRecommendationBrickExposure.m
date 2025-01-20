@interface NTPBRecommendationBrickExposure
+ (Class)recommendedFeedIdsType;
- (BOOL)exposedFromReferredUser;
- (BOOL)hasExposedFromReferredUser;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasRecommendationBrickType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recommendedFeedIds;
- (NSString)feedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)recommendationBrickTypeAsString:(int)a3;
- (id)recommendedFeedIdsAtIndex:(unint64_t)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsRecommendationBrickType:(id)a3;
- (int)feedType;
- (int)recommendationBrickType;
- (unint64_t)hash;
- (unint64_t)recommendedFeedIdsCount;
- (void)addRecommendedFeedIds:(id)a3;
- (void)clearRecommendedFeedIds;
- (void)mergeFrom:(id)a3;
- (void)setExposedFromReferredUser:(BOOL)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setHasExposedFromReferredUser:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasRecommendationBrickType:(BOOL)a3;
- (void)setRecommendationBrickType:(int)a3;
- (void)setRecommendedFeedIds:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBRecommendationBrickExposure

- (int)feedType
{
  if (*(unsigned char *)&self->_has) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26444E438[a3];
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

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

- (void)clearRecommendedFeedIds
{
}

- (void)addRecommendedFeedIds:(id)a3
{
  id v4 = a3;
  recommendedFeedIds = self->_recommendedFeedIds;
  id v8 = v4;
  if (!recommendedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recommendedFeedIds;
    self->_recommendedFeedIds = v6;

    id v4 = v8;
    recommendedFeedIds = self->_recommendedFeedIds;
  }
  [(NSMutableArray *)recommendedFeedIds addObject:v4];
}

- (unint64_t)recommendedFeedIdsCount
{
  return [(NSMutableArray *)self->_recommendedFeedIds count];
}

- (id)recommendedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recommendedFeedIds objectAtIndex:a3];
}

+ (Class)recommendedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (int)recommendationBrickType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_recommendationBrickType;
  }
  else {
    return 0;
  }
}

- (void)setRecommendationBrickType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recommendationBrickType = a3;
}

- (void)setHasRecommendationBrickType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecommendationBrickType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)recommendationBrickTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444E4E8[a3];
  }

  return v3;
}

- (int)StringAsRecommendationBrickType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_RECOMMENDATION_BRICK_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_BRICK_RECOMMENDATION_BRICK_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_BRICK_RECOMMENDATION_BRICK_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EDITORIAL_PICKS_RECOMMENDATION_BRICK_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setExposedFromReferredUser:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_exposedFromReferredUser = a3;
}

- (void)setHasExposedFromReferredUser:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasExposedFromReferredUser
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBRecommendationBrickExposure;
  int v4 = [(NTPBRecommendationBrickExposure *)&v8 description];
  v5 = [(NTPBRecommendationBrickExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444E438[feedType];
    }
    [v3 setObject:v5 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  recommendedFeedIds = self->_recommendedFeedIds;
  if (recommendedFeedIds) {
    [v3 setObject:recommendedFeedIds forKey:@"recommended_feed_ids"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t recommendationBrickType = self->_recommendationBrickType;
    if (recommendationBrickType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recommendationBrickType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_26444E4E8[recommendationBrickType];
    }
    [v3 setObject:v10 forKey:@"recommendation_brick_type"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_exposedFromReferredUser];
    [v3 setObject:v11 forKey:@"exposed_from_referred_user"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBRecommendationBrickExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_recommendedFeedIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_feedType;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v9 = self->_recommendedFeedIds;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v6 addRecommendedFeedIds:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_recommendationBrickType;
    *(unsigned char *)(v6 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(unsigned char *)(v6 + 32) = self->_exposedFromReferredUser;
    *(unsigned char *)(v6 + 36) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_feedType != *((_DWORD *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_18;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 1) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_18;
  }
  recommendedFeedIds = self->_recommendedFeedIds;
  if ((unint64_t)recommendedFeedIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](recommendedFeedIds, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_recommendationBrickType != *((_DWORD *)v4 + 5)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_18;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0)
    {
LABEL_18:
      BOOL v7 = 0;
      goto LABEL_19;
    }
    if (self->_exposedFromReferredUser)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_feedId hash];
  uint64_t v5 = [(NSMutableArray *)self->_recommendedFeedIds hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_recommendationBrickType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_exposedFromReferredUser;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  NSUInteger v4 = a3;
  id v5 = v4;
  if (v4[9])
  {
    self->_uint64_t feedType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[NTPBRecommendationBrickExposure setFeedId:](self, "setFeedId:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v5 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[NTPBRecommendationBrickExposure addRecommendedFeedIds:](self, "addRecommendedFeedIds:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  char v11 = *((unsigned char *)v5 + 36);
  if ((v11 & 2) != 0)
  {
    self->_uint64_t recommendationBrickType = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v11 = *((unsigned char *)v5 + 36);
  }
  if ((v11 & 4) != 0)
  {
    self->_exposedFromReferredUser = *((unsigned char *)v5 + 32);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (NSMutableArray)recommendedFeedIds
{
  return self->_recommendedFeedIds;
}

- (void)setRecommendedFeedIds:(id)a3
{
}

- (BOOL)exposedFromReferredUser
{
  return self->_exposedFromReferredUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recommendedFeedIds, 0);

  objc_storeStrong((id *)&self->_feedId, 0);
}

@end