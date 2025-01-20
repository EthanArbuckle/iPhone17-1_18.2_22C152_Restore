@interface NTPBChannelMuteUnmute
- (BOOL)hasArticleId;
- (BOOL)hasArticleSessionId;
- (BOOL)hasArticleSessionIdDeprecated;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasArticleViewingSessionIdDeprecated;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasChannelMuteUnmuteFeedId;
- (BOOL)hasCreativeId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasFeedViewExposureIdDeprecated;
- (BOOL)hasFeedViewPresentationReason;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIsSearchResultArticle;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasMuteUnmuteLocation;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasPreviousArticlePublisherArticleVersion;
- (BOOL)hasPreviousArticleVersion;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasUserAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSearchResultArticle;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)articleSessionId;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSString)articleId;
- (NSString)articleSessionIdDeprecated;
- (NSString)articleViewingSessionIdDeprecated;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)channelMuteUnmuteFeedId;
- (NSString)creativeId;
- (NSString)feedViewExposureIdDeprecated;
- (NSString)previousArticleId;
- (NSString)previousArticleVersion;
- (NSString)referencedArticleId;
- (NSString)sourceChannelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)feedViewPresentationReasonAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsFeedViewPresentationReason:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)feedType;
- (int)feedViewPresentationReason;
- (int)groupType;
- (int)muteUnmuteLocation;
- (int)userAction;
- (int64_t)previousArticlePublisherArticleVersion;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleSessionId:(id)a3;
- (void)setArticleSessionIdDeprecated:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setArticleViewingSessionIdDeprecated:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelMuteUnmuteFeedId:(id)a3;
- (void)setCreativeId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setFeedViewExposureIdDeprecated:(id)a3;
- (void)setFeedViewPresentationReason:(int)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasFeedViewPresentationReason:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsSearchResultArticle:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasMuteUnmuteLocation:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIsSearchResultArticle:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setMuteUnmuteLocation:(int)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBChannelMuteUnmute

- (int)userAction
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasUserAction
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (int)muteUnmuteLocation
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_muteUnmuteLocation;
  }
  else {
    return 0;
  }
}

- (void)setMuteUnmuteLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_muteUnmuteLocation = a3;
}

- (void)setHasMuteUnmuteLocation:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMuteUnmuteLocation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasArticleSessionIdDeprecated
{
  return self->_articleSessionIdDeprecated != 0;
}

- (BOOL)hasArticleViewingSessionIdDeprecated
{
  return self->_articleViewingSessionIdDeprecated != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)feedType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
    char v3 = off_264448AA0[a3];
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

- (BOOL)hasChannelMuteUnmuteFeedId
{
  return self->_channelMuteUnmuteFeedId != 0;
}

- (BOOL)hasFeedViewExposureIdDeprecated
{
  return self->_feedViewExposureIdDeprecated != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (int)groupType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGroupType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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
    char v3 = off_264448B50[a3];
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

- (int)feedViewPresentationReason
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_feedViewPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setFeedViewPresentationReason:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_feedViewPresentationReason = a3;
}

- (void)setHasFeedViewPresentationReason:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedViewPresentationReason
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)feedViewPresentationReasonAsString:(int)a3
{
  if (a3 >= 0x2C)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264448C90[a3];
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

- (void)setIsSearchResultArticle:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isSearchResultArticle = a3;
}

