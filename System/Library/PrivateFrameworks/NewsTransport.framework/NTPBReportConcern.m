@interface NTPBReportConcern
- (BOOL)hasArticleFeedCellHostType;
- (BOOL)hasArticleFeedCellSection;
- (BOOL)hasArticleParentFeedId;
- (BOOL)hasArticleParentFeedType;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasClientId;
- (BOOL)hasConcernComments;
- (BOOL)hasConcernReason;
- (BOOL)hasContentId;
- (BOOL)hasContentType;
- (BOOL)hasFeedFeedType;
- (BOOL)hasFeedPresentationSearchString;
- (BOOL)hasFeedViewPresentationReason;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasOriginProductType;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasUserId;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSString)articleParentFeedId;
- (NSString)clientId;
- (NSString)concernComments;
- (NSString)contentId;
- (NSString)feedPresentationSearchString;
- (NSString)referencedArticleId;
- (NSString)userId;
- (id)articleFeedCellHostTypeAsString:(int)a3;
- (id)articleFeedCellSectionAsString:(int)a3;
- (id)articleParentFeedTypeAsString:(int)a3;
- (id)contentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedFeedTypeAsString:(int)a3;
- (id)feedViewPresentationReasonAsString:(int)a3;
- (int)StringAsArticleFeedCellHostType:(id)a3;
- (int)StringAsArticleFeedCellSection:(id)a3;
- (int)StringAsArticleParentFeedType:(id)a3;
- (int)StringAsContentType:(id)a3;
- (int)StringAsFeedFeedType:(id)a3;
- (int)StringAsFeedViewPresentationReason:(id)a3;
- (int)articleFeedCellHostType;
- (int)articleFeedCellSection;
- (int)articleParentFeedType;
- (int)concernReason;
- (int)contentType;
- (int)feedFeedType;
- (int)feedViewPresentationReason;
- (int)originProductType;
- (int)reportVersion;
- (int64_t)backendArticleVersion;
- (int64_t)publisherArticleVersion;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setArticleFeedCellHostType:(int)a3;
- (void)setArticleFeedCellSection:(int)a3;
- (void)setArticleParentFeedId:(id)a3;
- (void)setArticleParentFeedType:(int)a3;
- (void)setBackendArticleVersion:(int64_t)a3;
- (void)setClientId:(id)a3;
- (void)setConcernComments:(id)a3;
- (void)setConcernReason:(int)a3;
- (void)setContentId:(id)a3;
- (void)setContentType:(int)a3;
- (void)setFeedFeedType:(int)a3;
- (void)setFeedPresentationSearchString:(id)a3;
- (void)setFeedViewPresentationReason:(int)a3;
- (void)setHasArticleFeedCellHostType:(BOOL)a3;
- (void)setHasArticleFeedCellSection:(BOOL)a3;
- (void)setHasArticleParentFeedType:(BOOL)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasConcernReason:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasFeedFeedType:(BOOL)a3;
- (void)setHasFeedViewPresentationReason:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasOriginProductType:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setOriginProductType:(int)a3;
- (void)setPublisherArticleVersion:(int64_t)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setReportVersion:(int)a3;
- (void)setUserId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBReportConcern

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (int)concernReason
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_concernReason;
  }
  else {
    return 0;
  }
}

- (void)setConcernReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_concernReason = a3;
}

- (void)setHasConcernReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasConcernReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasConcernComments
{
  return self->_concernComments != 0;
}

- (int)contentType
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

- (void)setContentType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasContentType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444AA58[a3];
  }

  return v3;
}

- (int)StringAsContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ARTICLE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"WEBVIEW_ARTICLE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FLINT_ARTICLE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO_ARTICLE_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AD_ARTICLE_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_WEBLINK_ARTICLE_TYPE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasContentId
{
  return self->_contentId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (void)setPublisherArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setBackendArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBackendArticleVersion
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasArticleParentFeedId
{
  return self->_articleParentFeedId != 0;
}

- (int)articleParentFeedType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_articleParentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setArticleParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_articleParentFeedType = a3;
}

- (void)setHasArticleParentFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasArticleParentFeedType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)articleParentFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444AA88[a3];
  }

  return v3;
}

- (int)StringAsArticleParentFeedType:(id)a3
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

