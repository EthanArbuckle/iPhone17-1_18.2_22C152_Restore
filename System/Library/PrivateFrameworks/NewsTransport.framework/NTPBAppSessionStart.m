@interface NTPBAppSessionStart
+ (Class)autoSubscribedFeedIdsType;
+ (Class)groupableFeedIdsType;
+ (Class)notificationChannelIdsType;
+ (Class)paidSubscriptionChannelIdsType;
+ (Class)subscribedFeedIdsType;
+ (Class)visibleViewsType;
- (BOOL)hasAppsAutoSubscribeFeedCount;
- (BOOL)hasCampaignId;
- (BOOL)hasCampaignType;
- (BOOL)hasChannelSubscriptionCount;
- (BOOL)hasCreativeId;
- (BOOL)hasInternalAutoSubscribeFeedCount;
- (BOOL)hasIsMarketingNotificationEnabled;
- (BOOL)hasIsNewIssuesNotificationEnabled;
- (BOOL)hasLastAppSessionTimestamp;
- (BOOL)hasNotificationArticleId;
- (BOOL)hasNotificationEnabledChannelsCount;
- (BOOL)hasNotificationId;
- (BOOL)hasNotificationSenderChannelId;
- (BOOL)hasNotificationSourceChannelId;
- (BOOL)hasNotificationType;
- (BOOL)hasNotitificationsEnabledChannelsCount;
- (BOOL)hasPortraitAutoSubscribeFeedCount;
- (BOOL)hasReferringSourceApplication;
- (BOOL)hasReferringUrl;
- (BOOL)hasSafariAutoSubscribeFeedCount;
- (BOOL)hasSessionStartMethod;
- (BOOL)hasStartedFromNotification;
- (BOOL)hasTopicSubscriptionCount;
- (BOOL)hasUserActivityType;
- (BOOL)hasViewabilityState;
- (BOOL)hasWidgetArticleRank;
- (BOOL)hasWidgetEngagement;
- (BOOL)hasWidgetSection;
- (BOOL)hasWidgetSectionArticleRank;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMarketingNotificationEnabled;
- (BOOL)isNewIssuesNotificationEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)startedFromNotification;
- (NSMutableArray)autoSubscribedFeedIds;
- (NSMutableArray)groupableFeedIds;
- (NSMutableArray)notificationChannelIds;
- (NSMutableArray)paidSubscriptionChannelIds;
- (NSMutableArray)subscribedFeedIds;
- (NSMutableArray)visibleViews;
- (NSString)campaignId;
- (NSString)campaignType;
- (NSString)creativeId;
- (NSString)notificationArticleId;
- (NSString)notificationId;
- (NSString)notificationSenderChannelId;
- (NSString)notificationSourceChannelId;
- (NSString)referringSourceApplication;
- (NSString)referringUrl;
- (NSString)userActivityType;
- (NTPBWidgetEngagement)widgetEngagement;
- (id)autoSubscribedFeedIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupableFeedIdsAtIndex:(unint64_t)a3;
- (id)notificationChannelIdsAtIndex:(unint64_t)a3;
- (id)paidSubscriptionChannelIdsAtIndex:(unint64_t)a3;
- (id)subscribedFeedIdsAtIndex:(unint64_t)a3;
- (id)visibleViewsAtIndex:(unint64_t)a3;
- (id)widgetSectionAsString:(int)a3;
- (int)StringAsWidgetSection:(id)a3;
- (int)appsAutoSubscribeFeedCount;
- (int)channelSubscriptionCount;
- (int)internalAutoSubscribeFeedCount;
- (int)notificationEnabledChannelsCount;
- (int)notificationType;
- (int)notitificationsEnabledChannelsCount;
- (int)portraitAutoSubscribeFeedCount;
- (int)safariAutoSubscribeFeedCount;
- (int)sessionStartMethod;
- (int)topicSubscriptionCount;
- (int)viewabilityState;
- (int)widgetArticleRank;
- (int)widgetSection;
- (int)widgetSectionArticleRank;
- (int64_t)lastAppSessionTimestamp;
- (unint64_t)autoSubscribedFeedIdsCount;
- (unint64_t)groupableFeedIdsCount;
- (unint64_t)hash;
- (unint64_t)notificationChannelIdsCount;
- (unint64_t)paidSubscriptionChannelIdsCount;
- (unint64_t)subscribedFeedIdsCount;
- (unint64_t)visibleViewsCount;
- (void)addAutoSubscribedFeedIds:(id)a3;
- (void)addGroupableFeedIds:(id)a3;
- (void)addNotificationChannelIds:(id)a3;
- (void)addPaidSubscriptionChannelIds:(id)a3;
- (void)addSubscribedFeedIds:(id)a3;
- (void)addVisibleViews:(id)a3;
- (void)clearAutoSubscribedFeedIds;
- (void)clearGroupableFeedIds;
- (void)clearNotificationChannelIds;
- (void)clearPaidSubscriptionChannelIds;
- (void)clearSubscribedFeedIds;
- (void)clearVisibleViews;
- (void)mergeFrom:(id)a3;
- (void)setAppsAutoSubscribeFeedCount:(int)a3;
- (void)setAutoSubscribedFeedIds:(id)a3;
- (void)setCampaignId:(id)a3;
- (void)setCampaignType:(id)a3;
- (void)setChannelSubscriptionCount:(int)a3;
- (void)setCreativeId:(id)a3;
- (void)setGroupableFeedIds:(id)a3;
- (void)setHasAppsAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasChannelSubscriptionCount:(BOOL)a3;
- (void)setHasInternalAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasIsMarketingNotificationEnabled:(BOOL)a3;
- (void)setHasIsNewIssuesNotificationEnabled:(BOOL)a3;
- (void)setHasLastAppSessionTimestamp:(BOOL)a3;
- (void)setHasNotificationEnabledChannelsCount:(BOOL)a3;
- (void)setHasNotificationType:(BOOL)a3;
- (void)setHasNotitificationsEnabledChannelsCount:(BOOL)a3;
- (void)setHasPortraitAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasSafariAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasSessionStartMethod:(BOOL)a3;
- (void)setHasStartedFromNotification:(BOOL)a3;
- (void)setHasTopicSubscriptionCount:(BOOL)a3;
- (void)setHasViewabilityState:(BOOL)a3;
- (void)setHasWidgetArticleRank:(BOOL)a3;
- (void)setHasWidgetSection:(BOOL)a3;
- (void)setHasWidgetSectionArticleRank:(BOOL)a3;
- (void)setInternalAutoSubscribeFeedCount:(int)a3;
- (void)setIsMarketingNotificationEnabled:(BOOL)a3;
- (void)setIsNewIssuesNotificationEnabled:(BOOL)a3;
- (void)setLastAppSessionTimestamp:(int64_t)a3;
- (void)setNotificationArticleId:(id)a3;
- (void)setNotificationChannelIds:(id)a3;
- (void)setNotificationEnabledChannelsCount:(int)a3;
- (void)setNotificationId:(id)a3;
- (void)setNotificationSenderChannelId:(id)a3;
- (void)setNotificationSourceChannelId:(id)a3;
- (void)setNotificationType:(int)a3;
- (void)setNotitificationsEnabledChannelsCount:(int)a3;
- (void)setPaidSubscriptionChannelIds:(id)a3;
- (void)setPortraitAutoSubscribeFeedCount:(int)a3;
- (void)setReferringSourceApplication:(id)a3;
- (void)setReferringUrl:(id)a3;
- (void)setSafariAutoSubscribeFeedCount:(int)a3;
- (void)setSessionStartMethod:(int)a3;
- (void)setStartedFromNotification:(BOOL)a3;
- (void)setSubscribedFeedIds:(id)a3;
- (void)setTopicSubscriptionCount:(int)a3;
- (void)setUserActivityType:(id)a3;
- (void)setViewabilityState:(int)a3;
- (void)setVisibleViews:(id)a3;
- (void)setWidgetArticleRank:(int)a3;
- (void)setWidgetEngagement:(id)a3;
- (void)setWidgetSection:(int)a3;
- (void)setWidgetSectionArticleRank:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAppSessionStart

