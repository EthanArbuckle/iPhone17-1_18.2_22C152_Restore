@interface FCNotificationController
- (BOOL)appleNewsNotificationsAllowed;
- (BOOL)publisherNotificationsAllowed;
- (BOOL)refreshNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4;
- (BOOL)refreshNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5;
- (BOOL)registerNotificationsForChannelID:(id)a3 isPaid:(BOOL)a4;
- (BOOL)registerNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5;
- (BOOL)setMarketingNotificationsEnabled:(BOOL)a3 error:(id *)a4;
- (BOOL)setPuzzleNotificationsEnabled:(BOOL)a3 userTriggered:(BOOL)a4 error:(id *)a5;
- (BOOL)unregisterNotificationsForChannelID:(id)a3;
- (BOOL)unregisterNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5;
- (FCCommandQueue)commandQueue;
- (FCCoreConfigurationManager)configurationManager;
- (FCNotificationController)init;
- (FCNotificationController)initWithUserInfo:(id)a3 commandQueue:(id)a4 configurationManager:(id)a5 publisherNotificationsAllowed:(BOOL)a6 appleNewsNotificationsAllowed:(BOOL)a7;
- (FCUserInfo)userInfo;
- (NSString)deviceToken;
- (NSString)notificationsUserID;
- (id)appendBreakingNewsIfNeededToChannelIDs:(id)a3;
- (int)deviceDigestMode;
- (void)_registerDeviceToken:(id)a3 deviceDigestMode:(int)a4;
- (void)dealloc;
- (void)deviceDigestModeDidUpdateToDigestMode:(int)a3;
- (void)refreshNotificationsFromAppleNews;
- (void)registerDeviceToken:(id)a3 deviceDigestMode:(int)a4;
- (void)setAppleNewsNotificationsAllowed:(BOOL)a3;
- (void)setCommandQueue:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDeviceDigestMode:(int)a3;
- (void)setDeviceToken:(id)a3;
- (void)setEndOfAudioTrackNotificationsEnabled:(BOOL)a3;
- (void)setNewIssueNotificationsEnabled:(BOOL)a3;
- (void)setNotificationsUserID:(id)a3;
- (void)setPublisherNotificationsAllowed:(BOOL)a3;
- (void)setSportsTopicNotificationsEnabled:(BOOL)a3;
- (void)setUserInfo:(id)a3;
- (void)userInfoDidChangeNotificationsUserID:(id)a3;
@end

@implementation FCNotificationController

void __63__FCNotificationController_setSportsTopicNotificationsEnabled___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v4 = v2;
  if (*(unsigned char *)(a1 + 40)) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 2;
  }
  [v2 setSportsTopicNotificationsEnabledState:v3];
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (BOOL)setPuzzleNotificationsEnabled:(BOOL)a3 userTriggered:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(FCNotificationController *)self appleNewsNotificationsAllowed])
  {
    v9 = [(FCNotificationController *)self configurationManager];
    v10 = [v9 configuration];
    v11 = [v10 puzzlesConfig];
    v12 = [v11 puzzleHubTagID];

    if (!v12)
    {
      v18 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_1A460D000, v18, OS_LOG_TYPE_ERROR, "Failed to get puzzleHubTagID. Cannot alter puzzles notifications status.", (uint8_t *)&v22, 2u);
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = @"Failed to get puzzleHubTagID. Cannot alter marketing notifications status without a valid puzzleHubTagID.";
      goto LABEL_19;
    }
    if (v7)
    {
      if (![(FCNotificationController *)self registerNotificationsForChannelID:v12 isPaid:0])
      {
        v13 = FCPushNotificationsLog;
        if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
        {
          int v22 = 138412290;
          v23 = v12;
          _os_log_error_impl(&dword_1A460D000, v13, OS_LOG_TYPE_ERROR, "Failed to register notifications for %@.", (uint8_t *)&v22, 0xCu);
        }
        v14 = (void *)MEMORY[0x1E4F28C58];
        v15 = @"Failed to register notifications for puzzleHubTagID.";
LABEL_19:
        objc_msgSend(v14, "fc_errorWithCode:description:", 16, v15);
        BOOL v17 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
    }
    else if (![(FCNotificationController *)self unregisterNotificationsForChannelID:v12])
    {
      v20 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        v23 = v12;
        _os_log_error_impl(&dword_1A460D000, v20, OS_LOG_TYPE_ERROR, "Failed to unregister notifications for %@.", (uint8_t *)&v22, 0xCu);
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      v15 = @"Failed to unregister notifications for puzzleHubTagID.";
      goto LABEL_19;
    }
    v19 = [(FCNotificationController *)self userInfo];
    [v19 setPuzzleNotificationsEnabled:v7 userTriggered:v6];

    BOOL v17 = 1;
LABEL_20:

    return v17;
  }
  v16 = FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v22) = 0;
    _os_log_error_impl(&dword_1A460D000, v16, OS_LOG_TYPE_ERROR, "Apple News push notifications not allowed. Cannot alter puzzles notifications status.", (uint8_t *)&v22, 2u);
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Apple News push notifications not allowed. Cannot alter puzzles notifications status.");
  BOOL v17 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  return v17;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (BOOL)appleNewsNotificationsAllowed
{
  return self->_appleNewsNotificationsAllowed;
}

