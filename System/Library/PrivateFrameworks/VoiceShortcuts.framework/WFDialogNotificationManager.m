@interface WFDialogNotificationManager
+ (id)categoryIdentifiers;
+ (id)dialogNotificationCategory;
+ (id)dialogNotificationConfirmationCategory;
- (WFDialogNotificationManager)initWithUserNotificationManager:(id)a3;
- (WFUserNotificationManager)userNotificationManager;
- (void)handleRemovedIgnoredNotifications:(id)a3;
- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WFDialogNotificationManager

- (void).cxx_destruct
{
}

- (WFUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  (*((void (**)(id))a5 + 2))(a5);
  v7 = [v6 notification];
  v8 = [v7 request];
  v9 = [v8 content];

  v10 = [v9 userInfo];
  v11 = [v10 objectForKey:@"runningContext"];

  id v20 = 0;
  v12 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v20];
  id v13 = v20;
  if (v12)
  {
    v14 = [v6 actionIdentifier];
    if (([v14 isEqualToString:*MEMORY[0x1E4F446E0]] & 1) == 0)
    {
      v15 = [v9 userInfo];
      v16 = [v15 objectForKey:@"presentationMode"];

      uint64_t v17 = [v16 integerValue];
      v18 = (void *)[objc_alloc(MEMORY[0x1E4FB4A78]) initWithInput:0 presentationMode:v17];
      v19 = (void *)[objc_alloc(MEMORY[0x1E4FB7200]) initWithRunningContext:v12 runRequest:v18];
      [v19 start];
    }
  }
  else
  {
    v14 = getWFDialogLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[WFDialogNotificationManager userNotificationCenter:didReceiveNotificationResponse:withCompletionHandler:]";
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_ERROR, "%s Unable to get context from notification userInfo: %@", buf, 0x16u);
    }
  }
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v9 workflowIdentifier];
  if (!v10) {
    goto LABEL_4;
  }
  v11 = (void *)v10;
  v12 = [MEMORY[0x1E4FB71A8] defaultDatabase];
  id v13 = [v9 workflowIdentifier];
  v14 = [v12 referenceForWorkflowID:v13];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F5AA28];
    v16 = [v9 identifier];
    uint64_t v17 = [v15 proposedTemporaryFileURLForFilename:v16];

    v18 = [MEMORY[0x1E4FB46B8] currentDevice];
    [v18 screenScale];
    id v20 = objc_msgSend(v14, "attributionIconWithSize:scale:rounded:", 0, 20.0, 20.0, v19);

    v21 = [v20 PNGRepresentation];
    [v21 writeToURL:v17 atomically:0];

    v22 = (void *)MEMORY[0x1E4F44610];
    __int16 v23 = [v17 path];
    id v24 = [v22 iconAtPath:v23];
  }
  else
  {
LABEL_4:
    id v24 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:*MEMORY[0x1E4FB4BE8]];
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26 = [v8 message];
    [v25 setBody:v26];

    [v25 setShouldSuppressDefaultAction:1];
    v27 = (void *)MEMORY[0x1E4FB4CA0];
  }
  else
  {
    v28 = WFLocalizedString(@"Tap to respond");
    [v25 setBody:v28];

    [v25 setShouldBackgroundDefaultAction:1];
    v27 = (void *)MEMORY[0x1E4FB4C98];
  }
  [v25 setCategoryIdentifier:*v27];
  [v25 setInterruptionLevel:2];
  [v25 setShouldAuthenticateDefaultAction:1];
  [v25 setShouldIgnoreDoNotDisturb:1];
  v29 = [v8 attribution];
  v30 = [v29 title];
  [v25 setTitle:v30];

  [v25 setIcon:v24];
  v31 = [v8 promptForDisplay];
  [v25 setSubtitle:v31];

  v47[0] = @"runningContext";
  v32 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
  v47[1] = @"presentationMode";
  v48[0] = v32;
  v33 = [NSNumber numberWithUnsignedInteger:a4];
  v48[1] = v33;
  v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  [v25 setUserInfo:v34];

  v35 = [v9 workflowIdentifier];

  if (v35)
  {
    v36 = NSString;
    v37 = [v9 workflowIdentifier];
    v38 = [v36 stringWithFormat:@"workflow-identifier:%@", v37];
    [v25 setThreadIdentifier:v38];
  }
  v39 = (void *)MEMORY[0x1E4F44628];
  v40 = [v9 identifier];
  v41 = [v39 requestWithIdentifier:v40 content:v25 trigger:0 destinations:15];

  v42 = [(WFDialogNotificationManager *)self userNotificationManager];
  v43 = [v42 notificationCenter];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __91__WFDialogNotificationManager_postNotificationWithRequest_presentationMode_runningContext___block_invoke;
  v45[3] = &unk_1E6541478;
  id v46 = v8;
  id v44 = v8;
  [v43 addNotificationRequest:v41 withCompletionHandler:v45];
}

