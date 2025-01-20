@interface _UICanvasUserActivityManager
+ (BOOL)_restorationUserActivityAvailableForSceneIdentifier:(id)a3;
+ (id)_activityContinuationDictionaryWithAction:(id)a3 sourceApplication:(id)a4 originatingProcess:(id)a5;
+ (id)_fetchSceneSessionWithPersistentIdentifier:(id)a3;
+ (id)_getRestorationUserActivityForPersistentIdentifier:(id)a3 error:(id *)a4;
+ (id)_getUserInfoForPersistentIdentifier:(id)a3 error:(id *)a4;
+ (id)_knownSceneSessionMap;
+ (id)_userActivityManagerForScene:(id)a3;
+ (void)_deleteSavedSceneSessionDirectoryWithPersistentIdentifier:(id)a3;
+ (void)_deleteSceneSessionsWithPersistentIdentifiers:(id)a3;
+ (void)_initializeUserActivityManager;
+ (void)_saveRestorationStateForScene:(id)a3;
+ (void)_scheduleDataSaveForSceneSession:(id)a3 saveRestorationActivity:(BOOL)a4;
+ (void)_showProgressForScene:(id)a3 whenFetchingUserActivityForTypes:(id)a4;
+ (void)_updatePersistedSceneSession:(id)a3;
- (BOOL)_initialRestorationIsFinished;
- (BOOL)_isDisplayingActivityContinuationUI;
- (BOOL)activityContinuationManager:(id)a3 continueUserActivity:(id)a4;
- (BOOL)activityContinuationManager:(id)a3 willContinueUserActivityWithType:(id)a4;
- (UIActivityContinuationManager)_activityContinuationManager;
- (UIScene)_scene;
- (_UICanvasUserActivityManager)initWithScene:(id)a3;
- (id)_updateCanvasConnectionOptionsDictionary:(id)a3;
- (id)activityContinuationManagerUserCancelledError:(id)a3;
- (void)_checkActivityContinuationAndBecomeCurrentIfNeeded;
- (void)_performCanvasRestoration;
- (void)_performCanvasRestorationIfNecessary;
- (void)_saveOrClearRestorationDictionary:(id)a3 forScene:(id)a4;
- (void)_saveSceneRestorationState;
- (void)_scene:(id)a3 didTransitionFromActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_setIsDisplayingActivityContinuationUI:(BOOL)a3;
- (void)_setScene:(id)a3;
- (void)_setupCanvasRestorationState;
- (void)activityContinuationManager:(id)a3 configureProgressUIWithError:(id)a4;
- (void)activityContinuationManager:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)activityContinuationManager:(id)a3 didUpdateUserActivity:(id)a4;
- (void)activityContinuationManager:(id)a3 displayProgressUI:(id)a4 dismissalHandler:(id)a5;
- (void)activityContinuationManager:(id)a3 hideProgressUIWithCompletion:(id)a4;
@end

@implementation _UICanvasUserActivityManager

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id v10 = a3;
  unint64_t v7 = [v10 activationState];
  if (_UIStateRestorationDebugLogEnabled())
  {
    v8 = _NSStringFromUISceneActivationState(a4);
    v9 = _NSStringFromUISceneActivationState(v7);
    NSLog(&cfstr_SInvokedForSce.isa, "-[_UICanvasUserActivityManager _scene:willTransitionToActivationState:withReasonsMask:]", v10, v8, v9);
  }
  if (a4)
  {
    if (a4 == 2 && v7 != 2)
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SSavingSceneSt.isa, "-[_UICanvasUserActivityManager _scene:willTransitionToActivationState:withReasonsMask:]");
      }
      [(_UICanvasUserActivityManager *)self _saveSceneRestorationState];
    }
  }
  else
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SCheckingForAc.isa, "-[_UICanvasUserActivityManager _scene:willTransitionToActivationState:withReasonsMask:]");
    }
    [(_UICanvasUserActivityManager *)self _checkActivityContinuationAndBecomeCurrentIfNeeded];
  }
}

- (void)_scene:(id)a3 didTransitionFromActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id v7 = a3;
  if (!self->_initialRestorationIsFinished)
  {
    id v14 = v7;
    unint64_t v8 = [v7 activationState];
    if (_UIStateRestorationDebugLogEnabled())
    {
      v9 = _NSStringFromUISceneActivationState(v8);
      id v10 = _NSStringFromUISceneActivationState([v14 activationState]);
      NSLog(&cfstr_SInvokedForSce.isa, "-[_UICanvasUserActivityManager _scene:didTransitionFromActivationState:withReasonsMask:]", v14, v9, v10);
    }
    if (v8 > 1 || a4 != 2 && a4 != -1) {
      goto LABEL_15;
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SOfferingResto.isa, "-[_UICanvasUserActivityManager _scene:didTransitionFromActivationState:withReasonsMask:]");
    }
    v11 = [v14 delegate];
    if (objc_opt_respondsToSelector())
    {
      [v14 _willRestoreInteractionStateForUserActivityManager:self];
      kdebug_trace();
      v12 = [v14 session];
      v13 = [v12 stateRestorationActivity];
      [v11 scene:v14 restoreInteractionStateWithUserActivity:v13];
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_14:

LABEL_15:
        self->_initialRestorationIsFinished = 1;
        id v7 = v14;
        goto LABEL_16;
      }
      [v14 _willRestoreInteractionStateForUserActivityManager:self];
      kdebug_trace();
      v12 = [v14 session];
      v13 = [v12 stateRestorationActivity];
      [v11 _scene:v14 restoreInteractionStateWithUserActivity:v13];
    }

    kdebug_trace();
    goto LABEL_14;
  }
