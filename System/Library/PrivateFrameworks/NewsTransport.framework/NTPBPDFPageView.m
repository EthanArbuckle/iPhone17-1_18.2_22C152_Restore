@interface NTPBPDFPageView
- (BOOL)adSupportedChannel;
- (BOOL)hasAdSupportedChannel;
- (BOOL)hasCampaignId;
- (BOOL)hasChannelData;
- (BOOL)hasGroupType;
- (BOOL)hasIsFreeIssue;
- (BOOL)hasIsPaidSubscriberToSourceChannel;
- (BOOL)hasIssueData;
- (BOOL)hasIssueExposureData;
- (BOOL)hasIssueViewData;
- (BOOL)hasLanguage;
- (BOOL)hasNotificationId;
- (BOOL)hasPageCount;
- (BOOL)hasPaidSubscriberToFeedType;
- (BOOL)hasPaidSubscriptionConversionPointType;
- (BOOL)hasParentFeedId;
- (BOOL)hasParentFeedType;
- (BOOL)hasReferringSourceApplication;
- (BOOL)hasReferringUrl;
- (BOOL)hasSourceChannelId;
- (BOOL)hasViewFromNotificationDirectOpen;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFreeIssue;
- (BOOL)isPaidSubscriberToSourceChannel;
- (BOOL)readFrom:(id)a3;
- (BOOL)viewFromNotificationDirectOpen;
- (NSString)campaignId;
- (NSString)language;
- (NSString)notificationId;
- (NSString)parentFeedId;
- (NSString)referringSourceApplication;
- (NSString)referringUrl;
- (NSString)sourceChannelId;
- (NTPBChannelData)channelData;
- (NTPBIssueData)issueData;
- (NTPBIssueExposureData)issueExposureData;
- (NTPBIssueViewData)issueViewData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupTypeAsString:(int)a3;
- (id)paidSubscriberToFeedTypeAsString:(int)a3;
- (id)paidSubscriptionConversionPointTypeAsString:(int)a3;
- (id)parentFeedTypeAsString:(int)a3;
- (int)StringAsGroupType:(id)a3;
- (int)StringAsPaidSubscriberToFeedType:(id)a3;
- (int)StringAsPaidSubscriptionConversionPointType:(id)a3;
- (int)StringAsParentFeedType:(id)a3;
- (int)groupType;
- (int)pageCount;
- (int)pageIndices;
- (int)pageIndicesAtIndex:(unint64_t)a3;
- (int)paidSubscriberToFeedType;
- (int)paidSubscriptionConversionPointType;
- (int)parentFeedType;
- (unint64_t)hash;
- (unint64_t)pageIndicesCount;
- (void)addPageIndices:(int)a3;
- (void)clearPageIndices;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdSupportedChannel:(BOOL)a3;
- (void)setCampaignId:(id)a3;
- (void)setChannelData:(id)a3;
- (void)setGroupType:(int)a3;
- (void)setHasAdSupportedChannel:(BOOL)a3;
- (void)setHasGroupType:(BOOL)a3;
- (void)setHasIsFreeIssue:(BOOL)a3;
- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setHasPageCount:(BOOL)a3;
- (void)setHasPaidSubscriberToFeedType:(BOOL)a3;
- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3;
- (void)setHasParentFeedType:(BOOL)a3;
- (void)setHasViewFromNotificationDirectOpen:(BOOL)a3;
- (void)setIsFreeIssue:(BOOL)a3;
- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3;
- (void)setIssueData:(id)a3;
- (void)setIssueExposureData:(id)a3;
- (void)setIssueViewData:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setNotificationId:(id)a3;
- (void)setPageCount:(int)a3;
- (void)setPageIndices:(int *)a3 count:(unint64_t)a4;
- (void)setPaidSubscriberToFeedType:(int)a3;
- (void)setPaidSubscriptionConversionPointType:(int)a3;
- (void)setParentFeedId:(id)a3;
- (void)setParentFeedType:(int)a3;
- (void)setReferringSourceApplication:(id)a3;
- (void)setReferringUrl:(id)a3;
- (void)setSourceChannelId:(id)a3;
- (void)setViewFromNotificationDirectOpen:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPDFPageView

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBPDFPageView;
  [(NTPBPDFPageView *)&v3 dealloc];
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

