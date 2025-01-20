@interface NTPBLinkTap
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasGroupType;
- (BOOL)hasLinkType;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasTapLocationType;
- (BOOL)hasTappedLinkUrl;
- (BOOL)hasWebEmbedId;
- (BOOL)hasWebEmbedLocation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSString)articleId;
- (NSString)referencedArticleId;
- (NSString)tappedLinkUrl;
- (NSString)webEmbedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypeAsString:(int)a3;
- (id)webEmbedLocationAsString:(int)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsWebEmbedLocation:(id)a3;
- (int)groupType;
- (int)linkType;
- (int)tapLocationType;
- (int)webEmbedLocation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasLinkType:(BOOL)a3;
- (void)setHasTapLocationType:(BOOL)a3;
- (void)setHasWebEmbedLocation:(BOOL)a3;
- (void)setLinkType:(int)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setTapLocationType:(int)a3;
- (void)setTappedLinkUrl:(id)a3;
- (void)setWebEmbedId:(id)a3;
- (void)setWebEmbedLocation:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLinkTap

- (int)tapLocationType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_tapLocationType;
  }
  else {
    return 0;
  }
}

- (void)setTapLocationType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_tapLocationType = a3;
}

- (void)setHasTapLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTapLocationType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasTappedLinkUrl
{
  return self->_tappedLinkUrl != 0;
}

- (BOOL)hasWebEmbedId
{
  return self->_webEmbedId != 0;
}

- (int)webEmbedLocation
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_webEmbedLocation;
  }
  else {
    return 0;
  }
}

- (void)setWebEmbedLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_webEmbedLocation = a3;
}

- (void)setHasWebEmbedLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWebEmbedLocation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)webEmbedLocationAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444F688[a3];
  }

  return v3;
}

- (int)StringAsWebEmbedLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WEB_EMBED_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IN_MODULE_WEB_EMBED_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_WEB_EMBED_LOCATION"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)linkType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_linkType;
  }
  else {
    return 0;
  }
}

- (void)setLinkType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_linkType = a3;
}

- (void)setHasLinkType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLinkType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)groupType
{
  if (*(unsigned char *)&self->_has) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGroupType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444F6A0[a3];
  }

  return v3;
}

