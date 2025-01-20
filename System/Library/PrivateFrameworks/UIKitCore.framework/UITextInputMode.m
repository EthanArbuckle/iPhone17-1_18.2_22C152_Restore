@interface UITextInputMode
+ (BOOL)supportsSecureCoding;
+ (NSArray)activeInputModes;
+ (UITextInputMode)currentInputMode;
- (NSString)primaryLanguage;
- (UITextInputMode)initWithCoder:(id)a3;
@end

@implementation UITextInputMode

- (NSString)primaryLanguage
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = [(UITextInputMode *)self primaryLanguage];
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

+ (UITextInputMode)currentInputMode
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  v3 = [v2 currentInputMode];

  return (UITextInputMode *)v3;
}

+ (NSArray)activeInputModes
{
  v2 = +[UIKeyboardInputModeController sharedInputModeController];
  v3 = [v2 activeInputModes];

  return (NSArray *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UITextInputMode)initWithCoder:(id)a3
{
  id v4 = a3;

  v5 = [[UIKeyboardInputMode alloc] initWithCoder:v4];
  return &v5->super;
}

@end