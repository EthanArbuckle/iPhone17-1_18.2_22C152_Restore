@interface WFTriggerUserNotificationManager
+ (id)alertCategory;
+ (id)backgroundRunningCategory;
+ (id)categoryIdentifiers;
+ (id)promptCategory;
- (BOOL)_postNotificationOfType:(unint64_t)a3 forTrigger:(id)a4 workflowReference:(id)a5 removeDeliveredNotifications:(BOOL)a6 pendingTriggerEventIDs:(id)a7 actionIcons:(id)a8 error:(id *)a9;
- (BOOL)postBackgroundRunningNotificationWithConfiguredTriggers:(id)a3 userInfo:(id)a4 error:(id *)a5;
- (BOOL)postNotificationOfType:(unint64_t)a3 forTrigger:(id)a4 workflowReference:(id)a5 removeDeliveredNotifications:(BOOL)a6 pendingTriggerEventIDs:(id)a7 actionIcons:(id)a8 error:(id *)a9;
- (WFTriggerNotificationDebouncer)debouncer;
- (WFTriggerUserNotificationManager)initWithUserNotificationManager:(id)a3;
- (WFTriggerUserNotificationManagerDelegate)delegate;
- (WFUserNotificationManager)userNotificationManager;
- (void)postNotificationForTrigger:(id)a3 workflowReference:(id)a4 pendingTriggerEventIDs:(id)a5;
- (void)postNotificationThatTrigger:(id)a3 failedWithError:(id)a4;
- (void)removeNotificationsWithTriggerIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WFTriggerUserNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_debouncer, 0);
}

- (WFUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)setDelegate:(id)a3
{
}

- (WFTriggerUserNotificationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFTriggerUserNotificationManagerDelegate *)WeakRetained;
}

- (void)postNotificationForTrigger:(id)a3 workflowReference:(id)a4 pendingTriggerEventIDs:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v16 = 0;
  BOOL v10 = [(WFTriggerUserNotificationManager *)self _postNotificationOfType:0 forTrigger:v8 workflowReference:a4 removeDeliveredNotifications:0 pendingTriggerEventIDs:v9 actionIcons:0 error:&v16];
  id v11 = v16;
  v12 = v11;
  if (!v10)
  {
    if (v11)
    {
      v13 = getWFTriggersLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v18 = "-[WFTriggerUserNotificationManager postNotificationForTrigger:workflowReference:pendingTriggerEventIDs:]";
        __int16 v19 = 2114;
        v20 = v12;
        _os_log_impl(&dword_1C7D7E000, v13, OS_LOG_TYPE_ERROR, "%s Could not post trigger notification after debouncing with error: %{public}@", buf, 0x16u);
      }
    }
    v14 = [(WFTriggerUserNotificationManager *)self delegate];
    v15 = [v8 identifier];
    [v14 notificationManager:self didFailToPostNotificationPromptWithTriggerIdentifier:v15 pendingTriggerEventIDs:v9];
  }
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(void))a5;
  if (!v10)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"WFTriggerUserNotificationManager.m", 295, @"Invalid parameter not satisfying: %@", @"completionHandler", v32 object file lineNumber description];
  }
  id v11 = getWFTriggersLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v9 actionIdentifier];
    *(_DWORD *)buf = 136315394;
    v34 = "-[WFTriggerUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
    __int16 v35 = 2114;
    v36 = v12;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, "%s daemon didReceiveNotificationResponse with action (%{public}@)", buf, 0x16u);
  }
  v13 = [v9 actionIdentifier];
  v14 = [v9 notification];
  v15 = [v14 request];
  id v16 = [v15 content];
  v17 = [v16 userInfo];

  v18 = [v9 notification];
  __int16 v19 = [v18 request];
  v20 = [v19 content];
  uint64_t v21 = [v20 categoryIdentifier];
  int v22 = [v21 isEqualToString:*MEMORY[0x1E4FB7440]];

  if (v22)
  {
    v23 = WFTriggerIDFromNotificationUserInfo();
    v24 = WFPendingTriggerEventIDsFromNotificationUserInfo();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v13 isEqualToString:*MEMORY[0x1E4F446E0]])
      {
        v25 = [(WFTriggerUserNotificationManager *)self delegate];
        [v25 notificationManager:self didDismissTriggerWithIdentifier:v23 pendingTriggerEventIDs:v24];
      }
      else if ([v13 isEqualToString:@"runAction"])
      {
        v25 = [(WFTriggerUserNotificationManager *)self delegate];
        [v25 notificationManager:self receivedConfirmationToRunTriggerWithIdentifier:v23 pendingTriggerEventIDs:v24];
      }
      else
      {
        v25 = getWFTriggersLogObject();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v30 = [v9 actionIdentifier];
          *(_DWORD *)buf = 136315650;
          v34 = "-[WFTriggerUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
          __int16 v35 = 2114;
          v36 = v30;
          __int16 v37 = 2114;
          id v38 = v9;
          _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s unexpected actionIdentifier (%{public}@) from notification reponse (%{public}@)", buf, 0x20u);
        }
      }
    }
    else
    {
      v25 = getWFTriggersLogObject();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[WFTriggerUserNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
        __int16 v35 = 2114;
        v36 = v17;
        _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_ERROR, "%s Missing or invalid triggerID from notification reponse userInfo: %{public}@", buf, 0x16u);
      }
    }

    v10[2](v10);
    goto LABEL_20;
  }
  v23 = [v9 notification];
  v24 = [v23 request];
  v26 = [v24 content];
  v27 = [v26 categoryIdentifier];
  if (![v27 isEqualToString:*MEMORY[0x1E4FB7438]])
  {

LABEL_20:
    goto LABEL_21;
  }
  int v28 = [v13 isEqualToString:@"disableAction"];

  if (v28)
  {
    v23 = WFTriggerIDsToDisableFromNotificationUserInfo();
    v29 = [(WFTriggerUserNotificationManager *)self delegate];
    [v29 notificationManager:self didRequestDisablementOfTriggersWithIdentifiers:v23];

    v10[2](v10);
LABEL_21:
  }
}

- (void)removeNotificationsWithTriggerIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(WFTriggerUserNotificationManager *)self userNotificationManager];
  v6 = [v5 notificationCenter];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke;
  v14[3] = &unk_1E6540CC8;
  id v7 = v4;
  id v15 = v7;
  id v16 = self;
  [v6 getDeliveredNotificationsWithCompletionHandler:v14];

  id v8 = [(WFTriggerUserNotificationManager *)self userNotificationManager];
  id v9 = [v8 notificationCenter];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke_2;
  v11[3] = &unk_1E6540CC8;
  id v12 = v7;
  v13 = self;
  id v10 = v7;
  [v9 getPendingNotificationRequestsWithCompletionHandler:v11];
}

void __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = [v7 request];
        id v9 = [v8 content];
        id v10 = [v9 userInfo];
        id v11 = WFTriggerIDFromNotificationUserInfo();

        if ([v11 isEqualToString:*(void *)(a1 + 32)])
        {
          id v12 = [*(id *)(a1 + 40) userNotificationManager];
          v13 = [v12 notificationCenter];
          v14 = [v7 request];
          id v15 = [v14 identifier];
          int v22 = v15;
          id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          [v13 removeDeliveredNotificationsWithIdentifiers:v16];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

void __77__WFTriggerUserNotificationManager_removeNotificationsWithTriggerIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v8 = [v7 request];
        id v9 = [v8 content];
        id v10 = [v9 userInfo];
        id v11 = WFTriggerIDFromNotificationUserInfo();

        if ([v11 isEqualToString:*(void *)(a1 + 32)])
        {
          id v12 = [*(id *)(a1 + 40) userNotificationManager];
          v13 = [v12 notificationCenter];
          v14 = [v7 request];
          id v15 = [v14 identifier];
          int v22 = v15;
          id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
          [v13 removePendingNotificationRequestsWithIdentifiers:v16];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
}

- (BOOL)postBackgroundRunningNotificationWithConfiguredTriggers:(id)a3 userInfo:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  id v11 = WFLocalizedString(@"Shortcuts");
  [v10 setTitle:v11];

  id v12 = NSString;
  v13 = WFLocalizedPluralString(@"%lu automations recently ran in the background.");
  v14 = objc_msgSend(v12, "localizedStringWithFormat:", v13, objc_msgSend(v8, "count"));
  [v10 setBody:v14];

  id v15 = [MEMORY[0x1E4F44640] defaultSound];
  [v10 setSound:v15];

  [v10 setCategoryIdentifier:*MEMORY[0x1E4FB7438]];
  [v10 setInterruptionLevel:1];
  [v10 setShouldSuppressDefaultAction:1];
  [v10 setShouldAuthenticateDefaultAction:0];
  [v10 setShouldHideDate:1];
  [v10 setUserInfo:v9];
  id v16 = [MEMORY[0x1E4F44628] requestWithIdentifier:@"com.apple.siriactionsd.TriggerBackgroundRunning" content:v10 trigger:0 destinations:15];
  v17 = getWFTriggerNotificationsLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[WFTriggerUserNotificationManager postBackgroundRunningNotificationWithConfiguredTr"
                                    "iggers:userInfo:error:]";
    _os_log_impl(&dword_1C7D7E000, v17, OS_LOG_TYPE_DEFAULT, "%s Showing background running trigger notification", (uint8_t *)&buf, 0xCu);
  }

  dispatch_semaphore_t v18 = dispatch_semaphore_create(0);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__3924;
  v31 = __Block_byref_object_dispose__3925;
  id v32 = 0;
  long long v19 = [(WFTriggerUserNotificationManager *)self userNotificationManager];
  long long v20 = [v19 notificationCenter];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __107__WFTriggerUserNotificationManager_postBackgroundRunningNotificationWithConfiguredTriggers_userInfo_error___block_invoke;
  v25[3] = &unk_1E6540C78;
  p_long long buf = &buf;
  long long v21 = v18;
  v26 = v21;
  [v20 addNotificationRequest:v16 withCompletionHandler:v25];

  dispatch_time_t v22 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v21, v22);
  if (a5) {
    *a5 = *(id *)(*((void *)&buf + 1) + 40);
  }
  BOOL v23 = *(void *)(*((void *)&buf + 1) + 40) == 0;

  _Block_object_dispose(&buf, 8);
  return v23;
}

