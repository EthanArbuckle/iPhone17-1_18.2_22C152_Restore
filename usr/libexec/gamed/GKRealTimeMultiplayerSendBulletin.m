@interface GKRealTimeMultiplayerSendBulletin
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKRealTimeMultiplayerSendBulletin)initWithCoder:(id)a3;
- (GKRealTimeMultiplayerSendBulletin)initWithPushNotification:(id)a3;
- (NSNumber)sendReason;
- (NSString)bundleIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setSendReason:(id)a3;
@end

@implementation GKRealTimeMultiplayerSendBulletin

- (GKRealTimeMultiplayerSendBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithPushNotification:", buf, 2u);
  }
  v15.receiver = self;
  v15.super_class = (Class)GKRealTimeMultiplayerSendBulletin;
  v7 = [(GKRealTimeMultiplayerBulletin *)&v15 initWithPushNotification:v4];
  v8 = v7;
  if (v7)
  {
    v9 = [(GKRealTimeMultiplayerBulletin *)v7 clientDictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"bundle-id"];
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"y"];
    sendReason = v8->_sendReason;
    v8->_sendReason = (NSNumber *)v12;
  }
  return v8;
}

- (GKRealTimeMultiplayerSendBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin initWithCoder:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKRealTimeMultiplayerSendBulletin;
  v7 = [(GKRealTimeMultiplayerBulletin *)&v13 initWithCoder:v4];
  if (v7)
  {
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sendReason"];
    sendReason = v7->_sendReason;
    v7->_sendReason = (NSNumber *)v10;
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKRealTimeMultiplayerBulletin encodeWithCoder:", buf, 2u);
  }
  v9.receiver = self;
  v9.super_class = (Class)GKRealTimeMultiplayerSendBulletin;
  [(GKRealTimeMultiplayerBulletin *)&v9 encodeWithCoder:v4];
  v7 = [(GKRealTimeMultiplayerSendBulletin *)self bundleIdentifier];
  [v4 encodeObject:v7 forKey:@"bundleIdentifier"];

  uint64_t v8 = [(GKRealTimeMultiplayerSendBulletin *)self sendReason];
  [v4 encodeObject:v8 forKey:@"sendReason"];
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKRealTimeMultiplayerBulletin.m", 1180, "+[GKRealTimeMultiplayerSendBulletin loadBulletinsForPushNotification:withHandler:]");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001523B0;
  v10[3] = &unk_1002D3C38;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[GKActivity named:v7 execute:v10];
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 368, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSNumber)sendReason
{
  return (NSNumber *)objc_getProperty(self, a2, 376, 1);
}

- (void)setSendReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendReason, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end