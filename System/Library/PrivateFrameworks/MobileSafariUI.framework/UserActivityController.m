@interface UserActivityController
- (BOOL)continueUserActivity:(id)a3;
- (BOOL)willContinueUserActivityWithType:(id)a3;
- (BrowserController)browserController;
- (TabDocument)tabDocumentPendingUserActivityPayload;
- (UserActivityController)initWithBrowserController:(id)a3;
- (id)_tabDocumentWithURL:(id)a3;
- (void)_invalidateTabCreationDelayTimer;
- (void)_prepareTabDocumentForNewUserActivity;
- (void)_prepareTabDocumentForNewUserActivityWithDelay:(double)a3;
- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4;
- (void)setTabDocumentPendingUserActivityPayload:(id)a3;
@end

@implementation UserActivityController

- (TabDocument)tabDocumentPendingUserActivityPayload
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
  return (TabDocument *)WeakRetained;
}

- (UserActivityController)initWithBrowserController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UserActivityController;
  v5 = [(UserActivityController *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserController, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)willContinueUserActivityWithType:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXContinuity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = v4;
    _os_log_impl(&dword_1E102C000, v5, OS_LOG_TYPE_INFO, "Will continue user activity with type: %{public}@", buf, 0xCu);
  }
  uint64_t v6 = *MEMORY[0x1E4F28AC0];
  uint64_t v7 = *MEMORY[0x1E4F3B1A8];
  v11[0] = *MEMORY[0x1E4F28AC0];
  v11[1] = v7;
  v11[2] = *MEMORY[0x1E4F3B128];
  v11[3] = @"OpenURLsIntent";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
  int v9 = [v8 containsObject:v4];
  if (v9 && [v4 isEqualToString:v6]) {
    [(UserActivityController *)self _prepareTabDocumentForNewUserActivityWithDelay:0.02];
  }

  return v9;
}

- (void)setTabDocumentPendingUserActivityPayload:(id)a3
{
  id obj = a3;
  p_tabDocumentPendingUserActivityPayload = &self->_tabDocumentPendingUserActivityPayload;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
  if (WeakRetained != obj)
  {
    [WeakRetained doneWaitingToContinueUserActivity];
    objc_storeWeak((id *)p_tabDocumentPendingUserActivityPayload, obj);
    [obj prepareToContinueUserActivity];
    [obj updateTabTitle];
  }
}

