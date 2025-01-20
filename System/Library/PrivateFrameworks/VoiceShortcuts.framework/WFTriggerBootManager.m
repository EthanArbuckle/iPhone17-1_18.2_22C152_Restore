@interface WFTriggerBootManager
+ (id)category;
+ (void)clearDeliveredNotificationsWithUserNotificationCenter:(id)a3;
+ (void)registerForNotificationRemovalWithUserNotificationCenter:(id)a3 scheduleIfNeeded:(BOOL)a4;
- (BOOL)canRunAutomations;
- (BOOL)createFirstUnlockTimeFile;
- (BOOL)enabledTriggers:(id)a3;
- (BOOL)lastKnownBootUUIDDiffersFromCurrentBootUUID;
- (BOOL)triggerRunningTimeoutHasPassed;
- (OS_dispatch_queue)queue;
- (UNUserNotificationCenter)notificationCenter;
- (WFDatabaseProvider)databaseProvider;
- (WFTriggerBootManager)initWithDatabaseProvider:(id)a3;
- (WFTriggerManager)triggerManager;
- (id)bootUUIDFileURL;
- (id)firstUnlockDate;
- (id)firstUnlockTimeURL;
- (id)lastKnownBootUUID;
- (id)notificationContentForDeviceWithKnownUnlockedState:(BOOL)a3;
- (id)runningThresholdDate;
- (void)configuredTriggersDidChange:(id)a3;
- (void)createOrUpdateBootTimeFileIfNeeded;
- (void)deviceWasUnlockedForTheFirstTime;
- (void)postNotificationWithUserNotificationCenterIfNecessary:(id)a3 completionHandler:(id)a4;
- (void)queue_postNotification;
- (void)registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:(id)a3;
- (void)replaceNotificationContentWithUpdatedTitleIfNeeded;
- (void)setNotificationCenter:(id)a3;
- (void)setTriggerManager:(id)a3;
- (void)start;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)willRunAutomations;
@end

@implementation WFTriggerBootManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setNotificationCenter:(id)a3
{
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (void)setTriggerManager:(id)a3
{
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(void))a5;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFTriggerBootManager.m", 424, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v12 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [v10 actionIdentifier];
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s WFTriggerBootManager didReceiveNotificationResponse with action (%{public}@)", buf, 0x16u);
  }
  v14 = [v10 notification];
  v15 = [v14 request];
  v16 = [v15 content];
  v17 = [v16 categoryIdentifier];
  int v18 = [v17 isEqualToString:*MEMORY[0x1E4FB7430]];

  if (v18)
  {
    v19 = [v10 actionIdentifier];
    if ([v19 isEqualToString:*MEMORY[0x1E4F446E0]])
    {
      v20 = getWFTriggerNotificationsLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
        _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_DEFAULT, "%s Automations enabled notification dismissed", buf, 0xCu);
      }
      goto LABEL_16;
    }
    if ([v19 isEqualToString:@"disableAction"])
    {
      v20 = [(WFTriggerBootManager *)self triggerManager];
      [v20 disableAllTriggers];
LABEL_16:

      goto LABEL_17;
    }
    v20 = getWFTriggersLogObject();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      goto LABEL_16;
    }
    v21 = [v10 actionIdentifier];
    *(_DWORD *)buf = 136315650;
    v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v26 = 2114;
    v27 = v21;
    __int16 v28 = 2114;
    id v29 = v10;
    _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_FAULT, "%s unexpected actionIdentifier (%{public}@) from notification reponse (%{public}@)", buf, 0x20u);
LABEL_15:

    goto LABEL_16;
  }
  v19 = getWFTriggersLogObject();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    v20 = [v10 notification];
    v21 = [v20 request];
    v22 = [v21 identifier];
    *(_DWORD *)buf = 136315394;
    v25 = "-[WFTriggerBootManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v26 = 2112;
    v27 = v22;
    _os_log_impl(&dword_1C7D7E000, v19, OS_LOG_TYPE_FAULT, "%s Recieved response for unrecognized category: %@", buf, 0x16u);

    goto LABEL_15;
  }
