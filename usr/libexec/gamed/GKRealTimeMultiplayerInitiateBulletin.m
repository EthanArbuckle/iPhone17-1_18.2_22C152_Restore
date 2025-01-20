@interface GKRealTimeMultiplayerInitiateBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (BOOL)isReconnect;
- (GKRealTimeMultiplayerInitiateBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerInitiateBulletin)initWithPushNotification:(id)a3;
- (void)assembleBulletin;
- (void)encodeWithCoder:(id)a3;
- (void)handleAcceptAction;
- (void)handleAction:(id)a3;
- (void)handleDeclineAction;
- (void)loadDataWithHandler:(id)a3;
- (void)parseClientData:(id)a3;
- (void)setIsReconnect:(BOOL)a3;
@end

@implementation GKRealTimeMultiplayerInitiateBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 300, "+[GKRealTimeMultiplayerInitiateBulletin loadBulletinsForPushNotification:withHandler:]");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10014C0B4;
  v10[3] = &unk_1002D3C38;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:v7 execute:v10];
}

- (GKRealTimeMultiplayerInitiateBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin initWithPushNotification:", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  v7 = [(GKRealTimeMultiplayerBulletin *)&v10 initWithPushNotification:v4];
  if (v7)
  {
    id v8 = [v4 objectForKeyedSubscript:GKInviteIsReinvite];
    v7->_isReconnect = [v8 BOOLValue];
  }
  return v7;
}

- (GKRealTimeMultiplayerInitiateBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin initWithCoder:", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  v7 = [(GKRealTimeMultiplayerBulletin *)&v10 initWithCoder:v4];
  if (v7)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isReconnect"];
    v7->_isReconnect = [v8 BOOLValue];
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin encodeWithCoder:", buf, 2u);
  }
  v8.receiver = self;
  v8.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  [(GKRealTimeMultiplayerBulletin *)&v8 encodeWithCoder:v4];
  v7 = +[NSNumber numberWithBool:[(GKRealTimeMultiplayerInitiateBulletin *)self isReconnect]];
  [v4 encodeObject:v7 forKey:@"isReconnect"];
}

- (void)parseClientData:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    v14[0] = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin parseClientData:", (uint8_t *)v14, 2u);
  }
  if ((unint64_t)[v4 length] >= 2)
  {
    id v7 = v4;
    -[GKRealTimeMultiplayerBulletin setServerHosted:](self, "setServerHosted:", *((unsigned __int8 *)[v7 bytes] + 1));
    objc_super v8 = (char *)[v7 length];
    unsigned __int8 v9 = [(GKRealTimeMultiplayerBulletin *)self inviteVersionFromMessage:v7];
    if (!v9)
    {
      objc_super v10 = v8 - 2;
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    objc_super v10 = v8 - 4;
    id v11 = +[NSNumber numberWithUnsignedChar:v9];
    [(GKRealTimeMultiplayerBulletin *)self setInviteVersion:v11];

    if (v10)
    {
LABEL_8:
      id v12 = [v7 subdataWithRange:2, v10];
      id v13 = [objc_alloc((Class)NSString) initWithData:v12 encoding:4];
      [(GKBulletin *)self setMessage:v13];
    }
  }
LABEL_9:
}

- (void)assembleBulletin
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin assembleBulletin:", buf, 2u);
  }
  id v5 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v5 setType:1];
  id v6 = [(GKBulletin *)self gameDescriptor];
  id v7 = [v6 adamID];
  [(GKBulletinAction *)v5 setAdamID:v7];

  objc_super v8 = [(GKBulletin *)self gameDescriptor];
  unsigned __int8 v9 = [v8 bundleIdentifier];
  [(GKBulletinAction *)v5 setBundleID:v9];

  if ([(GKGameplayBulletin *)self gameLocation] == 2)
  {
    objc_super v10 = +[GCFLocalizedStrings APP_STORE];
    id v11 = &GKNotificationCategoryActionsAppStoreDecline;
  }
  else
  {
    if ([(GKGameplayBulletin *)self gameLocation] != 1) {
      goto LABEL_10;
    }
    objc_super v10 = +[GCFLocalizedStrings ACCEPT_INVITE_BUTTON_TITLE];
    id v11 = &GKNotificationCategoryActionsAcceptDecline;
  }
  [(GKBulletinAction *)v5 setTitle:v10];

  [(GKBulletin *)self setCategoryIdentifier:*v11];
