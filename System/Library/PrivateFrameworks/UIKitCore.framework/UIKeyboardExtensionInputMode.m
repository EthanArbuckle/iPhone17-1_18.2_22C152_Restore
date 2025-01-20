@interface UIKeyboardExtensionInputMode
- (BOOL)defaultLayoutIsASCIICapable;
- (BOOL)isDefaultRightToLeft;
- (BOOL)isDesiredForTraits:(id)a3;
- (BOOL)isExtensionInputMode;
- (BOOL)isStalledExtensionInputMode;
- (BOOL)showSWLayoutWithHWKeyboard;
- (NSExtension)extension;
- (UIKeyboardExtensionInputMode)initWithIdentifier:(id)a3;
- (id)_indicatorIconWithBackground:(BOOL)a3 iconWidth:(double)a4 scaleFactor:(double)a5;
- (id)containingBundle;
- (id)containingBundleDisplayName;
- (id)extendedDisplayName;
- (id)hardwareLayout;
- (id)monolingualDisplayName;
- (id)normalizedIdentifierLevels;
- (void)setExtension:(id)a3;
- (void)setPrimaryLanguage:(id)a3;
@end

@implementation UIKeyboardExtensionInputMode

- (UIKeyboardExtensionInputMode)initWithIdentifier:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)UIKeyboardExtensionInputMode;
  v5 = [(UIKeyboardExtensionInputMode *)&v33 init];
  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v6 = +[UIKeyboardInputModeController sharedInputModeController];
    v7 = [v6 _MCFilteredExtensionIdentifiers];

    id v8 = (id)[v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (!v8) {
      goto LABEL_10;
    }
    uint64_t v9 = *(void *)v30;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v30 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
      v12 = [v11 identifier];
      char v13 = [v12 isEqualToString:v4];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = (id)[v7 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v8) {
          goto LABEL_4;
        }
LABEL_10:
        uint64_t v14 = (uint64_t)v5;
LABEL_19:
        v5 = 0;
        goto LABEL_20;
      }
    }
    id v8 = v11;

    if (!v8) {
      goto LABEL_17;
    }
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    v16 = [v8 _plugIn];
    v17 = [v16 url];
    v18 = [v17 path];
    int v19 = [v15 fileExistsAtPath:v18];

    if (!v19)
    {
      v7 = v8;
      uint64_t v14 = (uint64_t)v5;
      id v8 = 0;
      goto LABEL_19;
    }
    if (!v5)
    {
LABEL_17:
      v26 = 0;
      goto LABEL_21;
    }
    [(UIKeyboardInputMode *)v5 setIdentifier:v4];
    [(UIKeyboardInputMode *)v5 setNormalizedIdentifier:v4];
    [(UIKeyboardExtensionInputMode *)v5 setExtension:v8];
    v20 = [v8 attributes];
    v21 = [v20 objectForKey:@"PrimaryLanguage"];
    [(UIKeyboardExtensionInputMode *)v5 setPrimaryLanguage:v21];

    v22 = [(UIKeyboardInputMode *)v5 primaryLanguage];
    [(UIKeyboardInputMode *)v5 setLanguageWithRegion:v22];

    uint64_t v14 = [(UIKeyboardInputMode *)v5 primaryLanguage];
    v7 = TIGetDefaultInputModesForLanguage();
    v23 = [v7 firstObject];
    v24 = TIInputModeGetLanguageWithRegion();
    if (v24)
    {
      [(UIKeyboardInputMode *)v5 setLanguageWithRegion:v24];
    }
    else
    {
      v28 = [(UIKeyboardInputMode *)v5 primaryLanguage];
      [(UIKeyboardInputMode *)v5 setLanguageWithRegion:v28];
    }
LABEL_20:
    v26 = v5;

    v5 = (UIKeyboardExtensionInputMode *)v14;
LABEL_21:

    v5 = v26;
    v25 = v5;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)setPrimaryLanguage:(id)a3
{
  id v4 = +[UIKeyboardInputMode canonicalLanguageIdentifierFromIdentifier:a3];
  v5 = [(UIKeyboardInputMode *)self primaryLanguage];
  char v6 = [v5 isEqualToString:v4];

  if ((v6 & 1) == 0)
  {
    [(UIKeyboardInputMode *)self setHardwareLayout:0];
    v12.receiver = self;
    v12.super_class = (Class)UIKeyboardExtensionInputMode;
    [(UIKeyboardInputMode *)&v12 setPrimaryLanguage:v4];
    v7 = TIGetDefaultInputModesForLanguage();
    id v8 = [v7 firstObject];
    uint64_t v9 = TIInputModeGetLanguageWithRegion();
    uint64_t v10 = (void *)v9;
    if (v9) {
      v11 = (void *)v9;
    }
    else {
      v11 = v4;
    }
    [(UIKeyboardInputMode *)self setLanguageWithRegion:v11];
  }
}

