@interface GKRealTimeMultiplayerDeclineBulletin
- (BOOL)isAccept;
- (id)aggregateDictionaryKey;
- (id)debugLine;
- (id)notificationName;
- (void)assembleBulletin;
@end

@implementation GKRealTimeMultiplayerDeclineBulletin

- (id)aggregateDictionaryKey
{
  return GKReporterPushCountInviteDecline;
}

- (id)debugLine
{
  return @"decline push";
}

- (id)notificationName
{
  return GKDeclineGameInviteNotification;
}

- (BOOL)isAccept
{
  return 0;
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerDeclineBulletin assembleBulletin", buf, 2u);
  }
  v12.receiver = self;
  v12.super_class = (Class)GKRealTimeMultiplayerDeclineBulletin;
  [(GKRealTimeMultiplayerActionBulletin *)&v12 assembleBulletin];
  v5 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE];
  v6 = [(GKBulletin *)self gameName];
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6);
  [(GKBulletin *)self setTitle:v7];

  v8 = [(GKGameplayBulletin *)self originatorPlayer];
  v9 = [v8 displayNameWithOptions:0];

  if (v9)
  {
    v10 = +[GCFLocalizedStrings KETTLE_INVITEE_DECLINED_ALERT_MESSAGE_ALIAS_1_FORMAT];
    v11 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, v9);
    [(GKBulletin *)self setMessage:v11];
  }
  else
  {
    v10 = +[GCFLocalizedStrings KETTLE_INVITEE_DECLINED_ALERT_MESSAGE];
    [(GKBulletin *)self setMessage:v10];
  }

  [(GKBulletin *)self setBulletinType:403];
}

@end