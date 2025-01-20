@interface NTPBFeedViewExposure
- (BOOL)adSupportedChannel;
- (BOOL)cameFromGroup;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasAreaPresentationReason;
- (BOOL)hasCameFromGroup;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasCountOfTotalGroupExposures;
- (BOOL)hasCountOfTotalGroupsExposed;
- (BOOL)hasCreativeId;
- (BOOL)hasFeedCellHostType;
- (BOOL)hasFeedCellSection;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIsNewUserToFeed;
- (BOOL)hasIsPaidSubscriberToFeed;
- (BOOL)hasIsSubscribedToGroupFeed;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasPresentationReason;
- (BOOL)hasPresentationReasonSearchString;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasPreviousArticlePublisherArticleVersion;
- (BOOL)hasPreviousArticleVersion;
- (BOOL)hasRankInToc;
- (BOOL)hasReferringSourceApplication;
- (BOOL)hasReferringUrl;
- (BOOL)hasSessionEndReason;
- (BOOL)hasSourceChannelId;
- (BOOL)hasUserActivityType;
- (BOOL)hasViewFrameInScreen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNewUserToFeed;
- (BOOL)isPaidSubscriberToFeed;
- (BOOL)isSubscribedToGroupFeed;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)feedId;
- (NSString)presentationReasonSearchString;
- (NSString)previousArticleId;
- (NSString)previousArticleVersion;
- (NSString)referringSourceApplication;
- (NSString)referringUrl;
- (NSString)sourceChannelId;
- (NSString)userActivityType;
- (NSString)viewFrameInScreen;
- (id)areaPresentationReasonAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedCellHostTypeAsString:(int)a3;
- (id)feedCellSectionAsString:(int)a3;
- (id)feedTypeAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (id)presentationReasonAsString:(int)a3;
- (id)sessionEndReasonAsString:(int)a3;
- (int)StringAsAreaPresentationReason:(id)a3;
- (int)StringAsFeedCellHostType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPresentationReason:(id)a3;
- (int)StringAsSessionEndReason:(id)a3;
- (int)areaPresentationReason;
- (int)countOfTotalGroupExposures;
- (int)countOfTotalGroupsExposed;
- (int)feedCellHostType;
- (int)feedCellSection;
- (int)feedType;
- (int)groupType;
- (int)presentationReason;
- (int)rankInToc;
- (int)sessionEndReason;
- (int64_t)previousArticlePublisherArticleVersion;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setAreaPresentationReason:(int)a3;
- (void)setCameFromGroup:(BOOL)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setCountOfTotalGroupExposures:(int)a3;
- (void)setCountOfTotalGroupsExposed:(int)a3;
- (void)setCreativeId:(id)a3;
- (void)setFeedCellHostType:(int)a3;
- (void)setFeedCellSection:(int)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasAreaPresentationReason:(BOOL)a3;
- (void)setHasCameFromGroup:(BOOL)a3;
- (void)setHasCountOfTotalGroupExposures:(BOOL)a3;
- (void)setHasCountOfTotalGroupsExposed:(BOOL)a3;
- (void)setHasFeedCellHostType:(BOOL)a3;
- (void)setHasFeedCellSection:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsNewUserToFeed:(BOOL)a3;
- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3;
- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasPresentationReason:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasRankInToc:(BOOL)a3;
- (void)setHasSessionEndReason:(BOOL)a3;
- (void)setIsNewUserToFeed:(BOOL)a3;
- (void)setIsPaidSubscriberToFeed:(BOOL)a3;
- (void)setIsSubscribedToGroupFeed:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setPresentationReason:(int)a3;
- (void)setPresentationReasonSearchString:(id)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setRankInToc:(int)a3;
- (void)setReferringSourceApplication:(id)a3;
- (void)setReferringUrl:(id)a3;
- (void)setSessionEndReason:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setUserActivityType:(id)a3;
- (void)setViewFrameInScreen:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBFeedViewExposure

- (int)feedType
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasFeedType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444C8E8[a3];
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

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)presentationReason
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_presentationReason;
  }
  else {
    return 0;
  }
}

- (void)setPresentationReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_presentationReason = a3;
}

- (void)setHasPresentationReason:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPresentationReason
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (id)presentationReasonAsString:(int)a3
{
  if (a3 >= 0x2C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444C998[a3];
  }

  return v3;
}

- (int)StringAsPresentationReason:(id)a3
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

