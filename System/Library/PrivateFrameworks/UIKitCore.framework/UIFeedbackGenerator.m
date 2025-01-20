@interface UIFeedbackGenerator
+ (Class)_configurationClass;
+ (id)behaviorWithConfiguration:(id)a3 coordinateSpace:(id)a4;
+ (id)feedbackGeneratorForView:(id)a3;
+ (void)_resetAutoDeactivateTimeout;
+ (void)_resetPreparationTimeouts;
+ (void)_setAutoDeactivateTimeout:(double)a3;
+ (void)_setPreparationTimeout:(double)a3 forStyle:(int64_t)a4;
+ (void)_setRunningTests:(BOOL)a3;
- (BOOL)_isAutoDeactivated;
- (BOOL)_isEnabled;
- (BOOL)_isMuted;
- (BOOL)isActive;
- (BOOL)usesCustomActivation;
- (NSSet)engines;
- (NSString)_stats_key;
- (NSString)description;
- (UICoordinateSpace)coordinateSpace;
- (UIFeedbackGenerator)init;
- (UIFeedbackGenerator)initWithConfiguration:(id)a3;
- (UIFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4;
- (UIFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4;
- (UIFeedbackGenerator)initWithCoordinateSpace:(id)a3;
- (UIFeedbackGenerator)initWithView:(id)a3;
- (UIView)view;
- (_UIFeedbackGeneratorConfiguration)_configuration;
- (_UIFeedbackGeneratorGestureRecognizer)gestureRecognizer;
- (double)_autoDeactivationTimeout;
- (double)_preparationTimeoutForStyle:(int64_t)a3;
- (id)_activationCountStatistics;
- (id)_activationDurationStatistics;
- (id)_activationTimeOutCountStatistics;
- (id)_playCountStatistics;
- (id)_preparationCountStatistics;
- (id)_preparationTimerForStyle:(int64_t)a3;
- (id)_statsSuffix;
- (id)_ui_descriptionBuilder;
- (int64_t)_outputMode;
- (int64_t)activationCount;
- (int64_t)externalActivationCount;
- (void)__activateWithStyle:(int64_t)a3 forFeedback:(id)a4 completionBlock:(id)a5;
- (void)__deactivateWithStyle:(int64_t)a3;
- (void)_activateWithStyle:(int64_t)a3 completionBlock:(id)a4;
- (void)_activated;
- (void)_autoDeactivate;
- (void)_clientDidUpdateGeneratorWithSelector:(SEL)a3;
- (void)_deactivateWithStyle:(int64_t)a3;
- (void)_deactivated;
- (void)_forceDeactivationForStyle:(int64_t)a3;
- (void)_playFeedback:(id)a3;
- (void)_playFeedback:(id)a3 atLocation:(CGPoint)a4;
- (void)_playFeedback:(id)a3 withMinimumIntervalPassed:(double)a4 since:(double *)a5 prefersRegularPace:(BOOL)a6 atLocation:(CGPoint)a7;
- (void)_prepareWithStyle:(int64_t)a3;
- (void)_resetAutoDeactivationTimeout;
- (void)_scheduleFeedbackWarming;
- (void)_setConfiguration:(id)a3;
- (void)_setMuted:(BOOL)a3;
- (void)_setOutputMode:(int64_t)a3;
- (void)_setPreparationTimer:(id)a3 forStyle:(int64_t)a4;
- (void)_setupAutoDeactivateTimer;
- (void)_setupEnginesIfNeededForFeedback:(id)a3;
- (void)_setupForFeedback:(id)a3;
- (void)_startFeedbackWarming;
- (void)_stats_activationDidChangeTo:(BOOL)a3;
- (void)_stats_activationTimedOut;
- (void)_stats_playedFeedback;
- (void)_stats_prepared;
- (void)_stopAutoDeactivateTimer;
- (void)_stopFeedback:(id)a3;
- (void)_stopFeedbackWarming;
- (void)_stopPreparationForAllStyles;
- (void)_stopPreparationForStyle:(int64_t)a3;
- (void)_updateActivationStateForRemovedEngines:(id)a3 addedEngines:(id)a4 prewarmCount:(int64_t)a5 turnOnCount:(int64_t)a6;
- (void)_updateForViewUserInterfaceIdiom;
- (void)_updatePreparationTimer:(id)a3 withTimeout:(double)a4;
- (void)activateWithCompletionBlock:(id)a3;
- (void)deactivate;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)performFeedbackWithDelay:(double)a3 insideBlock:(id)a4;
- (void)prepare;
- (void)setActivationCount:(int64_t)a3;
- (void)setExternalActivationCount:(int64_t)a3;
- (void)setGestureRecognizer:(id)a3;
- (void)setUsesCustomActivation:(BOOL)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIFeedbackGenerator

- (UIFeedbackGenerator)initWithView:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "defaultConfiguration");
  v6 = [(UIFeedbackGenerator *)self initWithConfiguration:v5 view:v4];

  return v6;
}

- (UIFeedbackGenerator)initWithConfiguration:(id)a3 view:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)UIFeedbackGenerator;
  v9 = [(UIFeedbackGenerator *)&v12 init];
  [(id)objc_opt_class() _configurationClass];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, v9, @"UIFeedbackGenerator.m", 142, @"Invalid configuration class %@ for generator %@", v7, v9 object file lineNumber description];
  }
  [(UIFeedbackGenerator *)v9 _setConfiguration:v7];
  if (v8) {
    [v8 addInteraction:v9];
  }

  return v9;
}

- (void)_setConfiguration:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)willMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);

  if (WeakRetained != v5)
  {
    if (self->_traitChangeRegistration)
    {
      id v7 = objc_loadWeakRetained((id *)p_view);
      [v7 unregisterForTraitChanges:self->_traitChangeRegistration];
    }
    gestureRecognizer = self->_gestureRecognizer;
    if (gestureRecognizer)
    {
      -[_UIFeedbackGeneratorGestureRecognizer cleanupGestureRecognizerForFeedbackGenerator:]((id *)&gestureRecognizer->super.super.isa, self);
      v9 = self->_gestureRecognizer;
      self->_gestureRecognizer = 0;
    }
  }
}

- (void)didMoveToView:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_view, v4);
    [(UIFeedbackGenerator *)self _updateForViewUserInterfaceIdiom];
    v9[0] = 0x1ED3F5A30;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v7 = [v4 _registerForTraitTokenChanges:v6 withTarget:self action:sel__updateForViewUserInterfaceIdiom];
    traitChangeRegistration = self->_traitChangeRegistration;
    self->_traitChangeRegistration = v7;
  }
}

