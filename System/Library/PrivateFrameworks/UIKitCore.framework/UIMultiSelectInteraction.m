@interface UIMultiSelectInteraction
- (BOOL)_areSelectionExtensionKeyCommandsEnabled;
- (BOOL)_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4;
- (BOOL)_isActive;
- (BOOL)_isBandSelectionAllowedAtPoint:(CGPoint)a3;
- (BOOL)_isCommandKeyBeingHeldWithGesture:(id)a3;
- (BOOL)_isShiftKeyBeingHeldWithGesture:(id)a3;
- (BOOL)_shouldBeginInteractionWithGestureType:(int64_t)a3 location:(CGPoint)a4 velocity:(CGPoint)a5;
- (BOOL)_triggeredLegacyPathInsteadForGestureRecognizer:(id)a3 velocity:(CGPoint)a4 shouldBegin:(BOOL *)a5;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEnabled;
- (BOOL)multiSelectOneFingerPanGestureShouldPreventDragInteractionGesture:(id)a3;
- (NSArray)gesturesForFailureRequirements;
- (UIBandSelectionInteraction)bandSelectionInteraction;
- (UIMultiSelectInteraction)init;
- (UIMultiSelectInteractionDelegate)delegate;
- (UIPanGestureRecognizer)_multiFingerPan;
- (UITapGestureRecognizer)_multiFingerTap;
- (UIView)view;
- (_UIMultiSelectOneFingerPanGesture)_multiSelectModePan;
- (_UISingleFingerTapExtensionGesture)_singleFingerExtensionTap;
- (double)singleTouchPanGestureHysteresis;
- (id)_interactionDelegate;
- (id)_viewAsScrollView;
- (id)keyCommandsForSelectionExtension;
- (int64_t)_gestureTypeForGestureInstance:(id)a3;
- (int64_t)activeGestureType;
- (unint64_t)_currentExtensionTypeForOneFingerTapGesture:(id)a3;
- (void)_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:(BOOL)a3;
- (void)_beginCommonPan:(id)a3;
- (void)_beginInteractionWithTrigger:(id)a3 point:(CGPoint)a4 keepingSelection:(BOOL)a5;
- (void)_beginObservingScrollViewOffsetUpdates;
- (void)_cancelCommonPan:(id)a3;
- (void)_cancelScrollingInScrollView:(id)a3;
- (void)_cancelScrollingInViewForGesture:(id)a3;
- (void)_didInvokeMultiSelectAppendGestureAtLocation:(CGPoint)a3;
- (void)_didInvokeMultiSelectExtendGestureAtLocation:(CGPoint)a3;
- (void)_endCommonPan:(id)a3;
- (void)_endInteractionAtPoint:(CGPoint)a3 canceled:(BOOL)a4;
- (void)_endObservingScrollViewOffsetUpdates;
- (void)_handleBandSelectionInteraction:(id)a3;
- (void)_handleCommonPanGestureStateChanged:(id)a3;
- (void)_handleKeyboardSelectionExtensionKeyCommand:(id)a3;
- (void)_handleSelectionExtensionTapGesture:(id)a3;
- (void)_multiFingerTapGesture:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_sendWillBeginInteractionAtPoint:(CGPoint)a3 keepingSelection:(BOOL)a4;
- (void)_updateCommonPan:(id)a3;
- (void)_updateDelegateConformance;
- (void)didMoveToView:(id)a3;
- (void)setBandSelectionInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setSingleTouchPanGestureHysteresis:(double)a3;
- (void)setView:(id)a3;
- (void)set_multiFingerPan:(id)a3;
- (void)set_multiFingerTap:(id)a3;
- (void)set_multiSelectModePan:(id)a3;
- (void)set_singleFingerExtensionTap:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIMultiSelectInteraction

