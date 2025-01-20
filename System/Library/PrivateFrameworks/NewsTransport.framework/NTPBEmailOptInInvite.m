@interface NTPBEmailOptInInvite
- (BOOL)hasArticleId;
- (BOOL)hasEmailOptInInviteLocation;
- (BOOL)hasNewsletterSubscriptionType;
- (BOOL)hasParentFeedId;
- (BOOL)hasParentFeedType;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)articleId;
- (NSString)parentFeedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)parentFeedTypeAsString:(int)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)emailOptInInviteLocation;
- (int)newsletterSubscriptionType;
- (int)parentFeedType;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setEmailOptInInviteLocation:(int)a3;
- (void)setHasEmailOptInInviteLocation:(BOOL)a3;
- (void)setHasNewsletterSubscriptionType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setNewsletterSubscriptionType:(int)a3;
- (void)setParentFeedId:(id)a3;
- (void)setParentFeedType:(int)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBEmailOptInInvite

- (int)userAction
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasUserAction
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)emailOptInInviteLocation
{
  if (*(unsigned char *)&self->_has) {
    return self->_emailOptInInviteLocation;
  }
  else {
    return 0;
  }
}

- (void)setEmailOptInInviteLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_emailOptInInviteLocation = a3;
}

- (void)setHasEmailOptInInviteLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEmailOptInInviteLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)parentFeedType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444D808[a3];
  }

  return v3;
}

- (int)StringAsParentFeedType:(id)a3
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

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (int)newsletterSubscriptionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_newsletterSubscriptionType;
  }
  else {
    return 0;
  }
}

- (void)setNewsletterSubscriptionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_newsletterSubscriptionType = a3;
}

- (void)setHasNewsletterSubscriptionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewsletterSubscriptionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBEmailOptInInvite;
  int v4 = [(NTPBEmailOptInInvite *)&v8 description];
  v5 = [(NTPBEmailOptInInvite *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v5 forKey:@"user_action"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v6 = [NSNumber numberWithInt:self->_emailOptInInviteLocation];
  [v3 setObject:v6 forKey:@"email_opt_in_invite_location"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t parentFeedType = self->_parentFeedType;
  if (parentFeedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_26444D808[parentFeedType];
  }
  [v3 setObject:v8 forKey:@"parent_feed_type"];

LABEL_11:
  parentFeedId = self->_parentFeedId;
  if (parentFeedId) {
    [v3 setObject:parentFeedId forKey:@"parent_feed_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_newsletterSubscriptionType];
    [v3 setObject:v11 forKey:@"newsletter_subscription_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEmailOptInInviteReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_parentFeedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleId) {
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
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_userAction;
    *(unsigned char *)(v5 + 40) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_emailOptInInviteLocation;
  *(unsigned char *)(v5 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_parentFeedType;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_parentFeedId copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_articleId copyWithZone:a3];
  v11 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v10;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_newsletterSubscriptionType;
    *(unsigned char *)(v6 + 40) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_userAction != *((_DWORD *)v4 + 9)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_25:
    BOOL v7 = 0;
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_emailOptInInviteLocation != *((_DWORD *)v4 + 4)) {
      goto LABEL_25;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 8)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_25;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((void *)v4 + 3)
    && !-[NSString isEqual:](parentFeedId, "isEqual:"))
  {
    goto LABEL_25;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_newsletterSubscriptionType != *((_DWORD *)v4 + 5)) {
      goto LABEL_25;
    }
    BOOL v7 = 1;
  }
LABEL_26:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_userAction;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_emailOptInInviteLocation;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_parentFeedType;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_parentFeedId hash];
  NSUInteger v7 = [(NSString *)self->_articleId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_newsletterSubscriptionType;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 8) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_emailOptInInviteLocation = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_uint64_t parentFeedType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBEmailOptInInvite setParentFeedId:](self, "setParentFeedId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBEmailOptInInvite setArticleId:](self, "setArticleId:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    self->_newsletterSubscriptionType = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentFeedId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end