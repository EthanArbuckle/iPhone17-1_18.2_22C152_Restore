@interface WFWorkflowRunCoordinator
+ (id)errorCategory;
+ (id)errorWithActionCategory;
+ (int64_t)outOfProcessWorkflowControllerPresentationModeFromVCShortcutPresentationMode:(unint64_t)a3;
- (BOOL)hasInitializedToastManager;
- (OS_dispatch_queue)queue;
- (WFDatabaseProvider)databaseProvider;
- (WFDialogNotificationManager)dialogNotificationManager;
- (WFDialogPresentationManager)dialogPresentationManager;
- (WFToastManager)toastManager;
- (WFUIPresenter)userInterfacePresenter;
- (WFUserNotificationManager)userNotificationManager;
- (WFWorkflowRunCoordinator)initWithUserNotificationManager:(id)a3 databaseProvider:(id)a4;
- (id)unsupportedDialogResponseWithRequest:(id)a3;
- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4;
- (void)handleRemovedIgnoredNotifications:(id)a3;
- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6;
- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5;
- (void)presentationManager:(id)a3 updateSmartPromptStateData:(id)a4 actionUUID:(id)a5 context:(id)a6 reference:(id)a7;
- (void)setHasInitializedToastManager:(BOOL)a3;
- (void)showSingleStepCompletionWithWebClipMetadata:(id)a3 completion:(id)a4;
- (void)toastManager:(id)a3 didDismissToastedSessionWithIdentifier:(id)a4;
- (void)toastManager:(id)a3 didFailToToastSessionWithIdentifier:(id)a4 error:(id)a5;
- (void)toastManager:(id)a3 didToastSessionWithIdentifier:(id)a4 duration:(double)a5;
- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation WFWorkflowRunCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dialogPresentationManager, 0);
  objc_storeStrong((id *)&self->_dialogNotificationManager, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_userInterfacePresenter, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_toastManager, 0);
}

- (void)setHasInitializedToastManager:(BOOL)a3
{
  self->_hasInitializedToastManager = a3;
}

- (BOOL)hasInitializedToastManager
{
  return self->_hasInitializedToastManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (WFDialogPresentationManager)dialogPresentationManager
{
  return self->_dialogPresentationManager;
}

- (WFDialogNotificationManager)dialogNotificationManager
{
  return self->_dialogNotificationManager;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (WFUIPresenter)userInterfacePresenter
{
  return self->_userInterfacePresenter;
}

- (WFUserNotificationManager)userNotificationManager
{
  return self->_userNotificationManager;
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v22 = (void (**)(void))a5;
  v6 = [a4 notification];
  uint64_t v7 = [v6 request];
  v8 = [(id)v7 content];

  v9 = [(id)objc_opt_class() errorWithActionCategory];
  v10 = [v9 identifier];

  v11 = [v8 categoryIdentifier];
  LOBYTE(v7) = [v11 isEqualToString:v10];

  if (v7)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v12 setScheme:@"shortcuts"];
    v13 = [v8 categoryIdentifier];
    int v14 = [v13 isEqualToString:v10];

    if (v14)
    {
      [v12 setHost:@"open-shortcut"];
      v15 = (void *)MEMORY[0x1E4F1CB10];
      v16 = [v8 userInfo];
      v17 = objc_msgSend(v15, "dc_queryItemsFromQueryDictionary:", v16);
      [v12 setQueryItems:v17];
    }
    v18 = (void *)MEMORY[0x1E4FB73D0];
    v19 = [v12 URL];
    v20 = [v18 requestWithURL:v19];

    v21 = [MEMORY[0x1E4FB70A0] sharedManager];
    [v21 performRequest:v20];

    v22[2]();
  }
  else
  {
    v22[2]();
  }
}

- (void)postNotificationAboutFailure:(id)a3 inWorkflow:(id)a4 dialogAttribution:(id)a5 runningContext:(id)a6
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v11;
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v15 = 0;
      v16 = v14;
      goto LABEL_19;
    }
  }

  v17 = [v13 runSource];
  char IsSpotlight = WFRunSourceIsSpotlight();

  if (IsSpotlight) {
    goto LABEL_17;
  }
  v19 = [v13 runSource];
  v20 = (void *)*MEMORY[0x1E4FB4EF8];
  id v21 = v19;
  id v22 = v20;
  if (v21 != v22)
  {
    v23 = v22;
    if (v21 && v22)
    {
      char v24 = [v21 isEqualToString:v22];

      if (v24) {
        goto LABEL_17;
      }
    }
    else
    {
    }
    v25 = [v13 runSource];
    v26 = (void *)*MEMORY[0x1E4FB4F30];
    id v21 = v25;
    id v27 = v26;
    if (v21 != v27)
    {
      v28 = v27;
      if (!v21 || !v27)
      {

        v16 = 0;
        goto LABEL_60;
      }
      char v29 = [v21 isEqualToString:v27];

      v16 = 0;
      if ((v29 & 1) == 0) {
        goto LABEL_60;
      }
      goto LABEL_18;
    }
  }

