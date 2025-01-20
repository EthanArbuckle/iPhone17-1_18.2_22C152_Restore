@interface FRNotificationManager
+ (void)initialize;
- (BOOL)autoEnableNotificationsIsPending;
- (FRFeldsparContext)feldsparContext;
- (FRNotificationAutoEnableHelper)notificationAutoEnableHelper;
- (FRNotificationManager)initWithFeldsparContext:(id)a3;
- (NSString)deviceToken;
- (id)_combinedStringWithTagNames:(id)a3;
- (id)_identifierWithPrefix:(id)a3 tags:(id)a4;
- (id)_notificationAttachmentsWithThumbnailFileURL:(id)a3 publisherLogoFileURL:(id)a4 publisherLogoCompactFileURL:(id)a5;
- (void)_notifyOfTagsWithNotificationAvailable:(id)a3;
- (void)_notifyOfTagsWithNotificationEnabled:(id)a3;
- (void)_scheduleLocalNotificationWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 userInfo:(id)a6 category:(id)a7 timeInterval:(double)a8;
- (void)autoEnableNotificationsForPreSubscribedChannels;
- (void)notifyDeviceTokenIsAvailable:(id)a3;
- (void)scheduleLocalNotificationForArticleID:(id)a3 completion:(id)a4;
- (void)scheduleLocalNotificationforChannels:(id)a3;
- (void)setAutoEnableNotificationsIsPending:(BOOL)a3;
- (void)setDeviceToken:(id)a3;
- (void)setNotificationAutoEnableHelper:(id)a3;
@end

@implementation FRNotificationManager

- (void)notifyDeviceTokenIsAvailable:(id)a3
{
  id v4 = a3;
  +[NSThread isMainThread];
  [(FRNotificationManager *)self setDeviceToken:v4];

  if ([(FRNotificationManager *)self autoEnableNotificationsIsPending])
  {
    [(FRNotificationManager *)self autoEnableNotificationsForPreSubscribedChannels];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v4[0] = @"notification_alert_frequency";
    v4[1] = FCNotificationChannelsRefreshFrequencyKey;
    v5[0] = &off_1000CFBD0;
    v5[1] = &off_1000CFBD0;
    v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
    v3 = +[NSUserDefaults standardUserDefaults];
    [v3 registerDefaults:v2];
  }
}

- (FRNotificationManager)initWithFeldsparContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FRNotificationManager;
  v6 = [(FRNotificationManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feldsparContext, a3);
  }

  return v7;
}

- (void)setDeviceToken:(id)a3
{
}

- (BOOL)autoEnableNotificationsIsPending
{
  return self->_autoEnableNotificationsIsPending;
}

- (void)autoEnableNotificationsForPreSubscribedChannels
{
  v3 = [(FRNotificationManager *)self deviceToken];

  if (v3)
  {
    [(FRNotificationManager *)self setAutoEnableNotificationsIsPending:0];
    id v4 = [FRNotificationAutoEnableHelper alloc];
    id v5 = [(FRNotificationManager *)self feldsparContext];
    v6 = [(FRNotificationAutoEnableHelper *)v4 initWithFeldsparContext:v5];
    [(FRNotificationManager *)self setNotificationAutoEnableHelper:v6];

    id v7 = [(FRNotificationManager *)self notificationAutoEnableHelper];
    [v7 autoEnableNotificationsForPreSubscribedChannels];
  }
  else
  {
    [(FRNotificationManager *)self setAutoEnableNotificationsIsPending:1];
  }
}

- (void)scheduleLocalNotificationforChannels:(id)a3
{
}

