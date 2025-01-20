@interface NTPBReadingListAddRemove
+ (Class)fractionalCohortMembershipType;
+ (Class)namedEntitiesType;
+ (Class)topicIdsType;
- (BOOL)fromNextArticleAffordanceTap;
- (BOOL)hasAddRemoveReadingListLocation;
- (BOOL)hasArticleId;
- (BOOL)hasArticleType;
- (BOOL)hasBackendArticleVersion;
- (BOOL)hasBackendArticleVersionInt64;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasChannelData;
- (BOOL)hasCharacterCount;
- (BOOL)hasContentType;
- (BOOL)hasCreativeId;
- (BOOL)hasFeedType;
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
- (BOOL)hasIsNotificationArticle;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIsSearchResultArticle;
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
- (BOOL)hasSectionHeadlineId;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasSurfacedBySectionId;
- (BOOL)hasSurfacedByTopicId;
- (BOOL)hasTopStoryType;
- (BOOL)hasUserAction;
- (BOOL)isBreakingNewsArticle;
- (BOOL)isCoverArticle;
- (BOOL)isDigitalReplicaAd;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeArticle;
- (BOOL)isGroupedArticle;
- (BOOL)isNativeAd;
- (BOOL)isNotificationArticle;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)isSearchResultArticle;
- (BOOL)isTopStoryArticle;
- (BOOL)isUserSubscribedToFeed;
- (BOOL)readFrom:(id)a3;
- (NSData)groupViewExposureId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSMutableArray)namedEntities;
- (NSMutableArray)topicIds;
- (NSString)articleId;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)groupFeedId;
- (NSString)iadNativeAd;
- (NSString)iadNativeCampaign;
- (NSString)iadNativeCampaignAd;
- (NSString)iadNativeLine;
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
- (int)addRemoveReadingListLocation;
- (int)articleType;
- (int)backendArticleVersion;
- (int)characterCount;
- (int)contentType;
- (int)feedType;
- (int)groupType;
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
- (void)setAddRemoveReadingListLocation:(int)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleType:(int)a3;
- (void)setBackendArticleVersion:(int)a3;
- (void)setBackendArticleVersionInt64:(int64_t)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelData:(id)a3;
- (void)setCharacterCount:(int)a3;
- (void)setContentType:(int)a3;
- (void)setCreativeId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setFromNextArticleAffordanceTap:(BOOL)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasAddRemoveReadingListLocation:(BOOL)a3;
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
- (void)setHasIsSearchResultArticle:(BOOL)a3;
- (void)setHasIsTopStoryArticle:(BOOL)a3;
- (void)setHasIsUserSubscribedToFeed:(BOOL)a3;
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
- (void)setIsNotificationArticle:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIsSearchResultArticle:(BOOL)a3;
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
- (void)setSectionHeadlineId:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setSurfacedBySectionId:(id)a3;
- (void)setSurfacedByTopicId:(id)a3;
- (void)setTopStoryType:(int)a3;
- (void)setTopicIds:(id)a3;
- (void)setUserAction:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBReadingListAddRemove

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasReferencedArticleId
{
  return self->_referencedArticleId != 0;
}

- (int)addRemoveReadingListLocation
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_addRemoveReadingListLocation;
  }
  else {
    return 0;
  }
}

- (void)setAddRemoveReadingListLocation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_addRemoveReadingListLocation = a3;
}

- (void)setHasAddRemoveReadingListLocation:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAddRemoveReadingListLocation
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIsUserSubscribedToFeed:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_isUserSubscribedToFeed = a3;
}

- (void)setHasIsUserSubscribedToFeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasIsUserSubscribedToFeed
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (int)articleType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_articleType;
  }
  else {
    return 0;
  }
}

- (void)setArticleType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_articleType = a3;
}

- (void)setHasArticleType:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasArticleType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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
    int v3 = off_26444EA88[a3];
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

- (void)setCharacterCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_characterCount = a3;
}

- (void)setHasCharacterCount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCharacterCount
{
  return *(unsigned char *)&self->_has >> 7;
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasPublisherArticleVersion
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBackendArticleVersion:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_backendArticleVersion = a3;
}

- (void)setHasBackendArticleVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBackendArticleVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasSectionHeadlineId
{
  return self->_sectionHeadlineId != 0;
}

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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
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

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasIsDigitalReplicaAd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
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
    int v3 = off_26444EAB8[a3];
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
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

- (void)setIsNotificationArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_isNotificationArticle = a3;
}

- (void)setHasIsNotificationArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasIsNotificationArticle
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
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
    int v3 = off_26444EB68[a3];
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
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
    int v3 = off_26444EBE8[a3];
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
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
    int v3 = off_26444ED28[a3];
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
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_isTopStoryArticle = a3;
}

- (void)setHasIsTopStoryArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasIsTopStoryArticle
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setIsSearchResultArticle:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_isSearchResultArticle = a3;
}

