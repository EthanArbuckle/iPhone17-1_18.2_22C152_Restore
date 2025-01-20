@interface NTPBMediaView
+ (Class)fractionalCohortMembershipType;
+ (Class)galleryImageIdsType;
+ (Class)namedEntitiesType;
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
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
- (BOOL)hasGalleryId;
- (BOOL)hasGalleryImageCount;
- (BOOL)hasGalleryType;
- (BOOL)hasGalleryViewingSessionId;
- (BOOL)hasIadNativeAd;
- (BOOL)hasIadNativeCampaign;
- (BOOL)hasIadNativeCampaignAd;
- (BOOL)hasIadNativeLine;
- (BOOL)hasIsDigitalReplicaAd;
- (BOOL)hasIsNativeAd;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasMediaId;
- (BOOL)hasMediaType;
- (BOOL)hasMetadata;
- (BOOL)hasPersonalizationTreatmentId;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasPreviousArticlePublisherArticleVersion;
- (BOOL)hasPreviousArticleVersion;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasPublisherArticleVersionInt64;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasSectionHeadlineId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedBySectionId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)hasWidgetEngagement;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNativeAd;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)articleSessionId;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)galleryViewingSessionId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSMutableArray)galleryImageIds;
- (NSMutableArray)namedEntities;
- (NSString)articleId;
- (NSString)feedId;
- (NSString)galleryId;
- (NSString)iadNativeAd;
- (NSString)iadNativeCampaign;
- (NSString)iadNativeCampaignAd;
- (NSString)iadNativeLine;
- (NSString)mediaId;
- (NSString)metadata;
- (NSString)previousArticleId;
- (NSString)previousArticleVersion;
- (NSString)referencedArticleId;
- (NSString)sectionHeadlineId;
- (NSString)sourceChannelId;
- (NSString)surfacedByChannelId;
- (NSString)surfacedBySectionId;
- (NSString)surfacedByTopicId;
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
- (id)galleryImageIdsAtIndex:(unint64_t)a3;
- (id)galleryTypeAsString:(int)a3;
- (id)mediaTypeAsString:(int)a3;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (int)StringAsArticleType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGalleryType:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)articleType;
- (int)backendArticleVersion;
- (int)feedCellSection;
- (int)feedType;
- (int)galleryImageCount;
- (int)galleryType;
- (int)mediaType;
- (int)publisherArticleVersion;
- (int64_t)backendArticleVersionInt64;
- (int64_t)personalizationTreatmentId;
- (int64_t)previousArticlePublisherArticleVersion;
- (int64_t)publisherArticleVersionInt64;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)galleryImageIdsCount;
- (unint64_t)hash;
- (unint64_t)namedEntitiesCount;
- (void)addFractionalCohortMembership:(id)a3;
- (void)addGalleryImageIds:(id)a3;
- (void)addNamedEntities:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)clearGalleryImageIds;
- (void)clearNamedEntities;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
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
- (void)setGalleryId:(id)a3;
- (void)setGalleryImageCount:(int)a3;
- (void)setGalleryImageIds:(id)a3;
- (void)setGalleryType:(int)a3;
- (void)setGalleryViewingSessionId:(id)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasArticleType:(BOOL)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasBackendArticleVersionInt64:(BOOL)a3;
- (void)setHasFeedCellSection:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGalleryImageCount:(BOOL)a3;
- (void)setHasGalleryType:(BOOL)a3;
- (void)setHasIsDigitalReplicaAd:(BOOL)a3;
- (void)setHasIsNativeAd:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setIadNativeAd:(id)a3;
- (void)setIadNativeCampaign:(id)a3;
- (void)setIadNativeCampaignAd:(id)a3;
- (void)setIadNativeLine:(id)a3;
- (void)setIsDigitalReplicaAd:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setMediaId:(id)a3;
- (void)setMediaType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setNamedEntities:(id)a3;
- (void)setPersonalizationTreatmentId:(int64_t)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setPublisherArticleVersion:(int)a3;
- (void)setPublisherArticleVersionInt64:(int64_t)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setSectionHeadlineId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedBySectionId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBMediaView

- (int)mediaType
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    return self->_mediaType;
  }
  else {
    return 0;
  }
}

- (void)setMediaType:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMediaType
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448F60[a3];
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

- (void)setGalleryImageCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_galleryImageCount = a3;
}

