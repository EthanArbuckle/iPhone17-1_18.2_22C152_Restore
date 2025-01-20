@interface NTPBAudioEngage
+ (Class)fractionalCohortMembershipType;
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasAgedPersonalizationScore;
- (BOOL)hasAgedUserFeedbackScore;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasAudioDeltaTimePlayed;
- (BOOL)hasAudioEngagementOriginationData;
- (BOOL)hasAudioTimePlayed;
- (BOOL)hasAutoSubscribeCtr;
- (BOOL)hasChannelData;
- (BOOL)hasComputedGlobalScoreCoefficient;
- (BOOL)hasDiversifiedPersonalizationScore;
- (BOOL)hasEngagementId;
- (BOOL)hasFeatureCtr;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasGlobalScore;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIssueData;
- (BOOL)hasIssueViewData;
- (BOOL)hasLanguage;
- (BOOL)hasListeningSource;
- (BOOL)hasPaidNonpaidSubscriptionCtr;
- (BOOL)hasPersonalizationScore;
- (BOOL)hasPlayMethod;
- (BOOL)hasPlaybackSpeed;
- (BOOL)hasPosition;
- (BOOL)hasSourceChannelId;
- (BOOL)hasSubscribedChannelCtr;
- (BOOL)hasTrackDuration;
- (BOOL)hasTrackVariant;
- (BOOL)hasUserAction;
- (BOOL)hasUserFeedbackScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSData)groupViewExposureId;
- (NSMutableArray)fractionalCohortMemberships;
- (NSString)articleId;
- (NSString)engagementId;
- (NSString)feedId;
- (NSString)groupFeedId;
- (NSString)language;
- (NSString)sourceChannelId;
- (NTPBChannelData)channelData;
- (NTPBIssueData)issueData;
- (NTPBIssueViewData)issueViewData;
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
- (float)playbackSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)fractionalCohortMembershipAtIndex:(unint64_t)a3;
- (id)groupTypeAsString:(int)a3;
- (id)trackVariantAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsTrackVariant:(id)a3;
- (int)audioEngagementOriginationData;
- (int)feedType;
- (int)groupType;
- (int)listeningSource;
- (int)playMethod;
- (int)position;
- (int)trackVariant;
- (int)userAction;
- (int64_t)audioDeltaTimePlayed;
- (int64_t)audioTimePlayed;
- (int64_t)trackDuration;
- (unint64_t)fractionalCohortMembershipsCount;
- (unint64_t)hash;
- (void)addFractionalCohortMembership:(id)a3;
- (void)clearFractionalCohortMemberships;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setAgedPersonalizationScore:(double)a3;
- (void)setAgedUserFeedbackScore:(double)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setAudioDeltaTimePlayed:(int64_t)a3;
- (void)setAudioEngagementOriginationData:(int)a3;
- (void)setAudioTimePlayed:(int64_t)a3;
- (void)setAutoSubscribeCtr:(double)a3;
- (void)setChannelData:(id)a3;
- (void)setComputedGlobalScoreCoefficient:(double)a3;
- (void)setDiversifiedPersonalizationScore:(double)a3;
- (void)setEngagementId:(id)a3;
- (void)setFeatureCtr:(double)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setFractionalCohortMemberships:(id)a3;
- (void)setGlobalScore:(double)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasAgedPersonalizationScore:(BOOL)a3;
- (void)setHasAgedUserFeedbackScore:(BOOL)a3;
- (void)setHasAudioDeltaTimePlayed:(BOOL)a3;
- (void)setHasAudioEngagementOriginationData:(BOOL)a3;
- (void)setHasAudioTimePlayed:(BOOL)a3;
- (void)setHasAutoSubscribeCtr:(BOOL)a3;
- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3;
- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3;
- (void)setHasFeatureCtr:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGlobalScore:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setHasListeningSource:(BOOL)a3;
- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3;
- (void)setHasPersonalizationScore:(BOOL)a3;
- (void)setHasPlayMethod:(BOOL)a3;
- (void)setHasPlaybackSpeed:(BOOL)a3;
- (void)setHasPosition:(BOOL)a3;
- (void)setHasSubscribedChannelCtr:(BOOL)a3;
- (void)setHasTrackDuration:(BOOL)a3;
- (void)setHasTrackVariant:(BOOL)a3;
- (void)setHasUserAction:(BOOL)a3;
- (void)setHasUserFeedbackScore:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setListeningSource:(int)a3;
- (void)setPaidNonpaidSubscriptionCtr:(double)a3;
- (void)setPersonalizationScore:(double)a3;
- (void)setPlayMethod:(int)a3;
- (void)setPlaybackSpeed:(float)a3;
- (void)setPosition:(int)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setSubscribedChannelCtr:(double)a3;
- (void)setTrackDuration:(int64_t)a3;
- (void)setTrackVariant:(int)a3;
- (void)setUserAction:(int)a3;
- (void)setUserFeedbackScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAudioEngage

- (BOOL)hasArticleId
{
  return self->_articleId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasAdSupportedChannel
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (int)groupType
{
  if (*((unsigned char *)&self->_has + 2)) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasGroupType
{
  return *((unsigned char *)&self->_has + 2) & 1;
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
    int v3 = off_26444C058[a3];
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

- (BOOL)hasGroupViewExposureId
{
  return self->_groupViewExposureId != 0;
}

- (int)feedType
{
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFeedType
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
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
    int v3 = off_26444C198[a3];
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

- (void)setTrackDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_trackDuration = a3;
}

- (void)setHasTrackDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTrackDuration
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (int)trackVariant
{
  if ((*((unsigned char *)&self->_has + 2) & 0x20) != 0) {
    return self->_trackVariant;
  }
  else {
    return 0;
  }
}

- (void)setTrackVariant:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_trackVariant = a3;
}

- (void)setHasTrackVariant:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasTrackVariant
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)trackVariantAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444C248[a3];
  }

  return v3;
}

- (int)StringAsTrackVariant:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRACK_VARIANT"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"SAMPLE_TRACK_VARIANT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"COMPLETE_TRACK_VARIANT"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setAudioTimePlayed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_audioTimePlayed = a3;
}

- (void)setHasAudioTimePlayed:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAudioTimePlayed
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAudioDeltaTimePlayed:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_audioDeltaTimePlayed = a3;
}

- (void)setHasAudioDeltaTimePlayed:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAudioDeltaTimePlayed
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)userAction
{
  if ((*((unsigned char *)&self->_has + 2) & 0x40) != 0) {
    return self->_userAction;
  }
  else {
    return 0;
  }
}

- (void)setUserAction:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_userAction = a3;
}

- (void)setHasUserAction:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasUserAction
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPosition:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_position = a3;
}

- (void)setHasPosition:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasPosition
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasEngagementId
{
  return self->_engagementId != 0;
}

- (int)playMethod
{
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    return self->_playMethod;
  }
  else {
    return 0;
  }
}

- (void)setPlayMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_playMethod = a3;
}

