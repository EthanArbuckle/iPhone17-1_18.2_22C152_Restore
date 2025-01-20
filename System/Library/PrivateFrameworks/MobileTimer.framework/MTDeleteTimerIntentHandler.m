@interface MTDeleteTimerIntentHandler
- (id)_responseToDeleteTimerIntent:(id)a3 withDeletedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (id)_timerFromIntentTargetTimer:(id)a3 defaultState:(int64_t)a4;
- (void)_deleteTimer:(id)a3 multiple:(BOOL)a4 dryRun:(BOOL)a5 completion:(id)a6;
- (void)confirmDeleteTimer:(id)a3 completion:(id)a4;
- (void)handleDeleteTimer:(id)a3 completion:(id)a4;
- (void)resolveDeleteMultipleForDeleteTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveTargetTimerForDeleteTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation MTDeleteTimerIntentHandler

- (void)resolveTargetTimerForDeleteTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[MTDeleteTimerIntentHandler resolveTargetTimerForDeleteTimer:withCompletion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [v6 targetTimer];
    v10 = [v6 targetTimer];
    v11 = -[MTDeleteTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, [v10 state]);

    if ([v11 type] == 2) {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11D18, &unk_1EEE11D30, 0, v16);
    }
    else {
    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11D18, &unk_1EEE11D30, &unk_1EEE11D48, 0);
    }
    v13 = [v6 deleteMultiple];
    uint64_t v14 = [v13 BOOLValue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __78__MTDeleteTimerIntentHandler_resolveTargetTimerForDeleteTimer_withCompletion___block_invoke;
    v17[3] = &unk_1E5914B28;
    id v18 = v11;
    id v19 = v7;
    id v15 = v11;
    [(MTTimerIntentHandler *)self _genericallyResolveTargetTimer:v15 multiple:v14 allowedTimerStatesForFollowup:v12 completion:v17];
  }
}

void __78__MTDeleteTimerIntentHandler_resolveTargetTimerForDeleteTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F307E0] successWithResolvedTimer:*(void *)(a1 + 32)];
  }
  v5 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveDeleteMultipleForDeleteTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[MTDeleteTimerIntentHandler resolveDeleteMultipleForDeleteTimer:withCompletion:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F302F8];
    v9 = [v5 deleteMultiple];
    v10 = objc_msgSend(v8, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
    v6[2](v6, v10);
  }
}

- (void)confirmDeleteTimer:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[MTDeleteTimerIntentHandler confirmDeleteTimer:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [v6 targetTimer];
    v10 = [v6 targetTimer];
    int v11 = -[MTDeleteTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, [v10 state]);

    v12 = [v6 deleteMultiple];
    uint64_t v13 = [v12 BOOLValue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__MTDeleteTimerIntentHandler_confirmDeleteTimer_completion___block_invoke;
    v14[3] = &unk_1E59167A0;
    id v16 = v7;
    v14[4] = self;
    id v15 = v6;
    [(MTDeleteTimerIntentHandler *)self _deleteTimer:v11 multiple:v13 dryRun:1 completion:v14];
  }
}

void __60__MTDeleteTimerIntentHandler_confirmDeleteTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) _responseToDeleteTimerIntent:*(void *)(a1 + 40) withDeletedTimers:a2 error:a3 dryRun:1];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (void)handleDeleteTimer:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v20 = "-[MTDeleteTimerIntentHandler handleDeleteTimer:completion:]";
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v9 = [v6 targetTimer];
  v10 = [v6 targetTimer];
  int v11 = -[MTDeleteTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, [v10 state]);

  v12 = [v6 deleteMultiple];
  uint64_t v13 = [v12 BOOLValue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __59__MTDeleteTimerIntentHandler_handleDeleteTimer_completion___block_invoke;
  v16[3] = &unk_1E59167A0;
  id v17 = v6;
  id v18 = v7;
  v16[4] = self;
  id v14 = v6;
  id v15 = v7;
  [(MTDeleteTimerIntentHandler *)self _deleteTimer:v11 multiple:v13 dryRun:0 completion:v16];
}