- (void)setHasGalleryImageCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGalleryImageCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (int)galleryType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_galleryType;
  }
  else {
    return 0;
  }
}

- (void)setGalleryType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_galleryType = a3;
}

- (void)setHasGalleryType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasGalleryType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)galleryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_264448F98[a3];
  }

  return v3;
}

- (int)StringAsGalleryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GALLERY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MOSAIC_GALLERY_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STRIP_GALLERY_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
    __int16 v3 = off_264448FB0[a3];
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
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_feedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellSection:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFeedCellSection
{
  return (*(_WORD *)&self->_has >> 6) & 1;
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
    __int16 v3 = off_264449060[a3];
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
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return *(_WORD *)&self->_has >> 15;
}

- (int)articleType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasArticleType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644490F0[a3];
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
  *(_WORD *)&self->_has |= 0x800u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasPublisherArticleVersion
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBackendArticleVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_WORD *)&self->_has >> 12) & 1;
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
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)clearGalleryImageIds
{
}

- (void)addGalleryImageIds:(id)a3
{
  id v4 = a3;
  galleryImageIds = self->_galleryImageIds;
  id v8 = v4;
  if (!galleryImageIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_galleryImageIds;
    self->_galleryImageIds = v6;

    id v4 = v8;
    galleryImageIds = self->_galleryImageIds;
  }
  [(NSMutableArray *)galleryImageIds addObject:v4];
}

- (unint64_t)galleryImageIdsCount
{
  return [(NSMutableArray *)self->_galleryImageIds count];
}

- (id)galleryImageIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_galleryImageIds objectAtIndex:a3];
}

+ (Class)galleryImageIdsType
{
  return (Class)objc_opt_class();
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

- (void)setIsNativeAd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsNativeAd
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasGalleryId
{
  return self->_galleryId != 0;
}

- (BOOL)hasGalleryViewingSessionId
{
  return self->_galleryViewingSessionId != 0;
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

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
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

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBMediaView;
  id v4 = [(NTPBMediaView *)&v8 description];
  v5 = [(NTPBMediaView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    uint64_t mediaType = self->_mediaType;
    if (mediaType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264448F60[mediaType];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_galleryImageCount];
    [v3 setObject:v13 forKey:@"gallery_image_count"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_20:
      if ((has & 0x80) == 0) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_20;
  }
  uint64_t galleryType = self->_galleryType;
  if (galleryType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_galleryType);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_264448F98[galleryType];
  }
  [v3 setObject:v15 forKey:@"gallery_type"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_27:
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = off_264448FB0[feedType];
    }
    [v3 setObject:v17 forKey:@"feed_type"];
  }
LABEL_31:
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    uint64_t feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellSection);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_264449060[feedCellSection];
    }
    [v3 setObject:v20 forKey:@"feed_cell_section"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  $8CCE0CD08026D23CC9DDF7AE99B63396 v22 = self->_has;
  if ((*(_DWORD *)&v22 & 0x80000000) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v23 forKey:@"is_user_subscribed_to_feed"];

    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_48;
    }
  }
  else if ((*(unsigned char *)&v22 & 0x10) == 0)
  {
    goto LABEL_48;
  }
  uint64_t articleType = self->_articleType;
  if (articleType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_2644490F0[articleType];
  }
  [v3 setObject:v25 forKey:@"article_type"];