- (void)setHasIsSearchResultArticle:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsSearchResultArticle
{
  return *((unsigned char *)&self->_has + 3) & 1;
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
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
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
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
  if (*((unsigned char *)&self->_has + 1)) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

- (void)setContentType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_contentType = a3;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C9B7FD5E0B9E0FA722DEF41791BB63AA)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasContentType
{
  return *((unsigned char *)&self->_has + 1) & 1;
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
    int v3 = off_26444ED40[a3];
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
  v8.super_class = (Class)NTPBReadingListAddRemove;
  id v4 = [(NTPBReadingListAddRemove *)&v8 description];
  v5 = [(NTPBReadingListAddRemove *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v88 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  referencedArticleId = self->_referencedArticleId;
  if (referencedArticleId) {
    [v4 setObject:referencedArticleId forKey:@"referenced_article_id"];
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_addRemoveReadingListLocation];
    [v4 setObject:v28 forKey:@"add_remove_reading_list_location"];

    $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_52;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  v29 = [NSNumber numberWithBool:self->_isUserSubscribedToFeed];
  [v4 setObject:v29 forKey:@"is_user_subscribed_to_feed"];

  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_52:
  uint64_t articleType = self->_articleType;
  if (articleType >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_articleType);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = off_26444EA88[articleType];
  }
  [v4 setObject:v31 forKey:@"article_type"];

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_9:
    objc_super v8 = [NSNumber numberWithInt:self->_characterCount];
    [v4 setObject:v8 forKey:@"character_count"];
  }
LABEL_10:
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  namedEntities = self->_namedEntities;
  if (namedEntities) {
    [v4 setObject:namedEntities forKey:@"named_entities"];
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_publisherArticleVersion];
    [v4 setObject:v12 forKey:@"publisher_article_version"];

    $C9B7FD5E0B9E0FA722DEF41791BB63AA v11 = self->_has;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_backendArticleVersion];
    [v4 setObject:v13 forKey:@"backend_article_version"];
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if (sectionHeadlineId) {
    [v4 setObject:sectionHeadlineId forKey:@"section_headline_id"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_userAction];
    [v4 setObject:v15 forKey:@"user_action"];
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId) {
    [v4 setObject:surfacedByChannelId forKey:@"surfaced_by_channel_id"];
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if (surfacedBySectionId) {
    [v4 setObject:surfacedBySectionId forKey:@"surfaced_by_section_id"];
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if (surfacedByTopicId) {
    [v4 setObject:surfacedByTopicId forKey:@"surfaced_by_topic_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v4 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_isDigitalReplicaAd];
    [v4 setObject:v32 forKey:@"is_digital_replica_ad"];

    $C9B7FD5E0B9E0FA722DEF41791BB63AA v20 = self->_has;
    if ((*(_WORD *)&v20 & 0x200) == 0)
    {
LABEL_32:
      if ((*(unsigned char *)&v20 & 2) == 0) {
        goto LABEL_33;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_WORD *)&v20 & 0x200) == 0)
  {
    goto LABEL_32;
  }
  uint64_t feedType = self->_feedType;
  if (feedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v34 = off_26444EAB8[feedType];
  }
  [v4 setObject:v34 forKey:@"feed_type"];

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v20 = self->_has;
  if ((*(unsigned char *)&v20 & 2) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v20 & 0x80000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_67:
  v40 = [NSNumber numberWithLongLong:self->_personalizationTreatmentId];
  [v4 setObject:v40 forKey:@"personalization_treatment_id"];

  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_34:
    v21 = [NSNumber numberWithBool:self->_isFreeArticle];
    [v4 setObject:v21 forKey:@"is_free_article"];
  }
LABEL_35:
  campaignId = self->_campaignId;
  if (campaignId) {
    [v4 setObject:campaignId forKey:@"campaign_id"];
  }
  campaignType = self->_campaignType;
  if (campaignType) {
    [v4 setObject:campaignType forKey:@"campaign_type"];
  }
  creativeId = self->_creativeId;
  if (creativeId) {
    [v4 setObject:creativeId forKey:@"creative_id"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    v25 = [NSNumber numberWithBool:self->_isNotificationArticle];
    [v4 setObject:v25 forKey:@"is_notification_article"];
  }
  notificationId = self->_notificationId;
  if (notificationId) {
    [v4 setObject:notificationId forKey:@"notification_id"];
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v27 = self->_has;
  if ((*(_DWORD *)&v27 & 0x800000) != 0)
  {
    v35 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
    [v4 setObject:v35 forKey:@"is_paid_subscriber_to_source_channel"];

    $C9B7FD5E0B9E0FA722DEF41791BB63AA v27 = self->_has;
    if ((*(_DWORD *)&v27 & 0x20000) == 0)
    {
LABEL_47:
      if ((*(_WORD *)&v27 & 0x8000) == 0) {
        goto LABEL_48;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v27 & 0x20000) == 0)
  {
    goto LABEL_47;
  }
  v36 = [NSNumber numberWithBool:self->_isCoverArticle];
  [v4 setObject:v36 forKey:@"is_cover_article"];

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v27 = self->_has;
  if ((*(_WORD *)&v27 & 0x8000) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v27 & 0x800) == 0) {
      goto LABEL_71;
    }
    goto LABEL_60;
  }
LABEL_59:
  v37 = [NSNumber numberWithBool:self->_fromNextArticleAffordanceTap];
  [v4 setObject:v37 forKey:@"from_next_article_affordance_tap"];

  if ((*(_DWORD *)&self->_has & 0x800) == 0) {
    goto LABEL_71;
  }
LABEL_60:
  uint64_t nextArticleAffordanceType = self->_nextArticleAffordanceType;
  if (nextArticleAffordanceType >= 0x10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_nextArticleAffordanceType);
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = off_26444EB68[nextArticleAffordanceType];
  }
  [v4 setObject:v39 forKey:@"next_article_affordance_type"];

LABEL_71:
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if (nextArticleAffordanceTypeFeedId) {
    [v4 setObject:nextArticleAffordanceTypeFeedId forKey:@"next_article_affordance_type_feed_id"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    v42 = [NSNumber numberWithBool:self->_isGroupedArticle];
    [v4 setObject:v42 forKey:@"is_grouped_article"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v4 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x400) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = off_26444EBE8[groupType];
    }
    [v4 setObject:v72 forKey:@"group_type"];

    $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
    if ((*(_DWORD *)&v44 & 0x10000) == 0)
    {
LABEL_79:
      if ((*(_WORD *)&v44 & 0x2000) == 0) {
        goto LABEL_80;
      }
      goto LABEL_134;
    }
  }
  else if ((*(_DWORD *)&v44 & 0x10000) == 0)
  {
    goto LABEL_79;
  }
  v78 = [NSNumber numberWithBool:self->_isBreakingNewsArticle];
  [v4 setObject:v78 forKey:@"is_breaking_news_article"];

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x2000) == 0)
  {
LABEL_80:
    if ((*(_DWORD *)&v44 & 0x2000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_138;
  }
LABEL_134:
  uint64_t topStoryType = self->_topStoryType;
  if (topStoryType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_topStoryType);
    v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v80 = off_26444ED28[topStoryType];
  }
  [v4 setObject:v80 forKey:@"top_story_type"];

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x2000000) == 0)
  {
LABEL_81:
    if ((*(_DWORD *)&v44 & 0x1000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_139;
  }
LABEL_138:
  v81 = [NSNumber numberWithBool:self->_isTopStoryArticle];
  [v4 setObject:v81 forKey:@"is_top_story_article"];

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x1000000) == 0)
  {
LABEL_82:
    if ((*(_DWORD *)&v44 & 0x200000) == 0) {
      goto LABEL_84;
    }
    goto LABEL_83;
  }
LABEL_139:
  v82 = [NSNumber numberWithBool:self->_isSearchResultArticle];
  [v4 setObject:v82 forKey:@"is_search_result_article"];

  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_83:
    v45 = [NSNumber numberWithBool:self->_isNativeAd];
    [v4 setObject:v45 forKey:@"is_native_ad"];
  }
