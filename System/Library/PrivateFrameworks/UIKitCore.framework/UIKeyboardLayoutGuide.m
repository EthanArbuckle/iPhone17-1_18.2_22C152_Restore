@interface UIKeyboardLayoutGuide
- (BOOL)_changeOffsetConstants:(UIOffset)a3 force:(BOOL)a4;
- (BOOL)_changeSizingConstants:(CGSize)a3 force:(BOOL)a4;
- (BOOL)_moveGuideOffscreenAtEdge:(unint64_t)a3 force:(BOOL)a4;
- (BOOL)addsHeightWhenUndocked;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)changeOffsetConstants:(UIOffset)a3;
- (BOOL)changeSizingConstants:(CGSize)a3;
- (BOOL)currentStateIsDocked;
- (BOOL)followsUndockedKeyboard;
- (BOOL)ignoreKeyboardChanges;
- (BOOL)ignoresSafeArea;
- (BOOL)isDocked;
- (BOOL)isTransitioning;
- (BOOL)isWindowGuide;
- (BOOL)keyboardStateIsDocked:(int64_t)a3;
- (BOOL)moveGuideOffscreenAtEdge:(unint64_t)a3;
- (BOOL)shouldFollowCurrentKeyboard;
- (BOOL)updateLightEffectsRenderConfig:(id)a3 animated:(BOOL)a4;
- (BOOL)usesBottomSafeArea;
- (CGFloat)keyboardDismissPadding;
- (CGSize)defaultKeyboardSizeForInputMode:(id)a3 orientation:(int64_t)a4 addingAssistant:(BOOL)a5;
- (CGSize)interactionResetSize;
- (CGSize)previousSize;
- (NSArray)backdropConstraints;
- (NSLayoutConstraint)assistantHeightConstraint;
- (NSLayoutConstraint)viewBottomConstraint;
- (UIKeyboardLayoutGuide)init;
- (UIKeyboardLayoutGuide)initWithCoder:(id)a3;
- (UIOffset)interactionResetOffset;
- (UIOffset)previousOffset;
- (_UIAssertionController)_assertionController;
- (_UIKBLightEffectsBackground)lightEffectsBackdrop;
- (id)_obtainTransitionAssertionForReason:(id)a3;
- (id)guideBackdropMatchLayer;
- (int64_t)currentKeyboardVisualState;
- (int64_t)followTypes;
- (unint64_t)validatedOverlappingEdges:(unint64_t)a3;
- (void)_commonInit;
- (void)_detachGuideFromKeyboard:(BOOL)a3;
- (void)_setTransitioning:(BOOL)a3;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)constrainToReference:(id)a3;
- (void)disableSynchronizingWithKeyboard;
- (void)encodeWithCoder:(id)a3;
- (void)followUndockedKeyboardOfTypes:(int64_t)a3;
- (void)forceDismissGuideAnimated:(BOOL)a3;
- (void)forceResizeGuideForInputMode:(id)a3 orientation:(BOOL)a4 showsAssistantBar:(BOOL)a5 animated:(BOOL)a6;
- (void)forceResizeGuideForOrientation:(int64_t)a3 showsAssistantBar:(BOOL)a4 animated:(BOOL)a5;
- (void)hideLightEffectsView:(BOOL)a3;
- (void)inheritOptionsFromGuide:(id)a3;
- (void)reenableSynchronizingWithKeyboard;
- (void)removeLightEffectsView;
- (void)resetGuideForCancelledDismissInteraction;
- (void)setAddsHeightWhenUndocked:(BOOL)a3;
- (void)setAssistantHeightConstraint:(id)a3;
- (void)setBackdropConstraints:(id)a3;
- (void)setCurrentKeyboardVisualState:(int64_t)a3;
- (void)setDocked:(BOOL)a3;
- (void)setFollowTypes:(int64_t)a3;
- (void)setFollowsUndockedKeyboard:(BOOL)followsUndockedKeyboard;
- (void)setIgnoreKeyboardChanges:(BOOL)a3;
- (void)setIgnoresSafeArea:(BOOL)a3;
- (void)setInteractionResetOffset:(UIOffset)a3;
- (void)setInteractionResetSize:(CGSize)a3;
- (void)setKeyboardDismissPadding:(CGFloat)keyboardDismissPadding;
- (void)setLightEffectsBackdrop:(id)a3;
- (void)setPreviousOffset:(UIOffset)a3;
- (void)setPreviousSize:(CGSize)a3;
- (void)setUsesBottomSafeArea:(BOOL)usesBottomSafeArea;
- (void)setViewBottomConstraint:(id)a3;
- (void)setWindowGuide:(BOOL)a3;
- (void)transitionBackdropForAnimationStart:(BOOL)a3;
- (void)updateBottomConstraint;
- (void)updateSizeForInputMode:(id)a3 orientation:(int64_t)a4 showsAssistantBar:(BOOL)a5 animated:(BOOL)a6;
- (void)useLightEffectsBackgroundBelowView:(id)a3;
@end

@implementation UIKeyboardLayoutGuide

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutGuide;
  id v4 = a3;
  [(UILayoutGuide *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_followsUndockedKeyboard, @"UIKeyboardLayoutGuideFollowsUndocked", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_usesBottomSafeArea forKey:@"UIKeyboardLayoutGuideUsesBottomSafeArea"];
  [v4 encodeDouble:@"UIKeyboardLayoutGuideKeyboardDismissPadding" forKey:self->_keyboardDismissPadding];
}

- (UIKeyboardLayoutGuide)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardLayoutGuide;
  objc_super v5 = [(UILayoutGuide *)&v8 initWithCoder:v4];
  if (v5)
  {
    v5->_followsUndockedKeyboard = [v4 decodeBoolForKey:@"UIKeyboardLayoutGuideFollowsUndocked"];
    v5->_usesBottomSafeArea = [v4 decodeBoolForKey:@"UIKeyboardLayoutGuideUsesBottomSafeArea"];
    [v4 decodeDoubleForKey:@"UIKeyboardLayoutGuideKeyboardDismissPadding"];
    v5->_keyboardDismissPadding = v6;
    [(UIKeyboardLayoutGuide *)v5 _commonInit];
  }

  return v5;
}

- (UIKeyboardLayoutGuide)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutGuide;
  v2 = [(UITrackingLayoutGuide *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_followsUndockedKeyboard = 0;
    [(UIKeyboardLayoutGuide *)v2 _commonInit];
  }
  return v3;
}