LABEL_48:
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v3 setObject:namedEntities forKey:@"named_entities"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 0x800) != 0)
  {
    v65 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v3 setObject:v65 forKey:@"publisher_article_version"];

    __int16 v27 = (__int16)self->_has;
    if ((v27 & 0x20) == 0)
    {
LABEL_52:
      if ((v27 & 0x1000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else if ((v27 & 0x20) == 0)
  {
    goto LABEL_52;
  }
  v66 = [NSNumber numberWithInt:self->_backendArticleVersion];
  [v3 setObject:v66 forKey:@"backend_article_version"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_53:
    v28 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v28 forKey:@"ad_supported_channel"];
  }
LABEL_54:
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
  __int16 v33 = (__int16)self->_has;
  if ((v33 & 0x2000) != 0)
  {
    v34 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v3 setObject:v34 forKey:@"is_digital_replica_ad"];

    __int16 v33 = (__int16)self->_has;
  }
  if ((v33 & 2) != 0)
  {
    v35 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
    [v3 setObject:v35 forKey:@"personalization_treatment_id"];
  }
  galleryImageIds = self->_galleryImageIds;
  if (galleryImageIds) {
    [v3 setObject:galleryImageIds forKey:@"gallery_image_ids"];
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
    v41 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v41 forKey:@"widget_engagement"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v42 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v43 = self->_fractionalCohortMemberships;
    uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v70 objects:v74 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v71;
      do
      {
        for (uint64_t i = 0; i != v45; ++i)
        {
          if (*(void *)v71 != v46) {
            objc_enumerationMutation(v43);
          }
          v48 = [*(id *)(*((void *)&v70 + 1) + 8 * i) dictionaryRepresentation];
          [v42 addObject:v48];
        }
        uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v70 objects:v74 count:16];
      }
      while (v45);
    }

    [v3 setObject:v42 forKey:@"fractional_cohort_membership"];
  }
  __int16 v49 = (__int16)self->_has;
  if ((v49 & 0x4000) != 0)
  {
    v67 = [NSNumber numberWithBool:self->_isNativeAd];
    [v3 setObject:v67 forKey:@"is_native_ad"];

    __int16 v49 = (__int16)self->_has;
    if ((v49 & 8) == 0)
    {
LABEL_87:
      if ((v49 & 1) == 0) {
        goto LABEL_88;
      }
      goto LABEL_114;
    }
  }
  else if ((v49 & 8) == 0)
  {
    goto LABEL_87;
  }
  v68 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
  [v3 setObject:v68 forKey:@"publisher_article_version_int64"];

  __int16 v49 = (__int16)self->_has;
  if ((v49 & 1) == 0)
  {
LABEL_88:
    if ((v49 & 4) == 0) {
      goto LABEL_90;
    }
    goto LABEL_89;
  }
LABEL_114:
  v69 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
  [v3 setObject:v69 forKey:@"backend_article_version_int64"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_89:
    v50 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v50 forKey:@"previous_article_publisher_article_version"];
  }
LABEL_90:
  galleryId = self->_galleryId;
  if (galleryId) {
    [v3 setObject:galleryId forKey:@"gallery_id"];
  }
  galleryViewingSessionId = self->_galleryViewingSessionId;
  if (galleryViewingSessionId) {
    [v3 setObject:galleryViewingSessionId forKey:@"gallery_viewing_session_id"];
  }
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
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd) {
    [v3 setObject:iadNativeCampaignAd forKey:@"iad_native_campaign_ad"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v58 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v58 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v60 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v60 forKey:@"issue_exposure_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v62 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v3 setObject:v62 forKey:@"issue_view_data"];
  }
  id v63 = v3;

  return v63;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 0x80) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_18:
  }
    PBDataWriterWriteInt32Field();
LABEL_19:
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  $8CCE0CD08026D23CC9DDF7AE99B63396 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_27:
  }
    PBDataWriterWriteInt32Field();
LABEL_28:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v7 = self->_namedEntities;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_37:
      if ((v12 & 0x1000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
LABEL_38:
  }
    PBDataWriterWriteBOOLField();
LABEL_39:
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
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = self->_galleryImageIds;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v16);
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
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = self->_fractionalCohortMemberships;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v21);
  }

  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x4000) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v24 = (__int16)self->_has;
    if ((v24 & 8) == 0)
    {
LABEL_75:
      if ((v24 & 1) == 0) {
        goto LABEL_76;
      }
      goto LABEL_105;
    }
  }
  else if ((v24 & 8) == 0)
  {
    goto LABEL_75;
  }
  PBDataWriterWriteInt64Field();
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 1) == 0)
  {
LABEL_76:
    if ((v24 & 4) == 0) {
      goto LABEL_78;
    }
    goto LABEL_77;
  }
LABEL_105:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_77:
  }
    PBDataWriterWriteInt64Field();
LABEL_78:
  if (self->_galleryId) {
    PBDataWriterWriteStringField();
  }
  if (self->_galleryViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_iadNativeCampaign) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeLine) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeAd) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeCampaignAd) {
    PBDataWriterWriteStringField();
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 216) = self->_mediaType;
    *(_WORD *)(v5 + 324) |= 0x400u;
  }
  uint64_t v7 = [(NSString *)self->_mediaId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v7;

  uint64_t v9 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  __int16 v12 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v11;

  uint64_t v13 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  v14 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v13;

  uint64_t v15 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v15;

  uint64_t v17 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v18 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v17;

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 120) = self->_galleryImageCount;
    *(_WORD *)(v6 + 324) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 136) = self->_galleryType;
  *(_WORD *)(v6 + 324) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 88) = self->_feedType;
    *(_WORD *)(v6 + 324) |= 0x80u;
  }