- (BOOL)hasPresentationReasonSearchString
{
  return self->_presentationReasonSearchString != 0;
}

- (BOOL)hasViewFrameInScreen
{
  return self->_viewFrameInScreen != 0;
}

- (int)feedCellSection
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_feedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellSection:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasFeedCellSection
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444CAF8[a3];
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_feedCellHostType;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellHostType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_feedCellHostType = a3;
}

- (void)setHasFeedCellHostType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasFeedCellHostType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)feedCellHostTypeAsString:(int)a3
{
  if (a3 >= 0x11)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444CB88[a3];
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

- (void)setIsNewUserToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isNewUserToFeed = a3;
}

- (void)setHasIsNewUserToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsNewUserToFeed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (void)setCameFromGroup:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_cameFromGroup = a3;
}

- (void)setHasCameFromGroup:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasCameFromGroup
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)groupType
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasGroupType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444CC10[a3];
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

- (void)setIsSubscribedToGroupFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isSubscribedToGroupFeed = a3;
}

- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsSubscribedToGroupFeed
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCountOfTotalGroupExposures:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_countOfTotalGroupExposures = a3;
}

- (void)setHasCountOfTotalGroupExposures:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasCountOfTotalGroupExposures
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCountOfTotalGroupsExposed:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_countOfTotalGroupsExposed = a3;
}

- (void)setHasCountOfTotalGroupsExposed:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasCountOfTotalGroupsExposed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsPaidSubscriberToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPaidSubscriberToFeed = a3;
}

- (void)setHasIsPaidSubscriberToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToFeed
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
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

- (int)areaPresentationReason
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_areaPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setAreaPresentationReason:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_areaPresentationReason = a3;
}

- (void)setHasAreaPresentationReason:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAreaPresentationReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)areaPresentationReasonAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444CD50[a3];
  }

  return v3;
}

- (int)StringAsAreaPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FROM_FOR_YOU_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FROM_FAVORITES_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_FAVORITES_AREA_PRESENTATION_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FROM_EXPLORE_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_EDITORS_PICKS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_RECOMMENDED_AREA_PRESENTATION_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"FROM_EXPLORE_BROWSE_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_CHANNELS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_FEATURED_TOPICS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_CHANNELS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_EXPLORE_BROWSE_TOPICS_AREA_PRESENTATION_REASON"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FROM_SEARCH_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_IN_SEARCH_AREA_PRESENTATION_REASON"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FROM_SEARCH_RESULTS_LIST_AREA_PRESENTATION_REASON"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_MAIN_AREA_PRESENTATION_REASON"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"FROM_SAVED_HISTORY_AREA_PRESENTATION_REASON"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_BUTTON_TAP_AREA_PRESENTATION_REASON"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"FROM_DISCOVER_MORE_BACK_TAP_AREA_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"FROM_ARTICLE_AREA_PRESENTATION_REASON"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"FROM_FEED_AREA_PRESENTATION_REASON"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"FROM_TOC_AREA_VIEW_PRESENTATION_REASON"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (void)setRankInToc:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rankInToc = a3;
}

- (void)setHasRankInToc:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRankInToc
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)sessionEndReason
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_sessionEndReason;
  }
  else {
    return 0;
  }
}

- (void)setSessionEndReason:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_sessionEndReason = a3;
}

- (void)setHasSessionEndReason:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($EF4891B5BA640532944CBDAFC895D309)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasSessionEndReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)sessionEndReasonAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444CE00[a3];
  }

  return v3;
}

