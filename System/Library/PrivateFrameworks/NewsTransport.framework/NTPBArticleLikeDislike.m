@interface NTPBArticleLikeDislike
+ (Class)fractionalCohortMembershipType;
+ (Class)namedEntitiesType;
+ (Class)topicIdsType;
- (BOOL)fromNextArticleAffordanceTap;
- (BOOL)hasArticleId;
- (BOOL)hasArticleSessionId;
- (BOOL)hasArticleType;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasChannelData;
- (BOOL)hasCharacterCount;
- (BOOL)hasContentType;
- (BOOL)hasCreativeId;
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
- (BOOL)hasIsBreakingNewsArticle;
- (BOOL)hasIsCoverArticle;
- (BOOL)hasIsDigitalReplicaAd;
- (BOOL)hasIsFreeArticle;
- (BOOL)hasIsGroupedArticle;
- (BOOL)hasIsNativeAd;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIsSearchResultArticle;
- (BOOL)hasIsTopStoryArticle;
- (BOOL)hasIsUserSubscribedToFeed;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasLanguage;
- (BOOL)hasLikeDislikeLocation;
- (BOOL)hasNativeCampaignData;
- (BOOL)hasNextArticleAffordanceType;
- (BOOL)hasNextArticleAffordanceTypeFeedId;
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
- (BOOL)hasTopStoryType;
- (BOOL)hasUserAction;
- (BOOL)hasWidgetEngagement;
- (BOOL)isBreakingNewsArticle;
- (BOOL)isCoverArticle;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeArticle;
- (BOOL)isGroupedArticle;
- (BOOL)isNativeAd;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)isSearchResultArticle;
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
- (NSString)articleId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)feedId;
- (NSString)groupFeedId;
- (NSString)iadNativeAd;
- (NSString)iadNativeCampaign;
- (NSString)iadNativeCampaignAd;
- (NSString)iadNativeLine;
- (NSString)language;
- (NSString)nativeCampaignData;
- (NSString)nextArticleAffordanceTypeFeedId;
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
- (int)likeDislikeLocation;
- (int)nextArticleAffordanceType;
- (int)publisherArticleVersion;
- (int)topStoryType;
- (int)userAction;
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
- (void)setArticleId:(id)a3;
- (void)setArticleSessionId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setBackendArticleVersion:(int)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelData:(id)a3;
- (void)setCharacterCount:(int)a3;
- (void)setContentType:(int)a3;
- (void)setCreativeId:(id)a3;
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
- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setHasIsSearchResultArticle:(BOOL)a3;
- (void)setHasIsTopStoryArticle:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
- (void)setHasLikeDislikeLocation:(BOOL)a3;
- (void)setHasNextArticleAffordanceType:(BOOL)a3;
- (void)setHasPersonalizationTreatmentId:(BOOL)a3;
- (void)setHasPreviousArticlePublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersion:(BOOL)a3;
- (void)setHasPublisherArticleVersionInt64:(BOOL)a3;
- (void)setHasTopStoryType:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setIadNativeAd:(id)a3;
- (void)setIadNativeCampaign:(id)a3;
- (void)setIadNativeCampaignAd:(id)a3;
- (void)setIadNativeLine:(id)a3;
- (void)setIsBreakingNewsArticle:(BOOL)a3;
- (void)setIsCoverArticle:(BOOL)a3;
- (void)setIsDigitalReplicaAd:(BOOL)a3;
- (void)setIsFreeArticle:(BOOL)a3;
- (void)setIsGroupedArticle:(BOOL)a3;
- (void)setIsNativeAd:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIsSearchResultArticle:(BOOL)a3;
- (void)setIsTopStoryArticle:(BOOL)a3;
- (void)setIsUserSubscribedToFeed:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLikeDislikeLocation:(int)a3;
- (void)setNamedEntities:(id)a3;
- (void)setNativeCampaignData:(id)a3;
- (void)setNextArticleAffordanceType:(int)a3;
- (void)setNextArticleAffordanceTypeFeedId:(id)a3;
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
- (void)setTopStoryType:(int)a3;
- (void)setTopicIds:(id)a3;
- (void)setUserAction:(int)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBArticleLikeDislike

- (int)userAction
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
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
    int v3 = off_26444A778[a3];
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
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (int)likeDislikeLocation
{
  if ((*((unsigned char *)&self->_has + 1) & 4) != 0) {
    return self->_likeDislikeLocation;
  }
  else {
    return 0;
  }
}

- (void)setLikeDislikeLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_likeDislikeLocation = a3;
}

- (void)setHasLikeDislikeLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLikeDislikeLocation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
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
    int v3 = off_26444A828[a3];
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCharacterCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (void)setPublisherArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_publisherArticleVersion = a3;
}

- (void)setHasPublisherArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsGroupedArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_isGroupedArticle = a3;
}

- (void)setHasIsGroupedArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIsGroupedArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
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
    int v3 = off_26444A858[a3];
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
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setIsFreeArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_isFreeArticle = a3;
}

- (void)setHasIsFreeArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasIsFreeArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
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
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_isCoverArticle = a3;
}

- (void)setHasIsCoverArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasIsCoverArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setFromNextArticleAffordanceTap:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_fromNextArticleAffordanceTap = a3;
}

- (void)setHasFromNextArticleAffordanceTap:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFromNextArticleAffordanceTap
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (int)nextArticleAffordanceType
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_nextArticleAffordanceType;
  }
  else {
    return 0;
  }
}

- (void)setNextArticleAffordanceType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_nextArticleAffordanceType = a3;
}

- (void)setHasNextArticleAffordanceType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasNextArticleAffordanceType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
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
    int v3 = off_26444A998[a3];
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
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isBreakingNewsArticle = a3;
}

- (void)setHasIsBreakingNewsArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsBreakingNewsArticle
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (int)topStoryType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_topStoryType;
  }
  else {
    return 0;
  }
}

- (void)setTopStoryType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_topStoryType = a3;
}

- (void)setHasTopStoryType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasTopStoryType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
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
    int v3 = off_26444AA18[a3];
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
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIsSearchResultArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isSearchResultArticle = a3;
}

- (void)setHasIsSearchResultArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsSearchResultArticle
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setIsNativeAd:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_isNativeAd = a3;
}

