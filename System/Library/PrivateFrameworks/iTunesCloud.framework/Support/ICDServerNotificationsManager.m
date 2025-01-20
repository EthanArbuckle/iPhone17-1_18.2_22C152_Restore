@interface ICDServerNotificationsManager
- (ICDServerNotificationsManager)initWithDelegate:(id)a3;
- (ICDServerNotificationsManagerDelegate)delegate;
- (void)_didReceiveDarwinNotification:(id)a3;
- (void)_didReceiveDistributedNotification:(id)a3 withStreamEvent:(id)a4;
- (void)_didReceiveTelephonyCenterNotification:(id)a3;
- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3;
- (void)_handleAllowsExplicitContentChangedNotification:(id)a3;
- (void)_handleAllowsMusicVideosChangedNotification:(id)a3;
- (void)_handleApplicationRegistration:(BOOL)a3 notificationName:(id)a4 streamEvent:(id)a5;
- (void)_handleCloudAuthenticationDidChangeNotification;
- (void)_handleFamilyCircleChangedNotification;
- (void)_handleFamilyContentDeletionNotification:(id)a3 streamEvent:(id)a4;
- (void)_handleFirstUnlockNotification:(id)a3;
- (void)_handleHandlerCoordinatorDidFinishInitialization:(id)a3;
- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3;
- (void)_handleMusicSettingsChangedNotification;
- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handlePlayActivityFlushInternalTestRequestNotification;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_setupNotifications;
- (void)_tearDownNotifications;
- (void)dealloc;
@end

@implementation ICDServerNotificationsManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_xpcStreamHandlerQueue, 0);
}

- (ICDServerNotificationsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDServerNotificationsManagerDelegate *)WeakRetained;
}

- (void)_handleFamilyCircleChangedNotification
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received family circle changed notification", v5, 2u);
  }

  v4 = [(ICDServerNotificationsManager *)self delegate];
  [v4 notificationsManagerDidReceiveFamilyCircleChangedNotification:self];
}

- (void)_handleMusicSettingsChangedNotification
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received music settings changed notification", v5, 2u);
  }

  v4 = [(ICDServerNotificationsManager *)self delegate];
  [v4 notificationsManagerDidReceiveMusicSettingsChangedNotification:self];
}

- (void)_handlePlayActivityFlushInternalTestRequestNotification
{
  id v3 = [(ICDServerNotificationsManager *)self delegate];
  [v3 notificationsManagerDidRecieveICPlayActivityFlushInternalTestRequestNotification:self];
}

- (void)_handleFamilyContentDeletionNotification:(id)a3 streamEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
  {
    id v9 = objc_alloc_init((Class)NSMutableArray);
    v10 = xpc_dictionary_get_value(v8, "UserInfo");
    v11 = v10;
    if (v10 && xpc_get_type(v10) == (xpc_type_t)&_xpc_type_dictionary)
    {
      v12 = xpc_dictionary_get_value(v11, "pairs");
      v13 = v12;
      if (v12 && xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary)
      {
        v17 = _NSConcreteStackBlock;
        uint64_t v18 = 3221225472;
        v19 = sub_1000406E4;
        v20 = &unk_1001BA458;
        id v21 = v9;
        xpc_array_apply(v13, &v17);
      }
    }
    CFStringRef v22 = @"ICDServerNotificationsManagerFamilyEventKey";
    id v23 = v9;
    v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, v17, v18, v19, v20);
    v15 = +[NSNotification notificationWithName:v6 object:0 userInfo:v14];

    v16 = [(ICDServerNotificationsManager *)self delegate];
    [v16 notificationsManager:self didReceiveFamilyDeletionEventNotification:v15];
  }
}

- (void)_handleApplicationRegistration:(BOOL)a3 notificationName:(id)a4 streamEvent:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init((Class)NSMutableSet);
  v11 = xpc_dictionary_get_value(v9, "UserInfo");
  if (v11 && !xpc_dictionary_get_BOOL(v11, (const char *)[@"isPlaceholder" UTF8String]))
  {
    v12 = xpc_dictionary_get_array(v11, (const char *)[@"bundleIDs" UTF8String]);
    v13 = v12;
    if (v12)
    {
      size_t count = xpc_array_get_count(v12);
      if (count)
      {
        size_t v15 = count;
        for (size_t i = 0; i != v15; ++i)
        {
          string = xpc_array_get_string(v13, i);
          if (string)
          {
            uint64_t v18 = +[NSString stringWithUTF8String:string];
            if (v18) {
              [v10 addObject:v18];
            }
          }
        }
      }
    }
  }
  if ([v10 count])
  {
    if (v6) {
      v19 = &off_1001CBC60;
    }
    else {
      v19 = &off_1001CBC78;
    }
    v24[0] = @"ICDServerNotificationsManagerIsApplicationRegistrationKey";
    v24[1] = @"ICDServerNotificationsManagerApplicationRegistrationBundleIDsKey";
    v25[0] = v19;
    id v20 = [v10 copy];
    v25[1] = v20;
    id v21 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    CFStringRef v22 = +[NSNotification notificationWithName:v8 object:0 userInfo:v21];

    id v23 = [(ICDServerNotificationsManager *)self delegate];
    [v23 notificationsManager:self didReceiveApplicationInstallationNotification:v22];
  }
}

