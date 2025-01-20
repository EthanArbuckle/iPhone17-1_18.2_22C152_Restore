@interface NTPBMediaExposure
+ (Class)fractionalCohortMembershipType;
+ (Class)namedEntitiesType;
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasArticleId;
- (BOOL)hasArticleSessionId;
- (BOOL)hasArticleType;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasCountOfImagesExposed;
- (BOOL)hasCountOfImagesInGallery;
- (BOOL)hasFeedCellSection;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGalleryId;
- (BOOL)hasGalleryType;
- (BOOL)hasIadNativeAd;
- (BOOL)hasIadNativeCampaign;
- (BOOL)hasIadNativeCampaignAd;
- (BOOL)hasIadNativeLine;
- (BOOL)hasIsDigitalReplicaAd;
- (BOOL)hasIsNativeAd;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasIsVideoInFeed;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasMediaId;
- (BOOL)hasMediaLocation;
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
- (BOOL)hasVideoType;
- (BOOL)hasWidgetEngagement;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNativeAd;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)isVideoInFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)articleSessionId;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSMutableArray)fractionalCohortMemberships;
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
- (id)galleryTypeAsString:(int)a3;
- (id)mediaTypeAsString:(int)a3;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (id)videoTypeAsString:(int)a3;
- (int)StringAsArticleType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGalleryType:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)StringAsVideoType:(id)a3;
- (int)articleType;
- (int)backendArticleVersion;
- (int)countOfImagesExposed;
- (int)countOfImagesInGallery;
- (int)feedCellSection;
- (int)feedType;
- (int)galleryType;
- (int)mediaLocation;
- (int)mediaType;
- (int)publisherArticleVersion;
- (int)videoType;
- (int64_t)backendArticleVersionInt64;
- (int64_t)personalizationTreatmentId;
- (int64_t)previousArticlePublisherArticleVersion;
- (int64_t)publisherArticleVersionInt64;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)hash;
- (unint64_t)namedEntitiesCount;
- (void)addFractionalCohortMembership:(id)a3;
- (void)addNamedEntities:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)clearNamedEntities;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleSessionId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setBackendArticleVersion:(int)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setCountOfImagesExposed:(int)a3;
- (void)setCountOfImagesInGallery:(int)a3;
- (void)setFeedCellSection:(int)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setGalleryId:(id)a3;
- (void)setGalleryType:(int)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasArticleType:(BOOL)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasBackendArticleVersionInt64:(BOOL)a3;
- (void)setHasCountOfImagesExposed:(BOOL)a3;
- (void)setHasCountOfImagesInGallery:(BOOL)a3;
- (void)setHasFeedCellSection:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGalleryType:(BOOL)a3;
- (void)setHasIsDigitalReplicaAd:(BOOL)a3;
- (void)setHasIsNativeAd:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasIsVideoInFeed:(BOOL)a3;
- (void)setHasMediaLocation:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setHasVideoType:(BOOL)a3;
- (void)setIadNativeAd:(id)a3;
- (void)setIadNativeCampaign:(id)a3;
- (void)setIadNativeCampaignAd:(id)a3;
- (void)setIadNativeLine:(id)a3;
- (void)setIsDigitalReplicaAd:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIsVideoInFeed:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setMediaId:(id)a3;
- (void)setMediaLocation:(int)a3;
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
- (void)setVideoType:(int)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBMediaExposure

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
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
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
    int v3 = off_264449490[a3];
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

- (int)galleryType
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_galleryType;
  }
  else {
    return 0;
  }
}

- (void)setGalleryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_galleryType = a3;
}

- (void)setHasGalleryType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasGalleryType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)galleryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_2644494C8[a3];
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
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
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
    int v3 = off_2644494E0[a3];
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
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
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
    int v3 = off_264449590[a3];
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
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)articleType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasArticleType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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
    int v3 = off_264449620[a3];
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
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)mediaLocation
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_mediaLocation;
  }
  else {
    return 0;
  }
}

- (void)setMediaLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_mediaLocation = a3;
}

- (void)setHasMediaLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasMediaLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsVideoInFeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCountOfImagesExposed:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_countOfImagesExposed = a3;
}

- (void)setHasCountOfImagesExposed:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCountOfImagesExposed
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCountOfImagesInGallery:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_countOfImagesInGallery = a3;
}

- (void)setHasCountOfImagesInGallery:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCountOfImagesInGallery
{
  return *(unsigned char *)&self->_has >> 7;
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

- (int)videoType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_videoType;
  }
  else {
    return 0;
  }
}

- (void)setVideoType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_videoType = a3;
}