- (void)setLastAppSessionTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_lastAppSessionTimestamp = a3;
}

- (void)setHasLastAppSessionTimestamp:(BOOL)a3
{
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasLastAppSessionTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)clearVisibleViews
{
}

- (void)addVisibleViews:(id)a3
{
  id v4 = a3;
  visibleViews = self->_visibleViews;
  id v8 = v4;
  if (!visibleViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_visibleViews;
    self->_visibleViews = v6;

    id v4 = v8;
    visibleViews = self->_visibleViews;
  }
  [(NSMutableArray *)visibleViews addObject:v4];
}

- (unint64_t)visibleViewsCount
{
  return [(NSMutableArray *)self->_visibleViews count];
}

- (id)visibleViewsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visibleViews objectAtIndex:a3];
}

+ (Class)visibleViewsType
{
  return (Class)objc_opt_class();
}

- (void)setChannelSubscriptionCount:(int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_channelSubscriptionCount = a3;
}

- (void)setHasChannelSubscriptionCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasChannelSubscriptionCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTopicSubscriptionCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_topicSubscriptionCount = a3;
}

- (void)setHasTopicSubscriptionCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTopicSubscriptionCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (BOOL)hasReferringSourceApplication
{
  return self->_referringSourceApplication != 0;
}

- (BOOL)hasReferringUrl
{
  return self->_referringUrl != 0;
}

- (BOOL)hasUserActivityType
{
  return self->_userActivityType != 0;
}

- (void)clearPaidSubscriptionChannelIds
{
}

- (void)addPaidSubscriptionChannelIds:(id)a3
{
  id v4 = a3;
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  id v8 = v4;
  if (!paidSubscriptionChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_paidSubscriptionChannelIds;
    self->_paidSubscriptionChannelIds = v6;

    id v4 = v8;
    paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  }
  [(NSMutableArray *)paidSubscriptionChannelIds addObject:v4];
}

- (unint64_t)paidSubscriptionChannelIdsCount
{
  return [(NSMutableArray *)self->_paidSubscriptionChannelIds count];
}

- (id)paidSubscriptionChannelIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paidSubscriptionChannelIds objectAtIndex:a3];
}

+ (Class)paidSubscriptionChannelIdsType
{
  return (Class)objc_opt_class();
}

- (void)setStartedFromNotification:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_startedFromNotification = a3;
}

- (void)setHasStartedFromNotification:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasStartedFromNotification
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasNotificationId
{
  return self->_notificationId != 0;
}

- (BOOL)hasNotificationSenderChannelId
{
  return self->_notificationSenderChannelId != 0;
}

- (BOOL)hasNotificationSourceChannelId
{
  return self->_notificationSourceChannelId != 0;
}

- (void)setNotitificationsEnabledChannelsCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_notitificationsEnabledChannelsCount = a3;
}

- (void)setHasNotitificationsEnabledChannelsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNotitificationsEnabledChannelsCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)clearNotificationChannelIds
{
}

- (void)addNotificationChannelIds:(id)a3
{
  id v4 = a3;
  notificationChannelIds = self->_notificationChannelIds;
  id v8 = v4;
  if (!notificationChannelIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_notificationChannelIds;
    self->_notificationChannelIds = v6;

    id v4 = v8;
    notificationChannelIds = self->_notificationChannelIds;
  }
  [(NSMutableArray *)notificationChannelIds addObject:v4];
}

- (unint64_t)notificationChannelIdsCount
{
  return [(NSMutableArray *)self->_notificationChannelIds count];
}

- (id)notificationChannelIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_notificationChannelIds objectAtIndex:a3];
}

+ (Class)notificationChannelIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasNotificationArticleId
{
  return self->_notificationArticleId != 0;
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

- (void)setNotificationEnabledChannelsCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_notificationEnabledChannelsCount = a3;
}

- (void)setHasNotificationEnabledChannelsCount:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasNotificationEnabledChannelsCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearSubscribedFeedIds
{
}

- (void)addSubscribedFeedIds:(id)a3
{
  id v4 = a3;
  subscribedFeedIds = self->_subscribedFeedIds;
  id v8 = v4;
  if (!subscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_subscribedFeedIds;
    self->_subscribedFeedIds = v6;

    id v4 = v8;
    subscribedFeedIds = self->_subscribedFeedIds;
  }
  [(NSMutableArray *)subscribedFeedIds addObject:v4];
}

- (unint64_t)subscribedFeedIdsCount
{
  return [(NSMutableArray *)self->_subscribedFeedIds count];
}

- (id)subscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_subscribedFeedIds objectAtIndex:a3];
}

+ (Class)subscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (int)sessionStartMethod
{
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    return self->_sessionStartMethod;
  }
  else {
    return 0;
  }
}

- (void)setSessionStartMethod:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_sessionStartMethod = a3;
}

- (void)setHasSessionStartMethod:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasSessionStartMethod
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)widgetSection
{
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    return self->_widgetSection;
  }
  else {
    return 0;
  }
}

- (void)setWidgetSection:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_widgetSection = a3;
}

- (void)setHasWidgetSection:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasWidgetSection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)widgetSectionAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_26444B598[a3];
  }

  return v3;
}

- (int)StringAsWidgetSection:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_WIDGET_SECTION"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"TOP_STORIES_WIDGET_SECTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FOR_YOU_WIDGET_SECTION"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRENDING_WIDGET_SECTION"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EDITORIAL_WIDGET_SECTION"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setWidgetSectionArticleRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_widgetSectionArticleRank = a3;
}

- (void)setHasWidgetSectionArticleRank:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasWidgetSectionArticleRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setWidgetArticleRank:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_widgetArticleRank = a3;
}

- (void)setHasWidgetArticleRank:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasWidgetArticleRank
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasWidgetEngagement
{
  return self->_widgetEngagement != 0;
}

- (void)clearAutoSubscribedFeedIds
{
}

- (void)addAutoSubscribedFeedIds:(id)a3
{
  id v4 = a3;
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  id v8 = v4;
  if (!autoSubscribedFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_autoSubscribedFeedIds;
    self->_autoSubscribedFeedIds = v6;

    id v4 = v8;
    autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  }
  [(NSMutableArray *)autoSubscribedFeedIds addObject:v4];
}

- (unint64_t)autoSubscribedFeedIdsCount
{
  return [(NSMutableArray *)self->_autoSubscribedFeedIds count];
}

- (id)autoSubscribedFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_autoSubscribedFeedIds objectAtIndex:a3];
}

+ (Class)autoSubscribedFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)clearGroupableFeedIds
{
}

- (void)addGroupableFeedIds:(id)a3
{
  id v4 = a3;
  groupableFeedIds = self->_groupableFeedIds;
  id v8 = v4;
  if (!groupableFeedIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_groupableFeedIds;
    self->_groupableFeedIds = v6;

    id v4 = v8;
    groupableFeedIds = self->_groupableFeedIds;
  }
  [(NSMutableArray *)groupableFeedIds addObject:v4];
}

- (unint64_t)groupableFeedIdsCount
{
  return [(NSMutableArray *)self->_groupableFeedIds count];
}

- (id)groupableFeedIdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groupableFeedIds objectAtIndex:a3];
}

+ (Class)groupableFeedIdsType
{
  return (Class)objc_opt_class();
}

- (void)setPortraitAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_portraitAutoSubscribeFeedCount = a3;
}

- (void)setHasPortraitAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPortraitAutoSubscribeFeedCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSafariAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_safariAutoSubscribeFeedCount = a3;
}

- (void)setHasSafariAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasSafariAutoSubscribeFeedCount
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setAppsAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_appsAutoSubscribeFeedCount = a3;
}

- (void)setHasAppsAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAppsAutoSubscribeFeedCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInternalAutoSubscribeFeedCount:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_internalAutoSubscribeFeedCount = a3;
}

- (void)setHasInternalAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasInternalAutoSubscribeFeedCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)viewabilityState
{
  if ((*((unsigned char *)&self->_has + 1) & 8) != 0) {
    return self->_viewabilityState;
  }
  else {
    return 0;
  }
}

- (void)setViewabilityState:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_viewabilityState = a3;
}

