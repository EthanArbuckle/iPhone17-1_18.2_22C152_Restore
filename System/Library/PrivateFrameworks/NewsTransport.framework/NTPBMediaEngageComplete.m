@interface NTPBMediaEngageComplete
+ (Class)fractionalCohortMembershipType;
+ (Class)namedEntitiesType;
+ (Class)topicIdsType;
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasAlternateHeadline;
- (BOOL)hasArticleId;
- (BOOL)hasArticleSessionId;
- (BOOL)hasArticleType;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasFeedCellSection;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIadNativeAd;
- (BOOL)hasIadNativeCampaign;
- (BOOL)hasIadNativeCampaignAd;
- (BOOL)hasIadNativeLine;
- (BOOL)hasIsBreakingNewsArticle;
- (BOOL)hasIsDigitalReplicaAd;
- (BOOL)hasIsNativeAd;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasIsVideoInFeed;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasMediaDuration;
- (BOOL)hasMediaId;
- (BOOL)hasMediaPlayLocation;
- (BOOL)hasMediaTimePlayed;
- (BOOL)hasMediaType;
- (BOOL)hasMetadata;
- (BOOL)hasNativeCampaignData;
- (BOOL)hasPersonalizationTreatmentId;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasPreviousArticlePublisherArticleVersion;
- (BOOL)hasPreviousArticleVersion;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasPublisherArticleVersionInt64;
- (BOOL)hasRankInVideoPlaylist;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasSectionHeadlineId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedBySectionId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)hasVideoType;
- (BOOL)hasWidgetEngagement;
- (BOOL)isBreakingNewsArticle;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNativeAd;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)isVideoInFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)articleSessionId;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSMutableArray)namedEntities;
- (NSMutableArray)topicIds;
- (NSString)articleId;
- (NSString)feedId;
- (NSString)groupFeedId;
- (NSString)iadNativeAd;
- (NSString)iadNativeCampaign;
- (NSString)iadNativeCampaignAd;
- (NSString)iadNativeLine;
- (NSString)mediaId;
- (NSString)metadata;
- (NSString)nativeCampaignData;
- (NSString)previousArticleId;
- (NSString)previousArticleVersion;
- (NSString)referencedArticleId;
- (NSString)sectionHeadlineId;
- (NSString)sourceChannelId;
- (NSString)surfacedByChannelId;
- (NSString)surfacedBySectionId;
- (NSString)surfacedByTopicId;
- (NTPBAlternateHeadline)alternateHeadline;
- (NTPBIssueData)issueData;
- (NTPBIssueExposureData)issueExposureData;
- (NTPBIssueViewData)issueViewData;
- (NTPBWidgetEngagement)widgetEngagement;
- (id)articleTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedCellSectionAsString:(int)a3;
- (id)feedTypeAsString:(int)a3;
- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3;
- (id)groupTypeAsString:(int)a3;
- (id)mediaTypeAsString:(int)a3;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (id)topicIdsAtIndex:(unint64_t)a3;
- (id)videoTypeAsString:(int)a3;
- (int)StringAsArticleType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)StringAsVideoType:(id)a3;
- (int)articleType;
- (int)backendArticleVersion;
- (int)feedCellSection;
- (int)feedType;
- (int)groupType;
- (int)mediaPlayLocation;
- (int)mediaType;
- (int)publisherArticleVersion;
- (int)rankInVideoPlaylist;
- (int)videoType;
- (int64_t)backendArticleVersionInt64;
- (int64_t)mediaDuration;
- (int64_t)mediaTimePlayed;
- (int64_t)personalizationTreatmentId;
- (int64_t)previousArticlePublisherArticleVersion;
- (int64_t)publisherArticleVersionInt64;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)hash;
- (unint64_t)namedEntitiesCount;
- (unint64_t)topicIdsCount;
- (void)addFractionalCohortMembership:(id)a3;
- (void)addNamedEntities:(id)a3;
- (void)addTopicIds:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)clearNamedEntities;
- (void)clearTopicIds;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setAlternateHeadline:(id)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleSessionId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setBackendArticleVersion:(int)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setFeedCellSection:(int)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasArticleType:(BOOL)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasBackendArticleVersionInt64:(BOOL)a3;
- (void)setHasFeedCellSection:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsBreakingNewsArticle:(BOOL)a3;
- (void)setHasIsDigitalReplicaAd:(BOOL)a3;
- (void)setHasIsNativeAd:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasIsVideoInFeed:(BOOL)a3;
- (void)setHasMediaDuration:(BOOL)a3;
- (void)setHasMediaPlayLocation:(BOOL)a3;
- (void)setHasMediaTimePlayed:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setHasRankInVideoPlaylist:(BOOL)a3;
- (void)setHasVideoType:(BOOL)a3;
- (void)setIadNativeAd:(id)a3;
- (void)setIadNativeCampaign:(id)a3;
- (void)setIadNativeCampaignAd:(id)a3;
- (void)setIadNativeLine:(id)a3;
- (void)setIsBreakingNewsArticle:(BOOL)a3;
- (void)setIsDigitalReplicaAd:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIsVideoInFeed:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setMediaDuration:(int64_t)a3;
- (void)setMediaId:(id)a3;
- (void)setMediaPlayLocation:(int)a3;
- (void)setMediaTimePlayed:(int64_t)a3;
- (void)setMediaType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setNamedEntities:(id)a3;
- (void)setNativeCampaignData:(id)a3;
- (void)setPersonalizationTreatmentId:(int64_t)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setPublisherArticleVersion:(int)a3;
- (void)setPublisherArticleVersionInt64:(int64_t)a3;
- (void)setRankInVideoPlaylist:(int)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setSectionHeadlineId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedBySectionId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)setTopicIds:(id)a3;
- (void)setVideoType:(int)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBMediaEngageComplete

- (int)mediaType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_mediaType;
  }
  else {
    return 0;
  }
}

- (void)setMediaType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_264449668[a3];
  }

  return v3;
}

- (int)StringAsMediaType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_MEDIA_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GALLERY_MEDIA_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IMAGE_MEDIA_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"VIDEO_MEDIA_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"AUDIO_MEDIA_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INTERACTIVE_WIDGET_MEDIA_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"MAP_MEDIA_TYPE"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasMediaId
{
  return self->_mediaId != 0;
}

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)feedType
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasFeedType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
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
    int v3 = off_2644496A0[a3];
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

- (int)feedCellSection
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_feedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellSection:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeedCellSection
{
  return *((unsigned char *)&self->_has + 1) & 1;
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
    int v3 = off_264449750[a3];
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

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (int)articleType
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasArticleType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_2644497E0[a3];
  }

  return v3;
}