- (void)setHasVideoType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasVideoType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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
    int v3 = off_264449650[a3];
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

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPublisherArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($AFEC46119D70AFB1E844D7CA844A7A4B)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasGalleryId
{
  return self->_galleryId != 0;
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
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBMediaExposure;
  int v4 = [(NTPBMediaExposure *)&v8 description];
  v5 = [(NTPBMediaExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v78 = *MEMORY[0x263EF8340];
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
      v5 = off_264449490[mediaType];
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
  $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    uint64_t galleryType = self->_galleryType;
    if (galleryType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_galleryType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_2644494C8[galleryType];
    }
    [v3 setObject:v14 forKey:@"gallery_type"];

    $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_2644494E0[feedType];
    }
    [v3 setObject:v16 forKey:@"feed_type"];
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
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = off_264449590[feedCellSection];
    }
    [v3 setObject:v19 forKey:@"feed_cell_section"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  $AFEC46119D70AFB1E844D7CA844A7A4B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v22 forKey:@"is_user_subscribed_to_feed"];

    $AFEC46119D70AFB1E844D7CA844A7A4B v21 = self->_has;
  }
  if ((*(unsigned char *)&v21 & 0x10) != 0)
  {
    uint64_t articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_264449620[articleType];
    }
    [v3 setObject:v24 forKey:@"article_type"];
  }
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v3 setObject:namedEntities forKey:@"named_entities"];
  }
  $AFEC46119D70AFB1E844D7CA844A7A4B v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x2000) != 0)
  {
    v61 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v3 setObject:v61 forKey:@"publisher_article_version"];

    $AFEC46119D70AFB1E844D7CA844A7A4B v26 = self->_has;
    if ((*(unsigned char *)&v26 & 0x20) == 0)
    {
LABEL_48:
      if ((*(_WORD *)&v26 & 0x8000) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&v26 & 0x20) == 0)
  {
    goto LABEL_48;
  }
  v62 = [NSNumber numberWithInt:self->_backendArticleVersion];
  [v3 setObject:v62 forKey:@"backend_article_version"];

  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_49:
    v27 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v27 forKey:@"ad_supported_channel"];
  }
LABEL_50:
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
  $AFEC46119D70AFB1E844D7CA844A7A4B v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x10000) != 0)
  {
    v63 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v3 setObject:v63 forKey:@"is_digital_replica_ad"];

    $AFEC46119D70AFB1E844D7CA844A7A4B v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x800) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v32 & 0x80000) == 0) {
        goto LABEL_61;
      }
      goto LABEL_110;
    }
  }
  else if ((*(_WORD *)&v32 & 0x800) == 0)
  {
    goto LABEL_60;
  }
  v64 = [NSNumber numberWithInt:self->_mediaLocation];
  [v3 setObject:v64 forKey:@"media_location"];

  $AFEC46119D70AFB1E844D7CA844A7A4B v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x80000) == 0)
  {
LABEL_61:
    if ((*(unsigned char *)&v32 & 2) == 0) {
      goto LABEL_62;
    }
    goto LABEL_111;
  }
LABEL_110:
  v65 = [NSNumber numberWithBool:self->_isVideoInFeed];
  [v3 setObject:v65 forKey:@"is_video_in_feed"];

  $AFEC46119D70AFB1E844D7CA844A7A4B v32 = self->_has;
  if ((*(unsigned char *)&v32 & 2) == 0)
  {
LABEL_62:
    if ((*(unsigned char *)&v32 & 0x40) == 0) {
      goto LABEL_63;
    }
    goto LABEL_112;
  }
LABEL_111:
  v66 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
  [v3 setObject:v66 forKey:@"personalization_treatment_id"];

  $AFEC46119D70AFB1E844D7CA844A7A4B v32 = self->_has;
  if ((*(unsigned char *)&v32 & 0x40) == 0)
  {
LABEL_63:
    if ((*(unsigned char *)&v32 & 0x80) == 0) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_112:
  v67 = [NSNumber numberWithInt:self->_countOfImagesExposed];
  [v3 setObject:v67 forKey:@"count_of_images_exposed"];

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_64:
    v33 = [NSNumber numberWithInt:self->_countOfImagesInGallery];
    [v3 setObject:v33 forKey:@"count_of_images_in_gallery"];
  }
LABEL_65:
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
    v38 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v38 forKey:@"widget_engagement"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v73 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    v40 = self->_fractionalCohortMemberships;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v73 objects:v77 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v74;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v74 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v73 + 1) + 8 * i) dictionaryRepresentation];
          [v39 addObject:v45];
        }
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v73 objects:v77 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"fractional_cohort_membership"];
  }
  $AFEC46119D70AFB1E844D7CA844A7A4B v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x4000) != 0)
  {
    uint64_t videoType = self->_videoType;
    if (videoType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_videoType);
      v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v69 = off_264449650[videoType];
    }
    [v3 setObject:v69 forKey:@"video_type"];

    $AFEC46119D70AFB1E844D7CA844A7A4B v46 = self->_has;
    if ((*(_DWORD *)&v46 & 0x20000) == 0)
    {
LABEL_84:
      if ((*(unsigned char *)&v46 & 8) == 0) {
        goto LABEL_85;
      }
      goto LABEL_119;
    }
  }
  else if ((*(_DWORD *)&v46 & 0x20000) == 0)
  {
    goto LABEL_84;
  }
  v70 = [NSNumber numberWithBool:self->_isNativeAd];
  [v3 setObject:v70 forKey:@"is_native_ad"];

  $AFEC46119D70AFB1E844D7CA844A7A4B v46 = self->_has;
  if ((*(unsigned char *)&v46 & 8) == 0)
  {
LABEL_85:
    if ((*(unsigned char *)&v46 & 1) == 0) {
      goto LABEL_86;
    }
    goto LABEL_120;
  }
