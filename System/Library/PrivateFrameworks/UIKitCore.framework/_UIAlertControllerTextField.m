@interface _UIAlertControllerTextField
- (_UIAlertControllerTextFieldView)textFieldView;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setTextFieldView:(id)a3;
@end

@implementation _UIAlertControllerTextField

- (void)setSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerTextField;
  -[UITextField setSecureTextEntry:](&v5, sel_setSecureTextEntry_);
  if (v3) {
    [(_UIAlertControllerTextField *)self setShortcutConversionType:1];
  }
}

- (_UIAlertControllerTextFieldView)textFieldView
{
  return self->_textFieldView;
}

- (void)setTextFieldView:(id)a3
{
  self->_textFieldView = (_UIAlertControllerTextFieldView *)a3;
}

@end