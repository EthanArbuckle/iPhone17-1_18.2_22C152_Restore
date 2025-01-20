@interface NTPBAppSessionEnd
+ (Class)autoSubscribedFeedIdsType;
+ (Class)groupableFeedIdsType;
+ (Class)lastVisibleViewsType;
+ (Class)notificationChannelIdsType;
+ (Class)paidSubscriptionChannelIdsType;
+ (Class)subscribedFeedIdsType;
- (BOOL)breakingNewsAvailableDuringSession;
- (BOOL)breakingNewsDismissedDuringSession;
- (BOOL)hasAppSessionDuration;
- (BOOL)hasAppsAutoSubscribeFeedCount;
- (BOOL)hasBreakingNewsAvailableDuringSession;
- (BOOL)hasBreakingNewsDismissedDuringSession;
- (BOOL)hasChannelSubscriptionCount;
- (BOOL)hasInternalAutoSubscribeFeedCount;
- (BOOL)hasNotificationEnabledChannelsCount;
- (BOOL)hasNotitificationsEnabledChannelsCount;
- (BOOL)hasPortraitAutoSubscribeFeedCount;
- (BOOL)hasSafariAutoSubscribeFeedCount;
- (BOOL)hasSessionEndReason;
- (BOOL)hasSyncedOtherUserIdDuringSession;
- (BOOL)hasTopicSubscriptionCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)syncedOtherUserIdDuringSession;
- (NSMutableArray)autoSubscribedFeedIds;
- (NSMutableArray)groupableFeedIds;
- (NSMutableArray)lastVisibleViews;
- (NSMutableArray)notificationChannelIds;
- (NSMutableArray)paidSubscriptionChannelIds;
- (NSMutableArray)subscribedFeedIds;
- (id)autoSubscribedFeedIdsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupableFeedIdsAtIndex:(unint64_t)a3;
- (id)lastVisibleViewsAtIndex:(unint64_t)a3;
- (id)notificationChannelIdsAtIndex:(unint64_t)a3;
- (id)paidSubscriptionChannelIdsAtIndex:(unint64_t)a3;
- (id)sessionEndReasonAsString:(int)a3;
- (id)subscribedFeedIdsAtIndex:(unint64_t)a3;
- (int)StringAsSessionEndReason:(id)a3;
- (int)appsAutoSubscribeFeedCount;
- (int)channelSubscriptionCount;
- (int)internalAutoSubscribeFeedCount;
- (int)notificationEnabledChannelsCount;
- (int)notitificationsEnabledChannelsCount;
- (int)portraitAutoSubscribeFeedCount;
- (int)safariAutoSubscribeFeedCount;
- (int)sessionEndReason;
- (int)topicSubscriptionCount;
- (int64_t)appSessionDuration;
- (unint64_t)autoSubscribedFeedIdsCount;
- (unint64_t)groupableFeedIdsCount;
- (unint64_t)hash;
- (unint64_t)lastVisibleViewsCount;
- (unint64_t)notificationChannelIdsCount;
- (unint64_t)paidSubscriptionChannelIdsCount;
- (unint64_t)subscribedFeedIdsCount;
- (void)addAutoSubscribedFeedIds:(id)a3;
- (void)addGroupableFeedIds:(id)a3;
- (void)addLastVisibleViews:(id)a3;
- (void)addNotificationChannelIds:(id)a3;
- (void)addPaidSubscriptionChannelIds:(id)a3;
- (void)addSubscribedFeedIds:(id)a3;
- (void)clearAutoSubscribedFeedIds;
- (void)clearGroupableFeedIds;
- (void)clearLastVisibleViews;
- (void)clearNotificationChannelIds;
- (void)clearPaidSubscriptionChannelIds;
- (void)clearSubscribedFeedIds;
- (void)mergeFrom:(id)a3;
- (void)setAppSessionDuration:(int64_t)a3;
- (void)setAppsAutoSubscribeFeedCount:(int)a3;
- (void)setAutoSubscribedFeedIds:(id)a3;
- (void)setBreakingNewsAvailableDuringSession:(BOOL)a3;
- (void)setBreakingNewsDismissedDuringSession:(BOOL)a3;
- (void)setChannelSubscriptionCount:(int)a3;
- (void)setGroupableFeedIds:(id)a3;
- (void)setHasAppSessionDuration:(BOOL)a3;
- (void)setHasAppsAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasBreakingNewsAvailableDuringSession:(BOOL)a3;
- (void)setHasBreakingNewsDismissedDuringSession:(BOOL)a3;
- (void)setHasChannelSubscriptionCount:(BOOL)a3;
- (void)setHasInternalAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasNotificationEnabledChannelsCount:(BOOL)a3;
- (void)setHasNotitificationsEnabledChannelsCount:(BOOL)a3;
- (void)setHasPortraitAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasSafariAutoSubscribeFeedCount:(BOOL)a3;
- (void)setHasSessionEndReason:(BOOL)a3;
- (void)setHasSyncedOtherUserIdDuringSession:(BOOL)a3;
- (void)setHasTopicSubscriptionCount:(BOOL)a3;
- (void)setInternalAutoSubscribeFeedCount:(int)a3;
- (void)setLastVisibleViews:(id)a3;
- (void)setNotificationChannelIds:(id)a3;
- (void)setNotificationEnabledChannelsCount:(int)a3;
- (void)setNotitificationsEnabledChannelsCount:(int)a3;
- (void)setPaidSubscriptionChannelIds:(id)a3;
- (void)setPortraitAutoSubscribeFeedCount:(int)a3;
- (void)setSafariAutoSubscribeFeedCount:(int)a3;
- (void)setSessionEndReason:(int)a3;
- (void)setSubscribedFeedIds:(id)a3;
- (void)setSyncedOtherUserIdDuringSession:(BOOL)a3;
- (void)setTopicSubscriptionCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAppSessionEnd

