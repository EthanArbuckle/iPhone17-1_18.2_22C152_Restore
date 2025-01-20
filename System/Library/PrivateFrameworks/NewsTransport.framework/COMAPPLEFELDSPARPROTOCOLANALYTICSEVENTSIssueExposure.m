@interface COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure
+ (Class)fractionalCohortMembershipType;
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasAgedPersonalizationScore;
- (BOOL)hasAgedUserFeedbackScore;
- (BOOL)hasAutoSubscribeCtr;
- (BOOL)hasChannelData;
- (BOOL)hasComputedGlobalScoreCoefficient;
- (BOOL)hasDisplayRank;
- (BOOL)hasDiversifiedPersonalizationScore;
- (BOOL)hasFeatureCtr;
- (BOOL)hasGlobalScore;
- (BOOL)hasGroupType;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasLanguage;
- (BOOL)hasPaidNonpaidSubscriptionCtr;
- (BOOL)hasParentFeedId;
- (BOOL)hasParentFeedType;
- (BOOL)hasPersonalizationScore;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscribedChannelCtr;
- (BOOL)hasSurfacedByChannelId;
- (BOOL)hasUserFeedbackScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData)channelData;
- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData)issueData;
- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData)issueExposureData;
- (NSMutableArray)fractionalCohortMemberships;
- (NSString)language;
- (NSString)parentFeedId;
- (NSString)sourceChannelId;
- (NSString)surfacedByChannelId;
- (double)agedPersonalizationScore;
- (double)agedUserFeedbackScore;
- (double)autoSubscribeCtr;
- (double)computedGlobalScoreCoefficient;
- (double)diversifiedPersonalizationScore;
- (double)featureCtr;
- (double)globalScore;
- (double)paidNonpaidSubscriptionCtr;
- (double)personalizationScore;
- (double)subscribedChannelCtr;
- (double)userFeedbackScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3;
- (id)groupTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)displayRank;
- (int)groupType;
- (int)parentFeedType;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)hash;
- (void)addFractionalCohortMembership:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setAgedPersonalizationScore:(double)a3;
- (void)setAgedUserFeedbackScore:(double)a3;
- (void)setAutoSubscribeCtr:(double)a3;
- (void)setChannelData:(id)a3;
- (void)setComputedGlobalScoreCoefficient:(double)a3;
- (void)setDisplayRank:(int)a3;
- (void)setDiversifiedPersonalizationScore:(double)a3;
- (void)setFeatureCtr:(double)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setGlobalScore:(double)a3;
- (void)setGroupType:(int)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasAgedPersonalizationScore:(BOOL)a3;
- (void)setHasAgedUserFeedbackScore:(BOOL)a3;
- (void)setHasAutoSubscribeCtr:(BOOL)a3;
- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3;
- (void)setHasDisplayRank:(BOOL)a3;
- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3;
- (void)setHasFeatureCtr:(BOOL)a3;
- (void)setHasGlobalScore:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasPersonalizationScore:(BOOL)a3;
- (void)setHasSubscribedChannelCtr:(BOOL)a3;
- (void)setHasUserFeedbackScore:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setPaidNonpaidSubscriptionCtr:(double)a3;
- (void)setParentFeedId:(id)a3;
- (void)setParentFeedType:(int)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscribedChannelCtr:(double)a3;
- (void)setSurfacedByChannelId:(id)a3;
- (void)setUserFeedbackScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure

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

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (int)parentFeedType
{
  if ((*(_WORD *)&self->_has & 0x2000) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (id)parentFeedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444E5E0[a3];
  }

  return v3;
}

- (int)StringAsParentFeedType:(id)a3
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

- (int)groupType
{
  if ((*(_WORD *)&self->_has & 0x1000) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasGroupType
{
  return (*(_WORD *)&self->_has >> 12) & 1;
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
    __int16 v3 = off_26444E690[a3];
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

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (void)setDisplayRank:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_displayRank = a3;
}

- (void)setHasDisplayRank:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasDisplayRank
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *(_WORD *)&self->_has >> 15;
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

- (void)setPersonalizationScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_personalizationScore = a3;
}

- (void)setHasPersonalizationScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasPersonalizationScore
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setFeatureCtr:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_featureCtr = a3;
}

- (void)setHasFeatureCtr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFeatureCtr
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPaidNonpaidSubscriptionCtr:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_paidNonpaidSubscriptionCtr = a3;
}

- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasPaidNonpaidSubscriptionCtr
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAutoSubscribeCtr:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_autoSubscribeCtr = a3;
}