- (void)_updateForViewUserInterfaceIdiom
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_view);
    v6 = [v5 traitCollection];
    uint64_t v7 = [v6 userInterfaceIdiom];

    self->_disabledByView = v7 == 3;
    if (v7 == 1
      && (+[UIDevice currentDevice],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = -[UIDevice _peripheralFeedbackSupportLevel]((uint64_t)v8),
          v8,
          v9 >= 1))
    {
      if (self->_gestureRecognizer) {
        return;
      }
      v14 = (_UIFeedbackGeneratorGestureRecognizer *)objc_loadWeakRetained((id *)p_view);
      +[_UIFeedbackGeneratorGestureRecognizer gestureRecognizerForView:feedbackGenerator:]((uint64_t)_UIFeedbackGeneratorGestureRecognizer, v14, self);
      v10 = (_UIFeedbackGeneratorGestureRecognizer *)objc_claimAutoreleasedReturnValue();
      gestureRecognizer = self->_gestureRecognizer;
      self->_gestureRecognizer = v10;

      objc_super v12 = v14;
    }
    else
    {
      v13 = self->_gestureRecognizer;
      if (!v13) {
        return;
      }
      -[_UIFeedbackGeneratorGestureRecognizer cleanupGestureRecognizerForFeedbackGenerator:]((id *)&v13->super.super.isa, self);
      objc_super v12 = self->_gestureRecognizer;
      self->_gestureRecognizer = 0;
    }
  }
  else
  {
    self->_disabledByView = 0;
  }
}

- (_UIFeedbackGeneratorConfiguration)_configuration
{
  return self->_configuration;
}

- (void)_setOutputMode:(int64_t)a3
{
  id v4 = [(UIFeedbackGenerator *)self _configuration];
  [v4 setOutputMode:a3];
}

- (BOOL)_isEnabled
{
  [(_UIFeedbackGeneratorConfiguration *)self->_configuration _setupIfNecessary];
  v3 = [(UIFeedbackGenerator *)self _configuration];
  if ([v3 isEnabled]) {
    BOOL v4 = !self->_disabledByView;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (UIFeedbackGenerator)init
{
  v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_configurationClass"), "defaultConfiguration");
  BOOL v4 = [(UIFeedbackGenerator *)self initWithConfiguration:v3];

  return v4;
}

- (BOOL)isActive
{
  return self->_externalActivationCount > 0;
}

uint64_t __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__deactivateWithStyle:", 2);
}

void __71__UIFeedbackGenerator___activateWithStyle_forFeedback_completionBlock___block_invoke(uint64_t a1, int a2)
{
  if (*(uint64_t *)(a1 + 64) >= 1) {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
  if (a2) {
    ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  }
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v4 = *(void *)(a1 + 64);
  if (v3 > v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"UIFeedbackGenerator.m" lineNumber:422 description:@"The feedback engine activation block was called more times than the number of engines."];

    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    uint64_t v4 = *(void *)(a1 + 64);
  }
  if (v3 == v4)
  {
    [*(id *)(a1 + 32) _activated];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5)
    {
      v6 = *(void (**)(void))(v5 + 16);
      v6();
    }
  }
}

- (void)_activated
{
  if (!self->_activated)
  {
    [(UIFeedbackGenerator *)self _setupAutoDeactivateTimer];
    [(UIFeedbackGenerator *)self _stats_activationDidChangeTo:1];
    [(UIFeedbackGenerator *)self _scheduleFeedbackWarming];
    self->_activated = 1;
  }
}

- (void)_scheduleFeedbackWarming
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__UIFeedbackGenerator__scheduleFeedbackWarming__block_invoke;
  v5[3] = &unk_1E52DC308;
  objc_copyWeak(&v6, &location);
  dispatch_block_t v3 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, v5);
  id feedbackWarmingBlock = self->_feedbackWarmingBlock;
  self->_id feedbackWarmingBlock = v3;

  dispatch_async(MEMORY[0x1E4F14428], self->_feedbackWarmingBlock);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_stats_prepared
{
  id v2 = [(UIFeedbackGenerator *)self _preparationCountStatistics];
  [v2 incrementValueBy:1];
}

void __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a2) {
    goto LABEL_19;
  }
  [*(id *)(a1 + 32) currentTime];
  uint64_t v4 = *(double **)(a1 + 64);
  if (v4)
  {
    double v5 = v3 - *v4;
    if (v5 < 0.0) {
      goto LABEL_19;
    }
    double v6 = *(double *)(a1 + 72);
    if (v5 <= v6)
    {
      if (!*(unsigned char *)(a1 + 104)) {
        goto LABEL_19;
      }
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *v4
                                                                  + v6
                                                                  - v3
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24);
      *uint64_t v4 = *(double *)(a1 + 72) + *v4;
    }
    else
    {
      *uint64_t v4 = v3;
    }
  }
  else
  {
    double v7 = *(double *)(a1 + 72);
    if (v7 > 0.0) {
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v7
    }
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24);
  }
  *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                          + 24)
                                                              - (v3
                                                               - *(double *)(a1 + 80));
  id v8 = *(id *)(a1 + 40);
  if (*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) > 0.0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = (void *)[*(id *)(a1 + 40) copy];
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      [v9 _delay];
      [v9 _setDelay:v11 + *(double *)(v10 + 24)];
    }
    else
    {
      uint64_t v9 = +[_UIFeedbackPattern feedbackPattern];
      objc_super v12 = [*(id *)(a1 + 40) _category];
      [v9 _setCategory:v12];

      [v9 addFeedback:*(void *)(a1 + 40) atTime:*(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    }

    id v8 = v9;
  }
  v13 = [*(id *)(a1 + 48) view];
  [v8 _setView:v13];

  objc_msgSend(v8, "_setLocation:", *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (!_UIFeedbackLoggingDisabled)
  {
    v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_UIInternalPreference_EnableFeedbackExceptions_block_invoke_3___s_category)+ 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = NSString;
      id v16 = *(id *)(a1 + 48);
      v17 = v14;
      v18 = objc_msgSend(v15, "stringWithFormat:", @"<%s: %p>", object_getClassName(v16), v16);

      v19 = NSString;
      id v20 = v8;
      id v21 = v18;
      v22 = objc_msgSend(v19, "stringWithFormat:", @"<%s: %p>", object_getClassName(v20), v20);

      *(_DWORD *)buf = 138412546;
      v32 = v18;
      __int16 v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "generator %@ playing feedback %@", buf, 0x16u);
    }
  }
  [v8 play];
  objc_msgSend(*(id *)(a1 + 48), "_stats_playedFeedback");

LABEL_19:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke_68;
  block[3] = &unk_1E52D9F70;
  block[4] = *(void *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
  v23 = *(void **)(*(void *)(a1 + 48) + 72);
  if (v23)
  {
    v24 = (void *)[v23 copy];
    dispatch_block_cancel(*(dispatch_block_t *)(*(void *)(a1 + 48) + 72));
    v25 = _Block_copy(v24);
    uint64_t v26 = *(void *)(a1 + 48);
    v27 = *(void **)(v26 + 72);
    *(void *)(v26 + 72) = v25;

    v28 = *(void **)(*(void *)(a1 + 48) + 72);
    v29 = (void *)MEMORY[0x1E4F14428];
    dispatch_async(MEMORY[0x1E4F14428], v28);
  }
}