- (int)StringAsSessionEndReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SESSION_END_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"READING_HISTORY_CLEAR_SESSION_END_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APP_BACKGROUND_SESSION_END_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FORCE_QUIT_SESSION_END_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCAL_NOTIFICATION_RECEIVED_RESET_USER_ID_SESSION_END_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ICLOUD_SYNCED_SESSION_END_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WIDGET_VIDEO_PLAYER_DISMISSED_SESSION_END_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"USER_NAVIGATION_SESSION_END_REASON"])
  {
    int v4 = 7;
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
  v8.super_class = (Class)NTPBFeedViewExposure;
  int v4 = [(NTPBFeedViewExposure *)&v8 description];
  v5 = [(NTPBFeedViewExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444C8E8[feedType];
    }
    [v3 setObject:v5 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v8 forKey:@"is_user_subscribed_to_feed"];

    $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    uint64_t presentationReason = self->_presentationReason;
    if (presentationReason >= 0x2C)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_presentationReason);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_26444C998[presentationReason];
    }
    [v3 setObject:v10 forKey:@"presentation_reason"];
  }
  presentationReasonSearchString = self->_presentationReasonSearchString;
  if (presentationReasonSearchString) {
    [v3 setObject:presentationReasonSearchString forKey:@"presentation_reason_search_string"];
  }
  viewFrameInScreen = self->_viewFrameInScreen;
  if (viewFrameInScreen) {
    [v3 setObject:viewFrameInScreen forKey:@"view_frame_in_screen"];
  }
  $EF4891B5BA640532944CBDAFC895D309 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) != 0)
  {
    uint64_t feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellSection);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_26444CAF8[feedCellSection];
    }
    [v3 setObject:v15 forKey:@"feed_cell_section"];

    $EF4891B5BA640532944CBDAFC895D309 v13 = self->_has;
  }
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
    uint64_t feedCellHostType = self->_feedCellHostType;
    if (feedCellHostType >= 0x11)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellHostType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_26444CB88[feedCellHostType];
    }
    [v3 setObject:v17 forKey:@"feed_cell_host_type"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_isNewUserToFeed];
    [v3 setObject:v19 forKey:@"is_new_user_to_feed"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication) {
    [v3 setObject:referringSourceApplication forKey:@"referring_source_application"];
  }
  referringUrl = self->_referringUrl;
  if (referringUrl) {
    [v3 setObject:referringUrl forKey:@"referring_url"];
  }
  userActivityType = self->_userActivityType;
  if (userActivityType) {
    [v3 setObject:userActivityType forKey:@"user_activity_type"];
  }
  $EF4891B5BA640532944CBDAFC895D309 v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x1000) != 0)
  {
    v31 = [NSNumber numberWithBool:self->_cameFromGroup];
    [v3 setObject:v31 forKey:@"came_from_group"];

    $EF4891B5BA640532944CBDAFC895D309 v24 = self->_has;
    if ((*(unsigned char *)&v24 & 0x80) == 0)
    {
LABEL_43:
      if ((*(_WORD *)&v24 & 0x8000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_78;
    }
  }
  else if ((*(unsigned char *)&v24 & 0x80) == 0)
  {
    goto LABEL_43;
  }
  uint64_t groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = off_26444CC10[groupType];
  }
  [v3 setObject:v33 forKey:@"group_type"];

  $EF4891B5BA640532944CBDAFC895D309 v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x8000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v24 & 4) == 0) {
      goto LABEL_45;
    }
    goto LABEL_79;
  }
LABEL_78:
  v42 = [NSNumber numberWithBool:self->_isSubscribedToGroupFeed];
  [v3 setObject:v42 forKey:@"is_subscribed_to_group_feed"];

  $EF4891B5BA640532944CBDAFC895D309 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 4) == 0)
  {
LABEL_45:
    if ((*(unsigned char *)&v24 & 8) == 0) {
      goto LABEL_46;
    }
    goto LABEL_80;
  }
LABEL_79:
  v43 = [NSNumber numberWithInt:self->_countOfTotalGroupExposures];
  [v3 setObject:v43 forKey:@"count_of_total_group_exposures"];

  $EF4891B5BA640532944CBDAFC895D309 v24 = self->_has;
  if ((*(unsigned char *)&v24 & 8) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v24 & 0x4000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_81;
  }
LABEL_80:
  v44 = [NSNumber numberWithInt:self->_countOfTotalGroupsExposed];
  [v3 setObject:v44 forKey:@"count_of_total_groups_exposed"];

  $EF4891B5BA640532944CBDAFC895D309 v24 = self->_has;
  if ((*(_WORD *)&v24 & 0x4000) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v24 & 0x800) == 0) {
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_81:
  v45 = [NSNumber numberWithBool:self->_isPaidSubscriberToFeed];
  [v3 setObject:v45 forKey:@"is_paid_subscriber_to_feed"];

  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_48:
    v25 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v25 forKey:@"ad_supported_channel"];
  }
