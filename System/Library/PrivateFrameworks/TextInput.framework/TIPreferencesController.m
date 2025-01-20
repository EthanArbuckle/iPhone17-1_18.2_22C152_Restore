@interface TIPreferencesController
+ (id)sharedPreferencesController;
+ (void)registerPreferredLanguagesForInputModes:(id)a3 replacingInputModes:(id)a4;
- (BOOL)BOOLForKey:(int)a3;
- (BOOL)BOOLForPreferenceKey:(id)a3;
- (BOOL)_isOneTimeAction:(id)a3;
- (BOOL)allEnabledInputModesAreValid;
- (BOOL)autocorrectionEnabled;
- (BOOL)automaticMinimizationEnabled;
- (BOOL)ignoreNextSyncNotification;
- (BOOL)inhibitGlobalNotification;
- (BOOL)isInternalInstall;
- (BOOL)isKeyLockedDown:(int)a3;
- (BOOL)isPreferenceKeyLockedDown:(id)a3;
- (BOOL)keyboardShownByTouch;
- (BOOL)oneTimeActionCompleted:(id)a3;
- (BOOL)predictionEnabled;
- (CGPoint)floatingKeyboardPosition;
- (CGPoint)keyboardPosition;
- (NSArray)inputModeSelectionSequence;
- (TIActionWhenIdle)actionWhenIdle;
- (TIPreferencesController)init;
- (id)_configuredPreferencesForDomain:(id)a3;
- (id)valueForKey:(int)a3;
- (id)valueForPreferenceKey:(id)a3;
- (int)MCValueForManagedPreferenceKey:(id)a3;
- (unint64_t)floatingKeyboardDockedEdge;
- (void)_configureDomain:(id)a3 notification:(id)a4;
- (void)_configureDomains;
- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5;
- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6;
- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7;
- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7 isCloudSetting:(BOOL)a8;
- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7 isCloudSetting:(BOOL)a8 isWatchSync:(BOOL)a9;
- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 isCloudSetting:(BOOL)a6;
- (void)_configureKey:(id)a3 domain:(id)a4 fallbackKey:(id)a5;
- (void)_configureKey:(id)a3 domain:(id)a4 fallbackKey:(id)a5 isCloudSetting:(BOOL)a6;
- (void)_configureKeyForAnalytics:(id)a3 domain:(id)a4 defaultValue:(id)a5;
- (void)_configurePreferences;
- (void)_pushValue:(id)a3 toPreference:(id)a4 domain:(id)a5;
- (void)clearSynchronizePreferencesTimer;
- (void)dealloc;
- (void)didSeeHardwareKeyboard:(id)a3;
- (void)didTriggerOneTimeAction:(id)a3;
- (void)didUnseeHardwareKeyboard:(id)a3;
- (void)idleInit;
- (void)managedKeyboardSettingDidChange:(id)a3;
- (void)performWithWriteability:(BOOL)a3 operations:(id)a4;
- (void)preferencesChangedCallback:(id)a3;
- (void)profileSettingDidChange:(id)a3;
- (void)resetDictationTipsToDefaultSettings;
- (void)setActionWhenIdle:(id)a3;
- (void)setAutomaticMinimizationEnabled:(BOOL)a3;
- (void)setFloatingKeyboardDockedEdge:(unint64_t)a3;
- (void)setFloatingKeyboardPosition:(CGPoint)a3;
- (void)setIgnoreNextSyncNotification:(BOOL)a3;
- (void)setInhibitGlobalNotification:(BOOL)a3;
- (void)setInputModeSelectionSequence:(id)a3;
- (void)setInputModes:(id)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setKeyboardPosition:(CGPoint)a3;
- (void)setKeyboardShownByTouch:(BOOL)a3;
- (void)setPredictionEnabled:(BOOL)a3;
- (void)setValue:(id)a3 forKey:(int)a4;
- (void)setValue:(id)a3 forManagedPreferenceKey:(id)a4;
- (void)setValue:(id)a3 forPreferenceKey:(id)a4;
- (void)setautocorrectionEnabled:(BOOL)a3;
- (void)synchronizeDomainIfNeedsGet:(id)a3;
- (void)synchronizePreferences;
- (void)touchSynchronizePreferencesTimer;
- (void)updateCompactAssistantBarPersistentLocation:(unint64_t)a3;
- (void)updateDictationAsPrimaryInputMode:(id)a3;
- (void)updateDictationAutoPunctuation:(id)a3;
- (void)updateDictationTipDisplayCount:(id)a3 dictationTipKey:(id)a4;
- (void)updateDictationTipLastShownDate:(id)a3;
- (void)updateDidPerformFirstReachableKeyboardInteraction;
- (void)updateEnableProKeyboard:(BOOL)a3;
- (void)updateEnabledDictationLanguages:(id)a3;
- (void)updateInputModes:(id)a3;
- (void)updateKeyboardHandBias:(id)a3;
- (void)updateKeyboardIsFloating:(BOOL)a3;
- (void)updateKeyboardIsSplit:(BOOL)a3 locked:(BOOL)a4;
- (void)updateLastUsedDictationLanguages:(id)a3;
- (void)updateLastUsedInputMode:(id)a3;
- (void)updateLastUsedKeyboards:(id)a3;
- (void)updateLastUsedLayout:(id)a3;
- (void)updateVisceral:(id)a3;
@end

@implementation TIPreferencesController