- (void)_stats_playedFeedback
{
  id v2 = [(UIFeedbackGenerator *)self _playCountStatistics];
  [v2 incrementValueBy:1];
}

- (void)_stats_activationDidChangeTo:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = [(UIFeedbackGenerator *)self _activationCountStatistics];
    [v4 incrementValueBy:1];

    id v5 = [(UIFeedbackGenerator *)self _activationDurationStatistics];
    [v5 startTimingForObject:self];
  }
  else
  {
    id v5 = [(UIFeedbackGenerator *)self _activationDurationStatistics];
    [v5 recordTimingForObject:self];
  }
}

- (UIFeedbackGenerator)initWithConfiguration:(id)a3
{
  return [(UIFeedbackGenerator *)self initWithConfiguration:a3 view:0];
}

- (id)_activationCountStatistics
{
  id v2 = [(UIFeedbackGenerator *)self _statsSuffix];
  double v3 = +[_UIStatistics feedbackGeneratorActivationCountWithSuffix:v2];

  return v3;
}

- (id)_activationDurationStatistics
{
  id v2 = [(UIFeedbackGenerator *)self _statsSuffix];
  double v3 = +[_UIStatistics feedbackGeneratorActivationDurationWithSuffix:v2];

  return v3;
}

- (id)_statsSuffix
{
  double v3 = [(UIFeedbackGenerator *)self _stats_key];
  uint64_t v4 = [(UIFeedbackGenerator *)self _configuration];
  id v5 = objc_msgSend(v4, "_stats_key");

  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"%@.%@", v3, v5];
  }
  else
  {
    id v6 = v3;
  }
  double v7 = v6;

  return v7;
}

- (id)_playCountStatistics
{
  id v2 = [(UIFeedbackGenerator *)self _statsSuffix];
  double v3 = +[_UIStatistics feedbackGeneratorPlayCountWithSuffix:v2];

  return v3;
}

- (id)_preparationCountStatistics
{
  id v2 = [(UIFeedbackGenerator *)self _statsSuffix];
  double v3 = +[_UIStatistics feedbackGeneratorPreparationCountWithSuffix:v2];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engines, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_usedFeedbacks, 0);
  objc_storeStrong(&self->_feedbackWarmingBlock, 0);
  objc_storeStrong((id *)&self->_preparationTimers, 0);
  objc_storeStrong((id *)&self->_autoDeactivateTimer, 0);
}

- (void)_prepareWithStyle:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  [(UIFeedbackGenerator *)self _preparationTimeoutForStyle:"_preparationTimeoutForStyle:"];
  if (v5 > 0.0)
  {
    double v6 = v5;
    if (!_UIFeedbackLoggingDisabled)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &_prepareWithStyle____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v10 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          double v11 = v10;
          objc_super v12 = stringForActivationStyle(a3);
          *(_DWORD *)id location = 138412802;
          *(void *)&location[4] = self;
          __int16 v20 = 2112;
          id v21 = v12;
          __int16 v22 = 2048;
          double v23 = v6;
          _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "prepare %@ with style %@, timeout %g sec", location, 0x20u);
        }
      }
    }
    id v8 = [(UIFeedbackGenerator *)self _preparationTimerForStyle:a3];
    if (v8)
    {
      [(UIFeedbackGenerator *)self _updatePreparationTimer:v8 withTimeout:v6];
    }
    else
    {
      objc_initWeak((id *)location, self);
      uint64_t v9 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __41__UIFeedbackGenerator__prepareWithStyle___block_invoke;
      handler[3] = &unk_1E52DF528;
      objc_copyWeak(v18, (id *)location);
      v18[1] = (id)a3;
      dispatch_source_set_event_handler(v9, handler);
      [(UIFeedbackGenerator *)self _setPreparationTimer:v9 forStyle:a3];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __41__UIFeedbackGenerator__prepareWithStyle___block_invoke_30;
      v13[3] = &unk_1E52ECC68;
      v13[4] = self;
      id v8 = v9;
      v14 = v8;
      double v15 = v6;
      int64_t v16 = a3;
      [(UIFeedbackGenerator *)self _activateWithStyle:a3 completionBlock:v13];

      objc_destroyWeak(v18);
      objc_destroyWeak((id *)location);
    }
  }
}

