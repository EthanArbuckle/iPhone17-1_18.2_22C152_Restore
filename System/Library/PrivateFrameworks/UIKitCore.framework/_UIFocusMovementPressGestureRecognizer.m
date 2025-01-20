@interface _UIFocusMovementPressGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_isRecognizing;
- (BOOL)shouldReceiveEvent:(id)a3;
- (BOOL)shouldRepeat;
- (NSMutableOrderedSet)_trackedPresses;
- (_UIFocusMovementPressGestureRecognizer)initWithCoder:(id)a3;
- (_UIFocusMovementPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (_UIRepeatingGestureClock)repeatingClock;
- (int64_t)repeatCount;
- (unint64_t)focusHeading;
- (unint64_t)focusHeadingForPresses:(id)a3;
- (void)_setTrackedPresses:(id)a3;
- (void)_startTrackingPresses:(id)a3;
- (void)_stopTrackingPresses:(id)a3;
- (void)_updateForPresses:(id)a3 action:(unint64_t)a4;
- (void)_verifyTrackingPresses:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)repeatingGestureClockDidTick:(id)a3;
- (void)reset;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setFocusHeading:(unint64_t)a3;
- (void)setFocusHeading:(unint64_t)a3 omitStateUpdate:(BOOL)a4;
- (void)setRepeatCount:(int64_t)a3;
- (void)setRepeatingClock:(id)a3;
- (void)setShouldRepeat:(BOOL)a3;
@end

@implementation _UIFocusMovementPressGestureRecognizer

- (_UIFocusMovementPressGestureRecognizer)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  v3 = [(UIGestureRecognizer *)&v8 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(UIGestureRecognizer *)v5 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
    [(_UIFocusMovementPressGestureRecognizer *)v5 setAllowedTouchTypes:v6];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    *((unsigned char *)&v5->super._gestureFlags + 8) &= ~0x20u;
    [(_UIFocusMovementPressGestureRecognizer *)v5 configureDefaults];
  }
  return v4;
}

- (_UIFocusMovementPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
    [(UIGestureRecognizer *)v6 setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
    [(_UIFocusMovementPressGestureRecognizer *)v6 setAllowedTouchTypes:v7];
    [(UIGestureRecognizer *)v6 setCancelsTouchesInView:0];
    *((unsigned char *)&v6->super._gestureFlags + 8) &= ~0x20u;
    [(_UIFocusMovementPressGestureRecognizer *)v6 configureDefaults];
  }
  return v5;
}

- (BOOL)_isRecognizing
{
  return (unint64_t)([(UIGestureRecognizer *)self state] - 1) < 2;
}

- (NSMutableOrderedSet)_trackedPresses
{
  trackedPresses = self->_trackedPresses;
  if (!trackedPresses)
  {
    v4 = (NSMutableOrderedSet *)objc_opt_new();
    v5 = self->_trackedPresses;
    self->_trackedPresses = v4;

    trackedPresses = self->_trackedPresses;
  }
  return trackedPresses;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 17;
}

- (void)setAllowedTouchTypes:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UIFocusMovementPressGestureRecognizer.m" lineNumber:97 description:@"This gesture recognizer is not designed to work with touches."];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  [(UIGestureRecognizer *)&v7 setAllowedTouchTypes:v5];
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  return [a3 type] == 3;
}

- (void)setFocusHeading:(unint64_t)a3
{
}