- (void)setHasAutoSubscribeCtr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAutoSubscribeCtr
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setComputedGlobalScoreCoefficient:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_computedGlobalScoreCoefficient = a3;
}

- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasComputedGlobalScoreCoefficient
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGlobalScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_globalScore = a3;
}

- (void)setHasGlobalScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGlobalScore
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setUserFeedbackScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userFeedbackScore = a3;
}

- (void)setHasUserFeedbackScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserFeedbackScore
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setAgedUserFeedbackScore:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_agedUserFeedbackScore = a3;
}

- (void)setHasAgedUserFeedbackScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAgedUserFeedbackScore
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAgedPersonalizationScore:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_agedPersonalizationScore = a3;
}

- (void)setHasAgedPersonalizationScore:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAgedPersonalizationScore
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDiversifiedPersonalizationScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_diversifiedPersonalizationScore = a3;
}

- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDiversifiedPersonalizationScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSubscribedChannelCtr:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_subscribedChannelCtr = a3;
}

- (void)setHasSubscribedChannelCtr:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasSubscribedChannelCtr
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasSurfacedByChannelId
{
  return self->_surfacedByChannelId != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure;
  id v4 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure *)&v8 description];
  v5 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  issueData = self->_issueData;
  if (issueData)
  {
    v5 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    v7 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"issue_exposure_data"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v9 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData *)channelData dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"channel_data"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    uint64_t parentFeedType = self->_parentFeedType;
    if (parentFeedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_26444E5E0[parentFeedType];
    }
    [v3 setObject:v13 forKey:@"parent_feed_type"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_26444E690[groupType];
    }
    [v3 setObject:v15 forKey:@"group_type"];
  }
  parentFeedId = self->_parentFeedId;
  if (parentFeedId) {
    [v3 setObject:parentFeedId forKey:@"parent_feed_id"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_23;
    }
LABEL_51:
    v32 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v32 forKey:@"ad_supported_channel"];

    if ((*(_WORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_52;
  }
  v31 = [NSNumber numberWithInt:self->_displayRank];
  [v3 setObject:v31 forKey:@"display_rank"];

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x4000) != 0) {
    goto LABEL_51;
  }
LABEL_23:
  if ((v17 & 0x8000) == 0) {
    goto LABEL_24;
  }
LABEL_52:
  v33 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
  [v3 setObject:v33 forKey:@"is_paid_subscriber_to_source_channel"];

LABEL_24:
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v19 = self->_fractionalCohortMemberships;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v45 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dictionaryRepresentation];
          [v18 addObject:v24];
        }
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"fractional_cohort_membership"];
  }
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x100) != 0)
  {
    v34 = [NSNumber numberWithDouble:self->_personalizationScore];
    [v3 setObject:v34 forKey:@"personalization_score"];

    __int16 v25 = (__int16)self->_has;
    if ((v25 & 0x20) == 0)
    {
LABEL_35:
      if ((v25 & 0x80) == 0) {
        goto LABEL_36;
      }
      goto LABEL_55;
    }
  }
  else if ((v25 & 0x20) == 0)
  {
    goto LABEL_35;
  }
  v35 = [NSNumber numberWithDouble:self->_featureCtr];
  [v3 setObject:v35 forKey:@"feature_ctr"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_36:
    if ((v25 & 4) == 0) {
      goto LABEL_37;
    }
    goto LABEL_56;
  }
LABEL_55:
  v36 = [NSNumber numberWithDouble:self->_paidNonpaidSubscriptionCtr];
  [v3 setObject:v36 forKey:@"paid_nonpaid_subscription_ctr"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 4) == 0)
  {
LABEL_37:
    if ((v25 & 8) == 0) {
      goto LABEL_38;
    }
    goto LABEL_57;
  }
LABEL_56:
  v37 = [NSNumber numberWithDouble:self->_autoSubscribeCtr];
  [v3 setObject:v37 forKey:@"auto_subscribe_ctr"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 8) == 0)
  {
LABEL_38:
    if ((v25 & 0x40) == 0) {
      goto LABEL_39;
    }
    goto LABEL_58;
  }
LABEL_57:
  v38 = [NSNumber numberWithDouble:self->_computedGlobalScoreCoefficient];
  [v3 setObject:v38 forKey:@"computed_global_score_coefficient"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x40) == 0)
  {
LABEL_39:
    if ((v25 & 0x400) == 0) {
      goto LABEL_40;
    }
    goto LABEL_59;
  }
