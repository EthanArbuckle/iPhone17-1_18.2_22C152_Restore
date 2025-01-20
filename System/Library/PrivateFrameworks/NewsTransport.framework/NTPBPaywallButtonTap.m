@interface NTPBPaywallButtonTap
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasGroupType;
- (BOOL)hasIssueData;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasParentFeedType;
- (BOOL)hasPurchaseId;
- (BOOL)hasPurchaseType;
- (BOOL)hasSectionId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscriptionButtonTargetType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSString)articleId;
- (NSString)purchaseId;
- (NSString)sectionId;
- (NSString)sourceChannelId;
- (NTPBIssueData)issueData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypeAsString:(int)a3;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (id)purchaseTypeAsString:(int)a3;
- (id)subscriptionButtonTargetTypeAsString:(int)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)StringAsPurchaseType:(id)a3;
- (int)StringAsSubscriptionButtonTargetType:(id)a3;
- (int)groupType;
- (int)paidSubscriptionConversionPointType;
- (int)parentFeedType;
- (int)purchaseType;
- (int)subscriptionButtonTargetType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasPurchaseType:(BOOL)a3;
- (void)setHasSubscriptionButtonTargetType:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setParentFeedType:(int)a3;
- (void)setPurchaseId:(id)a3;
- (void)setPurchaseType:(int)a3;
- (void)setSectionId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscriptionButtonTargetType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPaywallButtonTap

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
    char v3 = off_26444D8B8[a3];
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
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_26444D968[a3];
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

- (int)paidSubscriptionConversionPointType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    char v3 = off_26444DAA8[a3];
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

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (int)subscriptionButtonTargetType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_subscriptionButtonTargetType;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionButtonTargetType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_subscriptionButtonTargetType = a3;
}

- (void)setHasSubscriptionButtonTargetType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSubscriptionButtonTargetType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)subscriptionButtonTargetTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444DB58[a3];
  }

  return v3;
}

- (int)StringAsSubscriptionButtonTargetType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SUBSCRIPTION_BUTTON_TARGET_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PURCHASE_SHEET_SUBSCRIPTION_BUTTON_TARGET_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LANDING_PAGE_SUBSCRIPTION_BUTTON_TARGET_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LINK_SUBSCRIPTION_BUTTON_TARGET_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AMP_PAGE_SUBSCRIPTION_BUTTON_TARGET_TYPE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (int)purchaseType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_purchaseType;
  }
  else {
    return 0;
  }
}

- (void)setPurchaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_purchaseType = a3;
}

- (void)setHasPurchaseType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPurchaseType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)purchaseTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444DB80[a3];
  }

  return v3;
}

- (int)StringAsPurchaseType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PURCHASE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AL_A_CARTE_PURCHASE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BUNDLE_PURCHASE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"S_BUNDLE_PURCHASE_TYPE"])
  {
    int v4 = 3;
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
  v8.super_class = (Class)NTPBPaywallButtonTap;
  int v4 = [(NTPBPaywallButtonTap *)&v8 description];
  v5 = [(NTPBPaywallButtonTap *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = v3;
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  sectionId = self->_sectionId;
  if (sectionId) {
    [v4 setObject:sectionId forKey:@"section_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v4 setObject:articleId forKey:@"article_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v4 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26444D8B8[parentFeedType];
    }
    [v4 setObject:v11 forKey:@"parent_feed_type"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_25;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  uint64_t groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = off_26444D968[groupType];
  }
  [v4 setObject:v13 forKey:@"group_type"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_21:
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_26444DAA8[paidSubscriptionConversionPointType];
    }
    [v4 setObject:v15 forKey:@"paid_subscription_conversion_point_type"];
  }
LABEL_25:
  purchaseId = self->_purchaseId;
  if (purchaseId) {
    [v4 setObject:purchaseId forKey:@"purchase_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t subscriptionButtonTargetType = self->_subscriptionButtonTargetType;
    if (subscriptionButtonTargetType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_subscriptionButtonTargetType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_26444DB58[subscriptionButtonTargetType];
    }
    [v4 setObject:v18 forKey:@"subscription_button_target_type"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v20 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v4 setObject:v20 forKey:@"issue_data"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t purchaseType = self->_purchaseType;
    if (purchaseType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_purchaseType);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_26444DB80[purchaseType];
    }
    [v4 setObject:v22 forKey:@"purchase_type"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPaywallButtonTapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_sectionId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_articleViewingSessionId)
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
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_13:
  if (self->_purchaseId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  uint64_t v8 = [(NSString *)self->_sectionId copyWithZone:a3];
  v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_articleId copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 44) = self->_parentFeedType;
    *(unsigned char *)(v5 + 84) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_groupType;
  *(unsigned char *)(v5 + 84) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 40) = self->_paidSubscriptionConversionPointType;
    *(unsigned char *)(v5 + 84) |= 2u;
  }
LABEL_5:
  uint64_t v15 = [(NSString *)self->_purchaseId copyWithZone:a3];
  v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_subscriptionButtonTargetType;
    *(unsigned char *)(v5 + 84) |= 0x10u;
  }
  id v17 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v18 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v17;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_purchaseType;
    *(unsigned char *)(v5 + 84) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  sectionId = self->_sectionId;
  if ((unint64_t)sectionId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](sectionId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_40;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 4) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 11)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 4) != 0)
  {
    goto LABEL_40;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 84) & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 6)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 84))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 2) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 10)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 2) != 0)
  {
    goto LABEL_40;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](purchaseId, "isEqual:")) {
      goto LABEL_40;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 0x10) == 0 || self->_subscriptionButtonTargetType != *((_DWORD *)v4 + 20)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 84) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 4))
  {
    if (-[NTPBIssueData isEqual:](issueData, "isEqual:"))
    {
      char has = (char)self->_has;
      goto LABEL_36;
    }
LABEL_40:
    BOOL v12 = 0;
    goto LABEL_41;
  }