- (void)_commonInit
{
  self->_docked = 1;
  [(UITrackingLayoutGuide *)self pauseUpdatingConstraintsForEdges:11];
  self->_transitioning = 0;
  self->_windowGuide = 0;
  self->_addsHeightWhenUndocked = 0;
  self->_ignoresSafeArea = 0;
  self->_ignoreKeyboardChanges = 0;
  self->_keyboardDismissPadding = 0.0;
  self->_followTypes = 0;
  self->_currentKeyboardVisualState = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  self->_previousOffset = _Q0;
  self->_previousSize = (CGSize)xmmword_186B8C800;
  -[UITrackingLayoutGuide setProportionalEdgeThresholds:](self, "setProportionalEdgeThresholds:", 0.1, 0.1, 0.03, 0.1);
  [(UITrackingLayoutGuide *)self startUpdatingConstraintsForEdges:15];
}

- (void)inheritOptionsFromGuide:(id)a3
{
  id v4 = a3;
  self->_followsUndockedKeyboard = [v4 followsUndockedKeyboard];
  self->_followTypes = [v4 followTypes];
  self->_docked = [v4 isDocked];
  self->_addsHeightWhenUndocked = [v4 addsHeightWhenUndocked];
  self->_ignoresSafeArea = [v4 ignoresSafeArea];
  [v4 previousOffset];
  self->_previousOffset.horizontal = v5;
  self->_previousOffset.vertical = v6;
  [v4 previousSize];
  self->_previousSize.width = v7;
  self->_previousSize.height = v8;
  [v4 keyboardDismissPadding];
  self->_keyboardDismissPadding = v9;
  v10 = [v4 lightEffectsBackdrop];
  lightEffectsBackdrop = self->_lightEffectsBackdrop;
  self->_lightEffectsBackdrop = v10;

  v12 = [v4 assistantHeightConstraint];

  assistantHeightConstraint = self->_assistantHeightConstraint;
  self->_assistantHeightConstraint = v12;
}

- (void)constrainToReference:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    CGFloat v5 = [(UILayoutGuide *)self _systemConstraints];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      CGFloat v7 = (void *)MEMORY[0x1E4F5B268];
      CGFloat v8 = [(UILayoutGuide *)self _systemConstraints];
      [v7 deactivateConstraints:v8];
    }
    double v9 = [(UILayoutGuide *)self topAnchor];
    v10 = [v4 topAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];

    LODWORD(v12) = 1148829696;
    [v11 setPriority:v12];
    [v11 setIdentifier:@"UIViewKeyboardLayoutGuide-topConstraint"];
    v13 = [(UILayoutGuide *)self leadingAnchor];
    v14 = [v4 leadingAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];

    [v15 setIdentifier:@"UIViewKeyboardLayoutGuide-leadingConstraint"];
    v16 = [v4 bottomAnchor];
    v17 = [(UILayoutGuide *)self bottomAnchor];
    v18 = [v16 constraintEqualToAnchor:v17];

    [v18 setIdentifier:@"UIViewKeyboardLayoutGuide-bottomConstraint"];
    v19 = [v4 trailingAnchor];
    v20 = [(UILayoutGuide *)self trailingAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];

    [v21 setIdentifier:@"UIViewKeyboardLayoutGuide-trailingConstraint"];
    v25[0] = v11;
    v25[1] = v15;
    v25[2] = v18;
    v25[3] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    [(UILayoutGuide *)self _setSystemConstraints:v22];

    v23 = (void *)MEMORY[0x1E4F5B268];
    v24 = [(UILayoutGuide *)self _systemConstraints];
    [v23 activateConstraints:v24];

    [(UIKeyboardLayoutGuide *)self updateBottomConstraint];
  }
}

- (void)updateBottomConstraint
{
  v3 = [(UIKeyboardLayoutGuide *)self viewBottomConstraint];

  if (v3)
  {
    id v4 = [(UIKeyboardLayoutGuide *)self viewBottomConstraint];
    [v4 setActive:0];
  }
  BOOL v5 = [(UIKeyboardLayoutGuide *)self ignoresSafeArea];
  uint64_t v6 = [(UILayoutGuide *)self owningView];
  CGFloat v7 = v6;
  if (v5)
  {
    CGFloat v8 = [v6 bottomAnchor];
    double v9 = [(UILayoutGuide *)self topAnchor];
    v10 = [v8 constraintGreaterThanOrEqualToAnchor:v9];
    [(UIKeyboardLayoutGuide *)self setViewBottomConstraint:v10];
  }
  else
  {
    CGFloat v8 = [v6 safeAreaLayoutGuide];
    double v9 = [v8 bottomAnchor];
    v10 = [(UILayoutGuide *)self topAnchor];
    v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10];
    [(UIKeyboardLayoutGuide *)self setViewBottomConstraint:v11];
  }
  double v12 = [(UIKeyboardLayoutGuide *)self viewBottomConstraint];
  [v12 setIdentifier:@"UIViewKeyboardLayoutGuide-viewBottom"];

  id v13 = [(UIKeyboardLayoutGuide *)self viewBottomConstraint];
  [v13 setActive:1];
}

- (void)setFollowsUndockedKeyboard:(BOOL)followsUndockedKeyboard
{
  if (self->_followsUndockedKeyboard != followsUndockedKeyboard)
  {
    BOOL v3 = followsUndockedKeyboard;
    self->_followsUndockedKeyboard = followsUndockedKeyboard;
    if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      BOOL v5 = [(UILayoutGuide *)self owningView];
      uint64_t v6 = [v5 window];
      CGFloat v7 = [v6 _primaryKeyboardTrackingGuide];
      [v7 setFollowsUndockedKeyboard:v3];
    }
    else
    {
      if (v3) {
        uint64_t v8 = 30;
      }
      else {
        uint64_t v8 = 0;
      }
      [(UIKeyboardLayoutGuide *)self setFollowTypes:v8];
    }
    [(UITrackingLayoutGuide *)self resetAnimationOptions];
  }
}