LABEL_17:
  v16 = 0;
LABEL_18:
  int v15 = 1;
LABEL_19:
  if (([v16 hiddenFromLibraryAndSync] & 1) == 0)
  {
    v30 = getWFDialogLogObject();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v90 = "-[WFWorkflowRunCoordinator postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:]";
      __int16 v91 = 2112;
      id v92 = v10;
      __int16 v93 = 2112;
      v94 = v16;
      _os_log_impl(&dword_1C7D7E000, v30, OS_LOG_TYPE_ERROR, "%s Posting notification for error (%@) when running workflow: %@", buf, 0x20u);
    }

    v31 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v32 = [v31 UUIDString];

    v84 = self;
    int v83 = v15;
    if (v15)
    {
      v33 = (void *)MEMORY[0x1E4F44610];
      if (v12)
      {
        v34 = [v12 appBundleIdentifier];
        v81 = [v33 iconForApplicationIdentifier:v34];
      }
      else
      {
        v81 = [MEMORY[0x1E4F44610] iconForApplicationIdentifier:*MEMORY[0x1E4FB4BE8]];
      }
      uint64_t v42 = WFLocalizedString(@"your shortcut");
    }
    else
    {
      v35 = [MEMORY[0x1E4F5AA28] proposedTemporaryFileURLForFilename:v32];
      v36 = [MEMORY[0x1E4FB46B8] currentDevice];
      [v36 screenScale];
      v38 = objc_msgSend(v16, "attributionIconWithSize:scale:rounded:", 0, 48.0, 48.0, v37);

      v39 = [v38 PNGRepresentation];
      [v39 writeToURL:v35 atomically:0];

      v40 = (void *)MEMORY[0x1E4F44610];
      v41 = [v35 path];
      v81 = [v40 iconAtPath:v41];

      uint64_t v42 = [v16 name];
    }
    v82 = (void *)v42;
    v43 = [v10 domain];
    id v79 = v13;
    v80 = v12;
    v78 = (void *)v32;
    if ([v43 isEqualToString:*MEMORY[0x1E4FB4D90]]) {
      BOOL v44 = [v10 code] == 3 || objc_msgSend(v10, "code") == 4;
    }
    else {
      BOOL v44 = 0;
    }

    v45 = [v10 userInfo];
    v46 = [v45 objectForKey:*MEMORY[0x1E4F28568]];

    if (v44)
    {
      v85 = 0;
    }
    else
    {
      v47 = [v10 userInfo];
      v85 = [v47 objectForKey:*MEMORY[0x1E4F28588]];
    }
    v48 = NSString;
    v49 = WFLocalizedString(@"An error occurred while running %@. (%@, %i)");
    v50 = [v10 domain];
    v86 = objc_msgSend(v48, "stringWithFormat:", v49, v82, v50, objc_msgSend(v10, "code"));

    id v51 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v52 = [v16 identifier];

    if (v52)
    {
      v53 = [v16 identifier];
      [v51 setObject:v53 forKey:*MEMORY[0x1E4FB7460]];
    }
    v54 = [v10 userInfo];
    v55 = [v54 objectForKey:*MEMORY[0x1E4FB74B0]];

    if (v55)
    {
      [v51 setObject:v55 forKey:*MEMORY[0x1E4FB7458]];
      v56 = [v10 localizedDescription];
      [v51 setObject:v56 forKey:*MEMORY[0x1E4FB7450]];
    }
    id v57 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    v58 = [v16 attributionTitle];
    if (v58)
    {
      [v57 setTitle:v58];
    }
    else
    {
      v59 = [v80 title];
      [v57 setTitle:v59];
    }
    [v57 setIcon:v81];
    if ([v46 length]) {
      v60 = v46;
    }
    else {
      v60 = v86;
    }
    [v57 setBody:v60];
    [v57 setShouldBackgroundDefaultAction:1];
    [v57 setShouldIgnoreDoNotDisturb:1];
    [v57 setUserInfo:v51];
    if (v83)
    {
      v61 = [MEMORY[0x1E4F29128] UUID];
      [v61 UUIDString];
    }
    else
    {
      v63 = NSString;
      v61 = [v16 identifier];
      [v63 stringWithFormat:@"workflow-error: %@", v61];
    v62 = };
    [v57 setThreadIdentifier:v62];

    if (![v46 length] || (uint64_t v65 = objc_msgSend(v85, "length"), v64 = v46, v65))
    {
      if (objc_msgSend(v46, "length", v64) || (uint64_t v68 = objc_msgSend(v85, "length"), v64 = v85, !v68))
      {
        uint64_t v66 = [v46 length];
        v64 = v86;
        if (v66)
        {
          uint64_t v67 = objc_msgSend(v85, "length", v86);
          v64 = v86;
          if (v67)
          {
            [v57 setSubtitle:v85];
            v64 = v46;
          }
        }
      }
    }
    [v57 setBody:v64];
    v69 = objc_opt_class();
    if (v83) {
      [v69 errorCategory];
    }
    else {
    v70 = [v69 errorWithActionCategory];
    }
    v71 = [v70 identifier];
    [v57 setCategoryIdentifier:v71];

    v72 = (void *)MEMORY[0x1E4F44628];
    v73 = [MEMORY[0x1E4F29128] UUID];
    v74 = [v73 UUIDString];
    v75 = [v72 requestWithIdentifier:v74 content:v57 trigger:0 destinations:7];

    v76 = [(WFWorkflowRunCoordinator *)v84 userNotificationManager];
    v77 = [v76 notificationCenter];
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __101__WFWorkflowRunCoordinator_postNotificationAboutFailure_inWorkflow_dialogAttribution_runningContext___block_invoke;
    v87[3] = &unk_1E6541478;
    id v88 = v10;
    [v77 addNotificationRequest:v75 withCompletionHandler:v87];

    id v13 = v79;
    id v12 = v80;
  }
