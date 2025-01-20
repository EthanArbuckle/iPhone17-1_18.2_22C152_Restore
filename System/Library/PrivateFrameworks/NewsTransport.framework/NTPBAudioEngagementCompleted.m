@interface NTPBAudioEngagementCompleted
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasArticleId;
- (BOOL)hasArticleViewingSessionId;
- (BOOL)hasChannelData;
- (BOOL)hasEngagementId;
- (BOOL)hasFeedId;
- (BOOL)hasFeedType;
- (BOOL)hasGroupFeedId;
- (BOOL)hasGroupType;
- (BOOL)hasGroupViewExposureId;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIssueData;
- (BOOL)hasIssueViewData;
- (BOOL)hasLanguage;
- (BOOL)hasPlaybackSpeed;
- (BOOL)hasSourceChannelId;
- (BOOL)hasTimePlayed;
- (BOOL)hasTrackDuration;
- (BOOL)hasTrackVariant;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)readFrom:(id)a3;
- (NSData)articleViewingSessionId;
- (NSData)groupViewExposureId;
- (NSString)articleId;
- (NSString)engagementId;
- (NSString)feedId;
- (NSString)groupFeedId;
- (NSString)language;
- (NSString)sourceChannelId;
- (NTPBChannelData)channelData;
- (NTPBIssueData)issueData;
- (NTPBIssueViewData)issueViewData;
- (float)playbackSpeed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)feedTypeAsString:(int)a3;
- (id)groupTypeAsString:(int)a3;
- (id)trackVariantAsString:(int)a3;
- (int)StringAsFeedType:(id)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsTrackVariant:(id)a3;
- (int)feedType;
- (int)groupType;
- (int)trackVariant;
- (int64_t)timePlayed;
- (int64_t)trackDuration;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setArticleId:(id)a3;
- (void)setArticleViewingSessionId:(id)a3;
- (void)setChannelData:(id)a3;
- (void)setEngagementId:(id)a3;
- (void)setFeedId:(id)a3;
- (void)setFeedType:(int)a3;
- (void)setGroupFeedId:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setGroupViewExposureId:(id)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasFeedType:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setHasPlaybackSpeed:(BOOL)a3;
- (void)setHasTimePlayed:(BOOL)a3;
- (void)setHasTrackDuration:(BOOL)a3;
- (void)setHasTrackVariant:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setPlaybackSpeed:(float)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setTimePlayed:(int64_t)a3;
- (void)setTrackDuration:(int64_t)a3;
- (void)setTrackVariant:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAudioEngagementCompleted

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
  *(unsigned char *)&self->_has |= 0x40u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)groupType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasGroupType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)groupTypeAsString:(int)a3
{
  if (a3 >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C5D0[a3];
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_feedType;
  }
  else {
    return 0;
  }
}

- (void)setFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_feedType = a3;
}

- (void)setHasFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFeedType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)feedTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C710[a3];
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
  *(unsigned char *)&self->_has |= 2u;
  self->_trackDuration = a3;
}

- (void)setHasTrackDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTrackDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)trackVariant
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_trackVariant;
  }
  else {
    return 0;
  }
}

- (void)setTrackVariant:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_trackVariant = a3;
}

- (void)setHasTrackVariant:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasTrackVariant
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)trackVariantAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26444C7C0[a3];
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

- (BOOL)hasArticleViewingSessionId
{
  return self->_articleViewingSessionId != 0;
}

- (void)setTimePlayed:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timePlayed = a3;
}

- (void)setHasTimePlayed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimePlayed
{
  return *(unsigned char *)&self->_has & 1;
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

- (void)setPlaybackSpeed:(float)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_playbackSpeed = a3;
}

