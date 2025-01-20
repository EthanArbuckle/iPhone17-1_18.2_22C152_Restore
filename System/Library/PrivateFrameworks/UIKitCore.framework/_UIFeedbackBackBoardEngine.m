@interface _UIFeedbackBackBoardEngine
+ (BOOL)_supportsAbortingDeactivation;
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (id)_internalQueue;
+ (id)sharedEngine;
- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5;
- (NSCountedSet)suspendedSSIDs;
- (id)_stats_key;
- (id)invalidationBlock;
- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3;
- (void)_playFeedback:(id)a3 atTime:(double)a4;
- (void)_stopFeedback:(id)a3;
- (void)_updateValueForParameters:(id)a3 withKey:(id)a4;
- (void)setInvalidationBlock:(id)a3;
@end

@implementation _UIFeedbackBackBoardEngine

+ (id)_internalQueue
{
  if (qword_1EB25BE80 != -1) {
    dispatch_once(&qword_1EB25BE80, &__block_literal_global_418);
  }
  v2 = (void *)_MergedGlobals_1_19;
  return v2;
}

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___UIFeedbackBackBoardEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25BE88 != -1) {
    dispatch_once(&qword_1EB25BE88, block);
  }
  v2 = (void *)qword_1EB25BE90;
  return v2;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  id v3 = a3;
  v4 = +[UIDevice currentDevice];
  uint64_t v5 = -[UIDevice _peripheralFeedbackSupportLevel]((uint64_t)v4);

  if (v5 >= 1 && ([v3 _effectiveFeedbackTypes] & 0xC) != 0) {
    char v6 = objc_opt_respondsToSelector();
  }
  else {
    char v6 = 0;
  }

  return v6 & 1;
}

+ (BOOL)_supportsAbortingDeactivation
{
  return 0;
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  v4 = (void (**)(id, _UIFeedbackBackBoardEngine *))a3;
  [(id)objc_opt_class() _internalQueue];

  v4[2](v4, self);
}

- (void)_updateValueForParameters:(id)a3 withKey:(id)a4
{
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "BackBoard HID feedbacks cannot be updated.", buf, 2u);
    }
  }
  else
  {
    v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateValueForParameters_withKey____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "BackBoard HID feedbacks cannot be updated.", v6, 2u);
    }
  }
}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  v7 = [v6 _effectiveFeedbackData];
  v8 = [(id)objc_opt_class() _internalQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __51___UIFeedbackBackBoardEngine__playFeedback_atTime___block_invoke;
  v14[3] = &unk_1E52ED900;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  double v17 = a4;
  v9 = v8;
  if (!v8)
  {
    v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
  }
  v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v9, v14);
}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(id)objc_opt_class() _internalQueue];

  [(_UIFeedbackEngine *)self currentTime];
  double v11 = a5 - v10;
  if (v11 <= 0.0) {
    double v12 = v11;
  }
  else {
    double v12 = 0.0;
  }
  if (os_variant_has_internal_diagnostics())
  {
    if (v12 > 0.1)
    {
      v26 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v12;
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "BackBoard HID feedbacks are always played (nearly) immediately and do not support delays. The requested delay of %f will be ignored.", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else if (v12 > 0.1)
  {
    v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BE98) + 8);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "BackBoard HID feedbacks are always played (nearly) immediately and do not support delays. The requested delay of %f will be ignored.", (uint8_t *)&buf, 0xCu);
    }
  }
  v28 = v9;
  [(_UIFeedbackEngine *)self _internal_willPlayFeedback:v9 atTime:a5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v30;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v30 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [*(id *)(*((void *)&v29 + 1) + 8 * v17) hidRequest];
        if (v18)
        {
          BKSHIDServicesRequestHapticFeedback();
        }
        else if (os_variant_has_internal_diagnostics())
        {
          v23 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            LOWORD(buf) = 0;
            _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "BackBoard HID feedback engine attempted to play feedback data without a request.", (uint8_t *)&buf, 2u);
          }
        }
        else
        {
          v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25BEA0) + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "BackBoard HID feedback engine attempted to play feedback data without a request.", (uint8_t *)&buf, 2u);
          }
        }
        kdebug_trace();
        v20 = [v18 pattern];
        uint64_t v21 = [v18 deviceType];
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v35 = ___sendAnalyticsEvent_block_invoke;
        v36 = &unk_1E5300240;
        id v37 = v20;
        uint64_t v38 = v21;
        id v22 = v20;
        AnalyticsSendEventLazy();

        ++v17;
      }
      while (v15 != v17);
      uint64_t v24 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v15 = v24;
    }
    while (v24);
  }

  return 1;
}

- (void)_stopFeedback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _effectiveFeedbackData];
  id v6 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___UIFeedbackBackBoardEngine__stopFeedback___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v13 = v5;
  id v14 = v4;
  v7 = v6;
  if (!v6)
  {
    v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  id v9 = v6;
  id v10 = v4;
  id v11 = v5;
  dispatch_async(v7, block);
}

- (id)_stats_key
{
  return @"backBoard";
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
}

- (NSCountedSet)suspendedSSIDs
{
  return self->_suspendedSSIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedSSIDs, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end