- (BOOL)continueUserActivity:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXContinuity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 activityType];
    *(_DWORD *)buf = 138543362;
    v43 = v7;
    _os_log_impl(&dword_1E102C000, v6, OS_LOG_TYPE_INFO, "Continue user activity with type: %{public}@", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  int v9 = [v4 activityType];
  if (![v9 isEqualToString:*MEMORY[0x1E4F3B1A8]])
  {
    if ([v9 isEqualToString:*MEMORY[0x1E4F3B128]])
    {
      uint64_t v14 = [MEMORY[0x1E4F97E48] sharedLogger];
      [v14 didContinueUserActivityOfType:1];

      v11 = [WeakRetained shortcutController];
      v12 = v11;
      id v13 = (void *)MEMORY[0x1E4F3B1B0];
      goto LABEL_7;
    }
    v12 = [v4 interaction];
    v16 = [MEMORY[0x1E4F97E48] sharedLogger];
    v17 = v16;
    if (v12)
    {
      [v16 didContinueUserActivityOfType:2];

      v18 = +[_SFNavigationIntent safari_navigationIntentForUserActivityContainingInteraction:](MEMORY[0x1E4F78590], v4);
      v19 = WBS_LOG_CHANNEL_PREFIXContinuity();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          v22 = [v18 privacyPreservingDescription];
          *(_DWORD *)buf = 138543362;
          v43 = v22;
          _os_log_impl(&dword_1E102C000, v21, OS_LOG_TYPE_DEFAULT, "Continuing user activity for OpenURLsIntent using intent: %{public}@", buf, 0xCu);
        }
        [WeakRetained dispatchNavigationIntent:v18];
        LOBYTE(v15) = 1;
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
          [(UserActivityController *)(uint64_t)v9 continueUserActivity:v12];
        }
        LOBYTE(v15) = 0;
      }
      goto LABEL_39;
    }
    [v16 didContinueUserActivityOfType:3];

    v23 = +[Application sharedApplication];
    v18 = [v23 systemNoteTakingController];

    v24 = [v18 userActivityForNoteTaking:v4];
    if (v24)
    {
      v25 = [v4 webpageURL];
      if (objc_msgSend(v25, "safari_isHTTPFamilyURL"))
      {
        v26 = [(UserActivityController *)self _tabDocumentWithURL:v25];
        if (v26)
        {
          v27 = v26;
          [v26 setUserActivityFromNotes:v24];
          v28 = [WeakRetained tabController];
          [v28 setActiveTabDocument:v27 animated:0];

          [v27 applyHighlightFromNotesIfNeeded];
          [v27 restoreAllHighlightsData];
          [(UserActivityController *)self _invalidateTabCreationDelayTimer];
          goto LABEL_26;
        }
      }
    }
    [(UserActivityController *)self _prepareTabDocumentForNewUserActivityWithDelay:0.0];
    v25 = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
    if (!v25
      || (-[UserActivityController setTabDocumentPendingUserActivityPayload:](self, "setTabDocumentPendingUserActivityPayload:", 0), ([v25 isClosed] & 1) != 0))
    {
      LOBYTE(v15) = 1;
LABEL_38:

LABEL_39:
      goto LABEL_40;
    }
    id v29 = objc_alloc(MEMORY[0x1E4F98A28]);
    v30 = [v4 userInfo];
    v27 = (void *)[v29 initWithDictionaryFromUserActivityUserInfo:v30];

    if (!v27)
    {
      v33 = [v4 webpageURL];
      int v15 = objc_msgSend(v33, "safari_isHTTPFamilyURL");
      if (v15)
      {
        [v25 setUserActivityFromNotes:v24];
        if ([v25 isHibernated]) {
          [v25 unhibernate];
        }
        objc_msgSend(v33, "safari_originalDataAsString");
        os_log_t logc = (os_log_t)objc_claimAutoreleasedReturnValue();
        [v25 progressState];
        v34 = v37 = v33;
        [v34 setLoadURL:logc];

        v33 = v37;
        id v35 = (id)[v25 loadURL:v37 userDriven:1];
      }
      else
      {
        log = WBS_LOG_CHANNEL_PREFIXContinuity();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
          -[UserActivityController continueUserActivity:](log);
        }
        os_log_t loga = (os_log_t)WBS_LOG_CHANNEL_PREFIXContinuity();
        if (os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG)) {
          -[UserActivityController continueUserActivity:](loga, v4);
        }
        [v25 didFailToContinueUserActivity];
      }

      goto LABEL_37;
    }
    os_log_t logb = [v27 url];
    v31 = [logb safari_originalDataAsString];
    v32 = [v25 progressState];
    [v32 setLoadURL:v31];

    [v25 loadCloudTab:v27];
LABEL_26:
    LOBYTE(v15) = 1;
LABEL_37:

    goto LABEL_38;
  }
  v10 = [MEMORY[0x1E4F97E48] sharedLogger];
  [v10 didContinueUserActivityOfType:0];

  v11 = [WeakRetained shortcutController];
  v12 = v11;
  id v13 = (void *)MEMORY[0x1E4F3B1C8];
LABEL_7:
  LOBYTE(v15) = [v11 handleActionWithType:*v13];
LABEL_40:

  return v15;
}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXContinuity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[UserActivityController didFailToContinueUserActivityWithType:error:]((uint64_t)v6, v8, v7);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
  [WeakRetained didFailToContinueUserActivity];

  [(UserActivityController *)self setTabDocumentPendingUserActivityPayload:0];
  [(UserActivityController *)self _invalidateTabCreationDelayTimer];
}