LABEL_49:
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t areaPresentationReason = self->_areaPresentationReason;
    if (areaPresentationReason >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_areaPresentationReason);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_26444CD50[areaPresentationReason];
    }
    [v3 setObject:v30 forKey:@"area_presentation_reason"];
  }
  previousArticleId = self->_previousArticleId;
  if (previousArticleId) {
    [v3 setObject:previousArticleId forKey:@"previous_article_id"];
  }
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion) {
    [v3 setObject:previousArticleVersion forKey:@"previous_article_version"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v36 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v36 forKey:@"previous_article_publisher_article_version"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v3 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  $EF4891B5BA640532944CBDAFC895D309 v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x200) != 0)
  {
    v39 = [NSNumber numberWithInt:self->_rankInToc];
    [v3 setObject:v39 forKey:@"rank_in_toc"];

    $EF4891B5BA640532944CBDAFC895D309 v38 = self->_has;
  }
  if ((*(_WORD *)&v38 & 0x400) != 0)
  {
    uint64_t sessionEndReason = self->_sessionEndReason;
    if (sessionEndReason >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sessionEndReason);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_26444CE00[sessionEndReason];
    }
    [v3 setObject:v41 forKey:@"session_end_reason"];
  }
  id v46 = v3;

  return v46;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBFeedViewExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_presentationReasonSearchString) {
    PBDataWriterWriteStringField();
  }
  if (self->_viewFrameInScreen) {
    PBDataWriterWriteStringField();
  }
  $EF4891B5BA640532944CBDAFC895D309 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    $EF4891B5BA640532944CBDAFC895D309 v5 = self->_has;
  }
  if ((*(unsigned char *)&v5 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_referringSourceApplication) {
    PBDataWriterWriteStringField();
  }
  if (self->_referringUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_userActivityType) {
    PBDataWriterWriteStringField();
  }
  $EF4891B5BA640532944CBDAFC895D309 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $EF4891B5BA640532944CBDAFC895D309 v6 = self->_has;
    if ((*(unsigned char *)&v6 & 0x80) == 0)
    {
LABEL_31:
      if ((*(_WORD *)&v6 & 0x8000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt32Field();
  $EF4891B5BA640532944CBDAFC895D309 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  $EF4891B5BA640532944CBDAFC895D309 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteInt32Field();
  $EF4891B5BA640532944CBDAFC895D309 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteInt32Field();
  $EF4891B5BA640532944CBDAFC895D309 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_65:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_36:
  }
    PBDataWriterWriteBOOLField();
LABEL_37:
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_creativeId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_previousArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleVersion) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_groupViewExposureId) {
    PBDataWriterWriteDataField();
  }
  $EF4891B5BA640532944CBDAFC895D309 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $EF4891B5BA640532944CBDAFC895D309 v7 = self->_has;
  }
  if ((*(_WORD *)&v7 & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_feedType;
    *(_DWORD *)(v5 + 200) |= 0x40u;
  }
  uint64_t v7 = [(NSString *)self->_feedId copyWithZone:a3];
  id v8 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v7;

  $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(unsigned char *)(v6 + 197) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 200) |= 0x10000u;
    $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_presentationReason;
    *(_DWORD *)(v6 + 200) |= 0x100u;
  }
  uint64_t v10 = [(NSString *)self->_presentationReasonSearchString copyWithZone:a3];
  v11 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v10;

  uint64_t v12 = [(NSString *)self->_viewFrameInScreen copyWithZone:a3];
  $EF4891B5BA640532944CBDAFC895D309 v13 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v12;

  $EF4891B5BA640532944CBDAFC895D309 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_feedCellSection;
    *(_DWORD *)(v6 + 200) |= 0x20u;
    $EF4891B5BA640532944CBDAFC895D309 v14 = self->_has;
  }
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_feedCellHostType;
    *(_DWORD *)(v6 + 200) |= 0x10u;
  }
  uint64_t v15 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v16 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v15;

  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 194) = self->_isNewUserToFeed;
    *(_DWORD *)(v6 + 200) |= 0x2000u;
  }
  uint64_t v17 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v18 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v17;

  uint64_t v19 = [(NSString *)self->_referringSourceApplication copyWithZone:a3];
  v20 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v19;

  uint64_t v21 = [(NSString *)self->_referringUrl copyWithZone:a3];
  v22 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v21;

  uint64_t v23 = [(NSString *)self->_userActivityType copyWithZone:a3];
  $EF4891B5BA640532944CBDAFC895D309 v24 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v23;

  $EF4891B5BA640532944CBDAFC895D309 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x1000) != 0)
  {
    *(unsigned char *)(v6 + 193) = self->_cameFromGroup;
    *(_DWORD *)(v6 + 200) |= 0x1000u;
    $EF4891B5BA640532944CBDAFC895D309 v25 = self->_has;
    if ((*(unsigned char *)&v25 & 0x80) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v25 & 0x8000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_32;
    }
  }
  else if ((*(unsigned char *)&v25 & 0x80) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v6 + 88) = self->_groupType;
  *(_DWORD *)(v6 + 200) |= 0x80u;
  $EF4891B5BA640532944CBDAFC895D309 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x8000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&v25 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(unsigned char *)(v6 + 196) = self->_isSubscribedToGroupFeed;
  *(_DWORD *)(v6 + 200) |= 0x8000u;
  $EF4891B5BA640532944CBDAFC895D309 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 4) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&v25 & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v6 + 40) = self->_countOfTotalGroupExposures;
  *(_DWORD *)(v6 + 200) |= 4u;
  $EF4891B5BA640532944CBDAFC895D309 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 8) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v25 & 0x4000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v6 + 44) = self->_countOfTotalGroupsExposed;
  *(_DWORD *)(v6 + 200) |= 8u;
  $EF4891B5BA640532944CBDAFC895D309 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v25 & 0x800) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_35:
  *(unsigned char *)(v6 + 195) = self->_isPaidSubscriberToFeed;
  *(_DWORD *)(v6 + 200) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_20:
    *(unsigned char *)(v6 + 192) = self->_adSupportedChannel;
    *(_DWORD *)(v6 + 200) |= 0x800u;
  }
