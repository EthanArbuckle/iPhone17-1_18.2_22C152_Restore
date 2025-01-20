@interface UIInputSwitcher
+ (id)activeInstance;
+ (id)sharedInstance;
- (BOOL)dismissingEmojiPopover;
- (BOOL)handleEmojiPicker;
- (BOOL)handleGlobeKeyEvent:(id)a3 switcherIsVisible:(BOOL)a4;
- (BOOL)handleModifiersChangedEvent:(id)a3;
- (BOOL)handleNavigationEvent:(id)a3;
- (BOOL)handleSwitchCommand:(BOOL)a3;
- (BOOL)handleSwitchCommand:(BOOL)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5;
- (BOOL)handleSwitchingKeyEvent:(id)a3;
- (BOOL)isVisible;
- (BOOL)isVisibleOrHiding;
- (BOOL)needsFullHUD;
- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5;
- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5 fromCapsLock:(BOOL)a6;
- (BOOL)usingCapsLockLanguageSwitch;
- (NSString)loadedIdentifier;
- (UIInputSwitcher)init;
- (id)availableInputModes;
- (id)inputModeIdentifierWithNextFlag:(BOOL)a3;
- (id)nextInputMode;
- (id)previousInputMode;
- (id)selectedInputMode;
- (void)cancelHideSwitcherTimer;
- (void)cancelShowSwitcherTimer;
- (void)cleanUpAfterHide;
- (void)clearHideSwitcherTimer;
- (void)clearShowSwitcherTimer;
- (void)dealloc;
- (void)dismissSwitcher:(BOOL)a3;
- (void)dismissSwitcherWithDelay:(double)a3;
- (void)hideSwitcher;
- (void)hideSwitcherIfNeeded;
- (void)reloadInputModes;
- (void)setDismissingEmojiPopover:(BOOL)a3;
- (void)setLoadedIdentifier:(id)a3;
- (void)setSelectedInputMode:(id)a3;
- (void)setShowingCapsLockSwitcher:(BOOL)a3;
- (void)setUsingCapsLockLanguageSwitch:(BOOL)a3;
- (void)showSwitcherShouldAutoHide:(BOOL)a3;
- (void)showSwitcherWithAutoHide;
- (void)showSwitcherWithoutAutoHide;
- (void)touchHideSwitcherTimer;
- (void)touchShowSwitcherTimer;
- (void)updateHardwareLayout;
@end

@implementation UIInputSwitcher

+ (id)sharedInstance
{
  if (+[UIKeyboard isLanguageIndicatorEnabled])
  {
    v2 = &qword_1EB25D510;
    v3 = (void *)qword_1EB25D510;
    if (qword_1EB25D510) {
      goto LABEL_7;
    }
    v4 = off_1E52D3AF0;
  }
  else
  {
    v2 = &qword_1EB25D518;
    v3 = (void *)qword_1EB25D518;
    if (qword_1EB25D518) {
      goto LABEL_7;
    }
    v4 = off_1E52D3A30;
  }
  id v5 = objc_alloc_init(*v4);
  v6 = (void *)*v2;
  uint64_t *v2 = (uint64_t)v5;

  v3 = (void *)*v2;
LABEL_7:
  objc_storeStrong((id *)&_MergedGlobals_7_3, v3);
  v7 = (void *)*v2;
  return v7;
}

+ (id)activeInstance
{
  return (id)_MergedGlobals_7_3;
}

- (UIInputSwitcher)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIInputSwitcher;
  v2 = [(UIInputSwitcher *)&v5 init];
  if (v2)
  {
    v2->m_lastGlobeKeyUpTime = CFAbsoluteTimeGetCurrent() + -10.0;
    v2->m_state = 0;
    v3 = v2;
  }

  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIWindowWillRotateNotification" object:0];

  [(UIInputSwitcher *)self setLoadedIdentifier:0];
  [(UIInputSwitcher *)self clearShowSwitcherTimer];
  [(UIInputSwitcher *)self clearHideSwitcherTimer];
  v4.receiver = self;
  v4.super_class = (Class)UIInputSwitcher;
  [(UIInputSwitcher *)&v4 dealloc];
}

