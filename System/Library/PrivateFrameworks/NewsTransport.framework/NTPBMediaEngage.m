@interface NTPBMediaEngage
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
- (BOOL)hasIsTopStoryArticle;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasIsVideoInFeed;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasLoadFailureReason;
- (BOOL)hasMediaDuration;
- (BOOL)hasMediaId;
- (BOOL)hasMediaPauseLocation;
- (BOOL)hasMediaPauseMethod;
- (BOOL)hasMediaPausePosition;
- (BOOL)hasMediaPlayLocation;
- (BOOL)hasMediaPlayMethod;
- (BOOL)hasMediaResumeMethod;
- (BOOL)hasMediaResumePosition;
- (BOOL)hasMediaResumeTimePlayed;
- (BOOL)hasMediaTimePlayed;
- (BOOL)hasMediaType;
- (BOOL)hasMetadata;
- (BOOL)hasMuteButtonState;
- (BOOL)hasNativeCampaignData;
- (BOOL)hasOsVolumeLevel;
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
- (BOOL)hasTopStoryType;
- (BOOL)hasUserAction;
- (BOOL)hasVideoType;
- (BOOL)hasWidgetEngagement;
- (BOOL)isBreakingNewsArticle;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNativeAd;
- (BOOL)isTopStoryArticle;
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
- (float)osVolumeLevel;
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
- (id)topStoryTypeAsString:(int)a3;
- (id)topicIdsAtIndex:(unint64_t)a3;
- (id)videoTypeAsString:(int)a3;
- (int)StringAsArticleType:(id)a3;
- (int)StringAsFeedCellSection:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsMediaType:(id)a3;
- (int)StringAsTopStoryType:(id)a3;
- (int)StringAsVideoType:(id)a3;
- (int)articleType;
- (int)backendArticleVersion;
- (int)feedCellSection;
- (int)feedType;
- (int)groupType;
- (int)loadFailureReason;
- (int)mediaPauseLocation;
- (int)mediaPauseMethod;
- (int)mediaPlayLocation;
- (int)mediaPlayMethod;
- (int)mediaResumeMethod;
- (int)mediaType;
- (int)muteButtonState;
- (int)publisherArticleVersion;
- (int)rankInVideoPlaylist;
- (int)topStoryType;
- (int)userAction;
- (int)videoType;
- (int64_t)backendArticleVersionInt64;
- (int64_t)mediaDuration;
- (int64_t)mediaPausePosition;
- (int64_t)mediaResumePosition;
- (int64_t)mediaResumeTimePlayed;
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
- (void)setHasIsTopStoryArticle:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasIsVideoInFeed:(BOOL)a3;
- (void)setHasLoadFailureReason:(BOOL)a3;
- (void)setHasMediaDuration:(BOOL)a3;
- (void)setHasMediaPauseLocation:(BOOL)a3;
- (void)setHasMediaPauseMethod:(BOOL)a3;
- (void)setHasMediaPausePosition:(BOOL)a3;
- (void)setHasMediaPlayLocation:(BOOL)a3;
- (void)setHasMediaPlayMethod:(BOOL)a3;
- (void)setHasMediaResumeMethod:(BOOL)a3;
- (void)setHasMediaResumePosition:(BOOL)a3;
- (void)setHasMediaResumeTimePlayed:(BOOL)a3;
- (void)setHasMediaTimePlayed:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasMuteButtonState:(BOOL)a3;
- (void)setHasOsVolumeLevel:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setHasRankInVideoPlaylist:(BOOL)a3;
- (void)setHasTopStoryType:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setHasVideoType:(BOOL)a3;
- (void)setIadNativeAd:(id)a3;
- (void)setIadNativeCampaign:(id)a3;
- (void)setIadNativeCampaignAd:(id)a3;
- (void)setIadNativeLine:(id)a3;
- (void)setIsBreakingNewsArticle:(BOOL)a3;
- (void)setIsDigitalReplicaAd:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsTopStoryArticle:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIsVideoInFeed:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setLoadFailureReason:(int)a3;
- (void)setMediaDuration:(int64_t)a3;
- (void)setMediaId:(id)a3;
- (void)setMediaPauseLocation:(int)a3;
- (void)setMediaPauseMethod:(int)a3;
- (void)setMediaPausePosition:(int64_t)a3;
- (void)setMediaPlayLocation:(int)a3;
- (void)setMediaPlayMethod:(int)a3;
- (void)setMediaResumeMethod:(int)a3;
- (void)setMediaResumePosition:(int64_t)a3;
- (void)setMediaResumeTimePlayed:(int64_t)a3;
- (void)setMediaTimePlayed:(int64_t)a3;
- (void)setMediaType:(int)a3;
- (void)setMetadata:(id)a3;
- (void)setMuteButtonState:(int)a3;
- (void)setNamedEntities:(id)a3;
- (void)setNativeCampaignData:(id)a3;
- (void)setOsVolumeLevel:(float)a3;
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
- (void)setTopStoryType:(int)a3;
- (void)setTopicIds:(id)a3;
- (void)setUserAction:(int)a3;
- (void)setVideoType:(int)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBMediaEngage

- (int)mediaType
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    return self->_mediaType;
  }
  else {
    return 0;
  }
}

- (void)setMediaType:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_mediaType = a3;
}

- (void)setHasMediaType:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMediaType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)mediaTypeAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449A18[a3];
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

- (void)setMediaTimePlayed:(int64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_mediaTimePlayed = a3;
}

- (void)setHasMediaTimePlayed:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasMediaTimePlayed
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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

- (int)mediaPlayMethod
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_mediaPlayMethod;
  }
  else {
    return 0;
  }
}

- (void)setMediaPlayMethod:(int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_mediaPlayMethod = a3;
}

- (void)setHasMediaPlayMethod:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMediaPlayMethod
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)mediaPauseMethod
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_mediaPauseMethod;
  }
  else {
    return 0;
  }
}

- (void)setMediaPauseMethod:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_mediaPauseMethod = a3;
}

- (void)setHasMediaPauseMethod:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMediaPauseMethod
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMediaPausePosition:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_mediaPausePosition = a3;
}

- (void)setHasMediaPausePosition:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasMediaPausePosition
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMediaResumeTimePlayed:(int64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_mediaResumeTimePlayed = a3;
}

- (void)setHasMediaResumeTimePlayed:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasMediaResumeTimePlayed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)mediaResumeMethod
{
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    return self->_mediaResumeMethod;
  }
  else {
    return 0;
  }
}

- (void)setMediaResumeMethod:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_mediaResumeMethod = a3;
}

- (void)setHasMediaResumeMethod:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMediaResumeMethod
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMediaResumePosition:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_mediaResumePosition = a3;
}

- (void)setHasMediaResumePosition:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasMediaResumePosition
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)mediaPlayLocation
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_mediaPlayLocation;
  }
  else {
    return 0;
  }
}

- (void)setMediaPlayLocation:(int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_mediaPlayLocation = a3;
}

- (void)setHasMediaPlayLocation:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMediaPlayLocation
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)feedType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasFeedType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449A50[a3];
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
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_feedCellSection;
  }
  else {
    return 0;
  }
}

- (void)setFeedCellSection:(int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_feedCellSection = a3;
}

- (void)setHasFeedCellSection:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasFeedCellSection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (id)feedCellSectionAsString:(int)a3
{
  if (a3 >= 0x12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449B00[a3];
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
  *(void *)&self->_has |= 0x200000000uLL;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (int)articleType
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasArticleType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)articleTypeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449B90[a3];
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
  *(void *)&self->_has |= 0x800000uLL;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
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
  *(void *)&self->_has |= 0x40000000uLL;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (int)userAction
{
  if ((*((unsigned char *)&self->_has + 3) & 4) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsVideoInFeed:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_isVideoInFeed = a3;
}

- (void)setHasIsVideoInFeed:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsVideoInFeed
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)mediaPauseLocation
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_mediaPauseLocation;
  }
  else {
    return 0;
  }
}

- (void)setMediaPauseLocation:(int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_mediaPauseLocation = a3;
}

- (void)setHasMediaPauseLocation:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMediaPauseLocation
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMediaDuration:(int64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_mediaDuration = a3;
}

- (void)setHasMediaDuration:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasMediaDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsBreakingNewsArticle:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (int)loadFailureReason
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_loadFailureReason;
  }
  else {
    return 0;
  }
}

