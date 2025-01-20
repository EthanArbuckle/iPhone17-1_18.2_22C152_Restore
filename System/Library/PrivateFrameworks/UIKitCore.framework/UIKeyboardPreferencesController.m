@interface UIKeyboardPreferencesController
+ (id)sharedPreferencesController;
- (BOOL)BOOLForKey:(int)a3;
- (BOOL)BOOLForPreferenceKey:(id)a3;
- (BOOL)allEnabledInputModesAreValid;
- (BOOL)crescendoEnabled;
- (BOOL)currentInputModeSupportsCrescendo;
- (BOOL)defaultGlobeAsEmojiKeySetting;
- (BOOL)enableProKeyboard;
- (BOOL)inputModeSupportsCrescendo:(id)a3;
- (BOOL)isDictationAsPrimaryInputMode;
- (BOOL)isFirstReachableKeyboardInteraction;
- (BOOL)isPasswordAutoFillAllowed;
- (BOOL)isPreferenceKeyLockedDown:(id)a3;
- (BOOL)keyboardLanguageIndicatorEnabled;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)spaceConfirmationEnabled;
- (BOOL)useHardwareGlobeKeyAsEmojiKey;
- (UIKeyboardPreferencesController)init;
- (double)rivenSizeFactor:(double)a3;
- (id)inputModeUpdateTime;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)valueForKey:(int)a3;
- (id)valueForPreferenceKey:(id)a3;
- (int64_t)compactAssistantBarPersistentLocation;
- (int64_t)handBias;
- (int64_t)visceral;
- (void)_configurePreferences;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
- (void)performedFirstReachableKeyboardInteraction;
- (void)preferencesControllerChanged:(id)a3;
- (void)saveInputModes:(id)a3;
- (void)setCompactAssistantBarPersistentLocation:(int64_t)a3;
- (void)setDictationAsPrimaryInputMode:(BOOL)a3;
- (void)setDictationAutoPunctuation:(BOOL)a3;
- (void)setEnableProKeyboard:(BOOL)a3;
- (void)setEnabledDictationLanguages:(id)a3;
- (void)setHandBias:(int64_t)a3;
- (void)setLanguageAwareInputModeLastUsed:(id)a3;
- (void)setLastUsedDictationLanguages:(id)a3;
- (void)setValue:(id)a3 forKey:(int)a4;
- (void)setValue:(id)a3 forPreferenceKey:(id)a4;
- (void)setVisceral:(int64_t)a3;
- (void)synchronizePreferences;
- (void)touchSynchronizePreferencesTimer;
@end

@implementation UIKeyboardPreferencesController

- (id)valueForPreferenceKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAE3E0];
  id v4 = a3;
  v5 = [v3 sharedPreferencesController];
  v6 = [v5 valueForPreferenceKey:v4];

  return v6;
}

+ (id)sharedPreferencesController
{
  if (_MergedGlobals_1115 != -1) {
    dispatch_once(&_MergedGlobals_1115, &__block_literal_global_312);
  }
  v2 = (void *)qword_1EB261718;
  return v2;
}

- (BOOL)BOOLForPreferenceKey:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FAE3E0];
  id v4 = a3;
  v5 = [v3 sharedPreferencesController];
  char v6 = [v5 BOOLForPreferenceKey:v4];

  return v6;
}

void __62__UIKeyboardPreferencesController_sharedPreferencesController__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardPreferencesController);
  v1 = (void *)qword_1EB261718;
  qword_1EB261718 = (uint64_t)v0;
}