- (void)setHasPlaybackSpeed:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasPlaybackSpeed
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasEngagementId
{
  return self->_engagementId != 0;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAudioEngagementCompleted;
  int v4 = [(NTPBAudioEngagementCompleted *)&v8 description];
  v5 = [(NTPBAudioEngagementCompleted *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  v5 = v3;
  articleId = self->_articleId;
  if (articleId) {
    [v3 setObject:articleId forKey:@"article_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v5 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v5 setObject:v9 forKey:@"ad_supported_channel"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    uint64_t groupType = self->_groupType;
    if (groupType >= 0x28)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26444C5D0[groupType];
    }
    [v5 setObject:v11 forKey:@"group_type"];
  }
  groupFeedId = self->_groupFeedId;
  if (groupFeedId) {
    [v5 setObject:groupFeedId forKey:@"group_feed_id"];
  }
  groupViewExposureId = self->_groupViewExposureId;
  if (groupViewExposureId) {
    [v5 setObject:groupViewExposureId forKey:@"group_view_exposure_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t feedType = self->_feedType;
    if (feedType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_feedType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_26444C710[feedType];
    }
    [v5 setObject:v15 forKey:@"feed_type"];
  }
  feedId = self->_feedId;
  if (feedId) {
    [v5 setObject:feedId forKey:@"feed_id"];
  }
  char v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    v18 = [NSNumber numberWithLongLong:self->_trackDuration];
    [v5 setObject:v18 forKey:@"track_duration"];

    char v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
  {
    uint64_t trackVariant = self->_trackVariant;
    if (trackVariant >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_trackVariant);
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = off_26444C7C0[trackVariant];
    }
    [v5 setObject:v20 forKey:@"track_variant"];
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if (articleViewingSessionId) {
    [v5 setObject:articleViewingSessionId forKey:@"article_viewing_session_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v22 = [NSNumber numberWithLongLong:self->_timePlayed];
    [v5 setObject:v22 forKey:@"time_played"];
  }
  issueData = self->_issueData;
  if (issueData)
  {
    v24 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v5 setObject:v24 forKey:@"issue_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v26 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v5 setObject:v26 forKey:@"issue_view_data"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v28 = [(NTPBChannelData *)channelData dictionaryRepresentation];
    [v5 setObject:v28 forKey:@"channel_data"];
  }
  language = self->_language;
  if (language) {
    [v5 setObject:language forKey:@"language"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(float *)&double v4 = self->_playbackSpeed;
    v30 = [NSNumber numberWithFloat:v4];
    [v5 setObject:v30 forKey:@"playbackSpeed"];
  }
  engagementId = self->_engagementId;
  if (engagementId) {
    [v5 setObject:engagementId forKey:@"engagement_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v32 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
    [v5 setObject:v32 forKey:@"is_paid_subscriber_to_source_channel"];
  }

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAudioEngagementCompletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_articleId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_groupFeedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_groupViewExposureId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_feedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char v6 = (char)self->_has;
  }
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_articleViewingSessionId)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_channelData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteFloatField();
    id v4 = v7;
  }
  if (self->_engagementId)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_articleId copyWithZone:a3];
  id v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v9 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v8;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 140) = self->_adSupportedChannel;
    *(unsigned char *)(v5 + 144) |= 0x40u;
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_groupType;
    *(unsigned char *)(v5 + 144) |= 8u;
  }
  uint64_t v11 = [(NSString *)self->_groupFeedId copyWithZone:a3];
  v12 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v11;

  uint64_t v13 = [(NSData *)self->_groupViewExposureId copyWithZone:a3];
  v14 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v13;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_feedType;
    *(unsigned char *)(v5 + 144) |= 4u;
  }
  uint64_t v15 = [(NSString *)self->_feedId copyWithZone:a3];
  v16 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v15;

  char v17 = (char)self->_has;
  if ((v17 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_trackDuration;
    *(unsigned char *)(v5 + 144) |= 2u;
    char v17 = (char)self->_has;
  }
  if ((v17 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_trackVariant;
    *(unsigned char *)(v5 + 144) |= 0x20u;
  }
  uint64_t v18 = [(NSData *)self->_articleViewingSessionId copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timePlayed;
    *(unsigned char *)(v5 + 144) |= 1u;
  }
  id v20 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  v21 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v20;

  id v22 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v23 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v22;

  id v24 = [(NTPBChannelData *)self->_channelData copyWithZone:a3];
  v25 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v24;

  uint64_t v26 = [(NSString *)self->_language copyWithZone:a3];
  v27 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v26;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(float *)(v5 + 120) = self->_playbackSpeed;
    *(unsigned char *)(v5 + 144) |= 0x10u;
  }
  uint64_t v28 = [(NSString *)self->_engagementId copyWithZone:a3];
  v29 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v28;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 141) = self->_isPaidSubscriberToSourceChannel;
    *(unsigned char *)(v5 + 144) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_68;
  }
  articleId = self->_articleId;
  if ((unint64_t)articleId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](articleId, "isEqual:")) {
      goto LABEL_68;
    }
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_68;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[144] & 0x40) == 0) {
      goto LABEL_68;
    }
    if (self->_adSupportedChannel)
    {
      if (!v4[140]) {
        goto LABEL_68;
      }
    }
    else if (v4[140])
    {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[144] & 8) == 0 || self->_groupType != *((_DWORD *)v4 + 20)) {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 8) != 0)
  {
    goto LABEL_68;
  }
  groupFeedId = self->_groupFeedId;
  if ((unint64_t)groupFeedId | *((void *)v4 + 9)
    && !-[NSString isEqual:](groupFeedId, "isEqual:"))
  {
    goto LABEL_68;
  }
  groupViewExposureId = self->_groupViewExposureId;
  if ((unint64_t)groupViewExposureId | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](groupViewExposureId, "isEqual:")) {
      goto LABEL_68;
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((v4[144] & 4) == 0 || self->_feedType != *((_DWORD *)v4 + 16)) {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 4) != 0)
  {
    goto LABEL_68;
  }
  feedId = self->_feedId;
  if ((unint64_t)feedId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](feedId, "isEqual:")) {
      goto LABEL_68;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((v4[144] & 2) == 0 || self->_trackDuration != *((void *)v4 + 2)) {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 2) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x20) != 0)
  {
    if ((v4[144] & 0x20) == 0 || self->_trackVariant != *((_DWORD *)v4 + 34)) {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 0x20) != 0)
  {
    goto LABEL_68;
  }
  articleViewingSessionId = self->_articleViewingSessionId;
  if ((unint64_t)articleViewingSessionId | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](articleViewingSessionId, "isEqual:")) {
      goto LABEL_68;
    }
    char has = (char)self->_has;
  }
  if (has)
  {
    if ((v4[144] & 1) == 0 || self->_timePlayed != *((void *)v4 + 1)) {
      goto LABEL_68;
    }
  }
  else if (v4[144])
  {
    goto LABEL_68;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 12) && !-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
    goto LABEL_68;
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 13))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_68;
    }
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 5))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:")) {
      goto LABEL_68;
    }
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](language, "isEqual:")) {
      goto LABEL_68;
    }
  }
  char v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    if ((v4[144] & 0x10) == 0 || self->_playbackSpeed != *((float *)v4 + 30)) {
      goto LABEL_68;
    }
  }
  else if ((v4[144] & 0x10) != 0)
  {
    goto LABEL_68;
  }
  engagementId = self->_engagementId;
  if ((unint64_t)engagementId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](engagementId, "isEqual:")) {
      goto LABEL_68;
    }
    char v16 = (char)self->_has;
  }
  int v18 = v4[144];
  if (v16 < 0)
  {
    if (v18 < 0)
    {
      if (self->_isPaidSubscriberToSourceChannel)
      {
        if (!v4[141]) {
          goto LABEL_68;
        }
      }
      else if (v4[141])
      {
        goto LABEL_68;
      }
      BOOL v19 = 1;
      goto LABEL_69;
    }
LABEL_68:
    BOOL v19 = 0;
    goto LABEL_69;
  }
  BOOL v19 = v18 >= 0;
