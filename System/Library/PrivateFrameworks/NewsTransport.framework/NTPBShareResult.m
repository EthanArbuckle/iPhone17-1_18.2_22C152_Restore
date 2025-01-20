@interface NTPBShareResult
+ (Class)fractionalCohortMembershipType;
+ (Class)namedEntitiesType;
+ (Class)topicIdsType;
- (BOOL)fromNextArticleAffordanceTap;
- (BOOL)hasArticleSessionId;
- (BOOL)hasArticleType;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasChannelData;
- (BOOL)hasCharacterCount;
- (BOOL)hasContentId;
- (BOOL)hasContentType;
- (BOOL)hasCreativeId;
- (BOOL)hasExternalWeblinkUrl;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasFromNextArticleAffordanceTap;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIadNativeAd;
- (BOOL)hasIadNativeCampaign;
- (BOOL)hasIadNativeCampaignAd;
- (BOOL)hasIadNativeLine;
- (BOOL)hasIosActivityType;
- (BOOL)hasIsBreakingNewsArticle;
- (BOOL)hasIsCoverArticle;
- (BOOL)hasIsDigitalReplicaAd;
- (BOOL)hasIsFreeArticle;
- (BOOL)hasIsGroupedArticle;
- (BOOL)hasIsNativeAd;
- (BOOL)hasIsNotificationArticle;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIsSearchResult;
- (BOOL)hasIsTopStoryArticle;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasLanguage;
- (BOOL)hasNativeCampaignData;
- (BOOL)hasNextArticleAffordanceType;
- (BOOL)hasNextArticleAffordanceTypeFeedId;
- (BOOL)hasNotificationId;
- (BOOL)hasPersonalizationTreatmentId;
- (BOOL)hasPreviousArticleId;
- (BOOL)hasPreviousArticlePublisherArticleVersion;
- (BOOL)hasPreviousArticleVersion;
- (BOOL)hasPublisherArticleVersion;
- (BOOL)hasPublisherArticleVersionInt64;
- (BOOL)hasReferencedArticleId;
- (BOOL)hasResultType;
- (BOOL)hasSectionHeadlineId;
- (BOOL)hasShareLocation;
- (BOOL)hasShareMethod;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedBySectionId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)hasTopStoryType;
- (BOOL)hasWidgetEngagement;
- (BOOL)isBreakingNewsArticle;
- (BOOL)isCoverArticle;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeArticle;
- (BOOL)isGroupedArticle;
- (BOOL)isNativeAd;
- (BOOL)isNotificationArticle;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)isSearchResult;
- (BOOL)isTopStoryArticle;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)articleSessionId;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSMutableArray)namedEntities;
- (NSMutableArray)topicIds;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)contentId;
- (NSString)creativeId;
- (NSString)externalWeblinkUrl;
- (NSString)feedId;
- (NSString)groupFeedId;
- (NSString)iadNativeAd;
- (NSString)iadNativeCampaign;
- (NSString)iadNativeCampaignAd;
- (NSString)iadNativeLine;
- (NSString)iosActivityType;
- (NSString)language;
- (NSString)nativeCampaignData;
- (NSString)nextArticleAffordanceTypeFeedId;
- (NSString)notificationId;
- (NSString)previousArticleId;
- (NSString)previousArticleVersion;
- (NSString)referencedArticleId;
- (NSString)sectionHeadlineId;
- (NSString)sourceChannelId;
- (NSString)surfacedByChannelId;
- (NSString)surfacedBySectionId;
- (NSString)surfacedByTopicId;
- (NTPBChannelData)channelData;
- (NTPBIssueData)issueData;
- (NTPBIssueExposureData)issueExposureData;
- (NTPBWidgetEngagement)widgetEngagement;
- (id)articleTypeAsString:(int)a3;
- (id)contentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3;
- (id)groupTypeAsString:(int)a3;
- (id)namedEntitiesAtIndex:(unint64_t)a3;
- (id)nextArticleAffordanceTypeAsString:(int)a3;
- (id)topStoryTypeAsString:(int)a3;
- (id)topicIdsAtIndex:(unint64_t)a3;
- (int)StringAsArticleType:(id)a3;
- (int)StringAsContentType:(id)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsNextArticleAffordanceType:(id)a3;
- (int)StringAsTopStoryType:(id)a3;
- (int)articleType;
- (int)backendArticleVersion;
- (int)characterCount;
- (int)contentType;
- (int)feedType;
- (int)groupType;
- (int)nextArticleAffordanceType;
- (int)publisherArticleVersion;
- (int)resultType;
- (int)shareLocation;
- (int)shareMethod;
- (int)topStoryType;
- (int64_t)backendArticleVersionInt64;
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
- (void)setArticleSessionId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setBackendArticleVersion:(int)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelData:(id)a3;
- (void)setCharacterCount:(int)a3;
- (void)setContentId:(id)a3;
- (void)setContentType:(int)a3;
- (void)setCreativeId:(id)a3;
- (void)setExternalWeblinkUrl:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setFromNextArticleAffordanceTap:(BOOL)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasArticleType:(BOOL)a3;
- (void)setHasBackendArticleVersion:(BOOL)a3;
- (void)setHasBackendArticleVersionInt64:(BOOL)a3;
- (void)setHasCharacterCount:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasFromNextArticleAffordanceTap:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsBreakingNewsArticle:(BOOL)a3;
- (void)setHasIsCoverArticle:(BOOL)a3;
- (void)setHasIsDigitalReplicaAd:(BOOL)a3;
- (void)setHasIsFreeArticle:(BOOL)a3;
- (void)setHasIsGroupedArticle:(BOOL)a3;
- (void)setHasIsNativeAd:(BOOL)a3;
- (void)setHasIsNotificationArticle:(BOOL)a3;
- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setHasIsSearchResult:(BOOL)a3;
- (void)setHasIsTopStoryArticle:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasNextArticleAffordanceType:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setHasResultType:(BOOL)a3;
- (void)setHasShareLocation:(BOOL)a3;
- (void)setHasShareMethod:(BOOL)a3;
- (void)setHasTopStoryType:(BOOL)a3;
- (void)setIadNativeAd:(id)a3;
- (void)setIadNativeCampaign:(id)a3;
- (void)setIadNativeCampaignAd:(id)a3;
- (void)setIadNativeLine:(id)a3;
- (void)setIosActivityType:(id)a3;
- (void)setIsBreakingNewsArticle:(BOOL)a3;
- (void)setIsCoverArticle:(BOOL)a3;
- (void)setIsDigitalReplicaAd:(BOOL)a3;
- (void)setIsFreeArticle:(BOOL)a3;
- (void)setIsGroupedArticle:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsNotificationArticle:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIsSearchResult:(BOOL)a3;
- (void)setIsTopStoryArticle:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNamedEntities:(id)a3;
- (void)setNativeCampaignData:(id)a3;
- (void)setNextArticleAffordanceType:(int)a3;
- (void)setNextArticleAffordanceTypeFeedId:(id)a3;
- (void)setNotificationId:(id)a3;
- (void)setPersonalizationTreatmentId:(int64_t)a3;
- (void)setPreviousArticleId:(id)a3;
- (void)setPreviousArticlePublisherArticleVersion:(int64_t)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setPublisherArticleVersion:(int)a3;
- (void)setPublisherArticleVersionInt64:(int64_t)a3;
- (void)setReferencedArticleId:(id)a3;
- (void)setResultType:(int)a3;
- (void)setSectionHeadlineId:(id)a3;
- (void)setShareLocation:(int)a3;
- (void)setShareMethod:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedBySectionId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)setTopStoryType:(int)a3;
- (void)setTopicIds:(id)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBShareResult

- (int)resultType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x10) != 0) {
    return self->_resultType;
  }
  else {
    return 0;
  }
}

- (void)setResultType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_resultType = a3;
}

- (void)setHasResultType:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasResultType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)contentType
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