void __107__WFTriggerUserNotificationManager_postBackgroundRunningNotificationWithConfiguredTriggers_userInfo_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)postNotificationThatTrigger:(id)a3 failedWithError:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2, self, @"WFTriggerUserNotificationManager.m", 195, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v47 = [MEMORY[0x1E4F28B00] currentHandler];
  [v47 handleFailureInMethod:a2, self, @"WFTriggerUserNotificationManager.m", 196, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];

LABEL_3:
  id v10 = v9;
  id v11 = [v10 userInfo];
  uint64_t v12 = *MEMORY[0x1E4F28A50];
  v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  v14 = v10;
  if (v13)
  {
    id v15 = v10;
    do
    {
      id v16 = [v15 userInfo];
      v14 = [v16 objectForKeyedSubscript:v12];

      v17 = [v14 userInfo];
      dispatch_semaphore_t v18 = [v17 objectForKeyedSubscript:v12];

      id v15 = v14;
    }
    while (v18);
  }
  uint64_t v19 = [v14 localizedFailureReason];
  if (v19
    && (long long v20 = (void *)v19,
        [v14 localizedDescription],
        long long v21 = objc_claimAutoreleasedReturnValue(),
        v21,
        v20,
        v21))
  {
    dispatch_time_t v22 = NSString;
    BOOL v23 = [v14 localizedFailureReason];
    uint64_t v24 = [v14 localizedDescription];
    v25 = [v22 stringWithFormat:@"%@\n\n%@", v23, v24];
  }
  else
  {
    v26 = [v14 localizedFailureReason];

    if (v26) {
      [v14 localizedFailureReason];
    }
    else {
    v25 = [v14 localizedDescription];
    }
  }
  id v27 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  int v28 = WFLocalizedString(@"Shortcuts");
  [v27 setTitle:v28];

  [v27 setShouldHideDate:0];
  [v27 setCategoryIdentifier:@"triggerAlertCategory"];
  uint64_t v29 = WFLocalizedString(@"Automation failed");
  [v27 setSubtitle:v29];

  v30 = NSString;
  v31 = WFLocalizedString(@"“%1$@” encountered an error: %2$@");
  id v32 = [v7 trigger];
  uint64_t v33 = [v32 localizedDescriptionWithConfigurationSummary];
  v34 = objc_msgSend(v30, "localizedStringWithFormat:", v31, v33, v25);
  [v27 setBody:v34];

  __int16 v35 = [v7 identifier];
  v36 = WFTriggerNotificationUserInfo();
  [v27 setUserInfo:v36];

  __int16 v37 = (void *)MEMORY[0x1E4F44628];
  id v38 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v39 = [v38 UUIDString];
  v40 = [v37 requestWithIdentifier:v39 content:v27 trigger:0 destinations:15];

  v41 = getWFTriggersLogObject();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = [v7 identifier];
    v43 = [v40 identifier];
    *(_DWORD *)long long buf = 136315650;
    v49 = "-[WFTriggerUserNotificationManager postNotificationThatTrigger:failedWithError:]";
    __int16 v50 = 2114;
    v51 = v42;
    __int16 v52 = 2114;
    v53 = v43;
    _os_log_impl(&dword_1C7D7E000, v41, OS_LOG_TYPE_DEFAULT, "%s Showing error alert for trigger (%{public}@), request id (%{public}@)", buf, 0x20u);
  }
  v44 = [(WFTriggerUserNotificationManager *)self userNotificationManager];
  v45 = [v44 notificationCenter];
  [v45 addNotificationRequest:v40 withCompletionHandler:&__block_literal_global_3942];
}