- (void)_playFeedback:(id)a3 withMinimumIntervalPassed:(double)a4 since:(double *)a5 prefersRegularPace:(BOOL)a6 atLocation:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  kdebug_trace();
  if (v13 && [(UIFeedbackGenerator *)self _isEnabled])
  {
    gestureRecognizer = self->_gestureRecognizer;
    if (!gestureRecognizer || x == 1.79769313e308 && y == 1.79769313e308)
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackGesture", &qword_1EB260430) + 8);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v16 = NSString;
          v17 = self->_gestureRecognizer;
          v18 = v15;
          v19 = objc_msgSend(v16, "stringWithFormat:", @"<%s: %p>", object_getClassName(v17), v17);

          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v19;
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "playing feedback without gesture recognizer (%@) or at null point", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v58 = 0;
      *(void *)buf = 0;
      if ([(_UIFeedbackGeneratorGestureRecognizer *)(uint64_t)gestureRecognizer hasDeviceInputForLocation:&v58 type:x senderID:y])
      {
        v30 = [(UIFeedbackGenerator *)self _configuration];
        uint64_t v31 = [v30 _alternateFeedback:v13 forDevice:*(void *)buf senderID:v58];

        id v13 = (id)v31;
      }
    }
    v32 = [(UIFeedbackGenerator *)self _configuration];
    id v26 = [v32 _updateFeedbackForOutputMode:v13];

    __int16 v33 = +[_UIFeedbackEngine engineForFeedback:v26];
    v34 = v33;
    if (v33)
    {
      [v33 currentTime];
      uint64_t v36 = v35;
      [(UIFeedbackGenerator *)self _outputMode];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      currentDeladouble y = self->_currentDelay;
      *(void *)&buf[16] = 0x2020000000;
      double v60 = currentDelay;
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __99__UIFeedbackGenerator__playFeedback_withMinimumIntervalPassed_since_prefersRegularPace_atLocation___block_invoke;
      v47[3] = &unk_1E52ECCB8;
      v51 = buf;
      v52 = a5;
      BOOL v57 = a6;
      id v48 = v34;
      double v53 = a4;
      uint64_t v54 = v36;
      id v49 = v26;
      v50 = self;
      double v55 = x;
      double v56 = y;
      [(UIFeedbackGenerator *)self __activateWithStyle:2 forFeedback:v49 completionBlock:v47];
      [(UIFeedbackGenerator *)self _stopPreparationForStyle:2];
      [(UIFeedbackGenerator *)self _stopPreparationForStyle:1];

      _Block_object_dispose(buf, 8);
    }
    else if (!_UIFeedbackLoggingDisabled)
    {
      v38 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB260438) + 8);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = NSString;
        id v40 = v26;
        v41 = v38;
        v42 = objc_msgSend(v39, "stringWithFormat:", @"<%s: %p>", object_getClassName(v40), v40);

        v43 = NSString;
        v44 = self;
        id v45 = v42;
        v46 = objc_msgSend(v43, "stringWithFormat:", @"<%s: %p>", object_getClassName(v44), v44);

        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v42;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v46;
        _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "no engine to play feedback %@ for generator %@, dropping it", buf, 0x16u);
      }
    }
  }
  else if (_UIFeedbackLoggingDisabled {
         || (__int16 v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB260428) + 8),
  }
             !os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)))
  {
    id v26 = v13;
  }
  else
  {
    id v21 = NSString;
    __int16 v22 = self;
    double v23 = v20;
    uint64_t v24 = objc_msgSend(v21, "stringWithFormat:", @"<%s: %p>", object_getClassName(v22), v22);

    v25 = NSString;
    id v26 = v13;
    id v27 = v24;
    v28 = objc_msgSend(v25, "stringWithFormat:", @"<%s: %p>", object_getClassName(v26), v26);

    id v29 = v28;
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&double v60 = [(UIFeedbackGenerator *)v22 _isEnabled];
    _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "generator %@ cannot play feedback %@ (enabled=%ld)", buf, 0x20u);
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(UIFeedbackGenerator *)self _stopAutoDeactivateTimer];
  [(UIFeedbackGenerator *)self _stopPreparationForAllStyles];
  if (self->_activationCount >= 1)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      double v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &dealloc___s_category_7) + 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = NSString;
        double v5 = self;
        double v6 = v3;
        double v7 = objc_msgSend(v4, "stringWithFormat:", @"<%s: %p>", object_getClassName(v5), v5);

        *(_DWORD *)buf = 138412290;
        uint64_t v10 = v7;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%@ is being deallocated while still being active, forcing deactivation", buf, 0xCu);
      }
    }
    [(UIFeedbackGenerator *)self _autoDeactivate];
  }
  v8.receiver = self;
  v8.super_class = (Class)UIFeedbackGenerator;
  [(UIFeedbackGenerator *)&v8 dealloc];
}

- (void)_stopAutoDeactivateTimer
{
  autoDeactivateTimer = self->_autoDeactivateTimer;
  if (autoDeactivateTimer)
  {
    dispatch_source_cancel(autoDeactivateTimer);
    uint64_t v4 = self->_autoDeactivateTimer;
    self->_autoDeactivateTimer = 0;
  }
}

- (void)_stopPreparationForAllStyles
{
  for (uint64_t i = 0; i != 3; ++i)
    [(UIFeedbackGenerator *)self _stopPreparationForStyle:i];
}

- (void)_stopPreparationForStyle:(int64_t)a3
{
  source = -[UIFeedbackGenerator _preparationTimerForStyle:](self, "_preparationTimerForStyle:");
  if (source)
  {
    [(UIFeedbackGenerator *)self _deactivateWithStyle:a3];
    dispatch_source_cancel(source);
    dispatch_activate(source);
    [(UIFeedbackGenerator *)self _setPreparationTimer:0 forStyle:a3];
  }
}

- (id)_preparationTimerForStyle:(int64_t)a3
{
  preparationTimers = self->_preparationTimers;
  if (preparationTimers)
  {
    uint64_t v4 = [NSNumber numberWithInteger:a3];
    preparationTimers = [preparationTimers objectForKeyedSubscript:v4];
  }
  return preparationTimers;
}

- (int64_t)_outputMode
{
  id v2 = [(UIFeedbackGenerator *)self _configuration];
  int64_t v3 = [v2 outputMode];

  return v3;
}

- (void)__deactivateWithStyle:(int64_t)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UIFeedbackGenerator *)self _isEnabled];
  int64_t activationCount = self->_activationCount;
  if (v6)
  {
    if (!activationCount)
    {
      autoDeint64_t activationCount = self->_autoDeactivationCount;
      uint64_t v9 = self->_autoDeactivationCount[a3];
      if (v9 >= 1)
      {
        if (!_UIFeedbackLoggingDisabled)
        {
          uint64_t v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB260408) + 8);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = v10;
            objc_super v12 = stringForActivationStyle(a3);
            id v13 = NSString;
            v14 = self;
            double v15 = objc_msgSend(v13, "stringWithFormat:", @"<%s: %p>", object_getClassName(v14), v14);

            *(_DWORD *)buf = 138412546;
            v42 = v12;
            __int16 v43 = 2112;
            v44 = v15;
            _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "generator was auto-deactivated for style %@ but finally got a deactivate, swallowing it: %@", buf, 0x16u);
          }
          uint64_t v9 = autoDeactivationCount[a3];
        }
        autoDeactivationCount[a3] = v9 - 1;
        return;
      }
    }
  }
  else if (!activationCount)
  {
    return;
  }
  [(UIFeedbackGenerator *)self setActivationCount:[(UIFeedbackGenerator *)self activationCount] - 1];
  styleActivationCount = self->_styleActivationCount;
  --self->_styleActivationCount[a3];
  if (!_UIFeedbackLoggingDisabled)
  {
    v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackActivation", &qword_1EB260410) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      v18 = stringForActivationStyle(a3);
      int64_t v19 = self->_activationCount;
      int64_t v20 = styleActivationCount[a3];
      id v21 = NSString;
      __int16 v22 = self;
      double v23 = objc_msgSend(v21, "stringWithFormat:", @"<%s: %p>", object_getClassName(v22), v22);

      *(_DWORD *)buf = 138413570;
      v42 = v18;
      __int16 v43 = 2048;
      v44 = (void *)(v19 + 1);
      __int16 v45 = 2048;
      int64_t v46 = v19;
      __int16 v47 = 2048;
      int64_t v48 = v20 + 1;
      __int16 v49 = 2048;
      int64_t v50 = v20;
      __int16 v51 = 2112;
      v52 = v23;
      _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_DEFAULT, "deactivate generator with style: %@; activationCount: %ld -> %ld; styleActivationCount: %ld -> %ld; %@",
        buf,
        0x3Eu);
    }
  }
  if (self->_activationCount < 0)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Feedback generator was deactivated internally more times than it was activated: %@", self format];
    return;
  }
  int64_t v24 = styleActivationCount[a3];
  if (v24 < 0)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    int64_t v32 = self->_activationCount;
    int64_t v33 = styleActivationCount[a3];
    v34 = stringForActivationStyle(a3);
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIFeedbackGenerator.m", 642, @"_styleActivationCount shouldn't be negative. activationCount=%ld; styleActivationCount=%ld; style=%@",
      v32,
      v33,
      v34);

    if (!styleActivationCount[a3]) {
      goto LABEL_16;
    }
  }
  else if (!v24)
  {
LABEL_16:
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v25 = self->_engines;
    uint64_t v26 = [(NSSet *)v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = *(void **)(*((void *)&v36 + 1) + 8 * v29);
          if (a3 == 2)
          {
            [v30 _deactivate];
          }
          else if (a3 == 1)
          {
            [v30 _cooldown];
          }
          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [(NSSet *)v25 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v27);
    }
  }
  if (!self->_activationCount) {
    [(UIFeedbackGenerator *)self _deactivated];
  }
}