LABEL_60:
}

void __101__WFWorkflowRunCoordinator_postNotificationAboutFailure_inWorkflow_dialogAttribution_runningContext___block_invoke(uint64_t a1, void *a2)
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
      uint64_t v7 = "-[WFWorkflowRunCoordinator postNotificationAboutFailure:inWorkflow:dialogAttribution:runningContext:]_block_invoke";
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Unable to post error (%@) as a notification: %@", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)postNotificationWithRequest:(id)a3 presentationMode:(unint64_t)a4 runningContext:(id)a5
{
}

- (void)toastManager:(id)a3 didFailToToastSessionWithIdentifier:(id)a4 error:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  __int16 v8 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 136315650;
    __int16 v10 = "-[WFWorkflowRunCoordinator toastManager:didFailToToastSessionWithIdentifier:error:]";
    __int16 v11 = 2112;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_ERROR, "%s Failed to toast session with identifier %{identifier}@: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)toastManager:(id)a3 didDismissToastedSessionWithIdentifier:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[WFWorkflowRunCoordinator toastManager:didDismissToastedSessionWithIdentifier:]";
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Toasted session with identifier %{public}@ is dismissed, let's resume dialog presentation", (uint8_t *)&v8, 0x16u);
  }

  id v7 = [(WFWorkflowRunCoordinator *)self userInterfacePresenter];
  [v7 resumeDialogPresentationWithCompletionHandler:&__block_literal_global_211];
}

void __80__WFWorkflowRunCoordinator_toastManager_didDismissToastedSessionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = getWFWorkflowExecutionLogObject();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      __int16 v10 = "-[WFWorkflowRunCoordinator toastManager:didDismissToastedSessionWithIdentifier:]_block_invoke";
      __int16 v11 = 2112;
      id v12 = v2;
      id v5 = "%s Failed to resume dialog presentation: %@";
      id v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl(&dword_1C7D7E000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    __int16 v10 = "-[WFWorkflowRunCoordinator toastManager:didDismissToastedSessionWithIdentifier:]_block_invoke";
    id v5 = "%s Resumed dialog presentation";
    id v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 12;
    goto LABEL_6;
  }
}

- (void)toastManager:(id)a3 didToastSessionWithIdentifier:(id)a4 duration:(double)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  uint32_t v8 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[WFWorkflowRunCoordinator toastManager:didToastSessionWithIdentifier:duration:]";
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEFAULT, "%s Toasted session with identifier %{public}@", buf, 0x16u);
  }

  int v9 = [(WFWorkflowRunCoordinator *)self userInterfacePresenter];
  __int16 v10 = [NSNumber numberWithDouble:a5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __80__WFWorkflowRunCoordinator_toastManager_didToastSessionWithIdentifier_duration___block_invoke;
  v11[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  *(double *)&v11[4] = a5;
  [v9 pauseDialogPresentationForDuration:v10 withCompletionHandler:v11];
}

void __80__WFWorkflowRunCoordinator_toastManager_didToastSessionWithIdentifier_duration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = getWFWorkflowExecutionLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      uint32_t v8 = "-[WFWorkflowRunCoordinator toastManager:didToastSessionWithIdentifier:duration:]_block_invoke";
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1C7D7E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to pause dialog presentation: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  id v5 = getWFWorkflowExecutionLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
    int v7 = 136315394;
    uint32_t v8 = "-[WFWorkflowRunCoordinator toastManager:didToastSessionWithIdentifier:duration:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_DEFAULT, "%s Paused dialog presentation for %@ seconds", (uint8_t *)&v7, 0x16u);
  }
}

