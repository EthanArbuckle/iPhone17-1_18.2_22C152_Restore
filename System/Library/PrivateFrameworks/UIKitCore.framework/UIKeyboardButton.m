@interface UIKeyboardButton
- (UIKeyboardButton)initWithKeyboardButtonStyle:(int64_t)a3;
- (int64_t)keyboardButtonStyle;
@end

@implementation UIKeyboardButton

- (UIKeyboardButton)initWithKeyboardButtonStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardButton;
  result = [(UIView *)&v5 init];
  if (result) {
    result->_keyboardButtonStyle = a3;
  }
  return result;
}

- (int64_t)keyboardButtonStyle
{
  return self->_keyboardButtonStyle;
}

@end