LABEL_119:
  v71 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
  [v3 setObject:v71 forKey:@"publisher_article_version_int64"];

  $AFEC46119D70AFB1E844D7CA844A7A4B v46 = self->_has;
  if ((*(unsigned char *)&v46 & 1) == 0)
  {
LABEL_86:
    if ((*(unsigned char *)&v46 & 4) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_120:
  v72 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
  [v3 setObject:v72 forKey:@"backend_article_version_int64"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_87:
    v47 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v47 forKey:@"previous_article_publisher_article_version"];
  }
LABEL_88:
  galleryId = self->_galleryId;
  if (galleryId) {
    [v3 setObject:galleryId forKey:@"gallery_id"];
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
    v54 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v54 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v56 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v56 forKey:@"issue_exposure_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v58 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v3 setObject:v58 forKey:@"issue_view_data"];
  }
  id v59 = v3;

  return v59;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
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
  $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0) {
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
  $AFEC46119D70AFB1E844D7CA844A7A4B v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $AFEC46119D70AFB1E844D7CA844A7A4B v6 = self->_has;
  }
  if ((*(unsigned char *)&v6 & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = self->_namedEntities;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v9);
  }

  $AFEC46119D70AFB1E844D7CA844A7A4B v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AFEC46119D70AFB1E844D7CA844A7A4B v12 = self->_has;
    if ((*(unsigned char *)&v12 & 0x20) == 0)
    {
LABEL_38:
      if ((*(_WORD *)&v12 & 0x8000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((*(unsigned char *)&v12 & 0x20) == 0)
  {
    goto LABEL_38;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_39:
  }
    PBDataWriterWriteBOOLField();
LABEL_40:
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
  $AFEC46119D70AFB1E844D7CA844A7A4B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $AFEC46119D70AFB1E844D7CA844A7A4B v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x800) == 0)
    {
LABEL_50:
      if ((*(_DWORD *)&v13 & 0x80000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v13 & 0x800) == 0)
  {
    goto LABEL_50;
  }
  PBDataWriterWriteInt32Field();
  $AFEC46119D70AFB1E844D7CA844A7A4B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v13 & 2) == 0) {
      goto LABEL_52;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteBOOLField();
  $AFEC46119D70AFB1E844D7CA844A7A4B v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_53;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt64Field();
  $AFEC46119D70AFB1E844D7CA844A7A4B v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v13 & 0x80) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_54:
  }
    PBDataWriterWriteInt32Field();