- (void)setFocusHeading:(unint64_t)a3 omitStateUpdate:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_focusHeading == a3)
  {
    if (a3) {
      return;
    }
    UIGestureRecognizerState v5 = [(UIGestureRecognizer *)self state];
    goto LABEL_11;
  }
  self->_focusHeading = a3;
  if (!a3)
  {
    UIGestureRecognizerState v5 = [(UIGestureRecognizer *)self state];
    if ((unint64_t)(v5 - 1) < 2)
    {
      v11 = [(_UIFocusMovementPressGestureRecognizer *)self repeatingClock];
      [v11 stopClock];

      objc_super v9 = self;
      uint64_t v10 = 3;
LABEL_13:
      [(UIGestureRecognizer *)v9 setState:v10];
      return;
    }
LABEL_11:
    if (v5) {
      return;
    }
    objc_super v9 = self;
    uint64_t v10 = 5;
    goto LABEL_13;
  }
  [(_UIFocusMovementPressGestureRecognizer *)self setRepeatCount:0];
  objc_super v7 = [(_UIFocusMovementPressGestureRecognizer *)self repeatingClock];
  [v7 startClock];

  UIGestureRecognizerState v8 = [(UIGestureRecognizer *)self state];
  if ((unint64_t)(v8 - 3) >= 3)
  {
    if ((unint64_t)v8 > UIGestureRecognizerStateChanged || a4) {
      return;
    }
    objc_super v9 = self;
    uint64_t v10 = 2;
    goto LABEL_13;
  }
  v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &setFocusHeading_omitStateUpdate____s_category) + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = NSString;
    v14 = self;
    v15 = v12;
    v16 = (objc_class *)objc_opt_class();
    v17 = NSStringFromClass(v16);
    v18 = [v13 stringWithFormat:@"<%@: %p>", v17, v14];

    *(_DWORD *)buf = 138412290;
    v20 = v18;
    _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "%@ received a heading update while in an end state. This is considered an implementation error in the gesture recognizer.", buf, 0xCu);
  }
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusMovementPressGestureRecognizer;
  [(UIGestureRecognizer *)&v5 reset];
  v3 = [(_UIFocusMovementPressGestureRecognizer *)self repeatingClock];
  [v3 stopClock];

  v4 = [(_UIFocusMovementPressGestureRecognizer *)self _trackedPresses];
  [v4 removeAllObjects];

  [(_UIFocusMovementPressGestureRecognizer *)self setRepeatCount:0];
  self->_focusHeading = 0;
}

- (void)setShouldRepeat:(BOOL)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_shouldRepeat != a3)
  {
    BOOL v3 = a3;
    self->_shouldRepeat = a3;
    [(_UIFocusMovementPressGestureRecognizer *)self setRepeatCount:0];
    if (v3)
    {
      objc_super v5 = objc_opt_new();
      [v5 setDelegate:self];
      [(_UIFocusMovementPressGestureRecognizer *)self setRepeatingClock:v5];
      if ([(_UIFocusMovementPressGestureRecognizer *)self _isRecognizing])
      {
        uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("UIFocus", &setShouldRepeat____s_category) + 8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v7 = NSString;
          UIGestureRecognizerState v8 = self;
          objc_super v9 = v6;
          uint64_t v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          v12 = [v7 stringWithFormat:@"<%@: %p>", v11, v8];

          *(_DWORD *)buf = 138412290;
          v15 = v12;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Changed %@ to repeat while a gesture is recongizing. Repeating will start working on next recognition.", buf, 0xCu);
        }
      }
    }
    else
    {
      v13 = [(_UIFocusMovementPressGestureRecognizer *)self repeatingClock];
      [v13 stopClock];

      [(_UIFocusMovementPressGestureRecognizer *)self setRepeatingClock:0];
    }
  }
}

- (void)repeatingGestureClockDidTick:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([(_UIFocusMovementPressGestureRecognizer *)self _isRecognizing])
  {
    [(_UIFocusMovementPressGestureRecognizer *)self setRepeatCount:[(_UIFocusMovementPressGestureRecognizer *)self repeatCount] + 1];
    [(UIGestureRecognizer *)self setState:2];
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        if (self)
        {
          v12 = NSString;
          v13 = self;
          v14 = (objc_class *)objc_opt_class();
          v15 = NSStringFromClass(v14);
          v11 = [v12 stringWithFormat:@"<%@: %p>", v15, v13];
        }
        else
        {
          v11 = @"(nil)";
        }
        *(_DWORD *)buf = 138412546;
        v17 = v11;
        __int16 v18 = 1024;
        int v19 = [(UIGestureRecognizer *)self state];
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "%@ received a repeating clock tick while not in a recognizing state. Current state: %d", buf, 0x12u);
      }
    }
    else
    {
      v4 = *(id *)(__UILogGetCategoryCachedImpl("Assert", &repeatingGestureClockDidTick____s_category)+ 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        if (self)
        {
          objc_super v5 = NSString;
          uint64_t v6 = self;
          objc_super v7 = (objc_class *)objc_opt_class();
          UIGestureRecognizerState v8 = NSStringFromClass(v7);
          objc_super v9 = [v5 stringWithFormat:@"<%@: %p>", v8, v6];
        }
        else
        {
          objc_super v9 = @"(nil)";
        }
        uint64_t v10 = v9;
        *(_DWORD *)buf = 138412546;
        v17 = v9;
        __int16 v18 = 1024;
        int v19 = [(UIGestureRecognizer *)self state];
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%@ received a repeating clock tick while not in a recognizing state. Current state: %d", buf, 0x12u);
      }
    }
  }
}