LABEL_16:
}

- (void)_setScene:(id)a3
{
}

+ (id)_getRestorationUserActivityForPersistentIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCheckingForSa_0.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
  }
  v6 = [MEMORY[0x1E4F1C9C8] date];
  if ([(id)UIApp launchedToTest]) {
    int v7 = [(id)objc_opt_class() _restorationUserActivityAvailableForSceneIdentifier:@"TestApplicationState"];
  }
  else {
    int v7 = 0;
  }
  if (_UIStateRestorationDebugLogEnabled())
  {
    unint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    [v8 timeIntervalSinceDate:v6];
    NSLog(&cfstr_SCheckingForTe.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v9);
  }
  id v10 = [MEMORY[0x1E4F1C9C8] date];

  if (v7)
  {
    uint64_t v11 = _restorationPath(@"TestApplicationState");
    v43[0] = 0;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v11 error:v43];
    id v13 = v43[0];
    id v14 = (void *)v11;
    if (v12) {
      goto LABEL_18;
    }
  }
  else
  {
    id v14 = 0;
    id v13 = 0;
  }
  uint64_t v15 = _restorationPath(v5);

  id v42 = v13;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v15 error:&v42];
  id v16 = v42;

  if (!v12 || v16)
  {
    id v13 = v16;
    id v14 = (void *)v15;
  }
  else
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SReadFileWithS.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]");
    }
    id v13 = 0;
    id v14 = (void *)v15;
    _updateLastRestorationDictionaryForPersistentIdentifier(v12, v5);
  }
LABEL_18:
  if (_UIStateRestorationDebugLogEnabled())
  {
    v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceDate:v10];
    NSLog(&cfstr_SOpeningRestor.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v18);
  }
  if (!v13)
  {
    v22 = [v12 objectForKey:@"CanvasRestorationUserActivityUserInfoKey"];
    v23 = [v12 objectForKey:@"CanvasRestorationUserActivityTypeKey"];
    v40 = [v12 objectForKey:@"CanvasRestorationUserActivityTitleKey"];
    if (v22)
    {
      if (!_UIStateRestorationDebugLogEnabled())
      {
        id v13 = 0;
LABEL_45:
        if (v23)
        {
          v25 = (void *)[objc_alloc(MEMORY[0x1E4F29230]) initWithActivityType:v23];
          v21 = v25;
          if (v40) {
            [v25 setTitle:v40];
          }
          [v21 setUserInfo:v22];
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SCreatedUserAc.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v23, v40, v22);
          }
          goto LABEL_52;
        }
LABEL_50:
        v21 = 0;
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SNoUserActivit_0.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
        }
LABEL_52:

        goto LABEL_53;
      }
      id v13 = 0;
      NSLog(&cfstr_SEncodedUserIn_1.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v22);
LABEL_42:
      if (!v22) {
        goto LABEL_50;
      }
      goto LABEL_45;
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SEncodedUserIn_0.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]");
    }
    v24 = [v12 objectForKey:@"CanvasRestorationUserActivityUserInfoDataKey"];
    id v41 = 0;
    v39 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v24 error:&v41];
    id v13 = v41;
    if (v13)
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SCouldnTCreate.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
      }
    }
    else
    {
      [v39 setRequiresSecureCoding:1];
      [v39 setDecodingFailurePolicy:0];
      v38 = v24;
      v27 = (void *)MEMORY[0x1E4F1CAD0];
      exc_buf = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v35 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      uint64_t v33 = objc_opt_class();
      uint64_t v32 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      uint64_t v29 = objc_opt_class();
      v30 = objc_msgSend(v27, "setWithObjects:", exc_buf, v36, v35, v34, v33, v32, v28, v29, objc_opt_class(), 0);
      uint64_t v31 = [v39 decodeObjectOfClasses:v30 forKey:@"CanvasRestorationUserActivityUserInfoKey"];

      v22 = (void *)v31;
      [v39 finishDecoding];
      if (v31)
      {
        v24 = v38;
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SDecodedCanvas.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v31);
        }
        goto LABEL_41;
      }
      v24 = v38;
      if (_UIStateRestorationDebugLogEnabled())
      {
        NSLog(&cfstr_SCouldnTDecode.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v5);
        v22 = 0;
        goto LABEL_41;
      }
    }
    v22 = 0;
