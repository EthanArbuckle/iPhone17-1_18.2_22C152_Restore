@interface SBHomeGrabberView
- (BOOL)_autohideEffectivelyEnabled;
- (BOOL)_edgeProtectEffectivelyEnabled;
- (BOOL)autoHides;
- (BOOL)ignoresLuminance;
- (BOOL)isEdgeProtectEnabled;
- (BOOL)isHidden;
- (BOOL)isHomeAffordanceInteractionEnabled;
- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5;
- (BOOL)suppressesBounce;
- (CGRect)_pointerInteractionHitTestRect;
- (CGRect)grabberFrame;
- (CGRect)grabberFrameForBounds:(CGRect)a3;
- (CGRect)grabberHitTestRect;
- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3;
- (CGSize)suggestedSizeForContentWidth:(double)a3;
- (SBHomeGrabberDelegate)delegate;
- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate;
- (SBHomeGrabberView)initWithCoder:(id)a3;
- (SBHomeGrabberView)initWithFrame:(CGRect)a3;
- (SBHomeGrabberView)initWithFrame:(CGRect)a3 settings:(id)a4 shouldEnableGestures:(BOOL)a5;
- (SBHomeGrabberView)initWithFrame:(CGRect)a3 shouldEnableGestures:(BOOL)a4;
- (UIEdgeInsets)standardHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:(id)a3;
- (double)suggestedEdgeSpacing;
- (id)_animationSettingsForTransitionFromStyle:(int64_t)a3 toStyle:(int64_t)a4 fromPresence:(int64_t)a5 toPresence:(int64_t)a6;
- (id)_effectiveLumaDodgePillSettings;
- (id)_newHomeAffordanceView;
- (id)_newPillView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4;
- (id)styleForRegion:(id)a3 forView:(id)a4;
- (int64_t)_calculateLumaStyle;
- (int64_t)_calculatePresence;
- (int64_t)_calculateStyle;
- (int64_t)colorBias;
- (unint64_t)_hintStyleForWindowScene:(id)a3;
- (void)_animateToStyle:(int64_t)a3 disallowAdditive:(BOOL)a4 withAnimationSettings:(id)a5;
- (void)_invalidateInitialAutoHideTime;
- (void)_noteActiveForTouchThatShouldUnhideImmediately:(BOOL)a3;
- (void)_noteClick;
- (void)_noteTap;
- (void)_notifyObserversOfDidUpdateHidden;
- (void)_setSystemPointerInteractionEnabled:(BOOL)a3;
- (void)_updateHitTestRectVisualizationView;
- (void)_updateHomeAffordanceInteraction;
- (void)_updateIdleTouchAwarenessClient;
- (void)_updatePresence:(int64_t)a3 style:(int64_t)a4 withAnimationSettings:(id)a5;
- (void)_updateTouchHitTestBlockingView;
- (void)addObserver:(id)a3;
- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3;
- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6;
- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4;
- (void)dealloc;
- (void)forgetBackgroundLuminance;
- (void)homeAffordanceInteractionDidFailToRecognizeDoubleTap:(id)a3;
- (void)homeAffordanceInteractionDidRecognizeDoubleTap:(id)a3;
- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3;
- (void)homeAffordanceInteractionHomeAffordanceHitTestRectDidChange:(id)a3;
- (void)layoutSubviews;
- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:(id)a3;
- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4;
- (void)removeObserver:(id)a3;
- (void)resetAutoHide;
- (void)resetAutoHideWithInitialDelay:(double)a3;
- (void)setAutoHides:(BOOL)a3;
- (void)setColorBias:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeProtectEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHidden:(BOOL)a3 forReason:(id)a4 withAnimationSettings:(id)a5;
- (void)setHomeAffordanceInteractionEnabled:(BOOL)a3;
- (void)setIgnoresLuminance:(BOOL)a3;
- (void)setPointerClickDelegate:(id)a3;
- (void)setSuppressesBounce:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)turnOffAutoHideWithDelay:(double)a3;
- (void)turnOnAutoHideWithInitialDelay:(double)a3;
- (void)updateStyle;
- (void)updateStyleWithAnimationSettings:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBHomeGrabberView

- (void)layoutSubviews
{
  [(SBHomeGrabberView *)self bounds];
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained additionalEdgeSpacingForHomeGrabberView:self];

  homeAffordanceView = self->_homeAffordanceView;
  SBScreenScale();
  BSRectRoundForScale();
  -[SBFHomeAffordanceView setFrame:](homeAffordanceView, "setFrame:");
  [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction setNeedsUpdate];
  [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction homeAffordanceHitTestRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  -[UIView setFrame:](self->_hitTestRectVisualizationView, "setFrame:");
  -[UIView setFrame:](self->_touchHitTestBlockingView, "setFrame:", v6, v8, v10, v12);
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  -[UIView setFrame:](self->_pointerHitTestBlockingView, "setFrame:");
  pointerHitTestBlockingView = self->_pointerHitTestBlockingView;
  id v14 = [(id)SBApp mousePointerManager];
  -[UIView setHidden:](pointerHitTestBlockingView, "setHidden:", [v14 isHardwarePointingDeviceAttached] ^ 1);
}

- (UIEdgeInsets)standardHomeAffordanceHitTestRectOutsetsForHomeAffordanceInteraction:(id)a3
{
  [(SBHomeGrabberView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  CGFloat rect = v12;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  v19 = [(SBHomeGrabberView *)self window];
  [v19 safeAreaInsets];
  double v21 = v20;

  v41.origin.x = v5;
  v41.origin.y = v7;
  v41.size.width = v9;
  v41.size.height = v11;
  double v22 = CGRectGetMaxY(v41) - v21;
  v42.origin.x = rect;
  v42.origin.y = v14;
  v42.size.width = v16;
  v42.size.height = v18;
  double v23 = vabdd_f64(CGRectGetMaxY(v42), v22);
  v24 = [(UIView *)self _sbWindowScene];
  v25 = [v24 assistantController];
  int v26 = [v25 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  if (v26) {
    double v27 = v23;
  }
  else {
    double v27 = 0.0;
  }
  [(SBFHomeGrabberSettings *)self->_settings hitTestOutsetTop];
  double v29 = v27 + v28;
  if (([(SBFHomeGrabberSettings *)self->_settings constrainHitTestRectToSafeAreaInset] & (v29 > v23)) != 0)double v30 = v23; {
  else
  }
    double v30 = v29;
  [(SBFHomeGrabberSettings *)self->_settings hitTestOutsetSides];
  double v32 = v31;
  v33 = [(SBHomeGrabberView *)self _effectiveLumaDodgePillSettings];
  [v33 edgeSpacing];
  double v35 = v34;

  double v36 = -v30;
  double v37 = -v32;
  double v38 = -v35;
  double v39 = -v32;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (CGRect)grabberFrameForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat rect = *MEMORY[0x1E4F1DB28];
  [(SBHomeGrabberView *)self suggestedSizeForContentWidth:CGRectGetWidth(a3)];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v13 = CGRectGetWidth(v21);
  v22.origin.CGFloat x = rect;
  v22.origin.CGFloat y = v8;
  v22.size.CGFloat width = v10;
  v22.size.CGFloat height = v12;
  CGFloat v14 = (v13 - CGRectGetWidth(v22)) * 0.5;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRectGetHeight(v23);
  v24.origin.CGFloat x = v14;
  v24.origin.CGFloat y = v8;
  v24.size.CGFloat width = v10;
  v24.size.CGFloat height = v12;
  CGRectGetHeight(v24);
  [(SBHomeGrabberView *)self suggestedEdgeSpacing];
  SBScreenScale();
  BSRectRoundForScale();
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGSize)suggestedSizeForContentWidth:(double)a3
{
  pillView = self->_pillView;
  if (pillView)
  {
    -[MTLumaDodgePillView suggestedSizeForContentWidth:](pillView, "suggestedSizeForContentWidth:");
  }
  else
  {
    CGFloat v8 = objc_opt_class();
    double v9 = [(SBHomeGrabberView *)self _effectiveLumaDodgePillSettings];
    [v8 suggestedSizeForContentWidth:v9 withSettings:a3];
    double v11 = v10;
    double v13 = v12;

    double v6 = v11;
    double v7 = v13;
  }
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (double)suggestedEdgeSpacing
{
  v2 = [(SBHomeGrabberView *)self _effectiveLumaDodgePillSettings];
  [v2 edgeSpacing];
  double v4 = v3;

  return v4;
}

- (id)_effectiveLumaDodgePillSettings
{
  pillSettings = self->_pillSettings;
  if (pillSettings)
  {
    double v3 = pillSettings;
  }
  else
  {
    double v3 = [MEMORY[0x1E4F743B8] sharedInstance];
  }
  return v3;
}

- (CGRect)homeAffordanceFrameForHomeAffordanceInteraction:(id)a3
{
  [(SBHomeGrabberView *)self bounds];
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (void)homeAffordanceInteractionHomeAffordanceHitTestRectDidChange:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(SBHomeGrabberView *)self setNeedsLayout];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 homeGrabberViewDidUpdateGrabberHitTestRect:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (int64_t)_calculatePresence
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableSet *)self->_hiddenOverrides count]) {
    return 2;
  }
  if (![(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled] || !self->_touchState) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained
    && ((objc_opt_respondsToSelector() & 1) == 0
     || ([WeakRetained shouldAllowAutoHideForHomeGrabberView:self] & 1) == 0))
  {
    self->_int64_t touchState = 0;
    ++self->_lastInitialHideToken;
    [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient resetAttentionLostTimeout];
    uint64_t v5 = SBLogHomeAffordance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 134217984;
      uint64_t v8 = self;
      _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden for delegate override", (uint8_t *)&v7, 0xCu);
    }
  }
  int64_t touchState = self->_touchState;
  if (touchState == 2) {
    return 1;
  }
  else {
    return 2 * (touchState == 1);
  }
}