- (void)setHasPlayMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasPlayMethod
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (int)listeningSource
{
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    return self->_listeningSource;
  }
  else {
    return 0;
  }
}

- (void)setListeningSource:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_listeningSource = a3;
}

- (void)setHasListeningSource:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasListeningSource
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
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

- (void)setAgedPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_agedPersonalizationScore = a3;
}

- (void)setHasAgedPersonalizationScore:(BOOL)a3
{
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAgedPersonalizationScore
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAgedUserFeedbackScore:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_agedUserFeedbackScore = a3;
}

- (void)setHasAgedUserFeedbackScore:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAgedUserFeedbackScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAutoSubscribeCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_autoSubscribeCtr = a3;
}

- (void)setHasAutoSubscribeCtr:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasAutoSubscribeCtr
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setComputedGlobalScoreCoefficient:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_computedGlobalScoreCoefficient = a3;
}

- (void)setHasComputedGlobalScoreCoefficient:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasComputedGlobalScoreCoefficient
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setDiversifiedPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_diversifiedPersonalizationScore = a3;
}

- (void)setHasDiversifiedPersonalizationScore:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasDiversifiedPersonalizationScore
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setFeatureCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_featureCtr = a3;
}

- (void)setHasFeatureCtr:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasFeatureCtr
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setGlobalScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_globalScore = a3;
}

- (void)setHasGlobalScore:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGlobalScore
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPaidNonpaidSubscriptionCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_paidNonpaidSubscriptionCtr = a3;
}

- (void)setHasPaidNonpaidSubscriptionCtr:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPaidNonpaidSubscriptionCtr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setPersonalizationScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_personalizationScore = a3;
}

- (void)setHasPersonalizationScore:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPersonalizationScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSubscribedChannelCtr:(double)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_subscribedChannelCtr = a3;
}

- (void)setHasSubscribedChannelCtr:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSubscribedChannelCtr
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setUserFeedbackScore:(double)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_userFeedbackScore = a3;
}

- (void)setHasUserFeedbackScore:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasUserFeedbackScore
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasIssueData
{
  return self->_issueData != 0;
}

- (BOOL)hasIssueViewData
{
  return self->_issueViewData != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
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
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setPlaybackSpeed:(float)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_playbackSpeed = a3;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasPlaybackSpeed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (int)audioEngagementOriginationData
{
  if ((*((unsigned char *)&self->_has + 1) & 0x40) != 0) {
    return self->_audioEngagementOriginationData;
  }
  else {
    return 0;
  }
}

- (void)setAudioEngagementOriginationData:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_audioEngagementOriginationData = a3;
}

- (void)setHasAudioEngagementOriginationData:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($378D275FDE9922AC2663EB703B3A6EE4)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasAudioEngagementOriginationData
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAudioEngage;
  id v4 = [(NTPBAudioEngage *)&v8 description];
  v5 = [(NTPBAudioEngage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v4 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v4 setObject:v8 forKey:@"ad_supported_channel"];

    $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_26444C058[groupType];
    }
    [v4 setObject:v10 forKey:@"group_type"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v4 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v4 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_26444C198[feedType];
    }
    [v4 setObject:v14 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v4 setObject:feedId forKey:@"feed_id"];
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v16 = self->_has;
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    v44 = [NSNumber numberWithLongLong:self->_trackDuration];
    [v4 setObject:v44 forKey:@"track_duration"];

    $378D275FDE9922AC2663EB703B3A6EE4 v16 = self->_has;
    if ((*(_DWORD *)&v16 & 0x200000) == 0)
    {
LABEL_25:
      if ((*(unsigned char *)&v16 & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_91;
    }
  }
  else if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
    goto LABEL_25;
  }
  uint64_t trackVariant = self->_trackVariant;
  if (trackVariant >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_trackVariant);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_26444C248[trackVariant];
  }
  [v4 setObject:v46 forKey:@"track_variant"];

  $378D275FDE9922AC2663EB703B3A6EE4 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 8) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v16 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_92;
  }
LABEL_91:
  v59 = [NSNumber numberWithLongLong:self->_audioTimePlayed];
  [v4 setObject:v59 forKey:@"audio_time_played"];

  $378D275FDE9922AC2663EB703B3A6EE4 v16 = self->_has;
  if ((*(unsigned char *)&v16 & 4) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v16 & 0x400000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_93;
  }
LABEL_92:
  v60 = [NSNumber numberWithLongLong:self->_audioDeltaTimePlayed];
  [v4 setObject:v60 forKey:@"audio_delta_time_played"];

  $378D275FDE9922AC2663EB703B3A6EE4 v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x400000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v16 & 0x100000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_93:
  v61 = [NSNumber numberWithInt:self->_userAction];
  [v4 setObject:v61 forKey:@"user_action"];

  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_29:
    v17 = [NSNumber numberWithInt:self->_position];
    [v4 setObject:v17 forKey:@"position"];
  }
LABEL_30:
  engagementId = self->_engagementId;
  if (engagementId) {
    [v4 setObject:engagementId forKey:@"engagement_id"];
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v19 = self->_has;
  if ((*(_DWORD *)&v19 & 0x40000) != 0)
  {
    v20 = [NSNumber numberWithInt:self->_playMethod];
    [v4 setObject:v20 forKey:@"play_method"];

    $378D275FDE9922AC2663EB703B3A6EE4 v19 = self->_has;
  }
  if ((*(_DWORD *)&v19 & 0x20000) != 0)
  {
    v21 = [NSNumber numberWithInt:self->_listeningSource];
    [v4 setObject:v21 forKey:@"listening_source"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v4 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  if ([(NSMutableArray *)self->_fractionalCohortMemberships count])
  {
    v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_fractionalCohortMemberships, "count"));
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    v25 = self->_fractionalCohortMemberships;
    uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v62 objects:v66 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v63 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [*(id *)(*((void *)&v62 + 1) + 8 * i) dictionaryRepresentation];
          [v24 addObject:v30];
        }
        uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v62 objects:v66 count:16];
      }
      while (v27);
    }

    [v4 setObject:v24 forKey:@"fractional_cohort_membership"];
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if (*(unsigned char *)&v31)
  {
    v47 = [NSNumber numberWithDouble:self->_agedPersonalizationScore];
    [v4 setObject:v47 forKey:@"aged_personalization_score"];

    $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
    if ((*(unsigned char *)&v31 & 2) == 0)
    {
LABEL_49:
      if ((*(unsigned char *)&v31 & 0x10) == 0) {
        goto LABEL_50;
      }
      goto LABEL_77;
    }
  }
  else if ((*(unsigned char *)&v31 & 2) == 0)
  {
    goto LABEL_49;
  }
  v48 = [NSNumber numberWithDouble:self->_agedUserFeedbackScore];
  [v4 setObject:v48 forKey:@"aged_user_feedback_score"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 0x10) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v31 & 0x20) == 0) {
      goto LABEL_51;
    }
    goto LABEL_78;
  }