LABEL_41:

    goto LABEL_42;
  }
  v19 = [v13 domain];
  int v20 = [v19 isEqualToString:*MEMORY[0x1E4F281F8]];

  if (!v20) {
    goto LABEL_31;
  }
  if ([v13 code] != 260 && _UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SErrorReadingA_1.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v13);
  }
  if ([v13 code] != 257 && objc_msgSend(v13, "code") != 513) {
    goto LABEL_31;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SErrorReadingA_1.isa, "+[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:error:]", v13);
  }
  if (a4)
  {
    id v13 = v13;
    v21 = 0;
    *a4 = v13;
  }
  else
  {
LABEL_31:
    v21 = 0;
  }
LABEL_53:

  return v21;
}

+ (BOOL)_restorationUserActivityAvailableForSceneIdentifier:(id)a3
{
  id v3 = a3;
  v4 = _restorationPath(v3);
  if (_UIStateRestorationDebugLogEnabled())
  {
    id v5 = [v4 path];
    NSLog(&cfstr_SCheckingAvail.isa, "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]", v3, v4, v5);
  }
  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v4 path];
  int v8 = [v6 fileExistsAtPath:v7 isDirectory:0];

  if (v8)
  {
    id v17 = 0;
    uint64_t v9 = [MEMORY[0x1E4F28CB0] fileHandleForReadingFromURL:v4 error:&v17];
    id v10 = v17;
    uint64_t v11 = v10;
    if (v9)
    {
      int v12 = 1;
      if (!v10)
      {
LABEL_19:
        [v9 closeAndReturnError:0];

        BOOL v13 = v12 != 0;
        goto LABEL_20;
      }
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SCanTCreateFil.isa, "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]");
      }
      int v12 = 0;
      if (!v11) {
        goto LABEL_19;
      }
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SErrorTryingTo.isa, "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]", v11);
    }
    id v14 = [v11 domain];
    int v15 = [v14 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v15 && ([v11 code] == 257 || objc_msgSend(v11, "code") == 513)) {
      int v12 = 0;
    }
    goto LABEL_19;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SRestorationFi.isa, "+[_UICanvasUserActivityManager _restorationUserActivityAvailableForSceneIdentifier:]");
  }
  BOOL v13 = 1;
LABEL_20:

  return v13;
}

- (void)_saveSceneRestorationState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  id v47 = WeakRetained;
  if (WeakRetained)
  {
    v4 = [WeakRetained session];
    id v5 = [v4 persistentIdentifier];

    if (!v5)
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SNoPersistentI.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v47);
      }
      goto LABEL_58;
    }
    v6 = [v47 _FBSScene];
    if ([v6 isPersistable])
    {
      int v7 = [v47 session];
      if ([v7 _userInfoIsDirty])
      {
      }
      else
      {
        int v8 = [v47 session];
        int v9 = [v8 _configurationIsDirty];

        if (!v9) {
          goto LABEL_13;
        }
      }
      v6 = [v47 session];
      +[_UICanvasUserActivityManager _updatePersistedSceneSession:v6];
    }

LABEL_13:
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SCheckingForUs.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v5);
    }
    id v10 = [v47 delegate];
    char v11 = objc_opt_respondsToSelector();

    int v12 = [v47 session];
    id v13 = [v12 stateRestorationActivity];

    id v14 = [v47 session];
    [v14 _setStateRestorationActivityIsDirty:0];

    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SUsingUisceneS.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v13);
    }
    if (v11)
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SCallingStater.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
      }
      int v15 = [v47 delegate];
      uint64_t v16 = [v15 stateRestorationActivityForScene:v47];

      id v13 = (id)v16;
      if (!v16)
      {
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SUisceneDelega.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
        }
LABEL_29:
        id v13 = 0;
LABEL_39:
        uint64_t v33 = 0;
LABEL_57:
        [(_UICanvasUserActivityManager *)self _saveOrClearRestorationDictionary:v33 forScene:v47];