LABEL_84:
  nativeCampaignData = self->_nativeCampaignData;
  if (nativeCampaignData) {
    [v4 setObject:nativeCampaignData forKey:@"native_campaign_data"];
  }
  previousArticleId = self->_previousArticleId;
  if (previousArticleId) {
    [v4 setObject:previousArticleId forKey:@"previous_article_id"];
  }
  previousArticleVersion = self->_previousArticleVersion;
  if (previousArticleVersion) {
    [v4 setObject:previousArticleVersion forKey:@"previous_article_version"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v49 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    v50 = self->_fractionalCohortMemberships;
    uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v83 objects:v87 count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v84 != v53) {
            objc_enumerationMutation(v50);
          }
          v55 = [*(id *)(*((void *)&v83 + 1) + 8 * i) dictionaryRepresentation];
          [v49 addObject:v55];
        }
        uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v83 objects:v87 count:16];
      }
      while (v52);
    }

    [v4 setObject:v49 forKey:@"fractional_cohort_membership"];
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v56 = self->_has;
  if ((*(unsigned char *)&v56 & 8) != 0)
  {
    v57 = [NSNumber numberWithLongLong:self->_publisherArticleVersionInt64];
    [v4 setObject:v57 forKey:@"publisher_article_version_int64"];

    $C9B7FD5E0B9E0FA722DEF41791BB63AA v56 = self->_has;
  }
  if (*(unsigned char *)&v56)
  {
    v58 = [NSNumber numberWithLongLong:self->_backendArticleVersionInt64];
    [v4 setObject:v58 forKey:@"backend_article_version_int64"];
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if (iadNativeCampaign) {
    [v4 setObject:iadNativeCampaign forKey:@"iad_native_campaign"];
  }
  iadNativeLine = self->_iadNativeLine;
  if (iadNativeLine) {
    [v4 setObject:iadNativeLine forKey:@"iad_native_line"];
  }
  iadNativeAd = self->_iadNativeAd;
  if (iadNativeAd) {
    [v4 setObject:iadNativeAd forKey:@"iad_native_ad"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v62 = [NSNumber numberWithLongLong:self->_previousArticlePublisherArticleVersion];
    [v4 setObject:v62 forKey:@"previous_article_publisher_article_version"];
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if (iadNativeCampaignAd) {
    [v4 setObject:iadNativeCampaignAd forKey:@"iad_native_campaign_ad"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v4 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v66 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v4 setObject:v66 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v68 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v4 setObject:v68 forKey:@"issue_exposure_data"];
  }
  if (*((unsigned char *)&self->_has + 1))
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_contentType);
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v70 = off_26444ED40[contentType];
    }
    [v4 setObject:v70 forKey:@"content_type"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v74 = [(NTPBChannelData *)channelData dictionaryRepresentation];
    [v4 setObject:v74 forKey:@"channel_data"];
  }
  topicIds = self->_topicIds;
  if (topicIds) {
    [v4 setObject:topicIds forKey:@"topic_ids"];
  }
  id v76 = v4;

  return v76;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBReadingListAddRemoveReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_referencedArticleId) {
    PBDataWriterWriteStringField();
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_7:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_115;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_115:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v6 = self->_namedEntities;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteStringField();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v8);
  }

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v11 = self->_has;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_sectionHeadlineId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
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
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x40000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v12 = self->_has;
    if ((*(_WORD *)&v12 & 0x200) == 0)
    {
LABEL_37:
      if ((*(unsigned char *)&v12 & 2) == 0) {
        goto LABEL_38;
      }
      goto LABEL_119;
    }
  }
  else if ((*(_WORD *)&v12 & 0x200) == 0)
  {
    goto LABEL_37;
  }
  PBDataWriterWriteInt32Field();
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v12 = self->_has;
  if ((*(unsigned char *)&v12 & 2) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v12 & 0x80000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_119:
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80000) != 0) {
LABEL_39:
  }
    PBDataWriterWriteBOOLField();
LABEL_40:
  if (self->_campaignId) {
    PBDataWriterWriteStringField();
  }
  if (self->_campaignType) {
    PBDataWriterWriteStringField();
  }
  if (self->_creativeId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_notificationId) {
    PBDataWriterWriteStringField();
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x20000) == 0)
    {
LABEL_52:
      if ((*(_WORD *)&v13 & 0x8000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_123;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteBOOLField();
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v13 & 0x800) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_123:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x800) != 0) {
LABEL_54:
  }
    PBDataWriterWriteInt32Field();
LABEL_55:
  if (self->_nextArticleAffordanceTypeFeedId) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field();
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
    {
LABEL_63:
      if ((*(_WORD *)&v14 & 0x2000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_127;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x10000) == 0)
  {
    goto LABEL_63;
  }
  PBDataWriterWriteBOOLField();
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_64:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteInt32Field();
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteBOOLField();
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v14 & 0x200000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_129:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x200000) != 0) {
LABEL_67:
  }
    PBDataWriterWriteBOOLField();
LABEL_68:
  if (self->_nativeCampaignData) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_previousArticleVersion) {
    PBDataWriterWriteStringField();
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v15 = self->_fractionalCohortMemberships;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v17);
  }

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v20 = self->_has;
  if ((*(unsigned char *)&v20 & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v20 = self->_has;
  }
  if (*(unsigned char *)&v20) {
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
  if (*((unsigned char *)&self->_has + 1)) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_channelData) {
    PBDataWriterWriteSubmessage();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v21 = self->_topicIds;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v23);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  uint64_t v8 = [(NSString *)self->_referencedArticleId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 264);
  *(void *)(v5 + 264) = v8;

  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_addRemoveReadingListLocation;
    *(_DWORD *)(v5 + 344) |= 0x10u;
    $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
    if ((*(_DWORD *)&has & 0x4000000) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 343) = self->_isUserSubscribedToFeed;
  *(_DWORD *)(v5 + 344) |= 0x4000000u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_65:
  *(_DWORD *)(v5 + 56) = self->_articleType;
  *(_DWORD *)(v5 + 344) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 88) = self->_characterCount;
    *(_DWORD *)(v5 + 344) |= 0x80u;
  }
LABEL_6:
  uint64_t v11 = [(NSString *)self->_language copyWithZone:a3];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v12 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v11;

  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v13 = self->_namedEntities;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v89 objects:v95 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v90;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v90 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * v17) copyWithZone:a3];
        [(id)v5 addNamedEntities:v18];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v89 objects:v95 count:16];
    }
    while (v15);
  }

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 256) = self->_publisherArticleVersion;
    *(_DWORD *)(v5 + 344) |= 0x1000u;
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v19 = self->_has;
  }
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_backendArticleVersion;
    *(_DWORD *)(v5 + 344) |= 0x40u;
  }
  uint64_t v20 = [(NSString *)self->_sectionHeadlineId copyWithZone:a3];
  v21 = *(void **)(v5 + 272);
  *(void *)(v5 + 272) = v20;

  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 328) = self->_userAction;
    *(_DWORD *)(v5 + 344) |= 0x4000u;
  }
  uint64_t v22 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  uint64_t v23 = *(void **)(v5 + 288);
  *(void *)(v5 + 288) = v22;

  uint64_t v24 = [(NSString *)self->_surfacedBySectionId copyWithZone:a3];
  uint64_t v25 = *(void **)(v5 + 296);
  *(void *)(v5 + 296) = v24;

  uint64_t v26 = [(NSString *)self->_surfacedByTopicId copyWithZone:a3];
  long long v27 = *(void **)(v5 + 304);
  *(void *)(v5 + 304) = v26;

  uint64_t v28 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  long long v29 = *(void **)(v5 + 280);
  *(void *)(v5 + 280) = v28;

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v30 = self->_has;
  if ((*(_DWORD *)&v30 & 0x40000) != 0)
  {
    *(unsigned char *)(v5 + 335) = self->_isDigitalReplicaAd;
    *(_DWORD *)(v5 + 344) |= 0x40000u;
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v30 = self->_has;
    if ((*(_WORD *)&v30 & 0x200) == 0)
    {
LABEL_21:
      if ((*(unsigned char *)&v30 & 2) == 0) {
        goto LABEL_22;
      }
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v30 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  *(_DWORD *)(v5 + 104) = self->_feedType;
  *(_DWORD *)(v5 + 344) |= 0x200u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v30 = self->_has;
  if ((*(unsigned char *)&v30 & 2) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v30 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_69:
  *(void *)(v5 + 16) = self->_personalizationTreatmentId;
  *(_DWORD *)(v5 + 344) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_23:
    *(unsigned char *)(v5 + 336) = self->_isFreeArticle;
    *(_DWORD *)(v5 + 344) |= 0x80000u;
  }
LABEL_24:
  uint64_t v31 = [(NSString *)self->_campaignId copyWithZone:a3];
  long long v32 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v31;

  uint64_t v33 = [(NSString *)self->_campaignType copyWithZone:a3];
  long long v34 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v33;

  uint64_t v35 = [(NSString *)self->_creativeId copyWithZone:a3];
  long long v36 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v35;

  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 339) = self->_isNotificationArticle;
    *(_DWORD *)(v5 + 344) |= 0x400000u;
  }
  uint64_t v37 = [(NSString *)self->_notificationId copyWithZone:a3];
  v38 = *(void **)(v5 + 232);
  *(void *)(v5 + 232) = v37;

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v39 = self->_has;
  if ((*(_DWORD *)&v39 & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 340) = self->_isPaidSubscriberToSourceChannel;
    *(_DWORD *)(v5 + 344) |= 0x800000u;
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v39 = self->_has;
    if ((*(_DWORD *)&v39 & 0x20000) == 0)
    {
LABEL_28:
      if ((*(_WORD *)&v39 & 0x8000) == 0) {
        goto LABEL_29;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v39 & 0x20000) == 0)
  {
    goto LABEL_28;
  }
  *(unsigned char *)(v5 + 334) = self->_isCoverArticle;
  *(_DWORD *)(v5 + 344) |= 0x20000u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v39 = self->_has;
  if ((*(_WORD *)&v39 & 0x8000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v39 & 0x800) == 0) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
LABEL_73:
  *(unsigned char *)(v5 + 332) = self->_fromNextArticleAffordanceTap;
  *(_DWORD *)(v5 + 344) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x800) != 0)
  {
LABEL_30:
    *(_DWORD *)(v5 + 216) = self->_nextArticleAffordanceType;
    *(_DWORD *)(v5 + 344) |= 0x800u;
  }
