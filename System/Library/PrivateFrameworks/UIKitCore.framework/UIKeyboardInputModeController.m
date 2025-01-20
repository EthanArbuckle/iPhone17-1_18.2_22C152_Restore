@interface UIKeyboardInputModeController
+ (BOOL)dictationInputModeIsFunctional;
+ (BOOL)shouldShowDictationMic;
+ (id)ASCIICapableInputModeIdentifierForPreferredLanguages;
+ (id)disallowedDictationLanguagesForDeviceLanguage;
+ (id)inputModeIdentifierForPreferredLanguages:(id)a3 passingTest:(id)a4;
+ (id)multilingualSetForInputModeIdentifier:(id)a3;
+ (id)sharedInputModeController;
- (BOOL)_mayContainExtensionInputModes;
- (BOOL)containsDictationSupportedInputMode;
- (BOOL)containsEmojiInputMode;
- (BOOL)currentLocaleRequiresExtendedSetup;
- (BOOL)delegateImplementsDictationHandlingMethods;
- (BOOL)delegateImplementsLegacyDictationHandlingMethods;
- (BOOL)deviceStateIsLocked;
- (BOOL)disableFloatingKeyboardFilter;
- (BOOL)disablesUpdateLastUsedInputModeTimer;
- (BOOL)identifierIsValidSystemInputMode:(id)a3;
- (BOOL)isDictationLanguageEnabled:(id)a3;
- (BOOL)isLockscreenPasscodeKeyboard;
- (BOOL)lastInputModeSwitchTriggeredByASCIIToggle;
- (BOOL)shouldRunContinuousDiscovery;
- (BOOL)toggleDictationForResponder:(id)a3 withOption:(id)a4 firstResponderSetupCompletion:(id)a5;
- (BOOL)verifyKeyboardExtensionsWithApp;
- (NSArray)activeDictationLanguages;
- (NSArray)activeDictationSupportedInputModeIdentifiers;
- (NSArray)activeInputModeIdentifiers;
- (NSArray)activeUserSelectableInputModeIdentifiers;
- (NSArray)additionalTextInputLocales;
- (NSArray)allowedExtensions;
- (NSArray)defaultInputModes;
- (NSArray)defaultKeyboardInputModes;
- (NSArray)defaultNormalizedInputModes;
- (NSArray)defaultRawInputModes;
- (NSArray)enabledDictationLanguages;
- (NSArray)enabledInputModeIdentifiers;
- (NSArray)enabledInputModeLanguages;
- (NSArray)enabledInputModes;
- (NSArray)inputModesWithoutHardwareSupport;
- (NSArray)keyboardInputModeIdentifiers;
- (NSArray)keyboardInputModes;
- (NSArray)normalizedEnabledInputModeIdentifiers;
- (NSArray)normalizedInputModes;
- (NSArray)suggestedInputModesForSiriLanguage;
- (NSArray)supportedInputModeIdentifiers;
- (NSArray)userSelectableKeyboardInputModeIdentifiers;
- (NSArray)userSelectableKeyboardInputModes;
- (NSDate)defaultsLastChangedDate;
- (NSString)hardwareKeyboardExclusivityIdentifier;
- (NSString)inputModeContextIdentifier;
- (NSString)textEffectsButtonLanguageCode;
- (UIKeyboardInputMode)currentInputMode;
- (UIKeyboardInputMode)currentInputModeInPreference;
- (UIKeyboardInputMode)currentLinguisticInputMode;
- (UIKeyboardInputMode)currentPublicInputMode;
- (UIKeyboardInputMode)currentSystemInputMode;
- (UIKeyboardInputMode)currentUsedInputMode;
- (UIKeyboardInputMode)hardwareInputMode;
- (UIKeyboardInputMode)inputModeThatInvokeEmoji;
- (UIKeyboardInputMode)lastUsedInputMode;
- (UIKeyboardInputMode)lastUsedInputModeForCurrentContext;
- (UIKeyboardInputMode)nextInputModeToUse;
- (UIKeyboardInputModeController)init;
- (UIKeyboardInputModeControllerDelegate)delegate;
- (UITextInputMode)documentInputMode;
- (id)_MCFilteredExtensionIdentifiers;
- (id)_allExtensionsFromMatchingExtensions:(id)a3;
- (id)_prefixedKey;
- (id)_prefixedSetTimeKey;
- (id)_systemInputModePassingLanguageTest:(id)a3;
- (id)_systemInputModePassingTest:(id)a3;
- (id)activeInputModes;
- (id)activeUserSelectableInputModes;
- (id)appendPasscodeInputModes:(id)a3;
- (id)currentSystemInputModeExcludingEmoji:(BOOL)a3;
- (id)defaultDictationLanguages:(id)a3;
- (id)defaultEnabledInputModesForCurrentLocale:(BOOL)a3;
- (id)enabledInputModeIdentifiers:(BOOL)a3;
- (id)extensionInputModes;
- (id)extensionMatchingContext;
- (id)fallbackCurrentInputModeForFilteredInputMode:(id)a3 fromInputModes:(id)a4;
- (id)fallbackCurrentInputModeForFilteredInputModeIdentifier:(id)a3 fromInputModeIdentifiers:(id)a4;
- (id)filteredInputModesForSiriLanguageFromInputModes:(id)a3;
- (id)filteredPadInputModesFromInputModes:(id)a3 withRules:(id)a4;
- (id)filteredTVInputModesFromInputModes:(id)a3;
- (id)fullInputModeFromIdentifier:(id)a3 hardwareKeyboardLanguage:(id)a4;
- (id)getDictationSLSLanguagesEnabled;
- (id)hardwareLayoutToUseForInputMode:(id)a3;
- (id)hardwareLayoutToUseForInputMode:(id)a3 hardwareKeyboardLanguage:(id)a4 countryCode:(id)a5;
- (id)identifiersFromInputModes:(id)a3;
- (id)inputModeByReplacingSoftwareLayoutWithSoftwareLayout:(id)a3 inInputMode:(id)a4;
- (id)inputModeForASCIIToggleWithTraits:(id)a3;
- (id)inputModeIdentifierLastUsedForLanguage:(id)a3;
- (id)inputModeIdentifierLastUsedForLanguage:(id)a3 includingExtensions:(BOOL)a4;
- (id)inputModeLastUsedForLanguage:(id)a3;
- (id)inputModeLastUsedForLanguage:(id)a3 includingExtensions:(BOOL)a4;
- (id)inputModeToAddForKeyboardLanguage:(id)a3 countryCode:(id)a4 activeModes:(id)a5;
- (id)inputModeToRestoreFrom:(id)a3;
- (id)inputModeWithIdentifier:(id)a3;
- (id)inputModesByAppendingApplicationLanguagesToInputModes:(id)a3;
- (id)inputModesFromIdentifiers:(id)a3;
- (id)keyboardLanguageForDictationLanguage:(id)a3;
- (id)lastUsedInputModeForTextInputMode:(id)a3;
- (id)nextInputModeFromList:(id)a3 withFilter:(unint64_t)a4 withTraits:(id)a5;
- (id)nextInputModeInPreferenceListForTraits:(id)a3;
- (id)nextInputModeInPreferenceListForTraits:(id)a3 updatePreference:(BOOL)a4;
- (id)nextInputModeInPreferenceListForTraits:(id)a3 updatePreference:(BOOL)a4 skipEmoji:(BOOL)a5;
- (id)nextInputModeToUseForTraits:(id)a3;
- (id)nextInputModeToUseForTraits:(id)a3 updatePreference:(BOOL)a4;
- (id)suggestedDictationLanguagesForDeviceLanguage;
- (id)suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:(id)a3;
- (id)suggestedInputModesForCurrentLocale;
- (id)suggestedInputModesForCurrentLocale:(BOOL)a3 fallbackToDefaultInputModes:(BOOL)a4;
- (id)suggestedInputModesForHardwareKeyboardLanguage:(id)a3 countryCode:(id)a4 inputModes:(id)a5;
- (id)suggestedInputModesForLocales:(id)a3;
- (id)suggestedInputModesForPreferredLanguages;
- (id)supportedFullModesForHardwareKeyboard:(id)a3 countryCode:(id)a4 activeModes:(id)a5 matchedMode:(id *)a6;
- (id)supportedInputModesFromArray:(id)a3;
- (id)textInputModeForResponder:(id)a3;
- (id)updateEnabledDictationLanguages:(BOOL)a3;
- (id)userSelectableInputModeIdentifiersFromInputModeIdentifiers:(id)a3;
- (id)userSelectableInputModesFromInputModes:(id)a3;
- (void)_beginContinuousDiscoveryIfNeeded;
- (void)_clearAllExtensions;
- (void)_clearAllExtensionsIfNeeded;
- (void)_inputModeChangedWhileContextTracked;
- (void)_removeInputModes:(id)a3;
- (void)_setCurrentAndNextInputModePreference;
- (void)_setCurrentInputMode:(id)a3 force:(BOOL)a4;
- (void)_trackInputModeIfNecessary:(id)a3;
- (void)changePreferredEmojiSearchInputModeForInputDelegate:(id)a3;
- (void)clearNextInputModeToUse;
- (void)dealloc;
- (void)didAcceptAddKeyboardInputMode;
- (void)didEnterBackground:(id)a3;
- (void)downloadDictationLangaugesAssets;
- (void)forceDictationReturnToKeyboardInputMode;
- (void)getHardwareKeyboardLanguage:(id *)a3 countryCode:(id *)a4;
- (void)handleLastUsedInputMode:(id)a3 withNewInputMode:(id)a4;
- (void)handleSpecificHardwareKeyboard:(id)a3;
- (void)loadSuggestedInputModesForSiriLanguage;
- (void)performWithForcedExtensionInputModes:(id)a3;
- (void)performWithoutExtensionInputModes:(id)a3;
- (void)presentEnablementAndDataSharingPromptIfNeeded:(id)a3;
- (void)releaseAddKeyboardNotification;
- (void)saveDeviceUnlockPasscodeInputModes;
- (void)setAdditionalTextInputLocales:(id)a3;
- (void)setCurrentInputMode:(id)a3;
- (void)setCurrentInputModeInPreference:(id)a3;
- (void)setCurrentUsedInputMode:(id)a3;
- (void)setDefaultInputModes:(id)a3;
- (void)setDefaultKeyboardInputModes:(id)a3;
- (void)setDefaultNormalizedInputModes:(id)a3;
- (void)setDefaultRawInputModes:(id)a3;
- (void)setDefaultsLastChangedDate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateImplementsDictationHandlingMethods:(BOOL)a3;
- (void)setDelegateImplementsLegacyDictationHandlingMethods:(BOOL)a3;
- (void)setDictationSLSLanguagesEnabled:(id)a3;
- (void)setDisableFloatingKeyboardFilter:(BOOL)a3;
- (void)setDisablesUpdateLastUsedInputModeTimer:(BOOL)a3;
- (void)setDocumentInputMode:(id)a3;
- (void)setEnabledInputModes:(id)a3;
- (void)setExtensionMatchingContext:(id)a3;
- (void)setInputModeContextIdentifier:(id)a3;
- (void)setInputModeThatInvokeEmoji:(id)a3;
- (void)setKeyboardInputModeIdentifiers:(id)a3;
- (void)setKeyboardInputModes:(id)a3;
- (void)setLastInputModeSwitchTriggeredByASCIIToggle:(BOOL)a3;
- (void)setLastUsedInputMode:(id)a3;
- (void)setNextInputModeToUse:(id)a3;
- (void)setNormalizedInputModes:(id)a3;
- (void)setShouldRunContinuousDiscovery:(BOOL)a3;
- (void)setSuggestedInputModesForSiriLanguage:(id)a3;
- (void)setUserSelectableKeyboardInputModeIdentifiers:(id)a3;
- (void)setUserSelectableKeyboardInputModes:(id)a3;
- (void)showAddKeyboardAlertForInputModeIdentifier:(id)a3;
- (void)startDictationConnectionForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4;
- (void)stopDictation;
- (void)stopDictationAndResignFirstResponder;
- (void)switchToCurrentSystemInputMode;
- (void)switchToDictationInputMode;
- (void)switchToDictationInputModeWithOptions:(id)a3;
- (void)toggleDictationForResponder:(id)a3 WithOptions:(id)a4;
- (void)updateCurrentAndNextInputModes;
- (void)updateCurrentInputMode:(id)a3;
- (void)updateDefaultInputModesIfNecessaryForIdiom;
- (void)updateEnabledDictationAndSLSLanguagesWithCompletionBlock:(id)a3;
- (void)updateLastUsedInputMode:(id)a3;
- (void)updateUserSelectableInputModes;
- (void)willEnterForeground:(id)a3;
@end

@implementation UIKeyboardInputModeController

- (id)appendPasscodeInputModes:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[UIKeyboard keyboardBundleIdentifier];
  if ([v5 isEqualToString:@"com.apple.springboard"])
  {
    v6 = +[UIKeyboardImpl activeInstance];
    v7 = [v6 textInputTraits];
    uint64_t v8 = [v7 keyboardAppearance];

    id v20 = v4;
    if (v8 == 127)
    {
      v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
      v10 = [v9 preferencesActions];
      v11 = [v10 valueForPreferenceKey:*MEMORY[0x1E4FAE530]];

      id v20 = v4;
      if (v11)
      {
        v12 = v4;
        id v20 = (id)[v4 mutableCopy];
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              if ([(UIKeyboardInputModeController *)self identifierIsValidSystemInputMode:v18])
              {
                v21[0] = MEMORY[0x1E4F143A8];
                v21[1] = 3221225472;
                v21[2] = __58__UIKeyboardInputModeController_appendPasscodeInputModes___block_invoke;
                v21[3] = &unk_1E52F33B0;
                v21[4] = v18;
                if ([v12 indexOfObjectPassingTest:v21] == 0x7FFFFFFFFFFFFFFFLL) {
                  [v20 addObject:v18];
                }
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v15);
        }

        id v4 = v12;
      }
    }
  }
  else
  {

    id v20 = v4;
  }

  return v20;
}

- (UIKeyboardInputMode)currentSystemInputMode
{
  return (UIKeyboardInputMode *)[(UIKeyboardInputModeController *)self currentSystemInputModeExcludingEmoji:1];
}

- (void)_trackInputModeIfNecessary:(id)a3
{
  id v35 = a3;
  if (!+[UIKeyboard usesInputSystemUI])
  {
    uint64_t v4 = +[UIKeyboardImpl activeInstance];
    if (v4)
    {
      v5 = (void *)v4;
      int v6 = [v35 _requiresKeyboardWhenFirstResponder];

      if (v6)
      {
        v7 = +[UIKeyboardImpl activeInstance];
        uint64_t v8 = [v7 inputDelegateManager];
        v9 = [v8 textInputTraits];
        uint64_t v10 = [v9 keyboardType];

        if (v10 != 124)
        {
          v11 = [(UIKeyboardInputModeController *)self inputModeContextIdentifier];
          v12 = [v35 textInputContextIdentifier];
          char v13 = KBEqualStrings(v11, v12);

          if ((v13 & 1) == 0)
          {
            uint64_t v14 = [v35 textInputContextIdentifier];
            [(UIKeyboardInputModeController *)self setInputModeContextIdentifier:v14];

            uint64_t v15 = [(UIKeyboardInputModeController *)self inputModeContextIdentifier];

            if (v15)
            {
              uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"UITextInputContextIdentifiers"];
              v17 = [(UIKeyboardInputModeController *)self _prefixedKey];
              if (v17)
              {
                uint64_t v18 = [v16 objectForKey:v17];
                if (!v18) {
                  [(UIKeyboardInputModeController *)self _inputModeChangedWhileContextTracked];
                }
              }
            }
          }
          v19 = [(UIKeyboardInputModeController *)self inputModeContextIdentifier];

          if (v19)
          {
            id v20 = [v35 textInputMode];
            v21 = [(UIKeyboardInputModeController *)self lastUsedInputModeForTextInputMode:v20];

            if (!v21) {
              goto LABEL_23;
            }
            long long v22 = [(UIKeyboardInputModeController *)self currentInputMode];
            char v23 = [v22 isEqual:v21];

            if (v23) {
              goto LABEL_23;
            }
            long long v24 = [(UIKeyboardInputModeController *)self activeInputModes];
            int v25 = [v24 containsObject:v21];

            if (v25)
            {
              [(UIKeyboardInputModeController *)self setCurrentInputMode:v21];
            }
            else
            {
              uint64_t v26 = [(UIKeyboardInputModeController *)self inputModeContextIdentifier];
              if (v26)
              {
                uint64_t v27 = (void *)v26;
                v28 = +[UIKeyboardPreferencesController sharedPreferencesController];
                v29 = [v28 preferencesActions];
                if ([v29 BOOLForPreferenceKey:*MEMORY[0x1E4FAE518]])
                {
                  v30 = +[UIKeyboardPreferencesController sharedPreferencesController];
                  v31 = [v30 preferencesActions];
                  v32 = [v31 valueForPreferenceKey:*MEMORY[0x1E4FAE520]];
                  v33 = [v21 identifier];
                  char v34 = [v32 containsObject:v33];

                  if (v34) {
                    goto LABEL_23;
                  }
                }
                else
                {
                }
                [(UIKeyboardInputModeController *)self _inputModeChangedWhileContextTracked];
              }
            }
LABEL_23:
          }
        }
      }
    }
  }
}

- (NSString)hardwareKeyboardExclusivityIdentifier
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F4F320], "sharedInstance", 0);
  v3 = [v2 allKeyboardDevices];

  uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        uint64_t v8 = [v7 exclusivityIdentifier];

        if (v8)
        {
          uint64_t v4 = [v7 exclusivityIdentifier];
          goto LABEL_11;
        }
      }
      uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (NSString *)v4;
}

- (NSArray)normalizedEnabledInputModeIdentifiers
{
  return (NSArray *)[(UIKeyboardInputModeController *)self enabledInputModeIdentifiers:1];
}

- (UIKeyboardInputMode)currentPublicInputMode
{
  if (self->_suppressCurrentPublicInputMode)
  {
    id v2 = 0;
    goto LABEL_12;
  }
  uint64_t v4 = [(UIKeyboardInputModeController *)self currentInputMode];
  if (![v4 isEmojiInputMode]) {
    goto LABEL_10;
  }
  uint64_t v5 = [(UIKeyboardInputModeController *)self currentUsedInputMode];

  if (!v5 || [v5 isEmojiInputMode])
  {
    id v2 = [(UIKeyboardInputModeController *)self nextInputModeToUse];

    uint64_t v5 = v2;
    if (!v2) {
      goto LABEL_11;
    }
  }
  if (([v5 isEmojiInputMode] & 1) == 0)
  {
    uint64_t v4 = v5;
LABEL_10:
    id v2 = v4;
    uint64_t v5 = v2;
    goto LABEL_11;
  }
  id v2 = 0;
LABEL_11:

LABEL_12:
  return (UIKeyboardInputMode *)v2;
}

- (NSArray)activeInputModeIdentifiers
{
  id v3 = [(UIKeyboardInputModeController *)self enabledInputModeIdentifiers];
  return [(UIKeyboardInputModeController *)self keyboardInputModeIdentifiers];
}

- (id)enabledInputModeIdentifiers:(BOOL)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v6 = [v5 preferencesActions];
  char v7 = [v6 BOOLForPreferenceKey:*MEMORY[0x1E4FAE518]];

  if ((v7 & 1) == 0)
  {
    id v16 = [(UIKeyboardInputModeController *)self defaultEnabledInputModesForCurrentLocale:1];
    v17 = [(UIKeyboardInputModeController *)self defaultInputModes];
    [(UIKeyboardInputModeController *)self setEnabledInputModes:v17];

    uint64_t v18 = [(UIKeyboardInputModeController *)self defaultNormalizedInputModes];
    [(UIKeyboardInputModeController *)self setNormalizedInputModes:v18];

    v19 = [(UIKeyboardInputModeController *)self defaultKeyboardInputModes];
    [(UIKeyboardInputModeController *)self setKeyboardInputModes:v19];

    id v20 = [(UIKeyboardInputModeController *)self defaultInputModes];
    [(UIKeyboardInputModeController *)self setKeyboardInputModeIdentifiers:v20];

    [(UIKeyboardInputModeController *)self updateUserSelectableInputModes];
    goto LABEL_59;
  }
  uint64_t v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
  v9 = [v8 preferencesActions];
  long long v10 = [v9 valueForPreferenceKey:*MEMORY[0x1E4FAE520]];
  long long v11 = [(UIKeyboardInputModeController *)self appendPasscodeInputModes:v10];

  long long v12 = [(UIKeyboardInputModeController *)self inputModesByAppendingApplicationLanguagesToInputModes:v11];

  long long v13 = +[UIKeyboardImpl activeInstance];
  uint64_t v14 = [v13 textInputTraits];
  LODWORD(v10) = [v14 loadKeyboardsForSiriLanguage];

  if (v10)
  {
    uint64_t v15 = [(UIKeyboardInputModeController *)self filteredInputModesForSiriLanguageFromInputModes:v12];
LABEL_13:

    long long v12 = (void *)v15;
    goto LABEL_14;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && ![(UIKeyboardInputModeController *)self disableFloatingKeyboardFilter]
    && !+[UIKeyboardImpl isFloating])
  {
    v21 = [(UIKeyboardInputModeController *)self inputModesFromIdentifiers:v12];
    long long v22 = &unk_1ED3F78E8;
    goto LABEL_12;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && +[UIKeyboardImpl isFloating])
  {
    v21 = [(UIKeyboardInputModeController *)self inputModesFromIdentifiers:v12];
    long long v22 = &unk_1ED3F7910;
LABEL_12:
    uint64_t v23 = [(UIKeyboardInputModeController *)self filteredPadInputModesFromInputModes:v21 withRules:v22];

    uint64_t v15 = [(UIKeyboardInputModeController *)self identifiersFromInputModes:v23];

    long long v12 = (void *)v23;
    goto LABEL_13;
  }