LABEL_21:
  uint64_t v26 = [(NSString *)self->_campaignId copyWithZone:a3];
  v27 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v26;

  uint64_t v28 = [(NSString *)self->_campaignType copyWithZone:a3];
  v29 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v28;

  uint64_t v30 = [(NSString *)self->_creativeId copyWithZone:a3];
  v31 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v30;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_areaPresentationReason;
    *(_DWORD *)(v6 + 200) |= 2u;
  }
  uint64_t v32 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v33 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v32;

  uint64_t v34 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v35 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v34;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 200) |= 1u;
  }
  uint64_t v36 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v37 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v36;

  $EF4891B5BA640532944CBDAFC895D309 v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_rankInToc;
    *(_DWORD *)(v6 + 200) |= 0x200u;
    $EF4891B5BA640532944CBDAFC895D309 v38 = self->_has;
  }
  if ((*(_WORD *)&v38 & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_sessionEndReason;
    *(_DWORD *)(v6 + 200) |= 0x400u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_136;
  }
  $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  int v6 = *((_DWORD *)v4 + 50);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_feedType != *((_DWORD *)v4 + 18)) {
      goto LABEL_136;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_136;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_136;
    }
    $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 50);
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0) {
      goto LABEL_136;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 197)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 197))
    {
      goto LABEL_136;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_presentationReason != *((_DWORD *)v4 + 26)) {
      goto LABEL_136;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_136;
  }
  presentationReasonSearchString = self->_presentationReasonSearchString;
  if ((unint64_t)presentationReasonSearchString | *((void *)v4 + 14)
    && !-[NSString isEqual:](presentationReasonSearchString, "isEqual:"))
  {
    goto LABEL_136;
  }
  viewFrameInScreen = self->_viewFrameInScreen;
  if ((unint64_t)viewFrameInScreen | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](viewFrameInScreen, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $EF4891B5BA640532944CBDAFC895D309 v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 50);
  if ((*(unsigned char *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 15)) {
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_feedCellHostType != *((_DWORD *)v4 + 14)) {
      goto LABEL_136;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_136;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_136;
    }
    $EF4891B5BA640532944CBDAFC895D309 v11 = self->_has;
  }
  int v14 = *((_DWORD *)v4 + 50);
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v14 & 0x2000) == 0) {
      goto LABEL_136;
    }
    if (self->_isNewUserToFeed)
    {
      if (!*((unsigned char *)v4 + 194)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 194))
    {
      goto LABEL_136;
    }
  }
  else if ((v14 & 0x2000) != 0)
  {
    goto LABEL_136;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 21)
    && !-[NSString isEqual:](sourceChannelId, "isEqual:"))
  {
    goto LABEL_136;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](referringSourceApplication, "isEqual:")) {
      goto LABEL_136;
    }
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:")) {
      goto LABEL_136;
    }
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $EF4891B5BA640532944CBDAFC895D309 v19 = self->_has;
  int v20 = *((_DWORD *)v4 + 50);
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    if ((v20 & 0x1000) == 0) {
      goto LABEL_136;
    }
    if (self->_cameFromGroup)
    {
      if (!*((unsigned char *)v4 + 193)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 193))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x1000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_groupType != *((_DWORD *)v4 + 22)) {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v19 & 0x8000) != 0)
  {
    if ((v20 & 0x8000) == 0) {
      goto LABEL_136;
    }
    if (self->_isSubscribedToGroupFeed)
    {
      if (!*((unsigned char *)v4 + 196)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 196))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x8000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_countOfTotalGroupExposures != *((_DWORD *)v4 + 10)) {
      goto LABEL_136;
    }
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&v19 & 8) != 0)
  {
    if ((v20 & 8) == 0 || self->_countOfTotalGroupsExposed != *((_DWORD *)v4 + 11)) {
      goto LABEL_136;
    }
  }
  else if ((v20 & 8) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v19 & 0x4000) != 0)
  {
    if ((v20 & 0x4000) == 0) {
      goto LABEL_136;
    }
    if (self->_isPaidSubscriberToFeed)
    {
      if (!*((unsigned char *)v4 + 195)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 195))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x4000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
    if ((v20 & 0x800) == 0) {
      goto LABEL_136;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 192)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)v4 + 192))
    {
      goto LABEL_136;
    }
  }
  else if ((v20 & 0x800) != 0)
  {
    goto LABEL_136;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 3) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_136;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_136;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_136;
    }
  }
  int v24 = *((_DWORD *)v4 + 50);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_areaPresentationReason != *((_DWORD *)v4 + 4)) {
      goto LABEL_136;
    }
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_136;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 15)
    && !-[NSString isEqual:](previousArticleId, "isEqual:"))
  {
    goto LABEL_136;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_136;
    }
  }
  $EF4891B5BA640532944CBDAFC895D309 v27 = self->_has;
  int v28 = *((_DWORD *)v4 + 50);
  if (*(unsigned char *)&v27)
  {
    if ((v28 & 1) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 1)) {
      goto LABEL_136;
    }
  }
  else if (v28)
  {
    goto LABEL_136;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 12))
  {
    if (-[NSData isEqual:](groupViewExposureId, "isEqual:"))
    {
      $EF4891B5BA640532944CBDAFC895D309 v27 = self->_has;
      goto LABEL_126;
    }
LABEL_136:
    BOOL v31 = 0;
    goto LABEL_137;
  }
