@interface SMSApplicationDelegate
+ (id)addMessagesFileProviderDomain:(id *)a3;
+ (id)logHandle;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)isBulletinSuppressed:(id)a3 messageContexts:(id)a4;
- (BOOL)isFromFilteredSender:(id)a3 fromSender:(id)a4;
- (BOOL)shouldGetBulletinSuppressedStateFromHelper;
- (CKSceneController)sceneController;
- (SMSApplicationDelegate)init;
- (SMSApplicationSoundHelper)soundHelper;
- (id)_sceneIDForChat:(id)a3;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (id)extractValueFromURL:(id)a3 forKey:(id)a4;
- (id)logHandle;
- (id)smsApplication;
- (id)swiftui_rootViewForSimplifiedApplicationProvider;
- (void)_clearFailureBadge;
- (void)_messageReceived:(id)a3;
- (void)_messageSendFailed:(id)a3;
- (void)_messageSent:(id)a3;
- (void)_playMessageReceivedForMessage:(id)a3 inChat:(id)a4;
- (void)_resetIdleTimer;
- (void)applicationSignificantTimeChange:(id)a3;
- (void)dealloc;
- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5;
- (void)setSceneController:(id)a3;
- (void)setShouldGetBulletinSuppressedStateFromHelper:(BOOL)a3;
- (void)setSoundHelper:(id)a3;
@end

@implementation SMSApplicationDelegate

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  v4 = +[NSUserDefaults standardUserDefaults];
  [v4 registerDefaults:&off_100034E10];

  +[CKApplicationState setMainWindowForegroundActive:1];
  return 1;
}

- (SMSApplicationDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)SMSApplicationDelegate;
  v2 = [(SMSApplicationDelegate *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)SMSApplicationSoundHelper);
    [(SMSApplicationDelegate *)v2 setSoundHelper:v3];

    id v4 = objc_alloc_init((Class)CKSceneController);
    [(SMSApplicationDelegate *)v2 setSceneController:v4];

    if (IMSupportsUserNotifications())
    {
      v5 = +[UNUserNotificationCenter currentNotificationCenter];
      v6 = [(SMSApplicationDelegate *)v2 sceneController];
      [v5 setDelegate:v6];
    }
  }
  return v2;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  kdebug_trace();
  v5 = IMClientTelemetryLogHandle();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ClientLaunchToViewAppears", " enableTelemetry=YES ", buf, 2u);
  }

  v6 = +[NSNotificationCenter defaultCenter];
  if (qword_10003AEF0 != -1) {
    dispatch_once(&qword_10003AEF0, &stru_100031100);
  }
  dispatch_time_t v7 = dispatch_time(0, 2500000000);
  objc_super v8 = dispatch_get_global_queue(9, 0);
  dispatch_after(v7, v8, &stru_100031160);

  id v9 = +[IMSWHighlightCenterController sharedControllerWithAppIdentifier:@"com.apple.MobileSMS"];
  v10 = [(SMSApplicationDelegate *)self logHandle];
  v11 = [(SMSApplicationDelegate *)self logHandle];
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, "IMCoreSetup");

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v12, "IMCoreSetup", " enableTelemetry=YES ", buf, 2u);
  }

  v13 = +[IMDaemonController sharedInstance];
  [v13 blockUntilConnected];

  v14 = [(SMSApplicationDelegate *)self logHandle];
  v15 = [(SMSApplicationDelegate *)self logHandle];
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, "IMCoreSetup");

  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v16, "IMCoreSetup", " enableTelemetry=YES ", buf, 2u);
  }

  v17 = +[IMSystemMonitor sharedInstance];
  [v17 setActive:1];

  [v6 addObserver:self selector:"_messageReceived:" name:IMChatMessageReceivedNotification object:0];
  [v6 addObserver:self selector:"_messageSent:" name:IMChatRegistryMessageSentNotification object:0];
  v18 = +[IMChatRegistry sharedRegistry];
  [v18 _setPostMessageSentNotifications:1];

  [v6 addObserver:self selector:"_messageSendFailed:" name:IMChatMessageSendFailedNotification object:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CKClientDidResumeNotification, 0, 0, 1u);
  [(SMSApplicationDelegate *)self _clearFailureBadge];
  CKPrewarmLaunch();
  dispatch_time_t v20 = dispatch_time(0, 15000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BEB8;
  block[3] = &unk_100030A30;
  block[4] = self;
  dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, block);

  return 1;
}

- (id)logHandle
{
  v2 = objc_opt_class();

  return [v2 logHandle];
}

