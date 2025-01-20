@interface _UIFeedbackEngine
+ (BOOL)_supportsAbortingDeactivation;
+ (BOOL)_supportsPlayingFeedback:(id)a3;
+ (BOOL)_supportsPlayingFeedbackPatternsDirectly;
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (OS_dispatch_queue)_internalQueue;
+ (id)engineForFeedback:(id)a3;
+ (id)sharedEngine;
- (BOOL)_internal_isSuspended;
- (BOOL)isEnabled;
- (NSMapTable)_playerDequeueBlocks;
- (NSString)_stats_key;
- (_UIFeedbackEngine)init;
- (id)_activationCountStatistics;
- (id)_activationDurationStatistics;
- (id)_outOfChannelsCountStatistics;
- (id)_prewarmCountStatistics;
- (id)_prewarmDurationStatistics;
- (id)description;
- (int64_t)_state;
- (int64_t)_suspensionState;
- (int64_t)prewarmCount;
- (unint64_t)_backgroundTaskIdentifier;
- (unint64_t)numberOfClients;
- (void)_activate:(BOOL)a3 andPerformWhenRunning:(id)a4;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_applicationDidResume:(id)a3;
- (void)_applicationWillResignActive:(id)a3;
- (void)_applicationWillSuspend:(id)a3;
- (void)_cooldown;
- (void)_deactivate;
- (void)_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3;
- (void)_hostDidEnterBackground:(id)a3;
- (void)_hostWillEnterForeground:(id)a3;
- (void)_internal_activate:(BOOL)a3 andPerformWhenRunning:(id)a4;
- (void)_internal_activateEngine;
- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3;
- (void)_internal_cooldown;
- (void)_internal_cooldownEngineIfPossible;
- (void)_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:(id)a3;
- (void)_internal_deactivate;
- (void)_internal_deactivateEngineIfPossible;
- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3;
- (void)_internal_performAtState:(int64_t)a3 block:(id)a4;
- (void)_internal_playFeedbackData:(id)a3 atTime:(double)a4 feedback:(id)a5 effectiveFeedbackType:(unint64_t)a6 existingPlayer:(id)a7 withCompletionBlock:(id)a8;
- (void)_internal_prewarm:(BOOL)a3 andPerformWhenPrewarmed:(id)a4;
- (void)_internal_prewarmEngine;
- (void)_internal_prewarmUnderlyingPlayerWithCompletion:(id)a3;
- (void)_internal_serviceBlocksForState:(int64_t)a3 withSuccess:(BOOL)a4;
- (void)_internal_setSuspended:(BOOL)a3;
- (void)_internal_setupBackgroundTask;
- (void)_internal_startWarmingFeedbacks:(id)a3;
- (void)_internal_stopWarmingFeedbacks:(id)a3;
- (void)_internal_teardownBackgroundTask;
- (void)_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:(id)a3;
- (void)_internal_updateSuspension;
- (void)_internal_willCancelFeedback:(id)a3;
- (void)_internal_willPlayFeedback:(id)a3 atTime:(double)a4;
- (void)_playFeedback:(id)a3 atTime:(double)a4 withCompletionBlock:(id)a5;
- (void)_prewarm:(BOOL)a3 andPerformWhenPrewarmed:(id)a4;
- (void)_remoteViewControllerWillDisconnect:(id)a3;
- (void)_sb_stuckInNonInactiveState;
- (void)_setBackgroundTaskIdentifier:(unint64_t)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setPlayerDequeueBlocks:(id)a3;
- (void)_setState:(int64_t)a3;
- (void)_setSuspended:(BOOL)a3;
- (void)_startWarmingFeedbacks:(id)a3;
- (void)_stats_outOfChannels;
- (void)_stats_stateDidChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)_stopWarmingFeedbacks:(id)a3;
- (void)_suspendEngineNow;
- (void)runWhenReady:(id)a3;
- (void)setPrewarmCount:(int64_t)a3;
@end

@implementation _UIFeedbackEngine

- (void)_internal_playFeedbackData:(id)a3 atTime:(double)a4 feedback:(id)a5 effectiveFeedbackType:(unint64_t)a6 existingPlayer:(id)a7 withCompletionBlock:(id)a8
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  [(id)objc_opt_class() _internalQueue];

  if ([(_UIFeedbackEngine *)self isEnabled])
  {
    if ([(_UIFeedbackEngine *)self _internal_isSuspended])
    {
      (*((void (**)(id, void, void, __CFString *))v17 + 2))(v17, 0, 0, @"suspended");
    }
    else if ([(_UIFeedbackEngine *)self _state] == 4 || [(_UIFeedbackEngine *)self _state] == 3)
    {
      if (a6)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke;
        aBlock[3] = &unk_1E52ED9B8;
        id v38 = v14;
        id v18 = v15;
        id v39 = v18;
        double v41 = a4;
        id v40 = v17;
        v19 = _Block_copy(aBlock);
        v20 = v19;
        if (v16)
        {
          (*((void (**)(void *, id))v19 + 2))(v19, v16);
        }
        else
        {
          uint64_t v21 = [(NSMapTable *)self->_playerDequeueBlocks objectForKey:v18];
          if (v21)
          {
            id v22 = (id)v21;
            if (!_UIFeedbackLoggingDisabled)
            {
              v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7D8) + 8);
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                v24 = v23;
                v25 = _UIDescriptionBuilderLightDescription(v18);
                *(_DWORD *)buf = 138412290;
                v43 = v25;
                _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "player dequeue needed - existing request for feedback %@", buf, 0xCu);
              }
            }
            v26 = _Block_copy(v20);
            [v22 addObject:v26];
          }
          else
          {
            if (!_UIFeedbackLoggingDisabled)
            {
              v27 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7D0) + 8);
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                v28 = v27;
                v29 = _UIDescriptionBuilderLightDescription(v18);
                *(_DWORD *)buf = 138412290;
                v43 = v29;
                _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEFAULT, "player dequeue needed - initial request for feedback %@", buf, 0xCu);
              }
            }
            v30 = (void *)MEMORY[0x1E4F1CA48];
            v31 = _Block_copy(v20);
            v32 = [v30 arrayWithObject:v31];

            [(NSMapTable *)self->_playerDequeueBlocks setObject:v32 forKey:v18];
            v33[0] = MEMORY[0x1E4F143A8];
            v33[1] = 3221225472;
            v33[2] = __121___UIFeedbackEngine__internal_playFeedbackData_atTime_feedback_effectiveFeedbackType_existingPlayer_withCompletionBlock___block_invoke_106;
            v33[3] = &unk_1E52ED9E0;
            id v34 = v18;
            v35 = self;
            id v22 = v32;
            id v36 = v22;
            [(_UIFeedbackEngine *)self _internal_dequeueReusableFeedbackPlayerWithCompletionBlock:v33];

            v26 = v34;
          }
        }
      }
      else
      {
        (*((void (**)(id, void, void, __CFString *))v17 + 2))(v17, 0, 0, @"has no effective enabled types");
      }
    }
    else
    {
      (*((void (**)(id, void, void, __CFString *))v17 + 2))(v17, 0, 0, @"engine not running or activating");
    }
  }
  else
  {
    (*((void (**)(id, void, void, __CFString *))v17 + 2))(v17, 0, 0, @"not enabled");
  }
}