- (void)_notifyOfTagsWithNotificationAvailable:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (uint64_t)[v4 count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    id v7 = [v4 allObjects];
    v8 = [(FRNotificationManager *)self _identifierWithPrefix:@"LocalNotificationAvailable" tags:v7];

    objc_super v9 = +[NSBundle mainBundle];
    v10 = [v9 localizedStringForKey:@"Notifications Available" value:&stru_1000CABC0 table:0];

    CFStringRef v17 = @"LocalNotificationTypeKey";
    CFStringRef v18 = @"NotificationSupportType";
    v11 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    if (v6 == 1)
    {
      v12 = [v4 anyObject];
      v13 = +[NSBundle mainBundle];
      v14 = [v13 localizedStringForKey:@"%@ now offers notifications about important stories." value:&stru_1000CABC0 table:0];
      v15 = [v12 name];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
    }
    else
    {
      v12 = [v4 fc_arrayByTransformingWithBlock:&stru_1000C7DD0];
      v13 = [(FRNotificationManager *)self _combinedStringWithTagNames:v12];
      v14 = +[NSBundle mainBundle];
      v15 = [v14 localizedStringForKey:@"%@ now offer notifications in Apple News." value:&stru_1000CABC0 table:0];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v13);
    v16 = };

    [(FRNotificationManager *)self _scheduleLocalNotificationWithIdentifier:v8 title:v10 body:v16 userInfo:v11 category:FCNotificationChannelNotificationSupportCategory timeInterval:3.0];
  }
}

- (void)_notifyOfTagsWithNotificationEnabled:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 count] >= 1)
  {
    uint64_t v5 = [v4 allObjects];
    uint64_t v6 = [(FRNotificationManager *)self _identifierWithPrefix:@"LocalNotificationEnabled" tags:v5];

    id v7 = +[NSBundle mainBundle];
    v8 = [v7 localizedStringForKey:@"Notifications Now Available" value:&stru_1000CABC0 table:0];

    CFStringRef v15 = @"LocalNotificationTypeKey";
    CFStringRef v16 = @"NotificationSupportType";
    objc_super v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    v10 = [v4 fc_arrayByTransformingWithBlock:&stru_1000C7DF0];
    v11 = [(FRNotificationManager *)self _combinedStringWithTagNames:v10];
    v12 = +[NSBundle mainBundle];
    v13 = [v12 localizedStringForKey:@"%@ will start sending you notifications about important stories." value:&stru_1000CABC0 table:0];
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v11);

    [(FRNotificationManager *)self _scheduleLocalNotificationWithIdentifier:v6 title:v8 body:v14 userInfo:v9 category:FCNotificationChannelNotificationSupportCategory timeInterval:3.0];
  }
}

- (id)_combinedStringWithTagNames:(id)a3
{
  id v3 = a3;
  if ([v3 count] == (id)1)
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    id v5 = [v3 count];
    uint64_t v6 = +[NSBundle mainBundle];
    id v7 = v6;
    if (v5 == (id)2) {
      CFStringRef v8 = @"%@ and %@";
    }
    else {
      CFStringRef v8 = @"%@, %@, and others";
    }
    objc_super v9 = [v6 localizedStringForKey:v8 value:&stru_1000CABC0 table:0];
    v10 = [v3 objectAtIndexedSubscript:0];
    v11 = [v3 objectAtIndexedSubscript:1];
    id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v10, v11);
  }

  return v4;
}

- (id)_identifierWithPrefix:(id)a3 tags:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSMutableString) initWithString:v6];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100040900;
  v10[3] = &unk_1000C7E18;
  id v8 = v7;
  id v11 = v8;
  [v5 enumerateObjectsUsingBlock:v10];

  return v8;
}

- (void)scheduleLocalNotificationForArticleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FRNotificationManager *)self feldsparContext];
  objc_super v9 = [v8 cloudContext];
  v10 = [v9 articleController];
  id v21 = v7;
  id v11 = +[NSArray arrayWithObjects:&v21 count:1];
  v12 = [v10 headlinesFetchOperationForArticleIDs:v11];

  CFStringRef v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  CFStringRef v17 = sub_100040AD8;
  CFStringRef v18 = &unk_1000C7EF8;
  v19 = self;
  id v20 = v6;
  id v13 = v6;
  [v12 setFetchCompletionBlock:&v15];
  v14 = +[NSOperationQueue fc_sharedConcurrentQueue];
  [v14 addOperation:v12];
}