+ (id)logHandle
{
  if (qword_10003AEE8 != -1) {
    dispatch_once(&qword_10003AEE8, &stru_1000310E0);
  }
  v2 = (void *)qword_10003AEE0;

  return v2;
}

- (void)setSoundHelper:(id)a3
{
}

- (void)setSceneController:(id)a3
{
}

- (CKSceneController)sceneController
{
  return self->_sceneController;
}

- (void)_clearFailureBadge
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kMessagesBadgeControllerClearFailureBadgeNotification", 0, 0, 1u);
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SMSApplicationDelegate;
  [(SMSApplicationDelegate *)&v4 dealloc];
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v43 = a3;
  id v45 = a4;
  id v44 = a5;
  if (IMOSLoggingEnabled())
  {
    objc_super v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v53 = v45;
      __int16 v54 = 2112;
      id v55 = v44;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Application will create scene with session: %@ connectionOptions: %@", buf, 0x16u);
    }
  }
  id v9 = [v45 role];
  unsigned int v10 = [v9 isEqualToString:UIWindowSceneSessionRoleExternalDisplayNonInteractive];

  if (v10) {
    goto LABEL_9;
  }
  v11 = [v45 role];
  unsigned int v12 = [v11 isEqualToString:@"CPTemplateApplicationSceneSessionRoleApplication"];

  if (v12
    || ([v45 role],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [v13 isEqualToString:_UIWindowSceneSessionRoleSimplifiedApplication],
        v13,
        v14))
  {
LABEL_9:
    id v15 = [v45 configuration];
    goto LABEL_10;
  }
  id v17 = (id)objc_opt_class();
  v18 = [v44 URLContexts];
  v42 = [v18 anyObject];

  v41 = [v42 URL];
  v40 = [(SMSApplicationDelegate *)self extractValueFromURL:v41 forKey:@"overlay"];
  if ([v40 isEqualToString:@"1"]) {
    id v17 = (id)objc_opt_class();
  }
  v39 = [v44 userActivities];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v19 = [v39 allObjects];
  id v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v48;
    uint64_t v22 = ShowDebugViewActivity;
    uint64_t v46 = ShowMessageInspectorActivity;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v25 = [v24 activityType];
        unsigned int v26 = [v25 isEqualToString:@"com.apple.Messages.StateRestoration"];

        if (v26)
        {
          if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v53 = v24;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "State restoration user activity found in user activities dictionaries set: %@", buf, 0xCu);
            }
          }
          v28 = [v24 userInfo];
          v29 = [v28 objectForKeyedSubscript:@"CKCanvasStateRestorationContainerType"];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = +[CKSceneDelegate containerClassForType:](CKSceneDelegate, "containerClassForType:", [v29 integerValue]);
            if (IMOSLoggingEnabled())
            {
              v30 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v53 = v17;
                _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "User activity has delegate class: %@", buf, 0xCu);
              }
            }
          }
        }
        else
        {
          v31 = [v24 activityType];
          if ([v31 isEqualToString:v22])
          {
          }
          else
          {
            v32 = [v24 activityType];
            unsigned int v33 = [v32 isEqualToString:v46];

            if (!v33) {
              continue;
            }
          }
          id v17 = (id)objc_opt_class();
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v47 objects:v51 count:16];
    }
    while (v20);
  }

  v34 = [v45 configuration];
  id v35 = objc_alloc((Class)UISceneConfiguration);
  v36 = [v34 name];
  v37 = [v34 role];
  id v15 = [v35 initWithName:v36 sessionRole:v37];

  [v15 setDelegateClass:v17];
  [v15 setSceneClass:[v34 sceneClass]];
  if (IMOSLoggingEnabled())
  {
    v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v15;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Returning scene configuration: %@", buf, 0xCu);
    }
  }
LABEL_10:

  return v15;
}

- (void)applicationSignificantTimeChange:(id)a3
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  [v3 invalidateTranscriptDrawerWidth];
}

- (void)session:(id)a3 bag:(id)a4 didLoadWithError:(id)a5
{
  if (!a5)
  {
    id v6 = +[NSUserDefaults standardUserDefaults];
    [v6 setBool:1 forKey:@"kHasSetupHashtagImages"];
  }
}

- (void)_messageReceived:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 object];
  id v6 = [v4 userInfo];
  dispatch_time_t v7 = [v6 objectForKey:IMChatValueKey];

  objc_super v8 = [v7 guid];
  if ([v7 isRead])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not playing message receive sound for message that is already read: %@", buf, 0xCu);
      }