- (void)presentationManager:(id)a3 updateSmartPromptStateData:(id)a4 actionUUID:(id)a5 context:(id)a6 reference:(id)a7
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a7;
  uint64_t v13 = [(WFWorkflowRunCoordinator *)self databaseProvider];
  __int16 v14 = [v13 databaseWithError:0];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v10;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v18 = v16;
    uint64_t v19 = *(void *)v27;
    *(void *)&long long v17 = 136315394;
    long long v24 = v17;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * v20);
        id v25 = 0;
        objc_msgSend(v14, "saveSmartPromptStateData:actionUUID:reference:error:", v21, v11, v12, &v25, v24);
        id v22 = v25;
        if (v22)
        {
          v23 = getWFWorkflowExecutionLogObject();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v31 = "-[WFWorkflowRunCoordinator presentationManager:updateSmartPromptStateData:actionUUID:context:reference:]";
            __int16 v32 = 2112;
            id v33 = v22;
            _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_ERROR, "%s Failed to save smart prompt state data: %@", buf, 0x16u);
          }
        }
        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v18);
  }
}

- (id)unsupportedDialogResponseWithRequest:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB7300]) initWithUnsupported:1];
  }
  else {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4FB46E0]) initWithCancelled:1];
  }
  return v5;
}

- (void)dismissToastedSessionKitSessionsWithReason:(id)a3 completion:(id)a4
{
  id v10 = a3;
  int v7 = (void (**)(void))a4;
  if (!v10)
  {
    __int16 v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"WFWorkflowRunCoordinator.m", 166, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];
  }
  uint32_t v8 = [(WFWorkflowRunCoordinator *)self toastManager];
  [v8 eatTheToastWithReason:v10];

  v7[2](v7);
}

- (void)toastSessionKitSessionWithIdentifier:(id)a3 forDuration:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t))a5;
  id v11 = getWFSessionKitLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    [v9 doubleValue];
    int v16 = 136315650;
    long long v17 = "-[WFWorkflowRunCoordinator toastSessionKitSessionWithIdentifier:forDuration:completion:]";
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 2048;
    uint64_t v21 = v12;
    _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_INFO, "%s Toasting SessionKit session with identifier: %@ for duration: %f", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v13 = [(WFWorkflowRunCoordinator *)self toastManager];
  if (v9) {
    [v9 doubleValue];
  }
  else {
    double v14 = -1.0;
  }
  uint64_t v15 = [v13 toastSessionWithIdentifier:v8 forDuration:v14];

  v10[2](v10, v15);
}

- (void)showSingleStepCompletionWithWebClipMetadata:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(WFWorkflowRunCoordinator *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke;
  block[3] = &unk_1E6541F40;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke(id *a1)
{
  id v2 = [a1[4] databaseProvider];
  id v3 = [v2 databaseWithError:0];

  id v4 = objc_alloc(MEMORY[0x1E4FB4698]);
  id v5 = [a1[5] shortcutIdentifier];
  id v6 = (void *)[v4 initWithIdentifier:v5 objectType:0];

  id v7 = [v3 recordWithDescriptor:v6 error:0];
  id v8 = objc_alloc(MEMORY[0x1E4FB7318]);
  id v9 = [v7 name];
  id v10 = [a1[5] applicationIdentifier];
  id v11 = (void *)[v8 initWithShortcutName:v9 applicationBundleIdentifier:v10];

  id v12 = objc_alloc(MEMORY[0x1E4FB4A98]);
  id v13 = [a1[5] shortcutIdentifier];
  double v14 = (void *)[v12 initWithWorkflowIdentifier:v13];

  [v14 setRunKind:*MEMORY[0x1E4FB4EF0]];
  [v14 setAllowsDialogNotifications:0];
  uint64_t v15 = [a1[4] userInterfacePresenter];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke_2;
  v16[3] = &unk_1E6540B70;
  id v17 = a1[6];
  [v15 showDialogRequest:v11 runningContext:v14 completionHandler:v16];
}

uint64_t __83__WFWorkflowRunCoordinator_showSingleStepCompletionWithWebClipMetadata_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (WFToastManager)toastManager
{
  toastManager = self->_toastManager;
  if (!toastManager)
  {
    if (self->_hasInitializedToastManager)
    {
      toastManager = 0;
    }
    else
    {
      id v4 = [[WFToastManager alloc] initWithDelegate:self];
      id v5 = self->_toastManager;
      self->_toastManager = v4;

      self->_hasInitializedToastManager = 1;
      toastManager = self->_toastManager;
    }
  }
  return toastManager;
}

- (void)handleRemovedIgnoredNotifications:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWorkflowRunCoordinator *)self dialogPresentationManager];
  [v5 handleRemovedIgnoredNotifications:v4];
}

