@interface MTCreateTimerIntentHandler
- (BOOL)_isPlayingMediaFromMRPlaybackState:(unsigned int)a3;
- (BOOL)_timer:(id)a3 conflictsWithRunningTimersInTimers:(id)a4;
- (id)_responseToCreateTimerIntent:(id)a3 withCreatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6;
- (void)_checkNowPlayingMediaState:(id)a3;
- (void)_createTimerWithIntent:(id)a3 dryRun:(BOOL)a4 completion:(id)a5;
- (void)confirmCreateTimer:(id)a3 completion:(id)a4;
- (void)handleCreateTimer:(id)a3 completion:(id)a4;
- (void)resolveDurationForCreateTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4;
- (void)resolveTypeForCreateTimer:(id)a3 withCompletion:(id)a4;
@end

@implementation MTCreateTimerIntentHandler

- (void)resolveLabelForCreateTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "-[MTCreateTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]";
    __int16 v35 = 2112;
    id v36 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    v9 = [(MTTimerIntentHandler *)self _timerManager];
    v10 = [MTMutableTimer alloc];
    [v6 duration];
    v11 = -[MTTimer initWithState:duration:](v10, "initWithState:duration:", 3);
    if ([v6 type] == 2)
    {
      v12 = 0;
    }
    else
    {
      v13 = [v6 label];
      v12 = [v13 spokenPhrase];
    }
    [(MTTimer *)v11 setTitle:v12];
    if ([v6 type]) {
      uint64_t v14 = [v6 type];
    }
    else {
      uint64_t v14 = 1;
    }
    v31 = @"MTTimerIntentSupportSiriContextTimerTypeKey";
    v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
    v32 = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    [(MTTimer *)v11 setSiriContext:v16];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke;
    v25[3] = &unk_1E5915E08;
    id v17 = v9;
    id v26 = v17;
    id v18 = v6;
    id v27 = v18;
    v28 = self;
    v19 = v11;
    v29 = v19;
    id v20 = v7;
    id v30 = v20;
    v21 = (void (**)(void))MEMORY[0x19F3A0FB0](v25);
    if ([v18 type] == 2)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_7;
      v22[3] = &unk_1E5915E30;
      v23 = v21;
      id v24 = v20;
      [(MTCreateTimerIntentHandler *)self _checkNowPlayingMediaState:v22];
    }
    else
    {
      v21[2](v21);
    }
  }
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_2;
  v11[3] = &unk_1E5915DE0;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v5 = *(void **)(a1 + 56);
  id v12 = v3;
  uint64_t v13 = v4;
  id v14 = v5;
  id v15 = *(id *)(a1 + 64);
  id v6 = (id)[v2 addSuccessBlock:v11];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4;
  v8[3] = &unk_1E59156E8;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 64);
  id v7 = (id)[v2 addFailureBlock:v8];
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 label];

  int v6 = [*(id *)(a1 + 40) _timer:*(void *)(a1 + 48) conflictsWithRunningTimersInTimers:v4];
  if (v5)
  {
    if (v6 && [*(id *)(a1 + 48) type] == 1)
    {
      id v7 = (void *)MEMORY[0x1E4F303B8];
      v8 = [*(id *)(a1 + 32) label];
      uint64_t v9 = [v7 confirmationRequiredWithStringToConfirm:v8];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F303B8];
      v8 = [*(id *)(a1 + 32) label];
      uint64_t v9 = [v10 successWithResolvedString:v8];
    }
    v11 = (void *)v9;
  }
  else
  {
    if (v6 && [*(id *)(a1 + 48) type] == 1)
    {
      uint64_t v12 = [MEMORY[0x1E4F303B8] resolutionResultUnsupportedWithReason:1];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F303B8] notRequired];
    }
    v11 = (void *)v12;
  }
  uint64_t v13 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = 136315650;
    v16 = "-[MTCreateTimerIntentHandler resolveLabelForCreateTimer:withCompletion:]_block_invoke_2";
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v11;
    _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "%s Handled resolve label for intent: %@ with result: %@", (uint8_t *)&v15, 0x20u);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4_cold_1();
  }
  id v4 = [MEMORY[0x1E4F303B8] unsupported];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_7(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (void *)MEMORY[0x1E4F303B8];
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F30750]) initWithSpokenPhrase:&stru_1EEDE16C8];
    v5 = [v4 successWithResolvedString:v6];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
}

