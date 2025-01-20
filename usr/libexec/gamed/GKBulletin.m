@interface GKBulletin
+ (BOOL)playerIsLocal:(id)a3;
+ (BOOL)shouldProcessNotification;
+ (BOOL)supportsSecureCoding;
+ (id)cacheTransactionGroup;
+ (id)syncQueue;
+ (void)bulletinsForPushNotification:(id)a3 withHandler:(id)a4;
+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4;
+ (void)performAsync:(id)a3;
- (BOOL)hasSound;
- (BOOL)showInListOnly;
- (GKBulletin)initWithCoder:(id)a3;
- (GKBulletin)initWithPushNotification:(id)a3;
- (GKBulletinAction)acceptAction;
- (GKBulletinAction)declineAction;
- (GKBulletinAction)defaultAction;
- (GKBulletinAction)dismissAction;
- (GKBulletinAction)viewAction;
- (GKGameDescriptor)gameDescriptor;
- (NSArray)attachments;
- (NSDate)date;
- (NSDate)expirationDate;
- (NSString)categoryIdentifier;
- (NSString)gameName;
- (NSString)message;
- (NSString)metricsBundleID;
- (NSString)recordID;
- (NSString)soundPath;
- (NSString)title;
- (NSURL)gameIcon;
- (id)dataFrom64String:(id)a3;
- (id)description;
- (id)updatedNotificationCategoriesOrNil:(id)a3;
- (signed)pushCommand;
- (unint64_t)bulletinType;
- (void)encodeWithCoder:(id)a3;
- (void)executeBulletinWithBulletinController:(id)a3;
- (void)handleAction:(id)a3;
- (void)launchBulletinWithCompletionHandler:(id)a3;
- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4;
- (void)reportMetricsForPresented;
- (void)reportMetricsWithEventType:(id)a3 additionalFields:(id)a4;
- (void)reportMetricsWithHostAppBundleId:(id)a3 fields:(id)a4;
- (void)setAcceptAction:(id)a3;
- (void)setAttachments:(id)a3;
- (void)setBulletinType:(unint64_t)a3;
- (void)setCategoryIdentifier:(id)a3;
- (void)setDate:(id)a3;
- (void)setDeclineAction:(id)a3;
- (void)setDefaultAction:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGameDescriptor:(id)a3;
- (void)setGameIcon:(id)a3;
- (void)setGameName:(id)a3;
- (void)setHasSound:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setPushCommand:(signed __int16)a3;
- (void)setRecordID:(id)a3;
- (void)setShowInListOnly:(BOOL)a3;
- (void)setSoundPath:(id)a3;
- (void)setTitle:(id)a3;
- (void)setViewAction:(id)a3;
@end

@implementation GKBulletin

+ (id)syncQueue
{
  if (qword_100329948 != -1) {
    dispatch_once(&qword_100329948, &stru_1002DC270);
  }
  v2 = (void *)qword_100329940;

  return v2;
}

+ (void)bulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  v8 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "GKBulletin bulletinsForPushNotification: withHandler:", buf, 2u);
  }
  if (qword_100329958 != -1) {
    dispatch_once(&qword_100329958, &stru_1002DC290);
  }
  v9 = [v5 objectForKey:GKPushCommandKey];
  id v10 = [(id)qword_100329950 objectForKeyedSubscript:v9];
  if ([v10 shouldProcessNotification])
  {
    [v10 loadBulletinsForPushNotification:v5 withHandler:v6];
  }
  else
  {
    if (!v10)
    {
      if (!os_log_GKGeneral) {
        id v11 = (id)GKOSLoggers();
      }
      v12 = os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "PUSH FAILED: Invalid payload", v13, 2u);
      }
    }
    if (v6) {
      v6[2](v6, 0);
    }
  }
}

+ (void)loadBulletinsForPushNotification:(id)a3 withHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!os_log_GKGeneral) {
    id v9 = (id)GKOSLoggers();
  }
  id v10 = (void *)os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
    sub_100139C84(v10, (uint64_t)a1, a2);
  }
}