- (int)sessionEndReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_sessionEndReason;
  }
  else {
    return 0;
  }
}

- (void)setSessionEndReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sessionEndReason = a3;
}

- (void)setHasSessionEndReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSessionEndReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)sessionEndReasonAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_26444DBA0[a3];
  }

  return v3;
}

- (int)StringAsSessionEndReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_SESSION_END_REASON"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"READING_HISTORY_CLEAR_SESSION_END_REASON"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"APP_BACKGROUND_SESSION_END_REASON"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"FORCE_QUIT_SESSION_END_REASON"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOCAL_NOTIFICATION_RECEIVED_RESET_USER_ID_SESSION_END_REASON"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ICLOUD_SYNCED_SESSION_END_REASON"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"WIDGET_VIDEO_PLAYER_DISMISSED_SESSION_END_REASON"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"USER_NAVIGATION_SESSION_END_REASON"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearLastVisibleViews
{
}

- (void)addLastVisibleViews:(id)a3
{
  id v4 = a3;
  lastVisibleViews = self->_lastVisibleViews;
  id v8 = v4;
  if (!lastVisibleViews)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_lastVisibleViews;
    self->_lastVisibleViews = v6;

    id v4 = v8;
    lastVisibleViews = self->_lastVisibleViews;
  }
  [(NSMutableArray *)lastVisibleViews addObject:v4];
}

- (unint64_t)lastVisibleViewsCount
{
  return [(NSMutableArray *)self->_lastVisibleViews count];
}

- (id)lastVisibleViewsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lastVisibleViews objectAtIndex:a3];
}

+ (Class)lastVisibleViewsType
{
  return (Class)objc_opt_class();
}

- (void)setChannelSubscriptionCount:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_channelSubscriptionCount = a3;
}

- (void)setHasChannelSubscriptionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasChannelSubscriptionCount
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setTopicSubscriptionCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_topicSubscriptionCount = a3;
}

- (void)setHasTopicSubscriptionCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTopicSubscriptionCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAppSessionDuration:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_appSessionDuration = a3;
}

- (void)setHasAppSessionDuration:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAppSessionDuration
{
  return *(_WORD *)&self->_has & 1;
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

- (void)setNotitificationsEnabledChannelsCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_notitificationsEnabledChannelsCount = a3;
}

- (void)setHasNotitificationsEnabledChannelsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNotitificationsEnabledChannelsCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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

- (void)setNotificationEnabledChannelsCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_notificationEnabledChannelsCount = a3;
}

- (void)setHasNotificationEnabledChannelsCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasNotificationEnabledChannelsCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
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

- (void)setBreakingNewsAvailableDuringSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_breakingNewsAvailableDuringSession = a3;
}

- (void)setHasBreakingNewsAvailableDuringSession:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasBreakingNewsAvailableDuringSession
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setBreakingNewsDismissedDuringSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_breakingNewsDismissedDuringSession = a3;
}