- (id)_notificationAttachmentsWithThumbnailFileURL:(id)a3 publisherLogoFileURL:(id)a4 publisherLogoCompactFileURL:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSMutableArray array];
  if (v7)
  {
    id v11 = [v7 path];
    v12 = +[UIImage imageWithContentsOfFile:v11];

    double v13 = 0.0;
    if (v12)
    {
      [v12 size];
      double v15 = v14;
      [v12 size];
      double v17 = v16;
      [v12 size];
      double v44 = v18;
      double v20 = v19;
      [v12 size];
      double v22 = v21;
      double v24 = v23;
      [v12 size];
      double v26 = v25;
      double v28 = v27;
      [v12 size];
      if (v15 <= v17)
      {
        double v13 = (v20 - v22) / v28;
        double v34 = 1.0;
        double v33 = 1.0 - (v20 - v22 + v20 - v22) / v30;
        double v32 = 0.0;
      }
      else
      {
        double v31 = v29;
        double v32 = (v44 - v24) / v26;
        double v33 = 1.0;
        double v34 = 1.0 - (v44 - v24 + v44 - v24) / v31;
      }
    }
    else
    {
      double v34 = 1.0;
      double v32 = 0.0;
      double v33 = 1.0;
    }
    v52[0] = UNNotificationAttachmentOptionsThumbnailClippingRectKey;
    double v35 = v13;
    v52[1] = UNNotificationAttachmentOptionsTypeHintKey;
    v53[0] = CGRectCreateDictionaryRepresentation(*(CGRect *)&v32);
    v53[1] = kUTTypeJPEG;
    v36 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:2];
    uint64_t v47 = 0;
    v37 = +[UNNotificationAttachment attachmentWithIdentifier:NSSNotificationAttachmentThumbnailKey URL:v7 options:v36 error:&v47];
    if (v37) {
      [v10 addObject:v37];
    }
  }
  if (v8)
  {
    v50[0] = UNNotificationAttachmentOptionsTypeHintKey;
    v50[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
    v51[0] = kUTTypePNG;
    v51[1] = &__kCFBooleanTrue;
    v38 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
    uint64_t v46 = 0;
    v39 = +[UNNotificationAttachment attachmentWithIdentifier:NSSNotificationAttachmentPublisherLogoKey URL:v8 options:v38 error:&v46];
    if (v39) {
      [v10 addObject:v39];
    }
  }
  if (v9)
  {
    v48[0] = UNNotificationAttachmentOptionsTypeHintKey;
    v48[1] = UNNotificationAttachmentOptionsThumbnailHiddenKey;
    v49[0] = kUTTypePNG;
    v49[1] = &__kCFBooleanTrue;
    v40 = +[NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
    uint64_t v45 = 0;
    v41 = +[UNNotificationAttachment attachmentWithIdentifier:NSSNotificationAttachmentPublisherLogoCompactKey URL:v9 options:v40 error:&v45];
    if (v41) {
      [v10 addObject:v41];
    }
  }
  id v42 = [v10 copy];

  return v42;
}

- (void)_scheduleLocalNotificationWithIdentifier:(id)a3 title:(id)a4 body:(id)a5 userInfo:(id)a6 category:(id)a7 timeInterval:(double)a8
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v22 = objc_alloc_init((Class)UNMutableNotificationContent);
  [v22 setTitle:v16];

  [v22 setBody:v15];
  [v22 setUserInfo:v14];

  [v22 setCategoryIdentifier:v13];
  double v18 = +[UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0 repeats:a8];
  double v19 = +[UNNotificationRequest requestWithIdentifier:v17 content:v22 trigger:v18];

  double v20 = +[UNUserNotificationCenter currentNotificationCenter];
  [v20 removeAllPendingNotificationRequests];

  double v21 = +[UNUserNotificationCenter currentNotificationCenter];
  [v21 addNotificationRequest:v19 withCompletionHandler:&stru_1000C7F18];
}

- (FRFeldsparContext)feldsparContext
{
  return self->_feldsparContext;
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (void)setAutoEnableNotificationsIsPending:(BOOL)a3
{
  self->_autoEnableNotificationsIsPending = a3;
}

- (FRNotificationAutoEnableHelper)notificationAutoEnableHelper
{
  return self->_notificationAutoEnableHelper;
}

- (void)setNotificationAutoEnableHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationAutoEnableHelper, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);

  objc_storeStrong((id *)&self->_feldsparContext, 0);
}

@end