- (void)setLoadFailureReason:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_loadFailureReason = a3;
}

- (void)setHasLoadFailureReason:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasLoadFailureReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)topStoryType
{
  if ((*((unsigned char *)&self->_has + 3) & 2) != 0) {
    return self->_topStoryType;
  }
  else {
    return 0;
  }
}

- (void)setTopStoryType:(int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasTopStoryType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449BC0[a3];
  }

  return v3;
}

- (int)StringAsTopStoryType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TOP_STORY_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MANDATORY_TOP_STORY_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"OPTIONAL_TOP_STORY_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setIsTopStoryArticle:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsNativeAd
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
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
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449BD8[a3];
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
  if ((*((unsigned char *)&self->_has + 3) & 8) != 0) {
    return self->_videoType;
  }
  else {
    return 0;
  }
}

- (void)setVideoType:(int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_videoType = a3;
}

- (void)setHasVideoType:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasVideoType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (id)videoTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_264449D18[a3];
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
  *(void *)&self->_has |= 0x100uLL;
  self->_publisherArticleVersionInt64 = a3;
}

- (void)setHasPublisherArticleVersionInt64:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasPublisherArticleVersionInt64
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setBackendArticleVersionInt64:(int64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_backendArticleVersionInt64 = a3;
}

- (void)setHasBackendArticleVersionInt64:(BOOL)a3
{
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasBackendArticleVersionInt64
{
  return *(_DWORD *)&self->_has & 1;
}

- (int)muteButtonState
{
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    return self->_muteButtonState;
  }
  else {
    return 0;
  }
}

- (void)setMuteButtonState:(int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_muteButtonState = a3;
}

- (void)setHasMuteButtonState:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMuteButtonState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setOsVolumeLevel:(float)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_osVolumeLevel = a3;
}

- (void)setHasOsVolumeLevel:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasOsVolumeLevel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
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
  *(void *)&self->_has |= 0x80uLL;
  self->_previousArticlePublisherArticleVersion = a3;
}

- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return *(unsigned char *)&self->_has >> 7;
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
  *(void *)&self->_has |= 0x1000000uLL;
  self->_rankInVideoPlaylist = a3;
}

- (void)setHasRankInVideoPlaylist:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($16045DCADA8B3DB0231ED545073A6F77)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasRankInVideoPlaylist
{
  return *((unsigned char *)&self->_has + 3) & 1;
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
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBMediaEngage;
  id v4 = [(NTPBMediaEngage *)&v8 description];
  v5 = [(NTPBMediaEngage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    uint64_t mediaType = self->_mediaType;
    if (mediaType >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_mediaType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_264449A18[mediaType];
    }
    [v3 setObject:v5 forKey:@"media_type"];
  }
  mediaId = self->_mediaId;
  if (mediaId) {
    [v3 setObject:mediaId forKey:@"media_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_mediaTimePlayed];
    [v3 setObject:v7 forKey:@"media_time_played"];
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
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_mediaPlayMethod];
    [v3 setObject:v14 forKey:@"media_play_method"];

    $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_22:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_31;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_22;
  }
  v15 = [NSNumber numberWithInt:self->_mediaPauseMethod];
  [v3 setObject:v15 forKey:@"media_pause_method"];

  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_24;
    }
    goto LABEL_32;
  }
LABEL_31:
  v16 = [NSNumber numberWithLongLong:self->_mediaPausePosition];
  [v3 setObject:v16 forKey:@"media_pause_position"];

  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_33;
  }
LABEL_32:
  v17 = [NSNumber numberWithLongLong:self->_mediaResumeTimePlayed];
  [v3 setObject:v17 forKey:@"media_resume_time_played"];

  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_26;
    }
    goto LABEL_34;
  }
LABEL_33:
  v18 = [NSNumber numberWithInt:self->_mediaResumeMethod];
  [v3 setObject:v18 forKey:@"media_resume_method"];

  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_35;
  }
LABEL_34:
  v19 = [NSNumber numberWithLongLong:self->_mediaResumePosition];
  [v3 setObject:v19 forKey:@"media_resume_position"];

  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_36;
  }
LABEL_35:
  v20 = [NSNumber numberWithInt:self->_mediaPlayLocation];
  [v3 setObject:v20 forKey:@"media_play_location"];

  if ((*(void *)&self->_has & 0x1000) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_264449A50[feedType];
  }
  [v3 setObject:v22 forKey:@"feed_type"];

LABEL_40:
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    uint64_t feedCellSection = self->_feedCellSection;
    if (feedCellSection >= 0x12)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedCellSection);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_264449B00[feedCellSection];
    }
    [v3 setObject:v25 forKey:@"feed_cell_section"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  $16045DCADA8B3DB0231ED545073A6F77 v27 = self->_has;
  if ((*(void *)&v27 & 0x200000000) != 0)
  {
    v28 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v28 forKey:@"is_user_subscribed_to_feed"];

    $16045DCADA8B3DB0231ED545073A6F77 v27 = self->_has;
  }
  if ((*(_WORD *)&v27 & 0x200) != 0)
  {
    uint64_t articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_264449B90[articleType];
    }
    [v3 setObject:v30 forKey:@"article_type"];
  }
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v3 setObject:namedEntities forKey:@"named_entities"];
  }
  $16045DCADA8B3DB0231ED545073A6F77 v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x800000) != 0)
  {
    v48 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v3 setObject:v48 forKey:@"publisher_article_version"];

    $16045DCADA8B3DB0231ED545073A6F77 v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x400) == 0)
    {
LABEL_60:
      if ((*(_DWORD *)&v32 & 0x10000000) == 0) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&v32 & 0x400) == 0)
  {
    goto LABEL_60;
  }
  v49 = [NSNumber numberWithInt:self->_backendArticleVersion];
  [v3 setObject:v49 forKey:@"backend_article_version"];

  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_61:
    v33 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v33 forKey:@"ad_supported_channel"];
  }
LABEL_62:
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
  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x40000000) != 0)
  {
    v50 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v3 setObject:v50 forKey:@"is_digital_replica_ad"];

    $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
    if ((*(_DWORD *)&v38 & 0x4000000) == 0)
    {
LABEL_72:
      if ((*(void *)&v38 & 0x400000000) == 0) {
        goto LABEL_73;
      }
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v38 & 0x4000000) == 0)
  {
    goto LABEL_72;
  }
  v51 = [NSNumber numberWithInt:self->_userAction];
  [v3 setObject:v51 forKey:@"user_action"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(void *)&v38 & 0x400000000) == 0)
  {
LABEL_73:
    if ((*(unsigned char *)&v38 & 0x40) == 0) {
      goto LABEL_74;
    }
    goto LABEL_101;
  }
LABEL_100:
  v52 = [NSNumber numberWithBool:self->_isVideoInFeed];
  [v3 setObject:v52 forKey:@"is_video_in_feed"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(unsigned char *)&v38 & 0x40) == 0)
  {
LABEL_74:
    if ((*(_WORD *)&v38 & 0x8000) == 0) {
      goto LABEL_75;
    }
    goto LABEL_102;
  }
LABEL_101:
  v53 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
  [v3 setObject:v53 forKey:@"personalization_treatment_id"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x8000) == 0)
  {
LABEL_75:
    if ((*(unsigned char *)&v38 & 2) == 0) {
      goto LABEL_76;
    }
    goto LABEL_103;
  }