LABEL_69:

  return v19;
}

- (unint64_t)hash
{
  NSUInteger v27 = [(NSString *)self->_articleId hash];
  NSUInteger v26 = [(NSString *)self->_sourceChannelId hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v25 = 2654435761 * self->_adSupportedChannel;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v25 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_3:
      uint64_t v24 = 2654435761 * self->_groupType;
      goto LABEL_6;
    }
  }
  uint64_t v24 = 0;
LABEL_6:
  NSUInteger v23 = [(NSString *)self->_groupFeedId hash];
  uint64_t v22 = [(NSData *)self->_groupViewExposureId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v21 = 2654435761 * self->_feedType;
  }
  else {
    uint64_t v21 = 0;
  }
  NSUInteger v20 = [(NSString *)self->_feedId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v19 = 2654435761 * self->_trackDuration;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_11:
      uint64_t v3 = [(NSData *)self->_articleViewingSessionId hash];
      goto LABEL_14;
    }
  }
  uint64_t v3 = [(NSData *)self->_articleViewingSessionId hash];
LABEL_14:
  uint64_t v4 = v3;
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_timePlayed;
  }
  else {
    uint64_t v5 = 0;
  }
  unint64_t v6 = [(NTPBIssueData *)self->_issueData hash];
  unint64_t v7 = [(NTPBIssueViewData *)self->_issueViewData hash];
  unint64_t v8 = [(NTPBChannelData *)self->_channelData hash];
  NSUInteger v9 = [(NSString *)self->_language hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    float playbackSpeed = self->_playbackSpeed;
    float v12 = -playbackSpeed;
    if (playbackSpeed >= 0.0) {
      float v12 = self->_playbackSpeed;
    }
    float v13 = floorf(v12 + 0.5);
    float v14 = (float)(v12 - v13) * 1.8447e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_engagementId hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v16 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  }
  else {
    uint64_t v16 = 0;
  }
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (char *)a3;
  float v13 = v4;
  if (*((void *)v4 + 3))
  {
    -[NTPBAudioEngagementCompleted setArticleId:](self, "setArticleId:");
    uint64_t v4 = v13;
  }
  if (*((void *)v4 + 16))
  {
    -[NTPBAudioEngagementCompleted setSourceChannelId:](self, "setSourceChannelId:");
    uint64_t v4 = v13;
  }
  char v5 = v4[144];
  if ((v5 & 0x40) != 0)
  {
    self->_adSupportedChannel = v4[140];
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = v4[144];
  }
  if ((v5 & 8) != 0)
  {
    self->_uint64_t groupType = *((_DWORD *)v4 + 20);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 9))
  {
    -[NTPBAudioEngagementCompleted setGroupFeedId:](self, "setGroupFeedId:");
    uint64_t v4 = v13;
  }
  if (*((void *)v4 + 11))
  {
    -[NTPBAudioEngagementCompleted setGroupViewExposureId:](self, "setGroupViewExposureId:");
    uint64_t v4 = v13;
  }
  if ((v4[144] & 4) != 0)
  {
    self->_uint64_t feedType = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 7))
  {
    -[NTPBAudioEngagementCompleted setFeedId:](self, "setFeedId:");
    uint64_t v4 = v13;
  }
  char v6 = v4[144];
  if ((v6 & 2) != 0)
  {
    self->_trackDuration = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = v4[144];
  }
  if ((v6 & 0x20) != 0)
  {
    self->_uint64_t trackVariant = *((_DWORD *)v4 + 34);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 4))
  {
    -[NTPBAudioEngagementCompleted setArticleViewingSessionId:](self, "setArticleViewingSessionId:");
    uint64_t v4 = v13;
  }
  if (v4[144])
  {
    self->_timePlayed = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  issueData = self->_issueData;
  uint64_t v8 = *((void *)v4 + 12);
  if (issueData)
  {
    if (!v8) {
      goto LABEL_31;
    }
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_31;
    }
    -[NTPBAudioEngagementCompleted setIssueData:](self, "setIssueData:");
  }
  uint64_t v4 = v13;