LABEL_17:

  v11[2](v11);
}

- (id)firstUnlockTimeURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5AA28] sharedAppGroupDirectoryURL];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 URLByAppendingPathComponent:@".FirstUnlock"];
  }
  else
  {
    v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      v8 = "-[WFTriggerBootManager firstUnlockTimeURL]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_FAULT, "%s Could not get first unlock time url due to no sharedAppGroupDirectoryURL.", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (id)bootUUIDFileURL
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F5AA28] sharedAppGroupDirectoryURL];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 URLByAppendingPathComponent:@".AutomationsEnabled"];
  }
  else
  {
    v5 = getWFTriggersLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 136315138;
      v8 = "-[WFTriggerBootManager bootUUIDFileURL]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_FAULT, "%s Could not get automations enabled marker url due to no sharedAppGroupDirectoryURL.", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (id)firstUnlockDate
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(WFTriggerBootManager *)self firstUnlockTimeURL];
  if (v2)
  {
    id v12 = 0;
    v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:0 error:&v12];
    id v4 = v12;
    if (v3)
    {
      id v11 = v4;
      v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v11];
      id v6 = v11;

      if (v5)
      {
        int v7 = v5;
        v8 = v7;
      }
      else
      {
        uint64_t v9 = getWFTriggersLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v14 = "-[WFTriggerBootManager firstUnlockDate]";
          __int16 v15 = 2112;
          id v16 = v6;
          _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Could not unarchive first unlock date with error: %@", buf, 0x16u);
        }

        int v7 = 0;
        v8 = 0;
      }
    }
    else
    {
      int v7 = getWFTriggersLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[WFTriggerBootManager firstUnlockDate]";
        __int16 v15 = 2112;
        id v16 = 0;
        _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_ERROR, "%s Could not get first unlock time data with error: %@", buf, 0x16u);
      }
      v8 = 0;
      id v6 = v4;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)createFirstUnlockTimeFile
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v18 = "-[WFTriggerBootManager createFirstUnlockTimeFile]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Creating first unlock time", buf, 0xCu);
  }

  id v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [(WFTriggerBootManager *)self firstUnlockTimeURL];
  if (v5)
  {
    id v16 = 0;
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v16];
    id v7 = v16;
    v8 = v7;
    if (v6)
    {
      id v15 = v7;
      char v9 = [v6 writeToURL:v5 options:0 error:&v15];
      id v10 = v15;

      if (v9)
      {
        BOOL v11 = 1;
        v8 = v10;
LABEL_15:

        goto LABEL_16;
      }
      v8 = v10;
    }
    else
    {
      id v12 = getWFTriggersLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v18 = "-[WFTriggerBootManager createFirstUnlockTimeFile]";
        __int16 v19 = 2112;
        v20 = 0;
        _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Failed to create first unlock date with error: %@", buf, 0x16u);
      }
    }
    v13 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v18 = "-[WFTriggerBootManager createFirstUnlockTimeFile]";
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_DEFAULT, "%s Could not create first unlock date file due to error: %@", buf, 0x16u);
    }

    BOOL v11 = 0;
    goto LABEL_15;
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (void)createOrUpdateBootTimeFileIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(WFTriggerBootManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = WFGetBootSessionUUID();
  v5 = [(WFTriggerBootManager *)self lastKnownBootUUID];
  id v6 = [(WFTriggerBootManager *)self bootUUIDFileURL];
  if (!v6)
  {
    id v11 = 0;
    goto LABEL_17;
  }
  if (!v5) {
    goto LABEL_13;
  }
  id v7 = v5;
  id v8 = v4;
  char v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_9;
  }
  if (!v8)
  {

    goto LABEL_13;
  }
  int v10 = [v7 isEqualToString:v8];

  if (v10)
  {
LABEL_9:
    id v12 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v16 = "-[WFTriggerBootManager createOrUpdateBootTimeFileIfNeeded]";
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_DEFAULT, "%s Already updated boot uuid not doing!", buf, 0xCu);
    }
    id v11 = 0;
    goto LABEL_16;
  }