LABEL_31:
  uint64_t v40 = [(NSString *)self->_nextArticleAffordanceTypeFeedId copyWithZone:a3];
  uint64_t v41 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v40;

  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 337) = self->_isGroupedArticle;
    *(_DWORD *)(v5 + 344) |= 0x100000u;
  }
  uint64_t v42 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  v43 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v42;

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_groupType;
    *(_DWORD *)(v5 + 344) |= 0x400u;
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
    if ((*(_DWORD *)&v44 & 0x10000) == 0)
    {
LABEL_35:
      if ((*(_WORD *)&v44 & 0x2000) == 0) {
        goto LABEL_36;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_DWORD *)&v44 & 0x10000) == 0)
  {
    goto LABEL_35;
  }
  *(unsigned char *)(v5 + 333) = self->_isBreakingNewsArticle;
  *(_DWORD *)(v5 + 344) |= 0x10000u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_WORD *)&v44 & 0x2000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v44 & 0x2000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 312) = self->_topStoryType;
  *(_DWORD *)(v5 + 344) |= 0x2000u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x2000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v44 & 0x1000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(unsigned char *)(v5 + 342) = self->_isTopStoryArticle;
  *(_DWORD *)(v5 + 344) |= 0x2000000u;
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v44 = self->_has;
  if ((*(_DWORD *)&v44 & 0x1000000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v44 & 0x200000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_79:
  *(unsigned char *)(v5 + 341) = self->_isSearchResultArticle;
  *(_DWORD *)(v5 + 344) |= 0x1000000u;
  if ((*(_DWORD *)&self->_has & 0x200000) != 0)
  {
LABEL_39:
    *(unsigned char *)(v5 + 338) = self->_isNativeAd;
    *(_DWORD *)(v5 + 344) |= 0x200000u;
  }
LABEL_40:
  uint64_t v45 = [(NSString *)self->_nativeCampaignData copyWithZone:a3];
  v46 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v45;

  uint64_t v47 = [(NSString *)self->_previousArticleId copyWithZone:a3];
  v48 = *(void **)(v5 + 240);
  *(void *)(v5 + 240) = v47;

  uint64_t v49 = [(NSString *)self->_previousArticleVersion copyWithZone:a3];
  v50 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v49;

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v51 = self->_fractionalCohortMemberships;
  uint64_t v52 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v85 objects:v94 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v86;
    do
    {
      uint64_t v55 = 0;
      do
      {
        if (*(void *)v86 != v54) {
          objc_enumerationMutation(v51);
        }
        $C9B7FD5E0B9E0FA722DEF41791BB63AA v56 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * v55) copyWithZone:a3];
        [(id)v5 addFractionalCohortMembership:v56];

        ++v55;
      }
      while (v53 != v55);
      uint64_t v53 = [(NSMutableArray *)v51 countByEnumeratingWithState:&v85 objects:v94 count:16];
    }
    while (v53);
  }

  $C9B7FD5E0B9E0FA722DEF41791BB63AA v57 = self->_has;
  if ((*(unsigned char *)&v57 & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_publisherArticleVersionInt64;
    *(_DWORD *)(v5 + 344) |= 8u;
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v57 = self->_has;
  }
  if (*(unsigned char *)&v57)
  {
    *(void *)(v5 + 8) = self->_backendArticleVersionInt64;
    *(_DWORD *)(v5 + 344) |= 1u;
  }
  uint64_t v58 = [(NSString *)self->_iadNativeCampaign copyWithZone:a3];
  v59 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v58;

  uint64_t v60 = [(NSString *)self->_iadNativeLine copyWithZone:a3];
  v61 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v60;

  uint64_t v62 = [(NSString *)self->_iadNativeAd copyWithZone:a3];
  v63 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v62;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_previousArticlePublisherArticleVersion;
    *(_DWORD *)(v5 + 344) |= 4u;
  }
  uint64_t v64 = [(NSString *)self->_iadNativeCampaignAd copyWithZone:a3];
  v65 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v64;

  uint64_t v66 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v67 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v66;

  id v68 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v69 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v68;

  id v70 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  v71 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v70;

  if (*((unsigned char *)&self->_has + 1))
  {
    *(_DWORD *)(v5 + 92) = self->_contentType;
    *(_DWORD *)(v5 + 344) |= 0x100u;
  }
  id v72 = [(NTPBChannelData *)self->_channelData copyWithZone:a3];
  v73 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v72;

  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v74 = self->_topicIds;
  uint64_t v75 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v81 objects:v93 count:16];
  if (v75)
  {
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v82;
    do
    {
      uint64_t v78 = 0;
      do
      {
        if (*(void *)v82 != v77) {
          objc_enumerationMutation(v74);
        }
        v79 = objc_msgSend(*(id *)(*((void *)&v81 + 1) + 8 * v78), "copyWithZone:", a3, (void)v81);
        [(id)v5 addTopicIds:v79];

        ++v78;
      }
      while (v76 != v78);
      uint64_t v76 = [(NSMutableArray *)v74 countByEnumeratingWithState:&v81 objects:v93 count:16];
    }
    while (v76);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_233;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  referencedArticleId = self->_referencedArticleId;
  if ((unint64_t)referencedArticleId | *((void *)v4 + 33))
  {
    if (!-[NSString isEqual:](referencedArticleId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  int v8 = *((_DWORD *)v4 + 86);
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_addRemoveReadingListLocation != *((_DWORD *)v4 + 10)) {
      goto LABEL_233;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0) {
      goto LABEL_233;
    }
    if (self->_isUserSubscribedToFeed)
    {
      if (!*((unsigned char *)v4 + 343)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 343))
    {
      goto LABEL_233;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_articleType != *((_DWORD *)v4 + 14)) {
      goto LABEL_233;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_characterCount != *((_DWORD *)v4 + 22)) {
      goto LABEL_233;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_233;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 24) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_233;
  }
  namedEntities = self->_namedEntities;
  if ((unint64_t)namedEntities | *((void *)v4 + 25))
  {
    if (!-[NSMutableArray isEqual:](namedEntities, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 86);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_publisherArticleVersion != *((_DWORD *)v4 + 64)) {
      goto LABEL_233;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_backendArticleVersion != *((_DWORD *)v4 + 15)) {
      goto LABEL_233;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_233;
  }
  sectionHeadlineId = self->_sectionHeadlineId;
  if ((unint64_t)sectionHeadlineId | *((void *)v4 + 34))
  {
    if (!-[NSString isEqual:](sectionHeadlineId, "isEqual:")) {
      goto LABEL_233;
    }
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v11 = self->_has;
  }
  int v14 = *((_DWORD *)v4 + 86);
  if ((*(_WORD *)&v11 & 0x4000) != 0)
  {
    if ((v14 & 0x4000) == 0 || self->_userAction != *((_DWORD *)v4 + 82)) {
      goto LABEL_233;
    }
  }
  else if ((v14 & 0x4000) != 0)
  {
    goto LABEL_233;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 36)
    && !-[NSString isEqual:](surfacedByChannelId, "isEqual:"))
  {
    goto LABEL_233;
  }
  surfacedBySectionId = self->_surfacedBySectionId;
  if ((unint64_t)surfacedBySectionId | *((void *)v4 + 37))
  {
    if (!-[NSString isEqual:](surfacedBySectionId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  surfacedByTopicId = self->_surfacedByTopicId;
  if ((unint64_t)surfacedByTopicId | *((void *)v4 + 38))
  {
    if (!-[NSString isEqual:](surfacedByTopicId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 35))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v19 = self->_has;
  int v20 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v19 & 0x40000) != 0)
  {
    if ((v20 & 0x40000) == 0) {
      goto LABEL_233;
    }
    if (self->_isDigitalReplicaAd)
    {
      if (!*((unsigned char *)v4 + 335)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 335))
    {
      goto LABEL_233;
    }
  }
  else if ((v20 & 0x40000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    if ((v20 & 0x200) == 0 || self->_feedType != *((_DWORD *)v4 + 26)) {
      goto LABEL_233;
    }
  }
  else if ((v20 & 0x200) != 0)
  {
    goto LABEL_233;
  }
  if ((*(unsigned char *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_personalizationTreatmentId != *((void *)v4 + 2)) {
      goto LABEL_233;
    }
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v19 & 0x80000) != 0)
  {
    if ((v20 & 0x80000) == 0) {
      goto LABEL_233;
    }
    if (self->_isFreeArticle)
    {
      if (!*((unsigned char *)v4 + 336)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 336))
    {
      goto LABEL_233;
    }
  }
  else if ((v20 & 0x80000) != 0)
  {
    goto LABEL_233;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 8) && !-[NSString isEqual:](campaignId, "isEqual:")) {
    goto LABEL_233;
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_233;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v24 = self->_has;
  int v25 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v24 & 0x400000) != 0)
  {
    if ((v25 & 0x400000) == 0) {
      goto LABEL_233;
    }
    if (self->_isNotificationArticle)
    {
      if (!*((unsigned char *)v4 + 339)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 339))
    {
      goto LABEL_233;
    }
  }
  else if ((v25 & 0x400000) != 0)
  {
    goto LABEL_233;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((void *)v4 + 29))
  {
    if (!-[NSString isEqual:](notificationId, "isEqual:")) {
      goto LABEL_233;
    }
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v24 = self->_has;
  }
  int v27 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v24 & 0x800000) != 0)
  {
    if ((v27 & 0x800000) == 0) {
      goto LABEL_233;
    }
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((unsigned char *)v4 + 340)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 340))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x800000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x20000) != 0)
  {
    if ((v27 & 0x20000) == 0) {
      goto LABEL_233;
    }
    if (self->_isCoverArticle)
    {
      if (!*((unsigned char *)v4 + 334)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 334))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x20000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v24 & 0x8000) != 0)
  {
    if ((v27 & 0x8000) == 0) {
      goto LABEL_233;
    }
    if (self->_fromNextArticleAffordanceTap)
    {
      if (!*((unsigned char *)v4 + 332)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 332))
    {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x8000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v24 & 0x800) != 0)
  {
    if ((v27 & 0x800) == 0 || self->_nextArticleAffordanceType != *((_DWORD *)v4 + 54)) {
      goto LABEL_233;
    }
  }
  else if ((v27 & 0x800) != 0)
  {
    goto LABEL_233;
  }
  nextArticleAffordanceTypeFeedId = self->_nextArticleAffordanceTypeFeedId;
  if ((unint64_t)nextArticleAffordanceTypeFeedId | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](nextArticleAffordanceTypeFeedId, "isEqual:")) {
      goto LABEL_233;
    }
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v24 = self->_has;
  }
  int v29 = *((_DWORD *)v4 + 86);
  if ((*(_DWORD *)&v24 & 0x100000) != 0)
  {
    if ((v29 & 0x100000) == 0) {
      goto LABEL_233;
    }
    if (self->_isGroupedArticle)
    {
      if (!*((unsigned char *)v4 + 337)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 337))
    {
      goto LABEL_233;
    }
  }
  else if ((v29 & 0x100000) != 0)
  {
    goto LABEL_233;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_233;
    }
    $C9B7FD5E0B9E0FA722DEF41791BB63AA v24 = self->_has;
  }
  int v31 = *((_DWORD *)v4 + 86);
  if ((*(_WORD *)&v24 & 0x400) != 0)
  {
    if ((v31 & 0x400) == 0 || self->_groupType != *((_DWORD *)v4 + 32)) {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x400) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x10000) != 0)
  {
    if ((v31 & 0x10000) == 0) {
      goto LABEL_233;
    }
    if (self->_isBreakingNewsArticle)
    {
      if (!*((unsigned char *)v4 + 333)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 333))
    {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x10000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_WORD *)&v24 & 0x2000) != 0)
  {
    if ((v31 & 0x2000) == 0 || self->_topStoryType != *((_DWORD *)v4 + 78)) {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x2000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x2000000) != 0)
  {
    if ((v31 & 0x2000000) == 0) {
      goto LABEL_233;
    }
    if (self->_isTopStoryArticle)
    {
      if (!*((unsigned char *)v4 + 342)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 342))
    {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x2000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x1000000) != 0)
  {
    if ((v31 & 0x1000000) == 0) {
      goto LABEL_233;
    }
    if (self->_isSearchResultArticle)
    {
      if (!*((unsigned char *)v4 + 341)) {
        goto LABEL_233;
      }
    }
    else if (*((unsigned char *)v4 + 341))
    {
      goto LABEL_233;
    }
  }
  else if ((v31 & 0x1000000) != 0)
  {
    goto LABEL_233;
  }
  if ((*(_DWORD *)&v24 & 0x200000) != 0)
  {
    if ((v31 & 0x200000) != 0)
    {
      if (self->_isNativeAd)
      {
        if (!*((unsigned char *)v4 + 338)) {
          goto LABEL_233;
        }
        goto LABEL_187;
      }
      if (!*((unsigned char *)v4 + 338)) {
        goto LABEL_187;
      }
    }
LABEL_233:
    char v49 = 0;
    goto LABEL_234;
  }
  if ((v31 & 0x200000) != 0) {
    goto LABEL_233;
  }