- (void)setContentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasContentType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444BB20[a3];
  }

  return v3;
}

- (int)StringAsContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CONTENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ARTICLE_CONTENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FEED_CONTENT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"PDF_CONTENT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ISSUE_CONTENT_TYPE"])
  {
    int v4 = 4;
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

- (BOOL)hasArticleSessionId
{
  return self->_articleSessionId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (int)feedType
{
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasFeedType
{
  return *((unsigned char *)&self->_has + 1) & 1;
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
    int v3 = off_26444BB48[a3];
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

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (int)shareMethod
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_shareMethod;
  }
  else {
    return 0;
  }
}

- (void)setShareMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_shareMethod = a3;
}

- (void)setHasShareMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasShareMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (int)shareLocation
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_shareLocation;
  }
  else {
    return 0;
  }
}

- (void)setShareLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_shareLocation = a3;
}

- (void)setHasShareLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasShareLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCharacterCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCharacterCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
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
  *(_DWORD *)&self->_has |= 0x800u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
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
    int v3 = off_26444BBF8[a3];
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

- (BOOL)hasIosActivityType
{
  return self->_iosActivityType != 0;
}

- (void)setIsDigitalReplicaAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isDigitalReplicaAd = a3;
}

- (void)setHasIsDigitalReplicaAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasExternalWeblinkUrl
{
  return self->_externalWeblinkUrl != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsGroupedArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isGroupedArticle = a3;
}

- (void)setHasIsGroupedArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsGroupedArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (int)groupType
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasGroupType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
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
    int v3 = off_26444BC28[a3];
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

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIsFreeArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isFreeArticle = a3;
}

- (void)setHasIsFreeArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsFreeArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setIsNotificationArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isNotificationArticle = a3;
}

- (void)setHasIsNotificationArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsNotificationArticle
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
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

- (void)setIsCoverArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_isCoverArticle = a3;
}

- (void)setHasIsCoverArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsCoverArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setFromNextArticleAffordanceTap:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_fromNextArticleAffordanceTap = a3;
}

- (void)setHasFromNextArticleAffordanceTap:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasFromNextArticleAffordanceTap
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)nextArticleAffordanceType
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_nextArticleAffordanceType;
  }
  else {
    return 0;
  }
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasNextArticleAffordanceType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)nextArticleAffordanceTypeAsString:(int)a3
{
  if (a3 >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444BD68[a3];
  }

  return v3;
}

- (int)StringAsNextArticleAffordanceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TRENDING_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DISCOVER_MORE_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"NEWS_SPOTLIGHT_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"MORE_FROM_PUB_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NEWS_EDITORS_PICKS_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TOPIC_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"DAILY_BRIEFINGS_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"GREAT_STORIES_YOU_MISSED_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SAVED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"MORE_FOR_YOU_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"PAID_SUBSCRIPTION_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LATEST_AND_GREATEST_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"FEATURED_STORIES_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LATEST_NEXT_ARTICLE_AFFORDANCE_TYPE"])
  {
    int v4 = 15;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasNextArticleAffordanceTypeFeedId
{
  return self->_nextArticleAffordanceTypeFeedId != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)topStoryType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_topStoryType;
  }
  else {
    return 0;
  }
}

- (void)setTopStoryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasTopStoryType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)topStoryTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444BDE8[a3];
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
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setIsSearchResult:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isSearchResult = a3;
}

- (void)setHasIsSearchResult:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsSearchResult
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasNativeCampaignData
{
  return self->_nativeCampaignData != 0;
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($BCDF409BEB5F2E465DE2B0AEB40C6798)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPreviousArticlePublisherArticleVersion
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasIadNativeCampaignAd
{
  return self->_iadNativeCampaignAd != 0;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueExposureData
{
  return self->_issueExposureData != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
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
  v8.super_class = (Class)NTPBShareResult;
  id v4 = [(NTPBShareResult *)&v8 description];
  v5 = [(NTPBShareResult *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v98 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_resultType];
    [v3 setObject:v5 forKey:@"result_type"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contentType);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_26444BB20[contentType];
    }
    [v3 setObject:v7 forKey:@"content_type"];
  }
  contentId = self->_contentId;
  if (contentId) {
    [v3 setObject:contentId forKey:@"content_id"];
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
  if (*((unsigned char *)&self->_has + 1))
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_26444BB48[feedType];
    }
    [v3 setObject:v13 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x8000000) != 0)
  {
    v26 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v26 forKey:@"is_user_subscribed_to_feed"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x4000) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v16 & 0x2000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
    goto LABEL_27;
  }
  v27 = [NSNumber numberWithInt:self->_shareMethod];
  [v3 setObject:v27 forKey:@"share_method"];

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v16 & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_45:
  v28 = [NSNumber numberWithInt:self->_shareLocation];
  [v3 setObject:v28 forKey:@"share_location"];

  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_29:
    v17 = [NSNumber numberWithInt:self->_characterCount];
    [v3 setObject:v17 forKey:@"character_count"];
  }
LABEL_30:
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v3 setObject:namedEntities forKey:@"named_entities"];
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x800) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v3 setObject:v21 forKey:@"publisher_article_version"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v20 = self->_has;
  }
  if ((*(unsigned char *)&v20 & 0x20) != 0)
  {
    v22 = [NSNumber numberWithInt:self->_backendArticleVersion];
    [v3 setObject:v22 forKey:@"backend_article_version"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t articleType = self->_articleType;
    if (articleType >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_26444BBF8[articleType];
    }
    [v3 setObject:v25 forKey:@"article_type"];
  }
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
  iosActivityType = self->_iosActivityType;
  if (iosActivityType) {
    [v3 setObject:iosActivityType forKey:@"ios_activity_type"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0)
  {
    v34 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v3 setObject:v34 forKey:@"is_digital_replica_ad"];
  }
  externalWeblinkUrl = self->_externalWeblinkUrl;
  if (externalWeblinkUrl) {
    [v3 setObject:externalWeblinkUrl forKey:@"external_weblink_url"];
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v36 = self->_has;
  if ((*(unsigned char *)&v36 & 2) != 0)
  {
    v37 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
    [v3 setObject:v37 forKey:@"personalization_treatment_id"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v36 = self->_has;
  }
  if ((*(_DWORD *)&v36 & 0x200000) != 0)
  {
    v38 = [NSNumber numberWithBool:self->_isGroupedArticle];
    [v3 setObject:v38 forKey:@"is_grouped_article"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v40 = self->_has;
  if ((*(_WORD *)&v40 & 0x200) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v48 = off_26444BC28[groupType];
    }
    [v3 setObject:v48 forKey:@"group_type"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v40 = self->_has;
    if ((*(_DWORD *)&v40 & 0x1000000) == 0)
    {
LABEL_71:
      if ((*(_DWORD *)&v40 & 0x100000) == 0) {
        goto LABEL_72;
      }
      goto LABEL_95;
    }
  }
  else if ((*(_DWORD *)&v40 & 0x1000000) == 0)
  {
    goto LABEL_71;
  }
  v53 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
  [v3 setObject:v53 forKey:@"is_paid_subscriber_to_source_channel"];

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x100000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v40 & 0x800000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_95:
  v54 = [NSNumber numberWithBool:self->_isFreeArticle];
  [v3 setObject:v54 forKey:@"is_free_article"];

  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_73:
    v41 = [NSNumber numberWithBool:self->_isNotificationArticle];
    [v3 setObject:v41 forKey:@"is_notification_article"];
  }
LABEL_74:
  notificationId = self->_notificationId;
  if (notificationId) {
    [v3 setObject:notificationId forKey:@"notification_id"];
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
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v46 = self->_has;
  if ((*(_DWORD *)&v46 & 0x40000) != 0)
  {
    v49 = [NSNumber numberWithBool:self->_isCoverArticle];
    [v3 setObject:v49 forKey:@"is_cover_article"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v46 = self->_has;
    if ((*(_DWORD *)&v46 & 0x10000) == 0)
    {
LABEL_84:
      if ((*(_WORD *)&v46 & 0x400) == 0) {
        goto LABEL_99;
      }
      goto LABEL_90;
    }
  }
  else if ((*(_DWORD *)&v46 & 0x10000) == 0)
  {
    goto LABEL_84;
  }
  v50 = [NSNumber numberWithBool:self->_fromNextArticleAffordanceTap];
  [v3 setObject:v50 forKey:@"from_next_article_affordance_tap"];

  if ((*(_DWORD *)&self->_has & 0x400) == 0) {
    goto LABEL_99;
  }
LABEL_90:
  uint64_t nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nextArticleAffordanceType);
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = off_26444BD68[nextArticleAffordanceType];
  }
  [v3 setObject:v52 forKey:@"next_article_affordance_type"];

LABEL_99:
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId) {
    [v3 setObject:nextArticleAffordanceTypeFeedId forKey:@"next_article_affordance_type_feed_id"];
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x20000) != 0)
  {
    v88 = [NSNumber numberWithBool:self->_isBreakingNewsArticle];
    [v3 setObject:v88 forKey:@"is_breaking_news_article"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v56 = self->_has;
    if ((*(_WORD *)&v56 & 0x8000) == 0)
    {
LABEL_103:
      if ((*(_DWORD *)&v56 & 0x4000000) == 0) {
        goto LABEL_104;
      }
      goto LABEL_154;
    }
  }
  else if ((*(_WORD *)&v56 & 0x8000) == 0)
  {
    goto LABEL_103;
  }
  uint64_t topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_topStoryType);
    v90 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v90 = off_26444BDE8[topStoryType];
  }
  [v3 setObject:v90 forKey:@"top_story_type"];

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x4000000) == 0)
  {
LABEL_104:
    if ((*(_DWORD *)&v56 & 0x2000000) == 0) {
      goto LABEL_105;
    }
    goto LABEL_155;
  }