void __59__MTDeleteTimerIntentHandler_handleDeleteTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _responseToDeleteTimerIntent:*(void *)(a1 + 40) withDeletedTimers:a2 error:a3 dryRun:0];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)_responseToDeleteTimerIntent:(id)a3 withDeletedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10 || v11)
  {
    id v17 = [v11 domain];
    int v18 = [v17 isEqualToString:@"MTTimerIntentHandlerErrorDomain"];

    if (!v18
      || (uint64_t v19 = [v12 code], (unint64_t)(v19 - 5) > 2)
      || (id v14 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30400]) initWithCode:qword_19CD53D40[v19 - 5] userActivity:0]) == 0)
    {
      id v14 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30400]) initWithCode:4 userActivity:0];
    }
    id v20 = (id)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v22 = v6 ? @"confirm" : @"handle";
      if (v12)
      {
        uint64_t v23 = [NSString stringWithFormat:@"due to error %@", v12];
      }
      else
      {
        uint64_t v23 = &stru_1EEDE16C8;
      }
      *(_DWORD *)buf = 136316162;
      v25 = "-[MTDeleteTimerIntentHandler _responseToDeleteTimerIntent:withDeletedTimers:error:dryRun:]";
      __int16 v26 = 2112;
      v27 = v22;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v23;
      __int16 v32 = 2112;
      v33 = v14;
      _os_log_error_impl(&dword_19CC95000, v20, OS_LOG_TYPE_ERROR, "%s Failed to %@ delete timer intent %@ %@, response: %@", buf, 0x34u);
      if (v12) {
    }
      }
  }
  else
  {
    if ([v10 count]) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 6;
    }
    id v14 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30400]) initWithCode:v13 userActivity:0];
    [(__CFString *)v14 setDeletedTimers:v10];
    id v15 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      id v16 = @"handled";
      *(_DWORD *)buf = 136315906;
      v25 = "-[MTDeleteTimerIntentHandler _responseToDeleteTimerIntent:withDeletedTimers:error:dryRun:]";
      __int16 v26 = 2112;
      if (v6) {
        id v16 = @"confirmed";
      }
      v27 = v16;
      __int16 v28 = 2112;
      id v29 = v9;
      __int16 v30 = 2112;
      v31 = v14;
      _os_log_impl(&dword_19CC95000, v15, OS_LOG_TYPE_INFO, "%s Successfully %@ delete timer attribute intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v14;
}

