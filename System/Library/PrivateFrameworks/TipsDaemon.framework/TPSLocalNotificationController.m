@interface TPSLocalNotificationController
- (BOOL)isNotificationSettingValid;
- (TPSLocalNotificationController)initWithBundleIdentifier:(id)a3;
- (id)personalizedStringForText:(id)a3;
- (void)notificationCompletedForIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 error:(id)a6;
- (void)removeAllNotifications;
- (void)removeNotificationWithIdentifier:(id)a3;
- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 title:(id)a6 text:(id)a7 attachmentURL:(id)a8 extensionPayload:(id)a9;
- (void)showNotificationForNotificationCache:(id)a3 attachmentURL:(id)a4;
@end

@implementation TPSLocalNotificationController

- (TPSLocalNotificationController)initWithBundleIdentifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TPSLocalNotificationController;
  return [(TPSLocalNotificationController *)&v4 init];
}

- (BOOL)isNotificationSettingValid
{
  return 0;
}

- (id)personalizedStringForText:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAF3F8];
  id v4 = a3;
  v5 = [v3 deviceMarketingName];
  v6 = [v4 stringByReplacingOccurrencesOfString:@"{{device_name}}" withString:v5];

  return v6;
}

- (void)showNotificationForNotificationCache:(id)a3 attachmentURL:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([MEMORY[0x1E4FAF450] suppressNotifications] & 1) == 0)
  {
    v8 = [v6 document];
    v9 = [v8 notification];
    v10 = [v9 title];
    v11 = [(TPSLocalNotificationController *)self personalizedStringForText:v10];

    v12 = [v9 text];
    v13 = [(TPSLocalNotificationController *)self personalizedStringForText:v12];

    uint64_t v14 = [v8 identifier];
    uint64_t v15 = [v6 collectionIdentifier];
    v16 = [v8 correlationID];
    if (([v11 length] || objc_msgSend(v13, "length")) && v14 | v15)
    {
      [v6 extensionPayload];
      v22 = v9;
      id v17 = v7;
      v18 = v16;
      v20 = v19 = v13;
      [(TPSLocalNotificationController *)self sendNotificationWithIdentifier:v14 collectionID:v15 correlationID:v18 title:v11 text:v19 attachmentURL:v17 extensionPayload:v20];

      v13 = v19;
      v16 = v18;
      id v7 = v17;
      v9 = v22;
    }
    else
    {
      v21 = [MEMORY[0x1E4FAF480] daemon];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138413058;
        v24 = v11;
        __int16 v25 = 2112;
        v26 = v13;
        __int16 v27 = 2112;
        uint64_t v28 = v14;
        __int16 v29 = 2112;
        uint64_t v30 = v15;
        _os_log_impl(&dword_1E4492000, v21, OS_LOG_TYPE_DEFAULT, "Notification document missing information Title: %@ text: %@ identifier: %@ collectionID: %@.", buf, 0x2Au);
      }
    }
  }
}

- (void)sendNotificationWithIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 title:(id)a6 text:(id)a7 attachmentURL:(id)a8 extensionPayload:(id)a9
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v14 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412802;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v12;
    __int16 v19 = 2112;
    id v20 = v13;
    _os_log_impl(&dword_1E4492000, v14, OS_LOG_TYPE_DEFAULT, "Send notification with identifier %@, collectionID %@, correlationID %@", (uint8_t *)&v15, 0x20u);
  }
}

- (void)removeAllNotifications
{
  v2 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1E4492000, v2, OS_LOG_TYPE_DEFAULT, "Remove all notifications.", v3, 2u);
  }
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FAF480] daemon];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1E4492000, v4, OS_LOG_TYPE_DEFAULT, "Remove notification for identifier: %@.", (uint8_t *)&v5, 0xCu);
  }
}

- (void)notificationCompletedForIdentifier:(id)a3 collectionID:(id)a4 correlationID:(id)a5 error:(id)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (!v9) {
    id v9 = v10;
  }
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", +[TPSNotificationController remainingCountOfNotificationsUntilOptOut](TPSNotificationController, "remainingCountOfNotificationsUntilOptOut"));
  uint64_t v14 = (void *)MEMORY[0x1E4FAF390];
  if (v12)
  {
    int v15 = [v12 localizedDescription];
    id v16 = [v14 eventWithContentID:v9 collectionID:v10 correlationID:v11 remainingNotificationsCount:v13 errorCode:v15];
    [v16 log];

    __int16 v17 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v12;
      id v18 = "Notification error %@";
LABEL_8:
      _os_log_impl(&dword_1E4492000, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v20, 0xCu);
    }
  }
  else
  {
    __int16 v19 = [MEMORY[0x1E4FAF390] eventWithContentID:v9 collectionID:v10 correlationID:v11 remainingNotificationsCount:v13 errorCode:0];
    [v19 log];

    __int16 v17 = [MEMORY[0x1E4FAF480] daemon];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v9;
      id v18 = "Notification sent for identifier %@";
      goto LABEL_8;
    }
  }
}

@end