LABEL_15:
    }
  }
  else if ([v7 isFromMe])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not playing message receive sound for message that is from me: %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
  }
  else if ([v5 isMuted])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unsigned int v10 = [v5 guid];
        *(_DWORD *)buf = 138412546;
        id v20 = v8;
        __int16 v21 = 2112;
        uint64_t v22 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not playing message receive sound for chat that is muted. MessageGuid: %@ ChatGuid: %@", buf, 0x16u);
      }
      goto LABEL_15;
    }
  }
  else
  {
    v11 = [v7 sender];
    if ([(SMSApplicationDelegate *)self isFromFilteredSender:v5 fromSender:v11])
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [v11 ID];
          *(_DWORD *)buf = 138412546;
          id v20 = v8;
          __int16 v21 = 2112;
          uint64_t v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Not playing message receive sound for message that is from a filtered sender. MessageGuid: %@ Sender: %@", buf, 0x16u);
        }
      }
    }
    else if (+[NSThread isMainThread])
    {
      [(SMSApplicationDelegate *)self _playMessageReceivedForMessage:v7 inChat:v5];
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001C4DC;
      block[3] = &unk_100030A58;
      block[4] = self;
      id v17 = v7;
      id v18 = v5;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
    unsigned int v14 = +[CKUIBehavior sharedBehaviors];
    unsigned int v15 = [v14 resetsIdleTimer];

    if (v15) {
      [(SMSApplicationDelegate *)self _resetIdleTimer];
    }
  }
}

- (void)_messageSent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 object];
  if (([v4 isMuted] & 1) == 0)
  {
    uint64_t v5 = [v3 userInfo];
    id v6 = [v5 objectForKeyedSubscript:IMChatRegistryMessageSendIsReplicatingKey];
    unsigned __int8 v7 = [v6 BOOLValue];

    if ((v7 & 1) == 0)
    {
      objc_super v8 = [v3 userInfo];
      id v9 = [v8 objectForKeyedSubscript:IMChatRegistryMessageSentMessageKey];

      id v10 = v9;
      im_main_thread();
    }
  }
}

- (void)_messageSendFailed:(id)a3
{
  id v4 = [a3 userInfo];
  id v30 = [v4 objectForKey:IMChatValueKey];

  uint64_t v5 = [v30 error];
  id v6 = [v5 code];

  unsigned __int8 v7 = v30;
  if (v6)
  {
    objc_super v8 = [v30 sender];
    id v9 = [v8 service];

    id v10 = +[IMMobileNetworkManager sharedInstance];
    unsigned int v11 = [v10 isAirplaneModeEnabled];
    unsigned __int8 v12 = [v10 isWiFiEnabled];
    if (v11)
    {
      unsigned __int8 v13 = v12;
      if ((objc_msgSend(v9, "__ck_isCarrierBased") & 1) != 0
        || (v13 & 1) == 0 && objc_msgSend(v9, "__ck_isiMessage"))
      {
        int v14 = MGGetBoolAnswer();
        unsigned int v15 = CKFrameworkBundle();
        os_signpost_id_t v16 = v15;
        if (v14) {
          CFStringRef v17 = @"TURN_OFF_AIRPLANE_MODE_OR_TURN_ON_WLAN";
        }
        else {
          CFStringRef v17 = @"TURN_OFF_AIRPLANE_MODE_OR_TURN_ON_WIFI";
        }
        v29 = [v15 localizedStringForKey:v17 value:&stru_100031290 table:@"ChatKit"];

        id v18 = +[CKAlertController alertControllerWithTitle:v29 message:0 preferredStyle:1];
        v19 = CKFrameworkBundle();
        id v20 = [v19 localizedStringForKey:@"OK" value:&stru_100031290 table:@"ChatKit"];
        __int16 v21 = +[CKAlertAction actionWithTitle:v20 style:1 handler:0];

        uint64_t v22 = CKFrameworkBundle();
        v23 = [v22 localizedStringForKey:@"SETTINGS" value:&stru_100031290 table:@"ChatKit"];
        v24 = +[CKAlertAction actionWithTitle:v23 style:0 handler:&stru_1000311A0];

        [v18 addAction:v21];
        [v18 addAction:v24];
        v25 = [(SMSApplicationDelegate *)self sceneController];
        unsigned int v26 = [v25 messagesSceneDelegate];
        v27 = [v26 window];

        v28 = [v27 rootViewController];
        [v18 presentFromViewController:v28 animated:1 completion:0];
        +[CKStarkManager isCarPlayConnected];
      }
    }

    unsigned __int8 v7 = v30;
  }
}