- (void)_registerDeviceToken:(id)a3 deviceDigestMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(FCNotificationController *)self publisherNotificationsAllowed]
    || [(FCNotificationController *)self appleNewsNotificationsAllowed])
  {
    if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      BOOL v17 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "deviceToken");
      *(_DWORD *)buf = 136315906;
      v21 = "-[FCNotificationController _registerDeviceToken:deviceDigestMode:]";
      __int16 v22 = 2080;
      v23 = "FCNotificationController.m";
      __int16 v24 = 1024;
      int v25 = 115;
      __int16 v26 = 2114;
      v27 = v17;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    BOOL v7 = +[FCAppleAccount sharedAccount];
    v8 = [v7 contentStoreFrontID];

    if (v6)
    {
      v9 = [(FCNotificationController *)self notificationsUserID];

      if (v9)
      {
        v10 = +[FCNetworkReachability sharedNetworkReachability];
        if ([v10 isCloudKitReachable])
        {
          v11 = [FCRegisterDeviceTokenCommand alloc];
          v12 = [(FCNotificationController *)self notificationsUserID];
          v13 = [(FCRegisterDeviceTokenCommand *)v11 initWithUserID:v12 deviceToken:v6 storefrontID:v8 deviceDigestMode:v4];

          v14 = [(FCNotificationController *)self commandQueue];
          [v14 addCommand:v13];
        }
        else
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __66__FCNotificationController__registerDeviceToken_deviceDigestMode___block_invoke_22;
          v18[3] = &unk_1E5B4BE70;
          v18[4] = self;
          id v19 = v8;
          __66__FCNotificationController__registerDeviceToken_deviceDigestMode___block_invoke_22((uint64_t)v18);
        }
        goto LABEL_17;
      }
      v15 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "failed to create command to register device token: invalid notificationsUserID";
        goto LABEL_14;
      }
    }
    else
    {
      v15 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "failed to create command to register device token: invalid deviceToken";
LABEL_14:
        _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
    }
LABEL_17:
  }
}

- (NSString)notificationsUserID
{
  return self->_notificationsUserID;
}

- (void)registerDeviceToken:(id)a3 deviceDigestMode:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = [(FCNotificationController *)self deviceToken];
  char v7 = [v6 isEqualToString:v8];

  if ((v7 & 1) == 0)
  {
    [(FCNotificationController *)self setDeviceToken:v8];
    [(FCNotificationController *)self setDeviceDigestMode:v4];
    if (v8) {
      [(FCNotificationController *)self _registerDeviceToken:v8 deviceDigestMode:v4];
    }
  }
}

