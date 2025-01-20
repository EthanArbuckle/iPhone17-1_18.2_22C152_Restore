@interface UIKeyboardInputModeIndicatorController
+ (BOOL)enabled;
- (BOOL)enabled;
- (UIDelayedAction)dismissAction;
- (UIDelayedAction)idleAction;
- (UIKeyboardInputModeIndicatorControllerDelegate)delegate;
- (id)inputModeUpdateTime;
- (void)clear;
- (void)dismissIndicator;
- (void)hardwareKeyboardDettached;
- (void)idle;
- (void)inputModeChanged;
- (void)inputModeSelectorDidOpen;
- (void)keyPressed;
- (void)keyboardWindowEnabled:(BOOL)a3;
- (void)presentIndicatorWithReason:(id)a3 force:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setDismissAction:(id)a3;
- (void)setIdleAction:(id)a3;
- (void)showIndicatorWithReason:(id)a3 force:(BOOL)a4;
- (void)willResignActive;
@end

@implementation UIKeyboardInputModeIndicatorController

+ (BOOL)enabled
{
  return +[UIKeyboard isLanguageIndicatorEnabled];
}

- (BOOL)enabled
{
  int v3 = [(id)objc_opt_class() enabled];
  if (v3)
  {
    v4 = [(UIKeyboardInputModeIndicatorController *)self delegate];

    if (v4)
    {
      v5 = [(UIKeyboardInputModeIndicatorController *)self delegate];
      char v6 = [v5 keyboardInputModeIndicatorControllerShouldPresentIndicator:self];

      LOBYTE(v3) = v6;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)idle
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", &idle___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      char v6 = "-[UIKeyboardInputModeIndicatorController idle]";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  [(UIKeyboardInputModeIndicatorController *)self presentIndicatorWithReason:@"idle" force:0];
}

- (void)inputModeChanged
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", inputModeChanged___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      char v6 = "-[UIKeyboardInputModeIndicatorController inputModeChanged]";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  [(UIKeyboardInputModeIndicatorController *)self showIndicatorWithReason:@"input mode changed" force:1];
}

- (void)hardwareKeyboardDettached
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", hardwareKeyboardDettached___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      char v6 = "-[UIKeyboardInputModeIndicatorController hardwareKeyboardDettached]";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  [(UIKeyboardInputModeIndicatorController *)self clear];
}

- (void)keyboardWindowEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", &keyboardWindowEnabled____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    char v6 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = "N";
      if (v3) {
        uint64_t v7 = "Y";
      }
      int v8 = 136315394;
      v9 = "-[UIKeyboardInputModeIndicatorController keyboardWindowEnabled:]";
      __int16 v10 = 2080;
      v11 = v7;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%s enabled=%s", (uint8_t *)&v8, 0x16u);
    }
  }
  if (!v3) {
    [(UIKeyboardInputModeIndicatorController *)self clear];
  }
}

- (void)keyPressed
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", &keyPressed___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      char v6 = "-[UIKeyboardInputModeIndicatorController keyPressed]";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  [(UIKeyboardInputModeIndicatorController *)self dismissIndicator];
}

- (void)willResignActive
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", &willResignActive___s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    v4 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      char v6 = "-[UIKeyboardInputModeIndicatorController willResignActive]";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v5, 0xCu);
    }
  }
  [(UIKeyboardInputModeIndicatorController *)self clear];
}

- (void)inputModeSelectorDidOpen
{
  BOOL v3 = [(UIKeyboardInputModeIndicatorController *)self dismissAction];
  [v3 cancel];

  [(UIKeyboardInputModeIndicatorController *)self setDismissAction:0];
}

- (void)showIndicatorWithReason:(id)a3 force:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(UIKeyboardInputModeIndicatorController *)self presentIndicatorWithReason:a3 force:a4];
  int v5 = [(UIKeyboardInputModeIndicatorController *)self dismissAction];

  if (v5)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", &_MergedGlobals_926);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v9 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Reset dismiss timer.", (uint8_t *)&v11, 2u);
      }
    }
    uint64_t v7 = [(UIKeyboardInputModeIndicatorController *)self dismissAction];
    [(UIDelayedAction *)v7 touch];
  }
  else
  {
    unint64_t v8 = __UILogGetCategoryCachedImpl("InputModeIndicator", &qword_1EB25ED40);
    if (*(unsigned char *)v8)
    {
      __int16 v10 = *(NSObject **)(v8 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134217984;
        uint64_t v12 = 0x3FF8000000000000;
        _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Dismiss after %lf sec.", (uint8_t *)&v11, 0xCu);
      }
    }
    uint64_t v7 = [[UIDelayedAction alloc] initWithTarget:self action:sel_dismissIndicator userInfo:0 delay:1.5];
    [(UIKeyboardInputModeIndicatorController *)self setDismissAction:v7];
  }
}

