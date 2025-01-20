@interface SKUISignInTextView
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardType;
- (int64_t)returnKeyType;
- (int64_t)spellCheckingType;
- (void)setKeyboardType:(int64_t)a3;
@end

@implementation SKUISignInTextView

- (int64_t)autocapitalizationType
{
  return 0;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)returnKeyType
{
  return 9;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

@end