- (int)StringAsArticleType:(id)a3
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

- (void)clearNamedEntities
{
}

- (void)addNamedEntities:(id)a3
{
  id v4 = a3;
  namedEntities = self->_namedEntities;
  id v8 = v4;
  if (!namedEntities)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_namedEntities;
    self->_namedEntities = v6;

    id v4 = v8;
    namedEntities = self->_namedEntities;
  }
  [(NSMutableArray *)namedEntities addObject:v4];
}

- (unint64_t)namedEntitiesCount
{
  return [(NSMutableArray *)self->_namedEntities count];
}

- (id)namedEntitiesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_namedEntities objectAtIndex:a3];
}

+ (Class)namedEntitiesType
{
  return (Class)objc_opt_class();
}

- (void)setPublisherArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (BOOL)hasSurfacedByChannelId
{
  return self->_surfacedByChannelId != 0;
}

- (BOOL)hasSurfacedBySectionId
{
  return self->_surfacedBySectionId != 0;
}

- (BOOL)hasSurfacedByTopicId
{
  return self->_surfacedByTopicId != 0;
}

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
}

- (void)setIsDigitalReplicaAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)mediaPlayLocation
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_mediaPlayLocation;
  }
  else {
    return 0;
  }
}

- (void)setMediaPlayLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mediaPlayLocation = a3;
}

- (void)setHasMediaPlayLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMediaPlayLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsVideoInFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setMediaDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_mediaDuration = a3;
}

- (void)setHasMediaDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasMediaDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMediaTimePlayed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_mediaTimePlayed = a3;
}

- (void)setHasMediaTimePlayed:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasMediaTimePlayed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasNativeCampaignData
{
  return self->_nativeCampaignData != 0;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasPreviousArticleId
{
  return self->_previousArticleId != 0;
}

- (BOOL)hasPreviousArticleVersion
{
  return self->_previousArticleVersion != 0;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
}

- (int)groupType
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
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
    int v3 = off_264449810[a3];
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

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (void)setIsBreakingNewsArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)clearFractionalCohortMemberships
{
}

- (void)addFractionalCohortMembership:(id)a3
{
  id v4 = a3;
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  id v8 = v4;
  if (!fractionalCohortMemberships)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_fractionalCohortMemberships;
    self->_fractionalCohortMemberships = v6;

    id v4 = v8;
    fractionalCohortMemberships = self->_fractionalCohortMemberships;
  }
  [(NSMutableArray *)fractionalCohortMemberships addObject:v4];
}

- (unint64_t)fractionalCohortMembershipsCount
{
  return [(NSMutableArray *)self->_fractionalCohortMemberships count];
}

- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_fractionalCohortMemberships objectAtIndex:a3];
}

+ (Class)fractionalCohortMembershipType
{
  return (Class)objc_opt_class();
}

- (int)videoType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_videoType;
  }
  else {
    return 0;
  }
}

- (void)setVideoType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_videoType = a3;
}

- (void)setHasVideoType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVideoType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)videoTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_264449950[a3];
  }

  return v3;
}

- (int)StringAsVideoType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VIDEO_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ANF_VIDEO_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_EMBED_VIDEO_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasIadNativeCampaign
{
  return self->_iadNativeCampaign != 0;
}

- (BOOL)hasIadNativeLine
{
  return self->_iadNativeLine != 0;
}

- (BOOL)hasIadNativeAd
{
  return self->_iadNativeAd != 0;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (BOOL)hasAlternateHeadline
{
  return self->_alternateHeadline != 0;
}

- (void)setRankInVideoPlaylist:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_rankInVideoPlaylist = a3;
}

- (void)setHasRankInVideoPlaylist:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D13936C5278104CB1C8259D497E97548)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRankInVideoPlaylist
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (void)clearTopicIds
{
}

- (void)addTopicIds:(id)a3
{
  id v4 = a3;
  topicIds = self->_topicIds;
  id v8 = v4;
  if (!topicIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_topicIds;
    self->_topicIds = v6;

    id v4 = v8;
    topicIds = self->_topicIds;
  }
  [(NSMutableArray *)topicIds addObject:v4];
}

- (unint64_t)topicIdsCount
{
  return [(NSMutableArray *)self->_topicIds count];
}

- (id)topicIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_topicIds objectAtIndex:a3];
}

+ (Class)topicIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBMediaEngageComplete;
  id v4 = [(NTPBMediaEngageComplete *)&v8 description];
  v5 = [(NTPBMediaEngageComplete *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    uint64_t mediaType = self->_mediaType;
    if (mediaType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264449668[mediaType];
    }
    [v3 setObject:v5 forKey:@"media_type"];
  }
  mediaId = self->_mediaId;
  if (mediaId) {
    [v3 setObject:mediaId forKey:@"media_id"];
  }
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v3 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  articleSessionId = self->_articleSessionId;
  if (articleSessionId) {
    [v3 setObject:articleSessionId forKey:@"article_session_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v3 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_2644496A0[feedType];
    }
    [v3 setObject:v13 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    uint64_t feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellSection);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_264449750[feedCellSection];
    }
    [v3 setObject:v16 forKey:@"feed_cell_section"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  $D13936C5278104CB1C8259D497E97548 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v19 forKey:@"is_user_subscribed_to_feed"];

    $D13936C5278104CB1C8259D497E97548 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    uint64_t articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_2644497E0[articleType];
    }
    [v3 setObject:v21 forKey:@"article_type"];
  }
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v3 setObject:namedEntities forKey:@"named_entities"];
  }
  $D13936C5278104CB1C8259D497E97548 v23 = self->_has;
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    v39 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v3 setObject:v39 forKey:@"publisher_article_version"];

    $D13936C5278104CB1C8259D497E97548 v23 = self->_has;
    if ((*(unsigned char *)&v23 & 0x80) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v23 & 0x10000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&v23 & 0x80) == 0)
  {
    goto LABEL_43;
  }
  v40 = [NSNumber numberWithInt:self->_backendArticleVersion];
  [v3 setObject:v40 forKey:@"backend_article_version"];

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_44:
    v24 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v24 forKey:@"ad_supported_channel"];
  }