- (void)__activateWithStyle:(int64_t)a3 forFeedback:(id)a4 completionBlock:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  [(UIFeedbackGenerator *)self _setupForFeedback:v9];
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    [(UIFeedbackGenerator *)self setActivationCount:[(UIFeedbackGenerator *)self activationCount] + 1];
    int64_t v11 = self->_styleActivationCount[a3];
    self->_styleActivationCount[a3] = v11 + 1;
    if (!_UIFeedbackLoggingDisabled)
    {
      objc_super v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackActivation", &__activateWithStyle_forFeedback_completionBlock____s_category)+ 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = v12;
        uint64_t v27 = stringForActivationStyle(a3);
        int64_t activationCount = self->_activationCount;
        int64_t v25 = self->_styleActivationCount[a3];
        double v15 = NSString;
        int64_t v16 = self;
        uint64_t v26 = objc_msgSend(v15, "stringWithFormat:", @"<%s: %p>", object_getClassName(v16), v16);

        *(_DWORD *)buf = 138413570;
        *(void *)&uint8_t buf[4] = v27;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = activationCount - 1;
        *(_WORD *)&buf[22] = 2048;
        int64_t v41 = activationCount;
        __int16 v42 = 2048;
        int64_t v43 = v25 - 1;
        __int16 v44 = 2048;
        int64_t v45 = v25;
        __int16 v46 = 2112;
        __int16 v47 = v26;
        _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "activate generator with style: %@; activationCount: %ld -> %ld; styleActivationCount: %ld -> %ld; %@",
          buf,
          0x3Eu);
      }
    }
    [(UIFeedbackGenerator *)self _clientDidUpdateGeneratorWithSelector:a2];
    uint64_t v17 = [(NSSet *)self->_engines count];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    int64_t v41 = 0;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__UIFeedbackGenerator___activateWithStyle_forFeedback_completionBlock___block_invoke;
    aBlock[3] = &unk_1E52ECC90;
    uint64_t v35 = v38;
    uint64_t v36 = v17;
    SEL v37 = a2;
    v34 = buf;
    aBlock[4] = self;
    id v33 = v10;
    v18 = _Block_copy(aBlock);
    int64_t v19 = (void (**)(void, void))v18;
    if (v17 < 1)
    {
      (*((void (**)(void *, void))v18 + 2))(v18, 0);
    }
    else
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      int64_t v20 = self->_engines;
      uint64_t v21 = [(NSSet *)v20 countByEnumeratingWithState:&v28 objects:v39 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v29 != v22) {
              objc_enumerationMutation(v20);
            }
            if (a3)
            {
              int64_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              if (a3 == 1)
              {
                [v24 _prewarm:v11 == 0 andPerformWhenPrewarmed:v19];
              }
              else if (a3 == 2)
              {
                [v24 _activate:v11 == 0 andPerformWhenRunning:v19];
              }
            }
            else
            {
              v19[2](v19, 1);
            }
          }
          uint64_t v21 = [(NSSet *)v20 countByEnumeratingWithState:&v28 objects:v39 count:16];
        }
        while (v21);
      }
    }
    _Block_object_dispose(v38, 8);
    _Block_object_dispose(buf, 8);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)_clientDidUpdateGeneratorWithSelector:(SEL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ([(UIFeedbackGenerator *)self _isEnabled])
  {
    if ([(UIFeedbackGenerator *)self _isAutoDeactivated])
    {
      if (!_UIFeedbackLoggingDisabled)
      {
        uint64_t v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB260418) + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          double v5 = NSString;
          BOOL v6 = self;
          double v7 = v4;
          objc_super v8 = objc_msgSend(v5, "stringWithFormat:", @"<%s: %p>", object_getClassName(v6), v6);

          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v8;
          _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "auto-deactivated feedback generator was updated again, re-activate it: %@", buf, 0xCu);
        }
      }
      unint64_t v9 = 0;
      autoDeint64_t activationCount = self->_autoDeactivationCount;
      while (1)
      {
        uint64_t v11 = autoDeactivationCount[v9];
        autoDeactivationCount[v9] = 0;
        if (v11 >= 1 && _UIFeedbackLoggingDisabled == 0) {
          break;
        }
        if (v11) {
          goto LABEL_15;
        }
LABEL_16:
        if (++v9 == 3) {
          goto LABEL_17;
        }
      }
      id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackActivation", &qword_1EB260420) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        double v15 = stringForActivationStyle(v9);
        *(_DWORD *)buf = 138412802;
        uint64_t v17 = v15;
        __int16 v18 = 2048;
        uint64_t v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = self;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "performing re-activation for style: %@; autoDeactivationCount: %ld; %@",
          buf,
          0x20u);
      }
      do
      {
LABEL_15:
        --v11;
        [(UIFeedbackGenerator *)self __activateWithStyle:v9 forFeedback:0 completionBlock:0];
      }
      while (v11);
      goto LABEL_16;
    }
LABEL_17:
    [(UIFeedbackGenerator *)self _resetAutoDeactivationTimeout];
  }
}

- (BOOL)_isAutoDeactivated
{
  return self->_autoDeactivationCount[0] > 0
      || self->_autoDeactivationCount[1] > 0
      || self->_autoDeactivationCount[2] > 0;
}

- (void)setActivationCount:(int64_t)a3
{
  self->_int64_t activationCount = a3;
}

- (int64_t)activationCount
{
  return self->_activationCount;
}

- (void)_setupForFeedback:(id)a3
{
  id v4 = a3;
  [(_UIFeedbackGeneratorConfiguration *)self->_configuration _setupIfNecessary];
  if ([(_UIFeedbackGeneratorConfiguration *)self->_configuration isEnabled]) {
    [(UIFeedbackGenerator *)self _setupEnginesIfNeededForFeedback:v4];
  }
}