- (void)willMoveToView:(id)a3
{
  if (!a3)
  {
    p_view = &self->_view;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    [WeakRetained removeGestureRecognizer:self->_multiSelectModePan];

    id v7 = objc_loadWeakRetained((id *)p_view);
    [v7 removeGestureRecognizer:self->_multiFingerPan];

    id v8 = objc_loadWeakRetained((id *)p_view);
    [v8 removeGestureRecognizer:self->_multiFingerTap];

    id v9 = objc_loadWeakRetained((id *)p_view);
    [v9 removeGestureRecognizer:self->_singleFingerExtensionTap];

    id v10 = objc_loadWeakRetained((id *)p_view);
    [v10 removeInteraction:self->_bandSelectionInteraction];
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (UIMultiSelectInteraction)init
{
  v20.receiver = self;
  v20.super_class = (Class)UIMultiSelectInteraction;
  v2 = [(UIMultiSelectInteraction *)&v20 init];
  if (v2)
  {
    uint64_t v3 = [(UIPanGestureRecognizer *)[_UIMultiSelectOneFingerPanGesture alloc] initWithTarget:v2 action:sel__handleCommonPanGestureStateChanged_];
    [(UIGestureRecognizer *)v3 setName:@"com.apple.UIKit.multi-select.singleFingerPanGesture"];
    [(UIPanGestureRecognizer *)v3 setDelegate:v2];
    [(_UIMultiSelectOneFingerPanGesture *)v3 setOneFingerPanDelegate:v2];
    [(UIPanGestureRecognizer *)v3 setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v3 _setHysteresis:5.0];
    [(UIGestureRecognizer *)v3 setDelaysTouchesEnded:0];
    objc_storeStrong((id *)&v2->_multiSelectModePan, v3);
    v4 = [[UIPanGestureRecognizer alloc] initWithTarget:v2 action:sel__handleCommonPanGestureStateChanged_];
    [(UIGestureRecognizer *)v4 setName:@"com.apple.UIKit.multi-select.multiFingerPanGesture"];
    [(UIPanGestureRecognizer *)v4 setDelegate:v2];
    [(UIPanGestureRecognizer *)v4 setMinimumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)v4 setMaximumNumberOfTouches:2];
    [(UIPanGestureRecognizer *)v4 _setFailsPastHysteresisWithoutMinTouches:1];
    [(UIPanGestureRecognizer *)v4 _setHysteresis:0.0];
    [(UIGestureRecognizer *)v4 setDelaysTouchesEnded:0];
    [(UIPanGestureRecognizer *)v4 _setRequiresImmediateMultipleTouches:1];
    [(UIPanGestureRecognizer *)v4 _setAllowableTouchTimeSeparation:0.06];
    v5 = +[_UITextSelectionSettings sharedInstance];
    [v5 allowableSeparation];
    -[UIPanGestureRecognizer _setAllowableSeparation:](v4, "_setAllowableSeparation:");

    [(UIGestureRecognizer *)v4 _setAnalyticsGestureHandled:1];
    objc_storeStrong((id *)&v2->_multiFingerPan, v4);
    v6 = [[UITapGestureRecognizer alloc] initWithTarget:v2 action:sel__multiFingerTapGesture_];
    [(UIGestureRecognizer *)v6 setName:@"com.apple.UIKit.multi-select.multiFingerTapGesture"];
    [(UIGestureRecognizer *)v6 setDelegate:v2];
    [(UITapGestureRecognizer *)v6 setAllowableMovement:60.0];
    id v7 = +[_UITextSelectionSettings sharedInstance];
    [v7 allowableSeparation];
    -[UITapGestureRecognizer _setAllowableSeparation:](v6, "_setAllowableSeparation:");

    [(UITapGestureRecognizer *)v6 setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v6 setNumberOfTouchesRequired:2];
    [(UITapGestureRecognizer *)v6 _setAllowableTouchTimeSeparation:0.06];
    [(UITapGestureRecognizer *)v6 setMaximumTapDuration:0.13];
    [(UIGestureRecognizer *)v6 _setAnalyticsGestureHandled:1];
    objc_storeStrong((id *)&v2->_multiFingerTap, v6);
    id v8 = [(UITapGestureRecognizer *)[_UISingleFingerTapExtensionGesture alloc] initWithTarget:v2 action:sel__handleSelectionExtensionTapGesture_];
    [(UIGestureRecognizer *)v8 setName:@"com.apple.UIKit.multi-select.singleFingerExtension"];
    [(UIGestureRecognizer *)v8 setDelegate:v2];
    [(UITapGestureRecognizer *)v8 setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v8 setNumberOfTouchesRequired:1];
    objc_storeStrong((id *)&v2->_singleFingerExtensionTap, v8);
    objc_initWeak(&location, v2);
    id v9 = [UIBandSelectionInteraction alloc];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __32__UIMultiSelectInteraction_init__block_invoke;
    v17[3] = &unk_1E5311B50;
    objc_copyWeak(&v18, &location);
    uint64_t v10 = [(UIBandSelectionInteraction *)v9 initWithSelectionHandler:v17];
    bandSelectionInteraction = v2->_bandSelectionInteraction;
    v2->_bandSelectionInteraction = (UIBandSelectionInteraction *)v10;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__UIMultiSelectInteraction_init__block_invoke_2;
    v15[3] = &unk_1E5311B78;
    objc_copyWeak(&v16, &location);
    [(UIBandSelectionInteraction *)v2->_bandSelectionInteraction setShouldBeginHandler:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__UIMultiSelectInteraction_init__block_invoke_3;
    v13[3] = &unk_1E5308020;
    objc_copyWeak(&v14, &location);
    [(UIBandSelectionInteraction *)v2->_bandSelectionInteraction _setBandVisibilityHandler:v13];
    v2->_activeGestureType = 8;
    v2->_enabled = 1;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    BOOL v3 = a3;
    self->_enabled = a3;
    -[UIGestureRecognizer setEnabled:](self->_multiSelectModePan, "setEnabled:");
    [(UIGestureRecognizer *)self->_multiFingerPan setEnabled:v3];
    [(UIGestureRecognizer *)self->_multiFingerTap setEnabled:v3];
    [(UIGestureRecognizer *)self->_singleFingerExtensionTap setEnabled:v3];
    bandSelectionInteraction = self->_bandSelectionInteraction;
    [(UIBandSelectionInteraction *)bandSelectionInteraction setEnabled:v3];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    [WeakRetained addGestureRecognizer:self->_multiSelectModePan];

    id v7 = objc_loadWeakRetained((id *)p_view);
    [v7 addGestureRecognizer:self->_multiFingerTap];

    id v8 = objc_loadWeakRetained((id *)p_view);
    [v8 addGestureRecognizer:self->_multiFingerPan];

    id v9 = objc_loadWeakRetained((id *)p_view);
    [v9 addGestureRecognizer:self->_singleFingerExtensionTap];

    [(UIGestureRecognizer *)self->_multiFingerTap requireGestureRecognizerToFail:self->_multiFingerPan];
    id v10 = objc_loadWeakRetained((id *)p_view);
    [v10 addInteraction:self->_bandSelectionInteraction];

    id v11 = objc_loadWeakRetained((id *)p_view);
    objc_opt_class();
    self->_isScrollView = objc_opt_isKindOfClass() & 1;
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(UIMultiSelectInteraction *)self _updateDelegateConformance];
}

- (void)_updateDelegateConformance
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    self->_delegateConformsToProtocol = [v5 conformsToProtocol:&unk_1ED560F78];
  }
  else
  {
    self->_delegateConformsToProtocol = 0;
  }

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v7 = 16;
  }
  else {
    __int16 v7 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFEF | v7;

  id v8 = objc_loadWeakRetained((id *)p_delegate);
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;

  id v9 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v10 = 2;
  }
  else {
    __int16 v10 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFFD | v10;

  id v11 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v12 = 4;
  }
  else {
    __int16 v12 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFFB | v12;

  id v13 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v14 = 4096;
  }
  else {
    __int16 v14 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xEFFF | v14;

  id v15 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v16 = 8;
  }
  else {
    __int16 v16 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFF7 | v16;

  id v17 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v18 = 512;
  }
  else {
    __int16 v18 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFDFF | v18;

  id v19 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v20 = 1024;
  }
  else {
    __int16 v20 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFBFF | v20;

  id v21 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v22 = 2048;
  }
  else {
    __int16 v22 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xF7FF | v22;

  id v23 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v24 = 0x2000;
  }
  else {
    __int16 v24 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xDFFF | v24;

  id v25 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v26 = 32;
  }
  else {
    __int16 v26 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFDF | v26;

  id v27 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v28 = 64;
  }
  else {
    __int16 v28 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFFBF | v28;

  id v29 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v30 = 128;
  }
  else {
    __int16 v30 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFF7F | v30;

  id v32 = objc_loadWeakRetained((id *)p_delegate);
  if (objc_opt_respondsToSelector()) {
    __int16 v31 = 256;
  }
  else {
    __int16 v31 = 0;
  }
  *(_WORD *)&self->_optionalDelegateFlags = *(_WORD *)&self->_optionalDelegateFlags & 0xFEFF | v31;
}