LABEL_102:
  v54 = [NSNumber numberWithInt:self->_mediaPauseLocation];
  [v3 setObject:v54 forKey:@"media_pause_location"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(unsigned char *)&v38 & 2) == 0)
  {
LABEL_76:
    if ((*(_DWORD *)&v38 & 0x20000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_104;
  }
LABEL_103:
  v55 = [NSNumber numberWithLongLong:self->_mediaDuration];
  [v3 setObject:v55 forKey:@"media_duration"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x20000000) == 0)
  {
LABEL_77:
    if ((*(_WORD *)&v38 & 0x4000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_105;
  }
LABEL_104:
  v56 = [NSNumber numberWithBool:self->_isBreakingNewsArticle];
  [v3 setObject:v56 forKey:@"is_breaking_news_article"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(_WORD *)&v38 & 0x4000) == 0)
  {
LABEL_78:
    if ((*(_DWORD *)&v38 & 0x2000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_106;
  }
LABEL_105:
  v57 = [NSNumber numberWithInt:self->_loadFailureReason];
  [v3 setObject:v57 forKey:@"load_failure_reason"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x2000000) == 0)
  {
LABEL_79:
    if ((*(void *)&v38 & 0x100000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_156;
  }
LABEL_106:
  uint64_t topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_topStoryType);
    v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v59 = off_264449BC0[topStoryType];
  }
  [v3 setObject:v59 forKey:@"top_story_type"];

  $16045DCADA8B3DB0231ED545073A6F77 v38 = self->_has;
  if ((*(void *)&v38 & 0x100000000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v38 & 0x80000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_81;
  }
LABEL_156:
  v91 = [NSNumber numberWithBool:self->_isTopStoryArticle];
  [v3 setObject:v91 forKey:@"is_top_story_article"];

  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_81:
    v39 = [NSNumber numberWithBool:self->_isNativeAd];
    [v3 setObject:v39 forKey:@"is_native_ad"];
  }
LABEL_82:
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
    v45 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v45 forKey:@"widget_engagement"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v47 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v47 = off_264449BD8[groupType];
    }
    [v3 setObject:v47 forKey:@"group_type"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v62 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    v63 = self->_fractionalCohortMemberships;
    uint64_t v64 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v95 objects:v99 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v65; ++i)
        {
          if (*(void *)v96 != v66) {
            objc_enumerationMutation(v63);
          }
          v68 = [*(id *)(*((void *)&v95 + 1) + 8 * i) dictionaryRepresentation];
          [v62 addObject:v68];
        }
        uint64_t v65 = [(NSMutableArray *)v63 countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v65);
    }

    [v3 setObject:v62 forKey:@"fractional_cohort_membership"];
  }
  $16045DCADA8B3DB0231ED545073A6F77 v69 = self->_has;
  if ((*(_DWORD *)&v69 & 0x8000000) != 0)
  {
    uint64_t videoType = self->_videoType;
    if (videoType >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_videoType);
      v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v90 = off_264449D18[videoType];
    }
    [v3 setObject:v90 forKey:@"video_type"];

    $16045DCADA8B3DB0231ED545073A6F77 v69 = self->_has;
    if ((*(_WORD *)&v69 & 0x100) == 0)
    {
LABEL_123:
      if ((*(unsigned char *)&v69 & 1) == 0) {
        goto LABEL_124;
      }
      goto LABEL_161;
    }
  }
  else if ((*(_WORD *)&v69 & 0x100) == 0)
  {
    goto LABEL_123;
  }
  v92 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
  [v3 setObject:v92 forKey:@"publisher_article_version_int64"];

  $16045DCADA8B3DB0231ED545073A6F77 v69 = self->_has;
  if ((*(unsigned char *)&v69 & 1) == 0)
  {
LABEL_124:
    if ((*(_DWORD *)&v69 & 0x200000) == 0) {
      goto LABEL_125;
    }
    goto LABEL_162;
  }
LABEL_161:
  v93 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
  [v3 setObject:v93 forKey:@"backend_article_version_int64"];

  $16045DCADA8B3DB0231ED545073A6F77 v69 = self->_has;
  if ((*(_DWORD *)&v69 & 0x200000) == 0)
  {
LABEL_125:
    if ((*(_DWORD *)&v69 & 0x400000) == 0) {
      goto LABEL_127;
    }
    goto LABEL_126;
  }
LABEL_162:
  v94 = [NSNumber numberWithInt:self->_muteButtonState];
  [v3 setObject:v94 forKey:@"mute_button_state"];

  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_126:
    *(float *)&double v61 = self->_osVolumeLevel;
    v70 = [NSNumber numberWithFloat:v61];
    [v3 setObject:v70 forKey:@"os_volume_level"];
  }
LABEL_127:
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
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    v74 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v74 forKey:@"previous_article_publisher_article_version"];
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
    v78 = [(NTPBAlternateHeadline *)alternateHeadline dictionaryRepresentation];
    [v3 setObject:v78 forKey:@"alternate_headline"];
  }
  if (*((unsigned char *)&self->_has + 3))
  {
    v79 = [NSNumber numberWithInt:self->_rankInVideoPlaylist];
    [v3 setObject:v79 forKey:@"rank_in_video_playlist"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v81 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v81 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v83 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v83 forKey:@"issue_exposure_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v85 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v3 setObject:v85 forKey:@"issue_view_data"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_ids"];
  }
  id v87 = v3;

  return v87;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMediaEngageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_mediaId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt64Field();
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
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_126;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteInt32Field();
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_130:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x1000) != 0) {
LABEL_25:
  }
    PBDataWriterWriteInt32Field();
LABEL_26:
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  $16045DCADA8B3DB0231ED545073A6F77 v6 = self->_has;
  if ((*(void *)&v6 & 0x200000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $16045DCADA8B3DB0231ED545073A6F77 v6 = self->_has;
  }
  if ((*(_WORD *)&v6 & 0x200) != 0) {
    PBDataWriterWriteInt32Field();
  }
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
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v9);
  }

  $16045DCADA8B3DB0231ED545073A6F77 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $16045DCADA8B3DB0231ED545073A6F77 v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x400) == 0)
    {
LABEL_45:
      if ((*(_DWORD *)&v12 & 0x10000000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((*(_WORD *)&v12 & 0x400) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x10000000) != 0) {
LABEL_46:
  }
    PBDataWriterWriteBOOLField();
LABEL_47:
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
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x4000000) == 0)
    {
LABEL_57:
      if ((*(void *)&v13 & 0x400000000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_137;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
    goto LABEL_57;
  }
  PBDataWriterWriteInt32Field();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(void *)&v13 & 0x400000000) == 0)
  {
LABEL_58:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_59;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteBOOLField();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_59:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&v13 & 2) == 0) {
      goto LABEL_61;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteInt32Field();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) == 0)
  {
LABEL_61:
    if ((*(_DWORD *)&v13 & 0x20000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v13 & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteBOOLField();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_63:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteInt32Field();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_64:
    if ((*(void *)&v13 & 0x100000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt32Field();
  $16045DCADA8B3DB0231ED545073A6F77 v13 = self->_has;
  if ((*(void *)&v13 & 0x100000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v13 & 0x80000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  if ((*(void *)&self->_has & 0x80000000) != 0) {
LABEL_66:
  }
    PBDataWriterWriteBOOLField();
LABEL_67:
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
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = self->_fractionalCohortMemberships;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v29 objects:v38 count:16];
    }
    while (v16);
  }

  $16045DCADA8B3DB0231ED545073A6F77 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x8000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $16045DCADA8B3DB0231ED545073A6F77 v19 = self->_has;
    if ((*(_WORD *)&v19 & 0x100) == 0)
    {
LABEL_90:
      if ((*(unsigned char *)&v19 & 1) == 0) {
        goto LABEL_91;
      }
      goto LABEL_148;
    }
  }
  else if ((*(_WORD *)&v19 & 0x100) == 0)
  {
    goto LABEL_90;
  }
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 v19 = self->_has;
  if ((*(unsigned char *)&v19 & 1) == 0)
  {
LABEL_91:
    if ((*(_DWORD *)&v19 & 0x200000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteInt64Field();
  $16045DCADA8B3DB0231ED545073A6F77 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x200000) == 0)
  {
LABEL_92:
    if ((*(_DWORD *)&v19 & 0x400000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_93;
  }
LABEL_149:
  PBDataWriterWriteInt32Field();
  if ((*(void *)&self->_has & 0x400000) != 0) {
LABEL_93:
  }
    PBDataWriterWriteFloatField();
LABEL_94:
  if (self->_iadNativeCampaign) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeLine) {
    PBDataWriterWriteStringField();
  }
  if (self->_iadNativeAd) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
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
  if (*((unsigned char *)&self->_has + 3)) {
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
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v20 = self->_topicIds;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v26 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v25 objects:v37 count:16];
    }
    while (v22);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 276) = self->_mediaType;
    *(void *)(v5 + 432) |= 0x100000uLL;
  }
  uint64_t v7 = [(NSString *)self->_mediaId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v7;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(void *)(v6 + 48) = self->_mediaTimePlayed;
    *(void *)(v6 + 432) |= 0x20uLL;
  }
  uint64_t v9 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v9;

  uint64_t v11 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  $16045DCADA8B3DB0231ED545073A6F77 v12 = *(void **)(v6 + 344);
  *(void *)(v6 + 344) = v11;

  uint64_t v13 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  v14 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v13;

  uint64_t v15 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  uint64_t v16 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v15;

  uint64_t v17 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  uint64_t v18 = *(void **)(v6 + 360);
  *(void *)(v6 + 360) = v17;

  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    *(_DWORD *)(v6 + 268) = self->_mediaPlayMethod;
    *(void *)(v6 + 432) |= 0x40000uLL;
    $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
    if ((*(_DWORD *)&has & 0x10000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_DWORD *)&has & 0x10000) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 260) = self->_mediaPauseMethod;
  *(void *)(v6 + 432) |= 0x10000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(void *)(v6 + 24) = self->_mediaPausePosition;
  *(void *)(v6 + 432) |= 4uLL;
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(void *)(v6 + 40) = self->_mediaResumeTimePlayed;
  *(void *)(v6 + 432) |= 0x10uLL;
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v6 + 272) = self->_mediaResumeMethod;
  *(void *)(v6 + 432) |= 0x80000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(void *)(v6 + 32) = self->_mediaResumePosition;
  *(void *)(v6 + 432) |= 8uLL;
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_76:
  *(_DWORD *)(v6 + 264) = self->_mediaPlayLocation;
  *(void *)(v6 + 432) |= 0x20000uLL;
  if ((*(void *)&self->_has & 0x1000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v6 + 136) = self->_feedType;
    *(void *)(v6 + 432) |= 0x1000uLL;
  }
