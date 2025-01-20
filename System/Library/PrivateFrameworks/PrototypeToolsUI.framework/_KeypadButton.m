@interface _KeypadButton
- (_KeypadButton)initWithDigit:(unint64_t)a3 target:(id)a4;
- (_KeypadButton)initWithKeyType:(int64_t)a3 digit:(unint64_t)a4 target:(id)a5;
- (_KeypadButton)initWithKeyType:(int64_t)a3 target:(id)a4;
- (int64_t)keyType;
- (unint64_t)digit;
- (void)_updateBackgroundColor;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _KeypadButton

- (_KeypadButton)initWithKeyType:(int64_t)a3 digit:(unint64_t)a4 target:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)_KeypadButton;
  v9 = -[_KeypadButton initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v10 = v9;
  if (v9)
  {
    v9->_keyType = a3;
    v9->_digit = a4;
    [(_KeypadButton *)v9 addTarget:v8 action:sel_keyPress_ forControlEvents:64];
    switch(v10->_keyType)
    {
      case 0:
        objc_msgSend(NSString, "stringWithFormat:", @"%d", v10->_digit);
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        v11 = @".";
        break;
      case 2:
        v11 = @"+/-";
        break;
      case 3:
        v11 = @"C";
        break;
      case 4:
        v11 = @"⇦";
        break;
      default:
        v11 = 0;
        break;
    }
    [(_KeypadButton *)v10 setTitle:v11 forState:0];
    v12 = _KeypadForegroundColor();
    [(_KeypadButton *)v10 setTitleColor:v12 forState:0];

    v13 = _KeypadBackgroundColor();
    [(_KeypadButton *)v10 setTitleColor:v13 forState:1];

    v14 = [(_KeypadButton *)v10 titleLabel];
    v15 = [MEMORY[0x263F1C658] systemFontOfSize:16.0 weight:*MEMORY[0x263F1D340]];
    [v14 setFont:v15];

    v16 = [(_KeypadButton *)v10 layer];
    [v16 setCornerRadius:6.0];

    v17 = [(_KeypadButton *)v10 layer];
    [v17 setBorderWidth:1.0];

    v18 = [(_KeypadButton *)v10 layer];
    _KeypadForegroundColor();
    id v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBorderColor:", objc_msgSend(v19, "CGColor"));

    [(_KeypadButton *)v10 _updateBackgroundColor];
  }

  return v10;
}

- (_KeypadButton)initWithKeyType:(int64_t)a3 target:(id)a4
{
  return [(_KeypadButton *)self initWithKeyType:a3 digit:0x7FFFFFFFFFFFFFFFLL target:a4];
}

- (_KeypadButton)initWithDigit:(unint64_t)a3 target:(id)a4
{
  return [(_KeypadButton *)self initWithKeyType:0 digit:a3 target:a4];
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_KeypadButton;
  [(_KeypadButton *)&v4 setHighlighted:a3];
  [(_KeypadButton *)self _updateBackgroundColor];
}

- (void)_updateBackgroundColor
{
  if ([(_KeypadButton *)self isHighlighted]) {
    _KeypadForegroundColor();
  }
  else {
    _KeypadBackgroundColor();
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(_KeypadButton *)self setBackgroundColor:v3];
}

- (int64_t)keyType
{
  return self->_keyType;
}

- (unint64_t)digit
{
  return self->_digit;
}

@end