LABEL_126:
  int v30 = *((_DWORD *)v4 + 50);
  if ((*(_WORD *)&v27 & 0x200) != 0)
  {
    if ((v30 & 0x200) == 0 || self->_rankInToc != *((_DWORD *)v4 + 34)) {
      goto LABEL_136;
    }
  }
  else if ((v30 & 0x200) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v27 & 0x400) != 0)
  {
    if ((v30 & 0x400) == 0 || self->_sessionEndReason != *((_DWORD *)v4 + 40)) {
      goto LABEL_136;
    }
    BOOL v31 = 1;
  }
  else
  {
    BOOL v31 = (*((_DWORD *)v4 + 50) & 0x400) == 0;
  }
LABEL_137:

  return v31;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v39 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v39 = 0;
  }
  NSUInteger v38 = [(NSString *)self->_feedId hash];
  $EF4891B5BA640532944CBDAFC895D309 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    uint64_t v37 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v37 = 0;
    if ((*(_WORD *)&has & 0x100) != 0)
    {
LABEL_6:
      uint64_t v36 = 2654435761 * self->_presentationReason;
      goto LABEL_9;
    }
  }
  uint64_t v36 = 0;
LABEL_9:
  NSUInteger v35 = [(NSString *)self->_presentationReasonSearchString hash];
  NSUInteger v34 = [(NSString *)self->_viewFrameInScreen hash];
  $EF4891B5BA640532944CBDAFC895D309 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
    uint64_t v33 = 2654435761 * self->_feedCellSection;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0)
    {
LABEL_11:
      uint64_t v32 = 2654435761 * self->_feedCellHostType;
      goto LABEL_14;
    }
  }
  uint64_t v32 = 0;