- (void)_setupEnginesIfNeededForFeedback:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  usedFeedbacks = self->_usedFeedbacks;
  if (v4)
  {
    if (usedFeedbacks)
    {
      BOOL v6 = [(NSSet *)usedFeedbacks setByAddingObject:v4];
      uint64_t v7 = [(NSSet *)v6 count];
      BOOL v8 = v7 != [(NSSet *)self->_usedFeedbacks count];
    }
    else
    {
      BOOL v6 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
      BOOL v8 = 1;
    }
    self->_usesCustomActivation = v8;
  }
  else if (usedFeedbacks)
  {
    BOOL v6 = usedFeedbacks;
  }
  else
  {
    uint64_t v22 = [(UIFeedbackGenerator *)self _configuration];
    BOOL v6 = [v22 usedFeedbacks];
  }
  if (v6 == self->_usedFeedbacks) {
    goto LABEL_35;
  }
  id v34 = v4;
  unint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v10 = v6;
  uint64_t v11 = [(NSSet *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = +[_UIFeedbackEngine engineForFeedback:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        if (v15) {
          [(NSSet *)v9 addObject:v15];
        }
      }
      uint64_t v12 = [(NSSet *)v10 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v12);
  }

  uint64_t v16 = self->_styleActivationCount[1];
  uint64_t v17 = self->_styleActivationCount[2];
  if (v16 > 0 || v17 >= 1)
  {
    __int16 v18 = self->_engines;
    uint64_t v19 = v9;
    __int16 v20 = v19;
    if (v18 == v19)
    {
      double v23 = v19;
    }
    else
    {
      if (v19 && v18)
      {
        char v21 = [(NSSet *)v18 isEqual:v19];

        if (v21) {
          goto LABEL_30;
        }
      }
      else
      {
      }
      double v23 = (NSSet *)[(NSSet *)self->_engines mutableCopy];
      [(NSSet *)v23 minusSet:v20];
      __int16 v20 = (NSSet *)[(NSSet *)v20 mutableCopy];
      [(NSSet *)v20 minusSet:self->_engines];
      [(UIFeedbackGenerator *)self _updateActivationStateForRemovedEngines:v23 addedEngines:v20 prewarmCount:v16 turnOnCount:v17];
    }
  }
LABEL_30:
  if (!_UIFeedbackLoggingDisabled)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB2603F0);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v26 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = v26;
        long long v28 = _UIDescriptionBuilderLightDescription(self);
        engines = self->_engines;
        *(_DWORD *)buf = 138412802;
        id v40 = v28;
        __int16 v41 = 2112;
        __int16 v42 = engines;
        __int16 v43 = 2112;
        __int16 v44 = v9;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_ERROR, "updating engines used for %@: %@ -> %@", buf, 0x20u);
      }
    }
  }
  objc_storeStrong((id *)&self->_engines, v9);
  id v4 = v34;
  if (!_UIFeedbackLoggingDisabled)
  {
    unint64_t v25 = __UILogGetCategoryCachedImpl("FeedbackDebug", &qword_1EB2603F8);
    if (*(unsigned char *)v25)
    {
      long long v30 = *(NSObject **)(v25 + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        long long v31 = v30;
        int64_t v32 = _UIDescriptionBuilderLightDescription(self);
        id v33 = self->_usedFeedbacks;
        *(_DWORD *)buf = 138412802;
        id v40 = v32;
        __int16 v41 = 2112;
        __int16 v42 = v33;
        __int16 v43 = 2112;
        __int16 v44 = v10;
        _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "updating feedbacks used for %@: %@ -> %@", buf, 0x20u);
      }
    }
  }
  objc_storeStrong((id *)&self->_usedFeedbacks, v6);

LABEL_35:
}

- (void)_setupAutoDeactivateTimer
{
  [(UIFeedbackGenerator *)self _autoDeactivationTimeout];
  if (v4 > 0.0)
  {
    if (self->_autoDeactivateTimer)
    {
      BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"UIFeedbackGenerator.m" lineNumber:696 description:@"trying to create an auto-deactivation timer when we already have one"];
    }
    double v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    autoDeactivateTimer = self->_autoDeactivateTimer;
    self->_autoDeactivateTimer = v5;

    objc_initWeak(&location, self);
    uint64_t v7 = self->_autoDeactivateTimer;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __48__UIFeedbackGenerator__setupAutoDeactivateTimer__block_invoke;
    uint64_t v12 = &unk_1E52DC308;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v7, &v9);
    [(UIFeedbackGenerator *)self _resetAutoDeactivationTimeout];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

- (void)_resetAutoDeactivationTimeout
{
  autoDeactivateTimer = self->_autoDeactivateTimer;
  if (autoDeactivateTimer)
  {
    [(UIFeedbackGenerator *)self _autoDeactivationTimeout];
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    [(UIFeedbackGenerator *)self _autoDeactivationTimeout];
    dispatch_source_set_timer(autoDeactivateTimer, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v6 / 100.0 * 1000000000.0));
    uint64_t v7 = self->_autoDeactivateTimer;
    dispatch_activate(v7);
  }
}

- (double)_autoDeactivationTimeout
{
  return *(double *)&_UIFeedbackGeneratorAutoDeactivateTimeout;
}

- (void)_deactivated
{
  if (self->_activated)
  {
    [(UIFeedbackGenerator *)self _stopAutoDeactivateTimer];
    [(UIFeedbackGenerator *)self _stats_activationDidChangeTo:0];
    [(UIFeedbackGenerator *)self _stopFeedbackWarming];
    if (self->_usesCustomActivation)
    {
      usedFeedbacks = self->_usedFeedbacks;
      self->_usedFeedbacks = 0;
    }
    self->_activated = 0;
  }
}

- (void)_stopFeedbackWarming
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id feedbackWarmingBlock = self->_feedbackWarmingBlock;
  if (feedbackWarmingBlock)
  {
    dispatch_block_cancel(feedbackWarmingBlock);
    id v4 = self->_feedbackWarmingBlock;
    self->_id feedbackWarmingBlock = 0;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    dispatch_time_t v5 = self->_engines;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_stopWarmingFeedbacks:", self->_usedFeedbacks, (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_activateWithStyle:(int64_t)a3 completionBlock:(id)a4
{
}

- (void)_setPreparationTimer:(id)a3 forStyle:(int64_t)a4
{
  id v10 = a3;
  if (!self->_preparationTimers)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    preparationTimers = self->_preparationTimers;
    self->_preparationTimers = v6;
  }
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  uint64_t v9 = self->_preparationTimers;
  if (v10) {
    [(NSMutableDictionary *)v9 setObject:v10 forKeyedSubscript:v8];
  }
  else {
    [(NSMutableDictionary *)v9 removeObjectForKey:v8];
  }
}

- (double)_preparationTimeoutForStyle:(int64_t)a3
{
  return *((double *)&_UIFeedbackGeneratorPreparationTimeouts + a3);
}

void __41__UIFeedbackGenerator__prepareWithStyle___block_invoke_30(uint64_t a1, int a2)
{
  int64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    [v3 _updatePreparationTimer:*(void *)(a1 + 40) withTimeout:*(double *)(a1 + 48)];
    id v4 = *(NSObject **)(a1 + 40);
    dispatch_activate(v4);
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 56);
    [v3 _stopPreparationForStyle:v5];
  }
}

