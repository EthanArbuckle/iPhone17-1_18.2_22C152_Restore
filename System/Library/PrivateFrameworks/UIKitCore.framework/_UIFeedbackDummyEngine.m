@interface _UIFeedbackDummyEngine
+ (id)sharedEngine;
- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5;
- (id)_stats_key;
- (id)invalidationBlock;
- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3;
- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3;
- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4;
- (void)_playFeedback:(id)a3 atTime:(double)a4;
- (void)_stopFeedback:(id)a3;
- (void)setInvalidationBlock:(id)a3;
@end

@implementation _UIFeedbackDummyEngine

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38___UIFeedbackDummyEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25D800 != -1) {
    dispatch_once(&qword_1EB25D800, block);
  }
  v2 = (void *)qword_1EB25D808;
  return v2;
}

- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _internalQueue];

  v4 = [(id)objc_opt_class() _internalQueue];
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
  }

  dispatch_time_t v8 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75___UIFeedbackDummyEngine__internal_activateUnderlyingPlayerWithCompletion___block_invoke;
  block[3] = &unk_1E52DA040;
  id v11 = v3;
  id v9 = v3;
  dispatch_after(v8, v6, block);
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  id v7 = [v6 _effectiveFeedbackData];
  dispatch_time_t v8 = [(id)objc_opt_class() _internalQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47___UIFeedbackDummyEngine__playFeedback_atTime___block_invoke;
  v14[3] = &unk_1E52ED900;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  double v17 = a4;
  id v9 = v8;
  if (!v8)
  {
    id v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
  }
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v9, v14);
}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  id v7 = a4;
  [(id)objc_opt_class() _internalQueue];

  [(_UIFeedbackEngine *)self _internal_willPlayFeedback:v7 atTime:a5];
  return 1;
}

- (void)_stopFeedback:(id)a3
{
  id v4 = a3;
  v5 = [v4 _effectiveFeedbackData];
  id v6 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40___UIFeedbackDummyEngine__stopFeedback___block_invoke;
  block[3] = &unk_1E52DCB30;
  void block[4] = self;
  id v13 = v5;
  id v14 = v4;
  id v7 = v6;
  if (!v6)
  {
    id v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  id v9 = v6;
  id v10 = v4;
  id v11 = v5;
  dispatch_async(v7, block);
}

- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4
{
  id v5 = a4;
  [(id)objc_opt_class() _internalQueue];

  [(_UIFeedbackEngine *)self _internal_willCancelFeedback:v5];
}

- (id)_stats_key
{
  return @"dummy";
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end