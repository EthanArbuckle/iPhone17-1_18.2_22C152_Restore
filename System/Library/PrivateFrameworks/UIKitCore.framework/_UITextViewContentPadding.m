@interface _UITextViewContentPadding
- (_UITextViewContentPadding)initWithDelegate:(id)a3;
- (_UITextViewContentPaddingDelegate)delegate;
- (double)currentValue;
- (double)targetValue;
- (id)description;
- (int64_t)mode;
- (void)_checkNewCurrentValue;
- (void)increaseToValue:(double)targetValue;
- (void)resetCurrentValue;
- (void)setDelegate:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setTargetValue:(double)a3;
@end

@implementation _UITextViewContentPadding

- (double)targetValue
{
  return self->_targetValue;
}

- (void).cxx_destruct
{
}

- (_UITextViewContentPadding)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UITextViewContentPadding;
  v5 = [(_UITextViewContentPadding *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (void)setMode:(int64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(_UITextViewContentPadding *)self _checkNewCurrentValue];
  }
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setTargetValue:(double)a3
{
  if (a3 < 0.0) {
    a3 = 0.0;
  }
  if (a3 != self->_targetValue)
  {
    self->_targetValue = a3;
    [(_UITextViewContentPadding *)self _checkNewCurrentValue];
  }
}

- (void)_checkNewCurrentValue
{
  double targetValue = self->_targetValue;
  double currentValue = self->_currentValue;
  if (self->_mode != 1)
  {
    if (currentValue == targetValue) {
      return;
    }
    goto LABEL_7;
  }
  if (currentValue < targetValue) {
    double targetValue = self->_currentValue;
  }
  if (currentValue > targetValue)
  {
LABEL_7:
    self->_double currentValue = targetValue;
    id v5 = [(_UITextViewContentPadding *)self delegate];
    [v5 _textViewContentPaddingDidChange:self];
  }
}

- (_UITextViewContentPaddingDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UITextViewContentPaddingDelegate *)WeakRetained;
}

- (void)increaseToValue:(double)targetValue
{
  if (self->_mode == 1)
  {
    if (self->_targetValue <= targetValue) {
      double targetValue = self->_targetValue;
    }
    if (targetValue > self->_currentValue)
    {
      self->_double currentValue = targetValue;
      id v4 = [(_UITextViewContentPadding *)self delegate];
      [v4 _textViewContentPaddingDidChange:self];
    }
  }
}

- (void)resetCurrentValue
{
  if (self->_mode == 1 && self->_currentValue != 0.0)
  {
    self->_double currentValue = 0.0;
    id v3 = [(_UITextViewContentPadding *)self delegate];
    [v3 _textViewContentPaddingDidChange:self];
  }
}

- (id)description
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = +[UIDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = v3;
  if (self->_mode) {
    id v5 = @"flexible";
  }
  else {
    id v5 = @"fixed";
  }
  id v6 = (id)[v3 appendName:@"mode" object:v5];
  v7 = NSStringFromSelector(sel_currentValue);
  v13[0] = v7;
  objc_super v8 = NSStringFromSelector(sel_targetValue);
  v13[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v10 = (id)[v4 appendKeys:v9];

  v11 = [v4 string];

  return v11;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setDelegate:(id)a3
{
}

@end