@interface SBHomeGesturePanGestureRecognizer
+ (SBHomeGesturePanGestureRecognizer)homeGesturePanGestureRecognizerWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)_isOutsideOfExclusionTrapezoid;
- (BOOL)_shouldBegin;
- (BOOL)_shouldBlockHomeGestureForKeyboardInputMode:(id)a3;
- (BOOL)installedAsSystemGesture;
- (BOOL)preventHorizontalSwipesOutsideTrapezoid;
- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3;
- (SBFluidSwitcherGestureExclusionTrapezoid)landscapeExclusionTrapezoid;
- (SBFluidSwitcherGestureExclusionTrapezoid)portraitExclusionTrapezoid;
- (SBHomeGesturePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6;
- (SBHomeGesturePanGestureRecognizerInterfaceDelegate)interfaceDelegate;
- (SBHomeGestureSettings)homeGestureSettings;
- (SBTouchHistory)touchHistory;
- (UIView)viewForTouchHistory;
- (double)averageTouchPathAngleOverTimeDuration:(double)a3;
- (double)peakSpeed;
- (id)_currentExclusionShapeForEdge:(unint64_t)a3;
- (id)_currentKeyboardExclusionCompositeShape;
- (int64_t)_touchInterfaceOrientation;
- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4;
- (void)_setUpExclusionTrapezoids;
- (void)_updateHomeGestureParameters;
- (void)reset;
- (void)sb_commonInitHomeGesturePanGestureRecognizer;
- (void)setHomeGestureSettings:(id)a3;
- (void)setInstalledAsSystemGesture:(BOOL)a3;
- (void)setInterfaceDelegate:(id)a3;
- (void)setLandscapeExclusionTrapezoid:(id)a3;
- (void)setPortraitExclusionTrapezoid:(id)a3;
- (void)setPreventHorizontalSwipesOutsideTrapezoid:(BOOL)a3;
- (void)setTouchHistory:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation SBHomeGesturePanGestureRecognizer

- (int64_t)_touchInterfaceOrientation
{
  v3 = [(SBHomeGesturePanGestureRecognizer *)self interfaceDelegate];
  v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 touchInterfaceOrientationForGestureRecognizer:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHomeGesturePanGestureRecognizer;
    id v5 = [(SBScreenEdgePanGestureRecognizer *)&v8 _touchInterfaceOrientation];
  }
  int64_t v6 = (int64_t)v5;

  return v6;
}

- (SBHomeGesturePanGestureRecognizerInterfaceDelegate)interfaceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interfaceDelegate);
  return (SBHomeGesturePanGestureRecognizerInterfaceDelegate *)WeakRetained;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v8 anyObject];
  v10 = [v7 coalescedTouchesForTouch:v9];

  v11 = [(SBHomeGesturePanGestureRecognizer *)self viewForTouchHistory];
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, v11, 1);
  _SBLogCoalescedTouchesForGestureAndView(v10, self);
  v12 = NSStringFromSelector(a2);
  [(SBHomeGesturePanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v12];

  v13.receiver = self;
  v13.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v13 touchesBegan:v8 withEvent:v7];
}

- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  int v9 = [v8 isEnabled];

  if (v9)
  {
    v10 = [MEMORY[0x1E4FA8AA0] sharedInstance];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__SBHomeGesturePanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke;
    v11[3] = &unk_1E6B022E0;
    id v12 = v6;
    objc_super v13 = self;
    id v14 = v7;
    [v10 logBlock:v11];
  }
}

- (UIView)viewForTouchHistory
{
  v3 = [(SBHomeGesturePanGestureRecognizer *)self delegate];
  v4 = [v3 viewForSystemGestureRecognizer:self];

  return (UIView *)v4;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v3 reset];
  [(SBTouchHistory *)self->_touchHistory reset];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  int v9 = [v8 anyObject];
  v10 = [v7 coalescedTouchesForTouch:v9];

  v11 = [(SBHomeGesturePanGestureRecognizer *)self viewForTouchHistory];
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, v11, 1);
  _SBLogCoalescedTouchesForGestureAndView(v10, self);
  id v12 = NSStringFromSelector(a2);
  [(SBHomeGesturePanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v12];

  v13.receiver = self;
  v13.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v13 touchesEnded:v8 withEvent:v7];
}

