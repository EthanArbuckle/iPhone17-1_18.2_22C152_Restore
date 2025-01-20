@interface FCNotificationsEndpointConnection
- (FCAsyncSerialQueue)serialQueue;
- (FCBundleSubscriptionManagerType)bundleSubscriptionManager;
- (FCCoreConfigurationManager)configurationManager;
- (FCEndpointConnection)endpointConnection;
- (FCFileCoordinatedNotificationDropbox)fileCoordinatedNotificationDropbox;
- (FCNotificationsEndpointConnection)initWithBaseURLString:(id)a3;
- (FCNotificationsEndpointConnection)initWithConfigurationManager:(id)a3 bundleSubscriptionManager:(id)a4;
- (FCNotificationsEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4 bundleSubscriptionManager:(id)a5;
- (NSString)deviceOSVersion;
- (NSString)deviceType;
- (NSURL)baseURL;
- (id)_deviceInfoWithDeviceToken:(id)a3 deviceDigestMode:(int)a4;
- (id)_marketingSubscriptionRequestWithType:(int)a3 action:(int)a4 dsid:(id)a5;
- (id)_notificationDataInDropbox;
- (id)_notificationEntitiesWithChannelIDs:(id)a3 isPaid:(BOOL)a4 paidBundleSubscriptionStatus:(unint64_t)a5 editorialChannelID:(id)a6;
- (id)_notificationEntityWithChannelIDs:(id)a3 isPaid:(BOOL)a4 paidBundleSubscriptionStatus:(unint64_t)a5 notificationType:(int)a6;
- (id)_pushNotifySubscriptionRequestWithChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8;
- (id)_pushNotifySubscriptionRequestWithTopicIDs:(id)a3 fromChannelID:(id)a4 withTopicGroupingID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9;
- (int)_pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:(unint64_t)a3;
- (void)_sendNotificationsSubscriptionRequest:(id)a3 pathComponent:(id)a4 callbackQueue:(id)a5 completion:(id)a6;
- (void)_updateNotificationDropboxDataWithBaseURL:(id)a3 notificationUserID:(id)a4 deviceToken:(id)a5 storefrontID:(id)a6 deviceDigestMode:(int)a7;
- (void)configurationManager:(id)a3 configurationDidChange:(id)a4;
- (void)modifyMarketingSubscriptionWithType:(int)a3 action:(int)a4 dsid:(id)a5 callbackQueue:(id)a6 completion:(id)a7;
- (void)refreshNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8 callbackQueue:(id)a9 completion:(id)a10;
- (void)refreshNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11;
- (void)registerDeviceWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6 callbackQueue:(id)a7 completion:(id)a8;
- (void)setBaseURL:(id)a3;
- (void)setBundleSubscriptionManager:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDeviceOSVersion:(id)a3;
- (void)setDeviceType:(id)a3;
- (void)setEndpointConnection:(id)a3;
- (void)setFileCoordinatedNotificationDropbox:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)subscribeNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8 callbackQueue:(id)a9 completion:(id)a10;
- (void)subscribeNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11;
- (void)unregisterDeviceWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6 callbackQueue:(id)a7 completion:(id)a8;
- (void)unsubscribeNotificationsForChannelIDs:(id)a3 userID:(id)a4 deviceToken:(id)a5 storefrontID:(id)a6 deviceDigestMode:(int)a7 callbackQueue:(id)a8 completion:(id)a9;
- (void)unsubscribeNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11;
- (void)updateBaseURL:(id)a3;
@end

@implementation FCNotificationsEndpointConnection

void __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke_2;
  v6[3] = &unk_1E5B502D8;
  v4 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 fetchConfigurationIfNeededWithCompletion:v6];
}

- (FCNotificationsEndpointConnection)initWithConfigurationManager:(id)a3 bundleSubscriptionManager:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(FCEndpointConnection);
  v9 = [(FCNotificationsEndpointConnection *)self initWithEndpointConnection:v8 configurationManager:v7 bundleSubscriptionManager:v6];

  return v9;
}

- (FCNotificationsEndpointConnection)initWithEndpointConnection:(id)a3 configurationManager:(id)a4 bundleSubscriptionManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)FCNotificationsEndpointConnection;
  v12 = [(FCNotificationsEndpointConnection *)&v29 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpointConnection, a3);
    objc_storeStrong((id *)&v13->_configurationManager, a4);
    objc_storeStrong((id *)&v13->_bundleSubscriptionManager, a5);
    v14 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v13->_serialQueue;
    v13->_serialQueue = v14;

    uint64_t v16 = NFGeneralDeviceString();
    deviceType = v13->_deviceType;
    v13->_deviceType = (NSString *)v16;

    uint64_t v18 = NFDeviceOSVersion();
    deviceOSVersion = v13->_deviceOSVersion;
    v13->_deviceOSVersion = (NSString *)v18;

    v20 = [FCFileCoordinatedNotificationDropbox alloc];
    v21 = FCURLForNotificationDropbox();
    uint64_t v22 = [(FCFileCoordinatedNotificationDropbox *)v20 initWithFileURL:v21];
    fileCoordinatedNotificationDropbox = v13->_fileCoordinatedNotificationDropbox;
    v13->_fileCoordinatedNotificationDropbox = (FCFileCoordinatedNotificationDropbox *)v22;

    [v10 addObserver:v13];
    v24 = [(FCNotificationsEndpointConnection *)v13 serialQueue];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke;
    v26[3] = &unk_1E5B50E70;
    id v27 = v10;
    v28 = v13;
    [v24 enqueueBlock:v26];
  }
  return v13;
}