LABEL_14:
  uint64_t v20 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v21 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v20;

  if ((*((unsigned char *)&self->_has + 1) & 8) != 0)
  {
    *(_DWORD *)(v6 + 124) = self->_feedCellSection;
    *(void *)(v6 + 432) |= 0x800uLL;
  }
  uint64_t v22 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v23 = *(void **)(v6 + 144);
  *(void *)(v6 + 144) = v22;

  $16045DCADA8B3DB0231ED545073A6F77 v24 = self->_has;
  if ((*(void *)&v24 & 0x200000000) != 0)
  {
    *(unsigned char *)(v6 + 429) = self->_isUserSubscribedToFeed;
    *(void *)(v6 + 432) |= 0x200000000uLL;
    $16045DCADA8B3DB0231ED545073A6F77 v24 = self->_has;
  }
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_articleType;
    *(void *)(v6 + 432) |= 0x200uLL;
  }
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v25 = self->_namedEntities;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v94 objects:v100 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v95;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v95 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = (void *)[*(id *)(*((void *)&v94 + 1) + 8 * v29) copyWithZone:a3];
        [(id)v6 addNamedEntities:v30];

        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v94 objects:v100 count:16];
    }
    while (v27);
  }

  $16045DCADA8B3DB0231ED545073A6F77 v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
    *(_DWORD *)(v6 + 336) = self->_publisherArticleVersion;
    *(void *)(v6 + 432) |= 0x800000uLL;
    $16045DCADA8B3DB0231ED545073A6F77 v31 = self->_has;
    if ((*(_WORD *)&v31 & 0x400) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v31 & 0x10000000) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&v31 & 0x400) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(v6 + 120) = self->_backendArticleVersion;
  *(void *)(v6 + 432) |= 0x400uLL;
  if ((*(void *)&self->_has & 0x10000000) != 0)
  {
LABEL_30:
    *(unsigned char *)(v6 + 424) = self->_adSupportedChannel;
    *(void *)(v6 + 432) |= 0x10000000uLL;
  }
LABEL_31:
  uint64_t v32 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  long long v33 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = v32;

  uint64_t v34 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  long long v35 = *(void **)(v6 + 376);
  *(void *)(v6 + 376) = v34;

  uint64_t v36 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  v37 = *(void **)(v6 + 384);
  *(void *)(v6 + 384) = v36;

  uint64_t v38 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v39 = *(void **)(v6 + 352);
  *(void *)(v6 + 352) = v38;

  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x40000000) != 0)
  {
    *(unsigned char *)(v6 + 426) = self->_isDigitalReplicaAd;
    *(void *)(v6 + 432) |= 0x40000000uLL;
    $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
    if ((*(_DWORD *)&v40 & 0x4000000) == 0)
    {
LABEL_33:
      if ((*(void *)&v40 & 0x400000000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_83;
    }
  }
  else if ((*(_DWORD *)&v40 & 0x4000000) == 0)
  {
    goto LABEL_33;
  }
  *(_DWORD *)(v6 + 408) = self->_userAction;
  *(void *)(v6 + 432) |= 0x4000000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(void *)&v40 & 0x400000000) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v40 & 0x40) == 0) {
      goto LABEL_35;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(unsigned char *)(v6 + 430) = self->_isVideoInFeed;
  *(void *)(v6 + 432) |= 0x400000000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(unsigned char *)&v40 & 0x40) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v40 & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(void *)(v6 + 56) = self->_personalizationTreatmentId;
  *(void *)(v6 + 432) |= 0x40uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x8000) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v40 & 2) == 0) {
      goto LABEL_37;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v6 + 256) = self->_mediaPauseLocation;
  *(void *)(v6 + 432) |= 0x8000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(unsigned char *)&v40 & 2) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v40 & 0x20000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(void *)(v6 + 16) = self->_mediaDuration;
  *(void *)(v6 + 432) |= 2uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x20000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v40 & 0x4000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(unsigned char *)(v6 + 425) = self->_isBreakingNewsArticle;
  *(void *)(v6 + 432) |= 0x20000000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x4000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v40 & 0x2000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v6 + 240) = self->_loadFailureReason;
  *(void *)(v6 + 432) |= 0x4000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x2000000) == 0)
  {
LABEL_40:
    if ((*(void *)&v40 & 0x100000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v6 + 392) = self->_topStoryType;
  *(void *)(v6 + 432) |= 0x2000000uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v40 = self->_has;
  if ((*(void *)&v40 & 0x100000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v40 & 0x80000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_90:
  *(unsigned char *)(v6 + 428) = self->_isTopStoryArticle;
  *(void *)(v6 + 432) |= 0x100000000uLL;
  if ((*(void *)&self->_has & 0x80000000) != 0)
  {
LABEL_42:
    *(unsigned char *)(v6 + 427) = self->_isNativeAd;
    *(void *)(v6 + 432) |= 0x80000000uLL;
  }
LABEL_43:
  uint64_t v41 = [(NSString *)self->_nativeCampaignData copyWithZone:a3];
  v42 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v41;

  uint64_t v43 = [(NSString *)self->_metadata copyWithZone:a3];
  v44 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v43;

  uint64_t v45 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v46 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v45;

  uint64_t v47 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v48 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = v47;

  id v49 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  v50 = *(void **)(v6 + 416);
  *(void *)(v6 + 416) = v49;

  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 168) = self->_groupType;
    *(void *)(v6 + 432) |= 0x2000uLL;
  }
  uint64_t v51 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  v52 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v51;

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v53 = self->_fractionalCohortMemberships;
  uint64_t v54 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v91;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v91 != v56) {
          objc_enumerationMutation(v53);
        }
        v58 = (void *)[*(id *)(*((void *)&v90 + 1) + 8 * v57) copyWithZone:a3];
        [(id)v6 addFractionalCohortMembership:v58];

        ++v57;
      }
      while (v55 != v57);
      uint64_t v55 = [(NSMutableArray *)v53 countByEnumeratingWithState:&v90 objects:v99 count:16];
    }
    while (v55);
  }

  $16045DCADA8B3DB0231ED545073A6F77 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x8000000) != 0)
  {
    *(_DWORD *)(v6 + 412) = self->_videoType;
    *(void *)(v6 + 432) |= 0x8000000uLL;
    $16045DCADA8B3DB0231ED545073A6F77 v59 = self->_has;
    if ((*(_WORD *)&v59 & 0x100) == 0)
    {
LABEL_54:
      if ((*(unsigned char *)&v59 & 1) == 0) {
        goto LABEL_55;
      }
      goto LABEL_94;
    }
  }
  else if ((*(_WORD *)&v59 & 0x100) == 0)
  {
    goto LABEL_54;
  }
  *(void *)(v6 + 72) = self->_publisherArticleVersionInt64;
  *(void *)(v6 + 432) |= 0x100uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v59 = self->_has;
  if ((*(unsigned char *)&v59 & 1) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v59 & 0x200000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(void *)(v6 + 8) = self->_backendArticleVersionInt64;
  *(void *)(v6 + 432) |= 1uLL;
  $16045DCADA8B3DB0231ED545073A6F77 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x200000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v59 & 0x400000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
LABEL_95:
  *(_DWORD *)(v6 + 288) = self->_muteButtonState;
  *(void *)(v6 + 432) |= 0x200000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_57:
    *(float *)(v6 + 312) = self->_osVolumeLevel;
    *(void *)(v6 + 432) |= 0x400000uLL;
  }