id __80__SBHomeGesturePanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke(uint64_t a1)
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  v37 = [MEMORY[0x1E4F1CA48] array];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v34 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v38)
  {
    uint64_t v36 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        objc_super v3 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        double v4 = _SBLocationForTouch(v3);
        double v6 = v5;
        v54[0] = @"timestamp";
        id v7 = NSNumber;
        [v3 timestamp];
        v45 = objc_msgSend(v7, "numberWithDouble:");
        v55[0] = v45;
        v54[1] = @"phase";
        v44 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "phase"));
        v55[1] = v44;
        v54[2] = @"tapCount";
        v43 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "tapCount"));
        v55[2] = v43;
        v54[3] = @"type";
        v42 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "type"));
        v55[3] = v42;
        v54[4] = @"majorRadius";
        id v8 = NSNumber;
        [v3 majorRadius];
        v41 = objc_msgSend(v8, "numberWithDouble:");
        v55[4] = v41;
        v54[5] = @"majorRadiusToTolerance";
        int v9 = NSNumber;
        [v3 majorRadiusTolerance];
        v40 = objc_msgSend(v9, "numberWithDouble:");
        v55[5] = v40;
        v54[6] = @"force";
        v10 = NSNumber;
        [v3 force];
        v39 = objc_msgSend(v10, "numberWithDouble:");
        v55[6] = v39;
        v54[7] = @"maximumPossibleForce";
        v11 = NSNumber;
        [v3 maximumPossibleForce];
        id v12 = objc_msgSend(v11, "numberWithDouble:");
        v55[7] = v12;
        v54[8] = @"altitudeAngle";
        objc_super v13 = NSNumber;
        [v3 altitudeAngle];
        id v14 = objc_msgSend(v13, "numberWithDouble:");
        v55[8] = v14;
        v54[9] = @"estimationUpdateIndex";
        uint64_t v15 = [v3 estimationUpdateIndex];
        v16 = (void *)v15;
        v17 = &unk_1F334A2B0;
        if (v15) {
          v17 = (void *)v15;
        }
        v55[9] = v17;
        v54[10] = @"estimatedProperties";
        v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "estimatedProperties"));
        v55[10] = v18;
        v54[11] = @"estimatedPropertiesExpectingUpdates";
        v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "estimatedPropertiesExpectingUpdates"));
        v55[11] = v19;
        v54[12] = @"location";
        v52[0] = @"x";
        v20 = [NSNumber numberWithDouble:v4];
        v52[1] = @"y";
        v53[0] = v20;
        v21 = [NSNumber numberWithDouble:v6];
        v53[1] = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        v55[12] = v22;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:13];

        [v37 addObject:v23];
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v38);
  }

  v24 = NSString;
  v25 = (objc_class *)objc_opt_class();
  v26 = NSStringFromClass(v25);
  v27 = [v24 stringWithFormat:@"[%@ %@]", v26, *(void *)(v34 + 48)];

  v51[0] = v37;
  v50[0] = v27;
  v50[1] = @"address";
  v28 = [NSNumber numberWithUnsignedLong:*(void *)(v34 + 40)];
  v51[1] = v28;
  v50[2] = @"name";
  uint64_t v29 = [*(id *)(v34 + 40) name];
  v30 = (void *)v29;
  v31 = &stru_1F3084718;
  if (v29) {
    v31 = (__CFString *)v29;
  }
  v51[2] = v31;
  v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];

  return v32;
}