- (FCAsyncSerialQueue)serialQueue
{
  return self->_serialQueue;
}

void __111__FCNotificationsEndpointConnection_initWithEndpointConnection_configurationManager_bundleSubscriptionManager___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = FCDefaultLog;
    if (os_log_type_enabled((os_log_t)FCDefaultLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v6;
      _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "Failed to fetch endpoint configuration with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  [*(id *)(a1 + 32) updateBaseURL:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)updateBaseURL:(id)a3
{
  id v4 = +[FCBaseURLConfiguration notificationsBaseURLForConfiguration:a3];
  [(FCNotificationsEndpointConnection *)self setBaseURL:v4];
}

- (void)setBaseURL:(id)a3
{
}

- (FCNotificationsEndpointConnection)initWithBaseURLString:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCNotificationsEndpointConnection;
  id v5 = [(FCNotificationsEndpointConnection *)&v16 init];
  if (v5)
  {
    id v6 = objc_alloc_init(FCEndpointConnection);
    endpointConnection = v5->_endpointConnection;
    v5->_endpointConnection = v6;

    uint64_t v8 = NFGeneralDeviceString();
    deviceType = v5->_deviceType;
    v5->_deviceType = (NSString *)v8;

    uint64_t v10 = NFDeviceOSVersion();
    deviceOSVersion = v5->_deviceOSVersion;
    v5->_deviceOSVersion = (NSString *)v10;

    v12 = objc_alloc_init(FCAsyncSerialQueue);
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = v12;

    v14 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
    [(FCNotificationsEndpointConnection *)v5 setBaseURL:v14];
  }
  return v5;
}

- (void)registerDeviceWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6 callbackQueue:(id)a7 completion:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v14 = (char *)a3;
  v15 = (char *)a4;
  id v16 = a5;
  id v17 = a7;
  uint64_t v18 = (void (**)(id, uint64_t, void))a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v34 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCNotificationsEndpointConnection registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbac"
          "kQueue:completion:]";
    __int16 v42 = 2080;
    v43 = "FCNotificationsEndpointConnection.m";
    __int16 v44 = 1024;
    int v45 = 113;
    __int16 v46 = 2114;
    v47 = v34;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v35 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCNotificationsEndpointConnection registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbac"
          "kQueue:completion:]";
    __int16 v42 = 2080;
    v43 = "FCNotificationsEndpointConnection.m";
    __int16 v44 = 1024;
    int v45 = 114;
    __int16 v46 = 2114;
    v47 = v35;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v16)
  {
    if (v14 && v15)
    {
      v19 = [(FCNotificationsEndpointConnection *)self _notificationDataInDropbox];
      v20 = [v19 deviceToken];
      v37 = v19;
      if ([v15 isEqualToString:v20])
      {
        v21 = [v19 notificationUserID];
        if ([v14 isEqualToString:v21])
        {
          int v22 = [v19 deviceDigestMode];
          uint64_t v23 = v10;
          id v24 = v17;
          int v25 = v22;

          BOOL v26 = v25 == v23;
          id v17 = v24;
          uint64_t v10 = v23;
          if (v26)
          {
            id v27 = FCPushNotificationsLog;
            if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v41 = v15;
              __int16 v42 = 2112;
              v43 = v14;
              __int16 v44 = 1024;
              int v45 = v23;
              _os_log_impl(&dword_1A460D000, v27, OS_LOG_TYPE_INFO, "the device token is already registered: %@ for userID: %@ and the digestMode: %d hasn't changed", buf, 0x1Cu);
            }
            v28 = v37;
            if (v18) {
              v18[2](v18, 1, 0);
            }
            goto LABEL_25;
          }
LABEL_24:
          v30 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithChannelIDs:0 paidChannelIDs:0 userID:v14 deviceToken:v15 storefrontID:v16 deviceDigestMode:v10];
          v38[0] = MEMORY[0x1E4F143A8];
          v38[1] = 3221225472;
          v38[2] = __129__FCNotificationsEndpointConnection_registerDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
          v38[3] = &unk_1E5B57208;
          v39 = v18;
          [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v30 pathComponent:@"pushnotify/subscribe" callbackQueue:v17 completion:v38];
          [(FCNotificationsEndpointConnection *)self baseURL];
          v32 = id v31 = v17;
          v33 = [v32 absoluteString];
          [(FCNotificationsEndpointConnection *)self _updateNotificationDropboxDataWithBaseURL:v33 notificationUserID:v14 deviceToken:v15 storefrontID:v16 deviceDigestMode:v10];

          id v17 = v31;
          v28 = v37;
LABEL_25:

          goto LABEL_26;
        }
      }
      goto LABEL_24;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v36 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    v41 = "-[FCNotificationsEndpointConnection registerDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbac"
          "kQueue:completion:]";
    __int16 v42 = 2080;
    v43 = "FCNotificationsEndpointConnection.m";
    __int16 v44 = 1024;
    int v45 = 115;
    __int16 v46 = 2114;
    v47 = v36;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_super v29 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v29, OS_LOG_TYPE_ERROR, "failed to submit request for register device token, invalid parameters", buf, 2u);
  }
  v18[2](v18, 0, 0);
