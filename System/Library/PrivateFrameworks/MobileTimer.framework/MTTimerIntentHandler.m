@interface MTTimerIntentHandler
- (BOOL)_isDefaultTimer:(id)a3;
- (MTTimerManagerIntentSupport)timerManager;
- (MTTimerManagerProviding)timerManagerProvider;
- (id)_alternateTimersForTargetTimerState:(int64_t)a3 type:(int64_t)a4 inTimers:(id)a5 allowedTimerStates:(id)a6;
- (id)_onlyUnnamedTimerInTimers:(id)a3 forTargetTimer:(id)a4 allowMultiple:(BOOL)a5;
- (id)_timerManager;
- (void)_genericallyResolveTargetTimer:(id)a3 multiple:(BOOL)a4 allowedTimerStatesForFollowup:(id)a5 completion:(id)a6;
- (void)_matchTimersFromIntentsTimer:(id)a3 excludeStoppedTimers:(BOOL)a4 completion:(id)a5;
- (void)setTimerManager:(id)a3;
- (void)setTimerManagerProvider:(id)a3;
@end

@implementation MTTimerIntentHandler

- (id)_timerManager
{
  timerManager = self->_timerManager;
  if (!timerManager)
  {
    v4 = [(MTTimerIntentHandler *)self timerManagerProvider];
    v5 = [v4 timerManager];
    v6 = v5;
    if (v5) {
      v7 = v5;
    }
    else {
      v7 = objc_alloc_init(MTTimerManager);
    }
    v8 = self->_timerManager;
    self->_timerManager = (MTTimerManagerIntentSupport *)v7;

    timerManager = self->_timerManager;
  }
  return timerManager;
}

- (void)_matchTimersFromIntentsTimer:(id)a3 excludeStoppedTimers:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v10 = [(MTTimerIntentHandler *)self _timerManager];
    v11 = [v10 timers];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke;
    v19[3] = &unk_1E59181E0;
    v19[4] = self;
    BOOL v22 = a4;
    id v20 = v8;
    id v12 = v9;
    id v21 = v12;
    id v13 = (id)[v11 addSuccessBlock:v19];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3;
    v16[3] = &unk_1E59156E8;
    id v17 = v10;
    id v18 = v12;
    id v14 = v10;
    id v15 = (id)[v11 addFailureBlock:v16];
  }
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_2;
  v19 = &unk_1E59181B8;
  id v8 = *(void **)(a1 + 40);
  uint64_t v20 = *(void *)(a1 + 32);
  char v25 = *(unsigned char *)(a1 + 56);
  id v21 = v8;
  id v9 = v5;
  id v22 = v9;
  id v10 = v6;
  id v23 = v10;
  id v11 = v7;
  id v24 = v11;
  [v4 enumerateObjectsUsingBlock:&v16];

  if (objc_msgSend(v9, "count", v16, v17, v18, v19, v20) || objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    uint64_t v12 = [v9 count];
    uint64_t v13 = *(void *)(a1 + 48);
    if (!v12)
    {
      (*(void (**)(uint64_t, id, id, void))(v13 + 16))(v13, v10, v11, 0);
      goto LABEL_8;
    }
    id v14 = [v10 arrayByAddingObjectsFromArray:v11];
    (*(void (**)(uint64_t, id, void *, void))(v13 + 16))(v13, v9, v14, 0);
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 48);
    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:7 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v15 + 16))(v15, 0, 0, v14);
  }

LABEL_8:
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) _isDefaultTimer:v3] & 1) == 0
    && (!*(unsigned char *)(a1 + 72) || [v3 state] != 1))
  {
    BOOL v5 = 0;
    if (MTTimerMatchesIntentsTimer(v3, *(void **)(a1 + 40), 1, &v5))
    {
      if (v5) {
        id v4 = (id *)(a1 + 48);
      }
      else {
        id v4 = (id *)(a1 + 56);
      }
    }
    else
    {
      id v4 = (id *)(a1 + 64);
    }
    [*v4 addObject:v3];
  }
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_genericallyResolveTargetTimer:(id)a3 multiple:(BOOL)a4 allowedTimerStatesForFollowup:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    if (v10)
    {
      uint64_t v13 = [v11 containsObject:&unk_1EEE11E50] ^ 1;
      id v14 = [(MTTimerIntentHandler *)self _timerManager];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke;
      v17[3] = &unk_1E5918230;
      id v18 = v10;
      id v19 = v14;
      id v22 = v12;
      id v20 = v11;
      id v21 = self;
      BOOL v23 = a4;
      id v15 = v14;
      [(MTTimerIntentHandler *)self _matchTimersFromIntentsTimer:v18 excludeStoppedTimers:v13 completion:v17];
    }
    else
    {
      uint64_t v16 = [MEMORY[0x1E4F307E0] needsValue];
      (*((void (**)(id, void *, void))v12 + 2))(v12, v16, 0);
    }
  }
}