- (BOOL)unregisterNotificationsForChannelID:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(FCNotificationController *)self publisherNotificationsAllowed])
  {
    if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
      *(_DWORD *)buf = 136315906;
      v32 = "-[FCNotificationController unregisterNotificationsForChannelID:]";
      __int16 v33 = 2080;
      v34 = "FCNotificationController.m";
      __int16 v35 = 1024;
      int v36 = 184;
      __int16 v37 = 2114;
      v38 = v20;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    v5 = +[FCAppleAccount sharedAccount];
    id v6 = [v5 contentStoreFrontID];

    if (v4
      && ([(FCNotificationController *)self deviceToken], (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0)
      && (id v8 = (void *)v7,
          [(FCNotificationController *)self notificationsUserID],
          v9 = objc_claimAutoreleasedReturnValue(),
          v9,
          v8,
          v9))
    {
      v10 = +[FCNetworkReachability sharedNetworkReachability];
      if ([v10 isCloudKitReachable])
      {
        id v30 = v4;
        char v11 = 1;
        v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        v13 = [(FCNotificationController *)self appendBreakingNewsIfNeededToChannelIDs:v12];

        v14 = [FCModifyNotificationsForChannelsCommand alloc];
        v15 = [(FCNotificationController *)self notificationsUserID];
        v16 = [(FCNotificationController *)self deviceToken];
        LODWORD(v21) = [(FCNotificationController *)self deviceDigestMode];
        BOOL v17 = [(FCModifyNotificationsForChannelsCommand *)v14 initWithChannelIDsToAdd:0 paidChannelIDsToAdd:0 channelIDsToRemove:v13 userID:v15 deviceToken:v16 storefrontID:v6 deviceDigestMode:v21];

        v18 = [(FCNotificationController *)self commandQueue];
        [v18 addCommand:v17];
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_35;
        v22[3] = &unk_1E5B4D3D0;
        id v23 = v4;
        __int16 v24 = self;
        id v25 = v6;
        char v11 = __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_35((uint64_t)v22);

        v13 = v23;
      }
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_34;
      v26[3] = &unk_1E5B4D3D0;
      id v27 = v4;
      uint64_t v28 = self;
      id v29 = v6;
      char v11 = __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_34((uint64_t)v26);

      v10 = v27;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (NSString)deviceToken
{
  return self->_deviceToken;
}

- (BOOL)publisherNotificationsAllowed
{
  return self->_publisherNotificationsAllowed;
}

uint64_t __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_34(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v4 = *(void **)(a1 + 40);
    id v6 = v2;
    uint64_t v7 = [v4 deviceToken];
    id v8 = [*(id *)(a1 + 40) notificationsUserID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    v13 = v7;
    __int16 v14 = 2114;
    v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to create command to unregister notifications for channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);
  }
  return 0;
}

- (void)setDeviceToken:(id)a3
{
}

- (void)setDeviceDigestMode:(int)a3
{
  self->_deviceDigestMode = a3;
}

- (FCCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (FCNotificationController)initWithUserInfo:(id)a3 commandQueue:(id)a4 configurationManager:(id)a5 publisherNotificationsAllowed:(BOOL)a6 appleNewsNotificationsAllowed:(BOOL)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v21 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "commandQueue");
    *(_DWORD *)buf = 136315906;
    __int16 v24 = "-[FCNotificationController initWithUserInfo:commandQueue:configurationManager:publisherNotificationsAllowed:ap"
          "pleNewsNotificationsAllowed:]";
    __int16 v25 = 2080;
    __int16 v26 = "FCNotificationController.m";
    __int16 v27 = 1024;
    int v28 = 57;
    __int16 v29 = 2114;
    id v30 = v21;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v22.receiver = self;
  v22.super_class = (Class)FCNotificationController;
  __int16 v16 = [(FCNotificationController *)&v22 init];
  uint64_t v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_userInfo, a3);
    uint64_t v18 = [v13 notificationsUserID];
    notificationsUserID = v17->_notificationsUserID;
    v17->_notificationsUserID = (NSString *)v18;

    objc_storeStrong((id *)&v17->_commandQueue, a4);
    objc_storeStrong((id *)&v17->_configurationManager, a5);
    v17->_publisherNotificationsAllowed = a6;
    v17->_appleNewsNotificationsAllowed = a7;
    [v13 addObserver:v17];
  }

  return v17;
}

- (void)setSportsTopicNotificationsEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__FCNotificationController_setSportsTopicNotificationsEnabled___block_invoke;
  v3[3] = &unk_1E5B5C5D0;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

- (FCNotificationController)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    id v8 = "-[FCNotificationController init]";
    __int16 v9 = 2080;
    int v10 = "FCNotificationController.m";
    __int16 v11 = 1024;
    int v12 = 48;
    __int16 v13 = 2114;
    id v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCNotificationController init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)dealloc
{
  uint64_t v3 = [(FCNotificationController *)self userInfo];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)FCNotificationController;
  [(FCNotificationController *)&v4 dealloc];
}

- (void)deviceDigestModeDidUpdateToDigestMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  -[FCNotificationController setDeviceDigestMode:](self, "setDeviceDigestMode:");
  uint64_t v5 = [(FCNotificationController *)self deviceToken];

  if (v5)
  {
    id v7 = [(FCNotificationController *)self deviceToken];
    [(FCNotificationController *)self _registerDeviceToken:v7 deviceDigestMode:v3];
  }
  else
  {
    id v6 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to update digest mode; cannot call CAPI endpoint without device token",
        buf,
        2u);
    }
  }
}

