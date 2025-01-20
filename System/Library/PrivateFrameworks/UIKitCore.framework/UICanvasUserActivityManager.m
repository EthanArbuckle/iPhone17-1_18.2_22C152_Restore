@interface UICanvasUserActivityManager
@end

@implementation UICanvasUserActivityManager

void __61___UICanvasUserActivityManager__updatePersistedSceneSession___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) persistentIdentifier];

  if (v2)
  {
    _queue_ensureExistenceOfKnownSceneSessionMap();
    v3 = (void *)qword_1EB262000;
    v4 = [*(id *)(a1 + 32) persistentIdentifier];
    v5 = [v3 objectForKey:v4];

    int v6 = _UIStateRestorationDebugLogEnabled();
    if (v5)
    {
      if (v6)
      {
        v7 = [*(id *)(a1 + 32) persistentIdentifier];
        NSLog(&cfstr_SUpdatingScene.isa, "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke", v7, *(void *)(a1 + 32));
LABEL_10:
      }
    }
    else if (v6)
    {
      v7 = [*(id *)(a1 + 32) persistentIdentifier];
      NSLog(&cfstr_SAddingScenese.isa, "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke", v7, *(void *)(a1 + 32));
      goto LABEL_10;
    }
    id v8 = *(id *)(a1 + 32);
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    v10 = (void *)[v8 _copyWithoutUserInfo];
    [v9 encodeObject:v10 forKey:@"CanvasRestorationCanvasDefinitionKey"];

    [v9 finishEncoding];
    id v13 = [v9 encodedData];
    if (_UIStateRestorationDebugLogEnabled()) {
      NSLog(&cfstr_SScenesessionD.isa, "NSData *_encodeSceneSession(UISceneSession *__strong)", v13);
    }

    if (v13)
    {
      v11 = (void *)qword_1EB262000;
      v12 = [*(id *)(a1 + 32) persistentIdentifier];
      [v11 setObject:v13 forKey:v12];

      _queue_scheduleUpdateAndSaveForPersistedSceneSessions();
    }
    else if (_UIStateRestorationDebugLogEnabled())
    {
      NSLog(&cfstr_SCouldNotEncod.isa, "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke");
    }

    return;
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SAskedToUpdate.isa, "+[_UICanvasUserActivityManager _updatePersistedSceneSession:]_block_invoke", *(void *)(a1 + 32));
  }
}

void __53___UICanvasUserActivityManager__knownSceneSessionMap__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  _queue_ensureExistenceOfKnownSceneSessionMap();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = (id)qword_1EB262000;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v8 = [(id)qword_1EB262000 objectForKey:v7];
        v9 = _decodeSceneSession(v8, v7);
        if (v9)
        {
          [*(id *)(a1 + 32) setObject:v9 forKey:v7];
        }
        else if (_UIStateRestorationDebugLogEnabled())
        {
          NSLog(&cfstr_SCouldNotDecod.isa, "+[_UICanvasUserActivityManager _knownSceneSessionMap]_block_invoke", v7);
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  if (_UIStateRestorationDebugLogEnabled())
  {
    v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSinceDate:*(void *)(a1 + 40)];
    NSLog(&cfstr_ConstructedKno.isa, v11);
  }
  if (_UIStateRestorationDebugLogEnabled())
  {
    uint64_t v12 = [*(id *)(a1 + 32) count];
    if ([*(id *)(a1 + 32) count] == 1) {
      id v13 = &stru_1ED0E84C0;
    }
    else {
      id v13 = @"s";
    }
    v14 = [*(id *)(a1 + 32) allKeys];
    NSLog(&cfstr_SReturningKnow.isa, "+[_UICanvasUserActivityManager _knownSceneSessionMap]_block_invoke", v12, v13, v14, (void)v15);
  }
}

uint64_t __62___UICanvasUserActivityManager__initializeUserActivityManager__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 role];
  uint64_t v3 = [v2 isEqualToString:@"UIWindowSceneSessionRoleExternalDisplayNonInteractive"] ^ 1;

  return v3;
}