+ (id)engineForFeedback:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1EB25D7A0 != -1) {
    dispatch_once(&qword_1EB25D7A0, &__block_literal_global_196);
  }
  v4 = [v3 _individualFeedbacks];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = (id)qword_1EB25D798;
  v6 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (_engineClassSupportsAllIndividualFeedbacks(v9, v4))
        {
          v6 = objc_msgSend(v9, "sharedEngine", (void)v11);
          goto LABEL_13;
        }
      }
      v6 = (void *)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_stats_stateDidChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  if (a4 == 2)
  {
    v8 = [(_UIFeedbackEngine *)self _prewarmCountStatistics];
    [v8 incrementValueBy:1];

    uint64_t v7 = [(_UIFeedbackEngine *)self _prewarmDurationStatistics];
  }
  else
  {
    if (a4 != 4) {
      goto LABEL_6;
    }
    v6 = [(_UIFeedbackEngine *)self _activationCountStatistics];
    [v6 incrementValueBy:1];

    uint64_t v7 = [(_UIFeedbackEngine *)self _activationDurationStatistics];
  }
  v9 = v7;
  [v7 startTimingForObject:self];

LABEL_6:
  if (a3 == 2)
  {
    v10 = [(_UIFeedbackEngine *)self _prewarmDurationStatistics];
  }
  else
  {
    if (a3 != 4) {
      return;
    }
    v10 = [(_UIFeedbackEngine *)self _activationDurationStatistics];
  }
  id v11 = v10;
  [v10 recordTimingForObject:self];
}

- (id)_activationDurationStatistics
{
  v2 = [(_UIFeedbackEngine *)self _statsSuffix];
  id v3 = +[_UIStatistics feedbackEngineActivationDurationWithSuffix:v2];

  return v3;
}

- (void)_playFeedback:(id)a3 atTime:(double)a4 withCompletionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 _effectiveFeedbackData];
  uint64_t v11 = [v8 _effectiveEnabledFeedbackTypes];
  long long v12 = [v8 _player];
  long long v13 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62___UIFeedbackEngine__playFeedback_atTime_withCompletionBlock___block_invoke;
  block[3] = &unk_1E52ED990;
  block[4] = self;
  id v22 = v10;
  double v26 = a4;
  uint64_t v27 = v11;
  id v23 = v8;
  id v24 = v12;
  id v25 = v9;
  long long v14 = v13;
  if (!v13)
  {
    long long v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
  }
  uint64_t v16 = v13;
  id v17 = v9;
  id v18 = v12;
  id v19 = v8;
  id v20 = v10;
  dispatch_async(v14, block);
}

- (id)_prewarmDurationStatistics
{
  v2 = [(_UIFeedbackEngine *)self _statsSuffix];
  id v3 = +[_UIStatistics feedbackEnginePrewarmDurationWithSuffix:v2];

  return v3;
}

- (id)_prewarmCountStatistics
{
  v2 = [(_UIFeedbackEngine *)self _statsSuffix];
  id v3 = +[_UIStatistics feedbackEnginePrewarmCountWithSuffix:v2];

  return v3;
}

- (id)_activationCountStatistics
{
  v2 = [(_UIFeedbackEngine *)self _statsSuffix];
  id v3 = +[_UIStatistics feedbackEngineActivationCountWithSuffix:v2];

  return v3;
}

- (void)_activate:(BOOL)a3 andPerformWhenRunning:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke;
    aBlock[3] = &unk_1E52D9FE8;
    id v18 = v6;
    id v8 = _Block_copy(aBlock);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(id)objc_opt_class() _internalQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53___UIFeedbackEngine__activate_andPerformWhenRunning___block_invoke_3;
  v14[3] = &unk_1E52E3538;
  BOOL v16 = a3;
  v14[4] = self;
  id v15 = v8;
  v10 = v9;
  if (!v9)
  {
    v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
  }
  long long v12 = v9;
  id v13 = v8;
  dispatch_async(v10, v14);
}

- (void)_deactivate
{
  id v3 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___UIFeedbackEngine__deactivate__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  v4 = v3;
  if (!v3)
  {
    v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }
  id v6 = v3;
  dispatch_async(v4, block);
}