LABEL_154:
  v91 = [NSNumber numberWithBool:self->_isTopStoryArticle];
  [v3 setObject:v91 forKey:@"is_top_story_article"];

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x2000000) == 0)
  {
LABEL_105:
    if ((*(_DWORD *)&v56 & 0x400000) == 0) {
      goto LABEL_107;
    }
    goto LABEL_106;
  }
LABEL_155:
  v92 = [NSNumber numberWithBool:self->_isSearchResult];
  [v3 setObject:v92 forKey:@"is_search_result"];

  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_106:
    v57 = [NSNumber numberWithBool:self->_isNativeAd];
    [v3 setObject:v57 forKey:@"is_native_ad"];
  }
LABEL_107:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData) {
    [v3 setObject:nativeCampaignData forKey:@"native_campaign_data"];
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
    v62 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v62 forKey:@"widget_engagement"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v63 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v93 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    v64 = self->_fractionalCohortMemberships;
    uint64_t v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v93 objects:v97 count:16];
    if (v65)
    {
      uint64_t v66 = v65;
      uint64_t v67 = *(void *)v94;
      do
      {
        for (uint64_t i = 0; i != v66; ++i)
        {
          if (*(void *)v94 != v67) {
            objc_enumerationMutation(v64);
          }
          v69 = [*(id *)(*((void *)&v93 + 1) + 8 * i) dictionaryRepresentation];
          [v63 addObject:v69];
        }
        uint64_t v66 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v93 objects:v97 count:16];
      }
      while (v66);
    }

    [v3 setObject:v63 forKey:@"fractional_cohort_membership"];
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v70 = self->_has;
  if ((*(unsigned char *)&v70 & 8) != 0)
  {
    v71 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
    [v3 setObject:v71 forKey:@"publisher_article_version_int64"];

    $BCDF409BEB5F2E465DE2B0AEB40C6798 v70 = self->_has;
  }
  if (*(unsigned char *)&v70)
  {
    v72 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
    [v3 setObject:v72 forKey:@"backend_article_version_int64"];
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
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v76 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v76 forKey:@"previous_article_publisher_article_version"];
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd) {
    [v3 setObject:iadNativeCampaignAd forKey:@"iad_native_campaign_ad"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v3 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v80 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v80 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v82 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v82 forKey:@"issue_exposure_data"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v84 = [(NTPBChannelData *)channelData dictionaryRepresentation];
    [v3 setObject:v84 forKey:@"channel_data"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_ids"];
  }
  id v86 = v3;

  return v86;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBShareResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_contentId) {
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
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x4000) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x2000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_133;
    }
  }
  else if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_133:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x40) != 0) {
LABEL_23:
  }
    PBDataWriterWriteInt32Field();
LABEL_24:
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v7 = self->_namedEntities;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v12 = self->_has;
  }
  if ((*(unsigned char *)&v12 & 0x20) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
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
  if (self->_iosActivityType) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_externalWeblinkUrl) {
    PBDataWriterWriteStringField();
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v13 = self->_has;
  }
  if ((*(_DWORD *)&v13 & 0x200000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
    {
LABEL_63:
      if ((*(_DWORD *)&v14 & 0x100000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_137;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
    goto LABEL_63;
  }
  PBDataWriterWriteBOOLField();
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x100000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v14 & 0x800000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_137:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800000) != 0) {
LABEL_65:
  }
    PBDataWriterWriteBOOLField();
LABEL_66:
  if (self->_notificationId) {
    PBDataWriterWriteStringField();
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
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x10000) == 0)
    {
LABEL_76:
      if ((*(_WORD *)&v15 & 0x400) == 0) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x10000) == 0)
  {
    goto LABEL_76;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_77:
  }
    PBDataWriterWriteInt32Field();