- (void)resolveDurationForCreateTimer:(id)a3 withCompletion:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = (os_log_t *)MEMORY[0x1E4F30240];
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "-[MTCreateTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
    __int16 v22 = 2112;
    id v23 = v5;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v20, 0x16u);
  }
  if (v6)
  {
    uint64_t v9 = [MTMutableTimer alloc];
    [v5 duration];
    id v10 = -[MTTimer initWithState:duration:](v9, "initWithState:duration:", 3);
    if ([v5 type] == 2)
    {
      v11 = 0;
    }
    else
    {
      uint64_t v12 = [v5 label];
      v11 = [v12 spokenPhrase];
    }
    if ([v5 type] == 2)
    {
      uint64_t v13 = +[MTSound toneSoundWithIdentifier:*MEMORY[0x1E4FAF638] vibrationIdentifer:0 volume:0];
      [(MTTimer *)v10 setSound:v13];
    }
    [(MTTimer *)v10 setTitle:v11];
    if ([v5 type]) {
      uint64_t v14 = [v5 type];
    }
    else {
      uint64_t v14 = 1;
    }
    id v26 = @"MTTimerIntentSupportSiriContextTimerTypeKey";
    int v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
    v27[0] = v15;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [(MTTimer *)v10 setSiriContext:v16];

    [v5 duration];
    if (v17 <= 0.0)
    {
      uint64_t v18 = [MEMORY[0x1E4F307D0] needsValue];
      __int16 v19 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        int v20 = 136315650;
        uint64_t v21 = "-[MTCreateTimerIntentHandler resolveDurationForCreateTimer:withCompletion:]";
        __int16 v22 = 2112;
        id v23 = v5;
        __int16 v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_19CC95000, v19, OS_LOG_TYPE_INFO, "%s Handled resolve duration for intent: %@ with result: %@", (uint8_t *)&v20, 0x20u);
      }
    }
    else
    {
      uint64_t v18 = objc_msgSend(MEMORY[0x1E4F307D0], "successWithResolvedTimeInterval:");
    }
    v6[2](v6, v18);
  }
}

- (void)resolveTypeForCreateTimer:(id)a3 withCompletion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (os_log_t *)MEMORY[0x1E4F30240];
  uint64_t v9 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MTCreateTimerIntentHandler resolveTypeForCreateTimer:withCompletion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_19CC95000, v9, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  if (v7)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v31 = __Block_byref_object_copy__3;
    v32 = __Block_byref_object_dispose__3;
    objc_msgSend(MEMORY[0x1E4F307E8], "successWithResolvedTimerType:", objc_msgSend(v6, "type"));
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke;
    v19[3] = &unk_1E5915E80;
    id v10 = v6;
    id v20 = v10;
    uint64_t v21 = self;
    id v23 = buf;
    id v11 = v7;
    id v22 = v11;
    uint64_t v12 = (void *)MEMORY[0x19F3A0FB0](v19);
    if ([v10 type] == 2)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_3;
      v15[3] = &unk_1E5915EA8;
      id v17 = v12;
      id v18 = v11;
      id v16 = v10;
      [(MTCreateTimerIntentHandler *)self _checkNowPlayingMediaState:v15];
    }
    else
    {
      uint64_t v13 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)__int16 v24 = 136315650;
        v25 = "-[MTCreateTimerIntentHandler resolveTypeForCreateTimer:withCompletion:]";
        __int16 v26 = 2112;
        id v27 = v10;
        __int16 v28 = 2112;
        uint64_t v29 = v14;
        _os_log_impl(&dword_19CC95000, v13, OS_LOG_TYPE_INFO, "%s Handled resolve type for intent: %@ with result: %@", v24, 0x20u);
      }
      (*((void (**)(id, void))v11 + 2))(v11, *(void *)(*(void *)&buf[8] + 40));
    }

    _Block_object_dispose(buf, 8);
  }
}

void __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F307D8]), "initWithLabel:duration:remainingTime:identifier:state:type:", 0, 0, 0, objc_msgSend(*(id *)(a1 + 32), "type"), -1.0, -1.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_2;
  v4[3] = &unk_1E5915E58;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v3 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 48);
  [v3 _matchTimersFromIntentsTimer:v2 excludeStoppedTimers:1 completion:v4];
}

uint64_t __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F307E8], "confirmationRequiredWithTimerTypeToConfirm:", objc_msgSend(*(id *)(a1 + 32), "type"));
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(id *)(v6 + 40);
    id v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v7;
  }

  v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v8();
}