- (BOOL)isHidden
{
  return self->_presence != 0;
}

- (void)setSuppressesBounce:(BOOL)a3
{
  self->_suppressesBounce = a3;
}

- (void)setHomeAffordanceInteractionEnabled:(BOOL)a3
{
  if (self->_homeAffordanceInteractionEnabled != a3)
  {
    self->_homeAffordanceInteractionEnabled = a3;
    [(SBHomeGrabberView *)self _updateHomeAffordanceInteraction];
  }
}

- (void)setPointerClickDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    int v7 = [NSString stringWithUTF8String:"-[SBHomeGrabberView setDelegate:]"];
    [v6 handleFailureInFunction:v7 file:@"SBHomeGrabberView.m" lineNumber:200 description:@"this call must be made on the main thread"];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  uint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(SBHomeGrabberView *)self updateStyle];
    [(SBHomeGrabberView *)self setNeedsLayout];
    uint64_t v5 = obj;
  }
}

- (void)turnOffAutoHideWithDelay:(double)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SBHomeGrabberView turnOffAutoHideWithDelay:]"];
    [v8 handleFailureInFunction:v9 file:@"SBHomeGrabberView.m" lineNumber:243 description:@"this call must be made on the main thread"];
  }
  if ([(SBHomeGrabberView *)self _autohideEffectivelyEnabled])
  {
    if (self->_touchState && BSFloatGreaterThanFloat())
    {
      self->_int64_t touchState = 2;
      uint64_t v5 = SBLogHomeAffordance();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        long long v12 = self;
        __int16 v13 = 2048;
        double v14 = a3;
        _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, "grabber=%p touch idleness disabled - preparing to stop asserting hidden after %fs", buf, 0x16u);
      }

      [(SBHomeGrabberView *)self updateStyle];
      unint64_t v6 = self->_lastActivatingToken + 1;
      self->_lastActivatingToken = v6;
      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__SBHomeGrabberView_turnOffAutoHideWithDelay___block_invoke;
      block[3] = &unk_1E6AF4AE8;
      block[4] = self;
      block[5] = v6;
      *(double *)&block[6] = a3;
      dispatch_after(v7, MEMORY[0x1E4F14428], block);
    }
    [(SBHomeGrabberView *)self setAutoHides:0];
  }
}

- (BOOL)_autohideEffectivelyEnabled
{
  if ([(SBFHomeGrabberSettings *)self->_settings autoHideOverride] == 0x7FFFFFFFFFFFFFFFLL) {
    return self->_autoHides;
  }
  return BSSettingFlagIsYes();
}

- (void)setEdgeProtectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    unint64_t v6 = [NSString stringWithUTF8String:"-[SBHomeGrabberView setEdgeProtectEnabled:]"];
    [v5 handleFailureInFunction:v6 file:@"SBHomeGrabberView.m" lineNumber:267 description:@"this call must be made on the main thread"];
  }
  if (self->_edgeProtectEnabled != v3)
  {
    self->_edgeProtectEnabled = v3;
    [(SBHomeGrabberView *)self updateStyle];
  }
}

uint64_t __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setStyle:*(void *)(a1 + 40)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    id v8 = v4;
    if (!observers)
    {
      unint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      dispatch_time_t v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    [(NSHashTable *)observers addObject:v8];
    id v4 = v8;
  }
}

- (id)_newHomeAffordanceView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA5F20]);
  [(SBHomeGrabberView *)self grabberFrame];
  id v4 = objc_msgSend(v3, "initWithFrame:");
  uint64_t v5 = [(UIView *)self _sbWindowScene];
  objc_msgSend(v4, "setHintStyle:", -[SBHomeGrabberView _hintStyleForWindowScene:](self, "_hintStyleForWindowScene:", v5));

  objc_msgSend(v4, "bs_setHitTestingDisabled:", 1);
  return v4;
}

- (unint64_t)_hintStyleForWindowScene:(id)a3
{
  id v3 = [a3 assistantController];
  int v4 = [v3 isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled];

  uint64_t v5 = (unint64_t *)MEMORY[0x1E4FA6100];
  if (!v4) {
    uint64_t v5 = (unint64_t *)MEMORY[0x1E4FA60F8];
  }
  return *v5;
}

- (id)_newPillView
{
  [(SBHomeGrabberView *)self grabberFrame];
  SBRectWithSize();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  long long v11 = [(SBHomeGrabberView *)self _effectiveLumaDodgePillSettings];
  long long v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = objc_msgSend(v12, "sbf_homeGrabberGraphicsQuality");

  double v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F743C0]), "initWithFrame:settings:graphicsQuality:", v11, v13, v4, v6, v8, v10);
  return v14;
}

- (CGRect)grabberFrame
{
  [(SBHomeGrabberView *)self bounds];
  -[SBHomeGrabberView grabberFrameForBounds:](self, "grabberFrameForBounds:");
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2()
{
  v0 = SBLogHomeAffordance();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_cold_1();
  }
}

- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:(id)a3
{
  id v4 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    double v10 = [NSString stringWithUTF8String:"-[SBHomeGrabberView lumaDodgePillDidDetectBackgroundLuminanceChange:]"];
    [v9 handleFailureInFunction:v10 file:@"SBHomeGrabberView.m" lineNumber:919 description:@"this call must be made on the main thread"];
  }
  int64_t luma = self->_luma;
  self->_int64_t luma = [v4 backgroundLuminance];
  double v6 = SBLogHomeAffordance();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBHomeGrabberView lumaDodgePillDidDetectBackgroundLuminanceChange:]();
  }

  if (luma)
  {
    [(SBHomeGrabberView *)self updateStyle];
  }
  else
  {
    double v7 = [(SBFHomeGrabberSettings *)self->_settings initialLumaResponseAnimationSettings];
    double v8 = [v7 BSAnimationSettings];
    [(SBHomeGrabberView *)self updateStyleWithAnimationSettings:v8];
  }
}