LABEL_78:
  if (self->_nextArticleAffordanceTypeFeedId) {
    PBDataWriterWriteStringField();
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x8000) == 0)
    {
LABEL_82:
      if ((*(_DWORD *)&v16 & 0x4000000) == 0) {
        goto LABEL_83;
      }
      goto LABEL_144;
    }
  }
  else if ((*(_WORD *)&v16 & 0x8000) == 0)
  {
    goto LABEL_82;
  }
  PBDataWriterWriteInt32Field();
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x4000000) == 0)
  {
LABEL_83:
    if ((*(_DWORD *)&v16 & 0x2000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x2000000) == 0)
  {
LABEL_84:
    if ((*(_DWORD *)&v16 & 0x400000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_145:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x400000) != 0) {
LABEL_85:
  }
    PBDataWriterWriteBOOLField();
LABEL_86:
  if (self->_nativeCampaignData) {
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
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v17 = self->_fractionalCohortMemberships;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v33;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        PBDataWriterWriteSubmessage();
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v19);
  }

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v22 = self->_has;
  if ((*(unsigned char *)&v22 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v22 = self->_has;
  }
  if (*(unsigned char *)&v22) {
    PBDataWriterWriteInt64Field();
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_iadNativeCampaignAd) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueExposureData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_channelData) {
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = self->_topicIds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteStringField();
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v25);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  v5 = (_DWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v6 = v5;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    v5[82] = self->_resultType;
    v5[105] |= 0x1000u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    v5[28] = self->_contentType;
    v5[105] |= 0x80u;
  }
  uint64_t v8 = [(NSString *)self->_contentId copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v6 + 13);
  *((void *)v6 + 13) = v8;

  uint64_t v10 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  uint64_t v11 = (void *)*((void *)v6 + 40);
  *((void *)v6 + 40) = v10;

  uint64_t v12 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v13 = (void *)*((void *)v6 + 5);
  *((void *)v6 + 5) = v12;

  uint64_t v14 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v15 = (void *)*((void *)v6 + 7);
  *((void *)v6 + 7) = v14;

  if (*((unsigned char *)&self->_has + 1))
  {
    v6[36] = self->_feedType;
    v6[105] |= 0x100u;
  }
  uint64_t v16 = [(NSString *)self->_feedId copyWithZone:a3];
  v17 = (void *)*((void *)v6 + 17);
  *((void *)v6 + 17) = v16;

  uint64_t v18 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v19 = (void *)*((void *)v6 + 19);
  *((void *)v6 + 19) = v18;

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x8000000) != 0)
  {
    *((unsigned char *)v6 + 419) = self->_isUserSubscribedToFeed;
    v6[105] |= 0x8000000u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x4000) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&v20 & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v20 & 0x4000) == 0)
  {
    goto LABEL_9;
  }
  v6[87] = self->_shareMethod;
  v6[105] |= 0x4000u;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v20 = self->_has;
  if ((*(_WORD *)&v20 & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v20 & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_69:
  v6[86] = self->_shareLocation;
  v6[105] |= 0x2000u;
  if ((*(_DWORD *)&self->_has & 0x40) != 0)
  {
LABEL_11:
    v6[24] = self->_characterCount;
    v6[105] |= 0x40u;
  }
LABEL_12:
  uint64_t v21 = [(NSString *)self->_language copyWithZone:a3];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v22 = (void *)*((void *)v6 + 31);
  *((void *)v6 + 31) = v21;

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  v23 = self->_namedEntities;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v107 objects:v113 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v108;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v108 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = (void *)[*(id *)(*((void *)&v107 + 1) + 8 * v27) copyWithZone:a3];
        [v6 addNamedEntities:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v107 objects:v113 count:16];
    }
    while (v25);
  }

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) != 0)
  {
    v6[78] = self->_publisherArticleVersion;
    v6[105] |= 0x800u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v29 = self->_has;
  }
  if ((*(unsigned char *)&v29 & 0x20) != 0)
  {
    v6[16] = self->_backendArticleVersion;
    v6[105] |= 0x20u;
  }
  uint64_t v30 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  long long v31 = (void *)*((void *)v6 + 44);
  *((void *)v6 + 44) = v30;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v6[12] = self->_articleType;
    v6[105] |= 0x10u;
  }
  uint64_t v32 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  long long v33 = (void *)*((void *)v6 + 45);
  *((void *)v6 + 45) = v32;

  uint64_t v34 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  long long v35 = (void *)*((void *)v6 + 46);
  *((void *)v6 + 46) = v34;

  uint64_t v36 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  long long v37 = (void *)*((void *)v6 + 47);
  *((void *)v6 + 47) = v36;

  uint64_t v38 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  long long v39 = (void *)*((void *)v6 + 42);
  *((void *)v6 + 42) = v38;

  uint64_t v40 = [(NSString *)self->_iosActivityType copyWithZone:a3];
  v41 = (void *)*((void *)v6 + 28);
  *((void *)v6 + 28) = v40;

  if ((*((unsigned char *)&self->_has + 2) & 8) != 0)
  {
    *((unsigned char *)v6 + 411) = self->_isDigitalReplicaAd;
    v6[105] |= 0x80000u;
  }
  uint64_t v42 = [(NSString *)self->_externalWeblinkUrl copyWithZone:a3];
  uint64_t v43 = (void *)*((void *)v6 + 16);
  *((void *)v6 + 16) = v42;

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v44 = self->_has;
  if ((*(unsigned char *)&v44 & 2) != 0)
  {
    *((void *)v6 + 2) = self->_personalizationTreatmentId;
    v6[105] |= 2u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v44 = self->_has;
  }
  if ((*(_DWORD *)&v44 & 0x200000) != 0)
  {
    *((unsigned char *)v6 + 413) = self->_isGroupedArticle;
    v6[105] |= 0x200000u;
  }
  uint64_t v45 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v46 = (void *)*((void *)v6 + 21);
  *((void *)v6 + 21) = v45;

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v47 = self->_has;
  if ((*(_WORD *)&v47 & 0x200) != 0)
  {
    v6[44] = self->_groupType;
    v6[105] |= 0x200u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v47 = self->_has;
    if ((*(_DWORD *)&v47 & 0x1000000) == 0)
    {
LABEL_33:
      if ((*(_DWORD *)&v47 & 0x100000) == 0) {
        goto LABEL_34;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v47 & 0x1000000) == 0)
  {
    goto LABEL_33;
  }
  *((unsigned char *)v6 + 416) = self->_isPaidSubscriberToSourceChannel;
  v6[105] |= 0x1000000u;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v47 = self->_has;
  if ((*(_DWORD *)&v47 & 0x100000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v47 & 0x800000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_73:
  *((unsigned char *)v6 + 412) = self->_isFreeArticle;
  v6[105] |= 0x100000u;
  if ((*(_DWORD *)&self->_has & 0x800000) != 0)
  {
LABEL_35:
    *((unsigned char *)v6 + 415) = self->_isNotificationArticle;
    v6[105] |= 0x800000u;
  }
LABEL_36:
  uint64_t v48 = [(NSString *)self->_notificationId copyWithZone:a3];
  v49 = (void *)*((void *)v6 + 36);
  *((void *)v6 + 36) = v48;

  uint64_t v50 = [(NSString *)self->_campaignId copyWithZone:a3];
  v51 = (void *)*((void *)v6 + 9);
  *((void *)v6 + 9) = v50;

  uint64_t v52 = [(NSString *)self->_campaignType copyWithZone:a3];
  v53 = (void *)*((void *)v6 + 10);
  *((void *)v6 + 10) = v52;

  uint64_t v54 = [(NSString *)self->_creativeId copyWithZone:a3];
  v55 = (void *)*((void *)v6 + 15);
  *((void *)v6 + 15) = v54;

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v56 = self->_has;
  if ((*(_DWORD *)&v56 & 0x40000) != 0)
  {
    *((unsigned char *)v6 + 410) = self->_isCoverArticle;
    v6[105] |= 0x40000u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v56 = self->_has;
    if ((*(_DWORD *)&v56 & 0x10000) == 0)
    {
LABEL_38:
      if ((*(_WORD *)&v56 & 0x400) == 0) {
        goto LABEL_40;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_DWORD *)&v56 & 0x10000) == 0)
  {
    goto LABEL_38;
  }
  *((unsigned char *)v6 + 408) = self->_fromNextArticleAffordanceTap;
  v6[105] |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_39:
    v6[68] = self->_nextArticleAffordanceType;
    v6[105] |= 0x400u;
  }
LABEL_40:
  uint64_t v57 = [(NSString *)self->_nextArticleAffordanceTypeFeedId copyWithZone:a3];
  v58 = (void *)*((void *)v6 + 35);
  *((void *)v6 + 35) = v57;

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x20000) != 0)
  {
    *((unsigned char *)v6 + 409) = self->_isBreakingNewsArticle;
    v6[105] |= 0x20000u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v59 = self->_has;
    if ((*(_WORD *)&v59 & 0x8000) == 0)
    {
LABEL_42:
      if ((*(_DWORD *)&v59 & 0x4000000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_80;
    }
  }
  else if ((*(_WORD *)&v59 & 0x8000) == 0)
  {
    goto LABEL_42;
  }
  v6[96] = self->_topStoryType;
  v6[105] |= 0x8000u;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x4000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v59 & 0x2000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((unsigned char *)v6 + 418) = self->_isTopStoryArticle;
  v6[105] |= 0x4000000u;
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v59 = self->_has;
  if ((*(_DWORD *)&v59 & 0x2000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v59 & 0x400000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_81:
  *((unsigned char *)v6 + 417) = self->_isSearchResult;
  v6[105] |= 0x2000000u;
  if ((*(_DWORD *)&self->_has & 0x400000) != 0)
  {
LABEL_45:
    *((unsigned char *)v6 + 414) = self->_isNativeAd;
    v6[105] |= 0x400000u;
  }
LABEL_46:
  uint64_t v60 = [(NSString *)self->_nativeCampaignData copyWithZone:a3];
  v61 = (void *)*((void *)v6 + 33);
  *((void *)v6 + 33) = v60;

  uint64_t v62 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v63 = (void *)*((void *)v6 + 37);
  *((void *)v6 + 37) = v62;

  uint64_t v64 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  uint64_t v65 = (void *)*((void *)v6 + 38);
  *((void *)v6 + 38) = v64;

  id v66 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  uint64_t v67 = (void *)*((void *)v6 + 50);
  *((void *)v6 + 50) = v66;

  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  v68 = self->_fractionalCohortMemberships;
  uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v103 objects:v112 count:16];
  if (v69)
  {
    uint64_t v70 = v69;
    uint64_t v71 = *(void *)v104;
    do
    {
      uint64_t v72 = 0;
      do
      {
        if (*(void *)v104 != v71) {
          objc_enumerationMutation(v68);
        }
        v73 = (void *)[*(id *)(*((void *)&v103 + 1) + 8 * v72) copyWithZone:a3];
        [v6 addFractionalCohortMembership:v73];

        ++v72;
      }
      while (v70 != v72);
      uint64_t v70 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v103 objects:v112 count:16];
    }
    while (v70);
  }

  $BCDF409BEB5F2E465DE2B0AEB40C6798 v74 = self->_has;
  if ((*(unsigned char *)&v74 & 8) != 0)
  {
    *((void *)v6 + 4) = self->_publisherArticleVersionInt64;
    v6[105] |= 8u;
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v74 = self->_has;
  }
  if (*(unsigned char *)&v74)
  {
    *((void *)v6 + 1) = self->_backendArticleVersionInt64;
    v6[105] |= 1u;
  }
  uint64_t v75 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  v76 = (void *)*((void *)v6 + 25);
  *((void *)v6 + 25) = v75;

  uint64_t v77 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v78 = (void *)*((void *)v6 + 27);
  *((void *)v6 + 27) = v77;

  uint64_t v79 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  v80 = (void *)*((void *)v6 + 24);
  *((void *)v6 + 24) = v79;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v6 + 3) = self->_previousArticlePublisherArticleVersion;
    v6[105] |= 4u;
  }
  uint64_t v81 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  v82 = (void *)*((void *)v6 + 26);
  *((void *)v6 + 26) = v81;

  uint64_t v83 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v84 = (void *)*((void *)v6 + 23);
  *((void *)v6 + 23) = v83;

  id v85 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  id v86 = (void *)*((void *)v6 + 29);
  *((void *)v6 + 29) = v85;

  id v87 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  v88 = (void *)*((void *)v6 + 30);
  *((void *)v6 + 30) = v87;

  id v89 = [(NTPBChannelData *)self->_channelData copyWithZone:a3];
  v90 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = v89;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  v91 = self->_topicIds;
  uint64_t v92 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v99 objects:v111 count:16];
  if (v92)
  {
    uint64_t v93 = v92;
    uint64_t v94 = *(void *)v100;
    do
    {
      uint64_t v95 = 0;
      do
      {
        if (*(void *)v100 != v94) {
          objc_enumerationMutation(v91);
        }
        long long v96 = objc_msgSend(*(id *)(*((void *)&v99 + 1) + 8 * v95), "copyWithZone:", a3, (void)v99);
        [v6 addTopicIds:v96];

        ++v95;
      }
      while (v93 != v95);
      uint64_t v93 = [(NSMutableArray *)v91 countByEnumeratingWithState:&v99 objects:v111 count:16];
    }
    while (v93);
  }

  v97 = v6;
  return v97;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_252;
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  int v6 = *((_DWORD *)v4 + 105);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0 || self->_resultType != *((_DWORD *)v4 + 82)) {
      goto LABEL_252;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_contentType != *((_DWORD *)v4 + 28)) {
      goto LABEL_252;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_252;
  }
  contentId = self->_contentId;
  if ((unint64_t)contentId | *((void *)v4 + 13) && !-[NSString isEqual:](contentId, "isEqual:")) {
    goto LABEL_252;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 40))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  int v11 = *((_DWORD *)v4 + 105);
  if (*((unsigned char *)&self->_has + 1))
  {
    if ((v11 & 0x100) == 0 || self->_feedType != *((_DWORD *)v4 + 36)) {
      goto LABEL_252;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_252;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 17) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_252;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 19))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v14 = self->_has;
  int v15 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v14 & 0x8000000) != 0)
  {
    if ((v15 & 0x8000000) == 0) {
      goto LABEL_252;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 419)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 419))
    {
      goto LABEL_252;
    }
  }
  else if ((v15 & 0x8000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0 || self->_shareMethod != *((_DWORD *)v4 + 87)) {
      goto LABEL_252;
    }
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0 || self->_shareLocation != *((_DWORD *)v4 + 86)) {
      goto LABEL_252;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_characterCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_252;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_252;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 31) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_252;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_252;
    }
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v18 = self->_has;
  int v19 = *((_DWORD *)v4 + 105);
  if ((*(_WORD *)&v18 & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 78)) {
      goto LABEL_252;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_252;
  }
  if ((*(unsigned char *)&v18 & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 16)) {
      goto LABEL_252;
    }
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_252;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 44))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_252;
    }
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v18 = self->_has;
  }
  int v21 = *((_DWORD *)v4 + 105);
  if ((*(unsigned char *)&v18 & 0x10) != 0)
  {
    if ((v21 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 12)) {
      goto LABEL_252;
    }
  }
  else if ((v21 & 0x10) != 0)
  {
    goto LABEL_252;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 45)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_252;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 46))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 47))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  iosActivityType = self->_iosActivityType;
  if ((unint64_t)iosActivityType | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](iosActivityType, "isEqual:")) {
      goto LABEL_252;
    }
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v27 = self->_has;
  int v28 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v27 & 0x80000) != 0)
  {
    if ((v28 & 0x80000) == 0) {
      goto LABEL_252;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 411)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 411))
    {
      goto LABEL_252;
    }
  }
  else if ((v28 & 0x80000) != 0)
  {
    goto LABEL_252;
  }
  externalWeblinkUrl = self->_externalWeblinkUrl;
  if ((unint64_t)externalWeblinkUrl | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](externalWeblinkUrl, "isEqual:")) {
      goto LABEL_252;
    }
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v27 = self->_has;
  }
  int v30 = *((_DWORD *)v4 + 105);
  if ((*(unsigned char *)&v27 & 2) != 0)
  {
    if ((v30 & 2) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 2)) {
      goto LABEL_252;
    }
  }
  else if ((v30 & 2) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x200000) != 0)
  {
    if ((v30 & 0x200000) == 0) {
      goto LABEL_252;
    }
    if (self->_isGroupedArticle)
    {
      if (!*((unsigned char *)v4 + 413)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 413))
    {
      goto LABEL_252;
    }
  }
  else if ((v30 & 0x200000) != 0)
  {
    goto LABEL_252;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_252;
    }
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v27 = self->_has;
  }
  int v32 = *((_DWORD *)v4 + 105);
  if ((*(_WORD *)&v27 & 0x200) != 0)
  {
    if ((v32 & 0x200) == 0 || self->_groupType != *((_DWORD *)v4 + 44)) {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x200) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x1000000) != 0)
  {
    if ((v32 & 0x1000000) == 0) {
      goto LABEL_252;
    }
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((unsigned char *)v4 + 416)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 416))
    {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x1000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x100000) != 0)
  {
    if ((v32 & 0x100000) == 0) {
      goto LABEL_252;
    }
    if (self->_isFreeArticle)
    {
      if (!*((unsigned char *)v4 + 412)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 412))
    {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x100000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v27 & 0x800000) != 0)
  {
    if ((v32 & 0x800000) == 0) {
      goto LABEL_252;
    }
    if (self->_isNotificationArticle)
    {
      if (!*((unsigned char *)v4 + 415)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 415))
    {
      goto LABEL_252;
    }
  }
  else if ((v32 & 0x800000) != 0)
  {
    goto LABEL_252;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((void *)v4 + 36)
    && !-[NSString isEqual:](notificationId, "isEqual:"))
  {
    goto LABEL_252;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_252;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v37 = self->_has;
  int v38 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v37 & 0x40000) != 0)
  {
    if ((v38 & 0x40000) == 0) {
      goto LABEL_252;
    }
    if (self->_isCoverArticle)
    {
      if (!*((unsigned char *)v4 + 410)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 410))
    {
      goto LABEL_252;
    }
  }
  else if ((v38 & 0x40000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x10000) != 0)
  {
    if ((v38 & 0x10000) == 0) {
      goto LABEL_252;
    }
    if (self->_fromNextArticleAffordanceTap)
    {
      if (!*((unsigned char *)v4 + 408)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 408))
    {
      goto LABEL_252;
    }
  }
  else if ((v38 & 0x10000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v37 & 0x400) != 0)
  {
    if ((v38 & 0x400) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 68)) {
      goto LABEL_252;
    }
  }
  else if ((v38 & 0x400) != 0)
  {
    goto LABEL_252;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:")) {
      goto LABEL_252;
    }
    $BCDF409BEB5F2E465DE2B0AEB40C6798 v37 = self->_has;
  }
  int v40 = *((_DWORD *)v4 + 105);
  if ((*(_DWORD *)&v37 & 0x20000) != 0)
  {
    if ((v40 & 0x20000) == 0) {
      goto LABEL_252;
    }
    if (self->_isBreakingNewsArticle)
    {
      if (!*((unsigned char *)v4 + 409)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 409))
    {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x20000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_WORD *)&v37 & 0x8000) != 0)
  {
    if ((v40 & 0x8000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 96)) {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x8000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x4000000) != 0)
  {
    if ((v40 & 0x4000000) == 0) {
      goto LABEL_252;
    }
    if (self->_isTopStoryArticle)
    {
      if (!*((unsigned char *)v4 + 418)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 418))
    {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x4000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x2000000) != 0)
  {
    if ((v40 & 0x2000000) == 0) {
      goto LABEL_252;
    }
    if (self->_isSearchResult)
    {
      if (!*((unsigned char *)v4 + 417)) {
        goto LABEL_252;
      }
    }
    else if (*((unsigned char *)v4 + 417))
    {
      goto LABEL_252;
    }
  }
  else if ((v40 & 0x2000000) != 0)
  {
    goto LABEL_252;
  }
  if ((*(_DWORD *)&v37 & 0x400000) != 0)
  {
    if ((v40 & 0x400000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((unsigned char *)v4 + 414)) {
          goto LABEL_252;
        }
        goto LABEL_209;
      }
      if (!*((unsigned char *)v4 + 414)) {
        goto LABEL_209;
      }
    }
