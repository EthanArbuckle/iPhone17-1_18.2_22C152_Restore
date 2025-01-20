@interface UIActivityContinuationManager
- (BOOL)_continueUserActivity:(id)a3;
- (BOOL)_delegateHandledContinueActivityWithType:(id)a3;
- (BOOL)activityContinuationsAreBeingTracked;
- (BOOL)isTrackingActivityContinuationForResponder:(id)a3 document:(id)a4 userActivity:(id)a5;
- (NSProgress)_currentActivityContinuationProgress;
- (NSString)_currentActivityContinuationType;
- (NSString)_currentActivityContinuationUUIDString;
- (UIActivityContinuationManager)init;
- (UIActivityContinuationManager)initWithApplicationContext:(id)a3;
- (id)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4;
- (id)activityContinuationDictionaryWithAction:(id)a3 sourceApplication:(id)a4 originatingProcess:(id)a5;
- (void)_cleanupUserActivity:(id)a3 activityIdentifier:(id)a4;
- (void)_clearCurrentActivityContinuationCancelingProgress:(BOOL)a3;
- (void)_didFailToContinueUserActivityWithType:(id)a3 error:(id)a4;
- (void)_displayCurrentActivityContinuationProgressUI;
- (void)_endCurrentActivityContinuationAndDisplayError:(id)a3;
- (void)_endCurrentActivityContinuationWithCompletion:(id)a3;
- (void)_hideCurrentActivityContinuationProgressUI;
- (void)_setCurrentActivityContinuationProgress:(id)a3;
- (void)_setCurrentActivityContinuationType:(id)a3;
- (void)_setCurrentActivityContinuationUUIDString:(id)a3;
- (void)_userActivityWillSave:(id)a3;
- (void)addResponder:(id)a3 document:(id)a4 forUserActivity:(id)a5;
- (void)handleActivityContinuation:(id)a3 isSuspended:(BOOL)a4;
- (void)removeResponder:(id)a3 document:(id)a4 forUserActivity:(id)a5;
- (void)userActivityWillSave:(id)a3;
@end

@implementation UIActivityContinuationManager

- (void)userActivityWillSave:(id)a3
{
  id v4 = a3;
  if (pthread_main_np() == 1)
  {
    [(UIActivityContinuationManager *)self _userActivityWillSave:v4];
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__UIActivityContinuationManager_userActivityWillSave___block_invoke;
    v5[3] = &unk_1E52D9F98;
    v5[4] = self;
    id v6 = v4;
    dispatch_sync(MEMORY[0x1E4F14428], v5);
  }
}

- (void)_userActivityWillSave:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 _uniqueIdentifier];
  id v6 = [v5 UUIDString];

  if (v6)
  {
    v7 = [(id)_activityContinuationMap objectForKeyedSubscript:v6];
    v8 = v7;
    if (!v7)
    {
LABEL_22:

      goto LABEL_23;
    }
    v9 = [v7 objectAtIndexedSubscript:1];
    v10 = [v9 allObjects];
    if ([v10 count])
    {
      v11 = [v10 objectAtIndex:0];
    }
    else
    {
      v11 = 0;
    }
    v12 = [v8 objectAtIndexedSubscript:2];

    v13 = [v12 allObjects];
    int v14 = dyld_program_sdk_at_least();
    if (v14)
    {
      if (![v13 count] && !v11)
      {
LABEL_21:

        goto LABEL_22;
      }
      v22 = v12;
      v24 = v10;
      [v4 _beginUserInfoUpdate:0];
    }
    else
    {
      v22 = v12;
      v24 = v10;
      v15 = [MEMORY[0x1E4F1C9E8] dictionary];
      [v4 setUserInfo:v15];
    }
    v23 = v11;
    [v11 updateUserActivityState:v4];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v13;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v16);
          }
          [*(id *)(*((void *)&v25 + 1) + 8 * i) updateUserActivityState:v4];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v18);
    }

    if (v14) {
      [v4 _finishUserInfoUpdate];
    }
    v11 = v23;
    v10 = v24;
    v12 = v22;
    goto LABEL_21;
  }
LABEL_23:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained activityContinuationManager:self didUpdateUserActivity:v4];
}