- (void)setSingleTouchPanGestureHysteresis:(double)a3
{
}

- (id)keyCommandsForSelectionExtension
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(UIMultiSelectInteraction *)self _areSelectionExtensionKeyCommandsEnabled])
  {
    if (!self->_extendToCellAboveCommand)
    {
      BOOL v3 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputUpArrow" modifierFlags:0x20000 action:sel__handleKeyboardSelectionExtensionKeyCommand_];
      extendToCellAboveCommand = self->_extendToCellAboveCommand;
      self->_extendToCellAboveCommand = v3;
    }
    if (!self->_extendToCellBelowCommand)
    {
      id v5 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputDownArrow" modifierFlags:0x20000 action:sel__handleKeyboardSelectionExtensionKeyCommand_];
      extendToCellBelowCommand = self->_extendToCellBelowCommand;
      self->_extendToCellBelowCommand = v5;
    }
    if (!self->_extendToCellRightCommand)
    {
      __int16 v7 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputRightArrow" modifierFlags:0x20000 action:sel__handleKeyboardSelectionExtensionKeyCommand_];
      extendToCellRightCommand = self->_extendToCellRightCommand;
      self->_extendToCellRightCommand = v7;
    }
    extendToCellLeftCommand = self->_extendToCellLeftCommand;
    if (!extendToCellLeftCommand)
    {
      __int16 v10 = +[UIKeyCommand keyCommandWithInput:@"UIKeyInputLeftArrow" modifierFlags:0x20000 action:sel__handleKeyboardSelectionExtensionKeyCommand_];
      id v11 = self->_extendToCellLeftCommand;
      self->_extendToCellLeftCommand = v10;

      extendToCellLeftCommand = self->_extendToCellLeftCommand;
    }
    long long v14 = *(_OWORD *)&self->_extendToCellAboveCommand;
    id v15 = self->_extendToCellRightCommand;
    __int16 v16 = extendToCellLeftCommand;
    __int16 v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:4];
  }
  else
  {
    __int16 v12 = 0;
  }
  return v12;
}

- (BOOL)_areSelectionExtensionKeyCommandsEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  v4 = [WeakRetained window];
  id v5 = [v4 firstResponder];

  if ((*(_WORD *)&self->_optionalDelegateFlags & 0x200) != 0)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if ([v7 supportsKeyboardSelectionExtension]) {
      int v6 = _UIResponderRequiresTextInput(v5) ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

void __32__UIMultiSelectInteraction_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleBandSelectionInteraction:v3];
}