- (void)setIgnoresSafeArea:(BOOL)a3
{
  if (self->_ignoresSafeArea != a3)
  {
    BOOL v3 = a3;
    self->_ignoresSafeArea = a3;
    if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      [(UIKeyboardLayoutGuide *)self updateBottomConstraint];
      id v8 = [(UILayoutGuide *)self owningView];
      BOOL v5 = [v8 window];
      uint64_t v6 = [v5 _primaryKeyboardTrackingGuide];
      [v6 setIgnoresSafeArea:v3];
    }
    else if ([(UIKeyboardLayoutGuide *)self isWindowGuide])
    {
      [(UIKeyboardLayoutGuide *)self previousOffset];
      if (v7 < 0.0)
      {
        [(UIKeyboardLayoutGuide *)self _moveGuideOffscreenAtEdge:4 force:1];
      }
    }
  }
}

- (void)setUsesBottomSafeArea:(BOOL)usesBottomSafeArea
{
}

- (void)setKeyboardDismissPadding:(CGFloat)keyboardDismissPadding
{
  if (self->_keyboardDismissPadding != keyboardDismissPadding)
  {
    self->_keyboardDismissPadding = keyboardDismissPadding;
    if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      id v7 = [(UILayoutGuide *)self owningView];
      BOOL v5 = [v7 window];
      uint64_t v6 = [v5 _primaryKeyboardTrackingGuide];
      [v6 setKeyboardDismissPadding:keyboardDismissPadding];
    }
  }
}

- (void)followUndockedKeyboardOfTypes:(int64_t)a3
{
  if (self->_followTypes != a3)
  {
    self->_followTypes = a3;
    if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      id v7 = [(UILayoutGuide *)self owningView];
      BOOL v5 = [v7 window];
      uint64_t v6 = [v5 _primaryKeyboardTrackingGuide];
      [v6 followUndockedKeyboardOfTypes:a3];
    }
  }
}

- (BOOL)shouldFollowCurrentKeyboard
{
  if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] == 2) {
    goto LABEL_5;
  }
  int64_t v3 = [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState];
  if (v3 != 1)
  {
    if (self->_followsUndockedKeyboard || self->_followTypes == 30)
    {
LABEL_5:
      LOBYTE(v3) = 1;
      return v3;
    }
    if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] == 3)
    {
      uint64_t v4 = 2;
    }
    else if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] == 4)
    {
      uint64_t v4 = 4;
    }
    else if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] == 5)
    {
      uint64_t v4 = 8;
    }
    else
    {
      if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 6)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
      uint64_t v4 = 16;
    }
    LOBYTE(v3) = (self->_followTypes & v4) != 0;
  }
  return v3;
}

- (void)forceResizeGuideForOrientation:(int64_t)a3 showsAssistantBar:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  double v9 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218496;
    int64_t v13 = a3;
    __int16 v14 = 1024;
    BOOL v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v5;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "forceResizeGuideForOrientation: %li assistant bar: %i animated: %i", (uint8_t *)&v12, 0x18u);
  }

  v10 = +[UIKeyboardInputModeController sharedInputModeController];
  v11 = [v10 currentInputMode];
  [(UIKeyboardLayoutGuide *)self updateSizeForInputMode:v11 orientation:a3 showsAssistantBar:v6 animated:v5];
}

- (void)forceResizeGuideForInputMode:(id)a3 orientation:(BOOL)a4 showsAssistantBar:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  v11 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138413058;
    id v16 = v10;
    __int16 v17 = 2048;
    BOOL v18 = v8;
    __int16 v19 = 1024;
    BOOL v20 = v7;
    __int16 v21 = 1024;
    BOOL v22 = v6;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "forceResizeGuideForInputMode: %@ orientation: %li assistant bar: %i animated: %i", (uint8_t *)&v15, 0x22u);
  }

  if (!v10)
  {
    int v12 = +[UIKeyboardInputModeController sharedInputModeController];
    id v10 = [v12 documentInputMode];
  }
  int64_t v13 = +[UIKeyboardInputModeController sharedInputModeController];
  __int16 v14 = [v13 lastUsedInputModeForTextInputMode:v10];

  [(UIKeyboardLayoutGuide *)self updateSizeForInputMode:v14 orientation:v8 showsAssistantBar:v7 animated:v6];
}

- (void)forceDismissGuideAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "forceDismissGuideAnimated: %i", (uint8_t *)v6, 8u);
  }

  [(UIKeyboardLayoutGuide *)self updateSizeForInputMode:0 orientation:0 showsAssistantBar:0 animated:v3];
}

- (void)updateSizeForInputMode:(id)a3 orientation:(int64_t)a4 showsAssistantBar:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    v11 = [(UILayoutGuide *)self owningView];
    [v11 setNeedsLayout];

    int v12 = [(UILayoutGuide *)self owningView];
    int64_t v13 = [v12 window];
    __int16 v14 = [v13 _primaryKeyboardTrackingGuide];
    [v14 updateSizeForInputMode:v10 orientation:a4 showsAssistantBar:v7 animated:v6];

LABEL_14:
    goto LABEL_15;
  }
  if (v10)
  {
    [(UIKeyboardLayoutGuide *)self defaultKeyboardSizeForInputMode:v10 orientation:a4 addingAssistant:v7];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    if (-[UIKeyboardLayoutGuide _changeSizingConstants:force:](self, "_changeSizingConstants:force:", 1))
    {
      __int16 v19 = _UIKeyboardLayoutGuideLogger();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v40.width = v16;
        v40.height = v18;
        BOOL v20 = NSStringFromCGSize(v40);
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "Force resize guide to: %@", buf, 0xCu);
      }
      if (v6)
      {
        __int16 v21 = +[UIInputViewAnimationStyle animationStyleDefault];
        [v21 duration];
        double v23 = v22;
        uint64_t v24 = [v21 extraOptions];
        uint64_t v27 = MEMORY[0x1E4F143A8];
        uint64_t v28 = 3221225472;
        v29 = __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke_31;
        v30 = &unk_1E52D9F70;
        v31 = self;
        v25 = &v27;
LABEL_12:
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v24, v25, 0, v23, 0.0, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36);

        goto LABEL_15;
      }
      goto LABEL_13;
    }
  }
  else if ([(UIKeyboardLayoutGuide *)self _moveGuideOffscreenAtEdge:4 force:1])
  {
    if (v6)
    {
      __int16 v21 = +[UIInputViewAnimationStyle animationStyleDefault];
      [v21 duration];
      double v23 = v26;
      uint64_t v24 = [v21 extraOptions];
      uint64_t v32 = MEMORY[0x1E4F143A8];
      uint64_t v33 = 3221225472;
      v34 = __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke;
      v35 = &unk_1E52D9F70;
      v36 = self;
      v25 = &v32;
      goto LABEL_12;
    }
LABEL_13:
    int v12 = [(UILayoutGuide *)self owningView];
    [v12 layoutViewsForTrackedGuides];
    goto LABEL_14;
  }