- (void)setHasIsNativeAd:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasIsNativeAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
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
  self->_has = ($969F66802EEB540360E160052BF188A2)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
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
    int v3 = off_26444AA30[a3];
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
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBArticleLikeDislike;
  id v4 = [(NTPBArticleLikeDislike *)&v8 description];
  v5 = [(NTPBArticleLikeDislike *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    id v4 = [NSNumber numberWithInt:self->_userAction];
    [v3 setObject:v4 forKey:@"user_action"];
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
  if (*((unsigned char *)&self->_has + 1))
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26444A778[feedType];
    }
    [v3 setObject:v11 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v3 setObject:feedId forKey:@"feed_id"];
  }
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v3 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  $969F66802EEB540360E160052BF188A2 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    v15 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
    [v3 setObject:v15 forKey:@"is_user_subscribed_to_feed"];

    $969F66802EEB540360E160052BF188A2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_24:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_32;
      }
      goto LABEL_28;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_24;
  }
  v16 = [NSNumber numberWithInt:self->_likeDislikeLocation];
  [v3 setObject:v16 forKey:@"like_dislike_location"];

  if ((*(_DWORD *)&self->_has & 0x10) == 0) {
    goto LABEL_32;
  }
LABEL_28:
  uint64_t articleType = self->_articleType;
  if (articleType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_26444A828[articleType];
  }
  [v3 setObject:v18 forKey:@"article_type"];

LABEL_32:
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v3 setObject:namedEntities forKey:@"named_entities"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v20 = [NSNumber numberWithInt:self->_characterCount];
    [v3 setObject:v20 forKey:@"character_count"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  $969F66802EEB540360E160052BF188A2 v22 = self->_has;
  if ((*(_WORD *)&v22 & 0x1000) != 0)
  {
    v23 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v3 setObject:v23 forKey:@"publisher_article_version"];

    $969F66802EEB540360E160052BF188A2 v22 = self->_has;
  }
  if ((*(unsigned char *)&v22 & 0x20) != 0)
  {
    v24 = [NSNumber numberWithInt:self->_backendArticleVersion];
    [v3 setObject:v24 forKey:@"backend_article_version"];
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
  $969F66802EEB540360E160052BF188A2 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x40000) != 0)
  {
    v38 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v3 setObject:v38 forKey:@"is_digital_replica_ad"];

    $969F66802EEB540360E160052BF188A2 v29 = self->_has;
    if ((*(unsigned char *)&v29 & 2) == 0)
    {
LABEL_52:
      if ((*(_DWORD *)&v29 & 0x100000) == 0) {
        goto LABEL_54;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&v29 & 2) == 0)
  {
    goto LABEL_52;
  }
  v39 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
  [v3 setObject:v39 forKey:@"personalization_treatment_id"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_53:
    v30 = [NSNumber numberWithBool:self->_isGroupedArticle];
    [v3 setObject:v30 forKey:@"is_grouped_article"];
  }
LABEL_54:
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  $969F66802EEB540360E160052BF188A2 v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x200) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_26444A858[groupType];
    }
    [v3 setObject:v41 forKey:@"group_type"];

    $969F66802EEB540360E160052BF188A2 v32 = self->_has;
    if ((*(_DWORD *)&v32 & 0x400000) == 0)
    {
LABEL_58:
      if ((*(_DWORD *)&v32 & 0x80000) == 0) {
        goto LABEL_60;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v32 & 0x400000) == 0)
  {
    goto LABEL_58;
  }
  v46 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
  [v3 setObject:v46 forKey:@"is_paid_subscriber_to_source_channel"];

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_59:
    v33 = [NSNumber numberWithBool:self->_isFreeArticle];
    [v3 setObject:v33 forKey:@"is_free_article"];
  }
LABEL_60:
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
  $969F66802EEB540360E160052BF188A2 v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x20000) != 0)
  {
    v42 = [NSNumber numberWithBool:self->_isCoverArticle];
    [v3 setObject:v42 forKey:@"is_cover_article"];

    $969F66802EEB540360E160052BF188A2 v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x8000) == 0)
    {
LABEL_68:
      if ((*(_WORD *)&v37 & 0x800) == 0) {
        goto LABEL_85;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v37 & 0x8000) == 0)
  {
    goto LABEL_68;
  }
  v43 = [NSNumber numberWithBool:self->_fromNextArticleAffordanceTap];
  [v3 setObject:v43 forKey:@"from_next_article_affordance_tap"];

  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    goto LABEL_85;
  }
LABEL_77:
  uint64_t nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nextArticleAffordanceType);
    v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v45 = off_26444A998[nextArticleAffordanceType];
  }
  [v3 setObject:v45 forKey:@"next_article_affordance_type"];

LABEL_85:
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId) {
    [v3 setObject:nextArticleAffordanceTypeFeedId forKey:@"next_article_affordance_type_feed_id"];
  }
  $969F66802EEB540360E160052BF188A2 v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x10000) != 0)
  {
    v77 = [NSNumber numberWithBool:self->_isBreakingNewsArticle];
    [v3 setObject:v77 forKey:@"is_breaking_news_article"];

    $969F66802EEB540360E160052BF188A2 v48 = self->_has;
    if ((*(_WORD *)&v48 & 0x2000) == 0)
    {
LABEL_89:
      if ((*(_DWORD *)&v48 & 0x1000000) == 0) {
        goto LABEL_90;
      }
      goto LABEL_145;
    }
  }
  else if ((*(_WORD *)&v48 & 0x2000) == 0)
  {
    goto LABEL_89;
  }
  uint64_t topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_topStoryType);
    v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v79 = off_26444AA18[topStoryType];
  }
  [v3 setObject:v79 forKey:@"top_story_type"];

  $969F66802EEB540360E160052BF188A2 v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x1000000) == 0)
  {
LABEL_90:
    if ((*(_DWORD *)&v48 & 0x800000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_146;
  }
LABEL_145:
  v85 = [NSNumber numberWithBool:self->_isTopStoryArticle];
  [v3 setObject:v85 forKey:@"is_top_story_article"];

  $969F66802EEB540360E160052BF188A2 v48 = self->_has;
  if ((*(_DWORD *)&v48 & 0x800000) == 0)
  {
LABEL_91:
    if ((*(_DWORD *)&v48 & 0x200000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_92;
  }
LABEL_146:
  v86 = [NSNumber numberWithBool:self->_isSearchResultArticle];
  [v3 setObject:v86 forKey:@"is_search_result_article"];

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_92:
    v49 = [NSNumber numberWithBool:self->_isNativeAd];
    [v3 setObject:v49 forKey:@"is_native_ad"];
  }
LABEL_93:
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
    v54 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v54 forKey:@"widget_engagement"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v55 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    v56 = self->_fractionalCohortMemberships;
    uint64_t v57 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v87 objects:v91 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v88;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v88 != v59) {
            objc_enumerationMutation(v56);
          }
          v61 = [*(id *)(*((void *)&v87 + 1) + 8 * i) dictionaryRepresentation];
          [v55 addObject:v61];
        }
        uint64_t v58 = [(NSMutableArray *)v56 countByEnumeratingWithState:&v87 objects:v91 count:16];
      }
      while (v58);
    }

    [v3 setObject:v55 forKey:@"fractional_cohort_membership"];
  }
  $969F66802EEB540360E160052BF188A2 v62 = self->_has;
  if ((*(unsigned char *)&v62 & 8) != 0)
  {
    v63 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
    [v3 setObject:v63 forKey:@"publisher_article_version_int64"];

    $969F66802EEB540360E160052BF188A2 v62 = self->_has;
  }
  if (*(unsigned char *)&v62)
  {
    v64 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
    [v3 setObject:v64 forKey:@"backend_article_version_int64"];
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
    v68 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v3 setObject:v68 forKey:@"previous_article_publisher_article_version"];
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
    v72 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v72 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v74 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v74 forKey:@"issue_exposure_data"];
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contentType);
      v76 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v76 = off_26444AA30[contentType];
    }
    [v3 setObject:v76 forKey:@"content_type"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v81 = [(NTPBChannelData *)channelData dictionaryRepresentation];
    [v3 setObject:v81 forKey:@"channel_data"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v3 setObject:topicIds forKey:@"topic_ids"];
  }
  id v83 = v3;

  return v83;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBArticleLikeDislikeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
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
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  $969F66802EEB540360E160052BF188A2 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $969F66802EEB540360E160052BF188A2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x10) != 0) {
LABEL_22:
  }
    PBDataWriterWriteInt32Field();