- (unint64_t)pageIndicesCount
{
  return self->_pageIndices.count;
}

- (int)pageIndices
{
  return self->_pageIndices.list;
}

- (void)clearPageIndices
{
}

- (void)addPageIndices:(int)a3
{
}

- (int)pageIndicesAtIndex:(unint64_t)a3
{
  p_pageIndices = &self->_pageIndices;
  unint64_t count = self->_pageIndices.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_pageIndices->list[a3];
}

- (void)setPageIndices:(int *)a3 count:(unint64_t)a4
{
}

- (void)setPageCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_pageCount = a3;
}

- (void)setHasPageCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasPageCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setIsFreeIssue:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_isFreeIssue = a3;
}

- (void)setHasIsFreeIssue:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasIsFreeIssue
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (int)parentFeedType
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_parentFeedType;
  }
  else {
    return 0;
  }
}

- (void)setParentFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_parentFeedType = a3;
}

- (void)setHasParentFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasParentFeedType
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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
    __int16 v3 = off_2644491D0[a3];
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

- (BOOL)hasParentFeedId
{
  return self->_parentFeedId != 0;
}

- (BOOL)hasSourceChannelId
{
  return self->_sourceChannelId != 0;
}

- (void)setAdSupportedChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_adSupportedChannel = a3;
}

- (void)setHasAdSupportedChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasAdSupportedChannel
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isPaidSubscriberToSourceChannel = a3;
}

- (void)setHasIsPaidSubscriberToSourceChannel:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsPaidSubscriberToSourceChannel
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (int)groupType
{
  if (*(_WORD *)&self->_has) {
    return self->_groupType;
  }
  else {
    return 0;
  }
}

- (void)setGroupType:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_groupType = a3;
}

- (void)setHasGroupType:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasGroupType
{
  return *(_WORD *)&self->_has & 1;
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
    __int16 v3 = off_264449280[a3];
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

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (void)setViewFromNotificationDirectOpen:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_viewFromNotificationDirectOpen = a3;
}

- (void)setHasViewFromNotificationDirectOpen:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasViewFromNotificationDirectOpen
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (BOOL)hasChannelData
{
  return self->_channelData != 0;
}

- (int)paidSubscriberToFeedType
{
  if ((*(_WORD *)&self->_has & 4) != 0) {
    return self->_paidSubscriberToFeedType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriberToFeedType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_paidSubscriberToFeedType = a3;
}

- (void)setHasPaidSubscriberToFeedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPaidSubscriberToFeedType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)paidSubscriberToFeedTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644493C0[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriberToFeedType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIBER_TO_FEED_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NEWS_PAID_SUBSCRIBER_TO_FEED_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APP_STORE_PAID_SUBSCRIBER_TO_FEED_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEBSITE_PAID_SUBSCRIBER_TO_FEED_TYPE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)paidSubscriptionConversionPointType
{
  if ((*(_WORD *)&self->_has & 8) != 0) {
    return self->_paidSubscriptionConversionPointType;
  }
  else {
    return 0;
  }
}

- (void)setPaidSubscriptionConversionPointType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_paidSubscriptionConversionPointType = a3;
}

- (void)setHasPaidSubscriptionConversionPointType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPaidSubscriptionConversionPointType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)paidSubscriptionConversionPointTypeAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644493E0[a3];
  }

  return v3;
}