LABEL_15:
}

void __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) owningView];
  [v1 layoutViewsForTrackedGuides];
}

void __87__UIKeyboardLayoutGuide_updateSizeForInputMode_orientation_showsAssistantBar_animated___block_invoke_31(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) owningView];
  [v1 layoutViewsForTrackedGuides];
}

- (void)disableSynchronizingWithKeyboard
{
}

- (void)reenableSynchronizingWithKeyboard
{
}

- (void)_detachGuideFromKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(UIKeyboardLayoutGuide *)self ignoreKeyboardChanges] != a3)
  {
    BOOL v5 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = @"attached";
      if (v3) {
        BOOL v6 = @"detached";
      }
      int v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "_detachGuideFromKeyboard: changed to %@", (uint8_t *)&v10, 0xCu);
    }

    if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      BOOL v7 = [(UILayoutGuide *)self owningView];
      BOOL v8 = [v7 window];
      double v9 = [v8 _primaryKeyboardTrackingGuide];
      [v9 _detachGuideFromKeyboard:v3];
    }
    [(UIKeyboardLayoutGuide *)self setIgnoreKeyboardChanges:v3];
  }
}

- (CGSize)defaultKeyboardSizeForInputMode:(id)a3 orientation:(int64_t)a4 addingAssistant:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = +[UIKeyboardImpl keyboardScreen];
  int v10 = +[UIKBScreenTraits traitsWithScreen:v9 orientation:a4];

  v11 = [v8 identifier];
  +[UIKeyboardLayoutStar keyboardSizeForInputMode:v11 screenTraits:v10 keyboardType:0];
  double v13 = v12;
  double v15 = v14;

  +[UIKeyboardImpl topMarginForInterfaceOrientation:a4];
  double v17 = v15 + v16;
  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:a4 inputMode:v8];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v17 + v19 + v23;
  if (v5)
  {
    uint64_t v27 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v28 = [v27 systemInputAssistantViewController];
    v29 = v28;
    if (v28)
    {
      v30 = [v28 traitCollection];
      [v29 preferredHeightForTraitCollection:v30 orientation:a4];
    }
    else
    {
      uint64_t v32 = [(UILayoutGuide *)self owningView];
      v30 = [v32 traitCollection];

      +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v30 interfaceOrientation:a4];
    }
    double v33 = v31;

    double v26 = v26 + v33;
  }

  double v34 = v13 + v21 + v25;
  double v35 = v26;
  result.height = v35;
  result.width = v34;
  return result;
}

- (void)useLightEffectsBackgroundBelowView:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(UILayoutGuide *)self owningView];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2, self, @"UIKeyboardLayoutGuide.m", 402, @"You cannot add a backdrop below a view to that view's keyboardLayoutGuide. Please use a keyboardLayoutGuide from higher up the view hierarchy. For best results, use viewController.view.keyboardLayoutGuide (or something else that's the size of your window)." object file lineNumber description];
  }
  id v8 = [(UILayoutGuide *)self owningView];
  char v9 = [v5 isDescendantOfView:v8];

  if ((v9 & 1) == 0)
  {
    v48 = [MEMORY[0x1E4F28B00] currentHandler];
    [v48 handleFailureInMethod:a2, self, @"UIKeyboardLayoutGuide.m", 403, @"To add a backdrop with keyboardLayoutGuide, the backedView to put it below must be a subview of the keyboardLayoutGuide's owning view. Ideally use viewController.view.keyboardLayoutGuide (or something else that's the size of your window)." object file lineNumber description];
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    _UIKeyboardLayoutGuideLogger();
    int v10 = (_UIKBLightEffectsBackground *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super.super.super, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1853B0000, &v10->super.super.super.super, OS_LOG_TYPE_DEBUG, "useLightEffectsBackgroundBelowView: is only supported on iPhone", buf, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  v11 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];

  if (!v11)
  {
    double v12 = [(UILayoutGuide *)self owningView];
    double v13 = [v12 _window];
    double v14 = [v13 _primaryKeyboardTrackingGuide];
    [v14 previousSize];
    double v16 = v15;

    double v17 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v82 = objc_opt_class();
      __int16 v83 = 2048;
      id v84 = v5;
      _os_log_debug_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEBUG, "useLightEffectsBackgroundBelowView: adding below <%@: %p>", buf, 0x16u);
    }

    int v10 = objc_alloc_init(_UIKBLightEffectsBackground);
    [(UIView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v18 = [(UILayoutGuide *)self owningView];
    id v78 = v5;
    [v18 insertSubview:v10 belowSubview:v5];

    v76 = [(UIView *)v10 topAnchor];
    v77 = [(UILayoutGuide *)self owningView];
    v75 = [v77 topAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v80[0] = v74;
    v72 = [(UIView *)v10 leadingAnchor];
    v73 = [(UILayoutGuide *)self owningView];
    v71 = [v73 leadingAnchor];
    v70 = [v72 constraintEqualToAnchor:v71];
    v80[1] = v70;
    v69 = [(UILayoutGuide *)self owningView];
    v68 = [v69 bottomAnchor];
    v67 = [(UIView *)v10 bottomAnchor];
    v66 = [v68 constraintEqualToAnchor:v67];
    v80[2] = v66;
    v65 = [(UILayoutGuide *)self owningView];
    v64 = [v65 trailingAnchor];
    v63 = [(UIView *)v10 trailingAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v80[3] = v62;
    v61 = [(_UIKBLightEffectsBackground *)v10 fullBackdropLayoutGuide];
    v60 = [v61 topAnchor];
    v59 = [(UILayoutGuide *)self topAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v80[4] = v58;
    v57 = [(_UIKBLightEffectsBackground *)v10 fullBackdropLayoutGuide];
    v56 = [v57 leadingAnchor];
    v55 = [(UILayoutGuide *)self leadingAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v80[5] = v54;
    v52 = [(UILayoutGuide *)self trailingAnchor];
    v53 = [(_UIKBLightEffectsBackground *)v10 fullBackdropLayoutGuide];
    v51 = [v53 trailingAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v80[6] = v50;
    v49 = [(_UIKBLightEffectsBackground *)v10 fullBackdropLayoutGuide];
    double v19 = [v49 bottomAnchor];
    double v20 = [(UILayoutGuide *)self bottomAnchor];
    double v21 = [v19 constraintEqualToAnchor:v20];
    v80[7] = v21;
    double v22 = [(_UIKBLightEffectsBackground *)v10 assistantLayoutGuide];
    double v23 = [v22 topAnchor];
    double v24 = [(UILayoutGuide *)self topAnchor];
    double v25 = [v23 constraintEqualToAnchor:v24];
    v80[8] = v25;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:9];
    [(UIKeyboardLayoutGuide *)self setBackdropConstraints:v26];

    uint64_t v27 = [(UILayoutGuide *)self owningView];
    uint64_t v28 = [v27 traitCollection];
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v28];
    double v30 = v29;

    double v31 = [(_UIKBLightEffectsBackground *)v10 assistantLayoutGuide];
    uint64_t v32 = [v31 heightAnchor];
    double v33 = [v32 constraintEqualToConstant:v30];
    [(UIKeyboardLayoutGuide *)self setAssistantHeightConstraint:v33];

    double v34 = (void *)MEMORY[0x1E4F5B268];
    double v35 = [(UIKeyboardLayoutGuide *)self backdropConstraints];
    v36 = [(UIKeyboardLayoutGuide *)self assistantHeightConstraint];
    v37 = [v35 arrayByAddingObject:v36];
    [v34 activateConstraints:v37];

    [(UIKeyboardLayoutGuide *)self setLightEffectsBackdrop:v10];
    v38 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
    [v38 changeClippingStyle:3];

    uint64_t v39 = [(UILayoutGuide *)self owningView];
    CGSize v40 = [v39 _window];
    v41 = [v40 _primaryKeyboardTrackingGuide];
    v42 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
    [v41 setLightEffectsBackdrop:v42];

    v43 = [(UILayoutGuide *)self owningView];
    v44 = [v43 _window];
    v45 = [v44 _primaryKeyboardTrackingGuide];
    v46 = [(UIKeyboardLayoutGuide *)self assistantHeightConstraint];
    [v45 setAssistantHeightConstraint:v46];

    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __60__UIKeyboardLayoutGuide_useLightEffectsBackgroundBelowView___block_invoke;
    v79[3] = &unk_1E52D9F70;
    v79[4] = self;
    +[UIView performWithoutAnimation:v79];
    if (v16 > 1.0) {
      +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_563];
    }
    id v5 = v78;
    goto LABEL_14;
  }
LABEL_15:
  [(UIKeyboardLayoutGuide *)self hideLightEffectsView:0];
}

void __60__UIKeyboardLayoutGuide_useLightEffectsBackgroundBelowView___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) owningView];
  [v1 layoutIfNeeded];
}