LABEL_23:
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v6 = self->_namedEntities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v8);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  $969F66802EEB540360E160052BF188A2 v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $969F66802EEB540360E160052BF188A2 v11 = self->_has;
  }
  if ((*(unsigned char *)&v11 & 0x20) != 0) {
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
  $969F66802EEB540360E160052BF188A2 v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $969F66802EEB540360E160052BF188A2 v12 = self->_has;
    if ((*(unsigned char *)&v12 & 2) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v12 & 0x100000) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&v12 & 2) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_49:
  }
    PBDataWriterWriteBOOLField();
LABEL_50:
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  $969F66802EEB540360E160052BF188A2 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $969F66802EEB540360E160052BF188A2 v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_54:
      if ((*(_DWORD *)&v13 & 0x80000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_54;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
LABEL_55:
  }
    PBDataWriterWriteBOOLField();
LABEL_56:
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_creativeId) {
    PBDataWriterWriteStringField();
  }
  $969F66802EEB540360E160052BF188A2 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x20000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $969F66802EEB540360E160052BF188A2 v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x8000) == 0)
    {
LABEL_64:
      if ((*(_WORD *)&v14 & 0x800) == 0) {
        goto LABEL_66;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
    goto LABEL_64;
  }
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_65:
  }
    PBDataWriterWriteInt32Field();
LABEL_66:
  if (self->_nextArticleAffordanceTypeFeedId) {
    PBDataWriterWriteStringField();
  }
  $969F66802EEB540360E160052BF188A2 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $969F66802EEB540360E160052BF188A2 v15 = self->_has;
    if ((*(_WORD *)&v15 & 0x2000) == 0)
    {
LABEL_70:
      if ((*(_DWORD *)&v15 & 0x1000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_135;
    }
  }
  else if ((*(_WORD *)&v15 & 0x2000) == 0)
  {
    goto LABEL_70;
  }
  PBDataWriterWriteInt32Field();
  $969F66802EEB540360E160052BF188A2 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
LABEL_71:
    if ((*(_DWORD *)&v15 & 0x800000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteBOOLField();
  $969F66802EEB540360E160052BF188A2 v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x800000) == 0)
  {
LABEL_72:
    if ((*(_DWORD *)&v15 & 0x200000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_136:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_73:
  }
    PBDataWriterWriteBOOLField();
LABEL_74:
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
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v16 = self->_fractionalCohortMemberships;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteSubmessage();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v18);
  }

  $969F66802EEB540360E160052BF188A2 v21 = self->_has;
  if ((*(unsigned char *)&v21 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    $969F66802EEB540360E160052BF188A2 v21 = self->_has;
  }
  if (*(unsigned char *)&v21) {
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
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_channelData) {
    PBDataWriterWriteSubmessage();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  $969F66802EEB540360E160052BF188A2 v22 = self->_topicIds;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v28;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v28 != v25) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteStringField();
        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v24);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_userAction;
    *(_DWORD *)(v5 + 388) |= 0x4000u;
  }
  uint64_t v7 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  uint64_t v9 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  uint64_t v10 = *(void **)(v6 + 296);
  *(void *)(v6 + 296) = v9;

  uint64_t v11 = [(NSData *)self->_articleSessionId copyWithZone:a3];
  $969F66802EEB540360E160052BF188A2 v12 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v11;

  uint64_t v13 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  $969F66802EEB540360E160052BF188A2 v14 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v13;

  uint64_t v15 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v16 = *(void **)(v6 + 312);
  *(void *)(v6 + 312) = v15;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(_DWORD *)(v6 + 128) = self->_feedType;
    *(_DWORD *)(v6 + 388) |= 0x100u;
  }
  uint64_t v17 = [(NSString *)self->_feedId copyWithZone:a3];
  uint64_t v18 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v17;

  uint64_t v19 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v20 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v19;

  $969F66802EEB540360E160052BF188A2 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    *(unsigned char *)(v6 + 386) = self->_isUserSubscribedToFeed;
    *(_DWORD *)(v6 + 388) |= 0x2000000u;
    $969F66802EEB540360E160052BF188A2 has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x10) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v6 + 232) = self->_likeDislikeLocation;
  *(_DWORD *)(v6 + 388) |= 0x400u;
  if ((*(_DWORD *)&self->_has & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v6 + 56) = self->_articleType;
    *(_DWORD *)(v6 + 388) |= 0x10u;
  }
LABEL_9:
  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  $969F66802EEB540360E160052BF188A2 v22 = self->_namedEntities;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v99 objects:v105 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v100;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v100 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = (void *)[*(id *)(*((void *)&v99 + 1) + 8 * v26) copyWithZone:a3];
        [(id)v6 addNamedEntities:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v99 objects:v105 count:16];
    }
    while (v24);
  }

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 104) = self->_characterCount;
    *(_DWORD *)(v6 + 388) |= 0x40u;
  }
  uint64_t v28 = [(NSString *)self->_language copyWithZone:a3];
  long long v29 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v28;

  $969F66802EEB540360E160052BF188A2 v30 = self->_has;
  if ((*(_WORD *)&v30 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 288) = self->_publisherArticleVersion;
    *(_DWORD *)(v6 + 388) |= 0x1000u;
    $969F66802EEB540360E160052BF188A2 v30 = self->_has;
  }
  if ((*(unsigned char *)&v30 & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_backendArticleVersion;
    *(_DWORD *)(v6 + 388) |= 0x20u;
  }
  uint64_t v31 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  long long v32 = *(void **)(v6 + 320);
  *(void *)(v6 + 320) = v31;

  uint64_t v33 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  long long v34 = *(void **)(v6 + 328);
  *(void *)(v6 + 328) = v33;

  uint64_t v35 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  long long v36 = *(void **)(v6 + 336);
  *(void *)(v6 + 336) = v35;

  uint64_t v37 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  long long v38 = *(void **)(v6 + 304);
  *(void *)(v6 + 304) = v37;

  $969F66802EEB540360E160052BF188A2 v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x40000) != 0)
  {
    *(unsigned char *)(v6 + 379) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v6 + 388) |= 0x40000u;
    $969F66802EEB540360E160052BF188A2 v39 = self->_has;
    if ((*(unsigned char *)&v39 & 2) == 0)
    {
LABEL_24:
      if ((*(_DWORD *)&v39 & 0x100000) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&v39 & 2) == 0)
  {
    goto LABEL_24;
  }
  *(void *)(v6 + 16) = self->_personalizationTreatmentId;
  *(_DWORD *)(v6 + 388) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_25:
    *(unsigned char *)(v6 + 381) = self->_isGroupedArticle;
    *(_DWORD *)(v6 + 388) |= 0x100000u;
  }