void __71__MTCreateTimerIntentHandler_resolveTypeForCreateTimer_withCompletion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E4F307E8], "successWithResolvedTimerType:", objc_msgSend(*(id *)(a1 + 32), "type"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

- (void)confirmCreateTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[MTCreateTimerIntentHandler confirmCreateTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  if (v7) {
    [(MTCreateTimerIntentHandler *)self _createTimerWithIntent:v6 dryRun:1 completion:v7];
  }
}

- (void)handleCreateTimer:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[MTCreateTimerIntentHandler handleCreateTimer:completion:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19CC95000, v8, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v9, 0x16u);
  }
  [(MTCreateTimerIntentHandler *)self _createTimerWithIntent:v6 dryRun:0 completion:v7];
}

- (void)_checkNowPlayingMediaState:(id)a3
{
  id v4 = a3;
  id v5 = dispatch_get_global_queue(25, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MTCreateTimerIntentHandler__checkNowPlayingMediaState___block_invoke;
  v10[3] = &unk_1E5915ED0;
  v10[4] = self;
  id v6 = v4;
  id v11 = v6;
  id v7 = v5;
  v8 = v10;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  int v9 = (void (*)(id, void *))getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr;
  id v16 = getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr;
  if (!getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_ptr)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke;
    v12[3] = &unk_1E5914EC0;
    v12[4] = &v13;
    __getMRMediaRemoteGetNowPlayingApplicationPlaybackStateSymbolLoc_block_invoke((uint64_t)v12);
    int v9 = (void (*)(id, void *))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v9) {
    -[MTCreateTimerIntentHandler _checkNowPlayingMediaState:]();
  }
  v9(v7, v8);
}

uint64_t __57__MTCreateTimerIntentHandler__checkNowPlayingMediaState___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _isPlayingMediaFromMRPlaybackState:a2];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_createTimerWithIntent:(id)a3 dryRun:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke;
  v26[3] = &unk_1E5915FE8;
  v26[4] = self;
  id v10 = (void *)MEMORY[0x19F3A0FB0](v26);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3_30;
  v20[3] = &unk_1E5916010;
  id v11 = v8;
  id v21 = v11;
  id v12 = v9;
  id v22 = self;
  id v23 = v12;
  BOOL v25 = a4;
  id v13 = v10;
  id v24 = v13;
  uint64_t v14 = (void (**)(void))MEMORY[0x19F3A0FB0](v20);
  if ([v11 type] == 2)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4_31;
    v15[3] = &unk_1E5916038;
    id v17 = v14;
    id v18 = v12;
    void v15[4] = self;
    id v16 = v11;
    BOOL v19 = a4;
    [(MTCreateTimerIntentHandler *)self _checkNowPlayingMediaState:v15];
  }
  else
  {
    v14[2](v14);
  }
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = [MTMutableTimer alloc];
  [v7 duration];
  id v10 = -[MTTimer initWithState:duration:](v9, "initWithState:duration:", 3);
  if ([v7 type] == 2)
  {
    id v11 = 0;
  }
  else
  {
    id v12 = [v7 label];
    id v11 = [v12 spokenPhrase];
  }
  if ([v7 type] == 2)
  {
    id v13 = +[MTSound toneSoundWithIdentifier:*MEMORY[0x1E4FAF638] vibrationIdentifer:0 volume:0];
    [(MTTimer *)v10 setSound:v13];
  }
  [(MTTimer *)v10 setTitle:v11];
  if ([v7 type]) {
    uint64_t v14 = [v7 type];
  }
  else {
    uint64_t v14 = 1;
  }
  v47 = @"MTTimerIntentSupportSiriContextTimerTypeKey";
  uint64_t v15 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
  v48[0] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
  [(MTTimer *)v10 setSiriContext:v16];

  if (!a3)
  {
    id v20 = [*(id *)(a1 + 32) _timerManager];
    v32 = [v20 addTimer:v10];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2;
    v45[3] = &unk_1E5915EF8;
    id v21 = v20;
    id v46 = v21;
    id v33 = [v32 flatMap:v45];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3;
    v42[3] = &unk_1E5915F70;
    v43 = v10;
    id v44 = v21;
    id v19 = v21;
    id v22 = [v33 flatMap:v42];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_26;
    v38[3] = &unk_1E5915F98;
    id v23 = v8;
    uint64_t v24 = *(void *)(a1 + 32);
    id v40 = v23;
    v38[4] = v24;
    id v25 = v8;
    id v26 = v7;
    id v39 = v26;
    char v41 = 0;
    id v27 = (id)[v22 addSuccessBlock:v38];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2_28;
    v34[3] = &unk_1E5915FC0;
    id v28 = v23;
    uint64_t v29 = *(void *)(a1 + 32);
    id v18 = v32;
    id v36 = v28;
    v34[4] = v29;
    id v30 = v26;
    id v8 = v25;
    id v35 = v30;
    char v37 = 0;
    id v31 = (id)[v22 addFailureBlock:v34];

    goto LABEL_13;
  }
  if (v8)
  {
    id v17 = *(void **)(a1 + 32);
    id v18 = MTIntentsTimerForTimer(v10);
    id v19 = [v17 _responseToCreateTimerIntent:v7 withCreatedTimer:v18 error:0 dryRun:1];
    (*((void (**)(id, id))v8 + 2))(v8, v19);
LABEL_13:
  }
}