LABEL_31:
  issueViewData = self->_issueViewData;
  uint64_t v10 = *((void *)v4 + 13);
  if (issueViewData)
  {
    if (!v10) {
      goto LABEL_37;
    }
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_37;
    }
    -[NTPBAudioEngagementCompleted setIssueViewData:](self, "setIssueViewData:");
  }
  uint64_t v4 = v13;
LABEL_37:
  channelData = self->_channelData;
  uint64_t v12 = *((void *)v4 + 5);
  if (channelData)
  {
    if (!v12) {
      goto LABEL_43;
    }
    -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_43;
    }
    -[NTPBAudioEngagementCompleted setChannelData:](self, "setChannelData:");
  }
  uint64_t v4 = v13;
LABEL_43:
  if (*((void *)v4 + 14))
  {
    -[NTPBAudioEngagementCompleted setLanguage:](self, "setLanguage:");
    uint64_t v4 = v13;
  }
  if ((v4[144] & 0x10) != 0)
  {
    self->_float playbackSpeed = *((float *)v4 + 30);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 6))
  {
    -[NTPBAudioEngagementCompleted setEngagementId:](self, "setEngagementId:");
    uint64_t v4 = v13;
  }
  if (v4[144] < 0)
  {
    self->_isPaidSubscriberToSourceChannel = v4[141];
    *(unsigned char *)&self->_has |= 0x80u;
  }

  MEMORY[0x270F9A758]();
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

- (NSData)articleViewingSessionId
{
  return self->_articleViewingSessionId;
}

- (void)setArticleViewingSessionId:(id)a3
{
}

- (int64_t)timePlayed
{
  return self->_timePlayed;
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

- (float)playbackSpeed
{
  return self->_playbackSpeed;
}

- (NSString)engagementId
{
  return self->_engagementId;
}

- (void)setEngagementId:(id)a3
{
}

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_groupViewExposureId, 0);
  objc_storeStrong((id *)&self->_groupFeedId, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_engagementId, 0);
  objc_storeStrong((id *)&self->_channelData, 0);
  objc_storeStrong((id *)&self->_articleViewingSessionId, 0);

  objc_storeStrong((id *)&self->_articleId, 0);
}

@end