LABEL_58:
  v39 = [NSNumber numberWithDouble:self->_globalScore];
  [v3 setObject:v39 forKey:@"global_score"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x400) == 0)
  {
LABEL_40:
    if ((v25 & 2) == 0) {
      goto LABEL_41;
    }
    goto LABEL_60;
  }
LABEL_59:
  v40 = [NSNumber numberWithDouble:self->_userFeedbackScore];
  [v3 setObject:v40 forKey:@"user_feedback_score"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 2) == 0)
  {
LABEL_41:
    if ((v25 & 1) == 0) {
      goto LABEL_42;
    }
    goto LABEL_61;
  }
LABEL_60:
  v41 = [NSNumber numberWithDouble:self->_agedUserFeedbackScore];
  [v3 setObject:v41 forKey:@"aged_user_feedback_score"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 1) == 0)
  {
LABEL_42:
    if ((v25 & 0x10) == 0) {
      goto LABEL_43;
    }
    goto LABEL_62;
  }
LABEL_61:
  v42 = [NSNumber numberWithDouble:self->_agedPersonalizationScore];
  [v3 setObject:v42 forKey:@"aged_personalization_score"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x10) == 0)
  {
LABEL_43:
    if ((v25 & 0x200) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_62:
  v43 = [NSNumber numberWithDouble:self->_diversifiedPersonalizationScore];
  [v3 setObject:v43 forKey:@"diversified_personalization_score"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_44:
    v26 = [NSNumber numberWithDouble:self->_subscribedChannelCtr];
    [v3 setObject:v26 forKey:@"subscribed_channel_ctr"];
  }
LABEL_45:
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if (surfacedByChannelId) {
    [v3 setObject:surfacedByChannelId forKey:@"surfaced_by_channel_id"];
  }
  id v29 = v3;

  return v29;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueExposureData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_channelData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_parentFeedId) {
    PBDataWriterWriteStringField();
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_43:
    PBDataWriterWriteBOOLField();
    if ((*(_WORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
  PBDataWriterWriteInt32Field();
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0) {
    goto LABEL_43;
  }
LABEL_17:
  if ((v6 & 0x8000) == 0) {
    goto LABEL_18;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
LABEL_18:
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v7 = self->_fractionalCohortMemberships;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x100) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x20) == 0)
    {
LABEL_27:
      if ((v12 & 0x80) == 0) {
        goto LABEL_28;
      }
      goto LABEL_47;
    }
  }
  else if ((v12 & 0x20) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) == 0)
  {
LABEL_28:
    if ((v12 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 4) == 0)
  {
LABEL_29:
    if ((v12 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 8) == 0)
  {
LABEL_30:
    if ((v12 & 0x40) == 0) {
      goto LABEL_31;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x40) == 0)
  {
LABEL_31:
    if ((v12 & 0x400) == 0) {
      goto LABEL_32;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x400) == 0)
  {
LABEL_32:
    if ((v12 & 2) == 0) {
      goto LABEL_33;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 2) == 0)
  {
LABEL_33:
    if ((v12 & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 1) == 0)
  {
LABEL_34:
    if ((v12 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteDoubleField();
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x10) == 0)
  {
LABEL_35:
    if ((v12 & 0x200) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_54:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_36:
  }
    PBDataWriterWriteDoubleField();
LABEL_37:
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  if (self->_surfacedByChannelId) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v13 = v4;
  if (self->_issueData)
  {
    objc_msgSend(v4, "setIssueData:");
    id v4 = v13;
  }
  if (self->_issueExposureData)
  {
    objc_msgSend(v13, "setIssueExposureData:");
    id v4 = v13;
  }
  if (self->_channelData)
  {
    objc_msgSend(v13, "setChannelData:");
    id v4 = v13;
  }
  if (self->_sourceChannelId)
  {
    objc_msgSend(v13, "setSourceChannelId:");
    id v4 = v13;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    *((_DWORD *)v4 + 40) = self->_parentFeedType;
    *((_WORD *)v4 + 94) |= 0x2000u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    *((_DWORD *)v4 + 30) = self->_groupType;
    *((_WORD *)v4 + 94) |= 0x1000u;
  }
  if (self->_parentFeedId)
  {
    objc_msgSend(v13, "setParentFeedId:");
    id v4 = v13;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_17;
    }
LABEL_42:
    *((unsigned char *)v4 + 184) = self->_adSupportedChannel;
    *((_WORD *)v4 + 94) |= 0x4000u;
    if ((*(_WORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_18;
    }
LABEL_43:
    *((unsigned char *)v4 + 185) = self->_isPaidSubscriberToSourceChannel;
    *((_WORD *)v4 + 94) |= 0x8000u;
    goto LABEL_18;
  }
  *((_DWORD *)v4 + 26) = self->_displayRank;
  *((_WORD *)v4 + 94) |= 0x800u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x4000) != 0) {
    goto LABEL_42;
  }
LABEL_17:
  if (v6 < 0) {
    goto LABEL_43;
  }
LABEL_18:
  if ([(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure *)self fractionalCohortMembershipsCount])
  {
    [v13 clearFractionalCohortMemberships];
    unint64_t v7 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure *)self fractionalCohortMembershipsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
      {
        uint64_t v10 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure *)self fractionalCohortMembershipAtIndex:i];
        [v13 addFractionalCohortMembership:v10];
      }
    }
  }
  __int16 v11 = (__int16)self->_has;
  __int16 v12 = v13;
  if ((v11 & 0x100) != 0)
  {
    *((void *)v13 + 9) = *(void *)&self->_personalizationScore;
    *((_WORD *)v13 + 94) |= 0x100u;
    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_24:
      if ((v11 & 0x80) == 0) {
        goto LABEL_25;
      }
      goto LABEL_46;
    }
  }
  else if ((v11 & 0x20) == 0)
  {
    goto LABEL_24;
  }
  *((void *)v13 + 6) = *(void *)&self->_featureCtr;
  *((_WORD *)v13 + 94) |= 0x20u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x80) == 0)
  {
LABEL_25:
    if ((v11 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((void *)v13 + 8) = *(void *)&self->_paidNonpaidSubscriptionCtr;
  *((_WORD *)v13 + 94) |= 0x80u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 4) == 0)
  {
LABEL_26:
    if ((v11 & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)v13 + 3) = *(void *)&self->_autoSubscribeCtr;
  *((_WORD *)v13 + 94) |= 4u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 8) == 0)
  {
LABEL_27:
    if ((v11 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)v13 + 4) = *(void *)&self->_computedGlobalScoreCoefficient;
  *((_WORD *)v13 + 94) |= 8u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) == 0)
  {
LABEL_28:
    if ((v11 & 0x400) == 0) {
      goto LABEL_29;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)v13 + 7) = *(void *)&self->_globalScore;
  *((_WORD *)v13 + 94) |= 0x40u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x400) == 0)
  {
LABEL_29:
    if ((v11 & 2) == 0) {
      goto LABEL_30;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)v13 + 11) = *(void *)&self->_userFeedbackScore;
  *((_WORD *)v13 + 94) |= 0x400u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 2) == 0)
  {
LABEL_30:
    if ((v11 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)v13 + 2) = *(void *)&self->_agedUserFeedbackScore;
  *((_WORD *)v13 + 94) |= 2u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 1) == 0)
  {
LABEL_31:
    if ((v11 & 0x10) == 0) {
      goto LABEL_32;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)v13 + 1) = *(void *)&self->_agedPersonalizationScore;
  *((_WORD *)v13 + 94) |= 1u;
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_32:
    if ((v11 & 0x200) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
LABEL_53:
  *((void *)v13 + 5) = *(void *)&self->_diversifiedPersonalizationScore;
  *((_WORD *)v13 + 94) |= 0x10u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_33:
    *((void *)v13 + 10) = *(void *)&self->_subscribedChannelCtr;
    *((_WORD *)v13 + 94) |= 0x200u;
  }
