@interface UIFeedbackEngine
@end

@implementation UIFeedbackEngine

void __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(double *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 80);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_2;
  v7[3] = &unk_1E52ED968;
  id v8 = *(id *)(a1 + 64);
  objc_msgSend(v1, "_internal_playFeedbackData:atTime:feedback:effectiveFeedbackType:existingPlayer:withCompletionBlock:", v2, v5, v4, v6, v7, v3);
}

void __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_3;
  v12[3] = &unk_1E52ED940;
  id v9 = *(id *)(a1 + 32);
  id v14 = v8;
  id v15 = v9;
  char v16 = a2;
  id v13 = v7;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __35___UIFeedbackEngine__setSuspended___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_setSuspended:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __31___UIFeedbackEngine__setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stats_stateDidChangeFrom:to:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

uint64_t __32___UIFeedbackEngine__deactivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_deactivate");
}

uint64_t __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_activate:andPerformWhenRunning:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __44___UIFeedbackEngine__startWarmingFeedbacks___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_startWarmingFeedbacks:", *(void *)(a1 + 40));
}

uint64_t __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_prewarm:andPerformWhenPrewarmed:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

uint64_t __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_2;
  v3[3] = &unk_1E52E7D78;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __44___UIFeedbackEngine__internal_prewarmEngine__block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) _state] == 1)
  {
    if (a2) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
    [*(id *)(a1 + 32) _setState:v4];
  }
  char v5 = *(void **)(a1 + 32);
  return objc_msgSend(v5, "_internal_serviceBlocksForState:withSuccess:", 2, a2);
}

void __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_2;
  v3[3] = &unk_1E52E7D78;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __45___UIFeedbackEngine__internal_activateEngine__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = 4;
LABEL_8:
    [v4 _setState:v5];
    goto LABEL_9;
  }
  uint64_t v6 = [v4 prewarmCount];
  id v4 = *(void **)(a1 + 32);
  if (v6 < 1)
  {
    uint64_t v5 = 0;
    goto LABEL_8;
  }
  uint64_t v7 = [v4 _state];
  id v8 = *(void **)(a1 + 32);
  if (v7)
  {
    if ([v8 _state] != 3) {
      goto LABEL_9;
    }
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = 2;
    goto LABEL_8;
  }
  objc_msgSend(v8, "_internal_prewarmEngine");
LABEL_9:
  id v9 = *(void **)(a1 + 32);
  return objc_msgSend(v9, "_internal_serviceBlocksForState:withSuccess:", 4, a2);
}

void __39___UIFeedbackEngine_engineForFeedback___block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CA48] array];
  if ([(id)UIApp _isSpringBoard]) {
    [v0 addObject:objc_opt_class()];
  }
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:7];
  objc_msgSend(v0, "addObjectsFromArray:", v1, v3, v4, v5, v6, v7, v8);

  uint64_t v2 = (void *)qword_1EB25D798;
  qword_1EB25D798 = (uint64_t)v0;
}

void __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke_2(uint64_t a1, unsigned int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke___s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2048;
      uint64_t v9 = a2;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "_internal_deactivateEngineIfPossible %@ tearedDown: %ld", (uint8_t *)&v6, 0x16u);
    }
  }
  if (a2) {
    objc_msgSend(*(id *)(a1 + 40), "_setState:", 2 * (objc_msgSend(*(id *)(a1 + 40), "prewarmCount") > 0));
  }
}

void __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke_106(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!_UIFeedbackLoggingDisabled)
  {
    uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_2___s_category)+ 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = NSString;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = v4;
      __int16 v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      uint64_t v9 = NSString;
      id v10 = v3;
      id v11 = v8;
      v12 = objc_msgSend(v9, "stringWithFormat:", @"<%s: %p>", object_getClassName(v10), v10);

      *(_DWORD *)buf = 138412546;
      v24 = v8;
      __int16 v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "player dequeue finished for feedback %@ with player %@", buf, 0x16u);
    }
  }
  [*(id *)(*(void *)(a1 + 40) + 72) removeObjectForKey:*(void *)(a1 + 32)];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *(id *)(a1 + 48);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * v17++) + 16))();
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }
}

void __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke(double *a1, void *a2)
{
  uint64_t v3 = *((void *)a1 + 4);
  uint64_t v4 = *((void *)a1 + 5);
  double v5 = a1[7];
  id v6 = a2;
  if (objc_msgSend(v6, "_internal_playFeedbackData:forFeedback:atTime:", v3, v4, v5))
  {
    uint64_t v7 = 0;
  }
  else
  {
    __int16 v8 = @"unable to play feedback data";
    if (!v6) {
      __int16 v8 = @"no player";
    }
    uint64_t v7 = v8;
  }
  uint64_t v9 = v7;
  (*(void (**)(void))(*((void *)a1 + 6) + 16))();
}