uint64_t __32__UIMultiSelectInteraction_init__block_invoke_2(uint64_t a1, void *a2, double a3, double a4)
{
  int v6 = (id *)(a1 + 32);
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v6);
  uint64_t v9 = objc_msgSend(WeakRetained, "_shouldBeginBandSelectionInteraction:atPoint:", v7, a3, a4);

  return v9;
}

uint64_t __32__UIMultiSelectInteraction_init__block_invoke_3(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained && (WeakRetained[24] & 0x100) != 0)
  {
    id v8 = [WeakRetained delegate];
    uint64_t v7 = objc_msgSend(v8, "multiSelectInteraction:shouldShowBandForSelectionStartingAtPoint:", v6, a2, a3);
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

- (int64_t)_gestureTypeForGestureInstance:(id)a3
{
  v4 = (_UISingleFingerTapExtensionGesture *)a3;
  id v5 = v4;
  if ((_UISingleFingerTapExtensionGesture *)self->_multiSelectModePan == v4)
  {
    int64_t v6 = 0;
  }
  else if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerPan == v4)
  {
    int64_t v6 = 1;
  }
  else if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerTap == v4)
  {
    int64_t v6 = 2;
  }
  else
  {
    if (self->_singleFingerExtensionTap != v4) {
      goto LABEL_5;
    }
    unint64_t v8 = [(UIMultiSelectInteraction *)self _currentExtensionTypeForOneFingerTapGesture:v4];
    if (v8 == 1)
    {
      int64_t v6 = 4;
      goto LABEL_9;
    }
    if (v8 == 2) {
      int64_t v6 = 3;
    }
    else {
LABEL_5:
    }
      int64_t v6 = 8;
  }
LABEL_9:

  return v6;
}

- (id)_interactionDelegate
{
  if (self->_delegateConformsToProtocol)
  {
    v2 = [(UIMultiSelectInteraction *)self delegate];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (double)singleTouchPanGestureHysteresis
{
  [(UIPanGestureRecognizer *)self->_multiSelectModePan _hysteresis];
  return result;
}

- (NSArray)gesturesForFailureRequirements
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  long long v4 = *(_OWORD *)&self->_multiSelectModePan;
  multiFingerTap = self->_multiFingerTap;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v4 count:3];
  return (NSArray *)v2;
}

- (id)_viewAsScrollView
{
  if (self->_isScrollView) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  }
  else {
    id WeakRetained = 0;
  }
  return WeakRetained;
}

- (void)_beginObservingScrollViewOffsetUpdates
{
  id v3 = [(UIMultiSelectInteraction *)self _viewAsScrollView];
  [v3 _addScrollViewScrollObserver:self];
}

- (void)_endObservingScrollViewOffsetUpdates
{
  id v3 = [(UIMultiSelectInteraction *)self _viewAsScrollView];
  [v3 _removeScrollViewScrollObserver:self];
}

- (BOOL)_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v9 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  char v10 = [v9 isInMultiSelectMode];

  if (v10) {
    return 1;
  }
  __int16 v12 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  char v13 = objc_msgSend(v12, "interaction:shouldAutomaticallyTransitionToMultiSelectModeAtPoint:withVelocity:", self, v7, v6, x, y);

  return v13;
}

- (void)_askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  if ([v5 isInMultiSelectMode])
  {
    unint64_t v6 = [(UIMultiSelectInteraction *)self activeGestureType] - 1;

    if (v6 >= 2) {
      return;
    }
  }
  else
  {
  }
  id v7 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  [v7 automaticallyTransitionToMultiSelectModeKeepingCurrentSelection:v3];
}

- (void)_sendWillBeginInteractionAtPoint:(CGPoint)a3 keepingSelection:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  __int16 optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;
  uint64_t v9 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  id v10 = v9;
  if ((optionalDelegateFlags & 0x2000) != 0) {
    objc_msgSend(v9, "willBeginMultiSelectInteraction:atPoint:keepCurrentSelection:", self, v4, x, y);
  }
  else {
    objc_msgSend(v9, "willBeginMultiSelectInteraction:atPoint:", self, x, y);
  }
}

- (BOOL)_isShiftKeyBeingHeldWithGesture:(id)a3
{
  BOOL v3 = +[UIKeyboardImpl isHardwareShiftKeyBeingHeld];
  BOOL v4 = +[UIKeyboardImpl activeInstance];
  char v5 = [v4 isShiftKeyBeingHeld];

  return v3 | v5;
}

- (BOOL)_isCommandKeyBeingHeldWithGesture:(id)a3
{
  return +[UIKeyboardImpl isHardwareCommandKeyBeingHeld];
}

- (unint64_t)_currentExtensionTypeForOneFingerTapGesture:(id)a3
{
  id v4 = a3;
  if ([(UIMultiSelectInteraction *)self _isShiftKeyBeingHeldWithGesture:v4]) {
    unint64_t v5 = 2;
  }
  else {
    unint64_t v5 = 0;
  }
  BOOL v6 = [(UIMultiSelectInteraction *)self _isCommandKeyBeingHeldWithGesture:v4];

  if (v6) {
    return 1;
  }
  else {
    return v5;
  }
}