- (void)setHasViewabilityState:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasViewabilityState
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (int)notificationType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_notificationType;
  }
  else {
    return 0;
  }
}

- (void)setNotificationType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_notificationType = a3;
}

- (void)setHasNotificationType:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasNotificationType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setIsNewIssuesNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isNewIssuesNotificationEnabled = a3;
}

- (void)setHasIsNewIssuesNotificationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsNewIssuesNotificationEnabled
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setIsMarketingNotificationEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isMarketingNotificationEnabled = a3;
}

- (void)setHasIsMarketingNotificationEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($FCCF821F11C5FAFB61D31B7D7B590019)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsMarketingNotificationEnabled
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAppSessionStart;
  id v4 = [(NTPBAppSessionStart *)&v8 description];
  v5 = [(NTPBAppSessionStart *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithLongLong:self->_lastAppSessionTimestamp];
    [v3 setObject:v4 forKey:@"last_app_session_timestamp"];
  }
  if ([(NSMutableArray *)self->_visibleViews count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_visibleViews, "count"));
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    v6 = self->_visibleViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v52 + 1) + 8 * i) dictionaryRepresentation];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"visible_views"];
  }
  $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    v13 = [NSNumber numberWithInt:self->_channelSubscriptionCount];
    [v3 setObject:v13 forKey:@"channel_subscription_count"];

    $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_topicSubscriptionCount];
    [v3 setObject:v14 forKey:@"topic_subscription_count"];
  }
  referringSourceApplication = self->_referringSourceApplication;
  if (referringSourceApplication) {
    [v3 setObject:referringSourceApplication forKey:@"referring_source_application"];
  }
  referringUrl = self->_referringUrl;
  if (referringUrl) {
    [v3 setObject:referringUrl forKey:@"referring_url"];
  }
  userActivityType = self->_userActivityType;
  if (userActivityType) {
    [v3 setObject:userActivityType forKey:@"user_activity_type"];
  }
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if (paidSubscriptionChannelIds) {
    [v3 setObject:paidSubscriptionChannelIds forKey:@"paid_subscription_channel_ids"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    v19 = [NSNumber numberWithBool:self->_startedFromNotification];
    [v3 setObject:v19 forKey:@"started_from_notification"];
  }
  notificationId = self->_notificationId;
  if (notificationId) {
    [v3 setObject:notificationId forKey:@"notification_id"];
  }
  notificationSenderChannelId = self->_notificationSenderChannelId;
  if (notificationSenderChannelId) {
    [v3 setObject:notificationSenderChannelId forKey:@"notification_sender_channel_id"];
  }
  notificationSourceChannelId = self->_notificationSourceChannelId;
  if (notificationSourceChannelId) {
    [v3 setObject:notificationSourceChannelId forKey:@"notification_source_channel_id"];
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    v23 = [NSNumber numberWithInt:self->_notitificationsEnabledChannelsCount];
    [v3 setObject:v23 forKey:@"notitifications_enabled_channels_count"];
  }
  notificationChannelIds = self->_notificationChannelIds;
  if (notificationChannelIds) {
    [v3 setObject:notificationChannelIds forKey:@"notification_channel_ids"];
  }
  notificationArticleId = self->_notificationArticleId;
  if (notificationArticleId) {
    [v3 setObject:notificationArticleId forKey:@"notification_article_id"];
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v29 = [NSNumber numberWithInt:self->_notificationEnabledChannelsCount];
    [v3 setObject:v29 forKey:@"notification_enabled_channels_count"];
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if (subscribedFeedIds) {
    [v3 setObject:subscribedFeedIds forKey:@"subscribed_feed_ids"];
  }
  $FCCF821F11C5FAFB61D31B7D7B590019 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x200) != 0)
  {
    v41 = [NSNumber numberWithInt:self->_sessionStartMethod];
    [v3 setObject:v41 forKey:@"session_start_method"];

    $FCCF821F11C5FAFB61D31B7D7B590019 v31 = self->_has;
    if ((*(_WORD *)&v31 & 0x2000) == 0)
    {
LABEL_50:
      if ((*(_WORD *)&v31 & 0x4000) == 0) {
        goto LABEL_51;
      }
      goto LABEL_82;
    }
  }
  else if ((*(_WORD *)&v31 & 0x2000) == 0)
  {
    goto LABEL_50;
  }
  uint64_t widgetSection = self->_widgetSection;
  if (widgetSection >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_widgetSection);
    v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v43 = off_26444B598[widgetSection];
  }
  [v3 setObject:v43 forKey:@"widget_section"];

  $FCCF821F11C5FAFB61D31B7D7B590019 v31 = self->_has;
  if ((*(_WORD *)&v31 & 0x4000) == 0)
  {
LABEL_51:
    if ((*(_WORD *)&v31 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_52;
  }
LABEL_82:
  v51 = [NSNumber numberWithInt:self->_widgetSectionArticleRank];
  [v3 setObject:v51 forKey:@"widget_section_article_rank"];

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_52:
    v32 = [NSNumber numberWithInt:self->_widgetArticleRank];
    [v3 setObject:v32 forKey:@"widget_article_rank"];
  }
LABEL_53:
  widgetEngagement = self->_widgetEngagement;
  if (widgetEngagement)
  {
    v34 = [(NTPBWidgetEngagement *)widgetEngagement dictionaryRepresentation];
    [v3 setObject:v34 forKey:@"widget_engagement"];
  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if (autoSubscribedFeedIds) {
    [v3 setObject:autoSubscribedFeedIds forKey:@"auto_subscribed_feed_ids"];
  }
  groupableFeedIds = self->_groupableFeedIds;
  if (groupableFeedIds) {
    [v3 setObject:groupableFeedIds forKey:@"groupable_feed_ids"];
  }
  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x80) != 0)
  {
    v44 = [NSNumber numberWithInt:self->_portraitAutoSubscribeFeedCount];
    [v3 setObject:v44 forKey:@"portrait_auto_subscribe_feed_count"];

    $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x100) == 0)
    {
LABEL_61:
      if ((*(unsigned char *)&v37 & 2) == 0) {
        goto LABEL_62;
      }
      goto LABEL_74;
    }
  }
  else if ((*(_WORD *)&v37 & 0x100) == 0)
  {
    goto LABEL_61;
  }
  v45 = [NSNumber numberWithInt:self->_safariAutoSubscribeFeedCount];
  [v3 setObject:v45 forKey:@"safari_auto_subscribe_feed_count"];

  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 2) == 0)
  {
LABEL_62:
    if ((*(unsigned char *)&v37 & 8) == 0) {
      goto LABEL_63;
    }
    goto LABEL_75;
  }
LABEL_74:
  v46 = [NSNumber numberWithInt:self->_appsAutoSubscribeFeedCount];
  [v3 setObject:v46 forKey:@"apps_auto_subscribe_feed_count"];

  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 8) == 0)
  {
LABEL_63:
    if ((*(_WORD *)&v37 & 0x800) == 0) {
      goto LABEL_64;
    }
    goto LABEL_76;
  }
LABEL_75:
  v47 = [NSNumber numberWithInt:self->_internalAutoSubscribeFeedCount];
  [v3 setObject:v47 forKey:@"internal_auto_subscribe_feed_count"];

  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x800) == 0)
  {
LABEL_64:
    if ((*(unsigned char *)&v37 & 0x20) == 0) {
      goto LABEL_65;
    }
    goto LABEL_77;
  }
LABEL_76:
  v48 = [NSNumber numberWithInt:self->_viewabilityState];
  [v3 setObject:v48 forKey:@"viewability_state"];

  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x20) == 0)
  {
LABEL_65:
    if ((*(_DWORD *)&v37 & 0x10000) == 0) {
      goto LABEL_66;
    }
LABEL_78:
    v50 = [NSNumber numberWithBool:self->_isNewIssuesNotificationEnabled];
    [v3 setObject:v50 forKey:@"is_new_issues_notification_enabled"];

    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
LABEL_77:
  v49 = [NSNumber numberWithInt:self->_notificationType];
  [v3 setObject:v49 forKey:@"notification_type"];

  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x10000) != 0) {
    goto LABEL_78;
  }
