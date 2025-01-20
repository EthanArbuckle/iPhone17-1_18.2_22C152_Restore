@interface UITapGestureRecognizer
+ (BOOL)_supportsTouchContinuation;
+ (BOOL)supportsSecureCoding;
- (BOOL)_canHandleTouches;
- (BOOL)_delaysRecognitionForGreaterTapCounts;
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4;
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)isSingleKeyPressGesture;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (BOOL)tapIsPossibleForTapRecognizer:(id)a3;
- (CGPoint)_digitizerLocation;
- (CGPoint)centroid;
- (CGPoint)location;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4;
- (NSArray)touches;
- (NSUInteger)numberOfTapsRequired;
- (NSUInteger)numberOfTouchesRequired;
- (UIEventButtonMask)buttonMaskRequired;
- (UITapGestureRecognizer)initWithCoder:(id)a3;
- (UITapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_allowableSeparation;
- (double)_allowableTouchTimeSeparation;
- (double)_touchSloppinessFactor;
- (double)allowableMovement;
- (double)maximumIntervalBetweenSuccessiveTaps;
- (double)maximumSingleTapDuration;
- (double)maximumTapDuration;
- (int64_t)_buttonType;
- (int64_t)_finalStateForRecognition;
- (unint64_t)numberOfTouches;
- (void)_appendSubclassDescription:(id)a3;
- (void)_resetGestureRecognizer;
- (void)_setAllowableSeparation:(double)a3;
- (void)_setAllowableTouchTimeSeparation:(double)a3;
- (void)_setButtonType:(int64_t)a3;
- (void)_setDelaysRecognitionForGreaterTapCounts:(BOOL)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowableMovement:(double)a3;
- (void)setAllowedPressTypes:(id)a3;
- (void)setButtonMaskRequired:(UIEventButtonMask)buttonMaskRequired;
- (void)setIsSingleKeyPressGesture:(BOOL)a3;
- (void)setMaximumIntervalBetweenSuccessiveTaps:(double)a3;
- (void)setMaximumTapDuration:(double)a3;
- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired;
- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired;
- (void)tapRecognizerFailedToRecognizeTap:(id)a3;
- (void)tapRecognizerRecognizedTap:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UITapGestureRecognizer

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  if (self->_delaysRecognitionForGreaterTapCounts)
  {
    if ([a3 _isGestureType:0])
    {
      uint64_t v5 = [a3 numberOfTouchesRequired];
      if (v5 == [(UITapGestureRecognizer *)self numberOfTouchesRequired])
      {
        uint64_t v6 = [a3 buttonMaskRequired];
        if (v6 == [(UITapGestureRecognizer *)self buttonMaskRequired])
        {
          unint64_t v7 = [a3 numberOfTapsRequired];
          if (v7 > [(UITapGestureRecognizer *)self numberOfTapsRequired]) {
            return 1;
          }
        }
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)UITapGestureRecognizer;
  return [(UIGestureRecognizer *)&v9 shouldRequireFailureOfGestureRecognizer:a3];
}

- (double)_touchSloppinessFactor
{
  v2 = [(UIGestureRecognizer *)self view];
  [v2 _touchSloppinessFactor];
  double v4 = v3;

  return v4;
}

- (void)_resetGestureRecognizer
{
  [(UITapRecognizer *)self->_imp _reset];
  v3.receiver = self;
  v3.super_class = (Class)UITapGestureRecognizer;
  [(UIGestureRecognizer *)&v3 _resetGestureRecognizer];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([(UITapGestureRecognizer *)self _canHandleTouches])
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp touchesBegan:a3 withEvent:a4];
  }
  else
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  if ([a3 _isGestureType:0])
  {
    id v5 = a3;
    uint64_t v6 = [v5 numberOfTouchesRequired];
    if (v6 == [(UITapGestureRecognizer *)self numberOfTouchesRequired])
    {
      uint64_t v7 = [v5 buttonMaskRequired];
      if (v7 == [(UITapGestureRecognizer *)self buttonMaskRequired])
      {
        unint64_t v8 = [v5 numberOfTapsRequired];
        BOOL v9 = v8 > [(UITapGestureRecognizer *)self numberOfTapsRequired];
LABEL_9:

        return !v9;
      }
    }
    goto LABEL_8;
  }
  if ([a3 _isGestureType:1])
  {
    id v5 = a3;
    uint64_t v10 = [v5 numberOfTouchesRequired];
    if (v10 == [(UITapGestureRecognizer *)self numberOfTouchesRequired])
    {
      unint64_t v11 = [v5 numberOfTapsRequired];
      BOOL v9 = v11 >= [(UITapGestureRecognizer *)self numberOfTapsRequired];
      goto LABEL_9;
    }
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [a3 numberOfFullTaps];
    BOOL v9 = [(UITapGestureRecognizer *)self numberOfTapsRequired] <= v13;
  }
  else
  {
    BOOL v9 = 0;
  }
  return !v9;
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 0;
}

