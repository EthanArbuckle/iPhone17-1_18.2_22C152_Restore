@interface MTCreateSingleTimerIntentHandler
- (id)_responseToCreateTimerIntent:(id)a3 withCreatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (void)_createTimerWithIntent:(id)a3 dryRun:(BOOL)a4 completion:(id)a5;
- (void)confirmCreateTimer:(id)a3 completion:(id)a4;
- (void)handleCreateTimer:(id)a3 completion:(id)a4;
- (void)resolveDurationForCreateTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation MTCreateSingleTimerIntentHandler

- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = (NSObject **)MEMORY[0x1E4F30240];
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    v12 = "-[MTCreateSingleTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    v9 = [MEMORY[0x1E4F303B8] notRequired];
    v10 = *v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315650;
      v12 = "-[MTCreateSingleTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]";
      __int16 v13 = 2112;
      id v14 = v5;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_19CC95000, v10, OS_LOG_TYPE_INFO, "%s Handled resolve label for intent: %@ with result: %@", (uint8_t *)&v11, 0x20u);
    }
    v6[2](v6, v9);
  }
}

- (void)resolveDurationForCreateTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = (os_log_t *)MEMORY[0x1E4F30240];
  v9 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    [v6 duration];
    if (v10 <= 0.0)
    {
      int v11 = [MEMORY[0x1E4F307D0] needsValue];
      uint64_t v17 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v25 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
        __int16 v26 = 2112;
        id v27 = v6;
        __int16 v28 = 2112;
        v29 = v11;
        _os_log_impl(&dword_19CC95000, v17, OS_LOG_TYPE_INFO, "%s Handled resolve duration for intent: %@ with result: %@", buf, 0x20u);
      }
      v7[2](v7, v11);
    }
    else
    {
      int v11 = [(MTTimerIntentHandler *)self _timerManager];
      v12 = [v11 timers];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke;
      v21[3] = &unk_1E5914D68;
      id v13 = v6;
      id v22 = v13;
      id v14 = v7;
      v23 = v14;
      id v15 = (id)[v12 addSuccessBlock:v21];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2;
      v18[3] = &unk_1E59156E8;
      id v19 = v13;
      v20 = v14;
      id v16 = (id)[v12 addFailureBlock:v18];
    }
  }
}

void __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [a2 firstObject];
  uint64_t v4 = [v3 state];
  id v5 = (void *)MEMORY[0x1E4F307D0];
  [*(id *)(a1 + 32) duration];
  if (v4 == 3) {
    objc_msgSend(v5, "confirmationRequiredWithTimeIntervalToConfirm:");
  }
  else {
  id v6 = objc_msgSend(v5, "successWithResolvedTimeInterval:");
  }
  v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 136315650;
    double v10 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%s Handled resolve duration for intent: %@ with result: %@", (uint8_t *)&v9, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2_cold_1(a1, (uint64_t)v3, v4);
  }
  id v5 = [MEMORY[0x1E4F307D0] unsupported];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)confirmCreateTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    double v10 = "-[MTCreateSingleTimerIntentHandler confirmCreateTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  if (v7) {
    [(MTCreateSingleTimerIntentHandler *)self _createTimerWithIntent:v6 dryRun:1 completion:v7];
  }
}

- (void)handleCreateTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    double v10 = "-[MTCreateSingleTimerIntentHandler handleCreateTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(MTCreateSingleTimerIntentHandler *)self _createTimerWithIntent:v6 dryRun:0 completion:v7];
}

- (void)_createTimerWithIntent:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = (void (**)(id, void *))a5;
  [v8 duration];
  if (v10 <= 0.0)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 2;
    goto LABEL_8;
  }
  [v8 duration];
  if (v11 >= 86400.0)
  {
    v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = 3;
LABEL_8:
    id v20 = [v18 errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:v19 userInfo:0];
    if (v9)
    {
      v21 = [(MTCreateSingleTimerIntentHandler *)self _responseToCreateTimerIntent:v8 withCreatedTimer:0 error:v20 dryRun:v6];
      v9[2](v9, v21);
    }
    goto LABEL_11;
  }
  if (!v6)
  {
    id v22 = [(MTTimerIntentHandler *)self _timerManager];
    v23 = [v22 timers];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke;
    v38[3] = &unk_1E5915F70;
    id v24 = v8;
    id v39 = v24;
    id v40 = v22;
    id v20 = v22;
    v25 = [v23 flatMap:v38];

    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3;
    v34[3] = &unk_1E5917160;
    __int16 v26 = v9;
    v36 = v26;
    v34[4] = self;
    id v27 = v24;
    id v35 = v27;
    char v37 = 0;
    id v28 = (id)[v25 addSuccessBlock:v34];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4;
    v30[3] = &unk_1E5915FC0;
    v32 = v26;
    v30[4] = self;
    id v31 = v27;
    char v33 = 0;
    id v29 = (id)[v25 addFailureBlock:v30];

LABEL_11:
    goto LABEL_12;
  }
  if (v9)
  {
    id v12 = [MTMutableTimer alloc];
    [v8 duration];
    uint64_t v13 = -[MTTimer initWithState:duration:](v12, "initWithState:duration:", 3);
    id v14 = [v8 label];
    uint64_t v15 = [v14 spokenPhrase];
    [(MTTimer *)v13 setTitle:v15];

    id v16 = MTIntentsTimerForTimer(v13);
    uint64_t v17 = [(MTCreateSingleTimerIntentHandler *)self _responseToCreateTimerIntent:v8 withCreatedTimer:v16 error:0 dryRun:1];
    v9[2](v9, v17);
  }