void __80__WFTriggerUserNotificationManager_postNotificationThatTrigger_failedWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = getWFTriggersLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 136315394;
      uint64_t v5 = "-[WFTriggerUserNotificationManager postNotificationThatTrigger:failedWithError:]_block_invoke";
      __int16 v6 = 2114;
      id v7 = v2;
      _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_ERROR, "%s Failed to post error notification: %{public}@", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (BOOL)_postNotificationOfType:(unint64_t)a3 forTrigger:(id)a4 workflowReference:(id)a5 removeDeliveredNotifications:(BOOL)a6 pendingTriggerEventIDs:(id)a7 actionIcons:(id)a8 error:(id *)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  uint64_t v19 = [v15 identifier];
  v43 = [v15 trigger];
  id v20 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  long long v21 = WFLocalizedString(@"Shortcuts");
  [v20 setTitle:v21];

  dispatch_time_t v22 = WFTriggerNotificationUserInfo();
  [v20 setUserInfo:v22];

  [v20 setShouldHideDate:0];
  [v20 setShouldIgnoreDoNotDisturb:1];
  v41 = v18;
  v42 = v15;
  if (a3 == 1)
  {
    [v20 setSound:0];
    int v28 = [v43 localizedPastTenseDescription];
    [v20 setTitle:v28];

    uint64_t v29 = WFLocalizedString(@"Running your automation");
    [v20 setBody:v29];

    [v20 setCategoryIdentifier:@"triggerAlertCategory"];
    v30 = [NSString stringWithFormat:@"alert:%@", v19, v18, v15];
    [v20 setThreadIdentifier:v30];
  }
  else if (!a3)
  {
    BOOL v23 = VCNotificationTitleForTriggerWithPendingCount(v43, [v17 count]);
    [v20 setSubtitle:v23];

    uint64_t v24 = [v16 actionsDescription];
    [v20 setBody:v24];

    v25 = [MEMORY[0x1E4F44640] defaultSound];
    [v20 setSound:v25];

    [v20 setCategoryIdentifier:*MEMORY[0x1E4FB7440]];
    [v20 setInterruptionLevel:2];
    v26 = [NSString stringWithFormat:@"prompt:%@", v19, v18, v15];
    [v20 setThreadIdentifier:v26];

    [v20 setShouldSuppressDefaultAction:1];
    [v20 setShouldAuthenticateDefaultAction:0];
    if (VCLocaleIsRTL()) {
      id v27 = @"arrow.up.backward.square.fill";
    }
    else {
      id v27 = @"arrow.up.right.square.fill";
    }
    [v20 setAccessoryImageName:v27];
  }
  v31 = v16;
  dispatch_semaphore_t v32 = dispatch_semaphore_create(0);
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__3924;
  v56 = __Block_byref_object_dispose__3925;
  id v57 = 0;
  uint64_t v33 = [(WFTriggerUserNotificationManager *)self userNotificationManager];
  v34 = [v33 notificationCenter];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke;
  v44[3] = &unk_1E6540CA0;
  BOOL v51 = a6;
  id v35 = v19;
  id v45 = v35;
  v46 = self;
  id v36 = v20;
  id v47 = v36;
  v49 = &v52;
  unint64_t v50 = a3;
  __int16 v37 = v32;
  v48 = v37;
  [v34 getDeliveredNotificationsWithCompletionHandler:v44];

  dispatch_time_t v38 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v37, v38);
  if (a9) {
    *a9 = (id) v53[5];
  }
  BOOL v39 = v53[5] == 0;

  _Block_object_dispose(&v52, 8);
  return v39;
}