LABEL_26:
}

void __129__FCNotificationsEndpointConnection_registerDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to register device token with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)unregisterDeviceWithUserID:(id)a3 deviceToken:(id)a4 storefrontID:(id)a5 deviceDigestMode:(int)a6 callbackQueue:(id)a7 completion:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    id v27 = "-[FCNotificationsEndpointConnection unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callb"
          "ackQueue:completion:]";
    __int16 v28 = 2080;
    objc_super v29 = "FCNotificationsEndpointConnection.m";
    __int16 v30 = 1024;
    int v31 = 169;
    __int16 v32 = 2114;
    v33 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    id v27 = "-[FCNotificationsEndpointConnection unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callb"
          "ackQueue:completion:]";
    __int16 v28 = 2080;
    objc_super v29 = "FCNotificationsEndpointConnection.m";
    __int16 v30 = 1024;
    int v31 = 170;
    __int16 v32 = 2114;
    v33 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v16)
  {
    if (v14 && v15)
    {
      v19 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithChannelIDs:0 paidChannelIDs:0 userID:v14 deviceToken:v15 storefrontID:v16 deviceDigestMode:v10];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __131__FCNotificationsEndpointConnection_unregisterDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
      v24[3] = &unk_1E5B57208;
      id v25 = v18;
      [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v19 pathComponent:@"pushnotify/unsubscribe" callbackQueue:v17 completion:v24];
      [(FCNotificationsEndpointConnection *)self _updateNotificationDropboxDataWithBaseURL:0 notificationUserID:0 deviceToken:0 storefrontID:0 deviceDigestMode:0];

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    id v27 = "-[FCNotificationsEndpointConnection unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callb"
          "ackQueue:completion:]";
    __int16 v28 = 2080;
    objc_super v29 = "FCNotificationsEndpointConnection.m";
    __int16 v30 = 1024;
    int v31 = 171;
    __int16 v32 = 2114;
    v33 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v20 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v20, OS_LOG_TYPE_ERROR, "failed to submit request to unregister device token, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, void, void))v18 + 2))(v18, 0, 0);
LABEL_15:
}

void __131__FCNotificationsEndpointConnection_unregisterDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to unregister device token with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)subscribeNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8 callbackQueue:(id)a9 completion:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  if ([v16 count]
    || [v17 count]
    || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    if (v18) {
      goto LABEL_7;
    }
  }
  else
  {
    objc_super v29 = (void *)[[NSString alloc] initWithFormat:@"either channelIDs or paidChannelIDs should include some values"];
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    __int16 v36 = 1024;
    int v37 = 217;
    __int16 v38 = 2114;
    v39 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_7;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    __int16 v36 = 1024;
    int v37 = 218;
    __int16 v38 = 2114;
    v39 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_7:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    __int16 v36 = 1024;
    int v37 = 219;
    __int16 v38 = 2114;
    v39 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20) {
      goto LABEL_12;
    }
  }
  else if (v20)
  {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    v33 = "-[FCNotificationsEndpointConnection subscribeNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:stor"
          "efrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v34 = 2080;
    v35 = "FCNotificationsEndpointConnection.m";
    __int16 v36 = 1024;
    int v37 = 220;
    __int16 v38 = 2114;
    v39 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_12:
  if (![v16 count])
  {
    uint64_t v23 = [v17 count];
    if (!v18 || !v19 || !v20 || !v23) {
      goto LABEL_22;
    }
LABEL_21:
    id v24 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithChannelIDs:v16 paidChannelIDs:v17 userID:v18 deviceToken:v19 storefrontID:v20 deviceDigestMode:v10];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __162__FCNotificationsEndpointConnection_subscribeNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v30[3] = &unk_1E5B57208;
    id v31 = v22;
    [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v24 pathComponent:@"pushnotify/subscribe" callbackQueue:v21 completion:v30];

    goto LABEL_25;
  }
  if (v18 && v19 && v20) {
    goto LABEL_21;
  }
LABEL_22:
  id v25 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v25, OS_LOG_TYPE_ERROR, "failed to submit request for subscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, void, void))v22 + 2))(v22, 0, 0);
LABEL_25:
}

