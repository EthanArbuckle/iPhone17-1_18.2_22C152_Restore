@interface NTPBFeedSubscribeUnsubscribe
+ (Class)subscribedFeedIdsType;
- (BOOL)cameFromGroup;
- (BOOL)hasArticleId;
- (BOOL)hasCameFromGroup;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCreativeId;
- (BOOL)hasDisplayRank;
- (BOOL)hasFeedCellHostType;
- (BOOL)hasFeedCellSection;
- (BOOL)hasFeedId;
- (BOOL)hasFeedSubscriptionOrigin;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasFeedViewPresentationReason;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIsPaidSubscriberToFeed;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasPreviousArticlePublisherArticleVersion;
- (BOOL)hasPreviousArticleVersion;
- (BOOL)hasRecommendationBrickType;
- (BOOL)hasSearchString;
- (BOOL)hasSubscribeUnsubscribeLocation;
- (BOOL)hasSubscribeUnsubscribeSurfaceReason;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidSubscriberToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSMutableArray)subscribedFeedIds;
- (NSString)articleId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)feedId;
- (NSString)groupFeedId;
- (NSString)previousArticleId;
- (NSString)previousArticleVersion;
- (NSString)searchString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedCellHostTypeAsString:(int)a3;
- (id)feedCellSectionAsString:(int)a3;
- (id)feedSubscriptionOriginAsString:(int)a3;
- (id)feedTypeAsString:(int)a3;
- (id)feedViewPresentationReasonAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (id)recommendationBrickTypeAsString:(int)a3;
- (id)subscribedFeedIdsAtIndex:(unint64_t)a3;
- (int)StringAsFeedCellHostType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedSubscriptionOrigin:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsFeedViewPresentationReason:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsRecommendationBrickType:(id)a3;
- (int)displayRank;
- (int)feedCellHostType;
- (int)feedCellSection;
- (int)feedSubscriptionOrigin;
- (int)feedType;
- (int)feedViewPresentationReason;
- (int)groupType;
- (int)recommendationBrickType;
- (int)subscribeUnsubscribeLocation;
- (int)subscribeUnsubscribeSurfaceReason;
- (int)userAction;
- (int64_t)previousArticlePublisherArticleVersion;
- (unint64_t)hash;
- (unint64_t)subscribedFeedIdsCount;
- (void)addSubscribedFeedIds:(id)a3;
- (void)clearSubscribedFeedIds;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setCameFromGroup:(BOOL)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setDisplayRank:(int)a3;
- (void)setFeedCellHostType:(int)a3;
- (void)setFeedCellSection:(int)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedSubscriptionOrigin:(int)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setFeedViewPresentationReason:(int)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasCameFromGroup:(BOOL)a3;
- (void)setHasDisplayRank:(BOOL)a3;
- (void)setHasFeedCellHostType:(BOOL)a3;
- (void)setHasFeedCellSection:(BOOL)a3;
- (void)setHasFeedSubscriptionOrigin:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasFeedViewPresentationReason:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasRecommendationBrickType:(BOOL)a3;
- (void)setHasSubscribeUnsubscribeLocation:(BOOL)a3;
- (void)setHasSubscribeUnsubscribeSurfaceReason:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIsPaidSubscriberToFeed:(BOOL)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setRecommendationBrickType:(int)a3;
- (void)setSearchString:(id)a3;
- (void)setSubscribeUnsubscribeLocation:(int)a3;
- (void)setSubscribeUnsubscribeSurfaceReason:(int)a3;
- (void)setSubscribedFeedIds:(id)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedSubscribeUnsubscribe

- (int)userAction
{
  if ((*(_WORD *)&self->_has & 0x800) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserAction
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B0C0[a3];
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

- (int)subscribeUnsubscribeLocation
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_subscribeUnsubscribeLocation;
  }
  else {
    return 0;
  }
}

- (void)setSubscribeUnsubscribeLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subscribeUnsubscribeLocation = a3;
}

- (void)setHasSubscribeUnsubscribeLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubscribeUnsubscribeLocation
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)feedViewPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_feedViewPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setFeedViewPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_feedViewPresentationReason = a3;
}

- (void)setHasFeedViewPresentationReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFeedViewPresentationReason
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)feedViewPresentationReasonAsString:(int)a3
{
  if (a3 >= 0x2C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B170[a3];
  }

  return v3;
}

