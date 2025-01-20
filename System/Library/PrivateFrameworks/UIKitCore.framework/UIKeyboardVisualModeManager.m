@interface UIKeyboardVisualModeManager
+ (BOOL)softwareKeyboardAllowedForActiveKeyboardSceneDelegate;
+ (BOOL)softwareKeyboardAllowedOnExternalScreen;
+ (BOOL)windowingSoftwareKeyboardAllowed;
+ (id)visualModeLog;
- (BOOL)expectedInputModeIsSpecialized;
- (BOOL)shouldShowWithinAppWindow;
- (BOOL)textEntryFocusOnExternalDisplay;
- (BOOL)useVisualModeWindowed;
- (BOOL)windowingModeEnabled;
- (UIKeyboardVisualModeManager)init;
- (UIKeyboardVisualModeManagerDelegate)delegate;
- (int)lastVisualMode;
- (int)visualMode;
- (void)enhancedWindowingModeDidChange:(id)a3;
- (void)keyboardCameraNotification:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastVisualMode:(int)a3;
@end

@implementation UIKeyboardVisualModeManager

- (BOOL)windowingModeEnabled
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [(UIKeyboardVisualModeManager *)self delegate];

  if (v3)
  {
    v4 = [(UIKeyboardVisualModeManager *)self delegate];
    char v5 = [v4 enhancedWindowingModeIsEnabled];

    return v5;
  }
  else
  {
    v7 = +[UIKeyboardVisualModeManager visualModeLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      v9 = self;
      _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a datasource", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (UIKeyboardVisualModeManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardVisualModeManagerDelegate *)WeakRetained;
}

- (BOOL)shouldShowWithinAppWindow
{
  BOOL v3 = [(UIKeyboardVisualModeManager *)self useVisualModeWindowed];
  if (v3)
  {
    v4 = [(UIKeyboardVisualModeManager *)self delegate];
    char v5 = [v4 showingInAppWindow];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)useVisualModeWindowed
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardVisualModeManager *)self windowingModeEnabled];
  BOOL v4 = v3 && [(UIKeyboardVisualModeManager *)self visualMode] == 2;
  char v5 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7[0] = 67109376;
    v7[1] = v4;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "useVisualModeWindowed: %d (windowingModeEnabled: %d)", (uint8_t *)v7, 0xEu);
  }

  return v4;
}

+ (id)visualModeLog
{
  if (qword_1EB260828 != -1) {
    dispatch_once(&qword_1EB260828, &__block_literal_global_17_0);
  }
  v2 = (void *)qword_1EB260820;
  return v2;
}

- (void)setDelegate:(id)a3
{
}

- (UIKeyboardVisualModeManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardVisualModeManager;
  v2 = [(UIKeyboardVisualModeManager *)&v9 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_enhancedWindowingModeDidChange_ name:@"_UIWindowSceneEnhancedWindowingModeChanged" object:0];

    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel_keyboardCameraNotification_ name:@"_UIKeyboardCameraSessionWillPresent" object:0];

    char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v2 selector:sel_keyboardCameraNotification_ name:@"_UIKeyboardCameraSessionWillDismiss" object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v2 selector:sel_keyboardCameraNotification_ name:@"_UISubstituteKeyboardSessionWillPresent" object:0];

    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v2 selector:sel_keyboardCameraNotification_ name:@"_UISubstituteKeyboardSessionWillDismiss" object:0];
  }
  return v2;
}

void __44__UIKeyboardVisualModeManager_visualModeLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.UIKit", "KeyboardVisualMode");
  v1 = (void *)qword_1EB260820;
  qword_1EB260820 = (uint64_t)v0;
}

+ (BOOL)windowingSoftwareKeyboardAllowed
{
  return _os_feature_enabled_impl();
}

+ (BOOL)softwareKeyboardAllowedOnExternalScreen
{
  if (qword_1EB260818 != -1) {
    dispatch_once(&qword_1EB260818, &__block_literal_global_227);
  }
  return _MergedGlobals_1055;
}