+ (SBHomeGesturePanGestureRecognizer)homeGesturePanGestureRecognizerWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  id v7 = +[SBHomeGestureDomain rootSettings];
  id v8 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  BOOL v9 = [v8 homeButtonType] == 2;

  if (([v7 recognizeAlongEdge] & v9) != 0) {
    uint64_t v10 = 5;
  }
  else {
    uint64_t v10 = 1;
  }
  v11 = (void *)[objc_alloc((Class)a1) initWithTarget:v6 action:a4 type:v10 options:_os_feature_enabled_impl()];

  return (SBHomeGesturePanGestureRecognizer *)v11;
}

- (SBHomeGesturePanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 type:(int64_t)a5 options:(unint64_t)a6
{
  v9.receiver = self;
  v9.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  id v6 = [(SBScreenEdgePanGestureRecognizer *)&v9 initWithTarget:a3 action:a4 type:a5 options:a6];
  id v7 = v6;
  if (v6) {
    [(SBHomeGesturePanGestureRecognizer *)v6 sb_commonInitHomeGesturePanGestureRecognizer];
  }
  return v7;
}

- (void)sb_commonInitHomeGesturePanGestureRecognizer
{
  [(SBHomeGesturePanGestureRecognizer *)self setAllowedTouchTypes:&unk_1F3347EB0];
  [(SBHomeGesturePanGestureRecognizer *)self sbf_setPencilTouchesAllowed:_os_feature_enabled_impl()];
  objc_super v3 = objc_alloc_init(SBTouchHistory);
  touchHistory = self->_touchHistory;
  self->_touchHistory = v3;

  double v5 = +[SBHomeGestureDomain rootSettings];
  homeGestureSettings = self->_homeGestureSettings;
  self->_homeGestureSettings = v5;

  [(PTSettings *)self->_homeGestureSettings addKeyObserver:self];
  self->_preventHorizontalSwipesOutsideTrapezoid = 1;
  self->_installedAsSystemGesture = 1;
  [(SBHomeGesturePanGestureRecognizer *)self setMaximumNumberOfTouches:1];
  [(SBHomeGesturePanGestureRecognizer *)self _updateHomeGestureParameters];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = [v8 anyObject];
  uint64_t v10 = [v7 coalescedTouchesForTouch:v9];

  v11 = [(SBHomeGesturePanGestureRecognizer *)self viewForTouchHistory];
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, v11, 1);
  _SBLogCoalescedTouchesForGestureAndView(v10, self);
  id v12 = NSStringFromSelector(a2);
  [(SBHomeGesturePanGestureRecognizer *)self _SBLogTouchesWithMethodName:v8 withMethodName:v12];

  v13.receiver = self;
  v13.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  [(UIScreenEdgePanGestureRecognizer *)&v13 touchesMoved:v8 withEvent:v7];
}

- (CGPoint)averageTouchVelocityOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:a3];
  result.y = v4;
  result.x = v3;
  return result;
}

- (double)averageTouchPathAngleOverTimeDuration:(double)a3
{
  [(SBTouchHistory *)self->_touchHistory averageTouchPathAngleOverTimeDuration:a3];
  return result;
}

- (double)peakSpeed
{
  [(SBTouchHistory *)self->_touchHistory peakSpeed];
  return result;
}