void __66__FCNotificationController__registerDeviceToken_deviceDigestMode___block_invoke_22(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    objc_super v4 = v2;
    uint64_t v5 = [v3 deviceToken];
    id v6 = [*(id *)(a1 + 32) notificationsUserID];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543874;
    __int16 v9 = v5;
    __int16 v10 = 2114;
    __int16 v11 = v6;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    _os_log_error_impl(&dword_1A460D000, v4, OS_LOG_TYPE_ERROR, "failed to create command to register device token: CloudKit unreachable, deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (BOOL)registerNotificationsForChannelID:(id)a3 isPaid:(BOOL)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(FCNotificationController *)self publisherNotificationsAllowed])
  {
    if (!v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
      *(_DWORD *)buf = 136315906;
      int v36 = "-[FCNotificationController registerNotificationsForChannelID:isPaid:]";
      __int16 v37 = 2080;
      v38 = "FCNotificationController.m";
      __int16 v39 = 1024;
      int v40 = 147;
      __int16 v41 = 2114;
      v42 = v23;
      _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
    }
    uint64_t v7 = +[FCAppleAccount sharedAccount];
    int v8 = [v7 contentStoreFrontID];

    if (v6
      && ([(FCNotificationController *)self deviceToken], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0)
      && (__int16 v10 = (void *)v9,
          [(FCNotificationController *)self notificationsUserID],
          __int16 v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      __int16 v12 = +[FCNetworkReachability sharedNetworkReachability];
      if ([v12 isCloudKitReachable])
      {
        if (a4)
        {
          id v33 = v6;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          uint64_t v14 = 0;
        }
        else
        {
          id v34 = v6;
          uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
          uint64_t v13 = 0;
        }
        __int16 v16 = [(FCNotificationController *)self appendBreakingNewsIfNeededToChannelIDs:v14];

        uint64_t v17 = [FCModifyNotificationsForChannelsCommand alloc];
        uint64_t v18 = [(FCNotificationController *)self notificationsUserID];
        id v19 = [(FCNotificationController *)self deviceToken];
        LODWORD(v24) = [(FCNotificationController *)self deviceDigestMode];
        v20 = [(FCModifyNotificationsForChannelsCommand *)v17 initWithChannelIDsToAdd:v16 paidChannelIDsToAdd:v13 channelIDsToRemove:0 userID:v18 deviceToken:v19 storefrontID:v8 deviceDigestMode:v24];

        uint64_t v21 = [(FCNotificationController *)self commandQueue];
        [v21 addCommand:v20];

        char v15 = 1;
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_29;
        v25[3] = &unk_1E5B4D3D0;
        id v26 = v6;
        __int16 v27 = self;
        id v28 = v8;
        char v15 = __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_29((uint64_t)v25);

        __int16 v16 = v26;
      }
    }
    else
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_28;
      v29[3] = &unk_1E5B4D3D0;
      id v30 = v6;
      uint64_t v31 = self;
      id v32 = v8;
      char v15 = __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_28((uint64_t)v29);

      __int16 v12 = v30;
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

uint64_t __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_28(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    objc_super v4 = *(void **)(a1 + 40);
    id v6 = v2;
    uint64_t v7 = [v4 deviceToken];
    int v8 = [*(id *)(a1 + 40) notificationsUserID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    char v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to create command to register notifications for channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);
  }
  return 0;
}

uint64_t __69__FCNotificationController_registerNotificationsForChannelID_isPaid___block_invoke_29(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    objc_super v4 = *(void **)(a1 + 40);
    id v6 = v2;
    uint64_t v7 = [v4 deviceToken];
    int v8 = [*(id *)(a1 + 40) notificationsUserID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    char v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to create command to register notifications: CloudKit unreachable, channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);
  }
  return 0;
}

uint64_t __64__FCNotificationController_unregisterNotificationsForChannelID___block_invoke_35(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    objc_super v4 = *(void **)(a1 + 40);
    id v6 = v2;
    uint64_t v7 = [v4 deviceToken];
    int v8 = [*(id *)(a1 + 40) notificationsUserID];
    uint64_t v9 = *(void *)(a1 + 48);
    int v10 = 138544130;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    uint64_t v13 = v7;
    __int16 v14 = 2114;
    char v15 = v8;
    __int16 v16 = 2114;
    uint64_t v17 = v9;
    _os_log_error_impl(&dword_1A460D000, v6, OS_LOG_TYPE_ERROR, "failed to create command to unregister notifications: CloudKit unreachable, channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v10, 0x2Au);
  }
  return 0;
}

- (BOOL)refreshNotificationsForChannelIDs:(id)a3 paidChannelIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(FCNotificationController *)self publisherNotificationsAllowed])
  {
    int v8 = +[FCAppleAccount sharedAccount];
    uint64_t v9 = [v8 contentStoreFrontID];

    uint64_t v10 = [(FCNotificationController *)self deviceToken];
    if (v10
      && (uint64_t v11 = (void *)v10,
          [(FCNotificationController *)self notificationsUserID],
          __int16 v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          v11,
          v12))
    {
      uint64_t v13 = +[FCNetworkReachability sharedNetworkReachability];
      if ([v13 isCloudKitReachable])
      {
        __int16 v14 = [(FCNotificationController *)self appendBreakingNewsIfNeededToChannelIDs:v6];
        char v15 = [FCRefreshNotificationsForChannelsCommand alloc];
        __int16 v16 = [(FCNotificationController *)self notificationsUserID];
        uint64_t v17 = [(FCNotificationController *)self deviceToken];
        uint64_t v18 = [(FCRefreshNotificationsForChannelsCommand *)v15 initWithChannelIDs:v14 paidChannelIDs:v7 userID:v16 deviceToken:v17 storefrontID:v9 deviceDigestMode:[(FCNotificationController *)self deviceDigestMode]];

        id v19 = [(FCNotificationController *)self commandQueue];
        [v19 addCommand:v18];

        char v20 = 1;
      }
      else
      {
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_38;
        v22[3] = &unk_1E5B5C580;
        id v23 = v6;
        id v24 = v7;
        __int16 v25 = self;
        id v26 = v9;
        char v20 = __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_38((uint64_t)v22);
      }
    }
    else
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_2;
      v27[3] = &unk_1E5B5C580;
      id v28 = v6;
      id v29 = v7;
      id v30 = self;
      id v31 = v9;
      char v20 = __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_2((uint64_t)v27);

      uint64_t v13 = v28;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

uint64_t __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = v2;
    int v8 = [v6 deviceToken];
    uint64_t v9 = [*(id *)(a1 + 48) notificationsUserID];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications for channelIDs: %{public}@ paidChannelIDs: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  return 0;
}