- (NSUInteger)numberOfTouchesRequired
{
  return [(UITapRecognizer *)self->_imp numberOfTouchesRequired];
}

- (NSUInteger)numberOfTapsRequired
{
  return [(UITapRecognizer *)self->_imp numberOfTapsRequired];
}

- (void).cxx_destruct
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(UITapGestureRecognizer *)self _canHandleTouches])
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp touchesEnded:a3 withEvent:a4];
  }
}

- (BOOL)_canHandleTouches
{
  return [(UITapGestureRecognizer *)self _buttonType] == -1;
}

- (int64_t)_buttonType
{
  v2 = [(UIGestureRecognizer *)self allowedPressTypes];
  if ([v2 count])
  {
    objc_super v3 = [v2 firstObject];
    int64_t v4 = [v3 integerValue];
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (UITapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UITapGestureRecognizer;
  int64_t v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  if (v4)
  {
    id v5 = objc_alloc_init(UITapRecognizer);
    imp = v4->_imp;
    v4->_imp = v5;

    [(UITapRecognizer *)v4->_imp setDelegate:v4];
    v4->_buttonType = -1;
  }
  return v4;
}

- (void)setAllowedPressTypes:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)UITapGestureRecognizer;
  [(UIGestureRecognizer *)&v14 setAllowedPressTypes:a3];
  imp = self->_imp;
  id v5 = [(UIGestureRecognizer *)self allowedPressTypes];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = -1;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v8) {
        objc_enumerationMutation(v5);
      }
      unint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * v10) integerValue];
      if (v11 != v9 && v11 <= 3)
      {
        BOOL v13 = v9 == -1;
        uint64_t v9 = v11;
        if (!v13) {
          break;
        }
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
  }
  uint64_t v9 = -1;
LABEL_16:
  [(UITapRecognizer *)imp setExclusiveDirectionalAxis:v9];
}

- (void)_appendSubclassDescription:(id)a3
{
  if ([(UITapRecognizer *)self->_imp numberOfTapsRequired] != 1) {
    objc_msgSend(a3, "appendFormat:", @"; numberOfTapsRequired = %ld",
  }
      [(UITapRecognizer *)self->_imp numberOfTapsRequired]);
  if ([(UITapRecognizer *)self->_imp numberOfTouchesRequired] != 1) {
    objc_msgSend(a3, "appendFormat:", @"; numberOfTouchesRequired = %ld",
  }
      [(UITapRecognizer *)self->_imp numberOfTouchesRequired]);
  if ([(UITapRecognizer *)self->_imp buttonMaskRequired] != 1) {
    objc_msgSend(a3, "appendFormat:", @"; buttonMaskRequired = %ld",
  }
      [(UITapRecognizer *)self->_imp buttonMaskRequired]);
}

- (void)setNumberOfTapsRequired:(NSUInteger)numberOfTapsRequired
{
}

- (void)setNumberOfTouchesRequired:(NSUInteger)numberOfTouchesRequired
{
}

- (void)setAllowableMovement:(double)a3
{
}

- (void)setMaximumTapDuration:(double)a3
{
}

- (void)_setAllowableTouchTimeSeparation:(double)a3
{
}

- (void)_setAllowableSeparation:(double)a3
{
}

- (void)setMaximumIntervalBetweenSuccessiveTaps:(double)a3
{
}

