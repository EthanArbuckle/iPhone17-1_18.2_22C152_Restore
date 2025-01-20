@interface SBDynamicFlashlightActivityElementViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasActiveTouches;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)isBeamOn;
- (BOOL)isExpanded;
- (BOOL)shouldDismissWhenOff;
- (CGPoint)_beamStateForState:(id)a3 currentBeamState:(CGPoint)a4;
- (CGRect)preferredContentRect;
- (SBDynamicFlashlightActivityElementView)elementView;
- (SBDynamicFlashlightActivityElementViewController)initWithOptionsProvider:(id)a3 state:(id)a4 fixedWidth:(BOOL)a5;
- (SBDynamicFlashlightActivityElementViewControllerDelegate)delegate;
- (double)_overshootForNormalized:(double)a3;
- (double)currentIntensity;
- (double)currentWidth;
- (int64_t)elementOrientation;
- (void)_accessibilitySetTorchState:(CGPoint)a3;
- (void)_animateTracked:(id)a3 completion:(id)a4;
- (void)_animateUntracked:(id)a3 completion:(id)a4;
- (void)_dismissalTimerDidFire:(id)a3;
- (void)_invalidateDismissalTimer;
- (void)_invalidatePersistenceTimer;
- (void)_panGestureHandler;
- (void)_saveTorchState;
- (void)_startDismissalTimer;
- (void)_startPersistenceTimer;
- (void)_tapGestureHandler;
- (void)_toggleBeamState;
- (void)_updateDelegateStateAnimated:(BOOL)a3;
- (void)_updatePreferredContentRectForUnconstrainedPoint:(CGPoint)a3;
- (void)dealloc;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setElementOrientation:(int64_t)a3;
- (void)setElementView:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setPanEnabled:(BOOL)a3;
- (void)setState:(id)a3;
- (void)updateOrientation;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation SBDynamicFlashlightActivityElementViewController

- (void)dealloc
{
  [(NSTimer *)self->_persistenceTimer invalidate];
  [(NSTimer *)self->_dismissalTimer invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBDynamicFlashlightActivityElementViewController;
  [(SBDynamicFlashlightActivityElementViewController *)&v3 dealloc];
}

- (SBDynamicFlashlightActivityElementViewController)initWithOptionsProvider:(id)a3 state:(id)a4 fixedWidth:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBDynamicFlashlightActivityElementViewController;
  v11 = [(SBDynamicFlashlightActivityElementViewController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    v11->_fixedWidth = a5;
    objc_storeStrong((id *)&v11->_optionsProvider, a3);
    v13 = [v9 springAnimationSettings];
    uint64_t v14 = [v13 copy];
    fluidBehaviorSettings = v12->_fluidBehaviorSettings;
    v12->_fluidBehaviorSettings = (SBFFluidBehaviorSettings *)v14;

    [(SBFFluidBehaviorSettings *)v12->_fluidBehaviorSettings setName:@"Dynamic Flashlight"];
    v16 = SBLogFlashlightHUD();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[SBDynamicFlashlightActivityElementViewController initWithOptionsProvider:state:fixedWidth:]((uint64_t)v10, v16);
    }

    -[SBDynamicFlashlightActivityElementViewController _beamStateForState:currentBeamState:](v12, "_beamStateForState:currentBeamState:", v10, 1.0, 1.0);
    v12->_torchState.x = v17;
    v12->_torchState.y = v18;
    v12->_persistedState = v12->_torchState;
  }

  return v12;
}

- (SBDynamicFlashlightActivityElementView)elementView
{
  elementView = self->_elementView;
  if (!elementView)
  {
    v4 = -[SBDynamicFlashlightActivityElementView initWithBeamState:optionsProvider:]([SBDynamicFlashlightActivityElementView alloc], "initWithBeamState:optionsProvider:", self->_optionsProvider, self->_torchState.x, self->_torchState.y);
    v5 = self->_elementView;
    self->_elementView = v4;

    elementView = self->_elementView;
  }
  return elementView;
}

- (void)updateOrientation
{
  BOOL v3 = (unint64_t)([(SBDynamicFlashlightActivityElementViewController *)self elementOrientation]- 3) < 2;
  elementView = self->_elementView;
  [(SBDynamicFlashlightActivityElementView *)elementView setSensorShadowHidden:v3];
}

- (void)setElementOrientation:(int64_t)a3
{
  if (self->_elementOrientation != a3)
  {
    self->_elementOrientation = a3;
    [(SBDynamicFlashlightActivityElementViewController *)self updateOrientation];
  }
}