- (void)setHasBreakingNewsDismissedDuringSession:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasBreakingNewsDismissedDuringSession
{
  return (*(_WORD *)&self->_has >> 11) & 1;
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
  *(_WORD *)&self->_has |= 0x40u;
  self->_portraitAutoSubscribeFeedCount = a3;
}

- (void)setHasPortraitAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPortraitAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setSafariAutoSubscribeFeedCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_safariAutoSubscribeFeedCount = a3;
}

- (void)setHasSafariAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSafariAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAppsAutoSubscribeFeedCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_appsAutoSubscribeFeedCount = a3;
}

- (void)setHasAppsAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAppsAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setInternalAutoSubscribeFeedCount:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_internalAutoSubscribeFeedCount = a3;
}

- (void)setHasInternalAutoSubscribeFeedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasInternalAutoSubscribeFeedCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSyncedOtherUserIdDuringSession:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_syncedOtherUserIdDuringSession = a3;
}

- (void)setHasSyncedOtherUserIdDuringSession:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSyncedOtherUserIdDuringSession
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBAppSessionEnd;
  id v4 = [(NTPBAppSessionEnd *)&v8 description];
  v5 = [(NTPBAppSessionEnd *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    uint64_t sessionEndReason = self->_sessionEndReason;
    if (sessionEndReason >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_sessionEndReason);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_26444DBA0[sessionEndReason];
    }
    [v3 setObject:v5 forKey:@"session_end_reason"];
  }
  if ([(NSMutableArray *)self->_lastVisibleViews count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_lastVisibleViews, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v7 = self->_lastVisibleViews;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v35 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v34 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"last_visible_views"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_channelSubscriptionCount];
    [v3 setObject:v28 forKey:@"channel_subscription_count"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_17:
      if ((has & 1) == 0) {
        goto LABEL_19;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_17;
  }
  v29 = [NSNumber numberWithInt:self->_topicSubscriptionCount];
  [v3 setObject:v29 forKey:@"topic_subscription_count"];

  if (*(_WORD *)&self->_has)
  {
LABEL_18:
    v14 = [NSNumber numberWithLongLong:self->_appSessionDuration];
    [v3 setObject:v14 forKey:@"app_session_duration"];
  }
LABEL_19:
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if (paidSubscriptionChannelIds) {
    [v3 setObject:paidSubscriptionChannelIds forKey:@"paid_subscription_channel_ids"];
  }
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    v16 = [NSNumber numberWithInt:self->_notitificationsEnabledChannelsCount];
    [v3 setObject:v16 forKey:@"notitifications_enabled_channels_count"];
  }
  notificationChannelIds = self->_notificationChannelIds;
  if (notificationChannelIds) {
    [v3 setObject:notificationChannelIds forKey:@"notification_channel_ids"];
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v18 = [NSNumber numberWithInt:self->_notificationEnabledChannelsCount];
    [v3 setObject:v18 forKey:@"notification_enabled_channels_count"];
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if (subscribedFeedIds) {
    [v3 setObject:subscribedFeedIds forKey:@"subscribed_feed_ids"];
  }
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x400) != 0)
  {
    v21 = [NSNumber numberWithBool:self->_breakingNewsAvailableDuringSession];
    [v3 setObject:v21 forKey:@"breaking_news_available_during_session"];

    __int16 v20 = (__int16)self->_has;
  }
  if ((v20 & 0x800) != 0)
  {
    v22 = [NSNumber numberWithBool:self->_breakingNewsDismissedDuringSession];
    [v3 setObject:v22 forKey:@"breaking_news_dismissed_during_session"];
  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if (autoSubscribedFeedIds) {
    [v3 setObject:autoSubscribedFeedIds forKey:@"auto_subscribed_feed_ids"];
  }
  groupableFeedIds = self->_groupableFeedIds;
  if (groupableFeedIds) {
    [v3 setObject:groupableFeedIds forKey:@"groupable_feed_ids"];
  }
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x40) != 0)
  {
    v30 = [NSNumber numberWithInt:self->_portraitAutoSubscribeFeedCount];
    [v3 setObject:v30 forKey:@"portrait_auto_subscribe_feed_count"];

    __int16 v25 = (__int16)self->_has;
    if ((v25 & 0x80) == 0)
    {
LABEL_39:
      if ((v25 & 2) == 0) {
        goto LABEL_40;
      }
      goto LABEL_51;
    }
  }
  else if ((v25 & 0x80) == 0)
  {
    goto LABEL_39;
  }
  v31 = [NSNumber numberWithInt:self->_safariAutoSubscribeFeedCount];
  [v3 setObject:v31 forKey:@"safari_auto_subscribe_feed_count"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 2) == 0)
  {
LABEL_40:
    if ((v25 & 8) == 0) {
      goto LABEL_41;
    }
    goto LABEL_52;
  }