LABEL_58:
        goto LABEL_59;
      }
    }
    else
    {
      id v17 = [v47 delegate];
      char v18 = objc_opt_respondsToSelector();

      int v19 = _UIStateRestorationDebugLogEnabled();
      if (v18)
      {
        if (v19) {
          NSLog(&cfstr_SCallingActivi.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
        }
        int v20 = [v47 delegate];
        uint64_t v21 = [v20 _activityToSaveStateForCanvas:v47];

        id v13 = (id)v21;
        if (!v21)
        {
          if (_UIStateRestorationDebugLogEnabled()) {
            NSLog(&cfstr_SUisceneDelega_0.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
          }
          goto LABEL_29;
        }
      }
      else
      {
        if (v19) {
          NSLog(&cfstr_SUisceneDelega_1.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
        }
        if (!v13) {
          goto LABEL_39;
        }
      }
    }
    if (_UIStateRestorationDebugLogEnabled())
    {
      v22 = [v13 activityType];
      v23 = [v13 title];
      v24 = [v13 userInfo];
      NSLog(&cfstr_SFoundActivity_0.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]", v22, v23, v24);
    }
    id v25 = v13;
    v26 = [(id)UIApp _getActivityContinuationManager];
    [v26 userActivityWillSave:v25];
    uint64_t v27 = [v25 delegate];
    if (v27)
    {
      uint64_t v28 = (void *)v27;
      uint64_t v29 = [v25 delegate];
      if ((void *)v29 == v26)
      {
      }
      else
      {
        v30 = (void *)v29;
        uint64_t v31 = [v25 delegate];
        char v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) == 0) {
          goto LABEL_42;
        }
        uint64_t v28 = [v25 delegate];
        [v28 userActivityWillSave:v25];
      }
    }
LABEL_42:

    uint64_t v34 = [v47 session];
    [v34 _resetStateRestorationToActivity:v25];

    id v13 = v25;
    uint64_t v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    if (_UIStateRestorationDebugLogEnabled())
    {
      uint64_t v35 = [v13 activityType];
      uint64_t v36 = [v13 title];
      NSLog(&cfstr_SCreatingUserA.isa, "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)", v13, v35, v36);
    }
    v37 = [v13 activityType];
    [v33 setObject:v37 forKey:@"CanvasRestorationUserActivityTypeKey"];

    v38 = [v13 title];

    if (v38)
    {
      v39 = [v13 title];
      [v33 setObject:v39 forKey:@"CanvasRestorationUserActivityTitleKey"];
    }
    v40 = [v13 userInfo];

    int v41 = _UIStateRestorationDebugLogEnabled();
    if (v40)
    {
      if (v41) {
        NSLog(&cfstr_SSecurelyCodin.isa, "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)");
      }
      id v42 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
      v43 = [v13 userInfo];
      [v42 encodeObject:v43 forKey:@"CanvasRestorationUserActivityUserInfoKey"];

      [v42 finishEncoding];
      if (_UIStateRestorationDebugLogEnabled())
      {
        v44 = [v42 encodedData];
        NSLog(&cfstr_SEncodedUserIn.isa, "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)", v44);
      }
      v45 = [v42 encodedData];

      if (v45)
      {
        v46 = [v42 encodedData];
        [v33 setObject:v46 forKey:@"CanvasRestorationUserActivityUserInfoDataKey"];
      }
    }
    else
    {
      if (!v41)
      {
LABEL_56:

        goto LABEL_57;
      }
      id v42 = [v13 userInfo];
      NSLog(&cfstr_SNoUserActivit.isa, "NSDictionary * _Nonnull _createStateRestorationDictionaryForUserActivity(NSUserActivity *__strong _Nonnull)", v42);
    }

    goto LABEL_56;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SAssociatedUis.isa, "-[_UICanvasUserActivityManager _saveSceneRestorationState]");
  }
LABEL_59:
}

+ (void)_updatePersistedSceneSession:(id)a3
{
  id v3 = a3;
  if ([v3 _userInfoIsDirty]) {
    _saveSceneSessionUserInfo(v3);
  }
  if ([v3 _configurationIsDirty])
  {
    [v3 _setConfigurationIsDirty:0];
    v4 = _persistenceQueue();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61___UICanvasUserActivityManager__updatePersistedSceneSession___block_invoke;
    block[3] = &unk_1E52D9F70;
    id v6 = v3;
    dispatch_sync(v4, block);
  }
}

- (void)_saveOrClearRestorationDictionary:(id)a3 forScene:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 session];
  int v8 = [v7 persistentIdentifier];

  int v9 = _restorationPath(v8);
  if (v5 && [v5 count])
  {
    id v10 = [(id)_lastRestorationDictionaryMap objectForKeyedSubscript:v8];
    if (v10 && [v5 isEqualToDictionary:v10])
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SRestorationDi.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]");
      }
      id v11 = 0;
    }
    else
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SSavingSceneSt_0.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]");
      }
      _updateLastRestorationDictionaryForPersistentIdentifier(v5, v8);
      _ensureRestorationDirectoryExists(v8);
      id v29 = 0;
      [v5 writeToURL:v9 error:&v29];
      id v17 = v29;
      if (v17)
      {
        id v11 = v17;
        NSLog(&cfstr_SErrorWritingA.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v17);
      }
      else
      {
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SWroteUisceneR.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v9);
        }
        char v18 = [v6 delegate];
        char v19 = objc_opt_respondsToSelector();

        uint64_t v20 = *MEMORY[0x1E4F1C590];
        if (v19)
        {
          uint64_t v21 = *MEMORY[0x1E4F1C578];
          id v28 = 0;
          [v9 setResourceValue:v21 forKey:v20 error:&v28];
          id v22 = v28;
          v23 = v22;
          if (v22) {
            NSLog(&cfstr_SErrorSettingP.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v22);
          }
        }
        else
        {
          v23 = 0;
        }
        id v26 = 0;
        id v27 = 0;
        [v9 getResourceValue:&v27 forKey:v20 error:&v26];
        id v25 = v27;
        id v11 = v26;

        if (v11)
        {
          NSLog(&cfstr_SErrorGettingP.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v11);
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(&cfstr_SFileProtectio.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v25);
        }
      }
    }

    goto LABEL_35;
  }
  _updateLastRestorationDictionaryForPersistentIdentifier(0, v8);
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SNothingToSave.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v9);
  }
  int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v30 = 0;
  char v13 = [v12 removeItemAtURL:v9 error:&v30];
  id v14 = v30;

  if (v14 || (id v11 = 0, (v13 & 1) == 0))
  {
    if (v14)
    {
      int v15 = [v14 domain];
      uint64_t v16 = v15;
      if (v15 == (void *)*MEMORY[0x1E4F281F8])
      {
        uint64_t v24 = [v14 code];

        if (v24 == 4)
        {
LABEL_27:
          id v11 = v14;
          goto LABEL_35;
        }
      }
      else
      {
      }
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SWarningUnable_0.isa, "-[_UICanvasUserActivityManager _saveOrClearRestorationDictionary:forScene:]", v9, v14);
    }
    goto LABEL_27;
  }