- (BOOL)_shouldBegin
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v28.receiver = self;
  v28.super_class = (Class)SBHomeGesturePanGestureRecognizer;
  if ([(SBHomeGesturePanGestureRecognizer *)&v28 _shouldBegin])
  {
    if ([(SBHomeGesturePanGestureRecognizer *)self _isOutsideOfExclusionTrapezoid])
    {
      double v3 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        double v4 = (objc_class *)objc_opt_class();
        double v5 = NSStringFromClass(v4);
        id v6 = [(SBHomeGesturePanGestureRecognizer *)self name];
        *(_DWORD *)buf = 138412802;
        v30 = v5;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2112;
        uint64_t v34 = v6;
        _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Preventing the <%@:%p> (%@) because the touch is moving vertically and outside of trapezoidal exclusion area.", buf, 0x20u);
      }
      int v7 = 0;
      id v8 = @"HomeGesturePreventedByExclusionTrapezoid";
    }
    else
    {
      id v8 = 0;
      int v7 = 1;
    }
    if ([MEMORY[0x1E4F42B08] isOnScreen]) {
      char v10 = [MEMORY[0x1E4F42B08] isInHardwareKeyboardMode];
    }
    else {
      char v10 = 1;
    }
    if (![(id)SBApp isTypingActive] || (v10 & 1) != 0) {
      goto LABEL_24;
    }
    int64_t v11 = [(SBHomeGesturePanGestureRecognizer *)self _touchInterfaceOrientation];
    id v12 = [MEMORY[0x1E4F42B30] sharedInputModeController];
    objc_super v13 = [v12 currentInputModeInPreference];

    id v14 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v16 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (objc_class *)objc_opt_class();
        v18 = NSStringFromClass(v17);
        v19 = [(SBHomeGesturePanGestureRecognizer *)self name];
        *(_DWORD *)buf = 138412802;
        v30 = v18;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2112;
        uint64_t v34 = v19;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Preventing the <%@:%p> (%@) because user is typing.", buf, 0x20u);
      }
      id v8 = @"HomeGesturePreventedByiPadKeyboard";
    }
    else
    {
      if ((unint64_t)(v11 - 3) > 1
        || ![(SBHomeGesturePanGestureRecognizer *)self _shouldBlockHomeGestureForKeyboardInputMode:v13])
      {
        goto LABEL_23;
      }
      v16 = SBLogSystemGestureAppSwitcher();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        v22 = [(SBHomeGesturePanGestureRecognizer *)self name];
        *(_DWORD *)buf = 138412802;
        v30 = v21;
        __int16 v31 = 2048;
        v32 = self;
        __int16 v33 = 2112;
        uint64_t v34 = v22;
        _os_log_impl(&dword_1D85BA000, v16, OS_LOG_TYPE_INFO, "Preventing the <%@:%p> (%@) because user is typing on 10-key keyboard in landscape.", buf, 0x20u);
      }
      id v8 = @"HomeGesturePreventedByLandscape10Key";
    }

    int v7 = 0;
LABEL_23:

LABEL_24:
    BOOL v9 = v7 != 0;
    goto LABEL_25;
  }
  id v8 = 0;
  BOOL v9 = 0;
LABEL_25:
  v23 = [MEMORY[0x1E4FA8AA0] sharedInstance];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __49__SBHomeGesturePanGestureRecognizer__shouldBegin__block_invoke;
  v25[3] = &unk_1E6B02308;
  BOOL v27 = v9;
  v25[4] = self;
  v26 = v8;
  [v23 logBlock:v25];

  return v9;
}

id __49__SBHomeGesturePanGestureRecognizer__shouldBegin__block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_super v13 = @"[SBHomeGesturePanGestureRecognizer _shouldBegin]";
  v11[0] = @"shouldBegin";
  v2 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v12[0] = v2;
  v11[1] = @"address";
  double v3 = [NSNumber numberWithUnsignedLong:*(void *)(a1 + 32)];
  v12[1] = v3;
  v11[2] = @"name";
  uint64_t v4 = [*(id *)(a1 + 32) name];
  double v5 = (void *)v4;
  id v6 = &stru_1F3084718;
  if (v4) {
    int v7 = (__CFString *)v4;
  }
  else {
    int v7 = &stru_1F3084718;
  }
  v11[3] = @"failureReason";
  if (*(void *)(a1 + 40)) {
    id v6 = *(__CFString **)(a1 + 40);
  }
  v12[2] = v7;
  v12[3] = v6;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
  v14[0] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];

  return v9;
}

- (void)setPreventHorizontalSwipesOutsideTrapezoid:(BOOL)a3
{
  if (self->_preventHorizontalSwipesOutsideTrapezoid != a3)
  {
    self->_preventHorizontalSwipesOutsideTrapezoid = a3;
    [(SBHomeGesturePanGestureRecognizer *)self _setUpExclusionTrapezoids];
  }
}