uint64_t __54__TIPreferencesController_sharedPreferencesController__block_invoke()
{
  sharedPreferencesController_sharedController = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (TIPreferencesController)init
{
  v7.receiver = self;
  v7.super_class = (Class)TIPreferencesController;
  v2 = [(TIPreferencesController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(TIPreferencesController *)v2 _configureDomains];
    [(TIPreferencesController *)v3 _configurePreferences];
    [(TIPreferencesController *)v3 setIsInternalInstall:MGGetBoolAnswer()];
    if (_tiShouldSkipMCObservation_onceToken != -1) {
      dispatch_once(&_tiShouldSkipMCObservation_onceToken, &__block_literal_global_801);
    }
    if (!_tiShouldSkipMCObservation__result)
    {
      v4 = +[TIActionWhenIdle actionWhenIdleWithTarget:v3 selector:sel_idleInit object:0];
      [(TIPreferencesController *)v3 setActionWhenIdle:v4];
    }
    v5 = v3;
  }

  return v3;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->isInternalInstall = a3;
}

- (void)setActionWhenIdle:(id)a3
{
}

- (void)_configureDomains
{
  [(TIPreferencesController *)self _configureDomain:@".GlobalPreferences" notification:@"AppleKeyboardsPreferencesChangedNotification"];
  [(TIPreferencesController *)self _configureDomain:@"com.apple.keyboard.preferences" notification:@"AppleKeyboardsSettingsChangedNotification"];
  [(TIPreferencesController *)self _configureDomain:@"com.apple.keyboard" notification:@"AppleKeyboardsInternalSettingsChangedNotification"];
  [(TIPreferencesController *)self _configureDomain:@"com.apple.InputModePreferences" notification:@"AppleKeyboardsInputModeChangedNotification"];
  [(TIPreferencesController *)self _configureDomain:@"com.apple.keyboard.ContinuousPath" notification:@"AppleKeyboardsContinuousPathSettingsChangedNotification"];
  [(TIPreferencesController *)self _configureDomain:@"com.apple.preferences.sounds" notification:@"com.apple.preferences.sounds.keyboard-audio.changed"];

  [(TIPreferencesController *)self _configureDomain:@"com.apple.assistant.support" notification:@"kAFPreferencesDidChangeDarwinNotification"];
}

- (void)_configurePreferences
{
  [(TIPreferencesController *)self _configureKey:@"AppleKeyboards" domain:@".GlobalPreferences" defaultValue:0];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  [(TIPreferencesController *)self _configureKey:@"AppleKeyboardsExpanded" domain:@".GlobalPreferences" defaultValue:MEMORY[0x1E4F1CC28]];
  [(TIPreferencesController *)self _configureKey:@"AppleKeyboardsIncludeIntl" domain:@".GlobalPreferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"ApplePasscodeKeyboards" domain:@".GlobalPreferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"AppleLocale" domain:@".GlobalPreferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"AppleLanguages" domain:@".GlobalPreferences" defaultValue:0];
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAssistant" domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC38]];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAutocorrection" domain:@"com.apple.keyboard.preferences" defaultValue:v4 fallbackKey:0 isAnalyzed:1 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAutocapitalization" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCheckSpelling" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardInlineCompletion" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardMathExpressionCompletion" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"SmartQuotesEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"SmartDashesEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardPeriodShortcut" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCapsLock" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"SmartInsertDeleteEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v4];
  [(TIPreferencesController *)self _configureKey:@"HWKeyboardAutocorrection" domain:@"com.apple.keyboard.preferences" fallbackKey:@"KeyboardAutocorrection" isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"HWKeyboardAutocapitalization" domain:@"com.apple.keyboard.preferences" fallbackKey:@"KeyboardAutocapitalization" isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"HWKeyboardPeriodShortcut" domain:@"com.apple.keyboard.preferences" fallbackKey:@"KeyboardPeriodShortcut" isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"HWKeyboardGlobeAsEmojiKey" domain:@"com.apple.keyboard.preferences" defaultValue:0 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"HWKeyboardCapsLockRomanSwitch" domain:@"com.apple.keyboard.preferences" defaultValue:0 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"HWKeyboardDictationShortcut" domain:@"com.apple.keyboard.preferences" defaultValue:0 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardLastUsed" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardsCurrentAndNext" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardLastUsedForLanguage" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardLayoutLastUsedForKeyboard" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardLastChosen" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardInputModeUpdateDate" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardSecondLanguage" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAdditionalLanguages" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  v5 = [NSNumber numberWithBool:MGGetSInt32Answer() == 3];
  [(TIPreferencesController *)self _configureKey:@"KeyboardLanguageIndicatorEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v5];

  [(TIPreferencesController *)self _configureKey:@"UIKeyboardDidShowInternationalInfoIntroduction" domain:@"com.apple.keyboard.preferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"KeyboardDidShowProductivityTutorial" domain:@"com.apple.keyboard.preferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"DictationLanguagesLastUsed" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"DictationLanguagesEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"DictationAsPrimaryInputMode" domain:@"com.apple.keyboard.preferences" defaultValue:v4];
  [(TIPreferencesController *)self _configureKey:@"DictationAsPrimaryInputModeResetAtNewSession" domain:@"com.apple.keyboard.preferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"KeyboardHardwareKeyboardsSeen" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"HardwareKeyboardLastSeen" domain:@"com.apple.keyboard.preferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"SoftwareKeyboardShownByTouch" domain:@"com.apple.keyboard.preferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"AutomaticMinimizationEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v4];
  [(TIPreferencesController *)self _configureKey:@"SuppressAutomaticMinimization" domain:@"com.apple.keyboard.preferences" defaultValue:v3];
  [(TIPreferencesController *)self _configureKey:@"KeyboardPredictionHelpMessageCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardShowPredictionBar" domain:@"com.apple.keyboard.preferences" defaultValue:v4];
  [(TIPreferencesController *)self _configureKey:@"KeyboardPrediction" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardBias" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAllowPaddle" domain:@"com.apple.keyboard.preferences" defaultValue:v4 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardReachableFirstInteraction" domain:@"com.apple.keyboard.preferences" defaultValue:v4];
  v6 = NSNumber;
  if (IsLargeIPad_onceToken != -1) {
    dispatch_once(&IsLargeIPad_onceToken, &__block_literal_global_817);
  }
  objc_super v7 = [v6 numberWithBool:IsLargeIPad_isLarge];
  [(TIPreferencesController *)self _configureKey:@"KeyboardUseProLayout" domain:@"com.apple.keyboard.preferences" defaultValue:v7];

  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [(TIPreferencesController *)self _configureKey:@"ShowMemoji" domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC38]];
  [(TIPreferencesController *)self _configureKey:@"ShowStickers" domain:@"com.apple.keyboard.preferences" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardFloatingPersistentVerticalOffset" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardFloatingPersistentHorizontalOffset" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardFloatingDockedEdge" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardVisceral" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardFeedbackIdleTimeout" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC38F78];
  [(TIPreferencesController *)self _configureKey:@"CompactAssistantBarPersistentLocation" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"RivenKeyboard" domain:@"com.apple.keyboard.preferences" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"UIKeyboardPersistentVerticalOffset" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"UIKeyboardPersistentHorizontalOffset" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"UIKeyboardPersistentSplitProgress" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  uint64_t v9 = MEMORY[0x1E4F1CC28];
  [(TIPreferencesController *)self _configureKey:@"UIKeyboardPersistentSplitLock" domain:@"com.apple.keyboard.preferences" defaultValue:MEMORY[0x1E4F1CC28]];
  [(TIPreferencesController *)self _configureKey:@"KeyboardIsFloating" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"RivenLayoutSize" domain:@"com.apple.keyboard" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardFloatingEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"DidShowGestureKeyboardIntroduction" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DidShowContinuousPathIntroduction" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:*MEMORY[0x1E4F4F210] domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardPerformanceLogging" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"TypologyEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"CustomerTypologyEnabledByDiagnosticExtension" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAssetDownloadInFive" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardGlobeKeyExperiments" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardMultilingualEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathEnabled" domain:@"com.apple.keyboard.ContinuousPath" defaultValue:v8 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathProgressiveCandidatesEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathCompletesWords" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathDeleteWholeWord" domain:@"com.apple.keyboard.ContinuousPath" defaultValue:v8 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathDetectPause" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardInsertsSpaceAfterPredictiveInput" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathLanguageWeight" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC38F88];
  v10 = [NSNumber numberWithUnsignedInt:19];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathEnabledAlgorithmTypes" domain:@"com.apple.keyboard" defaultValue:v10];

  [(TIPreferencesController *)self _configureKey:@"KeyboardCPCandidateCount" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC385B8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardContinuousPathRetrocorrection" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardIgnoreCPConfigRequirements" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardDODMLLoggingEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardSensorKitEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardSensorKitAggregatedWordsThreshold" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC385D0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardUserModelLoggingEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardSimulateAutofillCandidates" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardAllowRelaxedOVSPolicy" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardSkipCandidateQualityFilter" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCJContinuousPathEnabled" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCPUIColorfulEffect" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCPUISpotlightEffect" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCPUIModalPunctuationPlane" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCPConfidenceModel" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"FuzzyPinyin" domain:@"com.apple.InputModePreferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"SuchengCangjie" domain:@"com.apple.InputModePreferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"FuzzyPinyinPairs" domain:@"com.apple.InputModePreferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"SpaceConfirmation" domain:@"com.apple.InputModePreferences" defaultValue:v8 isCloudSetting:1];
  [(TIPreferencesController *)self _configureKey:@"ShuangpinType" domain:@"com.apple.InputModePreferences" defaultValue:&unk_1EDC385E8];
  [(TIPreferencesController *)self _configureKey:@"PinyinDialect" domain:@"com.apple.InputModePreferences" defaultValue:&unk_1EDC38600];
  [(TIPreferencesController *)self _configureKey:@"WubiStandard" domain:@"com.apple.InputModePreferences" defaultValue:&unk_1EDC385A0];
  LOBYTE(v12) = 1;
  [(TIPreferencesController *)self _configureKey:@"SmartFullwidthSpace" domain:@"com.apple.InputModePreferences" defaultValue:v8 fallbackKey:0 isAnalyzed:0 isCloudSetting:0 isWatchSync:v12];
  v11 = [NSNumber numberWithBool:MGGetSInt32Answer() == 3];
  [(TIPreferencesController *)self _configureKey:@"LiveConversion" domain:@"com.apple.InputModePreferences" defaultValue:v11];

  [(TIPreferencesController *)self _configureKey:@"SoftwareLiveConversion" domain:@"com.apple.InputModePreferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"PredictionTime" domain:@"com.apple.InputModePreferences" defaultValue:&unk_1EDC38F98];
  [(TIPreferencesController *)self _configureKey:@"ConversionOnSearchField" domain:@"com.apple.InputModePreferences" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"EmojiDefaultsKey" domain:@"com.apple.EmojiPreferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"DictationKeyAlwaysEnabled" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationLogging" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"TypoTrackerButton" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"HandwritingCaptureEnabled" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardCachingDisabled" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"KeyboardSwipeToTab" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"ShowExtraLayouts" domain:@"com.apple.keyboard" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationLanguagesLastUsed" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"DictationLanguagesEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"Dictation Enabled" domain:@"com.apple.assistant.support" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"Dictation Auto Punctuation Enabled" domain:@"com.apple.assistant.support" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"DictationReplacementCommandTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationDeletionCommandTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationInsertionCommandTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationEmojiCommandTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationSelectionCommandTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationStopCommandTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationTipLastShownDate" domain:@"com.apple.keyboard.preferences" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"DictationTipContextual" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationCommandTipsEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"DictationOneTipPerDayEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"DictationTipsDisplayCountLimit" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC38618];
  [(TIPreferencesController *)self _configureKey:@"DictationReplacementCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationDeletionCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationInsertionCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationEmojiCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationSelectionCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationStopCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationModelessInputTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationSendMessageCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationClearAllCommandTipShownCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"DictationWordwiseBackspaceEnabled" domain:@"com.apple.keyboard.preferences" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"ModelessInputTipShown" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationDisableInlinePopoverUI" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"DictationDisableTapAnywhereToDisable" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"keyboard-audio" domain:@"com.apple.preferences.sounds" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardTransformerLMForAutocorrection" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC38630];
  [(TIPreferencesController *)self _configureKey:@"KeyboardInlineCompletionsOpenEnded" domain:@"com.apple.keyboard" defaultValue:v8];
  [(TIPreferencesController *)self _configureKey:@"KeyboardInlineCompletionsPrefixLength" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC38630];
  [(TIPreferencesController *)self _configureKey:@"KeyboardInlineCompletionsProbThreshold" domain:@"com.apple.keyboard" defaultValue:&unk_1EDC38648];
  [(TIPreferencesController *)self _configureKey:@"DidShowInlineCompletionEducationTip" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
  [(TIPreferencesController *)self _configureKey:@"InlineCompletionAcceptedBySpaceEventCount" domain:@"com.apple.keyboard.preferences" defaultValue:&unk_1EDC385A0];
  [(TIPreferencesController *)self _configureKey:@"KeyboardFlushDynamicCachePeriod" domain:@"com.apple.keyboard" defaultValue:0];
  [(TIPreferencesController *)self _configureKey:@"MultilingualKeyboardTip" domain:@"com.apple.keyboard.preferences" defaultValue:v9];

  [(TIPreferencesController *)self _configureKey:@"MultilingualSettingTip" domain:@"com.apple.keyboard.preferences" defaultValue:v9];
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7 isCloudSetting:(BOOL)a8
{
  LOBYTE(v8) = 0;
  [(TIPreferencesController *)self _configureKey:a3 domain:a4 defaultValue:a5 fallbackKey:a6 isAnalyzed:a7 isCloudSetting:a8 isWatchSync:v8];
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7 isCloudSetting:(BOOL)a8 isWatchSync:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v30 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = [(NSMutableDictionary *)self->_configuredPreferences objectForKey:v30];
  if (v18)
  {
    v19 = v18;
    v20 = [v18 defaultValue];
    if (v20)
    {
      v21 = [v19 defaultValue];
      [v21 isEqual:v16];
    }
  }
  else
  {
    if (!self->_configuredPreferences)
    {
      v22 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1000];
      configuredPreferences = self->_configuredPreferences;
      self->_configuredPreferences = v22;
    }
    v19 = +[_TIPreference preferenceWithKey:v30 domain:v15 defaultValue:v16 fallbackKey:v17 isAnalyzed:v10];
    [v19 setIsCloudSetting:v9];
    [v19 setIsWatchSync:a9];
    [(NSMutableDictionary *)self->_configuredPreferences setObject:v19 forKey:v30];
    if (v10)
    {
      v24 = [v19 changedAtKey];
      [(TIPreferencesController *)self _configureKey:v24 domain:v15 defaultValue:0 fallbackKey:0 isAnalyzed:0];

      v25 = [v19 analyzedAtKey];
      [(TIPreferencesController *)self _configureKey:v25 domain:v15 defaultValue:0 fallbackKey:0 isAnalyzed:0];

      v26 = [v19 previousValueKey];
      [(TIPreferencesController *)self _configureKey:v26 domain:v15 defaultValue:0 fallbackKey:0 isAnalyzed:0];

      v27 = [v19 buildAtChangeKey];
      [(TIPreferencesController *)self _configureKey:v27 domain:v15 defaultValue:0 fallbackKey:0 isAnalyzed:0];

      v28 = [v19 approxDateOfBuildInstall];
      [(TIPreferencesController *)self _configureKey:v28 domain:v15 defaultValue:0 fallbackKey:0 isAnalyzed:0];

      v29 = [v19 buildAtLastAnalysis];
      [(TIPreferencesController *)self _configureKey:v29 domain:v15 defaultValue:0 fallbackKey:0 isAnalyzed:0];
    }
    [(TIPreferencesController *)self _configureDomain:v15 notification:0];
  }
}

- (void)_configureDomain:(id)a3 notification:(id)a4
{
  id v13 = a3;
  v6 = (__CFString *)a4;
  objc_super v7 = [(NSMutableDictionary *)self->_configuredDomains objectForKey:v13];
  if (v7)
  {
    uint64_t v8 = v7;
    BOOL v9 = [v7 notification];

    if (v6 && !v9)
    {
      [v8 setNotification:v6];
LABEL_8:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback, v6, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
  else
  {
    if (!self->_configuredDomains)
    {
      BOOL v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
      configuredDomains = self->_configuredDomains;
      self->_configuredDomains = v10;
    }
    uint64_t v8 = +[_TIPreferenceDomain domainWithName:v13 notification:v6];
    [(NSMutableDictionary *)self->_configuredDomains setObject:v8 forKey:v13];
    if (v6) {
      goto LABEL_8;
    }
  }
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6 isAnalyzed:(BOOL)a7
{
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 fallbackKey:(id)a6
{
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5
{
}

- (void)_configureKey:(id)a3 domain:(id)a4 defaultValue:(id)a5 isCloudSetting:(BOOL)a6
{
}

- (void)_configureKey:(id)a3 domain:(id)a4 fallbackKey:(id)a5 isCloudSetting:(BOOL)a6
{
}

- (BOOL)automaticMinimizationEnabled
{
  if ([(TIPreferencesController *)self BOOLForPreferenceKey:@"SuppressAutomaticMinimization"])
  {
    return 0;
  }

  return [(TIPreferencesController *)self BOOLForPreferenceKey:@"AutomaticMinimizationEnabled"];
}

+ (id)sharedPreferencesController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__TIPreferencesController_sharedPreferencesController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferencesController_once != -1) {
    dispatch_once(&sharedPreferencesController_once, block);
  }
  v2 = (void *)sharedPreferencesController_sharedController;

  return v2;
}

- (BOOL)BOOLForKey:(int)a3
{
  uint64_t v3 = [(TIPreferencesController *)self valueForKey:*(void *)&a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)valueForKey:(int)a3
{
  char v4 = preferenceKeyForEnumKey(a3);
  v5 = [(TIPreferencesController *)self valueForPreferenceKey:v4];

  return v5;
}

- (id)valueForPreferenceKey:(id)a3
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (isManagedPreferenceKey(v4)
    && [(TIPreferencesController *)self MCValueForManagedPreferenceKey:v4] == 2)
  {
    v5 = (void *)MEMORY[0x1E4F1CC28];
    goto LABEL_19;
  }
  v6 = self;
  objc_sync_enter(v6);
  objc_super v7 = [(NSMutableDictionary *)v6->_configuredPreferences objectForKey:v4];
  uint64_t v8 = v7;
  if (!v7)
  {
    v5 = 0;
    goto LABEL_18;
  }
  configuredDomains = v6->_configuredDomains;
  BOOL v10 = [v7 domain];
  v11 = [(NSMutableDictionary *)configuredDomains objectForKey:v10];

  [(TIPreferencesController *)v6 synchronizeDomainIfNeedsGet:v11];
  v30[0] = @"TypologyEnabledByProfile";
  v30[1] = @"CustomerTypologyEnabledByDiagnosticExtension";
  v30[2] = @"KeyboardTransformerLMForAutocorrection";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  id v13 = [v8 domain];
  if ([v13 isEqualToString:@"com.apple.keyboard"]
    && ![(TIPreferencesController *)v6 isInternalInstall])
  {
    v28 = [v8 key];
    char v29 = [v12 containsObject:v28];

    if ((v29 & 1) == 0)
    {
      uint64_t v21 = [v8 defaultValue];
      goto LABEL_15;
    }
  }
  else
  {
  }
  v14 = [v8 currentValue];

  if (!v14)
  {
    id v15 = [v8 key];
    id v16 = [v11 domain];
    id v17 = (void *)CFPreferencesCopyAppValue(v15, v16);

    [v8 setCurrentValue:v17];
  }
  v18 = [v8 currentValue];
  if (v18)
  {
  }
  else
  {
    v23 = [v8 fallbackKey];

    if (v23)
    {
      configuredPreferences = v6->_configuredPreferences;
      v25 = [v8 fallbackKey];
      v26 = [(NSMutableDictionary *)configuredPreferences objectForKey:v25];

      if (v26)
      {
        v27 = [v26 key];
        v5 = [(TIPreferencesController *)v6 valueForPreferenceKey:v27];

        goto LABEL_16;
      }
    }
  }
  v19 = [v8 currentValue];

  if (!v19)
  {
    v20 = [v8 defaultValue];
    [v8 setCurrentValue:v20];
  }
  uint64_t v21 = [v8 currentValue];
LABEL_15:
  v5 = (void *)v21;
LABEL_16:

LABEL_18:
  objc_sync_exit(v6);

LABEL_19:

  return v5;
}

- (void)synchronizeDomainIfNeedsGet:(id)a3
{
  id v4 = a3;
  if ([v4 needsGetSync])
  {
    v5 = self;
    objc_sync_enter(v5);
    [v4 setNeedsGetSync:0];
    v6 = [v4 domain];
    CFPreferencesSynchronize(v6, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

    configuredPreferences = v5->_configuredPreferences;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __55__TIPreferencesController_synchronizeDomainIfNeedsGet___block_invoke;
    v8[3] = &unk_1E5559FD8;
    id v9 = v4;
    BOOL v10 = v5;
    [(NSMutableDictionary *)configuredPreferences enumerateKeysAndObjectsUsingBlock:v8];

    objc_sync_exit(v5);
  }
}

- (BOOL)BOOLForPreferenceKey:(id)a3
{
  uint64_t v3 = [(TIPreferencesController *)self valueForPreferenceKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isInternalInstall
{
  return self->isInternalInstall;
}

- (int)MCValueForManagedPreferenceKey:(id)a3
{
  id v4 = a3;
  v5 = managedConfigurationFeatureForPreferenceKey(v4);
  if (v5)
  {
    cachedMCRestrictedValue = self->_cachedMCRestrictedValue;
    if (!cachedMCRestrictedValue)
    {
      objc_super v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
      uint64_t v8 = self->_cachedMCRestrictedValue;
      self->_cachedMCRestrictedValue = v7;

      cachedMCRestrictedValue = self->_cachedMCRestrictedValue;
    }
    id v9 = [(NSCache *)cachedMCRestrictedValue objectForKey:v4];
    BOOL v10 = v9;
    if (v9)
    {
      LODWORD(v11) = [v9 intValue];
    }
    else
    {
      uint64_t v12 = [getMCProfileConnectionClass() sharedConnection];
      uint64_t v11 = [v12 effectiveBoolValueForSetting:v5];

      id v13 = self->_cachedMCRestrictedValue;
      v14 = [NSNumber numberWithInt:v11];
      id v15 = (void *)[v4 copy];
      [(NSCache *)v13 setObject:v14 forKey:v15];
    }
  }
  else
  {
    LODWORD(v11) = 0;
  }

  return v11;
}

- (void)idleInit
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v4 = (void *)getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  uint64_t v12 = getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr;
  if (!getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr)
  {
    v5 = (void *)ManagedConfigurationLibrary();
    v10[3] = (uint64_t)dlsym(v5, "MCKeyboardSettingsChangedNotification");
    getMCKeyboardSettingsChangedNotificationSymbolLoc_ptr = v10[3];
    id v4 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v4) {
    goto LABEL_8;
  }
  [v3 addObserver:self selector:sel_managedKeyboardSettingDidChange_ name:*v4 object:0];

  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = 0;
  BOOL v10 = &v9;
  uint64_t v11 = 0x2020000000;
  objc_super v7 = (void *)getMCProfileListChangedNotificationSymbolLoc_ptr;
  uint64_t v12 = getMCProfileListChangedNotificationSymbolLoc_ptr;
  if (!getMCProfileListChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v8 = (void *)ManagedConfigurationLibrary();
    v10[3] = (uint64_t)dlsym(v8, "MCProfileListChangedNotification");
    getMCProfileListChangedNotificationSymbolLoc_ptr = v10[3];
    objc_super v7 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (v7)
  {
    [v6 addObserver:self selector:sel_profileSettingDidChange_ name:*v7 object:0];
  }
  else
  {
LABEL_8:
    dlerror();
    abort_report_np();
    ManagedConfigurationLibrary();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionWhenIdle, 0);
  objc_storeStrong((id *)&self->_synchronizePreferencesTimer, 0);
  objc_storeStrong((id *)&self->_cachedMCRestrictedValue, 0);
  objc_storeStrong((id *)&self->_configuredPreferences, 0);

  objc_storeStrong((id *)&self->_configuredDomains, 0);
}

- (void)setIgnoreNextSyncNotification:(BOOL)a3
{
  self->_ignoreNextSyncNotification = a3;
}

- (BOOL)ignoreNextSyncNotification
{
  return self->_ignoreNextSyncNotification;
}

- (TIActionWhenIdle)actionWhenIdle
{
  return self->_actionWhenIdle;
}

- (void)setInhibitGlobalNotification:(BOOL)a3
{
  self->_inhibitGlobalNotification = a3;
}

- (BOOL)inhibitGlobalNotification
{
  return self->_inhibitGlobalNotification;
}

- (void)resetDictationTipsToDefaultSettings
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] distantPast];
  [(TIPreferencesController *)self setValue:v3 forPreferenceKey:@"DictationTipLastShownDate"];

  [(TIPreferencesController *)self setValue:&unk_1EDC38618 forPreferenceKey:@"DictationTipsDisplayCountLimit"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationReplacementCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationReplacementCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationInsertionCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationEmojiCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationSelectionCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationStopCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationModelessInputTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationDeletionCommandTipShownCount"];
  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationSendMessageCommandTipShownCount"];

  [(TIPreferencesController *)self setValue:&unk_1EDC385A0 forPreferenceKey:@"DictationClearAllCommandTipShownCount"];
}

- (void)updateDictationTipDisplayCount:(id)a3 dictationTipKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (([v6 isEqualToString:@"DictationReplacementCommandTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationDeletionCommandTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationInsertionCommandTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationEmojiCommandTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationSelectionCommandTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationStopCommandTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationModelessInputTipShownCount"] & 1) != 0
    || ([v6 isEqualToString:@"DictationSendMessageCommandTipShownCount"] & 1) != 0
    || [v6 isEqualToString:@"DictationClearAllCommandTipShownCount"])
  {
    [(TIPreferencesController *)self setValue:v7 forPreferenceKey:v6];
  }
}

- (void)updateDictationTipLastShownDate:(id)a3
{
}

- (void)updateDictationAutoPunctuation:(id)a3
{
}

- (void)updateDictationAsPrimaryInputMode:(id)a3
{
}

- (void)updateLastUsedDictationLanguages:(id)a3
{
}

- (void)updateEnabledDictationLanguages:(id)a3
{
}

- (void)updateEnableProKeyboard:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardUseProLayout"];
}

- (void)updateVisceral:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardVisceral"];
  }
}

- (void)updateDidPerformFirstReachableKeyboardInteraction
{
}

- (void)updateKeyboardHandBias:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"None"] & 1) != 0
    || ([v4 isEqualToString:@"Left"] & 1) != 0
    || [v4 isEqualToString:@"Right"])
  {
    [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardBias"];
  }
}

- (void)updateCompactAssistantBarPersistentLocation:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"CompactAssistantBarPersistentLocation"];
}

- (void)updateKeyboardIsFloating:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardIsFloating"];
}

- (void)updateKeyboardIsSplit:(BOOL)a3 locked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [NSNumber numberWithBool:a3];
  [(TIPreferencesController *)self setValue:v6 forPreferenceKey:@"UIKeyboardPersistentSplitProgress"];

  id v7 = [NSNumber numberWithBool:v4];
  [(TIPreferencesController *)self setValue:v7 forPreferenceKey:@"UIKeyboardPersistentSplitLock"];
}

- (void)setFloatingKeyboardDockedEdge:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardFloatingDockedEdge"];
}

- (unint64_t)floatingKeyboardDockedEdge
{
  v2 = [(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardFloatingDockedEdge"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (void)setFloatingKeyboardPosition:(CGPoint)a3
{
  double y = a3.y;
  v5 = [NSNumber numberWithDouble:a3.x];
  [(TIPreferencesController *)self setValue:v5 forPreferenceKey:@"KeyboardFloatingPersistentHorizontalOffset"];

  id v6 = [NSNumber numberWithDouble:y];
  [(TIPreferencesController *)self setValue:v6 forPreferenceKey:@"KeyboardFloatingPersistentVerticalOffset"];

  [(TIPreferencesController *)self synchronizePreferences];
}

- (CGPoint)floatingKeyboardPosition
{
  unint64_t v3 = [(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardFloatingPersistentHorizontalOffset"];
  [v3 doubleValue];
  double v5 = v4;
  id v6 = [(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardFloatingPersistentVerticalOffset"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double y = v10;
  result.x = v9;
  return result;
}

- (void)setKeyboardPosition:(CGPoint)a3
{
  double y = a3.y;
  double v5 = [NSNumber numberWithDouble:a3.x];
  [(TIPreferencesController *)self setValue:v5 forPreferenceKey:@"UIKeyboardPersistentHorizontalOffset"];

  id v6 = [NSNumber numberWithDouble:y];
  [(TIPreferencesController *)self setValue:v6 forPreferenceKey:@"UIKeyboardPersistentVerticalOffset"];
}

- (CGPoint)keyboardPosition
{
  unint64_t v3 = [(TIPreferencesController *)self valueForPreferenceKey:@"UIKeyboardPersistentHorizontalOffset"];
  [v3 doubleValue];
  double v5 = v4;
  id v6 = [(TIPreferencesController *)self valueForPreferenceKey:@"UIKeyboardPersistentVerticalOffset"];
  [v6 doubleValue];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double y = v10;
  result.x = v9;
  return result;
}

- (void)didUnseeHardwareKeyboard:(id)a3
{
  id v6 = a3;
  double v4 = [(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardHardwareKeyboardsSeen"];
  if ([v4 containsObject:v6])
  {
    double v5 = (void *)[v4 mutableCopy];
    [v5 removeObject:v6];
    [(TIPreferencesController *)self setValue:v5 forPreferenceKey:@"KeyboardHardwareKeyboardsSeen"];
  }
}

- (void)didSeeHardwareKeyboard:(id)a3
{
  id v6 = a3;
  double v4 = [(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardHardwareKeyboardsSeen"];
  if (([v4 containsObject:v6] & 1) == 0)
  {
    if (v4)
    {
      uint64_t v5 = [v4 arrayByAddingObject:v6];

      double v4 = (void *)v5;
    }
    else
    {
      double v4 = [MEMORY[0x1E4F1C978] arrayWithObject:v6];
    }
    [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardHardwareKeyboardsSeen"];
  }
}

- (void)setKeyboardShownByTouch:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"SoftwareKeyboardShownByTouch"];
}

- (BOOL)keyboardShownByTouch
{
  return [(TIPreferencesController *)self BOOLForPreferenceKey:@"SoftwareKeyboardShownByTouch"];
}

- (void)setAutomaticMinimizationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(TIPreferencesController *)self BOOLForPreferenceKey:@"SuppressAutomaticMinimization"];
  id v6 = [NSNumber numberWithBool:v3 & ~v5];
  [(TIPreferencesController *)self setValue:v6 forPreferenceKey:@"AutomaticMinimizationEnabled"];
}

- (void)setautocorrectionEnabled:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardAutocorrection"];
}

- (void)setPredictionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = objc_msgSend(NSNumber, "numberWithBool:");
  [(TIPreferencesController *)self setValue:v5 forPreferenceKey:@"KeyboardPrediction"];

  id v6 = [NSNumber numberWithBool:v3];
  [(TIPreferencesController *)self setValue:v6 forPreferenceKey:@"KeyboardShowPredictionBar"];
}

- (BOOL)autocorrectionEnabled
{
  return [(TIPreferencesController *)self BOOLForPreferenceKey:@"KeyboardAutocorrection"];
}

- (BOOL)predictionEnabled
{
  return [(TIPreferencesController *)self BOOLForPreferenceKey:@"KeyboardPrediction"];
}

- (void)setInputModeSelectionSequence:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [(TIPreferencesController *)self setValue:v5, @"KeyboardsCurrentAndNext", v10 forPreferenceKey];
  }
LABEL_12:
}

- (NSArray)inputModeSelectionSequence
{
  return (NSArray *)[(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardsCurrentAndNext"];
}

- (void)updateLastUsedKeyboards:(id)a3
{
}

- (void)updateLastUsedLayout:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[TIInputModeController sharedInputModeController];
  uint64_t v6 = [v5 enabledInputModeIdentifiers];

  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = TIInputModeGetNormalizedIdentifier(*(void **)(*((void *)&v21 + 1) + 8 * v12));
        objc_msgSend(v7, "addObject:", v13, (void)v21);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  v14 = [(TIPreferencesController *)self valueForPreferenceKey:@"KeyboardLayoutLastUsedForKeyboard"];
  uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
  uint64_t v16 = [v15 count];
  uint64_t v17 = [v7 count];

  if (v16 == v17)
  {
    if (v14) {
      [(TIPreferencesController *)self setValue:0 forPreferenceKey:@"KeyboardLayoutLastUsedForKeyboard"];
    }
  }
  else
  {
    if (v14) {
      uint64_t v18 = [v14 mutableCopy];
    }
    else {
      uint64_t v18 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    }
    v19 = (void *)v18;
    v20 = TIInputModeGetNormalizedIdentifier(v4);
    [v19 setObject:v4 forKey:v20];

    [(TIPreferencesController *)self setValue:v19 forPreferenceKey:@"KeyboardLayoutLastUsedForKeyboard"];
  }
}

- (void)updateLastUsedInputMode:(id)a3
{
  [(TIPreferencesController *)self setValue:a3 forPreferenceKey:@"KeyboardLastUsed"];
  id v4 = (id)objc_opt_new();
  [(TIPreferencesController *)self setValue:v4 forPreferenceKey:@"KeyboardInputModeUpdateDate"];
}

- (void)didTriggerOneTimeAction:(id)a3
{
  id v4 = a3;
  if (-[TIPreferencesController _isOneTimeAction:](self, "_isOneTimeAction:")) {
    [(TIPreferencesController *)self setValue:MEMORY[0x1E4F1CC38] forPreferenceKey:v4];
  }
}

- (BOOL)oneTimeActionCompleted:(id)a3
{
  id v4 = a3;
  if ([(TIPreferencesController *)self _isOneTimeAction:v4]) {
    BOOL v5 = [(TIPreferencesController *)self BOOLForPreferenceKey:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_isOneTimeAction:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"UIKeyboardDidShowInternationalInfoIntroduction"] & 1) != 0
    || ([v3 isEqualToString:@"DidShowGestureKeyboardIntroduction"] & 1) != 0
    || ([v3 isEqualToString:@"DidShowContinuousPathIntroduction"] & 1) != 0
    || ([v3 isEqualToString:@"KeyboardDidShowProductivityTutorial"] & 1) != 0
    || ([v3 isEqualToString:@"HardwareKeyboardLastSeen"] & 1) != 0
    || ([v3 isEqualToString:@"DictationReplacementCommandTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"DictationDeletionCommandTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"DictationInsertionCommandTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"DictationEmojiCommandTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"DictationSelectionCommandTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"DictationStopCommandTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"DidShowInlineCompletionEducationTip"] & 1) != 0
    || ([v3 isEqualToString:@"ModelessInputTipShown"] & 1) != 0
    || ([v3 isEqualToString:@"MultilingualKeyboardTip"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"MultilingualSettingTip"];
  }

  return v4;
}

- (BOOL)allEnabledInputModesAreValid
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (![(TIPreferencesController *)self BOOLForPreferenceKey:@"AppleKeyboardsExpanded"]) {
    return 1;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(TIPreferencesController *)self valueForPreferenceKey:@"AppleKeyboards", 0];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = +[TIInputModeController sharedInputModeController];
        LODWORD(v8) = [v9 identifierIsValidSystemInputMode:v8];

        if (!v8)
        {
          BOOL v10 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_13:

  return v10;
}

- (void)setInputModes:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:a3];
  uint64_t v5 = [v4 array];
  uint64_t v6 = [(TIPreferencesController *)self valueForPreferenceKey:@"AppleKeyboards"];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[TIPreferencesController setInputModes:]";
    __int16 v9 = 2112;
    BOOL v10 = v6;
    _os_log_debug_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  updateInputModes: oldInputModes = %@", (uint8_t *)&v7, 0x16u);
  }
  [(id)objc_opt_class() registerPreferredLanguagesForInputModes:v5 replacingInputModes:v6];
  [(TIPreferencesController *)self setValue:v5 forPreferenceKey:@"AppleKeyboards"];
}

- (void)updateInputModes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    if (v4) {
      goto LABEL_3;
    }
LABEL_8:
    BOOL v10 = self;
    __int16 v9 = 0;
LABEL_9:
    [(TIPreferencesController *)v10 setValue:v9 forPreferenceKey:@"AppleKeyboardsExpanded"];
    goto LABEL_10;
  }
  int v11 = 136315394;
  long long v12 = "-[TIPreferencesController updateInputModes:]";
  __int16 v13 = 2112;
  id v14 = v4;
  _os_log_debug_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  updateInputModes: Called with inputModes = %@", (uint8_t *)&v11, 0x16u);
  if (!v4) {
    goto LABEL_8;
  }
LABEL_3:
  if (![(TIPreferencesController *)self BOOLForPreferenceKey:@"AppleKeyboardsExpanded"])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v6 = [v5 localeIdentifier];
    int v7 = TIGetDefaultInputModesForLanguage(v6);
    uint64_t v8 = [v7 count];

    if (!v8) {
      [(TIPreferencesController *)self setValue:&unk_1EDC38660 forPreferenceKey:@"AppleKeyboardsIncludeIntl"];
    }
    __int16 v9 = &unk_1EDC38660;
    BOOL v10 = self;
    goto LABEL_9;
  }
LABEL_10:
  [(TIPreferencesController *)self setInputModes:v4];
}

- (BOOL)isKeyLockedDown:(int)a3
{
  id v4 = preferenceKeyForEnumKey(a3);
  LOBYTE(self) = [(TIPreferencesController *)self isPreferenceKeyLockedDown:v4];

  return (char)self;
}

- (BOOL)isPreferenceKeyLockedDown:(id)a3
{
  id v3 = managedConfigurationFeatureForPreferenceKey(a3);
  if (v3)
  {
    id v4 = [getMCProfileConnectionClass() sharedConnection];
    char v5 = [v4 isSettingLockedDownByRestrictions:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setValue:(id)a3 forManagedPreferenceKey:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if ([v5 isEqualToString:@"KeyboardAutocorrection"])
  {
    uint64_t v6 = [getMCProfileConnectionClass() sharedConnection];
    objc_msgSend(v6, "setAutoCorrectionAllowed:", objc_msgSend(v7, "BOOLValue"));
  }
  else if ([v5 isEqualToString:@"KeyboardPrediction"])
  {
    uint64_t v6 = [getMCProfileConnectionClass() sharedConnection];
    objc_msgSend(v6, "setPredictiveKeyboardAllowed:", objc_msgSend(v7, "BOOLValue"));
  }
  else if ([v5 isEqualToString:@"KeyboardCheckSpelling"])
  {
    uint64_t v6 = [getMCProfileConnectionClass() sharedConnection];
    objc_msgSend(v6, "setSpellCheckAllowed:", objc_msgSend(v7, "BOOLValue"));
  }
  else if ([v5 isEqualToString:@"SmartQuotesEnabled"])
  {
    uint64_t v6 = [getMCProfileConnectionClass() sharedConnection];
    objc_msgSend(v6, "setSmartPunctuationAllowed:", objc_msgSend(v7, "BOOLValue"));
  }
  else
  {
    if (![v5 isEqualToString:@"KeyboardContinuousPathEnabled"]) {
      goto LABEL_12;
    }
    uint64_t v6 = [getMCProfileConnectionClass() sharedConnection];
    objc_msgSend(v6, "setContinuousPathKeyboardAllowed:", objc_msgSend(v7, "BOOLValue"));
  }

LABEL_12:
}

- (void)setValue:(id)a3 forKey:(int)a4
{
  id v6 = a3;
  preferenceKeyForEnumKey(a4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(TIPreferencesController *)self setValue:v6 forPreferenceKey:v7];
}

- (void)touchSynchronizePreferencesTimer
{
  if ([(NSTimer *)self->_synchronizePreferencesTimer isValid])
  {
    synchronizePreferencesTimer = self->_synchronizePreferencesTimer;
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.5];
    -[NSTimer setFireDate:](synchronizePreferencesTimer, "setFireDate:");
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel_synchronizePreferences selector:0 userInfo:0 repeats:0.5];
    id v5 = self->_synchronizePreferencesTimer;
    self->_synchronizePreferencesTimer = v4;

    id v6 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v6 addTimer:self->_synchronizePreferencesTimer forMode:*MEMORY[0x1E4F1C3A0]];
  }
}

- (void)synchronizePreferences
{
  [(TIPreferencesController *)self clearSynchronizePreferencesTimer];
  configuredDomains = self->_configuredDomains;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__TIPreferencesController_synchronizePreferences__block_invoke;
  v4[3] = &unk_1E5559E60;
  v4[4] = self;
  [(NSMutableDictionary *)configuredDomains enumerateKeysAndObjectsUsingBlock:v4];
}

void __49__TIPreferencesController_synchronizePreferences__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  if ([v9 needsSetSync])
  {
    [v9 setNeedsSetSync:0];
    id v4 = [v9 domain];
    CFPreferencesSynchronize(v4, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

    id v5 = [v9 notification];
    if (v5)
    {
      int v6 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 41);

      if (!v6)
      {
        [v9 setLastSynchronizedTime:CFAbsoluteTimeGetCurrent()];
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        uint64_t v8 = [v9 notification];
        CFNotificationCenterPostNotification(DarwinNotifyCenter, v8, 0, 0, 1u);
      }
    }
  }
}