void __162__FCNotificationsEndpointConnection_subscribeNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to subscribe notifications for channels error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)unsubscribeNotificationsForChannelIDs:(id)a3 userID:(id)a4 deviceToken:(id)a5 storefrontID:(id)a6 deviceDigestMode:(int)a7 callbackQueue:(id)a8 completion:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (![v15 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v24 = (void *)[[NSString alloc] initWithFormat:@"channelIDs should not be empty"];
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 256;
    __int16 v36 = 2114;
    int v37 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 257;
    __int16 v36 = 2114;
    int v37 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 258;
    __int16 v36 = 2114;
    int v37 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v18) {
      goto LABEL_11;
    }
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForChannelIDs:userID:deviceToken:storefrontID:devi"
          "ceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 259;
    __int16 v36 = 2114;
    int v37 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  uint64_t v21 = [v15 count];
  if (v18 && v17 && v16 && v21)
  {
    id v22 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithChannelIDs:v15 paidChannelIDs:0 userID:v16 deviceToken:v17 storefrontID:v18 deviceDigestMode:v10];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __149__FCNotificationsEndpointConnection_unsubscribeNotificationsForChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v28[3] = &unk_1E5B57208;
    id v29 = v20;
    [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v22 pathComponent:@"pushnotify/unsubscribe" callbackQueue:v19 completion:v28];
  }
  else
  {
    uint64_t v23 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v23, OS_LOG_TYPE_ERROR, "failed to submit request for unsubscribe notifications, invalid parameters", buf, 2u);
    }
    (*((void (**)(id, void, void))v20 + 2))(v20, 0, 0);
  }
}

void __149__FCNotificationsEndpointConnection_unsubscribeNotificationsForChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to unsubscribe notifications for channels with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)refreshNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8 callbackQueue:(id)a9 completion:(id)a10
{
  uint64_t v10 = *(void *)&a8;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v25 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storef"
          "rontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 296;
    __int16 v36 = 2114;
    int v37 = v25;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19) {
      goto LABEL_6;
    }
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storef"
          "rontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 297;
    __int16 v36 = 2114;
    int v37 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v20)
  {
    if (v18 && v19)
    {
      uint64_t v23 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithChannelIDs:v16 paidChannelIDs:v17 userID:v18 deviceToken:v19 storefrontID:v20 deviceDigestMode:v10];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __160__FCNotificationsEndpointConnection_refreshNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
      v28[3] = &unk_1E5B57208;
      id v29 = v22;
      [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v23 pathComponent:@"pushnotify/updatetoken" callbackQueue:v21 completion:v28];

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    id v31 = "-[FCNotificationsEndpointConnection refreshNotificationsForChannelIDs:paidChannelIDs:userID:deviceToken:storef"
          "rontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v32 = 2080;
    v33 = "FCNotificationsEndpointConnection.m";
    __int16 v34 = 1024;
    int v35 = 298;
    __int16 v36 = 2114;
    int v37 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  id v24 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v24, OS_LOG_TYPE_ERROR, "failed to submit refresh request for subscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, void, void))v22 + 2))(v22, 0, 0);
LABEL_15:
}

void __160__FCNotificationsEndpointConnection_refreshNotificationsForChannelIDs_paidChannelIDs_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to refresh notifications for channels with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)subscribeNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  if (![v17 count] && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = (void *)[[NSString alloc] initWithFormat:@"topicIDs should include some values"];
    *(_DWORD *)buf = 136315906;
    int v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    __int16 v40 = 1024;
    int v41 = 337;
    __int16 v42 = 2114;
    v43 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v19) {
      goto LABEL_6;
    }
  }
  else if (v19)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
    *(_DWORD *)buf = 136315906;
    int v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    __int16 v40 = 1024;
    int v41 = 338;
    __int16 v42 = 2114;
    v43 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    int v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    __int16 v40 = 1024;
    int v41 = 339;
    __int16 v42 = 2114;
    v43 = v30;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v21) {
      goto LABEL_11;
    }
  }
  else if (v21)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v31 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    int v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    __int16 v40 = 1024;
    int v41 = 340;
    __int16 v42 = 2114;
    v43 = v31;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_11:
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v32 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    int v37 = "-[FCNotificationsEndpointConnection subscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID"
          ":deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v38 = 2080;
    v39 = "FCNotificationsEndpointConnection.m";
    __int16 v40 = 1024;
    int v41 = 341;
    __int16 v42 = 2114;
    v43 = v32;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v25 = [v17 count];
  if (v22 && v21 && v20 && v19 && v25)
  {
    LODWORD(v33) = a9;
    BOOL v26 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithTopicIDs:v17 fromChannelID:v19 withTopicGroupingID:v18 userID:v20 deviceToken:v21 storefrontID:v22 deviceDigestMode:v33];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __179__FCNotificationsEndpointConnection_subscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v34[3] = &unk_1E5B57208;
    id v35 = v24;
    [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v26 pathComponent:@"pushnotify/subscribe" callbackQueue:v23 completion:v34];
  }
  else
  {
    id v27 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v27, OS_LOG_TYPE_ERROR, "failed to submit request for subscribe notifications, invalid parameters", buf, 2u);
    }
    (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
  }
}