LABEL_13:
  id v14 = 0;
  char v13 = [v4 writeToURL:v6 atomically:1 encoding:4 error:&v14];
  id v11 = v14;
  if ((v13 & 1) == 0)
  {
    id v12 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[WFTriggerBootManager createOrUpdateBootTimeFileIfNeeded]";
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl(&dword_1C7D7E000, v12, OS_LOG_TYPE_ERROR, "%s Failed to update boot time uuid file with error: %@", buf, 0x16u);
    }
LABEL_16:
  }
LABEL_17:
}

- (id)lastKnownBootUUID
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [(WFTriggerBootManager *)self bootUUIDFileURL];
  if (v2)
  {
    id v8 = 0;
    v3 = [NSString stringWithContentsOfURL:v2 encoding:4 error:&v8];
    id v4 = v8;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v6 = getWFTriggersLogObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        int v10 = "-[WFTriggerBootManager lastKnownBootUUID]";
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s Could not get last logged boot data error: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)enabledTriggers:(id)a3
{
  v3 = objc_msgSend(a3, "if_firstObjectPassingTest:", &__block_literal_global_274);
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __40__WFTriggerBootManager_enabledTriggers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

- (void)configuredTriggersDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(WFTriggerBootManager *)self enabledTriggers:a3])
  {
    BOOL v4 = [(WFTriggerBootManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__WFTriggerBootManager_configuredTriggersDidChange___block_invoke;
    block[3] = &unk_1E65420F0;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v6 = [(WFTriggerBootManager *)self bootUUIDFileURL];
    id v10 = 0;
    char v7 = [v5 removeItemAtURL:v6 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0)
    {
      char v9 = getWFTriggerNotificationsLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v13 = "-[WFTriggerBootManager configuredTriggersDidChange:]";
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Failed to remove file with error: %@", buf, 0x16u);
      }
    }
  }
}

uint64_t __52__WFTriggerBootManager_configuredTriggersDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) createOrUpdateBootTimeFileIfNeeded];
}

- (WFTriggerManager)triggerManager
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  triggerManager = self->_triggerManager;
  if (triggerManager) {
    goto LABEL_4;
  }
  BOOL v4 = [(WFTriggerBootManager *)self databaseProvider];
  id v12 = 0;
  id v5 = [v4 databaseWithError:&v12];
  id v6 = v12;

  if (v5)
  {
    char v7 = (WFTriggerManager *)[objc_alloc(MEMORY[0x1E4FB7360]) initWithDatabase:v5];
    id v8 = self->_triggerManager;
    self->_triggerManager = v7;

    triggerManager = self->_triggerManager;
LABEL_4:
    char v9 = triggerManager;
    goto LABEL_5;
  }
  __int16 v11 = getWFTriggersLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "-[WFTriggerBootManager triggerManager]";
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_ERROR, "%s WFTriggerBootManager could not create trigger manager due to no database", buf, 0xCu);
  }

  char v9 = 0;
LABEL_5:
  return v9;
}

- (void)replaceNotificationContentWithUpdatedTitleIfNeeded
{
  id v4 = [(WFTriggerBootManager *)self notificationCenter];
  v3 = [(WFTriggerBootManager *)self notificationContentForDeviceWithKnownUnlockedState:1];
  [v4 replaceContentForRequestWithIdentifier:@"com.apple.siriactionsd.TriggersEnabledBootNotification" replacementContent:v3 completionHandler:&__block_literal_global_270];
}