void __55__TIPreferencesController_synchronizeDomainIfNeedsGet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = [v5 domain];
  id v7 = [*(id *)(a1 + 32) domain];
  int v8 = [v6 isEqualToString:v7];

  if (v8) {
    [v5 setCurrentValue:0];
  }
  if (isManagedPreferenceKey(v9)) {
    [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v9];
  }
}

- (void)clearSynchronizePreferencesTimer
{
  [(NSTimer *)self->_synchronizePreferencesTimer invalidate];
  synchronizePreferencesTimer = self->_synchronizePreferencesTimer;
  self->_synchronizePreferencesTimer = 0;
}

- (void)performWithWriteability:(BOOL)a3 operations:(id)a4
{
}

- (void)_pushValue:(id)a3 toPreference:(id)a4 domain:(id)a5
{
  if (a4 && a5)
  {
    id v8 = a5;
    id v9 = a3;
    BOOL v10 = [a4 key];
    int v11 = [v8 domain];
    CFPreferencesSetAppValue(v10, v9, v11);

    [v8 setNeedsSetSync:1];
    [(TIPreferencesController *)self touchSynchronizePreferencesTimer];
  }
}

- (void)setValue:(id)a3 forPreferenceKey:(id)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = isManagedPreferenceKey(v7);
  if (v6 && v8) {
    [(TIPreferencesController *)self setValue:v6 forManagedPreferenceKey:v7];
  }
  id v9 = self;
  objc_sync_enter(v9);
  BOOL v10 = [(NSMutableDictionary *)v9->_configuredPreferences objectForKey:v7];
  if (v10)
  {
    id v11 = [(TIPreferencesController *)v9 valueForPreferenceKey:v7];
    if (v6)
    {
      long long v12 = [v10 currentValue];
      char v13 = [v6 isEqual:v12];

      if ((v13 & 1) == 0)
      {
        configuredDomains = v9->_configuredDomains;
        uint64_t v15 = [v10 domain];
        uint64_t v16 = [(NSMutableDictionary *)configuredDomains objectForKey:v15];

        v43 = [v10 currentValue];
        [v10 setCurrentValue:v6];
        [(TIPreferencesController *)v9 _pushValue:v6 toPreference:v10 domain:v16];
        if ([v10 isCloudSetting])
        {
          uint64_t v49 = 0;
          v50 = &v49;
          uint64_t v51 = 0x2050000000;
          uint64_t v17 = (void *)getCloudSettingsManagerClass_softClass;
          uint64_t v52 = getCloudSettingsManagerClass_softClass;
          if (!getCloudSettingsManagerClass_softClass)
          {
            uint64_t v44 = MEMORY[0x1E4F143A8];
            uint64_t v45 = 3221225472;
            v46 = __getCloudSettingsManagerClass_block_invoke;
            v47 = &unk_1E555A528;
            v48 = &v49;
            __getCloudSettingsManagerClass_block_invoke((uint64_t)&v44);
            uint64_t v17 = (void *)v50[3];
          }
          id v18 = v17;
          _Block_object_dispose(&v49, 8);
          v19 = [v18 sharedCloudSettingsManager];
          v20 = [v10 key];
          v54[0] = v20;
          long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
          [v19 writeToCloudSettings:v21 forStore:@"com.apple.cloudsettings.keyboard"];
        }
        if ([v10 isWatchSync])
        {
          uint64_t v49 = 0;
          v50 = &v49;
          uint64_t v51 = 0x2050000000;
          long long v22 = (void *)getNPSManagerClass_softClass;
          uint64_t v52 = getNPSManagerClass_softClass;
          if (!getNPSManagerClass_softClass)
          {
            uint64_t v44 = MEMORY[0x1E4F143A8];
            uint64_t v45 = 3221225472;
            v46 = __getNPSManagerClass_block_invoke;
            v47 = &unk_1E555A528;
            v48 = &v49;
            __getNPSManagerClass_block_invoke((uint64_t)&v44);
            long long v22 = (void *)v50[3];
          }
          id v23 = v22;
          _Block_object_dispose(&v49, 8);
          long long v24 = objc_opt_new();
          v25 = [v10 domain];
          uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
          id v53 = v7;
          v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          v28 = [v26 setWithArray:v27];
          [v24 synchronizeUserDefaultsDomain:v25 keys:v28];
        }
        if ([v10 isAnalyzed])
        {
          configuredPreferences = v9->_configuredPreferences;
          id v30 = [v10 changedAtKey];
          v31 = [(NSMutableDictionary *)configuredPreferences objectForKey:v30];

          if (v31)
          {
            v32 = [MEMORY[0x1E4F1C9C8] now];
            [(TIPreferencesController *)v9 _pushValue:v32 toPreference:v31 domain:v16];
          }
          v33 = v9->_configuredPreferences;
          v34 = [v10 buildAtChangeKey];
          v35 = [(NSMutableDictionary *)v33 objectForKey:v34];

          if (v35)
          {
            v36 = (void *)MGGetStringAnswer();
            [(TIPreferencesController *)v9 _pushValue:v36 toPreference:v35 domain:v16];
          }
          v37 = v9->_configuredPreferences;
          v38 = [v10 previousValueKey];
          v39 = [(NSMutableDictionary *)v37 objectForKey:v38];

          if (v39) {
            [(TIPreferencesController *)v9 _pushValue:v43 toPreference:v39 domain:v16];
          }
          v40 = v9->_configuredPreferences;
          v41 = [v10 analyzedAtKey];
          v42 = [(NSMutableDictionary *)v40 objectForKey:v41];

          if (v42) {
            [(TIPreferencesController *)v9 _pushValue:0 toPreference:v42 domain:v16];
          }
        }
      }
    }
  }

  objc_sync_exit(v9);
}