void __179__FCNotificationsEndpointConnection_subscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to subscribe notifications for topic error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)unsubscribeNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    BOOL v26 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
    *(_DWORD *)buf = 136315906;
    id v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:user"
          "ID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v36 = 2080;
    int v37 = "FCNotificationsEndpointConnection.m";
    __int16 v38 = 1024;
    int v39 = 380;
    __int16 v40 = 2114;
    int v41 = v26;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v20) {
      goto LABEL_6;
    }
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    id v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:user"
          "ID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v36 = 2080;
    int v37 = "FCNotificationsEndpointConnection.m";
    __int16 v38 = 1024;
    int v39 = 381;
    __int16 v40 = 2114;
    int v41 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    id v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:user"
          "ID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v36 = 2080;
    int v37 = "FCNotificationsEndpointConnection.m";
    __int16 v38 = 1024;
    int v39 = 382;
    __int16 v40 = 2114;
    int v41 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v22) {
      goto LABEL_9;
    }
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      __int16 v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
      *(_DWORD *)buf = 136315906;
      id v35 = "-[FCNotificationsEndpointConnection unsubscribeNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:us"
            "erID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
      __int16 v36 = 2080;
      int v37 = "FCNotificationsEndpointConnection.m";
      __int16 v38 = 1024;
      int v39 = 383;
      __int16 v40 = 2114;
      int v41 = v30;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    goto LABEL_18;
  }
  if (!v22) {
    goto LABEL_16;
  }
LABEL_9:
  if (v19 && v20 && v21)
  {
    LODWORD(v31) = a9;
    uint64_t v25 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithTopicIDs:v17 fromChannelID:v19 withTopicGroupingID:v18 userID:v20 deviceToken:v21 storefrontID:v22 deviceDigestMode:v31];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __181__FCNotificationsEndpointConnection_unsubscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
    v32[3] = &unk_1E5B57208;
    id v33 = v24;
    [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v25 pathComponent:@"pushnotify/unsubscribe" callbackQueue:v23 completion:v32];

    goto LABEL_21;
  }
LABEL_18:
  id v29 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v29, OS_LOG_TYPE_ERROR, "failed to submit request for unsubscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
LABEL_21:
}

void __181__FCNotificationsEndpointConnection_unsubscribeNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to unsubscribe notifications for topic error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)refreshNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9 callbackQueue:(id)a10 completion:(id)a11
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a10;
  id v24 = a11;
  if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v27 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "userID");
    *(_DWORD *)buf = 136315906;
    __int16 v34 = "-[FCNotificationsEndpointConnection refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:d"
          "eviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v35 = 2080;
    __int16 v36 = "FCNotificationsEndpointConnection.m";
    __int16 v37 = 1024;
    int v38 = 424;
    __int16 v39 = 2114;
    __int16 v40 = v27;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v21) {
      goto LABEL_6;
    }
  }
  else if (v21)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    __int16 v28 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
    *(_DWORD *)buf = 136315906;
    __int16 v34 = "-[FCNotificationsEndpointConnection refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:d"
          "eviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v35 = 2080;
    __int16 v36 = "FCNotificationsEndpointConnection.m";
    __int16 v37 = 1024;
    int v38 = 425;
    __int16 v39 = 2114;
    __int16 v40 = v28;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  if (v22)
  {
    if (v20 && v21)
    {
      LODWORD(v30) = a9;
      uint64_t v25 = [(FCNotificationsEndpointConnection *)self _pushNotifySubscriptionRequestWithTopicIDs:v17 fromChannelID:v19 withTopicGroupingID:v18 userID:v20 deviceToken:v21 storefrontID:v22 deviceDigestMode:v30];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __177__FCNotificationsEndpointConnection_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke;
      v31[3] = &unk_1E5B57208;
      id v32 = v24;
      [(FCNotificationsEndpointConnection *)self _sendNotificationsSubscriptionRequest:v25 pathComponent:@"pushnotify/updatetoken" callbackQueue:v23 completion:v31];

      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v29 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "storefrontID");
    *(_DWORD *)buf = 136315906;
    __int16 v34 = "-[FCNotificationsEndpointConnection refreshNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:userID:d"
          "eviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:]";
    __int16 v35 = 2080;
    __int16 v36 = "FCNotificationsEndpointConnection.m";
    __int16 v37 = 1024;
    int v38 = 426;
    __int16 v39 = 2114;
    __int16 v40 = v29;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  BOOL v26 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1A460D000, v26, OS_LOG_TYPE_ERROR, "failed to submit refresh request for subscribe notifications, invalid parameters", buf, 2u);
  }
  (*((void (**)(id, void, void))v24 + 2))(v24, 0, 0);
LABEL_15:
}

void __177__FCNotificationsEndpointConnection_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID_userID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138543362;
      id v9 = v5;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to refresh notifications for topics with error: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (void)modifyMarketingSubscriptionWithType:(int)a3 action:(int)a4 dsid:(id)a5 callbackQueue:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  uint64_t v10 = *(void *)&a3;
  id v12 = a6;
  id v13 = a7;
  id v14 = [(FCNotificationsEndpointConnection *)self _marketingSubscriptionRequestWithType:v10 action:v9 dsid:a5];
  id v15 = [(FCNotificationsEndpointConnection *)self serialQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke;
  v19[3] = &unk_1E5B57230;
  v19[4] = self;
  id v20 = v14;
  id v21 = v12;
  id v22 = v13;
  id v16 = v13;
  id v17 = v12;
  id v18 = v14;
  [v15 enqueueBlock:v19];
}