uint64_t __77__FCNotificationController_refreshNotificationsForChannelIDs_paidChannelIDs___block_invoke_38(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = v2;
    int v8 = [v6 deviceToken];
    uint64_t v9 = [*(id *)(a1 + 48) notificationsUserID];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications: CloudKit unreachable, channelIDs: %{public}@ paidChannelIDs: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  return 0;
}

- (BOOL)registerNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
    *(_DWORD *)buf = 136315906;
    __int16 v37 = "-[FCNotificationController registerNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:]";
    __int16 v38 = 2080;
    __int16 v39 = "FCNotificationController.m";
    __int16 v40 = 1024;
    int v41 = 248;
    __int16 v42 = 2114;
    uint64_t v43 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int v11 = +[FCAppleAccount sharedAccount];
  uint64_t v12 = [v11 contentStoreFrontID];

  if (v10
    && ([(FCNotificationController *)self deviceToken], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v14 = (void *)v13,
        [(FCNotificationController *)self notificationsUserID],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    __int16 v16 = +[FCNetworkReachability sharedNetworkReachability];
    if ([v16 isCloudKitReachable])
    {
      __int16 v17 = [FCModifyNotificationsForTopicsCommand alloc];
      uint64_t v18 = [(FCNotificationController *)self notificationsUserID];
      __int16 v19 = [(FCNotificationController *)self deviceToken];
      LODWORD(v25) = [(FCNotificationController *)self deviceDigestMode];
      uint64_t v20 = [(FCModifyNotificationsForTopicsCommand *)v17 initWithTopicIDsToAdd:v8 topicIDsToRemove:0 withTopicGroupingID:v9 fromChannelID:v10 userID:v18 deviceToken:v19 storefrontID:v12 deviceDigestMode:v25];

      uint64_t v21 = [(FCNotificationController *)self commandQueue];
      [v21 addCommand:v20];

      char v22 = 1;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_40;
      v26[3] = &unk_1E5B5C580;
      __int16 v27 = (FCModifyNotificationsForTopicsCommand *)v8;
      id v28 = v10;
      id v29 = self;
      id v30 = v12;
      char v22 = __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_40((uint64_t)v26);

      uint64_t v20 = v27;
    }
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke;
    v31[3] = &unk_1E5B5C580;
    id v32 = v8;
    id v33 = v10;
    id v34 = self;
    id v35 = v12;
    char v22 = __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke((uint64_t)v31);

    __int16 v16 = v32;
  }

  return v22;
}