void __74__WFTriggerBootManager_replaceNotificationContentWithUpdatedTitleIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = getWFTriggersLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[WFTriggerBootManager replaceNotificationContentWithUpdatedTitleIfNeeded]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEFAULT, "%s Attempted to replace content for delivered or pending notification with error %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)deviceWasUnlockedForTheFirstTime
{
  [(WFTriggerBootManager *)self replaceNotificationContentWithUpdatedTitleIfNeeded];
  [(WFTriggerBootManager *)self createFirstUnlockTimeFile];
  v3 = [(WFTriggerBootManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__WFTriggerBootManager_deviceWasUnlockedForTheFirstTime__block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v3, block);

  int v4 = objc_opt_class();
  id v5 = [(WFTriggerBootManager *)self notificationCenter];
  [v4 registerForNotificationRemovalWithUserNotificationCenter:v5 scheduleIfNeeded:1];
}

void __56__WFTriggerBootManager_deviceWasUnlockedForTheFirstTime__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [v2 triggerManager];
  v3 = [v6 allConfiguredTriggers];
  if ([v2 enabledTriggers:v3])
  {
    int v4 = [*(id *)(a1 + 32) lastKnownBootUUIDDiffersFromCurrentBootUUID];

    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "queue_postNotification");
    }
  }
  else
  {
  }
}

- (void)willRunAutomations
{
  v3 = objc_opt_class();
  id v4 = [(WFTriggerBootManager *)self notificationCenter];
  [v3 clearDeliveredNotificationsWithUserNotificationCenter:v4];
}

- (id)runningThresholdDate
{
  id v2 = [(WFTriggerBootManager *)self firstUnlockDate];
  v3 = [v2 dateByAddingTimeInterval:120.0];

  return v3;
}

- (BOOL)triggerRunningTimeoutHasPassed
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1C9C8] now];
  id v4 = [(WFTriggerBootManager *)self runningThresholdDate];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 compare:v3] + 1;
    BOOL v7 = v6 < 2;
    uint64_t v8 = getWFTriggersLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      __int16 v11 = "-[WFTriggerBootManager triggerRunningTimeoutHasPassed]";
      __int16 v12 = 1024;
      BOOL v13 = v6 < 2;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Trigger running threshold has passed: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)canRunAutomations
{
  v3 = [(WFTriggerBootManager *)self bootUUIDFileURL];
  if (objc_msgSend(v3, "wf_fileExists")) {
    BOOL v4 = [(WFTriggerBootManager *)self triggerRunningTimeoutHasPassed];
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)notificationContentForDeviceWithKnownUnlockedState:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = getWFTriggersLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFTriggerBootManager notificationContentForDeviceWithKnownUnlockedState:]";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Posting notification", buf, 0xCu);
  }

  id v6 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  BOOL v7 = WFLocalizedString(@"Shortcuts");
  [v6 setTitle:v7];

  uint64_t v8 = [MEMORY[0x1E4FB46B8] currentDevice];
  char v9 = [v8 model];

  if (a3 || VCDeviceHasBeenUnlocked())
  {
    int v10 = [(WFTriggerBootManager *)self triggerManager];
    __int16 v11 = [v10 allConfiguredTriggers];
    __int16 v12 = objc_msgSend(v11, "if_objectsPassingTest:", &__block_literal_global_201);
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      id v16 = 0;
      goto LABEL_28;
    }
    if ([v9 isEqualToString:@"iPhone"])
    {
      uint64_t v14 = NSString;
      uint64_t v15 = @"%d automations are enabled on your iPhone.";
    }
    else if ([v9 isEqualToString:@"iPod touch"])
    {
      uint64_t v14 = NSString;
      uint64_t v15 = @"%d automations are enabled on your iPod.";
    }
    else if ([v9 isEqualToString:@"iPad"])
    {
      uint64_t v14 = NSString;
      uint64_t v15 = @"%d automations are enabled on your iPad.";
    }
    else
    {
      int v18 = [v9 isEqualToString:@"Mac"];
      uint64_t v14 = NSString;
      if (v18) {
        uint64_t v15 = @"%d automations are enabled on your Mac.";
      }
      else {
        uint64_t v15 = @"%d automations are enabled on your device.";
      }
    }
    uint64_t v19 = WFLocalizedPluralString(v15);
    v20 = objc_msgSend(v14, "localizedStringWithFormat:", v19, v13);
  }
  else
  {
    if ([v9 isEqualToString:@"iPhone"])
    {
      __int16 v17 = @"Automations will run once your iPhone is unlocked.";
    }
    else if ([v9 isEqualToString:@"iPod touch"])
    {
      __int16 v17 = @"Automations will run once your iPod is unlocked.";
    }
    else if ([v9 isEqualToString:@"iPad"])
    {
      __int16 v17 = @"Automations will run once your iPad is unlocked.";
    }
    else if ([v9 isEqualToString:@"Mac"])
    {
      __int16 v17 = @"Automations will run once your Mac is unlocked.";
    }
    else
    {
      __int16 v17 = @"Automations will run once your device is unlocked.";
    }
    v20 = WFLocalizedString(v17);
  }
  [v6 setBody:v20];
  [v6 setShouldIgnoreDoNotDisturb:1];
  [v6 setSound:0];
  [v6 setCategoryIdentifier:*MEMORY[0x1E4FB7430]];
  [v6 setShouldSuppressDefaultAction:0];
  [v6 setShouldAuthenticateDefaultAction:0];
  uint64_t v21 = [MEMORY[0x1E4F1CB10] URLWithString:@"shortcuts://automations"];
  [v6 setDefaultActionURL:v21];

  id v16 = v6;