- (UIKeyboardPreferencesController)init
{
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardPreferencesController;
  v2 = [(UIKeyboardPreferencesController *)&v9 init];
  v3 = v2;
  if (v2)
  {
    [(UIKeyboardPreferencesController *)v2 _configurePreferences];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4FAEA28];
    char v6 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
    [v4 addObserver:v3 selector:sel_preferencesControllerChanged_ name:v5 object:v6];

    v7 = v3;
  }

  return v3;
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = &unk_1ED700F40;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, (SEL)[v4 selector], 1, 1).name)
  {
    char v6 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
    [v6 forwardInvocation:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboardPreferencesController;
    [(UIKeyboardPreferencesController *)&v7 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v5 = &unk_1ED700F40;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    char v6 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
    objc_super v7 = [v6 methodSignatureForSelector:a3];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKeyboardPreferencesController;
    objc_super v7 = [(UIKeyboardPreferencesController *)&v9 methodSignatureForSelector:a3];
  }

  return v7;
}

- (void)_configurePreferences
{
  uint64_t v2 = MGGetBoolAnswer();
  v3 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [v3 _configureKey:@"YukonMagnifiersDisabled" domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC38]];

  uint64_t v5 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  char v6 = [NSNumber numberWithBool:v2];
  [v5 _configureKey:@"GesturesEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v6];

  objc_super v7 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v7 _configureKey:@"HandwritingAutoConfirmationEnabled" domain:@"com.apple.InputModePreferences" defaultValue:v4];

  v8 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v8 _configureKey:@"HandwritingAutoConfirmationMinTimeout" domain:@"com.apple.keyboard" defaultValue:&unk_1ED3F1F48];

  objc_super v9 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v9 _configureKey:@"HandwritingAutoConfirmationMaxTimeout" domain:@"com.apple.keyboard" defaultValue:&unk_1ED3F1F58];

  v10 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  uint64_t v11 = MEMORY[0x1E4F1CC28];
  [v10 _configureKey:@"DidShowGestureKeyboardIntroduction" domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC28]];

  v12 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v12 _configureKey:@"SwipeDeleteWordEnabled" domain:@"com.apple.keyboard" defaultValue:v11];

  v13 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v13 _configureKey:@"RepeatDeleteWordEnabled" domain:@"com.apple.keyboard" defaultValue:v11];

  v14 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v14 _configureKey:@"RepeatDeleteWordFirstDelay" domain:@"com.apple.keyboard" defaultValue:&unk_1ED3F1F68];

  v15 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v15 _configureKey:@"RepeatDeleteWordRepeatInterfal" domain:@"com.apple.keyboard" defaultValue:&unk_1ED3F1F68];

  v16 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v16 _configureKey:@"RepeatDeleteWordCountForDecrement" domain:@"com.apple.keyboard" defaultValue:&unk_1ED3F4710];

  if (+[UIKeyboard isRedesignedTextCursorEnabled]) {
    double v17 = 1.0;
  }
  else {
    double v17 = 2.0;
  }
  v18 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  v19 = [NSNumber numberWithDouble:v17];
  [v18 _configureKey:@"DictationMenuReturnPauseInterval" domain:@"com.apple.keyboard" defaultValue:v19];

  v20 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v20 _configureKey:@"DetachHardwareKeyboardDelayInterval" domain:@"com.apple.keyboard" defaultValue:&unk_1ED3F4728];

  v21 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v21 _configureKey:@"ShowPasswordKeyboardInVideo" domain:@"com.apple.keyboard" defaultValue:v11];

  v22 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v22 _configureKey:@"ShowKeyboardButtonOnDictationPopover" domain:@"com.apple.keyboard" defaultValue:v11];

  v23 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v23 _configureKey:@"DictationCommandTipsEnabled" domain:@"com.apple.keyboard" defaultValue:v11];

  v24 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v24 _configureKey:@"DictationWordwiseBackspaceEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v4];

  v25 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v25 _configureKey:@"ShowDockItemTouchArea" domain:@"com.apple.keyboard.preferences" defaultValue:v11];

  v26 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v26 _configureKey:@"KeyboardDockItemHitAreaReductionPercent" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1ED3F4740];

  v27 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v27 _configureKey:@"DidShowInlineCompletionEducationTip" domain:@"com.apple.keyboard.preferences" defaultValue:v11];

  id v28 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v28 _configureKey:@"InlineCompletionAcceptedBySpaceEventCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1ED3F4758];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FAEA28] object:0];

  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardPreferencesController;
  [(UIKeyboardPreferencesController *)&v4 dealloc];
}