- (unint64_t)focusHeadingForPresses:(id)a3
{
  return 0;
}

- (void)_startTrackingPresses:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFocusMovementPressGestureRecognizer *)self _trackedPresses];
  [v5 unionSet:v4];
}

- (void)_stopTrackingPresses:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIFocusMovementPressGestureRecognizer *)self _trackedPresses];
  [v5 minusSet:v4];
}

- (void)_verifyTrackingPresses:(id)a3
{
  id v5 = (void *)[a3 mutableCopy];
  uint64_t v6 = [(_UIFocusMovementPressGestureRecognizer *)self _trackedPresses];
  objc_super v7 = [v6 set];
  [v5 minusSet:v7];

  if ([v5 count])
  {
    [(id)UIApp _isSpringBoard];
    if (_UIIsPrivateMainBundle())
    {
      [(id)UIApp _isSpringBoard];
      [(id)UIApp _isSpringBoard];
    }
    if (dyld_program_sdk_at_least())
    {
      UIGestureRecognizerState v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"_UIFocusMovementPressGestureRecognizer.m" lineNumber:249 description:@"Found untracked presses that are not in the began phase."];
    }
    else if (os_variant_has_internal_diagnostics())
    {
      uint64_t v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Found untracked presses that are not in the began phase. This may leave views in an invalid state and user interaction might be impacted. This will become an assert in a future version.", buf, 2u);
      }
    }
    else
    {
      objc_super v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_verifyTrackingPresses____s_category) + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Found untracked presses that are not in the began phase. This may leave views in an invalid state and user interaction might be impacted. This will become an assert in a future version.", v11, 2u);
      }
    }
  }
}

- (void)_updateForPresses:(id)a3 action:(unint64_t)a4
{
  id v10 = a3;
  switch(a4)
  {
    case 2uLL:
      [(_UIFocusMovementPressGestureRecognizer *)self _verifyTrackingPresses:v10];
      break;
    case 1uLL:
      [(_UIFocusMovementPressGestureRecognizer *)self _verifyTrackingPresses:v10];
      [(_UIFocusMovementPressGestureRecognizer *)self _stopTrackingPresses:v10];
      break;
    case 0uLL:
      [(_UIFocusMovementPressGestureRecognizer *)self _startTrackingPresses:v10];
      break;
  }
  uint64_t v6 = [(_UIFocusMovementPressGestureRecognizer *)self _trackedPresses];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    UIGestureRecognizerState v8 = [(_UIFocusMovementPressGestureRecognizer *)self _trackedPresses];
    unint64_t v9 = [(_UIFocusMovementPressGestureRecognizer *)self focusHeadingForPresses:v8];

    [(_UIFocusMovementPressGestureRecognizer *)self setFocusHeading:v9 omitStateUpdate:a4 != 0];
  }
  else
  {
    [(_UIFocusMovementPressGestureRecognizer *)self setFocusHeading:0];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (BOOL)shouldRepeat
{
  return self->_shouldRepeat;
}

- (int64_t)repeatCount
{
  return self->_repeatCount;
}

- (void)setRepeatCount:(int64_t)a3
{
  self->_repeatCount = a3;
}

- (_UIRepeatingGestureClock)repeatingClock
{
  return self->_repeatingClock;
}

- (void)setRepeatingClock:(id)a3
{
}

- (void)_setTrackedPresses:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedPresses, 0);
  objc_storeStrong((id *)&self->_repeatingClock, 0);
}

@end