- (int)StringAsPaidSubscriptionConversionPointType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_IN_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"SUBSCRIBER_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"IN_FEED_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"IN_ARTICLE_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SOCIAL_SHARE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_EXPIRATION_RENEWAL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"HARD_PAYWALL_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"TOP_OF_ARTICLE_SWIPING_BETWEEN_ARTICLES_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TOP_OF_CHANNEL_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"INTERSTITIAL_AD_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"END_OF_ARTICLE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"GROUP_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LANDING_PAGE_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"MAGAZINE_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ISSUE_TOC_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"AUDIO_FEED_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"SUBSCRIPTION_OFFERS_PAID_SUBSCRIPTION_CONVERSION_POINT_TYPE"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasLanguage
{
  return self->_language != 0;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBPDFPageView;
  int v4 = [(NTPBPDFPageView *)&v8 description];
  v5 = [(NTPBPDFPageView *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  issueData = self->_issueData;
  if (issueData)
  {
    v5 = [(NTPBIssueData *)issueData dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"issue_data"];
  }
  issueExposureData = self->_issueExposureData;
  if (issueExposureData)
  {
    uint64_t v7 = [(NTPBIssueExposureData *)issueExposureData dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"issue_exposure_data"];
  }
  issueViewData = self->_issueViewData;
  if (issueViewData)
  {
    v9 = [(NTPBIssueViewData *)issueViewData dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"issue_view_data"];
  }
  v10 = PBRepeatedInt32NSArray();
  [v3 setObject:v10 forKey:@"page_indices"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v12 = [NSNumber numberWithInt:self->_pageCount];
    [v3 setObject:v12 forKey:@"page_count"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x10) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  v13 = [NSNumber numberWithBool:self->_isFreeIssue];
  [v3 setObject:v13 forKey:@"is_free_issue"];

  if ((*(_WORD *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_13:
  uint64_t parentFeedType = self->_parentFeedType;
  if (parentFeedType >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_parentFeedType);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = off_2644491D0[parentFeedType];
  }
  [v3 setObject:v15 forKey:@"parent_feed_type"];

LABEL_17:
  parentFeedId = self->_parentFeedId;
  if (parentFeedId) {
    [v3 setObject:parentFeedId forKey:@"parent_feed_id"];
  }
  sourceChannelId = self->_sourceChannelId;
  if (sourceChannelId) {
    [v3 setObject:sourceChannelId forKey:@"source_channel_id"];
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x20) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_adSupportedChannel];
    [v3 setObject:v19 forKey:@"ad_supported_channel"];

    __int16 v18 = (__int16)self->_has;
    if ((v18 & 0x80) == 0)
    {
LABEL_23:
      if ((v18 & 1) == 0) {
        goto LABEL_31;
      }
      goto LABEL_27;
    }
  }
  else if ((v18 & 0x80) == 0)
  {
    goto LABEL_23;
  }
  v20 = [NSNumber numberWithBool:self->_isPaidSubscriberToSourceChannel];
  [v3 setObject:v20 forKey:@"is_paid_subscriber_to_source_channel"];

  if ((*(_WORD *)&self->_has & 1) == 0) {
    goto LABEL_31;
  }
LABEL_27:
  uint64_t groupType = self->_groupType;
  if (groupType >= 0x28)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_groupType);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_264449280[groupType];
  }
  [v3 setObject:v22 forKey:@"group_type"];

LABEL_31:
  campaignId = self->_campaignId;
  if (campaignId) {
    [v3 setObject:campaignId forKey:@"campaign_id"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v24 = [NSNumber numberWithBool:self->_viewFromNotificationDirectOpen];
    [v3 setObject:v24 forKey:@"view_from_notification_direct_open"];
  }
  notificationId = self->_notificationId;
  if (notificationId) {
    [v3 setObject:notificationId forKey:@"notification_id"];
  }
  channelData = self->_channelData;
  if (channelData)
  {
    v27 = [(NTPBChannelData *)channelData dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"channel_data"];
  }
  __int16 v28 = (__int16)self->_has;
  if ((v28 & 4) != 0)
  {
    uint64_t paidSubscriberToFeedType = self->_paidSubscriberToFeedType;
    if (paidSubscriberToFeedType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriberToFeedType);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_2644493C0[paidSubscriberToFeedType];
    }
    [v3 setObject:v30 forKey:@"paid_subscriber_to_feed_type"];

    __int16 v28 = (__int16)self->_has;
  }
  if ((v28 & 8) != 0)
  {
    uint64_t paidSubscriptionConversionPointType = self->_paidSubscriptionConversionPointType;
    if (paidSubscriptionConversionPointType >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_paidSubscriptionConversionPointType);
      v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = off_2644493E0[paidSubscriptionConversionPointType];
    }
    [v3 setObject:v32 forKey:@"paid_subscription_conversion_point_type"];
  }
  language = self->_language;
  if (language) {
    [v3 setObject:language forKey:@"language"];
  }
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication) {
    [v3 setObject:referringSourceApplication forKey:@"referring_source_application"];
  }
  referringUrl = self->_referringUrl;
  if (referringUrl) {
    [v3 setObject:referringUrl forKey:@"referring_url"];
  }
  id v36 = v3;

  return v36;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPDFPageViewReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_issueData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_issueExposureData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_issueViewData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  if (self->_pageIndices.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v9;
      ++v5;
    }
    while (v5 < self->_pageIndices.count);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_14:
  if (self->_parentFeedId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_sourceChannelId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_20:
      if ((v7 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v9;
  if (*(_WORD *)&self->_has)
  {
LABEL_21:
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
LABEL_22:
  if (self->_campaignId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v9;
  }
  if (self->_notificationId)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_channelData)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v9;
  }
  __int16 v8 = (__int16)self->_has;
  if ((v8 & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
    __int16 v8 = (__int16)self->_has;
  }
  if ((v8 & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v9;
  }
  if (self->_language)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_referringSourceApplication)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
  if (self->_referringUrl)
  {
    PBDataWriterWriteStringField();
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NTPBIssueData *)self->_issueData copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  id v8 = [(NTPBIssueExposureData *)self->_issueExposureData copyWithZone:a3];
  id v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  id v10 = [(NTPBIssueViewData *)self->_issueViewData copyWithZone:a3];
  v11 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v10;

  PBRepeatedInt32Copy();
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_pageCount;
    *(_WORD *)(v5 + 156) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 153) = self->_isFreeIssue;
  *(_WORD *)(v5 + 156) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 120) = self->_parentFeedType;
    *(_WORD *)(v5 + 156) |= 0x10u;
  }
