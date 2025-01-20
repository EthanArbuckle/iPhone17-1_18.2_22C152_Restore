@interface NTPBGroupViewExposure
+ (Class)groupedArticleIdsType;
+ (Class)groupedIssueIdsType;
+ (Class)layoutIdsType;
+ (Class)sectionIdsType;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasCuratedBatchId;
- (BOOL)hasCuratedContentType;
- (BOOL)hasCuratedSubtype;
- (BOOL)hasFeedAutoSubscribeType;
- (BOOL)hasFeedViewExposureId;
- (BOOL)hasGroupArticleCountInForYou;
- (BOOL)hasGroupDisplayMode;
- (BOOL)hasGroupDisplayRankInForYou;
- (BOOL)hasGroupExposedInLocationId;
- (BOOL)hasGroupExposedInSourceChannelId;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupFormationReason;
- (BOOL)hasGroupLocation;
- (BOOL)hasGroupLocationFeedType;
- (BOOL)hasGroupPresentationReason;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIsIssueContext;
- (BOOL)hasIsSubscribedToGroupFeed;
- (BOOL)hasReachedEndOfGroup;
- (BOOL)hasScreenfulsFromTop;
- (BOOL)hasTopStoryMandatoryArticleCount;
- (BOOL)hasTopStoryOptionalArticleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIssueContext;
- (BOOL)isSubscribedToGroupFeed;
- (BOOL)reachedEndOfGroup;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSData)feedViewExposureId;
- (NSData)groupViewExposureId;
- (NSMutableArray)groupedArticleIds;
- (NSMutableArray)groupedIssueIds;
- (NSMutableArray)layoutIds;
- (NSMutableArray)sectionIds;
- (NSString)curatedBatchId;
- (NSString)curatedSubtype;
- (NSString)groupExposedInLocationId;
- (NSString)groupExposedInSourceChannelId;
- (NSString)groupFeedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)curatedContentTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedAutoSubscribeTypeAsString:(int)a3;
- (id)groupFormationReasonAsString:(int)a3;
- (id)groupLocationAsString:(int)a3;
- (id)groupLocationFeedTypeAsString:(int)a3;
- (id)groupPresentationReasonAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (id)groupedArticleIdsAtIndex:(unint64_t)a3;
- (id)groupedIssueIdsAtIndex:(unint64_t)a3;
- (id)layoutIdsAtIndex:(unint64_t)a3;
- (id)sectionIdsAtIndex:(unint64_t)a3;
- (int)StringAsCuratedContentType:(id)a3;
- (int)StringAsFeedAutoSubscribeType:(id)a3;
- (int)StringAsGroupFormationReason:(id)a3;
- (int)StringAsGroupLocation:(id)a3;
- (int)StringAsGroupLocationFeedType:(id)a3;
- (int)StringAsGroupPresentationReason:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)curatedContentType;
- (int)feedAutoSubscribeType;
- (int)groupArticleCountInForYou;
- (int)groupDisplayMode;
- (int)groupDisplayRankInForYou;
- (int)groupFormationReason;
- (int)groupLocation;
- (int)groupLocationFeedType;
- (int)groupPresentationReason;
- (int)groupType;
- (int)screenfulsFromTop;
- (int)topStoryMandatoryArticleCount;
- (int)topStoryOptionalArticleCount;
- (unint64_t)groupedArticleIdsCount;
- (unint64_t)groupedIssueIdsCount;
- (unint64_t)hash;
- (unint64_t)layoutIdsCount;
- (unint64_t)sectionIdsCount;
- (void)addGroupedArticleIds:(id)a3;
- (void)addGroupedIssueIds:(id)a3;
- (void)addLayoutIds:(id)a3;
- (void)addSectionIds:(id)a3;
- (void)clearGroupedArticleIds;
- (void)clearGroupedIssueIds;
- (void)clearLayoutIds;
- (void)clearSectionIds;
- (void)mergeFrom:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setCuratedBatchId:(id)a3;
- (void)setCuratedContentType:(int)a3;
- (void)setCuratedSubtype:(id)a3;
- (void)setFeedAutoSubscribeType:(int)a3;
- (void)setFeedViewExposureId:(id)a3;
- (void)setGroupArticleCountInForYou:(int)a3;
- (void)setGroupDisplayMode:(int)a3;
- (void)setGroupDisplayRankInForYou:(int)a3;
- (void)setGroupExposedInLocationId:(id)a3;
- (void)setGroupExposedInSourceChannelId:(id)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupFormationReason:(int)a3;
- (void)setGroupLocation:(int)a3;
- (void)setGroupLocationFeedType:(int)a3;
- (void)setGroupPresentationReason:(int)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setGroupedArticleIds:(id)a3;
- (void)setGroupedIssueIds:(id)a3;
- (void)setHasCuratedContentType:(BOOL)a3;
- (void)setHasFeedAutoSubscribeType:(BOOL)a3;
- (void)setHasGroupArticleCountInForYou:(BOOL)a3;
- (void)setHasGroupDisplayMode:(BOOL)a3;
- (void)setHasGroupDisplayRankInForYou:(BOOL)a3;
- (void)setHasGroupFormationReason:(BOOL)a3;
- (void)setHasGroupLocation:(BOOL)a3;
- (void)setHasGroupLocationFeedType:(BOOL)a3;
- (void)setHasGroupPresentationReason:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsIssueContext:(BOOL)a3;
- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3;
- (void)setHasReachedEndOfGroup:(BOOL)a3;
- (void)setHasScreenfulsFromTop:(BOOL)a3;
- (void)setHasTopStoryMandatoryArticleCount:(BOOL)a3;
- (void)setHasTopStoryOptionalArticleCount:(BOOL)a3;
- (void)setIsIssueContext:(BOOL)a3;
- (void)setIsSubscribedToGroupFeed:(BOOL)a3;
- (void)setLayoutIds:(id)a3;
- (void)setReachedEndOfGroup:(BOOL)a3;
- (void)setScreenfulsFromTop:(int)a3;
- (void)setSectionIds:(id)a3;
- (void)setTopStoryMandatoryArticleCount:(int)a3;
- (void)setTopStoryOptionalArticleCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBGroupViewExposure

