@interface ICDMediaUserStateCenterServerNotificationsManager
- (ICDMediaUserStateCenterServerNotificationsManager)initWithDelegate:(id)a3;
- (ICDMediaUserStateCenterServerNotificationsManagerDelegate)delegate;
- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3;
- (void)_handleCloudAuthenticationDidChangeNotification;
- (void)_handleHomeUserSettingsDidChangeNotification:(id)a3;
- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3;
- (void)_handleLocalStoreAccountPropertiesDidChangeNotification:(id)a3;
- (void)_handleMusicSettingsChangedNotification;
- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_setupNotifications;
@end

@implementation ICDMediaUserStateCenterServerNotificationsManager

- (void).cxx_destruct
{
}

- (ICDMediaUserStateCenterServerNotificationsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDMediaUserStateCenterServerNotificationsManagerDelegate *)WeakRetained;
}

- (void)_handleMusicSettingsChangedNotification
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, music settings changed", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v4 notificationsManager:self didReceiveNotificationChangingUserState:0];
}

- (void)_handleCloudAuthenticationDidChangeNotification
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, cloud authentication changed", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v4 notificationsManager:self didReceiveNotificationChangingUserState:0];
}

- (void)_handleActiveUserIdentityDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, active user identity changed", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, subscription status changed", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, identity store changed", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleLocalStoreAccountPropertiesDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, store account properties changed", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleLibraryAuthServiceTokenDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, library authentication token changed", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_handleHomeUserSettingsDidChangeNotification:(id)a3
{
  id v4 = a3;
  int v5 = os_log_create("com.apple.amp.itunescloudd", "UserState");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Calling delegate to update user state, home user settings changed", (uint8_t *)&v7, 0xCu);
  }

  v6 = [(ICDMediaUserStateCenterServerNotificationsManager *)self delegate];
  [v6 notificationsManager:self didReceiveNotificationChangingUserState:v4];
}

- (void)_setupNotifications
{
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2050000000;
  v3 = (void *)qword_1001F3A78;
  uint64_t v26 = qword_1001F3A78;
  if (!qword_1001F3A78)
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100114C00;
    v21 = &unk_1001BE9E8;
    v22 = &v23;
    sub_100114C00((uint64_t)&v18);
    v3 = (void *)v24[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v23, 8);
  if (![v4 isCurrentDeviceValidHomeAccessory]) {
    goto LABEL_8;
  }
  int v5 = +[NSNotificationCenter defaultCenter];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  v6 = (void *)qword_1001F3A88;
  uint64_t v26 = qword_1001F3A88;
  if (!qword_1001F3A88)
  {
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_100114CC8;
    v21 = &unk_1001BE9E8;
    v22 = &v23;
    int v7 = sub_100114D18();
    v8 = dlsym(v7, "MPHomeUserMonitorPrivateListeningForCurrentDeviceSettingDidChangeNotification");
    *(void *)(v22[1] + 24) = v8;
    qword_1001F3A88 = *(void *)(v22[1] + 24);
    v6 = (void *)v24[3];
  }
  _Block_object_dispose(&v23, 8);
  if (v6)
  {
    [v5 addObserver:self selector:"_handleHomeUserSettingsDidChangeNotification:" name:*v6 object:0];

LABEL_8:
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_handleSubscriptionStatusDidChangeNotification:" name:ICMusicSubscriptionStatusDidChangeNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"_handleActiveUserIdentityDidChangeNotification:" name:ICActiveUserIdentityDidChangeNotification object:0];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:self selector:"_handleLocalStoreAccountPropertiesDidChangeNotification:" name:ICUserIdentityStoreLocalStoreAccountPropertiesDidChangeNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:self selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:self selector:"_handleLibraryAuthServiceTokenDidChangeNotification:" name:ICLibraryAuthServiceClientTokenDidChangeNotification object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100114E74, ICCloudClientIsAuthenticatedDidChangeNotification, 0, (CFNotificationSuspensionBehavior)0);
    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, self, (CFNotificationCallback)sub_100114E6C, @"com.apple.mobileipod-prefsChanged", 0, CFNotificationSuspensionBehaviorDrop);
    return;
  }
  v16 = +[NSAssertionHandler currentHandler];
  v17 = +[NSString stringWithUTF8String:"NSString *getMPHomeUserMonitorPrivateListeningForCurrentDeviceSettingDidChangeNotification(void)"];
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"ICDMediaUserStateCenterServerNotificationsManager.m", 22, @"%s", dlerror());

  __break(1u);
}

- (ICDMediaUserStateCenterServerNotificationsManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICDMediaUserStateCenterServerNotificationsManager;
  int v5 = [(ICDMediaUserStateCenterServerNotificationsManager *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    [(ICDMediaUserStateCenterServerNotificationsManager *)v6 _setupNotifications];
  }

  return v6;
}

@end