- (void)updateStyleWithAnimationSettings:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29060];
  id v5 = a3;
  if (([v4 isMainThread] & 1) == 0)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    double v7 = [NSString stringWithUTF8String:"-[SBHomeGrabberView updateStyleWithAnimationSettings:]"];
    [v6 handleFailureInFunction:v7 file:@"SBHomeGrabberView.m" lineNumber:325 description:@"this call must be made on the main thread"];
  }
  [(SBHomeGrabberView *)self _updatePresence:[(SBHomeGrabberView *)self _calculatePresence] style:[(SBHomeGrabberView *)self _calculateStyle] withAnimationSettings:v5];

  [(SBHomeGrabberView *)self _updateHomeAffordanceInteraction];
}

- (void)updateStyle
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    double v6 = [NSString stringWithUTF8String:"-[SBHomeGrabberView updateStyle]"];
    [v5 handleFailureInFunction:v6 file:@"SBHomeGrabberView.m" lineNumber:316 description:@"this call must be made on the main thread"];
  }
  int64_t v3 = [(SBHomeGrabberView *)self _calculateStyle];
  int64_t v4 = [(SBHomeGrabberView *)self _calculatePresence];
  id v7 = [(SBHomeGrabberView *)self _animationSettingsForTransitionFromStyle:self->_style toStyle:v3 fromPresence:self->_presence toPresence:v4];
  [(SBHomeGrabberView *)self _updatePresence:v4 style:v3 withAnimationSettings:v7];
  [(SBHomeGrabberView *)self _updateHomeAffordanceInteraction];
}

- (void)setHidden:(BOOL)a3 forReason:(id)a4 withAnimationSettings:(id)a5
{
  BOOL v6 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    CGRect v22 = [MEMORY[0x1E4F28B00] currentHandler];
    CGRect v23 = [NSString stringWithUTF8String:"-[SBHomeGrabberView setHidden:forReason:withAnimationSettings:]"];
    [v22 handleFailureInFunction:v23 file:@"SBHomeGrabberView.m" lineNumber:394 description:@"this call must be made on the main thread"];

    if (v9) {
      goto LABEL_3;
    }
  }
  CGRect v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"SBHomeGrabberView.m", 395, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

LABEL_3:
  uint64_t v11 = [(NSMutableSet *)self->_hiddenOverrides count];
  hiddenOverrides = self->_hiddenOverrides;
  if (v6)
  {
    if (hiddenOverrides)
    {
      uint64_t v13 = (void *)[v9 copy];
      [(NSMutableSet *)hiddenOverrides addObject:v13];
    }
    else
    {
      double v14 = (void *)MEMORY[0x1E4F1CA80];
      uint64_t v15 = (void *)[v9 copy];
      double v16 = [v14 setWithObject:v15];
      double v17 = self->_hiddenOverrides;
      self->_hiddenOverrides = v16;
    }
  }
  else
  {
    [(NSMutableSet *)self->_hiddenOverrides removeObject:v9];
  }
  uint64_t v18 = [(NSMutableSet *)self->_hiddenOverrides count];
  if ((v11 == 0) == (v18 != 0))
  {
    uint64_t v19 = v18;
    double v20 = SBLogHomeAffordance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      CGRect v21 = @"stopped";
      if (v19) {
        CGRect v21 = @"started";
      }
      *(_DWORD *)buf = 134218242;
      int v26 = self;
      __int16 v27 = 2114;
      double v28 = v21;
      _os_log_impl(&dword_1D85BA000, v20, OS_LOG_TYPE_INFO, "grabber=%p local override - %{public}@ asserting hidden", buf, 0x16u);
    }

    [(SBHomeGrabberView *)self _updatePresence:[(SBHomeGrabberView *)self _calculatePresence] style:[(SBHomeGrabberView *)self _calculateStyle] withAnimationSettings:v10];
    [(SBHomeGrabberView *)self _updateHomeAffordanceInteraction];
  }
}

- (void)_updateHomeAffordanceInteraction
{
  BOOL v3 = [(SBHomeGrabberView *)self _isInAWindow]
    && ([(SBHomeGrabberView *)self isHiddenOrHasHiddenAncestor] & 1) == 0
    && self->_homeAffordanceView
    && self->_style != 1
    && self->_homeAffordanceInteractionEnabled;
  homeAffordanceInteraction = self->_homeAffordanceInteraction;
  [(SBFHomeAffordanceInteraction *)homeAffordanceInteraction setEnabled:v3];
}

- (void)_updatePresence:(int64_t)a3 style:(int64_t)a4 withAnimationSettings:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  int64_t presence = self->_presence;
  if ((a3 != 0) == (presence != 0))
  {
    if (a3)
    {
      if (presence != a3)
      {
        self->_int64_t presence = a3;
        uint64_t v11 = SBLogHomeAffordance();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          long long v12 = NSStringFromSBHomeGrabberViewPresence(a3);
          *(_DWORD *)buf = 134218242;
          double v36 = self;
          __int16 v37 = 2114;
          double v38 = v12;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "grabber=%p presence change to %{public}@", buf, 0x16u);
        }
        int64_t v13 = self->_presence;
        if (v13 == 1)
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_57;
          v28[3] = &unk_1E6AF4AC0;
          v28[4] = self;
          [MEMORY[0x1E4F42FF0] performWithoutAnimation:v28];
        }
        else if (v13 == 2 {
               && ![(NSMutableSet *)self->_outstandingVisibilityTransitionTokens count]
        }
               && [(SBFHomeGrabberSettings *)self->_settings removeViewOnHide])
        {
          [(MTLumaDodgePillView *)self->_pillView setBackgroundLumninanceObserver:0];
          pillView = self->_pillView;
          self->_pillView = 0;

          [(SBFHomeAffordanceView *)self->_homeAffordanceView removeFromSuperview];
          homeAffordanceView = self->_homeAffordanceView;
          self->_homeAffordanceView = 0;

          [(SBHomeGrabberView *)self _setSystemPointerInteractionEnabled:0];
          self->_int64_t luma = 0;
        }
      }
      self->_style = a4;
    }
    else
    {
      if (presence)
      {
        int v26 = [MEMORY[0x1E4F28B00] currentHandler];
        __int16 v27 = NSStringFromSBHomeGrabberViewPresence(self->_presence);
        [v26 handleFailureInMethod:a2, self, @"SBHomeGrabberView.m", 725, @"grabber=%p from visible to visible means the presence shouldn't change : %@ -> %@", self, v27, @"visible" object file lineNumber description];
      }
      if (self->_style != a4)
      {
        self->_style = a4;
        [(SBHomeGrabberView *)self _animateToStyle:a4 disallowAdditive:0 withAnimationSettings:v9];
      }
    }
  }
  else
  {
    self->_int64_t presence = a3;
    self->_style = a4;
    if (presence)
    {
      if ([(NSMutableSet *)self->_outstandingVisibilityTransitionTokens count])
      {
        [(SBHomeGrabberView *)self _animateToStyle:self->_style disallowAdditive:1 withAnimationSettings:v9];
      }
      else
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke;
        v34[3] = &unk_1E6AF4AC0;
        v34[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v34];
      }
    }
    double v16 = NSNumber;
    ++self->_lastVisibilityTransitionToken;
    double v17 = objc_msgSend(v16, "numberWithUnsignedInteger:");
    outstandingVisibilityTransitionTokens = self->_outstandingVisibilityTransitionTokens;
    if (outstandingVisibilityTransitionTokens)
    {
      [(NSMutableSet *)outstandingVisibilityTransitionTokens addObject:v17];
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F1CA80] setWithObject:v17];
      double v20 = self->_outstandingVisibilityTransitionTokens;
      self->_outstandingVisibilityTransitionTokens = v19;
    }
    CGRect v21 = [MEMORY[0x1E4F4F898] factoryWithSettings:v9];
    [v21 setAllowsAdditiveAnimations:1];
    CGRect v22 = SBLogHomeAffordance();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      CGRect v23 = NSStringFromSBHomeGrabberViewPresence(a3);
      *(_DWORD *)buf = 134218498;
      double v36 = self;
      __int16 v37 = 2114;
      double v38 = v23;
      __int16 v39 = 2114;
      id v40 = v9;
      _os_log_impl(&dword_1D85BA000, v22, OS_LOG_TYPE_INFO, "grabber=%p additive presence change to %{public}@ with %{public}@", buf, 0x20u);
    }
    CGRect v24 = (void *)MEMORY[0x1E4F4F898];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_53;
    v32[3] = &unk_1E6AF5D38;
    v32[4] = self;
    BOOL v33 = a3 != 0;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2;
    v29[3] = &unk_1E6B017F0;
    id v30 = v17;
    int64_t v31 = a3;
    v29[4] = self;
    id v25 = v17;
    [v24 animateWithFactory:v21 options:4 actions:v32 completion:v29];
    [(SBHomeGrabberView *)self _notifyObserversOfDidUpdateHidden];
  }
}