void __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) baseURL];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) baseURL];
    id v6 = [v5 URLByAppendingPathComponent:@"marketingNotification/subscription"];

    uint64_t v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_INFO, "ModifyMarketingSubscription url: %@ request: %@", buf, 0x16u);
    }
    uint64_t v9 = [*(id *)(a1 + 32) endpointConnection];
    uint64_t v10 = [*(id *)(a1 + 40) data];
    int v11 = *MEMORY[0x1E4F18CF0];
    uint64_t v12 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke_34;
    v17[3] = &unk_1E5B50DF8;
    id v18 = v6;
    id v19 = v3;
    id v20 = *(id *)(a1 + 56);
    id v13 = v6;
    LODWORD(v14) = v11;
    [v9 performHTTPRequestWithURL:v13 method:@"POST" data:v10 contentType:@"application/x-protobuf" priority:1 requiresMescalSigning:v12 callbackQueue:v14 completion:v17];
  }
  else
  {
    v3[2](v3);
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15)
    {
      id v16 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
}

void __110__FCNotificationsEndpointConnection_modifyMarketingSubscriptionWithType_action_dsid_callbackQueue_completion___block_invoke_34(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_INFO, "ModifyMarketingSubscription response: %@ error: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    int v11 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v8 statusCode], a1[4]);
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v12 = a1[6];
    if (v12) {
      (*(void (**)(uint64_t, BOOL, void *))(v12 + 16))(v12, v11 == 0, v11);
    }
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v13 = a1[6];
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v9);
    }
  }
}

- (id)_marketingSubscriptionRequestWithType:(int)a3 action:(int)a4 dsid:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x1E4F82AB8];
  id v9 = a5;
  id v10 = objc_alloc_init(v8);
  int v11 = [(FCNotificationsEndpointConnection *)self _deviceInfoWithDeviceToken:0 deviceDigestMode:0];
  [v10 setDeviceInfo:v11];
  [v10 setDsid:v9];

  if (a4 == 2) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = a4 == 1;
  }
  [v10 setSubscriptionAction:v12];
  [v10 setSubscriptionType:a3 != 0];

  return v10;
}

- (void)_sendNotificationsSubscriptionRequest:(id)a3 pathComponent:(id)a4 callbackQueue:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "subscriptionRequest");
      *(_DWORD *)buf = 136315906;
      id v22 = "-[FCNotificationsEndpointConnection _sendNotificationsSubscriptionRequest:pathComponent:callbackQueue:completion:]";
      __int16 v23 = 2080;
      uint64_t v24 = "FCNotificationsEndpointConnection.m";
      __int16 v25 = 1024;
      int v26 = 522;
      __int16 v27 = 2114;
      __int16 v28 = v15;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v13) {
        goto LABEL_6;
      }
    }
    else if (!v13)
    {
      goto LABEL_6;
    }
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
    goto LABEL_6;
  }
  int v14 = [(FCNotificationsEndpointConnection *)self serialQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke;
  v16[3] = &unk_1E5B57258;
  v16[4] = self;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  id v20 = v13;
  [v14 enqueueBlock:v16];

LABEL_6:
}

void __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) baseURL];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) baseURL];
    id v6 = [v5 URLByAppendingPathComponent:*(void *)(a1 + 40)];

    id v7 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      uint64_t v24 = v8;
      _os_log_impl(&dword_1A460D000, v7, OS_LOG_TYPE_INFO, "PushNotify url: %@ request: %@", buf, 0x16u);
    }
    id v9 = [*(id *)(a1 + 32) endpointConnection];
    id v10 = [*(id *)(a1 + 48) data];
    int v11 = *MEMORY[0x1E4F18CF0];
    uint64_t v12 = *(void *)(a1 + 56);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke_38;
    v17[3] = &unk_1E5B50DF8;
    id v18 = v6;
    id v19 = v3;
    id v20 = *(id *)(a1 + 64);
    id v13 = v6;
    LODWORD(v14) = v11;
    [v9 performHTTPRequestWithURL:v13 method:@"POST" data:v10 contentType:@"application/x-protobuf" priority:1 requiresMescalSigning:v12 callbackQueue:v14 completion:v17];
  }
  else
  {
    v3[2](v3);
    uint64_t v15 = *(void *)(a1 + 64);
    if (v15)
    {
      __int16 v16 = +[FCEndpointConnection errorForStatus:-2000 url:0];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
}

void __114__FCNotificationsEndpointConnection__sendNotificationsSubscriptionRequest_pathComponent_callbackQueue_completion___block_invoke_38(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1A460D000, v10, OS_LOG_TYPE_INFO, "PushNotify response: %@ error: %@", (uint8_t *)&v14, 0x16u);
  }
  if (v8)
  {
    int v11 = +[FCEndpointConnection errorForStatus:url:](FCEndpointConnection, "errorForStatus:url:", [v8 statusCode], a1[4]);
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v12 = a1[6];
    if (v12) {
      (*(void (**)(uint64_t, BOOL, void *))(v12 + 16))(v12, v11 == 0, v11);
    }
  }
  else
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v13 = a1[6];
    if (v13) {
      (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v9);
    }
  }
}