- (BOOL)hasGroupFeedId
{
  return self->_groupFeedId != 0;
}

- (void)clearGroupedArticleIds
{
}

- (void)addGroupedArticleIds:(id)a3
{
  id v4 = a3;
  groupedArticleIds = self->_groupedArticleIds;
  id v8 = v4;
  if (!groupedArticleIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_groupedArticleIds;
    self->_groupedArticleIds = v6;

    id v4 = v8;
    groupedArticleIds = self->_groupedArticleIds;
  }
  [(NSMutableArray *)groupedArticleIds addObject:v4];
}

- (unint64_t)groupedArticleIdsCount
{
  return [(NSMutableArray *)self->_groupedArticleIds count];
}

- (id)groupedArticleIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groupedArticleIds objectAtIndex:a3];
}

+ (Class)groupedArticleIdsType
{
  return (Class)objc_opt_class();
}

- (void)setGroupDisplayRankInForYou:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_groupDisplayRankInForYou = a3;
}

- (void)setHasGroupDisplayRankInForYou:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasGroupDisplayRankInForYou
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setGroupArticleCountInForYou:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_groupArticleCountInForYou = a3;
}

- (void)setHasGroupArticleCountInForYou:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGroupArticleCountInForYou
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D228[a3];
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
  *(_WORD *)&self->_has |= 0x4000u;
  self->_isSubscribedToGroupFeed = a3;
}

- (void)setHasIsSubscribedToGroupFeed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasIsSubscribedToGroupFeed
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasFeedViewExposureId
{
  return self->_feedViewExposureId != 0;
}

- (void)setTopStoryMandatoryArticleCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_topStoryMandatoryArticleCount = a3;
}

- (void)setHasTopStoryMandatoryArticleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasTopStoryMandatoryArticleCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setTopStoryOptionalArticleCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_topStoryOptionalArticleCount = a3;
}

- (void)setHasTopStoryOptionalArticleCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTopStoryOptionalArticleCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (int)groupPresentationReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_groupPresentationReason;
  }
  else {
    return 0;
  }
}

- (void)setGroupPresentationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_groupPresentationReason = a3;
}

- (void)setHasGroupPresentationReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasGroupPresentationReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)groupPresentationReasonAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D368[a3];
  }

  return v3;
}

- (int)StringAsGroupPresentationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SAFARI_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INSTALLED_APPS_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NEWS_READING_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"MANY_ARTICLES_FETCHED_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUB_TOPIC_OF_FAVORITE_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CHANNEL_FROM_SAFARI_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CHANNEL_FROM_APP_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"INSTRUCTIONAL_FALLBACK_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"UNIVERSAL_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"GROUPABLE_GROUP_PRESENTATION_REASON"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)groupFormationReason
{
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    return self->_groupFormationReason;
  }
  else {
    return 0;
  }
}

- (void)setGroupFormationReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_groupFormationReason = a3;
}

- (void)setHasGroupFormationReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGroupFormationReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (id)groupFormationReasonAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D3C0[a3];
  }

  return v3;
}

- (int)StringAsGroupFormationReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_FORMATION_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"AUTO_SUBSCRIBED_FEED_GROUP_FORMATION_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HARD_SUBSCRIBED_GROUP_FORMATION_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HARD_SUBSCRIBED_RELATED_GROUP_FORMATION_REASON"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)feedAutoSubscribeType
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_feedAutoSubscribeType;
  }
  else {
    return 0;
  }
}

- (void)setFeedAutoSubscribeType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_feedAutoSubscribeType = a3;
}

- (void)setHasFeedAutoSubscribeType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasFeedAutoSubscribeType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)feedAutoSubscribeTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D3E0[a3];
  }

  return v3;
}

- (int)StringAsFeedAutoSubscribeType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_FEED_AUTO_SUBSCRIBE_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INTERNAL_GENERATED_FEED_AUTO_SUBSCRIBE_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXTERNAL_GENERATED_FEED_AUTO_SUBSCRIBE_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setReachedEndOfGroup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_reachedEndOfGroup = a3;
}

- (void)setHasReachedEndOfGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasReachedEndOfGroup
{
  return *(_WORD *)&self->_has >> 15;
}

- (int)curatedContentType
{
  if (*(_WORD *)&self->_has) {
    return self->_curatedContentType;
  }
  else {
    return 0;
  }
}

- (void)setCuratedContentType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_curatedContentType = a3;
}

- (void)setHasCuratedContentType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCuratedContentType
{
  return *(_WORD *)&self->_has & 1;
}

- (id)curatedContentTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D3F8[a3];
  }

  return v3;
}

- (int)StringAsCuratedContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_CURATED_CONTENT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MANAGED_TOPIC_CURATED_CONTENT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GEM_TOPIC_CURATED_CONTENT_TYPE"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (int)groupDisplayMode
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_groupDisplayMode;
  }
  else {
    return 0;
  }
}

- (void)setGroupDisplayMode:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_groupDisplayMode = a3;
}