LABEL_35:
}

- (void)_checkActivityContinuationAndBecomeCurrentIfNeeded
{
  if ([(UIActivityContinuationManager *)self->_activityContinuationManager activityContinuationsAreBeingTracked])
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82___UICanvasUserActivityManager__checkActivityContinuationAndBecomeCurrentIfNeeded__block_invoke;
    block[3] = &unk_1E52D9F70;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (_UICanvasUserActivityManager)initWithScene:(id)a3
{
  id v4 = a3;
  if (_UIStateRestorationDebugLogEnabled())
  {
    id v5 = [v4 session];
    id v6 = [v5 persistentIdentifier];
    NSLog(&cfstr_SCalledForScen.isa, "-[_UICanvasUserActivityManager initWithScene:]", v6);
  }
  v12.receiver = self;
  v12.super_class = (Class)_UICanvasUserActivityManager;
  int v7 = [(_UICanvasUserActivityManager *)&v12 init];
  int v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_weakScene, v4);
    int v9 = [[UIActivityContinuationManager alloc] initWithApplicationContext:v8];
    activityContinuationManager = v8->_activityContinuationManager;
    v8->_activityContinuationManager = v9;

    if (([(id)UIApp _appAdoptsUISceneLifecycle] & 1) == 0) {
      [(_UICanvasUserActivityManager *)v8 _setupCanvasRestorationState];
    }
  }

  return v8;
}

- (void)_setupCanvasRestorationState
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained session];
    id v6 = [v5 persistentIdentifier];

    if (v6)
    {
      id v14 = 0;
      int v7 = +[_UICanvasUserActivityManager _getRestorationUserActivityForPersistentIdentifier:v6 error:&v14];
      id v8 = v14;
      restorationActivity = self->_restorationActivity;
      self->_restorationActivity = v7;

      id v10 = self->_restorationActivity;
      if (!v10 || v8) {
        goto LABEL_11;
      }
      v15[0] = @"UICanvasConnectionOptionsUserActivityTypeKey";
      id v11 = [(NSUserActivity *)v10 activityType];
      v15[1] = @"UICanvasConnectionOptionsUserActivityKey";
      v16[0] = v11;
      v16[1] = self->_restorationActivity;
      objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      connectionOptionsRestorationActivityDictionary = self->_connectionOptionsRestorationActivityDictionary;
      self->_connectionOptionsRestorationActivityDictionary = v12;
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(&cfstr_SSceneHasNoIde.isa, "-[_UICanvasUserActivityManager _setupCanvasRestorationState]", v4);
    }
    id v8 = 0;
LABEL_11:

    goto LABEL_12;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SSceneDoesNotE.isa, "-[_UICanvasUserActivityManager _setupCanvasRestorationState]");
  }
LABEL_12:
}

+ (id)_getUserInfoForPersistentIdentifier:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCheckingForSa.isa, "+[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:]", v5);
  }
  id v6 = _restorationDirectory(v5);
  int v7 = [v6 URLByAppendingPathComponent:@"userInfo.data" isDirectory:0];

  id v16 = 0;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v7 error:&v16];
  id v9 = v16;
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 domain];
    int v12 = [v11 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v12)
    {
      if ([v10 code] != 260 && _UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SErrorReadingA.isa, "+[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:]", v10);
      }
      if ([v10 code] == 257 || objc_msgSend(v10, "code") == 513)
      {
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SErrorReadingA_0.isa, "+[_UICanvasUserActivityManager _getUserInfoForPersistentIdentifier:error:]", v10);
        }
        if (a4) {
          *a4 = v10;
        }
      }
    }
  }

  if (v8) {
    char v13 = v8;
  }
  else {
    char v13 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v14 = v13;

  return v14;
}

