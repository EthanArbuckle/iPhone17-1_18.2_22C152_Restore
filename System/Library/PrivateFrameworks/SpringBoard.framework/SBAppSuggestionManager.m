@interface SBAppSuggestionManager
+ (SBAppSuggestionManager)sharedInstance;
- (SBAppSuggestionManager)init;
- (id)currentSuggestedApp;
- (void)_calculateBestSuggestionAndNotifyListeners;
- (void)_createSuggestionSources;
- (void)_deregisterFromProactiveSuggestionNotifications;
- (void)_destroySuggestionSources;
- (void)_evaluateSuggestionUpdates:(id)a3;
- (void)_handleAppUninstall:(id)a3;
- (void)_handleInitialSpringBoardLaunch;
- (void)_listenForNotifications;
- (void)_registerForProactiveSuggestionNotifications;
- (void)_screenDidDim:(id)a3;
- (void)_screenDidUndim:(id)a3;
- (void)_setContinuitySuggestionUpdatesEnabled:(BOOL)a3 expertCenterSuggestionUpdatesEnabled:(BOOL)a4;
- (void)_stopListeningForNotifications;
- (void)bestAppSuggestionChanged:(id)a3;
- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)disableListeningForUpdatesForReason:(id)a3;
- (void)enableListeningForUpdatesForReason:(id)a3;
- (void)noteActivatingForAppSuggestion:(id)a3 fromSource:(int64_t)a4;
- (void)noteNotActivatingForAppSuggestion:(id)a3 fromSource:(int64_t)a4;
- (void)performWithCurrentSuggestedAppAndApplication:(id)a3;
- (void)proactiveSuggestionChanged;
- (void)startFetchingPayloadForAppSuggestion:(id)a3;
@end

@implementation SBAppSuggestionManager

- (void)disableListeningForUpdatesForReason:(id)a3
{
  id v4 = a3;
  if (-[NSCountedSet containsObject:](self->_listeningReasons, "containsObject:"))
  {
    [(NSCountedSet *)self->_listeningReasons removeObject:v4];
    [(SBAppSuggestionManager *)self _evaluateSuggestionUpdates:0];
  }
}

- (id)currentSuggestedApp
{
  return self->_currentBestSuggestion;
}

+ (SBAppSuggestionManager)sharedInstance
{
  if (sharedInstance_onceToken_33 != -1) {
    dispatch_once(&sharedInstance_onceToken_33, &__block_literal_global_246);
  }
  v2 = (void *)sharedInstance___sharedInstance_18;
  return (SBAppSuggestionManager *)v2;
}

void __40__SBAppSuggestionManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBAppSuggestionManager);
  v1 = (void *)sharedInstance___sharedInstance_18;
  sharedInstance___sharedInstance_18 = (uint64_t)v0;
}

- (SBAppSuggestionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBAppSuggestionManager;
  v2 = [(SBAppSuggestionManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    [(SBAppSuggestionManager *)v2 _createSuggestionSources];
    [(SBAppSuggestionManager *)v3 _listenForNotifications];
    id v4 = objc_alloc_init(MEMORY[0x1E4F4E708]);
    [v4 setIdentifier:@"com.apple.SpringBoard.AppSuggestionManager"];
    [v4 setEventMask:3967];
    [v4 setAttentionLostTimeout:0.0];
    v5 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v3->_idleTouchAwarenessClient;
    v3->_idleTouchAwarenessClient = v5;

    [(SBAttentionAwarenessClient *)v3->_idleTouchAwarenessClient setConfiguration:v4];
    [(SBAttentionAwarenessClient *)v3->_idleTouchAwarenessClient setEnabled:1];
    [(SBAttentionAwarenessClient *)v3->_idleTouchAwarenessClient setDelegate:v3];
  }
  return v3;
}

- (void)dealloc
{
  [(SBAppSuggestionManager *)self _stopListeningForNotifications];
  [(SBAppSuggestionManager *)self _destroySuggestionSources];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setDelegate:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBAppSuggestionManager;
  [(SBAppSuggestionManager *)&v3 dealloc];
}

- (void)_createSuggestionSources
{
  objc_super v3 = (UABestAppSuggestionManager *)objc_alloc_init(MEMORY[0x1E4FB36C0]);
  continuitySuggestionManager = self->_continuitySuggestionManager;
  self->_continuitySuggestionManager = v3;

  [(UABestAppSuggestionManager *)self->_continuitySuggestionManager setDelegate:self];
  v5 = (ATXProactiveSuggestionClient *)[objc_alloc(MEMORY[0x1E4F4B298]) initWithConsumerSubType:31];
  proactiveSuggestionClient = self->_proactiveSuggestionClient;
  self->_proactiveSuggestionClient = v5;
}

- (void)_destroySuggestionSources
{
  [(UABestAppSuggestionManager *)self->_continuitySuggestionManager stopListeningForBestAppSuggestions];
  [(UABestAppSuggestionManager *)self->_continuitySuggestionManager setDelegate:0];
  [(SBAppSuggestionManager *)self _deregisterFromProactiveSuggestionNotifications];
}

- (void)_listenForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__screenDidUndim_ name:*MEMORY[0x1E4FA7A30] object:0];
  [v3 addObserver:self selector:sel__screenDidDim_ name:*MEMORY[0x1E4FA7A10] object:0];
  [v3 addObserver:self selector:sel__evaluateSuggestionUpdates_ name:*MEMORY[0x1E4FA7A38] object:0];
  [v3 addObserver:self selector:sel__handleInitialSpringBoardLaunch name:*MEMORY[0x1E4F43668] object:0];
  [v3 addObserver:self selector:sel__handleAppUninstall_ name:@"SBInstalledApplicationsDidChangeNotification" object:0];
}

