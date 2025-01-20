@interface UIInlineInputSwitcher
- (BOOL)showingCapsLockSwitcher;
- (NSArray)availableInputModes;
- (id)defaultInputMode;
- (id)nextInputMode;
- (id)previousInputMode;
- (void)reloadInputModes;
- (void)setAvailableInputModes:(id)a3;
- (void)setShowingCapsLockSwitcher:(BOOL)a3;
- (void)updateInputModes:(id)a3 withHUD:(BOOL)a4;
@end

@implementation UIInlineInputSwitcher

- (void)reloadInputModes
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = +[UIKeyboardInputModeController sharedInputModeController];
  [v4 _clearAllExtensionsIfNeeded];

  v5 = +[UIKeyboardImpl activeInstance];
  int v6 = [v5 isMinimized];

  if (v6)
  {
    v29 = self;
    v30 = v3;
    v7 = UIKeyboardGetActiveUniqueInputModesForHardwareKeyboard();
    v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v9 = [v8 inputViews];
    int v10 = [v9 isCustomInputView];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v35 + 1) + 8 * v15);
          v17 = +[UIKeyboardInputModeController sharedInputModeController];
          v18 = [v17 inputModeWithIdentifier:v16];

          if (!v10
            || ([v18 hardwareLayout],
                v19 = objc_claimAutoreleasedReturnValue(),
                v19,
                v19))
          {
            if (([v18 isEmojiInputMode] & 1) == 0)
            {
              v20 = [v18 primaryLanguage];
              char IsNonLinguistic = UIKeyboardInputModeIsNonLinguistic(v20);

              if ((IsNonLinguistic & 1) == 0 && ([v18 isExtensionInputMode] & 1) == 0) {
                [v30 addObject:v16];
              }
            }
          }

          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v13);
    }

    self = v29;
    v3 = v30;
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = (id)UIKeyboardActiveInputModes;
    uint64_t v22 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v11);
          }
          uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * v25);
          v27 = +[UIKeyboardInputModeController sharedInputModeController];
          v28 = [v27 inputModeWithIdentifier:v26];

          if (([v28 isEmojiInputMode] & 1) == 0) {
            [v3 addObject:v26];
          }

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = [v11 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v23);
    }
  }

  [(UIInlineInputSwitcher *)self setAvailableInputModes:v3];
}

- (id)defaultInputMode
{
  v3 = UIKeyboardGetCurrentInputMode();
  v4 = [(UIInlineInputSwitcher *)self availableInputModes];
  char v5 = [v4 containsObject:v3];

  if ((v5 & 1) == 0)
  {
    int v6 = [(UIInlineInputSwitcher *)self availableInputModes];
    uint64_t v7 = [v6 firstObject];

    v3 = (void *)v7;
  }
  return v3;
}

- (id)nextInputMode
{
  v3 = [(UIInlineInputSwitcher *)self availableInputModes];
  if ([(UIInputSwitcher *)self isVisible]) {
    [(UIInlineInputSwitcher *)self selectedInputMode];
  }
  else {
  v4 = [(UIInlineInputSwitcher *)self defaultInputMode];
  }
  uint64_t v5 = [v3 indexOfObject:v4];

  int v6 = [(UIInlineInputSwitcher *)self availableInputModes];
  unint64_t v7 = (v5 + 1) % (unint64_t)[v6 count];

  v8 = [(UIInlineInputSwitcher *)self availableInputModes];
  v9 = [v8 objectAtIndexedSubscript:v7];

  return v9;
}

- (id)previousInputMode
{
  v3 = [(UIInlineInputSwitcher *)self availableInputModes];
  if ([(UIInputSwitcher *)self isVisible]) {
    [(UIInlineInputSwitcher *)self selectedInputMode];
  }
  else {
  v4 = [(UIInlineInputSwitcher *)self defaultInputMode];
  }
  uint64_t v5 = [v3 indexOfObject:v4];

  if (v5 <= 0)
  {
    int v6 = [(UIInlineInputSwitcher *)self availableInputModes];
    uint64_t v5 = [v6 count];
  }
  unint64_t v7 = [(UIInlineInputSwitcher *)self availableInputModes];
  v8 = [v7 objectAtIndexedSubscript:v5 - 1];

  return v8;
}

- (void)updateInputModes:(id)a3 withHUD:(BOOL)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(UIInputSwitcher *)self usingCapsLockLanguageSwitch];
  if (a4)
  {
    if (!v7)
    {
      [(UIInlineInputSwitcher *)self reloadInputModes];
      goto LABEL_9;
    }
    v8 = +[UIKeyboardInputModeController sharedInputModeController];
    v9 = [v8 currentLinguisticInputMode];

    int v10 = [v9 identifier];
    int v11 = [v10 isEqualToString:v6];

    if (v11)
    {
      uint64_t v12 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v13 = [v12 inputModeForASCIIToggleWithTraits:0];

      v9 = (void *)v13;
    }
    uint64_t v14 = objc_msgSend(v9, "identifier", v6);
    v16[1] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [(UIInlineInputSwitcher *)self setAvailableInputModes:v15];
  }
  else
  {
    v17[0] = v6;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [(UIInlineInputSwitcher *)self setAvailableInputModes:v9];
  }

LABEL_9:
}

- (NSArray)availableInputModes
{
  return self->_availableInputModes;
}

- (void)setAvailableInputModes:(id)a3
{
}

- (BOOL)showingCapsLockSwitcher
{
  return self->_showingCapsLockSwitcher;
}

- (void)setShowingCapsLockSwitcher:(BOOL)a3
{
  self->_showingCapsLockSwitcher = a3;
}

- (void).cxx_destruct
{
}

@end