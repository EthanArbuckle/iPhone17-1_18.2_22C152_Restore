@interface MTResetTimerIntentHandler
- (id)_responseToResetTimerIntent:(id)a3 withResetTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (void)_handleResetTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5;
- (void)confirmResetTimer:(id)a3 completion:(id)a4;
- (void)handleResetTimer:(id)a3 completion:(id)a4;
- (void)resolveTargetTimerForResetTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation MTResetTimerIntentHandler

- (void)resolveTargetTimerForResetTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[MTResetTimerIntentHandler resolveTargetTimerForResetTimer:withCompletion:]";
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [v6 targetTimer];
    v10 = [v6 targetTimer];
    v11 = -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v9, [v10 state]);

    if ([v11 type] == 2) {
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11DD8, &unk_1EEE11DF0, 0, v16);
    }
    else {
    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11DD8, &unk_1EEE11DF0, &unk_1EEE11E08, 0);
    }
    v13 = [v6 resetMultiple];
    uint64_t v14 = [v13 BOOLValue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__MTResetTimerIntentHandler_resolveTargetTimerForResetTimer_withCompletion___block_invoke;
    v17[3] = &unk_1E5914B28;
    id v18 = v11;
    id v19 = v7;
    id v15 = v11;
    [(MTTimerIntentHandler *)self _genericallyResolveTargetTimer:v15 multiple:v14 allowedTimerStatesForFollowup:v12 completion:v17];
  }
}

void __76__MTResetTimerIntentHandler_resolveTargetTimerForResetTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
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

- (void)confirmResetTimer:(id)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[MTResetTimerIntentHandler confirmResetTimer:completion:]";
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__MTResetTimerIntentHandler_confirmResetTimer_completion___block_invoke;
    v9[3] = &unk_1E59167A0;
    id v11 = v7;
    v9[4] = self;
    id v10 = v6;
    [(MTResetTimerIntentHandler *)self _handleResetTimer:v10 dryRun:1 completion:v9];
  }
}

void __58__MTResetTimerIntentHandler_confirmResetTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) _responseToResetTimerIntent:*(void *)(a1 + 40) withResetTimers:a2 error:a3 dryRun:1];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

- (void)handleResetTimer:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v15 = "-[MTResetTimerIntentHandler handleResetTimer:completion:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__MTResetTimerIntentHandler_handleResetTimer_completion___block_invoke;
  v11[3] = &unk_1E59167A0;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  [(MTResetTimerIntentHandler *)self _handleResetTimer:v9 dryRun:0 completion:v11];
}

void __57__MTResetTimerIntentHandler_handleResetTimer_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _responseToResetTimerIntent:*(void *)(a1 + 40) withResetTimers:a2 error:a3 dryRun:0];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)_handleResetTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [v9 targetTimer];
  id v11 = [v9 targetTimer];
  -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v10, [v11 state]);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  id v12 = [v9 resetMultiple];

  -[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:](self, "_updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:", v13, v5, [v12 BOOLValue], 0, 0, &__block_literal_global_33, v8);
}

uint64_t __65__MTResetTimerIntentHandler__handleResetTimer_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setState:1];
  [v2 setState:3];

  return 0;
}

- (id)_responseToResetTimerIntent:(id)a3 withResetTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v10 || v11)
  {
    __int16 v16 = [v11 domain];
    int v17 = [v16 isEqualToString:@"MTTimerIntentHandlerErrorDomain"];

    if (!v17
      || (uint64_t v18 = [v12 code], (unint64_t)(v18 - 5) > 2)
      || (id v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30640]) initWithCode:qword_19CD53E58[v18 - 5] userActivity:0]) == 0)
    {
      id v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30640]) initWithCode:4 userActivity:0];
    }
    id v19 = (id)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = v6 ? @"confirm" : @"handle";
      if (v12)
      {
        __int16 v22 = [NSString stringWithFormat:@"due to error %@", v12];
      }
      else
      {
        __int16 v22 = &stru_1EEDE16C8;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = "-[MTResetTimerIntentHandler _responseToResetTimerIntent:withResetTimers:error:dryRun:]";
      __int16 v25 = 2112;
      v26 = v21;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      v30 = v22;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_error_impl(&dword_19CC95000, v19, OS_LOG_TYPE_ERROR, "%s Failed to %@ reset timer intent %@ %@, response: %@", buf, 0x34u);
      if (v12) {
    }
      }
  }
  else
  {
    id v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30640]) initWithCode:3 userActivity:0];
    [(__CFString *)v13 setResetTimers:v10];
    __int16 v14 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      id v15 = @"handled";
      *(_DWORD *)buf = 136315906;
      uint64_t v24 = "-[MTResetTimerIntentHandler _responseToResetTimerIntent:withResetTimers:error:dryRun:]";
      __int16 v25 = 2112;
      if (v6) {
        id v15 = @"confirmed";
      }
      v26 = v15;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ reset timer intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v13;
}

@end