- (id)_configuredPreferencesForDomain:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(NSMutableDictionary *)self->_configuredPreferences allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v12 = [v11 domain];
        int v13 = [v12 isEqual:v4];

        if (v13)
        {
          id v14 = [v11 key];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)_configureKey:(id)a3 domain:(id)a4 fallbackKey:(id)a5
{
}

- (void)_configureKeyForAnalytics:(id)a3 domain:(id)a4 defaultValue:(id)a5
{
}

- (void)dealloc
{
  id v3 = [(TIPreferencesController *)self actionWhenIdle];
  [v3 invalidate];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  configuredDomains = self->_configuredDomains;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__TIPreferencesController_dealloc__block_invoke;
  v7[3] = &unk_1E5559E60;
  v7[4] = self;
  [(NSMutableDictionary *)configuredDomains enumerateKeysAndObjectsUsingBlock:v7];
  v6.receiver = self;
  v6.super_class = (Class)TIPreferencesController;
  [(TIPreferencesController *)&v6 dealloc];
}

void __34__TIPreferencesController_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  objc_super v6 = *(const void **)(a1 + 32);
  name = [v4 notification];

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v6, name, 0);
}

- (void)profileSettingDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__TIPreferencesController_profileSettingDidChange___block_invoke;
  v3[3] = &unk_1E555A428;
  v3[4] = self;
  TIDispatchAsync(MEMORY[0x1E4F14428], v3);
}