LABEL_14:
  BOOL v24 = ![(UIKeyboardInputModeController *)self verifyKeyboardExtensionsWithApp];
  if (self->_excludeExtensionInputModes == v24)
  {
    if (self->_cacheNeedsRefresh)
    {
      BOOL skipExtensionInputModes = self->_skipExtensionInputModes;
      self->_excludeExtensionInputModes = v24;
      if (!skipExtensionInputModes) {
        goto LABEL_24;
      }
    }
    else
    {
      self->_excludeExtensionInputModes = v24;
    }
    uint64_t v26 = [(UIKeyboardInputModeController *)self enabledInputModes];
    if ([v26 count])
    {
      uint64_t v27 = [(UIKeyboardInputModeController *)self enabledInputModes];
      char v28 = [v27 isEqualToArray:v12];

      if (v28) {
        goto LABEL_58;
      }
    }
    else
    {
    }
    goto LABEL_24;
  }
  self->_excludeExtensionInputModes = v24;
LABEL_24:
  BOOL v61 = a3;
  v29 = [MEMORY[0x1E4F1CA48] array];
  v30 = [MEMORY[0x1E4F1CA48] array];
  v31 = [MEMORY[0x1E4F1CA48] array];
  v32 = [MEMORY[0x1E4F1CA48] array];
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  v60 = v12;
  id obj = v12;
  uint64_t v65 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
  if (!v65) {
    goto LABEL_53;
  }
  uint64_t v64 = *(void *)v70;
  v62 = v32;
  do
  {
    uint64_t v33 = 0;
    do
    {
      if (*(void *)v70 != v64) {
        objc_enumerationMutation(obj);
      }
      id v34 = *(id *)(*((void *)&v69 + 1) + 8 * v33);
      if (![(UIKeyboardInputModeController *)self identifierIsValidSystemInputMode:v34])
      {
        if ([(UIKeyboardInputModeController *)self isLockscreenPasscodeKeyboard]) {
          goto LABEL_48;
        }
LABEL_36:
        id v34 = v34;
        v44 = v34;
        if ([(UIKeyboardInputModeController *)self identifierIsValidSystemInputMode:v34])
        {
          v44 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v34);
        }
        v45 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v44];
        v46 = v45;
        if (v45)
        {
          if (![v45 isExtensionInputMode]
            || ([v29 containsObject:v34] & 1) != 0)
          {
            v47 = TIInputModeGetNormalizedIdentifier();
            if (![v30 containsObject:v47]
              || ([v29 containsObject:v44] & 1) == 0)
            {
              [v29 addObject:v44];
              [v30 addObject:v47];
              [v31 addObject:v46];
              [v32 addObject:v44];
            }

            goto LABEL_47;
          }
          if (!self->_excludeExtensionInputModes)
          {
            [v29 addObject:v34];
            [v30 addObject:v34];
            [v31 addObject:v46];
            v48 = v32;
LABEL_46:
            [v48 addObject:v34];
          }
LABEL_47:

          goto LABEL_48;
        }
        [v29 addObject:v34];
        v48 = v30;
        goto LABEL_46;
      }
      if ([v34 rangeOfString:@"@"] != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_36;
      }
      id v35 = TICanonicalInputModeName();
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __76__UIKeyboardInputModeController_Compatibility__enabledInputModeIdentifiers___block_invoke;
      v66[3] = &unk_1E52F3550;
      id v34 = v34;
      id v67 = v34;
      id v36 = v35;
      id v68 = v36;
      v37 = [obj indexesOfObjectsPassingTest:v66];
      unint64_t v38 = [v37 count];
      if (v38 <= 1)
      {
        v39 = v31;
        v40 = self;
        v41 = v30;
        v42 = v29;
        id v43 = v36;

        id v34 = v43;
        v29 = v42;
        v30 = v41;
        self = v40;
        v31 = v39;
        v32 = v62;
      }

      if (v38 < 2) {
        goto LABEL_36;
      }
LABEL_48:

      ++v33;
    }
    while (v65 != v33);
    uint64_t v49 = [obj countByEnumeratingWithState:&v69 objects:v73 count:16];
    uint64_t v65 = v49;
  }
  while (v49);
LABEL_53:

  if (![v31 count]
    || [v31 count] == 1
    && ([v31 firstObject],
        v50 = objc_claimAutoreleasedReturnValue(),
        [v50 primaryLanguage],
        v51 = objc_claimAutoreleasedReturnValue(),
        int v52 = [v51 isEqualToString:@"emoji"],
        v51,
        v50,
        v52))
  {
    id v53 = [(UIKeyboardInputModeController *)self defaultEnabledInputModesForCurrentLocale:1];
    v54 = [(UIKeyboardInputModeController *)self defaultInputModes];
    [v29 setArray:v54];

    v55 = [(UIKeyboardInputModeController *)self defaultNormalizedInputModes];
    [v30 setArray:v55];

    v56 = [(UIKeyboardInputModeController *)self defaultKeyboardInputModes];
    [v31 setArray:v56];

    v57 = [(UIKeyboardInputModeController *)self defaultInputModes];
    [v32 setArray:v57];
  }
  [(UIKeyboardInputModeController *)self setEnabledInputModes:v29];
  [(UIKeyboardInputModeController *)self setNormalizedInputModes:v30];
  [(UIKeyboardInputModeController *)self setKeyboardInputModes:v31];
  [(UIKeyboardInputModeController *)self setKeyboardInputModeIdentifiers:v32];
  [(UIKeyboardInputModeController *)self updateUserSelectableInputModes];

  a3 = v61;
  long long v12 = v60;
LABEL_58:

LABEL_59:
  self->_cacheNeedsRefresh = 0;
  if (a3) {
    [(UIKeyboardInputModeController *)self normalizedInputModes];
  }
  else {
  v58 = [(UIKeyboardInputModeController *)self enabledInputModes];
  }
  return v58;
}

- (NSArray)defaultInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)enabledInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)updateUserSelectableInputModes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKeyboardInputModeController *)self keyboardInputModes];
  uint64_t v4 = [(UIKeyboardInputModeController *)self userSelectableInputModesFromInputModes:v3];

  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "identifier", (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(UIKeyboardInputModeController *)self setUserSelectableKeyboardInputModes:v6];
  [(UIKeyboardInputModeController *)self setUserSelectableKeyboardInputModeIdentifiers:v5];
}

- (id)userSelectableInputModesFromInputModes:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    id obj = v5;
    while (1)
    {
      uint64_t v10 = 0;
      uint64_t v46 = v8;
      do
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v58 + 1) + 8 * v10);
        long long v12 = [v11 identifier];
        if ((TIInputModeIsMultilingualOnly() & 1) == 0)
        {
          id v13 = v6;
          long long v14 = [(id)objc_opt_class() multilingualSetForInputModeIdentifier:v12];
          if ((unint64_t)[v14 count] < 2) {
            goto LABEL_12;
          }
          long long v15 = [v14 objectAtIndexedSubscript:0];
          if ([v15 isEqualToString:v12])
          {

            goto LABEL_12;
          }
          id v16 = [v14 objectAtIndexedSubscript:0];
          UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v16);
          uint64_t v17 = v9;
          v19 = uint64_t v18 = self;
          int v48 = [v19 isEqualToString:v12];

          self = v18;
          uint64_t v9 = v17;
          uint64_t v8 = v46;

          uint64_t v5 = obj;
          if (v48) {
LABEL_12:
          }
            [v5 addObject:v11];

          id v6 = v13;
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v64 count:16];
      if (!v8)
      {
LABEL_16:
        id v20 = v6;
        goto LABEL_44;
      }
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v21 = v4;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v47 = 0;
    uint64_t v49 = 0;
    BOOL v24 = 0;
    uint64_t v25 = *(void *)v55;
    uint64_t v26 = *MEMORY[0x1E4FAE6E0];
    uint64_t v43 = *MEMORY[0x1E4FAE738];
    id obja = v21;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(obja);
        }
        char v28 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v29 = objc_msgSend(v28, "normalizedIdentifier", v43);
        v30 = TIGetInputModeProperties();
        v31 = [v30 objectForKey:v26];
        int v32 = [v31 BOOLValue];

        if (v32)
        {
          id v33 = v28;

          ++v47;
          BOOL v24 = v33;
        }
        else
        {
          id v34 = [v30 objectForKey:v43];
          unsigned int v35 = [v34 BOOLValue];

          v49 += v35;
        }
      }
      id v21 = obja;
      uint64_t v23 = [obja countByEnumeratingWithState:&v54 objects:v63 count:16];
    }
    while (v23);
  }
  else
  {
    uint64_t v47 = 0;
    uint64_t v49 = 0;
    BOOL v24 = 0;
  }

  if (v49 == 1)
  {
    id v6 = v24;
    if (v47 == 1 && v24)
    {
      id v36 = [MEMORY[0x1E4F1CA48] array];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v37 = v21;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v50 objects:v62 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v51 != v40) {
              objc_enumerationMutation(v37);
            }
            if (*(id *)(*((void *)&v50 + 1) + 8 * j) != v6) {
              objc_msgSend(v36, "addObject:");
            }
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v50 objects:v62 count:16];
        }
        while (v39);
      }

      id v21 = (id)[v36 copy];
    }
  }
  else
  {
    id v6 = v24;
  }
  id v20 = v21;
  uint64_t v5 = v20;
LABEL_44:

  return v5;
}

+ (id)multilingualSetForInputModeIdentifier:(id)a3
{
  return (id)TIInputModeGetMultilingualSet();
}

- (BOOL)verifyKeyboardExtensionsWithApp
{
  id v2 = [(id)UIApp delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 application:UIApp shouldAllowExtensionPointIdentifier:@"com.apple.keyboard-service"];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (void)setUserSelectableKeyboardInputModes:(id)a3
{
}

- (void)setUserSelectableKeyboardInputModeIdentifiers:(id)a3
{
}

- (void)setNormalizedInputModes:(id)a3
{
}

- (void)setKeyboardInputModes:(id)a3
{
}

- (void)setKeyboardInputModeIdentifiers:(id)a3
{
}

- (void)setEnabledInputModes:(id)a3
{
}

- (NSArray)defaultKeyboardInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (id)defaultEnabledInputModesForCurrentLocale:(BOOL)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(UIKeyboardInputModeController *)self defaultRawInputModes];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = +[UIKeyboardImpl activeInstance];
  uint64_t v8 = [v7 textInputTraits];
  int v9 = [v8 loadKeyboardsForSiriLanguage];

  if (v9)
  {
    uint64_t v10 = [(UIKeyboardInputModeController *)self suggestedInputModesForSiriLanguage];
    long long v11 = [v10 firstObject];
    long long v12 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v11];
    id v13 = [v12 primaryLanguage];

    long long v14 = TIGetDefaultInputModesForLanguage();
    long long v15 = [(UIKeyboardInputModeController *)self filteredInputModesForSiriLanguageFromInputModes:v14];
  }
  else
  {
    id v16 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
    uint64_t v17 = [v16 defaultEnabledInputModesForCurrentLocale];
    id v13 = [(UIKeyboardInputModeController *)self appendPasscodeInputModes:v17];

    long long v15 = [(UIKeyboardInputModeController *)self inputModesByAppendingApplicationLanguagesToInputModes:v13];
  }

  if (([v15 isEqualToArray:v6] & 1) == 0)
  {
    BOOL v31 = a3;
    int v32 = v6;
    id v33 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v30 = v15;
    id v20 = v15;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(*(void **)(*((void *)&v34 + 1) + 8 * i));
          uint64_t v26 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v25];
          if (v26 && ([v19 containsObject:v25] & 1) == 0)
          {
            uint64_t v27 = [v26 normalizedIdentifier];
            [v18 addObject:v27];

            [v19 addObject:v25];
            [v33 addObject:v26];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v22);
    }

    [(UIKeyboardInputModeController *)self setDefaultRawInputModes:v20];
    [(UIKeyboardInputModeController *)self setDefaultKeyboardInputModes:v33];
    [(UIKeyboardInputModeController *)self setDefaultNormalizedInputModes:v18];
    [(UIKeyboardInputModeController *)self setDefaultInputModes:v19];

    id v6 = v32;
    a3 = v31;
    long long v15 = v30;
  }
  [(UIKeyboardInputModeController *)self updateDefaultInputModesIfNecessaryForIdiom];
  if (a3) {
    [(UIKeyboardInputModeController *)self defaultNormalizedInputModes];
  }
  else {
  char v28 = [(UIKeyboardInputModeController *)self defaultInputModes];
  }

  return v28;
}

- (NSArray)inputModesWithoutHardwareSupport
{
  inputModesWithoutHardwareSupport = self->_inputModesWithoutHardwareSupport;
  if (!inputModesWithoutHardwareSupport)
  {
    id v4 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"emoji", @"ja_JP-HWR", @"zh_Hant-HWR", @"zh_Hans-HWR", @"yue_Hant-HWR", 0);
    uint64_t v5 = self->_inputModesWithoutHardwareSupport;
    self->_inputModesWithoutHardwareSupport = v4;

    inputModesWithoutHardwareSupport = self->_inputModesWithoutHardwareSupport;
  }
  return inputModesWithoutHardwareSupport;
}

- (BOOL)identifierIsValidSystemInputMode:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4FAE2D8];
  id v4 = a3;
  uint64_t v5 = [v3 sharedInputModeController];
  char v6 = [v5 identifierIsValidSystemInputMode:v4];

  return v6;
}

- (id)inputModesByAppendingApplicationLanguagesToInputModes:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(UIKeyboardInputModeController *)self additionalTextInputLocales];
  uint64_t v6 = [v5 count];

  uint64_t v7 = v4;
  if (v6)
  {
    uint64_t v7 = (void *)[v4 mutableCopy];
    uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v35 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v48 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = TIInputModeGetLanguage();
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v11);
    }
    long long v34 = v9;

    long long v15 = [MEMORY[0x1E4F1CA20] currentLocale];
    long long v36 = [v15 localeIdentifier];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [(UIKeyboardInputModeController *)self additionalTextInputLocales];
    uint64_t v16 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        uint64_t v19 = 0;
        uint64_t v37 = v17;
        do
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v43 + 1) + 8 * v19);
          uint64_t v21 = [v20 localeIdentifier];
          uint64_t v22 = TIInputModeGetLanguage();

          if (([v8 containsObject:v22] & 1) == 0)
          {
            uint64_t v23 = v8;
            [v8 addObject:v22];
            BOOL v24 = (void *)MEMORY[0x1E4FAE2D8];
            uint64_t v25 = [v20 localeIdentifier];
            uint64_t v26 = [v24 _inputModesForLocale:v36 language:v25 modeFetcher:&__block_literal_global_1112];

            long long v41 = 0u;
            long long v42 = 0u;
            long long v39 = 0u;
            long long v40 = 0u;
            id v27 = v26;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v40;
              do
              {
                for (uint64_t j = 0; j != v29; ++j)
                {
                  if (*(void *)v40 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                  if (([v7 containsObject:v32] & 1) == 0) {
                    [v7 addObject:v32];
                  }
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
              }
              while (v29);
            }

            uint64_t v17 = v37;
            uint64_t v8 = v23;
          }

          ++v19;
        }
        while (v19 != v17);
        uint64_t v17 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v17);
    }

    id v4 = v35;
  }

  return v7;
}

- (NSArray)additionalTextInputLocales
{
  return self->_additionalTextInputLocales;
}

- (NSArray)defaultNormalizedInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

uint64_t __70__UIKeyboardInputModeController_currentSystemInputModeExcludingEmoji___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 isExtensionInputMode] & 1) == 0
    && (!*(unsigned char *)(a1 + 40) || ([v3 isEmojiInputMode] & 1) == 0)
    && ([v3 isSpecializedInputMode] & 1) == 0)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = (id)UIKeyboardActiveInputModes;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
LABEL_9:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * v10);
        uint64_t v12 = objc_msgSend(v3, "identifier", (void)v23);
        LOBYTE(v11) = UIKeyboardInputBaseLanguagesEqual(v11, v12);

        if (v11) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
          if (v8) {
            goto LABEL_9;
          }
          goto LABEL_23;
        }
      }

      id v13 = [*(id *)(a1 + 32) keyboardInputModes];
      char v14 = [v13 containsObject:v3];

      if ((v14 & 1) != 0
        || ([v3 identifier],
            long long v15 = objc_claimAutoreleasedReturnValue(),
            char v16 = [v15 isEqualToString:*MEMORY[0x1E4FAE770]],
            v15,
            (v16 & 1) != 0))
      {
        uint64_t v4 = 1;
        goto LABEL_6;
      }
      uint64_t v17 = [v3 identifier];
      int IsASCIICapable = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v17);

      if (!IsASCIICapable) {
        goto LABEL_5;
      }
      id v6 = [*(id *)(a1 + 32) inputModeIdentifierLastUsedForLanguage:@"NonASCII"];
      if (![v6 length]) {
        goto LABEL_23;
      }
      uint64_t v19 = [v3 identifier];
      char v20 = [v19 isEqualToString:@"intl"];

      if (v20)
      {
        uint64_t v4 = 1;
      }
      else
      {
        uint64_t v21 = [(id)objc_opt_class() ASCIICapableInputModeIdentifierForPreferredLanguages];
        uint64_t v22 = [v3 identifier];
        uint64_t v4 = [v21 isEqualToString:v22];
      }
    }
    else
    {
LABEL_23:
      uint64_t v4 = 0;
    }

    goto LABEL_6;
  }
LABEL_5:
  uint64_t v4 = 0;
LABEL_6:

  return v4;
}

- (NSArray)keyboardInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

+ (id)sharedInputModeController
{
  if (qword_1EB25A730 != -1) {
    dispatch_once(&qword_1EB25A730, &__block_literal_global_308);
  }
  id v2 = (void *)qword_1EB25A728;
  return v2;
}

- (UIKeyboardInputMode)currentInputMode
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_currentInputMode)
  {
    id v3 = [(UIKeyboardInputModeController *)v2 currentInputModeInPreference];
    [(UIKeyboardInputModeController *)v2 updateCurrentInputMode:v3];
  }
  objc_sync_exit(v2);

  currentInputMode = v2->_currentInputMode;
  return currentInputMode;
}

- (void)updateDefaultInputModesIfNecessaryForIdiom
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if ([(UIKeyboardInputModeController *)self disableFloatingKeyboardFilter]
      || +[UIKeyboardImpl isFloating])
    {
      if (!+[UIKeyboardImpl isFloating]) {
        return;
      }
      id v3 = [(UIKeyboardInputModeController *)self defaultKeyboardInputModes];
      uint64_t v4 = &unk_1ED3F7898;
    }
    else
    {
      id v3 = [(UIKeyboardInputModeController *)self defaultKeyboardInputModes];
      uint64_t v4 = &unk_1ED3F7870;
    }
    uint64_t v5 = [(UIKeyboardInputModeController *)self filteredPadInputModesFromInputModes:v3 withRules:v4];
    [(UIKeyboardInputModeController *)self setDefaultKeyboardInputModes:v5];

    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [(UIKeyboardInputModeController *)self defaultKeyboardInputModes];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __75__UIKeyboardInputModeController_updateDefaultInputModesIfNecessaryForIdiom__block_invoke;
    char v14 = &unk_1E52F3388;
    id v15 = v6;
    id v16 = v7;
    id v9 = v7;
    id v10 = v6;
    [v8 enumerateObjectsUsingBlock:&v11];

    -[UIKeyboardInputModeController setDefaultInputModes:](self, "setDefaultInputModes:", v10, v11, v12, v13, v14);
    [(UIKeyboardInputModeController *)self setDefaultNormalizedInputModes:v9];
    [(UIKeyboardInputModeController *)self setDefaultRawInputModes:v9];
  }
}

- (NSArray)defaultRawInputModes
{
  return self->defaultRawInputModes;
}

- (NSArray)enabledInputModeIdentifiers
{
  return (NSArray *)[(UIKeyboardInputModeController *)self enabledInputModeIdentifiers:0];
}

- (NSArray)normalizedInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDefaultRawInputModes:(id)a3
{
}

- (void)setDefaultNormalizedInputModes:(id)a3
{
}

- (void)setDefaultKeyboardInputModes:(id)a3
{
}

- (void)setDefaultInputModes:(id)a3
{
}

- (void)updateCurrentInputMode:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (UIKeyboardInputMode *)a3;
  currentInputMode = self->_currentInputMode;
  if (currentInputMode == v5)
  {
    id v10 = 0;
  }
  else
  {
    if (![(UIKeyboardInputMode *)currentInputMode isSpecializedInputMode]
      && ![(UIKeyboardInputMode *)v5 isSpecializedInputMode])
    {
      uint64_t v7 = +[UIDictationController activeInstance];
      [v7 endSmartLanguageSelectionOverride];
    }
    uint64_t v8 = self->_currentInputMode;
    objc_storeStrong((id *)&self->_currentInputMode, a3);
    if (self->_inputModeThatInvokeEmoji && ![(UIKeyboardInputMode *)v5 isEmojiInputMode])
    {
      inputModeThatInvokeEmojuint64_t i = self->_inputModeThatInvokeEmoji;
      self->_inputModeThatInvokeEmojuint64_t i = 0;
    }
    if (v8)
    {
      id v13 = @"UITextInputFromInputModeKey";
      v14[0] = v8;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"UITextInputCurrentInputModeDidChangeNotification" object:0 userInfo:v10];
  }
  uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"UITextInputDidPersistFindUINotification" object:0 userInfo:v10];
}

