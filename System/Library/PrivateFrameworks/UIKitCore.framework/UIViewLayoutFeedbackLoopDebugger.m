@interface UIViewLayoutFeedbackLoopDebugger
@end

@implementation UIViewLayoutFeedbackLoopDebugger

void __63___UIViewLayoutFeedbackLoopDebugger_layoutFeedbackLoopDebugger__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!qword_1EB25EA40)
  {
    v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    qword_1EB25EA50 = [v2 integerForKey:@"UIViewLayoutFeedbackLoopDebuggingThreshold"];

    uint64_t v3 = qword_1EB25EA50;
    if (qword_1EB25EA50) {
      goto LABEL_7;
    }
    if (_UIGetUIViewLayoutFeedbackLoopDebuggingEnabled())
    {
      qword_1EB25EA50 = 100;
      v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutLoop", (unint64_t *)algn_1EB25EA58) + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        int v8 = 134218754;
        uint64_t v9 = 100;
        __int16 v10 = 2080;
        v11 = "UIViewLayoutFeedbackLoopDebuggingThreshold";
        __int16 v12 = 2048;
        uint64_t v13 = 50;
        __int16 v14 = 2048;
        uint64_t v15 = 10000;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Layout feedback loop debugging enabled via internal UI Debugging preference with a threshold of %ld. Use -%s <threshold> as a launch argument if you want a different threshold. The threshold will be clamped between %ld and %ld.", (uint8_t *)&v8, 0x2Au);
      }
    }
    uint64_t v3 = qword_1EB25EA50;
    if (qword_1EB25EA50)
    {
LABEL_7:
      if (v3 <= 50) {
        uint64_t v3 = 50;
      }
      if ((unint64_t)v3 >= 0x2710) {
        uint64_t v3 = 10000;
      }
      qword_1EB25EA50 = v3;
      qword_1EB25EA60 = v3;
      qword_1EB25EA68 = 10 * v3;
      id v5 = objc_alloc_init(*(Class *)(a1 + 32));
      v6 = (void *)qword_1EB25EA40;
      qword_1EB25EA40 = (uint64_t)v5;

      if (!_UIGetUIViewLayoutFeedbackLoopDebuggingEnabled())
      {
        v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("LayoutLoop", &qword_1EB25EA70) + 8);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v8 = 136315394;
          uint64_t v9 = (uint64_t)"UIViewLayoutFeedbackLoopDebuggingThreshold";
          __int16 v10 = 2048;
          v11 = (const char *)qword_1EB25EA50;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Layout feedback loop debugging enabled via -%s launch argument with a threshold of %ld", (uint8_t *)&v8, 0x16u);
        }
      }
    }
  }
}

id __63___UIViewLayoutFeedbackLoopDebugger_topLevelViewHierarchyTrace__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  v6 = [MEMORY[0x1E4F28E78] stringWithFormat:@"\n"];
  if (a3)
  {
    uint64_t v7 = a3;
    do
    {
      [v6 appendString:@"|   "];
      --v7;
    }
    while (v7);
  }
  if ([*(id *)(*(void *)(a1 + 32) + 48) containsObject:v5])
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void **)(v8 + 64);
    if (!v9) {
      uint64_t v9 = *(void **)(v8 + 56);
    }
    objc_msgSend(v6, "appendFormat:", @"%ld ", objc_msgSend(v9, "indexOfObject:", v5) + 1);
  }
  __int16 v10 = objc_msgSend(v5, "_lfld_description");
  [v6 appendString:v10];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v11 = [v5 subviews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
        [v6 appendString:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v6;
}

@end