@interface UIVariableDelayLoupeGesture
- (BOOL)_allowsForShortDelay;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_tracksPointerTouch;
- (BOOL)isCloseToCaret;
- (BOOL)isLongPress;
- (BOOL)isWithinRecentTap;
- (BOOL)shouldUseLegacyBehavior;
- (UITextInput)textView;
- (UIVariableDelayLoupeGesture)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_startEnoughTimeElapsedTimer;
- (void)invalidate;
- (void)setTextView:(id)a3;
@end

@implementation UIVariableDelayLoupeGesture

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

- (UIVariableDelayLoupeGesture)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIVariableDelayLoupeGesture;
  v4 = [(UILongPressGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UILongPressGestureRecognizer *)v4 set_prefersToBeExclusiveWithCompetingLongPressGestureRecognizers:1];
    [(UILongPressGestureRecognizer *)v5 set_prefersNotToBePreventedByCompetingLongPressGestureRecognizers:1];
  }
  return v5;
}

- (BOOL)_allowsForShortDelay
{
  BOOL v3 = [(UIVariableDelayLoupeGesture *)self _tracksPointerTouch];
  v4 = [(UIVariableDelayLoupeGesture *)self textView];
  v5 = [(UIGestureRecognizer *)self view];

  char v6 = 0;
  if (v5 && v4)
  {
    if (v3
      || [v4 isEditing]
      && (![v4 _usesAsynchronousProtocol] || objc_msgSend(v4, "isEditable")))
    {
      objc_super v7 = [(UIVariableDelayLoupeGesture *)self textView];
      v8 = [v7 _selectionDisplayInteraction];
      char v9 = [v8 _isCursorAccessoryViewVisible];

      char v6 = v9 ^ 1;
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (BOOL)_tracksPointerTouch
{
  v2 = [(UILongPressGestureRecognizer *)self touches];
  BOOL v3 = [v2 firstObject];

  LOBYTE(v2) = [v3 _isPointerTouch];
  return (char)v2;
}

- (BOOL)isCloseToCaret
{
  v2 = self;
  BOOL v3 = [(UIVariableDelayLoupeGesture *)self textView];
  v4 = [v3 _proxyTextInput];
  v5 = [v4 textInputView];

  char v6 = [(UIVariableDelayLoupeGesture *)v2 textView];
  objc_super v7 = [v6 interactionAssistant];
  v8 = [v7 activeSelectionController];
  char v9 = [v8 selection];
  [v9 caretRect];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  [(UILongPressGestureRecognizer *)v2 locationInView:v5];
  LOBYTE(v2) = sqrt((v11 + v15 * 0.5 - v18) * (v11 + v15 * 0.5 - v18) + (v13 + v17 * 0.5 - v19)
                                                                      * (v13 + v17 * 0.5 - v19)) < 40.0;

  return (char)v2;
}

- (BOOL)isWithinRecentTap
{
  BOOL v3 = [(UIVariableDelayLoupeGesture *)self textView];
  v4 = [(UIGestureRecognizer *)self view];

  char v5 = 0;
  if (v4 && v3)
  {
    char v6 = objc_msgSend(v3, "__textInteractionFromAssistant");
    objc_super v7 = [v6 interactionWithClass:objc_opt_class()];
    char v5 = [v7 _isNowWithinRepeatedTapTime];
  }
  return v5;
}

- (BOOL)shouldUseLegacyBehavior
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v3 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    return 0;
  }
  int v5 = _UIInternalPreference_AllowLegacyForWK;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference_AllowLegacyForWK) {
    return 0;
  }
  while (v3 >= v5)
  {
    _UIInternalPreferenceSync(v3, &_UIInternalPreference_AllowLegacyForWK, @"AllowLegacyForWK", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    int v5 = _UIInternalPreference_AllowLegacyForWK;
    if (v3 == _UIInternalPreference_AllowLegacyForWK) {
      return 0;
    }
  }
  if (!byte_1E8FD54EC) {
    return 0;
  }
  char v6 = [(UIVariableDelayLoupeGesture *)self textView];
  objc_super v7 = [v6 _proxyTextInput];
  v8 = [v7 textInputView];

  LOBYTE(v6) = [v8 conformsToProtocol:&unk_1ED700D60];
  return (char)v6;
}

- (BOOL)isLongPress
{
  double v3 = CACurrentMediaTime();
  [(UIGestureRecognizer *)self lastTouchTimestamp];
  return v3 - v4 > 0.5;
}

- (void)_startEnoughTimeElapsedTimer
{
  BOOL v3 = [(UIVariableDelayLoupeGesture *)self _tracksPointerTouch];
  if (![(UIVariableDelayLoupeGesture *)self _allowsForShortDelay] || (double v4 = 0.0, !v3))
  {
    double v4 = 0.5;
    if ([(UIVariableDelayLoupeGesture *)self _allowsForShortDelay]
      && [(UIVariableDelayLoupeGesture *)self isCloseToCaret]
      && ![(UIVariableDelayLoupeGesture *)self isWithinRecentTap])
    {
      if ([(UIVariableDelayLoupeGesture *)self shouldUseLegacyBehavior]) {
        double v4 = 0.25;
      }
      else {
        double v4 = 0.07;
      }
    }
  }
  [(UILongPressGestureRecognizer *)self setDelay:v4];
  v5.receiver = self;
  v5.super_class = (Class)UIVariableDelayLoupeGesture;
  [(UILongPressGestureRecognizer *)&v5 _startEnoughTimeElapsedTimer];
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 6 || a3 == 1;
}

- (UITextInput)textView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textView);
  return (UITextInput *)WeakRetained;
}

- (void)invalidate
{
}

@end