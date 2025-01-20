@interface MTUpdateTimerIntentHandler
- (id)_timerFromIntentTargetTimer:(id)a3 defaultState:(int64_t)a4;
- (void)_updateTimer:(id)a3 dryRun:(BOOL)a4 allowMultiple:(BOOL)a5 excludeStoppedTimers:(BOOL)a6 filterBlock:(id)a7 updateBlock:(id)a8 completion:(id)a9;
- (void)_updateTimer:(id)a3 dryRun:(BOOL)a4 updateBlock:(id)a5 completion:(id)a6;
@end

@implementation MTUpdateTimerIntentHandler

- (void)_updateTimer:(id)a3 dryRun:(BOOL)a4 updateBlock:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__MTUpdateTimerIntentHandler__updateTimer_dryRun_updateBlock_completion___block_invoke;
  v12[3] = &unk_1E5917A88;
  id v13 = v10;
  id v11 = v10;
  [(MTUpdateTimerIntentHandler *)self _updateTimer:a3 dryRun:v7 allowMultiple:0 excludeStoppedTimers:1 filterBlock:0 updateBlock:a5 completion:v12];
}

void __73__MTUpdateTimerIntentHandler__updateTimer_dryRun_updateBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a3;
    id v6 = [a2 firstObject];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

- (void)_updateTimer:(id)a3 dryRun:(BOOL)a4 allowMultiple:(BOOL)a5 excludeStoppedTimers:(BOOL)a6 filterBlock:(id)a7 updateBlock:(id)a8 completion:(id)a9
{
  BOOL v11 = a6;
  BOOL v13 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  id v18 = a9;
  v19 = [(MTTimerIntentHandler *)self _timerManager];
  v20 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    v21 = &stru_1EEDE16C8;
    *(_DWORD *)buf = 136315906;
    v47 = "-[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:completion:]";
    if (v13) {
      v21 = @" (dry-run)";
    }
    __int16 v48 = 2112;
    v49 = v21;
    __int16 v50 = 2112;
    id v51 = v15;
    __int16 v52 = 2112;
    v53 = v19;
    _os_log_impl(&dword_19CC95000, v20, OS_LOG_TYPE_INFO, "%s Updating%@ timer %@ from timer manager %@", buf, 0x2Au);
  }
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke;
  v41[3] = &unk_1E59167C8;
  BOOL v45 = v13;
  id v22 = v15;
  id v42 = v22;
  id v23 = v19;
  id v43 = v23;
  id v24 = v18;
  id v44 = v24;
  v25 = (void *)MEMORY[0x19F3A0FB0](v41);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_6;
  v32[3] = &unk_1E5917B28;
  v32[4] = self;
  id v33 = v22;
  BOOL v39 = a5;
  BOOL v40 = v13;
  id v34 = v23;
  id v35 = v16;
  id v36 = v25;
  id v37 = v17;
  id v38 = v24;
  id v26 = v24;
  id v27 = v17;
  id v28 = v23;
  id v29 = v22;
  id v30 = v25;
  id v31 = v16;
  [(MTTimerIntentHandler *)self _matchTimersFromIntentsTimer:v29 excludeStoppedTimers:v11 completion:v32];
}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 56);
  if (!v10) {
    goto LABEL_14;
  }
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2;
  v46[3] = &unk_1E5917AB0;
  id v47 = v10;
  BOOL v11 = [v7 indexesOfObjectsPassingTest:v46];

  if (v11)
  {
    id v12 = [v7 objectsAtIndexes:v11];
    if (!v9) {
      goto LABEL_4;
    }
  }
  else
  {
LABEL_14:
    id v12 = v7;
    BOOL v11 = 0;
    if (!v9)
    {
LABEL_4:
      id v33 = [*(id *)(a1 + 32) _onlyUnnamedTimerInTimers:v12 forTargetTimer:*(void *)(a1 + 40) allowMultiple:*(unsigned __int8 *)(a1 + 88)];
      if (v33)
      {
        BOOL v13 = *MEMORY[0x1E4F30240];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filte"
                               "rBlock:updateBlock:completion:]_block_invoke";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v33;
          _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "%s Filtering timer for update to single unnamed timer: %@", buf, 0x16u);
        }
        v54[0] = v33;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];

        id v12 = (id)v14;
      }
      if (*(unsigned char *)(a1 + 88) || (unint64_t)[v12 count] < 2)
      {
        if ([v12 count])
        {
          v21 = (void *)MEMORY[0x1E4F1CA48];
          id v22 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
          id v23 = [v21 arrayWithObject:v22];

          id v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v12, "count"));
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v49 = __Block_byref_object_copy__13;
          __int16 v50 = __Block_byref_object_dispose__13;
          id v51 = 0;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_16;
          v39[3] = &unk_1E5917AD8;
          id v43 = *(id *)(a1 + 72);
          id v44 = buf;
          char v45 = *(unsigned char *)(a1 + 89);
          id v18 = v23;
          id v40 = v18;
          id v41 = *(id *)(a1 + 48);
          id v25 = v24;
          id v42 = v25;
          [v12 enumerateObjectsUsingBlock:v39];
          if (*(void *)(*(void *)&buf[8] + 40))
          {
            (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          }
          else
          {
            id v27 = (void *)MEMORY[0x1E4F7A0D8];
            id v28 = [MEMORY[0x1E4F7A0F0] immediateScheduler];
            id v29 = [v27 combineAllFutures:v18 scheduler:v28];

            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2_19;
            v36[3] = &unk_1E5917B00;
            id v38 = *(id *)(a1 + 80);
            id v37 = v25;
            id v30 = (id)[v29 addSuccessBlock:v36];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_4;
            v34[3] = &unk_1E5914D18;
            id v35 = *(id *)(a1 + 64);
            id v31 = (id)[v29 addFailureBlock:v34];
          }
          _Block_object_dispose(buf, 8);
        }
        else if ([v12 count] || !objc_msgSend(v7, "count"))
        {
          uint64_t v26 = *(void *)(a1 + 80);
          if (!v26)
          {
LABEL_25:

            goto LABEL_26;
          }
          id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:5 userInfo:0];
          (*(void (**)(uint64_t, void, id))(v26 + 16))(v26, 0, v18);
        }
        else
        {
          uint64_t v32 = *(void *)(a1 + 80);
          if (!v32) {
            goto LABEL_25;
          }
          id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:6 userInfo:0];
          (*(void (**)(uint64_t, void, id))(v32 + 16))(v32, 0, v18);
        }
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 64);
        id v16 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        if (*(unsigned char *)(a1 + 89)) {
          id v17 = @" (dry-run)";
        }
        else {
          id v17 = &stru_1EEDE16C8;
        }
        id v18 = [NSString stringWithFormat:@"Failed to update%@ timer %@ from timer manager %@ due to ambiguity between timers %@", v17, *(void *)(a1 + 40), *(void *)(a1 + 48), v12];
        id v53 = v18;
        v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
        v20 = [v16 errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:1 userInfo:v19];
        (*(void (**)(uint64_t, void *))(v15 + 16))(v15, v20);
      }
      goto LABEL_25;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_26:
}