- (void)loadView
{
  BOOL v3 = [(SBDynamicFlashlightActivityElementViewController *)self elementView];
  [(SBDynamicFlashlightActivityElementViewController *)self setView:v3];

  -[SBDynamicFlashlightActivityElementView sizeThatFits:](self->_elementView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  self->_preferredContentRect.origin.x = 0.0;
  self->_preferredContentRect.origin.y = 0.0;
  self->_preferredContentRect.size.width = v4;
  self->_preferredContentRect.size.height = v5;
  v6 = [[_SBDynamicFlashlightZeroDelayPanGestureRecognizer alloc] initWithTarget:self action:sel__panGestureHandler];
  panGestureRecognizer = self->_panGestureRecognizer;
  self->_panGestureRecognizer = v6;

  [(_SBDynamicFlashlightZeroDelayPanGestureRecognizer *)self->_panGestureRecognizer setName:@"dynamicFlashlightPan"];
  [(_SBDynamicFlashlightZeroDelayPanGestureRecognizer *)self->_panGestureRecognizer _setHysteresis:0.0];
  [(_SBDynamicFlashlightZeroDelayPanGestureRecognizer *)self->_panGestureRecognizer setDelegate:self];
  [(_SBDynamicFlashlightZeroDelayPanGestureRecognizer *)self->_panGestureRecognizer _setCanPanHorizontally:!self->_fixedWidth];
  [(SBDynamicFlashlightActivityElementView *)self->_elementView addGestureRecognizer:self->_panGestureRecognizer];
  [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider gestureScaling];
  self->_gestureScaling.x = v8;
  self->_gestureScaling.y = v9;
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBDynamicFlashlightActivityElementViewController;
  [(SBDynamicFlashlightActivityElementViewController *)&v4 viewIsAppearing:a3];
  [(SBDynamicFlashlightActivityElementViewController *)self updateOrientation];
}

- (void)_animateUntracked:(id)a3 completion:(id)a4
{
}

- (void)_animateTracked:(id)a3 completion:(id)a4
{
}

- (CGPoint)_beamStateForState:(id)a3 currentBeamState:(CGPoint)a4
{
  CGFloat y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = 0.0;
  if ([v7 isOn])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
      [v9 initialIntensity];
      double v11 = v10;
      v12 = self->_optionsProvider;
      [(SBDynamicFlashlightOptionsProvider *)v12 minimumHWIntensity];
      double v14 = v13;
      [(SBDynamicFlashlightOptionsProvider *)v12 minimumIntensity];
      double v16 = v15 + (v11 - v14) * (1.0 - v15) / (1.0 - v14);
      [(SBDynamicFlashlightOptionsProvider *)v12 minimumIntensity];
      double v18 = v17;

      double v19 = fmax(v18, fmin(v16, 1.0));
      objc_super v20 = SBLogFlashlightHUD();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[SBDynamicFlashlightActivityElementViewController _beamStateForState:currentBeamState:](v9, v20, v19);
      }

      if (self->_fixedWidth) {
        double v21 = 0.95;
      }
      else {
        [v9 initialWidth];
      }
      double x = fmax(fmin(v21, 1.0), 0.0);
      double v8 = fmax(fmin(v19, 1.0), 0.0);
    }
    else
    {
      double v8 = y;
    }
  }

  double v22 = x;
  double v23 = v8;
  result.CGFloat y = v23;
  result.double x = v22;
  return result;
}

- (void)setState:(id)a3
{
  id v4 = a3;
  if (![(SBDynamicFlashlightActivityElementViewController *)self _hasActiveTouches])
  {
    CGFloat v5 = SBLogFlashlightHUD();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[SBDynamicFlashlightActivityElementViewController setState:]((uint64_t)v4, v5);
    }

    p_torchState = &self->_torchState;
    -[SBDynamicFlashlightActivityElementViewController _beamStateForState:currentBeamState:](self, "_beamStateForState:currentBeamState:", v4, self->_torchState.x, self->_torchState.y);
    CGFloat v8 = v7;
    double v10 = v9;
    [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider minimumIntensity];
    if (v10 >= v11)
    {
      p_torchState->double x = v8;
      self->_torchState.CGFloat y = v10;
      [(SBDynamicFlashlightActivityElementViewController *)self _invalidateDismissalTimer];
    }
    else if ([(SBDynamicFlashlightActivityElementViewController *)self isBeamOn])
    {
      [(SBDynamicFlashlightActivityElementViewController *)self _saveTorchState];
      p_torchState->double x = v8;
      self->_torchState.CGFloat y = 0.0;
      [(SBDynamicFlashlightActivityElementViewController *)self _startDismissalTimer];
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __61__SBDynamicFlashlightActivityElementViewController_setState___block_invoke;
    v12[3] = &unk_1E6AF4AC0;
    v12[4] = self;
    [(SBDynamicFlashlightActivityElementViewController *)self _animateUntracked:v12 completion:0];
  }
}