LABEL_187:
  nativeCampaignData = self->_nativeCampaignData;
  if ((unint64_t)nativeCampaignData | *((void *)v4 + 26)
    && !-[NSString isEqual:](nativeCampaignData, "isEqual:"))
  {
    goto LABEL_233;
  }
  previousArticleId = self->_previousArticleId;
  if ((unint64_t)previousArticleId | *((void *)v4 + 30))
  {
    if (!-[NSString isEqual:](previousArticleId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  previousArticleVersion = self->_previousArticleVersion;
  if ((unint64_t)previousArticleVersion | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](previousArticleVersion, "isEqual:")) {
      goto LABEL_233;
    }
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_233;
    }
  }
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v36 = self->_has;
  int v37 = *((_DWORD *)v4 + 86);
  if ((*(unsigned char *)&v36 & 8) != 0)
  {
    if ((v37 & 8) == 0 || self->_publisherArticleVersionInt64 != *((void *)v4 + 4)) {
      goto LABEL_233;
    }
  }
  else if ((v37 & 8) != 0)
  {
    goto LABEL_233;
  }
  if (*(unsigned char *)&v36)
  {
    if ((v37 & 1) == 0 || self->_backendArticleVersionInt64 != *((void *)v4 + 1)) {
      goto LABEL_233;
    }
  }
  else if (v37)
  {
    goto LABEL_233;
  }
  iadNativeCampaign = self->_iadNativeCampaign;
  if ((unint64_t)iadNativeCampaign | *((void *)v4 + 19)
    && !-[NSString isEqual:](iadNativeCampaign, "isEqual:"))
  {
    goto LABEL_233;
  }
  iadNativeLine = self->_iadNativeLine;
  if ((unint64_t)iadNativeLine | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](iadNativeLine, "isEqual:")) {
      goto LABEL_233;
    }
  }
  iadNativeAd = self->_iadNativeAd;
  if ((unint64_t)iadNativeAd | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](iadNativeAd, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v41 = *((_DWORD *)v4 + 86);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((v41 & 4) == 0 || self->_previousArticlePublisherArticleVersion != *((void *)v4 + 3)) {
      goto LABEL_233;
    }
  }
  else if ((v41 & 4) != 0)
  {
    goto LABEL_233;
  }
  iadNativeCampaignAd = self->_iadNativeCampaignAd;
  if ((unint64_t)iadNativeCampaignAd | *((void *)v4 + 20)
    && !-[NSString isEqual:](iadNativeCampaignAd, "isEqual:"))
  {
    goto LABEL_233;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_233;
    }
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 22))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_233;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 23))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_233;
    }
  }
  int v46 = *((_DWORD *)v4 + 86);
  if (*((unsigned char *)&self->_has + 1))
  {
    if ((v46 & 0x100) == 0 || self->_contentType != *((_DWORD *)v4 + 23)) {
      goto LABEL_233;
    }
  }
  else if ((v46 & 0x100) != 0)
  {
    goto LABEL_233;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 10) && !-[NTPBChannelData isEqual:](channelData, "isEqual:")) {
    goto LABEL_233;
  }
  topicIds = self->_topicIds;
  if ((unint64_t)topicIds | *((void *)v4 + 40)) {
    char v49 = -[NSMutableArray isEqual:](topicIds, "isEqual:");
  }
  else {
    char v49 = 1;
  }