- (void)_handleCloudAuthenticationDidChangeNotification
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cloud authentication status has changed - updating client status", v5, 2u);
  }

  v4 = [(ICDServerNotificationsManager *)self delegate];
  [v4 notificationsManagerDidReceiveCloudAuthenticationDidChangeDarwinNotification:self];
}

- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "handleLibraryAuthServiceTokenDidChangeNotification - posting dynamite state change", v7, 2u);
  }

  BOOL v6 = [(ICDServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveAuthServiceTokenDidChangeNotification:v4];
}

- (void)_handleAllowsMusicVideosChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDServerNotificationsManager *)self delegate];
  [v5 notificationsManager:self didReceiveAllowsMusicVideosDidChangeNotification:v4];
}

- (void)_handleAllowsExplicitContentChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(ICDServerNotificationsManager *)self delegate];
  [v5 notificationsManager:self didReceiveAllowsExplicitContentDidChangeNotification:v4];
}

- (void)_handleHandlerCoordinatorDidFinishInitialization:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handler Coordinator did finish initialization.", v7, 2u);
  }

  BOOL v6 = [(ICDServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveHandlerCoordinatorFinishedInitializationNotification:v4];
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User identity store has changed.", v7, 2u);
  }

  BOOL v6 = [(ICDServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveUserIdentityStoreDidChangeNotification:v4];
}

- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Active user identity has changed.", v7, 2u);
  }

  BOOL v6 = [(ICDServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveActiveUserIdentityDidChangeNotification:v4];
}

- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Subscription status has changed - updating client status", v7, 2u);
  }

  BOOL v6 = [(ICDServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveSubscriptionStatusDidChangeNotification:v4];
}

- (void)_handleFirstUnlockNotification:(id)a3
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "First unlock has occured", v6, 2u);
  }

  id v5 = [(ICDServerNotificationsManager *)self delegate];
  [v5 notificationsManagerDidReceiveFirstUnlockNotification:self];
}

- (void)_didReceiveTelephonyCenterNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received telephony center notification %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if ([v4 isEqualToString:kCTSettingPhoneNumberChangedNotification])
  {
    BOOL v6 = +[ICDeviceInfo currentDeviceInfo];
    unsigned int v7 = [v6 isPhoneNumberAccessRestricted];

    if (v7)
    {
      id v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138543362;
        id v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ignoring telephony center notification %{public}@ because phone number access is restricted.", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      id v8 = [(ICDServerNotificationsManager *)self delegate];
      [v8 notificationsManagerDidReceivePhoneNumberChangedNotification:self];
    }
  }
}

- (void)_didReceiveDarwinNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received darwin notification %{public}@", (uint8_t *)&v8, 0xCu);
  }

  BOOL v6 = [(ICDServerNotificationsManager *)self delegate];
  if ([v4 isEqualToString:@"com.apple.mobileipod.libraryimportdidfinish"])
  {
    [v6 notificationsManagerDidReceiveLibraryImportDidFinishDarwinNotification:self];
  }
  else if ([v4 isEqualToString:@"com.apple.itunesstored.autodownloaddefaultschange"])
  {
    [v6 notificationsManagerDidReceiveCellularDataRestrictionDidChangeDarwinNotification:self];
  }
  else if ([v4 isEqualToString:@"com.apple.purplebuddy.setupdone"])
  {
    [v6 notificationsManagerDidReceiveBuddySetupDoneDarwinNotification:self];
  }
  else if ([v4 isEqualToString:@"com.apple.family.family_updated"])
  {
    [(ICDServerNotificationsManager *)self _handleFamilyCircleChangedNotification];
  }
  else
  {
    unsigned int v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Received unsupported darwin notification %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_didReceiveDistributedNotification:(id)a3 withStreamEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received distributed notification: %{public}@", (uint8_t *)&v11, 0xCu);
  }

  if ([v6 isEqualToString:AMSFamilyContentDeletionNotification])
  {
    [(ICDServerNotificationsManager *)self _handleFamilyContentDeletionNotification:v6 streamEvent:v7];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"])
  {
    id v9 = self;
    uint64_t v10 = 1;
LABEL_9:
    [(ICDServerNotificationsManager *)v9 _handleApplicationRegistration:v10 notificationName:v6 streamEvent:v7];
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"com.apple.LaunchServices.applicationUnregistered"])
  {
    id v9 = self;
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  if ([v6 isEqualToString:@"com.apple.itunescloud.ICPlayActivityFlushInternalTestRequestNotification"])-[ICDServerNotificationsManager _handlePlayActivityFlushInternalTestRequestNotification](self, "_handlePlayActivityFlushInternalTestRequestNotification"); {
LABEL_10:
  }
}