- (int)StringAsFeedViewPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SEARCH_VIEW_CELL_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEED_CELL_HOST_VIEW_CELL_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"OPEN_URL_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"SAVED_SEGMENTED_CONTROL_TOGGLE_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SAVED_TAB_BAR_BUTTON_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RETURN_FROM_ARTICLE_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"RECOMMENDATION_BRICK_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"EXCERPT_TOPIC_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"RELATED_ARTICLES_TOPIC_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SPOTLIGHT_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_PUB_ARTICLES_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"RELATED_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_CHANNELS_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_TOPICS_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_CHANNELS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_TOPICS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"BROWSE_CHANNELS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"BROWSE_TOPICS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"APP_LAUNCH_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FAVORITE_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"EXPLORE_FEATURED_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"EXPLORE_EDITORS_PICKS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"EXPLORE_RECOMMENDED_FOR_YOU_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 24;
  }
  else if ([v3 isEqualToString:@"TRENDING_WIDGET_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 25;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 26;
  }
  else if ([v3 isEqualToString:@"RELATED_TOPICS_WIDGET_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 27;
  }
  else if ([v3 isEqualToString:@"CAME_FROM_AD"])
  {
    int v4 = 28;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_PLACARD_PURCHASE_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 29;
  }
  else if ([v3 isEqualToString:@"SUCCESSFUL_SUBSCRIPTION_RENEWAL_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"CAME_FROM_SUBSCRIPTION_AD_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 31;
  }
  else if ([v3 isEqualToString:@"FROM_SECTION_VIEW_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 32;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_GROUP_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 33;
  }
  else if ([v3 isEqualToString:@"NEXT_ARTICLE_ROTATION_COMPLETE_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 34;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 35;
  }
  else if ([v3 isEqualToString:@"FROM_ARTICLE_BACK_TAP_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 36;
  }
  else if ([v3 isEqualToString:@"SEARCH_TRENDING_SELECTION_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 37;
  }
  else if ([v3 isEqualToString:@"FROM_EDITORIAL_HOMEPAGE_TAB_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 38;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_PAID_SUBSCRIPTION_COMPLETE_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 39;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS_SEE_ALL_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"NOTIFICATION_SETTINGS_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 41;
  }
  else if ([v3 isEqualToString:@"MUTE_MANAGER_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 42;
  }
  else if ([v3 isEqualToString:@"TOC_FEED_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 43;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedCellSection
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_feedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellSection:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasFeedCellSection
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B2D0[a3];
  }

  return v3;
}

- (int)StringAsFeedCellSection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_CELL_SECTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_TOPICS_FEED_CELL_SECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEATURED_TOPICS_FEED_CELL_SECTION"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EXPLORE_FEATURED_FEED_CELL_SECTION"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EXPLORE_SUGGESTED_FEED_CELL_SECTION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUGGESTIONS_FEED_CELL_SECTION"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TOPICS_FEED_CELL_SECTION"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"NOTIFICATIONS_MORE_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTIONS_FEED_CELL_SECTION"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FOLLOWING_FEED_CELL_SECTION"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEED_CELL_SECTION"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"DISLIKED_CHANNELS_FEED_CELL_SECTION"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SAVED_FEED_CELL_SECTION"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"HISTORY_FEED_CELL_SECTION"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_CATEGORY_FEED_CELL_SECTION"])
  {
    int v4 = 17;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedCellHostType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_feedCellHostType;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellHostType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFeedCellHostType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B360[a3];
  }

  return v3;
}

- (int)StringAsFeedCellHostType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EXPLORE_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FAVORITES_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RECOMMENDATION_BRICK_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DISCOVERY_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"DISCOVERY_WIDGET_FULL_VIEW_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ONBOARDING_PICKER_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BROWSE_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"SEARCH_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TRENDING_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"EDITORS_PICKS_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"RELATED_TOPICS_WIDGET_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_DETECTION_SCREEN_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FAVORITES_SUGGESTIONS_SEE_ALL_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"NOTIFICATIONS_SETTINGS_SCREEN_FOLLOWING_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"MUTE_MANAGER_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"TOC_FEED_CELL_HOST_TYPE"])
  {
    int v4 = 16;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setDisplayRank:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDisplayRank
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasSearchString
{
  return self->_searchString != 0;
}

- (void)clearSubscribedFeedIds
{
}

- (void)addSubscribedFeedIds:(id)a3
{
  id v4 = a3;
  subscribedFeedIds = self->_subscribedFeedIds;
  id v8 = v4;
  if (!subscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subscribedFeedIds;
    self->_subscribedFeedIds = v6;

    id v4 = v8;
    subscribedFeedIds = self->_subscribedFeedIds;
  }
  [(NSMutableArray *)subscribedFeedIds addObject:v4];
}

- (unint64_t)subscribedFeedIdsCount
{
  return [(NSMutableArray *)self->_subscribedFeedIds count];
}

- (id)subscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subscribedFeedIds objectAtIndex:a3];
}

+ (Class)subscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)setCameFromGroup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_cameFromGroup = a3;
}

- (void)setHasCameFromGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasCameFromGroup
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B3E8[a3];
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

- (void)setIsPaidSubscriberToFeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isPaidSubscriberToFeed = a3;
}

- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsPaidSubscriberToFeed
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (BOOL)hasCampaignType
{
  return self->_campaignType != 0;
}

- (BOOL)hasCreativeId
{
  return self->_creativeId != 0;
}

- (int)recommendationBrickType
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_recommendationBrickType;
  }
  else {
    return 0;
  }
}

- (void)setRecommendationBrickType:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_recommendationBrickType = a3;
}

- (void)setHasRecommendationBrickType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRecommendationBrickType
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)recommendationBrickTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B528[a3];
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

- (int)subscribeUnsubscribeSurfaceReason
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_subscribeUnsubscribeSurfaceReason;
  }
  else {
    return 0;
  }
}

- (void)setSubscribeUnsubscribeSurfaceReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_subscribeUnsubscribeSurfaceReason = a3;
}

- (void)setHasSubscribeUnsubscribeSurfaceReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSubscribeUnsubscribeSurfaceReason
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (int)feedSubscriptionOrigin
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_feedSubscriptionOrigin;
  }
  else {
    return 0;
  }
}

- (void)setFeedSubscriptionOrigin:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_feedSubscriptionOrigin = a3;
}

- (void)setHasFeedSubscriptionOrigin:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFeedSubscriptionOrigin
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)feedSubscriptionOriginAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444B548[a3];
  }

  return v3;
}