LABEL_5:
  uint64_t v13 = [(NSString *)self->_parentFeedId copyWithZone:a3];
  v14 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v13;

  uint64_t v15 = [(NSString *)self->_sourceChannelId copyWithZone:a3];
  v16 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v15;

  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 152) = self->_adSupportedChannel;
    *(_WORD *)(v5 + 156) |= 0x20u;
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x80) == 0)
    {
LABEL_7:
      if ((v17 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((v17 & 0x80) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 154) = self->_isPaidSubscriberToSourceChannel;
  *(_WORD *)(v5 + 156) |= 0x80u;
  if (*(_WORD *)&self->_has)
  {
LABEL_8:
    *(_DWORD *)(v5 + 48) = self->_groupType;
    *(_WORD *)(v5 + 156) |= 1u;
  }
LABEL_9:
  uint64_t v18 = [(NSString *)self->_campaignId copyWithZone:a3];
  v19 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v18;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 155) = self->_viewFromNotificationDirectOpen;
    *(_WORD *)(v5 + 156) |= 0x100u;
  }
  uint64_t v20 = [(NSString *)self->_notificationId copyWithZone:a3];
  v21 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v20;

  id v22 = [(NTPBChannelData *)self->_channelData copyWithZone:a3];
  v23 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v22;

  __int16 v24 = (__int16)self->_has;
  if ((v24 & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_paidSubscriberToFeedType;
    *(_WORD *)(v5 + 156) |= 4u;
    __int16 v24 = (__int16)self->_has;
  }
  if ((v24 & 8) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_paidSubscriptionConversionPointType;
    *(_WORD *)(v5 + 156) |= 8u;
  }
  uint64_t v25 = [(NSString *)self->_language copyWithZone:a3];
  v26 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v25;

  uint64_t v27 = [(NSString *)self->_referringSourceApplication copyWithZone:a3];
  __int16 v28 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v27;

  uint64_t v29 = [(NSString *)self->_referringUrl copyWithZone:a3];
  v30 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v29;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_83;
  }
  issueData = self->_issueData;
  if ((unint64_t)issueData | *((void *)v4 + 7))
  {
    if (!-[NTPBIssueData isEqual:](issueData, "isEqual:")) {
      goto LABEL_83;
    }
  }
  issueExposureData = self->_issueExposureData;
  if ((unint64_t)issueExposureData | *((void *)v4 + 8))
  {
    if (!-[NTPBIssueExposureData isEqual:](issueExposureData, "isEqual:")) {
      goto LABEL_83;
    }
  }
  issueViewData = self->_issueViewData;
  if ((unint64_t)issueViewData | *((void *)v4 + 9))
  {
    if (!-[NTPBIssueViewData isEqual:](issueViewData, "isEqual:")) {
      goto LABEL_83;
    }
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_83;
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 78);
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_pageCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_83;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0) {
      goto LABEL_83;
    }
    if (self->_isFreeIssue)
    {
      if (!*((unsigned char *)v4 + 153)) {
        goto LABEL_83;
      }
    }
    else if (*((unsigned char *)v4 + 153))
    {
      goto LABEL_83;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_83;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_parentFeedType != *((_DWORD *)v4 + 30)) {
      goto LABEL_83;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_83;
  }
  parentFeedId = self->_parentFeedId;
  if ((unint64_t)parentFeedId | *((void *)v4 + 14)
    && !-[NSString isEqual:](parentFeedId, "isEqual:"))
  {
    goto LABEL_83;
  }
  sourceChannelId = self->_sourceChannelId;
  if ((unint64_t)sourceChannelId | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](sourceChannelId, "isEqual:")) {
      goto LABEL_83;
    }
  }
  __int16 v12 = (__int16)self->_has;
  __int16 v13 = *((_WORD *)v4 + 78);
  if ((v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0) {
      goto LABEL_83;
    }
    if (self->_adSupportedChannel)
    {
      if (!*((unsigned char *)v4 + 152)) {
        goto LABEL_83;
      }
    }
    else if (*((unsigned char *)v4 + 152))
    {
      goto LABEL_83;
    }
  }
  else if ((v13 & 0x20) != 0)
  {
    goto LABEL_83;
  }
  if ((v12 & 0x80) != 0)
  {
    if ((v13 & 0x80) == 0) {
      goto LABEL_83;
    }
    if (self->_isPaidSubscriberToSourceChannel)
    {
      if (!*((unsigned char *)v4 + 154)) {
        goto LABEL_83;
      }
    }
    else if (*((unsigned char *)v4 + 154))
    {
      goto LABEL_83;
    }
  }
  else if ((v13 & 0x80) != 0)
  {
    goto LABEL_83;
  }
  if (v12)
  {
    if ((v13 & 1) == 0 || self->_groupType != *((_DWORD *)v4 + 12)) {
      goto LABEL_83;
    }
  }
  else if (v13)
  {
    goto LABEL_83;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_83;
    }
    __int16 v12 = (__int16)self->_has;
  }
  if ((v12 & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 78) & 0x100) != 0)
    {
      if (self->_viewFromNotificationDirectOpen)
      {
        if (!*((unsigned char *)v4 + 155)) {
          goto LABEL_83;
        }
        goto LABEL_63;
      }
      if (!*((unsigned char *)v4 + 155)) {
        goto LABEL_63;
      }
    }
