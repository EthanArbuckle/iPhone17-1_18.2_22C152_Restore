@interface UIDigitizerTapGestureRecognizer
- (CGPoint)digitizerLocation;
- (UIDigitizerTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)maximumPressDuration;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)pressesEndedSuccessfully:(id)a3;
- (void)pressesHeldOverMaximum:(id)a3;
- (void)pressesNotHeldLongEnough:(id)a3;
- (void)reset;
- (void)setAllowedPressTypes:(id)a3;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setMaximumPressDuration:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesBeganSuccessfully:(id)a3;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIDigitizerTapGestureRecognizer

- (UIDigitizerTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIDigitizerTapGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v17 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    v16.receiver = v4;
    v16.super_class = (Class)UIDigitizerTapGestureRecognizer;
    [(UIGestureRecognizer *)&v16 setAllowedPressTypes:&unk_1ED3EFBF0];
    v15.receiver = v5;
    v15.super_class = (Class)UIDigitizerTapGestureRecognizer;
    [(UIGestureRecognizer *)&v15 setAllowedTouchTypes:&unk_1ED3EFC08];
    v6 = objc_alloc_init(_UIDigitizerGestureRecognizerImp);
    imp = v5->_imp;
    v5->_imp = v6;

    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setDelegate:v5];
    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setMinimumPressDuration:0.0];
    int v8 = _UIInternalPreferenceUsesDefault_1((int *)algn_1EB257528, @"DigitizerTapGestureRecognizerDefaultDuration");
    double v9 = *(double *)&qword_1EB257530;
    if (v8) {
      double v9 = 0.5;
    }
    [(_UIDigitizerGestureRecognizerImp *)v5->_imp setMaximumPressDuration:v9];
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

- (void)touchesBeganSuccessfully:(id)a3
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
  UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self state];
  imp = self->_imp;
  if (v3 == UIGestureRecognizerStateEnded)
  {
    [(_UIDigitizerGestureRecognizerImp *)imp digitizerLocation];
  }
  else
  {
    [(_UIDigitizerGestureRecognizerImp *)imp defaultDigitizerLocation];
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (double)maximumPressDuration
{
  [(_UIDigitizerGestureRecognizerImp *)self->_imp maximumPressDuration];
  return result;
}

- (void)setMaximumPressDuration:(double)a3
{
}

- (void).cxx_destruct
{
}

@end