LABEL_7:
  uint64_t v20 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v21 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v20;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_feedCellSection;
    *(_WORD *)(v6 + 324) |= 0x40u;
  }
  uint64_t v22 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  v23 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v22;

  $8CCE0CD08026D23CC9DDF7AE99B63396 v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&v24 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  *(unsigned char *)(v6 + 323) = self->_isUserSubscribedToFeed;
  *(_WORD *)(v6 + 324) |= 0x8000u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v6 + 56) = self->_articleType;
    *(_WORD *)(v6 + 324) |= 0x10u;
  }
LABEL_12:
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v25 = self->_namedEntities;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v90;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v90 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addNamedEntities:v30];
      }
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v27);
  }

  __int16 v31 = (__int16)self->_has;
  if ((v31 & 0x800) != 0)
  {
    *(_DWORD *)(v6 + 256) = self->_publisherArticleVersion;
    *(_WORD *)(v6 + 324) |= 0x800u;
    __int16 v31 = (__int16)self->_has;
    if ((v31 & 0x20) == 0)
    {
LABEL_21:
      if ((v31 & 0x1000) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v31 & 0x20) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v6 + 72) = self->_backendArticleVersion;
  *(_WORD *)(v6 + 324) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_22:
    *(unsigned char *)(v6 + 320) = self->_adSupportedChannel;
    *(_WORD *)(v6 + 324) |= 0x1000u;
  }