LABEL_45:
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId) {
    [v3 setObject:surfacedByChannelId forKey:@"surfaced_by_channel_id"];
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if (surfacedBySectionId) {
    [v3 setObject:surfacedBySectionId forKey:@"surfaced_by_section_id"];
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId) {
    [v3 setObject:surfacedByTopicId forKey:@"surfaced_by_topic_id"];
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId) {
    [v3 setObject:sectionHeadlineId forKey:@"section_headline_id"];
  }
  $D13936C5278104CB1C8259D497E97548 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x40000) != 0)
  {
    v41 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v3 setObject:v41 forKey:@"is_digital_replica_ad"];

    $D13936C5278104CB1C8259D497E97548 v29 = self->_has;
    if ((*(unsigned char *)&v29 & 8) == 0)
    {
LABEL_55:
      if ((*(_WORD *)&v29 & 0x800) == 0) {
        goto LABEL_56;
      }
      goto LABEL_79;
    }
  }
  else if ((*(unsigned char *)&v29 & 8) == 0)
  {
    goto LABEL_55;
  }
  v42 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
  [v3 setObject:v42 forKey:@"personalization_treatment_id"];

  $D13936C5278104CB1C8259D497E97548 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v29 & 0x200000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_80;
  }
LABEL_79:
  v43 = [NSNumber numberWithInt:self->_mediaPlayLocation];
  [v3 setObject:v43 forKey:@"media_play_location"];

  $D13936C5278104CB1C8259D497E97548 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x200000) == 0)
  {
LABEL_57:
    if ((*(unsigned char *)&v29 & 2) == 0) {
      goto LABEL_58;
    }
    goto LABEL_81;
  }
LABEL_80:
  v44 = [NSNumber numberWithBool:self->_isVideoInFeed];
  [v3 setObject:v44 forKey:@"is_video_in_feed"];

  $D13936C5278104CB1C8259D497E97548 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 2) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v29 & 4) == 0) {
      goto LABEL_59;
    }
    goto LABEL_82;
  }
LABEL_81:
  v45 = [NSNumber numberWithLongLong:self->_mediaDuration];
  [v3 setObject:v45 forKey:@"media_duration"];

  $D13936C5278104CB1C8259D497E97548 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 4) == 0)
  {
LABEL_59:
    if ((*(_DWORD *)&v29 & 0x80000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_60;
  }
LABEL_82:
  v46 = [NSNumber numberWithLongLong:self->_mediaTimePlayed];
  [v3 setObject:v46 forKey:@"media_time_played"];

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_60:
    v30 = [NSNumber numberWithBool:self->_isNativeAd];
    [v3 setObject:v30 forKey:@"is_native_ad"];
  }
LABEL_61:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData) {
    [v3 setObject:nativeCampaignData forKey:@"native_campaign_data"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v3 setObject:metadata forKey:@"metadata"];
  }
  previousArticleId = self->_previousArticleId;
  if (previousArticleId) {
    [v3 setObject:previousArticleId forKey:@"previous_article_id"];
  }
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion) {
    [v3 setObject:previousArticleVersion forKey:@"previous_article_version"];
  }
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    v36 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v36 forKey:@"widget_engagement"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_264449810[groupType];
    }
    [v3 setObject:v38 forKey:@"group_type"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    v48 = [NSNumber numberWithBool:self->_isBreakingNewsArticle];
    [v3 setObject:v48 forKey:@"is_breaking_news_article"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v49 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    v50 = self->_fractionalCohortMemberships;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v79 objects:v83 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v80;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v80 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [*(id *)(*((void *)&v79 + 1) + 8 * i) dictionaryRepresentation];
          [v49 addObject:v55];
        }
        uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v79 objects:v83 count:16];
      }
      while (v52);
    }

    [v3 setObject:v49 forKey:@"fractional_cohort_membership"];
  }
  $D13936C5278104CB1C8259D497E97548 v56 = self->_has;
  if ((*(_WORD *)&v56 & 0x8000) != 0)
  {
    uint64_t videoType = self->_videoType;
    if (videoType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_videoType);
      v77 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v77 = off_264449950[videoType];
    }
    [v3 setObject:v77 forKey:@"video_type"];

    $D13936C5278104CB1C8259D497E97548 v56 = self->_has;
    if ((*(unsigned char *)&v56 & 0x20) == 0)
    {
LABEL_101:
      if ((*(unsigned char *)&v56 & 1) == 0) {
        goto LABEL_103;
      }
      goto LABEL_102;
    }
  }
  else if ((*(unsigned char *)&v56 & 0x20) == 0)
  {
    goto LABEL_101;
  }
  v78 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
  [v3 setObject:v78 forKey:@"publisher_article_version_int64"];

  if (*(_DWORD *)&self->_has)
  {
LABEL_102:
    v57 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
    [v3 setObject:v57 forKey:@"backend_article_version_int64"];
  }
LABEL_103:
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign) {
    [v3 setObject:iadNativeCampaign forKey:@"iad_native_campaign"];
  }
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine) {
    [v3 setObject:iadNativeLine forKey:@"iad_native_line"];
  }
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd) {
    [v3 setObject:iadNativeAd forKey:@"iad_native_ad"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v61 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v61 forKey:@"previous_article_publisher_article_version"];
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd) {
    [v3 setObject:iadNativeCampaignAd forKey:@"iad_native_campaign_ad"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v3 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  alternateHeadline = self->_alternateHeadline;
  if (alternateHeadline)
  {
    v65 = [(NTPBAlternateHeadline *)alternateHeadline dictionaryRepresentation];
    [v3 setObject:v65 forKey:@"alternate_headline"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v66 = [NSNumber numberWithInt:self->_rankInVideoPlaylist];
    [v3 setObject:v66 forKey:@"rank_in_video_playlist"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v68 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v68 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v70 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v70 forKey:@"issue_exposure_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v72 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v3 setObject:v72 forKey:@"issue_view_data"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_ids"];
  }
  id v74 = v3;

  return v74;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaEngageCompleteReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_mediaId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_referencedArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  $D13936C5278104CB1C8259D497E97548 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D13936C5278104CB1C8259D497E97548 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v6 = self->_namedEntities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v33;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v32 objects:v38 count:16];
    }
    while (v8);
  }

  $D13936C5278104CB1C8259D497E97548 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D13936C5278104CB1C8259D497E97548 v11 = self->_has;
    if ((*(unsigned char *)&v11 & 0x80) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v11 & 0x10000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&v11 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0) {
LABEL_37:
  }
    PBDataWriterWriteBOOLField();