- (void)hideSwitcher
{
  [(UIInputSwitcher *)self cancelHideSwitcherTimer];
  [(UIInputSwitcher *)self cancelShowSwitcherTimer];
  id v11 = [(UIInputSwitcher *)self selectedInputMode];
  if (!v11) {
    goto LABEL_9;
  }
  v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  objc_super v4 = [v3 inputViews];
  if ([v4 isCustomInputView])
  {
    objc_super v5 = +[UIKeyboardInputModeController sharedInputModeController];
    v6 = [v5 inputModeWithIdentifier:v11];
    v7 = [v6 hardwareLayout];

    if (!v7) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  v8 = +[UIKeyboardImpl activeInstance];
  [v8 setInputMode:v11 userInitiated:1];

  v9 = +[UIKeyboardImpl activeInstance];
  int v10 = [v9 isInHardwareKeyboardMode];

  if (v10 && ([v11 containsString:@"emoji"] & 1) != 0)
  {
    [(UIInputSwitcher *)self dismissSwitcher:1];
    goto LABEL_10;
  }
LABEL_9:
  [(UIInputSwitcher *)self dismissSwitcherWithDelay:0.0];
LABEL_10:
  [(UIInputSwitcher *)self cleanUpAfterHide];
}

- (void)cleanUpAfterHide
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  self->m_state = 0;
  [(UIInputSwitcher *)self clearShowSwitcherTimer];
}

- (void)cancelHideSwitcherTimer
{
  m_hideSwitcherDelay = self->m_hideSwitcherDelay;
  if (m_hideSwitcherDelay) {
    [(UIDelayedAction *)m_hideSwitcherDelay cancel];
  }
}

- (void)touchHideSwitcherTimer
{
  [(UIInputSwitcher *)self setShowingCapsLockSwitcher:[(UIInputSwitcher *)self usingCapsLockLanguageSwitch]];
  if ([(UIInputSwitcher *)self usingCapsLockLanguageSwitch]) {
    double v3 = 0.5;
  }
  else {
    double v3 = 1.0;
  }
  m_hideSwitcherDelay = self->m_hideSwitcherDelay;
  if (m_hideSwitcherDelay)
  {
    [(UIDelayedAction *)m_hideSwitcherDelay touchWithDelay:v3];
  }
  else
  {
    objc_super v5 = [[UIDelayedAction alloc] initWithTarget:self action:sel_hideSwitcher userInfo:0 delay:v3];
    v6 = self->m_hideSwitcherDelay;
    self->m_hideSwitcherDelay = v5;
  }
}

- (void)clearHideSwitcherTimer
{
  [(UIDelayedAction *)self->m_hideSwitcherDelay setTarget:0];
  m_hideSwitcherDelay = self->m_hideSwitcherDelay;
  self->m_hideSwitcherDelay = 0;
}

- (void)showSwitcherShouldAutoHide:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(UIInputSwitcher *)self loadedIdentifier];
  [(UIInputSwitcher *)self setSelectedInputMode:v5];

  self->m_state = 2;
  if (v3) {
    [(UIInputSwitcher *)self touchHideSwitcherTimer];
  }
  if ((UIKeyboardAutomaticIsOnScreen() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel_handleRotate_ name:@"UIWindowWillRotateNotification" object:0];
  }
}

- (void)showSwitcherWithAutoHide
{
}

- (void)showSwitcherWithoutAutoHide
{
}

- (void)touchShowSwitcherTimer
{
  m_showSwitcherDelay = self->m_showSwitcherDelay;
  if (m_showSwitcherDelay)
  {
    BOOL v4 = [(UIInputSwitcher *)self isVisibleOrHiding];
    double v5 = 0.1;
    if (v4) {
      double v5 = 0.0;
    }
    [(UIDelayedAction *)m_showSwitcherDelay touchWithDelay:v5];
  }
  else
  {
    id v6 = [[UIDelayedAction alloc] initWithTarget:self action:sel_showSwitcherWithAutoHide userInfo:0 delay:0.1];
    v7 = self->m_showSwitcherDelay;
    self->m_showSwitcherDelay = v6;
  }
}