void __70__UIKeyboardVisualModeManager_softwareKeyboardAllowedOnExternalScreen__block_invoke()
{
  if (qword_1EB260830 != -1) {
    dispatch_once(&qword_1EB260830, &__block_literal_global_50);
  }
  os_log_t v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v1 = [v0 valueForPreferenceKey:@"ChamoisExternalSWKeyboard"];

  _MergedGlobals_1055 = [v1 BOOLValue];
}

+ (BOOL)softwareKeyboardAllowedForActiveKeyboardSceneDelegate
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];

  if (!v3) {
    return 1;
  }
  BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v5 = [v4 visualModeManager];
  int v6 = [v5 windowingModeEnabled];

  v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v8 = [v7 isKeyboardOnEmbeddedScreen];

  if (v6) {
    int v9 = [a1 windowingSoftwareKeyboardAllowed];
  }
  else {
    int v9 = 1;
  }
  if ((v8 | v9 ^ 1)) {
    return v8 & v9;
  }
  return [a1 softwareKeyboardAllowedOnExternalScreen];
}

- (int)visualMode
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardVisualModeManager *)self windowingModeEnabled];
  BOOL v4 = +[UIKeyboardImpl activeInstance];

  char v5 = +[UIDevice currentDevice];
  unsigned int v27 = [v5 _isHardwareKeyboardAvailable];

  int v6 = +[UIKeyboardImpl activeInstance];
  unsigned int v24 = [v6 isMinimized];

  v7 = [(UIKeyboardVisualModeManager *)self delegate];
  unsigned int v25 = [v7 expectedInputViewSetIsCustom];

  BOOL v26 = [(UIKeyboardVisualModeManager *)self textEntryFocusOnExternalDisplay];
  BOOL v8 = [(UIKeyboardVisualModeManager *)self expectedInputModeIsSpecialized];
  int v9 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  if ([v9 wantsAssistantWhileSuppressingKeyboard])
  {
    uint64_t v10 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    unsigned int v11 = [v10 disableBecomeFirstResponder];
  }
  else
  {
    unsigned int v11 = 0;
  }

  v12 = +[UIKeyboardCameraSession activeSession];
  if ([v12 isPresented]) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = [v12 isPresenting];
  }
  v14 = +[UISubstituteKeyboardSession activeSession];
  if ([v14 isPresented])
  {
    BOOL v15 = 1;
    if (v3) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v17 = 1;
    goto LABEL_33;
  }
  BOOL v15 = [v14 isPresenting] != 0;
  if (!v3) {
    goto LABEL_14;
  }
LABEL_9:
  if (v4)
  {
    if (v27)
    {
      if ((v25 | v8) == 1) {
        int v16 = v26;
      }
      else {
        int v16 = v24;
      }
      goto LABEL_26;
    }
    v19 = [(UIKeyboardVisualModeManager *)self delegate];
    if (([v19 showingAccessoryViewOnly] & 1) == 0)
    {

      int v16 = v24 & v26 | v11;
LABEL_26:
      BOOL v20 = v16 == 0;
LABEL_27:
      if (v20) {
        unsigned int v18 = 1;
      }
      else {
        unsigned int v18 = 2;
      }
      goto LABEL_30;
    }
  }
  else
  {
    if (!v27)
    {
      BOOL v20 = v11 == 0;
      goto LABEL_27;
    }
    if (!v26)
    {
      if (v25 | v8) {
        unsigned int v18 = 1;
      }
      else {
        unsigned int v18 = 2;
      }
      goto LABEL_30;
    }
  }
  unsigned int v18 = 2;
LABEL_30:
  if (v13 | v15) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v18;
  }