LABEL_38:
  if (self->_surfacedByChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedBySectionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedByTopicId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sectionHeadlineId) {
    PBDataWriterWriteStringField();
  }
  $D13936C5278104CB1C8259D497E97548 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $D13936C5278104CB1C8259D497E97548 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 8) == 0)
    {
LABEL_48:
      if ((*(_WORD *)&v12 & 0x800) == 0) {
        goto LABEL_49;
      }
      goto LABEL_116;
    }
  }
  else if ((*(unsigned char *)&v12 & 8) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteInt64Field();
  $D13936C5278104CB1C8259D497E97548 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v12 & 0x200000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteInt32Field();
  $D13936C5278104CB1C8259D497E97548 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v12 & 2) == 0) {
      goto LABEL_51;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteBOOLField();
  $D13936C5278104CB1C8259D497E97548 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 2) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v12 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteInt64Field();
  $D13936C5278104CB1C8259D497E97548 v12 = self->_has;
  if ((*(unsigned char *)&v12 & 4) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
LABEL_53:
  }
    PBDataWriterWriteBOOLField();
LABEL_54:
  if (self->_nativeCampaignData) {
    PBDataWriterWriteStringField();
  }
  if (self->_metadata) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_widgetEngagement) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v13 = self->_fractionalCohortMemberships;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v37 count:16];
    }
    while (v15);
  }

  $D13936C5278104CB1C8259D497E97548 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $D13936C5278104CB1C8259D497E97548 v18 = self->_has;
    if ((*(unsigned char *)&v18 & 0x20) == 0)
    {
LABEL_79:
      if ((*(unsigned char *)&v18 & 1) == 0) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
  }
  else if ((*(unsigned char *)&v18 & 0x20) == 0)
  {
    goto LABEL_79;
  }
  PBDataWriterWriteInt64Field();
  if (*(_DWORD *)&self->_has) {
LABEL_80:
  }
    PBDataWriterWriteInt64Field();
LABEL_81:
  if (self->_iadNativeCampaign) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeLine) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeAd) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_iadNativeCampaignAd) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if (self->_alternateHeadline) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueExposureData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueViewData) {
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v19 = self->_topicIds;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteStringField();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v24 objects:v36 count:16];
    }
    while (v21);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 228) = self->_mediaType;
    *(_DWORD *)(v5 + 360) |= 0x1000u;
  }
  uint64_t v7 = [(NSString *)self->_mediaId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v7;

  uint64_t v9 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v9;

  uint64_t v11 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  $D13936C5278104CB1C8259D497E97548 v12 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v11;

  uint64_t v13 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  uint64_t v14 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v13;

  uint64_t v15 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v15;

  uint64_t v17 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  $D13936C5278104CB1C8259D497E97548 v18 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v17;

  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    *(_DWORD *)(v6 + 112) = self->_feedType;
    *(_DWORD *)(v6 + 360) |= 0x200u;
  }
  uint64_t v19 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v20 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v19;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(_DWORD *)(v6 + 100) = self->_feedCellSection;
    *(_DWORD *)(v6 + 360) |= 0x100u;
  }
  uint64_t v21 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v22 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v21;

  $D13936C5278104CB1C8259D497E97548 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *(unsigned char *)(v6 + 356) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 360) |= 0x100000u;
    $D13936C5278104CB1C8259D497E97548 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 80) = self->_articleType;
    *(_DWORD *)(v6 + 360) |= 0x40u;
  }
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v24 = self->_namedEntities;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v92 objects:v98 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v93;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v93 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = (void *)[*(id *)(*((void *)&v92 + 1) + 8 * v28) copyWithZone:a3];
        [(id)v6 addNamedEntities:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v92 objects:v98 count:16];
    }
    while (v26);
  }

  $D13936C5278104CB1C8259D497E97548 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x2000) != 0)
  {
    *(_DWORD *)(v6 + 272) = self->_publisherArticleVersion;
    *(_DWORD *)(v6 + 360) |= 0x2000u;
    $D13936C5278104CB1C8259D497E97548 v30 = self->_has;
    if ((*(unsigned char *)&v30 & 0x80) == 0)
    {
LABEL_20:
      if ((*(_DWORD *)&v30 & 0x10000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&v30 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 96) = self->_backendArticleVersion;
  *(_DWORD *)(v6 + 360) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_21:
    *(unsigned char *)(v6 + 352) = self->_adSupportedChannel;
    *(_DWORD *)(v6 + 360) |= 0x10000u;
  }
LABEL_22:
  uint64_t v31 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  long long v32 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v31;

  uint64_t v33 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  long long v34 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v33;

  uint64_t v35 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v36 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v35;

  uint64_t v37 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v38 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v37;

  $D13936C5278104CB1C8259D497E97548 v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x40000) != 0)
  {
    *(unsigned char *)(v6 + 354) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v6 + 360) |= 0x40000u;
    $D13936C5278104CB1C8259D497E97548 v39 = self->_has;
    if ((*(unsigned char *)&v39 & 8) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v39 & 0x800) == 0) {
        goto LABEL_25;
      }
      goto LABEL_62;
    }
  }
  else if ((*(unsigned char *)&v39 & 8) == 0)
  {
    goto LABEL_24;
  }
  *(void *)(v6 + 32) = self->_personalizationTreatmentId;
  *(_DWORD *)(v6 + 360) |= 8u;
  $D13936C5278104CB1C8259D497E97548 v39 = self->_has;
  if ((*(_WORD *)&v39 & 0x800) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v39 & 0x200000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v6 + 224) = self->_mediaPlayLocation;
  *(_DWORD *)(v6 + 360) |= 0x800u;
  $D13936C5278104CB1C8259D497E97548 v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x200000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v39 & 2) == 0) {
      goto LABEL_27;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(unsigned char *)(v6 + 357) = self->_isVideoInFeed;
  *(_DWORD *)(v6 + 360) |= 0x200000u;
  $D13936C5278104CB1C8259D497E97548 v39 = self->_has;
  if ((*(unsigned char *)&v39 & 2) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v39 & 4) == 0) {
      goto LABEL_28;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(void *)(v6 + 16) = self->_mediaDuration;
  *(_DWORD *)(v6 + 360) |= 2u;
  $D13936C5278104CB1C8259D497E97548 v39 = self->_has;
  if ((*(unsigned char *)&v39 & 4) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v39 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_65:
  *(void *)(v6 + 24) = self->_mediaTimePlayed;
  *(_DWORD *)(v6 + 360) |= 4u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_29:
    *(unsigned char *)(v6 + 355) = self->_isNativeAd;
    *(_DWORD *)(v6 + 360) |= 0x80000u;
  }
LABEL_30:
  uint64_t v40 = [(NSString *)self->_nativeCampaignData copyWithZone:a3];
  v41 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v40;

  uint64_t v42 = [(NSString *)self->_metadata copyWithZone:a3];
  v43 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v42;

  uint64_t v44 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v45 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v44;

  uint64_t v46 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v47 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v46;

  id v48 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  v49 = *(void **)(v6 + 344);
  *(void *)(v6 + 344) = v48;

  if ((*((unsigned char *)&self->_has + 1) & 4) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_groupType;
    *(_DWORD *)(v6 + 360) |= 0x400u;
  }
  uint64_t v50 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  uint64_t v51 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v50;

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(unsigned char *)(v6 + 353) = self->_isBreakingNewsArticle;
    *(_DWORD *)(v6 + 360) |= 0x20000u;
  }
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  uint64_t v52 = self->_fractionalCohortMemberships;
  uint64_t v53 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v88 objects:v97 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    uint64_t v55 = *(void *)v89;
    do
    {
      uint64_t v56 = 0;
      do
      {
        if (*(void *)v89 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = (void *)[*(id *)(*((void *)&v88 + 1) + 8 * v56) copyWithZone:a3];
        [(id)v6 addFractionalCohortMembership:v57];

        ++v56;
      }
      while (v54 != v56);
      uint64_t v54 = [(NSMutableArray *)v52 countByEnumeratingWithState:&v88 objects:v97 count:16];
    }
    while (v54);
  }

  $D13936C5278104CB1C8259D497E97548 v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x8000) != 0)
  {
    *(_DWORD *)(v6 + 336) = self->_videoType;
    *(_DWORD *)(v6 + 360) |= 0x8000u;
    $D13936C5278104CB1C8259D497E97548 v58 = self->_has;
    if ((*(unsigned char *)&v58 & 0x20) == 0)
    {
LABEL_43:
      if ((*(unsigned char *)&v58 & 1) == 0) {
        goto LABEL_45;
      }
      goto LABEL_44;
    }
  }
  else if ((*(unsigned char *)&v58 & 0x20) == 0)
  {
    goto LABEL_43;
  }
  *(void *)(v6 + 48) = self->_publisherArticleVersionInt64;
  *(_DWORD *)(v6 + 360) |= 0x20u;
  if (*(_DWORD *)&self->_has)
  {
LABEL_44:
    *(void *)(v6 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v6 + 360) |= 1u;
  }