- (void)addResponder:(id)a3 document:(id)a4 forUserActivity:(id)a5
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = [v10 _uniqueIdentifier];
    v13 = [v12 UUIDString];

    if (!v13)
    {
LABEL_19:

      goto LABEL_20;
    }
    if (v8)
    {
      int v14 = [v11 _frameworkDelegate];

      if (!v14) {
        [v11 _setFrameworkDelegate:self];
      }
    }
    v15 = (void *)_activityContinuationMap;
    if (!_activityContinuationMap)
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v17 = (void *)_activityContinuationMap;
      _activityContinuationMap = (uint64_t)v16;

      v15 = (void *)_activityContinuationMap;
    }
    uint64_t v18 = [v15 objectForKeyedSubscript:v13];
    if (v18)
    {
      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:1];
      v22 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:5 capacity:4];
      v23[0] = v11;
      v23[1] = v21;
      v23[2] = v22;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
      [(id)_activityContinuationMap setObject:v18 forKeyedSubscript:v13];

      if (v8)
      {
LABEL_10:
        uint64_t v19 = [v18 objectAtIndexedSubscript:2];
        if (([v19 containsObject:v8] & 1) == 0) {
          [v19 addObject:v8];
        }
        if (v9) {
          goto LABEL_13;
        }
        goto LABEL_17;
      }
    }
    uint64_t v19 = 0;
    if (v9)
    {
LABEL_13:
      v20 = [v18 objectAtIndexedSubscript:1];

      if (![v20 count]) {
        [v20 addObject:v9];
      }
      goto LABEL_18;
    }
LABEL_17:
    v20 = v19;
LABEL_18:

    goto LABEL_19;
  }
LABEL_20:
}

- (BOOL)activityContinuationsAreBeingTracked
{
  return [(id)_activityContinuationMap count] != 0;
}

- (UIActivityContinuationManager)initWithApplicationContext:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIActivityContinuationManager;
  v5 = [(UIActivityContinuationManager *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_context, v4);
  }

  return v6;
}

uint64_t __54__UIActivityContinuationManager_userActivityWillSave___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _userActivityWillSave:*(void *)(a1 + 40)];
}

- (UIActivityContinuationManager)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIActivityContinuationManager.m" lineNumber:64 description:@"Use initWithApplication:"];

  return 0;
}

- (void)_displayCurrentActivityContinuationProgressUI
{
  v3 = self->_currentActivityContinuationType;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v5 = [WeakRetained activityContinuationManagerUserCancelledError:self];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__UIActivityContinuationManager__displayCurrentActivityContinuationProgressUI__block_invoke;
  aBlock[3] = &unk_1E52DCB30;
  aBlock[4] = self;
  v11 = v3;
  id v12 = v5;
  id v6 = v5;
  v7 = v3;
  objc_super v8 = _Block_copy(aBlock);
  id v9 = objc_loadWeakRetained((id *)&self->_context);
  [v9 activityContinuationManager:self displayProgressUI:0 dismissalHandler:v8];
}

uint64_t __78__UIActivityContinuationManager__displayCurrentActivityContinuationProgressUI__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _clearCurrentActivityContinuationCancelingProgress:1];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _didFailToContinueUserActivityWithType:v3 error:v4];
}

- (void)_hideCurrentActivityContinuationProgressUI
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained activityContinuationManager:self hideProgressUIWithCompletion:0];
}

- (void)_endCurrentActivityContinuationAndDisplayError:(id)a3
{
  id v4 = a3;
  [(UIActivityContinuationManager *)self _clearCurrentActivityContinuationCancelingProgress:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained activityContinuationManager:self configureProgressUIWithError:v4];
}

- (void)_endCurrentActivityContinuationWithCompletion:(id)a3
{
  id v4 = a3;
  [(UIActivityContinuationManager *)self _clearCurrentActivityContinuationCancelingProgress:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  [WeakRetained activityContinuationManager:self hideProgressUIWithCompletion:v4];
}

- (BOOL)_continueUserActivity:(id)a3
{
  uint64_t v3 = self;
  p_context = &self->_context;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_context);
  LOBYTE(v3) = [WeakRetained activityContinuationManager:v3 continueUserActivity:v5];

  return (char)v3;
}

- (void)_didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  if (a4)
  {
    p_context = &self->_context;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_context);
    [WeakRetained activityContinuationManager:self didFailToContinueUserActivityWithType:v8 error:v7];
  }
}