LABEL_83:
    char v22 = 0;
    goto LABEL_84;
  }
  if ((*((_WORD *)v4 + 78) & 0x100) != 0) {
    goto LABEL_83;
  }
LABEL_63:
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((void *)v4 + 11)
    && !-[NSString isEqual:](notificationId, "isEqual:"))
  {
    goto LABEL_83;
  }
  channelData = self->_channelData;
  if ((unint64_t)channelData | *((void *)v4 + 5))
  {
    if (!-[NTPBChannelData isEqual:](channelData, "isEqual:")) {
      goto LABEL_83;
    }
  }
  __int16 v17 = (__int16)self->_has;
  __int16 v18 = *((_WORD *)v4 + 78);
  if ((v17 & 4) != 0)
  {
    if ((v18 & 4) == 0 || self->_paidSubscriberToFeedType != *((_DWORD *)v4 + 25)) {
      goto LABEL_83;
    }
  }
  else if ((v18 & 4) != 0)
  {
    goto LABEL_83;
  }
  if ((v17 & 8) != 0)
  {
    if ((v18 & 8) == 0 || self->_paidSubscriptionConversionPointType != *((_DWORD *)v4 + 26)) {
      goto LABEL_83;
    }
  }
  else if ((v18 & 8) != 0)
  {
    goto LABEL_83;
  }
  language = self->_language;
  if ((unint64_t)language | *((void *)v4 + 10) && !-[NSString isEqual:](language, "isEqual:")) {
    goto LABEL_83;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](referringSourceApplication, "isEqual:")) {
      goto LABEL_83;
    }
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((void *)v4 + 17)) {
    char v22 = -[NSString isEqual:](referringUrl, "isEqual:");
  }
  else {
    char v22 = 1;
  }
LABEL_84:

  return v22;
}