LABEL_14:
  uint64_t v31 = [(NSData *)self->_feedViewExposureId hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v30 = 2654435761 * self->_isNewUserToFeed;
  }
  else {
    uint64_t v30 = 0;
  }
  NSUInteger v29 = [(NSString *)self->_sourceChannelId hash];
  NSUInteger v28 = [(NSString *)self->_referringSourceApplication hash];
  NSUInteger v27 = [(NSString *)self->_referringUrl hash];
  NSUInteger v26 = [(NSString *)self->_userActivityType hash];
  $EF4891B5BA640532944CBDAFC895D309 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    uint64_t v25 = 2654435761 * self->_cameFromGroup;
    if ((*(unsigned char *)&v5 & 0x80) != 0)
    {
LABEL_19:
      uint64_t v24 = 2654435761 * self->_groupType;
      if ((*(_WORD *)&v5 & 0x8000) != 0) {
        goto LABEL_20;
      }
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_19;
    }
  }
  uint64_t v24 = 0;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_20:
    uint64_t v23 = 2654435761 * self->_isSubscribedToGroupFeed;
    if ((*(unsigned char *)&v5 & 4) != 0) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v23 = 0;
  if ((*(unsigned char *)&v5 & 4) != 0)
  {
LABEL_21:
    uint64_t v22 = 2654435761 * self->_countOfTotalGroupExposures;
    if ((*(unsigned char *)&v5 & 8) != 0) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&v5 & 8) != 0)
  {
LABEL_22:
    uint64_t v21 = 2654435761 * self->_countOfTotalGroupsExposed;
    if ((*(_WORD *)&v5 & 0x4000) != 0) {
      goto LABEL_23;
    }
LABEL_30:
    uint64_t v20 = 0;
    if ((*(_WORD *)&v5 & 0x800) != 0) {
      goto LABEL_24;
    }
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v5 & 0x4000) == 0) {
    goto LABEL_30;
  }
LABEL_23:
  uint64_t v20 = 2654435761 * self->_isPaidSubscriberToFeed;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
LABEL_24:
    NSUInteger v6 = [(NSString *)self->_campaignId hash];
    goto LABEL_32;
  }
LABEL_31:
  NSUInteger v6 = [(NSString *)self->_campaignId hash];
LABEL_32:
  NSUInteger v7 = v6;
  NSUInteger v8 = [(NSString *)self->_campaignType hash];
  NSUInteger v9 = [(NSString *)self->_creativeId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_areaPresentationReason;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v12 = [(NSString *)self->_previousArticleVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v13 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v13 = 0;
  }
  uint64_t v14 = [(NSData *)self->_groupViewExposureId hash];
  $EF4891B5BA640532944CBDAFC895D309 v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x200) != 0)
  {
    uint64_t v16 = 2654435761 * self->_rankInToc;
    if ((*(_WORD *)&v15 & 0x400) != 0) {
      goto LABEL_40;
    }
LABEL_42:
    uint64_t v17 = 0;
    return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
  }
  uint64_t v16 = 0;
  if ((*(_WORD *)&v15 & 0x400) == 0) {
    goto LABEL_42;
  }