LABEL_28:

  return v16;
}

uint64_t __75__WFTriggerBootManager_notificationContentForDeviceWithKnownUnlockedState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

- (void)postNotificationWithUserNotificationCenterIfNecessary:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[WFTriggerBootManager postNotificationWithUserNotificationCenterIfNecessary:completionHandler:]";
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Posting notification", buf, 0xCu);
  }

  char v9 = [(WFTriggerBootManager *)self notificationContentForDeviceWithKnownUnlockedState:0];
  int v10 = [MEMORY[0x1E4F44628] requestWithIdentifier:@"com.apple.siriactionsd.TriggersEnabledBootNotification" content:v9 trigger:0 destinations:15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__WFTriggerBootManager_postNotificationWithUserNotificationCenterIfNecessary_completionHandler___block_invoke;
  v12[3] = &unk_1E6542188;
  id v13 = v6;
  id v11 = v6;
  [v7 addNotificationRequest:v10 withCompletionHandler:v12];
}

uint64_t __96__WFTriggerBootManager_postNotificationWithUserNotificationCenterIfNecessary_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)queue_postNotification
{
  v3 = [(WFTriggerBootManager *)self queue];
  dispatch_assert_queue_V2(v3);

  [(WFTriggerBootManager *)self createOrUpdateBootTimeFileIfNeeded];
  id v4 = [(WFTriggerBootManager *)self notificationCenter];
  [(WFTriggerBootManager *)self postNotificationWithUserNotificationCenterIfNecessary:v4 completionHandler:&__block_literal_global_183];
}

void __46__WFTriggerBootManager_queue_postNotification__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      id v7 = "-[WFTriggerBootManager queue_postNotification]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to post notification with error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (BOOL)lastKnownBootUUIDDiffersFromCurrentBootUUID
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(WFTriggerBootManager *)self lastKnownBootUUID];
  v3 = WFGetBootSessionUUID();
  id v4 = v2;
  id v5 = v3;
  int v6 = v5;
  if (v4 == v5)
  {
  }
  else
  {
    if (!v4 || !v5)
    {

LABEL_11:
      BOOL v9 = 1;
      goto LABEL_12;
    }
    int v7 = [v4 isEqualToString:v5];

    if (!v7) {
      goto LABEL_11;
    }
  }
  __int16 v8 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    __int16 v12 = "-[WFTriggerBootManager lastKnownBootUUIDDiffersFromCurrentBootUUID]";
    __int16 v13 = 2112;
    id v14 = v4;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Not posting notification because we already have for this boot session (%@) (%@)", (uint8_t *)&v11, 0x20u);
  }

  BOOL v9 = 0;
LABEL_12:

  return v9;
}