void __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id obj = a2;
  if (*(unsigned char *)(a1 + 80))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v3 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v33 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v8 = [v7 request];
          id v9 = [v8 content];
          id v10 = [v9 userInfo];
          id v11 = WFTriggerIDFromNotificationUserInfo();

          if ([v11 isEqualToString:*(void *)(a1 + 32)])
          {
            uint64_t v12 = [*(id *)(a1 + 40) userNotificationManager];
            v13 = [v12 notificationCenter];
            v14 = [v7 request];
            id v15 = [v14 identifier];
            v44 = v15;
            id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
            [v13 removeDeliveredNotificationsWithIdentifiers:v16];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v32 objects:v45 count:16];
      }
      while (v4);
    }
  }
  id v17 = (void *)MEMORY[0x1E4F44628];
  id v18 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v19 = [v18 UUIDString];
  id v20 = [v17 requestWithIdentifier:v19 content:*(void *)(a1 + 48) trigger:0 destinations:15];

  long long v21 = getWFTriggersLogObject();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(a1 + 72)) {
      dispatch_time_t v22 = @"alert";
    }
    else {
      dispatch_time_t v22 = @"prompt";
    }
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = [v20 identifier];
    *(_DWORD *)long long buf = 136315906;
    __int16 v37 = "-[WFTriggerUserNotificationManager _postNotificationOfType:forTrigger:workflowReference:removeDeliveredNotific"
          "ations:pendingTriggerEventIDs:actionIcons:error:]_block_invoke";
    __int16 v38 = 2114;
    BOOL v39 = v22;
    __int16 v40 = 2114;
    uint64_t v41 = v23;
    __int16 v42 = 2114;
    v43 = v24;
    _os_log_impl(&dword_1C7D7E000, v21, OS_LOG_TYPE_DEFAULT, "%s Showing %{public}@ for firing trigger (%{public}@), request id (%{public}@)", buf, 0x2Au);
  }
  v25 = [*(id *)(a1 + 40) userNotificationManager];
  v26 = [v25 notificationCenter];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke_228;
  v30[3] = &unk_1E6540C78;
  long long v28 = *(_OWORD *)(a1 + 56);
  id v27 = (id)v28;
  long long v31 = v28;
  [v26 addNotificationRequest:v20 withCompletionHandler:v30];
}

void __159__WFTriggerUserNotificationManager__postNotificationOfType_forTrigger_workflowReference_removeDeliveredNotifications_pendingTriggerEventIDs_actionIcons_error___block_invoke_228(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)postNotificationOfType:(unint64_t)a3 forTrigger:(id)a4 workflowReference:(id)a5 removeDeliveredNotifications:(BOOL)a6 pendingTriggerEventIDs:(id)a7 actionIcons:(id)a8 error:(id *)a9
{
  BOOL v11 = a6;
  id v16 = a4;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"WFTriggerUserNotificationManager.m", 111, @"Invalid parameter not satisfying: %@", @"configuredTrigger" object file lineNumber description];

    if (v17) {
      goto LABEL_3;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"WFTriggerUserNotificationManager.m", 112, @"Invalid parameter not satisfying: %@", @"workflowReference" object file lineNumber description];