- (void)preferencesControllerChanged:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 updateDefaultsWithResults:&__block_literal_global_99];
}

void __64__UIKeyboardPreferencesController_preferencesControllerChanged___block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 objectForKey:*MEMORY[0x1E4FAE8C0]];
  uint64_t v2 = +[UIKeyboardInputModeController sharedInputModeController];
  [v2 handleLastUsedInputMode:0 withNewInputMode:v4];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIKeyboardPreferencesDidUpdateNotification" object:0];
}

- (id)valueForKey:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  uint64_t v5 = [v4 valueForKey:v3];

  return v5;
}

- (BOOL)BOOLForKey:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  LOBYTE(v3) = [v4 BOOLForKey:v3];

  return v3;
}

- (void)synchronizePreferences
{
  id v2 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v2 synchronizePreferences];
}

- (void)touchSynchronizePreferencesTimer
{
  id v2 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  [v2 touchSynchronizePreferencesTimer];
}

- (void)setValue:(id)a3 forKey:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = (void *)MEMORY[0x1E4FAE3E0];
  id v6 = a3;
  id v7 = [v5 sharedPreferencesController];
  [v7 setValue:v6 forKey:v4];
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4FAE3E0];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedPreferencesController];
  [v8 setValue:v7 forPreferenceKey:v6];
}

- (void)saveInputModes:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4FAE3E0];
  id v5 = a3;
  id v6 = [v4 sharedPreferencesController];
  [v6 updateInputModes:v5];

  id v7 = +[UIKeyboardInputModeController sharedInputModeController];
  id v8 = (id)[v7 updateEnabledDictationLanguages:1];

  [(UIKeyboardPreferencesController *)self touchSynchronizePreferencesTimer];
  +[_UIKeyboardUsageTracking keyboardExtensionsOnDevice];
}

- (void)setLanguageAwareInputModeLastUsed:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = TIInputModeGetNormalizedIdentifier();
    int v5 = [v4 isEqualToString:@"emoji"];

    if (v5)
    {
      id v6 = [(UIKeyboardPreferencesController *)self preferencesActions];
      id v7 = [v6 inputModeSelectionSequence];

      if ([v7 count])
      {
        uint64_t v8 = [v7 firstObject];
      }
      else
      {
        uint64_t v8 = 0;
      }

      id v3 = (id)v8;
    }
  }
  if ([v3 length])
  {
    objc_super v9 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAE8C0]];
    v58 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v3];
    v10 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v9];
    uint64_t v11 = +[UIKeyboardInputModeController sharedInputModeController];
    v12 = [v11 inputModeContextIdentifier];

    if (v12)
    {
      v13 = +[UIPeripheralHost sharedInstance];
      v57 = [v13 lastUsedInputModeForCurrentContext];

      if (v57)
      {
        uint64_t v14 = [v57 identifier];

        v15 = (void *)v14;
        goto LABEL_14;
      }
      v57 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v9];
    }
    else
    {
      v57 = v10;
    }
    v15 = v9;