- (void)_stopListeningForNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA7A30] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA7A10] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FA7A38] object:0];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43668] object:0];
  [v3 removeObserver:self name:@"SBInstalledApplicationsDidChangeNotification" object:0];
}

- (void)performWithCurrentSuggestedAppAndApplication:(id)a3
{
  id v4 = (void (**)(id, SBBestAppSuggestion *, id))a3;
  v5 = +[SBApplicationController sharedInstance];
  v6 = [(SBBestAppSuggestion *)self->_currentBestSuggestion bundleIdentifier];
  id v7 = [v5 applicationWithBundleIdentifier:v6];

  v4[2](v4, self->_currentBestSuggestion, v7);
}

- (void)startFetchingPayloadForAppSuggestion:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = dispatch_get_global_queue(0, 2uLL);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__SBAppSuggestionManager_startFetchingPayloadForAppSuggestion___block_invoke;
    v6[3] = &unk_1E6AF5290;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

uint64_t __63__SBAppSuggestionManager_startFetchingPayloadForAppSuggestion___block_invoke(uint64_t a1)
{
  kdebug_trace();
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2) {
    uint64_t v4 = *(void *)(v2 + 8);
  }
  else {
    uint64_t v4 = 0;
  }
  return [v3 queueFetchOfPayloadForBestAppSuggestion:v4];
}

- (void)enableListeningForUpdatesForReason:(id)a3
{
  id v4 = a3;
  listeningReasons = self->_listeningReasons;
  id v8 = v4;
  if (!listeningReasons)
  {
    v6 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E4F28BD0]);
    id v7 = self->_listeningReasons;
    self->_listeningReasons = v6;

    id v4 = v8;
    listeningReasons = self->_listeningReasons;
  }
  if (([(NSCountedSet *)listeningReasons containsObject:v4] & 1) == 0)
  {
    [(NSCountedSet *)self->_listeningReasons addObject:v8];
    [(SBAppSuggestionManager *)self _evaluateSuggestionUpdates:0];
  }
}

- (void)_screenDidDim:(id)a3
{
  *(_WORD *)&self->_screenOnDueToUserEvent = 0;
  [(SBAppSuggestionManager *)self _evaluateSuggestionUpdates:a3];
}

- (void)_screenDidUndim:(id)a3
{
  id v8 = a3;
  id v4 = [v8 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA7A08]];

  if (v5)
  {
    int v6 = [v5 intValue];
    if ((unint64_t)v6 > 0x2F || ((1 << v6) & 0x8001801002FCLL) == 0)
    {
      self->_screenOnAndLookingForEvent = 1;
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:1];
    }
    else
    {
      self->_screenOnDueToUserEvent = 1;
    }
    [(SBAppSuggestionManager *)self _evaluateSuggestionUpdates:v8];
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  -[SBAttentionAwarenessClient setEnabled:](self->_idleTouchAwarenessClient, "setEnabled:", 0, a4);
  if (self->_screenOnAndLookingForEvent)
  {
    self->_screenOnAndLookingForEvent = 0;
    v5 = +[SBBacklightController sharedInstance];
    self->_screenOnDueToUserEvent = [v5 screenIsOn];

    [(SBAppSuggestionManager *)self _evaluateSuggestionUpdates:0];
  }
}