uint64_t __61__SBDynamicFlashlightActivityElementViewController_setState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1120), "setBeamState:", *(double *)(*(void *)(a1 + 32) + 976), *(double *)(*(void *)(a1 + 32) + 984));
}

- (void)_toggleBeamState
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = (a1 & 1) == 0;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "_toggleBeamState to: %{BOOL}i", (uint8_t *)v2, 8u);
}

uint64_t __68__SBDynamicFlashlightActivityElementViewController__toggleBeamState__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) setTouching:0];
  v2 = *(double **)(a1 + 32);
  uint64_t v3 = (void *)*((void *)v2 + 140);
  v2 += 122;
  double v4 = *v2;
  double v5 = v2[1];
  return objc_msgSend(v3, "setBeamState:", v4, v5);
}

- (double)currentIntensity
{
  return self->_torchState.y;
}

- (double)currentWidth
{
  if (self->_fixedWidth) {
    return 0.95;
  }
  else {
    return self->_torchState.x;
  }
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    BOOL v3 = a3;
    self->_expanded = a3;
    id v8 = [(SBDynamicFlashlightActivityElementViewController *)self elementView];
    [(SBDynamicFlashlightActivityElementViewController *)self currentIntensity];
    double v6 = v5;
    [(SBDynamicFlashlightActivityElementViewController *)self currentWidth];
    [v8 setExpanded:v3 intensity:v6 width:v7];
  }
}

- (void)setPanEnabled:(BOOL)a3
{
}

- (BOOL)isBeamOn
{
  double y = self->_torchState.y;
  [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider minimumIntensity];
  return y >= v3;
}

- (void)_saveTorchState
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  double v4 = NSStringFromCGPoint(*a1);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_debug_impl(&dword_1D85BA000, a3, OS_LOG_TYPE_DEBUG, "_saveTorchState: %@", (uint8_t *)&v5, 0xCu);
}

- (void)_startPersistenceTimer
{
  double y = self->_torchState.y;
  [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider minimumIntensity];
  if (y >= v4)
  {
    objc_initWeak(&location, self);
    [(NSTimer *)self->_persistenceTimer invalidate];
    int v5 = (void *)MEMORY[0x1E4F1CB00];
    [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider persistenceDelay];
    double v7 = v6;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __74__SBDynamicFlashlightActivityElementViewController__startPersistenceTimer__block_invoke;
    double v15 = &unk_1E6AF61A0;
    objc_copyWeak(&v16, &location);
    id v8 = [v5 scheduledTimerWithTimeInterval:0 repeats:&v12 block:v7];
    persistenceTimer = self->_persistenceTimer;
    self->_persistenceTimer = v8;

    double v10 = self->_persistenceTimer;
    [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider persistenceDelay];
    [(NSTimer *)v10 setTolerance:v11 * 0.05];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __74__SBDynamicFlashlightActivityElementViewController__startPersistenceTimer__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v4 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[137] == v5) {
    [WeakRetained _saveTorchState];
  }
}

- (void)_invalidatePersistenceTimer
{
  [(NSTimer *)self->_persistenceTimer invalidate];
  persistenceTimer = self->_persistenceTimer;
  self->_persistenceTimer = 0;
}

- (void)_startDismissalTimer
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Starting dismissal timer...", v2, v3, v4, v5, v6);
}

void __72__SBDynamicFlashlightActivityElementViewController__startDismissalTimer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _dismissalTimerDidFire:v3];
}