LABEL_23:
  uint64_t v32 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  long long v33 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v32;

  uint64_t v34 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  long long v35 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v34;

  uint64_t v36 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v37 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v36;

  uint64_t v38 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v39 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v38;

  __int16 v40 = (__int16)self->_has;
  if ((v40 & 0x2000) != 0)
  {
    *(unsigned char *)(v6 + 321) = self->_isDigitalReplicaAd;
    *(_WORD *)(v6 + 324) |= 0x2000u;
    __int16 v40 = (__int16)self->_has;
  }
  if ((v40 & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_personalizationTreatmentId;
    *(_WORD *)(v6 + 324) |= 2u;
  }
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  v41 = self->_galleryImageIds;
  uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v86;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v86 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addGalleryImageIds:v46];
      }
      uint64_t v43 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v43);
  }

  uint64_t v47 = [(NSString *)self->_metadata copyWithZone:a3];
  v48 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v47;

  uint64_t v49 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v50 = *(void **)(v6 + 240);
  *(void *)(v6 + 240) = v49;

  uint64_t v51 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v52 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v51;

  id v53 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  v54 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v53;

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v55 = self->_fractionalCohortMemberships;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v82;
    do
    {
      for (uint64_t k = 0; k != v57; ++k)
      {
        if (*(void *)v82 != v58) {
          objc_enumerationMutation(v55);
        }
        v60 = objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * k), "copyWithZone:", a3, (void)v81);
        [(id)v6 addFractionalCohortMembership:v60];
      }
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v57);
  }

  __int16 v61 = (__int16)self->_has;
  if ((v61 & 0x4000) != 0)
  {
    *(unsigned char *)(v6 + 322) = self->_isNativeAd;
    *(_WORD *)(v6 + 324) |= 0x4000u;
    __int16 v61 = (__int16)self->_has;
    if ((v61 & 8) == 0)
    {
LABEL_43:
      if ((v61 & 1) == 0) {
        goto LABEL_44;
      }
LABEL_55:
      *(void *)(v6 + 8) = self->_backendArticleVersionInt64;
      *(_WORD *)(v6 + 324) |= 1u;
      if ((*(_WORD *)&self->_has & 4) == 0) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
  }
  else if ((v61 & 8) == 0)
  {
    goto LABEL_43;
  }
  *(void *)(v6 + 32) = self->_publisherArticleVersionInt64;
  *(_WORD *)(v6 + 324) |= 8u;
  __int16 v61 = (__int16)self->_has;
  if (v61) {
    goto LABEL_55;
  }
LABEL_44:
  if ((v61 & 4) != 0)
  {
LABEL_45:
    *(void *)(v6 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_WORD *)(v6 + 324) |= 4u;
  }
LABEL_46:
  uint64_t v62 = -[NSString copyWithZone:](self->_galleryId, "copyWithZone:", a3, (void)v81);
  id v63 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v62;

  uint64_t v64 = [(NSData *)self->_galleryViewingSessionId copyWithZone:a3];
  v65 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v64;

  uint64_t v66 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  v67 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v66;

  uint64_t v68 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v69 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v68;

  uint64_t v70 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  long long v71 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v70;

  uint64_t v72 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  long long v73 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v72;

  id v74 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  uint64_t v75 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v74;

  id v76 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  v77 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v76;

  id v78 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v79 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v78;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_153;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x400) == 0 || self->_mediaType != *((_DWORD *)v4 + 54)) {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x400) != 0)
  {
    goto LABEL_153;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 26) && !-[NSString isEqual:](mediaId, "isEqual:")) {
    goto LABEL_153;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v12 = *((_WORD *)v4 + 162);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x100) == 0 || self->_galleryImageCount != *((_DWORD *)v4 + 30)) {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x100) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x200) == 0 || self->_galleryType != *((_DWORD *)v4 + 34)) {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x200) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_feedType != *((_DWORD *)v4 + 22)) {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_153;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_153;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v14 = *((_WORD *)v4 + 162);
  if ((has & 0x40) != 0)
  {
    if ((v14 & 0x40) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 19)) {
      goto LABEL_153;
    }
  }
  else if ((v14 & 0x40) != 0)
  {
    goto LABEL_153;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_153;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v16 = *((_WORD *)v4 + 162);
  if (has < 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x8000) == 0) {
      goto LABEL_153;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 323)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 323))
    {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x8000) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x10) != 0)
  {
    if ((v16 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 14)) {
      goto LABEL_153;
    }
  }
  else if ((v16 & 0x10) != 0)
  {
    goto LABEL_153;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_153;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v18 = *((_WORD *)v4 + 162);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x800) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 64)) {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x800) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x20) != 0)
  {
    if ((v18 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 18)) {
      goto LABEL_153;
    }
  }
  else if ((v18 & 0x20) != 0)
  {
    goto LABEL_153;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x1000) == 0) {
      goto LABEL_153;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 320)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 320))
    {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x1000) != 0)
  {
    goto LABEL_153;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 36)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_153;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  __int16 v23 = (__int16)self->_has;
  __int16 v24 = *((_WORD *)v4 + 162);
  if ((v23 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x2000) == 0) {
      goto LABEL_153;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 321)) {
        goto LABEL_153;
      }
    }
    else if (*((unsigned char *)v4 + 321))
    {
      goto LABEL_153;
    }
  }
  else if ((*((_WORD *)v4 + 162) & 0x2000) != 0)
  {
    goto LABEL_153;
  }
  if ((v23 & 2) != 0)
  {
    if ((v24 & 2) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 2)) {
      goto LABEL_153;
    }
  }
  else if ((v24 & 2) != 0)
  {
    goto LABEL_153;
  }
  galleryImageIds = self->_galleryImageIds;
  if ((unint64_t)galleryImageIds | *((void *)v4 + 16)
    && !-[NSMutableArray isEqual:](galleryImageIds, "isEqual:"))
  {
    goto LABEL_153;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:")) {
      goto LABEL_153;
    }
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_153;
    }
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 39))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
      goto LABEL_153;
    }
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_153;
    }
  }
  __int16 v31 = (__int16)self->_has;
  __int16 v32 = *((_WORD *)v4 + 162);
  if ((v31 & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 162) & 0x4000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((unsigned char *)v4 + 322)) {
          goto LABEL_153;
        }
        goto LABEL_120;
      }
      if (!*((unsigned char *)v4 + 322)) {
        goto LABEL_120;
      }
    }
LABEL_153:
    char v42 = 0;
    goto LABEL_154;
  }
  if ((*((_WORD *)v4 + 162) & 0x4000) != 0) {
    goto LABEL_153;
  }