LABEL_77:
  v49 = [NSNumber numberWithDouble:self->_autoSubscribeCtr];
  [v4 setObject:v49 forKey:@"auto_subscribe_ctr"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 0x20) == 0)
  {
LABEL_51:
    if ((*(unsigned char *)&v31 & 0x40) == 0) {
      goto LABEL_52;
    }
    goto LABEL_79;
  }
LABEL_78:
  v50 = [NSNumber numberWithDouble:self->_computedGlobalScoreCoefficient];
  [v4 setObject:v50 forKey:@"computed_global_score_coefficient"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 0x40) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v31 & 0x80) == 0) {
      goto LABEL_53;
    }
    goto LABEL_80;
  }
LABEL_79:
  v51 = [NSNumber numberWithDouble:self->_diversifiedPersonalizationScore];
  [v4 setObject:v51 forKey:@"diversified_personalization_score"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(unsigned char *)&v31 & 0x80) == 0)
  {
LABEL_53:
    if ((*(_WORD *)&v31 & 0x100) == 0) {
      goto LABEL_54;
    }
    goto LABEL_81;
  }
LABEL_80:
  v52 = [NSNumber numberWithDouble:self->_featureCtr];
  [v4 setObject:v52 forKey:@"feature_ctr"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x100) == 0)
  {
LABEL_54:
    if ((*(_WORD *)&v31 & 0x200) == 0) {
      goto LABEL_55;
    }
    goto LABEL_82;
  }
LABEL_81:
  v53 = [NSNumber numberWithDouble:self->_globalScore];
  [v4 setObject:v53 forKey:@"global_score"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x200) == 0)
  {
LABEL_55:
    if ((*(_WORD *)&v31 & 0x400) == 0) {
      goto LABEL_56;
    }
    goto LABEL_83;
  }
LABEL_82:
  v54 = [NSNumber numberWithDouble:self->_paidNonpaidSubscriptionCtr];
  [v4 setObject:v54 forKey:@"paid_nonpaid_subscription_ctr"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x400) == 0)
  {
LABEL_56:
    if ((*(_WORD *)&v31 & 0x800) == 0) {
      goto LABEL_57;
    }
    goto LABEL_84;
  }
LABEL_83:
  v55 = [NSNumber numberWithDouble:self->_personalizationScore];
  [v4 setObject:v55 forKey:@"personalization_score"];

  $378D275FDE9922AC2663EB703B3A6EE4 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x800) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v31 & 0x2000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
LABEL_84:
  v56 = [NSNumber numberWithDouble:self->_subscribedChannelCtr];
  [v4 setObject:v56 forKey:@"subscribed_channel_ctr"];

  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_58:
    v32 = [NSNumber numberWithDouble:self->_userFeedbackScore];
    [v4 setObject:v32 forKey:@"user_feedback_score"];
  }
LABEL_59:
  issueData = self->_issueData;
  if (issueData)
  {
    v34 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v4 setObject:v34 forKey:@"issue_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v36 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v4 setObject:v36 forKey:@"issue_view_data"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v38 = [(NTPBChannelData *)channelData dictionaryRepresentation];
    [v4 setObject:v38 forKey:@"channel_data"];
  }
  language = self->_language;
  if (language) {
    [v4 setObject:language forKey:@"language"];
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x1000000) == 0)
  {
    if ((*(_DWORD *)&v40 & 0x80000) == 0) {
      goto LABEL_69;
    }
LABEL_87:
    *(float *)&double v23 = self->_playbackSpeed;
    v58 = [NSNumber numberWithFloat:v23];
    [v4 setObject:v58 forKey:@"playbackSpeed"];

    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  v57 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
  [v4 setObject:v57 forKey:@"is_paid_subscriber_to_source_channel"];

  $378D275FDE9922AC2663EB703B3A6EE4 v40 = self->_has;
  if ((*(_DWORD *)&v40 & 0x80000) != 0) {
    goto LABEL_87;
  }
LABEL_69:
  if ((*(_WORD *)&v40 & 0x4000) != 0)
  {
LABEL_70:
    v41 = [NSNumber numberWithInt:self->_audioEngagementOriginationData];
    [v4 setObject:v41 forKey:@"audio_engagement_origination_data"];
  }
LABEL_71:
  id v42 = v4;

  return v42;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioEngageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_articleId) {
    PBDataWriterWriteStringField();
  }
  if (self->_sourceChannelId) {
    PBDataWriterWriteStringField();
  }
  $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    PBDataWriterWriteBOOLField();
    $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_groupFeedId) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupViewExposureId) {
    PBDataWriterWriteDataField();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_feedId) {
    PBDataWriterWriteStringField();
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    PBDataWriterWriteInt64Field();
    $378D275FDE9922AC2663EB703B3A6EE4 v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x200000) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v6 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
    goto LABEL_19;
  }
  PBDataWriterWriteInt32Field();
  $378D275FDE9922AC2663EB703B3A6EE4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_20:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteInt64Field();
  $378D275FDE9922AC2663EB703B3A6EE4 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteInt64Field();
  $378D275FDE9922AC2663EB703B3A6EE4 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_68:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x100000) != 0) {
LABEL_23:
  }
    PBDataWriterWriteInt32Field();