- (BOOL)_delegateHandledContinueActivityWithType:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  char v6 = [WeakRetained activityContinuationManager:self willContinueUserActivityWithType:v4];

  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v7 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1
    || (int v12 = _UIInternalPreference_ActivityContinuationProgressWindowSuppressed,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_ActivityContinuationProgressWindowSuppressed))
  {
    BOOL v8 = 0;
  }
  else
  {
    do
    {
      BOOL v8 = v7 < v12;
      if (v7 < v12) {
        break;
      }
      _UIInternalPreferenceSync(v7, &_UIInternalPreference_ActivityContinuationProgressWindowSuppressed, @"ActivityContinuationProgressWindowSuppressed", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
      int v12 = _UIInternalPreference_ActivityContinuationProgressWindowSuppressed;
    }
    while (v7 != _UIInternalPreference_ActivityContinuationProgressWindowSuppressed);
  }
  if (byte_1E8FD5504) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }
  char v10 = v9 | v6;

  return v10;
}

- (id)_fetchUserActivityWithUUID:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 objectForKey:@"UIApplicationLaunchOptionsUserActivityKey"];
  BOOL v8 = v7;
  if (v7)
  {
    BOOL v9 = [v7 _payloadForIdentifier:@"UAINAppIntentPayload"];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      v11 = (void *)_MergedGlobals_1277;
      uint64_t v23 = _MergedGlobals_1277;
      if (!_MergedGlobals_1277)
      {
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __getLNUserActivityHelperClass_block_invoke;
        v19[3] = &unk_1E52D9900;
        v19[4] = &v20;
        __getLNUserActivityHelperClass_block_invoke((uint64_t)v19);
        v11 = (void *)v21[3];
      }
      id v12 = v11;
      _Block_object_dispose(&v20, 8);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __78__UIActivityContinuationManager__fetchUserActivityWithUUID_completionHandler___block_invoke;
      v16[3] = &unk_1E52DB330;
      id v18 = v6;
      id v17 = v8;
      [v12 associateAppIntentWithUserActivity:v17 completionHandler:v16];
    }
    else
    {
      (*((void (**)(id, void *, void))v6 + 2))(v6, v8, 0);
    }
  }
  else
  {
    v13 = [v5 objectForKey:@"UIApplicationLaunchOptionsUserActivityIdentifierKey"];
    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v13];
    [MEMORY[0x1E4F29230] _fetchUserActivityWithUUID:v14 completionHandler:v6];
  }
  return 0;
}

uint64_t __78__UIActivityContinuationManager__fetchUserActivityWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)_clearCurrentActivityContinuationCancelingProgress:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = self->_currentActivityContinuationProgress;
  [(UIActivityContinuationManager *)self _setCurrentActivityContinuationType:0];
  [(UIActivityContinuationManager *)self _setCurrentActivityContinuationUUIDString:0];
  [(UIActivityContinuationManager *)self _setCurrentActivityContinuationProgress:0];
  if (v3) {
    [(NSProgress *)v5 cancel];
  }
}

- (void)handleActivityContinuation:(id)a3 isSuspended:(BOOL)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKey:@"UIApplicationLaunchOptionsUserActivityTypeKey"];
  BOOL v8 = [v6 objectForKey:@"UIApplicationLaunchOptionsUserActivityIdentifierKey"];
  BOOL v9 = [v6 objectForKeyedSubscript:@"UINSUserActivitySourceApplicationKey"];
  if (!v8)
  {
    NSLog(&cfstr_SNoActivityUui.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v6);
    goto LABEL_22;
  }
  if (!v7)
  {
    NSLog(&cfstr_SNoActivityTyp.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v6);
    goto LABEL_22;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCalledWithAct.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v6);
  }
  if (self->_currentActivityContinuationUUIDString)
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SNewActivityCa.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", self->_currentActivityContinuationType, self->_currentActivityContinuationUUIDString, v7, v8);
    }
    if ([(NSString *)self->_currentActivityContinuationType isEqualToString:v7])
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SSkippingCallT.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]");
      }
      [(UIActivityContinuationManager *)self _setCurrentActivityContinuationType:v7];
      [(UIActivityContinuationManager *)self _setCurrentActivityContinuationUUIDString:v8];
      goto LABEL_19;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F281F8];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v12 = _UINSLocalizedStringWithDefaultValue(@"User selected another activity, the previous activity is no longer available", @"User selected another activity, the previous activity is no longer available");
    v23[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    int v14 = [v10 errorWithDomain:v11 code:3072 userInfo:v13];

    v15 = self->_currentActivityContinuationType;
    [(UIActivityContinuationManager *)self _clearCurrentActivityContinuationCancelingProgress:1];
    [(UIActivityContinuationManager *)self _didFailToContinueUserActivityWithType:v15 error:v14];
  }
  [(UIActivityContinuationManager *)self _setCurrentActivityContinuationType:v7];
  [(UIActivityContinuationManager *)self _setCurrentActivityContinuationUUIDString:v8];
  if ([(UIActivityContinuationManager *)self _delegateHandledContinueActivityWithType:v7])
  {
    [(UIActivityContinuationManager *)self _hideCurrentActivityContinuationProgressUI];
  }
  else
  {
    [(UIActivityContinuationManager *)self _displayCurrentActivityContinuationProgressUI];
  }