LABEL_120:
  if ((v31 & 8) != 0)
  {
    if ((v32 & 8) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 4)) {
      goto LABEL_153;
    }
  }
  else if ((v32 & 8) != 0)
  {
    goto LABEL_153;
  }
  if (v31)
  {
    if ((v32 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_153;
    }
  }
  else if (v32)
  {
    goto LABEL_153;
  }
  if ((v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 3)) {
      goto LABEL_153;
    }
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_153;
  }
  galleryId = self->_galleryId;
  if ((unint64_t)galleryId | *((void *)v4 + 14) && !-[NSString isEqual:](galleryId, "isEqual:")) {
    goto LABEL_153;
  }
  galleryViewingSessionId = self->_galleryViewingSessionId;
  if ((unint64_t)galleryViewingSessionId | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](galleryViewingSessionId, "isEqual:")) {
      goto LABEL_153;
    }
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](iadNativeCampaign, "isEqual:")) {
      goto LABEL_153;
    }
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_153;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_153;
    }
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](iadNativeCampaignAd, "isEqual:")) {
      goto LABEL_153;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 23))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_153;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 24))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_153;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 25)) {
    char v42 = -[NTPBIssueViewData isEqual:](issueViewData, "isEqual:");
  }
  else {
    char v42 = 1;
  }
LABEL_154:

  return v42;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v46 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v46 = 0;
  }
  NSUInteger v3 = [(NSString *)self->_mediaId hash];
  NSUInteger v4 = [(NSString *)self->_articleId hash];
  NSUInteger v60 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v59 = [(NSData *)self->_articleSessionId hash];
  uint64_t v58 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v5 = [(NSString *)self->_sourceChannelId hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v7 = 2654435761 * self->_galleryImageCount;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_galleryType;
      goto LABEL_9;
    }
  }
  uint64_t v8 = 0;
LABEL_9:
  uint64_t v56 = v7;
  NSUInteger v57 = v5;
  uint64_t v55 = v8;
  if ((has & 0x80) != 0) {
    uint64_t v45 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v45 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_feedId hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v44 = 2654435761 * self->_feedCellSection;
  }
  else {
    uint64_t v44 = 0;
  }
  uint64_t v9 = [(NSData *)self->_feedViewExposureId hash];
  __int16 v10 = (__int16)self->_has;
  if (v10 < 0) {
    uint64_t v11 = 2654435761 * self->_isUserSubscribedToFeed;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v52 = v11;
  uint64_t v53 = v9;
  if ((v10 & 0x10) != 0) {
    uint64_t v43 = 2654435761 * self->_articleType;
  }
  else {
    uint64_t v43 = 0;
  }
  uint64_t v12 = [(NSMutableArray *)self->_namedEntities hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x800) != 0)
  {
    uint64_t v41 = 2654435761 * self->_publisherArticleVersion;
    if ((v13 & 0x20) != 0) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v41 = 0;
    if ((v13 & 0x20) != 0)
    {
LABEL_23:
      uint64_t v14 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_26;
    }
  }
  uint64_t v14 = 0;
LABEL_26:
  uint64_t v50 = v14;
  uint64_t v51 = v12;
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    uint64_t v49 = 2654435761 * self->_adSupportedChannel;
  }
  else {
    uint64_t v49 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v16 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v17 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v18 = [(NSString *)self->_sectionHeadlineId hash];
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x2000) != 0) {
    uint64_t v48 = 2654435761 * self->_isDigitalReplicaAd;
  }
  else {
    uint64_t v48 = 0;
  }
  NSUInteger v63 = v16;
  NSUInteger v64 = v15;
  NSUInteger v61 = v18;
  NSUInteger v62 = v17;
  if ((v19 & 2) != 0) {
    uint64_t v47 = 2654435761 * self->_personalizationTreatmentId;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v20 = [(NSMutableArray *)self->_galleryImageIds hash];
  NSUInteger v21 = [(NSString *)self->_metadata hash];
  NSUInteger v22 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v23 = [(NSString *)self->_previousArticleVersion hash];
  unint64_t v24 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  uint64_t v25 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x4000) != 0) {
    uint64_t v27 = 2654435761 * self->_isNativeAd;
  }
  else {
    uint64_t v27 = 0;
  }
  if ((v26 & 8) == 0)
  {
    uint64_t v28 = 0;
    if (v26) {
      goto LABEL_40;
    }
LABEL_43:
    uint64_t v29 = 0;
    if ((v26 & 4) != 0) {
      goto LABEL_41;
    }
LABEL_44:
    uint64_t v30 = 0;
    goto LABEL_45;
  }
  uint64_t v28 = 2654435761 * self->_publisherArticleVersionInt64;
  if ((v26 & 1) == 0) {
    goto LABEL_43;
  }
LABEL_40:
  uint64_t v29 = 2654435761 * self->_backendArticleVersionInt64;
  if ((v26 & 4) == 0) {
    goto LABEL_44;
  }