LABEL_45:
  uint64_t v59 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  v60 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v59;

  uint64_t v61 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v62 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v61;

  uint64_t v63 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  v64 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v63;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(void *)(v6 + 40) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 360) |= 0x10u;
  }
  uint64_t v65 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  v66 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v65;

  uint64_t v67 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v68 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v67;

  id v69 = [(NTPBAlternateHeadline *)self->_alternateHeadline copyWithZone:a3];
  v70 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v69;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 276) = self->_rankInVideoPlaylist;
    *(_DWORD *)(v6 + 360) |= 0x4000u;
  }
  id v71 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v72 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v71;

  id v73 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  id v74 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v73;

  id v75 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v76 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v75;

  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  v77 = self->_topicIds;
  uint64_t v78 = [(NSMutableArray *)v77 countByEnumeratingWithState:&v84 objects:v96 count:16];
  if (v78)
  {
    uint64_t v79 = v78;
    uint64_t v80 = *(void *)v85;
    do
    {
      uint64_t v81 = 0;
      do
      {
        if (*(void *)v85 != v80) {
          objc_enumerationMutation(v77);
        }
        long long v82 = objc_msgSend(*(id *)(*((void *)&v84 + 1) + 8 * v81), "copyWithZone:", a3, (void)v84);
        [(id)v6 addTopicIds:v82];

        ++v81;
      }
      while (v79 != v81);
      uint64_t v79 = [(NSMutableArray *)v77 countByEnumeratingWithState:&v84 objects:v96 count:16];
    }
    while (v79);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_195;
  }
  int v5 = *((_DWORD *)v4 + 90);
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v5 & 0x1000) == 0 || self->_mediaType != *((_DWORD *)v4 + 57)) {
      goto LABEL_195;
    }
  }
  else if ((v5 & 0x1000) != 0)
  {
    goto LABEL_195;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 27) && !-[NSString isEqual:](mediaId, "isEqual:")) {
    goto LABEL_195;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  $D13936C5278104CB1C8259D497E97548 has = self->_has;
  int v13 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_feedType != *((_DWORD *)v4 + 28)) {
      goto LABEL_195;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_195;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_195;
    }
    $D13936C5278104CB1C8259D497E97548 has = self->_has;
  }
  int v15 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 25)) {
      goto LABEL_195;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_195;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 15))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_195;
    }
    $D13936C5278104CB1C8259D497E97548 has = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 90);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0) {
      goto LABEL_195;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 356)) {
        goto LABEL_195;
      }
    }
    else if (*((unsigned char *)v4 + 356))
    {
      goto LABEL_195;
    }
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_articleType != *((_DWORD *)v4 + 20)) {
      goto LABEL_195;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_195;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_195;
    }
    $D13936C5278104CB1C8259D497E97548 has = self->_has;
  }
  int v19 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 68)) {
      goto LABEL_195;
    }
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v19 & 0x80) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 24)) {
      goto LABEL_195;
    }
  }
  else if ((v19 & 0x80) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v19 & 0x10000) == 0) {
      goto LABEL_195;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 352)) {
        goto LABEL_195;
      }
    }
    else if (*((unsigned char *)v4 + 352))
    {
      goto LABEL_195;
    }
  }
  else if ((v19 & 0x10000) != 0)
  {
    goto LABEL_195;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 38)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_195;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  $D13936C5278104CB1C8259D497E97548 v24 = self->_has;
  int v25 = *((_DWORD *)v4 + 90);
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    if ((v25 & 0x40000) == 0) {
      goto LABEL_195;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 354)) {
        goto LABEL_195;
      }
    }
    else if (*((unsigned char *)v4 + 354))
    {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x40000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(unsigned char *)&v24 & 8) != 0)
  {
    if ((v25 & 8) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 4)) {
      goto LABEL_195;
    }
  }
  else if ((v25 & 8) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v25 & 0x800) == 0 || self->_mediaPlayLocation != *((_DWORD *)v4 + 56)) {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x800) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_DWORD *)&v24 & 0x200000) != 0)
  {
    if ((v25 & 0x200000) == 0) {
      goto LABEL_195;
    }
    if (self->_isVideoInFeed)
    {
      if (!*((unsigned char *)v4 + 357)) {
        goto LABEL_195;
      }
    }
    else if (*((unsigned char *)v4 + 357))
    {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x200000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(unsigned char *)&v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_mediaDuration != *((void *)v4 + 2)) {
      goto LABEL_195;
    }
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_195;
  }
  if ((*(unsigned char *)&v24 & 4) != 0)
  {
    if ((v25 & 4) == 0 || self->_mediaTimePlayed != *((void *)v4 + 3)) {
      goto LABEL_195;
    }
  }
  else if ((v25 & 4) != 0)
  {
    goto LABEL_195;
  }
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    if ((v25 & 0x80000) == 0) {
      goto LABEL_195;
    }
    if (self->_isNativeAd)
    {
      if (!*((unsigned char *)v4 + 355)) {
        goto LABEL_195;
      }
    }
    else if (*((unsigned char *)v4 + 355))
    {
      goto LABEL_195;
    }
  }
  else if ((v25 & 0x80000) != 0)
  {
    goto LABEL_195;
  }
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((void *)v4 + 31)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_195;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:")) {
      goto LABEL_195;
    }
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_195;
    }
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 43))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
      goto LABEL_195;
    }
  }
  $D13936C5278104CB1C8259D497E97548 v31 = self->_has;
  int v32 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&v31 & 0x400) != 0)
  {
    if ((v32 & 0x400) == 0 || self->_groupType != *((_DWORD *)v4 + 36)) {
      goto LABEL_195;
    }
  }
  else if ((v32 & 0x400) != 0)
  {
    goto LABEL_195;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_195;
    }
    $D13936C5278104CB1C8259D497E97548 v31 = self->_has;
  }
  int v34 = *((_DWORD *)v4 + 90);
  if ((*(_DWORD *)&v31 & 0x20000) != 0)
  {
    if ((v34 & 0x20000) == 0) {
      goto LABEL_195;
    }
    if (self->_isBreakingNewsArticle)
    {
      if (!*((unsigned char *)v4 + 353)) {
        goto LABEL_195;
      }
    }
    else if (*((unsigned char *)v4 + 353))
    {
      goto LABEL_195;
    }
  }
  else if ((v34 & 0x20000) != 0)
  {
    goto LABEL_195;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if (!((unint64_t)fractionalCohortMemberships | *((void *)v4 + 16))) {
    goto LABEL_150;
  }
  if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
  {
LABEL_195:
    char v49 = 0;
    goto LABEL_196;
  }
  $D13936C5278104CB1C8259D497E97548 v31 = self->_has;
LABEL_150:
  int v36 = *((_DWORD *)v4 + 90);
  if ((*(_WORD *)&v31 & 0x8000) != 0)
  {
    if ((v36 & 0x8000) == 0 || self->_videoType != *((_DWORD *)v4 + 84)) {
      goto LABEL_195;
    }
  }
  else if ((v36 & 0x8000) != 0)
  {
    goto LABEL_195;
  }
  if ((*(unsigned char *)&v31 & 0x20) != 0)
  {
    if ((v36 & 0x20) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 6)) {
      goto LABEL_195;
    }
  }
  else if ((v36 & 0x20) != 0)
  {
    goto LABEL_195;
  }
  if (*(unsigned char *)&v31)
  {
    if ((v36 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_195;
    }
  }
  else if (v36)
  {
    goto LABEL_195;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 21)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_195;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_195;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_195;
    }
  }
  int v40 = *((_DWORD *)v4 + 90);
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((v40 & 0x10) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 5)) {
      goto LABEL_195;
    }
  }
  else if ((v40 & 0x10) != 0)
  {
    goto LABEL_195;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 22)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_195;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_195;
    }
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((void *)v4 + 7))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:")) {
      goto LABEL_195;
    }
  }
  int v44 = *((_DWORD *)v4 + 90);
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v44 & 0x4000) == 0 || self->_rankInVideoPlaylist != *((_DWORD *)v4 + 69)) {
      goto LABEL_195;
    }
  }
  else if ((v44 & 0x4000) != 0)
  {
    goto LABEL_195;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 24) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_195;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 25))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_195;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 26))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_195;
    }
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 41)) {
    char v49 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  }
  else {
    char v49 = 1;
  }