- (NSArray)enabledDictationLanguages
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(UIKeyboardInputModeController *)self activeDictationLanguages];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(UIKeyboardInputModeController *)self isDictationLanguageEnabled:v9]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isDictationLanguageEnabled:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v6 = [v5 preferencesActions];
  uint64_t v7 = [(id)v6 valueForPreferenceKey:@"DictationLanguagesEnabled"];

  uint64_t v8 = [v7 allKeys];
  LOBYTE(v6) = [v8 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    uint64_t v9 = [(UIKeyboardInputModeController *)self updateEnabledDictationLanguages:0];

    uint64_t v7 = (void *)v9;
  }
  id v10 = [v7 objectForKey:v4];
  if ([v10 BOOLValue])
  {
    long long v11 = +[UIDictationController sharedInstance];
    long long v12 = [v11 dictationConnection];
    char v13 = [v12 dictationIsAvailableForLanguage:v4];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (NSArray)activeDictationLanguages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(UIKeyboardInputModeController *)self activeDictationSupportedInputModeIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [(UIKeyboardInputModeController *)self defaultDictationLanguages:v9];
        if (v10)
        {
          [v3 addObjectsFromArray:v10];
        }
        else
        {
          uint64_t v18 = v9;
          long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          [v3 addObjectsFromArray:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v6);
  }

  long long v12 = [v3 array];

  return (NSArray *)v12;
}

- (id)defaultDictationLanguages:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
    uint64_t v7 = [v6 defaultDictationLanguagesForKeyboardLanguage:v3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)activeDictationSupportedInputModeIdentifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(UIKeyboardInputModeController *)self activeInputModes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [v9 languageWithRegion];
        if ([v3 containsObject:v10])
        {
          id v11 = 0;
        }
        else
        {
          long long v12 = +[UIDictationController sharedInstance];
          id v15 = 0;
          int v13 = [v12 supportsInputMode:v9 error:&v15];
          id v11 = v15;

          if (!v13) {
            goto LABEL_11;
          }
          id v10 = [v9 languageWithRegion];
          [v3 addObject:v10];
        }

LABEL_11:
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)activeInputModes
{
  id v3 = [(UIKeyboardInputModeController *)self enabledInputModeIdentifiers];
  return [(UIKeyboardInputModeController *)self keyboardInputModes];
}

- (UIKeyboardInputMode)currentInputModeInPreference
{
  id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v4 = [v3 preferencesActions];
  uint64_t v5 = [v4 valueForPreferenceKey:*MEMORY[0x1E4FAE8C0]];

  if (![v5 length]
    || ([(UIKeyboardInputModeController *)self keyboardInputModeIdentifiers],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 containsObject:v5],
        v6,
        (v7 & 1) == 0))
  {
    uint64_t v8 = [(UIKeyboardInputModeController *)self keyboardInputModeIdentifiers];
    if (![v5 length])
    {
      uint64_t v9 = [(UIKeyboardInputModeController *)self keyboardInputModeIdentifiers];
      char v10 = [v9 containsObject:v5];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [(UIKeyboardInputModeController *)self activeInputModeIdentifiers];

        uint64_t v8 = (void *)v11;
      }
    }
    long long v12 = [(UIKeyboardInputModeController *)self fallbackCurrentInputModeForFilteredInputModeIdentifier:v5 fromInputModeIdentifiers:v8];

    if ([v12 hasPrefix:@"emoji"])
    {
      if ((unint64_t)[v8 count] < 2)
      {
        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = [v8 objectAtIndex:1];
      }

      long long v12 = (void *)v13;
    }
    if (![v12 length])
    {
      long long v14 = [(UIKeyboardInputModeController *)self defaultEnabledInputModesForCurrentLocale:1];
      uint64_t v15 = [v14 firstObject];

      long long v12 = (void *)v15;
    }

    uint64_t v5 = v12;
  }
  long long v16 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v5];
  long long v17 = [(UIKeyboardInputModeController *)self inputModeToRestoreFrom:v16];

  return (UIKeyboardInputMode *)v17;
}

- (NSArray)keyboardInputModeIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (id)inputModeToRestoreFrom:(id)a3
{
  id v3 = a3;
  if ([v3 isMultilingual])
  {
    id v4 = [v3 multilingualSet];
    uint64_t v5 = [v4 firstObject];

    uint64_t v6 = [v3 identifier];
    char v7 = [v5 identifier];
    char v8 = [v6 isEqualToString:v7];

    uint64_t v9 = v3;
    if ((v8 & 1) == 0)
    {
      if (![v3 isMultiscript]
        || ([v3 identifier],
            char v10 = objc_claimAutoreleasedReturnValue(),
            char v11 = UIKeyboardShowsTransliterationCandidatesForInputMode(),
            v10,
            uint64_t v9 = v3,
            (v11 & 1) == 0))
      {
        uint64_t v9 = v5;
      }
    }
    id v12 = v9;
  }
  else
  {
    id v12 = v3;
  }

  return v12;
}

- (id)fallbackCurrentInputModeForFilteredInputModeIdentifier:(id)a3 fromInputModeIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = UIKeyboardGetComponentsFromLanguageIdentifier(v6);
  uint64_t v9 = [v8 objectForKeyedSubscript:@"sw"];
  if (v9
    && ([&unk_1ED3F7848 objectForKeyedSubscript:v9], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    char v11 = (void *)v10;
    id v12 = [(UIKeyboardInputModeController *)self inputModeByReplacingSoftwareLayoutWithSoftwareLayout:v10 inInputMode:v6];
    if ([v7 containsObject:v12]) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = [v7 firstObject];
  }
  if (v13) {
    long long v14 = v13;
  }
  else {
    long long v14 = v6;
  }
  id v15 = v14;

  return v15;
}

- (id)currentSystemInputModeExcludingEmoji:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __70__UIKeyboardInputModeController_currentSystemInputModeExcludingEmoji___block_invoke;
  v5[3] = &unk_1E52F3318;
  BOOL v6 = a3;
  v5[4] = self;
  id v3 = [(UIKeyboardInputModeController *)self _systemInputModePassingLanguageTest:v5];
  return v3;
}

- (id)_systemInputModePassingLanguageTest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKeyboardInputModeController *)self currentInputMode];
  BOOL v6 = [v5 primaryLanguage];

  if (!v6
    || ([(UIKeyboardInputModeController *)self currentInputMode],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 normalizedIdentifier],
        char v8 = objc_claimAutoreleasedReturnValue(),
        int IsNonLinguistic = UIKeyboardInputModeIsNonLinguistic(v8),
        v8,
        v7,
        IsNonLinguistic))
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke;
    v31[3] = &unk_1E52F32A8;
    uint64_t v10 = &v32;
    id v32 = v4;
    id v11 = [(UIKeyboardInputModeController *)self _systemInputModePassingTest:v31];
    goto LABEL_15;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke_2;
  v28[3] = &unk_1E52F32D0;
  uint64_t v10 = (id *)&v30;
  id v12 = (unsigned int (**)(id, void *))v4;
  uint64_t v30 = v12;
  id v13 = v6;
  id v29 = v13;
  long long v14 = [(UIKeyboardInputModeController *)self _systemInputModePassingTest:v28];
  id v15 = [v14 primaryLanguage];
  char v16 = [v13 isEqualToString:v15];

  long long v17 = off_1E52D4000;
  if (v16)
  {
    long long v18 = v14;
    goto LABEL_10;
  }
  long long v19 = TIGetDefaultInputModesForLanguage();
  uint64_t v20 = [v19 firstObject];

  uint64_t v21 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v20);

  long long v17 = off_1E52D4000;
  long long v18 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v21];

  if (!v18
    || ([(UIKeyboardInputModeController *)self currentInputMode],
        uint64_t v22 = objc_claimAutoreleasedReturnValue(),
        int v23 = [v22 isExtensionInputMode],
        v22,
        !v23))
  {

LABEL_10:
    if (!v12[2](v12, v18)
      || ([v18 primaryLanguage],
          long long v24 = objc_claimAutoreleasedReturnValue(),
          char v25 = [v13 isEqualToString:v24],
          v24,
          (v25 & 1) == 0))
    {
      uint64_t v26 = [(__objc2_class *)v17[13] intlInputMode];

      long long v18 = (void *)v26;
    }
    id v11 = v18;
    goto LABEL_14;
  }
  id v11 = v18;

LABEL_14:
LABEL_15:

  return v11;
}

- (id)_systemInputModePassingTest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (unsigned int (**)(id, void *))a3;
  uint64_t v5 = [(UIKeyboardInputModeController *)self currentInputMode];
  if (v5 && v4[2](v4, v5)) {
    goto LABEL_8;
  }
  BOOL v6 = [(UIKeyboardInputModeController *)self currentUsedInputMode];

  if (v6 && v4[2](v4, v6))
  {
    id v7 = v6;
LABEL_9:
    uint64_t v5 = v7;
    goto LABEL_10;
  }
  uint64_t v5 = [(UIKeyboardInputModeController *)self lastUsedInputMode];

  if (v5)
  {
    if (v4[2](v4, v5))
    {
LABEL_8:
      id v7 = v5;
      goto LABEL_9;
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(UIKeyboardInputModeController *)self activeInputModes];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (((uint64_t (*)(id, void *))v4[2])(v4, v15))
        {
          id v8 = v15;

          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  id v7 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:@"en_US"];
LABEL_10:
  id v8 = v7;
LABEL_11:

  return v8;
}

uint64_t __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 primaryLanguage];
    uint64_t v6 = [v4 isEqualToString:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)willEnterForeground:(id)a3
{
  [(UIKeyboardInputModeController *)self _beginContinuousDiscoveryIfNeeded];
  [(UIKeyboardInputModeController *)self _clearAllExtensionsIfNeeded];
}

- (void)_beginContinuousDiscoveryIfNeeded
{
  if ([(UIKeyboardInputModeController *)self shouldRunContinuousDiscovery])
  {
    id v3 = [(UIKeyboardInputModeController *)self extensionMatchingContext];
    if (v3)
    {
    }
    else if ([(UIKeyboardInputModeController *)self _mayContainExtensionInputModes])
    {
      dispatch_time_t v4 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x1E4F14428], block);
    }
  }
}

- (BOOL)shouldRunContinuousDiscovery
{
  return self->_shouldRunContinuousDiscovery;
}

void __58__UIKeyboardInputModeController_sharedInputModeController__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardInputModeController);
  v1 = (void *)qword_1EB25A728;
  qword_1EB25A728 = (uint64_t)v0;
}

- (UIKeyboardInputModeController)init
{
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardInputModeController;
  id v2 = [(UIKeyboardInputModeController *)&v16 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel_didEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v3 addObserver:v2 selector:sel_willEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v3 addObserver:v2 selector:sel_didEnterBackground_ name:*MEMORY[0x1E4F73EC0] object:0];
    [v3 addObserver:v2 selector:sel_keyboardsPreferencesChanged_ name:@"AppleKeyboardsPreferencesChangedNotification" object:0];
    dispatch_time_t v4 = _UIMainBundleIdentifier();
    int v5 = [v4 isEqualToString:@"com.apple.springboard"];

    if (v5)
    {
      v14[0] = 0;
      v14[1] = v14;
      void v14[2] = 0x3032000000;
      v14[3] = __Block_byref_object_copy__120;
      v14[4] = __Block_byref_object_dispose__120;
      uint64_t v6 = v2;
      id v15 = v6;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __37__UIKeyboardInputModeController_init__block_invoke;
      aBlock[3] = &unk_1E52F3280;
      aBlock[4] = v14;
      id v7 = _Block_copy(aBlock);
      id v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
      uint32_t v10 = notify_register_dispatch("com.apple.managedconfiguration.passcodechanged", v6 + 11, v8, v7);

      if (v10) {
        NSLog(&cfstr_FailedToRegist_1.isa);
      }
      +[UIPeripheralHost setKeyboardOnScreenNotifyKey:0];
      uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 addObserver:v6 selector:sel_handleSpecificHardwareKeyboard_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];

      _Block_object_dispose(v14, 8);
    }
  }
  return v2;
}

- (void)_clearAllExtensionsIfNeeded
{
  if (self->_allExtensions)
  {
    id v3 = [(UIKeyboardInputModeController *)self keyboardInputModes];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__UIKeyboardInputModeController__clearAllExtensionsIfNeeded__block_invoke;
    v4[3] = &unk_1E52F3440;
    v4[4] = self;
    [v3 enumerateObjectsUsingBlock:v4];
  }
}

- (void)dealloc
{
  v22[6] = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _isSpringBoard]) {
    notify_cancel(self->_notifyPasscodeChangedToken);
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v22[0] = @"UIApplicationDidEnterBackgroundNotification";
  v22[1] = @"UIApplicationWillEnterForegroundNotification";
  v22[2] = @"AppleKeyboardsPreferencesChangedNotification";
  v22[3] = @"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification";
  uint64_t v4 = *MEMORY[0x1E4F73EC0];
  v22[4] = *MEMORY[0x1E4FAEA28];
  v22[5] = v4;
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:6];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v5);

  if (self->_extensionMatchingContext)
  {
    objc_msgSend(MEMORY[0x1E4F28C70], "endMatchingExtensions:");
    id extensionMatchingContext = self->_extensionMatchingContext;
    self->_id extensionMatchingContext = 0;
  }
  allExtensions = self->_allExtensions;
  self->_allExtensions = 0;

  allowedExtensions = self->_allowedExtensions;
  self->_allowedExtensions = 0;

  newModeForUserNotification = self->_newModeForUserNotification;
  self->_newModeForUserNotification = 0;

  keyboardTagForUserNotification = self->_keyboardTagForUserNotification;
  self->_keyboardTagForUserNotification = 0;

  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFUserNotificationCancel(userNotification);
    CFRelease(self->_userNotification);
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_userNotificationRunLoopSource);
    self->_userNotification = 0;
  }
  [(UIKeyboardInputModeController *)self setKeyboardInputModes:0];
  [(UIKeyboardInputModeController *)self setUserSelectableKeyboardInputModes:0];
  [(UIKeyboardInputModeController *)self setKeyboardInputModeIdentifiers:0];
  [(UIKeyboardInputModeController *)self setUserSelectableKeyboardInputModeIdentifiers:0];
  [(UIKeyboardInputModeController *)self setEnabledInputModes:0];
  [(UIKeyboardInputModeController *)self setNormalizedInputModes:0];
  [(UIKeyboardInputModeController *)self setDefaultKeyboardInputModes:0];
  [(UIKeyboardInputModeController *)self setDefaultRawInputModes:0];
  [(UIKeyboardInputModeController *)self setDefaultInputModes:0];
  [(UIKeyboardInputModeController *)self setDefaultNormalizedInputModes:0];
  [(UIKeyboardInputModeController *)self setInputModeContextIdentifier:0];
  [(UIKeyboardInputModeController *)self setSuggestedInputModesForSiriLanguage:0];
  additionalTextInputLocales = self->_additionalTextInputLocales;
  self->_additionalTextInputLocales = 0;

  documentInputMode = self->_documentInputMode;
  self->_documentInputMode = 0;

  lastUsedInputMode = self->_lastUsedInputMode;
  self->_lastUsedInputMode = 0;

  nextInputModeToUse = self->_nextInputModeToUse;
  self->_nextInputModeToUse = 0;

  currentUsedInputMode = self->_currentUsedInputMode;
  self->_currentUsedInputMode = 0;

  currentInputMode = self->_currentInputMode;
  self->_currentInputMode = 0;

  inputModeThatInvokeEmojuint64_t i = self->_inputModeThatInvokeEmoji;
  self->_inputModeThatInvokeEmojuint64_t i = 0;

  inputModesWithoutHardwareSupport = self->_inputModesWithoutHardwareSupport;
  self->_inputModesWithoutHardwareSupport = 0;

  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardInputModeController;
  [(UIKeyboardInputModeController *)&v21 dealloc];
}

uint64_t __37__UIKeyboardInputModeController_init__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) saveDeviceUnlockPasscodeInputModes];
}

- (id)inputModeWithIdentifier:(id)a3
{
  return +[UIKeyboardInputMode keyboardInputModeWithIdentifier:a3];
}

- (id)activeUserSelectableInputModes
{
  id v3 = [(UIKeyboardInputModeController *)self enabledInputModeIdentifiers];
  return [(UIKeyboardInputModeController *)self userSelectableKeyboardInputModes];
}

- (NSArray)activeUserSelectableInputModeIdentifiers
{
  id v3 = [(UIKeyboardInputModeController *)self enabledInputModeIdentifiers];
  return [(UIKeyboardInputModeController *)self userSelectableKeyboardInputModeIdentifiers];
}

- (void)setShouldRunContinuousDiscovery:(BOOL)a3
{
  self->_shouldRunContinuousDiscovery = a3;
  [(UIKeyboardInputModeController *)self _beginContinuousDiscoveryIfNeeded];
}

- (void)setCurrentInputModeInPreference:(id)a3
{
  id v6 = a3;
  if (([v6 isEmojiInputMode] & 1) == 0)
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v4 = [v3 preferencesActions];
    int v5 = [v6 identifier];
    [v4 updateLastUsedInputMode:v5];
  }
}

uint64_t __69__UIKeyboardInputModeController__systemInputModePassingLanguageTest___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UIKeyboardInputMode)hardwareInputMode
{
  id v3 = [(UIKeyboardInputModeController *)self currentInputMode];
  if ([v3 isExtensionInputMode])
  {
  }
  else
  {
    uint64_t v4 = [(UIKeyboardInputModeController *)self currentInputMode];
    int v5 = [v4 identifier];
    id v6 = TIInputModeGetVariant();
    int v7 = [v6 isEqualToString:@"HWR"];

    if (v7)
    {
      uint64_t v8 = +[UIKeyboardInputMode intlInputMode];
LABEL_7:
      uint64_t v11 = (void *)v8;
      goto LABEL_9;
    }
  }
  id v9 = [(UIKeyboardInputModeController *)self currentInputMode];
  uint32_t v10 = +[UIKeyboardInputMode dictationInputMode];

  if (v9 != v10)
  {
    uint64_t v8 = [(UIKeyboardInputModeController *)self _systemInputModePassingLanguageTest:&__block_literal_global_142];
    goto LABEL_7;
  }
  uint64_t v12 = +[UIDictationController sharedInstance];
  uint64_t v11 = [v12 keyboardInputModeToReturn];

LABEL_9:
  return (UIKeyboardInputMode *)v11;
}

BOOL __50__UIKeyboardInputModeController_hardwareInputMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isExtensionInputMode])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 hardwareLayout];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (id)lastUsedInputModeForTextInputMode:(id)a3
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v25 = 0;
    goto LABEL_47;
  }
  [(UIKeyboardInputModeController *)self setDocumentInputMode:v4];
  int v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v6 = [v5 preferencesActions];
  int v7 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE8B8]];

  id v8 = v4;
  id v9 = [v8 languageWithRegion];
  long long v53 = v7;
  uint64_t v54 = self;
  if ([v8 isExtensionInputMode])
  {
    uint32_t v10 = [v8 languageWithRegion];
    uint64_t v11 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    uint64_t v12 = [v7 objectForKey:v11];

    if (!v12)
    {
      uint64_t v13 = TIGetDefaultInputModesForLanguage();
      long long v14 = v13;
      if (v13)
      {
        id v15 = [v13 firstObject];
        objc_super v16 = TIInputModeGetLanguageWithRegion();

        long long v17 = [v7 objectForKey:v16];

        if (!v17)
        {
          long long v65 = 0u;
          long long v66 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id obj = [v7 allKeys];
          uint64_t v18 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            long long v48 = v14;
            uint64_t v20 = *(void *)v64;
            while (2)
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v64 != v20) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v22 = *(void **)(*((void *)&v63 + 1) + 8 * i);
                int v23 = TIInputModeGetBaseLanguage();
                int v24 = [v16 isEqualToString:v23];

                if (v24)
                {
                  id v26 = v22;

                  objc_super v16 = v26;
                  goto LABEL_17;
                }
              }
              uint64_t v19 = [obj countByEnumeratingWithState:&v63 objects:v69 count:16];
              if (v19) {
                continue;
              }
              break;
            }
LABEL_17:
            int v7 = v53;
            self = v54;
            long long v14 = v48;
          }
        }
        uint64_t v11 = v16;
      }
    }
    id v9 = v11;
  }
  uint64_t v27 = objc_msgSend(v7, "objectForKey:", v9, v48);
  uint64_t v49 = v27;
  id obja = v9;
  if (v27)
  {
    uint64_t v28 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v27, v27);
    if ([v28 isExtensionInputMode])
    {
      id v29 = [v8 languageWithRegion];
      [v28 setPrimaryLanguage:v29];
    }
    if (v28)
    {
      id v30 = v28;

      id v8 = v30;
    }
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  BOOL v31 = [(UIKeyboardInputModeController *)self activeInputModes];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v60;
LABEL_30:
    uint64_t v35 = 0;
    while (1)
    {
      if (*(void *)v60 != v34) {
        objc_enumerationMutation(v31);
      }
      long long v36 = *(void **)(*((void *)&v59 + 1) + 8 * v35);
      uint64_t v37 = [v36 identifier];
      uint64_t v38 = [v8 identifier];
      char v39 = [v37 isEqualToString:v38];

      if (v39) {
        goto LABEL_45;
      }
      if (v33 == ++v35)
      {
        uint64_t v33 = [v31 countByEnumeratingWithState:&v59 objects:v68 count:16];
        if (v33) {
          goto LABEL_30;
        }
        break;
      }
    }
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  BOOL v31 = [(UIKeyboardInputModeController *)v54 activeInputModes];
  uint64_t v40 = [v31 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v56;
LABEL_38:
    uint64_t v43 = 0;
    while (1)
    {
      if (*(void *)v56 != v42) {
        objc_enumerationMutation(v31);
      }
      long long v36 = *(void **)(*((void *)&v55 + 1) + 8 * v43);
      long long v44 = [v36 normalizedIdentifier];
      long long v45 = [v8 normalizedIdentifier];
      char v46 = [v44 isEqualToString:v45];

      if (v46) {
        break;
      }
      if (v41 == ++v43)
      {
        uint64_t v41 = [v31 countByEnumeratingWithState:&v55 objects:v67 count:16];
        if (v41) {
          goto LABEL_38;
        }
        goto LABEL_44;
      }
    }
LABEL_45:
    char v25 = [(UIKeyboardInputModeController *)v54 inputModeToRestoreFrom:v36];

    goto LABEL_46;
  }
