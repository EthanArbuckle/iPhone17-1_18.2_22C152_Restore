@interface MTPauseResumeTimerIntentHandler
- (id)_responseToPauseTimerIntent:(id)a3 withPausedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (id)_responseToResumeTimerIntent:(id)a3 withResumedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (void)_handlePauseTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5;
- (void)_handleResumeTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5;
- (void)confirmPauseTimer:(id)a3 completion:(id)a4;
- (void)confirmResumeTimer:(id)a3 completion:(id)a4;
- (void)handlePauseTimer:(id)a3 completion:(id)a4;
- (void)handleResumeTimer:(id)a3 completion:(id)a4;
- (void)resolvePauseMultipleForPauseTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveResumeMultipleForResumeTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveTargetTimerForPauseTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveTargetTimerForResumeTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation MTPauseResumeTimerIntentHandler

- (void)resolveTargetTimerForPauseTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[MTPauseResumeTimerIntentHandler resolveTargetTimerForPauseTimer:withCompletion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [v6 targetTimer];
    v10 = [(MTUpdateTimerIntentHandler *)self _timerFromIntentTargetTimer:v9 defaultState:0];

    v11 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEE11E98];
    v12 = [v6 pauseMultiple];
    uint64_t v13 = [v12 BOOLValue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__MTPauseResumeTimerIntentHandler_resolveTargetTimerForPauseTimer_withCompletion___block_invoke;
    v15[3] = &unk_1E5914B28;
    id v16 = v10;
    id v17 = v7;
    id v14 = v10;
    [(MTTimerIntentHandler *)self _genericallyResolveTargetTimer:v14 multiple:v13 allowedTimerStatesForFollowup:v11 completion:v15];
  }
}

void __82__MTPauseResumeTimerIntentHandler_resolveTargetTimerForPauseTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
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

- (void)resolvePauseMultipleForPauseTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[MTPauseResumeTimerIntentHandler resolvePauseMultipleForPauseTimer:withCompletion:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E4F302F8];
    v9 = [v5 pauseMultiple];
    v10 = objc_msgSend(v8, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
    v6[2](v6, v10);
  }
}

- (void)confirmPauseTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[MTPauseResumeTimerIntentHandler confirmPauseTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(MTPauseResumeTimerIntentHandler *)self _handlePauseTimer:v6 dryRun:1 completion:v7];
}

- (void)handlePauseTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[MTPauseResumeTimerIntentHandler handlePauseTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(MTPauseResumeTimerIntentHandler *)self _handlePauseTimer:v6 dryRun:0 completion:v7];
}

- (void)_handlePauseTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 targetTimer];
  __int16 v11 = [v8 targetTimer];
  id v12 = -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v10, [v11 state]);

  uint64_t v13 = [v8 pauseMultiple];
  uint64_t v14 = [v13 BOOLValue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke_3;
  v17[3] = &unk_1E5914B90;
  id v18 = v8;
  id v19 = v9;
  v17[4] = self;
  BOOL v20 = v6;
  id v15 = v8;
  id v16 = v9;
  [(MTUpdateTimerIntentHandler *)self _updateTimer:v12 dryRun:v6 allowMultiple:v14 excludeStoppedTimers:1 filterBlock:&__block_literal_global updateBlock:&__block_literal_global_9 completion:v17];
}

BOOL __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 3;
}

uint64_t __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return 0;
}

void __71__MTPauseResumeTimerIntentHandler__handlePauseTimer_dryRun_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _responseToPauseTimerIntent:*(void *)(a1 + 40) withPausedTimers:a2 error:a3 dryRun:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)resolveTargetTimerForResumeTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[MTPauseResumeTimerIntentHandler resolveTargetTimerForResumeTimer:withCompletion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  id v9 = [v6 targetTimer];
  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11CD0, 0);
  __int16 v11 = [v6 resumeMultiple];
  uint64_t v12 = [v11 BOOLValue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__MTPauseResumeTimerIntentHandler_resolveTargetTimerForResumeTimer_withCompletion___block_invoke;
  v15[3] = &unk_1E5914B28;
  id v16 = v9;
  id v17 = v7;
  id v13 = v7;
  id v14 = v9;
  [(MTTimerIntentHandler *)self _genericallyResolveTargetTimer:v14 multiple:v12 allowedTimerStatesForFollowup:v10 completion:v15];
}

void __83__MTPauseResumeTimerIntentHandler_resolveTargetTimerForResumeTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
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
  id v5 = v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)resolveResumeMultipleForResumeTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[MTPauseResumeTimerIntentHandler resolveResumeMultipleForResumeTimer:withCompletion:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    id v8 = (void *)MEMORY[0x1E4F302F8];
    id v9 = [v5 resumeMultiple];
    v10 = objc_msgSend(v8, "successWithResolvedValue:", objc_msgSend(v9, "BOOLValue"));
    v6[2](v6, v10);
  }
}

- (void)confirmResumeTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[MTPauseResumeTimerIntentHandler confirmResumeTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(MTPauseResumeTimerIntentHandler *)self _handleResumeTimer:v6 dryRun:1 completion:v7];
}

- (void)handleResumeTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[MTPauseResumeTimerIntentHandler handleResumeTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(MTPauseResumeTimerIntentHandler *)self _handleResumeTimer:v6 dryRun:0 completion:v7];
}

