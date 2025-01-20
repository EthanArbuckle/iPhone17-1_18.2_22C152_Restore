@interface SUScriptModalDialogResponse
- (NSString)textFieldValue;
- (int64_t)buttonIndex;
- (void)dealloc;
- (void)setButtonIndex:(int64_t)a3;
- (void)setTextFieldValue:(id)a3;
@end

@implementation SUScriptModalDialogResponse

- (void)dealloc
{
  self->_textFieldValue = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptModalDialogResponse;
  [(SUScriptModalDialogResponse *)&v3 dealloc];
}

- (int64_t)buttonIndex
{
  return self->_buttonIndex;
}

- (void)setButtonIndex:(int64_t)a3
{
  self->_buttonIndex = a3;
}

- (NSString)textFieldValue
{
  return self->_textFieldValue;
}

- (void)setTextFieldValue:(id)a3
{
}

@end