LABEL_10:
  id v12 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v12 setType:0];
  id v13 = +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE];
  [(GKBulletinAction *)v12 setTitle:v13];

  [(GKBulletinAction *)v12 setInfo:&stru_1002E4F58];
  [(GKBulletinAction *)v12 setInAlertView:0];
  [(GKBulletinAction *)v12 setIsDestructive:1];
  v14 = objc_alloc_init(GKBulletinAction);
  [(GKBulletinAction *)v14 setType:0];
  v15 = +[GCFLocalizedStrings DECLINE_INVITE_BUTTON_TITLE];
  [(GKBulletinAction *)v14 setTitle:v15];

  [(GKBulletinAction *)v14 setInfo:&stru_1002E4F58];
  [(GKBulletinAction *)v14 setIsDestructive:1];
  if (!os_log_GKGeneral) {
    id v16 = (id)GKOSLoggers();
  }
  v17 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "assembleBulletin: - Bulletin Action Set", v29, 2u);
  }
  [(GKBulletin *)self setHasSound:1];
  v18 = [(GKBulletin *)self gameDescriptor];
  v19 = [v18 bundleIdentifier];
  v20 = [(GKRealTimeMultiplayerBulletin *)self customInviteSoundPathForBundleID:v19];
  [(GKBulletin *)self setSoundPath:v20];

  v21 = +[NSDate dateWithTimeIntervalSinceNow:600.0];
  [(GKBulletin *)self setExpirationDate:v21];

  [(GKBulletin *)self setDefaultAction:v5];
  [(GKBulletin *)self setDeclineAction:v12];
  [(GKBulletin *)self setDismissAction:v14];
  v22 = +[NSDate date];
  [(GKBulletin *)self setDate:v22];

  [(GKBulletin *)self setBulletinType:400];
  if (!os_log_GKGeneral) {
    id v23 = (id)GKOSLoggers();
  }
  v24 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v28 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "assembleBulletin: - Bulletin Data Set", v28, 2u);
  }
  if ([(GKRealTimeMultiplayerInitiateBulletin *)self isReconnect]) {
    +[GCFLocalizedStrings KETTLE_GAME_INVITE_RECONNECT_NOTIFICATION_TITLE];
  }
  else {
  v25 = +[GCFLocalizedStrings KETTLE_GAME_INVITE_NOTIFICATION_TITLE];
  }
  v26 = [(GKBulletin *)self gameName];
  v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v26);
  [(GKBulletin *)self setTitle:v27];
}

- (void)handleAction:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin handleAction:", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKRealTimeMultiplayerInitiateBulletin;
  [(GKBulletin *)&v10 handleAction:v4];
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  objc_super v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2112;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bulletin handle multiplayer action: %@ bulletin: %@", buf, 0x16u);
  }
  if (([v4 isEqualToString:@"GKAccepted"] & 1) != 0
    || [v4 isEqualToString:@"GKDefault"])
  {
    [(GKRealTimeMultiplayerInitiateBulletin *)self handleAcceptAction];
  }
  else if (([v4 isEqualToString:@"GKDeclined"] & 1) != 0 {
         || [v4 isEqualToString:@"GKDismissed"])
  }
  {
    [(GKRealTimeMultiplayerInitiateBulletin *)self handleDeclineAction];
  }
  else if ([v4 isEqualToString:@"GKExpired"])
  {
    unsigned __int8 v9 = +[GKBulletinController sharedController];
    [v9 expireBulletin:self];
  }
}

- (void)handleAcceptAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin handleAcceptAction", (uint8_t *)&v20, 2u);
  }
  id v5 = [(GKBulletin *)self gameDescriptor];
  id v6 = [v5 bundleIdentifier];
  id v7 = +[GKClientProxy clientForBundleID:v6];

  objc_super v8 = +[GKBulletinController sharedController];
  unsigned __int8 v9 = [v8 acceptedInviteManager];

  if ([(GKGameplayBulletin *)self gameLocation] == 1)
  {
    objc_super v10 = [(GKRealTimeMultiplayerBulletin *)self inviteVersion];
    id v11 = [v10 integerValue];
    id v12 = +[GKPreferences shared];
    id v13 = [v12 maximumInviteVersionSupported];

    if (v11 <= v13)
    {
      [v9 addMultiplayerInvite:self];
      v19 = +[GKReporter reporter];
      [v19 reportEvent:GKReporterDomainInvite type:GKReporterInviteAcceptUser];

      [v7 acceptMultiplayerGameInvite];
    }
    else
    {
      [(GKRealTimeMultiplayerBulletin *)self declineInviteWithReason:5];
      v14 = [(GKRealTimeMultiplayerBulletin *)self clientNotification];
      [v7 declineInviteWithNotification:v14];

      if (!os_log_GKGeneral) {
        id v15 = (id)GKOSLoggers();
      }
      id v16 = (void *)os_log_GKMatch;
      if (os_log_type_enabled(os_log_GKMatch, OS_LOG_TYPE_INFO))
      {
        v17 = v16;
        v18 = [(GKRealTimeMultiplayerBulletin *)self inviteVersion];
        int v20 = 138412290;
        v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Cannot handle an invite with invite version: (%@).", (uint8_t *)&v20, 0xCu);
      }
      [v9 declineMultiplayerInvite:self];
    }
  }
}

- (void)handleDeclineAction
{
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin handleDeclineAction", v5, 2u);
  }
  [(GKRealTimeMultiplayerBulletin *)self declineInviteWithReason:1];
}

- (void)loadDataWithHandler:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerInitiateBulletin loadDataWithHandler:", buf, 2u);
  }
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 571, "-[GKRealTimeMultiplayerInitiateBulletin loadDataWithHandler:]");
  objc_super v8 = +[GKDispatchGroup dispatchGroupWithName:v7];

  unsigned __int8 v9 = +[GKClientProxy gameCenterClient];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10014DE8C;
  v20[3] = &unk_1002D3A70;
  v20[4] = self;
  id v10 = v8;
  id v21 = v10;
  [v10 perform:v20];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10014E00C;
  v18[3] = &unk_1002D3A70;
  v18[4] = self;
  id v11 = v10;
  id v19 = v11;
  [v11 perform:v18];
  id v12 = [v9 replyQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10014E238;
  v15[3] = &unk_1002D3930;
  id v16 = v11;
  id v17 = v4;
  id v13 = v11;
  id v14 = v4;
  [v13 notifyOnQueue:v12 block:v15];
}

- (BOOL)isReconnect
{
  return self->_isReconnect;
}

- (void)setIsReconnect:(BOOL)a3
{
  self->_isReconnect = a3;
}

@end