LABEL_26:
  uint64_t v40 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  v41 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v40;

  $969F66802EEB540360E160052BF188A2 v42 = self->_has;
  if ((*(_WORD *)&v42 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 160) = self->_groupType;
    *(_DWORD *)(v6 + 388) |= 0x200u;
    $969F66802EEB540360E160052BF188A2 v42 = self->_has;
    if ((*(_DWORD *)&v42 & 0x400000) == 0)
    {
LABEL_28:
      if ((*(_DWORD *)&v42 & 0x80000) == 0) {
        goto LABEL_30;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_DWORD *)&v42 & 0x400000) == 0)
  {
    goto LABEL_28;
  }
  *(unsigned char *)(v6 + 383) = self->_isPaidSubscriberToSourceChannel;
  *(_DWORD *)(v6 + 388) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_29:
    *(unsigned char *)(v6 + 380) = self->_isFreeArticle;
    *(_DWORD *)(v6 + 388) |= 0x80000u;
  }
LABEL_30:
  uint64_t v43 = [(NSString *)self->_campaignId copyWithZone:a3];
  v44 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v43;

  uint64_t v45 = [(NSString *)self->_campaignType copyWithZone:a3];
  v46 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v45;

  uint64_t v47 = [(NSString *)self->_creativeId copyWithZone:a3];
  $969F66802EEB540360E160052BF188A2 v48 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v47;

  $969F66802EEB540360E160052BF188A2 v49 = self->_has;
  if ((*(_DWORD *)&v49 & 0x20000) != 0)
  {
    *(unsigned char *)(v6 + 378) = self->_isCoverArticle;
    *(_DWORD *)(v6 + 388) |= 0x20000u;
    $969F66802EEB540360E160052BF188A2 v49 = self->_has;
    if ((*(_WORD *)&v49 & 0x8000) == 0)
    {
LABEL_32:
      if ((*(_WORD *)&v49 & 0x800) == 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else if ((*(_WORD *)&v49 & 0x8000) == 0)
  {
    goto LABEL_32;
  }
  *(unsigned char *)(v6 + 376) = self->_fromNextArticleAffordanceTap;
  *(_DWORD *)(v6 + 388) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_33:
    *(_DWORD *)(v6 + 256) = self->_nextArticleAffordanceType;
    *(_DWORD *)(v6 + 388) |= 0x800u;
  }
LABEL_34:
  uint64_t v50 = [(NSString *)self->_nextArticleAffordanceTypeFeedId copyWithZone:a3];
  v51 = *(void **)(v6 + 264);
  *(void *)(v6 + 264) = v50;

  $969F66802EEB540360E160052BF188A2 v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x10000) != 0)
  {
    *(unsigned char *)(v6 + 377) = self->_isBreakingNewsArticle;
    *(_DWORD *)(v6 + 388) |= 0x10000u;
    $969F66802EEB540360E160052BF188A2 v52 = self->_has;
    if ((*(_WORD *)&v52 & 0x2000) == 0)
    {
LABEL_36:
      if ((*(_DWORD *)&v52 & 0x1000000) == 0) {
        goto LABEL_37;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v52 & 0x2000) == 0)
  {
    goto LABEL_36;
  }
  *(_DWORD *)(v6 + 344) = self->_topStoryType;
  *(_DWORD *)(v6 + 388) |= 0x2000u;
  $969F66802EEB540360E160052BF188A2 v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x1000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v52 & 0x800000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(unsigned char *)(v6 + 385) = self->_isTopStoryArticle;
  *(_DWORD *)(v6 + 388) |= 0x1000000u;
  $969F66802EEB540360E160052BF188A2 v52 = self->_has;
  if ((*(_DWORD *)&v52 & 0x800000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v52 & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_78:
  *(unsigned char *)(v6 + 384) = self->_isSearchResultArticle;
  *(_DWORD *)(v6 + 388) |= 0x800000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_39:
    *(unsigned char *)(v6 + 382) = self->_isNativeAd;
    *(_DWORD *)(v6 + 388) |= 0x200000u;
  }
LABEL_40:
  uint64_t v53 = [(NSString *)self->_nativeCampaignData copyWithZone:a3];
  v54 = *(void **)(v6 + 248);
  *(void *)(v6 + 248) = v53;

  uint64_t v55 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v56 = *(void **)(v6 + 272);
  *(void *)(v6 + 272) = v55;

  uint64_t v57 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  uint64_t v58 = *(void **)(v6 + 280);
  *(void *)(v6 + 280) = v57;

  id v59 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  v60 = *(void **)(v6 + 368);
  *(void *)(v6 + 368) = v59;

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  v61 = self->_fractionalCohortMemberships;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v95 objects:v104 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v96;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v96 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = (void *)[*(id *)(*((void *)&v95 + 1) + 8 * v65) copyWithZone:a3];
        [(id)v6 addFractionalCohortMembership:v66];

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v95 objects:v104 count:16];
    }
    while (v63);
  }

  $969F66802EEB540360E160052BF188A2 v67 = self->_has;
  if ((*(unsigned char *)&v67 & 8) != 0)
  {
    *(void *)(v6 + 32) = self->_publisherArticleVersionInt64;
    *(_DWORD *)(v6 + 388) |= 8u;
    $969F66802EEB540360E160052BF188A2 v67 = self->_has;
  }
  if (*(unsigned char *)&v67)
  {
    *(void *)(v6 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v6 + 388) |= 1u;
  }
  uint64_t v68 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  v69 = *(void **)(v6 + 184);
  *(void *)(v6 + 184) = v68;

  uint64_t v70 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v71 = *(void **)(v6 + 200);
  *(void *)(v6 + 200) = v70;

  uint64_t v72 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  v73 = *(void **)(v6 + 176);
  *(void *)(v6 + 176) = v72;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v6 + 388) |= 4u;
  }
  uint64_t v74 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  v75 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v74;

  uint64_t v76 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v77 = *(void **)(v6 + 168);
  *(void *)(v6 + 168) = v76;

  id v78 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v79 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v78;

  id v80 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  v81 = *(void **)(v6 + 216);
  *(void *)(v6 + 216) = v80;

  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 108) = self->_contentType;
    *(_DWORD *)(v6 + 388) |= 0x80u;
  }
  id v82 = [(NTPBChannelData *)self->_channelData copyWithZone:a3];
  id v83 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v82;

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v84 = self->_topicIds;
  uint64_t v85 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v91 objects:v103 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v92;
    do
    {
      uint64_t v88 = 0;
      do
      {
        if (*(void *)v92 != v87) {
          objc_enumerationMutation(v84);
        }
        long long v89 = objc_msgSend(*(id *)(*((void *)&v91 + 1) + 8 * v88), "copyWithZone:", a3, (void)v91);
        [(id)v6 addTopicIds:v89];

        ++v88;
      }
      while (v86 != v88);
      uint64_t v86 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v91 objects:v103 count:16];
    }
    while (v86);
  }

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_233;
  }
  int v5 = *((_DWORD *)v4 + 97);
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    if ((v5 & 0x4000) == 0 || self->_userAction != *((_DWORD *)v4 + 90)) {
      goto LABEL_233;
    }
  }
  else if ((v5 & 0x4000) != 0)
  {
    goto LABEL_233;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 5) && !-[NSString isEqual:](articleId, "isEqual:")) {
    goto LABEL_233;
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  articleSessionId = self->_articleSessionId;
  if ((unint64_t)articleSessionId | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](articleSessionId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 8))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 39))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v11 = *((_DWORD *)v4 + 97);
  if (*((unsigned char *)&self->_has + 1))
  {
    if ((v11 & 0x100) == 0 || self->_feedType != *((_DWORD *)v4 + 32)) {
      goto LABEL_233;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_233;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 15) && !-[NSString isEqual:](feedId, "isEqual:")) {
    goto LABEL_233;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $969F66802EEB540360E160052BF188A2 has = self->_has;
  int v15 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v15 & 0x2000000) == 0) {
      goto LABEL_233;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 386)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 386))
    {
      goto LABEL_233;
    }
  }
  else if ((v15 & 0x2000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_likeDislikeLocation != *((_DWORD *)v4 + 58)) {
      goto LABEL_233;
    }
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_articleType != *((_DWORD *)v4 + 14)) {
      goto LABEL_233;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_233;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 30))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_233;
    }
    $969F66802EEB540360E160052BF188A2 has = self->_has;
  }
  int v17 = *((_DWORD *)v4 + 97);
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_characterCount != *((_DWORD *)v4 + 26)) {
      goto LABEL_233;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_233;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_233;
    }
    $969F66802EEB540360E160052BF188A2 has = self->_has;
  }
  int v19 = *((_DWORD *)v4 + 97);
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v19 & 0x1000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 72)) {
      goto LABEL_233;
    }
  }
  else if ((v19 & 0x1000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v19 & 0x20) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 18)) {
      goto LABEL_233;
    }
  }
  else if ((v19 & 0x20) != 0)
  {
    goto LABEL_233;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 40)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_233;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 41))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 42))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $969F66802EEB540360E160052BF188A2 v24 = self->_has;
  int v25 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&v24 & 0x40000) != 0)
  {
    if ((v25 & 0x40000) == 0) {
      goto LABEL_233;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 379)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 379))
    {
      goto LABEL_233;
    }
  }
  else if ((v25 & 0x40000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&v24 & 2) != 0)
  {
    if ((v25 & 2) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 2)) {
      goto LABEL_233;
    }
  }
  else if ((v25 & 2) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x100000) != 0)
  {
    if ((v25 & 0x100000) == 0) {
      goto LABEL_233;
    }
    if (self->_isGroupedArticle)
    {
      if (!*((unsigned char *)v4 + 381)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 381))
    {
      goto LABEL_233;
    }
  }
  else if ((v25 & 0x100000) != 0)
  {
    goto LABEL_233;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_233;
    }
    $969F66802EEB540360E160052BF188A2 v24 = self->_has;
  }
  int v27 = *((_DWORD *)v4 + 97);
  if ((*(_WORD *)&v24 & 0x200) != 0)
  {
    if ((v27 & 0x200) == 0 || self->_groupType != *((_DWORD *)v4 + 40)) {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x200) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x400000) != 0)
  {
    if ((v27 & 0x400000) == 0) {
      goto LABEL_233;
    }
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((unsigned char *)v4 + 383)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 383))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x400000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x80000) != 0)
  {
    if ((v27 & 0x80000) == 0) {
      goto LABEL_233;
    }
    if (self->_isFreeArticle)
    {
      if (!*((unsigned char *)v4 + 380)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 380))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x80000) != 0)
  {
    goto LABEL_233;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 10)
    && !-[NSString isEqual:](campaignId, "isEqual:"))
  {
    goto LABEL_233;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_233;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $969F66802EEB540360E160052BF188A2 v31 = self->_has;
  int v32 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&v31 & 0x20000) != 0)
  {
    if ((v32 & 0x20000) == 0) {
      goto LABEL_233;
    }
    if (self->_isCoverArticle)
    {
      if (!*((unsigned char *)v4 + 378)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 378))
    {
      goto LABEL_233;
    }
  }
  else if ((v32 & 0x20000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v31 & 0x8000) != 0)
  {
    if ((v32 & 0x8000) == 0) {
      goto LABEL_233;
    }
    if (self->_fromNextArticleAffordanceTap)
    {
      if (!*((unsigned char *)v4 + 376)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 376))
    {
      goto LABEL_233;
    }
  }
  else if ((v32 & 0x8000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v31 & 0x800) != 0)
  {
    if ((v32 & 0x800) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 64)) {
      goto LABEL_233;
    }
  }
  else if ((v32 & 0x800) != 0)
  {
    goto LABEL_233;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:")) {
      goto LABEL_233;
    }
    $969F66802EEB540360E160052BF188A2 v31 = self->_has;
  }
  int v34 = *((_DWORD *)v4 + 97);
  if ((*(_DWORD *)&v31 & 0x10000) != 0)
  {
    if ((v34 & 0x10000) == 0) {
      goto LABEL_233;
    }
    if (self->_isBreakingNewsArticle)
    {
      if (!*((unsigned char *)v4 + 377)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 377))
    {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x10000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v31 & 0x2000) != 0)
  {
    if ((v34 & 0x2000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 86)) {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x2000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v31 & 0x1000000) != 0)
  {
    if ((v34 & 0x1000000) == 0) {
      goto LABEL_233;
    }
    if (self->_isTopStoryArticle)
    {
      if (!*((unsigned char *)v4 + 385)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 385))
    {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x1000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v31 & 0x800000) != 0)
  {
    if ((v34 & 0x800000) == 0) {
      goto LABEL_233;
    }
    if (self->_isSearchResultArticle)
    {
      if (!*((unsigned char *)v4 + 384)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 384))
    {
      goto LABEL_233;
    }
  }
  else if ((v34 & 0x800000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v31 & 0x200000) != 0)
  {
    if ((v34 & 0x200000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((unsigned char *)v4 + 382)) {
          goto LABEL_233;
        }
        goto LABEL_185;
      }
      if (!*((unsigned char *)v4 + 382)) {
        goto LABEL_185;
      }
    }