- (GKBulletin)initWithCoder:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin initWithCoder:", buf, 2u);
  }
  v44.receiver = self;
  v44.super_class = (Class)GKBulletin;
  id v7 = [(GKBulletin *)&v44 init];
  if (v7)
  {
    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pushCommand"];
    v7->_pushCommand = (unsigned __int16)[v8 integerValue];

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordID"];
    recordID = v7->_recordID;
    v7->_recordID = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v7->_title;
    v7->_title = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"message"];
    message = v7->_message;
    v7->_message = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    date = v7->_date;
    v7->_date = (NSDate *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expirationDate"];
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v17;

    v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasSound"];
    v7->_hasSound = [v19 BOOLValue];

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"soundPath"];
    soundPath = v7->_soundPath;
    v7->_soundPath = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptAction"];
    acceptAction = v7->_acceptAction;
    v7->_acceptAction = (GKBulletinAction *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"defaultAction"];
    defaultAction = v7->_defaultAction;
    v7->_defaultAction = (GKBulletinAction *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dismissAction"];
    dismissAction = v7->_dismissAction;
    v7->_dismissAction = (GKBulletinAction *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"declineAction"];
    declineAction = v7->_declineAction;
    v7->_declineAction = (GKBulletinAction *)v28;

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"showInListOnly"];
    v7->_showInListOnly = [v30 BOOLValue];

    uint64_t v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameName"];
    gameName = v7->_gameName;
    v7->_gameName = (NSString *)v31;

    uint64_t v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameIcon"];
    gameIcon = v7->_gameIcon;
    v7->_gameIcon = (NSURL *)v33;

    uint64_t v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gameDescriptor"];
    gameDescriptor = v7->_gameDescriptor;
    v7->_gameDescriptor = (GKGameDescriptor *)v35;

    uint64_t v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"categoryIdentifier"];
    categoryIdentifier = v7->_categoryIdentifier;
    v7->_categoryIdentifier = (NSString *)v37;

    uint64_t v39 = objc_opt_class();
    v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v39, objc_opt_class(), 0);
    uint64_t v41 = [v4 decodeObjectOfClasses:v40 forKey:@"attachments"];
    attachments = v7->_attachments;
    v7->_attachments = (NSArray *)v41;
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
    *(_WORD *)v25 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin encodeWithCoder:", v25, 2u);
  }
  id v7 = +[NSNumber numberWithInt:[(GKBulletin *)self pushCommand]];
  [v4 encodeObject:v7 forKey:@"pushCommand"];

  id v8 = [(GKBulletin *)self recordID];
  [v4 encodeObject:v8 forKey:@"recordID"];

  uint64_t v9 = [(GKBulletin *)self title];
  [v4 encodeObject:v9 forKey:@"title"];

  id v10 = [(GKBulletin *)self message];
  [v4 encodeObject:v10 forKey:@"message"];

  uint64_t v11 = [(GKBulletin *)self date];
  [v4 encodeObject:v11 forKey:@"date"];

  v12 = [(GKBulletin *)self expirationDate];
  [v4 encodeObject:v12 forKey:@"expirationDate"];

  uint64_t v13 = +[NSNumber numberWithBool:[(GKBulletin *)self hasSound]];
  [v4 encodeObject:v13 forKey:@"hasSound"];

  v14 = [(GKBulletin *)self soundPath];
  [v4 encodeObject:v14 forKey:@"soundPath"];

  uint64_t v15 = [(GKBulletin *)self acceptAction];
  [v4 encodeObject:v15 forKey:@"acceptAction"];

  v16 = [(GKBulletin *)self defaultAction];
  [v4 encodeObject:v16 forKey:@"defaultAction"];

  uint64_t v17 = [(GKBulletin *)self dismissAction];
  [v4 encodeObject:v17 forKey:@"dismissAction"];

  v18 = [(GKBulletin *)self declineAction];
  [v4 encodeObject:v18 forKey:@"declineAction"];

  v19 = +[NSNumber numberWithBool:[(GKBulletin *)self showInListOnly]];
  [v4 encodeObject:v19 forKey:@"showInListOnly"];

  uint64_t v20 = [(GKBulletin *)self gameName];
  [v4 encodeObject:v20 forKey:@"gameName"];

  v21 = [(GKBulletin *)self gameIcon];
  [v4 encodeObject:v21 forKey:@"gameIcon"];

  uint64_t v22 = [(GKBulletin *)self gameDescriptor];
  [v4 encodeObject:v22 forKey:@"gameDescriptor"];

  v23 = [(GKBulletin *)self categoryIdentifier];
  [v4 encodeObject:v23 forKey:@"categoryIdentifier"];

  uint64_t v24 = [(GKBulletin *)self attachments];
  [v4 encodeObject:v24 forKey:@"attachments"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)dataFrom64String:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKBulletin dataFrom64String:", v8, 2u);
  }
  if (v3) {
    id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v3 options:0];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (GKBulletin)initWithPushNotification:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin initWithPushNotification:", buf, 2u);
  }
  v13.receiver = self;
  v13.super_class = (Class)GKBulletin;
  id v7 = [(GKBulletin *)&v13 init];
  if (v7)
  {
    id v8 = +[NSUUID UUID];
    uint64_t v9 = [v8 UUIDString];
    recordID = v7->_recordID;
    v7->_recordID = (NSString *)v9;

    uint64_t v11 = [v4 objectForKey:GKPushCommandKey];
    v7->_pushCommand = (unsigned __int16)[v11 integerValue];

    v7->_bulletinType = 0;
  }

  return v7;
}