LABEL_44:

  char v25 = [(UIKeyboardInputModeController *)v54 currentInputModeInPreference];
LABEL_46:

LABEL_47:
  return v25;
}

- (void)setDocumentInputMode:(id)a3
{
  id v6 = [a3 primaryLanguage];
  id v4 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v6];
  documentInputMode = self->_documentInputMode;
  self->_documentInputMode = v4;
}

- (void)_inputModeChangedWhileContextTracked
{
  v31[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIKeyboardInputModeController *)self inputModeContextIdentifier];
  if (v3)
  {
    id v4 = (void *)v3;
    int v5 = [(UIKeyboardInputModeController *)self currentPublicInputMode];

    if (v5)
    {
      id v6 = [(UIKeyboardInputModeController *)self _prefixedKey];
      int v7 = [(UIKeyboardInputModeController *)self _prefixedSetTimeKey];
      id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"UITextInputContextIdentifiers"];
      id v9 = [v8 objectForKey:v6];
      uint32_t v10 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
      int v11 = [v10 isExtensionInputMode];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F28DB0];
        uint64_t v13 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
        long long v14 = [v12 archivedDataWithRootObject:v13 requiringSecureCoding:1 error:0];
        id v15 = 0;
      }
      else
      {
        uint64_t v13 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
        objc_super v16 = [v13 identifier];
        id v15 = TIInputModeGetLanguageWithRegion();

        long long v14 = 0;
      }

      if (!v9) {
        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v17 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
        int v18 = [v17 isExtensionInputMode];

        if (v18)
        {
          id v19 = v9;
          if (v14 && ([v14 isEqualToData:v19] & 1) != 0) {
            goto LABEL_20;
          }
LABEL_16:
          uint64_t v22 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
          int v23 = [v22 isExtensionInputMode];

          if (v23) {
            int v24 = v14;
          }
          else {
            int v24 = v15;
          }
          [v8 setObject:v24 forKey:v6];
          char v25 = [MEMORY[0x1E4F1C9C8] date];
          [v8 setObject:v25 forKey:v7];

          [v8 synchronize];
          id v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
          v30[0] = @"UITextInputContextIdentifierPreferencesDomainKey";
          v30[1] = @"UITextInputContextIdentifierPreferencesIdentifierKey";
          v31[0] = @"UITextInputContextIdentifiers";
          v31[1] = v6;
          v30[2] = @"UITextInputContextIdentifierPreferencesIdentifierSetTimeKey";
          v31[2] = v7;
          uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
          [v26 postNotificationName:@"UITextInputContextIdentifierDataDidUpdateNotification" object:0 userInfo:v27];

          goto LABEL_20;
        }
LABEL_15:
        id v19 = 0;
        goto LABEL_16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v9;
        uint64_t v20 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
        int v21 = [v20 isExtensionInputMode];

        if (v21)
        {

          goto LABEL_15;
        }
        char v28 = [v29 isEqualToString:v15];

        id v19 = 0;
        if ((v28 & 1) == 0) {
          goto LABEL_16;
        }
      }
      else
      {
        id v19 = 0;
      }
LABEL_20:
    }
  }
}

- (id)_prefixedKey
{
  id v2 = [(UIKeyboardInputModeController *)self inputModeContextIdentifier];
  if (v2)
  {
    uint64_t v3 = [@"ID_" stringByAppendingString:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)_prefixedSetTimeKey
{
  id v2 = [(UIKeyboardInputModeController *)self _prefixedKey];
  uint64_t v3 = [v2 stringByAppendingString:@"_SETTIME"];

  return v3;
}

- (NSDate)defaultsLastChangedDate
{
  id v2 = [(UIKeyboardInputModeController *)self _prefixedSetTimeKey];
  if (v2)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"UITextInputContextIdentifiers"];
    id v4 = [v3 objectForKey:v2];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)setDefaultsLastChangedDate:(id)a3
{
  id v6 = a3;
  id v4 = [(UIKeyboardInputModeController *)self _prefixedSetTimeKey];
  if (v4)
  {
    int v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"UITextInputContextIdentifiers"];
    [v5 setObject:v6 forKey:v4];
    [v5 synchronize];
  }
}

- (id)textInputModeForResponder:(id)a3
{
  self->_suppressCurrentPublicInputMode = 1;
  id result = (id)[a3 textInputMode];
  self->_suppressCurrentPublicInputMode = 0;
  return result;
}

- (UIKeyboardInputMode)currentLinguisticInputMode
{
  uint64_t v3 = [(UIKeyboardInputModeController *)self currentPublicInputMode];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIKeyboardInputModeController *)self currentInputModeInPreference];
  }
  id v6 = v5;

  return (UIKeyboardInputMode *)v6;
}

- (UIKeyboardInputMode)lastUsedInputModeForCurrentContext
{
  uint64_t v3 = +[UIPeripheralHost sharedInstance];
  id v4 = [v3 lastUsedInputModeForCurrentContext];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIKeyboardInputModeController *)self currentInputModeInPreference];
  }
  int v7 = v6;

  return (UIKeyboardInputMode *)v7;
}

- (id)suggestedDictationLanguagesForDeviceLanguage
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  char v3 = objc_opt_respondsToSelector();

  id v4 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 suggestedDictationLanguagesForDeviceLanguage];
    goto LABEL_6;
  }
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
    id v5 = [v8 suggestedDictationLanguageForDeviceLanguage];

    if (!v5)
    {
      id v9 = 0;
      goto LABEL_7;
    }
    v27[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
LABEL_6:
    id v9 = (void *)v6;
LABEL_7:

    goto LABEL_9;
  }
  id v9 = 0;
LABEL_9:
  if ([v9 count])
  {
    uint32_t v10 = [MEMORY[0x1E4F1CA48] array];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v21 = v9;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          objc_super v16 = (__CFString *)*(id *)(*((void *)&v22 + 1) + 8 * i);
          if ([(__CFString *)v16 hasPrefix:@"zh"])
          {
            long long v17 = +[UIDictationConnectionPreferences sharedInstance];
            int v18 = [v17 languageCode];

            if (([v18 isEqualToString:@"yue-CN"] & 1) != 0
              || [v18 isEqualToString:@"zh-HK"])
            {
              id v19 = @"yue_CN";
              if (([(__CFString *)v16 isEqualToString:@"zh_CN"] & 1) != 0
                || (id v19 = @"zh_HK",
                    [(__CFString *)v16 isEqualToString:@"zh_TW"]))
              {

                objc_super v16 = v19;
              }
            }
          }
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }

    id v9 = v21;
  }
  else
  {
    uint32_t v10 = 0;
  }

  return v10;
}

- (id)keyboardLanguageForDictationLanguage:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (qword_1EB25A740 != -1) {
    dispatch_once(&qword_1EB25A740, &__block_literal_global_188);
  }
  id v5 = [(id)qword_1EB25A738 objectForKey:v4];
  if (!v5)
  {
    id v20 = v4;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v6 = +[UIKeyboardInputModeController sharedInputModeController];
    char v7 = [v6 activeInputModes];

    id obj = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) languageWithRegion];
          uint64_t v13 = [(UIKeyboardInputModeController *)self defaultDictationLanguages:v12];
          uint64_t v14 = v13;
          if (v13)
          {
            long long v24 = 0u;
            long long v25 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v23;
              do
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v23 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  [(id)qword_1EB25A738 setObject:v12 forKey:*(void *)(*((void *)&v22 + 1) + 8 * j)];
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v22 objects:v30 count:16];
              }
              while (v16);
            }
          }
          else
          {
            [(id)qword_1EB25A738 setObject:v12 forKey:v12];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v9);
    }

    id v4 = v20;
    id v5 = [(id)qword_1EB25A738 objectForKey:v20];
  }

  return v5;
}

void __70__UIKeyboardInputModeController_keyboardLanguageForDictationLanguage___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)qword_1EB25A738;
  qword_1EB25A738 = (uint64_t)v0;
}

- (void)downloadDictationLangaugesAssets
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(UIKeyboardInputModeController *)self activeDictationLanguages];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        +[UIDictationUtilities _isDictationAssetAvailableForLocale:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)updateEnabledDictationLanguages:(BOOL)a3
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__120;
  id v11 = __Block_byref_object_dispose__120;
  id v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__UIKeyboardInputModeController_updateEnabledDictationLanguages___block_invoke;
  v5[3] = &unk_1E52F3340;
  BOOL v6 = a3;
  v5[4] = self;
  void v5[5] = &v7;
  [(UIKeyboardInputModeController *)self updateEnabledDictationAndSLSLanguagesWithCompletionBlock:v5];
  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __65__UIKeyboardInputModeController_updateEnabledDictationLanguages___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v20 = a3;
  BOOL v6 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v5];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v20];
  if (*(unsigned char *)(a1 + 48)) {
    goto LABEL_3;
  }
  long long v8 = +[UIKeyboardImpl activeInstance];
  uint64_t v9 = [v8 inputDelegateManager];
  long long v10 = [v9 keyInputDelegate];

  if (v10)
  {
LABEL_3:
    id v11 = [*(id *)(a1 + 32) keyboardInputModes];
    uint64_t v12 = [v11 count];

    if (v12 == 1)
    {
      uint64_t v13 = [*(id *)(a1 + 32) keyboardInputModes];
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];

      uint64_t v15 = [v14 languageWithRegion];
      if (v15) {
        [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v15];
      }
    }
    uint64_t v16 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v17 = [v16 preferencesActions];
    [v17 setEnabledDictationLanguages:v5];

    if (_os_feature_enabled_impl()) {
      [*(id *)(a1 + 32) setDictationSLSLanguagesEnabled:v20];
    }
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
  id v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v5;
}

+ (id)disallowedDictationLanguagesForDeviceLanguage
{
  UIKeyboardHasCompletedBuddy();
  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    if (qword_1EB25A750 != -1) {
      dispatch_once(&qword_1EB25A750, &__block_literal_global_196_0);
    }
    id v3 = (id)qword_1EB25A748;
  }
  return v3;
}

void __78__UIKeyboardInputModeController_disallowedDictationLanguagesForDeviceLanguage__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
  v1 = (void *)v0;
  char v2 = &stru_1ED0E84C0;
  if (v0) {
    char v2 = (__CFString *)v0;
  }
  id v3 = v2;

  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v8 = [&unk_1ED3F7820 objectForKeyedSubscript:v3];

  if (v8) {
    id v5 = v8;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = [v4 initWithArray:v5];
  uint64_t v7 = (void *)qword_1EB25A748;
  qword_1EB25A748 = v6;
}

- (void)updateEnabledDictationAndSLSLanguagesWithCompletionBlock:(id)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v69 = a3;
  uint64_t v70 = [(id)objc_opt_class() disallowedDictationLanguagesForDeviceLanguage];
  id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v5 = [v4 preferencesActions];
  uint64_t v6 = [v5 valueForPreferenceKey:@"DictationLanguagesEnabled"];

  uint64_t v7 = [(UIKeyboardInputModeController *)self getDictationSLSLanguagesEnabled];
  id v8 = [v7 keysOfEntriesPassingTest:&__block_literal_global_215_0];
  unint64_t v77 = [v8 count];

  uint64_t v9 = [(UIKeyboardInputModeController *)self suggestedDictationLanguagesForDeviceLanguage];
  long long v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v73 = self;
  id obj = [(UIKeyboardInputModeController *)self activeDictationSupportedInputModeIdentifiers];
  v76 = v11;
  uint64_t v74 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
  if (v74)
  {
    uint64_t v72 = *(void *)v90;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v90 != v72) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v89 + 1) + 8 * v12);
        uint64_t v14 = -[UIKeyboardInputModeController defaultDictationLanguages:](v73, "defaultDictationLanguages:", v13, v69);
        id v80 = v14;
        uint64_t v75 = v12;
        if (!v14)
        {
          char v39 = [v6 allKeys];
          int v40 = [v39 containsObject:v13];

          if (v40)
          {
            uint64_t v41 = [v6 objectForKey:v13];
            uint64_t v42 = [v41 BOOLValue];
          }
          else
          {
            uint64_t v42 = [v70 containsObject:v13] ^ 1;
          }
          uint64_t v43 = [NSNumber numberWithBool:v42];
          [v10 setObject:v43 forKey:v13];

          long long v44 = [v7 objectForKeyedSubscript:v13];
          int v45 = [v44 BOOLValue];

          if (v45)
          {
            char v46 = v76;
            uint64_t v47 = MEMORY[0x1E4F1CC38];
            goto LABEL_45;
          }
          if (v77 < 4) {
            int v48 = v42;
          }
          else {
            int v48 = 0;
          }
          if (v48 == 1
            && ([v7 allKeys],
                uint64_t v49 = objc_claimAutoreleasedReturnValue(),
                char v50 = [v49 containsObject:v13],
                v49,
                (v50 & 1) == 0))
          {
            uint64_t v52 = v13;
            id v11 = v76;
            [v76 setObject:MEMORY[0x1E4F1CC38] forKey:v52];
            ++v77;
          }
          else
          {
            char v46 = v76;
            uint64_t v47 = MEMORY[0x1E4F1CC28];
LABEL_45:
            uint64_t v51 = v13;
            id v11 = v46;
            [v46 setObject:v47 forKey:v51];
          }
          uint64_t v15 = 0;
          goto LABEL_47;
        }
        uint64_t v15 = v14;
        long long v87 = 0u;
        long long v88 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        uint64_t v79 = [v14 countByEnumeratingWithState:&v85 objects:v93 count:16];
        if (!v79)
        {
          id v11 = v76;
          goto LABEL_47;
        }
        uint64_t v78 = *(void *)v86;
        id v11 = v76;
        do
        {
          for (uint64_t i = 0; i != v79; ++i)
          {
            if (*(void *)v86 != v78) {
              objc_enumerationMutation(v80);
            }
            uint64_t v17 = *(void **)(*((void *)&v85 + 1) + 8 * i);
            uint64_t v18 = [v6 allKeys];
            int v19 = [v18 containsObject:v17];

            if (v19)
            {
              uint64_t v22 = [v6 objectForKey:v17];
              uint64_t v20 = [(id)v22 BOOLValue];

              int v21 = [v7 objectForKey:v17];
              LODWORD(v22) = [v21 BOOLValue];
              if ((v22 & 1) == 0 && v20)
              {
                [v7 allKeys];
                long long v23 = v10;
                long long v24 = v9;
                long long v25 = v7;
                long long v27 = v26 = v6;
                LODWORD(v22) = [v27 containsObject:v17] ^ 1;

                uint64_t v6 = v26;
                uint64_t v7 = v25;
                uint64_t v9 = v24;
                long long v10 = v23;
                id v11 = v76;
              }
            }
            else if (v9 {
                   && ([MEMORY[0x1E4F1CAD0] setWithArray:v9],
            }
                       long long v28 = objc_claimAutoreleasedReturnValue(),
                       [MEMORY[0x1E4F1CAD0] setWithArray:v80],
                       long long v29 = objc_claimAutoreleasedReturnValue(),
                       int v30 = [v28 isSubsetOfSet:v29],
                       v29,
                       v28,
                       v30))
            {
              uint64_t v31 = [v9 containsObject:v17];
              LODWORD(v22) = v31;
              uint64_t v20 = v31;
            }
            else
            {
              uint64_t v32 = [v80 firstObject];
              uint64_t v22 = v17 == v32;

              uint64_t v20 = v22;
            }
            uint64_t v33 = [NSNumber numberWithBool:v20];
            [v10 setObject:v33 forKey:v17];

            uint64_t v34 = [v7 objectForKeyedSubscript:v17];
            int v35 = [v34 BOOLValue];

            if (v35)
            {
              long long v36 = v11;
              uint64_t v37 = MEMORY[0x1E4F1CC38];
            }
            else
            {
              if (v77 < 4) {
                int v38 = v22;
              }
              else {
                int v38 = 0;
              }
              long long v36 = v11;
              if (v38 == 1)
              {
                [v11 setObject:MEMORY[0x1E4F1CC38] forKey:v17];
                ++v77;
                continue;
              }
              uint64_t v37 = MEMORY[0x1E4F1CC28];
            }
            [v36 setObject:v37 forKey:v17];
          }
          uint64_t v15 = v80;
          uint64_t v79 = [v80 countByEnumeratingWithState:&v85 objects:v93 count:16];
        }
        while (v79);
LABEL_47:

        uint64_t v12 = v75 + 1;
      }
      while (v75 + 1 != v74);
      uint64_t v53 = [obj countByEnumeratingWithState:&v89 objects:v94 count:16];
      uint64_t v74 = v53;
    }
    while (v53);
  }

  [v11 keysOfEntriesPassingTest:&__block_literal_global_219_0];
  v55 = uint64_t v54 = v11;
  unint64_t v56 = [v55 count];

  long long v57 = v69;
  if (v56 <= 1)
  {
    long long v58 = [(UIKeyboardInputModeController *)v73 activeDictationLanguages];
    unint64_t v59 = [v58 count];

    if (v59 > 4)
    {
      long long v60 = [v10 keysOfEntriesPassingTest:&__block_literal_global_221_0];
      unint64_t v61 = [v60 count];

      unint64_t v62 = [v10 count];
      if (v62 <= [v6 count] || v61 < 2)
      {
        v81[0] = MEMORY[0x1E4F143A8];
        v81[1] = 3221225472;
        v81[2] = __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_5;
        v81[3] = &unk_1E52DDE90;
        uint64_t v54 = v76;
        id v82 = v76;
        [v10 enumerateKeysAndObjectsUsingBlock:v81];
        long long v63 = v82;
      }
      else
      {
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_4;
        v83[3] = &unk_1E52DDE90;
        uint64_t v54 = v76;
        id v84 = v76;
        [v10 enumerateKeysAndObjectsUsingBlock:v83];
        long long v63 = v84;
      }
    }
    else
    {
      uint64_t v54 = v76;
      [v76 removeAllObjects];
    }
  }
  (*((void (**)(id, void *, void *))v69 + 2))(v69, v10, v54);
  if (v70)
  {
    long long v64 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v65 = [v10 allKeys];
    long long v66 = (void *)v65;
    if (v65) {
      uint64_t v67 = v65;
    }
    else {
      uint64_t v67 = MEMORY[0x1E4F1CBF0];
    }
    id v68 = objc_msgSend(v64, "setWithArray:", v67, v69);
    [v70 intersectSet:v68];

    uint64_t v54 = v76;
  }
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue];
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue];
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue];
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

uint64_t __90__UIKeyboardInputModeController_updateEnabledDictationAndSLSLanguagesWithCompletionBlock___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:a2];
}