LABEL_24:
  if (self->_engagementId) {
    PBDataWriterWriteStringField();
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    $378D275FDE9922AC2663EB703B3A6EE4 v7 = self->_has;
  }
  if ((*(_DWORD *)&v7 & 0x20000) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_articleViewingSessionId) {
    PBDataWriterWriteDataField();
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v8 = self->_fractionalCohortMemberships;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if (*(unsigned char *)&v13)
  {
    PBDataWriterWriteDoubleField();
    $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
    if ((*(unsigned char *)&v13 & 2) == 0)
    {
LABEL_41:
      if ((*(unsigned char *)&v13 & 0x10) == 0) {
        goto LABEL_42;
      }
      goto LABEL_72;
    }
  }
  else if ((*(unsigned char *)&v13 & 2) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&v13 & 0x20) == 0) {
      goto LABEL_43;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x20) == 0)
  {
LABEL_43:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_44;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v13 & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x80) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v13 & 0x200) == 0) {
      goto LABEL_47;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v13 & 0x800) == 0) {
      goto LABEL_49;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteDoubleField();
  $378D275FDE9922AC2663EB703B3A6EE4 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) == 0)
  {
LABEL_49:
    if ((*(_WORD *)&v13 & 0x2000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_79:
  PBDataWriterWriteDoubleField();
  if ((*(_DWORD *)&self->_has & 0x2000) != 0) {
LABEL_50:
  }
    PBDataWriterWriteDoubleField();
LABEL_51:
  if (self->_issueData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_issueViewData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_channelData) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_language) {
    PBDataWriterWriteStringField();
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
    if ((*(_DWORD *)&v14 & 0x80000) == 0) {
      goto LABEL_61;
    }
LABEL_82:
    PBDataWriterWriteFloatField();
    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
  PBDataWriterWriteBOOLField();
  $378D275FDE9922AC2663EB703B3A6EE4 v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x80000) != 0) {
    goto LABEL_82;
  }
LABEL_61:
  if ((*(_WORD *)&v14 & 0x4000) != 0) {
LABEL_62:
  }
    PBDataWriterWriteInt32Field();
LABEL_63:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  $378D275FDE9922AC2663EB703B3A6EE4 v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 248);
  *(void *)(v5 + 248) = v8;

  $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    *(unsigned char *)(v5 + 264) = self->_adSupportedChannel;
    *(_DWORD *)(v5 + 268) |= 0x800000u;
    $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    *(_DWORD *)(v5 + 192) = self->_groupType;
    *(_DWORD *)(v5 + 268) |= 0x10000u;
  }
  uint64_t v11 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v11;

  uint64_t v13 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  $378D275FDE9922AC2663EB703B3A6EE4 v14 = *(void **)(v5 + 200);
  *(void *)(v5 + 200) = v13;

  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_feedType;
    *(_DWORD *)(v5 + 268) |= 0x8000u;
  }
  uint64_t v15 = [(NSString *)self->_feedId copyWithZone:a3];
  long long v16 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v15;

  $378D275FDE9922AC2663EB703B3A6EE4 v17 = self->_has;
  if ((*(_WORD *)&v17 & 0x1000) != 0)
  {
    *(void *)(v5 + 104) = self->_trackDuration;
    *(_DWORD *)(v5 + 268) |= 0x1000u;
    $378D275FDE9922AC2663EB703B3A6EE4 v17 = self->_has;
    if ((*(_DWORD *)&v17 & 0x200000) == 0)
    {
LABEL_9:
      if ((*(unsigned char *)&v17 & 8) == 0) {
        goto LABEL_10;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_DWORD *)&v17 & 0x200000) == 0)
  {
    goto LABEL_9;
  }
  *(_DWORD *)(v5 + 256) = self->_trackVariant;
  *(_DWORD *)(v5 + 268) |= 0x200000u;
  $378D275FDE9922AC2663EB703B3A6EE4 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&v17 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(void *)(v5 + 32) = self->_audioTimePlayed;
  *(_DWORD *)(v5 + 268) |= 8u;
  $378D275FDE9922AC2663EB703B3A6EE4 v17 = self->_has;
  if ((*(unsigned char *)&v17 & 4) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&v17 & 0x400000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(void *)(v5 + 24) = self->_audioDeltaTimePlayed;
  *(_DWORD *)(v5 + 268) |= 4u;
  $378D275FDE9922AC2663EB703B3A6EE4 v17 = self->_has;
  if ((*(_DWORD *)&v17 & 0x400000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v17 & 0x100000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_46:
  *(_DWORD *)(v5 + 260) = self->_userAction;
  *(_DWORD *)(v5 + 268) |= 0x400000u;
  if ((*(_DWORD *)&self->_has & 0x100000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 244) = self->_position;
    *(_DWORD *)(v5 + 268) |= 0x100000u;
  }
LABEL_14:
  uint64_t v18 = [(NSString *)self->_engagementId copyWithZone:a3];
  $378D275FDE9922AC2663EB703B3A6EE4 v19 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v18;

  $378D275FDE9922AC2663EB703B3A6EE4 v20 = self->_has;
  if ((*(_DWORD *)&v20 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 236) = self->_playMethod;
    *(_DWORD *)(v5 + 268) |= 0x40000u;
    $378D275FDE9922AC2663EB703B3A6EE4 v20 = self->_has;
  }
  if ((*(_DWORD *)&v20 & 0x20000) != 0)
  {
    *(_DWORD *)(v5 + 232) = self->_listeningSource;
    *(_DWORD *)(v5 + 268) |= 0x20000u;
  }
  uint64_t v21 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v22 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v21;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  double v23 = self->_fractionalCohortMemberships;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * v27), "copyWithZone:", a3, (void)v40);
        [(id)v5 addFractionalCohortMembership:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v25);
  }

  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if (*(unsigned char *)&v29)
  {
    *(double *)(v5 + 8) = self->_agedPersonalizationScore;
    *(_DWORD *)(v5 + 268) |= 1u;
    $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
    if ((*(unsigned char *)&v29 & 2) == 0)
    {
LABEL_27:
      if ((*(unsigned char *)&v29 & 0x10) == 0) {
        goto LABEL_28;
      }
      goto LABEL_50;
    }
  }
  else if ((*(unsigned char *)&v29 & 2) == 0)
  {
    goto LABEL_27;
  }
  *(double *)(v5 + 16) = self->_agedUserFeedbackScore;
  *(_DWORD *)(v5 + 268) |= 2u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v29 & 0x20) == 0) {
      goto LABEL_29;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(double *)(v5 + 40) = self->_autoSubscribeCtr;
  *(_DWORD *)(v5 + 268) |= 0x10u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x20) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v29 & 0x40) == 0) {
      goto LABEL_30;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(double *)(v5 + 48) = self->_computedGlobalScoreCoefficient;
  *(_DWORD *)(v5 + 268) |= 0x20u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x40) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v29 & 0x80) == 0) {
      goto LABEL_31;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(double *)(v5 + 56) = self->_diversifiedPersonalizationScore;
  *(_DWORD *)(v5 + 268) |= 0x40u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x80) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v29 & 0x100) == 0) {
      goto LABEL_32;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(double *)(v5 + 64) = self->_featureCtr;
  *(_DWORD *)(v5 + 268) |= 0x80u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x100) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v29 & 0x200) == 0) {
      goto LABEL_33;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(double *)(v5 + 72) = self->_globalScore;
  *(_DWORD *)(v5 + 268) |= 0x100u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x200) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v29 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(double *)(v5 + 80) = self->_paidNonpaidSubscriptionCtr;
  *(_DWORD *)(v5 + 268) |= 0x200u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v29 & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(double *)(v5 + 88) = self->_personalizationScore;
  *(_DWORD *)(v5 + 268) |= 0x400u;
  $378D275FDE9922AC2663EB703B3A6EE4 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v29 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_57:
  *(double *)(v5 + 96) = self->_subscribedChannelCtr;
  *(_DWORD *)(v5 + 268) |= 0x800u;
  if ((*(_DWORD *)&self->_has & 0x2000) != 0)
  {
LABEL_36:
    *(double *)(v5 + 112) = self->_userFeedbackScore;
    *(_DWORD *)(v5 + 268) |= 0x2000u;
  }
