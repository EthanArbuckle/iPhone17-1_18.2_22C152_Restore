@interface GKTTRInitiationBulletin
+ (id)packFakeTTRBulletinWithInfo:(id)a3;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
- (void)assembleBulletin;
@end

@implementation GKTTRInitiationBulletin

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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKTTRInitiationBulletin: packFakeTTRBulletinWithInfo", buf, 2u);
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___GKTTRInitiationBulletin;
  v7 = [super packFakeTTRBulletinWithInfo:v4];
  id v8 = [v7 mutableCopy];

  [v8 setObject:&off_1002F2168 forKeyedSubscript:GKPushCommandKey];
  uint64_t v9 = GKTTRBulletinKeySubtitle;
  uint64_t v10 = [v4 objectForKeyedSubscript:GKTTRBulletinKeySubtitle];
  v11 = (void *)v10;
  if (v10) {
    CFStringRef v12 = (const __CFString *)v10;
  }
  else {
    CFStringRef v12 = @"Did you encounter any issues? Tap here to file a radar.";
  }
  [v8 setObject:v12 forKeyedSubscript:v9];

  id v13 = [v8 copy];

  return v13;
}

- (void)assembleBulletin
{
  v3.receiver = self;
  v3.super_class = (Class)GKTTRInitiationBulletin;
  [(GKTTRBulletin *)&v3 assembleBulletin];
  [(GKBulletin *)self setCategoryIdentifier:@"GKNotificationCategoryActionsTTRInitiation"];
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
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKTTRBulletin: loadBulletinsForPushNotification", v11, 2u);
  }
  uint64_t v9 = [(GKTTRBulletin *)[GKTTRInitiationBulletin alloc] initWithPushNotification:v5];
  [(GKTTRInitiationBulletin *)v9 assembleBulletin];
  CFStringRef v12 = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:&v12 count:1];
  v6[2](v6, v10);
}

@end