- (void)cancelShowSwitcherTimer
{
  m_showSwitcherDelay = self->m_showSwitcherDelay;
  if (m_showSwitcherDelay) {
    [(UIDelayedAction *)m_showSwitcherDelay cancel];
  }
}

- (void)clearShowSwitcherTimer
{
  [(UIDelayedAction *)self->m_showSwitcherDelay setTarget:0];
  m_showSwitcherDelay = self->m_showSwitcherDelay;
  self->m_showSwitcherDelay = 0;
}

- (BOOL)isVisible
{
  return self->m_state == 2;
}

- (id)inputModeIdentifierWithNextFlag:(BOOL)a3
{
  if (!a3)
  {
    v12 = [(UIInputSwitcher *)self previousInputMode];
    if (v12) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  double v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 textInputTraits];
  v7 = [v4 nextInputModeToUseForTraits:v6];

  v8 = [v7 identifier];
  if (v8
    && ([(UIInputSwitcher *)self availableInputModes],
        v9 = objc_claimAutoreleasedReturnValue(),
        int v10 = [v9 containsObject:v8],
        v9,
        v10))
  {
    id v11 = v8;
  }
  else
  {
    id v11 = [(UIInputSwitcher *)self nextInputMode];
  }
  v12 = v11;

  if (!v12)
  {
LABEL_9:
    v12 = UIKeyboardGetCurrentInputMode();
  }
LABEL_10:
  return v12;
}

- (void)hideSwitcherIfNeeded
{
  if (self->m_state) {
    [(UIInputSwitcher *)self hideSwitcher];
  }
}

- (BOOL)handleSwitchCommand:(BOOL)a3
{
  return [(UIInputSwitcher *)self handleSwitchCommand:a3 withHUD:1 withDelay:1];
}

- (BOOL)handleSwitchCommand:(BOOL)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v9 = [(UIInputSwitcher *)self availableInputModes];
  uint64_t v10 = [v9 count];

  if (!v10) {
    return 0;
  }
  id v11 = [(UIInputSwitcher *)self inputModeIdentifierWithNextFlag:!v7];
  if (v6) {
    [(UIInputSwitcher *)self touchHideSwitcherTimer];
  }
  BOOL v12 = [(UIInputSwitcher *)self switchMode:v11 withHUD:v6 withDelay:v5];

  return v12;
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5 fromCapsLock:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  [(UIInputSwitcher *)self setUsingCapsLockLanguageSwitch:v6];
  if (v6) {
    [(UIInputSwitcher *)self handleEmojiPicker];
  }
  BOOL v11 = [(UIInputSwitcher *)self switchMode:v10 withHUD:v8 withDelay:v7];

  return v11;
}

- (void)updateHardwareLayout
{
  BOOL v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [(UIInputSwitcher *)self loadedIdentifier];
  id v8 = [v3 inputModeWithIdentifier:v4];

  BOOL v5 = [v8 automaticHardwareLayout];

  if (v5)
  {
    BOOL v6 = (void *)UIApp;
    BOOL v7 = [v8 automaticHardwareLayout];
    [v6 setHardwareKeyboardLayoutName:v7];
  }
}