void __78___UICanvasUserActivityManager__deleteSceneSessionsWithPersistentIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * v5);
        v7 = _queue_persistentIdentifiersForDeletion();
        _queue_ensureExistenceOfKnownSceneSessionMap();
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SRemovingDefin.isa, "+[_UICanvasUserActivityManager _deleteSceneSessionsWithPersistentIdentifiers:]_block_invoke", v6, (void)v8);
        }
        [(id)qword_1EB262000 removeObjectForKey:v6];
        [v7 addObject:v6];
        _queue_scheduleUpdateAndSaveForPersistedSceneSessions();

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void __82___UICanvasUserActivityManager__checkActivityContinuationAndBecomeCurrentIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v2 = [WeakRetained _windows];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v2);
      }
      long long v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      if (([v8 isHidden] & 1) == 0 && (!v5 || objc_msgSend(v8, "_isApplicationKeyWindow")))
      {
        long long v9 = [v8 rootViewController];
        uint64_t v10 = [v9 _activityContinuationSuitableToBecomeCurrent];

        if (v10)
        {
          if ([v8 _isApplicationKeyWindow])
          {

            uint64_t v5 = (void *)v10;
            goto LABEL_18;
          }
          uint64_t v5 = (void *)v10;
        }
        else
        {
          uint64_t v5 = 0;
        }
      }
      if (v4 == ++v7)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v4) {
          goto LABEL_3;
        }

        if (!v5) {
          goto LABEL_22;
        }
LABEL_18:
        if (_UIStateRestorationDebugLogEnabled())
        {
          long long v11 = [v5 title];
          uint64_t v12 = [v5 _uniqueIdentifier];
          NSLog(&cfstr_SFoundActivity.isa, "-[_UICanvasUserActivityManager _checkActivityContinuationAndBecomeCurrentIfNeeded]_block_invoke", v5, v11, v12);
        }
        [v5 becomeCurrent];
        goto LABEL_23;
      }
    }
  }

LABEL_22:
  [(id)UIApp _checkActivityContinuationAndBecomeCurrentIfNeeded];
  uint64_t v5 = 0;
LABEL_23:
}

uint64_t __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __95___UICanvasUserActivityManager_activityContinuationManager_displayProgressUI_dismissalHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89___UICanvasUserActivityManager_activityContinuationManager_hideProgressUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __75___UICanvasUserActivityManager__fetchSceneSessionWithPersistentIdentifier___block_invoke(uint64_t a1)
{
  _queue_ensureExistenceOfKnownSceneSessionMap();
  uint64_t v2 = [(id)qword_1EB262000 objectForKey:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _scheduleDataSaveForSceneSession:*(void *)(a1 + 32) saveRestorationActivity:*(unsigned __int8 *)(a1 + 48)];
}

void __89___UICanvasUserActivityManager__scheduleDataSaveForSceneSession_saveRestorationActivity___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    if (_MergedGlobals_1169)
    {
      if ([WeakRetained _stateRestorationActivityIsDirty])
      {
        uint64_t v3 = [v8 scene];
        if (_UIStateRestorationDebugLogEnabled()) {
          NSLog(&cfstr_SSavingStatere.isa, "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v3);
        }
        uint64_t v4 = *(void **)(a1 + 40);
        uint64_t v5 = [v8 scene];
        [v4 _saveRestorationStateForScene:v5];
      }
      else if (_UIStateRestorationDebugLogEnabled())
      {
        NSLog(&cfstr_SSceneSessionS.isa, "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v8);
      }
      _MergedGlobals_1169 = 0;
      id WeakRetained = v8;
    }
    int v6 = [WeakRetained _userInfoIsDirty];
    int v7 = _UIStateRestorationDebugLogEnabled();
    if (v6)
    {
      if (v7) {
        NSLog(&cfstr_SSavingUserinf.isa, "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v8);
      }
      _saveSceneSessionUserInfo(v8);
    }
    else if (v7)
    {
      NSLog(&cfstr_SSceneSessionU.isa, "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", v8);
    }
  }
  else if (_UIStateRestorationDebugLogEnabled())
  {
    NSLog(&cfstr_SSceneSessionI.isa, "+[_UICanvasUserActivityManager _scheduleDataSaveForSceneSession:saveRestorationActivity:]_block_invoke_2", 0);
  }
  byte_1EB261FF9 = 0;
}

void __57___UICanvasUserActivityManager__performCanvasRestoration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) activityType];
  LODWORD(v5) = [v4 _canvas:v5 willContinueUserActivityWithType:v6];

  if (v5)
  {
LABEL_9:
    int v7 = [*(id *)(a1 + 32) delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      long long v9 = [*(id *)(a1 + 32) delegate];
      [v9 _canvas:*(void *)(a1 + 32) continueUserActivity:*(void *)(a1 + 40)];
    }
  }
  if (_UIStateRestorationDebugLogEnabled()) {
    NSLog(&cfstr_SFinishedDirec.isa, "-[_UICanvasUserActivityManager _performCanvasRestoration]_block_invoke", *(void *)(a1 + 40));
  }
}

@end