LABEL_234:

  return v49;
}

- (unint64_t)hash
{
  NSUInteger v63 = [(NSString *)self->_articleId hash];
  NSUInteger v62 = [(NSString *)self->_referencedArticleId hash];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA has = self->_has;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    uint64_t v61 = 2654435761 * self->_addRemoveReadingListLocation;
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
LABEL_3:
      uint64_t v60 = 2654435761 * self->_isUserSubscribedToFeed;
      if ((*(unsigned char *)&has & 0x20) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v59 = 0;
      if ((*(unsigned char *)&has & 0x80) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v61 = 0;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v60 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v59 = 2654435761 * self->_articleType;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v58 = 2654435761 * self->_characterCount;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v58 = 0;
LABEL_10:
  NSUInteger v57 = [(NSString *)self->_language hash];
  uint64_t v56 = [(NSMutableArray *)self->_namedEntities hash];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
    uint64_t v55 = 2654435761 * self->_publisherArticleVersion;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v55 = 0;
    if ((*(unsigned char *)&v4 & 0x40) != 0)
    {
LABEL_12:
      uint64_t v54 = 2654435761 * self->_backendArticleVersion;
      goto LABEL_15;
    }
  }
  uint64_t v54 = 0;
LABEL_15:
  NSUInteger v53 = [(NSString *)self->_sectionHeadlineId hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    uint64_t v52 = 2654435761 * self->_userAction;
  }
  else {
    uint64_t v52 = 0;
  }
  NSUInteger v51 = [(NSString *)self->_surfacedByChannelId hash];
  NSUInteger v50 = [(NSString *)self->_surfacedBySectionId hash];
  NSUInteger v49 = [(NSString *)self->_surfacedByTopicId hash];
  NSUInteger v48 = [(NSString *)self->_sourceChannelId hash];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    uint64_t v47 = 2654435761 * self->_isDigitalReplicaAd;
    if ((*(_WORD *)&v5 & 0x200) != 0)
    {
LABEL_20:
      uint64_t v46 = 2654435761 * self->_feedType;
      if ((*(unsigned char *)&v5 & 2) != 0) {
        goto LABEL_21;
      }
LABEL_25:
      uint64_t v45 = 0;
      if ((*(_DWORD *)&v5 & 0x80000) != 0) {
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v47 = 0;
    if ((*(_WORD *)&v5 & 0x200) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v46 = 0;
  if ((*(unsigned char *)&v5 & 2) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v45 = 2654435761 * self->_personalizationTreatmentId;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
LABEL_22:
    uint64_t v44 = 2654435761 * self->_isFreeArticle;
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v44 = 0;
LABEL_27:
  NSUInteger v43 = [(NSString *)self->_campaignId hash];
  NSUInteger v42 = [(NSString *)self->_campaignType hash];
  NSUInteger v41 = [(NSString *)self->_creativeId hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    uint64_t v40 = 2654435761 * self->_isNotificationArticle;
  }
  else {
    uint64_t v40 = 0;
  }
  NSUInteger v39 = [(NSString *)self->_notificationId hash];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) != 0)
  {
    uint64_t v38 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
    if ((*(_DWORD *)&v6 & 0x20000) != 0)
    {
LABEL_32:
      uint64_t v37 = 2654435761 * self->_isCoverArticle;
      if ((*(_WORD *)&v6 & 0x8000) != 0) {
        goto LABEL_33;
      }
LABEL_37:
      uint64_t v36 = 0;
      if ((*(_WORD *)&v6 & 0x800) != 0) {
        goto LABEL_34;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v38 = 0;
    if ((*(_DWORD *)&v6 & 0x20000) != 0) {
      goto LABEL_32;
    }
  }
  uint64_t v37 = 0;
  if ((*(_WORD *)&v6 & 0x8000) == 0) {
    goto LABEL_37;
  }
LABEL_33:
  uint64_t v36 = 2654435761 * self->_fromNextArticleAffordanceTap;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
LABEL_34:
    uint64_t v35 = 2654435761 * self->_nextArticleAffordanceType;
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v35 = 0;
LABEL_39:
  NSUInteger v34 = [(NSString *)self->_nextArticleAffordanceTypeFeedId hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    uint64_t v33 = 2654435761 * self->_isGroupedArticle;
  }
  else {
    uint64_t v33 = 0;
  }
  NSUInteger v32 = [(NSString *)self->_groupFeedId hash];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    uint64_t v31 = 2654435761 * self->_groupType;
    if ((*(_DWORD *)&v7 & 0x10000) != 0)
    {
LABEL_44:
      uint64_t v30 = 2654435761 * self->_isBreakingNewsArticle;
      if ((*(_WORD *)&v7 & 0x2000) != 0) {
        goto LABEL_45;
      }
      goto LABEL_51;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(_DWORD *)&v7 & 0x10000) != 0) {
      goto LABEL_44;
    }
  }
  uint64_t v30 = 0;
  if ((*(_WORD *)&v7 & 0x2000) != 0)
  {
LABEL_45:
    uint64_t v29 = 2654435761 * self->_topStoryType;
    if ((*(_DWORD *)&v7 & 0x2000000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&v7 & 0x2000000) != 0)
  {
LABEL_46:
    uint64_t v28 = 2654435761 * self->_isTopStoryArticle;
    if ((*(_DWORD *)&v7 & 0x1000000) != 0) {
      goto LABEL_47;
    }
LABEL_53:
    uint64_t v27 = 0;
    if ((*(_DWORD *)&v7 & 0x200000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_54;
  }
LABEL_52:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v7 & 0x1000000) == 0) {
    goto LABEL_53;
  }
LABEL_47:
  uint64_t v27 = 2654435761 * self->_isSearchResultArticle;
  if ((*(_DWORD *)&v7 & 0x200000) != 0)
  {
LABEL_48:
    uint64_t v26 = 2654435761 * self->_isNativeAd;
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v26 = 0;
LABEL_55:
  NSUInteger v25 = [(NSString *)self->_nativeCampaignData hash];
  NSUInteger v24 = [(NSString *)self->_previousArticleId hash];
  NSUInteger v23 = [(NSString *)self->_previousArticleVersion hash];
  uint64_t v22 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $C9B7FD5E0B9E0FA722DEF41791BB63AA v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) != 0)
  {
    uint64_t v21 = 2654435761 * self->_publisherArticleVersionInt64;
    if (*(unsigned char *)&v8) {
      goto LABEL_57;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if (*(unsigned char *)&v8)
    {
LABEL_57:
      uint64_t v20 = 2654435761 * self->_backendArticleVersionInt64;
      goto LABEL_60;
    }
  }
  uint64_t v20 = 0;
LABEL_60:
  NSUInteger v9 = [(NSString *)self->_iadNativeCampaign hash];
  NSUInteger v10 = [(NSString *)self->_iadNativeLine hash];
  NSUInteger v11 = [(NSString *)self->_iadNativeAd hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_previousArticlePublisherArticleVersion;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = [(NSString *)self->_iadNativeCampaignAd hash];
  uint64_t v14 = [(NSData *)self->_groupViewExposureId hash];
  unint64_t v15 = [(NTPBIssueData *)self->_issueData hash];
  unint64_t v16 = [(NTPBIssueExposureData *)self->_issueExposureData hash];
  if (*((unsigned char *)&self->_has + 1)) {
    uint64_t v17 = 2654435761 * self->_contentType;
  }
  else {
    uint64_t v17 = 0;
  }
  unint64_t v18 = v62 ^ v63 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NTPBChannelData *)self->_channelData hash];
  return v18 ^ [(NSMutableArray *)self->_topicIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 6)) {
    -[NTPBReadingListAddRemove setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v4 + 33)) {
    -[NTPBReadingListAddRemove setReferencedArticleId:](self, "setReferencedArticleId:");
  }
  int v5 = *((_DWORD *)v4 + 86);
  if ((v5 & 0x10) != 0)
  {
    self->_addRemoveReadingListLocation = *((_DWORD *)v4 + 10);
    *(_DWORD *)&self->_has |= 0x10u;
    int v5 = *((_DWORD *)v4 + 86);
    if ((v5 & 0x4000000) == 0)
    {
LABEL_7:
      if ((v5 & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_102;
    }
  }
  else if ((v5 & 0x4000000) == 0)
  {
    goto LABEL_7;
  }
  self->_isUserSubscribedToFeed = *((unsigned char *)v4 + 343);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)v4 + 86);
  if ((v5 & 0x20) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_102:
  self->_uint64_t articleType = *((_DWORD *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)v4 + 86) & 0x80) != 0)
  {
LABEL_9:
    self->_characterCount = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_10:
  if (*((void *)v4 + 24)) {
    -[NTPBReadingListAddRemove setLanguage:](self, "setLanguage:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = *((id *)v4 + 25);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NTPBReadingListAddRemove *)self addNamedEntities:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v8);
  }

  int v11 = *((_DWORD *)v4 + 86);
  if ((v11 & 0x1000) != 0)
  {
    self->_publisherArticleVersion = *((_DWORD *)v4 + 64);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v11 = *((_DWORD *)v4 + 86);
  }
  if ((v11 & 0x40) != 0)
  {
    self->_backendArticleVersion = *((_DWORD *)v4 + 15);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  if (*((void *)v4 + 34)) {
    -[NTPBReadingListAddRemove setSectionHeadlineId:](self, "setSectionHeadlineId:");
  }
  if ((*((unsigned char *)v4 + 345) & 0x40) != 0)
  {
    self->_userAction = *((_DWORD *)v4 + 82);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
  if (*((void *)v4 + 36)) {
    -[NTPBReadingListAddRemove setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
  if (*((void *)v4 + 37)) {
    -[NTPBReadingListAddRemove setSurfacedBySectionId:](self, "setSurfacedBySectionId:");
  }
  if (*((void *)v4 + 38)) {
    -[NTPBReadingListAddRemove setSurfacedByTopicId:](self, "setSurfacedByTopicId:");
  }
  if (*((void *)v4 + 35)) {
    -[NTPBReadingListAddRemove setSourceChannelId:](self, "setSourceChannelId:");
  }
  int v12 = *((_DWORD *)v4 + 86);
  if ((v12 & 0x40000) != 0)
  {
    self->_isDigitalReplicaAd = *((unsigned char *)v4 + 335);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v12 = *((_DWORD *)v4 + 86);
    if ((v12 & 0x200) == 0)
    {
LABEL_37:
      if ((v12 & 2) == 0) {
        goto LABEL_38;
      }
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x200) == 0)
  {
    goto LABEL_37;
  }
  self->_uint64_t feedType = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_has |= 0x200u;
  int v12 = *((_DWORD *)v4 + 86);
  if ((v12 & 2) == 0)
  {
LABEL_38:
    if ((v12 & 0x80000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_106:
  self->_personalizationTreatmentId = *((void *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 86) & 0x80000) != 0)
  {
LABEL_39:
    self->_isFreeArticle = *((unsigned char *)v4 + 336);
    *(_DWORD *)&self->_has |= 0x80000u;
  }
LABEL_40:
  if (*((void *)v4 + 8)) {
    -[NTPBReadingListAddRemove setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v4 + 9)) {
    -[NTPBReadingListAddRemove setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v4 + 12)) {
    -[NTPBReadingListAddRemove setCreativeId:](self, "setCreativeId:");
  }
  if ((*((unsigned char *)v4 + 346) & 0x40) != 0)
  {
    self->_isNotificationArticle = *((unsigned char *)v4 + 339);
    *(_DWORD *)&self->_has |= 0x400000u;
  }
  if (*((void *)v4 + 29)) {
    -[NTPBReadingListAddRemove setNotificationId:](self, "setNotificationId:");
  }
  int v13 = *((_DWORD *)v4 + 86);
  if ((v13 & 0x800000) != 0)
  {
    self->_isPaidSubscriberToSourceChannel = *((unsigned char *)v4 + 340);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v13 = *((_DWORD *)v4 + 86);
    if ((v13 & 0x20000) == 0)
    {
LABEL_52:
      if ((v13 & 0x8000) == 0) {
        goto LABEL_53;
      }
      goto LABEL_110;
    }
  }
  else if ((v13 & 0x20000) == 0)
  {
    goto LABEL_52;
  }
  self->_isCoverArticle = *((unsigned char *)v4 + 334);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v13 = *((_DWORD *)v4 + 86);
  if ((v13 & 0x8000) == 0)
  {
LABEL_53:
    if ((v13 & 0x800) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_110:
  self->_fromNextArticleAffordanceTap = *((unsigned char *)v4 + 332);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)v4 + 86) & 0x800) != 0)
  {
LABEL_54:
    self->_uint64_t nextArticleAffordanceType = *((_DWORD *)v4 + 54);
    *(_DWORD *)&self->_has |= 0x800u;
  }
LABEL_55:
  if (*((void *)v4 + 28)) {
    -[NTPBReadingListAddRemove setNextArticleAffordanceTypeFeedId:](self, "setNextArticleAffordanceTypeFeedId:");
  }
  if ((*((unsigned char *)v4 + 346) & 0x10) != 0)
  {
    self->_isGroupedArticle = *((unsigned char *)v4 + 337);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
  if (*((void *)v4 + 15)) {
    -[NTPBReadingListAddRemove setGroupFeedId:](self, "setGroupFeedId:");
  }
  int v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x400) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_has |= 0x400u;
    int v14 = *((_DWORD *)v4 + 86);
    if ((v14 & 0x10000) == 0)
    {
LABEL_63:
      if ((v14 & 0x2000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_114;
    }
  }
  else if ((v14 & 0x10000) == 0)
  {
    goto LABEL_63;
  }
  self->_isBreakingNewsArticle = *((unsigned char *)v4 + 333);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x2000) == 0)
  {
LABEL_64:
    if ((v14 & 0x2000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_uint64_t topStoryType = *((_DWORD *)v4 + 78);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x2000000) == 0)
  {
LABEL_65:
    if ((v14 & 0x1000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_isTopStoryArticle = *((unsigned char *)v4 + 342);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v14 = *((_DWORD *)v4 + 86);
  if ((v14 & 0x1000000) == 0)
  {
LABEL_66:
    if ((v14 & 0x200000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_116:
  self->_isSearchResultArticle = *((unsigned char *)v4 + 341);
  *(_DWORD *)&self->_has |= 0x1000000u;
  if ((*((_DWORD *)v4 + 86) & 0x200000) != 0)
  {
LABEL_67:
    self->_isNativeAd = *((unsigned char *)v4 + 338);
    *(_DWORD *)&self->_has |= 0x200000u;
  }
LABEL_68:
  if (*((void *)v4 + 26)) {
    -[NTPBReadingListAddRemove setNativeCampaignData:](self, "setNativeCampaignData:");
  }
  if (*((void *)v4 + 30)) {
    -[NTPBReadingListAddRemove setPreviousArticleId:](self, "setPreviousArticleId:");
  }
  if (*((void *)v4 + 31)) {
    -[NTPBReadingListAddRemove setPreviousArticleVersion:](self, "setPreviousArticleVersion:");
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v15 = *((id *)v4 + 14);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        [(NTPBReadingListAddRemove *)self addFractionalCohortMembership:*(void *)(*((void *)&v36 + 1) + 8 * j)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v17);
  }

  int v20 = *((_DWORD *)v4 + 86);
  if ((v20 & 8) != 0)
  {
    self->_publisherArticleVersionInt64 = *((void *)v4 + 4);
    *(_DWORD *)&self->_has |= 8u;
    int v20 = *((_DWORD *)v4 + 86);
  }
  if (v20)
  {
    self->_backendArticleVersionInt64 = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 19)) {
    -[NTPBReadingListAddRemove setIadNativeCampaign:](self, "setIadNativeCampaign:");
  }
  if (*((void *)v4 + 21)) {
    -[NTPBReadingListAddRemove setIadNativeLine:](self, "setIadNativeLine:");
  }
  if (*((void *)v4 + 18)) {
    -[NTPBReadingListAddRemove setIadNativeAd:](self, "setIadNativeAd:");
  }
  if ((*((unsigned char *)v4 + 344) & 4) != 0)
  {
    self->_previousArticlePublisherArticleVersion = *((void *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 20)) {
    -[NTPBReadingListAddRemove setIadNativeCampaignAd:](self, "setIadNativeCampaignAd:");
  }
  if (*((void *)v4 + 17)) {
    -[NTPBReadingListAddRemove setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  issueData = self->_issueData;
  uint64_t v22 = *((void *)v4 + 22);
  if (issueData)
  {
    if (v22) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v22)
  {
    -[NTPBReadingListAddRemove setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v24 = *((void *)v4 + 23);
  if (issueExposureData)
  {
    if (v24) {
      -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v24)
  {
    -[NTPBReadingListAddRemove setIssueExposureData:](self, "setIssueExposureData:");
  }
  if (*((unsigned char *)v4 + 345))
  {
    self->_uint64_t contentType = *((_DWORD *)v4 + 23);
    *(_DWORD *)&self->_has |= 0x100u;
  }
  channelData = self->_channelData;
  uint64_t v26 = *((void *)v4 + 10);
  if (channelData)
  {
    if (v26) {
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
    }
  }
  else if (v26)
  {
    -[NTPBReadingListAddRemove setChannelData:](self, "setChannelData:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = *((id *)v4 + 40);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v33 != v30) {
          objc_enumerationMutation(v27);
        }
        -[NTPBReadingListAddRemove addTopicIds:](self, "addTopicIds:", *(void *)(*((void *)&v32 + 1) + 8 * k), (void)v32);
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v29);
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

- (NSString)sectionHeadlineId
{
  return self->_sectionHeadlineId;
}

- (void)setSectionHeadlineId:(id)a3
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

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
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

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
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
  objc_storeStrong((id *)&self->_iadNativeLine, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaignAd, 0);
  objc_storeStrong((id *)&self->_iadNativeCampaign, 0);
  objc_storeStrong((id *)&self->_iadNativeAd, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end