LABEL_58:
  uint64_t v60 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  double v61 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v60;

  uint64_t v62 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v63 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v62;

  uint64_t v64 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  uint64_t v65 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v64;

  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(void *)(v6 + 64) = self->_previousArticlePublisherArticleVersion;
    *(void *)(v6 + 432) |= 0x80uLL;
  }
  uint64_t v66 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  v67 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v66;

  uint64_t v68 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  $16045DCADA8B3DB0231ED545073A6F77 v69 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v68;

  id v70 = [(NTPBAlternateHeadline *)self->_alternateHeadline copyWithZone:a3];
  v71 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v70;

  if (*((unsigned char *)&self->_has + 3))
  {
    *(_DWORD *)(v6 + 340) = self->_rankInVideoPlaylist;
    *(void *)(v6 + 432) |= 0x1000000uLL;
  }
  id v72 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v73 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v72;

  id v74 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  v75 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v74;

  id v76 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v77 = *(void **)(v6 + 232);
  *(void *)(v6 + 232) = v76;

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v78 = self->_topicIds;
  uint64_t v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v86 objects:v98 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v87;
    do
    {
      uint64_t v82 = 0;
      do
      {
        if (*(void *)v87 != v81) {
          objc_enumerationMutation(v78);
        }
        v83 = objc_msgSend(*(id *)(*((void *)&v86 + 1) + 8 * v82), "copyWithZone:", a3, (void)v86);
        [(id)v6 addTopicIds:v83];

        ++v82;
      }
      while (v80 != v82);
      uint64_t v80 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v86 objects:v98 count:16];
    }
    while (v80);
  }

  id v84 = (id)v6;
  return v84;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_262;
  }
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  uint64_t v6 = *((void *)v4 + 54);
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0 || self->_mediaType != *((_DWORD *)v4 + 69)) {
      goto LABEL_262;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_262;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](mediaId, "isEqual:")) {
      goto LABEL_262;
    }
    $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  }
  uint64_t v8 = *((void *)v4 + 54);
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_mediaTimePlayed != *((void *)v4 + 6)) {
      goto LABEL_262;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_262;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 11) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_262;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 43))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 45))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  $16045DCADA8B3DB0231ED545073A6F77 v14 = self->_has;
  uint64_t v15 = *((void *)v4 + 54);
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_mediaPlayMethod != *((_DWORD *)v4 + 67)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0 || self->_mediaPauseMethod != *((_DWORD *)v4 + 65)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(unsigned char *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_mediaPausePosition != *((void *)v4 + 3)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_262;
  }
  if ((*(unsigned char *)&v14 & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_mediaResumeTimePlayed != *((void *)v4 + 5)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_mediaResumeMethod != *((_DWORD *)v4 + 68)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_mediaResumePosition != *((void *)v4 + 4)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    if ((v15 & 0x20000) == 0 || self->_mediaPlayLocation != *((_DWORD *)v4 + 66)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 0x20000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v14 & 0x1000) != 0)
  {
    if ((v15 & 0x1000) == 0 || self->_feedType != *((_DWORD *)v4 + 34)) {
      goto LABEL_262;
    }
  }
  else if ((v15 & 0x1000) != 0)
  {
    goto LABEL_262;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_262;
    }
    $16045DCADA8B3DB0231ED545073A6F77 v14 = self->_has;
  }
  uint64_t v17 = *((void *)v4 + 54);
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
    if ((v17 & 0x800) == 0 || self->_feedCellSection != *((_DWORD *)v4 + 31)) {
      goto LABEL_262;
    }
  }
  else if ((v17 & 0x800) != 0)
  {
    goto LABEL_262;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_262;
    }
    $16045DCADA8B3DB0231ED545073A6F77 v14 = self->_has;
  }
  uint64_t v19 = *((void *)v4 + 54);
  if ((*(void *)&v14 & 0x200000000) != 0)
  {
    if ((v19 & 0x200000000) == 0) {
      goto LABEL_262;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 429)) {
        goto LABEL_262;
      }
    }
    else if (*((unsigned char *)v4 + 429))
    {
      goto LABEL_262;
    }
  }
  else if ((v19 & 0x200000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_articleType != *((_DWORD *)v4 + 26)) {
      goto LABEL_262;
    }
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_262;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_262;
    }
    $16045DCADA8B3DB0231ED545073A6F77 v14 = self->_has;
  }
  uint64_t v21 = *((void *)v4 + 54);
  if ((*(_DWORD *)&v14 & 0x800000) != 0)
  {
    if ((v21 & 0x800000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 84)) {
      goto LABEL_262;
    }
  }
  else if ((v21 & 0x800000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v21 & 0x400) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 30)) {
      goto LABEL_262;
    }
  }
  else if ((v21 & 0x400) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v14 & 0x10000000) != 0)
  {
    if ((v21 & 0x10000000) == 0) {
      goto LABEL_262;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 424)) {
        goto LABEL_262;
      }
    }
    else if (*((unsigned char *)v4 + 424))
    {
      goto LABEL_262;
    }
  }
  else if ((v21 & 0x10000000) != 0)
  {
    goto LABEL_262;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 46)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_262;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 48))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  $16045DCADA8B3DB0231ED545073A6F77 v26 = self->_has;
  uint64_t v27 = *((void *)v4 + 54);
  if ((*(_DWORD *)&v26 & 0x40000000) != 0)
  {
    if ((v27 & 0x40000000) == 0) {
      goto LABEL_262;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 426)) {
        goto LABEL_262;
      }
    }
    else if (*((unsigned char *)v4 + 426))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x40000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x4000000) != 0)
  {
    if ((v27 & 0x4000000) == 0 || self->_userAction != *((_DWORD *)v4 + 102)) {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x4000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(void *)&v26 & 0x400000000) != 0)
  {
    if ((v27 & 0x400000000) == 0) {
      goto LABEL_262;
    }
    if (self->_isVideoInFeed)
    {
      if (!*((unsigned char *)v4 + 430)) {
        goto LABEL_262;
      }
    }
    else if (*((unsigned char *)v4 + 430))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x400000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(unsigned char *)&v26 & 0x40) != 0)
  {
    if ((v27 & 0x40) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 7)) {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x40) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v26 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0 || self->_mediaPauseLocation != *((_DWORD *)v4 + 64)) {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(unsigned char *)&v26 & 2) != 0)
  {
    if ((v27 & 2) == 0 || self->_mediaDuration != *((void *)v4 + 2)) {
      goto LABEL_262;
    }
  }
  else if ((v27 & 2) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x20000000) != 0)
  {
    if ((v27 & 0x20000000) == 0) {
      goto LABEL_262;
    }
    if (self->_isBreakingNewsArticle)
    {
      if (!*((unsigned char *)v4 + 425)) {
        goto LABEL_262;
      }
    }
    else if (*((unsigned char *)v4 + 425))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x20000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v26 & 0x4000) != 0)
  {
    if ((v27 & 0x4000) == 0 || self->_loadFailureReason != *((_DWORD *)v4 + 60)) {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x4000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x2000000) != 0)
  {
    if ((v27 & 0x2000000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 98)) {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x2000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(void *)&v26 & 0x100000000) != 0)
  {
    if ((v27 & 0x100000000) == 0) {
      goto LABEL_262;
    }
    if (self->_isTopStoryArticle)
    {
      if (!*((unsigned char *)v4 + 428)) {
        goto LABEL_262;
      }
    }
    else if (*((unsigned char *)v4 + 428))
    {
      goto LABEL_262;
    }
  }
  else if ((v27 & 0x100000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v26 & 0x80000000) != 0)
  {
    if ((v27 & 0x80000000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((unsigned char *)v4 + 427)) {
          goto LABEL_262;
        }
        goto LABEL_188;
      }
      if (!*((unsigned char *)v4 + 427)) {
        goto LABEL_188;
      }
    }