- (BOOL)tapIsPossibleForTapRecognizer:(id)a3
{
  return [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible;
}

- (void)tapRecognizerFailedToRecognizeTap:(id)a3
{
}

- (void)dealloc
{
  [(UITapRecognizer *)self->_imp setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)UITapGestureRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)tapRecognizerRecognizedTap:(id)a3
{
  p_locationInView = &self->_locationInView;
  uint64_t v6 = [(UIGestureRecognizer *)self view];
  [a3 locationInView:v6];
  p_locationInView->x = v7;
  p_locationInView->y = v8;

  int64_t v9 = [(UITapGestureRecognizer *)self _finalStateForRecognition];
  [(UIGestureRecognizer *)self setState:v9];
}

- (int64_t)_finalStateForRecognition
{
  objc_super v3 = [(UIGestureRecognizer *)self allowedPressTypes];
  uint64_t v4 = [v3 count];

  if (!v4) {
    return 3;
  }
  id v5 = [(UIGestureRecognizer *)self view];
  if ([(id)UIApp isFrontBoard])
  {
    uint64_t v6 = [v5 _window];
    int v7 = [v6 _isSystemGestureWindow] ^ 1;
  }
  else
  {
    int v7 = 1;
  }
  int64_t v9 = [v5 _focusSystem];
  uint64_t v10 = [v9 _focusedView];

  int64_t v8 = 3;
  if (v7 && v10)
  {
    if ([v10 isDescendantOfView:v5]) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = 5;
    }
  }

  return v8;
}

- (void)_setDelaysRecognitionForGreaterTapCounts:(BOOL)a3
{
  self->_delaysRecognitionForGreaterTapCounts = a3;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if ([(UITapGestureRecognizer *)self _canHandleTouches])
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp touchesMoved:a3 withEvent:a4];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UITapGestureRecognizer;
  -[UIGestureRecognizer encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeObject:self->_imp forKey:@"UITapGestureRecognizer._imp"];
}

- (UITapGestureRecognizer)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UITapGestureRecognizer;
  uint64_t v4 = -[UIGestureRecognizer initWithCoder:](&v10, sel_initWithCoder_);
  objc_super v5 = v4;
  if (v4)
  {
    v4->_buttonType = -1;
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"UITapGestureRecognizer._imp"];
    imp = v5->_imp;
    v5->_imp = (UITapRecognizer *)v6;

    [(UITapRecognizer *)v5->_imp setDelegate:v5];
    int64_t v8 = v5;
  }

  return v5;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(UITapGestureRecognizer *)self _canHandleTouches])
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp touchesCancelled:a3 withEvent:a4];
  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (-[UITapGestureRecognizer _shouldFailInResponseToPresses:withEvent:](self, "_shouldFailInResponseToPresses:withEvent:"))
  {
    [(UIGestureRecognizer *)self setState:5];
  }
  else
  {
    imp = self->_imp;
    [(UITapRecognizer *)imp pressesBegan:a3 withEvent:a4];
  }
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

- (BOOL)_shouldReceivePress:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UITapGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v10, sel__shouldReceivePress_))
  {
    BOOL v5 = 1;
  }
  else
  {
    int64_t v6 = [(UITapGestureRecognizer *)self _buttonType];
    BOOL v5 = v6 == [a3 type];
  }
  int v7 = [MEMORY[0x1E4F1CAD0] setWithObject:a3];
  BOOL v8 = [(UITapGestureRecognizer *)self _shouldFailInResponseToPresses:v7 withEvent:0];

  return v5 || v8;
}

