@interface SBUIPasscodeTextField
- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)showsSystemKeyboard;
- (void)_disableAutomaticAppearance;
- (void)_enableAutomaticAppearance;
- (void)_handleKeyUIEvent:(id)a3;
- (void)dealloc;
- (void)setShowsSystemKeyboard:(BOOL)a3;
@end

@implementation SBUIPasscodeTextField

- (void)_enableAutomaticAppearance
{
  v3 = +[SBUIKeyboardEnablementManager sharedInstance];
  [v3 enableAutomaticAppearanceForContext:self];

  if (self->_previousResponderRequiresKeyboard)
  {
    id v5 = [MEMORY[0x1E4F42C68] sharedInstance];
    v4 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v5 _restoreInputViewsWithId:v4 animated:1];
  }
}

- (void)_disableAutomaticAppearance
{
  if (self->_previousResponderRequiresKeyboard)
  {
    v3 = [MEMORY[0x1E4F42C68] sharedInstance];
    v4 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v3 _preserveInputViewsWithId:v4 animated:1];
  }
  id v5 = +[SBUIKeyboardEnablementManager sharedInstance];
  [v5 disableAutomaticAppearanceForContext:self];
}

- (void)dealloc
{
  [(SBUIPasscodeTextField *)self _enableAutomaticAppearance];
  v3.receiver = self;
  v3.super_class = (Class)SBUIPasscodeTextField;
  [(SBUIPasscodeTextField *)&v3 dealloc];
}

- (BOOL)becomeFirstResponder
{
  if (!self->_showsSystemKeyboard)
  {
    objc_super v3 = [MEMORY[0x1E4F43058] keyWindow];
    v4 = [v3 firstResponder];
    self->_previousResponderRequiresKeyboard = [v4 _requiresKeyboardWhenFirstResponder];

    [(SBUIPasscodeTextField *)self _disableAutomaticAppearance];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeTextField;
  BOOL v5 = [(SBUIPasscodeTextField *)&v7 becomeFirstResponder];
  if (!v5 && !self->_showsSystemKeyboard) {
    [(SBUIPasscodeTextField *)self _enableAutomaticAppearance];
  }
  return v5;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)SBUIPasscodeTextField;
  BOOL v3 = [(SBUIPasscodeTextField *)&v5 resignFirstResponder];
  if (v3 && !self->_showsSystemKeyboard) {
    [(SBUIPasscodeTextField *)self _enableAutomaticAppearance];
  }
  return v3;
}

- (void)_handleKeyUIEvent:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (![v4 _hidEvent])
  {
    [v5 _isKeyDown];
LABEL_9:
    v10.receiver = self;
    v10.super_class = (Class)SBUIPasscodeTextField;
    [(SBUIPasscodeTextField *)&v10 _handleKeyUIEvent:v5];
    goto LABEL_10;
  }
  v6 = BKSHIDEventGetBaseAttributes();
  int v7 = [v6 source];

  if (![v5 _isKeyDown] || (v7 & 0xFFFFFFFD) != 1) {
    goto LABEL_9;
  }
  v8 = [v5 _modifiedInput];
  if (([v8 isEqualToString:@"\r"] & 1) == 0
    && ![v8 isEqualToString:@"\n"])
  {

    goto LABEL_9;
  }
  v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 postNotificationName:@"SBUIHardwareKeyboardReturnKeyPressedNotification" object:self];

LABEL_10:
}

- (BOOL)showsSystemKeyboard
{
  return self->_showsSystemKeyboard;
}

- (void)setShowsSystemKeyboard:(BOOL)a3
{
  self->_showsSystemKeyboard = a3;
}

@end