- (int)feedFeedType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_feedFeedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_feedFeedType = a3;
}

- (void)setHasFeedFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFeedFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)feedFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444AA88[a3];
  }

  return v3;
}

- (int)StringAsFeedFeedType:(id)a3
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

- (int)articleFeedCellHostType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_articleFeedCellHostType;
  }
  else {
    return 0;
  }
}

- (void)setArticleFeedCellHostType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_articleFeedCellHostType = a3;
}

- (void)setHasArticleFeedCellHostType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasArticleFeedCellHostType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)articleFeedCellHostTypeAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444AB38[a3];
  }

  return v3;
}

- (int)StringAsArticleFeedCellHostType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"FEED_VIEW_CELL_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXCERPT_VIEW_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ARTICLE_VIEW_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"FEED_VIEW_CELL_PLAY_VIDEO_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FEED_VIEW_CELL_TAP_PLAY_VIDEO_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"EDITORIAL_HOMEPAGE_MEDIA_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"WIDGET_VIEW_PLAY_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_ARTICLE_HOST_VIEW_TYPE"])
  {
    int v4 = 8;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)articleFeedCellSection
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_articleFeedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setArticleFeedCellSection:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_articleFeedCellSection = a3;
}

- (void)setHasArticleFeedCellSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasArticleFeedCellSection
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)articleFeedCellSectionAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444AB80[a3];
  }

  return v3;
}

- (int)StringAsArticleFeedCellSection:(id)a3
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

- (int)feedViewPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_feedViewPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setFeedViewPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_feedViewPresentationReason = a3;
}

- (void)setHasFeedViewPresentationReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasFeedViewPresentationReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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
    __int16 v3 = off_26444AC10[a3];
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

- (BOOL)hasFeedPresentationSearchString
{
  return self->_feedPresentationSearchString != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (int)originProductType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_originProductType;
  }
  else {
    return 0;
  }
}

- (void)setOriginProductType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_originProductType = a3;
}

- (void)setHasOriginProductType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOriginProductType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBReportConcern;
  int v4 = [(NTPBReportConcern *)&v8 description];
  v5 = [(NTPBReportConcern *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  int v4 = [NSNumber numberWithInt:self->_reportVersion];
  [v3 setObject:v4 forKey:@"report_version"];

  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"client_id"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v6 = [NSNumber numberWithInt:self->_concernReason];
    [v3 setObject:v6 forKey:@"concern_reason"];
  }
  concernComments = self->_concernComments;
  if (concernComments) {
    [v3 setObject:concernComments forKey:@"concern_comments"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contentType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_26444AA58[contentType];
    }
    [v3 setObject:v9 forKey:@"content_type"];
  }
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"content_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v3 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v13 = [NSNumber numberWithLongLong:self->_publisherArticleVersion];
    [v3 setObject:v13 forKey:@"publisher_article_version"];

    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    v14 = [NSNumber numberWithLongLong:self->_backendArticleVersion];
    [v3 setObject:v14 forKey:@"backend_article_version"];
  }
  articleParentFeedId = self->_articleParentFeedId;
  if (articleParentFeedId) {
    [v3 setObject:articleParentFeedId forKey:@"article_parent_feed_id"];
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x10) != 0)
  {
    uint64_t articleParentFeedType = self->_articleParentFeedType;
    if (articleParentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleParentFeedType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_26444AA88[articleParentFeedType];
    }
    [v3 setObject:v18 forKey:@"article_parent_feed_type"];

    __int16 v16 = (__int16)self->_has;
    if ((v16 & 0x80) == 0)
    {
LABEL_24:
      if ((v16 & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_36;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_24;
  }
  uint64_t feedFeedType = self->_feedFeedType;
  if (feedFeedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedFeedType);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_26444AA88[feedFeedType];
  }
  [v3 setObject:v20 forKey:@"feed_feed_type"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 4) == 0)
  {
LABEL_25:
    if ((v16 & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_40;
  }
LABEL_36:
  uint64_t articleFeedCellHostType = self->_articleFeedCellHostType;
  if (articleFeedCellHostType >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleFeedCellHostType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_26444AB38[articleFeedCellHostType];
  }
  [v3 setObject:v22 forKey:@"article_feed_cell_host_type"];

  __int16 v16 = (__int16)self->_has;
  if ((v16 & 8) == 0)
  {
LABEL_26:
    if ((v16 & 0x100) == 0) {
      goto LABEL_48;
    }
    goto LABEL_44;
  }
LABEL_40:
  uint64_t articleFeedCellSection = self->_articleFeedCellSection;
  if (articleFeedCellSection >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleFeedCellSection);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = off_26444AB80[articleFeedCellSection];
  }
  [v3 setObject:v24 forKey:@"article_feed_cell_section"];

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_44:
    uint64_t feedViewPresentationReason = self->_feedViewPresentationReason;
    if (feedViewPresentationReason >= 0x2C)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedViewPresentationReason);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_26444AC10[feedViewPresentationReason];
    }
    [v3 setObject:v26 forKey:@"feed_view_presentation_reason"];
  }