LABEL_262:
    char v50 = 0;
    goto LABEL_263;
  }
  if ((v27 & 0x80000000) != 0) {
    goto LABEL_262;
  }
LABEL_188:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((void *)v4 + 38)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_262;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](metadata, "isEqual:")) {
      goto LABEL_262;
    }
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 41))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_262;
    }
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 52))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
      goto LABEL_262;
    }
  }
  uint64_t v33 = *((void *)v4 + 54);
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    if ((v33 & 0x2000) == 0 || self->_groupType != *((_DWORD *)v4 + 42)) {
      goto LABEL_262;
    }
  }
  else if ((v33 & 0x2000) != 0)
  {
    goto LABEL_262;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 20)
    && !-[NSString isEqual:](groupFeedId, "isEqual:"))
  {
    goto LABEL_262;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 19))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_262;
    }
  }
  $16045DCADA8B3DB0231ED545073A6F77 v36 = self->_has;
  uint64_t v37 = *((void *)v4 + 54);
  if ((*(_DWORD *)&v36 & 0x8000000) != 0)
  {
    if ((v37 & 0x8000000) == 0 || self->_videoType != *((_DWORD *)v4 + 103)) {
      goto LABEL_262;
    }
  }
  else if ((v37 & 0x8000000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_WORD *)&v36 & 0x100) != 0)
  {
    if ((v37 & 0x100) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 9)) {
      goto LABEL_262;
    }
  }
  else if ((v37 & 0x100) != 0)
  {
    goto LABEL_262;
  }
  if (*(unsigned char *)&v36)
  {
    if ((v37 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_262;
    }
  }
  else if (v37)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v36 & 0x200000) != 0)
  {
    if ((v37 & 0x200000) == 0 || self->_muteButtonState != *((_DWORD *)v4 + 72)) {
      goto LABEL_262;
    }
  }
  else if ((v37 & 0x200000) != 0)
  {
    goto LABEL_262;
  }
  if ((*(_DWORD *)&v36 & 0x400000) != 0)
  {
    if ((v37 & 0x400000) == 0 || self->_osVolumeLevel != *((float *)v4 + 78)) {
      goto LABEL_262;
    }
  }
  else if ((v37 & 0x400000) != 0)
  {
    goto LABEL_262;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 24)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_262;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_262;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_262;
    }
  }
  uint64_t v41 = *((void *)v4 + 54);
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v41 & 0x80) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 8)) {
      goto LABEL_262;
    }
  }
  else if ((v41 & 0x80) != 0)
  {
    goto LABEL_262;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 25)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_262;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 22))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_262;
    }
  }
  alternateHeadline = self->_alternateHeadline;
  if ((unint64_t)alternateHeadline | *((void *)v4 + 10))
  {
    if (!-[NTPBAlternateHeadline isEqual:](alternateHeadline, "isEqual:")) {
      goto LABEL_262;
    }
  }
  uint64_t v45 = *((void *)v4 + 54);
  if (*((unsigned char *)&self->_has + 3))
  {
    if ((v45 & 0x1000000) == 0 || self->_rankInVideoPlaylist != *((_DWORD *)v4 + 85)) {
      goto LABEL_262;
    }
  }
  else if ((v45 & 0x1000000) != 0)
  {
    goto LABEL_262;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 27) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_262;
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 28))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_262;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 29))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_262;
    }
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 50)) {
    char v50 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  }
  else {
    char v50 = 1;
  }
LABEL_263:

  return v50;
}

- (unint64_t)hash
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    uint64_t v76 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v76 = 0;
  }
  NSUInteger v75 = [(NSString *)self->_mediaId hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v74 = 2654435761 * self->_mediaTimePlayed;
  }
  else {
    uint64_t v74 = 0;
  }
  NSUInteger v73 = [(NSString *)self->_articleId hash];
  NSUInteger v72 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v71 = [(NSData *)self->_articleSessionId hash];
  uint64_t v70 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v69 = [(NSString *)self->_sourceChannelId hash];
  $16045DCADA8B3DB0231ED545073A6F77 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    uint64_t v68 = 2654435761 * self->_mediaPlayMethod;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_9:
      uint64_t v67 = 2654435761 * self->_mediaPauseMethod;
      if ((*(unsigned char *)&has & 4) != 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v68 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_9;
    }
  }
  uint64_t v67 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_10:
    uint64_t v66 = 2654435761 * self->_mediaPausePosition;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v66 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v65 = 2654435761 * self->_mediaResumeTimePlayed;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v65 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_12:
    uint64_t v64 = 2654435761 * self->_mediaResumeMethod;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v64 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_13:
    uint64_t v63 = 2654435761 * self->_mediaResumePosition;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_14;
    }
LABEL_22:
    uint64_t v62 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v63 = 0;
  if ((*(_DWORD *)&has & 0x20000) == 0) {
    goto LABEL_22;
  }
LABEL_14:
  uint64_t v62 = 2654435761 * self->_mediaPlayLocation;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_15:
    uint64_t v61 = 2654435761 * self->_feedType;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v61 = 0;
LABEL_24:
  NSUInteger v60 = [(NSString *)self->_feedId hash];
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    uint64_t v59 = 2654435761 * self->_feedCellSection;
  }
  else {
    uint64_t v59 = 0;
  }
  uint64_t v58 = [(NSData *)self->_feedViewExposureId hash];
  $16045DCADA8B3DB0231ED545073A6F77 v4 = self->_has;
  if ((*(void *)&v4 & 0x200000000) != 0)
  {
    uint64_t v57 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v57 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0)
    {
LABEL_29:
      uint64_t v56 = 2654435761 * self->_articleType;
      goto LABEL_32;
    }
  }
  uint64_t v56 = 0;
LABEL_32:
  uint64_t v55 = [(NSMutableArray *)self->_namedEntities hash];
  $16045DCADA8B3DB0231ED545073A6F77 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
    uint64_t v54 = 0;
    if ((*(_WORD *)&v5 & 0x400) != 0) {
      goto LABEL_34;
    }