- (void)_playMessageReceivedForMessage:(id)a3 inChat:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[NSThread isMainThread])
  {
    id v43 = +[NSAssertionHandler currentHandler];
    [v43 handleFailureInMethod:a2 object:self file:@"SMSApplicationDelegate.m" lineNumber:426 description:@"Should be running on main thread."];
  }
  id v9 = [v7 guid];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v49 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Message %@ received. Determining if we should play in-app message received sound", buf, 0xCu);
    }
  }
  unsigned int v11 = [(SMSApplicationDelegate *)self soundHelper];
  [v11 stopPlayingAlert];
  unsigned __int8 v12 = +[UIApplication sharedApplication];
  unsigned int v13 = [v12 isSuspended];

  unsigned int v14 = +[CKApplicationState isApplicationActive];
  if (CKIsRunningInMacCatalyst()) {
    unsigned int v15 = (void *)v14;
  }
  else {
    unsigned int v15 = (void *)(v13 ^ 1);
  }
  if (IMOSLoggingEnabled())
  {
    os_signpost_id_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      long long v49 = v15;
      __int16 v50 = 2048;
      unint64_t v51 = v13;
      __int16 v52 = 2048;
      uint64_t v53 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "For receive sound playblack, Messages isActive: %ld. (isAppSuspended: %ld, isAppStateActive: %ld)", buf, 0x20u);
    }
  }
  if (v15)
  {
    CFStringRef v17 = [v8 persistentID];
    id v18 = [v8 personCentricID];
    v19 = CKSuppressionContextsForIdentifiers();
    id v20 = [(SMSApplicationDelegate *)self sceneController];
    __int16 v21 = [v20 alertSuppressionContextsFromForegroundActiveScenes];

    if (![(SMSApplicationDelegate *)self isBulletinSuppressed:v21 messageContexts:v19])
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_75:

        goto LABEL_80;
      }
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v49 = v9;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "System notification is not suppressed for %@, letting notifications play sound", buf, 0xCu);
      }
LABEL_25:

      goto LABEL_75;
    }
    unsigned __int8 v22 = [v11 allowedByScreenTimeToPlayReceiveSoundForChat:v8];
    int v23 = CKIsSuppressingReceiveSoundForMessageGUID();
    if ((v22 & 1) == 0)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_61;
      }
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v49 = v9;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Message %@ will not play sound due to screentime suppression", buf, 0xCu);
      }
      goto LABEL_21;
    }
    if (v23)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_61:
        if (!IMOSLoggingEnabled()) {
          goto LABEL_75;
        }
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v49 = v9;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Not playing sound for message: %@", buf, 0xCu);
        }
        goto LABEL_25;
      }
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v49 = v9;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Message %@ will not play sound due to sound being suppressed for that message guid", buf, 0xCu);
      }