LABEL_34:
  if (self->_language)
  {
    objc_msgSend(v13, "setLanguage:");
    __int16 v12 = v13;
  }
  if (self->_surfacedByChannelId)
  {
    objc_msgSend(v13, "setSurfacedByChannelId:");
    __int16 v12 = v13;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData *)self->_issueData copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v6;

  id v8 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v8;

  id v10 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData *)self->_channelData copyWithZone:a3];
  __int16 v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  uint64_t v12 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  id v13 = *(void **)(v5 + 168);
  *(void *)(v5 + 168) = v12;

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_parentFeedType;
    *(_WORD *)(v5 + 188) |= 0x2000u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_groupType;
    *(_WORD *)(v5 + 188) |= 0x1000u;
  }
  uint64_t v15 = [(NSString *)self->_parentFeedId copyWithZone:a3];
  long long v16 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x800) == 0)
  {
    if ((*(_WORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_7;
    }
LABEL_29:
    *(unsigned char *)(v5 + 184) = self->_adSupportedChannel;
    *(_WORD *)(v5 + 188) |= 0x4000u;
    if ((*(_WORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
  *(_DWORD *)(v5 + 104) = self->_displayRank;
  *(_WORD *)(v5 + 188) |= 0x800u;
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x4000) != 0) {
    goto LABEL_29;
  }
LABEL_7:
  if ((v17 & 0x8000) == 0) {
    goto LABEL_8;
  }
LABEL_30:
  *(unsigned char *)(v5 + 185) = self->_isPaidSubscriberToSourceChannel;
  *(_WORD *)(v5 + 188) |= 0x8000u;
LABEL_8:
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v18 = self->_fractionalCohortMemberships;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (void)v30);
        [(id)v5 addFractionalCohortMembership:v23];
      }
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v20);
  }

  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x100) != 0)
  {
    *(double *)(v5 + 72) = self->_personalizationScore;
    *(_WORD *)(v5 + 188) |= 0x100u;
    __int16 v24 = (__int16)self->_has;
    if ((v24 & 0x20) == 0)
    {
LABEL_17:
      if ((v24 & 0x80) == 0) {
        goto LABEL_18;
      }
      goto LABEL_33;
    }
  }
  else if ((v24 & 0x20) == 0)
  {
    goto LABEL_17;
  }
  *(double *)(v5 + 48) = self->_featureCtr;
  *(_WORD *)(v5 + 188) |= 0x20u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x80) == 0)
  {
LABEL_18:
    if ((v24 & 4) == 0) {
      goto LABEL_19;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 64) = self->_paidNonpaidSubscriptionCtr;
  *(_WORD *)(v5 + 188) |= 0x80u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 4) == 0)
  {
LABEL_19:
    if ((v24 & 8) == 0) {
      goto LABEL_20;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(double *)(v5 + 24) = self->_autoSubscribeCtr;
  *(_WORD *)(v5 + 188) |= 4u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 8) == 0)
  {
LABEL_20:
    if ((v24 & 0x40) == 0) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(double *)(v5 + 32) = self->_computedGlobalScoreCoefficient;
  *(_WORD *)(v5 + 188) |= 8u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x40) == 0)
  {
LABEL_21:
    if ((v24 & 0x400) == 0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(double *)(v5 + 56) = self->_globalScore;
  *(_WORD *)(v5 + 188) |= 0x40u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x400) == 0)
  {
LABEL_22:
    if ((v24 & 2) == 0) {
      goto LABEL_23;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(double *)(v5 + 88) = self->_userFeedbackScore;
  *(_WORD *)(v5 + 188) |= 0x400u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 2) == 0)
  {
LABEL_23:
    if ((v24 & 1) == 0) {
      goto LABEL_24;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(double *)(v5 + 16) = self->_agedUserFeedbackScore;
  *(_WORD *)(v5 + 188) |= 2u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 1) == 0)
  {
LABEL_24:
    if ((v24 & 0x10) == 0) {
      goto LABEL_25;
    }
LABEL_40:
    *(double *)(v5 + 40) = self->_diversifiedPersonalizationScore;
    *(_WORD *)(v5 + 188) |= 0x10u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_39:
  *(double *)(v5 + 8) = self->_agedPersonalizationScore;
  *(_WORD *)(v5 + 188) |= 1u;
  __int16 v24 = (__int16)self->_has;
  if ((v24 & 0x10) != 0) {
    goto LABEL_40;
  }
LABEL_25:
  if ((v24 & 0x200) != 0)
  {
LABEL_26:
    *(double *)(v5 + 80) = self->_subscribedChannelCtr;
    *(_WORD *)(v5 + 188) |= 0x200u;
  }
LABEL_27:
  uint64_t v25 = -[NSString copyWithZone:](self->_language, "copyWithZone:", a3, (void)v30);
  v26 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v25;

  uint64_t v27 = [(NSString *)self->_surfacedByChannelId copyWithZone:a3];
  v28 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v27;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_106;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 16))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_106;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 17))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_106;
    }
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 12))
  {
    if (!-[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData isEqual:](channelData, "isEqual:")) {
      goto LABEL_106;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 21))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_106;
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x2000) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 40)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x2000) != 0)
  {
    goto LABEL_106;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x1000) == 0 || self->_groupType != *((_DWORD *)v4 + 30)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x1000) != 0)
  {
    goto LABEL_106;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](parentFeedId, "isEqual:")) {
      goto LABEL_106;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x800) == 0 || self->_displayRank != *((_DWORD *)v4 + 26)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x800) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x4000) == 0) {
      goto LABEL_106;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 184)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 184))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x4000) != 0)
  {
    goto LABEL_106;
  }
  if (has < 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x8000) == 0) {
      goto LABEL_106;
    }
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((unsigned char *)v4 + 185)) {
        goto LABEL_106;
      }
    }
    else if (*((unsigned char *)v4 + 185))
    {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x8000) != 0)
  {
    goto LABEL_106;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if (!((unint64_t)fractionalCohortMemberships | *((void *)v4 + 14))) {
    goto LABEL_41;
  }
  if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:"))
  {
LABEL_106:
    char v15 = 0;
    goto LABEL_107;
  }
  __int16 has = (__int16)self->_has;
LABEL_41:
  __int16 v12 = *((_WORD *)v4 + 94);
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x100) == 0 || self->_personalizationScore != *((double *)v4 + 9)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x100) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_featureCtr != *((double *)v4 + 6)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_paidNonpaidSubscriptionCtr != *((double *)v4 + 8)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_autoSubscribeCtr != *((double *)v4 + 3)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_computedGlobalScoreCoefficient != *((double *)v4 + 4)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_globalScore != *((double *)v4 + 7)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x400) == 0 || self->_userFeedbackScore != *((double *)v4 + 11)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x400) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 2) != 0)
  {
    if ((v12 & 2) == 0 || self->_agedUserFeedbackScore != *((double *)v4 + 2)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 2) != 0)
  {
    goto LABEL_106;
  }
  if (has)
  {
    if ((v12 & 1) == 0 || self->_agedPersonalizationScore != *((double *)v4 + 1)) {
      goto LABEL_106;
    }
  }
  else if (v12)
  {
    goto LABEL_106;
  }
  if ((has & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_diversifiedPersonalizationScore != *((double *)v4 + 5)) {
      goto LABEL_106;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_106;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x200) == 0 || self->_subscribedChannelCtr != *((double *)v4 + 10)) {
      goto LABEL_106;
    }
  }
  else if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
    goto LABEL_106;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 18) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_106;
  }
  surfacedByChannelId = self->_surfacedByChannelId;
  if ((unint64_t)surfacedByChannelId | *((void *)v4 + 22)) {
    char v15 = -[NSString isEqual:](surfacedByChannelId, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_107:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v75 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData *)self->_issueData hash];
  unint64_t v74 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData *)self->_issueExposureData hash];
  unint64_t v73 = [(COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData *)self->_channelData hash];
  NSUInteger v72 = [(NSString *)self->_sourceChannelId hash];
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    uint64_t v71 = 2654435761 * self->_parentFeedType;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v71 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v70 = 2654435761 * self->_groupType;
      goto LABEL_6;
    }
  }
  uint64_t v70 = 0;