LABEL_252:
    char v58 = 0;
    goto LABEL_253;
  }
  if ((v40 & 0x400000) != 0) {
    goto LABEL_252;
  }
LABEL_209:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((void *)v4 + 33)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_252;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_252;
    }
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 50))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
      goto LABEL_252;
    }
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_252;
    }
  }
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v46 = self->_has;
  int v47 = *((_DWORD *)v4 + 105);
  if ((*(unsigned char *)&v46 & 8) != 0)
  {
    if ((v47 & 8) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 4)) {
      goto LABEL_252;
    }
  }
  else if ((v47 & 8) != 0)
  {
    goto LABEL_252;
  }
  if (*(unsigned char *)&v46)
  {
    if ((v47 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_252;
    }
  }
  else if (v47)
  {
    goto LABEL_252;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 25)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_252;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 27))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_252;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_252;
    }
  }
  int v51 = *((_DWORD *)v4 + 105);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v51 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 3)) {
      goto LABEL_252;
    }
  }
  else if ((v51 & 4) != 0)
  {
    goto LABEL_252;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 26)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_252;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 23))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_252;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 29))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_252;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 30))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_252;
    }
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 11))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:")) {
      goto LABEL_252;
    }
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 49)) {
    char v58 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  }
  else {
    char v58 = 1;
  }
