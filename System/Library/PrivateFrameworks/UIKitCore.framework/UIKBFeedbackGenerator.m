@interface UIKBFeedbackGenerator
@end

@implementation UIKBFeedbackGenerator

uint64_t __54___UIKBFeedbackGenerator__usesCoreHapticsForAudioOnly__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  _MergedGlobals_1014 = result;
  return result;
}

void __30___UIKBFeedbackGenerator_init__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    BOOL isRingerSwitch = -[_UIKBFeedbackGenerator _isRingerSwitchOn]((uint64_t)WeakRetained);
    v4 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = "off";
      if (isRingerSwitch) {
        v5 = "on";
      }
      *(_DWORD *)buf = 138412546;
      v10 = v8;
      __int16 v11 = 2080;
      v12 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@: Ringer switch changed. Ringer is now %s.", buf, 0x16u);
    }

    int v6 = -[_UIKBFeedbackGenerator _areKeyClicksEnabled](v8[2]);
    v2 = v8;
    if (v6)
    {
      v7 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%@: Resetting the generator. Key clicks are enabled and the ringer switch changed.", buf, 0xCu);
      }

      -[_UIKBFeedbackGenerator _resetWithReason:](v8, @"ringer switch changed");
      v2 = v8;
    }
  }
}

void __33___UIKBFeedbackGenerator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = _UIKBFeedbackLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v9 = 134218240;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    uint64_t v12 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Worker queue now setting engine %p and players %p to nil.", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;
}

void __42___UIKBFeedbackGenerator__performOnQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __41___UIKBFeedbackGenerator__performOnMain___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id WeakRetained = v3;
  }
}