- (BOOL)handleSwitchingKeyEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIInputSwitcher *)self isVisibleOrHiding];
  if ([v4 _isGlobeKey]) {
    int v6 = [v4 _isKeyDown] ^ 1;
  }
  else {
    int v6 = 0;
  }
  BOOL v7 = [(UIInputSwitcher *)self usingCapsLockLanguageSwitch] && v5;
  if ([v4 _modifierFlags] == 0x40000)
  {
    id v8 = [v4 _unmodifiedInput];
    int v9 = [v8 isEqualToString:@" "];

    if (v9)
    {
      [(UIInputSwitcher *)self setUsingCapsLockLanguageSwitch:0];
      [(UIInputSwitcher *)self setShowingCapsLockSwitcher:0];
      if (v7)
      {
        [(UIInputSwitcher *)self hideSwitcher];
        if (v6)
        {
          [(UIInputSwitcher *)self setUsingCapsLockLanguageSwitch:0];
LABEL_11:
          [(UIInputSwitcher *)self hideSwitcherIfNeeded];
          goto LABEL_14;
        }
      }
      else if (v6)
      {
        [(UIInputSwitcher *)self setUsingCapsLockLanguageSwitch:0];
        goto LABEL_14;
      }
LABEL_16:
      char v12 = 0;
      goto LABEL_17;
    }
  }
  if ((v6 & 1) == 0) {
    goto LABEL_16;
  }
  [(UIInputSwitcher *)self setUsingCapsLockLanguageSwitch:0];
  if (v7) {
    goto LABEL_11;
  }
LABEL_14:
  [(UIInputSwitcher *)self reloadInputModes];
  id v10 = [(UIInputSwitcher *)self availableInputModes];
  unint64_t v11 = [v10 count];

  if ([(UIInputSwitcher *)self handleEmojiPicker])
  {
    char v12 = 1;
    goto LABEL_25;
  }
  v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v14 = [v13 preferencesActions];
  char v12 = [v14 useHardwareGlobeKeyAsEmojiKey];

  if (v11 >= 2 && (v12 & 1) == 0) {
    char v12 = [(UIInputSwitcher *)self handleGlobeKeyEvent:v4 switcherIsVisible:v5];
  }
LABEL_17:
  if ((v12 & 1) == 0 && v5)
  {
    if ([v4 _isKeyDown]) {
      char v12 = [(UIInputSwitcher *)self handleNavigationEvent:v4];
    }
    else {
      char v12 = 0;
    }
  }
LABEL_25:

  return v12;
}

- (BOOL)handleGlobeKeyEvent:(id)a3 switcherIsVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(UIInputSwitcher *)self needsFullHUD];
  double Current = CFAbsoluteTimeGetCurrent();
  int v9 = -[UIInputSwitcher inputModeIdentifierWithNextFlag:](self, "inputModeIdentifierWithNextFlag:", [v6 _modifierFlags] != 0x20000);
  if ([(UIInputSwitcher *)self dismissingEmojiPopover])
  {
    id v10 = +[UIKeyboardInputModeController sharedInputModeController];
    unint64_t v11 = [v10 currentLinguisticInputMode];
    uint64_t v12 = [v11 identifier];

    [(UIInputSwitcher *)self setDismissingEmojiPopover:0];
    int v9 = (void *)v12;
  }
  [(UIInputSwitcher *)self switchMode:v9 withHUD:v7 withDelay:0];
  if (v4) {
    [(UIInputSwitcher *)self cancelShowSwitcherTimer];
  }
  [(UIInputSwitcher *)self touchHideSwitcherTimer];
  self->m_lastGlobeKeyUpTime = Current;
  if ([v6 _modifierFlags] != 0x20000) {
    [(UIInputSwitcher *)self updateHardwareLayout];
  }

  return 1;
}