LABEL_253:

  return v58;
}

- (unint64_t)hash
{
  $BCDF409BEB5F2E465DE2B0AEB40C6798 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    uint64_t v73 = 2654435761 * self->_resultType;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v73 = 0;
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
LABEL_3:
      uint64_t v72 = 2654435761 * self->_contentType;
      goto LABEL_6;
    }
  }
  uint64_t v72 = 0;
LABEL_6:
  NSUInteger v71 = [(NSString *)self->_contentId hash];
  NSUInteger v70 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v69 = [(NSData *)self->_articleSessionId hash];
  uint64_t v68 = [(NSData *)self->_articleViewingSessionId hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v67 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v67 = 0;
  }
  NSUInteger v66 = [(NSString *)self->_feedId hash];
  uint64_t v65 = [(NSData *)self->_feedViewExposureId hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
    uint64_t v64 = 2654435761 * self->_isUserSubscribedToFeed;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
    {
LABEL_11:
      uint64_t v63 = 2654435761 * self->_shareMethod;
      if ((*(_WORD *)&v4 & 0x2000) != 0) {
        goto LABEL_12;
      }
LABEL_16:
      uint64_t v62 = 0;
      if ((*(unsigned char *)&v4 & 0x40) != 0) {
        goto LABEL_13;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v64 = 0;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v63 = 0;
  if ((*(_WORD *)&v4 & 0x2000) == 0) {
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v62 = 2654435761 * self->_shareLocation;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_13:
    uint64_t v61 = 2654435761 * self->_characterCount;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v61 = 0;
LABEL_18:
  NSUInteger v60 = [(NSString *)self->_language hash];
  uint64_t v59 = [(NSMutableArray *)self->_namedEntities hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) != 0)
  {
    uint64_t v58 = 2654435761 * self->_publisherArticleVersion;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v58 = 0;
    if ((*(unsigned char *)&v5 & 0x20) != 0)
    {
LABEL_20:
      uint64_t v57 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_23;
    }
  }
  uint64_t v57 = 0;
LABEL_23:
  NSUInteger v56 = [(NSString *)self->_sourceChannelId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v55 = 2654435761 * self->_articleType;
  }
  else {
    uint64_t v55 = 0;
  }
  NSUInteger v54 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v53 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v52 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v51 = [(NSString *)self->_sectionHeadlineId hash];
  NSUInteger v50 = [(NSString *)self->_iosActivityType hash];
  if ((*((unsigned char *)&self->_has + 2) & 8) != 0) {
    uint64_t v49 = 2654435761 * self->_isDigitalReplicaAd;
  }
  else {
    uint64_t v49 = 0;
  }
  NSUInteger v48 = [(NSString *)self->_externalWeblinkUrl hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
    uint64_t v47 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(_DWORD *)&v6 & 0x200000) != 0) {
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v6 & 0x200000) != 0)
    {
LABEL_31:
      uint64_t v46 = 2654435761 * self->_isGroupedArticle;
      goto LABEL_34;
    }
  }
  uint64_t v46 = 0;