- (int)StringAsFeedSubscriptionOrigin:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"USER_INITIATED_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"SAFARI_HISTORY_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_APP_USAGE_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INTERNAL_APP_USAGE_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HOT_NEWS_TODAY_TOPIC_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"HOT_NEWS_TODAY_SUB_TOPIC_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FALLBACK_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DEFAULT_TOPICS_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"PORTRAIT_FEED_SUBSCRIPTION_ORIGIN"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBFeedSubscribeUnsubscribe;
  int v4 = [(NTPBFeedSubscribeUnsubscribe *)&v8 description];
  v5 = [(NTPBFeedSubscribeUnsubscribe *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v5 forKey:@"user_action"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_26444B0C0[feedType];
    }
    [v3 setObject:v7 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    v10 = [NSNumber numberWithInt:self->_subscribeUnsubscribeLocation];
    [v3 setObject:v10 forKey:@"subscribe_unsubscribe_location"];

    __int16 v9 = (__int16)self->_has;
    if ((v9 & 0x40) == 0)
    {
LABEL_12:
      if ((v9 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_20;
    }
  }
  else if ((v9 & 0x40) == 0)
  {
    goto LABEL_12;
  }
  uint64_t feedViewPresentationReason = self->_feedViewPresentationReason;
  if (feedViewPresentationReason >= 0x2C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedViewPresentationReason);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_26444B170[feedViewPresentationReason];
  }
  [v3 setObject:v12 forKey:@"feed_view_presentation_reason"];

  __int16 v9 = (__int16)self->_has;
  if ((v9 & 8) == 0)
  {
LABEL_13:
    if ((v9 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t feedCellSection = self->_feedCellSection;
  if (feedCellSection >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellSection);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444B2D0[feedCellSection];
  }
  [v3 setObject:v14 forKey:@"feed_cell_section"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    uint64_t feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellHostType);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_26444B360[feedCellHostType];
    }
    [v3 setObject:v16 forKey:@"feed_cell_host_type"];
  }
LABEL_28:
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v18 = [NSNumber numberWithInt:self->_displayRank];
    [v3 setObject:v18 forKey:@"display_rank"];
  }
  searchString = self->_searchString;
  if (searchString) {
    [v3 setObject:searchString forKey:@"search_string"];
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if (subscribedFeedIds) {
    [v3 setObject:subscribedFeedIds forKey:@"subscribed_feed_ids"];
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_cameFromGroup];
    [v3 setObject:v21 forKey:@"came_from_group"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x80) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_26444B3E8[groupType];
    }
    [v3 setObject:v25 forKey:@"group_type"];

    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 0x2000) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_isPaidSubscriberToFeed];
    [v3 setObject:v26 forKey:@"is_paid_subscriber_to_feed"];
  }
  campaignId = self->_campaignId;
  if (campaignId) {
    [v3 setObject:campaignId forKey:@"campaign_id"];
  }
  campaignType = self->_campaignType;
  if (campaignType) {
    [v3 setObject:campaignType forKey:@"campaign_type"];
  }
  creativeId = self->_creativeId;
  if (creativeId) {
    [v3 setObject:creativeId forKey:@"creative_id"];
  }
  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x100) != 0)
  {
    uint64_t recommendationBrickType = self->_recommendationBrickType;
    if (recommendationBrickType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_recommendationBrickType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_26444B528[recommendationBrickType];
    }
    [v3 setObject:v32 forKey:@"recommendation_brick_type"];

    __int16 v30 = (__int16)self->_has;
  }
  if ((v30 & 0x400) != 0)
  {
    v33 = [NSNumber numberWithInt:self->_subscribeUnsubscribeSurfaceReason];
    [v3 setObject:v33 forKey:@"subscribe_unsubscribe_surface_reason"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  previousArticleId = self->_previousArticleId;
  if (previousArticleId) {
    [v3 setObject:previousArticleId forKey:@"previous_article_id"];
  }
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion) {
    [v3 setObject:previousArticleVersion forKey:@"previous_article_version"];
  }
  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x10) != 0)
  {
    uint64_t feedSubscriptionOrigin = self->_feedSubscriptionOrigin;
    if (feedSubscriptionOrigin >= 0xA)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedSubscriptionOrigin);
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_26444B548[feedSubscriptionOrigin];
    }
    [v3 setObject:v39 forKey:@"feed_subscription_origin"];

    __int16 v37 = (__int16)self->_has;
  }
  if (v37)
  {
    v40 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v40 forKey:@"previous_article_publisher_article_version"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v3 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  id v42 = v3;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedSubscribeUnsubscribeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x40) == 0)
    {
LABEL_9:
      if ((v6 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_58;
    }
  }
  else if ((v6 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_10:
    if ((v6 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_58:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt32Field();
LABEL_12:
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_searchString) {
    PBDataWriterWriteStringField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = self->_subscribedFeedIds;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x2000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_creativeId) {
    PBDataWriterWriteStringField();
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleVersion) {
    PBDataWriterWriteStringField();
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v14 = (__int16)self->_has;
  }
  if (v14) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_groupViewExposureId) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_userAction;
    *(_WORD *)(v5 + 176) |= 0x800u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_feedType;
    *(_WORD *)(v5 + 176) |= 0x20u;
  }
  uint64_t v8 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v9 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_subscribeUnsubscribeLocation;
    *(_WORD *)(v6 + 176) |= 0x200u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x40) == 0)
    {
LABEL_7:
      if ((v10 & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_36;
    }
  }
  else if ((v10 & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 88) = self->_feedViewPresentationReason;
  *(_WORD *)(v6 + 176) |= 0x40u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 8) == 0)
  {
LABEL_8:
    if ((v10 & 4) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_36:
  *(_DWORD *)(v6 + 56) = self->_feedCellSection;
  *(_WORD *)(v6 + 176) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_9:
    *(_DWORD *)(v6 + 52) = self->_feedCellHostType;
    *(_WORD *)(v6 + 176) |= 4u;
  }
LABEL_10:
  uint64_t v11 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  __int16 v12 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v11;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_displayRank;
    *(_WORD *)(v6 + 176) |= 2u;
  }
  uint64_t v13 = [(NSString *)self->_searchString copyWithZone:a3];
  __int16 v14 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v13;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v15 = self->_subscribedFeedIds;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v42 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * i), "copyWithZone:", a3, (void)v41);
        [(id)v6 addSubscribedFeedIds:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v17);
  }

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    *(unsigned char *)(v6 + 172) = self->_cameFromGroup;
    *(_WORD *)(v6 + 176) |= 0x1000u;
  }
  uint64_t v21 = -[NSString copyWithZone:](self->_groupFeedId, "copyWithZone:", a3, (void)v41);
  v22 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v21;

  __int16 v23 = (__int16)self->_has;
  if ((v23 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_groupType;
    *(_WORD *)(v6 + 176) |= 0x80u;
    __int16 v23 = (__int16)self->_has;
  }
  if ((v23 & 0x2000) != 0)
  {
    *(unsigned char *)(v6 + 173) = self->_isPaidSubscriberToFeed;
    *(_WORD *)(v6 + 176) |= 0x2000u;
  }
  uint64_t v24 = [(NSString *)self->_campaignId copyWithZone:a3];
  v25 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v24;

  uint64_t v26 = [(NSString *)self->_campaignType copyWithZone:a3];
  v27 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v26;

  uint64_t v28 = [(NSString *)self->_creativeId copyWithZone:a3];
  v29 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v28;

  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_recommendationBrickType;
    *(_WORD *)(v6 + 176) |= 0x100u;
    __int16 v30 = (__int16)self->_has;
  }
  if ((v30 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 156) = self->_subscribeUnsubscribeSurfaceReason;
    *(_WORD *)(v6 + 176) |= 0x400u;
  }
  uint64_t v31 = [(NSString *)self->_articleId copyWithZone:a3];
  v32 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v31;

  uint64_t v33 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v34 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v33;

  uint64_t v35 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v36 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v35;

  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_feedSubscriptionOrigin;
    *(_WORD *)(v6 + 176) |= 0x10u;
    __int16 v37 = (__int16)self->_has;
  }
  if (v37)
  {
    *(void *)(v6 + 8) = self->_previousArticlePublisherArticleVersion;
    *(_WORD *)(v6 + 176) |= 1u;
  }
  uint64_t v38 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v39 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v38;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_105;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 88);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x800) == 0 || self->_userAction != *((_DWORD *)v4 + 42)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 88) & 0x800) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_feedType != *((_DWORD *)v4 + 19)) {
      goto LABEL_105;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_105;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_105;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 88);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x200) == 0 || self->_subscribeUnsubscribeLocation != *((_DWORD *)v4 + 38)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 88) & 0x200) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_feedViewPresentationReason != *((_DWORD *)v4 + 22)) {
      goto LABEL_105;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 14)) {
      goto LABEL_105;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_105;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 13)) {
      goto LABEL_105;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_105;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_105;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 88);
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_displayRank != *((_DWORD *)v4 + 12)) {
      goto LABEL_105;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_105;
  }
  searchString = self->_searchString;
  if ((unint64_t)searchString | *((void *)v4 + 18)
    && !-[NSString isEqual:](searchString, "isEqual:"))
  {
    goto LABEL_105;
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if ((unint64_t)subscribedFeedIds | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](subscribedFeedIds, "isEqual:")) {
      goto LABEL_105;
    }
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x1000) == 0) {
      goto LABEL_105;
    }
    if (self->_cameFromGroup)
    {
      if (!*((unsigned char *)v4 + 172)) {
        goto LABEL_105;
      }
    }
    else if (*((unsigned char *)v4 + 172))
    {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 88) & 0x1000) != 0)
  {
    goto LABEL_105;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_105;
    }
    __int16 v13 = (__int16)self->_has;
  }
  __int16 v15 = *((_WORD *)v4 + 88);
  if ((v13 & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_groupType != *((_DWORD *)v4 + 26)) {
      goto LABEL_105;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_105;
  }
  if ((v13 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x2000) != 0)
    {
      if (self->_isPaidSubscriberToFeed)
      {
        if (!*((unsigned char *)v4 + 173)) {
          goto LABEL_105;
        }
        goto LABEL_71;
      }
      if (!*((unsigned char *)v4 + 173)) {
        goto LABEL_71;
      }
    }
LABEL_105:
    char v25 = 0;
    goto LABEL_106;
  }
  if ((*((_WORD *)v4 + 88) & 0x2000) != 0) {
    goto LABEL_105;
  }