- (void)_setUpExclusionTrapezoids
{
  if (SBFEffectiveHomeButtonType() == 2)
  {
    id v25 = [(SBHomeGestureSettings *)self->_homeGestureSettings exclusionTrapezoidSettings];
    [v25 landscapeTrapezoidBaseHeight];
    double v4 = v3;
    [v25 landscapeTrapezoidHeight];
    double v6 = v5;
    [v25 landscapeTrapezoidAdjacentXDistanceFromEdge];
    double v8 = v7;
    [v25 landscapeTrapezoidOpposingXDistanceFromEdge];
    double v10 = v9;
    if ([v25 allowHorizontalSwipesOutsideLandscapeTrapezoid]) {
      BOOL v11 = !self->_preventHorizontalSwipesOutsideTrapezoid;
    }
    else {
      BOOL v11 = 0;
    }
    id v12 = +[SBFluidSwitcherGestureExclusionTrapezoid exclusionTrapezoidWithBaseHeight:v11 trapezoidHeight:v4 adjacentBaseXDistanceFromEdge:v6 opposingBaseXDistanceFromEdge:v8 allowHorizontalSwipesOutsideTrapezoid:v10];
    landscapeExclusionTrapezoid = self->_landscapeExclusionTrapezoid;
    self->_landscapeExclusionTrapezoid = v12;

    [v25 portraitTrapezoidBaseHeight];
    double v15 = v14;
    [v25 portraitTrapezoidHeight];
    double v17 = v16;
    [v25 portraitTrapezoidAdjacentXDistanceFromEdge];
    double v19 = v18;
    [v25 portraitTrapezoidOpposingXDistanceFromEdge];
    double v21 = v20;
    if ([v25 allowHorizontalSwipesOutsidePortraitTrapezoid]) {
      BOOL v22 = !self->_preventHorizontalSwipesOutsideTrapezoid;
    }
    else {
      BOOL v22 = 0;
    }
    v23 = +[SBFluidSwitcherGestureExclusionTrapezoid exclusionTrapezoidWithBaseHeight:v22 trapezoidHeight:v15 adjacentBaseXDistanceFromEdge:v17 opposingBaseXDistanceFromEdge:v19 allowHorizontalSwipesOutsideTrapezoid:v21];
    portraitExclusionTrapezoid = self->_portraitExclusionTrapezoid;
    self->_portraitExclusionTrapezoid = v23;
  }
}

- (id)_currentKeyboardExclusionCompositeShape
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [MEMORY[0x1E4F42B08] homeGestureExclusionZones];
  }
  else
  {
    v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v3 = +[SBFluidSwitcherGestureExclusionCompositeShape exclusionCompositeShapeWithRects:v2 allowHorizontalSwipes:1];

  return v3;
}