uint64_t __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) timers];
}

id __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4;
  v18[3] = &unk_1E5915F20;
  id v19 = *(id *)(a1 + 32);
  id v4 = objc_msgSend(v3, "na_firstObjectPassingTest:", v18);
  if (v4)
  {
    id v5 = dispatch_get_global_queue(25, 0);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_5;
    uint64_t v14 = &unk_1E5915078;
    id v15 = v3;
    id v6 = v4;
    id v16 = v6;
    id v17 = *(id *)(a1 + 40);
    dispatch_async(v5, &v11);

    id v7 = objc_msgSend(MEMORY[0x1E4F7A0D8], "futureWithResult:", v6, v11, v12, v13, v14);

    id v8 = v15;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F7A0D8];
    id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:4 userInfo:0];
    id v7 = [v9 futureWithError:v8];
  }

  return v7;
}

uint64_t __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = [a2 timerID];
  id v4 = [*(id *)(a1 + 32) timerID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_6;
  v13[3] = &unk_1E5915F48;
  v2 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v3 = objc_msgSend(v2, "na_firstObjectPassingTest:", v13);
  if (v3)
  {
    id v4 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[MTCreateTimerIntentHandler _createTimerWithIntent:dryRun:completion:]_block_invoke_5";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_19CC95000, v4, OS_LOG_TYPE_INFO, "%s Attempting to remove conflicting timer: %@", buf, 0x16u);
    }
    uint64_t v5 = [*(id *)(a1 + 48) removeTimer:v3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_20;
    v11[3] = &unk_1E59155D8;
    id v6 = v3;
    id v12 = v6;
    id v7 = (id)[v5 addSuccessBlock:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22;
    v9[3] = &unk_1E5915AA8;
    id v10 = v6;
    id v8 = (id)[v5 addFailureBlock:v9];
  }
}

BOOL __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_6(uint64_t a1, void *a2)
{
  return MTTimerConflictsWithTimer(*(void **)(a1 + 32), a2);
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_20(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 136315394;
    uint64_t v5 = "-[MTCreateTimerIntentHandler _createTimerWithIntent:dryRun:completion:]_block_invoke";
    __int16 v6 = 2112;
    uint64_t v7 = v3;
    _os_log_impl(&dword_19CC95000, v2, OS_LOG_TYPE_INFO, "%s Successfully removed conflicting timer: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR)) {
    __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22_cold_1();
  }
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    int v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    MTIntentsTimerForTimer(a2);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v6 = [v4 _responseToCreateTimerIntent:v5 withCreatedTimer:v7 error:0 dryRun:*(unsigned __int8 *)(a1 + 56)];
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
  }
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_2_28(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) _responseToCreateTimerIntent:*(void *)(a1 + 40) withCreatedTimer:0 error:a2 dryRun:*(unsigned __int8 *)(a1 + 56)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

uint64_t __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_3_30(uint64_t a1)
{
  [*(id *)(a1 + 32) duration];
  if (v2 <= 0.0)
  {
    __int16 v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = 2;
  }
  else
  {
    [*(id *)(a1 + 32) duration];
    if (v3 < 86400.0)
    {
      int v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
      return v4();
    }
    __int16 v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = 3;
  }
  uint64_t v8 = [v6 errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:v7 userInfo:0];
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    uint64_t v12 = v8;
    uint64_t v11 = [*(id *)(a1 + 40) _responseToCreateTimerIntent:*(void *)(a1 + 32) withCreatedTimer:0 error:v8 dryRun:*(unsigned __int8 *)(a1 + 64)];
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

    uint64_t v9 = v12;
  }
  return MEMORY[0x1F41817F8](v8, v9);
}

uint64_t __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_4_31(uint64_t a1, int a2)
{
  if (a2)
  {
    double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MTTimerIntentHandlerErrorDomain" code:10 userInfo:0];
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      uint64_t v9 = v5;
      uint64_t v8 = [*(id *)(a1 + 32) _responseToCreateTimerIntent:*(void *)(a1 + 40) withCreatedTimer:0 error:v5 dryRun:*(unsigned __int8 *)(a1 + 64)];
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

      uint64_t v6 = v9;
    }
    return MEMORY[0x1F41817F8](v5, v6);
  }
}