- (WFWorkflowRunCoordinator)initWithUserNotificationManager:(id)a3 databaseProvider:(id)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)WFWorkflowRunCoordinator;
  id v9 = [(WFWorkflowRunCoordinator *)&v32 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databaseProvider, a4);
    objc_storeStrong((id *)&v10->_userNotificationManager, a3);
    userNotificationManager = v10->_userNotificationManager;
    id v12 = +[WFWorkflowRunCoordinator errorCategory];
    v33[0] = v12;
    id v13 = +[WFWorkflowRunCoordinator errorWithActionCategory];
    v33[1] = v13;
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    [(WFUserNotificationManager *)userNotificationManager registerCategoriesIfNecessary:v14];

    uint64_t v15 = v10->_userNotificationManager;
    int v16 = +[WFWorkflowRunCoordinator errorCategory];
    [(WFUserNotificationManager *)v15 addObserver:v10 forCategory:v16];

    id v17 = v10->_userNotificationManager;
    __int16 v18 = +[WFWorkflowRunCoordinator errorWithActionCategory];
    [(WFUserNotificationManager *)v17 addObserver:v10 forCategory:v18];

    id v19 = [[WFDialogNotificationManager alloc] initWithUserNotificationManager:v10->_userNotificationManager];
    dialogNotificationManager = v10->_dialogNotificationManager;
    v10->_dialogNotificationManager = v19;

    uint64_t v21 = [[WFDialogPresentationManager alloc] initWithNotificationManager:v10->_dialogNotificationManager];
    dialogPresentationManager = v10->_dialogPresentationManager;
    v10->_dialogPresentationManager = v21;

    [(WFDialogPresentationManager *)v10->_dialogPresentationManager setDelegate:v10];
    v23 = objc_opt_new();
    if (objc_opt_respondsToSelector()) {
      [v23 setInterruptionHandler:&__block_literal_global_188];
    }
    uint64_t v24 = [objc_alloc(MEMORY[0x1E4FB7370]) initWithConnection:v23];
    userInterfacePresenter = v10->_userInterfacePresenter;
    v10->_userInterfacePresenter = (WFUIPresenter *)v24;

    [(WFUIPresenter *)v10->_userInterfacePresenter setDelegate:v10];
    long long v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    long long v27 = dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v28 = dispatch_queue_create("com.apple.shortcuts.WFWorkflowRunCoordinator", v27);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v28;

    v30 = v10;
  }

  return v10;
}

void __77__WFWorkflowRunCoordinator_initWithUserNotificationManager_databaseProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = getWFGeneralLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[WFWorkflowRunCoordinator initWithUserNotificationManager:databaseProvider:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_ERROR, "%s UI presenter connection went down with error %@", (uint8_t *)&v4, 0x16u);
  }
}

+ (int64_t)outOfProcessWorkflowControllerPresentationModeFromVCShortcutPresentationMode:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 2;
  }
  else {
    return qword_1C7EBA620[a3 - 1];
  }
}

+ (id)errorWithActionCategory
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F445E8] iconWithSystemImageName:@"arrow.up.forward.app"];
  id v3 = (void *)MEMORY[0x1E4F445D8];
  int v4 = WFLocalizedString(@"Show");
  id v5 = [v3 actionWithIdentifier:@"WFShow" title:v4 options:0 icon:v2];

  __int16 v6 = (void *)MEMORY[0x1E4F44600];
  v10[0] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v8 = [v6 categoryWithIdentifier:@"WFWorkflowRunCoordinatorErrorWithActionCategory" actions:v7 intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];

  return v8;
}

+ (id)errorCategory
{
  return (id)[MEMORY[0x1E4F44600] categoryWithIdentifier:@"WFWorkflowRunCoordinatorErrorCategory" actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:MEMORY[0x1E4F1CBF0] options:0];
}

@end