+ (BOOL)shouldProcessNotification
{
  if (!os_log_GKGeneral) {
    id v2 = (id)GKOSLoggers();
  }
  id v3 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "GKBulletin shouldProcessNotification", v7, 2u);
  }
  id v4 = +[GKPreferences shared];
  unsigned __int8 v5 = [v4 isGameCenterRestricted];

  return v5 ^ 1;
}

- (void)executeBulletinWithBulletinController:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin executeBulletinWithBulletinController:", v7, 2u);
  }
  [v4 presentBulletin:self];
}

+ (void)performAsync:(id)a3
{
  id v4 = a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin performAsync:", v8, 2u);
  }
  id v7 = [a1 syncQueue];
  dispatch_async(v7, v4);
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin handleAction:", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "bulletin handle action: %@", buf, 0xCu);
  }
  if (([v4 isEqualToString:@"GKDefault"] & 1) != 0
    || [v4 isEqualToString:@"GKAccepted"])
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100138CBC;
    v9[3] = &unk_1002DC2B8;
    v9[4] = self;
    id v10 = v4;
    [(GKBulletin *)self launchBulletinWithCompletionHandler:v9];
  }
  else
  {
    [(GKBulletin *)self reportMetricsForActionID:v4 withAdditionalFields:0];
  }
}