LABEL_66:
  if ((*(_WORD *)&v37 & 0x8000) != 0)
  {
LABEL_67:
    v38 = [NSNumber numberWithBool:self->_isMarketingNotificationEnabled];
    [v3 setObject:v38 forKey:@"is_marketing_notification_enabled"];
  }
LABEL_68:
  id v39 = v3;

  return v39;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppSessionStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v5 = self->_visibleViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v7);
  }

  $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_referringSourceApplication) {
    PBDataWriterWriteStringField();
  }
  if (self->_referringUrl) {
    PBDataWriterWriteStringField();
  }
  if (self->_userActivityType) {
    PBDataWriterWriteStringField();
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v11 = self->_paidSubscriptionChannelIds;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v13);
  }

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_notificationId) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationSenderChannelId) {
    PBDataWriterWriteStringField();
  }
  if (self->_notificationSourceChannelId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  v16 = self->_notificationChannelIds;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v51;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v18);
  }

  if (self->_notificationArticleId) {
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
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v21 = self->_subscribedFeedIds;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v46 objects:v64 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v47;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v23);
  }

  $FCCF821F11C5FAFB61D31B7D7B590019 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    $FCCF821F11C5FAFB61D31B7D7B590019 v26 = self->_has;
    if ((*(_WORD *)&v26 & 0x2000) == 0)
    {
LABEL_63:
      if ((*(_WORD *)&v26 & 0x4000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_94;
    }
  }
  else if ((*(_WORD *)&v26 & 0x2000) == 0)
  {
    goto LABEL_63;
  }
  PBDataWriterWriteInt32Field();
  $FCCF821F11C5FAFB61D31B7D7B590019 v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x4000) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v26 & 0x1000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_65:
  }
    PBDataWriterWriteInt32Field();
LABEL_66:
  if (self->_widgetEngagement) {
    PBDataWriterWriteSubmessage();
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v27 = self->_autoSubscribedFeedIds;
  uint64_t v28 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v63 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteStringField();
        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = [(NSMutableArray *)v27 countByEnumeratingWithState:&v42 objects:v63 count:16];
    }
    while (v29);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v32 = self->_groupableFeedIds;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v39;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v32);
        }
        PBDataWriterWriteStringField();
        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v34);
  }

  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
    if ((*(_WORD *)&v37 & 0x100) == 0)
    {
LABEL_84:
      if ((*(unsigned char *)&v37 & 2) == 0) {
        goto LABEL_85;
      }
      goto LABEL_98;
    }
  }
  else if ((*(_WORD *)&v37 & 0x100) == 0)
  {
    goto LABEL_84;
  }
  PBDataWriterWriteInt32Field();
  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 2) == 0)
  {
LABEL_85:
    if ((*(unsigned char *)&v37 & 8) == 0) {
      goto LABEL_86;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 8) == 0)
  {
LABEL_86:
    if ((*(_WORD *)&v37 & 0x800) == 0) {
      goto LABEL_87;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteInt32Field();
  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(_WORD *)&v37 & 0x800) == 0)
  {
LABEL_87:
    if ((*(unsigned char *)&v37 & 0x20) == 0) {
      goto LABEL_88;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteInt32Field();
  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(unsigned char *)&v37 & 0x20) == 0)
  {
LABEL_88:
    if ((*(_DWORD *)&v37 & 0x10000) == 0) {
      goto LABEL_89;
    }
LABEL_102:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_91;
    }
    goto LABEL_90;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  $FCCF821F11C5FAFB61D31B7D7B590019 v37 = self->_has;
  if ((*(_DWORD *)&v37 & 0x10000) != 0) {
    goto LABEL_102;
  }
LABEL_89:
  if ((*(_WORD *)&v37 & 0x8000) != 0) {
LABEL_90:
  }
    PBDataWriterWriteBOOLField();