uint64_t __51__TIPreferencesController_profileSettingDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__TIPreferencesController_profileSettingDidChange___block_invoke_2;
  v4[3] = &unk_1E5559E60;
  v4[4] = v1;
  return [v2 enumerateKeysAndObjectsUsingBlock:v4];
}

uint64_t __51__TIPreferencesController_profileSettingDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferencesChangedCallback:");
}

- (void)managedKeyboardSettingDidChange:(id)a3
{
  [(NSCache *)self->_cachedMCRestrictedValue removeAllObjects];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__TIPreferencesController_managedKeyboardSettingDidChange___block_invoke;
  v4[3] = &unk_1E555A428;
  v4[4] = self;
  TIDispatchAsync(MEMORY[0x1E4F14428], v4);
}

void __59__TIPreferencesController_managedKeyboardSettingDidChange___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"TIPreferencesControllerChangedNotification" object:*(void *)(a1 + 32)];

  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"AppleKeyboardsContinuousPathSettingsChangedNotification" object:*(void *)(a1 + 32)];
}

- (void)preferencesChangedCallback:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v14 = [v4 notification];
    int v15 = 136315650;
    long long v16 = "-[TIPreferencesController preferencesChangedCallback:]";
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: Triggering preferencesChangedCallback for domain %@ with notification %@", (uint8_t *)&v15, 0x20u);
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [v4 lastSynchronizedTime];
  if (Current - v6 > 1.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
    {
      int v15 = 136315394;
      long long v16 = "-[TIPreferencesController preferencesChangedCallback:]";
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_debug_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: preferencesChangedCallback updating sync signal for domain %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v7 = [v4 domain];
    int v8 = [v7 isEqualToString:@".GlobalPreferences"];

    if (v8)
    {
      [(NSMutableDictionary *)self->_configuredDomains enumerateKeysAndObjectsUsingBlock:&__block_literal_global_9264];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136315394;
        long long v16 = "-[TIPreferencesController preferencesChangedCallback:]";
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_debug_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: Marking domain %@ as needs to be synced.", (uint8_t *)&v15, 0x16u);
      }
      [v4 setNeedsGetSync:1];
    }
    if ([(TIPreferencesController *)self ignoreNextSyncNotification])
    {
      [(TIPreferencesController *)self setIgnoreNextSyncNotification:0];
    }
    else
    {
      uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"TIPreferencesControllerChangedNotification" object:self];
    }
  }
  BOOL v10 = [v4 domain];
  int v11 = [v10 isEqualToString:@"com.apple.keyboard"];

  if (v11) {
    [(TIPreferencesController *)self setIsInternalInstall:MGGetBoolAnswer()];
  }
  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v13 = [v4 notification];
  [v12 postNotificationName:v13 object:0];
}