- (void)launchBulletinWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  if (!os_log_GKGeneral) {
    id v5 = (id)GKOSLoggers();
  }
  id v6 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "GKBulletin launchBulletinWithCompletionHandler:", buf, 2u);
  }
  if (!os_log_GKGeneral) {
    id v7 = (id)GKOSLoggers();
  }
  id v8 = os_log_GKDaemon;
  if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v33 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Launching: %@", buf, 0xCu);
  }
  uint64_t v9 = self->_acceptAction;
  if (!v9) {
    uint64_t v9 = self->_defaultAction;
  }
  id v10 = [(GKBulletinAction *)v9 type];
  if (v10 == (id)2)
  {
    v19 = [(GKBulletinAction *)v9 info];
    id v20 = [v19 length];

    if (v20)
    {
      v31[0] = GKRemoteAlertDeeplinkActionPlayerProfileValue;
      v30[0] = GKRemoteAlertDeeplinkActionKey;
      v30[1] = GKRemoteAlertDeeplinkPlayerIdentifierKey;
      v21 = [(GKBulletinAction *)v9 info];
      v31[1] = v21;
      id v12 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    }
    else
    {
      id v12 = 0;
    }
    uint64_t v26 = +[GKClientProxy gameCenterClient];
    objc_super v13 = +[GKService serviceWithTransport:0 forClient:v26 credential:0];

    v27 = +[GKGameInternal createGamedGameInternal];
    [v13 openDashboardAsRemoteAlertForGame:v27 hostPID:getpid() deeplink:v12 launchContext:GKDashboardLaunchContextPushNotification];

    v4[2](v4, 0);
LABEL_32:

    goto LABEL_33;
  }
  if (v10 == (id)1)
  {
    uint64_t v11 = [(GKBulletinAction *)v9 appLaunchTrampolineURL];

    if (v11)
    {
      id v12 = +[GKClientProxy gameCenterClient];
      objc_super v13 = +[GKService serviceWithTransport:0 forClient:v12 localPlayer:0];
      if (!os_log_GKGeneral) {
        id v14 = (id)GKOSLoggers();
      }
      uint64_t v15 = (void *)os_log_GKDaemon;
      if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_INFO))
      {
        v16 = v15;
        uint64_t v17 = [(GKBulletinAction *)v9 appLaunchTrampolineURL];
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Invoking AppLaunchTrampoline with URL: %@", buf, 0xCu);
      }
      v18 = [(GKBulletinAction *)v9 appLaunchTrampolineURL];
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1001391E4;
      v28[3] = &unk_1002DC2E0;
      v29 = v4;
      [v13 invokeASCAppLaunchTrampolineWithURL:v18 handler:v28];

      goto LABEL_32;
    }
    if (!os_log_GKGeneral) {
      id v24 = (id)GKOSLoggers();
    }
    v25 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100139DD4(v25);
    }
  }
  else
  {
    if (!os_log_GKGeneral) {
      id v22 = (id)GKOSLoggers();
    }
    v23 = os_log_GKDaemon;
    if (os_log_type_enabled(os_log_GKDaemon, OS_LOG_TYPE_ERROR)) {
      sub_100139D5C((uint64_t)v9, v23);
    }
  }
  v4[2](v4, 0);
LABEL_33:
}

- (NSString)metricsBundleID
{
  id v2 = [(GKBulletin *)self gameDescriptor];
  id v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (void)reportMetricsForPresented
{
}

- (void)reportMetricsForActionID:(id)a3 withAdditionalFields:(id)a4
{
  CFStringRef v10 = @"actionType";
  id v11 = a3;
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];

  uint64_t v9 = [v8 _gkAddEntriesFrom:v6];

  [(GKBulletin *)self reportMetricsWithEventType:@"click" additionalFields:v9];
}

- (void)reportMetricsWithEventType:(id)a3 additionalFields:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(GKBulletin *)self metricsBundleID];
  uint64_t v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = &stru_1002E4F58;
  }
  v15[0] = v7;
  v14[0] = @"eventType";
  v14[1] = @"pageId";
  id v11 = +[NSNumber numberWithShort:[(GKBulletin *)self pushCommand]];
  v14[2] = @"pageType";
  v15[1] = v11;
  v15[2] = @"notification";
  id v12 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  objc_super v13 = [v12 _gkAddEntriesFrom:v6];

  [(GKBulletin *)self reportMetricsWithHostAppBundleId:v10 fields:v13];
}

- (void)reportMetricsWithHostAppBundleId:(id)a3 fields:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[GKAMPController controller];
  [v7 reportClickStreamEventWithHostAppBundleId:v6 metricsFields:v5];
}

- (id)updatedNotificationCategoriesOrNil:(id)a3
{
  return 0;
}

+ (BOOL)playerIsLocal:(id)a3
{
  id v3 = a3;
  if (!os_log_GKGeneral) {
    id v4 = (id)GKOSLoggers();
  }
  id v5 = os_log_GKTrace;
  if (os_log_type_enabled(os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "GKBulletin playerIsLocal:", buf, 2u);
  }
  id v6 = +[GKPlayerCredentialController sharedController];
  id v7 = +[GKDataRequestManager sharedManager];
  uint64_t v8 = [v6 allCredentialsForEnvironment:[v7 currentEnvironment]];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_super v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) playerInternal:v17];
        id v14 = [v13 playerID];
        unsigned __int8 v15 = [v14 isEqualToString:v3];

        if (v15)
        {
          LOBYTE(v10) = 1;
          goto LABEL_15;
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  return (char)v10;
}