uint64_t __60__UIKeyboardLayoutGuide_useLightEffectsBackgroundBelowView___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 updateLightEffectsBackdropAnimated:0];
}

- (void)hideLightEffectsView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
  [v4 setHidden:v3];
}

- (void)removeLightEffectsView
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138412546;
    uint64_t v15 = objc_opt_class();
    __int16 v16 = 2048;
    double v17 = self;
    _os_log_debug_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEBUG, "removeLightEffectsView for <%@: %p>", (uint8_t *)&v14, 0x16u);
  }

  id v4 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F5B268];
    BOOL v6 = [(UIKeyboardLayoutGuide *)self backdropConstraints];
    [v5 deactivateConstraints:v6];

    [(UIKeyboardLayoutGuide *)self setBackdropConstraints:0];
    int v7 = [(UIKeyboardLayoutGuide *)self assistantHeightConstraint];
    [v7 setActive:0];

    [(UIKeyboardLayoutGuide *)self setAssistantHeightConstraint:0];
    id v8 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
    [v8 removeFromSuperview];

    [(UIKeyboardLayoutGuide *)self setLightEffectsBackdrop:0];
    char v9 = [(UILayoutGuide *)self owningView];
    [v9 layoutIfNeeded];
  }
  if ([(UIKeyboardLayoutGuide *)self isWindowGuide])
  {
    int v10 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v14) = 0;
      _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "removeLightEffectsView update keyboard backdrop", (uint8_t *)&v14, 2u);
    }

    +[UIKeyboardSceneDelegate performOnControllers:&__block_literal_global_56_7];
  }
  else
  {
    v11 = [(UILayoutGuide *)self owningView];
    double v12 = [v11 _window];
    double v13 = [v12 _primaryKeyboardTrackingGuide];
    [v13 removeLightEffectsView];
  }
}

uint64_t __47__UIKeyboardLayoutGuide_removeLightEffectsView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateLightEffectsBackdropAnimated:0];
}

- (void)transitionBackdropForAnimationStart:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
  [v4 updateAlphaForAnimationStart:v3];
}

- (BOOL)updateLightEffectsRenderConfig:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];

  if (v7)
  {
    if ([v6 animatedBackground])
    {
      [(UIKeyboardLayoutGuide *)self hideLightEffectsView:0];
      id v8 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
      char v9 = v8;
      if (v4) {
        [v8 animatedTransitionToRenderConfig:v6];
      }
      else {
        [v8 _setRenderConfig:v6];
      }
    }
    else
    {
      [(UIKeyboardLayoutGuide *)self hideLightEffectsView:1];
    }
  }

  return v7 != 0;
}

- (id)guideBackdropMatchLayer
{
  v2 = [(UIKeyboardLayoutGuide *)self lightEffectsBackdrop];
  BOOL v3 = [v2 layerForPositionMatchMove];

  return v3;
}

- (void)setDocked:(BOOL)a3
{
  if (self->_docked != a3)
  {
    BOOL v3 = a3;
    self->_docked = a3;
    if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      id v10 = [(UILayoutGuide *)self owningView];
      id v5 = [v10 window];
      id v6 = [v5 _primaryKeyboardTrackingGuide];
      [v6 setDocked:v3];
    }
    else
    {
      [(UITrackingLayoutGuide *)self resetAnimationOptions];
      if (![(UIKeyboardLayoutGuide *)self isTransitioning]
        || !v3
        || [(UIKeyboardLayoutGuide *)self shouldFollowCurrentKeyboard])
      {
        return;
      }
      id v10 = [(UILayoutGuide *)self owningView];
      [v10 bounds];
      double v8 = v7;
      id v5 = [(UILayoutGuide *)self owningView];
      id v6 = [v5 window];
      [v6 insetForDismissedKeyboardGuide];
      -[UIKeyboardLayoutGuide setPreviousSize:](self, "setPreviousSize:", v8, v9);
    }
  }
}