- (id)_pushNotifySubscriptionRequestWithChannelIDs:(id)a3 paidChannelIDs:(id)a4 userID:(id)a5 deviceToken:(id)a6 storefrontID:(id)a7 deviceDigestMode:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  v38[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  __int16 v16 = (objc_class *)MEMORY[0x1E4F82B70];
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = objc_alloc_init(v16);
  [v20 setNotificationUserId:v19];

  [v20 setUserStorefrontId:v17];
  id v21 = [(FCNotificationsEndpointConnection *)self _deviceInfoWithDeviceToken:v18 deviceDigestMode:v8];

  [v20 setDeviceInfo:v21];
  id v22 = [(FCNotificationsEndpointConnection *)self configurationManager];
  __int16 v23 = [v22 configuration];
  uint64_t v24 = [v23 editorialChannelID];

  uint64_t v25 = [(FCNotificationsEndpointConnection *)self bundleSubscriptionManager];
  if (v25)
  {
    int v26 = [(FCNotificationsEndpointConnection *)self bundleSubscriptionManager];
    __int16 v27 = [v26 cachedSubscription];
    unint64_t v28 = [v27 subscriptionState];
  }
  else
  {
    unint64_t v28 = 3;
  }

  if ([v14 containsObject:v24] && v28 <= 1)
  {
    uint64_t v29 = objc_msgSend(v14, "fc_arrayByRemovingObject:", v24);

    uint64_t v30 = (void *)MEMORY[0x1E4F1C978];
    v38[0] = v24;
    uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
    uint64_t v32 = objc_msgSend(v30, "fc_arrayByAddingUniqueObjectsFromArray:toArray:", v31, v15);

    id v15 = (id)v32;
    id v14 = (id)v29;
  }
  id v33 = [MEMORY[0x1E4F1CA48] array];
  if ([v14 count])
  {
    __int16 v34 = [(FCNotificationsEndpointConnection *)self _notificationEntitiesWithChannelIDs:v14 isPaid:0 paidBundleSubscriptionStatus:v28 editorialChannelID:v24];
    [v33 addObjectsFromArray:v34];
  }
  if ([v15 count])
  {
    __int16 v35 = [(FCNotificationsEndpointConnection *)self _notificationEntitiesWithChannelIDs:v15 isPaid:1 paidBundleSubscriptionStatus:v28 editorialChannelID:v24];
    [v33 addObjectsFromArray:v35];
  }
  if (![v14 count] && !objc_msgSend(v15, "count"))
  {
    __int16 v36 = [(FCNotificationsEndpointConnection *)self _notificationEntitiesWithChannelIDs:0 isPaid:0 paidBundleSubscriptionStatus:v28 editorialChannelID:v24];
    [v33 addObjectsFromArray:v36];
  }
  [v20 setNotificationEntitys:v33];

  return v20;
}

- (id)_pushNotifySubscriptionRequestWithTopicIDs:(id)a3 fromChannelID:(id)a4 withTopicGroupingID:(id)a5 userID:(id)a6 deviceToken:(id)a7 storefrontID:(id)a8 deviceDigestMode:(int)a9
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v15 = (objc_class *)MEMORY[0x1E4F82B70];
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v36 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = objc_alloc_init(v15);
  [v21 setNotificationUserId:v18];

  [v21 setUserStorefrontId:v16];
  id v22 = [(FCNotificationsEndpointConnection *)self _deviceInfoWithDeviceToken:v17 deviceDigestMode:a9];

  [v21 setDeviceInfo:v22];
  __int16 v23 = [(FCNotificationsEndpointConnection *)self bundleSubscriptionManager];
  if (v23)
  {
    uint64_t v24 = [(FCNotificationsEndpointConnection *)self bundleSubscriptionManager];
    uint64_t v25 = [v24 cachedSubscription];
    uint64_t v26 = [v25 subscriptionState];
  }
  else
  {
    uint64_t v26 = 3;
  }

  id v38 = v19;
  __int16 v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  unint64_t v28 = [(FCNotificationsEndpointConnection *)self _notificationEntityWithChannelIDs:v27 isPaid:0 paidBundleSubscriptionStatus:v26 notificationType:3];
  v39[0] = v28;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];

  uint64_t v30 = (void *)[v29 mutableCopy];
  [v21 setNotificationEntitys:v30];

  id v31 = objc_alloc_init(MEMORY[0x1E4F82C30]);
  [v31 setTopicGroupingId:v36];

  uint64_t v32 = (void *)[v20 mutableCopy];
  [v31 setTopicIds:v32];

  id v37 = v31;
  id v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];

  __int16 v34 = (void *)[v33 mutableCopy];
  [v21 setTopicsFolloweds:v34];

  return v21;
}

- (id)_deviceInfoWithDeviceToken:(id)a3 deviceDigestMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = (objc_class *)MEMORY[0x1E4F82A20];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setDevicePushToken:v7];

  id v9 = [(FCNotificationsEndpointConnection *)self deviceType];
  [v8 setDeviceType:v9];

  [v8 setDeviceTokenEnv:2];
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA20], "fc_preferredLanguageCodes");
  int v11 = (void *)[v10 mutableCopy];
  [v8 setDevicePreferredLanguages:v11];

  uint64_t v12 = [(FCNotificationsEndpointConnection *)self deviceOSVersion];
  [v8 setDeviceOsVersion:v12];

  uint64_t v13 = [MEMORY[0x1E4F28B50] mainBundle];
  id v14 = [v13 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  [v8 setDeviceAppVersion:v14];

  id v15 = [MEMORY[0x1E4F28B50] mainBundle];
  id v16 = [v15 bundleIdentifier];
  [v8 setDeviceAppBundleId:v16];

  id v17 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  id v18 = [v17 abbreviation];
  [v8 setDeviceTimezone:v18];

  objc_msgSend(v8, "setDeviceUtcOffset:", objc_msgSend(v17, "secondsFromGMT"));
  [v17 daylightSavingTimeOffset];
  [v8 setDeviceDstOffset:(uint64_t)v19];
  [v8 setDeviceDigestMode:v4];

  return v8;
}