- (id)description
{
  v19.receiver = self;
  v19.super_class = (Class)GKBulletin;
  long long v18 = [(GKBulletin *)&v19 description];
  long long v17 = [(GKBulletin *)self recordID];
  v16 = [(GKBulletin *)self title];
  id v3 = [(GKBulletin *)self message];
  unsigned __int8 v15 = [(GKBulletin *)self date];
  id v14 = [(GKBulletin *)self expirationDate];
  CFStringRef v4 = @"NO";
  if ([(GKBulletin *)self hasSound]) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  id v6 = [(GKBulletin *)self soundPath];
  id v7 = [(GKBulletin *)self defaultAction];
  uint64_t v8 = [(GKBulletin *)self acceptAction];
  id v9 = [(GKBulletin *)self dismissAction];
  id v10 = [(GKBulletin *)self declineAction];
  if ([(GKBulletin *)self showInListOnly]) {
    CFStringRef v4 = @"YES";
  }
  uint64_t v11 = [(GKBulletin *)self categoryIdentifier];
  id v13 = [v18 stringByAppendingFormat:@"\nrecordID:%@\ntitle:%@\nmessage:%@\ndate:%@\nexpirationDate:%@\nhasSound:%@\nsoundPath:%@\ndefaultAction:%@\nacceptAction:%@\ndismissAction:%@\ndeclineAction:%@\nshowInListOnly:%@\ncategoryIdentifier:%@", v17, v16, v3, v15, v14, v5, v6, v7, v8, v9, v10, v4, v11];

  return v13;
}

- (signed)pushCommand
{
  return self->_pushCommand;
}

- (void)setPushCommand:(signed __int16)a3
{
  self->_pushCommand = a3;
}

- (NSString)recordID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecordID:(id)a3
{
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMessage:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setDate:(id)a3
{
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)hasSound
{
  return self->_hasSound;
}

- (void)setHasSound:(BOOL)a3
{
  self->_hasSound = a3;
}

- (NSString)soundPath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSoundPath:(id)a3
{
}

- (GKBulletinAction)acceptAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAcceptAction:(id)a3
{
}

- (GKBulletinAction)defaultAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDefaultAction:(id)a3
{
}

- (GKBulletinAction)dismissAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDismissAction:(id)a3
{
}

- (GKBulletinAction)declineAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeclineAction:(id)a3
{
}

- (GKBulletinAction)viewAction
{
  return (GKBulletinAction *)objc_getProperty(self, a2, 112, 1);
}

- (void)setViewAction:(id)a3
{
}

- (BOOL)showInListOnly
{
  return self->_showInListOnly;
}

- (void)setShowInListOnly:(BOOL)a3
{
  self->_showInListOnly = a3;
}

- (NSString)gameName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setGameName:(id)a3
{
}

- (NSURL)gameIcon
{
  return (NSURL *)objc_getProperty(self, a2, 128, 1);
}

- (void)setGameIcon:(id)a3
{
}

- (GKGameDescriptor)gameDescriptor
{
  return (GKGameDescriptor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setGameDescriptor:(id)a3
{
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCategoryIdentifier:(id)a3
{
}

- (unint64_t)bulletinType
{
  return self->_bulletinType;
}

- (void)setBulletinType:(unint64_t)a3
{
  self->_bulletinType = a3;
}

- (NSArray)attachments
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAttachments:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_gameIcon, 0);
  objc_storeStrong((id *)&self->_gameName, 0);
  objc_storeStrong((id *)&self->_viewAction, 0);
  objc_storeStrong((id *)&self->_declineAction, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_acceptAction, 0);
  objc_storeStrong((id *)&self->_soundPath, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_recordID, 0);

  objc_storeStrong((id *)&self->_gameDescriptor, 0);
}

+ (id)cacheTransactionGroup
{
  id v2 = +[GKClientProxy gameCenterClient];
  id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s:%d %s", "GKSystemBulletin.m", 56, "+[GKBulletin(CacheTransactionGroup) cacheTransactionGroup]");
  CFStringRef v4 = +[GKPlayerCredentialController sharedController];
  CFStringRef v5 = [v4 pushCredentialForEnvironment:[v2 environment]];
  id v6 = [v5 playerInternal];
  id v7 = [v6 playerID];
  uint64_t v8 = [v2 transactionGroupWithName:v3 forPlayerID:v7];

  return v8;
}

@end