LABEL_91:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_lastAppSessionTimestamp;
    *(_DWORD *)(v5 + 244) |= 1u;
  }
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v7 = self->_visibleViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v89 objects:v98 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v90;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v90 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v89 + 1) + 8 * v11) copyWithZone:a3];
        [(id)v6 addVisibleViews:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v89 objects:v98 count:16];
    }
    while (v9);
  }

  $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_channelSubscriptionCount;
    *(_DWORD *)(v6 + 244) |= 4u;
    $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    *(_DWORD *)(v6 + 184) = self->_topicSubscriptionCount;
    *(_DWORD *)(v6 + 244) |= 0x400u;
  }
  uint64_t v14 = [(NSString *)self->_referringSourceApplication copyWithZone:a3];
  uint64_t v15 = *(void **)(v6 + 152);
  *(void *)(v6 + 152) = v14;

  uint64_t v16 = [(NSString *)self->_referringUrl copyWithZone:a3];
  uint64_t v17 = *(void **)(v6 + 160);
  *(void *)(v6 + 160) = v16;

  uint64_t v18 = [(NSString *)self->_userActivityType copyWithZone:a3];
  uint64_t v19 = *(void **)(v6 + 192);
  *(void *)(v6 + 192) = v18;

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v20 = self->_paidSubscriptionChannelIds;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v85 objects:v97 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v86;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v86 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v85 + 1) + 8 * v24) copyWithZone:a3];
        [(id)v6 addPaidSubscriptionChannelIds:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v85 objects:v97 count:16];
    }
    while (v22);
  }

  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    *(unsigned char *)(v6 + 242) = self->_startedFromNotification;
    *(_DWORD *)(v6 + 244) |= 0x20000u;
  }
  uint64_t v26 = [(NSString *)self->_notificationId copyWithZone:a3];
  v27 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v26;

  uint64_t v28 = [(NSString *)self->_notificationSenderChannelId copyWithZone:a3];
  uint64_t v29 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v28;

  uint64_t v30 = [(NSString *)self->_notificationSourceChannelId copyWithZone:a3];
  uint64_t v31 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v30;

  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 132) = self->_notitificationsEnabledChannelsCount;
    *(_DWORD *)(v6 + 244) |= 0x40u;
  }
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v32 = self->_notificationChannelIds;
  uint64_t v33 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v81 objects:v96 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v82;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v82 != v35) {
          objc_enumerationMutation(v32);
        }
        $FCCF821F11C5FAFB61D31B7D7B590019 v37 = (void *)[*(id *)(*((void *)&v81 + 1) + 8 * v36) copyWithZone:a3];
        [(id)v6 addNotificationChannelIds:v37];

        ++v36;
      }
      while (v34 != v36);
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v81 objects:v96 count:16];
    }
    while (v34);
  }

  uint64_t v38 = [(NSString *)self->_notificationArticleId copyWithZone:a3];
  long long v39 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v38;

  uint64_t v40 = [(NSString *)self->_campaignId copyWithZone:a3];
  long long v41 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v40;

  uint64_t v42 = [(NSString *)self->_campaignType copyWithZone:a3];
  long long v43 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v42;

  uint64_t v44 = [(NSString *)self->_creativeId copyWithZone:a3];
  long long v45 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v44;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_notificationEnabledChannelsCount;
    *(_DWORD *)(v6 + 244) |= 0x10u;
  }
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v46 = self->_subscribedFeedIds;
  uint64_t v47 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v77 objects:v95 count:16];
  if (v47)
  {
    uint64_t v48 = v47;
    uint64_t v49 = *(void *)v78;
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v78 != v49) {
          objc_enumerationMutation(v46);
        }
        long long v51 = (void *)[*(id *)(*((void *)&v77 + 1) + 8 * v50) copyWithZone:a3];
        [(id)v6 addSubscribedFeedIds:v51];

        ++v50;
      }
      while (v48 != v50);
      uint64_t v48 = [(NSMutableArray *)v46 countByEnumeratingWithState:&v77 objects:v95 count:16];
    }
    while (v48);
  }

  $FCCF821F11C5FAFB61D31B7D7B590019 v52 = self->_has;
  if ((*(_WORD *)&v52 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 172) = self->_sessionStartMethod;
    *(_DWORD *)(v6 + 244) |= 0x200u;
    $FCCF821F11C5FAFB61D31B7D7B590019 v52 = self->_has;
    if ((*(_WORD *)&v52 & 0x2000) == 0)
    {
LABEL_43:
      if ((*(_WORD *)&v52 & 0x4000) == 0) {
        goto LABEL_44;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v52 & 0x2000) == 0)
  {
    goto LABEL_43;
  }
  *(_DWORD *)(v6 + 232) = self->_widgetSection;
  *(_DWORD *)(v6 + 244) |= 0x2000u;
  $FCCF821F11C5FAFB61D31B7D7B590019 v52 = self->_has;
  if ((*(_WORD *)&v52 & 0x4000) == 0)
  {
LABEL_44:
    if ((*(_WORD *)&v52 & 0x1000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_72:
  *(_DWORD *)(v6 + 236) = self->_widgetSectionArticleRank;
  *(_DWORD *)(v6 + 244) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_45:
    *(_DWORD *)(v6 + 216) = self->_widgetArticleRank;
    *(_DWORD *)(v6 + 244) |= 0x1000u;
  }
LABEL_46:
  id v53 = [(NTPBWidgetEngagement *)self->_widgetEngagement copyWithZone:a3];
  long long v54 = *(void **)(v6 + 224);
  *(void *)(v6 + 224) = v53;

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v55 = self->_autoSubscribedFeedIds;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v73 objects:v94 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v74;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v74 != v58) {
          objc_enumerationMutation(v55);
        }
        long long v60 = (void *)[*(id *)(*((void *)&v73 + 1) + 8 * v59) copyWithZone:a3];
        [(id)v6 addAutoSubscribedFeedIds:v60];

        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v73 objects:v94 count:16];
    }
    while (v57);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v61 = self->_groupableFeedIds;
  uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v69 objects:v93 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = *(void *)v70;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v70 != v64) {
          objc_enumerationMutation(v61);
        }
        v66 = objc_msgSend(*(id *)(*((void *)&v69 + 1) + 8 * v65), "copyWithZone:", a3, (void)v69);
        [(id)v6 addGroupableFeedIds:v66];

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v69 objects:v93 count:16];
    }
    while (v63);
  }

  $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
  if ((*(unsigned char *)&v67 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 144) = self->_portraitAutoSubscribeFeedCount;
    *(_DWORD *)(v6 + 244) |= 0x80u;
    $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
    if ((*(_WORD *)&v67 & 0x100) == 0)
    {
LABEL_62:
      if ((*(unsigned char *)&v67 & 2) == 0) {
        goto LABEL_63;
      }
      goto LABEL_76;
    }
  }
  else if ((*(_WORD *)&v67 & 0x100) == 0)
  {
    goto LABEL_62;
  }
  *(_DWORD *)(v6 + 168) = self->_safariAutoSubscribeFeedCount;
  *(_DWORD *)(v6 + 244) |= 0x100u;
  $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
  if ((*(unsigned char *)&v67 & 2) == 0)
  {
LABEL_63:
    if ((*(unsigned char *)&v67 & 8) == 0) {
      goto LABEL_64;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v6 + 16) = self->_appsAutoSubscribeFeedCount;
  *(_DWORD *)(v6 + 244) |= 2u;
  $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
  if ((*(unsigned char *)&v67 & 8) == 0)
  {
LABEL_64:
    if ((*(_WORD *)&v67 & 0x800) == 0) {
      goto LABEL_65;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v6 + 72) = self->_internalAutoSubscribeFeedCount;
  *(_DWORD *)(v6 + 244) |= 8u;
  $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
  if ((*(_WORD *)&v67 & 0x800) == 0)
  {
LABEL_65:
    if ((*(unsigned char *)&v67 & 0x20) == 0) {
      goto LABEL_66;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v6 + 200) = self->_viewabilityState;
  *(_DWORD *)(v6 + 244) |= 0x800u;
  $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
  if ((*(unsigned char *)&v67 & 0x20) == 0)
  {
LABEL_66:
    if ((*(_DWORD *)&v67 & 0x10000) == 0) {
      goto LABEL_67;
    }
LABEL_80:
    *(unsigned char *)(v6 + 241) = self->_isNewIssuesNotificationEnabled;
    *(_DWORD *)(v6 + 244) |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      return (id)v6;
    }
    goto LABEL_68;
  }
LABEL_79:
  *(_DWORD *)(v6 + 128) = self->_notificationType;
  *(_DWORD *)(v6 + 244) |= 0x20u;
  $FCCF821F11C5FAFB61D31B7D7B590019 v67 = self->_has;
  if ((*(_DWORD *)&v67 & 0x10000) != 0) {
    goto LABEL_80;
  }
LABEL_67:
  if ((*(_WORD *)&v67 & 0x8000) != 0)
  {
LABEL_68:
    *(unsigned char *)(v6 + 240) = self->_isMarketingNotificationEnabled;
    *(_DWORD *)(v6 + 244) |= 0x8000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_132;
  }
  $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  int v6 = *((_DWORD *)v4 + 61);
  if (*(unsigned char *)&has)
  {
    if ((v6 & 1) == 0 || self->_lastAppSessionTimestamp != *((void *)v4 + 1)) {
      goto LABEL_132;
    }
  }
  else if (v6)
  {
    goto LABEL_132;
  }
  visibleViews = self->_visibleViews;
  if ((unint64_t)visibleViews | *((void *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](visibleViews, "isEqual:")) {
      goto LABEL_132;
    }
    $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  }
  int v8 = *((_DWORD *)v4 + 61);
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_channelSubscriptionCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_132;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_topicSubscriptionCount != *((_DWORD *)v4 + 46)) {
      goto LABEL_132;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_132;
  }
  referringSourceApplication = self->_referringSourceApplication;
  if ((unint64_t)referringSourceApplication | *((void *)v4 + 19)
    && !-[NSString isEqual:](referringSourceApplication, "isEqual:"))
  {
    goto LABEL_132;
  }
  referringUrl = self->_referringUrl;
  if ((unint64_t)referringUrl | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](referringUrl, "isEqual:")) {
      goto LABEL_132;
    }
  }
  userActivityType = self->_userActivityType;
  if ((unint64_t)userActivityType | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](userActivityType, "isEqual:")) {
      goto LABEL_132;
    }
  }
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if ((unint64_t)paidSubscriptionChannelIds | *((void *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](paidSubscriptionChannelIds, "isEqual:")) {
      goto LABEL_132;
    }
  }
  int v13 = *((_DWORD *)v4 + 61);
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0)
  {
    if ((v13 & 0x20000) == 0) {
      goto LABEL_132;
    }
    if (self->_startedFromNotification)
    {
      if (!*((unsigned char *)v4 + 242)) {
        goto LABEL_132;
      }
    }
    else if (*((unsigned char *)v4 + 242))
    {
      goto LABEL_132;
    }
  }
  else if ((v13 & 0x20000) != 0)
  {
    goto LABEL_132;
  }
  notificationId = self->_notificationId;
  if ((unint64_t)notificationId | *((void *)v4 + 13)
    && !-[NSString isEqual:](notificationId, "isEqual:"))
  {
    goto LABEL_132;
  }
  notificationSenderChannelId = self->_notificationSenderChannelId;
  if ((unint64_t)notificationSenderChannelId | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](notificationSenderChannelId, "isEqual:")) {
      goto LABEL_132;
    }
  }
  notificationSourceChannelId = self->_notificationSourceChannelId;
  if ((unint64_t)notificationSourceChannelId | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](notificationSourceChannelId, "isEqual:")) {
      goto LABEL_132;
    }
  }
  int v17 = *((_DWORD *)v4 + 61);
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v17 & 0x40) == 0 || self->_notitificationsEnabledChannelsCount != *((_DWORD *)v4 + 33)) {
      goto LABEL_132;
    }
  }
  else if ((v17 & 0x40) != 0)
  {
    goto LABEL_132;
  }
  notificationChannelIds = self->_notificationChannelIds;
  if ((unint64_t)notificationChannelIds | *((void *)v4 + 11)
    && !-[NSMutableArray isEqual:](notificationChannelIds, "isEqual:"))
  {
    goto LABEL_132;
  }
  notificationArticleId = self->_notificationArticleId;
  if ((unint64_t)notificationArticleId | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](notificationArticleId, "isEqual:")) {
      goto LABEL_132;
    }
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:")) {
      goto LABEL_132;
    }
  }
  campaignType = self->_campaignType;
  if ((unint64_t)campaignType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](campaignType, "isEqual:")) {
      goto LABEL_132;
    }
  }
  creativeId = self->_creativeId;
  if ((unint64_t)creativeId | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](creativeId, "isEqual:")) {
      goto LABEL_132;
    }
  }
  $FCCF821F11C5FAFB61D31B7D7B590019 v23 = self->_has;
  int v24 = *((_DWORD *)v4 + 61);
  if ((*(unsigned char *)&v23 & 0x10) != 0)
  {
    if ((v24 & 0x10) == 0 || self->_notificationEnabledChannelsCount != *((_DWORD *)v4 + 24)) {
      goto LABEL_132;
    }
  }
  else if ((v24 & 0x10) != 0)
  {
    goto LABEL_132;
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if ((unint64_t)subscribedFeedIds | *((void *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](subscribedFeedIds, "isEqual:")) {
      goto LABEL_132;
    }
    $FCCF821F11C5FAFB61D31B7D7B590019 v23 = self->_has;
  }
  int v26 = *((_DWORD *)v4 + 61);
  if ((*(_WORD *)&v23 & 0x200) != 0)
  {
    if ((v26 & 0x200) == 0 || self->_sessionStartMethod != *((_DWORD *)v4 + 43)) {
      goto LABEL_132;
    }
  }
  else if ((v26 & 0x200) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v23 & 0x2000) != 0)
  {
    if ((v26 & 0x2000) == 0 || self->_widgetSection != *((_DWORD *)v4 + 58)) {
      goto LABEL_132;
    }
  }
  else if ((v26 & 0x2000) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v23 & 0x4000) != 0)
  {
    if ((v26 & 0x4000) == 0 || self->_widgetSectionArticleRank != *((_DWORD *)v4 + 59)) {
      goto LABEL_132;
    }
  }
  else if ((v26 & 0x4000) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v23 & 0x1000) != 0)
  {
    if ((v26 & 0x1000) == 0 || self->_widgetArticleRank != *((_DWORD *)v4 + 54)) {
      goto LABEL_132;
    }
  }
  else if ((v26 & 0x1000) != 0)
  {
    goto LABEL_132;
  }
  widgetEngagement = self->_widgetEngagement;
  if ((unint64_t)widgetEngagement | *((void *)v4 + 28)
    && !-[NTPBWidgetEngagement isEqual:](widgetEngagement, "isEqual:"))
  {
    goto LABEL_132;
  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if ((unint64_t)autoSubscribedFeedIds | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](autoSubscribedFeedIds, "isEqual:")) {
      goto LABEL_132;
    }
  }
  groupableFeedIds = self->_groupableFeedIds;
  if ((unint64_t)groupableFeedIds | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](groupableFeedIds, "isEqual:")) {
      goto LABEL_132;
    }
  }
  $FCCF821F11C5FAFB61D31B7D7B590019 v30 = self->_has;
  int v31 = *((_DWORD *)v4 + 61);
  if ((*(unsigned char *)&v30 & 0x80) != 0)
  {
    if ((v31 & 0x80) == 0 || self->_portraitAutoSubscribeFeedCount != *((_DWORD *)v4 + 36)) {
      goto LABEL_132;
    }
  }
  else if ((v31 & 0x80) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v30 & 0x100) != 0)
  {
    if ((v31 & 0x100) == 0 || self->_safariAutoSubscribeFeedCount != *((_DWORD *)v4 + 42)) {
      goto LABEL_132;
    }
  }
  else if ((v31 & 0x100) != 0)
  {
    goto LABEL_132;
  }
  if ((*(unsigned char *)&v30 & 2) != 0)
  {
    if ((v31 & 2) == 0 || self->_appsAutoSubscribeFeedCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_132;
    }
  }
  else if ((v31 & 2) != 0)
  {
    goto LABEL_132;
  }
  if ((*(unsigned char *)&v30 & 8) != 0)
  {
    if ((v31 & 8) == 0 || self->_internalAutoSubscribeFeedCount != *((_DWORD *)v4 + 18)) {
      goto LABEL_132;
    }
  }
  else if ((v31 & 8) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v30 & 0x800) != 0)
  {
    if ((v31 & 0x800) == 0 || self->_viewabilityState != *((_DWORD *)v4 + 50)) {
      goto LABEL_132;
    }
  }
  else if ((v31 & 0x800) != 0)
  {
    goto LABEL_132;
  }
  if ((*(unsigned char *)&v30 & 0x20) != 0)
  {
    if ((v31 & 0x20) == 0 || self->_notificationType != *((_DWORD *)v4 + 32)) {
      goto LABEL_132;
    }
  }
  else if ((v31 & 0x20) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_DWORD *)&v30 & 0x10000) != 0)
  {
    if ((v31 & 0x10000) == 0) {
      goto LABEL_132;
    }
    if (self->_isNewIssuesNotificationEnabled)
    {
      if (!*((unsigned char *)v4 + 241)) {
        goto LABEL_132;
      }
    }
    else if (*((unsigned char *)v4 + 241))
    {
      goto LABEL_132;
    }
  }
  else if ((v31 & 0x10000) != 0)
  {
    goto LABEL_132;
  }
  if ((*(_WORD *)&v30 & 0x8000) != 0)
  {
    if ((v31 & 0x8000) != 0)
    {
      if (self->_isMarketingNotificationEnabled)
      {
        if (!*((unsigned char *)v4 + 240)) {
          goto LABEL_132;
        }
      }
      else if (*((unsigned char *)v4 + 240))
      {
        goto LABEL_132;
      }
      BOOL v32 = 1;
      goto LABEL_133;
    }
LABEL_132:
    BOOL v32 = 0;
    goto LABEL_133;
  }
  BOOL v32 = (*((_DWORD *)v4 + 61) & 0x8000) == 0;