- (void)_prewarm:(BOOL)a3 andPerformWhenPrewarmed:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke;
    aBlock[3] = &unk_1E52D9FE8;
    id v18 = v6;
    id v8 = _Block_copy(aBlock);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [(id)objc_opt_class() _internalQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54___UIFeedbackEngine__prewarm_andPerformWhenPrewarmed___block_invoke_3;
  v14[3] = &unk_1E52E3538;
  BOOL v16 = a3;
  v14[4] = self;
  id v15 = v8;
  v10 = v9;
  if (!v9)
  {
    v10 = MEMORY[0x1E4F14428];
    id v11 = MEMORY[0x1E4F14428];
  }
  long long v12 = v9;
  id v13 = v8;
  dispatch_async(v10, v14);
}

- (void)_setState:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  unint64_t state = self->_state;
  self->_unint64_t state = a3;
  if (state != a3)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_setState____s_category_0) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = NSString;
        id v8 = self;
        id v9 = v6;
        v10 = objc_msgSend(v7, "stringWithFormat:", @"<%s: %p>", object_getClassName(v8), v8);

        id v11 = v10;
        long long v12 = stringForFeedbackEngineState(state);
        id v13 = stringForFeedbackEngineState(a3);
        *(_DWORD *)buf = 138412802;
        id v19 = v10;
        __int16 v20 = 2112;
        uint64_t v21 = v12;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "engine %@ state changed: %@ -> %@", buf, 0x20u);
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __31___UIFeedbackEngine__setState___block_invoke;
    block[3] = &unk_1E52DD178;
    block[4] = self;
    void block[5] = state;
    block[6] = a3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    if (os_variant_has_internal_diagnostics())
    {
      if (_UIApplicationProcessIsSpringBoard())
      {
        if (!state)
        {
          id v15 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__sb_stuckInNonInactiveState selector:0 userInfo:0 repeats:60.0];
          springBoardTimer = self->_springBoardTimer;
          self->_springBoardTimer = v15;

          long long v14 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
          [v14 addTimer:self->_springBoardTimer forMode:*MEMORY[0x1E4F1C4B0]];
          goto LABEL_12;
        }
        if (!a3)
        {
          [(NSTimer *)self->_springBoardTimer invalidate];
          long long v14 = self->_springBoardTimer;
          self->_springBoardTimer = 0;
LABEL_12:
        }
      }
    }
  }
}

- (void)_internal_activate:(BOOL)a3 andPerformWhenRunning:(id)a4
{
  BOOL v4 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, uint64_t))a4;
  [(id)objc_opt_class() _internalQueue];

  if (v4)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_activate_andPerformWhenRunning____s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = NSString;
        id v9 = self;
        v10 = v7;
        id v11 = objc_msgSend(v8, "stringWithFormat:", @"<%s: %p>", object_getClassName(v9), v9);

        id v12 = v11;
        *(_DWORD *)buf = 138412802;
        id v18 = v11;
        __int16 v19 = 2048;
        uint64_t v20 = [(_UIFeedbackEngine *)v9 numberOfClients];
        __int16 v21 = 2048;
        uint64_t v22 = [(_UIFeedbackEngine *)v9 numberOfClients] + 1;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "activate engine %@, clientCount: %ld -> %ld", buf, 0x20u);
      }
    }
    ++self->_numberOfClients;
    if ([(_UIFeedbackEngine *)self _internal_isSuspended])
    {
      self->_suspensionState = 4;
      goto LABEL_18;
    }
  }
  else if ([(_UIFeedbackEngine *)self _internal_isSuspended])
  {
LABEL_18:
    if (v6) {
      v6[2](v6, 1);
    }
    goto LABEL_20;
  }
  switch([(_UIFeedbackEngine *)self _state])
  {
    case 0:
    case 2:
      goto LABEL_9;
    case 1:
      [(_UIFeedbackEngine *)self _internal_performAtState:4 block:v6];
      if (!v4) {
        break;
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __62___UIFeedbackEngine__internal_activate_andPerformWhenRunning___block_invoke;
      v16[3] = &unk_1E52DC3A0;
      v16[4] = self;
      id v13 = (void (**)(id, uint64_t))v16;
      long long v14 = self;
      uint64_t v15 = 2;
LABEL_14:
      [(_UIFeedbackEngine *)v14 _internal_performAtState:v15 block:v13];
      break;
    case 3:
      long long v14 = self;
      uint64_t v15 = 4;
      id v13 = v6;
      goto LABEL_14;
    case 4:
      goto LABEL_18;
    case 5:
      if ([(id)objc_opt_class() _supportsAbortingDeactivation] && v4)
      {
        [(_UIFeedbackEngine *)self _setState:4];
        goto LABEL_18;
      }
LABEL_9:
      [(_UIFeedbackEngine *)self _internal_performAtState:4 block:v6];
      if (v4) {
        [(_UIFeedbackEngine *)self _internal_activateEngine];
      }
      break;
    default:
      break;
  }
LABEL_20:
}