LABEL_14:
    v56 = v15;
    if ((UIKeyboardInputModesEqual(v3, v15) & 1) == 0)
    {
      v16 = TIInputModeGetNormalizedIdentifier();
      char v17 = [v16 isEqualToString:@"emoji"];

      if ((v17 & 1) == 0)
      {
        if (([v58 isExtensionInputMode] & 1) == 0
          && ([v57 isExtensionInputMode] & 1) == 0)
        {
          v18 = TIInputModeGetBaseLanguage();
          v19 = TIInputModeGetBaseLanguage();
          char v20 = [v18 isEqualToString:v19];

          if ((v20 & 1) == 0)
          {
            v21 = NSString;
            v22 = [MEMORY[0x1E4F1CA20] preferredLanguages];
            uint64_t v23 = [v22 firstObject];
            v24 = (void *)v23;
            v25 = @"Unknown";
            if (v23) {
              v25 = (__CFString *)v23;
            }
            v26 = [v21 stringWithFormat:@"%@.%@", *MEMORY[0x1E4FAECE0], v25];
            v27 = TIStatisticGetKey();
            TIStatisticScalarIncrement();
          }
        }
        id v28 = +[UIKeyboardInputModeController sharedInputModeController];
        v29 = [v28 inputModeContextIdentifier];

        if (!v29)
        {
          if (!+[UIKeyboard usesInputSystemUI])
          {
            v30 = [(UIKeyboardPreferencesController *)self preferencesActions];
            [v30 updateLastUsedInputMode:v3];
          }
          v31 = +[UIKeyboardInputModeController sharedInputModeController];
          [v31 handleLastUsedInputMode:0 withNewInputMode:v3];
        }
        v32 = [(UIKeyboardPreferencesController *)self preferencesActions];
        [v32 updateLastUsedLayout:v3];

        [(UIKeyboardPreferencesController *)self touchSynchronizePreferencesTimer];
      }
    }
    v33 = [MEMORY[0x1E4F1CA48] array];
    v34 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAE8B8]];
    v59 = TIInputModeGetLanguageWithRegion();
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__121;
    v74 = __Block_byref_object_dispose__121;
    id v75 = [v34 objectForKey:v59];
    if ([v58 isExtensionInputMode])
    {
      v35 = [v58 languageWithRegion];
      v36 = [v35 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __69__UIKeyboardPreferencesController_setLanguageAwareInputModeLastUsed___block_invoke;
      v65[3] = &unk_1E52F3A50;
      id v37 = v36;
      id v66 = v37;
      v69 = &v70;
      id v38 = v3;
      id v67 = v38;
      id v39 = v33;
      id v68 = v39;
      [v34 enumerateKeysAndObjectsUsingBlock:v65];
      if ([v39 count])
      {
        v59 = v37;
      }
      else
      {
        v40 = TIGetDefaultInputModesForLanguage();
        if ([v40 count])
        {
          v41 = [v40 firstObject];
          v59 = TIInputModeGetLanguageWithRegion();

          uint64_t v42 = [v34 objectForKey:v59];
          v43 = (void *)v71[5];
          v71[5] = v42;

          if ((UIKeyboardInputModesEqual(v38, (void *)v71[5]) & 1) == 0) {
            [v39 addObject:v59];
          }
        }
        else
        {
          v59 = v37;
        }
      }
    }
    else if ((UIKeyboardInputModesEqual(v3, (void *)v71[5]) & 1) == 0)
    {
      [v33 addObject:v59];
    }
    if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v3))
    {
      v44 = [v34 objectForKey:@"ASCIICapable"];
      int v45 = 0;
      int v46 = UIKeyboardInputModesEqual(v3, v44) ^ 1;
    }
    else
    {
      v44 = [v34 objectForKey:@"NonASCII"];
      int v46 = 0;
      int v45 = UIKeyboardInputModesEqual(v3, v44) ^ 1;
    }

    if ([v33 count]) {
      int v47 = 1;
    }
    else {
      int v47 = v46;
    }
    if ((v47 | v45) == 1)
    {
      if (v34) {
        uint64_t v48 = [v34 mutableCopy];
      }
      else {
        uint64_t v48 = objc_opt_new();
      }
      v49 = (void *)v48;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      v50 = v33;
      id v51 = v33;
      uint64_t v52 = [v51 countByEnumeratingWithState:&v61 objects:v76 count:16];
      if (v52)
      {
        uint64_t v53 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v62 != v53) {
              objc_enumerationMutation(v51);
            }
            [v49 setObject:v3 forKey:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          }
          uint64_t v52 = [v51 countByEnumeratingWithState:&v61 objects:v76 count:16];
        }
        while (v52);
      }

      v33 = v50;
      if (v46) {
        [v49 setObject:v3 forKey:@"ASCIICapable"];
      }
      if (v45) {
        [v49 setObject:v3 forKey:@"NonASCII"];
      }
      v55 = [(UIKeyboardPreferencesController *)self preferencesActions];
      [v55 updateLastUsedKeyboards:v49];

      [(UIKeyboardPreferencesController *)self touchSynchronizePreferencesTimer];
    }
    _Block_object_dispose(&v70, 8);
  }
}

