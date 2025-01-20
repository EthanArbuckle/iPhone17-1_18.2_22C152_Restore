@interface NTPBShareInformationScreenView
- (BOOL)arrivedFromAd;
- (BOOL)hasArrivedFromAd;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorMessage;
- (BOOL)hasIadQtoken;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasParentFeedType;
- (BOOL)hasResultType;
- (BOOL)hasSectionId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscriptionOnlyArticlePreview;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)subscriptionOnlyArticlePreview;
- (NSData)articleViewingSessionId;
- (NSString)articleId;
- (NSString)errorCode;
- (NSString)errorMessage;
- (NSString)iadQtoken;
- (NSString)sectionId;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)paidSubscriptionConversionPointType;
- (int)parentFeedType;
- (int)resultType;
- (int)userAction;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArrivedFromAd:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setErrorCode:(id)a3;
- (void)setErrorMessage:(id)a3;
- (void)setHasArrivedFromAd:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIadQtoken:(id)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setParentFeedType:(int)a3;
- (void)setResultType:(int)a3;
- (void)setSectionId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBShareInformationScreenView

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

- (int)resultType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResultType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)paidSubscriptionConversionPointType
{
  if (*(unsigned char *)&self->_has) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444B5C0[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriptionConversionPointType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBER_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"IN_FEED_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_EXPIRATION_RENEWAL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TOP_OF_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"INTERSTITIAL_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"GROUP_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LANDING_PAGE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ISSUE_TOC_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_OFFERS_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasErrorMessage
{
  return self->_errorMessage != 0;
}

- (BOOL)hasErrorCode
{
  return self->_errorCode != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasSectionId
{
  return self->_sectionId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)parentFeedType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    char v3 = off_26444B670[a3];
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

- (void)setSubscriptionOnlyArticlePreview:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_subscriptionOnlyArticlePreview = a3;
}

- (void)setHasSubscriptionOnlyArticlePreview:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasSubscriptionOnlyArticlePreview
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setArrivedFromAd:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_arrivedFromAd = a3;
}

- (void)setHasArrivedFromAd:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasArrivedFromAd
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasIadQtoken
{
  return self->_iadQtoken != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBShareInformationScreenView;
  int v4 = [(NTPBShareInformationScreenView *)&v8 description];
  v5 = [(NTPBShareInformationScreenView *)self dictionaryRepresentation];
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
  v6 = [NSNumber numberWithInt:self->_resultType];
  [v3 setObject:v6 forKey:@"result_type"];

  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
  if (paidSubscriptionConversionPointType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_26444B5C0[paidSubscriptionConversionPointType];
  }
  [v3 setObject:v8 forKey:@"paid_subscription_conversion_point_type"];

LABEL_11:
  errorMessage = self->_errorMessage;
  if (errorMessage) {
    [v3 setObject:errorMessage forKey:@"error_message"];
  }
  errorCode = self->_errorCode;
  if (errorCode) {
    [v3 setObject:errorCode forKey:@"error_code"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  sectionId = self->_sectionId;
  if (sectionId) {
    [v3 setObject:sectionId forKey:@"section_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  char v15 = (char)self->_has;
  if ((v15 & 2) != 0)
  {
    uint64_t parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_26444B670[parentFeedType];
    }
    [v3 setObject:v20 forKey:@"parent_feed_type"];

    char v15 = (char)self->_has;
    if ((v15 & 0x20) == 0)
    {
LABEL_25:
      if ((v15 & 0x10) == 0) {
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_25;
  }
  v21 = [NSNumber numberWithBool:self->_subscriptionOnlyArticlePreview];
  [v3 setObject:v21 forKey:@"subscription_only_article_preview"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_26:
    v16 = [NSNumber numberWithBool:self->_arrivedFromAd];
    [v3 setObject:v16 forKey:@"arrived_from_ad"];
  }
LABEL_27:
  iadQtoken = self->_iadQtoken;
  if (iadQtoken) {
    [v3 setObject:iadQtoken forKey:@"iad_qtoken"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareInformationScreenViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
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
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_5:
  if (self->_errorMessage)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_errorCode)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sectionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_19:
      if ((v6 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_20:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_21:
  if (self->_iadQtoken)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_userAction;
    *(unsigned char *)(v5 + 88) |= 8u;
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
  *(_DWORD *)(v5 + 56) = self->_resultType;
  *(unsigned char *)(v5 + 88) |= 4u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 48) = self->_paidSubscriptionConversionPointType;
    *(unsigned char *)(v5 + 88) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_errorMessage copyWithZone:a3];
  v9 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_errorCode copyWithZone:a3];
  v11 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v13 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v12;

  uint64_t v14 = [(NSString *)self->_sectionId copyWithZone:a3];
  char v15 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_articleId copyWithZone:a3];
  v17 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v16;

  uint64_t v18 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v19 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v18;

  char v20 = (char)self->_has;
  if ((v20 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_7;
    }
LABEL_14:
    *(unsigned char *)(v6 + 85) = self->_subscriptionOnlyArticlePreview;
    *(unsigned char *)(v6 + 88) |= 0x20u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v6 + 52) = self->_parentFeedType;
  *(unsigned char *)(v6 + 88) |= 2u;
  char v20 = (char)self->_has;
  if ((v20 & 0x20) != 0) {
    goto LABEL_14;
  }
LABEL_7:
  if ((v20 & 0x10) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 84) = self->_arrivedFromAd;
    *(unsigned char *)(v6 + 88) |= 0x10u;
  }
LABEL_9:
  uint64_t v21 = [(NSString *)self->_iadQtoken copyWithZone:a3];
  v22 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v21;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 8) == 0 || self->_userAction != *((_DWORD *)v4 + 20)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 4) == 0 || self->_resultType != *((_DWORD *)v4 + 14)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) != 0)
  {
    goto LABEL_46;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 88) & 1) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 12)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
    goto LABEL_46;
  }
  errorMessage = self->_errorMessage;
  if ((unint64_t)errorMessage | *((void *)v4 + 4)
    && !-[NSString isEqual:](errorMessage, "isEqual:"))
  {
    goto LABEL_46;
  }
  errorCode = self->_errorCode;
  if ((unint64_t)errorCode | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](errorCode, "isEqual:")) {
      goto LABEL_46;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 13)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x20) == 0) {
      goto LABEL_46;
    }
    if (self->_subscriptionOnlyArticlePreview)
    {
      if (!*((unsigned char *)v4 + 85)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 85))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 88) & 0x10) == 0) {
      goto LABEL_52;
    }
