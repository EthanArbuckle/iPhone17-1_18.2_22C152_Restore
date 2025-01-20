@interface SDAutoUnlockNotificationsManager
+ (id)sharedManager;
- (NSDictionary)promptInfo;
- (NSHashTable)observers;
- (OS_dispatch_source)notificationTimer;
- (SDAutoUnlockNotificationsManager)init;
- (SFAutoUnlockNotificationModel)notificationModel;
- (id)radarNotificationCompletion;
- (void)addObserver:(id)a3;
- (void)clearPhoneAutoUnlockUpsellNotification:(BOOL)a3;
- (void)dealloc;
- (void)dismissRequestToUnlockNotification;
- (void)invalidateNotificationTimer;
- (void)notifyObservers:(SEL)a3;
- (void)removeObserver:(id)a3;
- (void)restartNotificationTimer:(unint64_t)a3;
- (void)setNotificationModel:(id)a3;
- (void)setNotificationTimer:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPromptInfo:(id)a3;
- (void)setRadarNotificationCompletion:(id)a3;
- (void)showAuthenticatedSiriForDeviceID:(id)a3;
- (void)showPhoneAutoRelockNotification;
- (void)showPhoneAutoUnlockNotificationWithBodyText:(id)a3 isUpsell:(BOOL)a4;
- (void)showRequestToUnlockNotification;
- (void)showUnlockedByDeviceNotificationWithDeviceID:(id)a3;
@end

@implementation SDAutoUnlockNotificationsManager

+ (id)sharedManager
{
  if (qword_10097FBA0 != -1) {
    dispatch_once(&qword_10097FBA0, &stru_1008CAB48);
  }
  v2 = (void *)qword_10097FB98;

  return v2;
}

- (SDAutoUnlockNotificationsManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SDAutoUnlockNotificationsManager;
  v2 = [(SDAutoUnlockNotificationsManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (FLFollowUpController *)[objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.sharingd.phone-auto-unlock-client"];
    coreFollowUpController = v2->coreFollowUpController;
    v2->coreFollowUpController = v5;
  }
  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)SDAutoUnlockNotificationsManager;
  [(SDAutoUnlockNotificationsManager *)&v2 dealloc];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSHashTable *)v5->_observers addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    [(NSHashTable *)v5->_observers removeObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)notifyObservers:(SEL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(SDAutoUnlockNotificationsManager *)v4 observers];
  id v6 = [v5 allObjects];

  objc_sync_exit(v4);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (objc_opt_respondsToSelector()) {
          ((void (*)(void *, SEL))[v11 methodForSelector:a3])(v11, a3);
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)showAuthenticatedSiriForDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = +[SDAutoUnlockTransport sharedTransport];
  v5 = [v4 deviceNameForDeviceID:v3];

  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting \"%@\" authenticated Siri by Apple Watch (device ID: %@)", (uint8_t *)&v7, 0x16u);
  }
}

- (void)showUnlockedByDeviceNotificationWithDeviceID:(id)a3
{
  id v3 = a3;
  id v4 = +[SDAutoUnlockTransport sharedTransport];
  v5 = [v4 deviceNameForDeviceID:v3];

  id v6 = auto_unlock_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Posting \"%@\" unlocked by Apple Watch (device ID: %@)", (uint8_t *)&v7, 0x16u);
  }
}

- (void)clearPhoneAutoUnlockUpsellNotification:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Clearing auto unlock notification (isUpsell=%@)", buf, 0xCu);
  }

  coreFollowUpController = self->coreFollowUpController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004E438;
  v8[3] = &unk_1008CAB70;
  BOOL v9 = v3;
  v8[4] = self;
  [(FLFollowUpController *)coreFollowUpController pendingFollowUpItemsWithCompletion:v8];
}