- (BOOL)multiSelectOneFingerPanGestureShouldPreventDragInteractionGesture:(id)a3
{
  if ((*(_WORD *)&self->_optionalDelegateFlags & 1) == 0) {
    return 0;
  }
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  char v7 = [WeakRetained multiSelectInteractionGestureShouldPreventDragLiftGesture:v5];

  return v7;
}

- (BOOL)_triggeredLegacyPathInsteadForGestureRecognizer:(id)a3 velocity:(CGPoint)a4 shouldBegin:(BOOL *)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v9 = (UIPanGestureRecognizer *)a3;
  __int16 optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;
  if ((optionalDelegateFlags & 0x1000) == 0)
  {
    id v11 = [(UIMultiSelectInteraction *)self view];
    [(UIPanGestureRecognizer *)v9 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    __int16 v16 = [(UIMultiSelectInteraction *)self _interactionDelegate];
    if ([v16 isInMultiSelectMode])
    {

LABEL_6:
      __int16 v18 = [(UIMultiSelectInteraction *)self _interactionDelegate];
      *a5 = objc_msgSend(v18, "shouldBeginMultiSelectInteraction:atPoint:withVelocity:", self, v13, v15, x, y);

      goto LABEL_9;
    }
    if (self->_multiFingerPan == v9)
    {
    }
    else
    {
      multiFingerTap = self->_multiFingerTap;

      if (multiFingerTap != (UITapGestureRecognizer *)v9) {
        goto LABEL_6;
      }
    }
    *a5 = -[UIMultiSelectInteraction _attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:](self, "_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:", v13, v15, x, y);
  }
LABEL_9:

  return (optionalDelegateFlags & 0x1000) == 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (_UISingleFingerTapExtensionGesture *)a3;
  if (self->_singleFingerExtensionTap == v4)
  {
    BOOL v10 = 1;
    goto LABEL_16;
  }
  id v5 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  int v6 = [v5 isInMultiSelectMode];

  char v7 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  int v8 = [v7 supportsMultiSelectInteraction:self];

  char v23 = v8;
  if (v6)
  {
    if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerTap == v4) {
      char v9 = 0;
    }
    else {
      char v9 = v8;
    }
    if ((v9 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else if (!v8)
  {
LABEL_7:
    BOOL v10 = 0;
    goto LABEL_16;
  }
  if ([(UITapGestureRecognizer *)v4 _isGestureType:8])
  {
    id v11 = v4;
    double v12 = [(UIMultiSelectInteraction *)self view];
    [(_UISingleFingerTapExtensionGesture *)v11 velocityInView:v12];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DAD8];
    double v16 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  if (-[UIMultiSelectInteraction _triggeredLegacyPathInsteadForGestureRecognizer:velocity:shouldBegin:](self, "_triggeredLegacyPathInsteadForGestureRecognizer:velocity:shouldBegin:", v4, &v23, v14, v16))
  {
    BOOL v10 = v23 != 0;
  }
  else
  {
    uint64_t v17 = [(UIMultiSelectInteraction *)self view];
    [(UITapGestureRecognizer *)v4 locationInView:v17];
    double v19 = v18;
    double v21 = v20;

    BOOL v10 = -[UIMultiSelectInteraction _shouldBeginInteractionWithGestureType:location:velocity:](self, "_shouldBeginInteractionWithGestureType:location:velocity:", [(UIMultiSelectInteraction *)self _gestureTypeForGestureInstance:v4], v19, v21, v14, v16);
  }
LABEL_16:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  int v6 = (_UIMultiSelectOneFingerPanGesture *)a3;
  id v7 = a4;
  int v8 = v7;
  BOOL v9 = (self->_multiSelectModePan == v6 || (_UIMultiSelectOneFingerPanGesture *)self->_multiFingerPan == v6)
    && ([v7 _isGestureType:8] & 1) != 0;

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  int v6 = (_UIMultiSelectOneFingerPanGesture *)a3;
  id v7 = (UITapGestureRecognizer *)a4;
  if (_isDragInteractionGestureRecognizer(v7))
  {
    BOOL v8 = 0;
  }
  else
  {
    multiFingerTap = self->_multiFingerTap;
    if (self->_multiSelectModePan == v6) {
      BOOL v8 = multiFingerTap != v7;
    }
    else {
      BOOL v8 = multiFingerTap == (UITapGestureRecognizer *)v6 || self->_multiFingerPan == (UIPanGestureRecognizer *)v6;
    }
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  int v6 = (_UISingleFingerTapExtensionGesture *)a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (!self->_enabled) {
    goto LABEL_14;
  }
  if (self->_singleFingerExtensionTap == v6)
  {
    unint64_t v15 = [(UIMultiSelectInteraction *)self _currentExtensionTypeForOneFingerTapGesture:v6];
    if (v15)
    {
      unint64_t v16 = v15;
      uint64_t v17 = [(UIMultiSelectInteraction *)self view];
      [v8 locationInView:v17];
      double v19 = v18;
      double v21 = v20;

      __int16 optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;
      if (v16 == 1 && (optionalDelegateFlags & 8) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v24 = objc_msgSend(WeakRetained, "shouldAllowSelectionAppendageAtPoint:", v19, v21);
LABEL_19:
        char v25 = v24;

        goto LABEL_15;
      }
      if ((optionalDelegateFlags & 2) != 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v24 = objc_msgSend(WeakRetained, "shouldAllowSelectionExtensionAtPoint:", v19, v21);
        goto LABEL_19;
      }
    }
LABEL_14:
    char v25 = 0;
    goto LABEL_15;
  }
  if ((_UISingleFingerTapExtensionGesture *)self->_multiFingerPan == v6)
  {
    if ((*(_WORD *)&self->_optionalDelegateFlags & 0x20) != 0)
    {
      char v14 = [v7 _originatesFromPointerEvent];
      goto LABEL_17;
    }
  }
  else if ((_UISingleFingerTapExtensionGesture *)self->_multiSelectModePan == v6 {
         && [v7 _originatesFromPointerEvent])
  }
  {
    BOOL v9 = [(UIMultiSelectInteraction *)self view];
    [v8 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    char v14 = -[UIMultiSelectInteraction _isBandSelectionAllowedAtPoint:](self, "_isBandSelectionAllowedAtPoint:", v11, v13);
LABEL_17:
    char v25 = v14 ^ 1;
    goto LABEL_15;
  }
  char v25 = 1;
LABEL_15:

  return v25;
}

- (BOOL)_isBandSelectionAllowedAtPoint:(CGPoint)a3
{
  if ((*(_WORD *)&self->_optionalDelegateFlags & 0x20) == 0) {
    return 0;
  }
  double y = a3.y;
  double x = a3.x;
  int v6 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  int v7 = [v6 supportsMultiSelectInteraction:self];

  if (!v7) {
    return 0;
  }
  if ((*(_WORD *)&self->_optionalDelegateFlags & 0x80) == 0) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_msgSend(WeakRetained, "multiSelectInteraction:shouldStartBandSelectionAtPoint:", self, x, y);

  return v10;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v10 = [(_UIMultiSelectOneFingerPanGesture *)self->_multiSelectModePan activeTouch];
  if (v10)
  {
    id v4 = [(UIMultiSelectInteraction *)self view];
    [v10 locationInView:v4];
    double v6 = v5;
    double v8 = v7;

    BOOL v9 = [(UIMultiSelectInteraction *)self _interactionDelegate];
    objc_msgSend(v9, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, v6, v8);
  }
}

- (void)_handleBandSelectionInteraction:(id)a3
{
  id v22 = a3;
  id v4 = [(UIMultiSelectInteraction *)self view];
  [v22 _locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  BOOL v9 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  uint64_t v10 = [v22 state];
  if (v10 == 3)
  {
    -[UIMultiSelectInteraction _endInteractionAtPoint:canceled:](self, "_endInteractionAtPoint:canceled:", 0, v6, v8);
  }
  else if (v10 == 2 || v10 == 1 && [v9 isInMultiSelectMode])
  {
    [v22 selectionRect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = [v22 initialModifierFlags];
    if ([(UIMultiSelectInteraction *)self _isActive])
    {
LABEL_14:
      if (v19 == 0x100000 && (*(_WORD *)&self->_optionalDelegateFlags & 0x40) != 0) {
        objc_msgSend(v9, "multiSelectInteraction:toggleSelectionWithinRect:leadingPoint:", self, v12, v14, v16, v18, v6, v8);
      }
      else {
        objc_msgSend(v9, "multiSelectInteraction:selectItemsWithinRect:leadingPoint:", self, v12, v14, v16, v18, v6, v8);
      }
      goto LABEL_19;
    }
    if (-[UIMultiSelectInteraction _shouldBeginInteractionWithGestureType:location:velocity:](self, "_shouldBeginInteractionWithGestureType:location:velocity:", 5, v6, v8, 1.0, 1.0))
    {
      BOOL v21 = v19 == 0x20000 || v19 == 0x100000;
      -[UIMultiSelectInteraction _beginInteractionWithTrigger:point:keepingSelection:](self, "_beginInteractionWithTrigger:point:keepingSelection:", v22, v21, v6, v8);
      goto LABEL_14;
    }
  }
LABEL_19:
}

- (void)_cancelScrollingInScrollView:(id)a3
{
  id v3 = [a3 panGestureRecognizer];
  if ([v3 isEnabled])
  {
    [v3 setEnabled:0];
    [v3 setEnabled:1];
  }
}

- (void)_cancelScrollingInViewForGesture:(id)a3
{
  id v4 = (_UIMultiSelectOneFingerPanGesture *)a3;
  if (self->_isScrollView && self->_multiSelectModePan != v4)
  {
    BOOL v9 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    if ((*(_WORD *)&self->_optionalDelegateFlags & 0x800) != 0)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_delegate);
      id v7 = objc_loadWeakRetained((id *)&self->_view);
      [(UIPanGestureRecognizer *)v9 locationInView:v7];
      double v8 = objc_msgSend(v6, "childScrollViewAtLocation:");

      [(UIMultiSelectInteraction *)self _cancelScrollingInScrollView:v8];
    }
    [(UIMultiSelectInteraction *)self _cancelScrollingInScrollView:WeakRetained];

    id v4 = v9;
  }
}

- (void)_handleCommonPanGestureStateChanged:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      [(UIMultiSelectInteraction *)self _beginCommonPan:v4];
      break;
    case 2:
      [(UIMultiSelectInteraction *)self _updateCommonPan:v4];
      break;
    case 3:
      [(UIMultiSelectInteraction *)self _endCommonPan:v4];
      break;
    case 4:
      [(UIMultiSelectInteraction *)self _cancelCommonPan:v4];
      break;
    default:
      break;
  }
}

- (void)_beginCommonPan:(id)a3
{
  id v9 = a3;
  id v4 = [(UIMultiSelectInteraction *)self view];
  [v9 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  -[UIMultiSelectInteraction _beginInteractionWithTrigger:point:keepingSelection:](self, "_beginInteractionWithTrigger:point:keepingSelection:", v9, 0, v6, v8);
}

- (void)_updateCommonPan:(id)a3
{
  id v4 = a3;
  double v5 = [(UIMultiSelectInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  objc_msgSend(v10, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, v7, v9);
}

- (void)_endCommonPan:(id)a3
{
  id v4 = a3;
  double v5 = [(UIMultiSelectInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  objc_msgSend(v10, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, v7, v9);

  -[UIMultiSelectInteraction _endInteractionAtPoint:canceled:](self, "_endInteractionAtPoint:canceled:", 0, v7, v9);
}

- (void)_cancelCommonPan:(id)a3
{
  id v4 = a3;
  double v5 = [(UIMultiSelectInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[UIMultiSelectInteraction _endInteractionAtPoint:canceled:](self, "_endInteractionAtPoint:canceled:", 1, v7, v9);
}

- (void)_didInvokeMultiSelectAppendGestureAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIMultiSelectInteraction *)self _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:1];
  -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", 1, x, y);
  double v6 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  objc_msgSend(v6, "multiSelectInteraction:appendSelectionAtPoint:", self, x, y);

  id v7 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  objc_msgSend(v7, "didEndMultiSelectInteraction:atPoint:", self, x, y);
}

- (void)_didInvokeMultiSelectExtendGestureAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(UIMultiSelectInteraction *)self _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:1];
  -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", 1, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8));
  double v6 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  objc_msgSend(v6, "multiSelectInteraction:toggleSelectionStateUpToPoint:", self, x, y);

  id v7 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  objc_msgSend(v7, "didEndMultiSelectInteraction:atPoint:", self, x, y);
}

- (void)_multiFingerTapGesture:(id)a3
{
  id v4 = a3;
  double v5 = [(UIMultiSelectInteraction *)self view];
  [v4 locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [v4 state];
  if (v10 == 3)
  {
    -[UIMultiSelectInteraction _didInvokeMultiSelectAppendGestureAtLocation:](self, "_didInvokeMultiSelectAppendGestureAtLocation:", v7, v9);
  }
}

- (void)_handleSelectionExtensionTapGesture:(id)a3
{
  id v10 = a3;
  id v4 = [(UIMultiSelectInteraction *)self view];
  [v10 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  if ([v10 state] == 3)
  {
    unint64_t v9 = [(UIMultiSelectInteraction *)self _currentExtensionTypeForOneFingerTapGesture:v10];
    if (v9 == 2)
    {
      -[UIMultiSelectInteraction _didInvokeMultiSelectExtendGestureAtLocation:](self, "_didInvokeMultiSelectExtendGestureAtLocation:", v6, v8);
    }
    else if (v9 == 1)
    {
      -[UIMultiSelectInteraction _didInvokeMultiSelectAppendGestureAtLocation:](self, "_didInvokeMultiSelectAppendGestureAtLocation:", v6, v8);
    }
  }
}

- (BOOL)_isActive
{
  return self->_activeGestureType != 8;
}

- (void)_beginInteractionWithTrigger:(id)a3 point:(CGPoint)a4 keepingSelection:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  id v13 = a3;
  if (![(UIMultiSelectInteraction *)self _isActive])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v13;
      int64_t v10 = [(UIMultiSelectInteraction *)self _gestureTypeForGestureInstance:v9];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = [v13 initialModifierFlags];
        id v9 = 0;
        uint64_t v12 = 5;
        if (v11 == 0x100000) {
          uint64_t v12 = 7;
        }
        if (v11 == 0x20000) {
          int64_t v10 = 6;
        }
        else {
          int64_t v10 = v12;
        }
      }
      else
      {
        id v9 = 0;
        int64_t v10 = 8;
      }
    }
    self->_activeGestureType = v10;
    [(UIMultiSelectInteraction *)self _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:v5];
    [(UIMultiSelectInteraction *)self _cancelScrollingInViewForGesture:v9];
    -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", v5, x, y);
    [(UIMultiSelectInteraction *)self _beginObservingScrollViewOffsetUpdates];
  }
}

- (void)_endInteractionAtPoint:(CGPoint)a3 canceled:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if ([(UIMultiSelectInteraction *)self _isActive])
  {
    [(UIMultiSelectInteraction *)self _endObservingScrollViewOffsetUpdates];
    if (v4)
    {
      if ((*(_WORD *)&self->_optionalDelegateFlags & 0x10) == 0)
      {
LABEL_7:
        self->_activeGestureType = 8;
        return;
      }
      double v8 = [(UIMultiSelectInteraction *)self _interactionDelegate];
      objc_msgSend(v8, "didCancelMultiSelectInteraction:atPoint:", self, x, y);
    }
    else
    {
      double v8 = [(UIMultiSelectInteraction *)self _interactionDelegate];
      objc_msgSend(v8, "didEndMultiSelectInteraction:atPoint:", self, x, y);
    }

    goto LABEL_7;
  }
}

- (BOOL)_shouldBeginInteractionWithGestureType:(int64_t)a3 location:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  uint64_t v11 = [(UIMultiSelectInteraction *)self _interactionDelegate];
  char v12 = [v11 isInMultiSelectMode];

  if ((v12 & 1) != 0 || (unint64_t)a3 > 5 || ((1 << a3) & 0x26) == 0)
  {
    id v13 = [(UIMultiSelectInteraction *)self _interactionDelegate];
    char v14 = objc_msgSend(v13, "shouldBeginMultiSelectInteraction:ofType:atPoint:withVelocity:", self, a3, v8, v7, x, y);

    return v14;
  }
  else
  {
    return -[UIMultiSelectInteraction _attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:](self, "_attemptToAutomaticallyTransitionToMultiSelectModeIfNecessaryAtPoint:withVelocity:", v8, v7, x, y);
  }
}