- (void)_updatePreparationTimer:(id)a3 withTimeout:(double)a4
{
  int64_t v5 = (uint64_t)(a4 * 1000000000.0);
  source = a3;
  dispatch_time_t v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(source, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a4 / 100.0 * 1000000000.0));
}

- (void)prepare
{
  if (![(UIFeedbackGenerator *)self _isAutoDeactivated])
  {
    [(UIFeedbackGenerator *)self _stats_prepared];
    if (self->_styleActivationCount[2] >= 1)
    {
      int64_t v3 = [(UIFeedbackGenerator *)self _preparationTimerForStyle:2];

      if (!v3) {
        [(UIFeedbackGenerator *)self _prepareWithStyle:2];
      }
    }
    [(UIFeedbackGenerator *)self _prepareWithStyle:1];
  }
}

void __47__UIFeedbackGenerator__scheduleFeedbackWarming__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _startFeedbackWarming];
    id WeakRetained = v2;
  }
}

- (void)_startFeedbackWarming
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int64_t v3 = self->_engines;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "_startWarmingFeedbacks:", self->_usedFeedbacks, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id feedbackWarmingBlock = self->_feedbackWarmingBlock;
  self->_id feedbackWarmingBlock = 0;
}

- (void)activateWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(UIFeedbackGenerator *)self _setupForFeedback:0];
  [(UIFeedbackGenerator *)self _activateWithStyle:[(_UIFeedbackGeneratorConfiguration *)self->_configuration activationStyle] completionBlock:v4];
}

+ (void)_setAutoDeactivateTimeout:(double)a3
{
  _UIFeedbackGeneratorAutoDeactivateTimeout = *(void *)&a3;
}

+ (void)_resetAutoDeactivateTimeout
{
  _UIFeedbackGeneratorAutoDeactivateTimeout = 0x4014000000000000;
}

+ (void)_setPreparationTimeout:(double)a3 forStyle:(int64_t)a4
{
  *((double *)&_UIFeedbackGeneratorPreparationTimeouts + a4) = a3;
}

+ (void)_resetPreparationTimeouts
{
  qword_1E8FC4288 = 0x3FE0000000000000;
  _UIFeedbackGeneratorPreparationTimeouts = _UIFeedbackGeneratorPreparationDefaultTimeouts;
}

+ (void)_setRunningTests:(BOOL)a3
{
  _MergedGlobals_1031 = a3;
}

+ (Class)_configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)feedbackGeneratorForView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithView:v4];

  return v5;
}

- (NSString)description
{
  id v2 = [(UIFeedbackGenerator *)self _ui_descriptionBuilder];
  int64_t v3 = [v2 string];

  return (NSString *)v3;
}

- (id)_ui_descriptionBuilder
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)UIFeedbackGenerator;
  int64_t v3 = [&v11 _ui_descriptionBuilder];
  if (os_variant_has_internal_diagnostics())
  {
    uint64_t v5 = NSStringFromSelector(sel_active);
    v12[0] = v5;
    uint64_t v6 = NSStringFromSelector(sel_configuration);
    v12[1] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    id v8 = (id)[v3 appendKeys:v7];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v10 = (id)[v3 appendName:@"view" object:WeakRetained usingLightweightDescription:1];
  }
  return v3;
}

void __41__UIFeedbackGenerator__prepareWithStyle___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("FeedbackDebug", &_UIInternalPreference_EnableFeedbackExceptions_block_invoke___s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        id v4 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          unint64_t v5 = *(void *)(a1 + 40);
          uint64_t v6 = v4;
          uint64_t v7 = stringForActivationStyle(v5);
          int v8 = 138412546;
          id v9 = WeakRetained;
          __int16 v10 = 2112;
          objc_super v11 = v7;
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "timed-out preparation of %@ with style %@", (uint8_t *)&v8, 0x16u);
        }
      }
    }
    [WeakRetained _stopPreparationForStyle:*(void *)(a1 + 40)];
  }
}

- (void)_updateActivationStateForRemovedEngines:(id)a3 addedEngines:(id)a4 prewarmCount:(int64_t)a5 turnOnCount:(int64_t)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (!_UIFeedbackLoggingDisabled)
  {
    uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_updateActivationStateForRemovedEngines_addedEngines_prewarmCount_turnOnCount____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      long long v13 = NSString;
      uint64_t v14 = self;
      uint64_t v15 = v12;
      uint64_t v16 = objc_msgSend(v13, "stringWithFormat:", @"<%s: %p>", object_getClassName(v14), v14);

      *(_DWORD *)buf = 134219010;
      int64_t v40 = a5;
      __int16 v41 = 2048;
      int64_t v42 = a6;
      __int16 v43 = 2112;
      __int16 v44 = v16;
      __int16 v45 = 2112;
      id v46 = v10;
      __int16 v47 = 2112;
      id v48 = v11;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "updating activation state (prewarm: %ld; activation: %ld) for %@ removedEngines=%@; addedEngines=%@",
        buf,
        0x34u);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v33 + 1) + 8 * v21);
        if (a5 >= 1) {
          [*(id *)(*((void *)&v33 + 1) + 8 * v21) _cooldown];
        }
        if (a6 >= 1) {
          [v22 _deactivate];
        }
        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v19);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v23 = v11;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v23);
        }
        long long v28 = *(void **)(*((void *)&v29 + 1) + 8 * v27);
        if (a6 >= 1) {
          [*(id *)(*((void *)&v29 + 1) + 8 * v27) _activate:1 andPerformWhenRunning:0];
        }
        if (a5 >= 1) {
          [v28 _prewarm:1 andPerformWhenPrewarmed:0];
        }
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v25);
  }
}

- (void)deactivate
{
  int64_t v3 = [(_UIFeedbackGeneratorConfiguration *)self->_configuration activationStyle];
  [(UIFeedbackGenerator *)self _deactivateWithStyle:v3];
}