LABEL_21:

      goto LABEL_61;
    }
    long long v47 = +[IMFocusStateManager sharedManager];
    if (![v47 shouldFilterConversationsByFocus])
    {
LABEL_37:

      unsigned __int8 v31 = [v7 __ck_isAcknowledgmentMessage];
      if ([v21 containsObject:v17])
      {
        if ((v31 & 1) == 0)
        {
LABEL_51:
          uint64_t v33 = 1;
          goto LABEL_70;
        }
      }
      else
      {
        id v32 = [v21 containsObject:v18];
        uint64_t v33 = (uint64_t)v32;
        if ((v31 & 1) == 0)
        {
LABEL_70:
          if (IMOSLoggingEnabled())
          {
            v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              long long v49 = v9;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Playing standard incoming message sound for message: %@", buf, 0xCu);
            }
          }
          [v11 playIncomingMessageSoundAndHapticForMessage:v7 messageIsForCurrentTranscript:v33];
          goto LABEL_75;
        }
        if (!v32)
        {
          if (IMOSLoggingEnabled())
          {
            v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              long long v49 = v9;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Message %@ is a received tapback, but the chat for this message is not currently visible. Attempting fall back to standard incoming message sound.", buf, 0xCu);
            }
          }
          uint64_t v33 = 0;
          goto LABEL_70;
        }
      }
      if (IMOSLoggingEnabled())
      {
        v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v49 = v9;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Playing tapback message sound for message: %@", buf, 0xCu);
        }
      }
      if ([v11 playTapbackReceivedSoundForMessageInCurrentTranscript:v7]) {
        goto LABEL_75;
      }
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v49 = v9;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Message %@ is a received tapback, but did not generate a tapback sound. Attempting fall back to standard incoming message sound.", buf, 0xCu);
        }
      }
      goto LABEL_51;
    }
    unsigned __int8 v26 = [v47 chatMatchesActiveFocusMode:v8];
    unsigned __int8 v27 = [v47 senderMatchesActiveFocusModeForMessage:v7];
    int v28 = IMOSLoggingEnabled();
    if (v26)
    {
      if (v27)
      {
        if (v28)
        {
          v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = [v8 guid];
            *(_DWORD *)buf = 138412546;
            long long v49 = v9;
            __int16 v50 = 2112;
            unint64_t v51 = (unint64_t)v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Conversations are being filtered by focus, but message %@ is part of chat %@ which is allowed in the active focus, so allowing received message sound to play.", buf, 0x16u);
          }
        }
        goto LABEL_37;
      }
      if (v28)
      {
        v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v38 = [v7 sender];
          uint64_t v46 = [v38 ID];
          uint64_t v39 = [v8 guid];
          id v45 = v38;
          *(_DWORD *)buf = 138412802;
          long long v49 = v9;
          __int16 v50 = 2112;
          unint64_t v51 = (unint64_t)v46;
          __int16 v52 = 2112;
          uint64_t v53 = v39;
          v40 = (void *)v39;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Conversations are being filtered by focus. Message %@ is from sender %@ in chat %@. The chat is allowed by focus, but this sender is not, so not allowing received message sound to play.", buf, 0x20u);
        }
LABEL_59:
      }
    }
    else if (v28)
    {
      v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = [v8 guid];
        *(_DWORD *)buf = 138412546;
        long long v49 = v9;
        __int16 v50 = 2112;
        unint64_t v51 = (unint64_t)v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Conversations are being filtered by focus. Message %@ is part of chat %@ which is not allowed in the active focus, so not allowing received message sound to play.", buf, 0x16u);
      }
      goto LABEL_59;
    }

    goto LABEL_61;
  }
  if (IMOSLoggingEnabled())
  {
    id v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v49 = v9;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "App is not active, letting Notifications play sound for %@", buf, 0xCu);
    }
  }
LABEL_80:
}

- (BOOL)isBulletinSuppressed:(id)a3 messageContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SMSApplicationDelegate *)self shouldGetBulletinSuppressedStateFromHelper])
  {
    id v8 = [(SMSApplicationDelegate *)self soundHelper];
    LODWORD(self) = [v8 bulletinSuppressed];

    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 134217984;
        uint64_t v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Forced notification suppression state is %ld. (This is a unit testing path).", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    id v10 = [(SMSApplicationDelegate *)self sceneController];
    LOBYTE(self) = [v10 shouldSuppressNotificationForMessageWithRelevantContext:v7 withAlertSupressionContextForScenes:v6];
  }
  return (char)self;
}

- (void)_resetIdleTimer
{
  v2 = +[UIApplication sharedApplication];
  [v2 setIdleTimerDisabled:1];

  id v3 = +[UIApplication sharedApplication];
  [v3 setIdleTimerDisabled:0];
}

- (id)smsApplication
{
  v2 = +[UIApplication sharedApplication];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)isFromFilteredSender:(id)a3 fromSender:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 supportsFilteringExtensions];
  id v7 = [v5 lastFinishedMessageItem];
  id v8 = [v7 service];
  id v9 = +[IMService serviceWithName:v8];

  [v9 supportsCapability:IMServiceCapabilitySpamFilteringExtensions];
  if (([v5 isCategorized] & 1) == 0)
  {
    id v10 = [v5 valueForChatProperty:kWasDetectedAsiMessageSpam];
    [v10 BOOLValue];
  }
  [v5 isFiltered];
  unsigned int v11 = [v6 cnContactWithKeys:&__NSArray0__struct];

  +[IMContactStore isCNContactAKnownContact:v11];
  BOOL v12 = CKMessageIsFromFilteredSenderIsUnderFirstUnlock() != 0;

  return v12;
}

- (id)extractValueFromURL:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSMutableDictionary dictionary];
  id v8 = [v6 resourceSpecifier];

  if ([v8 hasPrefix:@"//"])
  {
    uint64_t v9 = [v8 substringFromIndex:2];

    id v8 = (void *)v9;
  }
  id v10 = +[NSString stringWithFormat:@"sms:/open?address=%@", v8];
  unsigned int v11 = +[NSURL URLWithString:v10];

  BOOL v12 = [v11 absoluteString];
  id v13 = (id)ExtractURLQueries();

  unsigned int v14 = [v7 objectForKey:v5];

  return v14;
}