void __69__UIKeyboardPreferencesController_setLanguageAwareInputModeLastUsed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isEqualToString:v8] & 1) != 0
    || (id v6 = *(void **)(a1 + 32),
        TIInputModeGetBaseLanguage(),
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = [v6 isEqualToString:v7],
        v7,
        v6))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
    if ((UIKeyboardInputModesEqual(*(void **)(a1 + 40), v5) & 1) == 0) {
      [*(id *)(a1 + 48) addObject:v8];
    }
  }
}

- (BOOL)allEnabledInputModesAreValid
{
  id v2 = [MEMORY[0x1E4FAE3E0] sharedPreferencesController];
  char v3 = [v2 allEnabledInputModesAreValid];

  return v3;
}

- (double)rivenSizeFactor:(double)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardPreferencesController_rivenSizeFactor___block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  if (qword_1EB261728 != -1) {
    dispatch_once(&qword_1EB261728, block);
  }
  unint64_t v4 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  BOOL v5 = *(double *)&rivenSizeFactor__ppi > 0.0 && v4 == 1;
  double result = *(double *)&rivenSizeFactor__ppi / 132.0;
  if (!v5) {
    double result = 1.0;
  }
  if ((unint64_t)qword_1EB261720 >= 2) {
    double result = 1.23484848;
  }
  double v7 = round(result * a3);
  if (a3 != 1.0) {
    return v7;
  }
  return result;
}

void __51__UIKeyboardPreferencesController_rivenSizeFactor___block_invoke(uint64_t a1)
{
  id v11 = [&unk_1ED3EFEA8 arrayByAddingObjectsFromArray:&unk_1ED3EFEC0];
  id v2 = +[UIDevice currentDevice];
  char v3 = [v2 _deviceInfoForKey:@"main-screen-class"];
  int v4 = [v3 integerValue];

  BOOL v5 = +[UIDevice currentDevice];
  id v6 = [v5 _deviceInfoForKey:@"ProductType"];
  char v7 = [v11 containsObject:v6];

  if ((v7 & 1) != 0 || (v4 & 0xFFFFFFFE) == 6)
  {
    id v8 = +[UIScreen mainScreen];
    [v8 _pointsPerInch];
    rivenSizeFactor__ppuint64_t i = v9;
  }
  v10 = [*(id *)(a1 + 32) valueForPreferenceKey:*MEMORY[0x1E4FAEA98]];
  qword_1EB261720 = (int)[v10 intValue];
}

- (BOOL)spaceConfirmationEnabled
{
  char v3 = UIKeyboardGetCurrentInputMode();
  int v4 = TIInputModeGetBaseLanguage();
  if (([v4 isEqualToString:@"zh"] & 1) != 0
    || [v4 isEqualToString:@"ja"])
  {
    BOOL v5 = TIInputModeGetVariant();
    if ([&unk_1ED3EFED8 containsObject:v5])
    {
      uint64_t v6 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAEAA8]];
      if (v6) {
        char v7 = (void *)v6;
      }
      else {
        char v7 = (void *)MEMORY[0x1E4F1CC38];
      }
      char v8 = [v7 BOOLValue];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)enableProKeyboard
{
  id v2 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:@"KeyboardUseProLayout"];
  char v3 = v2;
  if (v2)
  {
    char v4 = [v2 BOOLValue];
  }
  else
  {
    BOOL v5 = +[UIScreen mainScreen];
    [v5 _referenceBounds];
    char v4 = v6 == 1366.0;
  }
  return v4;
}