LABEL_51:
  v32 = [NSNumber numberWithInt:self->_appsAutoSubscribeFeedCount];
  [v3 setObject:v32 forKey:@"apps_auto_subscribe_feed_count"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 8) == 0)
  {
LABEL_41:
    if ((v25 & 0x1000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_52:
  v33 = [NSNumber numberWithInt:self->_internalAutoSubscribeFeedCount];
  [v3 setObject:v33 forKey:@"internal_auto_subscribe_feed_count"];

  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_42:
    v26 = [NSNumber numberWithBool:self->_syncedOtherUserIdDuringSession];
    [v3 setObject:v26 forKey:@"synced_other_user_id_during_session"];
  }
LABEL_43:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAppSessionEndReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v5 = self->_lastVisibleViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v59 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v58 objects:v67 count:16];
    }
    while (v7);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_12:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  if (*(_WORD *)&self->_has) {
LABEL_13:
  }
    PBDataWriterWriteInt64Field();
LABEL_14:
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
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v13);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0) {
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
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v51 != v19) {
          objc_enumerationMutation(v16);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v50 objects:v65 count:16];
    }
    while (v18);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0) {
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
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v21);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v46 objects:v64 count:16];
    }
    while (v23);
  }

  __int16 v26 = (__int16)self->_has;
  if ((v26 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v26 = (__int16)self->_has;
  }
  if ((v26 & 0x800) != 0) {
    PBDataWriterWriteBOOLField();
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
      for (uint64_t n = 0; n != v29; ++n)
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v27);
        }
        PBDataWriterWriteStringField();
      }
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
      for (iuint64_t i = 0; ii != v34; ++ii)
      {
        if (*(void *)v39 != v35) {
          objc_enumerationMutation(v32);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v34 = [(NSMutableArray *)v32 countByEnumeratingWithState:&v38 objects:v62 count:16];
    }
    while (v34);
  }

  __int16 v37 = (__int16)self->_has;
  if ((v37 & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    __int16 v37 = (__int16)self->_has;
    if ((v37 & 0x80) == 0)
    {
LABEL_59:
      if ((v37 & 2) == 0) {
        goto LABEL_60;
      }
      goto LABEL_69;
    }
  }
  else if ((v37 & 0x80) == 0)
  {
    goto LABEL_59;
  }
  PBDataWriterWriteInt32Field();
  __int16 v37 = (__int16)self->_has;
  if ((v37 & 2) == 0)
  {
LABEL_60:
    if ((v37 & 8) == 0) {
      goto LABEL_61;
    }
LABEL_70:
    PBDataWriterWriteInt32Field();
    if ((*(_WORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  __int16 v37 = (__int16)self->_has;
  if ((v37 & 8) != 0) {
    goto LABEL_70;
  }
LABEL_61:
  if ((v37 & 0x1000) != 0) {
LABEL_62:
  }
    PBDataWriterWriteBOOLField();
LABEL_63:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_sessionEndReason;
    *(_WORD *)(v5 + 120) |= 0x100u;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  uint64_t v7 = self->_lastVisibleViews;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v68;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v68 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addLastVisibleViews:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v9);
  }

  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_channelSubscriptionCount;
    *(_WORD *)(v6 + 120) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_12:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 112) = self->_topicSubscriptionCount;
  *(_WORD *)(v6 + 120) |= 0x200u;
  if (*(_WORD *)&self->_has)
  {
LABEL_13:
    *(void *)(v6 + 8) = self->_appSessionDuration;
    *(_WORD *)(v6 + 120) |= 1u;
  }
LABEL_14:
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  uint64_t v14 = self->_paidSubscriptionChannelIds;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v64;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v64 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addPaidSubscriptionChannelIds:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 76) = self->_notitificationsEnabledChannelsCount;
    *(_WORD *)(v6 + 120) |= 0x20u;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  __int16 v20 = self->_notificationChannelIds;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v60;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v60 != v23) {
          objc_enumerationMutation(v20);
        }
        __int16 v25 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addNotificationChannelIds:v25];
      }
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_notificationEnabledChannelsCount;
    *(_WORD *)(v6 + 120) |= 0x10u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  __int16 v26 = self->_subscribedFeedIds;
  uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v56;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v56 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addSubscribedFeedIds:v31];
      }
      uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v28);
  }

  __int16 v32 = (__int16)self->_has;
  if ((v32 & 0x400) != 0)
  {
    *(unsigned char *)(v6 + 116) = self->_breakingNewsAvailableDuringSession;
    *(_WORD *)(v6 + 120) |= 0x400u;
    __int16 v32 = (__int16)self->_has;
  }
  if ((v32 & 0x800) != 0)
  {
    *(unsigned char *)(v6 + 117) = self->_breakingNewsDismissedDuringSession;
    *(_WORD *)(v6 + 120) |= 0x800u;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v33 = self->_autoSubscribedFeedIds;
  uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v52;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v52 != v36) {
          objc_enumerationMutation(v33);
        }
        long long v38 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * n) copyWithZone:a3];
        [(id)v6 addAutoSubscribedFeedIds:v38];
      }
      uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v35);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v39 = self->_groupableFeedIds;
  uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v47 objects:v71 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v48;
    do
    {
      for (iuint64_t i = 0; ii != v41; ++ii)
      {
        if (*(void *)v48 != v42) {
          objc_enumerationMutation(v39);
        }
        long long v44 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * ii), "copyWithZone:", a3, (void)v47);
        [(id)v6 addGroupableFeedIds:v44];
      }
      uint64_t v41 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v47 objects:v71 count:16];
    }
    while (v41);
  }

  __int16 v45 = (__int16)self->_has;
  if ((v45 & 0x40) != 0)
  {
    *(_DWORD *)(v6 + 88) = self->_portraitAutoSubscribeFeedCount;
    *(_WORD *)(v6 + 120) |= 0x40u;
    __int16 v45 = (__int16)self->_has;
    if ((v45 & 0x80) == 0)
    {
LABEL_59:
      if ((v45 & 2) == 0) {
        goto LABEL_60;
      }
      goto LABEL_69;
    }
  }
  else if ((v45 & 0x80) == 0)
  {
    goto LABEL_59;
  }
  *(_DWORD *)(v6 + 92) = self->_safariAutoSubscribeFeedCount;
  *(_WORD *)(v6 + 120) |= 0x80u;
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 2) == 0)
  {
LABEL_60:
    if ((v45 & 8) == 0) {
      goto LABEL_61;
    }
LABEL_70:
    *(_DWORD *)(v6 + 48) = self->_internalAutoSubscribeFeedCount;
    *(_WORD *)(v6 + 120) |= 8u;
    if ((*(_WORD *)&self->_has & 0x1000) == 0) {
      return (id)v6;
    }
    goto LABEL_62;
  }