- (int64_t)_calculateStyle
{
  if ([(SBHomeGrabberView *)self _edgeProtectEffectivelyEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    {
      char v4 = [WeakRetained shouldAllowThinStyleForHomeGrabberView:self];

      if ((v4 & 1) == 0) {
        goto LABEL_5;
      }
    }
    else
    {
    }
    return 1;
  }
LABEL_5:
  return [(SBHomeGrabberView *)self _calculateLumaStyle];
}

- (BOOL)_edgeProtectEffectivelyEnabled
{
  if ([(SBFHomeGrabberSettings *)self->_settings edgeProtectOverride] == 0x7FFFFFFFFFFFFFFFLL) {
    return self->_edgeProtectEnabled;
  }
  return BSSettingFlagIsYes();
}

- (int64_t)_calculateLumaStyle
{
  int64_t luma = self->_luma;
  if (self->_ignoresLuminance) {
    int64_t luma = 0;
  }
  if (luma == 2) {
    return 3;
  }
  if (luma == 1) {
    return 4;
  }
  int64_t colorBias = self->_colorBias;
  if (colorBias == 1) {
    return 3;
  }
  if (colorBias == 2) {
    return 4;
  }
  unint64_t v5 = [(SBFHomeGrabberSettings *)self->_settings initializationStyle];
  if (v5 >= 3) {
    return 0;
  }
  else {
    return v5 + 2;
  }
}

- (void)_animateToStyle:(int64_t)a3 disallowAdditive:(BOOL)a4 withAnimationSettings:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if ([(MTLumaDodgePillView *)self->_pillView style] != a3)
  {
    id v9 = [MEMORY[0x1E4F4F898] factoryWithSettings:v8];
    id v10 = v9;
    if ((unint64_t)a3 < 2 || a4)
    {
      int64_t v13 = SBLogHomeAffordance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        double v14 = NSStringFromMTLumaDodgePillStyle();
        *(_DWORD *)buf = 134218498;
        double v20 = self;
        __int16 v21 = 2114;
        CGRect v22 = v14;
        __int16 v23 = 2114;
        id v24 = v8;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "grabber=%p style change to %{public}@ with %{public}@", buf, 0x20u);
      }
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_49;
      v16[3] = &unk_1E6AF4A70;
      v16[4] = self;
      v16[5] = a3;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_50;
      v15[3] = &unk_1E6AFF1A8;
      v15[4] = self;
      v15[5] = a3;
      [MEMORY[0x1E4F4F898] animateWithSettings:v8 options:4 actions:v16 completion:v15];
    }
    else
    {
      [v9 setAllowsAdditiveAnimations:1];
      uint64_t v11 = SBLogHomeAffordance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        long long v12 = NSStringFromMTLumaDodgePillStyle();
        *(_DWORD *)buf = 134218498;
        double v20 = self;
        __int16 v21 = 2114;
        CGRect v22 = v12;
        __int16 v23 = 2114;
        id v24 = v8;
        _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "grabber=%p additive style change to %{public}@ with %{public}@", buf, 0x20u);
      }
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke;
      v18[3] = &unk_1E6AF4A70;
      v18[4] = self;
      v18[5] = a3;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2;
      v17[3] = &unk_1E6AFF1A8;
      v17[4] = self;
      v17[5] = a3;
      [MEMORY[0x1E4F4F898] animateWithFactory:v10 options:4 actions:v18 completion:v17];
    }
  }
}

