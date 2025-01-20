@interface NTPBFeedLoad
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)feedId;
- (NSString)feedViewExposureId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)feedType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedLoad

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
    v3 = off_26444CE40[a3];
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

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBFeedLoad;
  int v4 = [(NTPBFeedLoad *)&v8 description];
  v5 = [(NTPBFeedLoad *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
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
      v5 = off_26444CE40[feedType];
    }
    [v3 setObject:v5 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedLoadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_feedType;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_feedId copyWithZone:a3];
  objc_super v8 = (void *)v6[1];
  v6[1] = v7;

  uint64_t v9 = [(NSString *)self->_feedViewExposureId copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_feedType != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 1) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_11;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 3)) {
    char v7 = -[NSString isEqual:](feedViewExposureId, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

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
  NSUInteger v4 = [(NSString *)self->_feedId hash] ^ v3;
  return v4 ^ [(NSString *)self->_feedViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[8])
  {
    self->_uint64_t feedType = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBFeedLoad setFeedId:](self, "setFeedId:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBFeedLoad setFeedViewExposureId:](self, "setFeedViewExposureId:");
    NSUInteger v4 = v5;
  }
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (NSString)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);

  objc_storeStrong((id *)&self->_feedId, 0);
}

@end