void __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (!v9
    || ([v9 domain],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqualToString:@"MTTimerIntentHandlerErrorDomain"],
        v11,
        (v12 & 1) != 0))
  {
    if (*(void *)(a1 + 48) && (unint64_t)[v7 count] >= 2)
    {
      uint64_t v52 = MEMORY[0x1E4F143A8];
      uint64_t v53 = 3221225472;
      v54 = __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_8;
      v55 = &unk_1E5918208;
      id v56 = *(id *)(a1 + 48);
      uint64_t v13 = [v7 indexesOfObjectsPassingTest:&v52];
      if (objc_msgSend(v13, "count", v52, v53, v54, v55)
        && (unint64_t v14 = [v13 count], v14 < objc_msgSend(v7, "count")))
      {
        uint64_t v15 = [v7 objectsAtIndexes:v13];

        uint64_t v16 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
        {
          unint64_t v17 = *(void *)(a1 + 48);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:"
                "]_block_invoke_2";
          __int16 v60 = 2112;
          unint64_t v61 = v17;
          __int16 v62 = 2112;
          uint64_t v63 = v15;
          _os_log_impl(&dword_19CC95000, v16, OS_LOG_TYPE_INFO, "%s Filtering matched timers for allowedTimerStatesForFollowup:%@ to: %@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v15 = (uint64_t)v7;
      }

      id v7 = (id)v15;
    }
    id v20 = [*(id *)(a1 + 56) _onlyUnnamedTimerInTimers:v7 forTargetTimer:*(void *)(a1 + 32) allowMultiple:*(unsigned __int8 *)(a1 + 72)];
    if (v20)
    {
      id v21 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
        __int16 v60 = 2112;
        unint64_t v61 = (unint64_t)v20;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_INFO, "%s Filtering resolved timer matches to single unnamed timer: %@", buf, 0x16u);
      }
      v57 = v20;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];

      id v7 = (id)v22;
    }
    unint64_t v23 = [v7 count];
    unint64_t v24 = v23;
    if (v23 < 2)
    {
      if (v23)
      {
        v28 = [v7 firstObject];
        v29 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
        {
          uint64_t v30 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          __int16 v60 = 2112;
          unint64_t v61 = (unint64_t)v28;
          __int16 v62 = 2112;
          uint64_t v63 = v30;
          _os_log_impl(&dword_19CC95000, v29, OS_LOG_TYPE_INFO, "%s Found matching timer: %@ for target timer: %@", buf, 0x20u);
        }
        uint64_t v31 = *(void *)(a1 + 64);
        v32 = (void *)MEMORY[0x1E4F307E0];
        v33 = MTIntentsTimerForTimer(v28);
        v34 = [v32 successWithResolvedTimer:v33];
        (*(void (**)(uint64_t, void *, void))(v31 + 16))(v31, v34, 0);

        goto LABEL_41;
      }
      v28 = objc_msgSend(*(id *)(a1 + 56), "_alternateTimersForTargetTimerState:type:inTimers:allowedTimerStates:", objc_msgSend(*(id *)(a1 + 32), "state"), objc_msgSend(*(id *)(a1 + 32), "type"), v8, *(void *)(a1 + 48));
      if ([v28 count] == 1
        && ([v28 firstObject], (uint64_t v42 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v35 = (void *)v42;
        v43 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
        {
          uint64_t v44 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          __int16 v60 = 2112;
          unint64_t v61 = (unint64_t)v35;
          __int16 v62 = 2112;
          uint64_t v63 = v44;
          _os_log_impl(&dword_19CC95000, v43, OS_LOG_TYPE_INFO, "%s Found no matching timers but 1 alternate timer: %@ for target timer: %@", buf, 0x20u);
        }
        uint64_t v45 = *(void *)(a1 + 64);
        v46 = (void *)MEMORY[0x1E4F307E0];
        v47 = MTIntentsTimerForTimer(v35);
        v48 = [v46 confirmationRequiredWithTimerToConfirm:v47];
        (*(void (**)(uint64_t, void *, void))(v45 + 16))(v45, v48, 0);
      }
      else
      {
        v49 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
        {
          unint64_t v50 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315394;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          __int16 v60 = 2112;
          unint64_t v61 = v50;
          _os_log_impl(&dword_19CC95000, v49, OS_LOG_TYPE_INFO, "%s Found no matching timers for target timer: %@", buf, 0x16u);
        }
        uint64_t v51 = *(void *)(a1 + 64);
        if (!v8 || v10)
        {
          (*(void (**)(uint64_t, void, void *))(v51 + 16))(v51, 0, v10);
          goto LABEL_41;
        }
        v35 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:5 userInfo:0];
        (*(void (**)(uint64_t, void, void *))(v51 + 16))(v51, 0, v35);
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 72))
      {
        char v25 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136315650;
          v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
          __int16 v60 = 2048;
          unint64_t v61 = v24;
          __int16 v62 = 2112;
          uint64_t v63 = v26;
          _os_log_impl(&dword_19CC95000, v25, OS_LOG_TYPE_INFO, "%s Found %ld matching timers for multi target timer: %@", buf, 0x20u);
        }
        uint64_t v27 = *(void *)(a1 + 64);
        v28 = [MEMORY[0x1E4F307E0] successWithResolvedTimer:*(void *)(a1 + 32)];
        (*(void (**)(uint64_t, void *, void))(v27 + 16))(v27, v28, 0);
        goto LABEL_41;
      }
      v28 = [v7 sortedArrayUsingComparator:MTTimerIntentResultsComparator];
      v35 = objc_msgSend(v28, "na_map:", &__block_literal_global_49);
      v36 = (void *)*MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        v37 = v36;
        uint64_t v38 = [v35 count];
        uint64_t v39 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        v59 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke_2";
        __int16 v60 = 2048;
        unint64_t v61 = v38;
        __int16 v62 = 2112;
        uint64_t v63 = v39;
        _os_log_impl(&dword_19CC95000, v37, OS_LOG_TYPE_INFO, "%s Disambiguating %ld matching timers for single target timer: %@", buf, 0x20u);
      }
      uint64_t v40 = *(void *)(a1 + 64);
      v41 = [MEMORY[0x1E4F307E0] disambiguationWithTimersToDisambiguate:v35];
      (*(void (**)(uint64_t, void *, void))(v40 + 16))(v40, v41, 0);
    }