- (void)_notifyObserversOfDidUpdateHidden
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 homeGrabberViewDidUpdateHidden:self];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)_animationSettingsForTransitionFromStyle:(int64_t)a3 toStyle:(int64_t)a4 fromPresence:(int64_t)a5 toPresence:(int64_t)a6
{
  if (a3) {
    BOOL v6 = a5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  int v7 = v6;
  if (a4) {
    BOOL v8 = a6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  int v9 = !v8;
  if ((v7 & 1) != 0 || !v9)
  {
    if ((v7 | v9))
    {
      if ((v7 & v9) == 1)
      {
        long long v11 = [(SBFHomeGrabberSettings *)self->_settings hideAnimationSettings];
      }
      else
      {
        if (a3 != 1) {
          LOBYTE(v9) = 1;
        }
        if (v9)
        {
          char v14 = v7 ^ 1;
          settings = self->_settings;
          if (a4 != 1) {
            char v14 = 1;
          }
          if (v14) {
            [(SBFHomeGrabberSettings *)settings lumaResponseAnimationSettings];
          }
          else {
          long long v11 = [(SBFHomeGrabberSettings *)settings prominentToThinAnimationSettings];
          }
        }
        else
        {
          long long v11 = [(SBFHomeGrabberSettings *)self->_settings thinToProminentAnimationSettings];
        }
      }
    }
    else
    {
      long long v11 = [(SBFHomeGrabberSettings *)self->_settings unhideAnimationSettings];
    }
    long long v12 = v11;
    long long v10 = [v11 BSAnimationSettings];
  }
  else
  {
    long long v10 = 0;
  }
  return v10;
}

uint64_t __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_53(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:v1];
}

- (SBHomeGrabberView)initWithFrame:(CGRect)a3 settings:(id)a4 shouldEnableGestures:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    __int16 v39 = [MEMORY[0x1E4F28B00] currentHandler];
    id v40 = [NSString stringWithUTF8String:"-[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:]"];
    [v39 handleFailureInFunction:v40 file:@"SBHomeGrabberView.m" lineNumber:121 description:@"this call must be made on the main thread"];
  }
  v41.receiver = self;
  v41.super_class = (Class)SBHomeGrabberView;
  int64_t v13 = -[SBHomeGrabberView initWithFrame:](&v41, sel_initWithFrame_, x, y, width, height);
  char v14 = v13;
  if (v13)
  {
    v13->_shouldEnableGestures = a5;
    uint64_t v15 = [MEMORY[0x1E4FA5F28] rootSettings];
    settings = v14->_settings;
    v14->_settings = (SBFHomeGrabberSettings *)v15;

    [(SBFHomeGrabberSettings *)v14->_settings addKeyPathObserver:v14];
    [(SBHomeGrabberView *)v14 setAccessibilityIdentifier:@"Home Grabber"];
    objc_storeStrong((id *)&v14->_pillSettings, a4);
    id v17 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v18 = *MEMORY[0x1E4F1DB28];
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v22 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E4F1DB28], v19, v20, v21);
    touchHitTestBlockingView = v14->_touchHitTestBlockingView;
    v14->_touchHitTestBlockingView = (UIView *)v22;

    id v24 = [(UIView *)v14->_touchHitTestBlockingView layer];
    [v24 setHitTestsAsOpaque:1];

    [(SBHomeGrabberView *)v14 _updateTouchHitTestBlockingView];
    [(SBHomeGrabberView *)v14 addSubview:v14->_touchHitTestBlockingView];
    uint64_t v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v18, v19, v20, v21);
    pointerHitTestBlockingView = v14->_pointerHitTestBlockingView;
    v14->_pointerHitTestBlockingView = (UIView *)v25;

    __int16 v27 = [(UIView *)v14->_pointerHitTestBlockingView layer];
    [v27 setHitTestsAsOpaque:1];

    [(SBHomeGrabberView *)v14 addSubview:v14->_pointerHitTestBlockingView];
    uint64_t v28 = [(SBHomeGrabberView *)v14 _newPillView];
    pillView = v14->_pillView;
    v14->_pillView = (MTLumaDodgePillView *)v28;

    [(MTLumaDodgePillView *)v14->_pillView setBackgroundLumninanceObserver:v14];
    uint64_t v30 = [(SBHomeGrabberView *)v14 _newHomeAffordanceView];
    homeAffordanceView = v14->_homeAffordanceView;
    v14->_homeAffordanceView = (SBFHomeAffordanceView *)v30;

    [(SBFHomeAffordanceView *)v14->_homeAffordanceView addContentView:v14->_pillView];
    [(SBHomeGrabberView *)v14 addSubview:v14->_homeAffordanceView];
    double v32 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.SpringBoard.HomeGrabberView-%llu", ++initWithFrame_settings_shouldEnableGestures____grabberNumber);
    id v33 = objc_alloc_init(MEMORY[0x1E4F4E708]);
    [v33 setIdentifier:v32];
    [v33 setEventMask:8];
    [(SBFHomeGrabberSettings *)v14->_settings autoHideTime];
    objc_msgSend(v33, "setAttentionLostTimeout:");
    double v34 = objc_alloc_init(SBAttentionAwarenessClient);
    idleTouchAwarenessClient = v14->_idleTouchAwarenessClient;
    v14->_idleTouchAwarenessClient = v34;

    [(SBAttentionAwarenessClient *)v14->_idleTouchAwarenessClient setDelegate:v14];
    [(SBAttentionAwarenessClient *)v14->_idleTouchAwarenessClient setConfiguration:v33];
    [(SBHomeGrabberView *)v14 settings:v14->_settings changedValueForKeyPath:0];
    [(SBHomeGrabberView *)v14 _setSystemPointerInteractionEnabled:1];
    double v36 = [(id)SBApp mousePointerManager];
    [v36 addObserver:v14];

    __int16 v37 = SBLogHomeAffordance();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
      -[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:]((uint64_t)v14, &v14->_pillView, v37);
    }
  }
  return v14;
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  double v1 = *(void **)(a1 + 32);
  if (v1[53])
  {
    uint64_t v3 = v1[67];
    uint64_t v4 = (void *)v1[54];
    [v4 setStyle:v3];
  }
  else
  {
    uint64_t v5 = [v1 _newPillView];
    BOOL v6 = (void *)*((void *)*v2 + 54);
    *((void *)*v2 + 54) = v5;

    uint64_t v7 = *((void *)*v2 + 77);
    if (v7 == 2) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2 * (v7 == 1);
    }
    [*((id *)*v2 + 54) setBackgroundLuminanceBias:v8];
    [*((id *)*v2 + 54) setStyle:*((void *)*v2 + 67)];
    int v9 = (id *)*v2;
    if (!*((unsigned char *)*v2 + 601))
    {
      objc_msgSend(v9[54], "setBackgroundLumninanceObserver:");
      int v9 = (id *)*v2;
    }
    uint64_t v10 = [v9 _newHomeAffordanceView];
    long long v11 = (void *)*((void *)*v2 + 53);
    *((void *)*v2 + 53) = v10;

    [*((id *)*v2 + 53) setAlpha:0.0];
    [*((id *)*v2 + 53) addContentView:*((void *)*v2 + 54)];
    [*v2 addSubview:*((void *)*v2 + 53)];
    [*v2 _setSystemPointerInteractionEnabled:1];
    [*v2 layoutSubviews];
    id v12 = SBLogHomeAffordance();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_cold_1();
    }
  }
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2(uint64_t a1)
{
  v2 = SBLogHomeAffordance();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2_cold_1(a1);
  }

  [*(id *)(*(void *)(a1 + 32) + 552) removeObject:*(void *)(a1 + 40)];
  if (![*(id *)(*(void *)(a1 + 32) + 552) count])
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 552);
    *(void *)(v3 + 552) = 0;

    uint64_t v5 = *(void *)(a1 + 32);
    if (*(void *)(v5 + 528) == 2)
    {
      if ([*(id *)(v5 + 408) removeViewOnHide])
      {
        [*(id *)(*(void *)(a1 + 32) + 432) setBackgroundLumninanceObserver:0];
        uint64_t v6 = *(void *)(a1 + 32);
        uint64_t v7 = *(void **)(v6 + 432);
        *(void *)(v6 + 432) = 0;

        [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
        uint64_t v8 = *(void *)(a1 + 32);
        int v9 = *(void **)(v8 + 424);
        *(void *)(v8 + 424) = 0;

        [*(id *)(a1 + 32) _setSystemPointerInteractionEnabled:0];
        *(void *)(*(void *)(a1 + 32) + 520) = 0;
      }
    }
  }
}

- (void)_setSystemPointerInteractionEnabled:(BOOL)a3
{
  if (self->_isSystemPointerInteractionEnabled != a3)
  {
    self->_isSystemPointerInteractionEnabled = a3;
    if (self->_shouldEnableGestures)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
      id v5 = WeakRetained;
      if (self->_isSystemPointerInteractionEnabled) {
        [WeakRetained registerView:self delegate:self];
      }
      else {
        [WeakRetained unregisterView:self];
      }
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  if (self->_shouldEnableGestures)
  {
    id v4 = a3;
    id v17 = [(UIView *)self _sbWindowScene];
    id v5 = [v4 _sbWindowScene];

    uint64_t v6 = [v17 homeAffordanceInteractionManager];
    uint64_t v7 = [v5 homeAffordanceInteractionManager];
    if (v7 != v6)
    {
      p_homeAffordanceInteraction = &self->_homeAffordanceInteraction;
      homeAffordanceInteraction = self->_homeAffordanceInteraction;
      if (homeAffordanceInteraction)
      {
        [(SBFHomeAffordanceInteraction *)homeAffordanceInteraction setDelegate:0];
        [(SBHomeGrabberView *)self removeInteraction:*p_homeAffordanceInteraction];
        uint64_t v10 = *p_homeAffordanceInteraction;
        *p_homeAffordanceInteraction = 0;
      }
      long long v11 = (void *)[v7 newHomeAffordanceInteraction];
      id v12 = v11;
      if (v11)
      {
        [v11 setDelegate:self];
        [v12 setEnabled:self->_homeAffordanceInteractionEnabled];
        [(SBHomeGrabberView *)self addInteraction:v12];
        objc_storeStrong((id *)&self->_homeAffordanceInteraction, v12);
      }
    }
    int64_t v13 = [v17 systemPointerInteractionManager];
    char v14 = [v5 systemPointerInteractionManager];
    if (v14 != v13)
    {
      [v13 unregisterView:self];
      if (self->_isSystemPointerInteractionEnabled && ([v14 isViewRegistered:self] & 1) == 0) {
        [v14 registerView:self delegate:self];
      }
      objc_storeWeak((id *)&self->_systemPointerInteractionManager, v14);
    }
    uint64_t v15 = [v17 assistantController];
    double v16 = [v5 assistantController];
    if (v16 != v15)
    {
      [v15 removeObserver:self];
      [v16 addObserver:self];
      objc_storeWeak((id *)&self->_assistantController, v16);
    }
  }
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  [(SBHomeGrabberView *)self _updatePresence:[(SBHomeGrabberView *)self _calculatePresence] style:[(SBHomeGrabberView *)self _calculateStyle] withAnimationSettings:0];
  [(SBHomeGrabberView *)self _updateHomeAffordanceInteraction];
  [(SBHomeGrabberView *)self _updateIdleTouchAwarenessClient];
  [(SBHomeGrabberView *)self _updateHitTestRectVisualizationView];
  [(SBHomeGrabberView *)self setNeedsLayout];
}

- (void)_updateTouchHitTestBlockingView
{
  if (self->_touchHitTestBlockingViewBlocksTouches) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = SBFIsSAEHungryHomeAffordanceAvailable() ^ 1;
  }
  touchHitTestBlockingView = self->_touchHitTestBlockingView;
  [(UIView *)touchHitTestBlockingView setHidden:v3];
}