LABEL_34:
  NSUInteger v45 = [(NSString *)self->_groupFeedId hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    uint64_t v44 = 2654435761 * self->_groupType;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0)
    {
LABEL_36:
      uint64_t v43 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
      if ((*(_DWORD *)&v7 & 0x100000) != 0) {
        goto LABEL_37;
      }
LABEL_41:
      uint64_t v42 = 0;
      if ((*(_DWORD *)&v7 & 0x800000) != 0) {
        goto LABEL_38;
      }
      goto LABEL_42;
    }
  }
  else
  {
    uint64_t v44 = 0;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0) {
      goto LABEL_36;
    }
  }
  uint64_t v43 = 0;
  if ((*(_DWORD *)&v7 & 0x100000) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v42 = 2654435761 * self->_isFreeArticle;
  if ((*(_DWORD *)&v7 & 0x800000) != 0)
  {
LABEL_38:
    uint64_t v41 = 2654435761 * self->_isNotificationArticle;
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v41 = 0;
LABEL_43:
  NSUInteger v40 = [(NSString *)self->_notificationId hash];
  NSUInteger v39 = [(NSString *)self->_campaignId hash];
  NSUInteger v38 = [(NSString *)self->_campaignType hash];
  NSUInteger v37 = [(NSString *)self->_creativeId hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
    uint64_t v36 = 0;
    if ((*(_DWORD *)&v8 & 0x10000) != 0) {
      goto LABEL_45;
    }
LABEL_48:
    uint64_t v35 = 0;
    if ((*(_WORD *)&v8 & 0x400) != 0) {
      goto LABEL_46;
    }
    goto LABEL_49;
  }
  uint64_t v36 = 2654435761 * self->_isCoverArticle;
  if ((*(_DWORD *)&v8 & 0x10000) == 0) {
    goto LABEL_48;
  }
LABEL_45:
  uint64_t v35 = 2654435761 * self->_fromNextArticleAffordanceTap;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
LABEL_46:
    uint64_t v34 = 2654435761 * self->_nextArticleAffordanceType;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v34 = 0;
LABEL_50:
  NSUInteger v33 = [(NSString *)self->_nextArticleAffordanceTypeFeedId hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) != 0)
  {
    uint64_t v32 = 2654435761 * self->_isBreakingNewsArticle;
    if ((*(_WORD *)&v9 & 0x8000) != 0)
    {
LABEL_52:
      uint64_t v31 = 2654435761 * self->_topStoryType;
      if ((*(_DWORD *)&v9 & 0x4000000) != 0) {
        goto LABEL_53;
      }
      goto LABEL_58;
    }
  }
  else
  {
    uint64_t v32 = 0;
    if ((*(_WORD *)&v9 & 0x8000) != 0) {
      goto LABEL_52;
    }
  }
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
LABEL_53:
    uint64_t v30 = 2654435761 * self->_isTopStoryArticle;
    if ((*(_DWORD *)&v9 & 0x2000000) != 0) {
      goto LABEL_54;
    }
LABEL_59:
    uint64_t v29 = 0;
    if ((*(_DWORD *)&v9 & 0x400000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_60;
  }
LABEL_58:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
    goto LABEL_59;
  }
LABEL_54:
  uint64_t v29 = 2654435761 * self->_isSearchResult;
  if ((*(_DWORD *)&v9 & 0x400000) != 0)
  {
LABEL_55:
    uint64_t v28 = 2654435761 * self->_isNativeAd;
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v28 = 0;
LABEL_61:
  NSUInteger v27 = [(NSString *)self->_nativeCampaignData hash];
  NSUInteger v26 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v10 = [(NSString *)self->_previousArticleVersion hash];
  unint64_t v11 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  uint64_t v12 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
    uint64_t v14 = 2654435761 * self->_publisherArticleVersionInt64;
    if (*(unsigned char *)&v13) {
      goto LABEL_63;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if (*(unsigned char *)&v13)
    {
LABEL_63:
      uint64_t v15 = 2654435761 * self->_backendArticleVersionInt64;
      goto LABEL_66;
    }
  }
  uint64_t v15 = 0;
LABEL_66:
  NSUInteger v16 = [(NSString *)self->_iadNativeCampaign hash];
  NSUInteger v17 = [(NSString *)self->_iadNativeLine hash];
  NSUInteger v18 = [(NSString *)self->_iadNativeAd hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v20 = v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ [(NSString *)self->_iadNativeCampaignAd hash];
  uint64_t v21 = v72 ^ v73 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v10 ^ v20 ^ [(NSData *)self->_groupViewExposureId hash];
  unint64_t v22 = [(NTPBIssueData *)self->_issueData hash];
  unint64_t v23 = v22 ^ [(NTPBIssueExposureData *)self->_issueExposureData hash];
  unint64_t v24 = v23 ^ [(NTPBChannelData *)self->_channelData hash];
  return v21 ^ v24 ^ [(NSMutableArray *)self->_topicIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  $BCDF409BEB5F2E465DE2B0AEB40C6798 v4 = a3;
  id v5 = v4;
  int v6 = v4[105];
  if ((v6 & 0x1000) != 0)
  {
    self->_resultType = v4[82];
    *(_DWORD *)&self->_has |= 0x1000u;
    int v6 = v4[105];
  }
  if ((v6 & 0x80) != 0)
  {
    self->_uint64_t contentType = v4[28];
    *(_DWORD *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 13)) {
    -[NTPBShareResult setContentId:](self, "setContentId:");
  }
  if (*((void *)v5 + 40)) {
    -[NTPBShareResult setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBShareResult setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v5 + 7)) {
    -[NTPBShareResult setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((unsigned char *)v5 + 421))
  {
    self->_uint64_t feedType = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v5 + 17)) {
    -[NTPBShareResult setFeedId:](self, "setFeedId:");
  }
  if (*((void *)v5 + 19)) {
    -[NTPBShareResult setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  int v7 = *((_DWORD *)v5 + 105);
  if ((v7 & 0x8000000) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v5 + 419);
    *(_DWORD *)&self->_has |= 0x8000000u;
    int v7 = *((_DWORD *)v5 + 105);
    if ((v7 & 0x4000) == 0)
    {
LABEL_21:
      if ((v7 & 0x2000) == 0) {
        goto LABEL_22;
      }
      goto LABEL_97;
    }
  }
  else if ((v7 & 0x4000) == 0)
  {
    goto LABEL_21;
  }
  self->_shareMethod = *((_DWORD *)v5 + 87);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v7 = *((_DWORD *)v5 + 105);
  if ((v7 & 0x2000) == 0)
  {
LABEL_22:
    if ((v7 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_97:
  self->_shareLocation = *((_DWORD *)v5 + 86);
  *(_DWORD *)&self->_has |= 0x2000u;
  if ((*((_DWORD *)v5 + 105) & 0x40) != 0)
  {
LABEL_23:
    self->_characterCount = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x40u;
  }
LABEL_24:
  if (*((void *)v5 + 31)) {
    -[NTPBShareResult setLanguage:](self, "setLanguage:");
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = *((id *)v5 + 32);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        [(NTPBShareResult *)self addNamedEntities:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v10);
  }

  int v13 = *((_DWORD *)v5 + 105);
  if ((v13 & 0x800) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 78);
    *(_DWORD *)&self->_has |= 0x800u;
    int v13 = *((_DWORD *)v5 + 105);
  }
  if ((v13 & 0x20) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v5 + 16);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 44)) {
    -[NTPBShareResult setSourceChannelId:](self, "setSourceChannelId:");
  }
  if ((*((unsigned char *)v5 + 420) & 0x10) != 0)
  {
    self->_uint64_t articleType = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v5 + 45)) {
    -[NTPBShareResult setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v5 + 46)) {
    -[NTPBShareResult setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v5 + 47)) {
    -[NTPBShareResult setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 42)) {
    -[NTPBShareResult setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  if (*((void *)v5 + 28)) {
    -[NTPBShareResult setIosActivityType:](self, "setIosActivityType:");
  }
  if ((*((unsigned char *)v5 + 422) & 8) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v5 + 411);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
  if (*((void *)v5 + 16)) {
    -[NTPBShareResult setExternalWeblinkUrl:](self, "setExternalWeblinkUrl:");
  }
  int v14 = *((_DWORD *)v5 + 105);
  if ((v14 & 2) != 0)
  {
    self->_personalizationTreatmentId = *((void *)v5 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v14 = *((_DWORD *)v5 + 105);
  }
  if ((v14 & 0x200000) != 0)
  {
    self->_isGroupedArticle = *((unsigned char *)v5 + 413);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
  if (*((void *)v5 + 21)) {
    -[NTPBShareResult setGroupFeedId:](self, "setGroupFeedId:");
  }
  int v15 = *((_DWORD *)v5 + 105);
  if ((v15 & 0x200) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v5 + 44);
    *(_DWORD *)&self->_has |= 0x200u;
    int v15 = *((_DWORD *)v5 + 105);
    if ((v15 & 0x1000000) == 0)
    {
LABEL_63:
      if ((v15 & 0x100000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_101;
    }
  }
  else if ((v15 & 0x1000000) == 0)
  {
    goto LABEL_63;
  }
  self->_isPaidSubscriberToSourceChannel = *((unsigned char *)v5 + 416);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v15 = *((_DWORD *)v5 + 105);
  if ((v15 & 0x100000) == 0)
  {
LABEL_64:
    if ((v15 & 0x800000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_101:
  self->_isFreeArticle = *((unsigned char *)v5 + 412);
  *(_DWORD *)&self->_has |= 0x100000u;
  if ((*((_DWORD *)v5 + 105) & 0x800000) != 0)
  {
LABEL_65:
    self->_isNotificationArticle = *((unsigned char *)v5 + 415);
    *(_DWORD *)&self->_has |= 0x800000u;
  }
LABEL_66:
  if (*((void *)v5 + 36)) {
    -[NTPBShareResult setNotificationId:](self, "setNotificationId:");
  }
  if (*((void *)v5 + 9)) {
    -[NTPBShareResult setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v5 + 10)) {
    -[NTPBShareResult setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v5 + 15)) {
    -[NTPBShareResult setCreativeId:](self, "setCreativeId:");
  }
  int v16 = *((_DWORD *)v5 + 105);
  if ((v16 & 0x40000) != 0)
  {
    self->_isCoverArticle = *((unsigned char *)v5 + 410);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v16 = *((_DWORD *)v5 + 105);
    if ((v16 & 0x10000) == 0)
    {
LABEL_76:
      if ((v16 & 0x400) == 0) {
        goto LABEL_78;
      }
      goto LABEL_77;
    }
  }
  else if ((v16 & 0x10000) == 0)
  {
    goto LABEL_76;
  }
  self->_fromNextArticleAffordanceTap = *((unsigned char *)v5 + 408);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v5 + 105) & 0x400) != 0)
  {
LABEL_77:
    self->_uint64_t nextArticleAffordanceType = *((_DWORD *)v5 + 68);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_78:
  if (*((void *)v5 + 35)) {
    -[NTPBShareResult setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  }
  int v17 = *((_DWORD *)v5 + 105);
  if ((v17 & 0x20000) != 0)
  {
    self->_isBreakingNewsArticle = *((unsigned char *)v5 + 409);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v17 = *((_DWORD *)v5 + 105);
    if ((v17 & 0x8000) == 0)
    {
LABEL_82:
      if ((v17 & 0x4000000) == 0) {
        goto LABEL_83;
      }
      goto LABEL_108;
    }
  }
  else if ((v17 & 0x8000) == 0)
  {
    goto LABEL_82;
  }
  self->_uint64_t topStoryType = *((_DWORD *)v5 + 96);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v17 = *((_DWORD *)v5 + 105);
  if ((v17 & 0x4000000) == 0)
  {
LABEL_83:
    if ((v17 & 0x2000000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_isTopStoryArticle = *((unsigned char *)v5 + 418);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v17 = *((_DWORD *)v5 + 105);
  if ((v17 & 0x2000000) == 0)
  {
LABEL_84:
    if ((v17 & 0x400000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_85;
  }
LABEL_109:
  self->_isSearchResult = *((unsigned char *)v5 + 417);
  *(_DWORD *)&self->_has |= 0x2000000u;
  if ((*((_DWORD *)v5 + 105) & 0x400000) != 0)
  {
LABEL_85:
    self->_isNativeAd = *((unsigned char *)v5 + 414);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
LABEL_86:
  if (*((void *)v5 + 33)) {
    -[NTPBShareResult setNativeCampaignData:](self, "setNativeCampaignData:");
  }
  if (*((void *)v5 + 37)) {
    -[NTPBShareResult setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 38)) {
    -[NTPBShareResult setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v19 = *((void *)v5 + 50);
  if (widgetEngagement)
  {
    if (v19) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[NTPBShareResult setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v20 = *((id *)v5 + 20);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v42 != v23) {
          objc_enumerationMutation(v20);
        }
        [(NTPBShareResult *)self addFractionalCohortMembership:*(void *)(*((void *)&v41 + 1) + 8 * j)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v22);
  }

  int v25 = *((_DWORD *)v5 + 105);
  if ((v25 & 8) != 0)
  {
    self->_publisherArticleVersionInt64 = *((void *)v5 + 4);
    *(_DWORD *)&self->_has |= 8u;
    int v25 = *((_DWORD *)v5 + 105);
  }
  if (v25)
  {
    self->_backendArticleVersionInt64 = *((void *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 25)) {
    -[NTPBShareResult setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v5 + 27)) {
    -[NTPBShareResult setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v5 + 24)) {
    -[NTPBShareResult setIadNativeAd:](self, "setIadNativeAd:");
  }
  if ((*((unsigned char *)v5 + 420) & 4) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 26)) {
    -[NTPBShareResult setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  if (*((void *)v5 + 23)) {
    -[NTPBShareResult setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  issueData = self->_issueData;
  uint64_t v27 = *((void *)v5 + 29);
  if (issueData)
  {
    if (v27) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[NTPBShareResult setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v29 = *((void *)v5 + 30);
  if (issueExposureData)
  {
    if (v29) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[NTPBShareResult setIssueExposureData:](self, "setIssueExposureData:");
  }
  channelData = self->_channelData;
  uint64_t v31 = *((void *)v5 + 11);
  if (channelData)
  {
    if (v31) {
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[NTPBShareResult setChannelData:](self, "setChannelData:");
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v32 = *((id *)v5 + 49);
  uint64_t v33 = [v32 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v38 != v35) {
          objc_enumerationMutation(v32);
        }
        -[NTPBShareResult addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v37 + 1) + 8 * k), (void)v37);
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v34);
  }
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

- (int)characterCount
{
  return self->_characterCount;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
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

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
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

- (NSString)iosActivityType
{
  return self->_iosActivityType;
}

- (void)setIosActivityType:(id)a3
{
}

- (BOOL)isDigitalReplicaAd
{
  return self->_isDigitalReplicaAd;
}

- (NSString)externalWeblinkUrl
{
  return self->_externalWeblinkUrl;
}

- (void)setExternalWeblinkUrl:(id)a3
{
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (BOOL)isGroupedArticle
{
  return self->_isGroupedArticle;
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (BOOL)isFreeArticle
{
  return self->_isFreeArticle;
}

- (BOOL)isNotificationArticle
{
  return self->_isNotificationArticle;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
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

- (BOOL)isCoverArticle
{
  return self->_isCoverArticle;
}

- (BOOL)fromNextArticleAffordanceTap
{
  return self->_fromNextArticleAffordanceTap;
}

- (NSString)nextArticleAffordanceTypeFeedId
{
  return self->_nextArticleAffordanceTypeFeedId;
}

- (void)setNextArticleAffordanceTypeFeedId:(id)a3
{
}

- (BOOL)isBreakingNewsArticle
{
  return self->_isBreakingNewsArticle;
}

- (BOOL)isTopStoryArticle
{
  return self->_isTopStoryArticle;
}

- (BOOL)isSearchResult
{
  return self->_isSearchResult;
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

- (NTPBChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
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
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_iosActivityType, 0);
  objc_storeStrong((id *)&self->_iadNativeLine, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaign, 0);
  objc_storeStrong((id *)&self->_iadNativeAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_externalWeblinkUrl, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_contentId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleSessionId, 0);
}

@end