LABEL_196:

  return v49;
}

- (unint64_t)hash
{
  p_$D13936C5278104CB1C8259D497E97548 has = &self->_has;
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v60 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v60 = 0;
  }
  NSUInteger v59 = [(NSString *)self->_mediaId hash];
  NSUInteger v58 = [(NSString *)self->_articleId hash];
  NSUInteger v57 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v56 = [(NSData *)self->_articleSessionId hash];
  uint64_t v55 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v54 = [(NSString *)self->_sourceChannelId hash];
  if ((*((unsigned char *)p_has + 1) & 2) != 0) {
    uint64_t v53 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v53 = 0;
  }
  NSUInteger v52 = [(NSString *)self->_feedId hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v51 = 2654435761 * self->_feedCellSection;
  }
  else {
    uint64_t v51 = 0;
  }
  uint64_t v50 = [(NSData *)self->_feedViewExposureId hash];
  $D13936C5278104CB1C8259D497E97548 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    uint64_t v49 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v49 = 0;
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
LABEL_12:
      uint64_t v48 = 2654435761 * self->_articleType;
      goto LABEL_15;
    }
  }
  uint64_t v48 = 0;
LABEL_15:
  uint64_t v47 = [(NSMutableArray *)self->_namedEntities hash];
  $D13936C5278104CB1C8259D497E97548 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    uint64_t v46 = 0;
    if ((*(unsigned char *)&v5 & 0x80) != 0) {
      goto LABEL_17;
    }