- (void)_deactivateWithStyle:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(UIFeedbackGenerator *)self _isEnabled];
  int64_t externalActivationCount = self->_externalActivationCount;
  if (v5 || externalActivationCount)
  {
    self->_int64_t externalActivationCount = externalActivationCount - 1;
    if (externalActivationCount <= 0)
    {
      if (_UIInternalPreferencesRevisionOnce != -1) {
        dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
      }
      int v7 = _UIInternalPreferencesRevisionVar;
      if (_UIInternalPreferencesRevisionVar < 1) {
        goto LABEL_7;
      }
      int v8 = _UIInternalPreference_EnableFeedbackExceptions;
      if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_EnableFeedbackExceptions) {
        goto LABEL_7;
      }
      while (v7 >= v8)
      {
        _UIInternalPreferenceSync(v7, &_UIInternalPreference_EnableFeedbackExceptions, @"EnableFeedbackExceptions", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v8 = _UIInternalPreference_EnableFeedbackExceptions;
        if (v7 == _UIInternalPreference_EnableFeedbackExceptions) {
          goto LABEL_7;
        }
      }
      if (byte_1E8FD511C | _MergedGlobals_1031)
      {
LABEL_7:
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"Feedback generator was deactivated by its client more times than it was activated: %@", self format];
      }
      else if (!_UIFeedbackLoggingDisabled)
      {
        id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB260400) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = self;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Feedback generator was deactivated by its client more times than it was activated: %@", buf, 0xCu);
        }
      }
    }
    [(UIFeedbackGenerator *)self __deactivateWithStyle:a3];
  }
}

- (void)_forceDeactivationForStyle:(int64_t)a3
{
  int64_t v5 = self->_styleActivationCount[a3];
  if (v5 < 0)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    int v8 = stringForActivationStyle(a3);
    [v7 handleFailureInMethod:a2, self, @"UIFeedbackGenerator.m", 682, @"force deactivating %@ with style %@ which is not active (int64_t activationCount = %ld)", self, v8, v5 object file lineNumber description];
  }
  else if (!v5)
  {
    return;
  }
  do
  {
    --v5;
    [(UIFeedbackGenerator *)self __deactivateWithStyle:a3];
  }
  while (v5);
}

void __48__UIFeedbackGenerator__setupAutoDeactivateTimer__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && ([WeakRetained _isAutoDeactivated] & 1) == 0)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      int64_t v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_UIInternalPreference_EnableFeedbackExceptions_block_invoke_2___s_category)+ 8);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        [v2 _autoDeactivationTimeout];
        uint64_t v6 = v5;
        uint64_t v7 = [v2 activationCount];
        int v8 = NSString;
        id v9 = v2;
        id v10 = objc_msgSend(v8, "stringWithFormat:", @"<%s: %p>", object_getClassName(v9), v9);

        *(_DWORD *)buf = 134218498;
        uint64_t v12 = v6;
        __int16 v13 = 2048;
        uint64_t v14 = v7;
        __int16 v15 = 2112;
        uint64_t v16 = v10;
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "nothing happened to generator for %g sec, auto-deactivating it with activationCount: %ld; %@",
          buf,
          0x20u);
      }
    }
    objc_msgSend(v2, "_stats_activationTimedOut");
    [v2 _autoDeactivate];
  }
}

- (void)_autoDeactivate
{
  unint64_t v3 = 0;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  do
  {
    id v4 = &self->super.isa + v3;
    uint64_t v5 = v4[1];
    if (v5)
    {
      if (v4[4])
      {
        uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
        __int16 v13 = stringForActivationStyle(v3);
        [v12 handleFailureInMethod:a2, self, @"UIFeedbackGenerator.m", 739, @"Generator is already auto-deactivated for style %@: %@", v13, self object file lineNumber description];
      }
      v4[4] = v5;
      int64_t activationCount = self->_activationCount;
      uint64_t v7 = self->_configuration;
      int v8 = [(NSSet *)self->_engines description];
      if (!_UIFeedbackLoggingDisabled)
      {
        id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("FeedbackActivation", &_autoDeactivate___s_category) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v9;
          id v11 = stringForActivationStyle(v3);
          *(_DWORD *)buf = 138413058;
          uint64_t v16 = v11;
          __int16 v17 = 2048;
          int64_t v18 = activationCount;
          __int16 v19 = 2048;
          uint64_t v20 = v5;
          __int16 v21 = 2112;
          uint64_t v22 = self;
          _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "performing auto-deactivate for style: %@; activationCount: %ld; styleActivationCount: %ld; %@",
            buf,
            0x2Au);
        }
      }
      [(UIFeedbackGenerator *)self _forceDeactivationForStyle:v3];
    }
    ++v3;
  }
  while (v3 != 3);
}

- (void)performFeedbackWithDelay:(double)a3 insideBlock:(id)a4
{
  currentDeladouble y = self->_currentDelay;
  self->_currentDeladouble y = currentDelay + a3;
  (*((void (**)(id, SEL))a4 + 2))(a4, a2);
  self->_currentDeladouble y = currentDelay;
}

- (void)_playFeedback:(id)a3
{
}

- (void)_playFeedback:(id)a3 atLocation:(CGPoint)a4
{
}

- (void)_stopFeedback:(id)a3
{
  if (a3) {
    [a3 stop];
  }
}

- (NSString)_stats_key
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)externalActivationCount
{
  return self->_externalActivationCount;
}

- (void)setExternalActivationCount:(int64_t)a3
{
  self->_int64_t externalActivationCount = a3;
}

- (BOOL)usesCustomActivation
{
  return self->_usesCustomActivation;
}

- (void)setUsesCustomActivation:(BOOL)a3
{
  self->_usesCustomActivation = a3;
}

- (void)setView:(id)a3
{
}

- (_UIFeedbackGeneratorGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (NSSet)engines
{
  return self->_engines;
}

- (UIFeedbackGenerator)initWithCoordinateSpace:(id)a3
{
  id v4 = _viewFromCoordinateSpace(a3);
  uint64_t v5 = [(UIFeedbackGenerator *)self initWithView:v4];

  return v5;
}

- (UIFeedbackGenerator)initWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  id v6 = a3;
  uint64_t v7 = _viewFromCoordinateSpace(a4);
  int v8 = [(UIFeedbackGenerator *)self initWithConfiguration:v6 view:v7];

  return v8;
}

- (UICoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UICoordinateSpace *)WeakRetained;
}

+ (id)behaviorWithConfiguration:(id)a3 coordinateSpace:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    id v11 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Use of _UIFeedbackBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based UIFeedbackGenerator methods.", buf, 2u);
    }
  }
  else
  {
    int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &behaviorWithConfiguration_coordinateSpace____s_category)
                      + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Use of _UIFeedbackBehavior methods have been deprecated since iOS 10 and will be removed in a future version. Update to view-based UIFeedbackGenerator methods.", v12, 2u);
    }
  }
  id v9 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v7 coordinateSpace:v6];

  return v9;
}

- (void)_setMuted:(BOOL)a3
{
}

- (BOOL)_isMuted
{
  return [(UIFeedbackGenerator *)self _outputMode] == 0;
}

- (id)_activationTimeOutCountStatistics
{
  id v2 = [(UIFeedbackGenerator *)self _statsSuffix];
  unint64_t v3 = +[_UIStatistics feedbackGeneratorActivationTimeOutCountWithSuffix:v2];

  return v3;
}

- (void)_stats_activationTimedOut
{
  id v2 = [(UIFeedbackGenerator *)self _activationTimeOutCountStatistics];
  [v2 incrementValueBy:1];
}

@end