- (void)setHasGroupDisplayMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGroupDisplayMode
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (int)groupLocation
{
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    return self->_groupLocation;
  }
  else {
    return 0;
  }
}

- (void)setGroupLocation:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_groupLocation = a3;
}

- (void)setHasGroupLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGroupLocation
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)groupLocationAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D410[a3];
  }

  return v3;
}

- (int)StringAsGroupLocation:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_GROUP_LOCATION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_GROUP_LOCATION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"IN_FEED_GROUP_LOCATION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EOA_GROUP_LOCATION"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)groupLocationFeedType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    return self->_groupLocationFeedType;
  }
  else {
    return 0;
  }
}

- (void)setGroupLocationFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_groupLocationFeedType = a3;
}

- (void)setHasGroupLocationFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGroupLocationFeedType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)groupLocationFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444D430[a3];
  }

  return v3;
}

- (int)StringAsGroupLocationFeedType:(id)a3
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

- (BOOL)hasGroupExposedInLocationId
{
  return self->_groupExposedInLocationId != 0;
}

- (BOOL)hasGroupExposedInSourceChannelId
{
  return self->_groupExposedInSourceChannelId != 0;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)setScreenfulsFromTop:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_screenfulsFromTop = a3;
}

- (void)setHasScreenfulsFromTop:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScreenfulsFromTop
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)clearGroupedIssueIds
{
}

- (void)addGroupedIssueIds:(id)a3
{
  id v4 = a3;
  groupedIssueIds = self->_groupedIssueIds;
  id v8 = v4;
  if (!groupedIssueIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_groupedIssueIds;
    self->_groupedIssueIds = v6;

    id v4 = v8;
    groupedIssueIds = self->_groupedIssueIds;
  }
  [(NSMutableArray *)groupedIssueIds addObject:v4];
}

- (unint64_t)groupedIssueIdsCount
{
  return [(NSMutableArray *)self->_groupedIssueIds count];
}

- (id)groupedIssueIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groupedIssueIds objectAtIndex:a3];
}

+ (Class)groupedIssueIdsType
{
  return (Class)objc_opt_class();
}

- (void)setIsIssueContext:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_isIssueContext = a3;
}

- (void)setHasIsIssueContext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasIsIssueContext
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)clearSectionIds
{
}

- (void)addSectionIds:(id)a3
{
  id v4 = a3;
  sectionIds = self->_sectionIds;
  id v8 = v4;
  if (!sectionIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_sectionIds;
    self->_sectionIds = v6;

    id v4 = v8;
    sectionIds = self->_sectionIds;
  }
  [(NSMutableArray *)sectionIds addObject:v4];
}

- (unint64_t)sectionIdsCount
{
  return [(NSMutableArray *)self->_sectionIds count];
}

- (id)sectionIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_sectionIds objectAtIndex:a3];
}

+ (Class)sectionIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCuratedSubtype
{
  return self->_curatedSubtype != 0;
}

- (BOOL)hasCuratedBatchId
{
  return self->_curatedBatchId != 0;
}

- (void)clearLayoutIds
{
}

- (void)addLayoutIds:(id)a3
{
  id v4 = a3;
  layoutIds = self->_layoutIds;
  id v8 = v4;
  if (!layoutIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_layoutIds;
    self->_layoutIds = v6;

    id v4 = v8;
    layoutIds = self->_layoutIds;
  }
  [(NSMutableArray *)layoutIds addObject:v4];
}

- (unint64_t)layoutIdsCount
{
  return [(NSMutableArray *)self->_layoutIds count];
}

- (id)layoutIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_layoutIds objectAtIndex:a3];
}