LABEL_55:
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
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v14 = self->_fractionalCohortMemberships;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v16);
  }

  $AFEC46119D70AFB1E844D7CA844A7A4B v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x4000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $AFEC46119D70AFB1E844D7CA844A7A4B v19 = self->_has;
    if ((*(_DWORD *)&v19 & 0x20000) == 0)
    {
LABEL_72:
      if ((*(unsigned char *)&v19 & 8) == 0) {
        goto LABEL_73;
      }
      goto LABEL_104;
    }
  }
  else if ((*(_DWORD *)&v19 & 0x20000) == 0)
  {
    goto LABEL_72;
  }
  PBDataWriterWriteBOOLField();
  $AFEC46119D70AFB1E844D7CA844A7A4B v19 = self->_has;
  if ((*(unsigned char *)&v19 & 8) == 0)
  {
LABEL_73:
    if ((*(unsigned char *)&v19 & 1) == 0) {
      goto LABEL_74;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteInt64Field();
  $AFEC46119D70AFB1E844D7CA844A7A4B v19 = self->_has;
  if ((*(unsigned char *)&v19 & 1) == 0)
  {
LABEL_74:
    if ((*(unsigned char *)&v19 & 4) == 0) {
      goto LABEL_76;
    }
    goto LABEL_75;
  }
LABEL_105:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_75:
  }
    PBDataWriterWriteInt64Field();
LABEL_76:
  if (self->_galleryId) {
    PBDataWriterWriteStringField();
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
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 204) = self->_mediaType;
    *(_DWORD *)(v5 + 320) |= 0x1000u;
  }
  uint64_t v7 = [(NSString *)self->_mediaId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v7;

  uint64_t v9 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v9;

  uint64_t v11 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  $AFEC46119D70AFB1E844D7CA844A7A4B v12 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v11;

  uint64_t v13 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  v14 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v13;

  uint64_t v15 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v15;

  uint64_t v17 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  uint64_t v18 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v17;

  $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 128) = self->_galleryType;
    *(_DWORD *)(v6 + 320) |= 0x400u;
    $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_feedType;
    *(_DWORD *)(v6 + 320) |= 0x200u;
  }
  uint64_t v20 = [(NSString *)self->_feedId copyWithZone:a3];
  long long v21 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v20;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(_DWORD *)(v6 + 84) = self->_feedCellSection;
    *(_DWORD *)(v6 + 320) |= 0x100u;
  }
  uint64_t v22 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  long long v23 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v22;

  $AFEC46119D70AFB1E844D7CA844A7A4B v24 = self->_has;
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    *(unsigned char *)(v6 + 315) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 320) |= 0x40000u;
    $AFEC46119D70AFB1E844D7CA844A7A4B v24 = self->_has;
  }
  if ((*(unsigned char *)&v24 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_articleType;
    *(_DWORD *)(v6 + 320) |= 0x10u;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v25 = self->_namedEntities;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v77 objects:v82 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v78;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v78 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * v29) copyWithZone:a3];
        [(id)v6 addNamedEntities:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v77 objects:v82 count:16];
    }
    while (v27);
  }

  $AFEC46119D70AFB1E844D7CA844A7A4B v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x2000) != 0)
  {
    *(_DWORD *)(v6 + 240) = self->_publisherArticleVersion;
    *(_DWORD *)(v6 + 320) |= 0x2000u;
    $AFEC46119D70AFB1E844D7CA844A7A4B v31 = self->_has;
    if ((*(unsigned char *)&v31 & 0x20) == 0)
    {
LABEL_22:
      if ((*(_WORD *)&v31 & 0x8000) == 0) {
        goto LABEL_24;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&v31 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  *(_DWORD *)(v6 + 72) = self->_backendArticleVersion;
  *(_DWORD *)(v6 + 320) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_23:
    *(unsigned char *)(v6 + 312) = self->_adSupportedChannel;
    *(_DWORD *)(v6 + 320) |= 0x8000u;
  }
LABEL_24:
  uint64_t v32 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  v33 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v32;

  uint64_t v34 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  v35 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v34;

  uint64_t v36 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v37 = *(void **)(v6 + 288);
  *(void *)(v6 + 288) = v36;

  uint64_t v38 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v39 = *(void **)(v6 + 256);
  *(void *)(v6 + 256) = v38;

  $AFEC46119D70AFB1E844D7CA844A7A4B v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x10000) != 0)
  {
    *(unsigned char *)(v6 + 313) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v6 + 320) |= 0x10000u;
    $AFEC46119D70AFB1E844D7CA844A7A4B v40 = self->_has;
    if ((*(_WORD *)&v40 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v40 & 0x80000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_50;
    }
  }
  else if ((*(_WORD *)&v40 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  *(_DWORD *)(v6 + 200) = self->_mediaLocation;
  *(_DWORD *)(v6 + 320) |= 0x800u;
  $AFEC46119D70AFB1E844D7CA844A7A4B v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x80000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v40 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(unsigned char *)(v6 + 316) = self->_isVideoInFeed;
  *(_DWORD *)(v6 + 320) |= 0x80000u;
  $AFEC46119D70AFB1E844D7CA844A7A4B v40 = self->_has;
  if ((*(unsigned char *)&v40 & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v40 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(void *)(v6 + 16) = self->_personalizationTreatmentId;
  *(_DWORD *)(v6 + 320) |= 2u;
  $AFEC46119D70AFB1E844D7CA844A7A4B v40 = self->_has;
  if ((*(unsigned char *)&v40 & 0x40) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v40 & 0x80) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_52:
  *(_DWORD *)(v6 + 76) = self->_countOfImagesExposed;
  *(_DWORD *)(v6 + 320) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_30:
    *(_DWORD *)(v6 + 80) = self->_countOfImagesInGallery;
    *(_DWORD *)(v6 + 320) |= 0x80u;
  }
LABEL_31:
  uint64_t v41 = [(NSString *)self->_metadata copyWithZone:a3];
  uint64_t v42 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v41;

  uint64_t v43 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v44 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v43;

  uint64_t v45 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  $AFEC46119D70AFB1E844D7CA844A7A4B v46 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v45;

  id v47 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  v48 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v47;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  v49 = self->_fractionalCohortMemberships;
  uint64_t v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v73 objects:v81 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v52 = *(void *)v74;
    do
    {
      uint64_t v53 = 0;
      do
      {
        if (*(void *)v74 != v52) {
          objc_enumerationMutation(v49);
        }
        v54 = objc_msgSend(*(id *)(*((void *)&v73 + 1) + 8 * v53), "copyWithZone:", a3, (void)v73);
        [(id)v6 addFractionalCohortMembership:v54];

        ++v53;
      }
      while (v51 != v53);
      uint64_t v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v73 objects:v81 count:16];
    }
    while (v51);
  }

  $AFEC46119D70AFB1E844D7CA844A7A4B v55 = self->_has;
  if ((*(_WORD *)&v55 & 0x4000) != 0)
  {
    *(_DWORD *)(v6 + 296) = self->_videoType;
    *(_DWORD *)(v6 + 320) |= 0x4000u;
    $AFEC46119D70AFB1E844D7CA844A7A4B v55 = self->_has;
    if ((*(_DWORD *)&v55 & 0x20000) == 0)
    {
LABEL_40:
      if ((*(unsigned char *)&v55 & 8) == 0) {
        goto LABEL_41;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_DWORD *)&v55 & 0x20000) == 0)
  {
    goto LABEL_40;
  }
  *(unsigned char *)(v6 + 314) = self->_isNativeAd;
  *(_DWORD *)(v6 + 320) |= 0x20000u;
  $AFEC46119D70AFB1E844D7CA844A7A4B v55 = self->_has;
  if ((*(unsigned char *)&v55 & 8) == 0)
  {
LABEL_41:
    if ((*(unsigned char *)&v55 & 1) == 0) {
      goto LABEL_42;
    }
LABEL_57:
    *(void *)(v6 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v6 + 320) |= 1u;
    if ((*(_DWORD *)&self->_has & 4) == 0) {
      goto LABEL_44;
    }
    goto LABEL_43;
  }
LABEL_56:
  *(void *)(v6 + 32) = self->_publisherArticleVersionInt64;
  *(_DWORD *)(v6 + 320) |= 8u;
  $AFEC46119D70AFB1E844D7CA844A7A4B v55 = self->_has;
  if (*(unsigned char *)&v55) {
    goto LABEL_57;
  }
LABEL_42:
  if ((*(unsigned char *)&v55 & 4) != 0)
  {
LABEL_43:
    *(void *)(v6 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 320) |= 4u;
  }
LABEL_44:
  uint64_t v56 = -[NSString copyWithZone:](self->_galleryId, "copyWithZone:", a3, (void)v73);
  v57 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v56;

  uint64_t v58 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  id v59 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v58;

  uint64_t v60 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v61 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v60;

  uint64_t v62 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  v63 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v62;

  uint64_t v64 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  v65 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v64;

  id v66 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v67 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v66;

  id v68 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  v69 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v68;

  id v70 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v71 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v70;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_172;
  }
  int v5 = *((_DWORD *)v4 + 80);
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v5 & 0x1000) == 0 || self->_mediaType != *((_DWORD *)v4 + 51)) {
      goto LABEL_172;
    }
  }
  else if ((v5 & 0x1000) != 0)
  {
    goto LABEL_172;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 24) && !-[NSString isEqual:](mediaId, "isEqual:")) {
    goto LABEL_172;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  int v13 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_galleryType != *((_DWORD *)v4 + 32)) {
      goto LABEL_172;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v13 & 0x200) == 0 || self->_feedType != *((_DWORD *)v4 + 24)) {
      goto LABEL_172;
    }
  }
  else if ((v13 & 0x200) != 0)
  {
    goto LABEL_172;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_172;
    }
    $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  }
  int v15 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 21)) {
      goto LABEL_172;
    }
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_172;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 13))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_172;
    }
    $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v17 & 0x40000) == 0) {
      goto LABEL_172;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 315)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 315))
    {
      goto LABEL_172;
    }
  }
  else if ((v17 & 0x40000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 14)) {
      goto LABEL_172;
    }
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_172;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 27))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_172;
    }
    $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  }
  int v19 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v19 & 0x2000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 60)) {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x2000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 18)) {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v19 & 0x8000) == 0) {
      goto LABEL_172;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 312)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 312))
    {
      goto LABEL_172;
    }
  }
  else if ((v19 & 0x8000) != 0)
  {
    goto LABEL_172;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 34)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_172;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 36))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 32))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  $AFEC46119D70AFB1E844D7CA844A7A4B v24 = self->_has;
  int v25 = *((_DWORD *)v4 + 80);
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    if ((v25 & 0x10000) == 0) {
      goto LABEL_172;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 313)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 313))
    {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x10000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v25 & 0x800) == 0 || self->_mediaLocation != *((_DWORD *)v4 + 50)) {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x800) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    if ((v25 & 0x80000) == 0) {
      goto LABEL_172;
    }
    if (self->_isVideoInFeed)
    {
      if (!*((unsigned char *)v4 + 316)) {
        goto LABEL_172;
      }
    }
    else if (*((unsigned char *)v4 + 316))
    {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x80000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 2)) {
      goto LABEL_172;
    }
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v24 & 0x40) != 0)
  {
    if ((v25 & 0x40) == 0 || self->_countOfImagesExposed != *((_DWORD *)v4 + 19)) {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x40) != 0)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v24 & 0x80) != 0)
  {
    if ((v25 & 0x80) == 0 || self->_countOfImagesInGallery != *((_DWORD *)v4 + 20)) {
      goto LABEL_172;
    }
  }
  else if ((v25 & 0x80) != 0)
  {
    goto LABEL_172;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 26) && !-[NSString isEqual:](metadata, "isEqual:")) {
    goto LABEL_172;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_172;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_172;
    }
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 38))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
      goto LABEL_172;
    }
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_172;
    }
  }
  $AFEC46119D70AFB1E844D7CA844A7A4B v31 = self->_has;
  int v32 = *((_DWORD *)v4 + 80);
  if ((*(_WORD *)&v31 & 0x4000) != 0)
  {
    if ((v32 & 0x4000) == 0 || self->_videoType != *((_DWORD *)v4 + 74)) {
      goto LABEL_172;
    }
  }
  else if ((v32 & 0x4000) != 0)
  {
    goto LABEL_172;
  }
  if ((*(_DWORD *)&v31 & 0x20000) != 0)
  {
    if ((v32 & 0x20000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((unsigned char *)v4 + 314)) {
          goto LABEL_172;
        }
        goto LABEL_141;
      }
      if (!*((unsigned char *)v4 + 314)) {
        goto LABEL_141;
      }
    }