- (void)_updateIdleTouchAwarenessClient
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBHomeGrabberView *)self _autohideEffectivelyEnabled];
  BOOL v4 = [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled];
  if (v3)
  {
    if (v4) {
      return;
    }
    [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient resetAttentionLostTimeout];
    [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:1];
    ++self->_lastInitialHideToken;
    id v5 = SBLogHomeAffordance();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
      goto LABEL_13;
    }
    int v8 = 134217984;
    int v9 = self;
    uint64_t v6 = "grabber=%p started observing touch idleness";
    goto LABEL_12;
  }
  if (!v4) {
    return;
  }
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
  if (self->_touchState != 1)
  {
    id v5 = SBLogHomeAffordance();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_13:

      return;
    }
    int v8 = 134217984;
    int v9 = self;
    uint64_t v6 = "grabber=%p stopped observing touch idleness";
LABEL_12:
    _os_log_impl(&dword_1D85BA000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v8, 0xCu);
    goto LABEL_13;
  }
  self->_int64_t touchState = 0;
  uint64_t v7 = SBLogHomeAffordance();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134217984;
    int v9 = self;
    _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "grabber=%p stopped observing touch idleness - stopped asserting hidden", (uint8_t *)&v8, 0xCu);
  }

  [(SBHomeGrabberView *)self updateStyle];
}

- (void)_updateHitTestRectVisualizationView
{
  int v3 = [(SBFHomeGrabberSettings *)self->_settings visualizeHitTestRect];
  hitTestRectVisualizationView = self->_hitTestRectVisualizationView;
  if (v3) {
    BOOL v5 = hitTestRectVisualizationView == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction homeAffordanceHitTestRect];
    uint64_t v10 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v6, v7, v8, v9);
    long long v11 = self->_hitTestRectVisualizationView;
    self->_hitTestRectVisualizationView = v10;

    id v12 = self->_hitTestRectVisualizationView;
    int64_t v13 = [MEMORY[0x1E4F428B8] systemRedColor];
    char v14 = [v13 colorWithAlphaComponent:0.5];
    [(UIView *)v12 setBackgroundColor:v14];

    [(UIView *)self->_hitTestRectVisualizationView bs_setHitTestingDisabled:1];
    uint64_t v15 = self->_hitTestRectVisualizationView;
    [(SBHomeGrabberView *)self addSubview:v15];
  }
  else
  {
    if (!hitTestRectVisualizationView) {
      LOBYTE(v3) = 1;
    }
    if ((v3 & 1) == 0)
    {
      [(UIView *)hitTestRectVisualizationView removeFromSuperview];
      double v16 = self->_hitTestRectVisualizationView;
      self->_hitTestRectVisualizationView = 0;
    }
  }
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4) & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v4 = [NSString stringWithUTF8String:"-[SBHomeGrabberView clientDidResetForUserAttention:withEvent:]"];
    [v5 handleFailureInFunction:v4 file:@"SBHomeGrabberView.m" lineNumber:913 description:@"this call must be made on the main thread"];
  }
}

- (void)client:(id)a3 attentionLostTimeoutDidExpire:(double)a4 forConfigurationGeneration:(unint64_t)a5 withAssociatedObject:(id)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a5, a6, a4) & 1) == 0)
  {
    double v8 = [MEMORY[0x1E4F28B00] currentHandler];
    double v9 = [NSString stringWithUTF8String:"-[SBHomeGrabberView client:attentionLostTimeoutDidExpire:forConfigurationGeneration:withAssociatedObject:]"];
    [v8 handleFailureInFunction:v9 file:@"SBHomeGrabberView.m" lineNumber:904 description:@"this call must be made on the main thread"];
  }
  if ([(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled] && self->_touchState != 1)
  {
    self->_int64_t touchState = 1;
    double v7 = SBLogHomeAffordance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v10 = 134217984;
      long long v11 = self;
      _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - started asserting hidden", (uint8_t *)&v10, 0xCu);
    }

    [(SBHomeGrabberView *)self updateStyle];
  }
}

- (SBHomeGrabberView)initWithFrame:(CGRect)a3
{
  return -[SBHomeGrabberView initWithFrame:shouldEnableGestures:](self, "initWithFrame:shouldEnableGestures:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHomeGrabberView)initWithFrame:(CGRect)a3 shouldEnableGestures:(BOOL)a4
{
  return -[SBHomeGrabberView initWithFrame:settings:shouldEnableGestures:](self, "initWithFrame:settings:shouldEnableGestures:", 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBHomeGrabberView)initWithCoder:(id)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBHomeGrabberView.m", 173, @"cannot call %s", "-[SBHomeGrabberView initWithCoder:]");

  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  return -[SBHomeGrabberView initWithFrame:](self, "initWithFrame:", v6, v7, v8, v9);
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  [(SBFHomeGrabberSettings *)self->_settings removeKeyPathObserver:self];
  if (self->_shouldEnableGestures && self->_isSystemPointerInteractionEnabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_systemPointerInteractionManager);
    [WeakRetained unregisterView:self];
  }
  if ([(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled])
  {
    [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setEnabled:0];
    BOOL v4 = SBLogHomeAffordance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v8 = self;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "grabber=%p stopped observing touch idleness - dealloc", buf, 0xCu);
    }
  }
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient setDelegate:0];
  [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient invalidate];
  id v5 = objc_loadWeakRetained((id *)&self->_assistantController);
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)SBHomeGrabberView;
  [(SBHomeGrabberView *)&v6 dealloc];
}

- (void)removeObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    observers = self->_observers;
    self->_observers = 0;
  }
}

- (void)setAutoHides:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"-[SBHomeGrabberView setAutoHides:]"];
    [v5 handleFailureInFunction:v6 file:@"SBHomeGrabberView.m" lineNumber:227 description:@"this call must be made on the main thread"];
  }
  if (self->_autoHides != v3)
  {
    self->_autoHides = v3;
    [(SBHomeGrabberView *)self _updateIdleTouchAwarenessClient];
  }
}

- (void)turnOnAutoHideWithInitialDelay:(double)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_super v6 = [NSString stringWithUTF8String:"-[SBHomeGrabberView turnOnAutoHideWithInitialDelay:]"];
    [v5 handleFailureInFunction:v6 file:@"SBHomeGrabberView.m" lineNumber:235 description:@"this call must be made on the main thread"];
  }
  if (![(SBHomeGrabberView *)self _autohideEffectivelyEnabled])
  {
    [(SBHomeGrabberView *)self setAutoHides:1];
    [(SBHomeGrabberView *)self resetAutoHideWithInitialDelay:a3];
  }
}

uint64_t __46__SBHomeGrabberView_turnOffAutoHideWithDelay___block_invoke(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 480) == 2)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 40) == *(void *)(v1 + 488))
    {
      *(void *)(v1 + 480) = 0;
      [*(id *)(*(void *)(result + 32) + 472) resetAttentionLostTimeout];
      BOOL v3 = SBLogHomeAffordance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(v2 + 32);
        uint64_t v5 = *(void *)(v2 + 48);
        int v6 = 134218240;
        uint64_t v7 = v4;
        __int16 v8 = 2048;
        uint64_t v9 = v5;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "grabber=%p touch idleness disabled - stopped asserting hidden after %fs", (uint8_t *)&v6, 0x16u);
      }

      return [*(id *)(v2 + 32) updateStyle];
    }
  }
  return result;
}

- (void)forgetBackgroundLuminance
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    BOOL v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[SBHomeGrabberView forgetBackgroundLuminance]"];
    [v3 handleFailureInFunction:v4 file:@"SBHomeGrabberView.m" lineNumber:275 description:@"this call must be made on the main thread"];
  }
  self->_int64_t luma = 0;
  if (!self->_ignoresLuminance)
  {
    [(MTLumaDodgePillView *)self->_pillView setBackgroundLumninanceObserver:0];
    [(MTLumaDodgePillView *)self->_pillView setBackgroundLumninanceObserver:self];
    [(SBHomeGrabberView *)self updateStyle];
  }
}