- (void)_dismissalTimerDidFire:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (NSTimer *)a3;
  uint64_t v5 = SBLogFlashlightHUD();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBDynamicFlashlightActivityElementViewController _dismissalTimerDidFire:]();
  }

  if (self->_dismissalTimer == v4 && ![(SBDynamicFlashlightActivityElementViewController *)self isBeamOn])
  {
    self->_shouldDismissWhenOff = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dynamicFlashlightViewControllerShouldDismiss];

    p_super = &self->_dismissalTimer->super;
    self->_dismissalTimer = 0;
  }
  else
  {
    p_super = SBLogFlashlightHUD();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      BOOL v8 = self->_dismissalTimer == v4;
      v9[0] = 67109376;
      v9[1] = v8;
      __int16 v10 = 1024;
      int v11 = ![(SBDynamicFlashlightActivityElementViewController *)self isBeamOn];
      _os_log_debug_impl(&dword_1D85BA000, p_super, OS_LOG_TYPE_DEBUG, "Ignoring dismissal timer! Right timer? %{BOOL}i, Beam off? %{BOOL}i", (uint8_t *)v9, 0xEu);
    }
  }
}

- (void)_invalidateDismissalTimer
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Invalidating dismissal timer", v2, v3, v4, v5, v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __89__SBDynamicFlashlightActivityElementViewController_gestureRecognizer_shouldReceiveTouch___block_invoke;
  v5[3] = &unk_1E6AF4AC0;
  v5[4] = self;
  [(SBDynamicFlashlightActivityElementViewController *)self _animateTracked:v5 completion:0];
  return 1;
}

uint64_t __89__SBDynamicFlashlightActivityElementViewController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) setTouching:1];
  uint64_t v2 = *(double **)(a1 + 32);
  uint64_t v3 = (void *)*((void *)v2 + 140);
  v2 += 122;
  double v4 = *v2;
  double v5 = v2[1];
  return objc_msgSend(v3, "setBeamState:", v4, v5);
}

- (BOOL)_hasActiveTouches
{
  return (unint64_t)([(_SBDynamicFlashlightZeroDelayPanGestureRecognizer *)self->_panGestureRecognizer state]- 1) < 3;
}

- (void)_panGestureHandler
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Panned beam to OFF, starting the timer", v2, v3, v4, v5, v6);
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke(double *a1)
{
  [*(id *)(*((void *)a1 + 4) + 1120) setTouching:1];
  uint64_t v2 = *(void **)(*((void *)a1 + 4) + 1120);
  double v3 = a1[5];
  double v4 = a1[6];
  return objc_msgSend(v2, "setBeamState:", v3, v4);
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1120) setTouching:0];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1120), "setBeamState:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  return objc_msgSend(v2, "_updatePreferredContentRectForUnconstrainedPoint:", v3, v4);
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__SBDynamicFlashlightActivityElementViewController__panGestureHandler__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateDelegateStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 0.0;
  if ([(SBDynamicFlashlightActivityElementViewController *)self isBeamOn])
  {
    double y = self->_torchState.y;
    double v7 = self->_optionsProvider;
    [(SBDynamicFlashlightOptionsProvider *)v7 minimumIntensity];
    double v9 = v8;
    [(SBDynamicFlashlightOptionsProvider *)v7 minimumHWIntensity];
    double v11 = v10 + (y - v9) * (1.0 - v10) / (1.0 - v9);
    [(SBDynamicFlashlightOptionsProvider *)v7 minimumHWIntensity];
    double v13 = v12;

    double v5 = fmax(v13, fmin(v11, 1.0));
  }
  double x = 1.0;
  if (!self->_fixedWidth) {
    double x = self->_torchState.x;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dynamicFlashlightViewControllerDidChangeIntensity:v3 width:v5 animated:x];
}

- (void)_tapGestureHandler
{
  [(SBDynamicFlashlightActivityElementViewController *)self _toggleBeamState];
  id v3 = [(SBDynamicFlashlightActivityElementViewController *)self delegate];
  [v3 dynamicFlashlightViewControllerDidToggleFlashlight];
}