- (void)registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:(id)a3
{
  id v4 = [(WFTriggerBootManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke;
  block[3] = &unk_1E65420F0;
  block[4] = self;
  dispatch_async(v4, block);
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v6 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_DEFAULT, "%s Registering for initial boot notification", buf, 0xCu);
  }

  v3 = [[WFXPCActivityScheduler alloc] initWithActivityIdentifier:@"com.apple.siriactionsd.TriggersEnabledBootNotification"];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_179;
  v4[3] = &unk_1E65421B0;
  v4[4] = *(void *)(a1 + 32);
  [(WFXPCActivityScheduler *)v3 scheduleWithCheckInHandler:&__block_literal_global_2539 runHandler:v4];
}

uint64_t __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_179(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = *(void **)(a1 + 32);
  uint64_t v7 = a2;
  __int16 v8 = [v6 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_2;
  block[3] = &unk_1E65420F0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v8, block);

  LOBYTE(a1) = xpc_activity_set_state(v7, 5);
  if ((a1 & 1) == 0)
  {
    BOOL v9 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke";
      __int16 v14 = 2114;
      __int16 v15 = @"com.apple.siriactionsd.TriggersEnabledBootNotification";
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_FAULT, "%s Failed to set %{public}@ to DONE", buf, 0x16u);
    }
  }
  v5[2](v5);

  return 0;
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_175(int a1, xpc_activity_t activity)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_activity_copy_criteria(activity);
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1C87C5650](v2);
    id v5 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v9 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke";
      __int16 v10 = 2082;
      uint64_t v11 = v4;
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s, running activity and setting state to DONE", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_177;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v4;
    uint64_t v6 = (uint64_t)_Block_copy(aBlock);
    (*(void (**)(void))(v6 + 16))();
  }
  else
  {
    uint64_t v6 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v9 = "-[WFTriggerBootManager registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "%s Criteria does not exist not running activity.", buf, 0xCu);
    }
  }
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_177(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    free(v1);
  }
}

void __92__WFTriggerBootManager_registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) bootUUIDFileURL];
  if ((objc_msgSend(v6, "wf_fileExists") & 1) != 0
    && ([*(id *)(a1 + 32) lastKnownBootUUID], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) lastKnownBootUUIDDiffersFromCurrentBootUUID];

    if (v4)
    {
      id v5 = *(void **)(a1 + 32);
      objc_msgSend(v5, "queue_postNotification");
    }
  }
  else
  {
  }
}

- (void)start
{
  v3 = [(WFTriggerBootManager *)self notificationCenter];
  [(WFTriggerBootManager *)self registerForInitialBootXPCActivityWithUserNotificationCenterIfNeeded:v3];

  int v4 = objc_opt_class();
  id v5 = [(WFTriggerBootManager *)self notificationCenter];
  [v4 registerForNotificationRemovalWithUserNotificationCenter:v5 scheduleIfNeeded:0];
}

- (WFTriggerBootManager)initWithDatabaseProvider:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFTriggerBootManager;
  id v6 = [(WFTriggerBootManager *)&v21 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databaseProvider, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F44680]);
    uint64_t v9 = [v8 initWithBundleIdentifier:*MEMORY[0x1E4FB4BF0]];
    notificationCenter = v7->_notificationCenter;
    v7->_notificationCenter = (UNUserNotificationCenter *)v9;

    [(UNUserNotificationCenter *)v7->_notificationCenter setDelegate:v7];
    uint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.shortcuts.WFTriggerBootManager", v12);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v13;

    [(UNUserNotificationCenter *)v7->_notificationCenter setWantsNotificationResponsesDelivered];
    __int16 v15 = v7->_notificationCenter;
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = [(id)objc_opt_class() category];
    int v18 = [v16 setWithObject:v17];
    [(UNUserNotificationCenter *)v15 setNotificationCategories:v18];

    uint64_t v19 = v7;
  }

  return v7;
}