- (BOOL)isDocked
{
  return self->_docked;
}

- (BOOL)keyboardStateIsDocked:(int64_t)a3
{
  return (unint64_t)a3 < 3;
}

- (void)setCurrentKeyboardVisualState:(int64_t)a3
{
  if (self->_currentKeyboardVisualState != a3)
  {
    -[UIKeyboardLayoutGuide keyboardStateIsDocked:](self, "keyboardStateIsDocked:");
    BOOL v5 = [(UIKeyboardLayoutGuide *)self keyboardStateIsDocked:a3];
    self->_currentKeyboardVisualState = a3;
    [(UIKeyboardLayoutGuide *)self setDocked:v5];
    if (!v5)
    {
      -[UIKeyboardLayoutGuide setPreviousSize:](self, "setPreviousSize:", 1.0, 0.0);
    }
  }
}

- (BOOL)currentStateIsDocked
{
  return [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 3
      && [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 4
      && [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 5
      && [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 6;
}

- (void)setWindowGuide:(BOOL)a3
{
  if (self->_windowGuide != a3) {
    self->_windowGuide = a3;
  }
}

- (BOOL)isWindowGuide
{
  return self->_windowGuide;
}

- (id)_obtainTransitionAssertionForReason:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutGuide *)self isWindowGuide])
  {
    BOOL v5 = [(UIKeyboardLayoutGuide *)self _assertionController];
    id v6 = [v5 vendAssertionOfType:1 initialState:1 reason:v4 requiresExplicitInvalidation:0];
LABEL_5:

    goto LABEL_7;
  }
  if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    BOOL v5 = [(UILayoutGuide *)self owningView];
    double v7 = [v5 window];
    double v8 = [v7 _primaryKeyboardTrackingGuide];
    id v6 = [v8 _obtainTransitionAssertionForReason:v4];

    goto LABEL_5;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void)_setTransitioning:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(UIKeyboardLayoutGuide *)self isWindowGuide] && self->_transitioning != v3)
  {
    self->_transitioning = v3;
    BOOL v5 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = @"not transitioning";
      if (v3) {
        id v6 = @"transitioning";
      }
      int v7 = 138412290;
      double v8 = v6;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "setTransitioning: %@", (uint8_t *)&v7, 0xCu);
    }

    if (!v3) {
      [(UITrackingLayoutGuide *)self resetAnimationOptions];
    }
  }
}

- (BOOL)isTransitioning
{
  if ([(UIKeyboardLayoutGuide *)self isWindowGuide])
  {
    LOBYTE(v3) = self->_transitioning;
  }
  else
  {
    BOOL v3 = [(UITrackingLayoutGuide *)self constrainedToWindowGuide];
    if (v3)
    {
      id v4 = [(UILayoutGuide *)self owningView];
      BOOL v5 = [v4 window];
      id v6 = [v5 _primaryKeyboardTrackingGuide];
      char v7 = [v6 isTransitioning];

      LOBYTE(v3) = v7;
    }
  }
  return v3;
}

- (unint64_t)validatedOverlappingEdges:(unint64_t)a3
{
  if ((~(_BYTE)a3 & 0xA) != 0) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = a3 ^ 0xA;
  }
  if ((~(_BYTE)a3 & 5) != 0) {
    unint64_t v4 = v3;
  }
  else {
    unint64_t v4 = a3 ^ 1;
  }
  if ((v4 & 4) == 0
    && [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 3
    && [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] != 4)
  {
    v4 |= 4uLL;
  }
  return v4;
}

- (BOOL)moveGuideOffscreenAtEdge:(unint64_t)a3
{
  return [(UIKeyboardLayoutGuide *)self _moveGuideOffscreenAtEdge:a3 force:0];
}

- (BOOL)_moveGuideOffscreenAtEdge:(unint64_t)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![(UIKeyboardLayoutGuide *)self isWindowGuide]
    || [(UIKeyboardLayoutGuide *)self isTransitioning] && !v4)
  {
    return 0;
  }
  char v7 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 134217984;
    unint64_t v28 = a3;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "_moveGuideOffscreenAtEdge: %lu", (uint8_t *)&v27, 0xCu);
  }

  double v8 = [(UILayoutGuide *)self owningView];
  [v8 bounds];
  double v10 = v9;

  [(UIKeyboardLayoutGuide *)self previousOffset];
  double v12 = v11;
  double v14 = v13;
  [(UIKeyboardLayoutGuide *)self previousSize];
  double v16 = v15;
  double v18 = v17;
  double v19 = v12 >= 0.0 ? v12 : 0.0;
  double v20 = v14 >= 0.0 ? v14 : 0.0;
  -[UIKeyboardLayoutGuide setInteractionResetOffset:](self, "setInteractionResetOffset:", v19, v20);
  -[UIKeyboardLayoutGuide setInteractionResetSize:](self, "setInteractionResetSize:", v16, v18);
  if (a3 == 2)
  {
    double v21 = v19 - v10;
  }
  else if (a3 == 8)
  {
    double v21 = v10 + v19;
  }
  else
  {
    double v20 = 0.0;
    if ([(UIKeyboardLayoutGuide *)self ignoresSafeArea])
    {
      double v18 = 0.0;
    }
    else
    {
      double v22 = [(UILayoutGuide *)self owningView];
      [v22 safeAreaInsets];
      double v18 = v23;
    }
    double v16 = v10;
    double v21 = 0.0;
  }
  BOOL v24 = -[UIKeyboardLayoutGuide _changeOffsetConstants:force:](self, "_changeOffsetConstants:force:", v4, v21, v20);
  BOOL v25 = -[UIKeyboardLayoutGuide _changeSizingConstants:force:](self, "_changeSizingConstants:force:", v4, v16, v18);
  [(UITrackingLayoutGuide *)self updateConstraintsForActiveEdges];
  BOOL result = 1;
  if (!v24 && !v25) {
    return 0;
  }
  return result;
}