uint64_t __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = v2;
    id v8 = [v6 deviceToken];
    id v9 = [*(id *)(a1 + 48) notificationsUserID];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register topic notifications with topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  return 0;
}

uint64_t __95__FCNotificationController_registerNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_40(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = v2;
    id v8 = [v6 deviceToken];
    id v9 = [*(id *)(a1 + 48) notificationsUserID];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register notifications: CloudKit unreachable, topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  return 0;
}

- (BOOL)unregisterNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v24 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "channelID");
    *(_DWORD *)buf = 136315906;
    __int16 v37 = "-[FCNotificationController unregisterNotificationsForTopicIDs:withTopicGroupingID:fromChannelID:]";
    __int16 v38 = 2080;
    __int16 v39 = "FCNotificationController.m";
    __int16 v40 = 1024;
    int v41 = 280;
    __int16 v42 = 2114;
    uint64_t v43 = v24;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  int v11 = +[FCAppleAccount sharedAccount];
  uint64_t v12 = [v11 contentStoreFrontID];

  if (v10
    && ([(FCNotificationController *)self deviceToken], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0)
    && (uint64_t v14 = (void *)v13,
        [(FCNotificationController *)self notificationsUserID],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    __int16 v16 = +[FCNetworkReachability sharedNetworkReachability];
    if ([v16 isCloudKitReachable])
    {
      __int16 v17 = [FCModifyNotificationsForTopicsCommand alloc];
      uint64_t v18 = [(FCNotificationController *)self notificationsUserID];
      __int16 v19 = [(FCNotificationController *)self deviceToken];
      LODWORD(v25) = [(FCNotificationController *)self deviceDigestMode];
      uint64_t v20 = [(FCModifyNotificationsForTopicsCommand *)v17 initWithTopicIDsToAdd:0 topicIDsToRemove:v8 withTopicGroupingID:v9 fromChannelID:v10 userID:v18 deviceToken:v19 storefrontID:v12 deviceDigestMode:v25];

      uint64_t v21 = [(FCNotificationController *)self commandQueue];
      [v21 addCommand:v20];

      char v22 = 1;
    }
    else
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_42;
      v26[3] = &unk_1E5B5C580;
      __int16 v27 = (FCModifyNotificationsForTopicsCommand *)v8;
      id v28 = v10;
      id v29 = self;
      id v30 = v12;
      char v22 = __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_42((uint64_t)v26);

      uint64_t v20 = v27;
    }
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke;
    v31[3] = &unk_1E5B5C580;
    id v32 = v8;
    id v33 = v10;
    id v34 = self;
    id v35 = v12;
    char v22 = __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke((uint64_t)v31);

    __int16 v16 = v32;
  }

  return v22;
}

uint64_t __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = v2;
    id v8 = [v6 deviceToken];
    id v9 = [*(id *)(a1 + 48) notificationsUserID];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register topic notifications with topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  return 0;
}

uint64_t __97__FCNotificationController_unregisterNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_42(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = v2;
    id v8 = [v6 deviceToken];
    id v9 = [*(id *)(a1 + 48) notificationsUserID];
    uint64_t v10 = *(void *)(a1 + 56);
    int v11 = 138544386;
    uint64_t v12 = v4;
    __int16 v13 = 2114;
    uint64_t v14 = v5;
    __int16 v15 = 2114;
    __int16 v16 = v8;
    __int16 v17 = 2114;
    uint64_t v18 = v9;
    __int16 v19 = 2114;
    uint64_t v20 = v10;
    _os_log_error_impl(&dword_1A460D000, v7, OS_LOG_TYPE_ERROR, "failed to create command to register notifications: CloudKit unreachable, topicIDs: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v11, 0x34u);
  }
  return 0;
}