- (void)_handleInitialSpringBoardLaunch
{
  id v3 = +[SBLockScreenManager sharedInstance];
  int v4 = [v3 isUILocked];

  if (v4)
  {
    self->_screenOnDueToUserEvent = 1;
    [(SBAppSuggestionManager *)self _evaluateSuggestionUpdates:0];
  }
}

- (void)_evaluateSuggestionUpdates:(id)a3
{
  id v8 = +[SBLockScreenManager sharedInstance];
  int v4 = [v8 isUILocked];
  BOOL v5 = self->_screenOnDueToUserEvent || self->_screenOnAndLookingForEvent;
  uint64_t v6 = [(NSCountedSet *)self->_listeningReasons count];
  BOOL screenOnDueToUserEvent = v6 != 0;
  if (!v6 && ((v4 ^ 1) & 1) == 0) {
    BOOL screenOnDueToUserEvent = self->_screenOnDueToUserEvent;
  }
  [(SBAppSuggestionManager *)self _setContinuitySuggestionUpdatesEnabled:screenOnDueToUserEvent expertCenterSuggestionUpdatesEnabled:screenOnDueToUserEvent | v4 & v5];
}

- (void)_setContinuitySuggestionUpdatesEnabled:(BOOL)a3 expertCenterSuggestionUpdatesEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL isListeningForContinuitySuggestion = self->_isListeningForContinuitySuggestion;
  BOOL isListeningForExpertCenterSuggestion = self->_isListeningForExpertCenterSuggestion;
  if (self->_isListeningForContinuitySuggestion || !a3)
  {
    int v9 = 0;
    if (self->_isListeningForContinuitySuggestion && !a3)
    {
      v10 = SBLogContinuity();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "No longer listening for handoff app suggestions", buf, 2u);
      }

      [(UABestAppSuggestionManager *)self->_continuitySuggestionManager stopListeningForBestAppSuggestions];
      self->_BOOL isListeningForContinuitySuggestion = 0;
      continuityCurrentBestSuggestion = self->_continuityCurrentBestSuggestion;
      self->_continuityCurrentBestSuggestion = 0;

      int v9 = 1;
    }
  }
  else
  {
    v12 = SBLogContinuity();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1D85BA000, v12, OS_LOG_TYPE_INFO, "Starting to listen for handoff app suggestions", v23, 2u);
    }

    [(UABestAppSuggestionManager *)self->_continuitySuggestionManager startListeningForBestAppSuggestions];
    int v9 = 0;
    self->_BOOL isListeningForContinuitySuggestion = 1;
  }
  if (v4)
  {
    if (!self->_isListeningForExpertCenterSuggestion)
    {
      v14 = SBLogContinuity();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1D85BA000, v14, OS_LOG_TYPE_INFO, "Starting to listen for Duet app suggestions", v21, 2u);
      }

      [(SBAppSuggestionManager *)self _registerForProactiveSuggestionNotifications];
      self->_BOOL isListeningForExpertCenterSuggestion = 1;
    }
  }
  else if (self->_isListeningForExpertCenterSuggestion)
  {
    v15 = SBLogContinuity();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D85BA000, v15, OS_LOG_TYPE_INFO, "No longer listening for Duet app suggestions", v20, 2u);
    }

    [(SBAppSuggestionManager *)self _deregisterFromProactiveSuggestionNotifications];
    self->_BOOL isListeningForExpertCenterSuggestion = 0;
    currentProactiveBestSuggestion = self->_currentProactiveBestSuggestion;
    self->_currentProactiveBestSuggestion = 0;

    int v9 = 1;
  }
  if (isListeningForExpertCenterSuggestion || isListeningForContinuitySuggestion)
  {
    if (self->_isListeningForContinuitySuggestion || self->_isListeningForExpertCenterSuggestion) {
      goto LABEL_31;
    }
    v17 = +[SBEventObserverRegistry sharedInstance];
    [v17 setValue:0 forState:*MEMORY[0x1E4FA6FC0]];
    v18 = (void *)MEMORY[0x1E4FA6FA0];
  }
  else
  {
    if (!self->_isListeningForContinuitySuggestion && !self->_isListeningForExpertCenterSuggestion) {
      goto LABEL_31;
    }
    v17 = +[SBEventObserverRegistry sharedInstance];
    [v17 setValue:1 forState:*MEMORY[0x1E4FA6FC0]];
    v18 = (void *)MEMORY[0x1E4FA6F98];
  }

  v19 = +[SBEventObserverRegistry sharedInstance];
  [v19 postEventToInterestedObservers:*v18];

