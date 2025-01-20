@interface NTPBTocReorder
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasTocExposureId;
- (BOOL)hasTocNewIndex;
- (BOOL)hasTocOldIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)tocExposureId;
- (NSString)feedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)feedType;
- (int)tocNewIndex;
- (int)tocOldIndex;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasTocNewIndex:(BOOL)a3;
- (void)setHasTocOldIndex:(BOOL)a3;
- (void)setTocExposureId:(id)a3;
- (void)setTocNewIndex:(int)a3;
- (void)setTocOldIndex:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBTocReorder

- (BOOL)hasTocExposureId
{
  return self->_tocExposureId != 0;
}

- (void)setTocOldIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tocOldIndex = a3;
}

- (void)setHasTocOldIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTocOldIndex
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTocNewIndex:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_tocNewIndex = a3;
}

- (void)setHasTocNewIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTocNewIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasFeedId
{
  return self->_feedId != 0;
}

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
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264449968[a3];
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBTocReorder;
  int v4 = [(NTPBTocReorder *)&v8 description];
  v5 = [(NTPBTocReorder *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  tocExposureId = self->_tocExposureId;
  if (tocExposureId) {
    [v3 setObject:tocExposureId forKey:@"toc_exposure_id"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v7 = [NSNumber numberWithInt:self->_tocOldIndex];
    [v4 setObject:v7 forKey:@"toc_old_index"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_tocNewIndex];
    [v4 setObject:v8 forKey:@"toc_new_index"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v4 setObject:feedId forKey:@"feed_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_264449968[feedType];
    }
    [v4 setObject:v11 forKey:@"feed_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTocReorderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_tocExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_tocExposureId copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_tocOldIndex;
    *(unsigned char *)(v5 + 40) |= 4u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_tocNewIndex;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_feedId copyWithZone:a3];
  v10 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v9;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_feedType;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  tocExposureId = self->_tocExposureId;
  if ((unint64_t)tocExposureId | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](tocExposureId, "isEqual:")) {
      goto LABEL_21;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_tocOldIndex != *((_DWORD *)v4 + 9)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_tocNewIndex != *((_DWORD *)v4 + 8)) {
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_21;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:"))
    {
LABEL_21:
      BOOL v8 = 0;
      goto LABEL_22;
    }
    char has = (char)self->_has;
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_feedType != *((_DWORD *)v4 + 4)) {
      goto LABEL_21;
    }
    BOOL v8 = 1;
  }
LABEL_22:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_tocExposureId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_tocOldIndex;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_tocNewIndex;
      goto LABEL_6;
    }
  }
  uint64_t v5 = 0;
LABEL_6:
  NSUInteger v6 = [(NSString *)self->_feedId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBTocReorder setTocExposureId:](self, "setTocExposureId:");
    uint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_tocOldIndex = v4[9];
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_tocNewIndex = v4[8];
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBTocReorder setFeedId:](self, "setFeedId:");
    uint64_t v4 = v6;
  }
  if (v4[10])
  {
    self->_uint64_t feedType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)tocExposureId
{
  return self->_tocExposureId;
}

- (void)setTocExposureId:(id)a3
{
}

- (int)tocOldIndex
{
  return self->_tocOldIndex;
}

- (int)tocNewIndex
{
  return self->_tocNewIndex;
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tocExposureId, 0);

  objc_storeStrong((id *)&self->_feedId, 0);
}

@end