+ (void)_deleteSavedSceneSessionDirectoryWithPersistentIdentifier:(id)a3
{
  id v3 = _restorationDirectory(a3);
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SDeletingScene.isa, "+[_UICanvasUserActivityManager _deleteSavedSceneSessionDirectoryWithPersistentIdentifier:]", v3);
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = 0;
  char v5 = [v4 removeItemAtURL:v3 error:&v10];
  id v6 = v10;

  if (v6 || (v5 & 1) == 0)
  {
    if (v6)
    {
      int v7 = [v6 domain];
      id v8 = v7;
      if (v7 == (void *)*MEMORY[0x1E4F281F8])
      {
        uint64_t v9 = [v6 code];

        if (v9 == 4) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SWarningUnable.isa, "+[_UICanvasUserActivityManager _deleteSavedSceneSessionDirectoryWithPersistentIdentifier:]", v3, v6);
    }
  }
LABEL_11:
}

+ (void)_scheduleDataSaveForSceneSession:(id)a3 saveRestorationActivity:(BOOL)a4
{
  id v6 = a3;
  if (pthread_main_np() == 1)
  {
    _MergedGlobals_1169 |= a4;
    if ((byte_1EB261FF9 & 1) == 0)
    {
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SSchedulingSav.isa, "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]");
      }
      objc_initWeak(&location, v6);
      byte_1EB261FF9 = 1;
      dispatch_time_t v7 = dispatch_time(0, 5000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke_2;
      block[3] = &unk_1E52DF528;
      objc_copyWeak(v9, &location);
      v9[1] = a1;
      dispatch_after(v7, MEMORY[0x1E4F14428], block);
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke;
    v11[3] = &unk_1E52E8040;
    id v13 = a1;
    id v12 = v6;
    BOOL v14 = a4;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

+ (void)_deleteSceneSessionsWithPersistentIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SSceneIsBeingD.isa, "+[_UICanvasUserActivityManager _deleteSceneSessionsWithPersistentIdentifiers:]", v8);
        }
        _updateLastRestorationDictionaryForPersistentIdentifier(0, v8);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  uint64_t v9 = _persistenceQueue();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78___UICanvasUserActivityManager__deleteSceneSessionsWithPersistentIdentifiers___block_invoke;
  block[3] = &unk_1E52D9F70;
  id v12 = v3;
  id v10 = v3;
  dispatch_sync(v9, block);
}

+ (id)_knownSceneSessionMap
{
  v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  uint64_t v4 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend((id)qword_1EB262000, "count"));
  uint64_t v5 = _persistenceQueue();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53___UICanvasUserActivityManager__knownSceneSessionMap__block_invoke;
  v11[3] = &unk_1E52D9F98;
  id v6 = v4;
  id v12 = v6;
  long long v13 = v2;
  id v7 = v2;
  dispatch_sync(v5, v11);

  id v8 = v13;
  id v9 = v6;

  return v9;
}

+ (void)_initializeUserActivityManager
{
  if (_UIStateRestorationDebugLogEnabled())
  {
    uint64_t v2 = objc_opt_class();
    NSLog(&cfstr_SRegisteringCo.isa, "+[_UICanvasUserActivityManager _initializeUserActivityManager]", v2);
  }
  uint64_t v3 = objc_opt_class();
  id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_404];
  +[UIScene _registerSceneComponentClass:v3 withKey:@"UIUserActivitySceneComponentKey" predicate:v4];
}

+ (void)_showProgressForScene:(id)a3 whenFetchingUserActivityForTypes:(id)a4
{
  id v8 = a4;
  uint64_t v5 = +[_UICanvasUserActivityManager _userActivityManagerForScene:a3];
  if (v5)
  {
    uint64_t v6 = [v8 copy];
    id v7 = (void *)v5[5];
    v5[5] = v6;
  }
}

+ (void)_saveRestorationStateForScene:(id)a3
{
  if (a3)
  {
    objc_msgSend(a1, "_userActivityManagerForScene:");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v3 _saveSceneRestorationState];
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SCalledWithNil.isa, "+[_UICanvasUserActivityManager _saveRestorationStateForScene:]");
  }
}

+ (id)_userActivityManagerForScene:(id)a3
{
  id v3 = a3;
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SCalledLooking.isa, "+[_UICanvasUserActivityManager _userActivityManagerForScene:]", @"UIUserActivitySceneComponentKey");
  }
  id v4 = [v3 _sceneComponentForKey:@"UIUserActivitySceneComponentKey"];

  return v4;
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  return (UIScene *)WeakRetained;
}

- (UIActivityContinuationManager)_activityContinuationManager
{
  return self->_activityContinuationManager;
}