- (BOOL)handleNavigationEvent:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 _unmodifiedInput];
  [v5 length];

  if (+[UIKeyboard isLanguageIndicatorEnabled])
  {
    id v6 = [(UIInputSwitcher *)self availableInputModes];
    BOOL v7 = [v6 count] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  if ([(UIInputSwitcher *)self usingCapsLockLanguageSwitch]) {
    goto LABEL_21;
  }
  id v8 = +[UIKeyboardImpl activeInstance];
  char v9 = [v8 isEmojiPopoverPresented] | v7;

  if (v9) {
    goto LABEL_21;
  }
  id v10 = [v4 _unmodifiedInput];
  uint64_t v11 = [v10 isEqualToString:@"UIKeyInputDownArrow"];
  if (v11) {
    goto LABEL_10;
  }
  uint64_t v12 = [v4 _unmodifiedInput];
  char v13 = [v12 isEqualToString:@"UIKeyInputPageDown"];

  if (v13)
  {
    uint64_t v11 = 1;
    goto LABEL_11;
  }
  id v10 = [v4 _unmodifiedInput];
  if ([v10 isEqualToString:@"UIKeyInputUpArrow"])
  {
LABEL_10:
  }
  else
  {
    v17 = [v4 _unmodifiedInput];
    char v18 = [v17 isEqualToString:@"UIKeyInputPageUp"];

    if ((v18 & 1) == 0)
    {
      v19 = [v4 _unmodifiedInput];
      if ([v19 isEqualToString:@"\r"])
      {
      }
      else
      {
        v20 = [v4 _unmodifiedInput];
        if (([v20 isEqualToString:@" "] & 1) == 0)
        {

          goto LABEL_21;
        }
        int v21 = [v4 _modifierFlags];

        if ((v21 & 0x40000) != 0)
        {
LABEL_21:
          BOOL v16 = 0;
          goto LABEL_22;
        }
      }
      [(UIInputSwitcher *)self hideSwitcher];
      BOOL v16 = 1;
      goto LABEL_22;
    }
    uint64_t v11 = 0;
  }
LABEL_11:
  uint64_t v14 = [(UIInputSwitcher *)self inputModeIdentifierWithNextFlag:v11];
  if (!v14) {
    goto LABEL_21;
  }
  v15 = (void *)v14;
  BOOL v16 = 1;
  [(UIInputSwitcher *)self switchMode:v14 withHUD:1 withDelay:0];
  [(UIInputSwitcher *)self cancelShowSwitcherTimer];
  [(UIInputSwitcher *)self touchHideSwitcherTimer];

LABEL_22:
  return v16;
}

- (BOOL)handleEmojiPicker
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  int v4 = [v3 isEmojiPopoverVisibleOrDismissing];

  if (!v4)
  {
    if (![(UIInputSwitcher *)self usingCapsLockLanguageSwitch]
      && ![(UIInputSwitcher *)self needsFullHUD])
    {
      id v8 = +[UIKeyboardImpl activeInstance];
      [v8 presentEmojiPopoverViaTrigger:@"globeKey" completion:0];

      [(UIInputSwitcher *)self cancelHideSwitcherTimer];
      [(UIInputSwitcher *)self cancelShowSwitcherTimer];
      [(UIInputSwitcher *)self dismissSwitcher:0];
      [(UIInputSwitcher *)self cleanUpAfterHide];
      return 1;
    }
    return 0;
  }
  if ([(UIInputSwitcher *)self needsFullHUD]
    || [(UIInputSwitcher *)self usingCapsLockLanguageSwitch])
  {
    return 0;
  }
  if ([(UIInputSwitcher *)self dismissingEmojiPopover]) {
    return 1;
  }
  BOOL v5 = 1;
  [(UIInputSwitcher *)self setDismissingEmojiPopover:1];
  id v6 = +[UIKeyboardImpl activeInstance];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __36__UIInputSwitcher_handleEmojiPicker__block_invoke;
  v9[3] = &unk_1E52DC3A0;
  v9[4] = self;
  [v6 dismissEmojiPopoverIfNecessaryWithCompletion:v9];

  return v5;
}

uint64_t __36__UIInputSwitcher_handleEmojiPicker__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearShowSwitcherTimer];
  v2 = *(void **)(a1 + 32);
  return [v2 setDismissingEmojiPopover:0];
}