- (BOOL)showSWLayoutWithHWKeyboard
{
  v3 = [(UIKeyboardExtensionInputMode *)self hardwareLayout];
  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v5 = [(UIKeyboardInputMode *)self primaryLanguage];
    int v4 = [v5 isEqualToString:@"mul"] ^ 1;
  }
  return v4;
}

- (id)hardwareLayout
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v47.receiver = self;
  v47.super_class = (Class)UIKeyboardExtensionInputMode;
  v3 = [(UIKeyboardInputMode *)&v47 hardwareLayout];
  if (!v3)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    v5 = [v4 preferencesActions];
    uint64_t v37 = *MEMORY[0x1E4FAE520];
    char v6 = objc_msgSend(v5, "valueForPreferenceKey:");

    uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v44;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v44 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:*(void *)(*((void *)&v43 + 1) + 8 * v10)];
        if (([v11 isExtensionInputMode] & 1) == 0)
        {
          objc_super v12 = [v11 primaryLanguage];
          char v13 = [(UIKeyboardInputMode *)self primaryLanguage];
          char v14 = [v12 isEqualToString:v13];

          if (v14) {
            break;
          }
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v49 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
      v3 = [v11 hardwareLayout];

      if (v3) {
        goto LABEL_33;
      }
    }
    else
    {
LABEL_11:
    }
    v15 = (void *)MEMORY[0x1E4F1CA20];
    v16 = [(UIKeyboardInputMode *)self primaryLanguage];
    v17 = [v15 localeWithLocaleIdentifier:v16];

    if (v17
      && ([v17 objectForKey:*MEMORY[0x1E4F1C438]], (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v38 = (void *)v18;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      int v19 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v20 = [v19 preferencesActions];
      v21 = [v20 valueForPreferenceKey:v37];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v40;
LABEL_17:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:*(void *)(*((void *)&v39 + 1) + 8 * v25)];
          if (([v26 isExtensionInputMode] & 1) == 0)
          {
            v27 = [v26 identifier];
            v28 = TIInputModeGetBaseLanguage();
            char v29 = [v38 isEqualToString:v28];

            if (v29) {
              break;
            }
          }

          if (v23 == ++v25)
          {
            uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v48 count:16];
            if (v23) {
              goto LABEL_17;
            }
            goto LABEL_24;
          }
        }
        v3 = [v26 hardwareLayout];

        if (!v3) {
          goto LABEL_28;
        }
        long long v30 = v38;
      }
      else
      {
LABEL_24:

LABEL_28:
        long long v30 = v38;
        long long v31 = TIGetDefaultInputModesForLanguage();
        long long v32 = [v31 firstObject];

        objc_super v33 = TIInputModeGetBaseLanguage();
        int v34 = [v38 isEqualToString:v33];

        if (v34)
        {
          uint64_t v35 = TIInputModeGetNormalizedIdentifier();

          v3 = UIKeyboardGetDefaultHardwareKeyboardLayoutForInputMode(v35);
          long long v32 = v35;
        }
        else
        {
          v3 = 0;
        }
      }
    }
    else
    {
      long long v30 = 0;
      v3 = 0;
    }
  }
LABEL_33:
  [(UIKeyboardInputMode *)self setHardwareLayout:v3];
  return v3;
}

- (id)monolingualDisplayName
{
  v3 = [(UIKeyboardExtensionInputMode *)self extension];
  int v4 = [v3 objectForInfoDictionaryKey:@"CFBundleDisplayName"];

  if (!v4)
  {
    v5 = [(UIKeyboardExtensionInputMode *)self extension];
    int v4 = [v5 objectForInfoDictionaryKey:*MEMORY[0x1E4F1D008]];

    if (!v4)
    {
      int v4 = [(UIKeyboardInputMode *)self identifier];
    }
  }
  return v4;
}