void __91__WFDialogNotificationManager_postNotificationWithRequest_presentationMode_runningContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = getWFDialogLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 136315650;
      v7 = "-[WFDialogNotificationManager postNotificationWithRequest:presentationMode:runningContext:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Unable to post request (%@) as a notification: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  int v6 = objc_opt_new();
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __65__WFDialogNotificationManager_handleRemovedIgnoredNotifications___block_invoke;
  v37[3] = &unk_1E6540E18;
  id v7 = v6;
  id v38 = v7;
  id v8 = v5;
  id v39 = v8;
  [v4 enumerateObjectsUsingBlock:v37];
  if ([v8 count])
  {
    uint64_t v9 = [(WFDialogNotificationManager *)self userNotificationManager];
    [v9 removeNotificationsWithIdentifiers:v8];
  }
  __int16 v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "wf_savedShortcutStatesURL");
  id v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (!v10)
  {
    id v14 = 0;
    id v13 = 0;
    if (![0 count]) {
      goto LABEL_25;
    }
LABEL_9:
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v30 = v11;
      v18 = v10;
      id v28 = v8;
      id v29 = v4;
      uint64_t v19 = *(void *)v33;
      id v20 = v15;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v20);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          if ((objc_msgSend(v7, "containsObject:", v22, v28, v29) & 1) == 0)
          {
            __int16 v23 = v20;
            id v24 = [v18 URLByAppendingPathComponent:v22];
            id v31 = v14;
            char v25 = [v30 removeItemAtURL:v24 error:&v31];
            id v26 = v31;

            if ((v25 & 1) == 0)
            {
              v27 = getWFDialogLogObject();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v41 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]";
                __int16 v42 = 2112;
                id v43 = v24;
                __int16 v44 = 2112;
                id v45 = v26;
                _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_ERROR, "%s Unable to delete state at path (%@), error: %@", buf, 0x20u);
              }
            }
            id v14 = v26;
            id v20 = v23;
          }
        }
        uint64_t v17 = [v20 countByEnumeratingWithState:&v32 objects:v46 count:16];
      }
      while (v17);
      id v13 = v20;
      v15 = v20;
      id v8 = v28;
      id v4 = v29;
      __int16 v10 = v18;
      id v11 = v30;
    }
    else
    {
      id v13 = v15;
    }
    goto LABEL_24;
  }
  uint64_t v12 = [v10 path];
  id v36 = 0;
  id v13 = [v11 contentsOfDirectoryAtPath:v12 error:&v36];
  id v14 = v36;

  if ([v13 count]) {
    goto LABEL_9;
  }
  if (v14)
  {
    v15 = getWFDialogLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v41 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]";
      __int16 v42 = 2112;
      id v43 = v14;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get contents of saved shortcut states: %@", buf, 0x16u);
    }
LABEL_24:
  }
LABEL_25:
}

void __65__WFDialogNotificationManager_handleRemovedIgnoredNotifications___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 request];
  uint64_t v5 = [v4 content];
  int v6 = [v5 userInfo];
  id v7 = [v6 objectForKey:@"runningContext"];

  if (v7)
  {
    id v18 = 0;
    id v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:&v18];
    uint64_t v9 = v18;
    if (v8)
    {
      __int16 v10 = *(void **)(a1 + 32);
      id v11 = [v8 identifier];
      [v10 addObject:v11];
    }
    else
    {
      v15 = getWFDialogLogObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v20 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]_block_invoke";
        __int16 v21 = 2114;
        uint64_t v22 = v9;
        _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_FAULT, "%s Decoding running context failed while trying to keep a workflow controller state around: %{public}@", buf, 0x16u);
      }

      uint64_t v16 = *(void **)(a1 + 40);
      id v11 = [v3 request];
      uint64_t v17 = [v11 identifier];
      [v16 addObject:v17];
    }
  }
  else
  {
    uint64_t v9 = getWFDialogLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [v3 request];
      id v13 = [v12 content];
      id v14 = [v13 userInfo];
      *(_DWORD *)buf = 136315394;
      id v20 = "-[WFDialogNotificationManager handleRemovedIgnoredNotifications:]_block_invoke";
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_ERROR, "%s Notification user info (%@) was expected to contain a running context but did not", buf, 0x16u);
    }
  }
}

- (WFDialogNotificationManager)initWithUserNotificationManager:(id)a3
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"WFDialogNotificationManager.m", 43, @"Invalid parameter not satisfying: %@", @"userNotificationManager" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)WFDialogNotificationManager;
  id v7 = [(WFDialogNotificationManager *)&v20 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_userNotificationManager, a3);
    userNotificationManager = v8->_userNotificationManager;
    __int16 v10 = +[WFDialogNotificationManager dialogNotificationCategory];
    v21[0] = v10;
    id v11 = +[WFDialogNotificationManager dialogNotificationConfirmationCategory];
    v21[1] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];
    [(WFUserNotificationManager *)userNotificationManager registerCategoriesIfNecessary:v12];

    id v13 = v8->_userNotificationManager;
    id v14 = +[WFDialogNotificationManager dialogNotificationCategory];
    [(WFUserNotificationManager *)v13 addObserver:v8 forCategory:v14];

    v15 = v8->_userNotificationManager;
    uint64_t v16 = +[WFDialogNotificationManager dialogNotificationConfirmationCategory];
    [(WFUserNotificationManager *)v15 addObserver:v8 forCategory:v16];

    uint64_t v17 = v8;
  }

  return v8;
}

+ (id)categoryIdentifiers
{
  v5[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB4CA0];
  v5[0] = *MEMORY[0x1E4FB4C98];
  v5[1] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];
  return v3;
}

+ (id)dialogNotificationConfirmationCategory
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"play"];
  id v3 = (void *)MEMORY[0x1E4F445D8];
  id v4 = WFLocalizedString(@"Continue");
  uint64_t v5 = [v3 actionWithIdentifier:@"confirm" title:v4 options:1 icon:v2];

  id v6 = (void *)MEMORY[0x1E4F44600];
  uint64_t v7 = *MEMORY[0x1E4FB4CA0];
  v11[0] = v5;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v9 = [v6 categoryWithIdentifier:v7 actions:v8 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:1];

  return v9;
}

+ (id)dialogNotificationCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:*MEMORY[0x1E4FB4C98] actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

@end