LABEL_41:
  uint64_t v30 = 2654435761 * self->_previousArticlePublisherArticleVersion;
LABEL_45:
  NSUInteger v31 = v3 ^ v46 ^ v4 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v45 ^ v54 ^ v44 ^ v53 ^ v52 ^ v43 ^ v51 ^ v42 ^ v50 ^ v49 ^ v64 ^ v63 ^ v62 ^ v61 ^ v48 ^ v47 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v27;
  NSUInteger v32 = v28 ^ v29 ^ v30 ^ [(NSString *)self->_galleryId hash];
  uint64_t v33 = v32 ^ [(NSData *)self->_galleryViewingSessionId hash];
  NSUInteger v34 = v33 ^ [(NSString *)self->_iadNativeCampaign hash];
  NSUInteger v35 = v34 ^ [(NSString *)self->_iadNativeLine hash];
  NSUInteger v36 = v35 ^ [(NSString *)self->_iadNativeAd hash];
  NSUInteger v37 = v36 ^ [(NSString *)self->_iadNativeCampaignAd hash];
  unint64_t v38 = v31 ^ v37 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v39 = [(NTPBIssueExposureData *)self->_issueExposureData hash];
  return v38 ^ v39 ^ [(NTPBIssueViewData *)self->_issueViewData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  NSUInteger v4 = (__int16 *)a3;
  NSUInteger v5 = v4;
  if ((v4[162] & 0x400) != 0)
  {
    self->_uint64_t mediaType = *((_DWORD *)v4 + 54);
    *(_WORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v4 + 26)) {
    -[NTPBMediaView setMediaId:](self, "setMediaId:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBMediaView setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 33)) {
    -[NTPBMediaView setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v5 + 6)) {
    -[NTPBMediaView setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v5 + 8)) {
    -[NTPBMediaView setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((void *)v5 + 35)) {
    -[NTPBMediaView setSourceChannelId:](self, "setSourceChannelId:");
  }
  __int16 v6 = v5[162];
  if ((v6 & 0x100) != 0)
  {
    self->_galleryImageCount = *((_DWORD *)v5 + 30);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v6 = v5[162];
    if ((v6 & 0x200) == 0)
    {
LABEL_17:
      if ((v6 & 0x80) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((v5[162] & 0x200) == 0)
  {
    goto LABEL_17;
  }
  self->_uint64_t galleryType = *((_DWORD *)v5 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  if ((v5[162] & 0x80) != 0)
  {
LABEL_18:
    self->_uint64_t feedType = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_19:
  if (*((void *)v5 + 10)) {
    -[NTPBMediaView setFeedId:](self, "setFeedId:");
  }
  if ((v5[162] & 0x40) != 0)
  {
    self->_uint64_t feedCellSection = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v5 + 12)) {
    -[NTPBMediaView setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  int v7 = v5[162];
  if ((v7 & 0x80000000) == 0)
  {
    if ((v7 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  self->_isUserSubscribedToFeed = *((unsigned char *)v5 + 323);
  *(_WORD *)&self->_has |= 0x8000u;
  if ((v5[162] & 0x10) != 0)
  {
LABEL_27:
    self->_uint64_t articleType = *((_DWORD *)v5 + 14);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_28:
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v8 = *((id *)v5 + 29);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBMediaView *)self addNamedEntities:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v10);
  }

  __int16 v13 = v5[162];
  if ((v13 & 0x800) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 64);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v13 = v5[162];
    if ((v13 & 0x20) == 0)
    {
LABEL_37:
      if ((v13 & 0x1000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_38;
    }
  }
  else if ((v13 & 0x20) == 0)
  {
    goto LABEL_37;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 18);
  *(_WORD *)&self->_has |= 0x20u;
  if ((v5[162] & 0x1000) != 0)
  {
LABEL_38:
    self->_adSupportedChannel = *((unsigned char *)v5 + 320);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_39:
  if (*((void *)v5 + 36)) {
    -[NTPBMediaView setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v5 + 37)) {
    -[NTPBMediaView setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v5 + 38)) {
    -[NTPBMediaView setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 34)) {
    -[NTPBMediaView setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  __int16 v14 = v5[162];
  if ((v14 & 0x2000) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v5 + 321);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v14 = v5[162];
  }
  if ((v14 & 2) != 0)
  {
    self->_personalizationTreatmentId = *((void *)v5 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v15 = *((id *)v5 + 16);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NTPBMediaView *)self addGalleryImageIds:*(void *)(*((void *)&v38 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v17);
  }

  if (*((void *)v5 + 28)) {
    -[NTPBMediaView setMetadata:](self, "setMetadata:");
  }
  if (*((void *)v5 + 30)) {
    -[NTPBMediaView setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 31)) {
    -[NTPBMediaView setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v21 = *((void *)v5 + 39);
  if (widgetEngagement)
  {
    if (v21) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[NTPBMediaView setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v22 = *((id *)v5 + 13);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        -[NTPBMediaView addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(void *)(*((void *)&v34 + 1) + 8 * k), (void)v34);
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v24);
  }

  __int16 v27 = v5[162];
  if ((v27 & 0x4000) != 0)
  {
    self->_isNativeAd = *((unsigned char *)v5 + 322);
    *(_WORD *)&self->_has |= 0x4000u;
    __int16 v27 = v5[162];
    if ((v27 & 8) == 0)
    {
LABEL_86:
      if ((v27 & 1) == 0) {
        goto LABEL_87;
      }
      goto LABEL_106;
    }
  }
  else if ((v27 & 8) == 0)
  {
    goto LABEL_86;
  }
  self->_publisherArticleVersionInt64 = *((void *)v5 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v27 = v5[162];
  if ((v27 & 1) == 0)
  {
LABEL_87:
    if ((v27 & 4) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
LABEL_106:
  self->_backendArticleVersionInt64 = *((void *)v5 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((v5[162] & 4) != 0)
  {
LABEL_88:
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_89:
  if (*((void *)v5 + 14)) {
    -[NTPBMediaView setGalleryId:](self, "setGalleryId:");
  }
  if (*((void *)v5 + 18)) {
    -[NTPBMediaView setGalleryViewingSessionId:](self, "setGalleryViewingSessionId:");
  }
  if (*((void *)v5 + 20)) {
    -[NTPBMediaView setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v5 + 22)) {
    -[NTPBMediaView setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v5 + 19)) {
    -[NTPBMediaView setIadNativeAd:](self, "setIadNativeAd:");
  }
  if (*((void *)v5 + 21)) {
    -[NTPBMediaView setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  issueData = self->_issueData;
  uint64_t v29 = *((void *)v5 + 23);
  if (issueData)
  {
    if (v29) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[NTPBMediaView setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v31 = *((void *)v5 + 24);
  if (issueExposureData)
  {
    if (v31) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[NTPBMediaView setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v33 = *((void *)v5 + 25);
  if (issueViewData)
  {
    if (v33) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[NTPBMediaView setIssueViewData:](self, "setIssueViewData:");
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

- (int)galleryImageCount
{
  return self->_galleryImageCount;
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

- (NSMutableArray)galleryImageIds
{
  return self->_galleryImageIds;
}

- (void)setGalleryImageIds:(id)a3
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

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
}

- (BOOL)isNativeAd
{
  return self->_isNativeAd;
}

- (int64_t)publisherArticleVersionInt64
{
  return self->_publisherArticleVersionInt64;
}

- (int64_t)backendArticleVersionInt64
{
  return self->_backendArticleVersionInt64;
}

- (int64_t)previousArticlePublisherArticleVersion
{
  return self->_previousArticlePublisherArticleVersion;
}

- (NSString)galleryId
{
  return self->_galleryId;
}

- (void)setGalleryId:(id)a3
{
}

- (NSData)galleryViewingSessionId
{
  return self->_galleryViewingSessionId;
}

- (void)setGalleryViewingSessionId:(id)a3
{
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

- (NSString)iadNativeCampaignAd
{
  return self->_iadNativeCampaignAd;
}

- (void)setIadNativeCampaignAd:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_surfacedByTopicId, 0);
  objc_storeStrong((id *)&self->_surfacedBySectionId, 0);
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_sectionHeadlineId, 0);
  objc_storeStrong((id *)&self->_referencedArticleId, 0);
  objc_storeStrong((id *)&self->_previousArticleVersion, 0);
  objc_storeStrong((id *)&self->_previousArticleId, 0);
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
  objc_storeStrong((id *)&self->_galleryViewingSessionId, 0);
  objc_storeStrong((id *)&self->_galleryImageIds, 0);
  objc_storeStrong((id *)&self->_galleryId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end