- (id)_notificationEntitiesWithChannelIDs:(id)a3 isPaid:(BOOL)a4 paidBundleSubscriptionStatus:(unint64_t)a5 editorialChannelID:(id)a6
{
  BOOL v8 = a4;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  if ([v10 containsObject:v11])
  {
    v17[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    id v14 = [(FCNotificationsEndpointConnection *)self _notificationEntityWithChannelIDs:v13 isPaid:a5 < 2 paidBundleSubscriptionStatus:a5 notificationType:2];

    [v12 addObject:v14];
  }
  id v15 = [(FCNotificationsEndpointConnection *)self _notificationEntityWithChannelIDs:v10 isPaid:v8 paidBundleSubscriptionStatus:a5 notificationType:1];
  [v12 addObject:v15];

  return v12;
}

- (id)_notificationEntityWithChannelIDs:(id)a3 isPaid:(BOOL)a4 paidBundleSubscriptionStatus:(unint64_t)a5 notificationType:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v8 = a4;
  id v10 = (objc_class *)MEMORY[0x1E4F82AD8];
  id v11 = a3;
  id v12 = objc_alloc_init(v10);
  uint64_t v13 = (void *)[v11 mutableCopy];

  [v12 setTagIds:v13];
  if (v8) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  [v12 setSubscriberType:v14];
  objc_msgSend(v12, "setPaidBundleSubscriptionStatus:", -[FCNotificationsEndpointConnection _pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:](self, "_pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:", a5));
  [v12 setNotificationType:v6];
  return v12;
}

- (int)_pbNotificationEntityPaidBundleSubscriptionStatusFromSubscriptionState:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 1;
  }
  else {
    return dword_1A4973DAC[a3 - 1];
  }
}

- (void)_updateNotificationDropboxDataWithBaseURL:(id)a3 notificationUserID:(id)a4 deviceToken:(id)a5 storefrontID:(id)a6 deviceDigestMode:(int)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [(FCNotificationsEndpointConnection *)self fileCoordinatedNotificationDropbox];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __140__FCNotificationsEndpointConnection__updateNotificationDropboxDataWithBaseURL_notificationUserID_deviceToken_storefrontID_deviceDigestMode___block_invoke;
  v21[3] = &unk_1E5B57280;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int v26 = a7;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  [v16 depositWithAccessor:v21 completion:0];
}

void __140__FCNotificationsEndpointConnection__updateNotificationDropboxDataWithBaseURL_notificationUserID_deviceToken_storefrontID_deviceDigestMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setBaseURLString:v3];
  [v4 setNotificationUserID:*(void *)(a1 + 40)];
  [v4 setDeviceToken:*(void *)(a1 + 48)];
  [v4 setStorefrontID:*(void *)(a1 + 56)];
  [v4 setDeviceDigestMode:*(unsigned int *)(a1 + 64)];
}

- (id)_notificationDataInDropbox
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__49;
  id v15 = __Block_byref_object_dispose__49;
  id v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  id v4 = [(FCNotificationsEndpointConnection *)self fileCoordinatedNotificationDropbox];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__FCNotificationsEndpointConnection__notificationDataInDropbox__block_invoke;
  v8[3] = &unk_1E5B572A8;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 peekWithAccessor:v8];

  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __63__FCNotificationsEndpointConnection__notificationDataInDropbox__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)configurationManager:(id)a3 configurationDidChange:(id)a4
{
  id v5 = a4;
  id v6 = [(FCNotificationsEndpointConnection *)self serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__FCNotificationsEndpointConnection_configurationManager_configurationDidChange___block_invoke;
  v8[3] = &unk_1E5B50E70;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 enqueueBlock:v8];
}

void __81__FCNotificationsEndpointConnection_configurationManager_configurationDidChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 updateBaseURL:v3];
  v4[2]();
}

- (FCEndpointConnection)endpointConnection
{
  return self->_endpointConnection;
}

- (void)setEndpointConnection:(id)a3
{
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
}

- (void)setSerialQueue:(id)a3
{
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)deviceOSVersion
{
  return self->_deviceOSVersion;
}

- (void)setDeviceOSVersion:(id)a3
{
}

- (FCFileCoordinatedNotificationDropbox)fileCoordinatedNotificationDropbox
{
  return self->_fileCoordinatedNotificationDropbox;
}

- (void)setFileCoordinatedNotificationDropbox:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedNotificationDropbox, 0);
  objc_storeStrong((id *)&self->_deviceOSVersion, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_endpointConnection, 0);
}

@end