LABEL_71:
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 3) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_105;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_105;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_105;
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x100) == 0 || self->_recommendationBrickType != *((_DWORD *)v4 + 34)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 88) & 0x100) != 0)
  {
    goto LABEL_105;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 88) & 0x400) == 0 || self->_subscribeUnsubscribeSurfaceReason != *((_DWORD *)v4 + 39)) {
      goto LABEL_105;
    }
  }
  else if ((*((_WORD *)v4 + 88) & 0x400) != 0)
  {
    goto LABEL_105;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_105;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_105;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_105;
    }
  }
  __int16 v22 = (__int16)self->_has;
  __int16 v23 = *((_WORD *)v4 + 88);
  if ((v22 & 0x10) != 0)
  {
    if ((v23 & 0x10) == 0 || self->_feedSubscriptionOrigin != *((_DWORD *)v4 + 18)) {
      goto LABEL_105;
    }
  }
  else if ((v23 & 0x10) != 0)
  {
    goto LABEL_105;
  }
  if (v22)
  {
    if ((v23 & 1) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 1)) {
      goto LABEL_105;
    }
  }
  else if (v23)
  {
    goto LABEL_105;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 14)) {
    char v25 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  }
  else {
    char v25 = 1;
  }
LABEL_106:

  return v25;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    uint64_t v31 = 2654435761 * self->_userAction;
    if ((has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v30 = 2654435761 * self->_feedType;
      goto LABEL_6;
    }
  }
  uint64_t v30 = 0;