LABEL_20:
    uint64_t v45 = 0;
    if ((*(_DWORD *)&v5 & 0x10000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_21;
  }
  uint64_t v46 = 2654435761 * self->_publisherArticleVersion;
  if ((*(unsigned char *)&v5 & 0x80) == 0) {
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v45 = 2654435761 * self->_backendArticleVersion;
  if ((*(_DWORD *)&v5 & 0x10000) != 0)
  {
LABEL_18:
    uint64_t v44 = 2654435761 * self->_adSupportedChannel;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v44 = 0;
LABEL_22:
  NSUInteger v43 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v42 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v41 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v40 = [(NSString *)self->_sectionHeadlineId hash];
  $D13936C5278104CB1C8259D497E97548 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    uint64_t v39 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(unsigned char *)&v6 & 8) != 0)
    {
LABEL_24:
      uint64_t v38 = 2654435761 * self->_personalizationTreatmentId;
      if ((*(_WORD *)&v6 & 0x800) != 0) {
        goto LABEL_25;
      }
      goto LABEL_32;
    }
  }
  else
  {
    uint64_t v39 = 0;
    if ((*(unsigned char *)&v6 & 8) != 0) {
      goto LABEL_24;
    }
  }
  uint64_t v38 = 0;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_25:
    uint64_t v37 = 2654435761 * self->_mediaPlayLocation;
    if ((*(_DWORD *)&v6 & 0x200000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&v6 & 0x200000) != 0)
  {
LABEL_26:
    uint64_t v36 = 2654435761 * self->_isVideoInFeed;
    if ((*(unsigned char *)&v6 & 2) != 0) {
      goto LABEL_27;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v36 = 0;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
LABEL_27:
    uint64_t v35 = 2654435761 * self->_mediaDuration;
    if ((*(unsigned char *)&v6 & 4) != 0) {
      goto LABEL_28;
    }
LABEL_35:
    uint64_t v34 = 0;
    if ((*(_DWORD *)&v6 & 0x80000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&v6 & 4) == 0) {
    goto LABEL_35;
  }
LABEL_28:
  uint64_t v34 = 2654435761 * self->_mediaTimePlayed;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
LABEL_29:
    uint64_t v33 = 2654435761 * self->_isNativeAd;
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v33 = 0;
LABEL_37:
  NSUInteger v32 = [(NSString *)self->_nativeCampaignData hash];
  NSUInteger v31 = [(NSString *)self->_metadata hash];
  NSUInteger v30 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v29 = [(NSString *)self->_previousArticleVersion hash];
  unint64_t v28 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    uint64_t v27 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v27 = 0;
  }
  NSUInteger v26 = [(NSString *)self->_groupFeedId hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v25 = 2654435761 * self->_isBreakingNewsArticle;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v24 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $D13936C5278104CB1C8259D497E97548 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x8000) == 0)
  {
    uint64_t v23 = 0;
    if ((*(unsigned char *)&v7 & 0x20) != 0) {
      goto LABEL_45;
    }
LABEL_48:
    uint64_t v21 = 0;
    if (*(unsigned char *)&v7) {
      goto LABEL_46;
    }
    goto LABEL_49;
  }
  uint64_t v23 = 2654435761 * self->_videoType;
  if ((*(unsigned char *)&v7 & 0x20) == 0) {
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v21 = 2654435761 * self->_publisherArticleVersionInt64;
  if (*(unsigned char *)&v7)
  {
LABEL_46:
    uint64_t v8 = 2654435761 * self->_backendArticleVersionInt64;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v8 = 0;
LABEL_50:
  NSUInteger v9 = [(NSString *)self->_iadNativeCampaign hash];
  NSUInteger v10 = [(NSString *)self->_iadNativeLine hash];
  NSUInteger v11 = [(NSString *)self->_iadNativeAd hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v12 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_iadNativeCampaignAd hash];
  uint64_t v14 = [(NSData *)self->_groupViewExposureId hash];
  unint64_t v15 = [(NTPBAlternateHeadline *)self->_alternateHeadline hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v16 = 2654435761 * self->_rankInVideoPlaylist;
  }
  else {
    uint64_t v16 = 0;
  }
  unint64_t v17 = v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v18 = v17 ^ [(NTPBIssueExposureData *)self->_issueExposureData hash];
  unint64_t v19 = v59 ^ v60 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v8 ^ v9 ^ v10 ^ v18 ^ [(NTPBIssueViewData *)self->_issueViewData hash];
  return v19 ^ [(NSMutableArray *)self->_topicIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 361) & 0x10) != 0)
  {
    self->_uint64_t mediaType = v4[57];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v4 + 27)) {
    -[NTPBMediaEngageComplete setMediaId:](self, "setMediaId:");
  }
  if (*((void *)v5 + 8)) {
    -[NTPBMediaEngageComplete setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 35)) {
    -[NTPBMediaEngageComplete setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v5 + 9)) {
    -[NTPBMediaEngageComplete setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v5 + 11)) {
    -[NTPBMediaEngageComplete setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((void *)v5 + 37)) {
    -[NTPBMediaEngageComplete setSourceChannelId:](self, "setSourceChannelId:");
  }
  if ((*((unsigned char *)v5 + 361) & 2) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v5 + 28);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v5 + 13)) {
    -[NTPBMediaEngageComplete setFeedId:](self, "setFeedId:");
  }
  if (*((unsigned char *)v5 + 361))
  {
    self->_uint64_t feedCellSection = *((_DWORD *)v5 + 25);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v5 + 15)) {
    -[NTPBMediaEngageComplete setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  int v6 = *((_DWORD *)v5 + 90);
  if ((v6 & 0x100000) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v5 + 356);
    *(_DWORD *)&self->_has |= 0x100000u;
    int v6 = *((_DWORD *)v5 + 90);
  }
  if ((v6 & 0x40) != 0)
  {
    self->_uint64_t articleType = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v7 = *((id *)v5 + 30);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBMediaEngageComplete *)self addNamedEntities:*(void *)(*((void *)&v43 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v9);
  }

  int v12 = *((_DWORD *)v5 + 90);
  if ((v12 & 0x2000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 68);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v12 = *((_DWORD *)v5 + 90);
    if ((v12 & 0x80) == 0)
    {
LABEL_36:
      if ((v12 & 0x10000) == 0) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
  }
  else if ((v12 & 0x80) == 0)
  {
    goto LABEL_36;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 24);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v5 + 90) & 0x10000) != 0)
  {
LABEL_37:
    self->_adSupportedChannel = *((unsigned char *)v5 + 352);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_38:
  if (*((void *)v5 + 38)) {
    -[NTPBMediaEngageComplete setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v5 + 39)) {
    -[NTPBMediaEngageComplete setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v5 + 40)) {
    -[NTPBMediaEngageComplete setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 36)) {
    -[NTPBMediaEngageComplete setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  int v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 0x40000) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v5 + 354);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v13 = *((_DWORD *)v5 + 90);
    if ((v13 & 8) == 0)
    {
LABEL_48:
      if ((v13 & 0x800) == 0) {
        goto LABEL_49;
      }
      goto LABEL_70;
    }
  }
  else if ((v13 & 8) == 0)
  {
    goto LABEL_48;
  }
  self->_personalizationTreatmentId = *((void *)v5 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 0x800) == 0)
  {
LABEL_49:
    if ((v13 & 0x200000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_mediaPlayLocation = *((_DWORD *)v5 + 56);
  *(_DWORD *)&self->_has |= 0x800u;
  int v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 0x200000) == 0)
  {
LABEL_50:
    if ((v13 & 2) == 0) {
      goto LABEL_51;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_isVideoInFeed = *((unsigned char *)v5 + 357);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 2) == 0)
  {
LABEL_51:
    if ((v13 & 4) == 0) {
      goto LABEL_52;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_mediaDuration = *((void *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v13 = *((_DWORD *)v5 + 90);
  if ((v13 & 4) == 0)
  {
LABEL_52:
    if ((v13 & 0x80000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
LABEL_73:
  self->_mediaTimePlayed = *((void *)v5 + 3);
  *(_DWORD *)&self->_has |= 4u;
  if ((*((_DWORD *)v5 + 90) & 0x80000) != 0)
  {
LABEL_53:
    self->_isNativeAd = *((unsigned char *)v5 + 355);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_54:
  if (*((void *)v5 + 31)) {
    -[NTPBMediaEngageComplete setNativeCampaignData:](self, "setNativeCampaignData:");
  }
  if (*((void *)v5 + 29)) {
    -[NTPBMediaEngageComplete setMetadata:](self, "setMetadata:");
  }
  if (*((void *)v5 + 32)) {
    -[NTPBMediaEngageComplete setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 33)) {
    -[NTPBMediaEngageComplete setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v15 = *((void *)v5 + 43);
  if (widgetEngagement)
  {
    if (v15) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[NTPBMediaEngageComplete setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  if ((*((unsigned char *)v5 + 361) & 4) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v5 + 17)) {
    -[NTPBMediaEngageComplete setGroupFeedId:](self, "setGroupFeedId:");
  }
  if ((*((unsigned char *)v5 + 362) & 2) != 0)
  {
    self->_isBreakingNewsArticle = *((unsigned char *)v5 + 353);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = *((id *)v5 + 16);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        [(NTPBMediaEngageComplete *)self addFractionalCohortMembership:*(void *)(*((void *)&v39 + 1) + 8 * j)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v18);
  }

  int v21 = *((_DWORD *)v5 + 90);
  if ((v21 & 0x8000) != 0)
  {
    self->_uint64_t videoType = *((_DWORD *)v5 + 84);
    *(_DWORD *)&self->_has |= 0x8000u;
    int v21 = *((_DWORD *)v5 + 90);
    if ((v21 & 0x20) == 0)
    {
LABEL_92:
      if ((v21 & 1) == 0) {
        goto LABEL_94;
      }
      goto LABEL_93;
    }
  }
  else if ((v21 & 0x20) == 0)
  {
    goto LABEL_92;
  }
  self->_publisherArticleVersionInt64 = *((void *)v5 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  if (*((_DWORD *)v5 + 90))
  {
LABEL_93:
    self->_backendArticleVersionInt64 = *((void *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
LABEL_94:
  if (*((void *)v5 + 21)) {
    -[NTPBMediaEngageComplete setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v5 + 23)) {
    -[NTPBMediaEngageComplete setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v5 + 20)) {
    -[NTPBMediaEngageComplete setIadNativeAd:](self, "setIadNativeAd:");
  }
  if ((*((unsigned char *)v5 + 360) & 0x10) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 22)) {
    -[NTPBMediaEngageComplete setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  if (*((void *)v5 + 19)) {
    -[NTPBMediaEngageComplete setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  alternateHeadline = self->_alternateHeadline;
  uint64_t v23 = *((void *)v5 + 7);
  if (alternateHeadline)
  {
    if (v23) {
      -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[NTPBMediaEngageComplete setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  if ((*((unsigned char *)v5 + 361) & 0x40) != 0)
  {
    self->_rankInVideoPlaylist = *((_DWORD *)v5 + 69);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  issueData = self->_issueData;
  uint64_t v25 = *((void *)v5 + 24);
  if (issueData)
  {
    if (v25) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[NTPBMediaEngageComplete setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v27 = *((void *)v5 + 25);
  if (issueExposureData)
  {
    if (v27) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[NTPBMediaEngageComplete setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v29 = *((void *)v5 + 26);
  if (issueViewData)
  {
    if (v29) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[NTPBMediaEngageComplete setIssueViewData:](self, "setIssueViewData:");
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = *((id *)v5 + 41);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        -[NTPBMediaEngageComplete addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v35 + 1) + 8 * k), (void)v35);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v47 count:16];
    }
    while (v32);
  }
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
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

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
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

- (BOOL)isUserSubscribedToFeed
{
  return self->_isUserSubscribedToFeed;
}

- (NSMutableArray)namedEntities
{
  return self->_namedEntities;
}

- (void)setNamedEntities:(id)a3
{
}

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (NSString)surfacedByChannelId
{
  return self->_surfacedByChannelId;
}

- (void)setSurfacedByChannelId:(id)a3
{
}

- (NSString)surfacedBySectionId
{
  return self->_surfacedBySectionId;
}

- (void)setSurfacedBySectionId:(id)a3
{
}

- (NSString)surfacedByTopicId
{
  return self->_surfacedByTopicId;
}

- (void)setSurfacedByTopicId:(id)a3
{
}

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
{
}

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (BOOL)isVideoInFeed
{
  return self->_isVideoInFeed;
}

- (int64_t)mediaDuration
{
  return self->_mediaDuration;
}

- (int64_t)mediaTimePlayed
{
  return self->_mediaTimePlayed;
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (NSString)nativeCampaignData
{
  return self->_nativeCampaignData;
}

- (void)setNativeCampaignData:(id)a3
{
}

- (NSString)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
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

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (NSString)iadNativeCampaign
{
  return self->_iadNativeCampaign;
}

- (void)setIadNativeCampaign:(id)a3
{
}

- (NSString)iadNativeLine
{
  return self->_iadNativeLine;
}

- (void)setIadNativeLine:(id)a3
{
}

- (NSString)iadNativeAd
{
  return self->_iadNativeAd;
}

- (void)setIadNativeAd:(id)a3
{
}

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSString)iadNativeCampaignAd
{
  return self->_iadNativeCampaignAd;
}

- (void)setIadNativeCampaignAd:(id)a3
{
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
}

- (NTPBAlternateHeadline)alternateHeadline
{
  return self->_alternateHeadline;
}

- (void)setAlternateHeadline:(id)a3
{
}

- (int)rankInVideoPlaylist
{
  return self->_rankInVideoPlaylist;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (NTPBIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
}

- (NSMutableArray)topicIds
{
  return self->_topicIds;
}

- (void)setTopicIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_topicIds, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iadNativeLine, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaign, 0);
  objc_storeStrong((id *)&self->_iadNativeAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);
  objc_storeStrong((id *)&self->_articleId, 0);

  objc_storeStrong((id *)&self->_alternateHeadline, 0);
}

@end