+ (BOOL)shouldShowDictationMic
{
  char v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [getAFPreferencesClass() sharedPreferences];
  if ([v3 dictationIsEnabled] & 1) == 0 && (objc_msgSend(v3, "suppressDictationOptIn"))
  {
    LOBYTE(v4) = 0;
LABEL_11:

    return v4;
  }
  id v5 = [v2 enabledDictationLanguages];
  if (![v5 count])
  {
    LOBYTE(v4) = 0;
    goto LABEL_10;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v6 = (uint64_t (*)(void))getAFDictationRestrictedSymbolLoc_ptr;
  uint64_t v14 = getAFDictationRestrictedSymbolLoc_ptr;
  if (!getAFDictationRestrictedSymbolLoc_ptr)
  {
    uint64_t v7 = AssistantServicesLibrary();
    v12[3] = (uint64_t)dlsym(v7, "AFDictationRestricted");
    getAFDictationRestrictedSymbolLoc_ptr = (_UNKNOWN *)v12[3];
    uint64_t v6 = (uint64_t (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (v6)
  {
    int v4 = v6() ^ 1;
LABEL_10:

    goto LABEL_11;
  }
  uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v10 = [NSString stringWithUTF8String:"BOOL _AFDictationRestricted(void)"];
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, @"UIKeyboardInputModeController.m", 121, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (BOOL)dictationInputModeIsFunctional
{
  return +[UIDictationController dictationIsFunctional];
}

- (void)changePreferredEmojiSearchInputModeForInputDelegate:(id)a3
{
  id v4 = a3;
  id v5 = +[UIKeyboardImpl activeInstance];
  [v5 updateIdleDetection:0];

  uint64_t v6 = +[UIKeyboardImpl activeInstance];
  uint64_t v7 = [v6 inputDelegateManager];
  [v7 setForwardingInputDelegate:v4];

  id v8 = +[UIKeyboardImpl activeInstance];
  [v8 enableTransientInputDelegateSelectionMode];

  uint64_t v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v15 = [v9 responder];

  long long v10 = [(UIKeyboardInputModeController *)self currentInputModeInPreference];
  uint64_t v11 = [v15 textInputContextIdentifier];

  if (v11)
  {
    uint64_t v12 = [v15 textInputMode];
    uint64_t v13 = [(UIKeyboardInputModeController *)self lastUsedInputModeForTextInputMode:v12];

    long long v10 = (void *)v13;
  }
  if (!v10 || ([v10 isEmojiInputMode] & 1) != 0 || (objc_msgSend(v10, "supportsEmojiSearch") & 1) == 0)
  {
    uint64_t v14 = [(UIKeyboardInputModeController *)self currentSystemInputModeExcludingEmoji:1];

    long long v10 = (void *)v14;
  }
  [(UIKeyboardInputModeController *)self setCurrentInputMode:v10];
}

- (BOOL)containsEmojiInputMode
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  char v2 = [(UIKeyboardInputModeController *)self activeInputModes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isEmojiInputMode])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)containsDictationSupportedInputMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  char v2 = [(UIKeyboardInputModeController *)self activeInputModes];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        long long v7 = +[UIDictationController sharedInstance];
        uint64_t v9 = 0;
        LOBYTE(v6) = [v7 supportsInputMode:v6 error:&v9];

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setDictationSLSLanguagesEnabled:(id)a3
{
  id v3 = a3;
  id v4 = [getAFPreferencesClass() sharedPreferences];
  [v4 setDictationSLSLanguagesEnabled:v3];
}

- (id)getDictationSLSLanguagesEnabled
{
  char v2 = [getAFPreferencesClass() sharedPreferences];
  id v3 = [v2 dictationSLSLanguagesEnabled];

  return v3;
}

- (void)setCurrentInputMode:(id)a3
{
}

- (void)_setCurrentInputMode:(id)a3 force:(BOOL)a4
{
  id v15 = a3;
  uint64_t v6 = [v15 identifier];
  if (!a4)
  {
    long long v7 = [(UIKeyboardInputModeController *)self activeInputModes];
    char v8 = [v7 containsObject:v15];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(UIKeyboardInputModeController *)self normalizedInputModes];
      long long v10 = [v15 normalizedIdentifier];
      uint64_t v11 = [v9 indexOfObject:v10];

      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
      long long v12 = [(UIKeyboardInputModeController *)self enabledInputModes];
      uint64_t v13 = [v12 objectAtIndex:v11];

      uint64_t v6 = (void *)v13;
    }
  }
  if (!v6) {
    goto LABEL_8;
  }
  uint64_t v14 = +[UIKeyboardImpl sharedInstance];
  [v14 setInputMode:v6];

LABEL_7:
LABEL_8:
}

- (BOOL)currentLocaleRequiresExtendedSetup
{
  id v3 = [(UIKeyboardInputModeController *)self suggestedInputModesForCurrentLocale:0 fallbackToDefaultInputModes:0];
  id v9 = 0;
  id v10 = 0;
  [(UIKeyboardInputModeController *)self getHardwareKeyboardLanguage:&v10 countryCode:&v9];
  id v4 = v10;
  id v5 = v9;
  uint64_t v6 = [(UIKeyboardInputModeController *)self suggestedInputModesForHardwareKeyboardLanguage:v4 countryCode:v5 inputModes:v3];
  uint64_t v7 = [v3 count];
  LOBYTE(v7) = (unint64_t)([v6 count] + v7) > 1;

  return v7;
}

- (id)filteredInputModesForSiriLanguageFromInputModes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = [MEMORY[0x1E4F1CA48] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v10, v24);
        long long v12 = [(UIKeyboardInputModeController *)self suggestedInputModesForSiriLanguage];
        uint64_t v13 = [v11 normalizedIdentifier];
        char v14 = [v12 containsObject:v13];

        id v15 = v5;
        if ((v14 & 1) != 0
          || ([v11 primaryLanguage],
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = [v16 isEqualToString:@"mul"],
              v16,
              id v15 = v24,
              v17))
        {
          [v15 addObject:v10];
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  if (![v5 count])
  {
    uint64_t v18 = [(UIKeyboardInputModeController *)self suggestedInputModesForSiriLanguage];
    uint64_t v19 = [v18 count];

    if (v19)
    {
      uint64_t v20 = [(UIKeyboardInputModeController *)self suggestedInputModesForSiriLanguage];
      int v21 = [v20 firstObject];
      [v5 addObject:v21];
    }
  }
  uint64_t v22 = v24;
  if (objc_msgSend(v24, "count", v24)) {
    [v5 addObjectsFromArray:v22];
  }

  return v5;
}

- (id)filteredTVInputModesFromInputModes:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (qword_1EB25A760 != -1) {
    dispatch_once(&qword_1EB25A760, &__block_literal_global_228_0);
  }
  if (!_os_feature_enabled_impl())
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v13 = v3;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v41;
LABEL_16:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v40 + 1) + 8 * v17);
        uint64_t v19 = (void *)qword_1EB25A758;
        uint64_t v20 = [v18 normalizedIdentifier];
        LODWORD(v19) = [v19 containsObject:v20];

        if (!v19) {
          break;
        }
        if (v15 == ++v17)
        {
          uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v15) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
      id v5 = v18;

      if (!v5) {
        goto LABEL_26;
      }
      if ([v5 defaultLayoutIsASCIICapable])
      {
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v5, 0);
        id v4 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      char v21 = 0;
    }
    else
    {
LABEL_22:

      id v5 = 0;
LABEL_26:
      char v21 = 1;
    }
    uint64_t v22 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(@"en_US@hw=Automatic");
    long long v23 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v22];
    if (v21) {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v23, 0, v39, (void)v40);
    }
    else {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", v5, v23, 0, (void)v40);
    }
    id v4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_32:
    long long v24 = [v5 normalizedIdentifier];
    int v25 = [v24 isEqualToString:@"ja_JP-Kana"];

    if (v25)
    {
      long long v26 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(@"ja_JP-Romaji@hw=Automatic");
      long long v27 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v26];
      [v4 insertObject:v27 atIndex:1];
    }
    long long v28 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    long long v29 = [v28 firstObject];

    int v30 = TIInputModeGetBaseLanguage();
    uint64_t v31 = TIInputModeGetRegion();
    uint64_t v32 = TIInputModeGetVariant();
    if ((([v30 isEqualToString:@"zh"] & 1) != 0
       || [v30 isEqualToString:@"en"])
      && [v31 isEqualToString:@"HK"])
    {
      [v4 removeAllObjects];
      uint64_t v33 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(@"zh_Hant-Wubihua@hw=Automatic");
      uint64_t v34 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v33];
      [v4 addObject:v34];

      int v35 = @"zh_Hant-Sucheng@hw=Automatic";
    }
    else
    {
      if (![v30 isEqualToString:@"es"]
        || ![v32 isEqualToString:@"419"])
      {
        goto LABEL_42;
      }
      [v4 removeAllObjects];
      int v35 = @"es_MX@hw=Automatic";
    }
    long long v36 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v35);
    uint64_t v37 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v36];
    [v4 addObject:v37];

LABEL_42:
    goto LABEL_43;
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        uint64_t v11 = qword_1EB25A758;
        long long v12 = [v10 normalizedIdentifier];
        LOBYTE(v11) = [(id)v11 containsObject:v12];

        if ((v11 & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v7);
  }
LABEL_43:

  return v4;
}

void __68__UIKeyboardInputModeController_filteredTVInputModesFromInputModes___block_invoke()
{
  uint64_t v0 = (void *)qword_1EB25A758;
  qword_1EB25A758 = (uint64_t)&unk_1ED3EFE18;
}

- (id)inputModeByReplacingSoftwareLayoutWithSoftwareLayout:(id)a3 inInputMode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = UIKeyboardGetComponentsFromLanguageIdentifier(v5);
  uint64_t v8 = [v7 objectForKeyedSubscript:@"sw"];
  id v9 = [NSString stringWithFormat:@"sw=%@", v8];
  uint64_t v10 = [NSString stringWithFormat:@"sw=%@", v6];

  uint64_t v11 = [v5 stringByReplacingOccurrencesOfString:v9 withString:v10];

  return v11;
}

- (id)filteredPadInputModesFromInputModes:(id)a3 withRules:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v34 = a4;
  int v35 = [MEMORY[0x1E4F1CA48] array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    uint64_t v31 = *(void *)v42;
    id v32 = v6;
    do
    {
      uint64_t v10 = 0;
      uint64_t v33 = v8;
      do
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v41 + 1) + 8 * v10);
        long long v12 = [v11 softwareLayout];

        if (v12)
        {
          id v13 = [v11 softwareLayout];
          uint64_t v14 = [v34 objectForKeyedSubscript:v13];

          if (v14)
          {
            uint64_t v36 = v10;
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v15 = v6;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v38;
              do
              {
                for (uint64_t i = 0; i != v17; ++i)
                {
                  if (*(void *)v38 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  id v20 = *(id *)(*((void *)&v37 + 1) + 8 * i);
                  if (v11 != v20)
                  {
                    char v21 = [v11 normalizedIdentifier];
                    uint64_t v22 = [v20 normalizedIdentifier];
                    if ([v21 isEqualToString:v22])
                    {
                      long long v23 = [v20 softwareLayout];
                      char v24 = [v23 isEqualToString:v14];

                      if (v24)
                      {

                        uint64_t v9 = v31;
                        id v6 = v32;
                        uint64_t v8 = v33;
                        uint64_t v10 = v36;
                        goto LABEL_23;
                      }
                    }
                    else
                    {
                    }
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v45 count:16];
              }
              while (v17);
            }

            int v25 = [v11 identifier];
            long long v26 = [(UIKeyboardInputModeController *)self inputModeByReplacingSoftwareLayoutWithSoftwareLayout:v14 inInputMode:v25];

            uint64_t v27 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v26];

            id v11 = (id)v27;
            uint64_t v9 = v31;
            id v6 = v32;
            uint64_t v8 = v33;
            uint64_t v10 = v36;
          }
        }
        [v35 addObject:v11];
LABEL_23:

        ++v10;
      }
      while (v10 != v8);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v8);
  }

  long long v28 = (void *)[v35 copy];
  return v28;
}

- (id)fallbackCurrentInputModeForFilteredInputMode:(id)a3 fromInputModes:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIKeyboardInputModeController *)self identifiersFromInputModes:v7];
  uint64_t v9 = [v6 identifier];
  uint64_t v10 = [(UIKeyboardInputModeController *)self fallbackCurrentInputModeForFilteredInputModeIdentifier:v9 fromInputModeIdentifiers:v8];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v7;
  id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "identifier", (void)v19);
        int v17 = [v16 isEqualToString:v10];

        if (v17)
        {
          id v12 = v15;
          goto LABEL_11;
        }
      }
      id v12 = (id)[v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v12;
}

void __75__UIKeyboardInputModeController_updateDefaultInputModesIfNecessaryForIdiom__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 identifierWithLayouts];
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 40);
  id v7 = [v4 normalizedIdentifier];

  [v6 addObject:v7];
}

uint64_t __58__UIKeyboardInputModeController_appendPasscodeInputModes___block_invoke()
{
  uint64_t v0 = TIInputModeGetNormalizedIdentifier();
  v1 = TIInputModeGetNormalizedIdentifier();
  uint64_t v2 = [v0 isEqualToString:v1];

  return v2;
}

- (id)suggestedInputModesForCurrentLocale:(BOOL)a3 fallbackToDefaultInputModes:(BOOL)a4
{
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v6 = [v5 preferencesActions];
  id v7 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE528]];

  uint64_t v8 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v8 count])
  {
    uint64_t v9 = [v8 objectAtIndex:0];
  }
  else
  {
    uint64_t v9 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __97__UIKeyboardInputModeController_suggestedInputModesForCurrentLocale_fallbackToDefaultInputModes___block_invoke;
  v12[3] = &__block_descriptor_33_e27___NSArray_16__0__NSString_8l;
  BOOL v13 = a4;
  uint64_t v10 = [MEMORY[0x1E4FAE2D8] _inputModesForLocale:v7 language:v9 modeFetcher:v12];

  return v10;
}

id __97__UIKeyboardInputModeController_suggestedInputModesForCurrentLocale_fallbackToDefaultInputModes___block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedInputModesForLanguage(a2, *(unsigned __int8 *)(a1 + 32));
}

- (id)suggestedInputModesForHardwareKeyboardLanguage:(id)a3 countryCode:(id)a4 inputModes:(id)a5
{
  id v8 = a5;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA48];
    id v11 = a4;
    id v12 = a3;
    uint64_t v9 = [v10 array];
    BOOL v13 = [(UIKeyboardInputModeController *)self inputModeToAddForKeyboardLanguage:v12 countryCode:v11 activeModes:v8];

    if (v13)
    {
      [v9 addObject:v13];
      if ([v8 count] == 1) {
        [v9 addObject:@"emoji"];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v32 = 0;
  id v33 = 0;
  [(UIKeyboardInputModeController *)self getHardwareKeyboardLanguage:&v33 countryCode:&v32];
  unint64_t v5 = (unint64_t)v33;
  unint64_t v6 = (unint64_t)v32;
  id v7 = 0;
  if (v5 | v6)
  {
    id v8 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v23 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v28 + 1) + 8 * i) identifier];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v11);
    }

    id v15 = [(UIKeyboardInputModeController *)self suggestedInputModesForHardwareKeyboardLanguage:v5 countryCode:v6 inputModes:v8];
    id v7 = [MEMORY[0x1E4F1CA48] array];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [[UIKeyboardSuggestedInputMode alloc] initWithIdentifier:*(void *)(*((void *)&v24 + 1) + 8 * j) enabled:1];
          [v7 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v34 count:16];
      }
      while (v18);
    }

    id v4 = v23;
  }

  return v7;
}

- (id)suggestedInputModesForCurrentLocale
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
  unint64_t v5 = [v4 preferencesActions];
  uint64_t v6 = [v5 valueForPreferenceKey:*MEMORY[0x1E4FAE528]];

  id v7 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  long long v31 = v7;
  if ([v7 count])
  {
    uint64_t v8 = [v7 objectAtIndex:0];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v32 = (void *)v6;
  long long v30 = (void *)v8;
  id v9 = [MEMORY[0x1E4FAE2D8] _inputModesForLocale:v6 language:v8 modeFetcher:&__block_literal_global_326_0];
  int v35 = [(UIKeyboardInputModeController *)self suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:0];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v29 = self;
  id obj = [(UIKeyboardInputModeController *)self suggestedInputModesForCurrentLocale:0 fallbackToDefaultInputModes:1];
  uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  uint64_t v11 = off_1E52D4000;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v42;
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v14 = 0;
      uint64_t v34 = v12;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v41 + 1) + 8 * v14);
        if ([v9 containsObject:v15])
        {
          uint64_t v16 = 1;
        }
        else
        {
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v17 = v35;
          uint64_t v16 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v16)
          {
            uint64_t v18 = v3;
            uint64_t v19 = *(void *)v38;
            while (2)
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v38 != v19) {
                  objc_enumerationMutation(v17);
                }
                long long v21 = [*(id *)(*((void *)&v37 + 1) + 8 * i) normalizedIdentifier];
                char v22 = [v21 isEqualToString:v15];

                if (v22)
                {
                  uint64_t v16 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v16 = [v17 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v16) {
                continue;
              }
              break;
            }
LABEL_21:
            id v3 = v18;
            uint64_t v11 = off_1E52D4000;
            uint64_t v13 = v33;
            uint64_t v12 = v34;
          }
        }
        id v23 = (void *)[objc_alloc(v11[26]) initWithIdentifier:v15 enabled:v16];
        [v3 addObject:v23];

        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v12);
  }

  long long v24 = [(UIKeyboardInputModeController *)v29 suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:v3];
  [v3 addObjectsFromArray:v24];

  long long v25 = (void *)[objc_alloc(v11[26]) initWithIdentifier:@"emoji" enabled:1];
  uint64_t v26 = [v3 indexOfObject:v25];
  if (v26 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v27 = v26;
    if (v26 + 1 == [v3 count]) {
      goto LABEL_29;
    }
    [v3 removeObjectAtIndex:v27];
  }
  [v3 addObject:v25];
LABEL_29:

  return v3;
}

id __68__UIKeyboardInputModeController_suggestedInputModesForCurrentLocale__block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedDefaultInputModesForLanguage(a2);
}

- (id)suggestedInputModesForLocales:(id)a3
{
  long long v46 = self;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v51 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v53 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v66 objects:v73 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v67 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v66 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1E4FAE2D8];
        uint64_t v11 = objc_msgSend(v9, "localeIdentifier", v46);
        uint64_t v12 = [v9 languageCode];
        uint64_t v13 = [v10 _inputModesForLocale:v11 language:v12 modeFetcher:&__block_literal_global_328];

        [v53 addObjectsFromArray:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v66 objects:v73 count:16];
    }
    while (v6);
  }

  uint64_t v47 = [(UIKeyboardInputModeController *)v46 suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:0];
  uint64_t v14 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v4;
  uint64_t v15 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
  uint64_t v16 = v51;
  if (v15)
  {
    uint64_t v17 = v15;
    uint64_t v18 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v63 != v18) {
          objc_enumerationMutation(obj);
        }
        long long v20 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        long long v21 = (void *)MEMORY[0x1E4FAE2D8];
        char v22 = objc_msgSend(v20, "localeIdentifier", v46);
        id v23 = [v20 languageCode];
        long long v24 = [v21 _inputModesForLocale:v22 language:v23 modeFetcher:&__block_literal_global_330_0];

        [v14 addObjectsFromArray:v24];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
    }
    while (v17);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v48 = v14;
  uint64_t v52 = [v48 countByEnumeratingWithState:&v58 objects:v71 count:16];
  if (v52)
  {
    int v25 = 0;
    uint64_t v50 = *(void *)v59;
    do
    {
      for (uint64_t k = 0; k != v52; ++k)
      {
        if (*(void *)v59 != v50) {
          objc_enumerationMutation(v48);
        }
        uint64_t v27 = *(void *)(*((void *)&v58 + 1) + 8 * k);
        if (objc_msgSend(v53, "containsObject:", v27, v46))
        {
          uint64_t v28 = 1;
        }
        else
        {
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v29 = v47;
          uint64_t v28 = [v29 countByEnumeratingWithState:&v54 objects:v70 count:16];
          if (v28)
          {
            uint64_t v30 = *(void *)v55;
            while (2)
            {
              for (uint64_t m = 0; m != v28; ++m)
              {
                if (*(void *)v55 != v30) {
                  objc_enumerationMutation(v29);
                }
                id v32 = [*(id *)(*((void *)&v54 + 1) + 8 * m) normalizedIdentifier];
                char v33 = [v32 isEqualToString:v27];

                if (v33)
                {
                  uint64_t v28 = 1;
                  goto LABEL_32;
                }
              }
              uint64_t v28 = [v29 countByEnumeratingWithState:&v54 objects:v70 count:16];
              if (v28) {
                continue;
              }
              break;
            }
          }
LABEL_32:
        }
        uint64_t v34 = [[UIKeyboardSuggestedInputMode alloc] initWithIdentifier:v27 enabled:v28];
        int v35 = (void *)MEMORY[0x1E4F1CA20];
        uint64_t v36 = [(UIKeyboardInputMode *)v34 primaryLanguage];
        long long v37 = [v35 localeWithLocaleIdentifier:v36];
        long long v38 = [v37 languageCode];
        int v39 = [v38 isEqualToString:@"en"];

        if ((v28 & v39 & v25) == 1)
        {
          long long v40 = [[UIKeyboardSuggestedInputMode alloc] initWithIdentifier:v27 enabled:0];

          int v25 = 1;
          uint64_t v34 = v40;
        }
        else
        {
          v25 |= v28 & v39;
        }
        uint64_t v16 = v51;
        [v51 addObject:v34];
      }
      uint64_t v52 = [v48 countByEnumeratingWithState:&v58 objects:v71 count:16];
    }
    while (v52);
  }

  long long v41 = [(UIKeyboardInputModeController *)v46 suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:v16];
  [v16 addObjectsFromArray:v41];

  long long v42 = [[UIKeyboardSuggestedInputMode alloc] initWithIdentifier:@"emoji" enabled:1];
  uint64_t v43 = [v16 indexOfObject:v42];
  if (v43 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v44 = v43;
    if (v43 + 1 == [v16 count]) {
      goto LABEL_42;
    }
    [v16 removeObjectAtIndex:v44];
  }
  objc_msgSend(v16, "addObject:", v42, v46);
LABEL_42:

  return v16;
}

id __63__UIKeyboardInputModeController_suggestedInputModesForLocales___block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedDefaultInputModesForLanguage(a2);
}

id __63__UIKeyboardInputModeController_suggestedInputModesForLocales___block_invoke_2(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedInputModesForLanguage(a2, 1);
}

- (id)suggestedInputModesForPreferredLanguages
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA20] preferredLocale];
  id v4 = [v3 localeIdentifier];

  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [MEMORY[0x1E4FAE2D8] _inputModesForLocale:v4 language:*(void *)(*((void *)&v25 + 1) + 8 * i) modeFetcher:&__block_literal_global_332];
        [v5 addObjectsFromArray:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v13 = objc_msgSend(v5, "array", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = [[UIKeyboardSuggestedInputMode alloc] initWithIdentifier:*(void *)(*((void *)&v21 + 1) + 8 * j) enabled:1];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(UIKeyboardInputModeController *)self suggestedInputModesForCurrentHardwareKeyboardAndSuggestedInputModes:v12];
  [v12 addObjectsFromArray:v19];

  return v12;
}

id __73__UIKeyboardInputModeController_suggestedInputModesForPreferredLanguages__block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardGetSuggestedInputModesForLanguage(a2, 1);
}

- (void)loadSuggestedInputModesForSiriLanguage
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = +[UIDictationConnectionPreferences sharedInstance];
  id v4 = [v3 languageCode];

  if (([v4 hasPrefix:@"yue"] & 1) != 0
    || ([v4 hasPrefix:@"wuu"] & 1) != 0)
  {
    uint64_t v5 = @"zh-CN";
LABEL_4:

    id v4 = v5;
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"zh-HK"])
  {
    uint64_t v5 = @"yue-Hant";
    goto LABEL_4;
  }
  if ([v4 isEqualToString:@"zh-TW"])
  {
    uint64_t v5 = @"zh-Hant";
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v7 = TIInputModeGetBaseLanguage();
  if (v7)
  {
    long long v20 = self;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v8 = UIKeyboardGetSupportedInputModes();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(void *)(*((void *)&v21 + 1) + 8 * i), v20);
          uint64_t v14 = [v13 primaryLanguage];
          int v15 = [v14 hasPrefix:v7];

          if (v15)
          {
            uint64_t v16 = [v13 primaryLanguage];
            int v17 = [v16 isEqualToString:v4];

            uint64_t v18 = [v13 normalizedIdentifier];
            if (v17) {
              [v6 insertObject:v18 atIndex:0];
            }
            else {
              [v6 addObject:v18];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    [(UIKeyboardInputModeController *)v20 setSuggestedInputModesForSiriLanguage:v6];
  }
  else
  {
    uint64_t v19 = [(UIKeyboardInputModeController *)self normalizedEnabledInputModeIdentifiers];
    [(UIKeyboardInputModeController *)self setSuggestedInputModesForSiriLanguage:v19];
  }
}

- (void)didEnterBackground:(id)a3
{
  id v4 = a3;
  if (pthread_main_np())
  {
    uint64_t v5 = [(UIKeyboardInputModeController *)self extensionMatchingContext];

    if (v4 && v5)
    {
      uint64_t v6 = [(UIKeyboardInputModeController *)self extensionMatchingContext];
      [(UIKeyboardInputModeController *)self setExtensionMatchingContext:0];
      [MEMORY[0x1E4F28C70] endMatchingExtensions:v6];
    }
    [(UIKeyboardInputModeController *)self _clearAllExtensionsIfNeeded];
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52__UIKeyboardInputModeController_didEnterBackground___block_invoke;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __52__UIKeyboardInputModeController_didEnterBackground___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) didEnterBackground:*(void *)(a1 + 40)];
}