- (unint64_t)hash
{
  unint64_t v27 = [(NTPBIssueData *)self->_issueData hash];
  unint64_t v26 = [(NTPBIssueExposureData *)self->_issueExposureData hash];
  unint64_t v25 = [(NTPBIssueViewData *)self->_issueViewData hash];
  uint64_t v24 = PBRepeatedInt32Hash();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
    uint64_t v23 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v22 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v23 = 2654435761 * self->_pageCount;
  if ((has & 0x40) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v22 = 2654435761 * self->_isFreeIssue;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v21 = 2654435761 * self->_parentFeedType;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v21 = 0;
LABEL_8:
  NSUInteger v20 = [(NSString *)self->_parentFeedId hash];
  NSUInteger v4 = [(NSString *)self->_sourceChannelId hash];
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x20) == 0)
  {
    uint64_t v6 = 0;
    if ((v5 & 0x80) != 0) {
      goto LABEL_10;
    }
LABEL_13:
    uint64_t v7 = 0;
    if (v5) {
      goto LABEL_11;
    }
    goto LABEL_14;
  }
  uint64_t v6 = 2654435761 * self->_adSupportedChannel;
  if ((v5 & 0x80) == 0) {
    goto LABEL_13;
  }
LABEL_10:
  uint64_t v7 = 2654435761 * self->_isPaidSubscriberToSourceChannel;
  if (v5)
  {
LABEL_11:
    uint64_t v8 = 2654435761 * self->_groupType;
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v8 = 0;
LABEL_15:
  NSUInteger v9 = [(NSString *)self->_campaignId hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v10 = 2654435761 * self->_viewFromNotificationDirectOpen;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_notificationId hash];
  unint64_t v12 = [(NTPBChannelData *)self->_channelData hash];
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 4) != 0)
  {
    uint64_t v14 = 2654435761 * self->_paidSubscriberToFeedType;
    if ((v13 & 8) != 0) {
      goto LABEL_20;
    }
LABEL_22:
    uint64_t v15 = 0;
    goto LABEL_23;
  }
  uint64_t v14 = 0;
  if ((v13 & 8) == 0) {
    goto LABEL_22;
  }
LABEL_20:
  uint64_t v15 = 2654435761 * self->_paidSubscriptionConversionPointType;
LABEL_23:
  unint64_t v16 = v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  NSUInteger v17 = v12 ^ v14 ^ v15 ^ [(NSString *)self->_language hash];
  NSUInteger v18 = v16 ^ v17 ^ [(NSString *)self->_referringSourceApplication hash];
  return v18 ^ [(NSString *)self->_referringUrl hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  issueData = self->_issueData;
  uint64_t v6 = v4[7];
  NSUInteger v20 = v4;
  if (issueData)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NTPBIssueData mergeFrom:](issueData, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NTPBPDFPageView setIssueData:](self, "setIssueData:");
  }
  NSUInteger v4 = v20;
LABEL_7:
  issueExposureData = self->_issueExposureData;
  uint64_t v8 = v4[8];
  if (issueExposureData)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NTPBIssueExposureData mergeFrom:](issueExposureData, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[NTPBPDFPageView setIssueExposureData:](self, "setIssueExposureData:");
  }
  NSUInteger v4 = v20;
LABEL_13:
  issueViewData = self->_issueViewData;
  uint64_t v10 = v4[9];
  if (issueViewData)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[NTPBIssueViewData mergeFrom:](issueViewData, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[NTPBPDFPageView setIssueViewData:](self, "setIssueViewData:");
  }
  NSUInteger v4 = v20;