LABEL_19:
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SLookingAsynch.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]", v8);
  }
  kdebug_trace();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke;
  v17[3] = &unk_1E530CA00;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v7;
  BOOL v21 = a4;
  id v16 = [(UIActivityContinuationManager *)self _fetchUserActivityWithUUID:v6 completionHandler:v17];
  [(UIActivityContinuationManager *)self _setCurrentActivityContinuationProgress:v16];

LABEL_22:
}

void __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_2;
  aBlock[3] = &unk_1E52EEAF0;
  int v7 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  id v17 = v7;
  id v18 = v5;
  id v19 = *(id *)(a1 + 48);
  id v20 = v6;
  id v21 = *(id *)(a1 + 56);
  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  int v11 = pthread_main_np();
  if (_UIStateRestorationDebugLogEnabled())
  {
    id v12 = @"YES";
    if (*(unsigned char *)(a1 + 64)) {
      v13 = @"YES";
    }
    else {
      v13 = @"NO";
    }
    if (v11 != 1) {
      id v12 = @"NO";
    }
    NSLog(&cfstr_SAboutToCallAc.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke", v13, v12);
  }
  int v14 = *(unsigned __int8 *)(a1 + 64);
  int v15 = _UIStateRestorationDebugLogEnabled();
  if (v14 && v11 == 1)
  {
    if (v15) {
      NSLog(&cfstr_SCallingActivi_0.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke");
    }
    v10[2](v10);
  }
  else
  {
    if (v15) {
      NSLog(&cfstr_SCallingActivi_1.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke");
    }
    dispatch_async(MEMORY[0x1E4F14428], v10);
  }
}

void __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_2(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  if ([*(id *)(*(void *)(a1 + 32) + 24) isEqualToString:*(void *)(a1 + 40)])
  {
    v2 = *(void **)(a1 + 48);
    if (v2)
    {
      if (*(void *)(a1 + 56))
      {
        objc_msgSend(v2, "_setSourceApplication:");
        v2 = *(void **)(a1 + 48);
      }
      BOOL v3 = *(void **)(a1 + 32);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_3;
      v17[3] = &unk_1E52D9F98;
      id v4 = v2;
      uint64_t v5 = *(void *)(a1 + 32);
      id v18 = v4;
      uint64_t v19 = v5;
      [v3 _endCurrentActivityContinuationWithCompletion:v17];
    }
    else
    {
      id v6 = *(id *)(a1 + 64);
      if (!v6)
      {
        int v7 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v8 = *MEMORY[0x1E4F281F8];
        uint64_t v20 = *MEMORY[0x1E4F28568];
        id v9 = _UINSLocalizedStringWithDefaultValue(@"Unknown Handoff error", @"Unknown Handoff error");
        v21[0] = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
        id v6 = [v7 errorWithDomain:v8 code:4608 userInfo:v10];
      }
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SCouldNotGetUs.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_2", *(void *)(a1 + 40), v6);
      }
      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      int v12 = [WeakRetained activityContinuationManagerHandleErrorsByConfiguringProgressUI:*(void *)(a1 + 32)];

      v13 = *(void **)(a1 + 32);
      if (v12)
      {
        [*(id *)(a1 + 32) _endCurrentActivityContinuationAndDisplayError:v6];
      }
      else
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_4;
        v14[3] = &unk_1E52DCB30;
        v14[4] = v13;
        id v15 = *(id *)(a1 + 72);
        id v16 = v6;
        [v13 _endCurrentActivityContinuationWithCompletion:v14];
      }
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SAnotherUserAc.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_2", *(void *)(*(void *)(a1 + 32) + 24), *(void *)(*(void *)(a1 + 32) + 16), *(void *)(a1 + 40), *(void *)(a1 + 72));
  }
}

void __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_3(uint64_t a1)
{
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCallingApplic.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_3", *(void *)(a1 + 32));
  }
  int v2 = [*(id *)(a1 + 40) _continueUserActivity:*(void *)(a1 + 32)];
  if (_UIStateRestorationDebugLogEnabled())
  {
    BOOL v3 = @"No";
    if (v2) {
      BOOL v3 = @"Yes";
    }
    NSLog(&cfstr_SDelegateRetur_0.isa, "-[UIActivityContinuationManager handleActivityContinuation:isSuspended:]_block_invoke_3", v3);
  }
}