- (void)resetGuideForCancelledDismissInteraction
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([(UIKeyboardLayoutGuide *)self isWindowGuide])
  {
    unint64_t v3 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      [(UIKeyboardLayoutGuide *)self interactionResetOffset];
      BOOL v4 = NSStringFromUIOffset(v8);
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "resetGuideForCancelledDismissInteraction %@", (uint8_t *)&v5, 0xCu);
    }
    [(UIKeyboardLayoutGuide *)self interactionResetOffset];
    -[UIKeyboardLayoutGuide changeOffsetConstants:](self, "changeOffsetConstants:");
    -[UIKeyboardLayoutGuide setInteractionResetOffset:](self, "setInteractionResetOffset:", 0.0, 0.0);
  }
}

- (_UIAssertionController)_assertionController
{
  assertionController = self->_assertionController;
  if (!assertionController)
  {
    BOOL v4 = [[_UIAssertionController alloc] initWithAssertionSubject:self];
    int v5 = self->_assertionController;
    self->_assertionController = v4;

    assertionController = self->_assertionController;
  }
  return assertionController;
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  if (a3 == 1) {
    return self->_transitioning;
  }
  uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardLayoutGuide.m", 736, @"Unknown _UIAssertionType %lu", a3);

  return 0;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 == 1)
  {
    [(UIKeyboardLayoutGuide *)self _setTransitioning:a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIKeyboardLayoutGuide.m", 748, @"Unknown _UIAssertionType %lu", a4);
  }
}

- (BOOL)changeOffsetConstants:(UIOffset)a3
{
  return -[UIKeyboardLayoutGuide _changeOffsetConstants:force:](self, "_changeOffsetConstants:force:", 0, a3.horizontal, a3.vertical);
}

- (BOOL)_changeOffsetConstants:(UIOffset)a3 force:(BOOL)a4
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v8 = [(UIKeyboardLayoutGuide *)self isWindowGuide];
  if (!v8) {
    return v8;
  }
  [(UIKeyboardLayoutGuide *)self previousOffset];
  if (horizontal == v10 && vertical == v9) {
    goto LABEL_11;
  }
  if ([(UIKeyboardLayoutGuide *)self ignoreKeyboardChanges] && !a4)
  {
    double v12 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "*** changeOffsetConstants: called while ignoring changes; skipping ***",
        buf,
        2u);
    }

    goto LABEL_11;
  }
  [(UIKeyboardLayoutGuide *)self previousSize];
  BOOL v14 = *MEMORY[0x1E4F1DB30] == v13;
  BOOL v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8) == v15;
  if (v14 && v16) {
    double v17 = 0.0;
  }
  else {
    double v17 = horizontal;
  }
  if (v14 && v16) {
    double v18 = 0.0;
  }
  else {
    double v18 = vertical;
  }
  if (v18 > 0.0 || v17 > 0.0)
  {
    if (v18 > 0.0 && [(UIKeyboardLayoutGuide *)self isDocked]) {
      [(UIKeyboardLayoutGuide *)self setDocked:0];
    }
    double v19 = 0.0;
    double v20 = 0.0;
    if (![(UIKeyboardLayoutGuide *)self shouldFollowCurrentKeyboard]) {
      goto LABEL_41;
    }
    double v21 = [(UILayoutGuide *)self owningView];
    [v21 safeAreaInsets];
    if (v18 <= v22)
    {

      goto LABEL_35;
    }
    if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] == 5)
    {
    }
    else
    {
      int64_t v23 = [(UIKeyboardLayoutGuide *)self currentKeyboardVisualState];

      if (v23 != 6) {
        goto LABEL_35;
      }
    }
LABEL_11:
    LOBYTE(v8) = 0;
    return v8;
  }
  if ([(UIKeyboardLayoutGuide *)self isDocked]
    || [(UIKeyboardLayoutGuide *)self isTransitioning])
  {
    if (v18 < 0.0) {
      double v18 = 0.0;
    }
    goto LABEL_35;
  }
  double v19 = 0.0;
  double v20 = 0.0;
  if ([(UIKeyboardLayoutGuide *)self shouldFollowCurrentKeyboard])
  {
LABEL_35:
    if (v17 >= 0.0)
    {
      double v19 = v18;
      double v20 = v17;
    }
    else
    {
      if ([(UIKeyboardLayoutGuide *)self isTransitioning]) {
        double v20 = v17;
      }
      else {
        double v20 = 0.0;
      }
      double v19 = v18;
    }
  }
LABEL_41:
  BOOL v24 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    [(UIKeyboardLayoutGuide *)self previousOffset];
    uint64_t v26 = v25;
    [(UIKeyboardLayoutGuide *)self previousOffset];
    *(_DWORD *)buf = 134218752;
    double v32 = v20;
    __int16 v33 = 2048;
    double v34 = v19;
    __int16 v35 = 2048;
    uint64_t v36 = v26;
    __int16 v37 = 2048;
    uint64_t v38 = v27;
    _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_DEFAULT, "changeOffsetConstants: offset is changing to {%0.f, %0.f} [previous offset: {%0.f, %0.f}]", buf, 0x2Au);
  }

  -[UIKeyboardLayoutGuide setPreviousOffset:](self, "setPreviousOffset:", v20, v19);
  v30.receiver = self;
  v30.super_class = (Class)UIKeyboardLayoutGuide;
  unsigned __int8 v28 = -[UITrackingLayoutGuide changeOffsetConstants:](&v30, sel_changeOffsetConstants_, v20, v19);
  LOBYTE(v8) = v28 & ~[(UIKeyboardLayoutGuide *)self isTransitioning];
  return v8;
}

- (BOOL)changeSizingConstants:(CGSize)a3
{
  return -[UIKeyboardLayoutGuide _changeSizingConstants:force:](self, "_changeSizingConstants:force:", 0, a3.width, a3.height);
}