LABEL_19:
  uint64_t v11 = [v4 pageIndicesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t i = 0; i != v12; ++i)
      -[NTPBPDFPageView addPageIndices:](self, "addPageIndices:", [v20 pageIndicesAtIndex:i]);
  }
  uint64_t v14 = v20;
  __int16 v15 = *((_WORD *)v20 + 78);
  if ((v15 & 2) != 0)
  {
    self->_pageCount = *((_DWORD *)v20 + 24);
    *(_WORD *)&self->_has |= 2u;
    __int16 v15 = *((_WORD *)v20 + 78);
    if ((v15 & 0x40) == 0)
    {
LABEL_24:
      if ((v15 & 0x10) == 0) {
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  else if ((v15 & 0x40) == 0)
  {
    goto LABEL_24;
  }
  self->_isFreeIssue = *((unsigned char *)v20 + 153);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v20 + 78) & 0x10) != 0)
  {
LABEL_25:
    self->_uint64_t parentFeedType = *((_DWORD *)v20 + 30);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_26:
  if (v20[14])
  {
    -[NTPBPDFPageView setParentFeedId:](self, "setParentFeedId:");
    uint64_t v14 = v20;
  }
  if (v14[18])
  {
    -[NTPBPDFPageView setSourceChannelId:](self, "setSourceChannelId:");
    uint64_t v14 = v20;
  }
  __int16 v16 = *((_WORD *)v14 + 78);
  if ((v16 & 0x20) != 0)
  {
    self->_adSupportedChannel = *((unsigned char *)v14 + 152);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v16 = *((_WORD *)v14 + 78);
    if ((v16 & 0x80) == 0)
    {
LABEL_32:
      if ((v16 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_33;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_32;
  }
  self->_isPaidSubscriberToSourceChannel = *((unsigned char *)v14 + 154);
  *(_WORD *)&self->_has |= 0x80u;
  if (*((_WORD *)v14 + 78))
  {
LABEL_33:
    self->_uint64_t groupType = *((_DWORD *)v14 + 12);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_34:
  if (v14[4])
  {
    -[NTPBPDFPageView setCampaignId:](self, "setCampaignId:");
    uint64_t v14 = v20;
  }
  if ((*((_WORD *)v14 + 78) & 0x100) != 0)
  {
    self->_viewFromNotificationDirectOpen = *((unsigned char *)v14 + 155);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (v14[11])
  {
    -[NTPBPDFPageView setNotificationId:](self, "setNotificationId:");
    uint64_t v14 = v20;
  }
  channelData = self->_channelData;
  uint64_t v18 = v14[5];
  if (channelData)
  {
    if (!v18) {
      goto LABEL_52;
    }
    -[NTPBChannelData mergeFrom:](channelData, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_52;
    }
    -[NTPBPDFPageView setChannelData:](self, "setChannelData:");
  }
  uint64_t v14 = v20;
LABEL_52:
  __int16 v19 = *((_WORD *)v14 + 78);
  if ((v19 & 4) != 0)
  {
    self->_uint64_t paidSubscriberToFeedType = *((_DWORD *)v14 + 25);
    *(_WORD *)&self->_has |= 4u;
    __int16 v19 = *((_WORD *)v14 + 78);
  }
  if ((v19 & 8) != 0)
  {
    self->_uint64_t paidSubscriptionConversionPointType = *((_DWORD *)v14 + 26);
    *(_WORD *)&self->_has |= 8u;
  }
  if (v14[10])
  {
    -[NTPBPDFPageView setLanguage:](self, "setLanguage:");
    uint64_t v14 = v20;
  }
  if (v14[16])
  {
    -[NTPBPDFPageView setReferringSourceApplication:](self, "setReferringSourceApplication:");
    uint64_t v14 = v20;
  }
  if (v14[17]) {
    -[NTPBPDFPageView setReferringUrl:](self, "setReferringUrl:");
  }

  MEMORY[0x270F9A758]();
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

- (int)pageCount
{
  return self->_pageCount;
}

- (BOOL)isFreeIssue
{
  return self->_isFreeIssue;
}

- (NSString)parentFeedId
{
  return self->_parentFeedId;
}

- (void)setParentFeedId:(id)a3
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

- (BOOL)isPaidSubscriberToSourceChannel
{
  return self->_isPaidSubscriberToSourceChannel;
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
}

- (BOOL)viewFromNotificationDirectOpen
{
  return self->_viewFromNotificationDirectOpen;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
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

- (NSString)referringSourceApplication
{
  return self->_referringSourceApplication;
}

- (void)setReferringSourceApplication:(id)a3
{
}

- (NSString)referringUrl
{
  return self->_referringUrl;
}

- (void)setReferringUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceChannelId, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_parentFeedId, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_issueViewData, 0);
  objc_storeStrong((id *)&self->_issueExposureData, 0);
  objc_storeStrong((id *)&self->_issueData, 0);
  objc_storeStrong((id *)&self->_channelData, 0);

  objc_storeStrong((id *)&self->_campaignId, 0);
}

@end