uint64_t __47___UIFeedbackEngine__internal_updateSuspension__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_activateEngine");
}

uint64_t __62___UIFeedbackEngine__internal_activate_andPerformWhenRunning___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _state];
  if (result == 2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_internal_activateEngine");
  }
  return result;
}

uint64_t __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_deactivateEngineIfPossible");
}

uint64_t __43___UIFeedbackEngine__stopWarmingFeedbacks___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopWarmingFeedbacks:", *(void *)(a1 + 40));
}

uint64_t __30___UIFeedbackEngine__cooldown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_cooldown");
}

uint64_t __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_cooldownEngineIfPossible");
}

uint64_t __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t result = [*(id *)(result + 32) _state];
    if (result == 2)
    {
      uint64_t v3 = *(void **)(v2 + 32);
      return [v3 _setState:0];
    }
  }
  return result;
}

void __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_2;
  v2[3] = &unk_1E52EDA08;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:", v2);
}

void __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_3;
  v6[3] = &unk_1E52DB330;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __55___UIFeedbackEngine__internal_willPlayFeedback_atTime___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = 0.0;
  if (v2 > 0.0)
  {
    [*(id *)(a1 + 32) currentTime];
    double v3 = v2 - v4;
  }
  id v5 = +[_UIFeedbackVisualizer sharedVisualizer];
  [v5 showVisualForFeedback:*(void *)(a1 + 40) withDelay:v3];
}

void __50___UIFeedbackEngine__internal_willCancelFeedback___block_invoke(uint64_t a1)
{
  id v2 = +[_UIFeedbackVisualizer sharedVisualizer];
  [v2 cancelVisualForFeedback:*(void *)(a1 + 32)];
}

void __48___UIFeedbackEngine__sb_stuckInNonInactiveState__block_invoke()
{
  if (!_UIFeedbackLoggingDisabled)
  {
    v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7E0) + 8);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Springboard failed to return to inactive state. Reporting via ABC.", buf, 2u);
    }
  }
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2050000000;
  v1 = (void *)qword_1EB25D818;
  uint64_t v22 = qword_1EB25D818;
  if (!qword_1EB25D818)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getSDRDiagnosticReporterClass_block_invoke_0;
    uint64_t v17 = &unk_1E52D9900;
    long long v18 = &v19;
    __getSDRDiagnosticReporterClass_block_invoke_0((uint64_t)buf);
    v1 = (void *)v20[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v19, 8);
  id v3 = objc_alloc_init(v2);
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  double v4 = (id *)qword_1EB25D820;
  uint64_t v22 = qword_1EB25D820;
  if (!qword_1EB25D820)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    uint64_t v16 = __getkSymptomDiagnosticTypeEnergySymbolLoc_block_invoke;
    uint64_t v17 = &unk_1E52D9900;
    long long v18 = &v19;
    id v5 = SymptomDiagnosticReporterLibrary();
    id v6 = dlsym(v5, "kSymptomDiagnosticTypeEnergy");
    *(void *)(v18[1] + 24) = v6;
    qword_1EB25D820 = *(void *)(v18[1] + 24);
    double v4 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (v4)
  {
    id v7 = (void *)MEMORY[0x1E4F28B50];
    id v8 = *v4;
    uint64_t v9 = [v7 mainBundle];
    id v10 = [v9 bundleIdentifier];
    id v11 = [v3 signatureWithDomain:@"UIKit" type:v8 subType:@"SpringBoardHapticsFailReturnToIdle" detectedProcess:v10 triggerThresholdValues:0];

    [v3 snapshotWithSignature:v11 delay:0 events:0 payload:0 actions:0 reply:0.0];
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    id v13 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticTypeEnergy(void)"];
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, @"_UIFeedbackEngine.m", 36, @"%s", dlerror());

    __break(1u);
  }
}

uint64_t __34___UIFeedbackEngine_runWhenReady___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);
  return [v2 _deactivate];
}

void __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke_2;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 32);
  id v3 = v2;
  if (!v2)
  {
    id v3 = MEMORY[0x1E4F14428];
    id v4 = MEMORY[0x1E4F14428];
  }
  id v5 = v2;
  dispatch_async(v3, block);
}

uint64_t __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_UIInternalPreference_EnableStatisticOnAllDevices_block_invoke_4___s_category)+ 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      id v4 = v2;
      uint64_t v5 = [v3 _backgroundTaskIdentifier];
      id v6 = NSString;
      id v7 = *(id *)(a1 + 32);
      id v8 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

      *(_DWORD *)buf = 134218242;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v8;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "background task expired with ID %ld for engine %@", buf, 0x16u);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "_internal_deactivateEngineIfPossible");
}

@end