LABEL_31:
  if (v9) {
    [(SBAppSuggestionManager *)self _calculateBestSuggestionAndNotifyListeners];
  }
}

- (void)_registerForProactiveSuggestionNotifications
{
  p_proactiveSuggestionNotificationToken = &self->_proactiveSuggestionNotificationToken;
  if (!self->_proactiveSuggestionNotificationToken)
  {
    BOOL v4 = (const char *)[(id)*MEMORY[0x1E4F4AD50] UTF8String];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __70__SBAppSuggestionManager__registerForProactiveSuggestionNotifications__block_invoke;
    handler[3] = &unk_1E6AF5558;
    handler[4] = self;
    notify_register_dispatch(v4, p_proactiveSuggestionNotificationToken, MEMORY[0x1E4F14428], handler);
  }
}

uint64_t __70__SBAppSuggestionManager__registerForProactiveSuggestionNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) proactiveSuggestionChanged];
}

- (void)_deregisterFromProactiveSuggestionNotifications
{
  int proactiveSuggestionNotificationToken = self->_proactiveSuggestionNotificationToken;
  if (proactiveSuggestionNotificationToken)
  {
    notify_cancel(proactiveSuggestionNotificationToken);
    self->_int proactiveSuggestionNotificationToken = 0;
  }
}

- (void)noteActivatingForAppSuggestion:(id)a3 fromSource:(int64_t)a4
{
  id v14 = a3;
  if (a4 == -1)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"SBAppSuggestionManager.m" lineNumber:378 description:@"we're activating an app for continuity that didn't come from a source we know about"];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v14;
  if (isKindOfClass)
  {
    if (v14) {
      int v9 = (void *)*((void *)v14 + 1);
    }
    else {
      int v9 = 0;
    }
    continuitySuggestionManager = self->_continuitySuggestionManager;
    if ((unint64_t)(a4 + 1) > 3) {
      uint64_t v11 = 0x20000000;
    }
    else {
      uint64_t v11 = qword_1D8FD2380[a4 + 1];
    }
    id v12 = v9;
    [(UABestAppSuggestionManager *)continuitySuggestionManager bestAppSuggestionWasLaunched:v12 withInteractionType:v11];
    [(UABestAppSuggestionManager *)self->_continuitySuggestionManager removeBestApp:v12 options:&unk_1F334B9E8];

    id v8 = v14;
  }
}

- (void)noteNotActivatingForAppSuggestion:(id)a3 fromSource:(int64_t)a4
{
  id v8 = (uint64_t *)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v6 = v8;
  if (isKindOfClass)
  {
    if (v8) {
      uint64_t v7 = v8[1];
    }
    else {
      uint64_t v7 = 0;
    }
    [(UABestAppSuggestionManager *)self->_continuitySuggestionManager bestAppSuggestionLaunchWasCancelled:v7];
    uint64_t v6 = v8;
  }
}