LABEL_172:
    char v41 = 0;
    goto LABEL_173;
  }
  if ((v32 & 0x20000) != 0) {
    goto LABEL_172;
  }
LABEL_141:
  if ((*(unsigned char *)&v31 & 8) != 0)
  {
    if ((v32 & 8) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 4)) {
      goto LABEL_172;
    }
  }
  else if ((v32 & 8) != 0)
  {
    goto LABEL_172;
  }
  if (*(unsigned char *)&v31)
  {
    if ((v32 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_172;
    }
  }
  else if (v32)
  {
    goto LABEL_172;
  }
  if ((*(unsigned char *)&v31 & 4) != 0)
  {
    if ((v32 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 3)) {
      goto LABEL_172;
    }
  }
  else if ((v32 & 4) != 0)
  {
    goto LABEL_172;
  }
  galleryId = self->_galleryId;
  if ((unint64_t)galleryId | *((void *)v4 + 15) && !-[NSString isEqual:](galleryId, "isEqual:")) {
    goto LABEL_172;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](iadNativeCampaign, "isEqual:")) {
      goto LABEL_172;
    }
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_172;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_172;
    }
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](iadNativeCampaignAd, "isEqual:")) {
      goto LABEL_172;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 21))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_172;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 22))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_172;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 23)) {
    char v41 = -[NTPBIssueViewData isEqual:](issueViewData, "isEqual:");
  }
  else {
    char v41 = 1;
  }