void __54__TIPreferencesController_preferencesChangedCallback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315394;
    id v5 = "-[TIPreferencesController preferencesChangedCallback:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v3;
    _os_log_debug_impl(&dword_18D240000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%s  preferencesChangedCallback: Marking domain %@ as needs to be synced.", (uint8_t *)&v4, 0x16u);
  }
  [v3 setNeedsGetSync:1];
}

+ (void)registerPreferredLanguagesForInputModes:(id)a3 replacingInputModes:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v50[0] = 0;
  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    v50[1] = MEMORY[0x1E4F143A8];
    v50[2] = 3221225472;
    v50[3] = __IntlPreferencesLibraryCore_block_invoke;
    v50[4] = &__block_descriptor_40_e5_v8__0l;
    v50[5] = v50;
    long long v55 = xmmword_1E555A108;
    uint64_t v56 = 0;
    IntlPreferencesLibraryCore_frameworkLibrardouble y = _sl_dlopen();
    id v7 = (void *)v50[0];
    if (IntlPreferencesLibraryCore_frameworkLibrary)
    {
      if (!v50[0]) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v33 = v50[0];
      id v7 = (void *)abort_report_np();
    }
    free(v7);
  }
LABEL_4:
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA80], "set", v33);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = TIInputModeGetLanguageWithRegion(*(void **)(*((void *)&v46 + 1) + 8 * i));
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v11);
  }

  int v15 = [MEMORY[0x1E4F1CA80] set];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v16 = v5;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v43 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = TIInputModeGetLanguageWithRegion(*(void **)(*((void *)&v42 + 1) + 8 * j));
        if (v21) {
          [v15 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v18);
  }

  long long v22 = (void *)[v15 mutableCopy];
  [v22 intersectSet:v8];
  [v15 minusSet:v22];
  [v8 minusSet:v22];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v23 = v15;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        [MEMORY[0x1E4F1CA20] registerPreferredLanguageForAddedKeyboardLanguage:*(void *)(*((void *)&v38 + 1) + 8 * k)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v25);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v28 = v8;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v35 != v31) {
          objc_enumerationMutation(v28);
        }
        [MEMORY[0x1E4F1CA20] unregisterPreferredLanguageForKeyboardLanguage:*(void *)(*((void *)&v34 + 1) + 8 * m)];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v30);
  }
}

@end