- (id)_tabDocumentWithURL:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  id v6 = [WeakRetained tabController];
  id v7 = [v6 currentTabDocuments];

  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__UserActivityController__tabDocumentWithURL___block_invoke;
  v11[3] = &unk_1E6D7B7A8;
  id v8 = v4;
  id v12 = v8;
  id v13 = &v14;
  [v7 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __46__UserActivityController__tabDocumentWithURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = *(void **)(a1 + 32);
  id v10 = v7;
  id v9 = [v7 urlForSharing];
  LODWORD(v8) = [v8 isEqual:v9];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_invalidateTabCreationDelayTimer
{
  [(NSTimer *)self->_tabCreationDelayTimer invalidate];
  tabCreationDelayTimer = self->_tabCreationDelayTimer;
  self->_tabCreationDelayTimer = 0;
}

- (void)_prepareTabDocumentForNewUserActivityWithDelay:(double)a3
{
  if (a3 == 0.0)
  {
    [(UserActivityController *)self _prepareTabDocumentForNewUserActivity];
    [(UserActivityController *)self _invalidateTabCreationDelayTimer];
  }
  else if (!self->_tabCreationDelayTimer)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E4F1CB00];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__UserActivityController__prepareTabDocumentForNewUserActivityWithDelay___block_invoke;
    v8[3] = &unk_1E6D7B538;
    objc_copyWeak(&v9, &location);
    id v6 = [v5 scheduledTimerWithTimeInterval:0 repeats:v8 block:a3];
    tabCreationDelayTimer = self->_tabCreationDelayTimer;
    self->_tabCreationDelayTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __73__UserActivityController__prepareTabDocumentForNewUserActivityWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _invalidateTabCreationDelayTimer];
    [v2 _prepareTabDocumentForNewUserActivity];
    id WeakRetained = v2;
  }
}

- (void)_prepareTabDocumentForNewUserActivity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);

  if (!WeakRetained)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXContinuity();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v13[0] = 0;
      _os_log_impl(&dword_1E102C000, v4, OS_LOG_TYPE_INFO, "Continue user activity with type: create a new tab.", (uint8_t *)v13, 2u);
    }
    id v5 = objc_loadWeakRetained((id *)&self->_browserController);
    id v6 = [v5 tabController];
    if (([v5 shouldStayInFocusedTabGroupForExternalLinks] & 1) == 0) {
      [v6 switchOutOfSyncedTabGroup];
    }
    id v7 = [v6 activeTabDocument];
    id v8 = v7;
    if (v7 && ![(TabDocument *)v7 isLoading] && [(TabDocument *)v8 isBlank])
    {
      [(TabDocument *)v8 setPreparingForNewUserActivity:1];
      id v9 = v8;
    }
    else
    {
      id v9 = [[TabDocument alloc] initWithBrowserController:v5];

      [(TabDocument *)v9 setIsBlank:1];
      [(TabDocument *)v9 setPreparingForNewUserActivity:1];
      id v10 = [(TabDocument *)v9 navigationBarItem];
      [v10 setShowsStopReloadButtons:0];

      [v6 insertNewTabDocumentWithDefaultOrdering:v9 inBackground:0 animated:0];
      v11 = [MEMORY[0x1E4F97E48] sharedLogger];
      id v12 = [v6 tabCollectionViewProvider];
      objc_msgSend(v11, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 0, objc_msgSend(v12, "visibleTabCollectionViewType"));
    }
    [v5 prepareToNavigateInTabDocument:v9];
    [(UserActivityController *)self setTabDocumentPendingUserActivityPayload:v9];
    [(TabDocument *)v9 setPreparingForNewUserActivity:0];
  }
}

- (BrowserController)browserController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  return (BrowserController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabDocumentPendingUserActivityPayload);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_tabCreationDelayTimer, 0);
}

- (void)continueUserActivity:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = a1;
  id v4 = [a2 userInfo];
  int v5 = 138477827;
  id v6 = v4;
  _os_log_debug_impl(&dword_1E102C000, v3, OS_LOG_TYPE_DEBUG, "Activity dictionary: %{private}@", (uint8_t *)&v5, 0xCu);
}

- (void)continueUserActivity:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E102C000, log, OS_LOG_TYPE_ERROR, "Failed to Handoff UserActivity; unable to create WBSCloudTab from activity dictionary",
    v1,
    2u);
}

- (void)continueUserActivity:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = [a3 intent];
  objc_opt_class();
  OUTLINED_FUNCTION_0_4();
  id v7 = v6;
  _os_log_fault_impl(&dword_1E102C000, v4, OS_LOG_TYPE_FAULT, "Failed to continue INInteraction-based user activity of type '%{public}@'. INIntent is of class '%{public}@'", v8, 0x16u);
}

- (void)didFailToContinueUserActivityWithType:(void *)a3 error:.cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  int v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_4();
  _os_log_error_impl(&dword_1E102C000, v4, OS_LOG_TYPE_ERROR, "Did fail to continue user activity with type %{public}@: %{public}@", v6, 0x16u);
}

@end