LABEL_173:

  return v41;
}

- (unint64_t)hash
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    uint64_t v55 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v55 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_mediaId hash];
  NSUInteger v53 = [(NSString *)self->_articleId hash];
  NSUInteger v52 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v51 = [(NSData *)self->_articleSessionId hash];
  uint64_t v50 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v49 = [(NSString *)self->_sourceChannelId hash];
  $AFEC46119D70AFB1E844D7CA844A7A4B has = self->_has;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    uint64_t v48 = 2654435761 * self->_galleryType;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
LABEL_6:
      uint64_t v47 = 2654435761 * self->_feedType;
      goto LABEL_9;
    }
  }
  uint64_t v47 = 0;
LABEL_9:
  NSUInteger v46 = [(NSString *)self->_feedId hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v45 = 2654435761 * self->_feedCellSection;
  }
  else {
    uint64_t v45 = 0;
  }
  uint64_t v44 = [(NSData *)self->_feedViewExposureId hash];
  $AFEC46119D70AFB1E844D7CA844A7A4B v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
    uint64_t v43 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v43 = 0;
    if ((*(unsigned char *)&v4 & 0x10) != 0)
    {
LABEL_14:
      uint64_t v42 = 2654435761 * self->_articleType;
      goto LABEL_17;
    }
  }
  uint64_t v42 = 0;
LABEL_17:
  uint64_t v41 = [(NSMutableArray *)self->_namedEntities hash];
  $AFEC46119D70AFB1E844D7CA844A7A4B v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
    uint64_t v40 = 0;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v39 = 0;
    if ((*(_WORD *)&v5 & 0x8000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_23;
  }
  uint64_t v40 = 2654435761 * self->_publisherArticleVersion;
  if ((*(unsigned char *)&v5 & 0x20) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v39 = 2654435761 * self->_backendArticleVersion;
  if ((*(_WORD *)&v5 & 0x8000) != 0)
  {
LABEL_20:
    uint64_t v38 = 2654435761 * self->_adSupportedChannel;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v38 = 0;
LABEL_24:
  NSUInteger v37 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v36 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v35 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v34 = [(NSString *)self->_sectionHeadlineId hash];
  $AFEC46119D70AFB1E844D7CA844A7A4B v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0)
  {
    uint64_t v33 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_WORD *)&v6 & 0x800) != 0)
    {
LABEL_26:
      uint64_t v32 = 2654435761 * self->_mediaLocation;
      if ((*(_DWORD *)&v6 & 0x80000) != 0) {
        goto LABEL_27;
      }
      goto LABEL_33;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(_WORD *)&v6 & 0x800) != 0) {
      goto LABEL_26;
    }
  }
  uint64_t v32 = 0;
  if ((*(_DWORD *)&v6 & 0x80000) != 0)
  {
LABEL_27:
    uint64_t v30 = 2654435761 * self->_isVideoInFeed;
    if ((*(unsigned char *)&v6 & 2) != 0) {
      goto LABEL_28;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
LABEL_28:
    uint64_t v7 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(unsigned char *)&v6 & 0x40) != 0) {
      goto LABEL_29;
    }