- (BOOL)_shouldFailInResponseToPresses:(id)a3 withEvent:(id)a4
{
  if (self->_isSingleKeyPressGesture
    && ([(UIGestureRecognizer *)self allowedPressTypes],
        int64_t v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    BOOL v8 = [(UIGestureRecognizer *)self allowedPressTypes];
    int v9 = _UIPressesOnlyContainsPressTypes(a3, v8) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (NSArray)touches
{
  return [(UITapRecognizer *)self->_imp touches];
}

- (UIEventButtonMask)buttonMaskRequired
{
  return [(UITapRecognizer *)self->_imp buttonMaskRequired];
}

- (void)setButtonMaskRequired:(UIEventButtonMask)buttonMaskRequired
{
  if (buttonMaskRequired <= 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UITapGestureRecognizer.m" lineNumber:909 description:@"buttonMaskRequired must be greater than 0"];
  }
  imp = self->_imp;
  [(UITapRecognizer *)imp setButtonMaskRequired:buttonMaskRequired];
}

- (double)allowableMovement
{
  [(UITapRecognizer *)self->_imp allowableMovement];
  return result;
}

- (double)_allowableSeparation
{
  [(UITapRecognizer *)self->_imp allowableSeparation];
  return result;
}

- (double)_allowableTouchTimeSeparation
{
  [(UITapRecognizer *)self->_imp allowableTouchTimeSeparation];
  return result;
}

- (double)maximumSingleTapDuration
{
  return 0.75;
}

- (double)maximumTapDuration
{
  [(UITapRecognizer *)self->_imp maximumTapDuration];
  return result;
}

- (double)maximumIntervalBetweenSuccessiveTaps
{
  [(UITapRecognizer *)self->_imp maximumIntervalBetweenSuccessiveTaps];
  return result;
}

- (BOOL)_delaysRecognitionForGreaterTapCounts
{
  return self->_delaysRecognitionForGreaterTapCounts != 0;
}

- (void)_setButtonType:(int64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(UITapGestureRecognizer *)self _buttonType] != a3)
  {
    int64_t v6 = [(UIGestureRecognizer *)self view];

    if (v6)
    {
      int v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2 object:self file:@"UITapGestureRecognizer.m" lineNumber:984 description:@"_buttonType can't be changed after a gesture recognizer is added to a view"];
    }
    uint64_t v7 = [NSNumber numberWithInteger:a3];
    v10[0] = v7;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(UITapGestureRecognizer *)self setAllowedPressTypes:v8];
  }
}

- (CGPoint)centroid
{
  double x = self->_locationInView.x;
  double y = self->_locationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)location
{
  double x = self->_locationInView.x;
  double y = self->_locationInView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  [(UITapRecognizer *)self->_imp locationInView:a3];
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (unint64_t)numberOfTouches
{
  v2 = [(UITapRecognizer *)self->_imp touches];
  unint64_t v3 = [v2 count];

  return v3;
}

- (CGPoint)locationOfTouch:(unint64_t)a3 inView:(id)a4
{
  BOOL v8 = [(UITapRecognizer *)self->_imp touches];
  unint64_t v9 = [v8 count];

  if (v9 <= a3)
  {
    long long v16 = NSString;
    long long v17 = (objc_class *)objc_opt_class();
    long long v18 = NSStringFromClass(v17);
    v19 = NSStringFromSelector(a2);
    objc_super v10 = [v16 stringWithFormat:@"-[%@ %@]", v18, v19];

    uint64_t v20 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v21 = *MEMORY[0x1E4F1C4A8];
    v22 = [(UITapRecognizer *)self->_imp touches];
    [v20 raise:v21, @"%@: index (%ld) beyond bounds (%ld).", v10, a3, objc_msgSend(v22, "count") format];

    double v13 = *MEMORY[0x1E4F1DAD8];
    double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    objc_super v10 = [(UITapRecognizer *)self->_imp touches];
    unint64_t v11 = [v10 objectAtIndex:a3];
    [v11 locationInView:a4];
    double v13 = v12;
    double v15 = v14;
  }
  double v23 = v13;
  double v24 = v15;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (CGPoint)_digitizerLocation
{
  imp = self->_imp;
  if (imp)
  {
    double x = imp->_digitizerLocation.x;
    double y = imp->_digitizerLocation.y;
  }
  else
  {
    double y = 0.0;
    double x = 0.0;
  }
  result.double y = y;
  result.double x = x;
  return result;
}

+ (BOOL)_supportsTouchContinuation
{
  return 0;
}

- (BOOL)isSingleKeyPressGesture
{
  return self->_isSingleKeyPressGesture;
}

- (void)setIsSingleKeyPressGesture:(BOOL)a3
{
  self->_isSingleKeyPressGesture = a3;
}

@end