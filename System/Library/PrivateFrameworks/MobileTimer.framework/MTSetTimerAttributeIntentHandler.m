@interface MTSetTimerAttributeIntentHandler
- (id)_responseToSetTimerAttributeIntent:(id)a3 withUpdatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (void)_updateTimer:(id)a3 toDuration:(double)a4 toLabel:(id)a5 dryRun:(BOOL)a6 completion:(id)a7;
- (void)confirmSetTimerAttribute:(id)a3 completion:(id)a4;
- (void)handleSetTimerAttribute:(id)a3 completion:(id)a4;
- (void)resolveTargetTimerForSetTimerAttribute:(id)a3 withCompletion:(id)a4;
- (void)resolveToDurationForSetTimerAttribute:(id)a3 withCompletion:(id)a4;
@end

@implementation MTSetTimerAttributeIntentHandler

- (void)handleSetTimerAttribute:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[MTSetTimerAttributeIntentHandler handleSetTimerAttribute:completion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v9 = [v6 targetTimer];
  [v6 toDuration];
  double v11 = v10;
  v12 = [v6 toLabel];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__MTSetTimerAttributeIntentHandler_handleSetTimerAttribute_completion___block_invoke;
  v15[3] = &unk_1E5916888;
  id v16 = v6;
  id v17 = v7;
  v15[4] = self;
  id v13 = v6;
  id v14 = v7;
  [(MTSetTimerAttributeIntentHandler *)self _updateTimer:v9 toDuration:v12 toLabel:0 dryRun:v15 completion:v11];
}

void __71__MTSetTimerAttributeIntentHandler_handleSetTimerAttribute_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _responseToSetTimerAttributeIntent:*(void *)(a1 + 40) withUpdatedTimer:a2 error:a3 dryRun:0];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)confirmSetTimerAttribute:(id)a3 completion:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[MTSetTimerAttributeIntentHandler confirmSetTimerAttribute:completion:]";
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  v9 = [v6 targetTimer];
  [v6 toDuration];
  double v11 = v10;
  v12 = [v6 toLabel];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__MTSetTimerAttributeIntentHandler_confirmSetTimerAttribute_completion___block_invoke;
  v15[3] = &unk_1E5916888;
  id v16 = v6;
  id v17 = v7;
  v15[4] = self;
  id v13 = v6;
  id v14 = v7;
  [(MTSetTimerAttributeIntentHandler *)self _updateTimer:v9 toDuration:v12 toLabel:1 dryRun:v15 completion:v11];
}

void __72__MTSetTimerAttributeIntentHandler_confirmSetTimerAttribute_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _responseToSetTimerAttributeIntent:*(void *)(a1 + 40) withUpdatedTimer:a2 error:a3 dryRun:1];
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)resolveToDurationForSetTimerAttribute:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    v15 = "-[MTSetTimerAttributeIntentHandler resolveToDurationForSetTimerAttribute:withCompletion:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl(&dword_19CC95000, v7, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v14, 0x16u);
  }
  if (v6)
  {
    v8 = [v5 toLabel];
    v9 = [v8 spokenPhrase];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      double v11 = 0;
    }
    else
    {
      [v5 toDuration];
      v12 = (void *)MEMORY[0x1E4F307D0];
      if (v13 <= 0.0)
      {
        [MEMORY[0x1E4F307D0] needsValue];
      }
      else
      {
        [v5 toDuration];
        objc_msgSend(v12, "successWithResolvedTimeInterval:");
      double v11 = };
    }
    v6[2](v6, v11);
  }
}

- (void)resolveTargetTimerForSetTimerAttribute:(id)a3 withCompletion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[MTSetTimerAttributeIntentHandler resolveTargetTimerForSetTimerAttribute:withCompletion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [v6 targetTimer];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11D60, &unk_1EEE11D78, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__MTSetTimerAttributeIntentHandler_resolveTargetTimerForSetTimerAttribute_withCompletion___block_invoke;
    v12[3] = &unk_1E59168B0;
    id v13 = v9;
    id v14 = v7;
    id v11 = v9;
    [(MTTimerIntentHandler *)self _genericallyResolveTargetTimer:v11 multiple:0 allowedTimerStatesForFollowup:v10 completion:v12];
  }
}

void __90__MTSetTimerAttributeIntentHandler_resolveTargetTimerForSetTimerAttribute_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (v16)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F30720]) initWithTimerResolutionResult:v16];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    goto LABEL_14;
  }
  v8 = [v5 domain];
  int v9 = [v8 isEqualToString:@"MTTimerIntentHandlerErrorDomain"];

  if (!v9)
  {
    uint64_t v13 = [MEMORY[0x1E4F30720] unsupported];
LABEL_12:
    id v7 = (void *)v13;
    goto LABEL_13;
  }
  unint64_t v10 = [v5 code];
  if (v10 >= 5)
  {
    if (v10 - 5 >= 2)
    {
      if (v10 != 7)
      {
        id v7 = 0;
        goto LABEL_13;
      }
      id v14 = (void *)MEMORY[0x1E4F30720];
      uint64_t v15 = 2;
    }
    else
    {
      id v14 = (void *)MEMORY[0x1E4F30720];
      uint64_t v15 = 1;
    }
    uint64_t v13 = [v14 unsupportedForReason:v15];
    goto LABEL_12;
  }
  id v11 = objc_alloc(MEMORY[0x1E4F30720]);
  v12 = [MEMORY[0x1E4F307E0] successWithResolvedTimer:*(void *)(a1 + 32)];
  id v7 = (void *)[v11 initWithTimerResolutionResult:v12];