LABEL_37:
  id v30 = -[NTPBIssueData copyWithZone:](self->_issueData, "copyWithZone:", a3, (void)v40);
  $378D275FDE9922AC2663EB703B3A6EE4 v31 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v30;

  id v32 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v33 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v32;

  id v34 = [(NTPBChannelData *)self->_channelData copyWithZone:a3];
  v35 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v34;

  uint64_t v36 = [(NSString *)self->_language copyWithZone:a3];
  v37 = *(void **)(v5 + 224);
  *(void *)(v5 + 224) = v36;

  $378D275FDE9922AC2663EB703B3A6EE4 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x1000000) == 0)
  {
    if ((*(_DWORD *)&v38 & 0x80000) == 0) {
      goto LABEL_39;
    }
LABEL_60:
    *(float *)(v5 + 240) = self->_playbackSpeed;
    *(_DWORD *)(v5 + 268) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x4000) == 0) {
      return (id)v5;
    }
    goto LABEL_40;
  }
  *(unsigned char *)(v5 + 265) = self->_isPaidSubscriberToSourceChannel;
  *(_DWORD *)(v5 + 268) |= 0x1000000u;
  $378D275FDE9922AC2663EB703B3A6EE4 v38 = self->_has;
  if ((*(_DWORD *)&v38 & 0x80000) != 0) {
    goto LABEL_60;
  }
LABEL_39:
  if ((*(_WORD *)&v38 & 0x4000) != 0)
  {
LABEL_40:
    *(_DWORD *)(v5 + 136) = self->_audioEngagementOriginationData;
    *(_DWORD *)(v5 + 268) |= 0x4000u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_159;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_159;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 31))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_159;
    }
  }
  $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  int v8 = *((_DWORD *)v4 + 67);
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0) {
      goto LABEL_159;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 264)) {
        goto LABEL_159;
      }
    }
    else if (*((unsigned char *)v4 + 264))
    {
      goto LABEL_159;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_groupType != *((_DWORD *)v4 + 48)) {
      goto LABEL_159;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_159;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 23)
    && !-[NSString isEqual:](groupFeedId, "isEqual:"))
  {
    goto LABEL_159;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 25))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_159;
    }
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v11 = self->_has;
  int v12 = *((_DWORD *)v4 + 67);
  if ((*(_WORD *)&v11 & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_feedType != *((_DWORD *)v4 + 42)) {
      goto LABEL_159;
    }
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_159;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_159;
    }
    $378D275FDE9922AC2663EB703B3A6EE4 v11 = self->_has;
  }
  int v14 = *((_DWORD *)v4 + 67);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v14 & 0x1000) == 0 || self->_trackDuration != *((void *)v4 + 13)) {
      goto LABEL_159;
    }
  }
  else if ((v14 & 0x1000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x200000) != 0)
  {
    if ((v14 & 0x200000) == 0 || self->_trackVariant != *((_DWORD *)v4 + 64)) {
      goto LABEL_159;
    }
  }
  else if ((v14 & 0x200000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v11 & 8) != 0)
  {
    if ((v14 & 8) == 0 || self->_audioTimePlayed != *((void *)v4 + 4)) {
      goto LABEL_159;
    }
  }
  else if ((v14 & 8) != 0)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v11 & 4) != 0)
  {
    if ((v14 & 4) == 0 || self->_audioDeltaTimePlayed != *((void *)v4 + 3)) {
      goto LABEL_159;
    }
  }
  else if ((v14 & 4) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x400000) != 0)
  {
    if ((v14 & 0x400000) == 0 || self->_userAction != *((_DWORD *)v4 + 65)) {
      goto LABEL_159;
    }
  }
  else if ((v14 & 0x400000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x100000) != 0)
  {
    if ((v14 & 0x100000) == 0 || self->_position != *((_DWORD *)v4 + 61)) {
      goto LABEL_159;
    }
  }
  else if ((v14 & 0x100000) != 0)
  {
    goto LABEL_159;
  }
  engagementId = self->_engagementId;
  if ((unint64_t)engagementId | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](engagementId, "isEqual:")) {
      goto LABEL_159;
    }
    $378D275FDE9922AC2663EB703B3A6EE4 v11 = self->_has;
  }
  int v16 = *((_DWORD *)v4 + 67);
  if ((*(_DWORD *)&v11 & 0x40000) != 0)
  {
    if ((v16 & 0x40000) == 0 || self->_playMethod != *((_DWORD *)v4 + 59)) {
      goto LABEL_159;
    }
  }
  else if ((v16 & 0x40000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v16 & 0x20000) == 0 || self->_listeningSource != *((_DWORD *)v4 + 58)) {
      goto LABEL_159;
    }
  }
  else if ((v16 & 0x20000) != 0)
  {
    goto LABEL_159;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 16)
    && !-[NSData isEqual:](articleViewingSessionId, "isEqual:"))
  {
    goto LABEL_159;
  }
  fractionalCohortMemberships = self->_fractionalCohortMemberships;
  if ((unint64_t)fractionalCohortMemberships | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](fractionalCohortMemberships, "isEqual:")) {
      goto LABEL_159;
    }
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v19 = self->_has;
  int v20 = *((_DWORD *)v4 + 67);
  if (*(unsigned char *)&v19)
  {
    if ((v20 & 1) == 0 || self->_agedPersonalizationScore != *((double *)v4 + 1)) {
      goto LABEL_159;
    }
  }
  else if (v20)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v19 & 2) != 0)
  {
    if ((v20 & 2) == 0 || self->_agedUserFeedbackScore != *((double *)v4 + 2)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 2) != 0)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v19 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0 || self->_autoSubscribeCtr != *((double *)v4 + 5)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v19 & 0x20) != 0)
  {
    if ((v20 & 0x20) == 0 || self->_computedGlobalScoreCoefficient != *((double *)v4 + 6)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x20) != 0)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v19 & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_diversifiedPersonalizationScore != *((double *)v4 + 7)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_159;
  }
  if ((*(unsigned char *)&v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_featureCtr != *((double *)v4 + 8)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x100) != 0)
  {
    if ((v20 & 0x100) == 0 || self->_globalScore != *((double *)v4 + 9)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x100) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    if ((v20 & 0x200) == 0 || self->_paidNonpaidSubscriptionCtr != *((double *)v4 + 10)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x200) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x400) != 0)
  {
    if ((v20 & 0x400) == 0 || self->_personalizationScore != *((double *)v4 + 11)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x400) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x800) != 0)
  {
    if ((v20 & 0x800) == 0 || self->_subscribedChannelCtr != *((double *)v4 + 12)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x800) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    if ((v20 & 0x2000) == 0 || self->_userFeedbackScore != *((double *)v4 + 14)) {
      goto LABEL_159;
    }
  }
  else if ((v20 & 0x2000) != 0)
  {
    goto LABEL_159;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 26) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_159;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 27))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_159;
    }
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 18))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:")) {
      goto LABEL_159;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 28))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_159;
    }
  }
  $378D275FDE9922AC2663EB703B3A6EE4 v25 = self->_has;
  int v26 = *((_DWORD *)v4 + 67);
  if ((*(_DWORD *)&v25 & 0x1000000) != 0)
  {
    if ((v26 & 0x1000000) != 0)
    {
      if (self->_isPaidSubscriberToSourceChannel)
      {
        if (!*((unsigned char *)v4 + 265)) {
          goto LABEL_159;
        }
        goto LABEL_149;
      }
      if (!*((unsigned char *)v4 + 265)) {
        goto LABEL_149;
      }
    }
LABEL_159:
    BOOL v27 = 0;
    goto LABEL_160;
  }
  if ((v26 & 0x1000000) != 0) {
    goto LABEL_159;
  }