LABEL_6:
  NSUInteger v69 = [(NSString *)self->_parentFeedId hash];
  if ((*(_WORD *)&self->_has & 0x800) == 0)
  {
    uint64_t v68 = 0;
    if ((*(_WORD *)&self->_has & 0x4000) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v67 = 0;
    if ((*(_WORD *)&self->_has & 0x8000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_12;
  }
  uint64_t v68 = 2654435761 * self->_displayRank;
  if ((*(_WORD *)&self->_has & 0x4000) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v67 = 2654435761 * self->_adSupportedChannel;
  if ((*(_WORD *)&self->_has & 0x8000) != 0)
  {
LABEL_9:
    uint64_t v66 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v66 = 0;
LABEL_13:
  uint64_t v65 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    double personalizationScore = self->_personalizationScore;
    double v6 = -personalizationScore;
    if (personalizationScore >= 0.0) {
      double v6 = self->_personalizationScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double featureCtr = self->_featureCtr;
    double v11 = -featureCtr;
    if (featureCtr >= 0.0) {
      double v11 = self->_featureCtr;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double paidNonpaidSubscriptionCtr = self->_paidNonpaidSubscriptionCtr;
    double v16 = -paidNonpaidSubscriptionCtr;
    if (paidNonpaidSubscriptionCtr >= 0.0) {
      double v16 = self->_paidNonpaidSubscriptionCtr;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  unint64_t v64 = v4;
  if ((has & 4) != 0)
  {
    double autoSubscribeCtr = self->_autoSubscribeCtr;
    double v21 = -autoSubscribeCtr;
    if (autoSubscribeCtr >= 0.0) {
      double v21 = self->_autoSubscribeCtr;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  unint64_t v63 = v9;
  if ((has & 8) != 0)
  {
    double computedGlobalScoreCoefficient = self->_computedGlobalScoreCoefficient;
    double v26 = -computedGlobalScoreCoefficient;
    if (computedGlobalScoreCoefficient >= 0.0) {
      double v26 = self->_computedGlobalScoreCoefficient;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  unint64_t v62 = v14;
  if ((has & 0x40) != 0)
  {
    double globalScore = self->_globalScore;
    double v31 = -globalScore;
    if (globalScore >= 0.0) {
      double v31 = self->_globalScore;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x400) != 0)
  {
    double userFeedbackScore = self->_userFeedbackScore;
    double v36 = -userFeedbackScore;
    if (userFeedbackScore >= 0.0) {
      double v36 = self->_userFeedbackScore;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((has & 2) != 0)
  {
    double agedUserFeedbackScore = self->_agedUserFeedbackScore;
    double v41 = -agedUserFeedbackScore;
    if (agedUserFeedbackScore >= 0.0) {
      double v41 = self->_agedUserFeedbackScore;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if (has)
  {
    double agedPersonalizationScore = self->_agedPersonalizationScore;
    double v46 = -agedPersonalizationScore;
    if (agedPersonalizationScore >= 0.0) {
      double v46 = self->_agedPersonalizationScore;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double diversifiedPersonalizationScore = self->_diversifiedPersonalizationScore;
    double v51 = -diversifiedPersonalizationScore;
    if (diversifiedPersonalizationScore >= 0.0) {
      double v51 = self->_diversifiedPersonalizationScore;
    }
    long double v52 = floor(v51 + 0.5);
    double v53 = (v51 - v52) * 1.84467441e19;
    unint64_t v49 = 2654435761u * (unint64_t)fmod(v52, 1.84467441e19);
    if (v53 >= 0.0)
    {
      if (v53 > 0.0) {
        v49 += (unint64_t)v53;
      }
    }
    else
    {
      v49 -= (unint64_t)fabs(v53);
    }
  }
  else
  {
    unint64_t v49 = 0;
  }
  if ((has & 0x200) != 0)
  {
    double subscribedChannelCtr = self->_subscribedChannelCtr;
    double v56 = -subscribedChannelCtr;
    if (subscribedChannelCtr >= 0.0) {
      double v56 = self->_subscribedChannelCtr;
    }
    long double v57 = floor(v56 + 0.5);
    double v58 = (v56 - v57) * 1.84467441e19;
    unint64_t v54 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
    if (v58 >= 0.0)
    {
      if (v58 > 0.0) {
        v54 += (unint64_t)v58;
      }
    }
    else
    {
      v54 -= (unint64_t)fabs(v58);
    }
  }
  else
  {
    unint64_t v54 = 0;
  }
  unint64_t v59 = v62 ^ v19 ^ v24 ^ v29 ^ v34 ^ v39 ^ v44 ^ v49 ^ v54;
  NSUInteger v60 = v59 ^ [(NSString *)self->_language hash];
  return v74 ^ v75 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v60 ^ [(NSString *)self->_surfacedByChannelId hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  issueData = self->_issueData;
  uint64_t v6 = *((void *)v4 + 16);
  if (issueData)
  {
    if (v6) {
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setIssueData:](self, "setIssueData:");
  }
  issueExposureData = self->_issueExposureData;
  uint64_t v8 = *((void *)v4 + 17);
  if (issueExposureData)
  {
    if (v8) {
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setIssueExposureData:](self, "setIssueExposureData:");
  }
  channelData = self->_channelData;
  uint64_t v10 = *((void *)v4 + 12);
  if (channelData)
  {
    if (v10) {
      -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData mergeFrom:](channelData, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setChannelData:](self, "setChannelData:");
  }
  if (*((void *)v4 + 21)) {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setSourceChannelId:](self, "setSourceChannelId:");
  }
  __int16 v11 = *((_WORD *)v4 + 94);
  if ((v11 & 0x2000) != 0)
  {
    self->_uint64_t parentFeedType = *((_DWORD *)v4 + 40);
    *(_WORD *)&self->_has |= 0x2000u;
    __int16 v11 = *((_WORD *)v4 + 94);
  }
  if ((v11 & 0x1000) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 30);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  if (*((void *)v4 + 19)) {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setParentFeedId:](self, "setParentFeedId:");
  }
  __int16 v12 = *((_WORD *)v4 + 94);
  if ((v12 & 0x800) == 0)
  {
    if ((*((_WORD *)v4 + 94) & 0x4000) == 0) {
      goto LABEL_26;
    }
LABEL_52:
    self->_adSupportedChannel = *((unsigned char *)v4 + 184);
    *(_WORD *)&self->_has |= 0x4000u;
    if ((*((_WORD *)v4 + 94) & 0x8000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_53;
  }
  self->_displayRank = *((_DWORD *)v4 + 26);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v12 = *((_WORD *)v4 + 94);
  if ((v12 & 0x4000) != 0) {
    goto LABEL_52;
  }
LABEL_26:
  if ((v12 & 0x8000) == 0) {
    goto LABEL_27;
  }
LABEL_53:
  self->_isPaidSubscriberToSourceChannel = *((unsigned char *)v4 + 185);
  *(_WORD *)&self->_has |= 0x8000u;
LABEL_27:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v13 = *((id *)v4 + 14);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v15);
  }

  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x100) != 0)
  {
    self->_double personalizationScore = *((double *)v4 + 9);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v18 = *((_WORD *)v4 + 94);
    if ((v18 & 0x20) == 0)
    {
LABEL_36:
      if ((v18 & 0x80) == 0) {
        goto LABEL_37;
      }
      goto LABEL_56;
    }
  }
  else if ((v18 & 0x20) == 0)
  {
    goto LABEL_36;
  }
  self->_double featureCtr = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x80) == 0)
  {
LABEL_37:
    if ((v18 & 4) == 0) {
      goto LABEL_38;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_double paidNonpaidSubscriptionCtr = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 4) == 0)
  {
LABEL_38:
    if ((v18 & 8) == 0) {
      goto LABEL_39;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_double autoSubscribeCtr = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 8) == 0)
  {
LABEL_39:
    if ((v18 & 0x40) == 0) {
      goto LABEL_40;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_double computedGlobalScoreCoefficient = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x40) == 0)
  {
LABEL_40:
    if ((v18 & 0x400) == 0) {
      goto LABEL_41;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_double globalScore = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x400) == 0)
  {
LABEL_41:
    if ((v18 & 2) == 0) {
      goto LABEL_42;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_double userFeedbackScore = *((double *)v4 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 2) == 0)
  {
LABEL_42:
    if ((v18 & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_double agedUserFeedbackScore = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 1) == 0)
  {
LABEL_43:
    if ((v18 & 0x10) == 0) {
      goto LABEL_44;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_double agedPersonalizationScore = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v18 = *((_WORD *)v4 + 94);
  if ((v18 & 0x10) == 0)
  {
LABEL_44:
    if ((v18 & 0x200) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_63:
  self->_double diversifiedPersonalizationScore = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)v4 + 94) & 0x200) != 0)
  {
LABEL_45:
    self->_double subscribedChannelCtr = *((double *)v4 + 10);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_46:
  if (*((void *)v4 + 18)) {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setLanguage:](self, "setLanguage:");
  }
  if (*((void *)v4 + 22)) {
    -[COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposure setSurfacedByChannelId:](self, "setSurfacedByChannelId:");
  }
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSIssueExposureData)issueExposureData
{
  return self->_issueExposureData;
}

- (void)setIssueExposureData:(id)a3
{
}

- (COMAPPLEFELDSPARPROTOCOLANALYTICSEVENTSChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
{
}

- (int)displayRank
{
  return self->_displayRank;
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (double)featureCtr
{
  return self->_featureCtr;
}

- (double)paidNonpaidSubscriptionCtr
{
  return self->_paidNonpaidSubscriptionCtr;
}

- (double)autoSubscribeCtr
{
  return self->_autoSubscribeCtr;
}

- (double)computedGlobalScoreCoefficient
{
  return self->_computedGlobalScoreCoefficient;
}

- (double)globalScore
{
  return self->_globalScore;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (double)agedUserFeedbackScore
{
  return self->_agedUserFeedbackScore;
}

- (double)agedPersonalizationScore
{
  return self->_agedPersonalizationScore;
}

- (double)diversifiedPersonalizationScore
{
  return self->_diversifiedPersonalizationScore;
}

- (double)subscribedChannelCtr
{
  return self->_subscribedChannelCtr;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)surfacedByChannelId
{
  return self->_surfacedByChannelId;
}

- (void)setSurfacedByChannelId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surfacedByChannelId, 0);
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);

  objc_storeStrong((id *)&self->_channelData, 0);
}

@end