- (void)setEnableProKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(UIKeyboardPreferencesController *)self preferencesActions];
    [v7 updateEnableProKeyboard:v3];
  }
}

- (int64_t)handBias
{
  id v2 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAE7B0]];
  if ([@"Left" isEqualToString:v2]) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = [@"Right" isEqualToString:v2];
  }

  return v3;
}

- (void)setHandBias:(int64_t)a3
{
  int64_t v3 = @"None";
  if (a3 == 1) {
    int64_t v3 = @"Right";
  }
  if (a3 == 2) {
    char v4 = @"Left";
  }
  else {
    char v4 = v3;
  }
  id v5 = [(UIKeyboardPreferencesController *)self preferencesActions];
  [v5 updateKeyboardHandBias:v4];
}

- (int64_t)compactAssistantBarPersistentLocation
{
  id v2 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAE570]];
  int64_t v3 = (int)[v2 intValue];

  return v3;
}

- (void)setCompactAssistantBarPersistentLocation:(int64_t)a3
{
  id v4 = [(UIKeyboardPreferencesController *)self preferencesActions];
  [v4 updateCompactAssistantBarPersistentLocation:a3];
}

- (BOOL)isFirstReachableKeyboardInteraction
{
  return [(UIKeyboardPreferencesController *)self BOOLForPreferenceKey:@"KeyboardReachableFirstInteraction"];
}

- (void)performedFirstReachableKeyboardInteraction
{
  int64_t v3 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKeyboardPreferencesController *)self preferencesActions];
    [v5 updateDidPerformFirstReachableKeyboardInteraction];
  }
}

- (int64_t)visceral
{
  id v2 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAEA08]];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setVisceral:(int64_t)a3
{
  id v5 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v4 = [NSNumber numberWithInteger:a3];
  [v5 updateVisceral:v4];
}

- (void)setEnabledDictationLanguages:(id)a3
{
  id v7 = a3;
  char v4 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(UIKeyboardPreferencesController *)self preferencesActions];
    [v6 updateEnabledDictationLanguages:v7];
  }
}

- (void)setLastUsedDictationLanguages:(id)a3
{
  id v7 = a3;
  char v4 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(UIKeyboardPreferencesController *)self preferencesActions];
    [v6 updateLastUsedDictationLanguages:v7];
  }
}

- (void)setDictationAutoPunctuation:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(UIKeyboardPreferencesController *)self preferencesActions];
    id v7 = [NSNumber numberWithBool:v3];
    [v8 updateDictationAutoPunctuation:v7];
  }
}

- (void)setDictationAsPrimaryInputMode:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(UIKeyboardPreferencesController *)self preferencesActions];
    id v7 = [NSNumber numberWithBool:v3];
    [v8 updateDictationAsPrimaryInputMode:v7];
  }
}

- (BOOL)isDictationAsPrimaryInputMode
{
  BOOL v3 = [(UIKeyboardPreferencesController *)self preferencesActions];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  return [(UIKeyboardPreferencesController *)self BOOLForPreferenceKey:@"DictationAsPrimaryInputMode"];
}

- (BOOL)isPreferenceKeyLockedDown:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4FAE3E0];
  id v4 = a3;
  char v5 = [v3 sharedPreferencesController];
  char v6 = [v5 isPreferenceKeyLockedDown:v4];

  return v6;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5 = &unk_1ED700F40;
  BOOL v6 = 1;
  if (!(unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardPreferencesController;
    BOOL v6 = [(UIKeyboardPreferencesController *)&v8 respondsToSelector:a3];
  }

  return v6;
}

