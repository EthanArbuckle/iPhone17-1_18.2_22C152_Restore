@interface GKTTRUploadRequestBulletin
+ (id)packFakeTTRBulletinWithInfo:(id)a3;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (GKTTRUploadRequestBulletin)initWithPushNotification:(id)a3;
- (NSString)radarID;
- (NSString)requesterPlayerAlias;
- (void)assembleBulletin;
- (void)setRadarID:(id)a3;
- (void)setRequesterPlayerAlias:(id)a3;
@end

@implementation GKTTRUploadRequestBulletin

+ (id)packFakeTTRBulletinWithInfo:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTTRUploadRequestBulletin: packFakeTTRBulletinWithInfo", buf, 2u);
  }
  v22.receiver = a1;
  v22.super_class = (Class)&OBJC_METACLASS___GKTTRUploadRequestBulletin;
  v7 = [super packFakeTTRBulletinWithInfo:v4];
  id v8 = [v7 mutableCopy];

  [v8 setObject:&off_1002F2180 forKeyedSubscript:GKPushCommandKey];
  uint64_t v9 = GKTTRBulletinKeyRadarID;
  uint64_t v10 = [v4 objectForKeyedSubscript:GKTTRBulletinKeyRadarID];
  v11 = (void *)v10;
  v12 = @"UnknownID";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  uint64_t v14 = GKTTRBulletinKeyRequesterPlayerAlias;
  uint64_t v15 = [v4 objectForKeyedSubscript:GKTTRBulletinKeyRequesterPlayerAlias];
  v16 = (void *)v15;
  v17 = @"UnknownAlias";
  if (v15) {
    v17 = (__CFString *)v15;
  }
  v18 = v17;

  [v8 setObject:v13 forKeyedSubscript:v9];
  [v8 setObject:v18 forKeyedSubscript:v14];
  v19 = +[NSString stringWithFormat:@"%@ has requested your logs. Tap here to upload your sysdiagnose to radar://%@", v18, v13];

  [v8 setObject:v19 forKeyedSubscript:GKTTRBulletinKeySubtitle];
  id v20 = [v8 copy];

  return v20;
}

- (GKTTRUploadRequestBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTTRUploadRequestBulletin: initWithPushNotification", buf, 2u);
  }
  v11.receiver = self;
  v11.super_class = (Class)GKTTRUploadRequestBulletin;
  v7 = [(GKTTRBulletin *)&v11 initWithPushNotification:v4];
  if (v7)
  {
    id v8 = [v4 objectForKeyedSubscript:GKTTRBulletinKeyRadarID];
    [(GKTTRUploadRequestBulletin *)v7 setRadarID:v8];

    uint64_t v9 = [v4 objectForKeyedSubscript:GKTTRBulletinKeyRequesterPlayerAlias];
    [(GKTTRUploadRequestBulletin *)v7 setRequesterPlayerAlias:v9];
  }
  return v7;
}

- (void)assembleBulletin
{
  v3.receiver = self;
  v3.super_class = (Class)GKTTRUploadRequestBulletin;
  [(GKTTRBulletin *)&v3 assembleBulletin];
  [(GKBulletin *)self setCategoryIdentifier:@"GKNotificationCategoryActionsTTRUploadRequest"];
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKTTRBulletin: loadBulletinsForPushNotification", v11, 2u);
  }
  uint64_t v9 = [[GKTTRUploadRequestBulletin alloc] initWithPushNotification:v5];
  [(GKTTRUploadRequestBulletin *)v9 assembleBulletin];
  v12 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];
  v6[2](v6, v10);
}

- (NSString)radarID
{
  return self->_radarID;
}

- (void)setRadarID:(id)a3
{
}

- (NSString)requesterPlayerAlias
{
  return self->_requesterPlayerAlias;
}

- (void)setRequesterPlayerAlias:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesterPlayerAlias, 0);

  objc_storeStrong((id *)&self->_radarID, 0);
}

@end