LABEL_133:

  return v32;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v42 = 2654435761 * self->_lastAppSessionTimestamp;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v41 = [(NSMutableArray *)self->_visibleViews hash];
  $FCCF821F11C5FAFB61D31B7D7B590019 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    uint64_t v40 = 2654435761 * self->_channelSubscriptionCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_6:
      uint64_t v39 = 2654435761 * self->_topicSubscriptionCount;
      goto LABEL_9;
    }
  }
  uint64_t v39 = 0;
LABEL_9:
  NSUInteger v38 = [(NSString *)self->_referringSourceApplication hash];
  NSUInteger v37 = [(NSString *)self->_referringUrl hash];
  NSUInteger v36 = [(NSString *)self->_userActivityType hash];
  uint64_t v35 = [(NSMutableArray *)self->_paidSubscriptionChannelIds hash];
  if ((*((unsigned char *)&self->_has + 2) & 2) != 0) {
    uint64_t v34 = 2654435761 * self->_startedFromNotification;
  }
  else {
    uint64_t v34 = 0;
  }
  NSUInteger v33 = [(NSString *)self->_notificationId hash];
  NSUInteger v32 = [(NSString *)self->_notificationSenderChannelId hash];
  NSUInteger v31 = [(NSString *)self->_notificationSourceChannelId hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    uint64_t v30 = 2654435761 * self->_notitificationsEnabledChannelsCount;
  }
  else {
    uint64_t v30 = 0;
  }
  uint64_t v29 = [(NSMutableArray *)self->_notificationChannelIds hash];
  NSUInteger v28 = [(NSString *)self->_notificationArticleId hash];
  NSUInteger v27 = [(NSString *)self->_campaignId hash];
  NSUInteger v26 = [(NSString *)self->_campaignType hash];
  NSUInteger v25 = [(NSString *)self->_creativeId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v4 = [(NSMutableArray *)self->_subscribedFeedIds hash];
  }
  else {
    uint64_t v4 = [(NSMutableArray *)self->_subscribedFeedIds hash];
  }
  uint64_t v5 = v4;
  $FCCF821F11C5FAFB61D31B7D7B590019 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    uint64_t v7 = 2654435761 * self->_sessionStartMethod;
    if ((*(_WORD *)&v6 & 0x2000) != 0)
    {
LABEL_20:
      uint64_t v8 = 2654435761 * self->_widgetSection;
      if ((*(_WORD *)&v6 & 0x4000) != 0) {
        goto LABEL_21;
      }
LABEL_25:
      uint64_t v9 = 0;
      if ((*(_WORD *)&v6 & 0x1000) != 0) {
        goto LABEL_22;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(_WORD *)&v6 & 0x2000) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v8 = 0;
  if ((*(_WORD *)&v6 & 0x4000) == 0) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v9 = 2654435761 * self->_widgetSectionArticleRank;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
LABEL_22:
    uint64_t v10 = 2654435761 * self->_widgetArticleRank;
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v10 = 0;
LABEL_27:
  unint64_t v11 = [(NTPBWidgetEngagement *)self->_widgetEngagement hash];
  uint64_t v12 = [(NSMutableArray *)self->_autoSubscribedFeedIds hash];
  uint64_t v13 = [(NSMutableArray *)self->_groupableFeedIds hash];
  $FCCF821F11C5FAFB61D31B7D7B590019 v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x80) != 0)
  {
    uint64_t v15 = 2654435761 * self->_portraitAutoSubscribeFeedCount;
    if ((*(_WORD *)&v14 & 0x100) != 0)
    {
LABEL_29:
      uint64_t v16 = 2654435761 * self->_safariAutoSubscribeFeedCount;
      if ((*(unsigned char *)&v14 & 2) != 0) {
        goto LABEL_30;
      }
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((*(_WORD *)&v14 & 0x100) != 0) {
      goto LABEL_29;
    }
  }
  uint64_t v16 = 0;
  if ((*(unsigned char *)&v14 & 2) != 0)
  {
LABEL_30:
    uint64_t v17 = 2654435761 * self->_appsAutoSubscribeFeedCount;
    if ((*(unsigned char *)&v14 & 8) != 0) {
      goto LABEL_31;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&v14 & 8) != 0)
  {
LABEL_31:
    uint64_t v18 = 2654435761 * self->_internalAutoSubscribeFeedCount;
    if ((*(_WORD *)&v14 & 0x800) != 0) {
      goto LABEL_32;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v18 = 0;
  if ((*(_WORD *)&v14 & 0x800) != 0)
  {
LABEL_32:
    uint64_t v19 = 2654435761 * self->_viewabilityState;
    if ((*(unsigned char *)&v14 & 0x20) != 0) {
      goto LABEL_33;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&v14 & 0x20) != 0)
  {
LABEL_33:
    uint64_t v20 = 2654435761 * self->_notificationType;
    if ((*(_DWORD *)&v14 & 0x10000) != 0) {
      goto LABEL_34;
    }
LABEL_42:
    uint64_t v21 = 0;
    if ((*(_WORD *)&v14 & 0x8000) != 0) {
      goto LABEL_35;
    }
LABEL_43:
    uint64_t v22 = 0;
    return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_41:
  uint64_t v20 = 0;
  if ((*(_DWORD *)&v14 & 0x10000) == 0) {
    goto LABEL_42;
  }
LABEL_34:
  uint64_t v21 = 2654435761 * self->_isNewIssuesNotificationEnabled;
  if ((*(_WORD *)&v14 & 0x8000) == 0) {
    goto LABEL_43;
  }
LABEL_35:
  uint64_t v22 = 2654435761 * self->_isMarketingNotificationEnabled;
  return v41 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (*((unsigned char *)v4 + 244))
  {
    self->_lastAppSessionTimestamp = *((void *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v6 = *((id *)v4 + 26);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v61 objects:v70 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NTPBAppSessionStart *)self addVisibleViews:*(void *)(*((void *)&v61 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v61 objects:v70 count:16];
    }
    while (v8);
  }

  int v11 = *((_DWORD *)v5 + 61);
  if ((v11 & 4) != 0)
  {
    self->_channelSubscriptionCount = *((_DWORD *)v5 + 12);
    *(_DWORD *)&self->_has |= 4u;
    int v11 = *((_DWORD *)v5 + 61);
  }
  if ((v11 & 0x400) != 0)
  {
    self->_topicSubscriptionCount = *((_DWORD *)v5 + 46);
    *(_DWORD *)&self->_has |= 0x400u;
  }
  if (*((void *)v5 + 19)) {
    -[NTPBAppSessionStart setReferringSourceApplication:](self, "setReferringSourceApplication:");
  }
  if (*((void *)v5 + 20)) {
    -[NTPBAppSessionStart setReferringUrl:](self, "setReferringUrl:");
  }
  if (*((void *)v5 + 24)) {
    -[NTPBAppSessionStart setUserActivityType:](self, "setUserActivityType:");
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v12 = *((id *)v5 + 17);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v57 objects:v69 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v58;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v58 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBAppSessionStart *)self addPaidSubscriptionChannelIds:*(void *)(*((void *)&v57 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v57 objects:v69 count:16];
    }
    while (v14);
  }

  if ((*((unsigned char *)v5 + 246) & 2) != 0)
  {
    self->_startedFromNotificatiouint64_t n = *((unsigned char *)v5 + 242);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
  if (*((void *)v5 + 13)) {
    -[NTPBAppSessionStart setNotificationId:](self, "setNotificationId:");
  }
  if (*((void *)v5 + 14)) {
    -[NTPBAppSessionStart setNotificationSenderChannelId:](self, "setNotificationSenderChannelId:");
  }
  if (*((void *)v5 + 15)) {
    -[NTPBAppSessionStart setNotificationSourceChannelId:](self, "setNotificationSourceChannelId:");
  }
  if ((*((unsigned char *)v5 + 244) & 0x40) != 0)
  {
    self->_notitificationsEnabledChannelsCount = *((_DWORD *)v5 + 33);
    *(_DWORD *)&self->_has |= 0x40u;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v17 = *((id *)v5 + 11);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v53 objects:v68 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v54;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v54 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBAppSessionStart *)self addNotificationChannelIds:*(void *)(*((void *)&v53 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v53 objects:v68 count:16];
    }
    while (v19);
  }

  if (*((void *)v5 + 10)) {
    -[NTPBAppSessionStart setNotificationArticleId:](self, "setNotificationArticleId:");
  }
  if (*((void *)v5 + 4)) {
    -[NTPBAppSessionStart setCampaignId:](self, "setCampaignId:");
  }
  if (*((void *)v5 + 5)) {
    -[NTPBAppSessionStart setCampaignType:](self, "setCampaignType:");
  }
  if (*((void *)v5 + 7)) {
    -[NTPBAppSessionStart setCreativeId:](self, "setCreativeId:");
  }
  if ((*((unsigned char *)v5 + 244) & 0x10) != 0)
  {
    self->_notificationEnabledChannelsCount = *((_DWORD *)v5 + 24);
    *(_DWORD *)&self->_has |= 0x10u;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v22 = *((id *)v5 + 22);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v67 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v50;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v50 != v25) {
          objc_enumerationMutation(v22);
        }
        [(NTPBAppSessionStart *)self addSubscribedFeedIds:*(void *)(*((void *)&v49 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v67 count:16];
    }
    while (v24);
  }

  int v27 = *((_DWORD *)v5 + 61);
  if ((v27 & 0x200) != 0)
  {
    self->_sessionStartMethod = *((_DWORD *)v5 + 43);
    *(_DWORD *)&self->_has |= 0x200u;
    int v27 = *((_DWORD *)v5 + 61);
    if ((v27 & 0x2000) == 0)
    {
LABEL_63:
      if ((v27 & 0x4000) == 0) {
        goto LABEL_64;
      }
      goto LABEL_71;
    }
  }
  else if ((v27 & 0x2000) == 0)
  {
    goto LABEL_63;
  }
  self->_uint64_t widgetSection = *((_DWORD *)v5 + 58);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v27 = *((_DWORD *)v5 + 61);
  if ((v27 & 0x4000) == 0)
  {
LABEL_64:
    if ((v27 & 0x1000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
LABEL_71:
  self->_widgetSectionArticleRanuint64_t k = *((_DWORD *)v5 + 59);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v5 + 61) & 0x1000) != 0)
  {
LABEL_65:
    self->_widgetArticleRanuint64_t k = *((_DWORD *)v5 + 54);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_66:
  widgetEngagement = self->_widgetEngagement;
  uint64_t v29 = *((void *)v5 + 28);
  if (widgetEngagement)
  {
    if (v29) {
      -[NTPBWidgetEngagement mergeFrom:](widgetEngagement, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[NTPBAppSessionStart setWidgetEngagement:](self, "setWidgetEngagement:");
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v30 = *((id *)v5 + 3);
  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v66 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t n = 0; n != v32; ++n)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        [(NTPBAppSessionStart *)self addAutoSubscribedFeedIds:*(void *)(*((void *)&v45 + 1) + 8 * n)];
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v66 count:16];
    }
    while (v32);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v35 = *((id *)v5 + 8);
  uint64_t v36 = [v35 countByEnumeratingWithState:&v41 objects:v65 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v42;
    do
    {
      for (iuint64_t i = 0; ii != v37; ++ii)
      {
        if (*(void *)v42 != v38) {
          objc_enumerationMutation(v35);
        }
        -[NTPBAppSessionStart addGroupableFeedIds:](self, "addGroupableFeedIds:", *(void *)(*((void *)&v41 + 1) + 8 * ii), (void)v41);
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v41 objects:v65 count:16];
    }
    while (v37);
  }

  int v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x80) != 0)
  {
    self->_portraitAutoSubscribeFeedCount = *((_DWORD *)v5 + 36);
    *(_DWORD *)&self->_has |= 0x80u;
    int v40 = *((_DWORD *)v5 + 61);
    if ((v40 & 0x100) == 0)
    {
LABEL_91:
      if ((v40 & 2) == 0) {
        goto LABEL_92;
      }
      goto LABEL_101;
    }
  }
  else if ((v40 & 0x100) == 0)
  {
    goto LABEL_91;
  }
  self->_safariAutoSubscribeFeedCount = *((_DWORD *)v5 + 42);
  *(_DWORD *)&self->_has |= 0x100u;
  int v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 2) == 0)
  {
LABEL_92:
    if ((v40 & 8) == 0) {
      goto LABEL_93;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_appsAutoSubscribeFeedCount = *((_DWORD *)v5 + 4);
  *(_DWORD *)&self->_has |= 2u;
  int v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 8) == 0)
  {
LABEL_93:
    if ((v40 & 0x800) == 0) {
      goto LABEL_94;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_internalAutoSubscribeFeedCount = *((_DWORD *)v5 + 18);
  *(_DWORD *)&self->_has |= 8u;
  int v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x800) == 0)
  {
LABEL_94:
    if ((v40 & 0x20) == 0) {
      goto LABEL_95;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_viewabilityState = *((_DWORD *)v5 + 50);
  *(_DWORD *)&self->_has |= 0x800u;
  int v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x20) == 0)
  {
LABEL_95:
    if ((v40 & 0x10000) == 0) {
      goto LABEL_96;
    }
LABEL_105:
    self->_isNewIssuesNotificationEnabled = *((unsigned char *)v5 + 241);
    *(_DWORD *)&self->_has |= 0x10000u;
    if ((*((_DWORD *)v5 + 61) & 0x8000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_97;
  }
LABEL_104:
  self->_notificationType = *((_DWORD *)v5 + 32);
  *(_DWORD *)&self->_has |= 0x20u;
  int v40 = *((_DWORD *)v5 + 61);
  if ((v40 & 0x10000) != 0) {
    goto LABEL_105;
  }
LABEL_96:
  if ((v40 & 0x8000) != 0)
  {
LABEL_97:
    self->_isMarketingNotificationEnabled = *((unsigned char *)v5 + 240);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_98:
}

- (int64_t)lastAppSessionTimestamp
{
  return self->_lastAppSessionTimestamp;
}

- (NSMutableArray)visibleViews
{
  return self->_visibleViews;
}

- (void)setVisibleViews:(id)a3
{
}

- (int)channelSubscriptionCount
{
  return self->_channelSubscriptionCount;
}

- (int)topicSubscriptionCount
{
  return self->_topicSubscriptionCount;
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

- (NSString)userActivityType
{
  return self->_userActivityType;
}

- (void)setUserActivityType:(id)a3
{
}

- (NSMutableArray)paidSubscriptionChannelIds
{
  return self->_paidSubscriptionChannelIds;
}

- (void)setPaidSubscriptionChannelIds:(id)a3
{
}

- (BOOL)startedFromNotification
{
  return self->_startedFromNotification;
}

- (NSString)notificationId
{
  return self->_notificationId;
}

- (void)setNotificationId:(id)a3
{
}

- (NSString)notificationSenderChannelId
{
  return self->_notificationSenderChannelId;
}

- (void)setNotificationSenderChannelId:(id)a3
{
}

- (NSString)notificationSourceChannelId
{
  return self->_notificationSourceChannelId;
}

- (void)setNotificationSourceChannelId:(id)a3
{
}

- (int)notitificationsEnabledChannelsCount
{
  return self->_notitificationsEnabledChannelsCount;
}

- (NSMutableArray)notificationChannelIds
{
  return self->_notificationChannelIds;
}

- (void)setNotificationChannelIds:(id)a3
{
}

- (NSString)notificationArticleId
{
  return self->_notificationArticleId;
}

- (void)setNotificationArticleId:(id)a3
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

- (int)notificationEnabledChannelsCount
{
  return self->_notificationEnabledChannelsCount;
}

- (NSMutableArray)subscribedFeedIds
{
  return self->_subscribedFeedIds;
}

- (void)setSubscribedFeedIds:(id)a3
{
}

- (int)widgetSectionArticleRank
{
  return self->_widgetSectionArticleRank;
}

- (int)widgetArticleRank
{
  return self->_widgetArticleRank;
}

- (NTPBWidgetEngagement)widgetEngagement
{
  return self->_widgetEngagement;
}

- (void)setWidgetEngagement:(id)a3
{
}

- (NSMutableArray)autoSubscribedFeedIds
{
  return self->_autoSubscribedFeedIds;
}

- (void)setAutoSubscribedFeedIds:(id)a3
{
}

- (NSMutableArray)groupableFeedIds
{
  return self->_groupableFeedIds;
}

- (void)setGroupableFeedIds:(id)a3
{
}

- (int)portraitAutoSubscribeFeedCount
{
  return self->_portraitAutoSubscribeFeedCount;
}

- (int)safariAutoSubscribeFeedCount
{
  return self->_safariAutoSubscribeFeedCount;
}

- (int)appsAutoSubscribeFeedCount
{
  return self->_appsAutoSubscribeFeedCount;
}

- (int)internalAutoSubscribeFeedCount
{
  return self->_internalAutoSubscribeFeedCount;
}

- (BOOL)isNewIssuesNotificationEnabled
{
  return self->_isNewIssuesNotificationEnabled;
}

- (BOOL)isMarketingNotificationEnabled
{
  return self->_isMarketingNotificationEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetEngagement, 0);
  objc_storeStrong((id *)&self->_visibleViews, 0);
  objc_storeStrong((id *)&self->_userActivityType, 0);
  objc_storeStrong((id *)&self->_subscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_referringUrl, 0);
  objc_storeStrong((id *)&self->_referringSourceApplication, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionChannelIds, 0);
  objc_storeStrong((id *)&self->_notificationSourceChannelId, 0);
  objc_storeStrong((id *)&self->_notificationSenderChannelId, 0);
  objc_storeStrong((id *)&self->_notificationId, 0);
  objc_storeStrong((id *)&self->_notificationChannelIds, 0);
  objc_storeStrong((id *)&self->_notificationArticleId, 0);
  objc_storeStrong((id *)&self->_groupableFeedIds, 0);
  objc_storeStrong((id *)&self->_creativeId, 0);
  objc_storeStrong((id *)&self->_campaignType, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);

  objc_storeStrong((id *)&self->_autoSubscribedFeedIds, 0);
}

@end