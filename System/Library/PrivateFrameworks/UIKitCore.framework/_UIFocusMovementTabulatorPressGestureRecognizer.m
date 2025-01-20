@interface _UIFocusMovementTabulatorPressGestureRecognizer
- (BOOL)_shouldReceivePress:(id)a3;
- (UIPress)trackingPress;
- (unint64_t)focusHeadingForPresses:(id)a3;
- (void)configureDefaults;
- (void)reset;
- (void)setTrackingPress:(id)a3;
@end

@implementation _UIFocusMovementTabulatorPressGestureRecognizer

- (void)configureDefaults
{
  [(UIGestureRecognizer *)self setAllowedPressTypes:&unk_1ED3F06E8];
  [(_UIFocusMovementPressGestureRecognizer *)self setShouldRepeat:1];
}

- (unint64_t)focusHeadingForPresses:(id)a3
{
  id v5 = a3;
  if ([v5 count] != 1) {
    goto LABEL_4;
  }
  uint64_t v6 = [(_UIFocusMovementTabulatorPressGestureRecognizer *)self trackingPress];
  if (!v6) {
    goto LABEL_4;
  }
  v7 = (void *)v6;
  v8 = [v5 firstObject];
  v9 = [(_UIFocusMovementTabulatorPressGestureRecognizer *)self trackingPress];

  if (v8 != v9)
  {
LABEL_4:
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"_UIFocusMovementTabulatorPressGestureRecognizer.m" lineNumber:32 description:@"Press tracking violation. Received a request for a press not tracked by this gesture recognizer."];
  }
  v11 = [v5 firstObject];
  uint64_t v12 = [v11 modifierFlags];
  unint64_t v13 = v12 & 0xFFFFFFFFFFFBFFFFLL;
  uint64_t v14 = 16;
  if ((v12 & 0xFFFFFFFFFFFBFFFFLL) == 0x20000) {
    uint64_t v14 = 32;
  }
  if (v13 == 0x20000 || v12 < 0 || v13 == 0) {
    unint64_t v16 = v14;
  }
  else {
    unint64_t v16 = 0;
  }

  return v16;
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusMovementTabulatorPressGestureRecognizer;
  [(_UIFocusMovementPressGestureRecognizer *)&v3 reset];
  [(_UIFocusMovementTabulatorPressGestureRecognizer *)self setTrackingPress:0];
}

- (BOOL)_shouldReceivePress:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFocusMovementTabulatorPressGestureRecognizer;
  if ([(UIGestureRecognizer *)&v8 _shouldReceivePress:v4]
    && ([(_UIFocusMovementTabulatorPressGestureRecognizer *)self trackingPress],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    [(_UIFocusMovementTabulatorPressGestureRecognizer *)self setTrackingPress:v4];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (UIPress)trackingPress
{
  return self->_trackingPress;
}

- (void)setTrackingPress:(id)a3
{
}

- (void).cxx_destruct
{
}

@end