LABEL_48:
  feedPresentationSearchString = self->_feedPresentationSearchString;
  if (feedPresentationSearchString) {
    [v3 setObject:feedPresentationSearchString forKey:@"feed_presentation_search_string"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v28 forKey:@"is_user_subscribed_to_feed"];
  }
  userId = self->_userId;
  if (userId) {
    [v3 setObject:userId forKey:@"user_id"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v30 = [NSNumber numberWithInt:self->_originProductType];
    [v3 setObject:v30 forKey:@"origin_product_type"];
  }
  id v31 = v3;

  return v31;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBReportConcernReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = v7;
  if (self->_concernComments)
  {
    PBDataWriterWriteStringField();
    int v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v7;
  }
  if (self->_contentId)
  {
    PBDataWriterWriteStringField();
    int v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    int v4 = v7;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    int v4 = v7;
  }
  if (self->_articleParentFeedId)
  {
    PBDataWriterWriteStringField();
    int v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_19:
      if ((v6 & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_38;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  int v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteInt32Field();
  int v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 8) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_39:
  PBDataWriterWriteInt32Field();
  int v4 = v7;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_22:
    PBDataWriterWriteInt32Field();
    int v4 = v7;
  }
LABEL_23:
  if (self->_feedPresentationSearchString)
  {
    PBDataWriterWriteStringField();
    int v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    int v4 = v7;
  }
  if (self->_referencedArticleId)
  {
    PBDataWriterWriteStringField();
    int v4 = v7;
  }
  if (self->_userId)
  {
    PBDataWriterWriteStringField();
    int v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    int v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 112) = self->_reportVersion;
  uint64_t v6 = [(NSString *)self->_clientId copyWithZone:a3];
  id v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_concernReason;
    *(_WORD *)(v5 + 132) |= 0x20u;
  }
  uint64_t v8 = [(NSString *)self->_concernComments copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_contentType;
    *(_WORD *)(v5 + 132) |= 0x40u;
  }
  uint64_t v10 = [(NSString *)self->_contentId copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_publisherArticleVersion;
    *(_WORD *)(v5 + 132) |= 2u;
    __int16 has = (__int16)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_backendArticleVersion;
    *(_WORD *)(v5 + 132) |= 1u;
  }
  uint64_t v13 = [(NSString *)self->_articleParentFeedId copyWithZone:a3];
  v14 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v13;

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_articleParentFeedType;
    *(_WORD *)(v5 + 132) |= 0x10u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x80) == 0)
    {
LABEL_11:
      if ((v15 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_22;
    }
  }
  else if ((v15 & 0x80) == 0)
  {
    goto LABEL_11;
  }
  *(_DWORD *)(v5 + 84) = self->_feedFeedType;
  *(_WORD *)(v5 + 132) |= 0x80u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 4) == 0)
  {
LABEL_12:
    if ((v15 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 24) = self->_articleFeedCellHostType;
  *(_WORD *)(v5 + 132) |= 4u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 8) == 0)
  {
LABEL_13:
    if ((v15 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_articleFeedCellSection;
  *(_WORD *)(v5 + 132) |= 8u;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 96) = self->_feedViewPresentationReason;
    *(_WORD *)(v5 + 132) |= 0x100u;
  }
LABEL_15:
  uint64_t v16 = [(NSString *)self->_feedPresentationSearchString copyWithZone:a3];
  v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_isUserSubscribedToFeed;
    *(_WORD *)(v5 + 132) |= 0x400u;
  }
  uint64_t v18 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  v19 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v18;

  uint64_t v20 = [(NSString *)self->_userId copyWithZone:a3];
  v21 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v20;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_originProductType;
    *(_WORD *)(v5 + 132) |= 0x200u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  if (self->_reportVersion != *((_DWORD *)v4 + 28)) {
    goto LABEL_79;
  }
  clientId = self->_clientId;
  if ((unint64_t)clientId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](clientId, "isEqual:")) {
      goto LABEL_79;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 66);
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_concernReason != *((_DWORD *)v4 + 16)) {
      goto LABEL_79;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  concernComments = self->_concernComments;
  if ((unint64_t)concernComments | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](concernComments, "isEqual:")) {
      goto LABEL_79;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)v4 + 66);
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_contentType != *((_DWORD *)v4 + 20)) {
      goto LABEL_79;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](contentId, "isEqual:")) {
      goto LABEL_79;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v11 = *((_WORD *)v4 + 66);
  if ((has & 2) != 0)
  {
    if ((v11 & 2) == 0 || self->_publisherArticleVersion != *((void *)v4 + 2)) {
      goto LABEL_79;
    }
  }
  else if ((v11 & 2) != 0)
  {
    goto LABEL_79;
  }
  if (has)
  {
    if ((v11 & 1) == 0 || self->_backendArticleVersion != *((void *)v4 + 1)) {
      goto LABEL_79;
    }
  }
  else if (v11)
  {
    goto LABEL_79;
  }
  articleParentFeedId = self->_articleParentFeedId;
  if ((unint64_t)articleParentFeedId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](articleParentFeedId, "isEqual:")) {
      goto LABEL_79;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v13 = *((_WORD *)v4 + 66);
  if ((has & 0x10) != 0)
  {
    if ((v13 & 0x10) == 0 || self->_articleParentFeedType != *((_DWORD *)v4 + 10)) {
      goto LABEL_79;
    }
  }
  else if ((v13 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0 || self->_feedFeedType != *((_DWORD *)v4 + 21)) {
      goto LABEL_79;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_articleFeedCellHostType != *((_DWORD *)v4 + 6)) {
      goto LABEL_79;
    }
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v13 & 8) == 0 || self->_articleFeedCellSection != *((_DWORD *)v4 + 7)) {
      goto LABEL_79;
    }
  }
  else if ((v13 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x100) == 0 || self->_feedViewPresentationReason != *((_DWORD *)v4 + 24)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  feedPresentationSearchString = self->_feedPresentationSearchString;
  if ((unint64_t)feedPresentationSearchString | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](feedPresentationSearchString, "isEqual:")) {
      goto LABEL_79;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x400) != 0)
    {
      if (self->_isUserSubscribedToFeed)
      {
        if (!*((unsigned char *)v4 + 128)) {
          goto LABEL_79;
        }
        goto LABEL_70;
      }
      if (!*((unsigned char *)v4 + 128)) {
        goto LABEL_70;
      }
    }