LABEL_46:
    char v11 = 0;
    goto LABEL_47;
  }
  if ((*((unsigned char *)v4 + 88) & 0x10) == 0) {
    goto LABEL_46;
  }
  if (!self->_arrivedFromAd)
  {
    if (!*((unsigned char *)v4 + 84)) {
      goto LABEL_52;
    }
    goto LABEL_46;
  }
  if (!*((unsigned char *)v4 + 84)) {
    goto LABEL_46;
  }
LABEL_52:
  iadQtoken = self->_iadQtoken;
  if ((unint64_t)iadQtoken | *((void *)v4 + 5)) {
    char v11 = -[NSString isEqual:](iadQtoken, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_47:

  return v11;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v3 = 2654435761 * self->_userAction;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_resultType;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_paidSubscriptionConversionPointType;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v5 = 0;
LABEL_8:
  NSUInteger v6 = [(NSString *)self->_errorMessage hash];
  NSUInteger v7 = [(NSString *)self->_errorCode hash];
  NSUInteger v8 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v9 = [(NSString *)self->_sectionId hash];
  NSUInteger v10 = [(NSString *)self->_articleId hash];
  uint64_t v11 = [(NSData *)self->_articleViewingSessionId hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v12 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_14:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(NSString *)self->_iadQtoken hash];
  }
  uint64_t v12 = 2654435761 * self->_parentFeedType;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v13 = 2654435761 * self->_subscriptionOnlyArticlePreview;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_14;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_arrivedFromAd;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(NSString *)self->_iadQtoken hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 88);
  if ((v5 & 8) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 88);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_resultType = *((_DWORD *)v4 + 14);
  *(unsigned char *)&self->_has |= 4u;
  if (*((unsigned char *)v4 + 88))
  {
LABEL_4:
    self->_uint64_t paidSubscriptionConversionPointType = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[NTPBShareInformationScreenView setErrorMessage:](self, "setErrorMessage:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBShareInformationScreenView setErrorCode:](self, "setErrorCode:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[NTPBShareInformationScreenView setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[NTPBShareInformationScreenView setSectionId:](self, "setSectionId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBShareInformationScreenView setArticleId:](self, "setArticleId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBShareInformationScreenView setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 88);
  if ((v6 & 2) != 0)
  {
    self->_uint64_t parentFeedType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 88);
    if ((v6 & 0x20) == 0)
    {
LABEL_19:
      if ((v6 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x20) == 0)
  {
    goto LABEL_19;
  }
  self->_subscriptionOnlyArticlePreview = *((unsigned char *)v4 + 85);
  *(unsigned char *)&self->_has |= 0x20u;
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
LABEL_20:
    self->_arrivedFromAd = *((unsigned char *)v4 + 84);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_21:
  if (*((void *)v4 + 5))
  {
    -[NTPBShareInformationScreenView setIadQtoken:](self, "setIadQtoken:");
    id v4 = v7;
  }
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void)setErrorMessage:(id)a3
{
}

- (NSString)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)sectionId
{
  return self->_sectionId;
}

- (void)setSectionId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (BOOL)subscriptionOnlyArticlePreview
{
  return self->_subscriptionOnlyArticlePreview;
}

- (BOOL)arrivedFromAd
{
  return self->_arrivedFromAd;
}

- (NSString)iadQtoken
{
  return self->_iadQtoken;
}

- (void)setIadQtoken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_iadQtoken, 0);
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end