- (void)_tearDownNotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];
}

- (void)_setupNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleFirstUnlockNotification:" name:ICSecurityInfoFirstUnlockNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleMusicSubscriptionStatusDidChangeNotification:" name:ICMusicSubscriptionStatusDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_handleLibraryAuthServiceTokenDidChangeNotification:" name:ICLibraryAuthServiceClientTokenDidChangeNotification object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10004225C, ICCloudClientIsAuthenticatedDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
  id v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)sub_100042254, @"com.apple.mobileipod-prefsChanged", 0, CFNotificationSuspensionBehaviorDrop);
  int v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)sub_10004224C, @"com.apple.family.family_updated", 0, CFNotificationSuspensionBehaviorDrop);
  id v9 = sub_100041A74();
  if (v9)
  {
    uint64_t v10 = +[NSNotificationCenter defaultCenter];
    int v11 = sub_100041A74();
    [v10 addObserver:self selector:"_handleAllowsExplicitContentChangedNotification:" name:v11 object:0];
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  id v12 = (id *)qword_1001F3818;
  uint64_t v40 = qword_1001F3818;
  if (!qword_1001F3818)
  {
    v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_100041BDC;
    v35 = &unk_1001BE9E8;
    v36 = &v37;
    v13 = sub_100041C2C();
    v38[3] = (uint64_t)dlsym(v13, "MPRestrictionsMonitorAllowsMusicVideosDidChangeNotification");
    qword_1001F3818 = *(void *)(v36[1] + 24);
    id v12 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (v12)
  {
    id v14 = *v12;
    if (v14)
    {
      size_t v15 = +[NSNotificationCenter defaultCenter];
      [v15 addObserver:self selector:"_handleAllowsMusicVideosChangedNotification:" name:v14 object:0];
    }
    v16 = sub_100041D80();
    if (v16)
    {
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2050000000;
      v17 = (void *)qword_1001F3828;
      uint64_t v40 = qword_1001F3828;
      if (!qword_1001F3828)
      {
        v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472;
        v34 = sub_100041EE8;
        v35 = &unk_1001BE9E8;
        v36 = &v37;
        sub_100041EE8((uint64_t)&v32);
        v17 = (void *)v38[3];
      }
      id v18 = v17;
      _Block_object_dispose(&v37, 8);
      if ([v18 isCurrentDeviceValidHomeAccessory])
      {
        v19 = +[NSNotificationCenter defaultCenter];
        id v20 = sub_100041D80();
        [v19 addObserver:self selector:"_handleAllowsExplicitContentChangedNotification:" name:v20 object:0];
      }
    }
    id v21 = +[NSNotificationCenter defaultCenter];
    [v21 addObserver:self selector:"_handleActiveUserIdentityDidChangeNotification:" name:ICActiveUserIdentityDidChangeNotification object:0];

    CFStringRef v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

    id v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:self selector:"_handleHandlerCoordinatorDidFinishInitialization:" name:@"ICDHandlerCoordinatorDidFinishInitializationNotificationName" object:0];

    xpcStreamHandlerQueue = self->_xpcStreamHandlerQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100041FB0;
    handler[3] = &unk_1001BC898;
    handler[4] = self;
    xpc_set_event_stream_handler("com.apple.distnoted.matching", xpcStreamHandlerQueue, handler);
    v25 = self->_xpcStreamHandlerQueue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100042040;
    v30[3] = &unk_1001BC898;
    v30[4] = self;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v25, v30);
    v26 = self->_xpcStreamHandlerQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1000420BC;
    v29[3] = &unk_1001BC898;
    v29[4] = self;
    xpc_set_event_stream_handler("com.apple.CTTelephonyCenter", v26, v29);
  }
  else
  {
    v27 = +[NSAssertionHandler currentHandler];
    v28 = +[NSString stringWithUTF8String:"NSString *getMPRestrictionsMonitorAllowsMusicVideosDidChangeNotification(void)"];
    objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, @"ICDServerNotificationsManager.m", 42, @"%s", dlerror());

    __break(1u);
  }
}

- (void)dealloc
{
  [(ICDServerNotificationsManager *)self _tearDownNotifications];
  v3.receiver = self;
  v3.super_class = (Class)ICDServerNotificationsManager;
  [(ICDServerNotificationsManager *)&v3 dealloc];
}

- (ICDServerNotificationsManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICDServerNotificationsManager;
  id v5 = [(ICDServerNotificationsManager *)&v11 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.itunescloudd.ICDServerNotificationsManager", v7);
    xpcStreamHandlerQueue = v6->_xpcStreamHandlerQueue;
    v6->_xpcStreamHandlerQueue = (OS_dispatch_queue *)v8;

    [(ICDServerNotificationsManager *)v6 _setupNotifications];
  }

  return v6;
}

@end