LABEL_79:
    BOOL v17 = 0;
    goto LABEL_80;
  }
  if ((*((_WORD *)v4 + 66) & 0x400) != 0) {
    goto LABEL_79;
  }
LABEL_70:
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 13)
    && !-[NSString isEqual:](referencedArticleId, "isEqual:"))
  {
    goto LABEL_79;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](userId, "isEqual:")) {
      goto LABEL_79;
    }
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 66) & 0x200) == 0 || self->_originProductType != *((_DWORD *)v4 + 25)) {
      goto LABEL_79;
    }
    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = (*((_WORD *)v4 + 66) & 0x200) == 0;
  }
LABEL_80:

  return v17;
}

- (unint64_t)hash
{
  uint64_t reportVersion = self->_reportVersion;
  NSUInteger v24 = [(NSString *)self->_clientId hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v23 = 2654435761 * self->_concernReason;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v22 = [(NSString *)self->_concernComments hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v21 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v21 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_contentId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v19 = 2654435761 * self->_publisherArticleVersion;
    if (has) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if (has)
    {
LABEL_9:
      uint64_t v18 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_12;
    }
  }
  uint64_t v18 = 0;
LABEL_12:
  NSUInteger v17 = [(NSString *)self->_articleParentFeedId hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_articleParentFeedType;
    if ((v4 & 0x80) != 0)
    {
LABEL_14:
      uint64_t v5 = 2654435761 * self->_feedFeedType;
      if ((v4 & 4) != 0) {
        goto LABEL_15;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((v4 & 0x80) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v5 = 0;
  if ((v4 & 4) != 0)
  {
LABEL_15:
    uint64_t v6 = 2654435761 * self->_articleFeedCellHostType;
    if ((v4 & 8) != 0) {
      goto LABEL_16;
    }
LABEL_21:
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_17;
    }
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v6 = 0;
  if ((v4 & 8) == 0) {
    goto LABEL_21;
  }
LABEL_16:
  uint64_t v7 = 2654435761 * self->_articleFeedCellSection;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_17:
    uint64_t v8 = 2654435761 * self->_feedViewPresentationReason;
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v8 = 0;
LABEL_23:
  NSUInteger v9 = [(NSString *)self->_feedPresentationSearchString hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v10 = 2654435761 * self->_isUserSubscribedToFeed;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_referencedArticleId hash];
  NSUInteger v12 = [(NSString *)self->_userId hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v13 = 2654435761 * self->_originProductType;
  }
  else {
    uint64_t v13 = 0;
  }
  return v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ (2654435761 * reportVersion) ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t reportVersion = *((_DWORD *)v4 + 28);
  id v7 = v4;
  if (*((void *)v4 + 6))
  {
    -[NTPBReportConcern setClientId:](self, "setClientId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x20) != 0)
  {
    self->_concernReason = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBReportConcern setConcernComments:](self, "setConcernComments:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x40) != 0)
  {
    self->_uint64_t contentType = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 9))
  {
    -[NTPBReportConcern setContentId:](self, "setContentId:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 66);
  if ((v5 & 2) != 0)
  {
    self->_publisherArticleVersion = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 66);
  }
  if (v5)
  {
    self->_backendArticleVersion = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBReportConcern setArticleParentFeedId:](self, "setArticleParentFeedId:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 0x10) != 0)
  {
    self->_uint64_t articleParentFeedType = *((_DWORD *)v4 + 10);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v6 = *((_WORD *)v4 + 66);
    if ((v6 & 0x80) == 0)
    {
LABEL_19:
      if ((v6 & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_38;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_19;
  }
  self->_uint64_t feedFeedType = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 8) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_uint64_t articleFeedCellHostType = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 4u;
  __int16 v6 = *((_WORD *)v4 + 66);
  if ((v6 & 8) == 0)
  {
LABEL_21:
    if ((v6 & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_39:
  self->_uint64_t articleFeedCellSection = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 66) & 0x100) != 0)
  {
LABEL_22:
    self->_uint64_t feedViewPresentationReason = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
LABEL_23:
  if (*((void *)v4 + 11))
  {
    -[NTPBReportConcern setFeedPresentationSearchString:](self, "setFeedPresentationSearchString:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x400) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v4 + 128);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v4 + 13))
  {
    -[NTPBReportConcern setReferencedArticleId:](self, "setReferencedArticleId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 15))
  {
    -[NTPBReportConcern setUserId:](self, "setUserId:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 66) & 0x200) != 0)
  {
    self->_originProductType = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_has |= 0x200u;
  }
}

- (int)reportVersion
{
  return self->_reportVersion;
}

- (void)setReportVersion:(int)a3
{
  self->_uint64_t reportVersion = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)concernComments
{
  return self->_concernComments;
}

- (void)setConcernComments:(id)a3
{
}

- (NSString)contentId
{
  return self->_contentId;
}

- (void)setContentId:(id)a3
{
}

- (NSString)referencedArticleId
{
  return self->_referencedArticleId;
}

- (void)setReferencedArticleId:(id)a3
{
}

- (int64_t)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int64_t)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (NSString)articleParentFeedId
{
  return self->_articleParentFeedId;
}

- (void)setArticleParentFeedId:(id)a3
{
}

- (NSString)feedPresentationSearchString
{
  return self->_feedPresentationSearchString;
}

- (void)setFeedPresentationSearchString:(id)a3
{
}

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_feedPresentationSearchString, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_concernComments, 0);
  objc_storeStrong((id *)&self->_clientId, 0);

  objc_storeStrong((id *)&self->_articleParentFeedId, 0);
}

@end