LABEL_35:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&v6 & 0x80) != 0) {
      goto LABEL_30;
    }
    goto LABEL_36;
  }
LABEL_34:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&v6 & 0x40) == 0) {
    goto LABEL_35;
  }
LABEL_29:
  uint64_t v8 = 2654435761 * self->_countOfImagesExposed;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
LABEL_30:
    uint64_t v9 = 2654435761 * self->_countOfImagesInGallery;
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v9 = 0;
LABEL_37:
  NSUInteger v10 = [(NSString *)self->_metadata hash];
  NSUInteger v11 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v12 = [(NSString *)self->_previousArticleVersion hash];
  unint64_t v13 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  uint64_t v14 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $AFEC46119D70AFB1E844D7CA844A7A4B v15 = self->_has;
  if ((*(_WORD *)&v15 & 0x4000) != 0)
  {
    uint64_t v16 = 2654435761 * self->_videoType;
    if ((*(_DWORD *)&v15 & 0x20000) != 0)
    {
LABEL_39:
      uint64_t v17 = 2654435761 * self->_isNativeAd;
      if ((*(unsigned char *)&v15 & 8) != 0) {
        goto LABEL_40;
      }
      goto LABEL_45;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(_DWORD *)&v15 & 0x20000) != 0) {
      goto LABEL_39;
    }
  }
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v15 & 8) != 0)
  {
LABEL_40:
    uint64_t v18 = 2654435761 * self->_publisherArticleVersionInt64;
    if (*(unsigned char *)&v15) {
      goto LABEL_41;
    }
LABEL_46:
    uint64_t v19 = 0;
    if ((*(unsigned char *)&v15 & 4) != 0) {
      goto LABEL_42;
    }
LABEL_47:
    uint64_t v20 = 0;
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&v15 & 1) == 0) {
    goto LABEL_46;
  }
LABEL_41:
  uint64_t v19 = 2654435761 * self->_backendArticleVersionInt64;
  if ((*(unsigned char *)&v15 & 4) == 0) {
    goto LABEL_47;
  }
LABEL_42:
  uint64_t v20 = 2654435761 * self->_previousArticlePublisherArticleVersion;