LABEL_69:
  *(_DWORD *)(v6 + 16) = self->_appsAutoSubscribeFeedCount;
  *(_WORD *)(v6 + 120) |= 2u;
  __int16 v45 = (__int16)self->_has;
  if ((v45 & 8) != 0) {
    goto LABEL_70;
  }
LABEL_61:
  if ((v45 & 0x1000) != 0)
  {
LABEL_62:
    *(unsigned char *)(v6 + 118) = self->_syncedOtherUserIdDuringSession;
    *(_WORD *)(v6 + 120) |= 0x1000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_87;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x100) == 0 || self->_sessionEndReason != *((_DWORD *)v4 + 24)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x100) != 0)
  {
    goto LABEL_87;
  }
  lastVisibleViews = self->_lastVisibleViews;
  if ((unint64_t)lastVisibleViews | *((void *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](lastVisibleViews, "isEqual:")) {
      goto LABEL_87;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v7 = *((_WORD *)v4 + 60);
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_channelSubscriptionCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_87;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_87;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x200) == 0 || self->_topicSubscriptionCount != *((_DWORD *)v4 + 28)) {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x200) != 0)
  {
    goto LABEL_87;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_appSessionDuration != *((void *)v4 + 1)) {
      goto LABEL_87;
    }
  }
  else if (v7)
  {
    goto LABEL_87;
  }
  paidSubscriptionChannelIds = self->_paidSubscriptionChannelIds;
  if ((unint64_t)paidSubscriptionChannelIds | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](paidSubscriptionChannelIds, "isEqual:")) {
      goto LABEL_87;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)v4 + 60);
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_notitificationsEnabledChannelsCount != *((_DWORD *)v4 + 19)) {
      goto LABEL_87;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_87;
  }
  notificationChannelIds = self->_notificationChannelIds;
  if ((unint64_t)notificationChannelIds | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](notificationChannelIds, "isEqual:")) {
      goto LABEL_87;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v11 = *((_WORD *)v4 + 60);
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_notificationEnabledChannelsCount != *((_DWORD *)v4 + 18)) {
      goto LABEL_87;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_87;
  }
  subscribedFeedIds = self->_subscribedFeedIds;
  if ((unint64_t)subscribedFeedIds | *((void *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](subscribedFeedIds, "isEqual:")) {
      goto LABEL_87;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x400) == 0) {
      goto LABEL_87;
    }
    if (self->_breakingNewsAvailableDuringSession)
    {
      if (!*((unsigned char *)v4 + 116)) {
        goto LABEL_87;
      }
    }
    else if (*((unsigned char *)v4 + 116))
    {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x400) != 0)
  {
    goto LABEL_87;
  }
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x800) == 0) {
      goto LABEL_87;
    }
    if (self->_breakingNewsDismissedDuringSession)
    {
      if (!*((unsigned char *)v4 + 117)) {
        goto LABEL_87;
      }
    }
    else if (*((unsigned char *)v4 + 117))
    {
      goto LABEL_87;
    }
  }
  else if ((*((_WORD *)v4 + 60) & 0x800) != 0)
  {
    goto LABEL_87;
  }
  autoSubscribedFeedIds = self->_autoSubscribedFeedIds;
  if ((unint64_t)autoSubscribedFeedIds | *((void *)v4 + 3)
    && !-[NSMutableArray isEqual:](autoSubscribedFeedIds, "isEqual:"))
  {
    goto LABEL_87;
  }
  groupableFeedIds = self->_groupableFeedIds;
  if ((unint64_t)groupableFeedIds | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](groupableFeedIds, "isEqual:")) {
      goto LABEL_87;
    }
  }
  __int16 v15 = (__int16)self->_has;
  __int16 v16 = *((_WORD *)v4 + 60);
  if ((v15 & 0x40) != 0)
  {
    if ((v16 & 0x40) == 0 || self->_portraitAutoSubscribeFeedCount != *((_DWORD *)v4 + 22)) {
      goto LABEL_87;
    }
  }
  else if ((v16 & 0x40) != 0)
  {
    goto LABEL_87;
  }
  if ((v15 & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0 || self->_safariAutoSubscribeFeedCount != *((_DWORD *)v4 + 23)) {
      goto LABEL_87;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_87;
  }
  if ((v15 & 2) != 0)
  {
    if ((v16 & 2) == 0 || self->_appsAutoSubscribeFeedCount != *((_DWORD *)v4 + 4)) {
      goto LABEL_87;
    }
  }
  else if ((v16 & 2) != 0)
  {
    goto LABEL_87;
  }
  if ((v15 & 8) != 0)
  {
    if ((v16 & 8) == 0 || self->_internalAutoSubscribeFeedCount != *((_DWORD *)v4 + 12)) {
      goto LABEL_87;
    }
  }
  else if ((v16 & 8) != 0)
  {
    goto LABEL_87;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 60) & 0x1000) != 0)
    {
      if (self->_syncedOtherUserIdDuringSession)
      {
        if (!*((unsigned char *)v4 + 118)) {
          goto LABEL_87;
        }
      }
      else if (*((unsigned char *)v4 + 118))
      {
        goto LABEL_87;
      }
      BOOL v17 = 1;
      goto LABEL_88;
    }