- (BOOL)needsFullHUD
{
  BOOL v3 = [(UIInputSwitcher *)self availableInputModes];
  if ((unint64_t)[v3 count] < 2) {
    goto LABEL_8;
  }
  int v4 = +[UIKeyboardImpl activeInstance];
  char v5 = [v4 canPresentEmojiPopover];
  if ((v5 & 1) == 0)
  {
    v2 = +[UIKeyboardImpl activeInstance];
    if (([v2 isEmojiPopoverVisibleOrDismissing] & 1) == 0)
    {

      goto LABEL_10;
    }
  }
  id v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v7 = [v6 preferencesActions];
  int v8 = [v7 useHardwareGlobeKeyAsEmojiKey];

  if ((v5 & 1) == 0)
  {

    if (v8) {
      goto LABEL_8;
    }
LABEL_10:
    BOOL v9 = 1;
    goto LABEL_11;
  }

  if (!v8) {
    goto LABEL_10;
  }
LABEL_8:
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (BOOL)handleModifiersChangedEvent:(id)a3
{
  id v4 = a3;
  int v5 = [v4 _gsModifierFlags];
  unsigned int v6 = [v4 _inputFlags];

  if ((v6 & 0x20) != 0)
  {
    if ((v5 & 0x220000) != 0 || handleModifiersChangedEvent__lastMods & 0x220000 | v5 & 0x900000) {
      goto LABEL_10;
    }
    int m_state = self->m_state;
    if (m_state == 1)
    {
      [(UIInputSwitcher *)self cancelShowSwitcherTimer];
      int v8 = [(UIInputSwitcher *)self loadedIdentifier];

      if (v8)
      {
        BOOL v9 = +[UIKeyboardImpl activeInstance];
        id v10 = [(UIInputSwitcher *)self loadedIdentifier];
        [v9 setInputMode:v10 userInitiated:1];

        uint64_t v11 = [(UIInputSwitcher *)self loadedIdentifier];
        [(UIInputSwitcher *)self setSelectedInputMode:v11];

        [(UIInputSwitcher *)self dismissSwitcherWithDelay:1.5];
      }
    }
    else
    {
      if (m_state != 2)
      {
LABEL_10:
        handleModifiersChangedEvent__lastMods = v5;
        return (v6 >> 5) & 1;
      }
      [(UIInputSwitcher *)self hideSwitcher];
    }
    self->int m_state = 0;
    goto LABEL_10;
  }
  return (v6 >> 5) & 1;
}

- (void)reloadInputModes
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:546 description:@"Subclass must implement"];
}

- (id)availableInputModes
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:550 description:@"Subclass must implement"];

  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)selectedInputMode
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:555 description:@"Subclass must implement"];

  return &stru_1ED0E84C0;
}

- (void)setSelectedInputMode:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:560 description:@"Subclass must implement"];
}

- (id)nextInputMode
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:564 description:@"Subclass must implement"];

  return 0;
}

- (id)previousInputMode
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:569 description:@"Subclass must implement"];

  return 0;
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:575 description:@"Subclass must implement"];
}

- (BOOL)isVisibleOrHiding
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:580 description:@"Subclass must implement"];

  return 0;
}

- (BOOL)switchMode:(id)a3 withHUD:(BOOL)a4 withDelay:(BOOL)a5
{
  BOOL v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:586 description:@"Subclass must implement"];

  return 0;
}

- (void)dismissSwitcherWithDelay:(double)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:591 description:@"Subclass must implement"];
}

- (void)dismissSwitcher:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"UIInputSwitcher.m" lineNumber:595 description:@"Subclass must implement"];
}

- (NSString)loadedIdentifier
{
  return self->_loadedIdentifier;
}

- (void)setLoadedIdentifier:(id)a3
{
}

- (BOOL)usingCapsLockLanguageSwitch
{
  return self->_usingCapsLockLanguageSwitch;
}

- (void)setUsingCapsLockLanguageSwitch:(BOOL)a3
{
  self->_usingCapsLockLanguageSwitch = a3;
}

- (BOOL)dismissingEmojiPopover
{
  return self->_dismissingEmojiPopover;
}

- (void)setDismissingEmojiPopover:(BOOL)a3
{
  self->_dismissingEmojiPopover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedIdentifier, 0);
  objc_storeStrong((id *)&self->_newMode, 0);
  objc_storeStrong((id *)&self->m_hideSwitcherDelay, 0);
  objc_storeStrong((id *)&self->m_showSwitcherDelay, 0);
}

@end