- (void)_internal_setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  if (!v3)
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  if (qword_1EB25D810 != -1) {
    dispatch_once(&qword_1EB25D810, &__block_literal_global_290);
  }
  if (byte_1EB25D791)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7B0) + 8);
      BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      BOOL v7 = 0;
      if (!v6) {
        goto LABEL_9;
      }
      id v8 = NSString;
      id v9 = self;
      v10 = v5;
      objc_msgSend(v8, "stringWithFormat:", @"<%s: %p>", object_getClassName(v9), v9);
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v11;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "ignoring request to suspend due to background feedback entitlement for engine %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  BOOL v7 = 1;
LABEL_9:
  int suspended = self->_suspended;
  self->_int suspended = v7;
  int v13 = [(_UIFeedbackEngine *)self _internal_isSuspended];
  if (suspended != v13)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      int v14 = v13;
      uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7B8) + 8);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        if (suspended) {
          BOOL v16 = @"YES";
        }
        else {
          BOOL v16 = @"NO";
        }
        if (v14) {
          id v17 = @"YES";
        }
        else {
          id v17 = @"NO";
        }
        id v18 = NSString;
        __int16 v19 = self;
        uint64_t v20 = v15;
        __int16 v21 = objc_msgSend(v18, "stringWithFormat:", @"<%s: %p>", object_getClassName(v19), v19);

        *(_DWORD *)buf = 138412802;
        uint64_t v23 = v16;
        __int16 v24 = 2112;
        id v25 = v17;
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "suspended changed from: %@ --> %@ for engine %@", buf, 0x20u);
      }
    }
    [(_UIFeedbackEngine *)self _internal_updateSuspension];
  }
}

- (BOOL)_internal_isSuspended
{
  return self->_suspended;
}

- (void)_applicationDidResume:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_applicationDidResume____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      BOOL v6 = self;
      BOOL v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "app did resume for engine %@", buf, 0xCu);
    }
  }
  [(_UIFeedbackEngine *)self _setSuspended:0];
}

- (void)_setSuspended:(BOOL)a3
{
  if (pthread_main_np() == 1)
  {
    [(NSTimer *)self->_suspensionTimer invalidate];
    suspensionTimer = self->_suspensionTimer;
    self->_suspensionTimer = 0;

    BOOL v6 = [(id)objc_opt_class() _internalQueue];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __35___UIFeedbackEngine__setSuspended___block_invoke;
    v11[3] = &unk_1E52D9FC0;
    v11[4] = self;
    BOOL v12 = a3;
    BOOL v7 = v6;
    if (!v6)
    {
      BOOL v7 = MEMORY[0x1E4F14428];
      id v8 = MEMORY[0x1E4F14428];
    }
    id v9 = v6;
    dispatch_async(v7, v11);
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_setSuspended____s_category) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "trying to suspend the feedback engine from a non-main thread, this is unsupported.", buf, 2u);
    }
  }
}

- (void)_internal_deactivate
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    BOOL v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_deactivate___s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      BOOL v6 = self;
      BOOL v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      id v9 = v8;
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = [(_UIFeedbackEngine *)v6 numberOfClients];
      __int16 v18 = 2048;
      uint64_t v19 = [(_UIFeedbackEngine *)v6 numberOfClients] - 1;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "deactivate engine %@, clientCount: %ld -> %ld", buf, 0x20u);
    }
  }
  if (![(_UIFeedbackEngine *)self numberOfClients])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v11 = (objc_class *)objc_opt_class();
    BOOL v12 = NSStringFromClass(v11);
    int v13 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"_UIFeedbackEngine.m", 609, @"ERROR: -[%@ %@] called more times than the feedback engine was activated", v12, v13 object file lineNumber description];
  }
  --self->_numberOfClients;
  if (![(_UIFeedbackEngine *)self numberOfClients])
  {
    if ([(_UIFeedbackEngine *)self _internal_isSuspended])
    {
      if (self->_suspensionState == 4)
      {
        if ([(_UIFeedbackEngine *)self prewarmCount] < 1) {
          self->_suspensionState = 0;
        }
        else {
          self->_suspensionState = 2;
        }
      }
    }
    else
    {
      [(_UIFeedbackEngine *)self _internal_deactivateEngineIfPossible];
    }
  }
}

- (unint64_t)numberOfClients
{
  return self->_numberOfClients;
}

- (int64_t)prewarmCount
{
  return self->_prewarmCount;
}

- (void)_internal_updateSuspension
{
  [(id)objc_opt_class() _internalQueue];

  if (![(_UIFeedbackEngine *)self _internal_isSuspended])
  {
    [(_UIFeedbackEngine *)self _internal_teardownBackgroundTask];
    int64_t suspensionState = self->_suspensionState;
    if (suspensionState == 4)
    {
      if ([(_UIFeedbackEngine *)self prewarmCount] < 1)
      {
        [(_UIFeedbackEngine *)self _internal_activateEngine];
        goto LABEL_15;
      }
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __47___UIFeedbackEngine__internal_updateSuspension__block_invoke;
      v5[3] = &unk_1E52DC3A0;
      v5[4] = self;
      [(_UIFeedbackEngine *)self _internal_performAtState:2 block:v5];
    }
    else if (suspensionState != 2)
    {
      goto LABEL_15;
    }
    [(_UIFeedbackEngine *)self _internal_prewarmEngine];
LABEL_15:
    self->_int64_t suspensionState = 0;
    return;
  }
  unint64_t v3 = [(_UIFeedbackEngine *)self _state];
  if (v3 <= 5) {
    self->_int64_t suspensionState = qword_186B950C0[v3];
  }
  [(_UIFeedbackEngine *)self _internal_deactivateEngineIfPossible];
  [(_UIFeedbackEngine *)self _internal_cooldownEngineIfPossible];
  if (([(_UIFeedbackEngine *)self _state] & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    [(_UIFeedbackEngine *)self _internal_setupBackgroundTask];
  }
}

- (void)_internal_teardownBackgroundTask
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  unint64_t v3 = [(_UIFeedbackEngine *)self _backgroundTaskIdentifier];
  if (v3)
  {
    unint64_t v4 = v3;
    if (!_UIFeedbackLoggingDisabled)
    {
      id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_teardownBackgroundTask___s_category) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v6 = NSString;
        BOOL v7 = self;
        id v8 = v5;
        id v9 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

        *(_DWORD *)buf = 134218242;
        unint64_t v11 = v4;
        __int16 v12 = 2112;
        int v13 = v9;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "ended background task with ID %ld for engine %@", buf, 0x16u);
      }
    }
    [(_UIFeedbackEngine *)self _setBackgroundTaskIdentifier:0];
    [(id)UIApp endBackgroundTask:v4];
  }
}