- (BOOL)refreshNotificationsForTopicIDs:(id)a3 withTopicGroupingID:(id)a4 fromChannelID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[FCAppleAccount sharedAccount];
  uint64_t v12 = [v11 contentStoreFrontID];

  uint64_t v13 = [(FCNotificationController *)self deviceToken];
  if (v13
    && (uint64_t v14 = (void *)v13,
        [(FCNotificationController *)self notificationsUserID],
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        v15))
  {
    __int16 v16 = +[FCNetworkReachability sharedNetworkReachability];
    if ([v16 isCloudKitReachable])
    {
      __int16 v17 = [FCRefreshNotificationsForTopicsCommand alloc];
      uint64_t v18 = [(FCNotificationController *)self notificationsUserID];
      __int16 v19 = [(FCNotificationController *)self deviceToken];
      LODWORD(v24) = [(FCNotificationController *)self deviceDigestMode];
      uint64_t v20 = [(FCRefreshNotificationsForTopicsCommand *)v17 initWithTopicsIDs:v8 withTopicGroupingID:v9 fromChannelID:v10 userID:v18 deviceToken:v19 storefrontID:v12 deviceDigestMode:v24];

      uint64_t v21 = [(FCNotificationController *)self commandQueue];
      [v21 addCommand:v20];

      char v22 = 1;
    }
    else
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_43;
      v25[3] = &unk_1E5B5C5A8;
      id v26 = v8;
      id v27 = v9;
      id v28 = v10;
      id v29 = self;
      id v30 = v12;
      char v22 = __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_43((uint64_t)v25);
    }
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke;
    v31[3] = &unk_1E5B5C5A8;
    id v32 = v8;
    id v33 = v9;
    id v34 = v10;
    id v35 = self;
    id v36 = v12;
    char v22 = __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke((uint64_t)v31);

    __int16 v16 = v32;
  }

  return v22;
}

uint64_t __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = *(void **)(a1 + 56);
    id v8 = v2;
    id v9 = [v6 deviceToken];
    id v10 = [*(id *)(a1 + 56) notificationsUserID];
    uint64_t v11 = *(void *)(a1 + 64);
    int v12 = 138544642;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications for topicIDs: %{public}@ topicGroupingID: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v12, 0x3Eu);
  }
  return 0;
}

uint64_t __94__FCNotificationController_refreshNotificationsForTopicIDs_withTopicGroupingID_fromChannelID___block_invoke_43(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCPushNotificationsLog;
  if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v6 = *(void **)(a1 + 56);
    id v8 = v2;
    id v9 = [v6 deviceToken];
    id v10 = [*(id *)(a1 + 56) notificationsUserID];
    uint64_t v11 = *(void *)(a1 + 64);
    int v12 = 138544642;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    __int16 v19 = v9;
    __int16 v20 = 2114;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    uint64_t v23 = v11;
    _os_log_error_impl(&dword_1A460D000, v8, OS_LOG_TYPE_ERROR, "failed to create command to refresh notifications: CloudKit unreachable, topicIDs: %{public}@ topicGroupingID: %{public}@ channelID: %{public}@ deviceToken: %{public}@ notificationsUserID: %{public}@ storefrontID: %{public}@", (uint8_t *)&v12, 0x3Eu);
  }
  return 0;
}

- (BOOL)setMarketingNotificationsEnabled:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if ([(FCNotificationController *)self appleNewsNotificationsAllowed])
  {
    uint64_t v7 = +[FCAppleAccount sharedAccount];
    id v8 = [v7 iTunesAccountDSID];

    if (v8)
    {
      id v9 = +[FCNetworkReachability sharedNetworkReachability];
      char v10 = [v9 isCloudKitReachable];
      if (v10)
      {
        if (v5) {
          uint64_t v11 = 1;
        }
        else {
          uint64_t v11 = 2;
        }
        int v12 = [[FCModifyNotificationsForMarketingCommand alloc] initWithType:1 action:v11 iTunesDSID:v8];
        uint64_t v13 = [(FCNotificationController *)self commandQueue];
        [v13 addCommand:v12];

        __int16 v14 = [(FCNotificationController *)self userInfo];
        [v14 setMarketingNotificationsEnabled:v5];

        goto LABEL_15;
      }
      __int16 v16 = FCPushNotificationsLog;
      if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int16 v18 = 0;
        _os_log_error_impl(&dword_1A460D000, v16, OS_LOG_TYPE_ERROR, "failed to create command to register For Marketing Notifications: CloudKit unreachable", v18, 2u);
        if (!a4) {
          goto LABEL_15;
        }
      }
      else if (!a4)
      {
LABEL_15:

        goto LABEL_16;
      }
      *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FCErrorDomain" code:10 userInfo:0];
      goto LABEL_15;
    }
    uint64_t v15 = FCPushNotificationsLog;
    if (os_log_type_enabled((os_log_t)FCPushNotificationsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A460D000, v15, OS_LOG_TYPE_ERROR, "Cannot alter marketing notifications status without an iTunes DSID. Please ensure device is logged into iTunes.", buf, 2u);
      if (a4) {
        goto LABEL_11;
      }
    }
    else if (a4)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E4F28C58], "fc_errorWithCode:description:", 16, @"Cannot alter marketing notifications status without an iTunes DSID. Please ensure device is logged into iTunes.");
      char v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

      return v10;
    }
    char v10 = 0;
    goto LABEL_16;
  }
  return 0;
}

