@interface CKCustomPluginNotificationViewController
+ (id)customNotificationManagerForBalloonBundleID:(id)a3;
+ (void)connectIfNeeded;
- (CGSize)preferredContentSize;
- (CKCustomPluginNotificationViewController)init;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)loadView;
@end

@implementation CKCustomPluginNotificationViewController

+ (void)connectIfNeeded
{
  if (qword_100010A90 != -1) {
    dispatch_once(&qword_100010A90, &stru_10000C568);
  }
}

- (CKCustomPluginNotificationViewController)init
{
  v4.receiver = self;
  v4.super_class = (Class)CKCustomPluginNotificationViewController;
  v2 = [(CKCustomPluginNotificationViewController *)&v4 init];
  if (v2) {
    [(id)objc_opt_class() connectIfNeeded];
  }
  return v2;
}

- (void)loadView
{
  id v4 = objc_alloc_init((Class)UIView);
  v3 = +[UIColor clearColor];
  [v4 setBackgroundColor:v3];

  [(CKCustomPluginNotificationViewController *)self setView:v4];
}

- (CGSize)preferredContentSize
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)customNotificationManagerForBalloonBundleID:(id)a3
{
  id v3 = a3;
  id v4 = IMBalloonExtensionIDWithSuffix();
  unsigned int v5 = [v3 isEqualToString:v4];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Using AskTo custom notification manager for balloon bundle ID %@", (uint8_t *)&v11, 0xCu);
      }
    }
    v8 = +[CKAskToNotificationManager sharedManager];
  }
  else
  {
    if (v6)
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No custom notification manager for balloon bundle ID %@", (uint8_t *)&v11, 0xCu);
      }
    }
    v8 = 0;
  }

  return v8;
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 request];
  int v6 = [v5 content];
  v7 = [v6 userInfo];

  v8 = [v7 objectForKeyedSubscript:@"CKBBContextKeyBalloonBundleID"];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received notification for balloon bundle ID %@", (uint8_t *)&v18, 0xCu);
    }
  }
  v10 = +[CKCustomPluginNotificationViewController customNotificationManagerForBalloonBundleID:v8];
  int v11 = [v10 notificationActionsFromNotification:v4];
  BOOL v12 = [v11 count] == 0;
  int v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Custom notification manager returned no actions for balloon bundle ID %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    if (v13)
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v11 count];
        int v18 = 134218242;
        id v19 = v15;
        __int16 v20 = 2112;
        v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Custom notification manager returned %li actions for balloon bundle ID %@", (uint8_t *)&v18, 0x16u);
      }
    }
    v16 = [(CKCustomPluginNotificationViewController *)self extensionContext];
    [v16 setNotificationActions:v11];
  }
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 notification];
  v8 = [v7 request];
  v9 = [v8 content];
  v10 = [v9 userInfo];

  int v11 = [v10 objectForKeyedSubscript:@"CKBBContextKeyBalloonBundleID"];
  if (IMOSLoggingEnabled())
  {
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received notification response for balloon bundle ID %@", (uint8_t *)&v14, 0xCu);
    }
  }
  int v13 = +[CKCustomPluginNotificationViewController customNotificationManagerForBalloonBundleID:v11];
  [v13 handleResponse:v5 completion:v6];
}

@end