- (void)presentIndicatorWithReason:(id)a3 force:(BOOL)a4
{
  id v13 = a3;
  if (presentIndicatorWithReason_force__onceToken != -1) {
    dispatch_once(&presentIndicatorWithReason_force__onceToken, &__block_literal_global_5);
  }
  char v6 = [(UIKeyboardInputModeIndicatorController *)self idleAction];
  [v6 cancel];

  [(UIKeyboardInputModeIndicatorController *)self setIdleAction:0];
  if (a4)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    v9 = [(UIKeyboardInputModeIndicatorController *)self inputModeUpdateTime];
    [v8 timeIntervalSinceDate:v9];
    double v11 = v10;

    BOOL v7 = v11 >= *(double *)&presentIndicatorWithReason_force__indicatorTimeout;
  }
  if ([(UIKeyboardInputModeIndicatorController *)self enabled] && !v7)
  {
    uint64_t v12 = [(UIKeyboardInputModeIndicatorController *)self delegate];
    [v12 keyboardInputModeIndicatorControllerPresentIndicator:self reason:v13];
  }
}

void __75__UIKeyboardInputModeIndicatorController_presentIndicatorWithReason_force___block_invoke()
{
  v0 = _UIKitUserDefaults();
  id v3 = [v0 objectForKey:@"UIKeyboardInputModeIndicatorTimeout"];

  v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    v1 = v3;
    presentIndicatorWithReason_force__indicatorTimeout = v2;
  }
}

- (void)dismissIndicator
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (qword_1EB25ED48 != -1) {
    dispatch_once(&qword_1EB25ED48, &__block_literal_global_15);
  }
  id v3 = [(UIKeyboardInputModeIndicatorController *)self dismissAction];
  [v3 cancel];

  [(UIKeyboardInputModeIndicatorController *)self setDismissAction:0];
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("InputModeIndicator", &qword_1EB25ED50);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    double v11 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Dismiss indicator.", (uint8_t *)&v14, 2u);
    }
  }
  int v5 = [(UIKeyboardInputModeIndicatorController *)self delegate];
  [v5 keyboardInputModeIndicatorControllerDismissIndicator:self];

  if ([(UIKeyboardInputModeIndicatorController *)self enabled])
  {
    char v6 = [(UIKeyboardInputModeIndicatorController *)self idleAction];

    if (v6)
    {
      unint64_t v7 = __UILogGetCategoryCachedImpl("InputModeIndicator", &qword_1EB25ED58);
      if (*(unsigned char *)v7)
      {
        uint64_t v12 = *(NSObject **)(v7 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v14) = 0;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Reset idle timer.", (uint8_t *)&v14, 2u);
        }
      }
      unint64_t v8 = [(UIKeyboardInputModeIndicatorController *)self idleAction];
      [(UIDelayedAction *)v8 touch];
    }
    else
    {
      unint64_t v9 = __UILogGetCategoryCachedImpl("InputModeIndicator", &qword_1EB25ED60);
      if (*(unsigned char *)v9)
      {
        id v13 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v14 = 134217984;
          uint64_t v15 = dismissIndicator_idleTime;
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Invoke idle action after %lf sec.", (uint8_t *)&v14, 0xCu);
        }
      }
      double v10 = [UIDelayedAction alloc];
      unint64_t v8 = [(UIDelayedAction *)v10 initWithTarget:self action:sel_idle userInfo:0 delay:*(double *)&dismissIndicator_idleTime];
      [(UIKeyboardInputModeIndicatorController *)self setIdleAction:v8];
    }
  }
}

void __58__UIKeyboardInputModeIndicatorController_dismissIndicator__block_invoke()
{
  v0 = _UIKitUserDefaults();
  id v3 = [v0 objectForKey:@"UIKeyboardInputModeIndicatorIdleTime"];

  v1 = v3;
  if (v3)
  {
    [v3 doubleValue];
    v1 = v3;
    dismissIndicator_idleTime = v2;
  }
}

- (void)clear
{
  [(UIKeyboardInputModeIndicatorController *)self dismissIndicator];
  id v3 = [(UIKeyboardInputModeIndicatorController *)self dismissAction];
  [v3 cancel];

  [(UIKeyboardInputModeIndicatorController *)self setDismissAction:0];
  v4 = [(UIKeyboardInputModeIndicatorController *)self idleAction];
  [v4 cancel];

  [(UIKeyboardInputModeIndicatorController *)self setIdleAction:0];
}

- (id)inputModeUpdateTime
{
  uint64_t v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 inputModeUpdateTime];

  return v3;
}

- (UIKeyboardInputModeIndicatorControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardInputModeIndicatorControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIDelayedAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
}

- (UIDelayedAction)idleAction
{
  return self->_idleAction;
}

- (void)setIdleAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleAction, 0);
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end