- (BOOL)isPasswordAutoFillAllowed
{
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 isPasswordAutoFillAllowed];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)useHardwareGlobeKeyAsEmojiKey
{
  char v3 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:*MEMORY[0x1E4FAE608]];
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  char v5 = [v4 enabledInputModeIdentifiers];

  if (v3 && (unint64_t)[v5 count] >= 3) {
    char v6 = [v3 BOOLValue];
  }
  else {
    char v6 = [(UIKeyboardPreferencesController *)self defaultGlobeAsEmojiKeySetting];
  }
  BOOL v7 = v6;

  return v7;
}

- (BOOL)defaultGlobeAsEmojiKeySetting
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  char v3 = [v2 enabledInputModeIdentifiers];

  int IsEmojiInputModeActive = UIKeyboardIsEmojiInputModeActive();
  if ([v3 count] == 2 && (IsEmojiInputModeActive & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    if ([v3 count] == 3) {
      int v6 = IsEmojiInputModeActive;
    }
    else {
      int v6 = 0;
    }
    if (v6 == 1
      && (+[UIKeyboardImpl sharedInstance],
          BOOL v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 isCapsLockASCIIToggle],
          v7,
          v8))
    {
      uint64_t v9 = +[UIKeyboardImpl sharedInstance];
      char v5 = [v9 capsLockKeyHasLanguageSwitchLabel];
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (BOOL)crescendoEnabled
{
  return 1;
}

- (BOOL)currentInputModeSupportsCrescendo
{
  if (![(UIKeyboardPreferencesController *)self crescendoEnabled]) {
    return 0;
  }
  char v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 textInputTraits];

  uint64_t v5 = [v4 keyboardType];
  if ([v4 isCarPlayIdiom]) {
    goto LABEL_5;
  }
  if (!UIKeyboardGetCurrentIdiom())
  {
    BOOL v6 = 0;
    BOOL v8 = v5 > 0xB || ((1 << v5) & 0x930) == 0;
    if (!v8 || v5 == 127) {
      goto LABEL_6;
    }
  }
  if (v5 == 127)
  {
LABEL_5:
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
    v10 = [v9 currentInputMode];
    id v11 = [v10 identifierWithLayouts];

    BOOL v6 = [(UIKeyboardPreferencesController *)self inputModeSupportsCrescendo:v11];
  }
LABEL_6:

  return v6;
}

- (BOOL)inputModeSupportsCrescendo:(id)a3
{
  id v3 = a3;
  if (!inputModeSupportsCrescendo__supportedModes)
  {
    getTUIKeyboardLayoutFactoryClass_0();
    if (objc_opt_respondsToSelector()) {
      [getTUIKeyboardLayoutFactoryClass_0() crescendoLayouts];
    }
    else {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"Dvorak", @"QWERTY-Chickasaw", @"QWERTY-Choctaw", @"QWERTY-Mikmaw", @"Osage-QWERTY", @"Coptic", @"Mandaic", 0);
    }
    uint64_t v5 = (void *)inputModeSupportsCrescendo__supportedModes;
    inputModeSupportsCrescendo__supportedModes = v4;
  }
  BOOL v6 = KBStarLayoutString(v3);
  char v7 = [(id)inputModeSupportsCrescendo__supportedModes containsObject:v6];

  return v7;
}

- (BOOL)keyboardLanguageIndicatorEnabled
{
  BOOL v3 = +[UIKeyboard isRedesignedTextCursorEnabled];
  if (v3)
  {
    LOBYTE(v3) = [(UIKeyboardPreferencesController *)self BOOLForPreferenceKey:@"KeyboardLanguageIndicatorEnabled"];
  }
  return v3;
}

- (id)inputModeUpdateTime
{
  id v2 = [(UIKeyboardPreferencesController *)self valueForPreferenceKey:@"KeyboardInputModeUpdateDate"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end