- (void)resetAutoHide
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[SBHomeGrabberView resetAutoHide]"];
    [v4 handleFailureInFunction:v5 file:@"SBHomeGrabberView.m" lineNumber:285 description:@"this call must be made on the main thread"];
  }
  ++self->_lastInitialHideToken;
  if ([(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled])
  {
    if (self->_touchState)
    {
      self->_int64_t touchState = 0;
      BOOL v3 = SBLogHomeAffordance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v6 = 134217984;
        uint64_t v7 = self;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden for manual reset", (uint8_t *)&v6, 0xCu);
      }

      [(SBHomeGrabberView *)self updateStyle];
    }
    [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient resetAttentionLostTimeout];
  }
}

- (void)resetAutoHideWithInitialDelay:(double)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[SBHomeGrabberView resetAutoHideWithInitialDelay:]"];
    [v8 handleFailureInFunction:v9 file:@"SBHomeGrabberView.m" lineNumber:298 description:@"this call must be made on the main thread"];
  }
  [(SBHomeGrabberView *)self resetAutoHide];
  if (BSFloatGreaterThanFloat())
  {
    [(SBFHomeGrabberSettings *)self->_settings autoHideTime];
    if (BSFloatLessThanFloat())
    {
      unint64_t v5 = self->_lastInitialHideToken + 1;
      self->_lastInitialHideToken = v5;
      int v6 = SBLogHomeAffordance();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        uint64_t v12 = self;
        __int16 v13 = 2048;
        unint64_t v14 = v5;
        __int16 v15 = 2048;
        double v16 = a3;
        _os_log_debug_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_DEBUG, "grabber=%p touch idleness - preparing to start asserting hidden for initial delay with token=%lu after %fs", buf, 0x20u);
      }

      dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke;
      block[3] = &unk_1E6AF4AE8;
      block[4] = self;
      block[5] = v5;
      *(double *)&block[6] = a3;
      dispatch_after(v7, MEMORY[0x1E4F14428], block);
    }
  }
}

void __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (id *)(a1 + 4);
  uint64_t v2 = a1[4];
  if (*(void *)(v2 + 480) == 1 || a1[5] != *(void *)(v2 + 496))
  {
    uint64_t v8 = SBLogHomeAffordance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke_cold_1();
    }
  }
  else
  {
    *(void *)(v2 + 480) = 1;
    uint64_t v4 = SBLogHomeAffordance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = a1[4];
      uint64_t v6 = a1[5];
      uint64_t v7 = a1[6];
      int v9 = 134218496;
      uint64_t v10 = v5;
      __int16 v11 = 2048;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1D85BA000, v4, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - started asserting hidden for initial delay with token=%lu after %fs", (uint8_t *)&v9, 0x20u);
    }

    [*v3 updateStyle];
  }
}

- (CGRect)grabberHitTestRect
{
  [(SBFHomeAffordanceInteraction *)self->_homeAffordanceInteraction homeAffordanceHitTestRect];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setColorBias:(int64_t)a3
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SBHomeGrabberView setColorBias:]"];
    [v6 handleFailureInFunction:v7 file:@"SBHomeGrabberView.m" lineNumber:356 description:@"this call must be made on the main thread"];
  }
  if (self->_colorBias != a3)
  {
    self->_int64_t colorBias = a3;
    uint64_t v5 = a3 == 2 ? 1 : 2 * (a3 == 1);
    [(MTLumaDodgePillView *)self->_pillView setBackgroundLuminanceBias:v5];
    if (!self->_luma)
    {
      [(SBHomeGrabberView *)self updateStyleWithAnimationSettings:0];
    }
  }
}

- (void)setIgnoresLuminance:(BOOL)a3
{
  BOOL v3 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[SBHomeGrabberView setIgnoresLuminance:]"];
    [v6 handleFailureInFunction:v7 file:@"SBHomeGrabberView.m" lineNumber:376 description:@"this call must be made on the main thread"];
  }
  if (self->_ignoresLuminance != v3)
  {
    self->_ignoresLuminance = v3;
    if (v3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = self;
    }
    [(MTLumaDodgePillView *)self->_pillView setBackgroundLumninanceObserver:v5];
    [(SBHomeGrabberView *)self updateStyleWithAnimationSettings:0];
  }
}

- (void)setHidden:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"SBHomeGrabberView.m" lineNumber:390 description:@"-setHidden: is unavailable on SBHomeGrabberView"];
}

- (void)_invalidateInitialAutoHideTime
{
}

- (void)_noteActiveForTouchThatShouldUnhideImmediately:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  ++self->_lastInitialHideToken;
  if ([(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient isEnabled])
  {
    [(SBFHomeGrabberSettings *)self->_settings delayForUnhideOnTouch];
    double v6 = v5;
    if ((BSFloatLessThanOrEqualToFloat() & 1) == 0
      && (![(NSMutableSet *)self->_outstandingVisibilityTransitionTokens count] ? (BOOL v7 = !v3) : (BOOL v7 = 0), v7))
    {
      if (self->_touchState == 1)
      {
        self->_int64_t touchState = 2;
        int v9 = SBLogHomeAffordance();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v14 = self;
          __int16 v15 = 2048;
          double v16 = v6;
          _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - preparing to stop asserting hidden after %fs", buf, 0x16u);
        }

        [(SBHomeGrabberView *)self updateStyle];
        unint64_t v10 = self->_lastActivatingToken + 1;
        self->_lastActivatingToken = v10;
        dispatch_time_t v11 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__SBHomeGrabberView__noteActiveForTouchThatShouldUnhideImmediately___block_invoke;
        block[3] = &unk_1E6AF4AE8;
        block[4] = self;
        block[5] = v10;
        *(double *)&block[6] = v6;
        dispatch_after(v11, MEMORY[0x1E4F14428], block);
      }
    }
    else if (self->_touchState)
    {
      self->_int64_t touchState = 0;
      [(SBAttentionAwarenessClient *)self->_idleTouchAwarenessClient resetAttentionLostTimeout];
      uint64_t v8 = SBLogHomeAffordance();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = self;
        _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden immediately", buf, 0xCu);
      }

      [(SBHomeGrabberView *)self updateStyle];
    }
  }
}

uint64_t __68__SBHomeGrabberView__noteActiveForTouchThatShouldUnhideImmediately___block_invoke(uint64_t result)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 480) == 2)
  {
    uint64_t v2 = result;
    if (*(void *)(result + 40) == *(void *)(v1 + 488))
    {
      *(void *)(v1 + 480) = 0;
      [*(id *)(*(void *)(result + 32) + 472) resetAttentionLostTimeout];
      BOOL v3 = SBLogHomeAffordance();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = *(void *)(v2 + 32);
        uint64_t v5 = *(void *)(v2 + 48);
        int v6 = 134218240;
        uint64_t v7 = v4;
        __int16 v8 = 2048;
        uint64_t v9 = v5;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "grabber=%p touch idleness changed - stopped asserting hidden after %fs", (uint8_t *)&v6, 0x16u);
      }

      return [*(id *)(v2 + 32) updateStyle];
    }
  }
  return result;
}

- (void)_noteClick
{
  uint64_t v7 = [a1 window];
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "grabber=%@ in window %@ registered a pointer click, but doesn't have a pointer click delegate.", v3, v4, v5, v6, 2u);
}

- (void)_noteTap
{
  if (!self->_presence && !self->_suppressesBounce) {
    [(SBFHomeAffordanceView *)self->_homeAffordanceView performHintAnimation];
  }
}