- (unint64_t)_backgroundTaskIdentifier
{
  return self->_backgroundTaskIdentifier;
}

- (void)_internal_performAtState:(int64_t)a3 block:(id)a4
{
  id aBlock = a4;
  [(id)objc_opt_class() _internalQueue];

  BOOL v6 = aBlock;
  if (aBlock)
  {
    completionBlocks = self->_completionBlocks;
    if (!completionBlocks)
    {
      id v8 = [MEMORY[0x1E4F1CA60] dictionary];
      id v9 = self->_completionBlocks;
      self->_completionBlocks = v8;

      completionBlocks = self->_completionBlocks;
    }
    v10 = [NSNumber numberWithInteger:a3];
    unint64_t v11 = [(NSMutableDictionary *)completionBlocks objectForKeyedSubscript:v10];

    if (!v11)
    {
      unint64_t v11 = [MEMORY[0x1E4F1CA48] array];
      __int16 v12 = self->_completionBlocks;
      int v13 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];
    }
    uint64_t v14 = _Block_copy(aBlock);
    [v11 addObject:v14];

    BOOL v6 = aBlock;
  }
}

- (void)_internal_startWarmingFeedbacks:(id)a3
{
  unint64_t v3 = [(id)objc_opt_class() _internalQueue];
}

- (void)_startWarmingFeedbacks:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _internalQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___UIFeedbackEngine__startWarmingFeedbacks___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v11 = v4;
  BOOL v6 = v5;
  if (!v5)
  {
    BOOL v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
  }
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3
{
  unint64_t v3 = (void (**)(id, uint64_t))a3;
  [(id)objc_opt_class() _internalQueue];

  v3[2](v3, 1);
}

- (void)_internal_serviceBlocksForState:(int64_t)a3 withSuccess:(BOOL)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  BOOL v6 = [NSNumber numberWithInteger:a3];
  id v7 = [(NSMutableDictionary *)self->_completionBlocks objectForKeyedSubscript:v6];
  [(NSMutableDictionary *)self->_completionBlocks removeObjectForKey:v6];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_internal_prewarm:(BOOL)a3 andPerformWhenPrewarmed:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v6 = (void (**)(id, uint64_t))a4;
  [(id)objc_opt_class() _internalQueue];

  if (v4)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_prewarm_andPerformWhenPrewarmed____s_category)+ 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = NSString;
        uint64_t v9 = self;
        uint64_t v10 = v7;
        uint64_t v11 = objc_msgSend(v8, "stringWithFormat:", @"<%s: %p>", object_getClassName(v9), v9);

        int64_t prewarmCount = v9->_prewarmCount;
        *(_DWORD *)buf = 138412802;
        long long v16 = v11;
        __int16 v17 = 2048;
        int64_t v18 = prewarmCount;
        __int16 v19 = 2048;
        int64_t v20 = prewarmCount + 1;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "prewarm engine %@, prewarmCount: %ld -> %ld", buf, 0x20u);
      }
    }
    ++self->_prewarmCount;
    if ([(_UIFeedbackEngine *)self _internal_isSuspended])
    {
      if (!self->_suspensionState) {
        self->_int64_t suspensionState = 2;
      }
      goto LABEL_12;
    }
  }
  else if ([(_UIFeedbackEngine *)self _internal_isSuspended])
  {
LABEL_12:
    if (v6) {
      v6[2](v6, 1);
    }
    goto LABEL_17;
  }
  switch([(_UIFeedbackEngine *)self _state])
  {
    case 0:
    case 5:
      [(_UIFeedbackEngine *)self _internal_performAtState:2 block:v6];
      if (v4) {
        [(_UIFeedbackEngine *)self _internal_prewarmEngine];
      }
      break;
    case 1:
      long long v13 = self;
      uint64_t v14 = 2;
      goto LABEL_16;
    case 2:
    case 4:
      goto LABEL_12;
    case 3:
      long long v13 = self;
      uint64_t v14 = 4;
LABEL_16:
      [(_UIFeedbackEngine *)v13 _internal_performAtState:v14 block:v6];
      break;
    default:
      break;
  }
LABEL_17:
}

- (void)_internal_activateEngine
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int64_t v4 = [(_UIFeedbackEngine *)self _state];
  if (has_internal_diagnostics)
  {
    if (v4 == 3)
    {
      uint64_t v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v14 = self;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Attempt to activate an activating engine (%@)", buf, 0xCu);
      }
    }
  }
  else if (v4 == 3)
  {
    uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25D7C0) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Attempt to activate an activating engine (%@)", buf, 0xCu);
    }
  }
  if ([(_UIFeedbackEngine *)self numberOfClients])
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7C8) + 8);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v6 = NSString;
        id v7 = self;
        id v8 = v5;
        objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);
        uint64_t v9 = (_UIFeedbackEngine *)objc_claimAutoreleasedReturnValue();

        *(_DWORD *)buf = 138412290;
        uint64_t v14 = v9;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "activating engine %@", buf, 0xCu);
      }
    }
    [(_UIFeedbackEngine *)self _setState:3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45___UIFeedbackEngine__internal_activateEngine__block_invoke;
    v12[3] = &unk_1E52DC3A0;
    v12[4] = self;
    [(_UIFeedbackEngine *)self _internal_activateUnderlyingPlayerWithCompletion:v12];
  }
}