uint64_t __72__UIActivityContinuationManager_handleActivityContinuation_isSuspended___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFailToContinueUserActivityWithType:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (id)activityContinuationDictionaryWithAction:(id)a3 sourceApplication:(id)a4 originatingProcess:(id)a5
{
  v31[7] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCalledWithAct_0.isa, "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v8);
  }
  if (dyld_program_sdk_at_least())
  {
    int v11 = [v8 identifier];
    int v12 = [v8 activityType];
    v13 = [v8 userActivityData];
    if (v13)
    {
      int v14 = (void *)[objc_alloc(MEMORY[0x1E4F29230]) _initWithUserActivityData:v13];
      id v15 = [v14 _uniqueIdentifier];
      uint64_t v16 = [v15 UUIDString];

      uint64_t v17 = [v14 activityType];

      int v12 = (void *)v17;
      int v11 = (void *)v16;
    }
    else
    {
      int v14 = 0;
    }
    id v18 = 0;
    if (v11 && v12)
    {
      if (_UIStateRestorationDebugLogEnabled())
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        NSLog(&cfstr_SCheckingForAc_0.isa, "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v11, v12, WeakRetained);
      }
      if (v14)
      {
        if (v9) {
          [v14 _setSourceApplication:v9];
        }
        if (v10) {
          [v14 _setOriginatingProcess:v10];
        }
        v30[0] = @"UIApplicationLaunchOptionsUserActivityIdentifierKey";
        v30[1] = @"UICanvasConnectionOptionsUserActivityKey";
        v31[0] = v11;
        v31[1] = v14;
        v30[2] = @"_UISceneConnectionOptionsUserActivityKey";
        v30[3] = @"UIApplicationLaunchOptionsUserActivityKey";
        v31[2] = v14;
        v31[3] = v14;
        v30[4] = @"UICanvasConnectionOptionsUserActivityTypeKey";
        v30[5] = @"_UISceneConnectionOptionsUserActivityTypeKey";
        v31[4] = v12;
        v31[5] = v12;
        v30[6] = @"UIApplicationLaunchOptionsUserActivityTypeKey";
        v31[6] = v12;
        uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
        id v21 = v31;
        uint64_t v22 = v30;
        uint64_t v23 = 7;
      }
      else
      {
        v28[0] = @"UIApplicationLaunchOptionsUserActivityIdentifierKey";
        v28[1] = @"UICanvasConnectionOptionsUserActivityTypeKey";
        v29[0] = v11;
        v29[1] = v12;
        v28[2] = @"_UISceneConnectionOptionsUserActivityTypeKey";
        v28[3] = @"UIApplicationLaunchOptionsUserActivityTypeKey";
        v29[2] = v12;
        v29[3] = v12;
        uint64_t v20 = (void *)MEMORY[0x1E4F1C9E8];
        id v21 = v29;
        uint64_t v22 = v28;
        uint64_t v23 = 4;
      }
      v24 = [v20 dictionaryWithObjects:v21 forKeys:v22 count:v23];
      id v18 = v24;
      if (v9)
      {
        long long v25 = (void *)[v24 mutableCopy];
        [v25 setObject:v9 forKeyedSubscript:@"UINSUserActivitySourceApplicationKey"];
        uint64_t v26 = [v25 copy];

        id v18 = (void *)v26;
      }
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SCreatedActivi.isa, "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v11, v18, v12);
      }
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SReturningActi.isa, "-[UIActivityContinuationManager activityContinuationDictionaryWithAction:sourceApplication:originatingProcess:]", v18);
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (BOOL)isTrackingActivityContinuationForResponder:(id)a3 document:(id)a4 userActivity:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5)
  {
    id v9 = [a5 _uniqueIdentifier];
    id v10 = [v9 UUIDString];

    if (!v10)
    {
      char v16 = 0;
LABEL_13:

      goto LABEL_14;
    }
    int v11 = [(id)_activityContinuationMap objectForKeyedSubscript:v10];
    int v12 = v11;
    if (v11)
    {
      if (v7)
      {
        v13 = [v11 objectAtIndexedSubscript:2];
        int v14 = v13;
        id v15 = v7;
LABEL_10:
        char v16 = [v13 containsObject:v15];

LABEL_12:
        goto LABEL_13;
      }
      if (v8)
      {
        v13 = [v11 objectAtIndexedSubscript:1];
        int v14 = v13;
        id v15 = v8;
        goto LABEL_10;
      }
    }
    char v16 = 0;
    goto LABEL_12;
  }
  char v16 = 0;