+ (Class)layoutIdsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBGroupViewExposure;
  id v4 = [(NTPBGroupViewExposure *)&v8 description];
  v5 = [(NTPBGroupViewExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v3 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  groupedArticleIds = self->_groupedArticleIds;
  if (groupedArticleIds) {
    [v4 setObject:groupedArticleIds forKey:@"grouped_article_ids"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithInt:self->_groupDisplayRankInForYou];
    [v4 setObject:v11 forKey:@"group_display_rank_in_for_you"];

    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 0x200) == 0) {
        goto LABEL_8;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_7;
  }
  v12 = [NSNumber numberWithInt:self->_groupArticleCountInForYou];
  [v4 setObject:v12 forKey:@"group_article_count_in_for_you"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_8:
    if ((has & 0x4000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_22:
  uint64_t groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26444D228[groupType];
  }
  [v4 setObject:v14 forKey:@"group_type"];

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_9:
    objc_super v8 = [NSNumber numberWithBool:self->_isSubscribedToGroupFeed];
    [v4 setObject:v8 forKey:@"is_subscribed_to_group_feed"];
  }
LABEL_10:
  feedViewExposureId = self->_feedViewExposureId;
  if (feedViewExposureId) {
    [v4 setObject:feedViewExposureId forKey:@"feed_view_exposure_id"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x800) != 0)
  {
    v15 = [NSNumber numberWithInt:self->_topStoryMandatoryArticleCount];
    [v4 setObject:v15 forKey:@"top_story_mandatory_article_count"];

    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x1000) == 0)
    {
LABEL_14:
      if ((v10 & 0x100) == 0) {
        goto LABEL_15;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_14;
  }
  v16 = [NSNumber numberWithInt:self->_topStoryOptionalArticleCount];
  [v4 setObject:v16 forKey:@"top_story_optional_article_count"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) == 0)
  {
LABEL_15:
    if ((v10 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_33;
  }
LABEL_26:
  uint64_t groupPresentationReason = self->_groupPresentationReason;
  if (groupPresentationReason >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupPresentationReason);
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = off_26444D368[groupPresentationReason];
  }
  [v4 setObject:v18 forKey:@"group_presentation_reason"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) == 0)
  {
LABEL_16:
    if ((v10 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_33:
  uint64_t groupFormationReason = self->_groupFormationReason;
  if (groupFormationReason >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupFormationReason);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = off_26444D3C0[groupFormationReason];
  }
  [v4 setObject:v20 forKey:@"group_formation_reason"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
LABEL_17:
    if ((v10 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_41;
  }
LABEL_37:
  uint64_t feedAutoSubscribeType = self->_feedAutoSubscribeType;
  if (feedAutoSubscribeType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedAutoSubscribeType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_26444D3E0[feedAutoSubscribeType];
  }
  [v4 setObject:v22 forKey:@"feed_auto_subscribe_type"];

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x8000) == 0)
  {
LABEL_18:
    if ((v10 & 1) == 0) {
      goto LABEL_46;
    }
    goto LABEL_42;
  }
LABEL_41:
  v23 = [NSNumber numberWithBool:self->_reachedEndOfGroup];
  [v4 setObject:v23 forKey:@"reached_end_of_group"];

  if ((*(_WORD *)&self->_has & 1) == 0) {
    goto LABEL_46;
  }
LABEL_42:
  uint64_t curatedContentType = self->_curatedContentType;
  if (curatedContentType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_curatedContentType);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = off_26444D3F8[curatedContentType];
  }
  [v4 setObject:v25 forKey:@"curated_content_type"];

LABEL_46:
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v4 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  __int16 v27 = (__int16)self->_has;
  if ((v27 & 8) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_groupDisplayMode];
    [v4 setObject:v28 forKey:@"group_display_mode"];

    __int16 v27 = (__int16)self->_has;
    if ((v27 & 0x40) == 0)
    {
LABEL_50:
      if ((v27 & 0x80) == 0) {
        goto LABEL_61;
      }
      goto LABEL_57;
    }
  }
  else if ((v27 & 0x40) == 0)
  {
    goto LABEL_50;
  }
  uint64_t groupLocation = self->_groupLocation;
  if (groupLocation >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupLocation);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = off_26444D410[groupLocation];
  }
  [v4 setObject:v30 forKey:@"group_location"];

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_57:
    uint64_t groupLocationFeedType = self->_groupLocationFeedType;
    if (groupLocationFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupLocationFeedType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_26444D430[groupLocationFeedType];
    }
    [v4 setObject:v32 forKey:@"group_location_feed_type"];
  }