LABEL_36:
  BOOL v12 = (*((unsigned char *)v4 + 84) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 84) & 8) == 0 || self->_purchaseType != *((_DWORD *)v4 + 14)) {
      goto LABEL_40;
    }
    BOOL v12 = 1;
  }
LABEL_41:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v14 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v13 = [(NSString *)self->_sectionId hash];
  NSUInteger v3 = [(NSString *)self->_articleId hash];
  uint64_t v4 = [(NSData *)self->_articleViewingSessionId hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 2654435761 * self->_parentFeedType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_groupType;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_paidSubscriptionConversionPointType;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v7 = 0;
LABEL_8:
  NSUInteger v8 = [(NSString *)self->_purchaseId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_subscriptionButtonTargetType;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(NTPBIssueData *)self->_issueData hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_purchaseType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v13 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v8 = v4;
  if (*((void *)v4 + 9))
  {
    -[NTPBPaywallButtonTap setSourceChannelId:](self, "setSourceChannelId:");
    uint64_t v4 = v8;
  }
  if (*((void *)v4 + 8))
  {
    -[NTPBPaywallButtonTap setSectionId:](self, "setSectionId:");
    uint64_t v4 = v8;
  }
  if (*((void *)v4 + 1))
  {
    -[NTPBPaywallButtonTap setArticleId:](self, "setArticleId:");
    uint64_t v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[NTPBPaywallButtonTap setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    uint64_t v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 84);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t parentFeedType = v4[11];
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 84);
    if ((v5 & 1) == 0)
    {
LABEL_11:
      if ((v5 & 2) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((v4[21] & 1) == 0)
  {
    goto LABEL_11;
  }
  self->_uint64_t groupType = v4[6];
  *(unsigned char *)&self->_has |= 1u;
  if ((v4[21] & 2) != 0)
  {
LABEL_12:
    self->_uint64_t paidSubscriptionConversionPointType = v4[10];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_13:
  if (*((void *)v4 + 6))
  {
    -[NTPBPaywallButtonTap setPurchaseId:](self, "setPurchaseId:");
    uint64_t v4 = v8;
  }
  if ((v4[21] & 0x10) != 0)
  {
    self->_uint64_t subscriptionButtonTargetType = v4[20];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  issueData = self->_issueData;
  uint64_t v7 = *((void *)v4 + 4);
  if (issueData)
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_26;
    }
    -[NTPBPaywallButtonTap setIssueData:](self, "setIssueData:");
  }
  uint64_t v4 = v8;
LABEL_26:
  if ((v4[21] & 8) != 0)
  {
    self->_uint64_t purchaseType = v4[14];
    *(unsigned char *)&self->_has |= 8u;
  }

  MEMORY[0x270F9A758]();
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

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (void)setPurchaseId:(id)a3
{
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionId, 0);
  objc_storeStrong((id *)&self->_purchaseId, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end