void __65___UIKBFeedbackGenerator__createEngineAndPlayersOnQueueWithMode___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  v51[1] = *(id *)MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  uint64_t v40 = 0;
  uint64_t v41 = (uint64_t)&v40;
  uint64_t v42 = 0x2050000000;
  int v9 = (void *)qword_1EB2601E8;
  v43 = (void *)qword_1EB2601E8;
  if (!qword_1EB2601E8)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCHHapticPatternClass_block_invoke;
    v49 = &unk_1E52D9900;
    v50 = &v40;
    __getCHHapticPatternClass_block_invoke((uint64_t)buf);
    int v9 = *(void **)(v41 + 24);
  }
  id v10 = v9;
  _Block_object_dispose(&v40, 8);
  id v39 = 0;
  __int16 v11 = [v10 patternForKey:v8 error:&v39];
  id v12 = v39;
  if (v12)
  {
    uint64_t v13 = v12;
    v14 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_error_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "%@: Error creating CHHapticPattern: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = *(void *)(a1 + 32);
    v16 = *(void **)(v15 + 80);
    if (v16) {
      goto LABEL_26;
    }
    v17 = [v11 configurationDictionary];
    uint64_t v36 = *(void *)(a1 + 48);
    id v18 = v17;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v15 + 8));
    if (*(unsigned char *)(v15 + 76))
    {
      v19 = _UIKBFeedbackLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v15;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[_UIKBFeedbackGenerator _createEngineOnQueueWithOptions:mode:]";
        _os_log_error_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "%@: %s called when feedback is disabled.", buf, 0x16u);
      }
    }
    else
    {
      uint64_t v40 = 0;
      uint64_t v41 = (uint64_t)&v40;
      uint64_t v42 = 0x2050000000;
      v20 = (void *)qword_1EB260200;
      v43 = (void *)qword_1EB260200;
      if (!qword_1EB260200)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getCHHapticEngineClass_block_invoke;
        v49 = &unk_1E52D9900;
        v50 = &v40;
        __getCHHapticEngineClass_block_invoke((uint64_t)buf);
        v20 = *(void **)(v41 + 24);
      }
      v21 = v20;
      _Block_object_dispose(&v40, 8);
      id v22 = [v21 alloc];
      id v47 = 0;
      uint64_t v23 = [v22 initWithAudioSession:0 sessionIsShared:0 options:v18 error:&v47];
      v19 = v47;
      v24 = *(void **)(v15 + 80);
      *(void *)(v15 + 80) = v23;

      if (v19)
      {
        v25 = _UIKBFeedbackLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v19;
          _os_log_error_impl(&dword_1853B0000, v25, OS_LOG_TYPE_ERROR, "%@: Error creating CHHapticEngine: %@", buf, 0x16u);
        }
      }
      else
      {
        [*(id *)(v15 + 80) setFollowAudioRoute:1];
        v27 = _UIKBFeedbackLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          if ((unint64_t)(v36 - 1) > 2) {
            v28 = @"none";
          }
          else {
            v28 = off_1E52EAEE0[v36 - 1];
          }
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v15;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v28;
          _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "%@: Creating engine with mode: %@.", buf, 0x16u);
        }

        [*(id *)(v15 + 80) setPlaysHapticsOnly:v36 == 2];
        [*(id *)(v15 + 80) setPlaysAudioOnly:v36 == 1];
        if (v36 == 1)
        {
          [*(id *)(v15 + 80) setAutoShutdownEnabled:1];
          [*(id *)(v15 + 80) setAutoShutdownTimeout:2.0];
        }
        id v29 = *(id *)(v15 + 8);
        objc_initWeak(&location, (id)v15);
        v37 = *(void **)(v15 + 80);
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke;
        v49 = &unk_1E52EAC80;
        v30 = (uint64_t *)v29;
        v50 = v30;
        v35 = v51;
        objc_copyWeak(v51, &location);
        [v37 setStoppedHandler:buf];
        v31 = *(void **)(v15 + 80);
        uint64_t v40 = MEMORY[0x1E4F143A8];
        uint64_t v41 = 3221225472;
        uint64_t v42 = (uint64_t)__63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_3;
        v43 = &unk_1E52EACA8;
        v25 = v30;
        v44 = v25;
        objc_copyWeak(&v45, &location);
        [v31 setResetHandler:&v40];
        objc_destroyWeak(&v45);

        objc_destroyWeak(v51);
        objc_destroyWeak(&location);
      }
    }
    v16 = *(void **)(*(void *)(a1 + 32) + 80);
    if (v16)
    {
LABEL_26:
      id v38 = 0;
      v32 = objc_msgSend(v16, "createPlayerWithPattern:error:", v11, &v38, v35);
      id v33 = v38;
      if (v33)
      {
        v34 = _UIKBFeedbackLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v33;
          _os_log_error_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Error creating CHHapticEngine: %@", buf, 0xCu);
        }
      }
      else
      {
        [*(id *)(a1 + 40) setObject:v32 forKeyedSubscript:v7];
      }
    }
    else
    {
      *a4 = 1;
    }
  }
}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_2;
  v4[3] = &unk_1E52DF528;
  objc_copyWeak(v5, (id *)(a1 + 40));
  v5[1] = a2;
  dispatch_async(v3, v4);
  objc_destroyWeak(v5);
}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v5 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[1]);
    uint64_t v4 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v7 = v5;
      __int16 v8 = 2048;
      uint64_t v9 = v3;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@: Engine stopped with reason: %ld", buf, 0x16u);
    }

    -[_UIKBFeedbackGenerator _setIsEngineRunning:]((uint64_t)v5, 0);
    -[_UIKBFeedbackGenerator _performOnMain:](v5, &__block_literal_global_110);
    id WeakRetained = v5;
  }
}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_3(uint64_t a1)
{
  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_4;
  block[3] = &unk_1E52DC308;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __63___UIKBFeedbackGenerator__createEngineOnQueueWithOptions_mode___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    uint64_t updated = -[_UIKBFeedbackGenerator _updateMode]((uint64_t)WeakRetained);
    -[_UIKBFeedbackGenerator _recreateEngineAndPlayersOnQueueWithMode:reason:](WeakRetained, updated, @"engine reset handler");
  }
}

uint64_t __65___UIKBFeedbackGenerator__engineStoppedHandlerOnQueueWithReason___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 28) = 0;
  return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a2 selector:sel__stopEngineDueToIdle object:0];
}

void __43___UIKBFeedbackGenerator__resetWithReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43___UIKBFeedbackGenerator__resetWithReason___block_invoke_2;
  v3[3] = &unk_1E52EACF0;
  char v5 = *(unsigned char *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _performOnMain:](WeakRetained, v3);
}

void __43___UIKBFeedbackGenerator__resetWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  -[_UIKBFeedbackGenerator _updateMode]((uint64_t)v3);
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@: Reactivating for reason: %@", (uint8_t *)&v6, 0x16u);
    }

    [v3 activateWithCompletionBlock:0];
  }
}