- (int)StringAsGroupType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_GROUP_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_STORIES_GROUP_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LATEST_STORIES_GROUP_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOPIC_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_GROUP_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_TOPIC_GROUP_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHANNEL_ARTICLES_GROUP_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DAILY_BRIEFINGS_GROUP_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GREAT_STORIES_YOU_MISSED_GROUP_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAVED_STORIES_GROUP_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTION_GROUP_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LATEST_AND_GREATEST_GROUP_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"SUGGESTED_TOPICS_GROUP_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FEATURED_STORIES_GROUP_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TOP_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MORE_VIDEOS_GROUP_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"SYMBOL_GROUP_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"RECIRCULATION_GROUP_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_PUB_GROUP_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"RELATED_GROUP_TYPE"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"MY_MAGAZINES_GROUP_TYPE"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_GROUP_TYPE"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"ISSUES_GROUP_TYPE"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"FEATURED_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"FEATURED_ISSUE_ARTICLE_GROUP_TYPE"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RECOMMENDED_ISSUES_GROUP_TYPE"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"NEW_ISSUE_GROUP_TYPE"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_GROUP_TYPE"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"ORDERED_ARTICLE_LIST_GROUP_TYPE"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"BEST_OF_BUNDLE_GROUP_TYPE"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"CURATED_GROUP_TYPE"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NEWSPAPER_GROUP_TYPE"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"LOCAL_NEWS_GROUP_TYPE"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"AUDIO_UP_NEXT_GROUP_TYPE"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"AUDIO_FOR_YOU_GROUP_TYPE"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"AUDIO_RECENTLY_PLAYED_GROUP_TYPE"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"AUDIO_DAILY_BRIEFING_GROUP_TYPE"])
  {
    int v4 = 39;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBLinkTap;
  int v4 = [(NTPBLinkTap *)&v8 description];
  v5 = [(NTPBLinkTap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int v4 = [NSNumber numberWithInt:self->_tapLocationType];
    [v3 setObject:v4 forKey:@"tap_location_type"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v3 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  tappedLinkUrl = self->_tappedLinkUrl;
  if (tappedLinkUrl) {
    [v3 setObject:tappedLinkUrl forKey:@"tapped_link_url"];
  }
  webEmbedId = self->_webEmbedId;
  if (webEmbedId) {
    [v3 setObject:webEmbedId forKey:@"web_embed_id"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t webEmbedLocation = self->_webEmbedLocation;
    if (webEmbedLocation >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_webEmbedLocation);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26444F688[webEmbedLocation];
    }
    [v3 setObject:v11 forKey:@"web_embed_location"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_24;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  v12 = [NSNumber numberWithInt:self->_linkType];
  [v3 setObject:v12 forKey:@"link_type"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_24;
  }
LABEL_20:
  uint64_t groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444F6A0[groupType];
  }
  [v3 setObject:v14 forKey:@"group_type"];

LABEL_24:
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLinkTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_referencedArticleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_tappedLinkUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_webEmbedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_15:
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_tapLocationType;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_articleId copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  uint64_t v9 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_tappedLinkUrl copyWithZone:a3];
  v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  uint64_t v13 = [(NSString *)self->_webEmbedId copyWithZone:a3];
  v14 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v13;

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 28) = self->_linkType;
    *(unsigned char *)(v6 + 68) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 64) = self->_webEmbedLocation;
  *(unsigned char *)(v6 + 68) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    *(_DWORD *)(v6 + 24) = self->_groupType;
    *(unsigned char *)(v6 + 68) |= 1u;
  }
LABEL_7:
  uint64_t v16 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v17 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v16;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_tapLocationType != *((_DWORD *)v4 + 10)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
LABEL_32:
    char v10 = 0;
    goto LABEL_33;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_32;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  tappedLinkUrl = self->_tappedLinkUrl;
  if ((unint64_t)tappedLinkUrl | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](tappedLinkUrl, "isEqual:")) {
      goto LABEL_32;
    }
  }
  webEmbedId = self->_webEmbedId;
  if ((unint64_t)webEmbedId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](webEmbedId, "isEqual:")) {
      goto LABEL_32;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_webEmbedLocation != *((_DWORD *)v4 + 16)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_linkType != *((_DWORD *)v4 + 7)) {
      goto LABEL_32;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_32;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 6)) {
      goto LABEL_32;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_32;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 2)) {
    char v10 = -[NSData isEqual:](articleViewingSessionId, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_33:

  return v10;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_tapLocationType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  NSUInteger v5 = [(NSString *)self->_referencedArticleId hash];
  NSUInteger v6 = [(NSString *)self->_tappedLinkUrl hash];
  NSUInteger v7 = [(NSString *)self->_webEmbedId hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v9 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSData *)self->_articleViewingSessionId hash];
  }
  uint64_t v8 = 2654435761 * self->_webEmbedLocation;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_linkType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v10 = 2654435761 * self->_groupType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSData *)self->_articleViewingSessionId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if ((v4[17] & 4) != 0)
  {
    self->_tapLocationType = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
  NSUInteger v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[NTPBLinkTap setArticleId:](self, "setArticleId:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBLinkTap setReferencedArticleId:](self, "setReferencedArticleId:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBLinkTap setTappedLinkUrl:](self, "setTappedLinkUrl:");
    NSUInteger v4 = v6;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBLinkTap setWebEmbedId:](self, "setWebEmbedId:");
    NSUInteger v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 8) != 0)
  {
    self->_uint64_t webEmbedLocation = v4[16];
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 2) == 0)
    {
LABEL_13:
      if ((v5 & 1) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((v4[17] & 2) == 0)
  {
    goto LABEL_13;
  }
  self->_linkType = v4[7];
  *(unsigned char *)&self->_has |= 2u;
  if (v4[17])
  {
LABEL_14:
    self->_uint64_t groupType = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_15:
  if (*((void *)v4 + 2))
  {
    -[NTPBLinkTap setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    NSUInteger v4 = v6;
  }
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)referencedArticleId
{
  return self->_referencedArticleId;
}

- (void)setReferencedArticleId:(id)a3
{
}

- (NSString)tappedLinkUrl
{
  return self->_tappedLinkUrl;
}

- (void)setTappedLinkUrl:(id)a3
{
}

- (NSString)webEmbedId
{
  return self->_webEmbedId;
}

- (void)setWebEmbedId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webEmbedId, 0);
  objc_storeStrong((id *)&self->_tappedLinkUrl, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end