LABEL_233:
    char v53 = 0;
    goto LABEL_234;
  }
  if ((v34 & 0x200000) != 0) {
    goto LABEL_233;
  }
LABEL_185:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((void *)v4 + 31)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_233;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_233;
    }
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 46))
  {
    if (!-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:")) {
      goto LABEL_233;
    }
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 18))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $969F66802EEB540360E160052BF188A2 v40 = self->_has;
  int v41 = *((_DWORD *)v4 + 97);
  if ((*(unsigned char *)&v40 & 8) != 0)
  {
    if ((v41 & 8) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 4)) {
      goto LABEL_233;
    }
  }
  else if ((v41 & 8) != 0)
  {
    goto LABEL_233;
  }
  if (*(unsigned char *)&v40)
  {
    if ((v41 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_233;
    }
  }
  else if (v41)
  {
    goto LABEL_233;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 23)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_233;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 25))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_233;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 22))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v45 = *((_DWORD *)v4 + 97);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v45 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 3)) {
      goto LABEL_233;
    }
  }
  else if ((v45 & 4) != 0)
  {
    goto LABEL_233;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 24)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_233;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 21))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 26))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_233;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 27))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v50 = *((_DWORD *)v4 + 97);
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((v50 & 0x80) == 0 || self->_contentType != *((_DWORD *)v4 + 27)) {
      goto LABEL_233;
    }
  }
  else if ((v50 & 0x80) != 0)
  {
    goto LABEL_233;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 12) && !-[NTPBChannelData isEqual:](channelData, "isEqual:")) {
    goto LABEL_233;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 44)) {
    char v53 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  }
  else {
    char v53 = 1;
  }