LABEL_37:
    uint64_t v53 = 0;
    if ((*(_DWORD *)&v5 & 0x10000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_38;
  }
  uint64_t v54 = 2654435761 * self->_publisherArticleVersion;
  if ((*(_WORD *)&v5 & 0x400) == 0) {
    goto LABEL_37;
  }
LABEL_34:
  uint64_t v53 = 2654435761 * self->_backendArticleVersion;
  if ((*(_DWORD *)&v5 & 0x10000000) != 0)
  {
LABEL_35:
    uint64_t v52 = 2654435761 * self->_adSupportedChannel;
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v52 = 0;
LABEL_39:
  NSUInteger v51 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v50 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v49 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v48 = [(NSString *)self->_sectionHeadlineId hash];
  $16045DCADA8B3DB0231ED545073A6F77 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) != 0)
  {
    uint64_t v47 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_DWORD *)&v6 & 0x4000000) != 0)
    {
LABEL_41:
      uint64_t v46 = 2654435761 * self->_userAction;
      if ((*(void *)&v6 & 0x400000000) != 0) {
        goto LABEL_42;
      }
      goto LABEL_53;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v6 & 0x4000000) != 0) {
      goto LABEL_41;
    }
  }
  uint64_t v46 = 0;
  if ((*(void *)&v6 & 0x400000000) != 0)
  {
LABEL_42:
    uint64_t v45 = 2654435761 * self->_isVideoInFeed;
    if ((*(unsigned char *)&v6 & 0x40) != 0) {
      goto LABEL_43;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v45 = 0;
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
LABEL_43:
    uint64_t v44 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(_WORD *)&v6 & 0x8000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v44 = 0;
  if ((*(_WORD *)&v6 & 0x8000) != 0)
  {
LABEL_44:
    uint64_t v43 = 2654435761 * self->_mediaPauseLocation;
    if ((*(unsigned char *)&v6 & 2) != 0) {
      goto LABEL_45;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v43 = 0;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
LABEL_45:
    uint64_t v42 = 2654435761 * self->_mediaDuration;
    if ((*(_DWORD *)&v6 & 0x20000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v42 = 0;
  if ((*(_DWORD *)&v6 & 0x20000000) != 0)
  {
LABEL_46:
    uint64_t v41 = 2654435761 * self->_isBreakingNewsArticle;
    if ((*(_WORD *)&v6 & 0x4000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v41 = 0;
  if ((*(_WORD *)&v6 & 0x4000) != 0)
  {
LABEL_47:
    uint64_t v40 = 2654435761 * self->_loadFailureReason;
    if ((*(_DWORD *)&v6 & 0x2000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&v6 & 0x2000000) != 0)
  {
LABEL_48:
    uint64_t v39 = 2654435761 * self->_topStoryType;
    if ((*(void *)&v6 & 0x100000000) != 0) {
      goto LABEL_49;
    }
LABEL_60:
    uint64_t v38 = 0;
    if ((*(_DWORD *)&v6 & 0x80000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_61;
  }
LABEL_59:
  uint64_t v39 = 0;
  if ((*(void *)&v6 & 0x100000000) == 0) {
    goto LABEL_60;
  }
LABEL_49:
  uint64_t v38 = 2654435761 * self->_isTopStoryArticle;
  if ((*(_DWORD *)&v6 & 0x80000000) != 0)
  {
LABEL_50:
    uint64_t v37 = 2654435761 * self->_isNativeAd;
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v37 = 0;
LABEL_62:
  NSUInteger v36 = [(NSString *)self->_nativeCampaignData hash];
  NSUInteger v35 = [(NSString *)self->_metadata hash];
  NSUInteger v34 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v33 = [(NSString *)self->_previousArticleVersion hash];
  unint64_t v32 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v31 = 2654435761 * self->_groupType;
  }
  else {
    uint64_t v31 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_groupFeedId hash];
  uint64_t v29 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $16045DCADA8B3DB0231ED545073A6F77 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x8000000) != 0)
  {
    uint64_t v28 = 2654435761 * self->_videoType;
    if ((*(_WORD *)&v7 & 0x100) != 0)
    {
LABEL_67:
      uint64_t v27 = 2654435761 * self->_publisherArticleVersionInt64;
      if (*(unsigned char *)&v7) {
        goto LABEL_68;
      }
      goto LABEL_76;
    }
  }
  else
  {
    uint64_t v28 = 0;
    if ((*(_WORD *)&v7 & 0x100) != 0) {
      goto LABEL_67;
    }
  }
  uint64_t v27 = 0;
  if (*(unsigned char *)&v7)
  {
LABEL_68:
    uint64_t v26 = 2654435761 * self->_backendArticleVersionInt64;
    if ((*(_DWORD *)&v7 & 0x200000) != 0) {
      goto LABEL_69;
    }
LABEL_77:
    uint64_t v25 = 0;
    if ((*(_DWORD *)&v7 & 0x400000) != 0) {
      goto LABEL_70;
    }
LABEL_78:
    unint64_t v12 = 0;
    goto LABEL_81;
  }
LABEL_76:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v7 & 0x200000) == 0) {
    goto LABEL_77;
  }
LABEL_69:
  uint64_t v25 = 2654435761 * self->_muteButtonState;
  if ((*(_DWORD *)&v7 & 0x400000) == 0) {
    goto LABEL_78;
  }
LABEL_70:
  float osVolumeLevel = self->_osVolumeLevel;
  float v9 = -osVolumeLevel;
  if (osVolumeLevel >= 0.0) {
    float v9 = self->_osVolumeLevel;
  }
  float v10 = floorf(v9 + 0.5);
  float v11 = (float)(v9 - v10) * 1.8447e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmodf(v10, 1.8447e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabsf(v11);
  }
LABEL_81:
  NSUInteger v13 = [(NSString *)self->_iadNativeCampaign hash];
  NSUInteger v14 = [(NSString *)self->_iadNativeLine hash];
  NSUInteger v15 = [(NSString *)self->_iadNativeAd hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v16 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_iadNativeCampaignAd hash];
  uint64_t v18 = [(NSData *)self->_groupViewExposureId hash];
  unint64_t v19 = [(NTPBAlternateHeadline *)self->_alternateHeadline hash];
  if (*((unsigned char *)&self->_has + 3)) {
    uint64_t v20 = 2654435761 * self->_rankInVideoPlaylist;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NTPBIssueData *)self->_issueData hash];
  unint64_t v22 = v21 ^ [(NTPBIssueExposureData *)self->_issueExposureData hash];
  unint64_t v23 = v22 ^ [(NTPBIssueViewData *)self->_issueViewData hash];
  return v75 ^ v76 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v12 ^ v13 ^ v14 ^ v15 ^ v23 ^ [(NSMutableArray *)self->_topicIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  $16045DCADA8B3DB0231ED545073A6F77 v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 434) & 0x10) != 0)
  {
    self->_uint64_t mediaType = v4[69];
    *(void *)&self->_has |= 0x100000uLL;
  }
  if (*((void *)v4 + 31)) {
    -[NTPBMediaEngage setMediaId:](self, "setMediaId:");
  }
  if ((*((unsigned char *)v5 + 432) & 0x20) != 0)
  {
    self->_mediaTimePlayed = *((void *)v5 + 6);
    *(void *)&self->_has |= 0x20uLL;
  }
  if (*((void *)v5 + 11)) {
    -[NTPBMediaEngage setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 43)) {
    -[NTPBMediaEngage setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v5 + 12)) {
    -[NTPBMediaEngage setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v5 + 14)) {
    -[NTPBMediaEngage setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((void *)v5 + 45)) {
    -[NTPBMediaEngage setSourceChannelId:](self, "setSourceChannelId:");
  }
  uint64_t v6 = *((void *)v5 + 54);
  if ((v6 & 0x40000) != 0)
  {
    self->_mediaPlayMethod = *((_DWORD *)v5 + 67);
    *(void *)&self->_has |= 0x40000uLL;
    uint64_t v6 = *((void *)v5 + 54);
    if ((v6 & 0x10000) == 0)
    {
LABEL_19:
      if ((v6 & 4) == 0) {
        goto LABEL_20;
      }
      goto LABEL_80;
    }
  }
  else if ((v6 & 0x10000) == 0)
  {
    goto LABEL_19;
  }
  self->_mediaPauseMethod = *((_DWORD *)v5 + 65);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v6 = *((void *)v5 + 54);
  if ((v6 & 4) == 0)
  {
LABEL_20:
    if ((v6 & 0x10) == 0) {
      goto LABEL_21;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_mediaPausePosition = *((void *)v5 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v6 = *((void *)v5 + 54);
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_mediaResumeTimePlayed = *((void *)v5 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *((void *)v5 + 54);
  if ((v6 & 0x80000) == 0)
  {
LABEL_22:
    if ((v6 & 8) == 0) {
      goto LABEL_23;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_mediaResumeMethod = *((_DWORD *)v5 + 68);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v6 = *((void *)v5 + 54);
  if ((v6 & 8) == 0)
  {
LABEL_23:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_mediaResumePosition = *((void *)v5 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v6 = *((void *)v5 + 54);
  if ((v6 & 0x20000) == 0)
  {
LABEL_24:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_84:
  self->_mediaPlayLocation = *((_DWORD *)v5 + 66);
  *(void *)&self->_has |= 0x20000uLL;
  if ((*((void *)v5 + 54) & 0x1000) != 0)
  {
LABEL_25:
    self->_uint64_t feedType = *((_DWORD *)v5 + 34);
    *(void *)&self->_has |= 0x1000uLL;
  }
LABEL_26:
  if (*((void *)v5 + 16)) {
    -[NTPBMediaEngage setFeedId:](self, "setFeedId:");
  }
  if ((*((unsigned char *)v5 + 433) & 8) != 0)
  {
    self->_uint64_t feedCellSection = *((_DWORD *)v5 + 31);
    *(void *)&self->_has |= 0x800uLL;
  }
  if (*((void *)v5 + 18)) {
    -[NTPBMediaEngage setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  uint64_t v7 = *((void *)v5 + 54);
  if ((v7 & 0x200000000) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v5 + 429);
    *(void *)&self->_has |= 0x200000000uLL;
    uint64_t v7 = *((void *)v5 + 54);
  }
  if ((v7 & 0x200) != 0)
  {
    self->_uint64_t articleType = *((_DWORD *)v5 + 26);
    *(void *)&self->_has |= 0x200uLL;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v8 = *((id *)v5 + 37);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBMediaEngage *)self addNamedEntities:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v10);
  }

  uint64_t v13 = *((void *)v5 + 54);
  if ((v13 & 0x800000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 84);
    *(void *)&self->_has |= 0x800000uLL;
    uint64_t v13 = *((void *)v5 + 54);
    if ((v13 & 0x400) == 0)
    {
LABEL_45:
      if ((v13 & 0x10000000) == 0) {
        goto LABEL_47;
      }
      goto LABEL_46;
    }
  }
  else if ((v13 & 0x400) == 0)
  {
    goto LABEL_45;
  }
  self->_backendArticleVersion = *((_DWORD *)v5 + 30);
  *(void *)&self->_has |= 0x400uLL;
  if ((*((void *)v5 + 54) & 0x10000000) != 0)
  {
LABEL_46:
    self->_adSupportedChannel = *((unsigned char *)v5 + 424);
    *(void *)&self->_has |= 0x10000000uLL;
  }
LABEL_47:
  if (*((void *)v5 + 46)) {
    -[NTPBMediaEngage setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v5 + 47)) {
    -[NTPBMediaEngage setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v5 + 48)) {
    -[NTPBMediaEngage setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 44)) {
    -[NTPBMediaEngage setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x40000000) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v5 + 426);
    *(void *)&self->_has |= 0x40000000uLL;
    uint64_t v14 = *((void *)v5 + 54);
    if ((v14 & 0x4000000) == 0)
    {
LABEL_57:
      if ((v14 & 0x400000000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_91;
    }
  }
  else if ((v14 & 0x4000000) == 0)
  {
    goto LABEL_57;
  }
  self->_userAction = *((_DWORD *)v5 + 102);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x400000000) == 0)
  {
LABEL_58:
    if ((v14 & 0x40) == 0) {
      goto LABEL_59;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_isVideoInFeed = *((unsigned char *)v5 + 430);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x40) == 0)
  {
LABEL_59:
    if ((v14 & 0x8000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_personalizationTreatmentId = *((void *)v5 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x8000) == 0)
  {
LABEL_60:
    if ((v14 & 2) == 0) {
      goto LABEL_61;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_mediaPauseLocation = *((_DWORD *)v5 + 64);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 2) == 0)
  {
LABEL_61:
    if ((v14 & 0x20000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_mediaDuration = *((void *)v5 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x20000000) == 0)
  {
LABEL_62:
    if ((v14 & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_isBreakingNewsArticle = *((unsigned char *)v5 + 425);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x4000) == 0)
  {
LABEL_63:
    if ((v14 & 0x2000000) == 0) {
      goto LABEL_64;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_loadFailureReason = *((_DWORD *)v5 + 60);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x2000000) == 0)
  {
LABEL_64:
    if ((v14 & 0x100000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_uint64_t topStoryType = *((_DWORD *)v5 + 98);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v14 = *((void *)v5 + 54);
  if ((v14 & 0x100000000) == 0)
  {
LABEL_65:
    if ((v14 & 0x80000000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_66;
  }
LABEL_98:
  self->_isTopStoryArticle = *((unsigned char *)v5 + 428);
  *(void *)&self->_has |= 0x100000000uLL;
  if ((*((void *)v5 + 54) & 0x80000000) != 0)
  {
LABEL_66:
    self->_isNativeAd = *((unsigned char *)v5 + 427);
    *(void *)&self->_has |= 0x80000000uLL;
  }
LABEL_67:
  if (*((void *)v5 + 38)) {
    -[NTPBMediaEngage setNativeCampaignData:](self, "setNativeCampaignData:");
  }
  if (*((void *)v5 + 35)) {
    -[NTPBMediaEngage setMetadata:](self, "setMetadata:");
  }
  if (*((void *)v5 + 40)) {
    -[NTPBMediaEngage setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 41)) {
    -[NTPBMediaEngage setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v16 = *((void *)v5 + 52);
  if (widgetEngagement)
  {
    if (v16) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[NTPBMediaEngage setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  if ((*((unsigned char *)v5 + 433) & 0x20) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v5 + 42);
    *(void *)&self->_has |= 0x2000uLL;
  }
  if (*((void *)v5 + 20)) {
    -[NTPBMediaEngage setGroupFeedId:](self, "setGroupFeedId:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = *((id *)v5 + 19);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBMediaEngage *)self addFractionalCohortMembership:*(void *)(*((void *)&v40 + 1) + 8 * j)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v19);
  }

  uint64_t v22 = *((void *)v5 + 54);
  if ((v22 & 0x8000000) != 0)
  {
    self->_uint64_t videoType = *((_DWORD *)v5 + 103);
    *(void *)&self->_has |= 0x8000000uLL;
    uint64_t v22 = *((void *)v5 + 54);
    if ((v22 & 0x100) == 0)
    {
LABEL_115:
      if ((v22 & 1) == 0) {
        goto LABEL_116;
      }
      goto LABEL_136;
    }
  }
  else if ((v22 & 0x100) == 0)
  {
    goto LABEL_115;
  }
  self->_publisherArticleVersionInt64 = *((void *)v5 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v22 = *((void *)v5 + 54);
  if ((v22 & 1) == 0)
  {
LABEL_116:
    if ((v22 & 0x200000) == 0) {
      goto LABEL_117;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_backendArticleVersionInt64 = *((void *)v5 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v22 = *((void *)v5 + 54);
  if ((v22 & 0x200000) == 0)
  {
LABEL_117:
    if ((v22 & 0x400000) == 0) {
      goto LABEL_119;
    }
    goto LABEL_118;
  }
LABEL_137:
  self->_muteButtonState = *((_DWORD *)v5 + 72);
  *(void *)&self->_has |= 0x200000uLL;
  if ((*((void *)v5 + 54) & 0x400000) != 0)
  {
LABEL_118:
    self->_float osVolumeLevel = *((float *)v5 + 78);
    *(void *)&self->_has |= 0x400000uLL;
  }
LABEL_119:
  if (*((void *)v5 + 24)) {
    -[NTPBMediaEngage setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v5 + 26)) {
    -[NTPBMediaEngage setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v5 + 23)) {
    -[NTPBMediaEngage setIadNativeAd:](self, "setIadNativeAd:");
  }
  if ((*((unsigned char *)v5 + 432) & 0x80) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 8);
    *(void *)&self->_has |= 0x80uLL;
  }
  if (*((void *)v5 + 25)) {
    -[NTPBMediaEngage setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  if (*((void *)v5 + 22)) {
    -[NTPBMediaEngage setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  alternateHeadline = self->_alternateHeadline;
  uint64_t v24 = *((void *)v5 + 10);
  if (alternateHeadline)
  {
    if (v24) {
      -[NTPBAlternateHeadline mergeFrom:](alternateHeadline, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBMediaEngage setAlternateHeadline:](self, "setAlternateHeadline:");
  }
  if (*((unsigned char *)v5 + 435))
  {
    self->_rankInVideoPlaylist = *((_DWORD *)v5 + 85);
    *(void *)&self->_has |= 0x1000000uLL;
  }
  issueData = self->_issueData;
  uint64_t v26 = *((void *)v5 + 27);
  if (issueData)
  {
    if (v26) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBMediaEngage setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v28 = *((void *)v5 + 28);
  if (issueExposureData)
  {
    if (v28) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[NTPBMediaEngage setIssueExposureData:](self, "setIssueExposureData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v30 = *((void *)v5 + 29);
  if (issueViewData)
  {
    if (v30) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[NTPBMediaEngage setIssueViewData:](self, "setIssueViewData:");
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v31 = *((id *)v5 + 50);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v37 != v34) {
          objc_enumerationMutation(v31);
        }
        -[NTPBMediaEngage addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v36 + 1) + 8 * k), (void)v36);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v33);
  }
}

- (NSString)mediaId
{
  return self->_mediaId;
}

- (void)setMediaId:(id)a3
{
}

- (int64_t)mediaTimePlayed
{
  return self->_mediaTimePlayed;
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

- (int64_t)mediaPausePosition
{
  return self->_mediaPausePosition;
}

- (int64_t)mediaResumeTimePlayed
{
  return self->_mediaResumeTimePlayed;
}

- (int64_t)mediaResumePosition
{
  return self->_mediaResumePosition;
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

- (int64_t)mediaDuration
{
  return self->_mediaDuration;
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (BOOL)isTopStoryArticle
{
  return self->_isTopStoryArticle;
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

- (float)osVolumeLevel
{
  return self->_osVolumeLevel;
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