+ (id)addMessagesFileProviderDomain:(id *)a3
{
  uint64_t v14 = 0;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  CFStringRef v17 = sub_10001DA50;
  id v18 = sub_10001DA60;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  unsigned int v11 = sub_10001DA50;
  BOOL v12 = sub_10001DA60;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001DA68;
  v7[3] = &unk_1000311F0;
  v7[4] = &v8;
  v7[5] = &v14;
  if (qword_10003AEF8 == -1)
  {
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  dispatch_once(&qword_10003AEF8, v7);
  if (a3) {
LABEL_3:
  }
    *a3 = (id) v15[5];
LABEL_4:
  if (v15[5]) {
    id v4 = 0;
  }
  else {
    id v4 = (void *)v9[5];
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);

  return v5;
}

- (id)_sceneIDForChat:(id)a3
{
  id v32 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v3 = +[UIApplication sharedApplication];
  id obj = [v3 connectedScenes];

  id v4 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (!v4)
  {

LABEL_29:
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        unsigned __int8 v27 = [v32 chatIdentifier];
        *(_DWORD *)buf = 138412290;
        id v40 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "SMSApplication | Cant find sceneID for chatID: %@", buf, 0xCu);
      }
    }
    id v12 = 0;
    int v23 = 0;
    goto LABEL_40;
  }
  id v6 = 0;
  uint64_t v34 = *(void *)v36;
  *(void *)&long long v5 = 138412290;
  long long v31 = v5;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v36 != v34) {
      objc_enumerationMutation(obj);
    }
    uint64_t v8 = *(void **)(*((void *)&v35 + 1) + 8 * v7);
    uint64_t v9 = [v8 delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_15;
    }
    unsigned int v11 = [v8 delegate];
    if ([v11 type])
    {
      id v12 = v6;
    }
    else
    {
      id v13 = [v8 session];
      id v12 = [v13 persistentIdentifier];

      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v31;
          id v40 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Main window sceneID: %@", buf, 0xCu);
        }
      }
    }
    unsigned int v15 = [v11 conversation];
    uint64_t v16 = [v15 chat];
    CFStringRef v17 = [v16 chatIdentifier];
    id v18 = [v32 chatIdentifier];
    unsigned int v19 = [v17 isEqualToString:v18];

    if (v19) {
      break;
    }

    id v6 = v12;
LABEL_15:
    if (v4 == (id)++v7)
    {
      id v4 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v4) {
        goto LABEL_3;
      }

      if (!v6) {
        goto LABEL_29;
      }
LABEL_35:
      if (IMOSLoggingEnabled())
      {
        int v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          v29 = [v32 chatIdentifier];
          *(_DWORD *)buf = 138412546;
          id v40 = v29;
          __int16 v41 = 2112;
          v42 = v6;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "No scene associated with chat %@, using main window sceneID: %@", buf, 0x16u);
        }
      }
      id v12 = v6;
      int v23 = v12;
      goto LABEL_40;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v11 type];
      *(_DWORD *)buf = 134217984;
      id v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "sceneDelegate type: %ld", buf, 0xCu);
    }
  }
  unsigned __int8 v22 = [v8 session];
  int v23 = [v22 persistentIdentifier];

  if (!v23)
  {
    id v6 = v12;
    if (!v12) {
      goto LABEL_29;
    }
    goto LABEL_35;
  }
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [v32 chatIdentifier];
      *(_DWORD *)buf = 138412546;
      id v40 = v23;
      __int16 v41 = 2112;
      v42 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "found sceneID: %@ for chatID: %@", buf, 0x16u);
    }
  }
LABEL_40:

  return v23;
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  NSClassFromString(@"CKClarityUIRootViewProvider");
  v2 = objc_opt_new();

  return v2;
}

- (SMSApplicationSoundHelper)soundHelper
{
  return self->_soundHelper;
}

- (BOOL)shouldGetBulletinSuppressedStateFromHelper
{
  return self->_shouldGetBulletinSuppressedStateFromHelper;
}

- (void)setShouldGetBulletinSuppressedStateFromHelper:(BOOL)a3
{
  self->_shouldGetBulletinSuppressedStateFromHelper = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_soundHelper, 0);

  objc_storeStrong((id *)&self->_sceneController, 0);
}

@end