- (void)_clearAllExtensions
{
  if (pthread_main_np())
  {
    allExtensions = self->_allExtensions;
    self->_allExtensions = 0;

    allowedExtensions = self->_allowedExtensions;
    self->_allowedExtensions = 0;

    [(UIKeyboardInputModeController *)self setEnabledInputModes:0];
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = (void *)qword_1EB25A720;
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    uint64_t v11 = __52__UIKeyboardInputModeController__clearAllExtensions__block_invoke;
    uint64_t v12 = &unk_1E52F3418;
    id v13 = v6;
    uint64_t v14 = self;
    id v8 = v6;
    [v7 enumerateKeysAndObjectsUsingBlock:&v9];
    objc_msgSend((id)qword_1EB25A720, "removeObjectsForKeys:", v8, v9, v10, v11, v12);
  }
  else
  {
    [(UIKeyboardInputModeController *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:1];
  }
}

void __52__UIKeyboardInputModeController__clearAllExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v5 isExtensionInputMode])
  {
    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v6 = *(void *)(a1 + 40);
    if (*(id *)(v6 + 8) == v5)
    {
      *(void *)(v6 + 8) = 0;
    }
  }
}

uint64_t __60__UIKeyboardInputModeController__clearAllExtensionsIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isStalledExtensionInputMode];
  if (result)
  {
    uint64_t result = [*(id *)(a1 + 32) _clearAllExtensions];
    *a4 = 1;
  }
  return result;
}

- (id)_allExtensionsFromMatchingExtensions:(id)a3
{
  id v5 = (NSArray *)a3;
  if ([(NSArray *)v5 count])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v5, "count"));
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke;
    v32[3] = &unk_1E52F3468;
    id v7 = v6;
    id v33 = v7;
    [(NSArray *)v5 enumerateObjectsUsingBlock:v32];
    uint64_t v26 = 0;
    long long v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__120;
    uint64_t v30 = __Block_byref_object_dispose__120;
    id v31 = 0;
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = [MEMORY[0x1E4F74230] sharedConnection];
    uint64_t v10 = _UIMainBundleIdentifier();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_2;
    v23[3] = &unk_1E52F3490;
    long long v25 = &v26;
    uint64_t v11 = v8;
    long long v24 = v11;
    [v9 allowedKeyboardBundleIDsAfterApplyingFilterToBundleIDs:v7 hostAppBundleID:v10 accountIsManaged:0 completion:v23];

    dispatch_time_t v12 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v11, v12);
    id v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)v27[5], "count"));
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_3;
    v20[3] = &unk_1E52F34B8;
    long long v22 = &v26;
    uint64_t v14 = v13;
    long long v21 = v14;
    [(NSArray *)v5 enumerateObjectsUsingBlock:v20];
    allExtensions = self->_allExtensions;
    self->_allExtensions = v5;
    uint64_t v16 = v5;

    allowedExtensions = self->_allowedExtensions;
    self->_allowedExtensions = v14;
    uint64_t v18 = v14;

    id v5 = self->_allExtensions;
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    objc_storeStrong((id *)&self->_allExtensions, a3);
    objc_storeStrong((id *)&self->_allowedExtensions, a3);
  }
  return v5;
}

void __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

void __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __70__UIKeyboardInputModeController__allExtensionsFromMatchingExtensions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = v3;
  id v5 = [v3 identifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) extensionMatchingContext];

  if (!v2)
  {
    id v3 = (void *)MEMORY[0x1E4F28C70];
    uint64_t v7 = *MEMORY[0x1E4F282B0];
    v8[0] = @"com.apple.keyboard-service";
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_2;
    v6[3] = &unk_1E52F3508;
    v6[4] = *(void *)(a1 + 32);
    id v5 = [v3 beginMatchingExtensionsWithAttributes:v4 completion:v6];
    [*(id *)(a1 + 32) setExtensionMatchingContext:v5];
  }
}

void __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v6 = [v5 preferencesActions];
  uint64_t v7 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE520]];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (([*(id *)(a1 + 32) identifierIsValidSystemInputMode:v12] & 1) == 0)
        {
          if (![v3 count]
            || (v16[0] = MEMORY[0x1E4F143A8],
                v16[1] = 3221225472,
                v16[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_3,
                v16[3] = &unk_1E52F34E0,
                v16[4] = v12,
                [v3 indexOfObjectPassingTest:v16] == 0x7FFFFFFFFFFFFFFFLL))
          {
            [v4 addObject:v12];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  if ([v4 count])
  {
    dispatch_time_t v13 = dispatch_time(0, 18000000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_4;
    block[3] = &unk_1E52D9F98;
    block[4] = *(void *)(a1 + 32);
    id v15 = v4;
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
  }
  [*(id *)(a1 + 32) _clearAllExtensionsIfNeeded];
}

uint64_t __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

uint64_t __66__UIKeyboardInputModeController__beginContinuousDiscoveryIfNeeded__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeInputModes:*(void *)(a1 + 40)];
}

- (BOOL)_mayContainExtensionInputModes
{
  uint64_t v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 preferencesActions];
  char v4 = [v3 allEnabledInputModesAreValid] ^ 1;

  return v4;
}

- (void)_removeInputModes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v6 = [v5 preferencesActions];
  uint64_t v7 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE520]];
  uint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = [v8 count];
  [(UIKeyboardInputModeController *)self _clearAllExtensions];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v4;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v8, "containsObject:", v15, (void)v20))
        {
          uint64_t v16 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v15];
          if (!v16) {
            [v8 removeObject:v15];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  if (v9 != [v8 count])
  {
    long long v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
    long long v18 = [v17 preferencesActions];
    if ([v8 count]) {
      long long v19 = v8;
    }
    else {
      long long v19 = 0;
    }
    objc_msgSend(v18, "saveInputModes:", v19, (void)v20);
  }
}

- (id)_MCFilteredExtensionIdentifiers
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->_skipExtensionInputModes
    || ![(UIKeyboardInputModeController *)self verifyKeyboardExtensionsWithApp])
  {
    id v3 = 0;
  }
  else if ([(NSArray *)self->_allExtensions count])
  {
    id v3 = self->_allExtensions;
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C70];
    uint64_t v10 = *MEMORY[0x1E4F282B0];
    v11[0] = @"com.apple.keyboard-service";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    uint64_t v9 = 0;
    uint64_t v7 = [v5 extensionsWithMatchingAttributes:v6 error:&v9];
    uint64_t v8 = v9;

    if (v8)
    {
      NSLog(&cfstr_FailedToLoadKe.isa);
      id v3 = 0;
    }
    else
    {
      NSLog(&cfstr_SuccessfullyLo.isa);
      id v3 = [(UIKeyboardInputModeController *)self _allExtensionsFromMatchingExtensions:v7];
    }
  }
  return v3;
}

- (BOOL)deviceStateIsLocked
{
  int v2 = MKBGetDeviceLockState();
  return v2 != 3 && v2 != 0;
}

- (BOOL)isLockscreenPasscodeKeyboard
{
  int v2 = +[UIKeyboardImpl activeInstance];
  if ([(id)UIApp _isSpringBoard])
  {
    id v3 = [v2 delegate];
    if (v3)
    {
      id v4 = [v2 textInputTraits];
      char v5 = [v4 isSecureTextEntry];
    }
    else
    {
      char v5 = 1;
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)extensionInputModes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(UIKeyboardInputModeController *)self isLockscreenPasscodeKeyboard])
  {
    id v3 = 0;
  }
  else
  {
    id v4 = [(UIKeyboardInputModeController *)self _MCFilteredExtensionIdentifiers];
    id v3 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "identifier", (void)v13);
          uint64_t v11 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v10];

          if (v11) {
            [v3 addObject:v11];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return v3;
}

- (id)nextInputModeFromList:(id)a3 withFilter:(unint64_t)a4 withTraits:(id)a5
{
  id v8 = a3;
  id v28 = a5;
  switch(a4)
  {
    case 0uLL:
      char v9 = 0;
      uint64_t v10 = (uint64_t (*)())_UITextInputTraitsAllowedInputMode;
      goto LABEL_9;
    case 1uLL:
      char v9 = 0;
      uint64_t v10 = (uint64_t (*)())_UITextInputTraitsAllowedInputModeExceptEmoji;
      goto LABEL_9;
    case 2uLL:
      char v9 = 0;
      uint64_t v10 = (uint64_t (*)())_UITextInputTraitsAllowedInputModeExcludeLastAndCurrentInputModes;
      goto LABEL_9;
    case 3uLL:
      char v9 = 0;
      uint64_t v10 = (uint64_t (*)())_UITextInputTraitsAllowedInputModeExcludeLastAndCurrentInputModesAndEmoji;
      goto LABEL_9;
    case 4uLL:
      char v9 = 0;
      uint64_t v10 = _UIKeyboardInputModeDefaultLayoutIsASCIICapable;
      goto LABEL_9;
    case 5uLL:
      char v9 = 0;
      uint64_t v10 = (uint64_t (*)())_UIKeyboardInputModeDefaultLayoutIsCarPlayEnabled;
LABEL_9:
      uint64_t v11 = v10;
      break;
    default:
      uint64_t v11 = 0;
      char v9 = 1;
      break;
  }
  uint64_t v12 = [v8 count];
  if (v12 == 1)
  {
    uint64_t v15 = [v8 objectAtIndex:0];
    long long v16 = (void *)v15;
    if ((v9 & 1) == 0 && (((uint64_t (*)(uint64_t, id))v11)(v15, v28) & 1) == 0)
    {

LABEL_32:
      long long v16 = 0;
    }
  }
  else
  {
    unint64_t v13 = v12;
    if (v12)
    {
      uint64_t v17 = [(UIKeyboardInputModeController *)self currentInputMode];
      if (v17
        && (uint64_t v18 = (void *)v17,
            [(UIKeyboardInputModeController *)self currentInputMode],
            long long v19 = objc_claimAutoreleasedReturnValue(),
            uint64_t v20 = [v8 indexOfObject:v19],
            v19,
            v18,
            v20 != 0x7FFFFFFFFFFFFFFFLL))
      {
        uint64_t v21 = v20 + 1;
      }
      else
      {
        uint64_t v21 = v13;
      }
      uint64_t v22 = 0;
      do
      {
        while (1)
        {
          long long v16 = [v8 objectAtIndex:(int)((v22 + v21) % v13)];
          long long v23 = [(UIKeyboardInputModeController *)self currentInputMode];
          char v24 = [v16 isEqual:v23];

          if (v24) {
            break;
          }
          if (v9 & 1) != 0 || (((uint64_t (*)(void *, id))v11)(v16, v28)) {
            goto LABEL_33;
          }

          if (++v22 == v13) {
            goto LABEL_29;
          }
        }

        ++v22;
      }
      while (v22 != v13);
      if (v9) {
        goto LABEL_30;
      }
LABEL_29:
      uint64_t v25 = [(UIKeyboardInputModeController *)self currentInputMode];
      int v26 = ((uint64_t (*)(void *, id))v11)(v25, v28);

      if (!v26) {
        goto LABEL_32;
      }
LABEL_30:
      uint64_t v14 = [(UIKeyboardInputModeController *)self currentInputMode];
    }
    else
    {
      uint64_t v14 = +[UIKeyboardInputMode intlInputMode];
    }
    long long v16 = (void *)v14;
  }
LABEL_33:

  return v16;
}

- (void)_setCurrentAndNextInputModePreference
{
  id v14 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [(UIKeyboardInputModeController *)self currentUsedInputMode];

  if (v3)
  {
    id v4 = [(UIKeyboardInputModeController *)self currentUsedInputMode];
    id v5 = [v4 identifier];
    [v14 addObject:v5];

    uint64_t v6 = [(UIKeyboardInputModeController *)self lastUsedInputMode];

    if (v6)
    {
      uint64_t v7 = [(UIKeyboardInputModeController *)self lastUsedInputMode];
      id v8 = [v7 identifier];
      [v14 addObject:v8];

      char v9 = [(UIKeyboardInputModeController *)self nextInputModeToUse];

      if (v9)
      {
        uint64_t v10 = [(UIKeyboardInputModeController *)self nextInputModeToUse];
        uint64_t v11 = [v10 identifier];
        [v14 addObject:v11];
      }
    }
  }
  uint64_t v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
  unint64_t v13 = [v12 preferencesActions];
  [v13 setInputModeSelectionSequence:v14];
}

- (id)nextInputModeToUseForTraits:(id)a3 updatePreference:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(UIKeyboardInputModeController *)self nextInputModeToUse];
  if (v7)
  {
    id v8 = [(UIKeyboardInputModeController *)self nextInputModeToUse];
    char v9 = [(UIKeyboardInputModeController *)self currentInputMode];
    if (![v8 isEqual:v9])
    {
      uint64_t v10 = [(UIKeyboardInputModeController *)self activeInputModes];
      uint64_t v11 = [(UIKeyboardInputModeController *)self nextInputModeToUse];
      if ([v10 indexOfObject:v11] != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = [(UIKeyboardInputModeController *)self nextInputModeToUse];
        if ([v12 isAllowedForTraits:v6])
        {
          unsigned int v13 = [v6 keyboardType];
          if ((v13 > 0xB || ((1 << v13) & 0x930) == 0) && v13 != 127)
          {
            long long v16 = [(UIKeyboardInputModeController *)self currentInputMode];
            [(UIKeyboardInputModeController *)self nextInputModeToUse];
            uint64_t v22 = v21 = v16;
            uint64_t v17 = [v16 identifier];
            uint64_t v20 = TIInputModeGetMultilingualID();

            uint64_t v18 = [v22 identifier];
            long long v23 = TIInputModeGetMultilingualID();

            if (![v20 length] || !objc_msgSend(v23, "length"))
            {

              goto LABEL_23;
            }
            char v19 = [v20 isEqualToString:v23];

            if ((v19 & 1) == 0)
            {
LABEL_23:
              uint64_t v7 = [(UIKeyboardInputModeController *)self nextInputModeToUse];
              if (!v4) {
                goto LABEL_14;
              }
              goto LABEL_12;
            }
            goto LABEL_10;
          }
        }
      }
    }

LABEL_10:
    uint64_t v7 = 0;
  }
  if (!v4) {
    goto LABEL_14;
  }
LABEL_12:
  id v14 = [(UIKeyboardInputModeController *)self nextInputModeToUse];

  if (v14)
  {
    [(UIKeyboardInputModeController *)self setNextInputModeToUse:0];
    [(UIKeyboardInputModeController *)self _setCurrentAndNextInputModePreference];
  }
LABEL_14:

  return v7;
}

- (void)clearNextInputModeToUse
{
}

- (id)nextInputModeToUseForTraits:(id)a3
{
  return [(UIKeyboardInputModeController *)self nextInputModeToUseForTraits:a3 updatePreference:1];
}

- (id)nextInputModeInPreferenceListForTraits:(id)a3 updatePreference:(BOOL)a4
{
  return [(UIKeyboardInputModeController *)self nextInputModeInPreferenceListForTraits:a3 updatePreference:a4 skipEmoji:0];
}

- (id)nextInputModeInPreferenceListForTraits:(id)a3 updatePreference:(BOOL)a4 skipEmoji:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  char v9 = [(UIKeyboardInputModeController *)self nextInputModeToUseForTraits:v8 updatePreference:v6];
  uint64_t v10 = v9;
  if (!v9 || v5 && [v9 isEmojiInputMode])
  {
    uint64_t v11 = +[UIKeyboardInputMode intlInputMode];
    uint64_t v12 = [(UIKeyboardInputModeController *)self activeUserSelectableInputModes];
    id v13 = (id)UIKeyboardActiveInputModes;
    id v14 = [v11 identifier];
    int v15 = [v13 containsObject:v14];

    if (v15)
    {
      uint64_t v16 = [v12 arrayByAddingObject:v11];

      uint64_t v12 = (void *)v16;
    }
    if (v5) {
      uint64_t v17 = 3;
    }
    else {
      uint64_t v17 = 2;
    }
    uint64_t v18 = [(UIKeyboardInputModeController *)self nextInputModeFromList:v12 withFilter:v17 withTraits:v8];

    uint64_t v10 = (void *)v18;
    if (!v18)
    {
      uint64_t v10 = [(UIKeyboardInputModeController *)self nextInputModeFromList:v12 withFilter:v5 withTraits:v8];
      if (!v10)
      {
        uint64_t v10 = +[UIKeyboardInputMode intlInputMode];
      }
    }
    if (v6)
    {
      char v19 = [(UIKeyboardInputModeController *)self lastUsedInputMode];

      if (v19)
      {
        [(UIKeyboardInputModeController *)self setLastUsedInputMode:0];
        [(UIKeyboardInputModeController *)self _setCurrentAndNextInputModePreference];
      }
    }
  }
  return v10;
}

- (id)nextInputModeInPreferenceListForTraits:(id)a3
{
  return [(UIKeyboardInputModeController *)self nextInputModeInPreferenceListForTraits:a3 updatePreference:1];
}

+ (id)inputModeIdentifierForPreferredLanguages:(id)a3 passingTest:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = (uint64_t (**)(id, void *))a4;
  uint64_t v7 = [v5 count];
  id v8 = 0;
  if (v6 && v7)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v5;
    uint64_t v9 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v20 = v5;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(obj);
          }
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = TIGetDefaultInputModesForLanguage();
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v23;
LABEL_10:
            uint64_t v17 = 0;
            while (1)
            {
              if (*(void *)v23 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * v17);
              if (v6[2](v6, v18)) {
                break;
              }
              if (v15 == ++v17)
              {
                uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
                if (v15) {
                  goto LABEL_10;
                }
                goto LABEL_16;
              }
            }
            id v8 = v18;

            if (v8) {
              goto LABEL_21;
            }
          }
          else
          {
LABEL_16:
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
      id v8 = 0;
LABEL_21:
      id v5 = v20;
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

+ (id)ASCIICapableInputModeIdentifierForPreferredLanguages
{
  id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  BOOL v4 = [a1 inputModeIdentifierForPreferredLanguages:v3 passingTest:&__block_literal_global_367_0];

  if (![v4 length])
  {
    id v5 = TIGetDefaultInputModesForLanguage();
    uint64_t v6 = [v5 firstObject];

    BOOL v4 = (void *)v6;
  }
  return v4;
}

uint64_t __85__UIKeyboardInputModeController_ASCIICapableInputModeIdentifierForPreferredLanguages__block_invoke(uint64_t a1, void *a2)
{
  return UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(a2);
}

- (id)inputModeIdentifierLastUsedForLanguage:(id)a3
{
  return [(UIKeyboardInputModeController *)self inputModeIdentifierLastUsedForLanguage:a3 includingExtensions:1];
}

- (id)inputModeIdentifierLastUsedForLanguage:(id)a3 includingExtensions:(BOOL)a4
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"ASCIICapable"])
  {
    uint64_t v6 = UIKeyboardGetCurrentInputMode();
    int v7 = UIKeyboardLayoutSupportsASCIIToggleKey(v6);

    if (!v7)
    {
      uint64_t v12 = 0;
      goto LABEL_80;
    }
  }
  id v8 = TIInputModeGetLanguageWithRegion();

  uint64_t v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v10 = [v9 preferencesActions];
  uint64_t v11 = [v10 valueForPreferenceKey:*MEMORY[0x1E4FAE8B8]];

  if ([v11 count])
  {
    uint64_t v12 = [v11 objectForKey:v8];
  }
  else
  {
    uint64_t v12 = 0;
  }
  id v5 = v8;
  if ([v8 isEqualToString:@"NonASCII"]
    && !UIKeyboardLayoutSupportsASCIIToggleKey(v12)
    || v12
    && !a4
    && (+[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", v12), id v13 = objc_claimAutoreleasedReturnValue(), v14 = [v13 isExtensionInputMode], v13, v5 = v8, v14))
  {

    uint64_t v12 = 0;
  }
  id v15 = (id)UIKeyboardActiveInputModes;
  if (([v15 containsObject:v12] & 1) == 0)
  {

    uint64_t v12 = 0;
  }
  if ([v15 count] == 1)
  {
    if ([v5 isEqualToString:@"ASCIICapable"])
    {
      uint64_t v16 = UIKeyboardGetCurrentInputMode();
      uint64_t v17 = TIInputModeGetNormalizedIdentifier();
      uint64_t v18 = UIKeyboardGetPreferredASCIICapableInputModeForInputMode((uint64_t)v17);
    }
    else
    {
      if (![v5 isEqualToString:@"NonASCII"]) {
        goto LABEL_21;
      }
      uint64_t v16 = UIKeyboardGetCurrentInputMode();
      uint64_t v17 = TIInputModeGetNormalizedIdentifier();
      uint64_t v18 = UIKeyboardGetPreferredNonASCIICapableInputModeForInputMode((uint64_t)v17);
    }
    char v19 = (void *)v18;

    uint64_t v12 = v19;
  }
LABEL_21:
  if (![v12 length])
  {
    if ([v5 isEqualToString:@"ASCIICapable"])
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v20 = v15;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v70 objects:v77 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        id v54 = v15;
        long long v56 = v11;
        uint64_t v23 = *(void *)v71;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v71 != v23) {
              objc_enumerationMutation(v20);
            }
            long long v25 = *(void **)(*((void *)&v70 + 1) + 8 * i);
            if (!a4)
            {
              long long v26 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:*(void *)(*((void *)&v70 + 1) + 8 * i)];
              char v27 = [v26 isExtensionInputMode];

              if (v27) {
                continue;
              }
            }
            if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v25))
            {
              id v28 = v25;

              goto LABEL_48;
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v70 objects:v77 count:16];
          if (v22) {
            continue;
          }
          break;
        }
        id v28 = v12;