LABEL_61:
  groupExposedInLocationId = self->_groupExposedInLocationId;
  if (groupExposedInLocationId) {
    [v4 setObject:groupExposedInLocationId forKey:@"group_exposed_in_location_id"];
  }
  groupExposedInSourceChannelId = self->_groupExposedInSourceChannelId;
  if (groupExposedInSourceChannelId) {
    [v4 setObject:groupExposedInSourceChannelId forKey:@"group_exposed_in_source_channel_id"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v4 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    v36 = [NSNumber numberWithInt:self->_screenfulsFromTop];
    [v4 setObject:v36 forKey:@"screenfuls_from_top"];
  }
  groupedIssueIds = self->_groupedIssueIds;
  if (groupedIssueIds) {
    [v4 setObject:groupedIssueIds forKey:@"grouped_issue_ids"];
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    v38 = [NSNumber numberWithBool:self->_isIssueContext];
    [v4 setObject:v38 forKey:@"is_issue_context"];
  }
  sectionIds = self->_sectionIds;
  if (sectionIds) {
    [v4 setObject:sectionIds forKey:@"section_ids"];
  }
  curatedSubtype = self->_curatedSubtype;
  if (curatedSubtype) {
    [v4 setObject:curatedSubtype forKey:@"curated_subtype"];
  }
  curatedBatchId = self->_curatedBatchId;
  if (curatedBatchId) {
    [v4 setObject:curatedBatchId forKey:@"curated_batch_id"];
  }
  layoutIds = self->_layoutIds;
  if (layoutIds) {
    [v4 setObject:layoutIds forKey:@"layout_ids"];
  }
  id v43 = v4;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBGroupViewExposureReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v5 = self->_groupedArticleIds;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_12:
      if ((has & 0x200) == 0) {
        goto LABEL_13;
      }
      goto LABEL_69;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
  if (self->_feedViewExposureId) {
    PBDataWriterWriteDataField();
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x1000) == 0)
    {
LABEL_19:
      if ((v11 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x100) == 0)
  {
LABEL_20:
    if ((v11 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x20) == 0)
  {
LABEL_21:
    if ((v11 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_22:
    if ((v11 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteInt32Field();
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x8000) == 0)
  {
LABEL_23:
    if ((v11 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_76:
  PBDataWriterWriteBOOLField();
  if (*(_WORD *)&self->_has) {
LABEL_24:
  }
    PBDataWriterWriteInt32Field();
LABEL_25:
  if (self->_groupViewExposureId) {
    PBDataWriterWriteDataField();
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x40) == 0)
    {
LABEL_29:
      if ((v12 & 0x80) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
LABEL_30:
  }
    PBDataWriterWriteInt32Field();
LABEL_31:
  if (self->_groupExposedInLocationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupExposedInSourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v13 = self->_groupedIssueIds;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v15);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v18 = self->_sectionIds;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v20);
  }

  if (self->_curatedSubtype) {
    PBDataWriterWriteStringField();
  }
  if (self->_curatedBatchId) {
    PBDataWriterWriteStringField();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = self->_layoutIds;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v25);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v6;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v8 = self->_groupedArticleIds;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[*(id *)(*((void *)&v62 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addGroupedArticleIds:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v10);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_groupDisplayRankInForYou;
    *(_WORD *)(v5 + 180) |= 0x10u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 0x200) == 0) {
        goto LABEL_11;
      }
      goto LABEL_53;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 56) = self->_groupArticleCountInForYou;
  *(_WORD *)(v5 + 180) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_11:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_53:
  *(_DWORD *)(v5 + 112) = self->_groupType;
  *(_WORD *)(v5 + 180) |= 0x200u;
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
LABEL_12:
    *(unsigned char *)(v5 + 177) = self->_isSubscribedToGroupFeed;
    *(_WORD *)(v5 + 180) |= 0x4000u;
  }
LABEL_13:
  uint64_t v15 = [(NSData *)self->_feedViewExposureId copyWithZone:a3];
  uint64_t v16 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_topStoryMandatoryArticleCount;
    *(_WORD *)(v5 + 180) |= 0x800u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x1000) == 0)
    {
LABEL_15:
      if ((v17 & 0x100) == 0) {
        goto LABEL_16;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_15;
  }
  *(_DWORD *)(v5 + 172) = self->_topStoryOptionalArticleCount;
  *(_WORD *)(v5 + 180) |= 0x1000u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x100) == 0)
  {
LABEL_16:
    if ((v17 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 108) = self->_groupPresentationReason;
  *(_WORD *)(v5 + 180) |= 0x100u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) == 0)
  {
LABEL_17:
    if ((v17 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 96) = self->_groupFormationReason;
  *(_WORD *)(v5 + 180) |= 0x20u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 2) == 0)
  {
LABEL_18:
    if ((v17 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 40) = self->_feedAutoSubscribeType;
  *(_WORD *)(v5 + 180) |= 2u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x8000) == 0)
  {
LABEL_19:
    if ((v17 & 1) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_60:
  *(unsigned char *)(v5 + 178) = self->_reachedEndOfGroup;
  *(_WORD *)(v5 + 180) |= 0x8000u;
  if (*(_WORD *)&self->_has)
  {
LABEL_20:
    *(_DWORD *)(v5 + 24) = self->_curatedContentType;
    *(_WORD *)(v5 + 180) |= 1u;
  }
LABEL_21:
  uint64_t v18 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  uint64_t v19 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v18;

  __int16 v20 = (__int16)self->_has;
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_groupDisplayMode;
    *(_WORD *)(v5 + 180) |= 8u;
    __int16 v20 = (__int16)self->_has;
    if ((v20 & 0x40) == 0)
    {
LABEL_23:
      if ((v20 & 0x80) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((v20 & 0x40) == 0)
  {
    goto LABEL_23;
  }
  *(_DWORD *)(v5 + 100) = self->_groupLocation;
  *(_WORD *)(v5 + 180) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_24:
    *(_DWORD *)(v5 + 104) = self->_groupLocationFeedType;
    *(_WORD *)(v5 + 180) |= 0x80u;
  }
LABEL_25:
  uint64_t v21 = [(NSString *)self->_groupExposedInLocationId copyWithZone:a3];
  v22 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v21;

  uint64_t v23 = [(NSString *)self->_groupExposedInSourceChannelId copyWithZone:a3];
  uint64_t v24 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v23;

  uint64_t v25 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v25;

  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_screenfulsFromTop;
    *(_WORD *)(v5 + 180) |= 0x400u;
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  __int16 v27 = self->_groupedIssueIds;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v59 != v30) {
          objc_enumerationMutation(v27);
        }
        long long v32 = (void *)[*(id *)(*((void *)&v58 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addGroupedIssueIds:v32];
      }
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v29);
  }

  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    *(unsigned char *)(v5 + 176) = self->_isIssueContext;
    *(_WORD *)(v5 + 180) |= 0x2000u;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v33 = self->_sectionIds;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v55;
    do
    {
      for (uint64_t k = 0; k != v35; ++k)
      {
        if (*(void *)v55 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * k) copyWithZone:a3];
        [(id)v5 addSectionIds:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v35);
  }

  uint64_t v39 = [(NSString *)self->_curatedSubtype copyWithZone:a3];
  long long v40 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v39;

  uint64_t v41 = [(NSString *)self->_curatedBatchId copyWithZone:a3];
  long long v42 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v41;

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v43 = self->_layoutIds;
  uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v50 objects:v66 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v51;
    do
    {
      for (uint64_t m = 0; m != v45; ++m)
      {
        if (*(void *)v51 != v46) {
          objc_enumerationMutation(v43);
        }
        uint64_t v48 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * m), "copyWithZone:", a3, (void)v50);
        [(id)v5 addLayoutIds:v48];
      }
      uint64_t v45 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v50 objects:v66 count:16];
    }
    while (v45);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_118;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](groupFeedId, "isEqual:")) {
      goto LABEL_118;
    }
  }
  groupedArticleIds = self->_groupedArticleIds;
  if ((unint64_t)groupedArticleIds | *((void *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](groupedArticleIds, "isEqual:")) {
      goto LABEL_118;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 90);
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_groupDisplayRankInForYou != *((_DWORD *)v4 + 16)) {
      goto LABEL_118;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_groupArticleCountInForYou != *((_DWORD *)v4 + 14)) {
      goto LABEL_118;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x200) == 0 || self->_groupType != *((_DWORD *)v4 + 28)) {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x200) != 0)
  {
    goto LABEL_118;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x4000) == 0) {
      goto LABEL_118;
    }
    if (self->_isSubscribedToGroupFeed)
    {
      if (!*((unsigned char *)v4 + 177)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 177))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x4000) != 0)
  {
    goto LABEL_118;
  }
  feedViewExposureId = self->_feedViewExposureId;
  if ((unint64_t)feedViewExposureId | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](feedViewExposureId, "isEqual:")) {
      goto LABEL_118;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v10 = *((_WORD *)v4 + 90);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x800) == 0 || self->_topStoryMandatoryArticleCount != *((_DWORD *)v4 + 42)) {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x800) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x1000) == 0 || self->_topStoryOptionalArticleCount != *((_DWORD *)v4 + 43)) {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x1000) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x100) == 0 || self->_groupPresentationReason != *((_DWORD *)v4 + 27)) {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x100) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_groupFormationReason != *((_DWORD *)v4 + 24)) {
      goto LABEL_118;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_feedAutoSubscribeType != *((_DWORD *)v4 + 10)) {
      goto LABEL_118;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_118;
  }
  if (has < 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x8000) == 0) {
      goto LABEL_118;
    }
    if (self->_reachedEndOfGroup)
    {
      if (!*((unsigned char *)v4 + 178)) {
        goto LABEL_118;
      }
    }
    else if (*((unsigned char *)v4 + 178))
    {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x8000) != 0)
  {
    goto LABEL_118;
  }
  if (has)
  {
    if ((v10 & 1) == 0 || self->_curatedContentType != *((_DWORD *)v4 + 6)) {
      goto LABEL_118;
    }
  }
  else if (v10)
  {
    goto LABEL_118;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 15))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_118;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v12 = *((_WORD *)v4 + 90);
  if ((has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_groupDisplayMode != *((_DWORD *)v4 + 15)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_groupLocation != *((_DWORD *)v4 + 25)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_118;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_groupLocationFeedType != *((_DWORD *)v4 + 26)) {
      goto LABEL_118;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_118;
  }
  groupExposedInLocationId = self->_groupExposedInLocationId;
  if ((unint64_t)groupExposedInLocationId | *((void *)v4 + 9)
    && !-[NSString isEqual:](groupExposedInLocationId, "isEqual:"))
  {
    goto LABEL_118;
  }
  groupExposedInSourceChannelId = self->_groupExposedInSourceChannelId;
  if ((unint64_t)groupExposedInSourceChannelId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](groupExposedInSourceChannelId, "isEqual:")) {
      goto LABEL_118;
    }
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_118;
    }
  }
  __int16 v16 = (__int16)self->_has;
  if ((v16 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x400) == 0 || self->_screenfulsFromTop != *((_DWORD *)v4 + 38)) {
      goto LABEL_118;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    goto LABEL_118;
  }
  groupedIssueIds = self->_groupedIssueIds;
  if ((unint64_t)groupedIssueIds | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](groupedIssueIds, "isEqual:")) {
      goto LABEL_118;
    }
    __int16 v16 = (__int16)self->_has;
  }
  if ((v16 & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x2000) != 0)
    {
      if (self->_isIssueContext)
      {
        if (!*((unsigned char *)v4 + 176)) {
          goto LABEL_118;
        }
        goto LABEL_110;
      }
      if (!*((unsigned char *)v4 + 176)) {
        goto LABEL_110;
      }
    }
