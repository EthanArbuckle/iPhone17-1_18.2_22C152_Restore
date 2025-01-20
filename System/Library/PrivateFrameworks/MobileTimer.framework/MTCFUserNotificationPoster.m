@interface MTCFUserNotificationPoster
+ (id)sharedInstance;
+ (void)cancelNotificationsWithIdentifiers:(id)a3;
+ (void)postNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 bypassDND:(BOOL)a8 handler:(id)a9;
- (MTCFUserNotificationPoster)init;
- (NSMutableDictionary)notifications;
- (void)setNotifications:(id)a3;
@end

@implementation MTCFUserNotificationPoster

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_51);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __44__MTCFUserNotificationPoster_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (MTCFUserNotificationPoster)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTCFUserNotificationPoster;
  v2 = [(MTCFUserNotificationPoster *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    notifications = v2->_notifications;
    v2->_notifications = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (void)postNotificationWithIdentifier:(id)a3 title:(id)a4 message:(id)a5 defaultButtonTitle:(id)a6 otherButtonTitle:(id)a7 bypassDND:(BOOL)a8 handler:(id)a9
{
  v40[4] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v33 = a9;
  uint64_t v19 = *MEMORY[0x1E4F1D9A8];
  v39[0] = *MEMORY[0x1E4F1D990];
  v39[1] = v19;
  v40[0] = v15;
  v40[1] = v16;
  uint64_t v20 = *MEMORY[0x1E4F1D9D0];
  v39[2] = *MEMORY[0x1E4F1D9E0];
  v39[3] = v20;
  v40[2] = v17;
  v40[3] = v18;
  CFDictionaryRef v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:4];
  SInt32 error = 0;
  CFUserNotificationRef v22 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v21);
  if (v22)
  {
    BOOL v23 = error == 0;
    v24 = MTLogForCategory(3);
    v25 = v24;
    if (v23)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v36 = a1;
        __int16 v37 = 2114;
        id v38 = v14;
        _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ posting CFUserNotification for %{public}@", buf, 0x16u);
      }

      CFRetain(v22);
      id obj = +[MTCFUserNotificationPoster sharedInstance];
      objc_sync_enter(obj);
      v26 = objc_opt_new();
      [v26 setIdentifier:v14];
      [v26 setHandler:v33];
      v27 = +[MTOSTransaction transactionWithDescription:v14 timeout:1800.0];
      [v26 setTransaction:v27];

      [v26 setNotification:v22];
      v28 = +[MTCFUserNotificationPoster sharedInstance];
      v29 = [v28 notifications];
      [v29 setObject:v26 forKeyedSubscript:v14];

      objc_sync_exit(obj);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v22, (CFUserNotificationCallBack)_CFUserNotificationCallback, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
      CFRelease(RunLoopSource);
    }
    else
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        +[MTCFUserNotificationPoster postNotificationWithIdentifier:title:message:defaultButtonTitle:otherButtonTitle:bypassDND:handler:]((uint64_t)a1, v25);
      }
    }
    CFRelease(v22);
  }
}

+ (void)cancelNotificationsWithIdentifiers:(id)a3
{
  id v4 = a3;
  v5 = +[MTCFUserNotificationPoster sharedInstance];
  objc_sync_enter(v5);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__MTCFUserNotificationPoster_cancelNotificationsWithIdentifiers___block_invoke;
  v6[3] = &__block_descriptor_40_e18_v16__0__NSString_8l;
  v6[4] = a1;
  objc_msgSend(v4, "na_each:", v6);
  objc_sync_exit(v5);
}

void __65__MTCFUserNotificationPoster_cancelNotificationsWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[MTCFUserNotificationPoster sharedInstance];
  v5 = [v4 notifications];
  objc_super v6 = [v5 objectForKeyedSubscript:v3];

  if (v6)
  {
    v7 = MTLogForCategory(3);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      v9 = [v6 identifier];
      int v12 = 138543618;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling CFUserNotification for %{public}@", (uint8_t *)&v12, 0x16u);
    }
    CFUserNotificationCancel((CFUserNotificationRef)[v6 notification]);
    v10 = +[MTCFUserNotificationPoster sharedInstance];
    v11 = [v10 notifications];
    [v11 removeObjectForKey:v3];
  }
}

- (NSMutableDictionary)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)postNotificationWithIdentifier:(uint64_t)a1 title:(NSObject *)a2 message:defaultButtonTitle:otherButtonTitle:bypassDND:handler:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19CC95000, a2, OS_LOG_TYPE_ERROR, "%{public}@ failed to post CFUserNotification", (uint8_t *)&v2, 0xCu);
}

@end