- (void)_handleKeyboardSelectionExtensionKeyCommand:(id)a3
{
  id v15 = a3;
  BOOL v4 = [(UIMultiSelectInteraction *)self _areSelectionExtensionKeyCommandsEnabled];
  BOOL v5 = v15;
  if (v4)
  {
    double v6 = [v15 input];
    if (v6 == @"UIKeyInputUpArrow")
    {
      uint64_t v9 = 2;
    }
    else
    {
      double v7 = [v15 input];
      if (v7 == @"UIKeyInputDownArrow")
      {
        uint64_t v9 = 1;
      }
      else
      {
        double v8 = [v15 input];
        uint64_t v9 = v8 == @"UIKeyInputRightArrow" ? 3 : 0;
      }
    }

    BOOL v5 = v15;
    if ((*(_WORD *)&self->_optionalDelegateFlags & 4) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ([WeakRetained shouldAllowSelectionExtensionAtIndexPath:0])
      {
        __int16 optionalDelegateFlags = (__int16)self->_optionalDelegateFlags;

        BOOL v5 = v15;
        if ((optionalDelegateFlags & 0x400) == 0) {
          goto LABEL_16;
        }
        [(UIMultiSelectInteraction *)self _askDelegateToAutomaticallyTransitionToMultiSelectModeKeepingSelection:1];
        double v12 = *MEMORY[0x1E4F1DB20];
        double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        -[UIMultiSelectInteraction _sendWillBeginInteractionAtPoint:keepingSelection:](self, "_sendWillBeginInteractionAtPoint:keepingSelection:", 1, *MEMORY[0x1E4F1DB20], v13);
        id v14 = objc_loadWeakRetained((id *)&self->_delegate);
        [v14 multiSelectInteraction:self extendSelectionInDirection:v9];

        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "didEndMultiSelectInteraction:atPoint:", self, v12, v13);
      }

      BOOL v5 = v15;
    }
  }