- (BOOL)_changeSizingConstants:(CGSize)a3 force:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  int v8 = [(UIKeyboardLayoutGuide *)self isWindowGuide];
  if (!v8) {
    return v8;
  }
  [(UIKeyboardLayoutGuide *)self previousSize];
  double v10 = v9;
  BOOL v11 = v9 <= 1.0;
  [(UILayoutGuide *)self layoutFrame];
  if (width == v13 && height == v12 && !v11)
  {
LABEL_14:
    LOBYTE(v8) = 0;
    return v8;
  }
  if ([(UIKeyboardLayoutGuide *)self ignoreKeyboardChanges] && !a4)
  {
    BOOL v16 = _UIKeyboardLayoutGuideLogger();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "*** changeSizingConstants: called while ignoring changes; skipping ***",
        buf,
        2u);
    }

    goto LABEL_14;
  }
  [(UIKeyboardLayoutGuide *)self previousSize];
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  -[UIKeyboardLayoutGuide setPreviousSize:](self, "setPreviousSize:", width, height);
  if (![(UIKeyboardLayoutGuide *)self shouldFollowCurrentKeyboard])
  {
    if ([(UIKeyboardLayoutGuide *)self addsHeightWhenUndocked])
    {
      double v21 = [(UILayoutGuide *)self owningView];
      [v21 safeAreaInsets];
      double height = height + v22;
    }
    else
    {
      if ([(UIKeyboardLayoutGuide *)self currentKeyboardVisualState] == 5) {
        goto LABEL_21;
      }
      double v21 = [(UILayoutGuide *)self owningView];
      int64_t v23 = [v21 window];
      [v23 insetForDismissedKeyboardGuide];
      double height = v24;
    }
LABEL_21:
    uint64_t v25 = [(UILayoutGuide *)self owningView];
    [v25 bounds];
    double width = v26;

    [(UIKeyboardLayoutGuide *)self previousOffset];
    if (v27 > 0.0) {
      -[UIKeyboardLayoutGuide changeOffsetConstants:](self, "changeOffsetConstants:", 0.0, 0.0);
    }
  }
  if (height == 0.0)
  {
    unsigned __int8 v28 = [(UILayoutGuide *)self owningView];
    uint64_t v29 = [v28 window];
    [v29 insetForDismissedKeyboardGuide];
    double height = v30;
  }
  double v31 = [(UIKeyboardLayoutGuide *)self assistantHeightConstraint];

  if (v31)
  {
    double v32 = [(UILayoutGuide *)self owningView];
    __int16 v33 = [v32 traitCollection];
    +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v33];
    double v35 = v34;

    uint64_t v36 = [(UIKeyboardLayoutGuide *)self assistantHeightConstraint];
    [v36 setConstant:v35];
  }
  __int16 v37 = _UIKeyboardLayoutGuideLogger();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v38 = [(UIKeyboardLayoutGuide *)self isTransitioning];
    *(_DWORD *)buf = 138413314;
    uint64_t v39 = @"not transitioning";
    if (v38) {
      uint64_t v39 = @"transitioning";
    }
    v44 = v39;
    __int16 v45 = 2048;
    double v46 = width;
    __int16 v47 = 2048;
    double v48 = height;
    __int16 v49 = 2048;
    uint64_t v50 = v18;
    __int16 v51 = 2048;
    uint64_t v52 = v20;
    _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_DEFAULT, "changeSizingConstants: size is changing [%@] to {%0.f, %0.f} [previous size: {%0.f, %0.f}]", buf, 0x34u);
  }

  v42.receiver = self;
  v42.super_class = (Class)UIKeyboardLayoutGuide;
  unsigned __int8 v40 = -[UITrackingLayoutGuide changeSizingConstants:](&v42, sel_changeSizingConstants_, width, height);
  LOBYTE(v8) = v11 | ((v10 <= 1.0) | ~[(UIKeyboardLayoutGuide *)self isTransitioning]) & v40;
  return v8;
}

- (BOOL)addsHeightWhenUndocked
{
  return self->_addsHeightWhenUndocked;
}

- (void)setAddsHeightWhenUndocked:(BOOL)a3
{
  self->_addsHeightWhenUndocked = a3;
}

- (BOOL)followsUndockedKeyboard
{
  return self->_followsUndockedKeyboard;
}

- (BOOL)usesBottomSafeArea
{
  return self->_usesBottomSafeArea;
}

- (CGFloat)keyboardDismissPadding
{
  return self->_keyboardDismissPadding;
}

- (UIOffset)previousOffset
{
  double horizontal = self->_previousOffset.horizontal;
  double vertical = self->_previousOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setPreviousOffset:(UIOffset)a3
{
  self->_previousOffset = a3;
}

- (CGSize)previousSize
{
  double width = self->_previousSize.width;
  double height = self->_previousSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousSize:(CGSize)a3
{
  self->_previousSize = a3;
}

- (NSLayoutConstraint)viewBottomConstraint
{
  return self->_viewBottomConstraint;
}

- (void)setViewBottomConstraint:(id)a3
{
}

- (BOOL)ignoresSafeArea
{
  return self->_ignoresSafeArea;
}

- (BOOL)ignoreKeyboardChanges
{
  return self->_ignoreKeyboardChanges;
}

- (void)setIgnoreKeyboardChanges:(BOOL)a3
{
  self->_ignoreKeyboardChanges = a3;
}

- (int64_t)followTypes
{
  return self->_followTypes;
}

- (void)setFollowTypes:(int64_t)a3
{
  self->_followTypes = a3;
}

- (_UIKBLightEffectsBackground)lightEffectsBackdrop
{
  return self->_lightEffectsBackdrop;
}

- (void)setLightEffectsBackdrop:(id)a3
{
}

- (NSArray)backdropConstraints
{
  return self->_backdropConstraints;
}

- (void)setBackdropConstraints:(id)a3
{
}

- (NSLayoutConstraint)assistantHeightConstraint
{
  return self->_assistantHeightConstraint;
}

- (void)setAssistantHeightConstraint:(id)a3
{
}

- (UIOffset)interactionResetOffset
{
  double horizontal = self->_interactionResetOffset.horizontal;
  double vertical = self->_interactionResetOffset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (void)setInteractionResetOffset:(UIOffset)a3
{
  self->_interactionResetOffset = a3;
}

- (CGSize)interactionResetSize
{
  double width = self->_interactionResetSize.width;
  double height = self->_interactionResetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setInteractionResetSize:(CGSize)a3
{
  self->_interactionResetSize = a3;
}

- (int64_t)currentKeyboardVisualState
{
  return self->_currentKeyboardVisualState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);
  objc_storeStrong((id *)&self->_lightEffectsBackdrop, 0);
  objc_storeStrong((id *)&self->_viewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
}

@end