- (void)activityContinuationManager:(id)a3 displayProgressUI:(id)a4 dismissalHandler:(id)a5
{
  id v6 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = _UINSLocalizedStringWithDefaultValue(@"Handoff", @"Handoff");
    id v9 = _UINSLocalizedStringWithDefaultValue(@"Waiting for Handoff to “%@”.", @"Waiting for Handoff to “%@”.");
    id v10 = [(id)UIApp _localizedApplicationName];
    id v11 = objc_msgSend(NSString, "localizedStringWithFormat:", v9, v10);
    id v12 = _UINSLocalizedStringWithDefaultValue(@"Cancel", @"Cancel");
    long long v13 = +[_UIApplicationModalProgressController instanceForScene:WeakRetained];
    if ([(_UICanvasUserActivityManager *)self _isDisplayingActivityContinuationUI])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke;
      v17[3] = &unk_1E52D9FE8;
      long long v14 = &v18;
      id v18 = v6;
      [v13 reconfigureWithTitle:v8 message:v11 progress:0 buttonTitle:v12 dismissalHandler:v17];
    }
    else
    {
      [(_UICanvasUserActivityManager *)self _setIsDisplayingActivityContinuationUI:1];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      void v15[2] = __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2;
      v15[3] = &unk_1E52D9FE8;
      long long v14 = &v16;
      id v16 = v6;
      [v13 displayWithTitle:v8 message:v11 progress:0 buttonTitle:v12 sourceViewController:0 preDisplayTestBlock:0 dismissalHandler:v15];
    }
  }
}

- (void)activityContinuationManager:(id)a3 configureProgressUIWithError:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(_UICanvasUserActivityManager *)self _isDisplayingActivityContinuationUI])
  {
    uint64_t v5 = +[_UIApplicationModalProgressController instanceForScene:WeakRetained];
    [(_UICanvasUserActivityManager *)self _setIsDisplayingActivityContinuationUI:0];
    id v6 = _UINSLocalizedStringWithDefaultValue(@"Handoff", @"Handoff");
    id v7 = _UINSLocalizedStringWithDefaultValue(@"Handoff Failed", @"Handoff Failed");
    id v8 = _UINSLocalizedStringWithDefaultValue(@"OK", @"OK");
    [v5 reconfigureWithTitle:v6 message:v7 progress:0 buttonTitle:v8 dismissalHandler:0];
  }
}

- (void)activityContinuationManager:(id)a3 hideProgressUIWithCompletion:(id)a4
{
  uint64_t v5 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(_UICanvasUserActivityManager *)self _isDisplayingActivityContinuationUI])
  {
    id v7 = +[_UIApplicationModalProgressController instanceForScene:WeakRetained];
    [(_UICanvasUserActivityManager *)self _setIsDisplayingActivityContinuationUI:0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __89___UICanvasUserActivityManager_activityContinuationManager_hideProgressUIWithCompletion___block_invoke;
    v8[3] = &unk_1E52D9FE8;
    id v9 = v5;
    [v7 hideAfterMinimumUptimeWithDismissalHandler:v8];
  }
  else if (v5)
  {
    v5[2](v5);
  }
}

- (id)activityContinuationManagerUserCancelledError:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F281F8];
  uint64_t v9 = *MEMORY[0x1E4F28568];
  uint64_t v5 = _UINSLocalizedStringWithDefaultValue(@"User cancelled waiting for the activity", @"User cancelled waiting for the activity");
  v10[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v7 = [v3 errorWithDomain:v4 code:3072 userInfo:v6];

  return v7;
}

- (BOOL)activityContinuationManager:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  id v7 = [WeakRetained delegate];
  char v8 = objc_opt_respondsToSelector();

  uint64_t v9 = [WeakRetained delegate];
  id v10 = v9;
  if (v8)
  {
    [v9 scene:WeakRetained willContinueUserActivityWithType:v5];

    int v11 = ![(NSSet *)self->_activityTypesForDefaultProgressUI containsObject:v5];
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      long long v13 = [WeakRetained delegate];
      LOBYTE(v11) = [v13 _canvas:WeakRetained willContinueUserActivityWithType:v5];
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }

  return v11;
}

- (BOOL)activityContinuationManager:(id)a3 continueUserActivity:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  id v7 = [WeakRetained delegate];
  char v8 = objc_opt_respondsToSelector();

  uint64_t v9 = [WeakRetained delegate];
  id v10 = v9;
  if (v8)
  {
    [v9 scene:WeakRetained continueUserActivity:v5];
    char v11 = 1;
  }
  else
  {
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0)
    {
      char v11 = 1;
      goto LABEL_7;
    }
    id v10 = [WeakRetained delegate];
    char v11 = [v10 _canvas:WeakRetained continueUserActivity:v5];
  }

LABEL_7:
  return v11;
}