+ (id)category
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F445A0]);
  v3 = (void *)[v2 initWithIdentifier:*MEMORY[0x1E4FB7430]];
  int v4 = (void *)MEMORY[0x1E4F445D8];
  id v5 = WFLocalizedString(@"Disable All Automations");
  id v6 = [v4 actionWithIdentifier:@"disableAction" title:v5 options:2 icon:0];

  v9[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  [v3 setActions:v7];

  return v3;
}

+ (void)clearDeliveredNotificationsWithUserNotificationCenter:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = getWFTriggersLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "+[WFTriggerBootManager clearDeliveredNotificationsWithUserNotificationCenter:]";
    _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_DEFAULT, "%s Removing notification", buf, 0xCu);
  }

  id v6 = @"com.apple.siriactionsd.TriggersEnabledBootNotification";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v6 count:1];
  [v3 removeDeliveredNotificationsWithIdentifiers:v5];
}

+ (void)registerForNotificationRemovalWithUserNotificationCenter:(id)a3 scheduleIfNeeded:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = getWFTriggersLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]";
    _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Registering for automation notification removal", buf, 0xCu);
  }

  id v8 = [[WFXPCActivityScheduler alloc] initWithActivityIdentifier:@"com.apple.siriactionsd.TriggerLockscreenNotificationRemoval"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke;
  v13[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v14 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_191;
  v10[3] = &unk_1E65409B0;
  id v11 = v6;
  id v12 = a1;
  id v9 = v6;
  [(WFXPCActivityScheduler *)v8 scheduleWithCheckInHandler:v13 runHandler:v10];
}

void __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_object_t v4 = xpc_activity_copy_criteria(v3);
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = MEMORY[0x1C87C5650](v4);
    uint64_t v7 = getWFTriggersLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke";
      __int16 v16 = 2082;
      uint64_t v17 = v6;
      _os_log_impl(&dword_1C7D7E000, v7, OS_LOG_TYPE_DEFAULT, "%s Criteria exists %{public}s, doing nothing", buf, 0x16u);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_187;
    aBlock[3] = &__block_descriptor_40_e5_v8__0l;
    aBlock[4] = v6;
    uint64_t v8 = (uint64_t)_Block_copy(aBlock);
    (*(void (**)(void))(v8 + 16))();
  }
  else if (*(unsigned char *)(a1 + 32))
  {
    uint64_t v8 = (uint64_t)xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL((xpc_object_t)v8, (const char *)*MEMORY[0x1E4F142F8], 0);
    xpc_dictionary_set_int64((xpc_object_t)v8, (const char *)*MEMORY[0x1E4F14170], 120);
    xpc_dictionary_set_string((xpc_object_t)v8, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    uint64_t v9 = MEMORY[0x1C87C5650](v8);
    __int16 v10 = getWFTriggersLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v15 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke_2";
      __int16 v16 = 2082;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_DEFAULT, "%s Creating new criteria: %{public}s", buf, 0x16u);
    }

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_189;
    v12[3] = &__block_descriptor_40_e5_v8__0l;
    void v12[4] = v9;
    id v11 = (void (**)(void))_Block_copy(v12);
    xpc_activity_set_criteria(v3, (xpc_object_t)v8);
    v11[2](v11);
  }
  else
  {
    uint64_t v8 = getWFTriggersLogObject();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v15 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke_2";
      _os_log_impl(&dword_1C7D7E000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%s Criteria does not exist, doing nothing", buf, 0xCu);
    }
  }
}

uint64_t __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_191(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = a3;
  id v5 = getWFTriggersLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "+[WFTriggerBootManager registerForNotificationRemovalWithUserNotificationCenter:scheduleIfNeeded:]_block_invoke";
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Run handler called attempting to clear notification.", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 40) clearDeliveredNotificationsWithUserNotificationCenter:*(void *)(a1 + 32)];
  v4[2](v4);

  return 0;
}

void __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_187(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    free(v1);
  }
}

void __98__WFTriggerBootManager_registerForNotificationRemovalWithUserNotificationCenter_scheduleIfNeeded___block_invoke_189(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1) {
    free(v1);
  }
}

@end