LABEL_149:
  if ((*(_DWORD *)&v25 & 0x80000) != 0)
  {
    if ((v26 & 0x80000) == 0 || self->_playbackSpeed != *((float *)v4 + 60)) {
      goto LABEL_159;
    }
  }
  else if ((v26 & 0x80000) != 0)
  {
    goto LABEL_159;
  }
  if ((*(_WORD *)&v25 & 0x4000) != 0)
  {
    if ((v26 & 0x4000) == 0 || self->_audioEngagementOriginationData != *((_DWORD *)v4 + 34)) {
      goto LABEL_159;
    }
    BOOL v27 = 1;
  }
  else
  {
    BOOL v27 = (*((_DWORD *)v4 + 67) & 0x4000) == 0;
  }
LABEL_160:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v101 = [(NSString *)self->_articleId hash];
  NSUInteger v100 = [(NSString *)self->_sourceChannelId hash];
  $378D275FDE9922AC2663EB703B3A6EE4 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    uint64_t v99 = 2654435761 * self->_adSupportedChannel;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v99 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
LABEL_3:
      uint64_t v98 = 2654435761 * self->_groupType;
      goto LABEL_6;
    }
  }
  uint64_t v98 = 0;
LABEL_6:
  NSUInteger v97 = [(NSString *)self->_groupFeedId hash];
  uint64_t v96 = [(NSData *)self->_groupViewExposureId hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x80) != 0) {
    uint64_t v95 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v95 = 0;
  }
  NSUInteger v94 = [(NSString *)self->_feedId hash];
  $378D275FDE9922AC2663EB703B3A6EE4 v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
    uint64_t v93 = 2654435761 * self->_trackDuration;
    if ((*(_DWORD *)&v4 & 0x200000) != 0)
    {
LABEL_11:
      uint64_t v92 = 2654435761 * self->_trackVariant;
      if ((*(unsigned char *)&v4 & 8) != 0) {
        goto LABEL_12;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v93 = 0;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_11;
    }
  }
  uint64_t v92 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_12:
    uint64_t v91 = 2654435761 * self->_audioTimePlayed;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_13;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v91 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_13:
    uint64_t v90 = 2654435761 * self->_audioDeltaTimePlayed;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_14;
    }
LABEL_20:
    uint64_t v89 = 0;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v90 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) == 0) {
    goto LABEL_20;
  }
LABEL_14:
  uint64_t v89 = 2654435761 * self->_userAction;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_15:
    uint64_t v88 = 2654435761 * self->_position;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v88 = 0;
LABEL_22:
  NSUInteger v87 = [(NSString *)self->_engagementId hash];
  $378D275FDE9922AC2663EB703B3A6EE4 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    uint64_t v86 = 2654435761 * self->_playMethod;
    if ((*(_DWORD *)&v5 & 0x20000) != 0) {
      goto LABEL_24;
    }
  }
  else
  {
    uint64_t v86 = 0;
    if ((*(_DWORD *)&v5 & 0x20000) != 0)
    {
LABEL_24:
      uint64_t v85 = 2654435761 * self->_listeningSource;
      goto LABEL_27;
    }
  }
  uint64_t v85 = 0;