- (void)_internal_prewarmEngine
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int64_t v4 = [(_UIFeedbackEngine *)self _state];
  if (has_internal_diagnostics)
  {
    if (v4 == 1)
    {
      id v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v9 = self;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Attempt to prewarm a prewarming engine (%@)", buf, 0xCu);
      }
    }
  }
  else if (v4 == 1)
  {
    BOOL v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_internal_prewarmEngine___s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = self;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Attempt to prewarm a prewarming engine (%@)", buf, 0xCu);
    }
  }
  if ([(_UIFeedbackEngine *)self prewarmCount])
  {
    if (![(_UIFeedbackEngine *)self _state]) {
      [(_UIFeedbackEngine *)self _setState:1];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44___UIFeedbackEngine__internal_prewarmEngine__block_invoke;
    v7[3] = &unk_1E52DC3A0;
    v7[4] = self;
    [(_UIFeedbackEngine *)self _internal_prewarmUnderlyingPlayerWithCompletion:v7];
  }
}

- (int64_t)_state
{
  return self->_state;
}

- (void)_applicationDidBecomeActive:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    int64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_applicationDidBecomeActive____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      BOOL v6 = self;
      id v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "app did become active for engine %@", buf, 0xCu);
    }
  }
  [(_UIFeedbackEngine *)self _setSuspended:0];
}

- (_UIFeedbackEngine)init
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)_UIFeedbackEngine;
  v2 = [(_UIFeedbackEngine *)&v14 init];
  v2->_enabled = 1;
  v2->_backgroundTaskIdentifier = 0;
  uint64_t v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:512 valueOptions:0];
  playerDequeueBlocks = v2->_playerDequeueBlocks;
  v2->_playerDequeueBlocks = (NSMapTable *)v3;

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  if ((_UIApplicationIsExtension() & 1) != 0 || _UIApplicationMayVendViews())
  {
    [v5 addObserver:v2 selector:sel__hostDidEnterBackground_ name:0x1ED1802E0 object:0];
    [v5 addObserver:v2 selector:sel__hostWillEnterForeground_ name:0x1ED180300 object:0];
    uint64_t v6 = 0;
    id v7 = &selRef__remoteViewControllerWillDisconnect_;
    id v8 = (const NSNotificationName *)&_UIViewServiceRemoteViewControllerWillDisconnectNotificationName;
  }
  else
  {
    if (([(id)UIApp isSuspended] & 1) != 0
      || [(id)UIApp isSuspendedEventsOnly])
    {
      if (qword_1EB25D810 != -1) {
        dispatch_once(&qword_1EB25D810, &__block_literal_global_290);
      }
      if (!byte_1EB25D791)
      {
        v2->_int suspended = 1;
        v2->_int64_t suspensionState = 0;
        if (!_UIFeedbackLoggingDisabled)
        {
          uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25D7A8) + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = v9;
            uint64_t v11 = _UIDescriptionBuilderLightDescription(v2);
            *(_DWORD *)buf = 138412290;
            long long v16 = v11;
            _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "creating engine while app suspended %@", buf, 0xCu);
          }
        }
      }
    }
    [v5 addObserver:v2 selector:sel__applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:UIApp];
    [v5 addObserver:v2 selector:sel__applicationWillSuspend_ name:@"UIApplicationSuspendedNotification" object:UIApp];
    [v5 addObserver:v2 selector:sel__applicationWillSuspend_ name:@"UIApplicationSuspendedEventsOnlyNotification" object:UIApp];
    [v5 addObserver:v2 selector:sel__applicationDidResume_ name:@"UIApplicationResumedNotification" object:UIApp];
    [v5 addObserver:v2 selector:sel__applicationDidResume_ name:@"UIApplicationResumedEventsOnlyNotification" object:UIApp];
    uint64_t v6 = UIApp;
    id v7 = &selRef__applicationDidBecomeActive_;
    id v8 = &UIApplicationDidBecomeActiveNotification;
  }
  [v5 addObserver:v2 selector:*v7 name:*v8 object:v6];
  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_EnableFeedbackEngineStateVisualization, @"EnableFeedbackEngineStateVisualization") & 1) == 0&& byte_1EB2571AC)
  {
    uint64_t v12 = +[_UIFeedbackVisualizer sharedVisualizer];
    [v12 addEngine:v2];
  }
  return v2;
}

- (void)_internal_willPlayFeedback:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  [(id)objc_opt_class() _internalQueue];

  if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_907, @"EnableFeedbackVisualization") & 1) == 0
    && byte_1EB2571B4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55___UIFeedbackEngine__internal_willPlayFeedback_atTime___block_invoke;
    block[3] = &unk_1E52DA070;
    double v9 = a4;
    block[4] = self;
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_internal_deactivateEngineIfPossible
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  uint64_t v3 = NSString;
  int64_t v4 = self;
  id v5 = objc_msgSend(v3, "stringWithFormat:", @"<%s: %p>", object_getClassName(v4), v4);

  if (!_UIFeedbackLoggingDisabled)
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_deactivateEngineIfPossible___s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      *(_DWORD *)buf = 138412802;
      long long v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = [(_UIFeedbackEngine *)v4 numberOfClients];
      __int16 v16 = 2048;
      uint64_t v17 = [(_UIFeedbackEngine *)v4 _internal_isSuspended];
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "_internal_deactivateEngineIfPossible %@, clientCount: %ld, suspended: %ld", buf, 0x20u);
    }
  }
  if ([(_UIFeedbackEngine *)v4 _state] == 3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke;
    v11[3] = &unk_1E52DC3A0;
    v11[4] = v4;
    [(_UIFeedbackEngine *)v4 _internal_performAtState:4 block:v11];
  }
  else if (![(_UIFeedbackEngine *)v4 numberOfClients] {
         || [(_UIFeedbackEngine *)v4 _internal_isSuspended])
  }
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57___UIFeedbackEngine__internal_deactivateEngineIfPossible__block_invoke_2;
    v8[3] = &unk_1E52DA660;
    id v9 = v5;
    uint64_t v10 = v4;
    [(_UIFeedbackEngine *)v4 _internal_teardownUnderlyingPlayerIfPossibleWithCompletion:v8];
  }
}