LABEL_41:

    goto LABEL_42;
  }
  id v18 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_cold_1(a1, (uint64_t)v10, v18);
  }
  uint64_t v19 = *(void *)(a1 + 64);
  id v20 = [MEMORY[0x1E4F307E0] unsupported];
  (*(void (**)(uint64_t, void *, void))(v19 + 16))(v19, v20, 0);
LABEL_42:
}

uint64_t __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(a2, "state"));
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

id __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

- (id)_onlyUnnamedTimerInTimers:(id)a3 forTargetTimer:(id)a4 allowMultiple:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (a5) {
    goto LABEL_2;
  }
  id v11 = [v8 label];
  if (v11) {
    goto LABEL_8;
  }
  [v9 duration];
  if (v12 <= 0.0) {
    goto LABEL_8;
  }
  if ((unint64_t)[v7 count] < 2)
  {
LABEL_2:
    id v10 = 0;
    goto LABEL_10;
  }
  id v11 = [v7 indexesOfObjectsPassingTest:&__block_literal_global_17_0];
  if ([v11 count] != 1)
  {
LABEL_8:
    id v10 = 0;
  }
  else
  {
    id v10 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v11, "firstIndex"));
  }

LABEL_10:
  return v10;
}

BOOL __79__MTTimerIntentHandler__onlyUnnamedTimerInTimers_forTargetTimer_allowMultiple___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 title];
  BOOL v3 = [v2 length] == 0;

  return v3;
}

- (id)_alternateTimersForTargetTimerState:(int64_t)a3 type:(int64_t)a4 inTimers:(id)a5 allowedTimerStates:(id)a6
{
  id v9 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__MTTimerIntentHandler__alternateTimersForTargetTimerState_type_inTimers_allowedTimerStates___block_invoke;
  v15[3] = &unk_1E5918278;
  id v16 = v9;
  int64_t v17 = a3;
  int64_t v18 = a4;
  id v10 = v9;
  id v11 = a5;
  double v12 = [v11 indexesOfObjectsPassingTest:v15];
  uint64_t v13 = [v11 objectsAtIndexes:v12];

  return v13;
}

BOOL __93__MTTimerIntentHandler__alternateTimersForTargetTimerState_type_inTimers_allowedTimerStates___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if ((!a1[5] || MTIntentsTimerStateForTimerState([v3 state]) == a1[5])
    && (BOOL v5 = (void *)a1[4],
        objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "state")),
        v6 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v5) = [v5 containsObject:v6],
        v6,
        v5))
  {
    uint64_t v7 = [v4 type];
    uint64_t v8 = a1[6];
    BOOL v10 = v7 == v8 || v8 == 0;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)_isDefaultTimer:(id)a3
{
  id v3 = [a3 title];
  char v4 = [v3 isEqualToString:@"CURRENT_TIMER"];

  return v4;
}

- (MTTimerManagerProviding)timerManagerProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timerManagerProvider);
  return (MTTimerManagerProviding *)WeakRetained;
}

- (void)setTimerManagerProvider:(id)a3
{
}

- (MTTimerManagerIntentSupport)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_destroyWeak((id *)&self->_timerManagerProvider);
}

void __85__MTTimerIntentHandler__matchTimersFromIntentsTimer_excludeStoppedTimers_completion___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  BOOL v5 = "-[MTTimerIntentHandler _matchTimersFromIntentsTimer:excludeStoppedTimers:completion:]_block_invoke_3";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%s Failed to retrieve timers from timer manager %@: %@", (uint8_t *)&v4, 0x20u);
}

void __105__MTTimerIntentHandler__genericallyResolveTargetTimer_multiple_allowedTimerStatesForFollowup_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 136315906;
  __int16 v6 = "-[MTTimerIntentHandler _genericallyResolveTargetTimer:multiple:allowedTimerStatesForFollowup:completion:]_block_invoke";
  __int16 v7 = 2112;
  uint64_t v8 = v3;
  __int16 v9 = 2112;
  uint64_t v10 = v4;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%s Failed to resolve timer %@ from timer manager %@ due to error %@", (uint8_t *)&v5, 0x2Au);
}

@end