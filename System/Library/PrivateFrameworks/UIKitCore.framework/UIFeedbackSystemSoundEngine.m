@interface UIFeedbackSystemSoundEngine
@end

@implementation UIFeedbackSystemSoundEngine

uint64_t __79___UIFeedbackSystemSoundEngine__internal_performForEachSSIDsInFeedbacks_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __64___UIFeedbackSystemSoundEngine__internal_startWarmingFeedbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = [NSNumber numberWithUnsignedInt:a2];
  char v5 = objc_msgSend(*(id *)(a1 + 32), "_internal_isSuspended");
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    v7 = *(void **)(v6 + 112);
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28BD0] set];
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = *(void **)(v9 + 112);
      *(void *)(v9 + 112) = v8;

      v7 = *(void **)(*(void *)(a1 + 32) + 112);
    }
  }
  else
  {
    if (![*(id *)(v6 + 104) countForObject:v4])
    {
      int v11 = objc_msgSend(*(id *)(a1 + 32), "_internal_prepareSystemSoundID:forBeingActive:", a2, 1);
      if (!_UIFeedbackLoggingDisabled)
      {
        int v12 = v11;
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &CoreHapticsErrorDomain_block_invoke___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          v14 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = @"NO";
            if (v12) {
              v15 = @"YES";
            }
            int v16 = 134218242;
            uint64_t v17 = a2;
            __int16 v18 = 2112;
            v19 = v15;
            _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "activated SSID %ld success: %@", (uint8_t *)&v16, 0x16u);
          }
        }
      }
    }
    v7 = *(void **)(*(void *)(a1 + 32) + 104);
  }
  [v7 addObject:v4];
}

void __44___UIFeedbackSystemSoundEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB25C958;
  qword_1EB25C958 = (uint64_t)v1;
}

void __46___UIFeedbackSystemSoundEngine__internalQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UIKit.FeedbackSystemSoundEngineInternal", v2);
  id v1 = (void *)_MergedGlobals_5_8;
  _MergedGlobals_5_8 = (uint64_t)v0;
}

void __63___UIFeedbackSystemSoundEngine__internal_stopWarmingFeedbacks___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [NSNumber numberWithUnsignedInt:a2];
  char v5 = objc_msgSend(*(id *)(a1 + 32), "_internal_isSuspended");
  uint64_t v6 = *(void *)(a1 + 32);
  if (v5)
  {
    [*(id *)(v6 + 112) removeObject:v4];
  }
  else
  {
    [*(id *)(v6 + 104) removeObject:v4];
    if (![*(id *)(*(void *)(a1 + 32) + 104) countForObject:v4])
    {
      objc_msgSend(*(id *)(a1 + 32), "_internal_prepareSystemSoundID:forBeingActive:", a2, 0);
      if (!_UIFeedbackLoggingDisabled)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &CoreHapticsErrorDomain_block_invoke_2___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v8 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            int v9 = 134217984;
            uint64_t v10 = a2;
            _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "deactivated SSID %ld", (uint8_t *)&v9, 0xCu);
          }
        }
      }
    }
  }
}

uint64_t __53___UIFeedbackSystemSoundEngine__playFeedback_atTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackData:forFeedback:atTime:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(double *)(a1 + 56));
}

void __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v6 setObject:v5 forKeyedSubscript:v10];
}

void __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_internal_playFeedbackDataNow:forFeedback:withOptions:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  id v2 = [*(id *)(a1 + 48) systemSoundSources];
  [v2 removeObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
}

uint64_t __46___UIFeedbackSystemSoundEngine__stopFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_stopFeedbackData:forFeedback:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

@end