LABEL_3:
  if ([v18 count])
  {
    id v20 = [(WFTriggerUserNotificationManager *)self debouncer];
    [v20 addEventsWithIdentifiers:v18 configuredTrigger:v16 workflowReference:v17];

    BOOL v21 = 1;
  }
  else
  {
    BOOL v21 = [(WFTriggerUserNotificationManager *)self _postNotificationOfType:a3 forTrigger:v16 workflowReference:v17 removeDeliveredNotifications:v11 pendingTriggerEventIDs:v18 actionIcons:v19 error:a9];
  }

  return v21;
}

- (WFTriggerNotificationDebouncer)debouncer
{
  debouncer = self->_debouncer;
  if (!debouncer)
  {
    id v4 = objc_alloc_init(WFTriggerNotificationDebouncer);
    uint64_t v5 = self->_debouncer;
    self->_debouncer = v4;

    [(WFTriggerNotificationDebouncer *)self->_debouncer setDelegate:self];
    debouncer = self->_debouncer;
  }
  return debouncer;
}

- (WFTriggerUserNotificationManager)initWithUserNotificationManager:(id)a3
{
  v24[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    dispatch_time_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"WFTriggerUserNotificationManager.m", 81, @"Invalid parameter not satisfying: %@", @"userNotificationManager" object file lineNumber description];
  }
  v23.receiver = self;
  v23.super_class = (Class)WFTriggerUserNotificationManager;
  id v7 = [(WFTriggerUserNotificationManager *)&v23 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_userNotificationManager, a3);
    userNotificationManager = v8->_userNotificationManager;
    id v10 = +[WFTriggerUserNotificationManager alertCategory];
    v24[0] = v10;
    BOOL v11 = +[WFTriggerUserNotificationManager promptCategory];
    v24[1] = v11;
    uint64_t v12 = +[WFTriggerUserNotificationManager backgroundRunningCategory];
    v24[2] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
    [(WFUserNotificationManager *)userNotificationManager registerCategoriesIfNecessary:v13];

    v14 = v8->_userNotificationManager;
    id v15 = +[WFTriggerUserNotificationManager alertCategory];
    [(WFUserNotificationManager *)v14 addObserver:v8 forCategory:v15];

    id v16 = v8->_userNotificationManager;
    id v17 = +[WFTriggerUserNotificationManager promptCategory];
    [(WFUserNotificationManager *)v16 addObserver:v8 forCategory:v17];

    id v18 = v8->_userNotificationManager;
    id v19 = +[WFTriggerUserNotificationManager backgroundRunningCategory];
    [(WFUserNotificationManager *)v18 addObserver:v8 forCategory:v19];

    id v20 = v8;
  }

  return v8;
}

+ (id)categoryIdentifiers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4FB7440];
  v4[1] = @"triggerAlertCategory";
  id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

+ (id)backgroundRunningCategory
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"arrow.up.forward.square"];
  uint64_t v3 = (void *)MEMORY[0x1E4F445D8];
  id v4 = WFLocalizedString(@"Edit in Shortcuts");
  uint64_t v5 = [v3 actionWithIdentifier:@"editAction" title:v4 options:4 icon:v2];

  id v6 = (void *)MEMORY[0x1E4F445D8];
  id v7 = WFLocalizedString(@"Disable Automations");
  uint64_t v8 = [v6 actionWithIdentifier:@"disableAction" title:v7 options:2 icon:0];

  id v9 = objc_alloc(MEMORY[0x1E4F445A0]);
  id v10 = (void *)[v9 initWithIdentifier:*MEMORY[0x1E4FB7438]];
  v13[0] = v5;
  v13[1] = v8;
  BOOL v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v10 setActions:v11];

  [v10 setListPriority:1];
  return v10;
}

+ (id)alertCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:@"triggerAlertCategory" actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

+ (id)promptCategory
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"play"];
  uint64_t v3 = (void *)MEMORY[0x1E4F445D8];
  id v4 = WFLocalizedString(@"Run");
  uint64_t v5 = [v3 actionWithIdentifier:@"runAction" title:v4 options:0 icon:v2];

  id v6 = objc_alloc(MEMORY[0x1E4F445A0]);
  id v7 = (void *)[v6 initWithIdentifier:*MEMORY[0x1E4FB7440]];
  v10[0] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v7 setActions:v8];

  [v7 setOptions:131073];
  [v7 setListPriority:2];

  return v7;
}

@end