LABEL_27:
  uint64_t v84 = [(NSData *)self->_articleViewingSessionId hash];
  uint64_t v83 = [(NSMutableArray *)self->_fractionalCohortMemberships hash];
  $378D275FDE9922AC2663EB703B3A6EE4 v6 = self->_has;
  if (*(unsigned char *)&v6)
  {
    double agedPersonalizationScore = self->_agedPersonalizationScore;
    double v9 = -agedPersonalizationScore;
    if (agedPersonalizationScore >= 0.0) {
      double v9 = self->_agedPersonalizationScore;
    }
    long double v10 = floor(v9 + 0.5);
    double v11 = (v9 - v10) * 1.84467441e19;
    unint64_t v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0) {
        v7 += (unint64_t)v11;
      }
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
  if ((*(unsigned char *)&v6 & 2) != 0)
  {
    double agedUserFeedbackScore = self->_agedUserFeedbackScore;
    double v14 = -agedUserFeedbackScore;
    if (agedUserFeedbackScore >= 0.0) {
      double v14 = self->_agedUserFeedbackScore;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((*(unsigned char *)&v6 & 0x10) != 0)
  {
    double autoSubscribeCtr = self->_autoSubscribeCtr;
    double v19 = -autoSubscribeCtr;
    if (autoSubscribeCtr >= 0.0) {
      double v19 = self->_autoSubscribeCtr;
    }
    long double v20 = floor(v19 + 0.5);
    double v21 = (v19 - v20) * 1.84467441e19;
    unint64_t v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0) {
        v17 += (unint64_t)v21;
      }
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    unint64_t v17 = 0;
  }
  if ((*(unsigned char *)&v6 & 0x20) != 0)
  {
    double computedGlobalScoreCoefficient = self->_computedGlobalScoreCoefficient;
    double v24 = -computedGlobalScoreCoefficient;
    if (computedGlobalScoreCoefficient >= 0.0) {
      double v24 = self->_computedGlobalScoreCoefficient;
    }
    long double v25 = floor(v24 + 0.5);
    double v26 = (v24 - v25) * 1.84467441e19;
    unint64_t v22 = 2654435761u * (unint64_t)fmod(v25, 1.84467441e19);
    if (v26 >= 0.0)
    {
      if (v26 > 0.0) {
        v22 += (unint64_t)v26;
      }
    }
    else
    {
      v22 -= (unint64_t)fabs(v26);
    }
  }
  else
  {
    unint64_t v22 = 0;
  }
  if ((*(unsigned char *)&v6 & 0x40) != 0)
  {
    double diversifiedPersonalizationScore = self->_diversifiedPersonalizationScore;
    double v29 = -diversifiedPersonalizationScore;
    if (diversifiedPersonalizationScore >= 0.0) {
      double v29 = self->_diversifiedPersonalizationScore;
    }
    long double v30 = floor(v29 + 0.5);
    double v31 = (v29 - v30) * 1.84467441e19;
    unint64_t v27 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
    if (v31 >= 0.0)
    {
      if (v31 > 0.0) {
        v27 += (unint64_t)v31;
      }
    }
    else
    {
      v27 -= (unint64_t)fabs(v31);
    }
  }
  else
  {
    unint64_t v27 = 0;
  }
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    double featureCtr = self->_featureCtr;
    double v34 = -featureCtr;
    if (featureCtr >= 0.0) {
      double v34 = self->_featureCtr;
    }
    long double v35 = floor(v34 + 0.5);
    double v36 = (v34 - v35) * 1.84467441e19;
    unint64_t v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0) {
        v32 += (unint64_t)v36;
      }
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    unint64_t v32 = 0;
  }
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    double globalScore = self->_globalScore;
    double v39 = -globalScore;
    if (globalScore >= 0.0) {
      double v39 = self->_globalScore;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  unint64_t v77 = v37;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    double paidNonpaidSubscriptionCtr = self->_paidNonpaidSubscriptionCtr;
    double v44 = -paidNonpaidSubscriptionCtr;
    if (paidNonpaidSubscriptionCtr >= 0.0) {
      double v44 = self->_paidNonpaidSubscriptionCtr;
    }
    long double v45 = floor(v44 + 0.5);
    double v46 = (v44 - v45) * 1.84467441e19;
    unint64_t v42 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0) {
        v42 += (unint64_t)v46;
      }
    }
    else
    {
      v42 -= (unint64_t)fabs(v46);
    }
  }
  else
  {
    unint64_t v42 = 0;
  }
  unint64_t v76 = v42;
  if ((*(_WORD *)&v6 & 0x400) != 0)
  {
    double personalizationScore = self->_personalizationScore;
    double v49 = -personalizationScore;
    if (personalizationScore >= 0.0) {
      double v49 = self->_personalizationScore;
    }
    long double v50 = floor(v49 + 0.5);
    double v51 = (v49 - v50) * 1.84467441e19;
    unint64_t v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0) {
        v47 += (unint64_t)v51;
      }
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    unint64_t v47 = 0;
  }
  unint64_t v75 = v47;
  unint64_t v80 = v17;
  if ((*(_WORD *)&v6 & 0x800) != 0)
  {
    double subscribedChannelCtr = self->_subscribedChannelCtr;
    double v54 = -subscribedChannelCtr;
    if (subscribedChannelCtr >= 0.0) {
      double v54 = self->_subscribedChannelCtr;
    }
    long double v55 = floor(v54 + 0.5);
    double v56 = (v54 - v55) * 1.84467441e19;
    unint64_t v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0) {
        v52 += (unint64_t)v56;
      }
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    unint64_t v52 = 0;
  }
  unint64_t v81 = v12;
  unint64_t v82 = v7;
  unint64_t v79 = v22;
  unint64_t v78 = v32;
  if ((*(_WORD *)&v6 & 0x2000) != 0)
  {
    double userFeedbackScore = self->_userFeedbackScore;
    double v59 = -userFeedbackScore;
    if (userFeedbackScore >= 0.0) {
      double v59 = self->_userFeedbackScore;
    }
    long double v60 = floor(v59 + 0.5);
    double v61 = (v59 - v60) * 1.84467441e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    unint64_t v57 = 0;
  }
  unint64_t v62 = [(NTPBIssueData *)self->_issueData hash];
  unint64_t v63 = [(NTPBIssueViewData *)self->_issueViewData hash];
  unint64_t v64 = [(NTPBChannelData *)self->_channelData hash];
  NSUInteger v65 = [(NSString *)self->_language hash];
  $378D275FDE9922AC2663EB703B3A6EE4 v66 = self->_has;
  if ((*(_DWORD *)&v66 & 0x1000000) != 0)
  {
    uint64_t v67 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
    if ((*(_DWORD *)&v66 & 0x80000) != 0) {
      goto LABEL_117;
    }
LABEL_122:
    unint64_t v72 = 0;
    goto LABEL_125;
  }
  uint64_t v67 = 0;
  if ((*(_DWORD *)&v66 & 0x80000) == 0) {
    goto LABEL_122;
  }
LABEL_117:
  float playbackSpeed = self->_playbackSpeed;
  float v69 = -playbackSpeed;
  if (playbackSpeed >= 0.0) {
    float v69 = self->_playbackSpeed;
  }
  float v70 = floorf(v69 + 0.5);
  float v71 = (float)(v69 - v70) * 1.8447e19;
  unint64_t v72 = 2654435761u * (unint64_t)fmodf(v70, 1.8447e19);
  if (v71 >= 0.0)
  {
    if (v71 > 0.0) {
      v72 += (unint64_t)v71;
    }
  }
  else
  {
    v72 -= (unint64_t)fabsf(v71);
  }