- (void)_handleResumeTimer:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 targetTimer];
  __int16 v11 = [v8 targetTimer];
  id v12 = -[MTUpdateTimerIntentHandler _timerFromIntentTargetTimer:defaultState:](self, "_timerFromIntentTargetTimer:defaultState:", v10, [v11 state]);

  uint64_t v13 = [v8 resumeMultiple];
  uint64_t v14 = [v13 BOOLValue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke_3;
  v17[3] = &unk_1E5914B90;
  id v18 = v8;
  id v19 = v9;
  v17[4] = self;
  BOOL v20 = v6;
  id v15 = v8;
  id v16 = v9;
  [(MTUpdateTimerIntentHandler *)self _updateTimer:v12 dryRun:v6 allowMultiple:v14 excludeStoppedTimers:1 filterBlock:&__block_literal_global_12 updateBlock:&__block_literal_global_14 completion:v17];
}

BOOL __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 state] == 2;
}

uint64_t __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return 0;
}

void __72__MTPauseResumeTimerIntentHandler__handleResumeTimer_dryRun_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _responseToResumeTimerIntent:*(void *)(a1 + 40) withResumedTimers:a2 error:a3 dryRun:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (id)_responseToPauseTimerIntent:(id)a3 withPausedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (v10 && !v11)
  {
    uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30590]) initWithCode:3 userActivity:0];
    [(__CFString *)v13 setPausedTimers:v10];
    uint64_t v14 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      id v15 = @"handled";
      *(_DWORD *)buf = 136315906;
      v29 = "-[MTPauseResumeTimerIntentHandler _responseToPauseTimerIntent:withPausedTimers:error:dryRun:]";
      __int16 v30 = 2112;
      if (v6) {
        id v15 = @"confirmed";
      }
      v31 = v15;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      v35 = v13;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ pause timer attribute intent %@ with response %@", buf, 0x2Au);
    }
    goto LABEL_17;
  }
  id v16 = [v11 domain];
  int v17 = [v16 isEqualToString:@"MTTimerIntentHandlerErrorDomain"];

  if (v17)
  {
    uint64_t v18 = [v12 code];
    switch(v18)
    {
      case 7:
        id v19 = objc_alloc(MEMORY[0x1E4F30590]);
        uint64_t v20 = 7;
LABEL_13:
        uint64_t v13 = (__CFString *)[v19 initWithCode:v20 userActivity:0];
        if (v13) {
          goto LABEL_15;
        }
        break;
      case 6:
        id v23 = objc_alloc(MEMORY[0x1E4F30590]);
        v24 = [v9 pauseMultiple];
        if ([v24 BOOLValue]) {
          uint64_t v25 = 9;
        }
        else {
          uint64_t v25 = 8;
        }
        uint64_t v13 = (__CFString *)[v23 initWithCode:v25 userActivity:0];

        if (v13) {
          goto LABEL_15;
        }
        break;
      case 5:
        id v19 = objc_alloc(MEMORY[0x1E4F30590]);
        uint64_t v20 = 6;
        goto LABEL_13;
    }
  }
  uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30590]) initWithCode:4 userActivity:0];
LABEL_15:
  id v21 = (id)*MEMORY[0x1E4F30240];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v26 = v6 ? @"confirm" : @"handle";
    if (v12)
    {
      v27 = [NSString stringWithFormat:@"due to error %@", v12];
    }
    else
    {
      v27 = &stru_1EEDE16C8;
    }
    *(_DWORD *)buf = 136315906;
    v29 = "-[MTPauseResumeTimerIntentHandler _responseToPauseTimerIntent:withPausedTimers:error:dryRun:]";
    __int16 v30 = 2112;
    v31 = v26;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    v35 = v27;
    _os_log_error_impl(&dword_19CC95000, v21, OS_LOG_TYPE_ERROR, "%s Failed to %@ pause timer intent %@%@", buf, 0x2Au);
    if (v12) {
  }
    }
LABEL_17:

  return v13;
}

- (id)_responseToResumeTimerIntent:(id)a3 withResumedTimers:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v16 = [v11 domain];
    int v17 = [v16 isEqualToString:@"MTTimerIntentHandlerErrorDomain"];

    if (v17)
    {
      uint64_t v18 = [v12 code];
      switch(v18)
      {
        case 7:
          uint64_t v19 = 7;
          break;
        case 6:
          uint64_t v20 = [v9 resumeMultiple];
          if ([v20 BOOLValue]) {
            uint64_t v19 = 9;
          }
          else {
            uint64_t v19 = 8;
          }

          break;
        case 5:
          uint64_t v19 = 6;
          break;
        default:
          uint64_t v19 = 4;
          break;
      }
    }
    else
    {
      uint64_t v19 = 4;
    }
    uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30658]) initWithCode:v19 userActivity:0];
    id v21 = (id)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v23 = v6 ? @"confirm" : @"handle";
      if (v12)
      {
        v24 = [NSString stringWithFormat:@"due to error %@", v12];
      }
      else
      {
        v24 = &stru_1EEDE16C8;
      }
      *(_DWORD *)buf = 136315906;
      v26 = "-[MTPauseResumeTimerIntentHandler _responseToResumeTimerIntent:withResumedTimers:error:dryRun:]";
      __int16 v27 = 2112;
      v28 = v23;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      __int16 v32 = v24;
      _os_log_error_impl(&dword_19CC95000, v21, OS_LOG_TYPE_ERROR, "%s Failed to %@ resume timer intent %@%@", buf, 0x2Au);
      if (v12) {
    }
      }
  }
  else
  {
    uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30658]) initWithCode:3 userActivity:0];
    [(__CFString *)v13 setResumedTimers:v10];
    uint64_t v14 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      id v15 = @"handled";
      *(_DWORD *)buf = 136315906;
      v26 = "-[MTPauseResumeTimerIntentHandler _responseToResumeTimerIntent:withResumedTimers:error:dryRun:]";
      __int16 v27 = 2112;
      if (v6) {
        id v15 = @"confirmed";
      }
      v28 = v15;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      __int16 v32 = v13;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ resume timer attribute intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v13;
}

@end