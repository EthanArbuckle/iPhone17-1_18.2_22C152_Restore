@interface UIDigitizerLongPressGestureRecognizer
- (CGPoint)digitizerLocation;
- (UIDigitizerLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)minimumPressDuration;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)pressesEndedSuccessfully:(id)a3;
- (void)pressesHeldForMinimum:(id)a3;
- (void)pressesHeldOverMaximum:(id)a3;
- (void)pressesNotHeldLongEnough:(id)a3;
- (void)reset;
- (void)setAllowedPressTypes:(id)a3;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setMinimumPressDuration:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIDigitizerLongPressGestureRecognizer

- (UIDigitizerLongPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIDigitizerLongPressGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v17 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v16.receiver = v4;
    v16.super_class = (Class)UIDigitizerLongPressGestureRecognizer;
    [(UIGestureRecognizer *)&v16 setAllowedPressTypes:&unk_1ED3EFC20];
    v15.receiver = v5;
    v15.super_class = (Class)UIDigitizerLongPressGestureRecognizer;
    [(UIGestureRecognizer *)&v15 setAllowedTouchTypes:&unk_1ED3EFC38];
    v6 = objc_alloc_init(_UIDigitizerGestureRecognizerImp);
    imp = v5->_imp;
    v5->_imp = v6;

    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setDelegate:v5];
    int v8 = _UIInternalPreferenceUsesDefault_1((int *)algn_1EB257538, @"DigitizerLongPressGestureRecognizerDefaultDuration");
    double v9 = *(double *)&qword_1EB257540;
    if (v8) {
      double v9 = 0.5;
    }
    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setMinimumPressDuration:v9];
    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setMaximumPressDuration:1.79769313e308];
    int v10 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_911, @"DigitizerGestureSloppinessDuration");
    double v11 = *(double *)&qword_1EB257520;
    if (v10) {
      double v11 = 0.05;
    }
    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setPressEndToTouchBeginDuration:v11];
    int v12 = _UIInternalPreferenceUsesDefault_1((int *)&_MergedGlobals_911, @"DigitizerGestureSloppinessDuration");
    double v13 = *(double *)&qword_1EB257520;
    if (v12) {
      double v13 = 0.05;
    }
    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setTouchEndToPressEndDuration:v13];
  }
  return v5;
}

- (void)setAllowedPressTypes:(id)a3
{
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_CannotBeConfig.isa, v4);
}

- (void)setAllowedTouchTypes:(id)a3
{
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(&cfstr_CannotBeConfig_0.isa, v4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
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

- (void)reset
{
}

- (void)pressesEndedSuccessfully:(id)a3
{
}

- (void)pressesHeldForMinimum:(id)a3
{
}

- (void)pressesNotHeldLongEnough:(id)a3
{
}

- (void)pressesHeldOverMaximum:(id)a3
{
}

- (CGPoint)digitizerLocation
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan
    || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged
    || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateEnded)
  {
    imp = self->_imp;
    [(_UIDigitizerGestureRecognizerImp *)imp digitizerLocation];
  }
  else
  {
    v6 = self->_imp;
    [(_UIDigitizerGestureRecognizerImp *)v6 defaultDigitizerLocation];
  }
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)minimumPressDuration
{
  [(_UIDigitizerGestureRecognizerImp *)self->_imp minimumPressDuration];
  return result;
}

- (void)setMinimumPressDuration:(double)a3
{
}

- (void).cxx_destruct
{
}

@end