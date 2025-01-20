@interface VSTwoFactorEntryTextField
- (BOOL)autoShowKeyboard;
- (NSString)label;
- (NSString)text;
- (VSTwoFactorEntryTextField)init;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (unint64_t)expectedLength;
- (void)setAutoShowKeyboard:(BOOL)a3;
- (void)setAutocapitalizationType:(int64_t)a3;
- (void)setAutocorrectionType:(int64_t)a3;
- (void)setExpectedLength:(unint64_t)a3;
- (void)setKeyboardType:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setText:(id)a3;
@end

@implementation VSTwoFactorEntryTextField

- (VSTwoFactorEntryTextField)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSTwoFactorEntryTextField;
  v2 = [(VSTwoFactorEntryTextField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_autoShowKeyboard = 1;
    text = v2->_text;
    v2->_expectedLength = 0;
    v2->_text = (NSString *)&stru_26F361E90;
  }
  return v3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (unint64_t)expectedLength
{
  return self->_expectedLength;
}

- (void)setExpectedLength:(unint64_t)a3
{
  self->_expectedLength = a3;
}

- (BOOL)autoShowKeyboard
{
  return self->_autoShowKeyboard;
}

- (void)setAutoShowKeyboard:(BOOL)a3
{
  self->_autoShowKeyboard = a3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end