LABEL_6:
  NSUInteger v29 = [(NSString *)self->_feedId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x200) != 0)
  {
    uint64_t v28 = 2654435761 * self->_subscribeUnsubscribeLocation;
    if ((v4 & 0x40) != 0)
    {
LABEL_8:
      uint64_t v27 = 2654435761 * self->_feedViewPresentationReason;
      if ((v4 & 8) != 0) {
        goto LABEL_9;
      }
LABEL_13:
      uint64_t v26 = 0;
      if ((v4 & 4) != 0) {
        goto LABEL_10;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((v4 & 0x40) != 0) {
      goto LABEL_8;
    }
  }
  uint64_t v27 = 0;
  if ((v4 & 8) == 0) {
    goto LABEL_13;
  }
LABEL_9:
  uint64_t v26 = 2654435761 * self->_feedCellSection;
  if ((v4 & 4) != 0)
  {
LABEL_10:
    uint64_t v25 = 2654435761 * self->_feedCellHostType;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v25 = 0;
LABEL_15:
  uint64_t v24 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v23 = 2654435761 * self->_displayRank;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_searchString hash];
  uint64_t v21 = [(NSMutableArray *)self->_subscribedFeedIds hash];
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    uint64_t v20 = 2654435761 * self->_cameFromGroup;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_groupFeedId hash];
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    uint64_t v18 = 2654435761 * self->_groupType;
    if ((*(_WORD *)&self->_has & 0x2000) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((*(_WORD *)&self->_has & 0x2000) != 0)
    {
LABEL_23:
      uint64_t v17 = 2654435761 * self->_isPaidSubscriberToFeed;
      goto LABEL_26;
    }
  }
  uint64_t v17 = 0;
LABEL_26:
  NSUInteger v5 = [(NSString *)self->_campaignId hash];
  NSUInteger v6 = [(NSString *)self->_campaignType hash];
  NSUInteger v7 = [(NSString *)self->_creativeId hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t v8 = 2654435761 * self->_recommendationBrickType;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_28:
      uint64_t v9 = 2654435761 * self->_subscribeUnsubscribeSurfaceReason;
      goto LABEL_31;
    }
  }
  uint64_t v9 = 0;
LABEL_31:
  NSUInteger v10 = [(NSString *)self->_articleId hash];
  NSUInteger v11 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v12 = [(NSString *)self->_previousArticleVersion hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x10) != 0)
  {
    uint64_t v14 = 2654435761 * self->_feedSubscriptionOrigin;
    if (v13) {
      goto LABEL_33;
    }
LABEL_35:
    uint64_t v15 = 0;
    return v30 ^ v31 ^ v28 ^ v27 ^ v26 ^ v25 ^ v29 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ [(NSData *)self->_groupViewExposureId hash];
  }
  uint64_t v14 = 0;
  if ((v13 & 1) == 0) {
    goto LABEL_35;
  }