LABEL_87:
    BOOL v17 = 0;
    goto LABEL_88;
  }
  BOOL v17 = (v16 & 0x1000) == 0;
LABEL_88:

  return v17;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v25 = 2654435761 * self->_sessionEndReason;
  }
  else {
    uint64_t v25 = 0;
  }
  uint64_t v24 = [(NSMutableArray *)self->_lastVisibleViews hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
    uint64_t v23 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v22 = 0;
    if (has) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  uint64_t v23 = 2654435761 * self->_channelSubscriptionCount;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v22 = 2654435761 * self->_topicSubscriptionCount;
  if (has)
  {
LABEL_7:
    uint64_t v21 = 2654435761 * self->_appSessionDuration;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v21 = 0;
LABEL_11:
  uint64_t v19 = [(NSMutableArray *)self->_paidSubscriptionChannelIds hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0) {
    uint64_t v4 = 2654435761 * self->_notitificationsEnabledChannelsCount;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_notificationChannelIds hash];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    uint64_t v6 = 2654435761 * self->_notificationEnabledChannelsCount;
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_subscribedFeedIds hash];
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    uint64_t v8 = 2654435761 * self->_breakingNewsAvailableDuringSession;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x800) != 0)
    {
LABEL_19:
      uint64_t v9 = 2654435761 * self->_breakingNewsDismissedDuringSession;
      goto LABEL_22;
    }
  }
  uint64_t v9 = 0;