- (void)setHasIsSearchResultArticle:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsSearchResultArticle
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
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
  *(unsigned char *)&self->_has |= 1u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBChannelMuteUnmute;
  int v4 = [(NTPBChannelMuteUnmute *)&v8 description];
  v5 = [(NTPBChannelMuteUnmute *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v5 forKey:@"user_action"];

    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_muteUnmuteLocation];
    [v3 setObject:v6 forKey:@"mute_unmute_location"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v3 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  articleSessionIdDeprecated = self->_articleSessionIdDeprecated;
  if (articleSessionIdDeprecated) {
    [v3 setObject:articleSessionIdDeprecated forKey:@"article_session_id_deprecated"];
  }
  articleViewingSessionIdDeprecated = self->_articleViewingSessionIdDeprecated;
  if (articleViewingSessionIdDeprecated) {
    [v3 setObject:articleViewingSessionIdDeprecated forKey:@"article_viewing_session_id_deprecated"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_264448AA0[feedType];
    }
    [v3 setObject:v13 forKey:@"feed_type"];
  }
  channelMuteUnmuteFeedId = self->_channelMuteUnmuteFeedId;
  if (channelMuteUnmuteFeedId) {
    [v3 setObject:channelMuteUnmuteFeedId forKey:@"channel_mute_unmute_feed_id"];
  }
  feedViewExposureIdDeprecated = self->_feedViewExposureIdDeprecated;
  if (feedViewExposureIdDeprecated) {
    [v3 setObject:feedViewExposureIdDeprecated forKey:@"feed_view_exposure_id_deprecated"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v16 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v16 forKey:@"is_user_subscribed_to_feed"];
  }
  articleSessionId = self->_articleSessionId;
  if (articleSessionId) {
    [v3 setObject:articleSessionId forKey:@"article_session_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_264448B50[groupType];
    }
    [v3 setObject:v21 forKey:@"group_type"];
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
  char v25 = (char)self->_has;
  if ((v25 & 4) != 0)
  {
    uint64_t feedViewPresentationReason = self->_feedViewPresentationReason;
    if (feedViewPresentationReason >= 0x2C)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedViewPresentationReason);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = off_264448C90[feedViewPresentationReason];
    }
    [v3 setObject:v27 forKey:@"feed_view_presentation_reason"];

    char v25 = (char)self->_has;
  }
  if ((v25 & 0x40) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_isSearchResultArticle];
    [v3 setObject:v28 forKey:@"is_search_result_article"];
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
    v31 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v31 forKey:@"previous_article_publisher_article_version"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v3 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  id v33 = v3;

  return v33;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBChannelMuteUnmuteReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_referencedArticleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_articleSessionIdDeprecated)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_articleViewingSessionIdDeprecated)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_channelMuteUnmuteFeedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_feedViewExposureIdDeprecated)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_articleSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_feedViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_campaignType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_creativeId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_previousArticleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_previousArticleVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_userAction;
    *(unsigned char *)(v5 + 176) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_muteUnmuteLocation;
    *(unsigned char *)(v5 + 176) |= 0x10u;
  }
  uint64_t v8 = [(NSString *)self->_articleId copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  v11 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v10;

  uint64_t v12 = [(NSString *)self->_articleSessionIdDeprecated copyWithZone:a3];
  v13 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v12;

  uint64_t v14 = [(NSString *)self->_articleViewingSessionIdDeprecated copyWithZone:a3];
  v15 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v17 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v16;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_feedType;
    *(unsigned char *)(v6 + 176) |= 2u;
  }
  uint64_t v18 = [(NSString *)self->_channelMuteUnmuteFeedId copyWithZone:a3];
  v19 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v18;

  uint64_t v20 = [(NSString *)self->_feedViewExposureIdDeprecated copyWithZone:a3];
  v21 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v20;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v6 + 173) = self->_isUserSubscribedToFeed;
    *(unsigned char *)(v6 + 176) |= 0x80u;
  }
  uint64_t v22 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  v23 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v22;

  uint64_t v24 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  char v25 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v24;

  uint64_t v26 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v27 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v26;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 116) = self->_groupType;
    *(unsigned char *)(v6 + 176) |= 8u;
  }
  uint64_t v28 = [(NSString *)self->_campaignId copyWithZone:a3];
  v29 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v28;

  uint64_t v30 = [(NSString *)self->_campaignType copyWithZone:a3];
  v31 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v30;

  uint64_t v32 = [(NSString *)self->_creativeId copyWithZone:a3];
  id v33 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v32;

  char v34 = (char)self->_has;
  if ((v34 & 4) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_feedViewPresentationReason;
    *(unsigned char *)(v6 + 176) |= 4u;
    char v34 = (char)self->_has;
  }
  if ((v34 & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 172) = self->_isSearchResultArticle;
    *(unsigned char *)(v6 + 176) |= 0x40u;
  }
  uint64_t v35 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v36 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v35;

  uint64_t v37 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v38 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v37;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_previousArticlePublisherArticleVersion;
    *(unsigned char *)(v6 + 176) |= 1u;
  }
  uint64_t v39 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v40 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v39;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[176] & 0x20) == 0 || self->_userAction != *((_DWORD *)v4 + 42)) {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 0x20) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v4[176] & 0x10) == 0 || self->_muteUnmuteLocation != *((_DWORD *)v4 + 32)) {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 0x10) != 0)
  {
    goto LABEL_43;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 2) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_43;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  articleSessionIdDeprecated = self->_articleSessionIdDeprecated;
  if ((unint64_t)articleSessionIdDeprecated | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](articleSessionIdDeprecated, "isEqual:")) {
      goto LABEL_43;
    }
  }
  articleViewingSessionIdDeprecated = self->_articleViewingSessionIdDeprecated;
  if ((unint64_t)articleViewingSessionIdDeprecated | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleViewingSessionIdDeprecated, "isEqual:")) {
      goto LABEL_43;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[176] & 2) == 0 || self->_feedType != *((_DWORD *)v4 + 22)) {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 2) != 0)
  {
    goto LABEL_43;
  }
  channelMuteUnmuteFeedId = self->_channelMuteUnmuteFeedId;
  if ((unint64_t)channelMuteUnmuteFeedId | *((void *)v4 + 9)
    && !-[NSString isEqual:](channelMuteUnmuteFeedId, "isEqual:"))
  {
    goto LABEL_43;
  }
  feedViewExposureIdDeprecated = self->_feedViewExposureIdDeprecated;
  if ((unint64_t)feedViewExposureIdDeprecated | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](feedViewExposureIdDeprecated, "isEqual:")) {
      goto LABEL_43;
    }
  }
  int v12 = v4[176];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    if ((v12 & 0x80000000) == 0) {
      goto LABEL_43;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!v4[173]) {
        goto LABEL_43;
      }
    }
    else if (v4[173])
    {
      goto LABEL_43;
    }
  }
  else if (v12 < 0)
  {
    goto LABEL_43;
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 3)
    && !-[NSData isEqual:](articleSessionId, "isEqual:"))
  {
    goto LABEL_43;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[176] & 8) == 0 || self->_groupType != *((_DWORD *)v4 + 29)) {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 8) != 0)
  {
    goto LABEL_43;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 7) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_43;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_43;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v4[176] & 4) == 0 || self->_feedViewPresentationReason != *((_DWORD *)v4 + 28)) {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 4) != 0)
  {
    goto LABEL_43;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[176] & 0x40) == 0) {
      goto LABEL_43;
    }
    if (self->_isSearchResultArticle)
    {
      if (!v4[172]) {
        goto LABEL_43;
      }
    }
    else if (v4[172])
    {
      goto LABEL_43;
    }
  }
  else if ((v4[176] & 0x40) != 0)
  {
    goto LABEL_43;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 17)
    && !-[NSString isEqual:](previousArticleId, "isEqual:"))
  {
    goto LABEL_43;
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_43;
    }
  }
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((v4[176] & 1) == 0) {
      goto LABEL_80;
    }