- (void)_updatePreferredContentRectForUnconstrainedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint8_t v6 = [(SBDynamicFlashlightActivityElementViewController *)self elementView];
  objc_msgSend(v6, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));

  [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider overshootClampFactor];
  double v8 = v7;
  if (x >= 0.0)
  {
    if (x > 1.0) {
      double x = (v7 + 1.0 + -1.0) * tanh((x + -1.0) * 0.55 / (v7 + 1.0 + -1.0) + 0.0) + 1.0;
    }
  }
  else
  {
    double x = 0.0 - v7 + (0.0 - (0.0 - v7)) * (tanh((x - (0.0 - v7)) * 0.55 / (0.0 - (0.0 - v7)) + -0.55) + 1.0);
  }
  if (y >= 0.0)
  {
    if (y > 1.0) {
      double y = (v8 + 1.0 + -1.0) * tanh((y + -1.0) * 0.55 / (v8 + 1.0 + -1.0) + 0.0) + 1.0;
    }
  }
  else
  {
    double y = 0.0 - v8 + (0.0 - (0.0 - v8)) * (tanh((y - (0.0 - v8)) * 0.55 / (0.0 - (0.0 - v8)) + -0.55) + 1.0);
  }
  [(SBDynamicFlashlightActivityElementViewController *)self _overshootForNormalized:y];
  double v10 = v9;
  [(SBDynamicFlashlightActivityElementViewController *)self _overshootForNormalized:x];
  if (v10 == 0.0 && v11 == 0.0)
  {
    SBRectWithSize();
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
  }
  else
  {
    [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider heightStretchFactor];
    [(SBDynamicFlashlightOptionsProvider *)self->_optionsProvider widthStretchFactor];
    objc_super v20 = [(SBDynamicFlashlightActivityElementViewController *)self traitCollection];
    [v20 displayScale];
    UIRectRoundToScale();
    CGFloat v13 = v21;
    CGFloat v15 = v22;
    CGFloat v17 = v23;
    CGFloat v19 = v24;
  }
  v27.origin.double x = v13;
  v27.origin.double y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  if (!CGRectEqualToRect(self->_preferredContentRect, v27))
  {
    self->_preferredContentRect.origin.double x = v13;
    self->_preferredContentRect.origin.double y = v15;
    self->_preferredContentRect.size.width = v17;
    self->_preferredContentRect.size.height = v19;
    id v25 = [(SBDynamicFlashlightActivityElementViewController *)self delegate];
    [v25 dynamicFlashlightViewControllerDidChangePreferredContentRect];
  }
}

- (double)_overshootForNormalized:(double)a3
{
  if (a3 < 0.0) {
    return a3;
  }
  double v3 = 0.0;
  if (a3 > 1.0) {
    return a3 + -1.0;
  }
  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_accessibilitySetTorchState:(CGPoint)a3
{
  self->_torchState.double x = fmax(fmin(a3.x, 1.0), 0.0);
  self->_torchState.double y = fmax(fmin(a3.y, 1.0), 0.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80__SBDynamicFlashlightActivityElementViewController__accessibilitySetTorchState___block_invoke;
  v4[3] = &unk_1E6AF4AC0;
  v4[4] = self;
  [(SBDynamicFlashlightActivityElementViewController *)self _animateUntracked:v4 completion:0];
  [(SBDynamicFlashlightActivityElementViewController *)self _updateDelegateStateAnimated:1];
}

uint64_t __80__SBDynamicFlashlightActivityElementViewController__accessibilitySetTorchState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1120), "setBeamState:", *(double *)(*(void *)(a1 + 32) + 976), *(double *)(*(void *)(a1 + 32) + 984));
}

- (BOOL)shouldDismissWhenOff
{
  return self->_shouldDismissWhenOff;
}

- (void)setElementView:(id)a3
{
}

- (SBDynamicFlashlightActivityElementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBDynamicFlashlightActivityElementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)elementOrientation
{
  return self->_elementOrientation;
}

- (CGRect)preferredContentRect
{
  double x = self->_preferredContentRect.origin.x;
  double y = self->_preferredContentRect.origin.y;
  double width = self->_preferredContentRect.size.width;
  double height = self->_preferredContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_elementView, 0);
  objc_storeStrong((id *)&self->_dismissalTimer, 0);
  objc_storeStrong((id *)&self->_persistenceTimer, 0);
  objc_storeStrong((id *)&self->_gestureStartTime, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_fluidBehaviorSettings, 0);
  objc_storeStrong((id *)&self->_optionsProvider, 0);
}

- (void)initWithOptionsProvider:(uint64_t)a1 state:(NSObject *)a2 fixedWidth:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "VC: Initial state %@", (uint8_t *)&v2, 0xCu);
}

- (void)_beamStateForState:(double)a3 currentBeamState:.cold.1(void *a1, NSObject *a2, double a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [a1 initialIntensity];
  int v6 = 134218240;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  double v9 = a3;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "VC: Converted Intensity from HW %0.3f -> View %0.3f", (uint8_t *)&v6, 0x16u);
}

- (void)setState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_DEBUG, "setState: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_dismissalTimerDidFire:.cold.1()
{
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1(&dword_1D85BA000, v0, v1, "Dismissal timer fired!", v2, v3, v4, v5, v6);
}

@end