LABEL_234:

  return v53;
}

- (unint64_t)hash
{
  p_$969F66802EEB540360E160052BF188A2 has = &self->_has;
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v69 = 2654435761 * self->_userAction;
  }
  else {
    uint64_t v69 = 0;
  }
  NSUInteger v68 = [(NSString *)self->_articleId hash];
  NSUInteger v67 = [(NSString *)self->_referencedArticleId hash];
  uint64_t v66 = [(NSData *)self->_articleSessionId hash];
  uint64_t v65 = [(NSData *)self->_articleViewingSessionId hash];
  NSUInteger v64 = [(NSString *)self->_sourceChannelId hash];
  if (*((unsigned char *)p_has + 1)) {
    uint64_t v63 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v63 = 0;
  }
  NSUInteger v62 = [(NSString *)self->_feedId hash];
  uint64_t v61 = [(NSData *)self->_feedViewExposureId hash];
  $969F66802EEB540360E160052BF188A2 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    uint64_t v60 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v59 = 0;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_13;
  }
  uint64_t v60 = 2654435761 * self->_isUserSubscribedToFeed;
  if ((*(_WORD *)&has & 0x400) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v59 = 2654435761 * self->_likeDislikeLocation;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v58 = 2654435761 * self->_articleType;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v58 = 0;
LABEL_14:
  uint64_t v57 = [(NSMutableArray *)self->_namedEntities hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v56 = 2654435761 * self->_characterCount;
  }
  else {
    uint64_t v56 = 0;
  }
  NSUInteger v55 = [(NSString *)self->_language hash];
  $969F66802EEB540360E160052BF188A2 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    uint64_t v54 = 2654435761 * self->_publisherArticleVersion;
    if ((*(unsigned char *)&v5 & 0x20) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v54 = 0;
    if ((*(unsigned char *)&v5 & 0x20) != 0)
    {
LABEL_19:
      uint64_t v53 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_22;
    }
  }
  uint64_t v53 = 0;
LABEL_22:
  NSUInteger v52 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v51 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v50 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v49 = [(NSString *)self->_sectionHeadlineId hash];
  $969F66802EEB540360E160052BF188A2 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
    uint64_t v48 = 0;
    if ((*(unsigned char *)&v6 & 2) != 0) {
      goto LABEL_24;
    }
LABEL_27:
    uint64_t v47 = 0;
    if ((*(_DWORD *)&v6 & 0x100000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  uint64_t v48 = 2654435761 * self->_isDigitalReplicaAd;
  if ((*(unsigned char *)&v6 & 2) == 0) {
    goto LABEL_27;
  }
LABEL_24:
  uint64_t v47 = 2654435761 * self->_personalizationTreatmentId;
  if ((*(_DWORD *)&v6 & 0x100000) != 0)
  {
LABEL_25:
    uint64_t v46 = 2654435761 * self->_isGroupedArticle;
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v46 = 0;
LABEL_29:
  NSUInteger v45 = [(NSString *)self->_groupFeedId hash];
  $969F66802EEB540360E160052BF188A2 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) == 0)
  {
    uint64_t v44 = 0;
    if ((*(_DWORD *)&v7 & 0x400000) != 0) {
      goto LABEL_31;
    }
LABEL_34:
    uint64_t v43 = 0;
    if ((*(_DWORD *)&v7 & 0x80000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_35;
  }
  uint64_t v44 = 2654435761 * self->_groupType;
  if ((*(_DWORD *)&v7 & 0x400000) == 0) {
    goto LABEL_34;
  }
LABEL_31:
  uint64_t v43 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  if ((*(_DWORD *)&v7 & 0x80000) != 0)
  {
LABEL_32:
    uint64_t v42 = 2654435761 * self->_isFreeArticle;
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v42 = 0;
LABEL_36:
  NSUInteger v41 = [(NSString *)self->_campaignId hash];
  NSUInteger v40 = [(NSString *)self->_campaignType hash];
  NSUInteger v39 = [(NSString *)self->_creativeId hash];
  $969F66802EEB540360E160052BF188A2 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
    uint64_t v38 = 0;
    if ((*(_WORD *)&v8 & 0x8000) != 0) {
      goto LABEL_38;
    }
LABEL_41:
    uint64_t v37 = 0;
    if ((*(_WORD *)&v8 & 0x800) != 0) {
      goto LABEL_39;
    }
    goto LABEL_42;
  }
  uint64_t v38 = 2654435761 * self->_isCoverArticle;
  if ((*(_WORD *)&v8 & 0x8000) == 0) {
    goto LABEL_41;
  }
LABEL_38:
  uint64_t v37 = 2654435761 * self->_fromNextArticleAffordanceTap;
  if ((*(_WORD *)&v8 & 0x800) != 0)
  {
LABEL_39:
    uint64_t v36 = 2654435761 * self->_nextArticleAffordanceType;
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v36 = 0;
LABEL_43:
  NSUInteger v35 = [(NSString *)self->_nextArticleAffordanceTypeFeedId hash];
  $969F66802EEB540360E160052BF188A2 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) != 0)
  {
    uint64_t v34 = 2654435761 * self->_isBreakingNewsArticle;
    if ((*(_WORD *)&v9 & 0x2000) != 0)
    {
LABEL_45:
      uint64_t v33 = 2654435761 * self->_topStoryType;
      if ((*(_DWORD *)&v9 & 0x1000000) != 0) {
        goto LABEL_46;
      }
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v34 = 0;
    if ((*(_WORD *)&v9 & 0x2000) != 0) {
      goto LABEL_45;
    }
  }
  uint64_t v33 = 0;
  if ((*(_DWORD *)&v9 & 0x1000000) != 0)
  {
LABEL_46:
    uint64_t v32 = 2654435761 * self->_isTopStoryArticle;
    if ((*(_DWORD *)&v9 & 0x800000) != 0) {
      goto LABEL_47;
    }
LABEL_52:
    uint64_t v31 = 0;
    if ((*(_DWORD *)&v9 & 0x200000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_53;
  }
LABEL_51:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&v9 & 0x800000) == 0) {
    goto LABEL_52;
  }
LABEL_47:
  uint64_t v31 = 2654435761 * self->_isSearchResultArticle;
  if ((*(_DWORD *)&v9 & 0x200000) != 0)
  {
LABEL_48:
    uint64_t v30 = 2654435761 * self->_isNativeAd;
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v30 = 0;
LABEL_54:
  NSUInteger v29 = [(NSString *)self->_nativeCampaignData hash];
  NSUInteger v28 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v27 = [(NSString *)self->_previousArticleVersion hash];
  unint64_t v26 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  uint64_t v25 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $969F66802EEB540360E160052BF188A2 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) != 0)
  {
    uint64_t v24 = 2654435761 * self->_publisherArticleVersionInt64;
    if (*(unsigned char *)&v10) {
      goto LABEL_56;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if (*(unsigned char *)&v10)
    {
LABEL_56:
      NSUInteger v11 = [(NSString *)self->_iadNativeCampaign hash];
      goto LABEL_59;
    }
  }
  NSUInteger v11 = [(NSString *)self->_iadNativeCampaign hash];
LABEL_59:
  NSUInteger v12 = v11;
  NSUInteger v13 = [(NSString *)self->_iadNativeLine hash];
  NSUInteger v14 = [(NSString *)self->_iadNativeAd hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v15 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v15 = 0;
  }
  NSUInteger v16 = [(NSString *)self->_iadNativeCampaignAd hash];
  uint64_t v17 = [(NSData *)self->_groupViewExposureId hash];
  unint64_t v18 = [(NTPBIssueData *)self->_issueData hash];
  unint64_t v19 = [(NTPBIssueExposureData *)self->_issueExposureData hash];
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    uint64_t v20 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v21 = v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ [(NTPBChannelData *)self->_channelData hash];
  return v68 ^ v69 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v12 ^ v21 ^ [(NSMutableArray *)self->_topicIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if ((*((unsigned char *)v4 + 389) & 0x40) != 0)
  {
    self->_userAction = v4[90];
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 5)) {
    -[NTPBArticleLikeDislike setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v5 + 37)) {
    -[NTPBArticleLikeDislike setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  if (*((void *)v5 + 6)) {
    -[NTPBArticleLikeDislike setArticleSessionId:](self, "setArticleSessionId:");
  }
  if (*((void *)v5 + 8)) {
    -[NTPBArticleLikeDislike setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if (*((void *)v5 + 39)) {
    -[NTPBArticleLikeDislike setSourceChannelId:](self, "setSourceChannelId:");
  }
  if (*((unsigned char *)v5 + 389))
  {
    self->_uint64_t feedType = *((_DWORD *)v5 + 32);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v5 + 15)) {
    -[NTPBArticleLikeDislike setFeedId:](self, "setFeedId:");
  }
  if (*((void *)v5 + 17)) {
    -[NTPBArticleLikeDislike setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  int v6 = *((_DWORD *)v5 + 97);
  if ((v6 & 0x2000000) != 0)
  {
    self->_isUserSubscribedToFeed = *((unsigned char *)v5 + 386);
    *(_DWORD *)&self->_has |= 0x2000000u;
    int v6 = *((_DWORD *)v5 + 97);
    if ((v6 & 0x400) == 0)
    {
LABEL_21:
      if ((v6 & 0x10) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x400) == 0)
  {
    goto LABEL_21;
  }
  self->_likeDislikeLocation = *((_DWORD *)v5 + 58);
  *(_DWORD *)&self->_has |= 0x400u;
  if ((*((_DWORD *)v5 + 97) & 0x10) != 0)
  {
LABEL_22:
    self->_uint64_t articleType = *((_DWORD *)v5 + 14);
    *(_DWORD *)&self->_has |= 0x10u;
  }
LABEL_23:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v7 = *((id *)v5 + 30);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v45 != v10) {
          objc_enumerationMutation(v7);
        }
        [(NTPBArticleLikeDislike *)self addNamedEntities:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)v5 + 388) & 0x40) != 0)
  {
    self->_characterCount = *((_DWORD *)v5 + 26);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v5 + 28)) {
    -[NTPBArticleLikeDislike setLanguage:](self, "setLanguage:");
  }
  int v12 = *((_DWORD *)v5 + 97);
  if ((v12 & 0x1000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v5 + 72);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v12 = *((_DWORD *)v5 + 97);
  }
  if ((v12 & 0x20) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v5 + 18);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((void *)v5 + 40)) {
    -[NTPBArticleLikeDislike setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v5 + 41)) {
    -[NTPBArticleLikeDislike setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v5 + 42)) {
    -[NTPBArticleLikeDislike setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v5 + 38)) {
    -[NTPBArticleLikeDislike setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  int v13 = *((_DWORD *)v5 + 97);
  if ((v13 & 0x40000) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v5 + 379);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v13 = *((_DWORD *)v5 + 97);
    if ((v13 & 2) == 0)
    {
LABEL_48:
      if ((v13 & 0x100000) == 0) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_48;
  }
  self->_personalizationTreatmentId = *((void *)v5 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v5 + 97) & 0x100000) != 0)
  {
LABEL_49:
    self->_isGroupedArticle = *((unsigned char *)v5 + 381);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_50:
  if (*((void *)v5 + 19)) {
    -[NTPBArticleLikeDislike setGroupFeedId:](self, "setGroupFeedId:");
  }
  int v14 = *((_DWORD *)v5 + 97);
  if ((v14 & 0x200) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v5 + 40);
    *(_DWORD *)&self->_has |= 0x200u;
    int v14 = *((_DWORD *)v5 + 97);
    if ((v14 & 0x400000) == 0)
    {
LABEL_54:
      if ((v14 & 0x80000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_55;
    }
  }
  else if ((v14 & 0x400000) == 0)
  {
    goto LABEL_54;
  }
  self->_isPaidSubscriberToSourceChannel = *((unsigned char *)v5 + 383);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v5 + 97) & 0x80000) != 0)
  {
LABEL_55:
    self->_isFreeArticle = *((unsigned char *)v5 + 380);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_56:
  if (*((void *)v5 + 10)) {
    -[NTPBArticleLikeDislike setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v5 + 11)) {
    -[NTPBArticleLikeDislike setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v5 + 14)) {
    -[NTPBArticleLikeDislike setCreativeId:](self, "setCreativeId:");
  }
  int v15 = *((_DWORD *)v5 + 97);
  if ((v15 & 0x20000) != 0)
  {
    self->_isCoverArticle = *((unsigned char *)v5 + 378);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v15 = *((_DWORD *)v5 + 97);
    if ((v15 & 0x8000) == 0)
    {
LABEL_64:
      if ((v15 & 0x800) == 0) {
        goto LABEL_66;
      }
      goto LABEL_65;
    }
  }
  else if ((v15 & 0x8000) == 0)
  {
    goto LABEL_64;
  }
  self->_fromNextArticleAffordanceTap = *((unsigned char *)v5 + 376);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v5 + 97) & 0x800) != 0)
  {
LABEL_65:
    self->_uint64_t nextArticleAffordanceType = *((_DWORD *)v5 + 64);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_66:
  if (*((void *)v5 + 33)) {
    -[NTPBArticleLikeDislike setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  }
  int v16 = *((_DWORD *)v5 + 97);
  if ((v16 & 0x10000) != 0)
  {
    self->_isBreakingNewsArticle = *((unsigned char *)v5 + 377);
    *(_DWORD *)&self->_has |= 0x10000u;
    int v16 = *((_DWORD *)v5 + 97);
    if ((v16 & 0x2000) == 0)
    {
LABEL_70:
      if ((v16 & 0x1000000) == 0) {
        goto LABEL_71;
      }
      goto LABEL_97;
    }
  }
  else if ((v16 & 0x2000) == 0)
  {
    goto LABEL_70;
  }
  self->_uint64_t topStoryType = *((_DWORD *)v5 + 86);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v16 = *((_DWORD *)v5 + 97);
  if ((v16 & 0x1000000) == 0)
  {
LABEL_71:
    if ((v16 & 0x800000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_isTopStoryArticle = *((unsigned char *)v5 + 385);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v16 = *((_DWORD *)v5 + 97);
  if ((v16 & 0x800000) == 0)
  {
LABEL_72:
    if ((v16 & 0x200000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_73;
  }
LABEL_98:
  self->_isSearchResultArticle = *((unsigned char *)v5 + 384);
  *(_DWORD *)&self->_has |= 0x800000u;
  if ((*((_DWORD *)v5 + 97) & 0x200000) != 0)
  {
LABEL_73:
    self->_isNativeAd = *((unsigned char *)v5 + 382);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_74:
  if (*((void *)v5 + 31)) {
    -[NTPBArticleLikeDislike setNativeCampaignData:](self, "setNativeCampaignData:");
  }
  if (*((void *)v5 + 34)) {
    -[NTPBArticleLikeDislike setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v5 + 35)) {
    -[NTPBArticleLikeDislike setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  widgetEngagement = self->_widgetEngagement;
  uint64_t v18 = *((void *)v5 + 46);
  if (widgetEngagement)
  {
    if (v18) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[NTPBArticleLikeDislike setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v19 = *((id *)v5 + 18);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v19);
        }
        [(NTPBArticleLikeDislike *)self addFractionalCohortMembership:*(void *)(*((void *)&v40 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v21);
  }

  int v24 = *((_DWORD *)v5 + 97);
  if ((v24 & 8) != 0)
  {
    self->_publisherArticleVersionInt64 = *((void *)v5 + 4);
    *(_DWORD *)&self->_has |= 8u;
    int v24 = *((_DWORD *)v5 + 97);
  }
  if (v24)
  {
    self->_backendArticleVersionInt64 = *((void *)v5 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v5 + 23)) {
    -[NTPBArticleLikeDislike setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v5 + 25)) {
    -[NTPBArticleLikeDislike setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v5 + 22)) {
    -[NTPBArticleLikeDislike setIadNativeAd:](self, "setIadNativeAd:");
  }
  if ((*((unsigned char *)v5 + 388) & 4) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v5 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)v5 + 24)) {
    -[NTPBArticleLikeDislike setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  if (*((void *)v5 + 21)) {
    -[NTPBArticleLikeDislike setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  issueData = self->_issueData;
  uint64_t v26 = *((void *)v5 + 26);
  if (issueData)
  {
    if (v26) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBArticleLikeDislike setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v28 = *((void *)v5 + 27);
  if (issueExposureData)
  {
    if (v28) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v28)
  {
    -[NTPBArticleLikeDislike setIssueExposureData:](self, "setIssueExposureData:");
  }
  if ((*((unsigned char *)v5 + 388) & 0x80) != 0)
  {
    self->_uint64_t contentType = *((_DWORD *)v5 + 27);
    *(_DWORD *)&self->_has |= 0x80u;
  }
  channelData = self->_channelData;
  uint64_t v30 = *((void *)v5 + 12);
  if (channelData)
  {
    if (v30) {
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[NTPBArticleLikeDislike setChannelData:](self, "setChannelData:");
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v31 = *((id *)v5 + 44);
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
        -[NTPBArticleLikeDislike addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v36 + 1) + 8 * k), (void)v36);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v33);
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

- (int)publisherArticleVersion
{
  return self->_publisherArticleVersion;
}

- (int)backendArticleVersion
{
  return self->_backendArticleVersion;
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

- (BOOL)isSearchResultArticle
{
  return self->_isSearchResultArticle;
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
  objc_storeStrong((id *)&self->_nextArticleAffordanceTypeFeedId, 0);
  objc_storeStrong((id *)&self->_nativeCampaignData, 0);
  objc_storeStrong((id *)&self->_namedEntities, 0);
  objc_storeStrong((id *)&self->_language, 0);
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
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
  objc_storeStrong((id *)&self->_articleSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end