uint64_t __74___UIKBFeedbackGenerator__recreateEngineAndPlayersOnQueueWithMode_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:a2 selector:sel__stopEngineDueToIdle object:0];
  }
  return result;
}

void __62___UIKBFeedbackGenerator__prewarmEngineOnQueueWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = _UIKBFeedbackLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "Error prewarming: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(void **)(a1 + 32);
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%@: Done preheating CoreHaptics.", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);
  }
}

void __37___UIKBFeedbackGenerator__updateMode__block_invoke(uint64_t a1, unsigned char *a2)
{
  a2[76] = *(void *)(a1 + 32) == 0;
  a2[77] = *(void *)(a1 + 32) == 1;
  v2 = a2;
  v2[78] = +[_UIKBFeedbackGenerator _usesCoreHapticsForAudioOnly]();
}

void __46___UIKBFeedbackGenerator__setIsEngineRunning___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    ++*((void *)v3 + 6);
    int v8 = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v5 = (void *)*((void *)v8 + 4);
    *((void *)v8 + 4) = v4;
  }
  else
  {
    if (!*((void *)v3 + 4)) {
      goto LABEL_6;
    }
    int v8 = v3;
    int v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 32)];
    v8[5] = v7 + v8[5];

    uint64_t v5 = (void *)*((void *)v8 + 4);
    v8[4] = 0.0;
  }

  id v3 = v8;
LABEL_6:
}

uint64_t __65___UIKBFeedbackGenerator__startEngineOnQueueWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 28) = *(unsigned char *)(a1 + 40);
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = _UIKBFeedbackLog();
  int v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v12 = WeakRetained;
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%@: Error stopping CHHapticEngine: %@", buf, 0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      (*(void (**)(void))(v7 + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = WeakRetained;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%@: Engine stopped.", buf, 0xCu);
    }

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_130;
    v8[3] = &unk_1E52EAD88;
    char v10 = *(unsigned char *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    -[_UIKBFeedbackGenerator _performOnQueue:](WeakRetained, v8);
  }
}

void __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_130(uint64_t a1, void *a2)
{
  id v3 = a2;
  -[_UIKBFeedbackGenerator _setIsEngineRunning:]((uint64_t)v3, 0);
  if (*(unsigned char *)(a1 + 40)) {
    -[_UIKBFeedbackGenerator _releaseEngineAndPlayersOnQueue]((uint64_t)v3);
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_2;
  v4[3] = &unk_1E52EADB0;
  id v5 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _performOnMain:](v3, v4);
}

uint64_t __91___UIKBFeedbackGenerator__stopEngineIfNecessaryOnQueueAndReleaseResources_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 28) = 0;
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __46___UIKBFeedbackGenerator__stopEngineDueToIdle__block_invoke(uint64_t a1, uint64_t a2)
{
}

void __57___UIKBFeedbackGenerator__dictationDidBeginNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  id v3 = v2[10];
  uint64_t v4 = _UIKBFeedbackLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%@: Unmute haptics for dictation audio recording.", (uint8_t *)&v6, 0xCu);
    }

    [v2[10] setMuteHapticsWhileRecordingAudio:0];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%@: Couldn't update haptics muting for dictation audio recording. No engine.", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __55___UIKBFeedbackGenerator__dictationDidEndNotification___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  id v3 = v2[10];
  uint64_t v4 = _UIKBFeedbackLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%@: Muting haptics for audio recording.", (uint8_t *)&v6, 0xCu);
    }

    [v2[10] setMuteHapticsWhileRecordingAudio:1];
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      uint64_t v7 = v2;
      _os_log_error_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%@: Couldn't update haptics muting for dictation audio recording. No engine.", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __64___UIKBFeedbackGenerator__stopEngineForApplicationNotification___block_invoke(uint64_t a1, uint64_t a2)
{
}

uint64_t __64___UIKBFeedbackGenerator__effectiveVolumeDidChangeNotification___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 64) getVolume:a2 + 72 forCategory:*(void *)(a1 + 32)];
}