- (id)extendedDisplayName
{
  v3 = [(UIKeyboardExtensionInputMode *)self containingBundleDisplayName];
  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v4 = [(UIKeyboardExtensionInputMode *)self displayName];
  if (!v4) {
    goto LABEL_4;
  }
  v5 = (void *)v4;
  char v6 = [(UIKeyboardExtensionInputMode *)self displayName];
  char v7 = [v3 containsString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = [(UIKeyboardExtensionInputMode *)self displayName];
    v11 = [(UIKeyboardExtensionInputMode *)self containingBundleDisplayName];
    uint64_t v8 = [v9 stringWithFormat:@"%@ — %@", v10, v11];
  }
  else
  {
LABEL_4:
    uint64_t v8 = [(UIKeyboardExtensionInputMode *)self displayName];
  }

  return v8;
}

- (BOOL)isDefaultRightToLeft
{
  v2 = [(UIKeyboardExtensionInputMode *)self extension];
  v3 = [v2 attributes];
  uint64_t v4 = [v3 objectForKey:@"PrefersRightToLeft"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)defaultLayoutIsASCIICapable
{
  v2 = [(UIKeyboardExtensionInputMode *)self extension];
  v3 = [v2 attributes];
  uint64_t v4 = [v3 objectForKey:@"IsASCIICapable"];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)isStalledExtensionInputMode
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v4 = [(UIKeyboardExtensionInputMode *)self extension];
  char v5 = [v4 _plugIn];
  char v6 = [v5 url];
  char v7 = [v6 path];
  char v8 = [v3 fileExistsAtPath:v7] ^ 1;

  return v8;
}

- (BOOL)isExtensionInputMode
{
  return 1;
}

- (id)containingBundle
{
  v2 = [(UIKeyboardExtensionInputMode *)self extension];
  v3 = [v2 _plugIn];
  uint64_t v4 = [v3 containingUrl];

  if (v4)
  {
    char v5 = [MEMORY[0x1E4F28B50] bundleWithURL:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)containingBundleDisplayName
{
  v2 = [(UIKeyboardExtensionInputMode *)self extension];
  v3 = [v2 _plugIn];
  uint64_t v4 = [v3 localizedContainingName];

  return v4;
}

- (id)normalizedIdentifierLevels
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)isDesiredForTraits:(id)a3
{
  id v4 = a3;
  char v5 = +[UIKeyboardInputModeController sharedInputModeController];
  char v6 = [v5 allowedExtensions];
  char v7 = [(UIKeyboardExtensionInputMode *)self extension];
  int v8 = [v6 containsObject:v7];

  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
  if ([v9 deviceStateIsLocked])
  {
    uint64_t v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    v11 = [v10 containerRootController];
    int v12 = [v11 isSnapshotting];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  char v13 = +[UIKeyboardImpl activeInstance];
  char v14 = [v13 textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact];

  if ((v14 & 1) == 0
    && ([v4 isCarPlayIdiom] & 1) == 0
    && ([v4 isSecureTextEntry] & 1) == 0
    && [v4 keyboardAppearance] != 127
    && [v4 keyboardType] != 127
    && [v4 keyboardType] != 5)
  {
    BOOL v15 = [v4 keyboardType] != 6;
    goto LABEL_13;
  }
LABEL_12:
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

- (id)_indicatorIconWithBackground:(BOOL)a3 iconWidth:(double)a4 scaleFactor:(double)a5
{
  char v7 = [(UIKeyboardInputMode *)self cachedIcon];

  if (!v7)
  {
    int v8 = [(UIKeyboardExtensionInputMode *)self extension];
    uint64_t v9 = [v8 icons];
    uint64_t v10 = [v9 firstObject];

    if (v10)
    {
      v11 = -[UIGraphicsImageRenderer initWithSize:]([UIGraphicsImageRenderer alloc], "initWithSize:", a4, 18.0);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __83__UIKeyboardExtensionInputMode__indicatorIconWithBackground_iconWidth_scaleFactor___block_invoke;
      v16[3] = &unk_1E52F3578;
      id v17 = v10;
      double v18 = a4;
      int v12 = [(UIGraphicsImageRenderer *)v11 imageWithActions:v16];

      char v13 = [v12 imageWithRenderingMode:1];

      [(UIKeyboardInputMode *)self setCachedIcon:v13];
    }
  }
  char v14 = [(UIKeyboardInputMode *)self cachedIcon];
  return v14;
}

uint64_t __83__UIKeyboardExtensionInputMode__indicatorIconWithBackground_iconWidth_scaleFactor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 17, 0.0, 0.0, *(double *)(a1 + 40), 18.0, 1.0);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
}

@end