uint64_t __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_16(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 mutableCopy];
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v14 = v6;
  if (v7)
  {
    uint64_t v8 = (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    uint64_t v6 = v14;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    *a4 = 1;
  }
  else
  {
    if (!*(unsigned char *)(a1 + 72))
    {
      BOOL v11 = *(void **)(a1 + 32);
      id v12 = [*(id *)(a1 + 40) updateTimer:v6];
      [v11 addObject:v12];

      uint64_t v6 = v14;
    }
    [*(id *)(a1 + 48) addObject:v6];
  }
  return MEMORY[0x1F4181820]();
}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_2_19(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) sortUsingComparator:MTTimerIntentResultsComparator];
    objc_msgSend(*(id *)(a1 + 32), "na_map:", &__block_literal_global_36);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

uint64_t __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_timerFromIntentTargetTimer:(id)a3 defaultState:(int64_t)a4
{
  id v5 = a3;
  uint64_t v6 = 2 * ([v5 type] == 2);
  id v7 = objc_alloc(MEMORY[0x1E4F307D8]);
  uint64_t v8 = [v5 label];
  [v5 duration];
  double v10 = v9;
  [v5 remainingTime];
  double v12 = v11;
  BOOL v13 = [v5 identifier];

  uint64_t v14 = (void *)[v7 initWithLabel:v8 duration:v13 remainingTime:a4 identifier:v6 state:v10 type:v12];
  return v14;
}

void __120__MTUpdateTimerIntentHandler__updateTimer_dryRun_allowMultiple_excludeStoppedTimers_filterBlock_updateBlock_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = @" (dry-run)";
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  if (!*(unsigned char *)(a1 + 56)) {
    id v3 = &stru_1EEDE16C8;
  }
  int v6 = 136316162;
  id v7 = "-[MTUpdateTimerIntentHandler _updateTimer:dryRun:allowMultiple:excludeStoppedTimers:filterBlock:updateBlock:compl"
       "etion:]_block_invoke";
  __int16 v8 = 2112;
  double v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%s Failed to update%@ timer %@ from timer manager %@ due to error %@", (uint8_t *)&v6, 0x34u);
}

@end