LABEL_118:
    char v22 = 0;
    goto LABEL_119;
  }
  if ((*((_WORD *)v4 + 90) & 0x2000) != 0) {
    goto LABEL_118;
  }
LABEL_110:
  sectionIds = self->_sectionIds;
  if ((unint64_t)sectionIds | *((void *)v4 + 20)
    && !-[NSMutableArray isEqual:](sectionIds, "isEqual:"))
  {
    goto LABEL_118;
  }
  curatedSubtype = self->_curatedSubtype;
  if ((unint64_t)curatedSubtype | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](curatedSubtype, "isEqual:")) {
      goto LABEL_118;
    }
  }
  curatedBatchId = self->_curatedBatchId;
  if ((unint64_t)curatedBatchId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](curatedBatchId, "isEqual:")) {
      goto LABEL_118;
    }
  }
  layoutIds = self->_layoutIds;
  if ((unint64_t)layoutIds | *((void *)v4 + 18)) {
    char v22 = -[NSMutableArray isEqual:](layoutIds, "isEqual:");
  }
  else {
    char v22 = 1;
  }
LABEL_119:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v46 = [(NSString *)self->_groupFeedId hash];
  uint64_t v3 = [(NSMutableArray *)self->_groupedArticleIds hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
    uint64_t v5 = 0;
    if ((has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 2654435761 * self->_groupDisplayRankInForYou;
  if ((has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_groupArticleCountInForYou;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_groupType;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v7 = 0;
LABEL_8:
  uint64_t v45 = v3;
  uint64_t v43 = v6;
  uint64_t v44 = v5;
  uint64_t v42 = v7;
  if ((*(_WORD *)&self->_has & 0x4000) != 0) {
    uint64_t v34 = 2654435761 * self->_isSubscribedToGroupFeed;
  }
  else {
    uint64_t v34 = 0;
  }
  uint64_t v8 = [(NSData *)self->_feedViewExposureId hash];
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x800) != 0)
  {
    uint64_t v10 = 2654435761 * self->_topStoryMandatoryArticleCount;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_13:
      uint64_t v11 = 2654435761 * self->_topStoryOptionalArticleCount;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_14;
      }
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_13;
    }
  }
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_14:
    uint64_t v12 = 2654435761 * self->_groupPresentationReason;
    if ((v9 & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v12 = 0;
  if ((v9 & 0x20) != 0)
  {
LABEL_15:
    uint64_t v13 = 2654435761 * self->_groupFormationReason;
    if ((v9 & 2) != 0) {
      goto LABEL_16;
    }
LABEL_22:
    uint64_t v14 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_23;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((v9 & 2) == 0) {
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v14 = 2654435761 * self->_feedAutoSubscribeType;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v15 = 2654435761 * self->_reachedEndOfGroup;
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v15 = 0;
LABEL_24:
  uint64_t v40 = v10;
  uint64_t v41 = v8;
  uint64_t v38 = v12;
  uint64_t v39 = v11;
  uint64_t v36 = v14;
  uint64_t v37 = v13;
  uint64_t v35 = v15;
  if (v9) {
    uint64_t v33 = 2654435761 * self->_curatedContentType;
  }
  else {
    uint64_t v33 = 0;
  }
  uint64_t v16 = [(NSData *)self->_groupViewExposureId hash];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 8) != 0)
  {
    uint64_t v18 = 2654435761 * self->_groupDisplayMode;
    if ((v17 & 0x40) != 0) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v18 = 0;
    if ((v17 & 0x40) != 0)
    {
LABEL_29:
      uint64_t v19 = 2654435761 * self->_groupLocation;
      goto LABEL_32;
    }
  }
  uint64_t v19 = 0;
LABEL_32:
  uint64_t v20 = v16;
  if ((v17 & 0x80) != 0) {
    uint64_t v32 = 2654435761 * self->_groupLocationFeedType;
  }
  else {
    uint64_t v32 = 0;
  }
  NSUInteger v21 = [(NSString *)self->_groupExposedInLocationId hash];
  NSUInteger v22 = [(NSString *)self->_groupExposedInSourceChannelId hash];
  uint64_t v23 = [(NSData *)self->_articleViewingSessionId hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0) {
    uint64_t v24 = 2654435761 * self->_screenfulsFromTop;
  }
  else {
    uint64_t v24 = 0;
  }
  uint64_t v25 = [(NSMutableArray *)self->_groupedIssueIds hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    uint64_t v26 = 2654435761 * self->_isIssueContext;
  }
  else {
    uint64_t v26 = 0;
  }
  NSUInteger v27 = v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v34 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v33 ^ v20 ^ v18 ^ v19 ^ v32 ^ v21 ^ v22 ^ v23;
  uint64_t v28 = v24 ^ v25 ^ v26 ^ [(NSMutableArray *)self->_sectionIds hash];
  NSUInteger v29 = v27 ^ v28 ^ [(NSString *)self->_curatedSubtype hash];
  NSUInteger v30 = [(NSString *)self->_curatedBatchId hash];
  return v29 ^ v30 ^ [(NSMutableArray *)self->_layoutIds hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 11)) {
    -[NTPBGroupViewExposure setGroupFeedId:](self, "setGroupFeedId:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v5 = *((id *)v4 + 16);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v5);
        }
        [(NTPBGroupViewExposure *)self addGroupedArticleIds:*(void *)(*((void *)&v40 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v47 count:16];
    }
    while (v7);
  }

  __int16 v10 = *((_WORD *)v4 + 90);
  if ((v10 & 0x10) != 0)
  {
    self->_groupDisplayRankInForYou = *((_DWORD *)v4 + 16);
    *(_WORD *)&self->_has |= 0x10u;
    __int16 v10 = *((_WORD *)v4 + 90);
    if ((v10 & 4) == 0)
    {
LABEL_12:
      if ((v10 & 0x200) == 0) {
        goto LABEL_13;
      }
      goto LABEL_69;
    }
  }
  else if ((v10 & 4) == 0)
  {
    goto LABEL_12;
  }
  self->_groupArticleCountInForYou = *((_DWORD *)v4 + 14);
  *(_WORD *)&self->_has |= 4u;
  __int16 v10 = *((_WORD *)v4 + 90);
  if ((v10 & 0x200) == 0)
  {
LABEL_13:
    if ((v10 & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_69:
  self->_uint64_t groupType = *((_DWORD *)v4 + 28);
  *(_WORD *)&self->_has |= 0x200u;
  if ((*((_WORD *)v4 + 90) & 0x4000) != 0)
  {
LABEL_14:
    self->_isSubscribedToGroupFeed = *((unsigned char *)v4 + 177);
    *(_WORD *)&self->_has |= 0x4000u;
  }
LABEL_15:
  if (*((void *)v4 + 6)) {
    -[NTPBGroupViewExposure setFeedViewExposureId:](self, "setFeedViewExposureId:");
  }
  __int16 v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x800) != 0)
  {
    self->_topStoryMandatoryArticleCount = *((_DWORD *)v4 + 42);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v11 = *((_WORD *)v4 + 90);
    if ((v11 & 0x1000) == 0)
    {
LABEL_19:
      if ((v11 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_73;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x1000) == 0)
  {
    goto LABEL_19;
  }
  self->_topStoryOptionalArticleCount = *((_DWORD *)v4 + 43);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x100) == 0)
  {
LABEL_20:
    if ((v11 & 0x20) == 0) {
      goto LABEL_21;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_uint64_t groupPresentationReason = *((_DWORD *)v4 + 27);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x20) == 0)
  {
LABEL_21:
    if ((v11 & 2) == 0) {
      goto LABEL_22;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_uint64_t groupFormationReason = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v11 = *((_WORD *)v4 + 90);
  if ((v11 & 2) == 0)
  {
LABEL_22:
    if ((v11 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_uint64_t feedAutoSubscribeType = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 2u;
  __int16 v11 = *((_WORD *)v4 + 90);
  if ((v11 & 0x8000) == 0)
  {
LABEL_23:
    if ((v11 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_76:
  self->_reachedEndOfGroup = *((unsigned char *)v4 + 178);
  *(_WORD *)&self->_has |= 0x8000u;
  if (*((_WORD *)v4 + 90))
  {
LABEL_24:
    self->_uint64_t curatedContentType = *((_DWORD *)v4 + 6);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_25:
  if (*((void *)v4 + 15)) {
    -[NTPBGroupViewExposure setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  __int16 v12 = *((_WORD *)v4 + 90);
  if ((v12 & 8) != 0)
  {
    self->_groupDisplayMode = *((_DWORD *)v4 + 15);
    *(_WORD *)&self->_has |= 8u;
    __int16 v12 = *((_WORD *)v4 + 90);
    if ((v12 & 0x40) == 0)
    {
LABEL_29:
      if ((v12 & 0x80) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
  }
  else if ((v12 & 0x40) == 0)
  {
    goto LABEL_29;
  }
  self->_uint64_t groupLocation = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 90) & 0x80) != 0)
  {
LABEL_30:
    self->_uint64_t groupLocationFeedType = *((_DWORD *)v4 + 26);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_31:
  if (*((void *)v4 + 9)) {
    -[NTPBGroupViewExposure setGroupExposedInLocationId:](self, "setGroupExposedInLocationId:");
  }
  if (*((void *)v4 + 10)) {
    -[NTPBGroupViewExposure setGroupExposedInSourceChannelId:](self, "setGroupExposedInSourceChannelId:");
  }
  if (*((void *)v4 + 1)) {
    -[NTPBGroupViewExposure setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    self->_screenfulsFromTop = *((_DWORD *)v4 + 38);
    *(_WORD *)&self->_has |= 0x400u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = *((id *)v4 + 17);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v37 != v16) {
          objc_enumerationMutation(v13);
        }
        [(NTPBGroupViewExposure *)self addGroupedIssueIds:*(void *)(*((void *)&v36 + 1) + 8 * j)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v15);
  }

  if ((*((_WORD *)v4 + 90) & 0x2000) != 0)
  {
    self->_isIssueContext = *((unsigned char *)v4 + 176);
    *(_WORD *)&self->_has |= 0x2000u;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = *((id *)v4 + 20);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        [(NTPBGroupViewExposure *)self addSectionIds:*(void *)(*((void *)&v32 + 1) + 8 * k)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v20);
  }

  if (*((void *)v4 + 4)) {
    -[NTPBGroupViewExposure setCuratedSubtype:](self, "setCuratedSubtype:");
  }
  if (*((void *)v4 + 2)) {
    -[NTPBGroupViewExposure setCuratedBatchId:](self, "setCuratedBatchId:");
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v23 = *((id *)v4 + 18);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v29;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v29 != v26) {
          objc_enumerationMutation(v23);
        }
        -[NTPBGroupViewExposure addLayoutIds:](self, "addLayoutIds:", *(void *)(*((void *)&v28 + 1) + 8 * m), (void)v28);
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v25);
  }
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
}

- (NSMutableArray)groupedArticleIds
{
  return self->_groupedArticleIds;
}

- (void)setGroupedArticleIds:(id)a3
{
}

- (int)groupDisplayRankInForYou
{
  return self->_groupDisplayRankInForYou;
}

- (int)groupArticleCountInForYou
{
  return self->_groupArticleCountInForYou;
}

- (BOOL)isSubscribedToGroupFeed
{
  return self->_isSubscribedToGroupFeed;
}

- (NSData)feedViewExposureId
{
  return self->_feedViewExposureId;
}

- (void)setFeedViewExposureId:(id)a3
{
}

- (int)topStoryMandatoryArticleCount
{
  return self->_topStoryMandatoryArticleCount;
}

- (int)topStoryOptionalArticleCount
{
  return self->_topStoryOptionalArticleCount;
}

- (BOOL)reachedEndOfGroup
{
  return self->_reachedEndOfGroup;
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
}

- (NSString)groupExposedInLocationId
{
  return self->_groupExposedInLocationId;
}

- (void)setGroupExposedInLocationId:(id)a3
{
}

- (NSString)groupExposedInSourceChannelId
{
  return self->_groupExposedInSourceChannelId;
}

- (void)setGroupExposedInSourceChannelId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (int)screenfulsFromTop
{
  return self->_screenfulsFromTop;
}

- (NSMutableArray)groupedIssueIds
{
  return self->_groupedIssueIds;
}

- (void)setGroupedIssueIds:(id)a3
{
}

- (BOOL)isIssueContext
{
  return self->_isIssueContext;
}

- (NSMutableArray)sectionIds
{
  return self->_sectionIds;
}

- (void)setSectionIds:(id)a3
{
}

- (NSString)curatedSubtype
{
  return self->_curatedSubtype;
}

- (void)setCuratedSubtype:(id)a3
{
}

- (NSString)curatedBatchId
{
  return self->_curatedBatchId;
}

- (void)setCuratedBatchId:(id)a3
{
}

- (NSMutableArray)layoutIds
{
  return self->_layoutIds;
}

- (void)setLayoutIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIds, 0);
  objc_storeStrong((id *)&self->_layoutIds, 0);
  objc_storeStrong((id *)&self->_groupedIssueIds, 0);
  objc_storeStrong((id *)&self->_groupedArticleIds, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_groupExposedInSourceChannelId, 0);
  objc_storeStrong((id *)&self->_groupExposedInLocationId, 0);
  objc_storeStrong((id *)&self->_feedViewExposureId, 0);
  objc_storeStrong((id *)&self->_curatedSubtype, 0);
  objc_storeStrong((id *)&self->_curatedBatchId, 0);

  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);
}

@end