LABEL_43:
    char v16 = 0;
    goto LABEL_44;
  }
  if ((v4[176] & 1) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 1)) {
    goto LABEL_43;
  }
LABEL_80:
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 15)) {
    char v16 = -[NSData isEqual:](groupViewExposureId, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_44:

  return v16;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v3 = 2654435761 * self->_userAction;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v29 = v3;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v19 = 2654435761 * self->_muteUnmuteLocation;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  NSUInteger v5 = [(NSString *)self->_referencedArticleId hash];
  NSUInteger v6 = [(NSString *)self->_articleSessionIdDeprecated hash];
  NSUInteger v7 = [(NSString *)self->_articleViewingSessionIdDeprecated hash];
  NSUInteger v28 = [(NSString *)self->_sourceChannelId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v18 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v18 = 0;
  }
  NSUInteger v8 = [(NSString *)self->_channelMuteUnmuteFeedId hash];
  NSUInteger v9 = [(NSString *)self->_feedViewExposureIdDeprecated hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v27 = 2654435761 * self->_isUserSubscribedToFeed;
  }
  else {
    uint64_t v27 = 0;
  }
  uint64_t v26 = [(NSData *)self->_articleSessionId hash];
  uint64_t v25 = [(NSData *)self->_articleViewingSessionId hash];
  uint64_t v24 = [(NSData *)self->_feedViewExposureId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v17 = 0;
  }
  NSUInteger v23 = [(NSString *)self->_campaignId hash];
  NSUInteger v22 = [(NSString *)self->_campaignType hash];
  NSUInteger v10 = [(NSString *)self->_creativeId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_feedViewPresentationReason;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v20 = v11;
  NSUInteger v21 = v10;
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v12 = 2654435761 * self->_isSearchResultArticle;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v14 = [(NSString *)self->_previousArticleVersion hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v15 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v15 = 0;
  }
  return v19 ^ v29 ^ v4 ^ v5 ^ v6 ^ v7 ^ v28 ^ v18 ^ v8 ^ v9 ^ v27 ^ v26 ^ v25 ^ v24 ^ v17 ^ v23 ^ v22 ^ v21 ^ v20 ^ v12 ^ v13 ^ v14 ^ v15 ^ [(NSData *)self->_groupViewExposureId hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (char *)a3;
  char v5 = v4[176];
  if ((v5 & 0x20) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 42);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = v4[176];
  }
  if ((v5 & 0x10) != 0)
  {
    self->_muteUnmuteLocation = *((_DWORD *)v4 + 32);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  NSUInteger v7 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBChannelMuteUnmute setArticleId:](self, "setArticleId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 19))
  {
    -[NTPBChannelMuteUnmute setReferencedArticleId:](self, "setReferencedArticleId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBChannelMuteUnmute setArticleSessionIdDeprecated:](self, "setArticleSessionIdDeprecated:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBChannelMuteUnmute setArticleViewingSessionIdDeprecated:](self, "setArticleViewingSessionIdDeprecated:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 20))
  {
    -[NTPBChannelMuteUnmute setSourceChannelId:](self, "setSourceChannelId:");
    NSUInteger v4 = v7;
  }
  if ((v4[176] & 2) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 9))
  {
    -[NTPBChannelMuteUnmute setChannelMuteUnmuteFeedId:](self, "setChannelMuteUnmuteFeedId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[NTPBChannelMuteUnmute setFeedViewExposureIdDeprecated:](self, "setFeedViewExposureIdDeprecated:");
    NSUInteger v4 = v7;
  }
  if (v4[176] < 0)
  {
    self->_isUserSubscribedToFeed = v4[173];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 3))
  {
    -[NTPBChannelMuteUnmute setArticleSessionId:](self, "setArticleSessionId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[NTPBChannelMuteUnmute setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 12))
  {
    -[NTPBChannelMuteUnmute setFeedViewExposureId:](self, "setFeedViewExposureId:");
    NSUInteger v4 = v7;
  }
  if ((v4[176] & 8) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 29);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBChannelMuteUnmute setCampaignId:](self, "setCampaignId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[NTPBChannelMuteUnmute setCampaignType:](self, "setCampaignType:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 10))
  {
    -[NTPBChannelMuteUnmute setCreativeId:](self, "setCreativeId:");
    NSUInteger v4 = v7;
  }
  char v6 = v4[176];
  if ((v6 & 4) != 0)
  {
    self->_uint64_t feedViewPresentationReason = *((_DWORD *)v4 + 28);
    *(unsigned char *)&self->_has |= 4u;
    char v6 = v4[176];
  }
  if ((v6 & 0x40) != 0)
  {
    self->_isSearchResultArticle = v4[172];
    *(unsigned char *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 17))
  {
    -[NTPBChannelMuteUnmute setPreviousArticleId:](self, "setPreviousArticleId:");
    NSUInteger v4 = v7;
  }
  if (*((void *)v4 + 18))
  {
    -[NTPBChannelMuteUnmute setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
    NSUInteger v4 = v7;
  }
  if (v4[176])
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 15))
  {
    -[NTPBChannelMuteUnmute setGroupViewExposureId:](self, "setGroupViewExposureId:");
    NSUInteger v4 = v7;
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

- (NSString)articleSessionIdDeprecated
{
  return self->_articleSessionIdDeprecated;
}

- (void)setArticleSessionIdDeprecated:(id)a3
{
}

- (NSString)articleViewingSessionIdDeprecated
{
  return self->_articleViewingSessionIdDeprecated;
}

- (void)setArticleViewingSessionIdDeprecated:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)channelMuteUnmuteFeedId
{
  return self->_channelMuteUnmuteFeedId;
}

- (void)setChannelMuteUnmuteFeedId:(id)a3
{
}

- (NSString)feedViewExposureIdDeprecated
{
  return self->_feedViewExposureIdDeprecated;
}

- (void)setFeedViewExposureIdDeprecated:(id)a3
{
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSData)articleSessionId
{
  return self->_articleSessionId;
}

- (void)setArticleSessionId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
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

- (BOOL)isSearchResultArticle
{
  return self->_isSearchResultArticle;
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
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureIdDeprecated, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelMuteUnmuteFeedId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionIdDeprecated, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionIdDeprecated, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end