- (id)_responseToCreateTimerIntent:(id)a3 withCreatedTimer:(id)a4 error:(id)a5 dryRun:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (v10 && !v11)
  {
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F303B0]) initWithCode:3 userActivity:0];
    [v13 setCreatedTimer:v10];
    id v14 = *MEMORY[0x1E4F30240];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_INFO))
    {
      id v15 = @"handled";
      int v25 = 136315906;
      id v26 = "-[MTCreateTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
      __int16 v27 = 2112;
      if (v6) {
        id v15 = @"confirmed";
      }
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_19CC95000, v14, OS_LOG_TYPE_INFO, "%s Successfully %@ create timer intent %@ with response %@", (uint8_t *)&v25, 0x2Au);
    }
    goto LABEL_21;
  }
  id v16 = [v11 domain];
  if ([v16 isEqualToString:@"MTTimerIntentHandlerErrorDomain"])
  {
    uint64_t v17 = [v12 code];

    if (v17 == 2) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  id v18 = [v12 domain];
  if ([v18 isEqualToString:@"MTTimerIntentHandlerErrorDomain"])
  {
    uint64_t v19 = [v12 code];

    if (v19 == 3)
    {
      uint64_t v20 = 7;
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v21 = [v12 domain];
  if (![v21 isEqualToString:@"MTTimerIntentHandlerErrorDomain"])
  {

    goto LABEL_19;
  }
  uint64_t v20 = [v12 code];

  if (v20 != 10) {
LABEL_19:
  }
    uint64_t v20 = 4;
LABEL_20:
  id v13 = (void *)[objc_alloc(MEMORY[0x1E4F303B0]) initWithCode:v20 userActivity:0];
  id v22 = *MEMORY[0x1E4F30240];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F30240], OS_LOG_TYPE_ERROR))
  {
    uint64_t v24 = @"handle";
    int v25 = 136316162;
    id v26 = "-[MTCreateTimerIntentHandler _responseToCreateTimerIntent:withCreatedTimer:error:dryRun:]";
    __int16 v27 = 2112;
    if (v6) {
      uint64_t v24 = @"confirm";
    }
    id v28 = v24;
    __int16 v29 = 2112;
    id v30 = v9;
    __int16 v31 = 2112;
    v32 = v13;
    __int16 v33 = 2112;
    uint64_t v34 = v12;
    _os_log_error_impl(&dword_19CC95000, v22, OS_LOG_TYPE_ERROR, "%s Failed to %@ create timer intent %@ with response: %@, error: %@", (uint8_t *)&v25, 0x34u);
  }
LABEL_21:

  return v13;
}

- (BOOL)_timer:(id)a3 conflictsWithRunningTimersInTimers:(id)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MTCreateTimerIntentHandler__timer_conflictsWithRunningTimersInTimers___block_invoke;
  v8[3] = &unk_1E5916060;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a4) = [a4 indexOfObjectPassingTest:v8] != 0x7FFFFFFFFFFFFFFFLL;

  return (char)a4;
}

BOOL __72__MTCreateTimerIntentHandler__timer_conflictsWithRunningTimersInTimers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 state] == 3 && MTTimerConflictsWithTimer(*(void **)(a1 + 32), v3);

  return v4;
}

- (BOOL)_isPlayingMediaFromMRPlaybackState:(unsigned int)a3
{
  return (a3 < 6) & (0x32u >> a3);
}

void __72__MTCreateTimerIntentHandler_resolveLabelForCreateTimer_withCompletion___block_invoke_4_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_19CC95000, v0, v1, "%s Failed to fetch timers for intent: %@, error: %@", v2);
}

- (void)_checkNowPlayingMediaState:.cold.1()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = objc_msgSend(NSString, "stringWithUTF8String:", "void _MRMediaRemoteGetNowPlayingApplicationPlaybackState(__strong dispatch_queue_t, void (^__strong)(MRPlaybackState))");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"MTCreateTimerIntentHandler.m", 34, @"%s", dlerror());

  __break(1u);
}

void __71__MTCreateTimerIntentHandler__createTimerWithIntent_dryRun_completion___block_invoke_22_cold_1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_2(&dword_19CC95000, v0, v1, "%s Failed to remove conflicting timer: %@ with error: %@", v2);
}

@end