LABEL_14:

  return v16;
}

- (void)_cleanupUserActivity:(id)a3 activityIdentifier:(id)a4
{
  id v6 = a4;
  id v5 = a3;
  [v5 _setFrameworkDelegate:0];
  [v5 invalidate];

  [(id)_activityContinuationMap removeObjectForKey:v6];
}

- (void)removeResponder:(id)a3 document:(id)a4 forUserActivity:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    int v11 = [v9 _uniqueIdentifier];
    int v12 = [v11 UUIDString];

    if (v12)
    {
      v13 = [(id)_activityContinuationMap objectForKeyedSubscript:v12];
      int v14 = v13;
      if (v13)
      {
        id v15 = [v13 objectAtIndexedSubscript:1];
        char v16 = [v14 objectAtIndexedSubscript:2];
        if (v25)
        {
          if ([v16 containsObject:v25]) {
            [v16 removeObject:v25];
          }
          uint64_t v17 = [v16 allObjects];
          uint64_t v18 = [v17 count];

          if (!v18)
          {
            uint64_t v19 = [v15 allObjects];
            uint64_t v20 = [v19 count];

            if (!v20)
            {
              if (_UIStateRestorationDebugLogEnabled())
              {
                id v21 = [v10 title];
                NSLog(&cfstr_SAfterRemoving.isa, "-[UIActivityContinuationManager removeResponder:document:forUserActivity:]", v10, v21, v12);
              }
              [(UIActivityContinuationManager *)self _cleanupUserActivity:v10 activityIdentifier:v12];
            }
          }
        }
        if (v8)
        {
          if ([v15 containsObject:v8])
          {
            [v15 removeObject:v8];
            uint64_t v22 = [v16 allObjects];
            uint64_t v23 = [v22 count];

            if (!v23)
            {
              if (_UIStateRestorationDebugLogEnabled())
              {
                v24 = [v10 title];
                NSLog(&cfstr_SAfterRemoving_0.isa, "-[UIActivityContinuationManager removeResponder:document:forUserActivity:]", v10, v24, v12);
              }
              [(UIActivityContinuationManager *)self _cleanupUserActivity:v10 activityIdentifier:v12];
            }
          }
        }
      }
    }
  }
}

- (NSString)_currentActivityContinuationType
{
  return self->_currentActivityContinuationType;
}

- (void)_setCurrentActivityContinuationType:(id)a3
{
}

- (NSString)_currentActivityContinuationUUIDString
{
  return self->_currentActivityContinuationUUIDString;
}

- (void)_setCurrentActivityContinuationUUIDString:(id)a3
{
}

- (NSProgress)_currentActivityContinuationProgress
{
  return self->_currentActivityContinuationProgress;
}

- (void)_setCurrentActivityContinuationProgress:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentActivityContinuationProgress, 0);
  objc_storeStrong((id *)&self->_currentActivityContinuationUUIDString, 0);
  objc_storeStrong((id *)&self->_currentActivityContinuationType, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end