- (id)_outOfChannelsCountStatistics
{
  v2 = [(_UIFeedbackEngine *)self _statsSuffix];
  uint64_t v3 = +[_UIStatistics feedbackEngineOutOfChannelsCountWithSuffix:v2];

  return v3;
}

- (void)_stats_outOfChannels
{
  id v2 = [(_UIFeedbackEngine *)self _outOfChannelsCountStatistics];
  [v2 incrementValueBy:1];
}

+ (OS_dispatch_queue)_internalQueue
{
  return 0;
}

+ (id)sharedEngine
{
  int64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"_UIFeedbackEngine.m" lineNumber:175 description:@"Should use one of the subclasses"];

  return 0;
}

+ (BOOL)_supportsPlayingFeedback:(id)a3
{
  int64_t v4 = [a3 _individualFeedbacks];
  LOBYTE(a1) = _engineClassSupportsAllIndividualFeedbacks(a1, v4);

  return (char)a1;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  return 0;
}

+ (BOOL)_supportsPlayingFeedbackPatternsDirectly
{
  return 0;
}

+ (BOOL)_supportsAbortingDeactivation
{
  return 1;
}

- (id)description
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [[UIDescriptionBuilder alloc] initWithObject:self];
  int64_t v4 = NSStringFromSelector(sel_state);
  id v5 = [(UIDescriptionBuilder *)v3 appendName:v4 integerValue:self->_state];

  id v6 = NSStringFromSelector(sel_numberOfClients);
  long long v13 = v6;
  id v7 = NSStringFromSelector(sel_prewarmCount);
  __int16 v14 = v7;
  id v8 = NSStringFromSelector(sel__internal_isSuspended);
  uint64_t v15 = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
  id v10 = -[UIDescriptionBuilder appendKeys:](v3, "appendKeys:", v9, v13, v14);

  uint64_t v11 = [(UIDescriptionBuilder *)v3 string];

  return v11;
}

- (void)_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  [(id)objc_opt_class() _internalQueue];

  v3[2](v3, 1);
}

- (void)_stopWarmingFeedbacks:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _internalQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43___UIFeedbackEngine__stopWarmingFeedbacks___block_invoke;
  v10[3] = &unk_1E52D9F98;
  v10[4] = self;
  id v11 = v4;
  id v6 = v5;
  if (!v5)
  {
    id v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
  }
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (void)_internal_stopWarmingFeedbacks:(id)a3
{
  uint64_t v3 = [(id)objc_opt_class() _internalQueue];
}

- (void)_cooldown
{
  uint64_t v3 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30___UIFeedbackEngine__cooldown__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  id v4 = v3;
  if (!v3)
  {
    id v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }
  id v6 = v3;
  dispatch_async(v4, block);
}

- (void)_internal_cooldown
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_cooldown___s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      id v6 = self;
      id v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      int64_t prewarmCount = v6->_prewarmCount;
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v8;
      __int16 v18 = 2048;
      int64_t v19 = prewarmCount;
      __int16 v20 = 2048;
      int64_t v21 = prewarmCount - 1;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "cooldown engine %@, prewarmCount: %ld -> %ld", buf, 0x20u);
    }
  }
  int64_t v10 = self->_prewarmCount;
  if (v10 <= 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v13 = (objc_class *)objc_opt_class();
    __int16 v14 = NSStringFromClass(v13);
    uint64_t v15 = NSStringFromSelector(a2);
    [v12 handleFailureInMethod:a2, self, @"_UIFeedbackEngine.m", 801, @"ERROR: -[%@ %@] called more times than the feedback engine was pre-warmed", v14, v15 object file lineNumber description];

    int64_t v10 = self->_prewarmCount;
  }
  int64_t v11 = v10 - 1;
  self->_int64_t prewarmCount = v11;
  if (!v11)
  {
    if ([(_UIFeedbackEngine *)self _internal_isSuspended])
    {
      if (self->_suspensionState == 2) {
        self->_int64_t suspensionState = 0;
      }
    }
    else
    {
      [(_UIFeedbackEngine *)self _internal_cooldownEngineIfPossible];
    }
  }
}

- (void)_internal_cooldownEngineIfPossible
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    uint64_t v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_cooldownEngineIfPossible___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = v3;
      id v7 = objc_msgSend(v4, "stringWithFormat:", @"<%s: %p>", object_getClassName(v5), v5);

      *(_DWORD *)buf = 138412290;
      int64_t v11 = v7;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "_internal_cooldownEngineIfPossible %@", buf, 0xCu);
    }
  }
  if ([(_UIFeedbackEngine *)self _state] == 1)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke;
    v9[3] = &unk_1E52DC3A0;
    v9[4] = self;
    [(_UIFeedbackEngine *)self _internal_performAtState:2 block:v9];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55___UIFeedbackEngine__internal_cooldownEngineIfPossible__block_invoke_2;
    v8[3] = &unk_1E52DC3A0;
    void v8[4] = self;
    [(_UIFeedbackEngine *)self _internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:v8];
  }
}

- (void)_internal_prewarmUnderlyingPlayerWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  [(id)objc_opt_class() _internalQueue];

  v3[2](v3, 1);
}

- (void)_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, uint64_t))a3;
  [(id)objc_opt_class() _internalQueue];

  v3[2](v3, 1);
}