LABEL_12:
}

id __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (v4)
  {
    [v4 setState:1];
    [*(id *)(a1 + 32) duration];
    objc_msgSend(v4, "setDuration:");
    [v4 setState:3];
    id v5 = [*(id *)(a1 + 40) updateTimer:v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2;
    v9[3] = &unk_1E5915EF8;
    id v10 = v4;
    BOOL v6 = [v5 flatMap:v9];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F7A0D8];
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:4 userInfo:0];
    BOOL v6 = [v7 futureWithError:v5];
  }

  return v6;
}

uint64_t __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2(uint64_t a1)
{
  return [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
}

void __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    MTIntentsTimerForTimer(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v6 = [v4 _responseToCreateTimerIntent:v5 withCreatedTimer:v7 error:0 dryRun:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
  }
}

void __77__MTCreateSingleTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) _responseToCreateTimerIntent:*(void *)(a1 + 40) withCreatedTimer:0 error:a2 dryRun:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (id)_responseToCreateTimerIntent:(id)a3 withCreatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  v41[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F29230] mtUserActivityWithActivityType:@"com.apple.clock.timer"];
  v40[0] = @"identifier";
  uint64_t v13 = [v9 identifier];
  id v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = &stru_1EEDE16C8;
  }
  v40[1] = @"duration";
  v41[0] = v15;
  id v16 = (void *)MEMORY[0x1E4F28ED0];
  [v9 duration];
  uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
  v41[1] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
  [v12 setUserInfo:v18];

  if (v10 && !v11)
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F303B0]) initWithCode:3 userActivity:v12];
    [v19 setCreatedTimer:v10];
    id v20 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      v21 = @"handled";
      int v30 = 136315906;
      id v31 = "-[MTCreateSingleTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
      __int16 v32 = 2112;
      if (v6) {
        v21 = @"confirmed";
      }
      char v33 = v21;
      __int16 v34 = 2112;
      id v35 = v9;
      __int16 v36 = 2112;
      char v37 = v19;
      _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_INFO, "%s Successfully %@ create timer intent %@ with response %@", (uint8_t *)&v30, 0x2Au);
    }
    goto LABEL_20;
  }
  id v22 = [v11 domain];
  if ([v22 isEqualToString:@"MTTimerIntentHandlerErrorDomain"])
  {
    uint64_t v23 = [v11 code];

    if (v23 == 2) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v24 = [v11 domain];
  if ([v24 isEqualToString:@"MTTimerIntentHandlerErrorDomain"])
  {
    uint64_t v25 = [v11 code];

    if (v25 == 3)
    {
      uint64_t v26 = 7;
      goto LABEL_19;
    }
  }
  else
  {
  }
LABEL_18:
  uint64_t v26 = 4;
LABEL_19:
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F303B0]) initWithCode:v26 userActivity:v12];
  id v27 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    id v29 = @"handle";
    int v30 = 136316162;
    id v31 = "-[MTCreateSingleTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
    __int16 v32 = 2112;
    if (v6) {
      id v29 = @"confirm";
    }
    char v33 = v29;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    char v37 = v19;
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_error_impl(&dword_19CC95000, v27, OS_LOG_TYPE_ERROR, "%s Failed to %@ create timer intent %@ with response: %@, error: %@", (uint8_t *)&v30, 0x34u);
  }
LABEL_20:

  return v19;
}

void __81__MTCreateSingleTimerIntentHandler_resolveDurationForCreateTimer_withCompletion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  uint64_t v5 = "-[MTCreateSingleTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%s Failed to fetch timers for intent: %@, error: %@", (uint8_t *)&v4, 0x20u);
}

@end