LABEL_48:
        uint64_t v11 = v56;
        id v15 = v54;
      }
      else
      {
        id v28 = v12;
      }

      if ([v28 length])
      {
        uint64_t v12 = v28;
        goto LABEL_79;
      }
      uint64_t v12 = [(id)objc_opt_class() ASCIICapableInputModeIdentifierForPreferredLanguages];
    }
    else if ([v5 isEqualToString:@"NonASCII"])
    {
      long long v68 = 0uLL;
      long long v69 = 0uLL;
      long long v66 = 0uLL;
      long long v67 = 0uLL;
      id v28 = v15;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v66 objects:v76 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        id v55 = v15;
        long long v57 = v11;
        uint64_t v31 = *(void *)v67;
        while (2)
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v67 != v31) {
              objc_enumerationMutation(v28);
            }
            id v33 = *(void **)(*((void *)&v66 + 1) + 8 * j);
            if (!a4)
            {
              uint64_t v34 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:*(void *)(*((void *)&v66 + 1) + 8 * j)];
              char v35 = [v34 isExtensionInputMode];

              if (v35) {
                continue;
              }
            }
            if ((UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v33) & 1) == 0
              && UIKeyboardLayoutSupportsASCIIToggleKey(v33))
            {
              id v51 = v33;

              uint64_t v12 = v51;
              goto LABEL_75;
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v66 objects:v76 count:16];
          if (v30) {
            continue;
          }
          break;
        }
LABEL_75:
        uint64_t v11 = v57;
        id v15 = v55;
      }
    }
    else
    {
      long long v64 = 0uLL;
      long long v65 = 0uLL;
      long long v62 = 0uLL;
      long long v63 = 0uLL;
      id v36 = v15;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v62 objects:v75 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        id v39 = v15;
        uint64_t v40 = *(void *)v63;
        while (2)
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v63 != v40) {
              objc_enumerationMutation(v36);
            }
            long long v42 = *(void **)(*((void *)&v62 + 1) + 8 * k);
            uint64_t v43 = TIInputModeGetLanguageWithRegion();
            if ([v43 isEqualToString:v5])
            {
              id v44 = v42;

              uint64_t v12 = v44;
              goto LABEL_63;
            }
          }
          uint64_t v38 = [v36 countByEnumeratingWithState:&v62 objects:v75 count:16];
          if (v38) {
            continue;
          }
          break;
        }
LABEL_63:
        id v15 = v39;
      }

      if ([v12 length]) {
        goto LABEL_79;
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v28 = v36;
      uint64_t v45 = [v28 countByEnumeratingWithState:&v58 objects:v74 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        id v47 = v15;
        uint64_t v48 = *(void *)v59;
        while (2)
        {
          for (uint64_t m = 0; m != v46; ++m)
          {
            if (*(void *)v59 != v48) {
              objc_enumerationMutation(v28);
            }
            uint64_t v50 = *(void **)(*((void *)&v58 + 1) + 8 * m);
            if (UIKeyboardInputBaseLanguagesEqual((uint64_t)v50, v5))
            {
              id v52 = v50;

              uint64_t v12 = v52;
              goto LABEL_77;
            }
          }
          uint64_t v46 = [v28 countByEnumeratingWithState:&v58 objects:v74 count:16];
          if (v46) {
            continue;
          }
          break;
        }
LABEL_77:
        id v15 = v47;
      }
    }
  }
LABEL_79:

LABEL_80:
  return v12;
}

- (id)inputModeLastUsedForLanguage:(id)a3
{
  return [(UIKeyboardInputModeController *)self inputModeLastUsedForLanguage:a3 includingExtensions:1];
}

- (id)inputModeLastUsedForLanguage:(id)a3 includingExtensions:(BOOL)a4
{
  BOOL v4 = [(UIKeyboardInputModeController *)self inputModeIdentifierLastUsedForLanguage:a3 includingExtensions:a4];
  id v5 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v4];

  return v5;
}

- (id)inputModeForASCIIToggleWithTraits:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [v4 currentInputMode];

  int v6 = [v5 defaultLayoutIsASCIICapable];
  int v7 = @"ASCIICapable";
  if (v6) {
    int v7 = @"NonASCII";
  }
  id v8 = v7;
  uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v10 = [v9 inputModeLastUsedForLanguage:v8 includingExtensions:0];

  if (([v10 isEqual:v5] & 1) == 0)
  {
    uint64_t v11 = [v10 primaryLanguage];
    uint64_t v12 = [v5 primaryLanguage];
    if ([v11 isEqual:v12] && (objc_msgSend(v10, "isExtensionInputMode") & 1) == 0)
    {
    }
    else
    {
      int v13 = [v10 isAllowedForTraits:v3];

      if (v13)
      {
        id v14 = v10;
        goto LABEL_10;
      }
    }
  }
  id v14 = 0;
LABEL_10:

  return v14;
}

- (void)updateLastUsedInputMode:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_inputModeThatInvokeEmoji)
  {
    id v5 = +[UIKeyboardInputMode dictationInputMode];

    if (v5 == v4)
    {
      uint64_t v6 = [(UIKeyboardInputModeController *)self currentInputModeInPreference];

      id v4 = (id)v6;
    }
    int v7 = [(UIKeyboardInputModeController *)self currentUsedInputMode];
    char v8 = [v7 isEqual:v4];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = [(UIKeyboardInputModeController *)self currentUsedInputMode];
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        int v11 = [v4 isEmojiInputMode];

        if (v11)
        {
          uint64_t v18 = @"UITextInputNextInputModeInputModeDidChangeKey";
          uint64_t v12 = [(UIKeyboardInputModeController *)self currentUsedInputMode];
          v19[0] = v12;
          int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

          id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v14 postNotificationName:@"UITextInputNextInputModeInputModeDidChangeNotification" object:0 userInfo:v13];
        }
      }
      id v15 = [(UIKeyboardInputModeController *)self currentUsedInputMode];
      [(UIKeyboardInputModeController *)self setNextInputModeToUse:v15];

      [(UIKeyboardInputModeController *)self setCurrentUsedInputMode:v4];
      [(UIKeyboardInputModeController *)self setLastUsedInputMode:v4];
      [(UIKeyboardInputModeController *)self _setCurrentAndNextInputModePreference];
      uint64_t v16 = [v4 identifier];
      uint64_t v17 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarSetBoolean();
    }
  }
}

- (void)updateCurrentAndNextInputModes
{
  id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v4 = [v3 preferencesActions];
  id v11 = [v4 inputModeSelectionSequence];

  if ([v11 count])
  {
    id v5 = [v11 objectAtIndex:0];
    uint64_t v6 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v5];
    [(UIKeyboardInputModeController *)self setCurrentUsedInputMode:v6];
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    int v7 = [v11 objectAtIndex:1];
    char v8 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v7];
    [(UIKeyboardInputModeController *)self setLastUsedInputMode:v8];
  }
  if ((unint64_t)[v11 count] >= 3)
  {
    uint64_t v9 = [v11 objectAtIndex:2];
    uint64_t v10 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v9];
    [(UIKeyboardInputModeController *)self setNextInputModeToUse:v10];
  }
}

- (void)switchToCurrentSystemInputMode
{
  id v3 = [(UIKeyboardInputModeController *)self currentSystemInputMode];
  [(UIKeyboardInputModeController *)self _setCurrentInputMode:v3 force:1];
}

- (void)presentEnablementAndDataSharingPromptIfNeeded:(id)a3
{
  id v3 = a3;
  id v4 = +[UIDictationController sharedInstance];
  [v4 presentEnablementAndDataSharingPromptIfNeeded:v3];
}

- (void)switchToDictationInputMode
{
}

- (void)stopDictation
{
  int v2 = +[UIDictationController sharedInstance];
  [v2 setReasonType:17];

  id v3 = +[UIDictationController sharedInstance];
  [v3 stopDictation];

  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 dismissDictationPopover];
}

- (void)switchToDictationInputModeWithOptions:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[UIDictationController reasonType:v3];
  id v5 = +[UIDictationController sharedInstance];
  [v5 setReasonType:v4];

  id v6 = +[UIDictationController sharedInstance];
  [v6 switchToDictationInputModeWithOptions:v3];
}

- (BOOL)toggleDictationForResponder:(id)a3 withOption:(id)a4 firstResponderSetupCompletion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(void))a5;
  unint64_t v10 = +[UIDictationController reasonType:v8];
  if (objc_opt_respondsToSelector())
  {
    id v11 = (id)[v7 performSelector:sel_textInputTraits];
  }
  else
  {
    uint64_t v12 = +[UIKeyboardImpl activeInstance];
    id v11 = [v12 textInputTraits];
  }
  if (v10 != 26
    || !+[UIDictationController isRunning]
    && ([v11 forceDisableDictation] & 1) == 0
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ([v7 forceDisableDictation] & 1) == 0))
  {
    id v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v15 = [v14 keyboardWindow];

    uint64_t v16 = [v7 _window];

    if (v16 != v15) {
      goto LABEL_11;
    }
    id v47 = v9;
    char v27 = +[UIKeyboardImpl activeInstance];
    id v28 = [v27 inputDelegateManager];
    id v29 = [v28 forwardingInputDelegate];

    if (v29 == v7)
    {

      LOBYTE(v13) = 0;
      uint64_t v9 = v47;
      goto LABEL_51;
    }
    [v7 becomeFirstResponder];
    uint64_t v30 = +[UIKeyboardImpl activeInstance];
    uint64_t v31 = [v30 inputDelegateManager];
    id v32 = [v31 delegateRespectingForwardingDelegate:1];

    if (v32 == v7)
    {
      id v33 = [v7 _responderWindow];

      if (v33 == v15)
      {
        uint64_t v34 = +[UIKeyboardImpl activeInstance];
        char v35 = [v34 inputDelegateManager];
        id v36 = [v35 delegateRespectingForwardingDelegate:0];

        [v7 _overrideInputViewNextResponderWithResponder:v36];
      }
    }
    uint64_t v37 = [v7 _responderWindow];

    uint64_t v9 = v47;
    if (v37 != v15)
    {
LABEL_11:
      uint64_t v17 = +[UIKeyboard keyboardBundleIdentifier];
      int v13 = [v17 isEqualToString:@"com.apple.mobilenotes"];

      if ([v7 isEditable]) {
        goto LABEL_12;
      }
      if (!v13)
      {
LABEL_51:

        goto LABEL_52;
      }
      if (objc_opt_respondsToSelector())
      {
        [v7 setEditable:1];
LABEL_12:
        uint64_t v18 = [v7 _responderWindow];
        char v19 = [v18 _isApplicationKeyWindow];

        if ((v19 & 1) == 0)
        {
          id v20 = [v7 _responderWindow];
          [v20 makeKeyWindow];
        }
        uint64_t v21 = [v11 returnKeyType];
        if ([v7 conformsToProtocol:&unk_1ED431490] && v21 == 6) {
          [v7 setUseAutomaticEndpointing:1];
        }
        if (([v7 isFirstResponder] & 1) == 0 && v16 != v15)
        {
          uint64_t v22 = [v11 deferBecomingResponder];
          [v11 setDeferBecomingResponder:0];
          if (v10 <= 0x1A && ((1 << v10) & 0x4002600) != 0)
          {
            if (+[UIKeyboardImpl isDictationPopoverEnabled])
            {
              if (+[UIKeyboard isMajelEnabled])
              {
                uint64_t v23 = +[UIKeyboardImpl activeInstance];
                [v23 setKeyboardMinimizedByDictation:1];

                if (v10 == 13) {
                  unint64_t v10 = 27;
                }
              }
            }
          }
          int v13 = [v7 becomeFirstResponder];
          if (v13)
          {
            if (v9) {
              v9[2](v9);
            }
            if (v10 == 9) {
              uint64_t v24 = 8;
            }
            else {
              uint64_t v24 = v10;
            }
            long long v25 = +[UIDictationController sharedInstance];
            [v25 setReasonType:v24];

            long long v26 = +[UIDictationController sharedInstance];
            [v26 switchToDictationInputModeWithOptions:v8];
          }
          [v11 setDeferBecomingResponder:v22];
          goto LABEL_51;
        }
        BOOL v38 = +[UIDictationController isRunning];
        id v39 = +[UIDictationController sharedInstance];
        [v39 setReasonType:v10];

        if (v38)
        {
          uint64_t v40 = +[UIDictationController activeInstance];
          [v40 stopDictation];

          long long v41 = +[UIDictationLandingView activeInstance];
          [v41 stopLanding];

          long long v42 = +[UIDictationController activeInstance];
          int v43 = [v42 shouldSuppressSoftwareKeyboard];

          if (!v43)
          {
LABEL_50:
            LOBYTE(v13) = 1;
            goto LABEL_51;
          }
          if (v21 == 6) {
            [v7 resignFirstResponder];
          }
          id v44 = +[UIKeyboardImpl activeInstance];
          [v44 setKeyboardMinimizedByDictation:0];
        }
        else
        {
          uint64_t v45 = +[UIDictationController sharedInstance];
          [v45 showSoftwareKeyboardIfNeeded];

          id v44 = +[UIDictationController sharedInstance];
          [v44 switchToDictationInputModeWithOptions:v8];
        }

        goto LABEL_50;
      }
    }
    LOBYTE(v13) = 0;
    goto LABEL_51;
  }
  LOBYTE(v13) = 0;
LABEL_52:

  return v13;
}

- (void)toggleDictationForResponder:(id)a3 WithOptions:(id)a4
{
}

- (void)stopDictationAndResignFirstResponder
{
  id v2 = +[UIDictationController sharedInstance];
  [v2 stopDictationAndResignFirstResponder];
}

- (void)forceDictationReturnToKeyboardInputMode
{
  id v2 = +[UIDictationController sharedInstance];
  [v2 forceDictationReturnToKeyboardInputMode];
}

- (void)performWithoutExtensionInputModes:(id)a3
{
  BOOL skipExtensionInputModes = self->_skipExtensionInputModes;
  self->_BOOL skipExtensionInputModes = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL skipExtensionInputModes = skipExtensionInputModes;
  self->_cacheNeedsRefresh = 1;
}

- (void)performWithForcedExtensionInputModes:(id)a3
{
  BOOL skipExtensionInputModes = self->_skipExtensionInputModes;
  self->_BOOL skipExtensionInputModes = 0;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_BOOL skipExtensionInputModes = skipExtensionInputModes;
}

- (void)startDictationConnectionForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  id v6 = +[UIKeyboardImpl sharedInstance];
  id v7 = [v6 inputDelegate];

  if (v7)
  {
    id v8 = +[UIDictationController sharedInstance];
    [v8 startDictationForFileAtURL:v14 forInputModeIdentifier:v5];
  }
  else
  {
    uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
    unint64_t v10 = [v9 delegate];
    char v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v12 = [v8 delegate];
    int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIKeyboardErrorDomain" code:0 userInfo:0];
    [v12 dictationRequestDidFailWithError:v13];
  }
LABEL_6:
}

- (id)supportedInputModesFromArray:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(UIKeyboardInputModeController *)self supportedInputModeIdentifiers];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        int v13 = TIInputModeGetNormalizedIdentifier();
        if (objc_msgSend(v5, "containsObject:", v13, (void)v15)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)handleLastUsedInputMode:(id)a3 withNewInputMode:(id)a4
{
  unint64_t v13 = (unint64_t)a3;
  id v5 = a4;
  if ([(id)UIApp _isSpringBoard] && v13 | qword_1EB25A768)
  {
    if (v5)
    {
      if (!qword_1EB25A768)
      {
        uint64_t v6 = [(id)v13 copy];
        id v7 = (void *)qword_1EB25A768;
        qword_1EB25A768 = v6;
      }
      if (v13)
      {
        uint64_t v8 = [v5 copy];
        uint64_t v9 = (void *)qword_1EB25A770;
        qword_1EB25A770 = v8;
      }
      else
      {
        if ([v5 isEqualToString:qword_1EB25A770]) {
          goto LABEL_13;
        }
        uint64_t v12 = (void *)qword_1EB25A768;
        qword_1EB25A768 = 0;

        uint64_t v9 = (void *)qword_1EB25A770;
        qword_1EB25A770 = 0;
      }
    }
    else
    {
      if ([(id)qword_1EB25A768 isEqualToString:qword_1EB25A770]) {
        goto LABEL_13;
      }
      uint64_t v9 = (void *)[(id)qword_1EB25A768 copy];
      uint64_t v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
      char v11 = [v10 preferencesActions];
      [v11 setLanguageAwareInputModeLastUsed:v9];
    }
  }
LABEL_13:
}

- (id)hardwareLayoutToUseForInputMode:(id)a3
{
  id v4 = a3;
  id v5 = BKSHIDServicesGetHardwareKeyboardLanguage();
  if (![v5 length]
    && (+[UIDevice currentDevice],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 _isHardwareKeyboardAvailable],
        v6,
        v7)
    && (uint64_t HardwareKeyboardCountry = GSEventGetHardwareKeyboardCountry(), HardwareKeyboardCountry))
  {
    uint64_t v9 = [NSNumber numberWithInt:HardwareKeyboardCountry];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [(UIKeyboardInputModeController *)self hardwareLayoutToUseForInputMode:v4 hardwareKeyboardLanguage:v5 countryCode:v9];

  return v10;
}

- (id)hardwareLayoutToUseForInputMode:(id)a3 hardwareKeyboardLanguage:(id)a4 countryCode:(id)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  char v11 = UIKeyboardGetHardwareLayoutFromInputMode(v8, v10, v9);
  uint64_t v12 = [v8 identifierWithLayouts];
  v28[0] = v12;
  unint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v27 = 0;
  id v14 = [(UIKeyboardInputModeController *)self supportedFullModesForHardwareKeyboard:v10 countryCode:v9 activeModes:v13 matchedMode:&v27];

  id v15 = v27;
  if ([v14 count] && v15)
  {
    long long v16 = TIInputModeGetComponentsFromIdentifier();
    long long v17 = [v16 objectForKey:@"hw"];
    long long v18 = v17;
    if (v17 && ([v17 isEqualToString:@"Automatic"] & 1) == 0)
    {
      id v19 = v18;

      char v11 = v19;
    }
  }
  uint64_t v20 = [v8 normalizedIdentifier];
  uint64_t v21 = UIKeyboardGetSupportedHardwareKeyboardsForInputMode(v20);

  if (![v21 containsObject:v11] || (id v22 = v11) == 0)
  {
    uint64_t v23 = [v8 normalizedIdentifier];
    UIKeyboardGetDefaultHardwareKeyboardLayoutForInputMode(v23);
    id v22 = (id)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      uint64_t v24 = +[UIKeyboardInputMode intlInputMode];
      int v25 = [v8 isEqual:v24];

      if (v25)
      {
        UIKeyboardGetDefaultHardwareKeyboardLayoutForInputMode(@"en_US");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v22 = 0;
      }
    }
  }

  return v22;
}

- (id)inputModeToAddForKeyboardLanguage:(id)a3 countryCode:(id)a4 activeModes:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  char v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = TIInputModeGetNormalizedIdentifier();
        [v10 addObject:v17];

        long long v18 = TIInputModeGetLanguage();
        [v11 addObject:v18];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v14);
  }

  id v37 = 0;
  uint64_t v31 = v8;
  id v19 = [(UIKeyboardInputModeController *)self supportedFullModesForHardwareKeyboard:v7 countryCode:v8 activeModes:v12 matchedMode:&v37];
  id v20 = v37;
  if (v20)
  {
    uint64_t v21 = 0;
    id v22 = v19;
    goto LABEL_30;
  }
  id v22 = [(UIKeyboardInputModeController *)self supportedInputModesFromArray:v19];

  if (![v22 count])
  {
    uint64_t v21 = 0;
    goto LABEL_30;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v22 = v22;
  uint64_t v21 = (void *)[v22 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (!v21)
  {
    id v28 = v22;
LABEL_28:

    goto LABEL_30;
  }
  id v30 = v7;
  uint64_t v23 = *(void *)v34;
LABEL_13:
  uint64_t v24 = 0;
  while (1)
  {
    if (*(void *)v34 != v23) {
      objc_enumerationMutation(v22);
    }
    int v25 = *(void **)(*((void *)&v33 + 1) + 8 * v24);
    long long v26 = TIInputModeGetNormalizedIdentifier();
    id v27 = TIInputModeGetLanguage();
    if (UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v25))
    {
      if (![v11 containsObject:v27]) {
        break;
      }
      goto LABEL_20;
    }
    if (([v10 containsObject:v26] & 1) == 0) {
      break;
    }
LABEL_20:

    if (v21 == (void *)++v24)
    {
      uint64_t v21 = (void *)[v22 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v21) {
        goto LABEL_13;
      }
      id v28 = v22;
      id v7 = v30;
      goto LABEL_25;
    }
  }

  if (v26)
  {
    id v28 = [(UIKeyboardInputModeController *)self fullInputModeFromIdentifier:v26 hardwareKeyboardLanguage:v30];
    uint64_t v21 = UIKeyboardInputModeGetIdentifierFromComponents(v28);

    id v7 = v30;
LABEL_25:
    id v20 = 0;
    goto LABEL_28;
  }
  uint64_t v21 = 0;
  id v20 = 0;
  id v7 = v30;
LABEL_30:

  return v21;
}

