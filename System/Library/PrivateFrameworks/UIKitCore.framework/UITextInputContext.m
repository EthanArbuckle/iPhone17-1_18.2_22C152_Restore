@interface UITextInputContext
+ (UITextInputContext)current;
+ (UITextInputContext)new;
- (BOOL)isDictationInputExpected;
- (BOOL)isHardwareKeyboardInputExpected;
- (BOOL)isPencilInputExpected;
- (void)setDictationInputExpected:(BOOL)dictationInputExpected;
- (void)setHardwareKeyboardInputExpected:(BOOL)hardwareKeyboardInputExpected;
- (void)setPencilInputExpected:(BOOL)pencilInputExpected;
- (void)updateInputSource:(int64_t)a3 toUpdate:(BOOL)a4;
@end

@implementation UITextInputContext

+ (UITextInputContext)new
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___UITextInputContext;
  return (UITextInputContext *)objc_msgSendSuper2(&v3, sel_new);
}

+ (UITextInputContext)current
{
  v2 = objc_opt_new();
  return (UITextInputContext *)v2;
}

- (BOOL)isPencilInputExpected
{
  v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  BOOL v3 = [v2 lastEventSource] == 3;

  return v3;
}

- (void)setPencilInputExpected:(BOOL)pencilInputExpected
{
}

- (BOOL)isDictationInputExpected
{
  v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  BOOL v3 = [v2 lastEventSource] == 2;

  return v3;
}

- (void)setDictationInputExpected:(BOOL)dictationInputExpected
{
}

- (BOOL)isHardwareKeyboardInputExpected
{
  v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  BOOL v3 = [v2 lastEventSource] == 4;

  return v3;
}

- (void)setHardwareKeyboardInputExpected:(BOOL)hardwareKeyboardInputExpected
{
}

- (void)updateInputSource:(int64_t)a3 toUpdate:(BOOL)a4
{
  if (!a4)
  {
    v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    int64_t v6 = [v5 lastEventSource];

    if (v6 == a3) {
      a3 = 0;
    }
    else {
      a3 = v6;
    }
  }
  id v7 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v7 updateEventSource:a3 options:15];
}

@end