LABEL_22:
  uint64_t v10 = [(NSMutableArray *)self->_autoSubscribedFeedIds hash];
  uint64_t v11 = [(NSMutableArray *)self->_groupableFeedIds hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x40) != 0)
  {
    uint64_t v13 = 2654435761 * self->_portraitAutoSubscribeFeedCount;
    if ((v12 & 0x80) != 0)
    {
LABEL_24:
      uint64_t v14 = 2654435761 * self->_safariAutoSubscribeFeedCount;
      if ((v12 & 2) != 0) {
        goto LABEL_25;
      }
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((v12 & 0x80) != 0) {
      goto LABEL_24;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 2) != 0)
  {
LABEL_25:
    uint64_t v15 = 2654435761 * self->_appsAutoSubscribeFeedCount;
    if ((v12 & 8) != 0) {
      goto LABEL_26;
    }
LABEL_31:
    uint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_27;
    }
LABEL_32:
    uint64_t v17 = 0;
    return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  }
LABEL_30:
  uint64_t v15 = 0;
  if ((v12 & 8) == 0) {
    goto LABEL_31;
  }
LABEL_26:
  uint64_t v16 = 2654435761 * self->_internalAutoSubscribeFeedCount;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_32;
  }
LABEL_27:
  uint64_t v17 = 2654435761 * self->_syncedOtherUserIdDuringSession;
  return v24 ^ v25 ^ v23 ^ v22 ^ v21 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if ((*((_WORD *)v4 + 60) & 0x100) != 0)
  {
    self->_uint64_t sessionEndReason = *((_DWORD *)v4 + 24);
    *(_WORD *)&self->_has |= 0x100u;
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v6 = *((id *)v4 + 7);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v60 != v9) {
          objc_enumerationMutation(v6);
        }
        [(NTPBAppSessionEnd *)self addLastVisibleViews:*(void *)(*((void *)&v59 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v8);
  }

  __int16 v11 = *((_WORD *)v5 + 60);
  if ((v11 & 4) != 0)
  {
    self->_channelSubscriptionCount = *((_DWORD *)v5 + 8);
    *(_WORD *)&self->_has |= 4u;
    __int16 v11 = *((_WORD *)v5 + 60);
    if ((v11 & 0x200) == 0)
    {
LABEL_12:
      if ((v11 & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((*((_WORD *)v5 + 60) & 0x200) == 0)
  {
    goto LABEL_12;
  }
  self->_topicSubscriptionCount = *((_DWORD *)v5 + 28);
  *(_WORD *)&self->_has |= 0x200u;
  if (*((_WORD *)v5 + 60))
  {
LABEL_13:
    self->_appSessionDuratiouint64_t n = *((void *)v5 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_14:
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v12 = *((id *)v5 + 10);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v56 != v15) {
          objc_enumerationMutation(v12);
        }
        [(NTPBAppSessionEnd *)self addPaidSubscriptionChannelIds:*(void *)(*((void *)&v55 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v14);
  }

  if ((*((_WORD *)v5 + 60) & 0x20) != 0)
  {
    self->_notitificationsEnabledChannelsCount = *((_DWORD *)v5 + 19);
    *(_WORD *)&self->_has |= 0x20u;
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v17 = *((id *)v5 + 8);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v51 objects:v66 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v52 != v20) {
          objc_enumerationMutation(v17);
        }
        [(NTPBAppSessionEnd *)self addNotificationChannelIds:*(void *)(*((void *)&v51 + 1) + 8 * k)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v66 count:16];
    }
    while (v19);
  }

  if ((*((_WORD *)v5 + 60) & 0x10) != 0)
  {
    self->_notificationEnabledChannelsCount = *((_DWORD *)v5 + 18);
    *(_WORD *)&self->_has |= 0x10u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v22 = *((id *)v5 + 13);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v65 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v48;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v22);
        }
        [(NTPBAppSessionEnd *)self addSubscribedFeedIds:*(void *)(*((void *)&v47 + 1) + 8 * m)];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v65 count:16];
    }
    while (v24);
  }

  __int16 v27 = *((_WORD *)v5 + 60);
  if ((v27 & 0x400) != 0)
  {
    self->_breakingNewsAvailableDuringSessiouint64_t n = *((unsigned char *)v5 + 116);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v27 = *((_WORD *)v5 + 60);
  }
  if ((v27 & 0x800) != 0)
  {
    self->_breakingNewsDismissedDuringSessiouint64_t n = *((unsigned char *)v5 + 117);
    *(_WORD *)&self->_has |= 0x800u;
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v28 = *((id *)v5 + 3);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v64 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v44;
    do
    {
      for (uint64_t n = 0; n != v30; ++n)
      {
        if (*(void *)v44 != v31) {
          objc_enumerationMutation(v28);
        }
        [(NTPBAppSessionEnd *)self addAutoSubscribedFeedIds:*(void *)(*((void *)&v43 + 1) + 8 * n)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v64 count:16];
    }
    while (v30);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v33 = *((id *)v5 + 5);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v39 objects:v63 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v40;
    do
    {
      for (iuint64_t i = 0; ii != v35; ++ii)
      {
        if (*(void *)v40 != v36) {
          objc_enumerationMutation(v33);
        }
        -[NTPBAppSessionEnd addGroupableFeedIds:](self, "addGroupableFeedIds:", *(void *)(*((void *)&v39 + 1) + 8 * ii), (void)v39);
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v39 objects:v63 count:16];
    }
    while (v35);
  }

  __int16 v38 = *((_WORD *)v5 + 60);
  if ((v38 & 0x40) != 0)
  {
    self->_portraitAutoSubscribeFeedCount = *((_DWORD *)v5 + 22);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v38 = *((_WORD *)v5 + 60);
    if ((v38 & 0x80) == 0)
    {
LABEL_59:
      if ((v38 & 2) == 0) {
        goto LABEL_60;
      }
      goto LABEL_69;
    }
  }
  else if ((v38 & 0x80) == 0)
  {
    goto LABEL_59;
  }
  self->_safariAutoSubscribeFeedCount = *((_DWORD *)v5 + 23);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v38 = *((_WORD *)v5 + 60);
  if ((v38 & 2) == 0)
  {
LABEL_60:
    if ((v38 & 8) == 0) {
      goto LABEL_61;
    }
LABEL_70:
    self->_internalAutoSubscribeFeedCount = *((_DWORD *)v5 + 12);
    *(_WORD *)&self->_has |= 8u;
    if ((*((_WORD *)v5 + 60) & 0x1000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_62;
  }
LABEL_69:
  self->_appsAutoSubscribeFeedCount = *((_DWORD *)v5 + 4);
  *(_WORD *)&self->_has |= 2u;
  __int16 v38 = *((_WORD *)v5 + 60);
  if ((v38 & 8) != 0) {
    goto LABEL_70;
  }
LABEL_61:
  if ((v38 & 0x1000) != 0)
  {
LABEL_62:
    self->_syncedOtherUserIdDuringSessiouint64_t n = *((unsigned char *)v5 + 118);
    *(_WORD *)&self->_has |= 0x1000u;
  }
LABEL_63:
}

- (NSMutableArray)lastVisibleViews
{
  return self->_lastVisibleViews;
}

- (void)setLastVisibleViews:(id)a3
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

- (int64_t)appSessionDuration
{
  return self->_appSessionDuration;
}

- (NSMutableArray)paidSubscriptionChannelIds
{
  return self->_paidSubscriptionChannelIds;
}

- (void)setPaidSubscriptionChannelIds:(id)a3
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

- (BOOL)breakingNewsAvailableDuringSession
{
  return self->_breakingNewsAvailableDuringSession;
}

- (BOOL)breakingNewsDismissedDuringSession
{
  return self->_breakingNewsDismissedDuringSession;
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

- (BOOL)syncedOtherUserIdDuringSession
{
  return self->_syncedOtherUserIdDuringSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribedFeedIds, 0);
  objc_storeStrong((id *)&self->_paidSubscriptionChannelIds, 0);
  objc_storeStrong((id *)&self->_notificationChannelIds, 0);
  objc_storeStrong((id *)&self->_lastVisibleViews, 0);
  objc_storeStrong((id *)&self->_groupableFeedIds, 0);

  objc_storeStrong((id *)&self->_autoSubscribedFeedIds, 0);
}

@end