@interface UIIndicatorInputSwitcher
- (BOOL)isVisible;
- (BOOL)isVisibleOrHiding;
- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5;
- (UITextCursorAssertion)inputModeAssertion;
- (UITextCursorAssertion)inputModeSelectorAssertion;
- (void)dismissSwitcher:(BOOL)a3;
- (void)dismissSwitcherWithDelay:(double)a3;
- (void)setInputModeAssertion:(id)a3;
- (void)setInputModeSelectorAssertion:(id)a3;
@end

@implementation UIIndicatorInputSwitcher

- (BOOL)isVisible
{
  return self->super.super.m_state != 0;
}

- (BOOL)isVisibleOrHiding
{
  v2 = [(UIIndicatorInputSwitcher *)self inputModeSelectorAssertion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dismissSwitcher:(BOOL)a3
{
  v4 = [(UIIndicatorInputSwitcher *)self inputModeSelectorAssertion];
  [v4 invalidate];

  [(UIIndicatorInputSwitcher *)self setInputModeSelectorAssertion:0];
  v5 = [(UIIndicatorInputSwitcher *)self inputModeAssertion];
  [v5 invalidate];

  [(UIIndicatorInputSwitcher *)self setInputModeAssertion:0];
}

- (void)dismissSwitcherWithDelay:(double)a3
{
  self->super.super.m_state = 0;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__UIIndicatorInputSwitcher_dismissSwitcherWithDelay___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __53__UIIndicatorInputSwitcher_dismissSwitcherWithDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissSwitcher:0];
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  BOOL v5 = a4;
  v26[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  [(UIInlineInputSwitcher *)self updateInputModes:v7 withHUD:v5];
  v8 = [(UIInlineInputSwitcher *)self availableInputModes];
  uint64_t v9 = [v8 count];

  if (!v9) {
    goto LABEL_13;
  }
  [(UIInputSwitcher *)self setLoadedIdentifier:v7];
  int m_state = self->super.super.m_state;
  if (m_state != 2)
  {
    if (m_state != 1)
    {
      if (!m_state)
      {
        [(UIInputSwitcher *)self touchShowSwitcherTimer];
        self->super.super.int m_state = 1;
      }
      goto LABEL_8;
    }
    self->super.super.int m_state = 2;
  }
  [(UIInputSwitcher *)self cancelShowSwitcherTimer];
LABEL_8:
  v11 = [(UIIndicatorInputSwitcher *)self inputModeAssertion];

  if (!v11)
  {
    v12 = +[UIKeyboardImpl activeInstance];
    v13 = [v12 _activeAssertionController];
    v14 = [v13 activeInputModeAssertionWithReason:@"UIInputSwitcher"];
    [(UIIndicatorInputSwitcher *)self setInputModeAssertion:v14];
  }
  v15 = [(UIIndicatorInputSwitcher *)self inputModeSelectorAssertion];

  if (!v15)
  {
    BOOL v16 = +[UIDictationController isRunning];
    v17 = +[UIKeyboardImpl activeInstance];
    v18 = [v17 _activeAssertionController];
    v25[0] = @"_UITextCursorKeyboardIndicatorUserInfoKey";
    v19 = [NSNumber numberWithBool:v16];
    v25[1] = @"_UITextCursorInputModeSwitcherUserInfoKey";
    v26[0] = v19;
    v26[1] = MEMORY[0x1E4F1CC38];
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];
    v21 = [v18 inputModeSelectorAssertionWithReason:@"UIInputSwticher" userInfo:v20];
    [(UIIndicatorInputSwitcher *)self setInputModeSelectorAssertion:v21];
  }
  v22 = +[UIKeyboardImpl activeInstance];
  v23 = [v22 _activeAssertionController];
  [v23 _updateSubjectWithAssertionState];

LABEL_13:
  return v9 != 0;
}

- (UITextCursorAssertion)inputModeSelectorAssertion
{
  return self->_inputModeSelectorAssertion;
}

- (void)setInputModeSelectorAssertion:(id)a3
{
}

- (UITextCursorAssertion)inputModeAssertion
{
  return self->_inputModeAssertion;
}

- (void)setInputModeAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputModeAssertion, 0);
  objc_storeStrong((id *)&self->_inputModeSelectorAssertion, 0);
}

@end