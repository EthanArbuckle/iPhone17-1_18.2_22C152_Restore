@interface MTSearchTimerIntentHandler
- (void)handleSearchForTimers:(id)a3 completion:(id)a4;
@end

@implementation MTSearchTimerIntentHandler

- (void)handleSearchForTimers:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[MTSearchTimerIntentHandler handleSearchForTimers:completion:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    if ([v6 type] == 2)
    {
      v9 = 0;
    }
    else
    {
      v9 = [v6 label];
    }
    uint64_t v10 = 2 * ([v6 type] == 2);
    id v11 = objc_alloc(MEMORY[0x1E4F307D8]);
    [v6 duration];
    v13 = objc_msgSend(v11, "initWithLabel:duration:remainingTime:identifier:state:type:", v9, 0, objc_msgSend(v6, "state"), v10, v12, -1.0);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke;
    v14[3] = &unk_1E5917B70;
    v14[4] = self;
    id v15 = v6;
    id v16 = v7;
    [(MTTimerIntentHandler *)self _matchTimersFromIntentsTimer:v13 excludeStoppedTimers:1 completion:v14];
  }
}

void __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v9 domain];
  if ([v10 isEqualToString:@"MTTimerIntentHandlerErrorDomain"])
  {
    if ([v9 code] == 5 || objc_msgSend(v9, "code") == 6)
    {

LABEL_12:
      double v12 = [v7 sortedArrayUsingComparator:MTTimerIntentResultsComparator];
      v14 = objc_msgSend(v12, "na_map:", &__block_literal_global_37);
      if (v8)
      {
        id v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEE11E20, &unk_1EEE11E38, 0);
        if ((unint64_t)[v8 count] <= 1)
        {
          id v16 = v8;
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "_alternateTimersForTargetTimerState:type:inTimers:allowedTimerStates:", objc_msgSend(*(id *)(a1 + 40), "state"), objc_msgSend(*(id *)(a1 + 40), "type"), v8, v15);
          id v16 = (id)objc_claimAutoreleasedReturnValue();
        }
        v18 = v16;
        if ([v16 count])
        {
          __int16 v19 = [v18 sortedArrayUsingComparator:MTTimerIntentResultsComparator];
          v17 = objc_msgSend(v19, "na_map:", &__block_literal_global_7_0);
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
      id v20 = (void *)[objc_alloc(MEMORY[0x1E4F306C0]) initWithCode:3 userActivity:0];
      [v20 setMatchedTimers:v14];
      [v20 setUnmatchedTimers:v17];
      uint64_t v21 = *MEMORY[0x1E4F30240];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
      {
        uint64_t v22 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        v24 = "-[MTSearchTimerIntentHandler handleSearchForTimers:completion:]_block_invoke_2";
        __int16 v25 = 2112;
        uint64_t v26 = v22;
        __int16 v27 = 2112;
        v28 = v20;
        _os_log_impl(&dword_19CC95000, v21, OS_LOG_TYPE_INFO, "%s Successfully handled search timers intent: %@ with response %@", buf, 0x20u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

      goto LABEL_24;
    }
    BOOL v11 = [v9 code] == 7;
  }
  else
  {
    BOOL v11 = 0;
  }

  if (v7 || v11) {
    goto LABEL_12;
  }
  double v12 = (void *)[objc_alloc(MEMORY[0x1E4F306C0]) initWithCode:4 userActivity:0];
  v13 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_cold_1(a1, (uint64_t)v9, v13);
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_24:
}

id __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

id __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_5(uint64_t a1, void *a2)
{
  return MTIntentsTimerForTimer(a2);
}

void __63__MTSearchTimerIntentHandler_handleSearchForTimers_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 136315650;
  v5 = "-[MTSearchTimerIntentHandler handleSearchForTimers:completion:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_19CC95000, log, OS_LOG_TYPE_ERROR, "%s Failed to handle search timers with intent: %@ due to error %@", (uint8_t *)&v4, 0x20u);
}

@end