LABEL_33:
  uint64_t v15 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  return v30 ^ v31 ^ v28 ^ v27 ^ v26 ^ v25 ^ v29 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ [(NSData *)self->_groupViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  __int16 v4 = (int *)a3;
  NSUInteger v5 = v4;
  __int16 v6 = *((_WORD *)v4 + 88);
  if ((v6 & 0x800) != 0)
  {
    self->_userAction = v4[42];
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)v4 + 88);
  }
  if ((v6 & 0x20) != 0)
  {
    self->_uint64_t feedType = v4[19];
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 8)) {
    -[NTPBFeedSubscribeUnsubscribe setFeedId:](self, "setFeedId:");
  }
  __int16 v7 = *((_WORD *)v5 + 88);
  if ((v7 & 0x200) != 0)
  {
    self->_subscribeUnsubscribeLocation = v5[38];
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v7 = *((_WORD *)v5 + 88);
    if ((v7 & 0x40) == 0)
    {
LABEL_9:
      if ((v7 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_58;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  self->_uint64_t feedViewPresentationReason = v5[22];
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v7 = *((_WORD *)v5 + 88);
  if ((v7 & 8) == 0)
  {
LABEL_10:
    if ((v7 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_58:
  self->_uint64_t feedCellSection = v5[14];
  *(_WORD *)&self->_has |= 8u;
  if ((v5[44] & 4) != 0)
  {
LABEL_11:
    self->_uint64_t feedCellHostType = v5[13];
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((void *)v5 + 10)) {
    -[NTPBFeedSubscribeUnsubscribe setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  if ((v5[44] & 2) != 0)
  {
    self->_displayRank = v5[12];
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 18)) {
    -[NTPBFeedSubscribeUnsubscribe setSearchString:](self, "setSearchString:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = *((id *)v5 + 20);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NTPBFeedSubscribeUnsubscribe addSubscribedFeedIds:](self, "addSubscribedFeedIds:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  if ((v5[44] & 0x1000) != 0)
  {
    self->_cameFromGroup = *((unsigned char *)v5 + 172);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v5 + 12)) {
    -[NTPBFeedSubscribeUnsubscribe setGroupFeedId:](self, "setGroupFeedId:");
  }
  __int16 v13 = *((_WORD *)v5 + 88);
  if ((v13 & 0x80) != 0)
  {
    self->_uint64_t groupType = v5[26];
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v13 = *((_WORD *)v5 + 88);
  }
  if ((v13 & 0x2000) != 0)
  {
    self->_isPaidSubscriberToFeed = *((unsigned char *)v5 + 173);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v5 + 3)) {
    -[NTPBFeedSubscribeUnsubscribe setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v5 + 4)) {
    -[NTPBFeedSubscribeUnsubscribe setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBFeedSubscribeUnsubscribe setCreativeId:](self, "setCreativeId:");
  }
  __int16 v14 = *((_WORD *)v5 + 88);
  if ((v14 & 0x100) != 0)
  {
    self->_uint64_t recommendationBrickType = v5[34];
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v14 = *((_WORD *)v5 + 88);
  }
  if ((v14 & 0x400) != 0)
  {
    self->_subscribeUnsubscribeSurfaceReason = v5[39];
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v5 + 2)) {
    -[NTPBFeedSubscribeUnsubscribe setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 15)) {
    -[NTPBFeedSubscribeUnsubscribe setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 16)) {
    -[NTPBFeedSubscribeUnsubscribe setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  __int16 v15 = *((_WORD *)v5 + 88);
  if ((v15 & 0x10) != 0)
  {
    self->_uint64_t feedSubscriptionOrigin = v5[18];
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v15 = *((_WORD *)v5 + 88);
  }
  if (v15)
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 14)) {
    -[NTPBFeedSubscribeUnsubscribe setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (int)displayRank
{
  return self->_displayRank;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
}

- (NSMutableArray)subscribedFeedIds
{
  return self->_subscribedFeedIds;
}

- (void)setSubscribedFeedIds:(id)a3
{
}

- (BOOL)cameFromGroup
{
  return self->_cameFromGroup;
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
}

- (BOOL)isPaidSubscriberToFeed
{
  return self->_isPaidSubscriberToFeed;
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (NSString)campaignType
{
  return self->_campaignType;
}

- (void)setCampaignType:(id)a3
{
}

- (NSString)creativeId
{
  return self->_creativeId;
}

- (void)setCreativeId:(id)a3
{
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)previousArticleId
{
  return self->_previousArticleId;
}

- (void)setPreviousArticleId:(id)a3
{
}

- (NSString)previousArticleVersion
{
  return self->_previousArticleVersion;
}

- (void)setPreviousArticleVersion:(id)a3
{
}

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end