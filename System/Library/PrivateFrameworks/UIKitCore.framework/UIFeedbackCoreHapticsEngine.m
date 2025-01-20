@interface UIFeedbackCoreHapticsEngine
@end

@implementation UIFeedbackCoreHapticsEngine

void __46___UIFeedbackCoreHapticsEngine__internalQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.UIKit.FeedbackCoreHapticsEngineInternal", v2);
  v1 = (void *)qword_1EB25CC18;
  qword_1EB25CC18 = (uint64_t)v0;
}

uint64_t __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC78) + 8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        v3 = NSString;
        id v4 = *(id *)(a1 + 40);
        v5 = v2;
        v6 = objc_msgSend(v3, "stringWithFormat:", @"<%s: %p>", object_getClassName(v4), v4);

        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v16 = v6;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "failed to prewarm core haptics engine for %@: %@", buf, 0x16u);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_internal_resetCoreHapticsEngine");
    v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC70) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = NSString;
        id v11 = *(id *)(a1 + 40);
        v12 = v9;
        v13 = objc_msgSend(v10, "stringWithFormat:", @"<%s: %p>", object_getClassName(v11), v11);

        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "engine prewarmed for %@", buf, 0xCu);
      }
    }
    v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v8();
}

uint64_t __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(id *)(*((void *)&v11 + 1) + 8 * v6);
        v8 = objc_msgSend(v7, "invalidationBlock", (void)v11);

        if (v8)
        {
          v9 = [v7 invalidationBlock];
          v9[2]();

          [v7 setInvalidationBlock:0];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  [*(id *)(*(void *)(a1 + 32) + 104) removeAllObjects];
  return objc_msgSend(*(id *)(a1 + 32), "_internal_coreHapticsEngineFinishedWithError:completion:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke_2;
  block[3] = &unk_1E52E3298;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v5;
  id v14 = v6;
  id v7 = v4;
  if (!v4)
  {
    id v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  v9 = v4;
  id v10 = v3;
  dispatch_async(v7, block);
}

uint64_t __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = [(id)objc_opt_class() _internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke_2;
    block[3] = &unk_1E52E3298;
    void block[4] = WeakRetained;
    id v12 = v3;
    id v13 = *(id *)(a1 + 40);
    uint64_t v6 = v5;
    if (!v5)
    {
      uint64_t v6 = MEMORY[0x1E4F14428];
      id v7 = MEMORY[0x1E4F14428];
    }
    id v8 = v5;
    dispatch_async(v6, block);

    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 1;
  }

  return v9;
}

void __91___UIFeedbackCoreHapticsEngine__internal_dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [*(id *)(a1 + 32) coreHapticsEngine];

    if (v3
      && (uint64_t v4 = [[_UIFeedbackCoreHapticsPlayer alloc] initWithEngine:*(void *)(a1 + 32)]) != 0)
    {
      long long v11 = v4;
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "addObject:");
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &hapticEngineCreationBlock_block_invoke_6___s_category)+ 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v7 = NSString;
          id v8 = *(id *)(a1 + 32);
          uint64_t v9 = v6;
          id v10 = objc_msgSend(v7, "stringWithFormat:", @"<%s: %p>", object_getClassName(v8), v8);

          *(_DWORD *)buf = 138412290;
          id v13 = v10;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "failed to dequeue _UIFeedbackCoreHapticsPlayer for %@", buf, 0xCu);
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_teardownBackgroundTask");
}

void __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC60) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = NSString;
        id v6 = *(id *)(a1 + 32);
        id v7 = v4;
        id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

        *(_DWORD *)buf = 138412546;
        v22 = v8;
        __int16 v23 = 2112;
        id v24 = v3;
        uint64_t v9 = "core haptics engine stopped for %@ with error: %@";
        id v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_ERROR;
        uint32_t v12 = 22;
LABEL_8:
        _os_log_impl(&dword_1853B0000, v10, v11, v9, buf, v12);
      }
    }
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC68) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = NSString;
      id v15 = *(id *)(a1 + 32);
      id v7 = v13;
      id v8 = objc_msgSend(v14, "stringWithFormat:", @"<%s: %p>", object_getClassName(v15), v15);

      *(_DWORD *)buf = 138412290;
      v22 = v8;
      uint64_t v9 = "core haptics engine STOPPED for %@";
      id v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      uint32_t v12 = 12;
      goto LABEL_8;
    }
  }
  uint64_t v16 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke_17;
  block[3] = &unk_1E52D9F70;
  void block[4] = *(void *)(a1 + 32);
  __int16 v17 = v16;
  if (!v16)
  {
    __int16 v17 = MEMORY[0x1E4F14428];
    id v18 = MEMORY[0x1E4F14428];
  }
  uint64_t v19 = v16;
  dispatch_async(v17, block);
}

uint64_t __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)
    || ([*(id *)(a1 + 40) coreHapticsEngine],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v9))
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC88) + 8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        id v3 = NSString;
        id v4 = *(id *)(a1 + 40);
        uint64_t v5 = v2;
        id v6 = objc_msgSend(v3, "stringWithFormat:", @"<%s: %p>", object_getClassName(v4), v4);

        uint64_t v7 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        __int16 v17 = v6;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "failed to start core haptics engine for %@: %@", buf, 0x16u);
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_internal_resetCoreHapticsEngine");
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC80) + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v11 = NSString;
        id v12 = *(id *)(a1 + 40);
        id v13 = v10;
        uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", @"<%s: %p>", object_getClassName(v12), v12);

        *(_DWORD *)buf = 138412290;
        __int16 v17 = v14;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "core haptics engine STARTED for %@", buf, 0xCu);
      }
    }
    id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  return v8();
}

void __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke_2;
  block[3] = &unk_1E52E3298;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v12 = v3;
  uint64_t v13 = v5;
  id v14 = v6;
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  uint64_t v9 = v4;
  id v10 = v3;
  dispatch_async(v7, block);
}

void __44___UIFeedbackCoreHapticsEngine_sharedEngine__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)qword_1EB25CC30;
  qword_1EB25CC30 = (uint64_t)v1;
}

uint64_t __55___UIFeedbackCoreHapticsEngine__resetCoreHapticsEngine__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_resetCoreHapticsEngine");
}

uint64_t __67___UIFeedbackCoreHapticsEngine__coreHapticsEngineStoppedForReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_internal_coreHapticsEngineStoppedForReason:", *(void *)(a1 + 40));
}

void __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &hapticEngineCreationBlock_block_invoke___s_category)
                        + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = NSString;
        id v6 = WeakRetained;
        uint64_t v7 = v4;
        id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

        *(_DWORD *)buf = 138412546;
        id v10 = v8;
        __int16 v11 = 2048;
        uint64_t v12 = a2;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "core haptics engine stopped for %@ reason: %ld", buf, 0x16u);
      }
    }
    [WeakRetained _coreHapticsEngineStoppedForReason:a2];
  }
}

void __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke_12(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &hapticEngineCreationBlock_block_invoke_2___s_category)+ 8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = NSString;
        id v4 = WeakRetained;
        uint64_t v5 = v2;
        id v6 = objc_msgSend(v3, "stringWithFormat:", @"<%s: %p>", object_getClassName(v4), v4);

        *(_DWORD *)buf = 138412290;
        id v8 = v6;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "core haptics engine reset for %@", buf, 0xCu);
      }
    }
    [WeakRetained _resetCoreHapticsEngine];
  }
}

@end