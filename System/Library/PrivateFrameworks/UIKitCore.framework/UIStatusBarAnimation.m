@interface UIStatusBarAnimation
@end

@implementation UIStatusBarAnimation

void __56___UIStatusBarAnimation_prepareAnimations_forStatusBar___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v6 = v4;
  while ([v4 count])
  {
    v5 = [v6 anyObject];
    [v5 _prepareForStatusBar:a1[4] preparingAnimations:a1[5] exclusiveAnimations:a1[6]];

    id v4 = v6;
  }
}

void __56___UIStatusBarAnimation__addAnimations_toDispatchGroup___block_invoke(uint64_t a1)
{
}

void __45___UIStatusBarAnimation_performForStatusBar___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  uint64_t v7 = [v8 priority];
  if (v7 <= [*(id *)(a1 + 32) priority])
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
  else
  {
    [v8 performForStatusBar:*(void *)(a1 + 40)];
  }
}

void __45___UIStatusBarAnimation_performForStatusBar___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    [(id)_statusBarRunningAnimations removeObject:*(void *)(a1 + 32)];
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 10))
    {
      *(unsigned char *)(v3 + 10) = 0;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      id v4 = *(id *)(*(void *)(a1 + 32) + 120);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v10;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v10 != v7) {
              objc_enumerationMutation(v4);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * i));
          }
          uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        }
        while (v6);
      }
    }
  }
}

uint64_t __45___UIStatusBarAnimation_performForStatusBar___block_invoke_3(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    if (os_variant_has_internal_diagnostics())
    {
      id v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "Status bar animation took longer than expected and was ended early.", buf, 2u);
      }
    }
    else
    {
      v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_statusBarRunningAnimations_block_invoke___s_category)
                        + 8);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Status bar animation took longer than expected and was ended early.", v5, 2u);
      }
    }
    uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 112);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

@end