- (void)_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _internalQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71___UIFeedbackEngine__dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E52DA160;
  v10[4] = self;
  id v11 = v4;
  id v6 = v5;
  if (!v5)
  {
    id v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
  }
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v6, v10);
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  [(id)objc_opt_class() _internalQueue];

  v3[2](v3, 0);
}

- (void)_internal_willCancelFeedback:(id)a3
{
  id v3 = a3;
  [(id)objc_opt_class() _internalQueue];

  if ((_UIInternalPreferenceUsesDefault_0(&_MergedGlobals_907, @"EnableFeedbackVisualization") & 1) == 0
    && byte_1EB2571B4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50___UIFeedbackEngine__internal_willCancelFeedback___block_invoke;
    block[3] = &unk_1E52D9F70;
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_sb_stuckInNonInactiveState
{
  if (self->_state)
  {
    id v3 = dispatch_get_global_queue(17, 0);
    dispatch_async(v3, &__block_literal_global_113_1);
  }
  else if (!_UIFeedbackLoggingDisabled)
  {
    id v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_sb_stuckInNonInactiveState___s_category) + 8);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "Springboard ultimately returned to inactive state. Not reporting.", buf, 2u);
    }
  }
}

- (void)runWhenReady:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34___UIFeedbackEngine_runWhenReady___block_invoke;
  v6[3] = &unk_1E52EDA60;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(_UIFeedbackEngine *)self _activate:1 andPerformWhenRunning:v6];
}

- (void)_applicationWillResignActive:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_UIFeedbackLoggingDisabled)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_applicationWillResignActive____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSString;
      id v7 = self;
      id v8 = v5;
      id v9 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

      *(_DWORD *)buf = 138412290;
      long long v13 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "app will resign active for engine %@", buf, 0xCu);
    }
  }
  if (!self->_suspensionTimer)
  {
    int64_t v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__suspendEngineNow selector:0 userInfo:0 repeats:1.0];
    suspensionTimer = self->_suspensionTimer;
    self->_suspensionTimer = v10;
  }
}

- (void)_suspendEngineNow
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    id v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_suspendEngineNow___s_category) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = v3;
      id v7 = objc_msgSend(v4, "stringWithFormat:", @"<%s: %p>", object_getClassName(v5), v5);

      *(_DWORD *)buf = 138412290;
      id v9 = v7;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "_suspendEngineNow for engine %@", buf, 0xCu);
    }
  }
  [(_UIFeedbackEngine *)self _setSuspended:1];
}

- (void)_applicationWillSuspend:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_applicationWillSuspend____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      id v6 = self;
      id v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "app will suspend for engine %@", buf, 0xCu);
    }
  }
  [(_UIFeedbackEngine *)self _setSuspended:1];
}

- (void)_hostDidEnterBackground:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!_UIFeedbackLoggingDisabled)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_hostDidEnterBackground____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSString;
      id v7 = self;
      id v8 = v5;
      id v9 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

      *(_DWORD *)buf = 138412290;
      long long v13 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "host did enter background for engine %@", buf, 0xCu);
    }
  }
  if (!self->_suspensionTimer)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__suspendEngineNow selector:0 userInfo:0 repeats:1.0];
    suspensionTimer = self->_suspensionTimer;
    self->_suspensionTimer = v10;
  }
}

- (void)_hostWillEnterForeground:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", _hostWillEnterForeground____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      id v6 = self;
      id v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "host will enter foreground for engine %@", buf, 0xCu);
    }
  }
  [(_UIFeedbackEngine *)self _setSuspended:0];
}

- (void)_remoteViewControllerWillDisconnect:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!_UIFeedbackLoggingDisabled)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_remoteViewControllerWillDisconnect____s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = NSString;
      id v6 = self;
      id v7 = v4;
      id v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "remote view controller will disconnect for engine %@", buf, 0xCu);
    }
  }
  [(_UIFeedbackEngine *)self _setSuspended:0];
}

- (void)_internal_setupBackgroundTask
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  if (![(_UIFeedbackEngine *)self _backgroundTaskIdentifier])
  {
    id v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = [v3 stringWithFormat:@"%@ Shutdown", v5];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50___UIFeedbackEngine__internal_setupBackgroundTask__block_invoke;
    v13[3] = &unk_1E52D9F70;
    v13[4] = self;
    -[_UIFeedbackEngine _setBackgroundTaskIdentifier:](self, "_setBackgroundTaskIdentifier:", [(id)UIApp _beginBackgroundTaskWithName:v6 expirationHandler:v13]);
    if (!_UIFeedbackLoggingDisabled)
    {
      id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_setupBackgroundTask___s_category) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = v7;
        unint64_t v9 = [(_UIFeedbackEngine *)self _backgroundTaskIdentifier];
        uint64_t v10 = NSString;
        uint64_t v11 = self;
        uint64_t v12 = objc_msgSend(v10, "stringWithFormat:", @"<%s: %p>", object_getClassName(v11), v11);

        *(_DWORD *)buf = 134218242;
        unint64_t v15 = v9;
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "began background task with ID %ld for engine %@", buf, 0x16u);
      }
    }
  }
}

- (NSString)_stats_key
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)setPrewarmCount:(int64_t)a3
{
  self->_int64_t prewarmCount = a3;
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMapTable)_playerDequeueBlocks
{
  return self->_playerDequeueBlocks;
}

- (void)_setPlayerDequeueBlocks:(id)a3
{
}

- (void)_setBackgroundTaskIdentifier:(unint64_t)a3
{
  self->_backgroundTaskIdentifier = a3;
}

- (int64_t)_suspensionState
{
  return self->_suspensionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerDequeueBlocks, 0);
  objc_storeStrong((id *)&self->_springBoardTimer, 0);
  objc_storeStrong((id *)&self->_suspensionTimer, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
}

@end