LABEL_33:
  v21 = [NSString stringWithFormat:@"visualMode %u -> %u (chamois: %d, initialized: %d, hw kb: %d, sw kb min: %d, custom iv %d, isExternal: %d, kb cam: %d, specialized: %d, wantsAssistant: %d)", -[UIKeyboardVisualModeManager lastVisualMode](self, "lastVisualMode"), v17, v3, v4 != 0, v27, v24, v25, v26, v13, v8, v11];
  if ([(UIKeyboardVisualModeManager *)self lastVisualMode] != v17)
  {
    [(UIKeyboardVisualModeManager *)self setLastVisualMode:v17];
    v22 = +[UIKeyboardVisualModeManager visualModeLog];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v21;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
  }
  return v17;
}

- (void)enhancedWindowingModeDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (UIKeyboardVisualModeManager *)a3;
  char v5 = [(UIKeyboardVisualModeManager *)self delegate];

  int v6 = +[UIKeyboardVisualModeManager visualModeLog];
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = [(UIKeyboardVisualModeManager *)v4 userInfo];
      int v12 = 138412802;
      unsigned int v13 = v4;
      __int16 v14 = 2112;
      BOOL v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "enhancedWindowingModeChangeNotification: %@ info: %@ received by %@", (uint8_t *)&v12, 0x20u);
    }
    BOOL v9 = [(UIKeyboardVisualModeManager *)self windowingModeEnabled];
    uint64_t v10 = [(UIKeyboardVisualModeManager *)self delegate];
    [v10 visualModeManager:self observedEnhancedWindowingModeEnabledDidChange:v9];

    uint64_t v11 = [(UIKeyboardVisualModeManager *)self visualMode];
    v7 = [(UIKeyboardVisualModeManager *)self delegate];
    [v7 visualModeManager:self didChangeToMode:v11];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138412290;
    unsigned int v13 = self;
    _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a delegate", (uint8_t *)&v12, 0xCu);
  }
}

- (void)keyboardCameraNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(UIKeyboardVisualModeManager *)self delegate];

  if (v5)
  {
    int v6 = [(UIKeyboardVisualModeManager *)self delegate];
    int v7 = [v6 enhancedWindowingModeIsAvailable];

    BOOL v8 = +[UIKeyboardVisualModeManager visualModeLog];
    BOOL v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        int v12 = (UIKeyboardVisualModeManager *)"-[UIKeyboardVisualModeManager keyboardCameraNotification:]";
        __int16 v13 = 2112;
        id v14 = v4;
        __int16 v15 = 2112;
        __int16 v16 = self;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%s: %@ received by %@", (uint8_t *)&v11, 0x20u);
      }

      BOOL v9 = [(UIKeyboardVisualModeManager *)self delegate];
      [v9 visualModeManager:self didChangeToMode:[(UIKeyboardVisualModeManager *)self visualMode]];
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(UIKeyboardVisualModeManager *)self delegate];
      int v11 = 138412546;
      int v12 = self;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_INFO, "Ignoring Keyboard Camera notification for (%@), enhanced windowing is not available on (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    BOOL v9 = +[UIKeyboardVisualModeManager visualModeLog];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      int v12 = self;
      _os_log_error_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a delegate", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)textEntryFocusOnExternalDisplay
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardVisualModeManager *)self delegate];

  if (v3)
  {
    id v4 = [(UIKeyboardVisualModeManager *)self delegate];
    char v5 = [v4 textEntryFocusOnExternalDisplay];

    return v5;
  }
  else
  {
    int v7 = +[UIKeyboardVisualModeManager visualModeLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      BOOL v9 = self;
      _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a datasource", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (BOOL)expectedInputModeIsSpecialized
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardVisualModeManager *)self delegate];

  if (v3)
  {
    id v4 = [(UIKeyboardVisualModeManager *)self delegate];
    char v5 = [v4 expectedInputModeIsSpecialized];

    return v5;
  }
  else
  {
    int v7 = +[UIKeyboardVisualModeManager visualModeLog];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      BOOL v9 = self;
      _os_log_error_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Invalid UIKeyboardVisualModeManager (%@) configured without a datasource", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
}

- (int)lastVisualMode
{
  return self->_lastVisualMode;
}

- (void)setLastVisualMode:(int)a3
{
  self->_lastVisualMode = a3;
}

- (void).cxx_destruct
{
}

@end