- (void)setNewIssueNotificationsEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__FCNotificationController_setNewIssueNotificationsEnabled___block_invoke;
  v3[3] = &unk_1E5B5C5D0;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __60__FCNotificationController_setNewIssueNotificationsEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  [v2 setNewIssueNotificationsEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setEndOfAudioTrackNotificationsEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__FCNotificationController_setEndOfAudioTrackNotificationsEnabled___block_invoke;
  v3[3] = &unk_1E5B5C5D0;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __67__FCNotificationController_setEndOfAudioTrackNotificationsEnabled___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userInfo];
  [v2 setEndOfAudioTrackNotificationsEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)refreshNotificationsFromAppleNews
{
  if ([(FCNotificationController *)self appleNewsNotificationsAllowed])
  {
    objc_initWeak(&location, self);
    uint64_t v3 = [(FCNotificationController *)self userInfo];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_2;
    v4[3] = &unk_1E5B5C620;
    objc_copyWeak(&v5, &location);
    [v3 syncWithCompletion:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_3;
  v7[3] = &unk_1E5B5C5F8;
  id v8 = v4;
  id v6 = v4;
  FCPerformIfNonNil(WeakRetained, v7);
}

void __61__FCNotificationController_refreshNotificationsFromAppleNews__block_invoke_3(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32))
  {
    id v2 = a2;
    id v3 = [v2 userInfo];
    objc_msgSend(v2, "setMarketingNotificationsEnabled:error:", objc_msgSend(v3, "marketingNotificationsEnabled"), 0);
  }
}

- (id)appendBreakingNewsIfNeededToChannelIDs:(id)a3
{
  id v4 = a3;
  id v5 = [(FCNotificationController *)self configurationManager];
  id v6 = [v5 configuration];

  uint64_t v7 = [v6 topStoriesConfig];
  id v8 = [v7 channelID];

  id v9 = [v6 breakingNewsChannelID];
  char v10 = v4;
  if ([v9 length])
  {
    char v10 = v4;
    if ([v8 length])
    {
      char v10 = v4;
      if ([v4 containsObject:v8])
      {
        char v10 = [v4 arrayByAddingObject:v9];
      }
    }
  }

  return v10;
}

- (void)userInfoDidChangeNotificationsUserID:(id)a3
{
  id v8 = [a3 notificationsUserID];
  id v4 = [(FCNotificationController *)self notificationsUserID];
  char v5 = [v4 isEqualToString:v8];

  if ((v5 & 1) == 0)
  {
    [(FCNotificationController *)self setNotificationsUserID:v8];
    id v6 = [(FCNotificationController *)self deviceToken];

    if (v6)
    {
      uint64_t v7 = [(FCNotificationController *)self deviceToken];
      [(FCNotificationController *)self _registerDeviceToken:v7 deviceDigestMode:[(FCNotificationController *)self deviceDigestMode]];
    }
  }
}

- (void)setNotificationsUserID:(id)a3
{
}

- (void)setUserInfo:(id)a3
{
}

- (void)setCommandQueue:(id)a3
{
}

- (void)setConfigurationManager:(id)a3
{
}

- (int)deviceDigestMode
{
  return self->_deviceDigestMode;
}

- (void)setPublisherNotificationsAllowed:(BOOL)a3
{
  self->_publisherNotificationsAllowed = a3;
}

- (void)setAppleNewsNotificationsAllowed:(BOOL)a3
{
  self->_appleNewsNotificationsAllowed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceToken, 0);
  objc_storeStrong((id *)&self->_notificationsUserID, 0);
}

@end