- (BOOL)_isOutsideOfExclusionTrapezoid
{
  double v3 = [(SBHomeGesturePanGestureRecognizer *)self _currentExclusionShapeForEdge:SBScreenOrientedEdgeForHomeGestureRecognizer(self)];
  if (v3)
  {
    SBInterfaceOrientationOfTouchedEdgeForHomeGestureRecognizer(self);
    double v4 = [(SBHomeGesturePanGestureRecognizer *)self view];
    [v4 bounds];

    double v5 = [(SBHomeGesturePanGestureRecognizer *)self view];
    [(SBHomeGesturePanGestureRecognizer *)self locationInView:v5];

    if (!self->_installedAsSystemGesture)
    {
      double v7 = [(SBHomeGesturePanGestureRecognizer *)self view];
      double v8 = [v7 window];
      [v8 interfaceOrientation];
    }
    _UIWindowConvertPointFromOrientationToOrientation();
    double v10 = v9;
    double v12 = v11;
    _UIWindowConvertRectFromOrientationToOrientation();
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(SBTouchHistory *)self->_touchHistory averageTouchVelocityOverTimeDuration:0.0416666667];
    int v6 = objc_msgSend(v3, "shouldBeginGestureAtStartingPoint:velocity:bounds:", v10, v12, v21, v22, v14, v16, v18, v20) ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)_currentExclusionShapeForEdge:(unint64_t)a3
{
  char v3 = a3;
  if (UIKeyboardAutomaticIsOnScreen())
  {
    id v5 = [(SBHomeGesturePanGestureRecognizer *)self _currentKeyboardExclusionCompositeShape];
    goto LABEL_12;
  }
  int v6 = [(SBHomeGestureSettings *)self->_homeGestureSettings exclusionTrapezoidSettings];
  double v7 = v6;
  if ((v3 & 0xA) != 0)
  {
    if ([v6 landscapeTrapezoidEnabled])
    {
      double v8 = &OBJC_IVAR___SBHomeGesturePanGestureRecognizer__landscapeExclusionTrapezoid;
LABEL_10:
      id v5 = *(id *)((char *)&self->super.super.super.super.super.isa + *v8);
      goto LABEL_11;
    }
  }
  else if ([v6 portraitTrapezoidEnabled] {
         && ([v7 portraitTrapezoidEnabledOnlyForKeyboards] & 1) == 0)
  }
  {
    double v8 = &OBJC_IVAR___SBHomeGesturePanGestureRecognizer__portraitExclusionTrapezoid;
    goto LABEL_10;
  }
  id v5 = 0;
LABEL_11:

LABEL_12:
  return v5;
}

- (BOOL)_shouldBlockHomeGestureForKeyboardInputMode:(id)a3
{
  char v3 = [a3 softwareLayout];
  if (([v3 isEqualToString:@"Kana"] & 1) != 0
    || ([v3 isEqualToString:@"Kana-Flick"] & 1) != 0
    || ([v3 isEqualToString:@"Korean10Key"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"Pinyin10-Simplified"];
  }

  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  double v9 = (SBHomeGestureSettings *)a3;
  id v6 = a4;
  homeGestureSettings = self->_homeGestureSettings;
  if (homeGestureSettings == v9
    || ([(SBHomeGestureSettings *)homeGestureSettings exclusionTrapezoidSettings],
        double v8 = (SBHomeGestureSettings *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == v9))
  {
    [(SBHomeGesturePanGestureRecognizer *)self _updateHomeGestureParameters];
  }
}

- (void)_updateHomeGestureParameters
{
  [(SBHomeGestureSettings *)self->_homeGestureSettings hysteresis];
  -[UIScreenEdgePanGestureRecognizer _setHysteresis:](self, "_setHysteresis:");
  [(SBHomeGesturePanGestureRecognizer *)self _setUpExclusionTrapezoids];
}

- (void)setInterfaceDelegate:(id)a3
{
}

- (BOOL)preventHorizontalSwipesOutsideTrapezoid
{
  return self->_preventHorizontalSwipesOutsideTrapezoid;
}

- (BOOL)installedAsSystemGesture
{
  return self->_installedAsSystemGesture;
}

- (void)setInstalledAsSystemGesture:(BOOL)a3
{
  self->_installedAsSystemGesture = a3;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
}

- (SBFluidSwitcherGestureExclusionTrapezoid)portraitExclusionTrapezoid
{
  return self->_portraitExclusionTrapezoid;
}

- (void)setPortraitExclusionTrapezoid:(id)a3
{
}

- (SBFluidSwitcherGestureExclusionTrapezoid)landscapeExclusionTrapezoid
{
  return self->_landscapeExclusionTrapezoid;
}

- (void)setLandscapeExclusionTrapezoid:(id)a3
{
}

- (SBTouchHistory)touchHistory
{
  return self->_touchHistory;
}

- (void)setTouchHistory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistory, 0);
  objc_storeStrong((id *)&self->_landscapeExclusionTrapezoid, 0);
  objc_storeStrong((id *)&self->_portraitExclusionTrapezoid, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_destroyWeak((id *)&self->_interfaceDelegate);
}

@end