- (void)showPhoneAutoUnlockNotificationWithBodyText:(id)a3 isUpsell:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(SDAutoUnlockNotificationsManager *)self clearPhoneAutoUnlockUpsellNotification:v4];
  id v7 = objc_alloc_init((Class)FLFollowUpItem);
  id v8 = objc_alloc_init((Class)FLFollowUpAction);
  id v9 = objc_alloc_init((Class)FLFollowUpNotification);
  id v10 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Passcode#AUTO_UNLOCK_DEVICES_GROUP"];
  [v8 setUrl:v10];

  CFStringRef v11 = SFLocalizedStringForKey();
  [v9 setTitle:v11];

  [v9 setInformativeText:v6];
  [v9 setActivateAction:v8];
  [v9 setFrequency:0.0];
  [v7 setUniqueIdentifier:@"com.apple.sharingd.phone-auto-unlock-upsell"];
  [v7 setNotification:v9];
  CFStringRef v33 = @"SDPhoneAutoUnlockNotificationUpsellKey";
  long long v12 = +[NSNumber numberWithBool:v4];
  v34 = v12;
  long long v13 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  [v7 setUserInfo:v13];

  [v7 setDisplayStyle:24];
  long long v14 = +[FLFollowUpNotification defaultOptions];
  v32[0] = FLNotificationOptionBannerAlert;
  v32[1] = FLNotificationOptionNotificationCenter;
  long long v15 = +[NSArray arrayWithObjects:v32 count:2];
  v16 = [v14 setByAddingObjectsFromArray:v15];
  v17 = [v7 notification];
  [v17 setOptions:v16];

  v18 = auto_unlock_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"NO";
    if (v4) {
      CFStringRef v19 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v31 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Posting auto unlock notification (isUpsell=%@)", buf, 0xCu);
  }

  coreFollowUpController = self->coreFollowUpController;
  id v29 = 0;
  [(FLFollowUpController *)coreFollowUpController postFollowUpItem:v7 error:&v29];
  id v21 = v29;
  if (v21)
  {
    v22 = auto_unlock_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004F4C0((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
}

- (void)showPhoneAutoRelockNotification
{
  objc_super v2 = SFLocalizedStringForKey();
  BOOL v3 = SFLocalizedStringForKey();
  BOOL v4 = CUMainQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004EAC0;
  v7[3] = &unk_1008CA640;
  id v8 = v2;
  id v9 = v3;
  id v5 = v3;
  id v6 = v2;
  dispatch_async(v4, v7);
}

- (void)showRequestToUnlockNotification
{
  objc_super v2 = SFLocalizedStringForKey();
  BOOL v3 = SFLocalizedStringForKey();
  BOOL v4 = CUMainQueue();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004EE0C;
  v7[3] = &unk_1008CA640;
  id v8 = v2;
  id v9 = v3;
  id v5 = v3;
  id v6 = v2;
  dispatch_async(v4, v7);
}

- (void)dismissRequestToUnlockNotification
{
}

- (void)restartNotificationTimer:(unint64_t)a3
{
  id v5 = auto_unlock_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting notification timer", buf, 2u);
  }

  id v6 = [(SDAutoUnlockNotificationsManager *)self notificationTimer];

  if (!v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10004F1C8;
    v10[3] = &unk_1008CA4B8;
    v10[4] = self;
    id v7 = sub_1001B1B10(0, &_dispatch_main_q, v10);
    [(SDAutoUnlockNotificationsManager *)self setNotificationTimer:v7];

    id v8 = [(SDAutoUnlockNotificationsManager *)self notificationTimer];
    dispatch_resume(v8);
  }
  id v9 = [(SDAutoUnlockNotificationsManager *)self notificationTimer];
  sub_1001B1BC4(v9, a3);
}

- (void)invalidateNotificationTimer
{
  BOOL v3 = auto_unlock_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invaliding suggestion scan timer", v6, 2u);
  }

  BOOL v4 = [(SDAutoUnlockNotificationsManager *)self notificationTimer];

  if (v4)
  {
    id v5 = [(SDAutoUnlockNotificationsManager *)self notificationTimer];
    dispatch_source_cancel(v5);

    [(SDAutoUnlockNotificationsManager *)self setNotificationTimer:0];
  }
}

- (SFAutoUnlockNotificationModel)notificationModel
{
  return self->_notificationModel;
}

- (void)setNotificationModel:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 40, 1);
}

- (void)setObservers:(id)a3
{
}

- (NSDictionary)promptInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPromptInfo:(id)a3
{
}

- (OS_dispatch_source)notificationTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotificationTimer:(id)a3
{
}

- (id)radarNotificationCompletion
{
  return objc_getProperty(self, a2, 64, 1);
}

- (void)setRadarNotificationCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_radarNotificationCompletion, 0);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_promptInfo, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_notificationModel, 0);
  objc_storeStrong(&self->_cancelListener, 0);
  objc_storeStrong(&self->_doubleClickListener, 0);

  objc_storeStrong((id *)&self->coreFollowUpController, 0);
}

@end