- (void)_deleteTimer:(id)a3 multiple:(BOOL)a4 dryRun:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  v12 = [(MTTimerIntentHandler *)self _timerManager];
  uint64_t v13 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    id v14 = &stru_1EEDE16C8;
    *(_DWORD *)buf = 136315906;
    v36 = "-[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:]";
    if (v7) {
      id v14 = @" (dry-run)";
    }
    __int16 v37 = 2112;
    v38 = v14;
    __int16 v39 = 2112;
    id v40 = v10;
    __int16 v41 = 2112;
    v42 = v12;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "%s Deleting%@ timer %@ from timer manager %@", buf, 0x2Au);
  }
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke;
  v30[3] = &unk_1E59167C8;
  BOOL v34 = v7;
  id v15 = v10;
  id v31 = v15;
  id v16 = v12;
  id v32 = v16;
  id v17 = v11;
  id v33 = v17;
  int v18 = (void *)MEMORY[0x19F3A0FB0](v30);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_34;
  v23[3] = &unk_1E5916860;
  v23[4] = self;
  id v24 = v15;
  BOOL v28 = a4;
  BOOL v29 = v7;
  id v26 = v18;
  id v27 = v17;
  id v25 = v16;
  id v19 = v16;
  id v20 = v17;
  id v21 = v15;
  id v22 = v18;
  [(MTTimerIntentHandler *)self _matchTimersFromIntentsTimer:v21 excludeStoppedTimers:0 completion:v23];
}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_34(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    BOOL v7 = [*(id *)(a1 + 32) _onlyUnnamedTimerInTimers:v6 forTargetTimer:*(void *)(a1 + 40) allowMultiple:*(unsigned __int8 *)(a1 + 72)];
    if (v7)
    {
      v8 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:]_block_invoke";
        __int16 v46 = 2112;
        v47 = v7;
        _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s Filtering timer for delete to single unnamed timer: %@", buf, 0x16u);
      }
      uint64_t v43 = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];

      id v6 = (id)v9;
    }
    if ([v6 count] == 1 || *(unsigned char *)(a1 + 72) && (unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      if (*(unsigned char *)(a1 + 73))
      {
        uint64_t v10 = *(void *)(a1 + 64);
        if (v10)
        {
          id v11 = objc_msgSend(v6, "na_map:", &__block_literal_global_21);
          (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);
        }
      }
      else
      {
        BOOL v28 = v7;
        int v18 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v29 = v6;
        id v19 = v6;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v37 != v22) {
                objc_enumerationMutation(v19);
              }
              uint64_t v24 = *(void *)(*((void *)&v36 + 1) + 8 * i);
              v33[0] = MEMORY[0x1E4F143A8];
              v33[1] = 3221225472;
              v33[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_2;
              v33[3] = &unk_1E5916810;
              id v34 = *(id *)(a1 + 48);
              uint64_t v35 = v24;
              id v25 = (id)[v18 flatMap:v33];
            }
            uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v42 count:16];
          }
          while (v21);
        }

        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_3;
        v30[3] = &unk_1E5916838;
        id v32 = *(id *)(a1 + 64);
        id v31 = v19;
        id v26 = (id)[v18 addSuccessBlock:v30];
        id v27 = (id)[v18 addFailureBlock:*(void *)(a1 + 56)];

        BOOL v7 = v28;
        id v6 = v29;
      }
    }
    else if ([v6 count])
    {
      v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      if (*(unsigned char *)(a1 + 73)) {
        uint64_t v13 = @" (dry-run)";
      }
      else {
        uint64_t v13 = &stru_1EEDE16C8;
      }
      uint64_t v14 = *(void *)(a1 + 56);
      id v15 = [NSString stringWithFormat:@"Failed to delete%@ timer %@ from timer manager %@ due to ambiguity between timers %@", v13, *(void *)(a1 + 40), *(void *)(a1 + 48), v6];
      __int16 v41 = v15;
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v17 = [v12 errorWithDomain:@"MTDeleteTimerIntentHandlerErrorDomain" code:1 userInfo:v16];
      (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v17);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
}

id __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_36(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

uint64_t __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeTimer:*(void *)(a1 + 40)];
}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_41);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
  }
}

id __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

- (id)_timerFromIntentTargetTimer:(id)a3 defaultState:(int64_t)a4
{
  id v5 = a3;
  id v6 = [v5 label];
  BOOL v7 = [v6 spokenPhrase];
  if ([v7 length])
  {
    BOOL v8 = 0;
  }
  else
  {
    [v5 duration];
    BOOL v8 = v9 == -1.0;
  }

  uint64_t v10 = [v5 type];
  if (v8) {
    uint64_t v11 = 2 * ([v5 type] == 2);
  }
  else {
    uint64_t v11 = v10;
  }
  id v12 = objc_alloc(MEMORY[0x1E4F307D8]);
  uint64_t v13 = [v5 label];
  [v5 duration];
  double v15 = v14;
  [v5 remainingTime];
  double v17 = v16;
  int v18 = [v5 identifier];
  id v19 = (void *)[v12 initWithLabel:v13 duration:v18 remainingTime:a4 identifier:v11 state:v15 type:v17];

  return v19;
}

void __70__MTDeleteTimerIntentHandler__deleteTimer_multiple_dryRun_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = @" (dry-run)";
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(a1 + 56)) {
    id v3 = &stru_1EEDE16C8;
  }
  int v6 = 136316162;
  BOOL v7 = "-[MTDeleteTimerIntentHandler _deleteTimer:multiple:dryRun:completion:]_block_invoke";
  __int16 v8 = 2112;
  double v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%s Failed to delete%@ timer %@ from timer manager %@ due to error %@", (uint8_t *)&v6, 0x34u);
}

@end