LABEL_125:
  if ((*(_WORD *)&v66 & 0x4000) != 0) {
    uint64_t v73 = 2654435761 * self->_audioEngagementOriginationData;
  }
  else {
    uint64_t v73 = 0;
  }
  return v100 ^ v101 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v27 ^ v78 ^ v77 ^ v76 ^ v75 ^ v52 ^ v57 ^ v62 ^ v63 ^ v64 ^ v65 ^ v67 ^ v72 ^ v73;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 15)) {
    -[NTPBAudioEngage setArticleId:](self, "setArticleId:");
  }
  if (*((void *)v4 + 31)) {
    -[NTPBAudioEngage setSourceChannelId:](self, "setSourceChannelId:");
  }
  int v5 = *((_DWORD *)v4 + 67);
  if ((v5 & 0x800000) != 0)
  {
    self->_adSupportedChannel = *((unsigned char *)v4 + 264);
    *(_DWORD *)&self->_has |= 0x800000u;
    int v5 = *((_DWORD *)v4 + 67);
  }
  if ((v5 & 0x10000) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 48);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
  if (*((void *)v4 + 23)) {
    -[NTPBAudioEngage setGroupFeedId:](self, "setGroupFeedId:");
  }
  if (*((void *)v4 + 25)) {
    -[NTPBAudioEngage setGroupViewExposureId:](self, "setGroupViewExposureId:");
  }
  if ((*((unsigned char *)v4 + 269) & 0x80) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v4 + 42);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((void *)v4 + 20)) {
    -[NTPBAudioEngage setFeedId:](self, "setFeedId:");
  }
  int v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 0x1000) != 0)
  {
    self->_trackDuration = *((void *)v4 + 13);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v6 = *((_DWORD *)v4 + 67);
    if ((v6 & 0x200000) == 0)
    {
LABEL_19:
      if ((v6 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_56;
    }
  }
  else if ((v6 & 0x200000) == 0)
  {
    goto LABEL_19;
  }
  self->_uint64_t trackVariant = *((_DWORD *)v4 + 64);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 8) == 0)
  {
LABEL_20:
    if ((v6 & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_audioTimePlayed = *((void *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 4) == 0)
  {
LABEL_21:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_audioDeltaTimePlayed = *((void *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v6 = *((_DWORD *)v4 + 67);
  if ((v6 & 0x400000) == 0)
  {
LABEL_22:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_58:
  self->_userAction = *((_DWORD *)v4 + 65);
  *(_DWORD *)&self->_has |= 0x400000u;
  if ((*((_DWORD *)v4 + 67) & 0x100000) != 0)
  {
LABEL_23:
    self->_position = *((_DWORD *)v4 + 61);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
LABEL_24:
  if (*((void *)v4 + 19)) {
    -[NTPBAudioEngage setEngagementId:](self, "setEngagementId:");
  }
  int v7 = *((_DWORD *)v4 + 67);
  if ((v7 & 0x40000) != 0)
  {
    self->_playMethod = *((_DWORD *)v4 + 59);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v7 = *((_DWORD *)v4 + 67);
  }
  if ((v7 & 0x20000) != 0)
  {
    self->_listeningSource = *((_DWORD *)v4 + 58);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)v4 + 16)) {
    -[NTPBAudioEngage setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = *((id *)v4 + 22);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        -[NTPBAudioEngage addFractionalCohortMembership:](self, "addFractionalCohortMembership:", *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  int v13 = *((_DWORD *)v4 + 67);
  if (v13)
  {
    self->_double agedPersonalizationScore = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v13 = *((_DWORD *)v4 + 67);
    if ((v13 & 2) == 0)
    {
LABEL_41:
      if ((v13 & 0x10) == 0) {
        goto LABEL_42;
      }
      goto LABEL_62;
    }
  }
  else if ((v13 & 2) == 0)
  {
    goto LABEL_41;
  }
  self->_double agedUserFeedbackScore = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x10) == 0)
  {
LABEL_42:
    if ((v13 & 0x20) == 0) {
      goto LABEL_43;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_double autoSubscribeCtr = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x20) == 0)
  {
LABEL_43:
    if ((v13 & 0x40) == 0) {
      goto LABEL_44;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_double computedGlobalScoreCoefficient = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x40) == 0)
  {
LABEL_44:
    if ((v13 & 0x80) == 0) {
      goto LABEL_45;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_double diversifiedPersonalizationScore = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x80) == 0)
  {
LABEL_45:
    if ((v13 & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_double featureCtr = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x100) == 0)
  {
LABEL_46:
    if ((v13 & 0x200) == 0) {
      goto LABEL_47;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_double globalScore = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x200) == 0)
  {
LABEL_47:
    if ((v13 & 0x400) == 0) {
      goto LABEL_48;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_double paidNonpaidSubscriptionCtr = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x400) == 0)
  {
LABEL_48:
    if ((v13 & 0x800) == 0) {
      goto LABEL_49;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_double personalizationScore = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v13 = *((_DWORD *)v4 + 67);
  if ((v13 & 0x800) == 0)
  {
LABEL_49:
    if ((v13 & 0x2000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_69:
  self->_double subscribedChannelCtr = *((double *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  if ((*((_DWORD *)v4 + 67) & 0x2000) != 0)
  {
LABEL_50:
    self->_double userFeedbackScore = *((double *)v4 + 14);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
LABEL_51:
  issueData = self->_issueData;
  uint64_t v15 = *((void *)v4 + 26);
  if (issueData)
  {
    if (v15) {
      -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[NTPBAudioEngage setIssueData:](self, "setIssueData:");
  }
  issueViewData = self->_issueViewData;
  uint64_t v17 = *((void *)v4 + 27);
  if (issueViewData)
  {
    if (v17) {
      -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[NTPBAudioEngage setIssueViewData:](self, "setIssueViewData:");
  }
  channelData = self->_channelData;
  uint64_t v19 = *((void *)v4 + 18);
  if (channelData)
  {
    if (v19) {
      -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[NTPBAudioEngage setChannelData:](self, "setChannelData:");
  }
  if (*((void *)v4 + 28)) {
    -[NTPBAudioEngage setLanguage:](self, "setLanguage:");
  }
  int v20 = *((_DWORD *)v4 + 67);
  if ((v20 & 0x1000000) == 0)
  {
    if ((v20 & 0x80000) == 0) {
      goto LABEL_87;
    }
LABEL_91:
    self->_float playbackSpeed = *((float *)v4 + 60);
    *(_DWORD *)&self->_has |= 0x80000u;
    if ((*((_DWORD *)v4 + 67) & 0x4000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_88;
  }
  self->_isPaidSubscriberToSourceChannel = *((unsigned char *)v4 + 265);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v20 = *((_DWORD *)v4 + 67);
  if ((v20 & 0x80000) != 0) {
    goto LABEL_91;
  }
LABEL_87:
  if ((v20 & 0x4000) != 0)
  {
LABEL_88:
    self->_audioEngagementOriginationData = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_89:
}

- (NSString)articleId
{
  return self->_articleId;
}

- (void)setArticleId:(id)a3
{
}

- (NSString)sourceChannelId
{
  return self->_sourceChannelId;
}

- (void)setSourceChannelId:(id)a3
{
}

- (BOOL)adSupportedChannel
{
  return self->_adSupportedChannel;
}

- (NSString)groupFeedId
{
  return self->_groupFeedId;
}

- (void)setGroupFeedId:(id)a3
{
}

- (NSData)groupViewExposureId
{
  return self->_groupViewExposureId;
}

- (void)setGroupViewExposureId:(id)a3
{
}

- (NSString)feedId
{
  return self->_feedId;
}

- (void)setFeedId:(id)a3
{
}

- (int64_t)trackDuration
{
  return self->_trackDuration;
}

- (int64_t)audioTimePlayed
{
  return self->_audioTimePlayed;
}

- (int64_t)audioDeltaTimePlayed
{
  return self->_audioDeltaTimePlayed;
}

- (int)position
{
  return self->_position;
}

- (NSString)engagementId
{
  return self->_engagementId;
}

- (void)setEngagementId:(id)a3
{
}

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (NSMutableArray)fractionalCohortMemberships
{
  return self->_fractionalCohortMemberships;
}

- (void)setFractionalCohortMemberships:(id)a3
{
}

- (double)agedPersonalizationScore
{
  return self->_agedPersonalizationScore;
}

- (double)agedUserFeedbackScore
{
  return self->_agedUserFeedbackScore;
}

- (double)autoSubscribeCtr
{
  return self->_autoSubscribeCtr;
}

- (double)computedGlobalScoreCoefficient
{
  return self->_computedGlobalScoreCoefficient;
}

- (double)diversifiedPersonalizationScore
{
  return self->_diversifiedPersonalizationScore;
}

- (double)featureCtr
{
  return self->_featureCtr;
}

- (double)globalScore
{
  return self->_globalScore;
}

- (double)paidNonpaidSubscriptionCtr
{
  return self->_paidNonpaidSubscriptionCtr;
}

- (double)personalizationScore
{
  return self->_personalizationScore;
}

- (double)subscribedChannelCtr
{
  return self->_subscribedChannelCtr;
}

- (double)userFeedbackScore
{
  return self->_userFeedbackScore;
}

- (NTPBIssueData)issueData
{
  return self->_issueData;
}

- (void)setIssueData:(id)a3
{
}

- (NTPBIssueViewData)issueViewData
{
  return self->_issueViewData;
}

- (void)setIssueViewData:(id)a3
{
}

- (NTPBChannelData)channelData
{
  return self->_channelData;
}

- (void)setChannelData:(id)a3
{
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_fractionalCohortMemberships, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_engagementId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end