uint64_t __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_147(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = NSString;
  id v5 = a2;
  int v6 = [v4 stringWithUTF8String:"-[_UIKBFeedbackGenerator activateWithCompletionBlock:]_block_invoke"];
  -[_UIKBFeedbackGenerator _recreateEngineAndPlayersIfNecessaryOnQueueWithMode:reason:]((uint64_t)v5, v3, v6);

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_2;
  v11[3] = &unk_1E52D9FE8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v8 = v11;
  if (v7)
  {
    id v9 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%@: Preheating CoreHaptics.", (uint8_t *)&buf, 0xCu);
    }

    char v10 = *(void **)(v7 + 80);
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    id v14 = __62___UIKBFeedbackGenerator__prewarmEngineOnQueueWithCompletion___block_invoke;
    uint64_t v15 = &unk_1E52EAD40;
    uint64_t v16 = v7;
    v17 = v8;
    [v10 prewarmWithCompletionHandler:&buf];
  }
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_2(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_3;
  v3[3] = &unk_1E52E7D78;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = [NSString stringWithUTF8String:"-[_UIKBFeedbackGenerator activateWithCompletionBlock:]_block_invoke_4"];
  -[_UIKBFeedbackGenerator _recreateEngineAndPlayersIfNecessaryOnQueueWithMode:reason:]((uint64_t)v3, v4, v5);

  objc_initWeak(&location, v3);
  int v6 = [NSString stringWithUTF8String:"-[_UIKBFeedbackGenerator activateWithCompletionBlock:]_block_invoke_4"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_5;
  v7[3] = &unk_1E52EAE50;
  objc_copyWeak(&v9, &location);
  id v8 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _startEngineIfNecessaryOnQueueWithReason:completionBlock:]((uint64_t)v3, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_5(uint64_t a1, char a2)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v4 = objc_loadWeakRetained(&to);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_6;
  v5[3] = &unk_1E52EAD88;
  char v7 = a2;
  id v6 = *(id *)(a1 + 32);
  -[_UIKBFeedbackGenerator _performOnMain:](v4, v5);

  objc_destroyWeak(&to);
}

uint64_t __54___UIKBFeedbackGenerator_activateWithCompletionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    -[_UIKBFeedbackGenerator _resetIdleTimer](a2);
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  return v3();
}

void __36___UIKBFeedbackGenerator_deactivate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIKBFeedbackGenerator _sendAnalyticsEvent]((uint64_t)WeakRetained);
}

uint64_t __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v4 = _UIKBFeedbackLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v8 = a2;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%@: Cooling CoreHaptics.", buf, 0xCu);
    }

    [*(id *)(a2 + 80) stopPrewarm];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_3;
  block[3] = &unk_1E52DA040;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57___UIKBFeedbackGenerator__deactivateWithCompletionBlock___block_invoke_148(uint64_t a1, uint64_t a2)
{
}

void __52___UIKBFeedbackGenerator_actionOccurred_atLocation___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a2 + 8));
    if (!*(unsigned char *)(a2 + 76))
    {
      if (*(unsigned char *)(a2 + 77) && !*(unsigned char *)(a2 + 78))
      {
        v25 = *(void **)(a2 + 96);
        uint64_t v26 = [NSNumber numberWithInteger:v3];
        char v7 = [v25 objectForKeyedSubscript:v26];

        if (v7)
        {
          uint64_t v27 = [v7 integerValue];
          id v36 = 0;
          v37 = &v36;
          uint64_t v38 = 0x2020000000;
          id v28 = off_1EB260208;
          id v39 = off_1EB260208;
          if (!off_1EB260208)
          {
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_block_invoke;
            v44 = &unk_1E52D9900;
            id v45 = &v36;
            __getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_block_invoke(buf);
            id v28 = v37[3];
          }
          _Block_object_dispose(&v36, 8);
          if (!v28)
          {
            v34 = [MEMORY[0x1E4F28B00] currentHandler];
            v35 = objc_msgSend(NSString, "stringWithUTF8String:", "void __AudioServicesPlaySystemSoundWithOptions(SystemSoundID, CFDictionaryRef, __strong dispatch_block_t)");
            objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"_UIKBFeedbackGenerator.m", 58, @"%s", dlerror());

            goto LABEL_34;
          }
          ((void (*)(uint64_t, void, void))v28)(v27, 0, 0);
        }
      }
      else
      {
        id v4 = [NSString stringWithUTF8String:"-[_UIKBFeedbackGenerator _actionOccurred:]"];
        -[_UIKBFeedbackGenerator _startEngineIfNecessaryOnQueueWithReason:completionBlock:](a2, v4, 0);

        if (!*(unsigned char *)(a2 + 112))
        {
          char v7 = _UIKBFeedbackLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = a2;
            _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "%@: Engine is not running. Can't play feedback.", buf, 0xCu);
          }
          goto LABEL_29;
        }
        char v5 = *(void **)(a2 + 88);
        id v6 = [NSNumber numberWithInteger:v3];
        char v7 = [v5 objectForKeyedSubscript:v6];

        if (v7)
        {
          uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
          [v8 timeIntervalSinceReferenceDate];

          float v9 = *(float *)(a2 + 72);
          [*(id *)(a2 + 80) currentTime];
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            char v10 = _UIKBFeedbackLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = a2;
              _os_log_error_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "%@: CHHapticPatternPlayer does not support immediate parameters.", buf, 0xCu);
            }