LABEL_16:
}

- (_UIMultiSelectOneFingerPanGesture)_multiSelectModePan
{
  return self->_multiSelectModePan;
}

- (void)set_multiSelectModePan:(id)a3
{
}

- (UIPanGestureRecognizer)_multiFingerPan
{
  return self->_multiFingerPan;
}

- (void)set_multiFingerPan:(id)a3
{
}

- (UITapGestureRecognizer)_multiFingerTap
{
  return self->_multiFingerTap;
}

- (void)set_multiFingerTap:(id)a3
{
}

- (_UISingleFingerTapExtensionGesture)_singleFingerExtensionTap
{
  return self->_singleFingerExtensionTap;
}

- (void)set_singleFingerExtensionTap:(id)a3
{
}

- (int64_t)activeGestureType
{
  return self->_activeGestureType;
}

- (UIMultiSelectInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIMultiSelectInteractionDelegate *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (UIBandSelectionInteraction)bandSelectionInteraction
{
  return self->_bandSelectionInteraction;
}

- (void)setBandSelectionInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bandSelectionInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_singleFingerExtensionTap, 0);
  objc_storeStrong((id *)&self->_multiFingerTap, 0);
  objc_storeStrong((id *)&self->_multiFingerPan, 0);
  objc_storeStrong((id *)&self->_multiSelectModePan, 0);
  objc_storeStrong((id *)&self->_extendToCellLeftCommand, 0);
  objc_storeStrong((id *)&self->_extendToCellRightCommand, 0);
  objc_storeStrong((id *)&self->_extendToCellBelowCommand, 0);
  objc_storeStrong((id *)&self->_extendToCellAboveCommand, 0);
}

@end