- (void)activityContinuationManager:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v14 = a4;
  id v7 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  uint64_t v9 = [WeakRetained delegate];
  char v10 = objc_opt_respondsToSelector();

  char v11 = [WeakRetained delegate];
  char v12 = v11;
  if (v10)
  {
    [v11 scene:WeakRetained didFailToContinueUserActivityWithType:v14 error:v7];
  }
  else
  {
    char v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0) {
      goto LABEL_6;
    }
    char v12 = [WeakRetained delegate];
    [v12 _canvas:WeakRetained didFailToContinueUserActivityWithType:v14 error:v7];
  }

LABEL_6:
}

- (void)activityContinuationManager:(id)a3 didUpdateUserActivity:(id)a4
{
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  id v6 = [WeakRetained delegate];
  char v7 = objc_opt_respondsToSelector();

  char v8 = [WeakRetained delegate];
  uint64_t v9 = v8;
  if (v7)
  {
    [v8 scene:WeakRetained didUpdateUserActivity:v11];
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v9 = [WeakRetained delegate];
    [v9 _canvas:WeakRetained didUpdateUserActivity:v11];
  }

LABEL_6:
}

+ (id)_fetchSceneSessionWithPersistentIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__144;
  long long v15 = __Block_byref_object_dispose__144;
  id v16 = 0;
  uint64_t v4 = _persistenceQueue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75___UICanvasUserActivityManager__fetchSceneSessionWithPersistentIdentifier___block_invoke;
  v8[3] = &unk_1E52E3210;
  char v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  dispatch_sync(v4, v8);

  id v6 = _decodeSceneSession((void *)v12[5], v5);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)_performCanvasRestoration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakScene);
  uint64_t v4 = [WeakRetained session];
  id v5 = [v4 persistentIdentifier];

  if (WeakRetained && v5)
  {
    restorationActivity = self->_restorationActivity;
    if (restorationActivity)
    {
      char v7 = restorationActivity;
      if (_UIStateRestorationDebugLogEnabled()) {
        NSLog(&cfstr_SRestoringCanv.isa, "-[_UICanvasUserActivityManager _performCanvasRestoration]", v7);
      }
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      id v9[2] = __57___UICanvasUserActivityManager__performCanvasRestoration__block_invoke;
      v9[3] = &unk_1E52D9F98;
      id v10 = WeakRetained;
      uint64_t v11 = v7;
      char v8 = v7;
      +[UIViewController _performWithoutDeferringTransitions:v9];
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(&cfstr_SNoRestoration.isa, "-[_UICanvasUserActivityManager _performCanvasRestoration]", WeakRetained);
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SNoDefinitionF.isa, "-[_UICanvasUserActivityManager _performCanvasRestoration]", WeakRetained);
  }
}

- (void)_performCanvasRestorationIfNecessary
{
  if (self->_restorationActivity)
  {
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SRestorationAc.isa, "-[_UICanvasUserActivityManager _performCanvasRestorationIfNecessary]");
    }
    [(_UICanvasUserActivityManager *)self _performCanvasRestoration];
    restorationActivity = self->_restorationActivity;
    self->_restorationActivity = 0;
  }
}

- (id)_updateCanvasConnectionOptionsDictionary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_connectionOptionsRestorationActivityDictionary) {
    goto LABEL_7;
  }
  id v6 = (void *)[v4 mutableCopy];
  char v7 = [v6 objectForKey:@"UICanvasConnectionOptionsUserActivityDictionariesKey"];
  if (v7)
  {
    char v8 = v7;
    id v9 = [v7 setByAddingObject:self->_connectionOptionsRestorationActivityDictionary];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:self->_connectionOptionsRestorationActivityDictionary];
  }
  [v6 setObject:v9 forKey:@"UICanvasConnectionOptionsUserActivityDictionariesKey"];
  [v6 setObject:self->_connectionOptionsRestorationActivityDictionary forKey:@"_UICanvasConnectionOptionsRestorationActivityDictionaryKey"];

  if (v6)
  {
    id v10 = (id)[v6 copy];
  }
  else
  {
LABEL_7:
    id v10 = v5;
  }

  return v10;
}

+ (id)_activityContinuationDictionaryWithAction:(id)a3 sourceApplication:(id)a4 originatingProcess:(id)a5
{
  char v7 = (void *)UIApp;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v7 _getActivityContinuationManager];
  char v12 = [v11 activityContinuationDictionaryWithAction:v10 sourceApplication:v9 originatingProcess:v8];

  return v12;
}

- (BOOL)_initialRestorationIsFinished
{
  return self->_initialRestorationIsFinished;
}

- (BOOL)_isDisplayingActivityContinuationUI
{
  return self->_isDisplayingActivityContinuationUI;
}

- (void)_setIsDisplayingActivityContinuationUI:(BOOL)a3
{
  self->_isDisplayingActivityContinuationUI = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityTypesForDefaultProgressUI, 0);
  objc_storeStrong((id *)&self->_activityContinuationManager, 0);
  objc_storeStrong((id *)&self->_connectionOptionsRestorationActivityDictionary, 0);
  objc_storeStrong((id *)&self->_restorationActivity, 0);
  objc_destroyWeak((id *)&self->_weakScene);
}

@end