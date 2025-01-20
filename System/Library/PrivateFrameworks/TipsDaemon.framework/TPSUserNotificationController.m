@interface TPSUserNotificationController
- (BOOL)isNotificationSettingValid;
- (TPSUserNotificationController)initWithBundleIdentifier:(id)a3;
- (UNUserNotificationCenter)userNotificationCenter;
- (void)removeAllNotifications;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 content:(id)a6;
- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 title:(id)a6 text:(id)a7 attachmentURL:(id)a8 extensionPayload:(id)a9;
- (void)setUserNotificationCenter:(id)a3;
@end

@implementation TPSUserNotificationController

- (BOOL)isNotificationSettingValid
{
  v2 = [(TPSUserNotificationController *)self userNotificationCenter];
  v3 = [v2 notificationSettings];

  BOOL v4 = [v3 alertStyle]
    || [v3 notificationCenterSetting] == 2
    || [v3 lockScreenSetting] == 2;

  return v4;
}

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (TPSUserNotificationController)initWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TPSUserNotificationController;
  v5 = [(TPSLocalNotificationController *)&v11 initWithBundleIdentifier:v4];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F44600] categoryWithIdentifier:@"tip-notification-extension" actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:4];
    v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", v6, 0);
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v4];
    userNotificationCenter = v5->_userNotificationCenter;
    v5->_userNotificationCenter = (UNUserNotificationCenter *)v8;

    [(UNUserNotificationCenter *)v5->_userNotificationCenter setNotificationCategories:v7];
  }

  return v5;
}

- (void)removeAllNotifications
{
  v4.receiver = self;
  v4.super_class = (Class)TPSUserNotificationController;
  [(TPSLocalNotificationController *)&v4 removeAllNotifications];
  v3 = [(TPSUserNotificationController *)self userNotificationCenter];
  [v3 removeAllDeliveredNotifications];
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)TPSUserNotificationController;
  id v4 = a3;
  [(TPSLocalNotificationController *)&v7 removeNotificationWithIdentifier:v4];
  v5 = [(TPSUserNotificationController *)self userNotificationCenter];
  v8[0] = v4;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  [v5 removeDeliveredNotificationsWithIdentifiers:v6];
}

- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 title:(id)a6 text:(id)a7 attachmentURL:(id)a8 extensionPayload:(id)a9
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  v17 = (void *)MEMORY[0x1E4F1CA60];
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  v21 = [v17 dictionaryWithDictionary:a9];
  v33 = v16;
  if ([v15 length])
  {
    if (v16)
    {
      id v31 = v20;
      if (a9)
      {
        uint64_t v22 = 0;
      }
      else
      {
        uint64_t v36 = *MEMORY[0x1E4F446B0];
        v37[0] = MEMORY[0x1E4F1CC38];
        uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
      }
      v30 = (void *)v22;
      v23 = (void *)MEMORY[0x1E4F445F0];
      v24 = [MEMORY[0x1E4F29128] UUID];
      v25 = [v24 UUIDString];
      id v34 = 0;
      v26 = [v23 attachmentWithIdentifier:v25 URL:v33 options:v22 error:&v34];
      id v27 = v34;

      id v16 = 0;
      if (!v27)
      {
        v35 = v26;
        id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      }

      id v20 = v31;
    }
    [v21 setObject:v15 forKeyedSubscript:@"collectionId"];
  }
  else
  {
    id v16 = 0;
  }
  id v28 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  [v28 setTitle:v19];

  [v28 setBody:v18];
  v29 = [MEMORY[0x1E4FAF460] URLWithTipIdentifier:v14 collectionIdentifier:v15 referrer:*MEMORY[0x1E4FAF4E0]];
  [v28 setDefaultActionURL:v29];

  [v28 setUserInfo:v21];
  if (v16) {
    [v28 setAttachments:v16];
  }
  if (a9) {
    [v28 setCategoryIdentifier:@"tip-notification-extension"];
  }
  [v28 setInterruptionLevel:0];
  [(TPSUserNotificationController *)self sendNotificationWithIdentifier:v14 collectionID:v15 correlationID:v20 content:v28];
}

- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 content:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10) {
    id v14 = v10;
  }
  else {
    id v14 = v11;
  }
  id v15 = [MEMORY[0x1E4F44628] requestWithIdentifier:v14 content:v13 trigger:0];
  objc_initWeak(&location, self);
  id v16 = [(TPSUserNotificationController *)self userNotificationCenter];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __99__TPSUserNotificationController_sendNotificationWithIdentifier_collectionID_correlationID_content___block_invoke;
  v20[3] = &unk_1E6E6C9E8;
  objc_copyWeak(&v24, &location);
  id v17 = v10;
  id v21 = v17;
  id v18 = v11;
  id v22 = v18;
  id v19 = v12;
  id v23 = v19;
  [v16 addNotificationRequest:v15 withCompletionHandler:v20];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __99__TPSUserNotificationController_sendNotificationWithIdentifier_collectionID_correlationID_content___block_invoke(void *a1, void *a2)
{
  v3 = (id *)(a1 + 7);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained notificationCompletedForIdentifier:a1[4] collectionID:a1[5] correlationID:a1[6] error:v4];
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end