LABEL_13:
  (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7);
LABEL_14:
}

- (id)_responseToSetTimerAttributeIntent:(id)a3 withUpdatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (!v10 || v11)
  {
    id v16 = [v11 domain];
    int v17 = [v16 isEqualToString:@"MTTimerIntentHandlerErrorDomain"];

    if (!v17
      || (uint64_t v18 = [v12 code], (unint64_t)(v18 - 5) > 3)
      || (uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30718]) initWithCode:qword_19CD53D58[v18 - 5] userActivity:0]) == 0)
    {
      uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30718]) initWithCode:4 userActivity:0];
    }
    uint64_t v19 = (id)*MEMORY[0x1E4F30240];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v21 = v6 ? @"confirm" : @"handle";
      if (v12)
      {
        uint64_t v22 = [NSString stringWithFormat:@"due to error %@", v12];
      }
      else
      {
        uint64_t v22 = &stru_1EEDE16C8;
      }
      *(_DWORD *)buf = 136315906;
      v24 = "-[MTSetTimerAttributeIntentHandler _responseToSetTimerAttributeIntent:withUpdatedTimer:error:dryRun:]";
      __int16 v25 = 2112;
      v26 = v21;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      v30 = v22;
      _os_log_error_impl(&dword_19CC95000, v19, OS_LOG_TYPE_ERROR, "%s Failed to %@ set timer attribute intent %@%@", buf, 0x2Au);
      if (v12) {
    }
      }
  }
  else
  {
    uint64_t v13 = (__CFString *)[objc_alloc(MEMORY[0x1E4F30718]) initWithCode:3 userActivity:0];
    [(__CFString *)v13 setUpdatedTimer:v10];
    id v14 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = @"handled";
      *(_DWORD *)buf = 136315906;
      v24 = "-[MTSetTimerAttributeIntentHandler _responseToSetTimerAttributeIntent:withUpdatedTimer:error:dryRun:]";
      __int16 v25 = 2112;
      if (v6) {
        uint64_t v15 = @"confirmed";
      }
      v26 = v15;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ set timer attribute intent %@ with response %@", buf, 0x2Au);
    }
  }

  return v13;
}

- (void)_updateTimer:(id)a3 toDuration:(double)a4 toLabel:(id)a5 dryRun:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__MTSetTimerAttributeIntentHandler__updateTimer_toDuration_toLabel_dryRun_completion___block_invoke;
  v16[3] = &unk_1E59168D8;
  BOOL v21 = v8;
  id v17 = v13;
  id v18 = v12;
  uint64_t v19 = self;
  double v20 = a4;
  id v14 = v12;
  id v15 = v13;
  [(MTUpdateTimerIntentHandler *)self _updateTimer:v14 dryRun:v8 updateBlock:v16 completion:a7];
}

id __86__MTSetTimerAttributeIntentHandler__updateTimer_toDuration_toLabel_dryRun_completion___block_invoke(uint64_t a1, void *a2)
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 state];
  [v3 setState:1];
  id v5 = [v3 title];
  BOOL v6 = [v5 lowercaseString];

  id v7 = [*(id *)(a1 + 32) spokenPhrase];
  BOOL v8 = [v7 lowercaseString];

  uint64_t v9 = [v8 length];
  if (v6 == v8)
  {
    char v10 = [v6 isEqualToString:v6];
    if (!v9) {
      goto LABEL_10;
    }
  }
  else
  {
    char v10 = 0;
    if (!v9) {
      goto LABEL_10;
    }
  }
  if ((v10 & 1) == 0)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    id v12 = NSString;
    if (*(unsigned char *)(a1 + 64)) {
      id v13 = @" (dry-run)";
    }
    else {
      id v13 = &stru_1EEDE16C8;
    }
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 48) _timerManager];
    id v16 = [v12 stringWithFormat:@"Failed to update%@ timer %@ from timer manager %@ - renaming from %@ to %@ is not supported.", v13, v14, v15, v6, v8];
    v36[0] = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    id v18 = v11;
    uint64_t v19 = 8;
    goto LABEL_21;
  }
LABEL_10:
  double v20 = *(double *)(a1 + 56);
  if (v20 <= 0.0)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v23 = NSString;
    if (*(unsigned char *)(a1 + 64)) {
      v24 = @" (dry-run)";
    }
    else {
      v24 = &stru_1EEDE16C8;
    }
    uint64_t v25 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 48) _timerManager];
    id v16 = [v23 stringWithFormat:@"Failed to update%@ timer %@ from timer manager %@ due to invalid duration %f", v24, v25, v15, *(void *)(a1 + 56)];
    v34 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v18 = v22;
    uint64_t v19 = 2;
  }
  else
  {
    if (v20 < 86400.0)
    {
      objc_msgSend(v3, "setDuration:");
      [v3 setState:v4];
      BOOL v21 = 0;
      goto LABEL_22;
    }
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    __int16 v27 = NSString;
    if (*(unsigned char *)(a1 + 64)) {
      id v28 = @" (dry-run)";
    }
    else {
      id v28 = &stru_1EEDE16C8;
    }
    uint64_t v29 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 48) _timerManager];
    id v16 = [v27 stringWithFormat:@"Failed to update%@ timer %@ from timer manager %@ due to invalid duration %f", v28, v29, v15, *(void *)(a1 + 56)];
    v32 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v18 = v26;
    uint64_t v19 = 3;
  }
LABEL_21:
  BOOL v21 = [v18 errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:v19 userInfo:v17];

LABEL_22:
  return v21;
}

@end