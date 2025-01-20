@interface GKTurnBasedMultiplayerClearBulletin
+ (BOOL)supportsSecureCoding;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKTurnBasedMultiplayerClearBulletin)initWithCoder:(id)a3;
- (GKTurnBasedMultiplayerClearBulletin)initWithPushNotification:(id)a3;
- (int64_t)clearType;
- (void)encodeWithCoder:(id)a3;
- (void)setClearType:(int64_t)a3;
@end

@implementation GKTurnBasedMultiplayerClearBulletin

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin loadBulletinsForPushNotification: withHandler:", v13, 2u);
  }
  v9 = +[GKReporter reporter];
  [v9 reportEvent:GKReporterDomainPushCount type:GKReporterPushCountTurnBasedClear];

  v10 = objc_alloc_init(GKTurnBasedMultiplayerClearBulletin);
  v11 = +[GKBulletinController sharedController];
  v12 = [(GKTurnBasedMultiplayerBulletin *)v10 matchID];
  [v11 clearTurnBasedBulletinsForMatchID:v12];

  if (v6) {
    v6[2](v6, 0);
  }
}

- (GKTurnBasedMultiplayerClearBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin initWithPushNotification:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKTurnBasedMultiplayerClearBulletin;
  id v7 = [(GKTurnBasedMultiplayerBulletin *)&v13 initWithPushNotification:v4];
  if (v7)
  {
    v8 = [v4 objectForKey:@"cc"];
    id v9 = [v8 integerValue];

    uint64_t v10 = 3;
    if (v9 != (id)81) {
      uint64_t v10 = 0;
    }
    if (v9 == (id)80) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = v10;
    }
    [(GKTurnBasedMultiplayerClearBulletin *)v7 setClearType:v11];
  }

  return v7;
}

- (GKTurnBasedMultiplayerClearBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin initWithCoder:", buf, 2u);
  }
  v10.receiver = self;
  v10.super_class = (Class)GKTurnBasedMultiplayerClearBulletin;
  id v7 = [(GKTurnBasedMultiplayerBulletin *)&v10 initWithCoder:v4];
  if (v7)
  {
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clearType"];
    v7->_clearType = (int64_t)[v8 integerValue];
  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTurnBasedMultiplayerClearBulletin encodeWithCoder:", buf, 2u);
  }
  v8.receiver = self;
  v8.super_class = (Class)GKTurnBasedMultiplayerClearBulletin;
  [(GKTurnBasedMultiplayerBulletin *)&v8 encodeWithCoder:v4];
  id v7 = +[NSNumber numberWithInteger:[(GKTurnBasedMultiplayerClearBulletin *)self clearType]];
  [v4 encodeObject:v7 forKey:@"clearType"];
}

- (int64_t)clearType
{
  return self->_clearType;
}

- (void)setClearType:(int64_t)a3
{
  self->_clearType = a3;
}

@end