LABEL_48:
  NSUInteger v21 = v54 ^ v55 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16;
  NSUInteger v22 = v17 ^ v18 ^ v19 ^ v20 ^ [(NSString *)self->_galleryId hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_iadNativeCampaign hash];
  NSUInteger v24 = v23 ^ [(NSString *)self->_iadNativeLine hash];
  NSUInteger v25 = v24 ^ [(NSString *)self->_iadNativeAd hash];
  NSUInteger v26 = v25 ^ [(NSString *)self->_iadNativeCampaignAd hash];
  unint64_t v27 = v26 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v28 = v21 ^ v27 ^ [(NTPBIssueExposureData *)self->_issueExposureData hash];
  return v28 ^ [(NTPBIssueViewData *)self->_issueViewData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  $AFEC46119D70AFB1E844D7CA844A7A4B v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 321) & 0x10) != 0)
  {
    self->_uint64_t mediaType = v4[51];
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v4 + 24)) {
    -[NTPBMediaExposure setMediaId:](self, "setMediaId:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBMediaExposure setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 31)) {
    -[NTPBMediaExposure setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v5 + 6)) {
    -[NTPBMediaExposure setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v5 + 8)) {
    -[NTPBMediaExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((void *)v5 + 33)) {
    -[NTPBMediaExposure setSourceChannelId:](self, "setSourceChannelId:");
  }
  int v6 = *((_DWORD *)v5 + 80);
  if ((v6 & 0x400) != 0)
  {
    self->_uint64_t galleryType = *((_DWORD *)v5 + 32);
    *(_DWORD *)&self->_has |= 0x400u;
    int v6 = *((_DWORD *)v5 + 80);
  }
  if ((v6 & 0x200) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x200u;
  }
  if (*((void *)v5 + 11)) {
    -[NTPBMediaExposure setFeedId:](self, "setFeedId:");
  }
  if (*((unsigned char *)v5 + 321))
  {
    self->_uint64_t feedCellSection = *((_DWORD *)v5 + 21);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v5 + 13)) {
    -[NTPBMediaExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  int v7 = *((_DWORD *)v5 + 80);
  if ((v7 & 0x40000) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v5 + 315);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v7 = *((_DWORD *)v5 + 80);
  }
  if ((v7 & 0x10) != 0)
  {
    self->_uint64_t articleType = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v8 = *((id *)v5 + 27);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBMediaExposure *)self addNamedEntities:*(void *)(*((void *)&v33 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v10);
  }

  int v13 = *((_DWORD *)v5 + 80);
  if ((v13 & 0x2000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 60);
    *(_DWORD *)&self->_has |= 0x2000u;
    int v13 = *((_DWORD *)v5 + 80);
    if ((v13 & 0x20) == 0)
    {
LABEL_38:
      if ((v13 & 0x8000) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((v13 & 0x20) == 0)
  {
    goto LABEL_38;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v5 + 80) & 0x8000) != 0)
  {
LABEL_39:
    self->_adSupportedChannel = *((unsigned char *)v5 + 312);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_40:
  if (*((void *)v5 + 34)) {
    -[NTPBMediaExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v5 + 35)) {
    -[NTPBMediaExposure setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v5 + 36)) {
    -[NTPBMediaExposure setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 32)) {
    -[NTPBMediaExposure setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x10000) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v5 + 313);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v14 = *((_DWORD *)v5 + 80);
    if ((v14 & 0x800) == 0)
    {
LABEL_50:
      if ((v14 & 0x80000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_69;
    }
  }
  else if ((v14 & 0x800) == 0)
  {
    goto LABEL_50;
  }
  self->_mediaLocation = *((_DWORD *)v5 + 50);
  *(_DWORD *)&self->_has |= 0x800u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x80000) == 0)
  {
LABEL_51:
    if ((v14 & 2) == 0) {
      goto LABEL_52;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_isVideoInFeed = *((unsigned char *)v5 + 316);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 2) == 0)
  {
LABEL_52:
    if ((v14 & 0x40) == 0) {
      goto LABEL_53;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_personalizationTreatmentId = *((void *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v14 = *((_DWORD *)v5 + 80);
  if ((v14 & 0x40) == 0)
  {
LABEL_53:
    if ((v14 & 0x80) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_71:
  self->_countOfImagesExposed = *((_DWORD *)v5 + 19);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)v5 + 80) & 0x80) != 0)
  {
LABEL_54:
    self->_countOfImagesInGallery = *((_DWORD *)v5 + 20);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_55:
  if (*((void *)v5 + 26)) {
    -[NTPBMediaExposure setMetadata:](self, "setMetadata:");
  }
  if (*((void *)v5 + 28)) {
    -[NTPBMediaExposure setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 29)) {
    -[NTPBMediaExposure setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v16 = *((void *)v5 + 38);
  if (widgetEngagement)
  {
    if (v16) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBMediaExposure setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = *((id *)v5 + 14);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v30 != v20) {
          objc_enumerationMutation(v17);
        }
        -[NTPBMediaExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(void *)(*((void *)&v29 + 1) + 8 * j), (void)v29);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v19);
  }

  int v22 = *((_DWORD *)v5 + 80);
  if ((v22 & 0x4000) != 0)
  {
    self->_uint64_t videoType = *((_DWORD *)v5 + 74);
    *(_DWORD *)&self->_has |= 0x4000u;
    int v22 = *((_DWORD *)v5 + 80);
    if ((v22 & 0x20000) == 0)
    {
LABEL_84:
      if ((v22 & 8) == 0) {
        goto LABEL_85;
      }
      goto LABEL_103;
    }
  }
  else if ((v22 & 0x20000) == 0)
  {
    goto LABEL_84;
  }
  self->_isNativeAd = *((unsigned char *)v5 + 314);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v22 = *((_DWORD *)v5 + 80);
  if ((v22 & 8) == 0)
  {
LABEL_85:
    if ((v22 & 1) == 0) {
      goto LABEL_86;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_publisherArticleVersionInt64 = *((void *)v5 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v22 = *((_DWORD *)v5 + 80);
  if ((v22 & 1) == 0)
  {
LABEL_86:
    if ((v22 & 4) == 0) {
      goto LABEL_88;
    }
    goto LABEL_87;
  }
LABEL_104:
  self->_backendArticleVersionInt64 = *((void *)v5 + 1);
  *(_DWORD *)&self->_has |= 1u;
  if ((*((_DWORD *)v5 + 80) & 4) != 0)
  {
LABEL_87:
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_88:
  if (*((void *)v5 + 15)) {
    -[NTPBMediaExposure setGalleryId:](self, "setGalleryId:");
  }
  if (*((void *)v5 + 18)) {
    -[NTPBMediaExposure setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v5 + 20)) {
    -[NTPBMediaExposure setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v5 + 17)) {
    -[NTPBMediaExposure setIadNativeAd:](self, "setIadNativeAd:");
  }
  if (*((void *)v5 + 19)) {
    -[NTPBMediaExposure setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  issueData = self->_issueData;
  uint64_t v24 = *((void *)v5 + 21);
  if (issueData)
  {
    if (v24) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBMediaExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v26 = *((void *)v5 + 22);
  if (issueExposureData)
  {
    if (v26) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBMediaExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v28 = *((void *)v5 + 23);
  if (issueViewData)
  {
    if (v28) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[NTPBMediaExposure setIssueViewData:](self, "setIssueViewData:");
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

- (BOOL)isVideoInFeed
{
  return self->_isVideoInFeed;
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (int)countOfImagesExposed
{
  return self->_countOfImagesExposed;
}

- (int)countOfImagesInGallery
{
  return self->_countOfImagesInGallery;
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
  objc_storeStrong((id *)&self->_galleryId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end