LABEL_40:
  uint64_t v17 = 2654435761 * self->_sessionEndReason;
  return v38 ^ v39 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 200) & 0x40) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v4 + 18);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  id v9 = v4;
  if (*((void *)v4 + 8))
  {
    -[NTPBFeedViewExposure setFeedId:](self, "setFeedId:");
    id v4 = v9;
  }
  int v5 = *((_DWORD *)v4 + 50);
  if ((v5 & 0x10000) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v4 + 197);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v5 = *((_DWORD *)v4 + 50);
  }
  if ((v5 & 0x100) != 0)
  {
    self->_uint64_t presentationReason = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 14))
  {
    -[NTPBFeedViewExposure setPresentationReasonSearchString:](self, "setPresentationReasonSearchString:");
    id v4 = v9;
  }
  if (*((void *)v4 + 23))
  {
    -[NTPBFeedViewExposure setViewFrameInScreen:](self, "setViewFrameInScreen:");
    id v4 = v9;
  }
  int v6 = *((_DWORD *)v4 + 50);
  if ((v6 & 0x20) != 0)
  {
    self->_uint64_t feedCellSection = *((_DWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x20u;
    int v6 = *((_DWORD *)v4 + 50);
  }
  if ((v6 & 0x10) != 0)
  {
    self->_uint64_t feedCellHostType = *((_DWORD *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 10))
  {
    -[NTPBFeedViewExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 201) & 0x20) != 0)
  {
    self->_isNewUserToFeed = *((unsigned char *)v4 + 194);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  if (*((void *)v4 + 21))
  {
    -[NTPBFeedViewExposure setSourceChannelId:](self, "setSourceChannelId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 18))
  {
    -[NTPBFeedViewExposure setReferringSourceApplication:](self, "setReferringSourceApplication:");
    id v4 = v9;
  }
  if (*((void *)v4 + 19))
  {
    -[NTPBFeedViewExposure setReferringUrl:](self, "setReferringUrl:");
    id v4 = v9;
  }
  if (*((void *)v4 + 22))
  {
    -[NTPBFeedViewExposure setUserActivityType:](self, "setUserActivityType:");
    id v4 = v9;
  }
  int v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 0x1000) != 0)
  {
    self->_cameFromGroup = *((unsigned char *)v4 + 193);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v7 = *((_DWORD *)v4 + 50);
    if ((v7 & 0x80) == 0)
    {
LABEL_31:
      if ((v7 & 0x8000) == 0) {
        goto LABEL_32;
      }
      goto LABEL_62;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  self->_uint64_t groupType = *((_DWORD *)v4 + 22);
  *(_DWORD *)&self->_has |= 0x80u;
  int v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 0x8000) == 0)
  {
LABEL_32:
    if ((v7 & 4) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_isSubscribedToGroupFeed = *((unsigned char *)v4 + 196);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 4) == 0)
  {
LABEL_33:
    if ((v7 & 8) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_countOfTotalGroupExposures = *((_DWORD *)v4 + 10);
  *(_DWORD *)&self->_has |= 4u;
  int v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 8) == 0)
  {
LABEL_34:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_countOfTotalGroupsExposed = *((_DWORD *)v4 + 11);
  *(_DWORD *)&self->_has |= 8u;
  int v7 = *((_DWORD *)v4 + 50);
  if ((v7 & 0x4000) == 0)
  {
LABEL_35:
    if ((v7 & 0x800) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_65:
  self->_isPaidSubscriberToFeed = *((unsigned char *)v4 + 195);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 50) & 0x800) != 0)
  {
LABEL_36:
    self->_adSupportedChannel = *((unsigned char *)v4 + 192);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_37:
  if (*((void *)v4 + 3))
  {
    -[NTPBFeedViewExposure setCampaignId:](self, "setCampaignId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBFeedViewExposure setCampaignType:](self, "setCampaignType:");
    id v4 = v9;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBFeedViewExposure setCreativeId:](self, "setCreativeId:");
    id v4 = v9;
  }
  if ((*((unsigned char *)v4 + 200) & 2) != 0)
  {
    self->_uint64_t areaPresentationReason = *((_DWORD *)v4 + 4);
    *(_DWORD *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 15))
  {
    -[NTPBFeedViewExposure setPreviousArticleId:](self, "setPreviousArticleId:");
    id v4 = v9;
  }
  if (*((void *)v4 + 16))
  {
    -[NTPBFeedViewExposure setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 200))
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 12))
  {
    -[NTPBFeedViewExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
    id v4 = v9;
  }
  int v8 = *((_DWORD *)v4 + 50);
  if ((v8 & 0x200) != 0)
  {
    self->_rankInToc = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_has |= 0x200u;
    int v8 = *((_DWORD *)v4 + 50);
  }
  if ((v8 & 0x400) != 0)
  {
    self->_uint64_t sessionEndReason = *((_DWORD *)v4 + 40);
    *(_DWORD *)&self->_has |= 0x400u;
  }
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSString)presentationReasonSearchString
{
  return self->_presentationReasonSearchString;
}

- (void)setPresentationReasonSearchString:(id)a3
{
}

- (NSString)viewFrameInScreen
{
  return self->_viewFrameInScreen;
}

- (void)setViewFrameInScreen:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (BOOL)isNewUserToFeed
{
  return self->_isNewUserToFeed;
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
}

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
}

- (BOOL)cameFromGroup
{
  return self->_cameFromGroup;
}

- (BOOL)isSubscribedToGroupFeed
{
  return self->_isSubscribedToGroupFeed;
}

- (int)countOfTotalGroupExposures
{
  return self->_countOfTotalGroupExposures;
}

- (int)countOfTotalGroupsExposed
{
  return self->_countOfTotalGroupsExposed;
}

- (BOOL)isPaidSubscriberToFeed
{
  return self->_isPaidSubscriberToFeed;
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
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

- (int)rankInToc
{
  return self->_rankInToc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewFrameInScreen, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_presentationReasonSearchString, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);

  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end