LABEL_28:

            [*(id *)(a2 + 80) currentTime];
            *(void *)(a2 + 104) = v29;
            goto LABEL_29;
          }
          char v10 = v7;
          id v36 = 0;
          v37 = &v36;
          uint64_t v38 = 0x2020000000;
          __int16 v11 = (id *)qword_1EB260218;
          id v39 = (void *)qword_1EB260218;
          if (!qword_1EB260218)
          {
            *(void *)long long buf = MEMORY[0x1E4F143A8];
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = __getCHHapticEventParameterIDAudioVolumeSymbolLoc_block_invoke;
            v44 = &unk_1E52D9900;
            id v45 = &v36;
            id v12 = CoreHapticsLibrary();
            __int16 v13 = dlsym(v12, "CHHapticEventParameterIDAudioVolume");
            *((void *)v45[1] + 3) = v13;
            qword_1EB260218 = *((void *)v45[1] + 3);
            __int16 v11 = (id *)v37[3];
          }
          _Block_object_dispose(&v36, 8);
          if (v11)
          {
            id v14 = *v11;
            id v40 = v14;
            uint64_t v15 = [NSNumber numberWithDouble:(v9 + -0.0625) / 0.9375 * 0.4549 + (1.0 - (v9 + -0.0625) / 0.9375) * 0.1757];
            v42[0] = v15;
            id v36 = 0;
            v37 = &v36;
            uint64_t v38 = 0x2020000000;
            uint64_t v16 = (id *)qword_1EB260220;
            id v39 = (void *)qword_1EB260220;
            if (!qword_1EB260220)
            {
              *(void *)long long buf = MEMORY[0x1E4F143A8];
              *(void *)&buf[8] = 3221225472;
              *(void *)&buf[16] = __getCHHapticEventParameterIDHapticIntensitySymbolLoc_block_invoke;
              v44 = &unk_1E52D9900;
              id v45 = &v36;
              v17 = CoreHapticsLibrary();
              uint64_t v18 = dlsym(v17, "CHHapticEventParameterIDHapticIntensity");
              *((void *)v45[1] + 3) = v18;
              qword_1EB260220 = *((void *)v45[1] + 3);
              uint64_t v16 = (id *)v37[3];
            }
            _Block_object_dispose(&v36, 8);
            if (v16)
            {
              id v41 = *v16;
              v19 = NSNumber;
              id v20 = v41;
              v21 = [v19 numberWithDouble:1.0];
              v42[1] = v21;
              id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:&v40 count:2];
              id v36 = 0;
              [v10 startAtTime:v22 withImmediateParameters:&v36 error:0.0];
              id v23 = v36;

              if (v23)
              {
                v24 = _UIKBFeedbackLog();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412546;
                  *(void *)&uint8_t buf[4] = a2;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v23;
                  _os_log_error_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "%@: Error starting player: %@", buf, 0x16u);
                }

                char v7 = v10;
                goto LABEL_29;
              }
              ++*(void *)(a2 + 56);
              goto LABEL_28;
            }
            v32 = [MEMORY[0x1E4F28B00] currentHandler];
            id v33 = [NSString stringWithUTF8String:"CHHapticEventParameterID getCHHapticEventParameterIDHapticIntensity(void)"];
            objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"_UIFeedbackCoreHapticsEngineUtilities.h", 49, @"%s", dlerror());
          }
          else
          {
            v30 = [MEMORY[0x1E4F28B00] currentHandler];
            v31 = [NSString stringWithUTF8String:"CHHapticEventParameterID getCHHapticEventParameterIDAudioVolume(void)"];
            objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"_UIFeedbackCoreHapticsEngineUtilities.h", 57, @"%s", dlerror());
          }
LABEL_34:
          __break(1u);
        }
      }
LABEL_29:
    }
  }
}

@end