- (void)_calculateBestSuggestionAndNotifyListeners
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = self->_currentBestSuggestion;
  currentBestSuggestion = self->_currentBestSuggestion;
  self->_currentBestSuggestion = 0;

  BOOL v5 = [(UABestAppSuggestion *)self->_continuityCurrentBestSuggestion type] != 5
    && [(UABestAppSuggestion *)self->_continuityCurrentBestSuggestion type] != 10;
  currentProactiveBestSuggestion = self->_currentProactiveBestSuggestion;
  if (!self->_continuityCurrentBestSuggestion)
  {
    if (!currentProactiveBestSuggestion) {
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  if (!currentProactiveBestSuggestion) {
    BOOL v5 = 1;
  }
  if (!v5)
  {
LABEL_10:
    uint64_t v7 = [[_SBProactiveAppSuggestion alloc] initWithAppSuggestion:self->_currentProactiveBestSuggestion];
    goto LABEL_11;
  }
  uint64_t v7 = (_SBProactiveAppSuggestion *)-[_SBUABestAppSuggestion initWithAppSuggestion:]((id *)[_SBUABestAppSuggestion alloc], self->_continuityCurrentBestSuggestion);
LABEL_11:
  id v8 = self->_currentBestSuggestion;
  self->_currentBestSuggestion = &v7->super;

LABEL_12:
  int v9 = +[SBApplicationController sharedInstance];
  v10 = [(SBBestAppSuggestion *)self->_currentBestSuggestion bundleIdentifier];
  uint64_t v11 = [v9 applicationWithBundleIdentifier:v10];
  if (v11)
  {

    goto LABEL_14;
  }
  if (!v3)
  {
LABEL_21:

    goto LABEL_22;
  }
  v13 = self->_currentBestSuggestion;

  if (!v13)
  {
LABEL_14:
    id v12 = self->_currentBestSuggestion;
    if (v12)
    {
      id v14 = @"SBNewSuggestedAppKey";
      v15[0] = v12;
      int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    }
    else
    {
      int v9 = 0;
    }
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 postNotificationName:@"SBSuggestedAppChangedNotification" object:self userInfo:v9];
    goto LABEL_21;
  }
LABEL_22:
}

- (void)bestAppSuggestionChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBAppSuggestionManager_bestAppSuggestionChanged___block_invoke;
  v6[3] = &unk_1E6AF5290;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __51__SBAppSuggestionManager_bestAppSuggestionChanged___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = SBLogContinuity();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Got handoff app suggestion: %@", (uint8_t *)&v11, 0xCu);
  }

  if (!*(void *)(a1 + 32)) {
    goto LABEL_10;
  }
  id v4 = +[SBApplicationController sharedInstance];
  id v5 = [v4 restrictionController];
  uint64_t v6 = [*(id *)(a1 + 32) bundleIdentifier];
  char v7 = [v5 isApplicationIdentifierRestricted:v6];

  if (v7) {
    return;
  }
  id v8 = *(void **)(a1 + 32);
  if (!v8) {
    goto LABEL_10;
  }
  int v9 = [v8 activityType];
  if ((TUIsCallHandoffActivityType() & 1) == 0)
  {

    goto LABEL_10;
  }
  int v10 = TUShouldShowCallHandoff();

  if (v10)
  {
LABEL_10:
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 32));
    [*(id *)(a1 + 40) _calculateBestSuggestionAndNotifyListeners];
  }
}

- (void)_handleAppUninstall:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"SBInstalledApplicationsRemovedBundleIDs"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = [(SBBestAppSuggestion *)self->_currentBestSuggestion bundleIdentifier];
        int v14 = [v12 isEqualToString:v13];

        if (v14)
        {
          currentBestSuggestion = self->_currentBestSuggestion;
          self->_currentBestSuggestion = 0;

          char v9 = 1;
        }
        v16 = [(UABestAppSuggestion *)self->_continuityCurrentBestSuggestion bundleIdentifier];
        int v17 = [v12 isEqualToString:v16];

        if (v17)
        {
          continuityCurrentBestSuggestion = self->_continuityCurrentBestSuggestion;
          self->_continuityCurrentBestSuggestion = 0;

          char v9 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);

    if (v9) {
      [(SBAppSuggestionManager *)self _calculateBestSuggestionAndNotifyListeners];
    }
  }
  else
  {
  }
}

- (void)proactiveSuggestionChanged
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Proactive suggestion was not of executable type App, discarding", v2, v3, v4, v5, v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_listeningReasons, 0);
  objc_storeStrong((id *)&self->_currentBestSuggestion, 0);
  objc_storeStrong((id *)&self->_currentProactiveBestSuggestion, 0);
  objc_storeStrong((id *)&self->_proactiveSuggestionClient, 0);
  objc_storeStrong((id *)&self->_continuityCurrentBestSuggestion, 0);
  objc_storeStrong((id *)&self->_continuitySuggestionManager, 0);
}

@end