uint64_t __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_49(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setStyle:*(void *)(a1 + 40)];
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_50()
{
  v0 = SBLogHomeAffordance();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_50_cold_1();
  }
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_57(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void **)(a1 + 32);
  if (!v1[53])
  {
    uint64_t v3 = [v1 _newPillView];
    uint64_t v4 = (void *)*((void *)*v2 + 54);
    *((void *)*v2 + 54) = v3;

    uint64_t v5 = *((void *)*v2 + 77);
    if (v5 == 2) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = 2 * (v5 == 1);
    }
    [*((id *)*v2 + 54) setBackgroundLuminanceBias:v6];
    [*((id *)*v2 + 54) setStyle:*((void *)*v2 + 67)];
    uint64_t v7 = (id *)*v2;
    if (!*((unsigned char *)*v2 + 601))
    {
      objc_msgSend(v7[54], "setBackgroundLumninanceObserver:");
      uint64_t v7 = (id *)*v2;
    }
    uint64_t v8 = [v7 _newHomeAffordanceView];
    uint64_t v9 = (void *)*((void *)*v2 + 53);
    *((void *)*v2 + 53) = v8;

    [*((id *)*v2 + 53) setAlpha:0.0];
    [*((id *)*v2 + 53) addContentView:*((void *)*v2 + 54)];
    [*v2 addSubview:*((void *)*v2 + 53)];
    [*v2 _setSystemPointerInteractionEnabled:1];
    [*v2 layoutSubviews];
    uint64_t v10 = SBLogHomeAffordance();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_cold_1();
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBHomeGrabberView;
  -[SBHomeGrabberView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (SBHomeGrabberView *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = v5;
  if (v5 == self) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v5;
  }

  return v7;
}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  homeAffordanceView = self->_homeAffordanceView;
  id v5 = [(UIView *)self _sbWindowScene];
  [(SBFHomeAffordanceView *)homeAffordanceView setHintStyle:[(SBHomeGrabberView *)self _hintStyleForWindowScene:v5]];
}

- (CGRect)_pointerInteractionHitTestRect
{
  [(SBFHomeAffordanceView *)self->_homeAffordanceView frame];
  [(SBFHomeGrabberSettings *)self->_settings hitTestOutsetSides];
  [(SBFHomeGrabberSettings *)self->_settings hitTestOutsetTop];
  [(SBFHomeAffordanceView *)self->_homeAffordanceView center];
  UIRectCenteredAboutPoint();
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  if (([a3 _isPencilInitiated] & 1) != 0
    || ([(SBHomeGrabberView *)self isHiddenOrHasHiddenAncestor] & 1) != 0
    || ![(SBHomeGrabberView *)self _isInAWindow])
  {
    return 0;
  }
  [(SBHomeGrabberView *)self _pointerInteractionHitTestRect];
  CGFloat v12 = x;
  CGFloat v13 = y;
  return CGRectContainsPoint(*(CGRect *)&v8, *(CGPoint *)&v12);
}

- (id)regionAtLocation:(CGPoint)a3 forView:(id)a4
{
  double v4 = (void *)MEMORY[0x1E4F42CB0];
  [(SBHomeGrabberView *)self _pointerInteractionHitTestRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = NSStringFromClass(v13);
  __int16 v15 = objc_msgSend(v4, "regionWithRect:identifier:", v14, v6, v8, v10, v12);

  return v15;
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self->_homeAffordanceView];
  double v6 = [MEMORY[0x1E4F42C90] effectWithPreview:v5];
  [(SBFHomeAffordanceView *)self->_homeAffordanceView frame];
  double v11 = objc_msgSend(MEMORY[0x1E4F42CB8], "shapeWithRoundedRect:cornerRadius:", v7 + -7.0, v8 + -4.0, v9 + 14.0, v10 + 8.0, (v9 + 14.0) * 0.5);
  double v12 = [MEMORY[0x1E4F42CC0] styleWithEffect:v6 shape:v11];

  return v12;
}

- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __81__SBHomeGrabberView_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke;
  v4[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __81__SBHomeGrabberView_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

- (void)homeAffordanceInteractionDidRecognizeSingleTap:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 homeGrabberViewDidRecognizeSingleTap:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  self->_touchHitTestBlockingViewBlocksTouches = 1;
  [(SBHomeGrabberView *)self _updateTouchHitTestBlockingView];
}

- (void)homeAffordanceInteractionDidRecognizeDoubleTap:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 homeGrabberViewDidRecognizeDoubleTap:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  self->_touchHitTestBlockingViewBlocksTouches = 0;
  [(SBHomeGrabberView *)self _updateTouchHitTestBlockingView];
}

- (void)homeAffordanceInteractionDidFailToRecognizeDoubleTap:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v4 = [(NSHashTable *)self->_observers allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 homeGrabberViewDidFailToRecognizeDoubleTap:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  self->_touchHitTestBlockingViewBlocksTouches = 0;
  [(SBHomeGrabberView *)self _updateTouchHitTestBlockingView];
}

- (SBHomeGrabberDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHomeGrabberDelegate *)WeakRetained;
}

- (BOOL)autoHides
{
  return self->_autoHides;
}

- (BOOL)isEdgeProtectEnabled
{
  return self->_edgeProtectEnabled;
}

- (int64_t)colorBias
{
  return self->_colorBias;
}

- (BOOL)isHomeAffordanceInteractionEnabled
{
  return self->_homeAffordanceInteractionEnabled;
}

- (BOOL)ignoresLuminance
{
  return self->_ignoresLuminance;
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pointerClickDelegate);
  return (SBHomeGrabberPointerClickDelegate *)WeakRetained;
}

- (BOOL)suppressesBounce
{
  return self->_suppressesBounce;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pointerClickDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_assistantController);
  objc_destroyWeak((id *)&self->_systemPointerInteractionManager);
  objc_storeStrong((id *)&self->_homeAffordanceInteraction, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_outstandingVisibilityTransitionTokens, 0);
  objc_storeStrong((id *)&self->_hiddenOverrides, 0);
  objc_storeStrong((id *)&self->_idleTouchAwarenessClient, 0);
  objc_storeStrong((id *)&self->_pointerHitTestBlockingView, 0);
  objc_storeStrong((id *)&self->_touchHitTestBlockingView, 0);
  objc_storeStrong((id *)&self->_hitTestRectVisualizationView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_pillSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)initWithFrame:(uint64_t)a1 settings:(void *)a2 shouldEnableGestures:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)double v3 = 134218240;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_2(&dword_1D85BA000, (uint64_t)a2, a3, "grabber=%p initialized with pill=%p", *(const void **)v3, *(const void **)&v3[8]);
}

void __51__SBHomeGrabberView_resetAutoHideWithInitialDelay___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "grabber=%p touch idleness - initial hide request with token=%lu was interrupted", v2, v3);
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_cold_1()
{
  uint64_t v0 = NSStringFromMTLumaDodgePillStyle();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "grabber=%p additive style change to %{public}@ finished", v3, v4, v5, v6, v7);
}

void __76__SBHomeGrabberView__animateToStyle_disallowAdditive_withAnimationSettings___block_invoke_2_50_cold_1()
{
  uint64_t v0 = NSStringFromMTLumaDodgePillStyle();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v1, v2, "grabber=%p style change to %{public}@ finished", v3, v4, v5, v6, v7);
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2(&dword_1D85BA000, v0, v1, "grabber=%p created pill=%p", v2, v3);
}

void __65__SBHomeGrabberView__updatePresence_style_withAnimationSettings___block_invoke_2_cold_1(uint64_t a1)
{
  os_log_t v1 = NSStringFromSBHomeGrabberViewPresence(*(void *)(a1 + 48));
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v2, v3, "grabber=%p additive presence change to %{public}@ finished", v4, v5, v6, v7, v8);
}

- (void)lumaDodgePillDidDetectBackgroundLuminanceChange:.cold.1()
{
  uint64_t v6 = NSStringFromMTLumaDodgePillBackgroundLuminance();
  OUTLINED_FUNCTION_0_4(&dword_1D85BA000, v0, v1, "grabber=%p luma changed to %{public}@", v2, v3, v4, v5, 2u);
}

@end