- (id)fullInputModeFromIdentifier:(id)a3 hardwareKeyboardLanguage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = TIInputModeGetComponentsFromIdentifier();
  id v8 = (void *)[v7 mutableCopy];

  id v9 = UIKeyboardGetSoftwareLayoutForHardwareKeyboardAndInputMode((uint64_t)v6, v5);
  if (v9) {
    [v8 setObject:v9 forKey:@"sw"];
  }
  UIKeyboardGetDefaultInputModeLayoutForHardwareKeyboardWithCountryCode(v5, v6, &unk_1ED3F4698);
  id v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v10) {
    id v10 = @"Automatic";
  }
  [v8 setObject:v10 forKey:@"hw"];

  return v8;
}

- (void)showAddKeyboardAlertForInputModeIdentifier:(id)a3
{
  id v5 = a3;
  id v6 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v5];
  id v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  id v8 = [v6 languageWithRegion];
  id v9 = UIKeyboardLanguageNameInUILanguage(v8);

  uint64_t v10 = MGCopyAnswer();
  id v27 = _UINSLocalizedStringWithDefaultValue(@"%@ Keyboard Detected", @"%@ Keyboard Detected");
  char v11 = [NSString stringWithFormat:v9];
  _UINSLocalizedStringWithDefaultValue(@"Do you want to configure this %@ for typing in %@?", @"Do you want to configure this %@ for typing in %@?");
  long long v26 = v28 = (void *)v10;
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", v10, v9);
  uint64_t v24 = _UINSLocalizedStringWithDefaultValue(@"Add %@ Keyboard", @"Add %@ Keyboard");
  uint64_t v13 = [NSString stringWithFormat:v9];
  uint64_t v14 = _UINSLocalizedStringWithDefaultValue(@"Not Now", @"Not Now");
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  [v15 setObject:v11 forKey:*MEMORY[0x1E4F1D990]];
  int v25 = (void *)v12;
  [v15 setObject:v12 forKey:*MEMORY[0x1E4F1D9A8]];
  [v15 setObject:v13 forKey:*MEMORY[0x1E4F1D9E0]];
  [v15 setObject:v14 forKey:*MEMORY[0x1E4F1D9D0]];
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  long long v16 = (void *)qword_1EB25A7E0;
  uint64_t v37 = qword_1EB25A7E0;
  if (!qword_1EB25A7E0)
  {
    *(void *)error = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    uint64_t v31 = __getSBUserNotificationDefaultButtonTagSymbolLoc_block_invoke;
    id v32 = &unk_1E52D9900;
    long long v33 = &v34;
    long long v17 = SpringBoardServicesLibrary_0();
    v35[3] = (uint64_t)dlsym(v17, "SBUserNotificationDefaultButtonTag");
    qword_1EB25A7E0 = *(void *)(v33[1] + 24);
    long long v16 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (v16)
  {
    [v15 setObject:&unk_1ED3F46B0 forKey:*v16];
    uint64_t v34 = 0;
    long long v35 = &v34;
    uint64_t v36 = 0x2020000000;
    long long v18 = (void *)qword_1EB25A7E8;
    uint64_t v37 = qword_1EB25A7E8;
    if (!qword_1EB25A7E8)
    {
      *(void *)error = MEMORY[0x1E4F143A8];
      uint64_t v30 = 3221225472;
      uint64_t v31 = __getSBUserNotificationAllowInSetupKeySymbolLoc_block_invoke;
      id v32 = &unk_1E52D9900;
      long long v33 = &v34;
      id v19 = SpringBoardServicesLibrary_0();
      v35[3] = (uint64_t)dlsym(v19, "SBUserNotificationAllowInSetupKey");
      qword_1EB25A7E8 = *(void *)(v33[1] + 24);
      long long v18 = (void *)v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v18)
    {
      [v15 setObject:*MEMORY[0x1E4F1CFD0] forKey:*v18];
      objc_storeStrong((id *)&self->_newModeForUserNotification, a3);
      error[0] = 0;
      id v20 = CFUserNotificationCreate(0, 0.0, 3uLL, error, (CFDictionaryRef)v15);
      self->_userNotification = v20;
      self->_userNotificationRunLoopSource = CFUserNotificationCreateRunLoopSource(0, v20, (CFUserNotificationCallBack)__userNotificationCallback, 0);
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);

LABEL_9:
      return;
    }
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationAllowInSetupKey(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"UIKeyboardInputModeController.m", 106, @"%s", dlerror());
  }
  else
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v23 = [NSString stringWithUTF8String:"NSString *getSBUserNotificationDefaultButtonTag(void)"];
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, @"UIKeyboardInputModeController.m", 105, @"%s", dlerror());
  }

  __break(1u);
}

- (void)didAcceptAddKeyboardInputMode
{
  long long v16 = self->_newModeForUserNotification;
  id v3 = [(UIKeyboardInputModeController *)self enabledInputModeIdentifiers];
  id v4 = [v3 arrayByAddingObject:v16];
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v6 = [v5 preferencesActions];
  [v6 saveInputModes:v4];

  id v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v8 = [v7 preferencesActions];
  id v9 = [v8 valueForPreferenceKey:*MEMORY[0x1E4FAE8C0]];

  if (v9) {
    BOOL v10 = v16 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && ([v9 isEqualToString:v16] & 1) == 0) {
    [(UIKeyboardInputModeController *)self handleLastUsedInputMode:v9 withNewInputMode:v16];
  }
  char v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v12 = [v11 preferencesActions];
  [v12 setLanguageAwareInputModeLastUsed:v16];

  uint64_t v13 = +[UIKeyboardImpl activeInstance];
  [v13 defaultsDidChange];

  newModeForUserNotification = self->_newModeForUserNotification;
  self->_newModeForUserNotification = 0;

  keyboardTagForUserNotification = self->_keyboardTagForUserNotification;
  self->_keyboardTagForUserNotification = 0;

  [(UIKeyboardInputModeController *)self releaseAddKeyboardNotification];
}

- (void)releaseAddKeyboardNotification
{
  userNotification = self->_userNotification;
  if (userNotification)
  {
    CFRelease(userNotification);
    self->_userNotification = 0;
  }
  if (self->_userNotificationRunLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_userNotificationRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D410]);
    CFRelease(self->_userNotificationRunLoopSource);
    self->_userNotificationRunLoopSource = 0;
  }
}

- (void)getHardwareKeyboardLanguage:(id *)a3 countryCode:(id *)a4
{
  id v6 = +[UIKeyboardImpl activeInstance];
  id v7 = [v6 textInputTraits];
  char v8 = [v7 loadKeyboardsForSiriLanguage];

  if (v8) {
    return;
  }
  BKSHIDServicesGetHardwareKeyboardLanguage();
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (![v13 length])
  {
    id v9 = +[UIDevice currentDevice];
    int v10 = [v9 _isHardwareKeyboardAvailable];

    if (v10)
    {
      uint64_t HardwareKeyboardCountry = GSEventGetHardwareKeyboardCountry();
      if (HardwareKeyboardCountry)
      {
        uint64_t v12 = [NSNumber numberWithInt:HardwareKeyboardCountry];
        if (!a3) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
    }
  }
  uint64_t v12 = 0;
  if (a3) {
LABEL_8:
  }
    *a3 = v13;
LABEL_9:
  if (a4) {
    *a4 = v12;
  }
}

- (void)handleSpecificHardwareKeyboard:(id)a3
{
  id v3 = self;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = [(UIKeyboardInputModeController *)self hardwareKeyboardExclusivityIdentifier];

  if (v4) {
    return;
  }
  id v53 = 0;
  id v54 = 0;
  [(UIKeyboardInputModeController *)v3 getHardwareKeyboardLanguage:&v54 countryCode:&v53];
  id v5 = v54;
  id v6 = v53;
  if (![v5 length])
  {
    if (!v6)
    {
      id v7 = 0;
      goto LABEL_30;
    }
    id v7 = v6;
LABEL_7:
    UIKeyboardHasCompletedBuddy();
    if (!v8) {
      goto LABEL_30;
    }
    id v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
    int v10 = [v9 preferencesActions];
    uint64_t v11 = *MEMORY[0x1E4FAE878];
    uint64_t v12 = [v10 valueForPreferenceKey:*MEMORY[0x1E4FAE878]];

    if ([v12 containsObject:v7]) {
      goto LABEL_29;
    }
    if (v12)
    {
      uint64_t v13 = [v12 arrayByAddingObject:v7];

      uint64_t v14 = v13;
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObject:v7];
    }
    uint64_t v15 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    id v47 = (void *)v14;
    [v15 setValue:v14 forPreferenceKey:v11];

    objc_storeStrong((id *)&v3->_keyboardTagForUserNotification, v7);
    long long v16 = [(UIKeyboardInputModeController *)v3 enabledInputModeIdentifiers];
    id v52 = 0;
    long long v17 = [(UIKeyboardInputModeController *)v3 supportedFullModesForHardwareKeyboard:v5 countryCode:v6 activeModes:v16 matchedMode:&v52];
    id v18 = v52;
    if (v18)
    {
      long long v41 = v17;
      uint64_t v45 = v3;
      id v46 = v7;
      id v43 = v6;
      id v44 = v5;
      id v19 = objc_opt_new();
      id v20 = TIInputModeGetNormalizedIdentifier();
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v42 = v16;
      id v21 = v16;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v48 objects:v55 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v49 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            id v27 = TIInputModeGetNormalizedIdentifier();
            int v28 = [v27 isEqualToString:v20];

            if (v28) {
              id v29 = v18;
            }
            else {
              id v29 = v26;
            }
            [v19 addObject:v29];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v48 objects:v55 count:16];
        }
        while (v23);
      }

      uint64_t v30 = +[UIKeyboardPreferencesController sharedPreferencesController];
      uint64_t v31 = [v30 preferencesActions];
      [v31 saveInputModes:v19];

      id v5 = v44;
      id v3 = v45;
      long long v16 = v42;
      id v6 = v43;
      long long v17 = v41;
    }
    else
    {
      if (![v17 count])
      {
LABEL_28:

        uint64_t v12 = v47;
LABEL_29:

        goto LABEL_30;
      }
      id v46 = v7;
      id v19 = [v17 firstObject];
      [(UIKeyboardInputModeController *)v3 showAddKeyboardAlertForInputModeIdentifier:v19];
    }

    id v7 = v46;
    goto LABEL_28;
  }
  id v7 = v5;
  if (v7) {
    goto LABEL_7;
  }
LABEL_30:
  id v32 = +[UIDevice currentDevice];
  char v33 = [v32 _isHardwareKeyboardAvailable];

  if ((v33 & 1) == 0)
  {
    [(UIKeyboardInputModeController *)v3 handleLastUsedInputMode:0 withNewInputMode:0];
    userNotification = v3->_userNotification;
    if (userNotification)
    {
      if (v3->_keyboardTagForUserNotification)
      {
        long long v35 = +[UIKeyboardPreferencesController sharedPreferencesController];
        uint64_t v36 = [v35 preferencesActions];
        uint64_t v37 = *MEMORY[0x1E4FAE878];
        long long v38 = [v36 valueForPreferenceKey:*MEMORY[0x1E4FAE878]];

        if ([v38 containsObject:v3->_keyboardTagForUserNotification])
        {
          long long v39 = (void *)[v38 mutableCopy];
          [v39 removeObject:v3->_keyboardTagForUserNotification];
          long long v40 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
          [v40 setValue:v39 forPreferenceKey:v37];
        }
        userNotification = v3->_userNotification;
      }
      CFUserNotificationCancel(userNotification);
      [(UIKeyboardInputModeController *)v3 releaseAddKeyboardNotification];
    }
  }
}

- (id)supportedFullModesForHardwareKeyboard:(id)a3 countryCode:(id)a4 activeModes:(id)a5 matchedMode:(id *)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v47 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v53 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        id v18 = TIInputModeGetNormalizedIdentifier();
        [v11 addObject:v18];
        if (([v18 isEqualToString:v17] & 1) == 0) {
          [v47 setObject:v17 forKey:v18];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v14);
  }
  long long v39 = v12;

  id v19 = v41;
  long long v40 = v9;
  id v20 = UIKeyboardGetInputModesSupportingHardwareKeyboard();
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v20;
  uint64_t v22 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    char v46 = 0;
    uint64_t v24 = *(void *)v49;
    long long v42 = v11;
    do
    {
      uint64_t v25 = 0;
      uint64_t v43 = v23;
      do
      {
        if (*(void *)v49 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v48 + 1) + 8 * v25);
        id v27 = -[UIKeyboardInputModeController fullInputModeFromIdentifier:hardwareKeyboardLanguage:](self, "fullInputModeFromIdentifier:hardwareKeyboardLanguage:", v26, v19, v39, v40);
        if ([v11 containsObject:v26])
        {
          int v28 = [v47 objectForKey:v26];
          if (v28)
          {
            uint64_t v29 = v24;
            id v30 = v21;
            uint64_t v31 = self;
            id v32 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v28];
            char v33 = UIKeyboardGetHardwareLayoutFromInputMode(v32, v19, &unk_1ED3F4698);

            if (v33)
            {
              uint64_t v34 = TIInputModeGetComponentsFromIdentifier();
              [v27 setObject:v33 forKey:@"hw"];
              long long v35 = [v34 objectForKey:@"sw"];
              [v27 setObject:v35 forKey:@"sw"];

              uint64_t v36 = [v34 objectForKey:@"ml"];
              if (v36) {
                [v27 setObject:v36 forKey:@"ml"];
              }

              id v19 = v41;
            }

            self = v31;
            id v21 = v30;
            uint64_t v24 = v29;
            uint64_t v11 = v42;
            uint64_t v23 = v43;
          }
          uint64_t v37 = UIKeyboardInputModeGetIdentifierFromComponents(v27);
          if (v46)
          {
            [v21 addObject:v37];
          }
          else
          {
            [v21 insertObject:v37 atIndex:0];
            if (a6) {
              *a6 = v37;
            }
          }

          char v46 = 1;
        }
        else
        {
          [v27 setObject:@"Automatic" forKey:@"hw"];
          int v28 = UIKeyboardInputModeGetIdentifierFromComponents(v27);
          [v21 addObject:v28];
        }

        ++v25;
      }
      while (v23 != v25);
      uint64_t v23 = [obj countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v23);
  }

  return v21;
}

- (NSString)textEffectsButtonLanguageCode
{
  if (qword_1EB25A780 != -1) {
    dispatch_once(&qword_1EB25A780, &__block_literal_global_751_0);
  }
  id v2 = UIKeyboardGetCurrentInputMode();
  id v3 = TIInputModeGetLanguageWithRegion();

  id v4 = [MEMORY[0x1E4F1CA20] scriptCodeFromLanguage:v3];
  id v5 = [(id)qword_1EB25A778 objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5) {
    id v5 = @"en";
  }
  id v7 = v5;

  return v7;
}

void __62__UIKeyboardInputModeController_textEffectsButtonLanguageCode__block_invoke()
{
  uint64_t v0 = (void *)qword_1EB25A778;
  qword_1EB25A778 = (uint64_t)&unk_1ED3F78C0;
}

- (UITextInputMode)documentInputMode
{
  return self->_documentInputMode;
}

- (NSArray)allowedExtensions
{
  return self->_allowedExtensions;
}

- (NSArray)suggestedInputModesForSiriLanguage
{
  return (NSArray *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSuggestedInputModesForSiriLanguage:(id)a3
{
}

- (BOOL)disableFloatingKeyboardFilter
{
  return self->disableFloatingKeyboardFilter;
}

- (void)setDisableFloatingKeyboardFilter:(BOOL)a3
{
  self->disableFloatingKeyboardFilter = a3;
}

- (UIKeyboardInputMode)inputModeThatInvokeEmoji
{
  return self->_inputModeThatInvokeEmoji;
}

- (void)setInputModeThatInvokeEmoji:(id)a3
{
}

- (UIKeyboardInputMode)lastUsedInputMode
{
  return self->_lastUsedInputMode;
}

- (void)setLastUsedInputMode:(id)a3
{
}

- (NSString)inputModeContextIdentifier
{
  return self->_inputModeContextIdentifier;
}

- (void)setInputModeContextIdentifier:(id)a3
{
}

- (void)setAdditionalTextInputLocales:(id)a3
{
}

- (UIKeyboardInputModeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardInputModeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)delegateImplementsDictationHandlingMethods
{
  return self->_delegateImplementsDictationHandlingMethods;
}

- (void)setDelegateImplementsDictationHandlingMethods:(BOOL)a3
{
  self->_delegateImplementsDictationHandlingMethods = a3;
}

- (BOOL)delegateImplementsLegacyDictationHandlingMethods
{
  return self->_delegateImplementsLegacyDictationHandlingMethods;
}

- (void)setDelegateImplementsLegacyDictationHandlingMethods:(BOOL)a3
{
  self->_delegateImplementsLegacyDictationHandlingMethods = a3;
}

- (BOOL)disablesUpdateLastUsedInputModeTimer
{
  return self->_disablesUpdateLastUsedInputModeTimer;
}

- (void)setDisablesUpdateLastUsedInputModeTimer:(BOOL)a3
{
  self->_disablesUpdateLastUsedInputModeTimer = a3;
}

- (BOOL)lastInputModeSwitchTriggeredByASCIIToggle
{
  return self->_lastInputModeSwitchTriggeredByASCIIToggle;
}

- (void)setLastInputModeSwitchTriggeredByASCIIToggle:(BOOL)a3
{
  self->_lastInputModeSwitchTriggeredByASCIIToggle = a3;
}

- (NSArray)userSelectableKeyboardInputModes
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSArray)userSelectableKeyboardInputModeIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (UIKeyboardInputMode)nextInputModeToUse
{
  return self->_nextInputModeToUse;
}

- (void)setNextInputModeToUse:(id)a3
{
}

- (UIKeyboardInputMode)currentUsedInputMode
{
  return self->_currentUsedInputMode;
}

- (void)setCurrentUsedInputMode:(id)a3
{
}

- (id)extensionMatchingContext
{
  return self->_extensionMatchingContext;
}

- (void)setExtensionMatchingContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_storeStrong((id *)&self->_currentUsedInputMode, 0);
  objc_storeStrong((id *)&self->_nextInputModeToUse, 0);
  objc_storeStrong((id *)&self->_userSelectableKeyboardInputModeIdentifiers, 0);
  objc_storeStrong((id *)&self->_userSelectableKeyboardInputModes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_additionalTextInputLocales, 0);
  objc_storeStrong((id *)&self->_inputModeContextIdentifier, 0);
  objc_storeStrong((id *)&self->_lastUsedInputMode, 0);
  objc_storeStrong((id *)&self->_inputModeThatInvokeEmoji, 0);
  objc_storeStrong((id *)&self->suggestedInputModesForSiriLanguage, 0);
  objc_storeStrong((id *)&self->defaultNormalizedInputModes, 0);
  objc_storeStrong((id *)&self->defaultInputModes, 0);
  objc_storeStrong((id *)&self->defaultRawInputModes, 0);
  objc_storeStrong((id *)&self->defaultKeyboardInputModes, 0);
  objc_storeStrong((id *)&self->normalizedInputModes, 0);
  objc_storeStrong((id *)&self->enabledInputModes, 0);
  objc_storeStrong((id *)&self->keyboardInputModeIdentifiers, 0);
  objc_storeStrong((id *)&self->keyboardInputModes, 0);
  objc_storeStrong((id *)&self->_documentInputMode, 0);
  objc_storeStrong((id *)&self->_keyboardTagForUserNotification, 0);
  objc_storeStrong((id *)&self->_newModeForUserNotification, 0);
  objc_storeStrong((id *)&self->_allowedExtensions, 0);
  objc_storeStrong((id *)&self->_allExtensions, 0);
  objc_storeStrong((id *)&self->_inputModesWithoutHardwareSupport, 0);
  objc_storeStrong((id *)&self->_currentInputMode, 0);
}

- (NSArray)supportedInputModeIdentifiers
{
  id v3 = [MEMORY[0x1E4FAE2D8] sharedInputModeController];
  id v4 = [v3 supportedInputModeIdentifiers];

  id v5 = +[UIKeyboardInputModeController sharedInputModeController];
  id v6 = [v5 extensionInputModes];

  id v7 = [(UIKeyboardInputModeController *)self identifiersFromInputModes:v6];
  int v8 = [v7 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v8;
}

- (void)saveDeviceUnlockPasscodeInputModes
{
  id v4 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v3 = [(UIKeyboardInputModeController *)self enabledInputModeIdentifiers:0];
  [v4 setValue:v3 forPreferenceKey:*MEMORY[0x1E4FAE530]];
}

uint64_t __102__UIKeyboardInputModeController_Compatibility__inputModesByAppendingApplicationLanguagesToInputModes___block_invoke()
{
  return TIGetDefaultInputModesForLanguage();
}

uint64_t __76__UIKeyboardInputModeController_Compatibility__enabledInputModeIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = TIInputModeGetNormalizedIdentifier();
    uint64_t v4 = [v5 isEqualToString:v6];
  }
  return v4;
}

- (id)userSelectableInputModeIdentifiersFromInputModeIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  id v12 = [(UIKeyboardInputModeController *)self userSelectableInputModesFromInputModes:v5];
  uint64_t v13 = [(UIKeyboardInputModeController *)self identifiersFromInputModes:v12];

  return v13;
}

- (NSArray)enabledInputModeLanguages
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(UIKeyboardInputModeController *)self activeInputModes];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) primaryLanguage];
        if (([v3 containsObject:v9] & 1) == 0
          && ([v9 isEqualToString:@"emoji"] & 1) == 0)
        {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)identifiersFromInputModes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "identifier", (void)v12);
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)inputModesFromIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      long long v11 = v8;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v8 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:](UIKeyboardInputMode, "keyboardInputModeWithIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);

        if (v8) {
          [v4 addObject:v8];
        }
        ++v10;
        long long v11 = v8;
      }
      while (v7 != v10);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  return v4;
}

@end