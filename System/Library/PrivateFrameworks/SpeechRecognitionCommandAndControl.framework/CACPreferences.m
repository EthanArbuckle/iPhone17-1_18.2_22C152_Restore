@interface CACPreferences
+ (id)_builtinCommandsCatalogURL;
+ (id)_suffixedURLsForURL:(id)a3;
+ (id)sharedPreferences;
- (BOOL)additionalLoggingForCommands;
- (BOOL)allowLetterKeysAsTapCommands;
- (BOOL)commandAndControlIsEnabled;
- (BOOL)didShowOnboarding;
- (BOOL)donationTipKitSeen;
- (BOOL)forceAllCommandsToBeActive;
- (BOOL)gridOverlayCustomColumnsEnabled;
- (BOOL)gridOverlayCustomRowsEnabled;
- (BOOL)gridOverlayMaxDensityEnabled;
- (BOOL)gridOverlayPressOnFirstLevelEnabled;
- (BOOL)gridOverlayShowsNumbersInTopLeft;
- (BOOL)hidePreferencesForCommandSetIdentifier:(id)a3;
- (BOOL)isCommandIdentifier:(id)a3 availableForLocaleIdentifier:(id)a4;
- (BOOL)isConfirmationRequiredForCommandIdentifier:(id)a3;
- (BOOL)isEnabledForCommandIdentifier:(id)a3;
- (BOOL)overlayFadingEnabled;
- (BOOL)phoneticVocabularyShowDebugUI;
- (BOOL)phoneticVocabularyShowUserFacingIPA;
- (BOOL)phoneticVocabularyShowUserFacingIPAToggle;
- (BOOL)phoneticVocabularySkipPickingPronunciation;
- (BOOL)playSoundUponRecognition;
- (BOOL)shouldDisableDeviceIdleTimer;
- (BOOL)showTextResponseUponRecognition;
- (BOOL)sleepOnAttentionLost;
- (BOOL)usingAutomationMode;
- (BOOL)wakeOnAttentionGained;
- (CACPreferences)init;
- (double)lastCommandDate;
- (double)overlayFadeDelay;
- (float)overlayFadeOpacity;
- (id)_allPropertyIdentifiers;
- (id)_commandIdentifiersForCommandSetIdentifier:(id)a3 localeIdentifier:(id)a4 enabledOnly:(BOOL)a5;
- (id)_mutablePropertiesForIdentifier:(id)a3 create:(BOOL)a4;
- (id)_propertiesForIdentifier:(id)a3;
- (id)allCustomCommandProperties;
- (id)alwaysShowOverlayType;
- (id)attentionAwareAction;
- (id)availableCommandSetIdentifiers;
- (id)bestLocaleIdentifier;
- (id)builtInCommandsStringsTableForLocaleIdentifier:(id)a3;
- (id)builtInCommandsTable;
- (id)commandCounts;
- (id)commandIdentifiersForCommandSetIdentifier:(id)a3 localeIdentifier:(id)a4;
- (id)displayNameForCommandSetIdentifier:(id)a3;
- (id)divertedCommandsLogPath;
- (id)enabledCommandIdentifiersForCommandSetIdentifier:(id)a3;
- (id)externalContextOverrideFilePath;
- (id)getPronsFromIPA:(id)a3;
- (id)localeIdentifiersRepresentedByAllVocabularyEntries;
- (id)propertiesForCommandIdentifier:(id)a3;
- (id)propertiesForCommandIdentifier:(id)a3 localeIdentifier:(id)a4;
- (id)rawCustomCommandsPreferencesDictionary;
- (id)recentCommandEntries;
- (id)setOfApplicationIdentifiersUsedByCustomCommands;
- (id)targetApplicationCounts;
- (id)targetApplicationProperties;
- (id)textDisambiguationStrategy;
- (id)uniqueCustomCommandIdentifier;
- (id)userHintsHistory;
- (id)userSelectableLocaleIdentifiers;
- (id)vocabularyEntries;
- (id)vocabularyEntriesForLocaleIdentifier:(id)a3;
- (int64_t)correctionCount;
- (int64_t)gridOverlayCustomColumnsCount;
- (int64_t)gridOverlayCustomRowsCount;
- (int64_t)gridOverlayMaxLevel;
- (int64_t)messageTracesSinceLastReport;
- (int64_t)userHintsFeatures;
- (void)_flushBuiltInCommandsStringsTable;
- (void)_propertyTransactionPostNotification:(id)a3 identifier:(id)a4;
- (void)_propertyTransactionSynchronize;
- (void)_setProperties:(id)a3 forIdentifier:(id)a4 client:(BOOL)a5;
- (void)_writeDefaultCommandSettingsIfNecessary;
- (void)addOrUpdateCommandPropertiesFromImportedTable:(id)a3;
- (void)addVocabularyEntryWithString:(id)a3;
- (void)addVocabularyEntryWithString:(id)a3 forLocaleIdentifier:(id)a4;
- (void)addVocabularyEntryWithWord:(id)a3 IPAs:(id)a4;
- (void)beginPropertyTransaction;
- (void)dealloc;
- (void)deleteAllCustomCommandEntries;
- (void)endPropertyTransaction;
- (void)fixMissingLocalesForVocabularyEntriesIfNecessary;
- (void)removePropertiesForCommandIdentifier:(id)a3;
- (void)removeUserCommandHistory;
- (void)setAdditionalLoggingForCommands:(BOOL)a3;
- (void)setAllowLetterKeysAsTapCommands:(BOOL)a3;
- (void)setAlwaysShowOverlayType:(id)a3;
- (void)setAttentionAwareAction:(id)a3;
- (void)setCommandAndControlEnabled:(BOOL)a3;
- (void)setCommandCounts:(id)a3;
- (void)setCorrectionCount:(int64_t)a3;
- (void)setDidShowOnboarding:(BOOL)a3;
- (void)setDonationTipKitSeen:(BOOL)a3;
- (void)setGridOverlayCustomColumnsCount:(int64_t)a3;
- (void)setGridOverlayCustomColumnsEnabled:(BOOL)a3;
- (void)setGridOverlayCustomRowsCount:(int64_t)a3;
- (void)setGridOverlayCustomRowsEnabled:(BOOL)a3;
- (void)setGridOverlayMaxDensityEnabled:(BOOL)a3;
- (void)setGridOverlayMaxLevel:(int64_t)a3;
- (void)setGridOverlayPressOnFirstLevelEnabled:(BOOL)a3;
- (void)setGridOverlayShowsNumbersInTopLeft:(BOOL)a3;
- (void)setLastCommandDate:(double)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setMessageTracesSinceLastReport:(int64_t)a3;
- (void)setOverlayFadeDelay:(double)a3;
- (void)setOverlayFadeOpacity:(float)a3;
- (void)setOverlayFadingEnabled:(BOOL)a3;
- (void)setPhoneticVocabularyShowDebugUI:(BOOL)a3;
- (void)setPhoneticVocabularyShowUserFacingIPA:(BOOL)a3;
- (void)setPhoneticVocabularyShowUserFacingIPAToggle:(BOOL)a3;
- (void)setPhoneticVocabularySkipPickingPronunciation:(BOOL)a3;
- (void)setPlaySoundUponRecognition:(BOOL)a3;
- (void)setProperties:(id)a3 forCommandIdentifier:(id)a4;
- (void)setProperties:(id)a3 forCommandIdentifier:(id)a4 client:(BOOL)a5;
- (void)setRecentCommandEntries:(id)a3;
- (void)setShowTextResponseUponRecognition:(BOOL)a3;
- (void)setSleepOnAttentionLost:(BOOL)a3;
- (void)setTargetApplicationCounts:(id)a3;
- (void)setTargetApplicationProperties:(id)a3;
- (void)setTextDisambiguationStrategy:(id)a3;
- (void)setUserHintsFeatures:(int64_t)a3;
- (void)setUserHintsHistory:(id)a3;
- (void)setVocabularyEntries:(id)a3;
- (void)setVocabularyEntries:(id)a3 forLocaleIdentifier:(id)a4;
- (void)setWakeOnAttentionGained:(BOOL)a3;
@end

@implementation CACPreferences

+ (id)sharedPreferences
{
  if (sharedPreferences_staticManagerInstanceSetup != -1) {
    dispatch_once(&sharedPreferences_staticManagerInstanceSetup, &__block_literal_global_27);
  }
  v2 = (void *)sCACPreferences;
  return v2;
}

uint64_t __35__CACPreferences_sharedPreferences__block_invoke()
{
  sCACPreferences = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (CACPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)CACPreferences;
  v2 = [(CACPreferences *)&v7 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_handleNotification, @"CACNotificationLanguageChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v4 = objc_opt_new();
    builtInLocalizedCommandStringsByLocaleIdentifier = v2->_builtInLocalizedCommandStringsByLocaleIdentifier;
    v2->_builtInLocalizedCommandStringsByLocaleIdentifier = (NSMutableDictionary *)v4;
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CACNotificationLanguageChanged", 0);
  v4.receiver = self;
  v4.super_class = (Class)CACPreferences;
  [(CACPreferences *)&v4 dealloc];
}

- (BOOL)commandAndControlIsEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

- (void)setCommandAndControlEnabled:(BOOL)a3
{
}

- (void)setLocaleIdentifier:(id)a3
{
  v3 = +[CACLocaleUtilities normalizedLocaleIdentifier:a3];
  CFPreferencesSetAppValue(@"CACLocaleIdentifier", v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");

  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationLanguageChanged", 0, 0, 1u);
}

- (id)bestLocaleIdentifier
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  v3 = (__CFString *)CFPreferencesCopyAppValue(@"CACLocaleIdentifier", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  objc_super v4 = [(CACPreferences *)self userSelectableLocaleIdentifiers];
  BOOL v5 = +[CACLocaleUtilities isLocaleIdentifier:v3 containedInLocaleIdentifiers:v4];

  if (v5)
  {
    if (v3) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  v6 = (void *)MEMORY[0x263F086E0];
  objc_super v7 = [(CACPreferences *)self userSelectableLocaleIdentifiers];
  v8 = [&unk_26EB4D0A0 arrayByAddingObjectsFromArray:v7];
  v9 = [MEMORY[0x263EFF960] preferredLanguages];
  v10 = [v6 preferredLocalizationsFromArray:v8 forPreferences:v9];

  if ([v10 count])
  {
    v3 = [v10 firstObject];
    v11 = CACLogPreferences();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = NSString;
      v27 = [(CACPreferences *)self userSelectableLocaleIdentifiers];
      v26 = [&unk_26EB4D0B8 arrayByAddingObjectsFromArray:v27];
      v13 = [v26 componentsJoinedByString:@","];
      v14 = [v12 stringWithFormat:@"[%@]", v13];
      v15 = NSString;
      v16 = [MEMORY[0x263EFF960] preferredLanguages];
      v17 = [v16 componentsJoinedByString:@","];
      v18 = [v15 stringWithFormat:@"[%@]", v17];
      *(_DWORD *)buf = 138412802;
      v29 = v3;
      __int16 v30 = 2112;
      v31 = v14;
      __int16 v32 = 2112;
      v33 = v18;
      _os_log_impl(&dword_238377000, v11, OS_LOG_TYPE_INFO, "BestLocaleIdentifier %@ by calling preferredLocalizationsFromArray:%@ from:%@", buf, 0x20u);
    }
    if ([(__CFString *)v3 isEqualToString:@"zxx"])
    {
    }
    else if (v3)
    {
      goto LABEL_12;
    }
  }
  v3 = @"en_US";
LABEL_12:
  if (+[CACLocaleUtilities isSameLocaleIdentifier:v3 secondLocaleIdentifier:@"zh_CN"])
  {
    v19 = [MEMORY[0x263F285A0] sharedPreferences];
    v20 = [v19 languageCode];
    if (+[CACLocaleUtilities isSameLocaleIdentifier:v20 secondLocaleIdentifier:@"yue_CN"])
    {
      v21 = [(CACPreferences *)self userSelectableLocaleIdentifiers];
      v22 = @"yue_CN";
      BOOL v23 = +[CACLocaleUtilities isLocaleIdentifier:@"yue_CN" containedInLocaleIdentifiers:v21];

      v19 = v3;
      if (!v23) {
        goto LABEL_18;
      }
    }
    else
    {

      v22 = v3;
    }

    v3 = v22;
  }
LABEL_18:

LABEL_19:
  v24 = +[CACLocaleUtilities normalizedLocaleIdentifier:v3];

  return v24;
}

- (id)userSelectableLocaleIdentifiers
{
  if (userSelectableLocaleIdentifiers_userSelectableLanguagesInit != -1) {
    dispatch_once(&userSelectableLocaleIdentifiers_userSelectableLanguagesInit, &__block_literal_global_305);
  }
  v2 = (void *)userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers;
  return v2;
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke()
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v1 = (const void *)RXGetSupportedQuasarLocaleIdentifiers();
  v2 = (void *)CFRetain(v1);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v7 = +[CACLocaleUtilities normalizedLocaleIdentifier:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        [v0 addObject:v7];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }
    while (v4);
  }

  v8 = CACLogPreferences();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_2(v0);
  }
  v29 = v0;

  v9 = objc_opt_new();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = [MEMORY[0x263EFF960] systemLanguages];
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v34;
    uint64_t v13 = *MEMORY[0x263EFF4D0];
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = [MEMORY[0x263EFF960] canonicalLocaleIdentifierFromString:*(void *)(*((void *)&v33 + 1) + 8 * j)];
        v16 = [MEMORY[0x263EFF960] componentsFromLocaleIdentifier:v15];
        v17 = [v16 objectForKeyedSubscript:v13];

        if (!v17)
        {
          uint64_t v18 = [MEMORY[0x263EFF960] addLikelySubtagsForLocaleIdentifier:v15];

          v15 = (void *)v18;
        }
        v19 = +[CACLocaleUtilities normalizedLocaleIdentifier:v15];

        [v9 addObject:v19];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v11);
  }

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_320;
  v31[3] = &unk_264D12510;
  id v20 = v9;
  id v32 = v20;
  [&unk_26EB4D148 enumerateKeysAndObjectsUsingBlock:v31];
  v21 = CACLogPreferences();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_1(v20, v21, buf);
    v22 = *(char **)buf;
  }
  else
  {
    v22 = sel_compare_;
  }

  BOOL v23 = (void *)[v29 mutableCopy];
  [v23 intersectSet:v20];
  v24 = [v23 allObjects];
  uint64_t v25 = [v24 sortedArrayUsingSelector:v22];
  v26 = (void *)userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers;
  userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers = v25;

  v27 = CACLogPreferences();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v28 = [(id)userSelectableLocaleIdentifiers_sUserSelectableLocaleIdentifiers componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v28;
    _os_log_impl(&dword_238377000, v27, OS_LOG_TYPE_INFO, "userSelectableLocaleIdentifiers: [%@]", buf, 0xCu);
  }
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_320(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:a3]) {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void)setAdditionalLoggingForCommands:(BOOL)a3
{
  uint64_t v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACAddDebuggingInfoToRecentCommands", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (BOOL)additionalLoggingForCommands
{
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACAddDebuggingInfoToRecentCommands", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (id)attentionAwareAction
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  BOOL v2 = (__CFString *)CFPreferencesCopyAppValue(@"CACAttentionAwareAction", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  uint64_t v3 = v2;
  if (!v2) {
    BOOL v2 = @"None";
  }
  uint64_t v4 = v2;

  return v4;
}

- (void)setAttentionAwareAction:(id)a3
{
  CFPreferencesSetAppValue(@"CACAttentionAwareAction", a3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationAttentionBasedSettingsChanged", 0, 0, 1u);
}

- (BOOL)sleepOnAttentionLost
{
  BOOL v2 = [(CACPreferences *)self attentionAwareAction];
  char v3 = [v2 isEqualToString:@"SleepAndWake"];

  return v3;
}

- (void)setSleepOnAttentionLost:(BOOL)a3
{
  if (a3) {
    char v3 = @"SleepAndWake";
  }
  else {
    char v3 = @"None";
  }
  [(CACPreferences *)self setAttentionAwareAction:v3];
}

- (BOOL)wakeOnAttentionGained
{
  BOOL v2 = [(CACPreferences *)self attentionAwareAction];
  char v3 = [v2 isEqualToString:@"SleepAndWake"];

  return v3;
}

- (void)setWakeOnAttentionGained:(BOOL)a3
{
  if (a3) {
    char v3 = @"SleepAndWake";
  }
  else {
    char v3 = @"None";
  }
  [(CACPreferences *)self setAttentionAwareAction:v3];
}

- (id)alwaysShowOverlayType
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  BOOL v2 = (__CFString *)CFPreferencesCopyAppValue(@"CACAlwaysShowOverlay", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  char v3 = v2;
  if (!v2) {
    BOOL v2 = @"None";
  }
  uint64_t v4 = v2;

  return v4;
}

- (void)setAlwaysShowOverlayType:(id)a3
{
  CFPreferencesSetAppValue(@"CACAlwaysShowOverlay", a3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0, 0, 1u);
}

- (BOOL)playSoundUponRecognition
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACPlaySoundUponRecognition", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setPlaySoundUponRecognition:(BOOL)a3
{
  char v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    char v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACPlaySoundUponRecognition", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NotificationPlaySoundUponRecognitionSettingsChanged", 0, 0, 1u);
}

- (BOOL)showTextResponseUponRecognition
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CACShowTextResponseUponRecognition", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)setShowTextResponseUponRecognition:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACShowTextResponseUponRecognition", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NotificationShowTextResponseUponRecognitionSettingsChanged", 0, 0, 1u);
}

- (BOOL)didShowOnboarding
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACDidShowOnboarding", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setDidShowOnboarding:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACDidShowOnboarding", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (BOOL)donationTipKitSeen
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACDonationTipKitSeen", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setDonationTipKitSeen:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACDonationTipKitSeen", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (id)textDisambiguationStrategy
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  BOOL v2 = (__CFString *)CFPreferencesCopyAppValue(@"CACTextDisambiguationStrategy", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  BOOL v3 = v2;
  if (!v2) {
    BOOL v2 = @"ShowNumbers";
  }
  uint64_t v4 = v2;

  return v4;
}

- (void)setTextDisambiguationStrategy:(id)a3
{
  CFPreferencesSetAppValue(@"CACTextDisambiguationStrategy", a3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (id)vocabularyEntries
{
  BOOL v2 = [MEMORY[0x263EFF980] array];
  CFPreferencesAppSynchronize(@"com.apple.SpeechRecognitionCore.Vocabulary");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"CACVocabularyEntries", @"com.apple.SpeechRecognitionCore.Vocabulary");
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID()) {
      [v2 addObjectsFromArray:v4];
    }
    CFRelease(v4);
  }
  return v2;
}

- (id)vocabularyEntriesForLocaleIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  CFTypeID v5 = [MEMORY[0x263EFF980] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = [(CACPreferences *)self vocabularyEntries];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKey:@"LocaleIdentifier"];
        if (!v12
          && +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v4, @"en_US")|| +[CACLocaleUtilities isSameLocaleIdentifier:v4 secondLocaleIdentifier:v12])
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (void)setVocabularyEntries:(id)a3
{
  if (a3)
  {
    CFPreferencesSetAppValue(@"CACVocabularyEntries", a3, @"com.apple.SpeechRecognitionCore.Vocabulary");
    CFPreferencesAppSynchronize(@"com.apple.SpeechRecognitionCore.Vocabulary");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"NotificationVocabularyEntriesSettingsChanged", 0, 0, 1u);
  }
}

- (void)setVocabularyEntries:(id)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(CACPreferences *)self vocabularyEntries];
    if ([v8 count])
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = [v8 objectAtIndex:v9];
        uint64_t v11 = [v10 objectForKey:@"LocaleIdentifier"];
        if (!v11
          && +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v7, @"en_US")|| +[CACLocaleUtilities isSameLocaleIdentifier:v7 secondLocaleIdentifier:v11])
        {
          [v8 removeObjectAtIndex:v9];
        }
        else
        {
          ++v9;
        }
      }
      while (v9 < [v8 count]);
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v19 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v21 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v18 = [v17 objectForKey:@"LocaleIdentifier"];
          if (!v18
            && +[CACLocaleUtilities isSameLocaleIdentifier:secondLocaleIdentifier:](CACLocaleUtilities, "isSameLocaleIdentifier:secondLocaleIdentifier:", v7, @"en_US")|| +[CACLocaleUtilities isSameLocaleIdentifier:v7 secondLocaleIdentifier:v18])
          {
            [v8 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v14);
    }

    [(CACPreferences *)self setVocabularyEntries:v8];
    id v6 = v19;
  }
}

- (void)addVocabularyEntryWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(CACPreferences *)self bestLocaleIdentifier];
  [(CACPreferences *)self addVocabularyEntryWithString:v4 forLocaleIdentifier:v5];
}

- (void)addVocabularyEntryWithString:(id)a3 forLocaleIdentifier:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    [(CACPreferences *)self vocabularyEntriesForLocaleIdentifier:v7];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "objectForKey:", @"Text", (void)v18);
          char v14 = [v13 isEqualToString:v6];

          if (v14)
          {

            goto LABEL_12;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    v23[0] = v6;
    v22[0] = @"Text";
    v22[1] = @"CreationDate";
    uint64_t v15 = NSNumber;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    long long v16 = objc_msgSend(v15, "numberWithDouble:");
    v22[2] = @"LocaleIdentifier";
    v23[1] = v16;
    v23[2] = v7;
    long long v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    [v8 addObject:v17];

    [(CACPreferences *)self setVocabularyEntries:v8 forLocaleIdentifier:v7];
LABEL_12:
  }
}

- (id)getPronsFromIPA:(id)a3
{
  return &stru_26EB332F0;
}

- (void)addVocabularyEntryWithWord:(id)a3 IPAs:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = CACLogPreferences();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_238377000, v8, OS_LOG_TYPE_INFO, "Adding vocabulary entry for word %@ ipas %@ ", buf, 0x16u);
  }

  uint64_t v9 = [(CACPreferences *)self bestLocaleIdentifier];
  if ([v6 length])
  {
    id v20 = v7;
    [(CACPreferences *)self vocabularyEntriesForLocaleIdentifier:v9];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * v14) objectForKey:@"Text"];
          char v16 = [v15 isEqualToString:v6];

          if (v16)
          {

            id v7 = v20;
            goto LABEL_14;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    v25[0] = @"Text";
    v25[1] = @"TextIPAs";
    id v7 = v20;
    v26[0] = v6;
    v26[1] = v20;
    v25[2] = @"CreationDate";
    long long v17 = NSNumber;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    long long v18 = objc_msgSend(v17, "numberWithDouble:");
    v25[3] = @"LocaleIdentifier";
    v26[2] = v18;
    v26[3] = v9;
    long long v19 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
    [v10 addObject:v19];

    [(CACPreferences *)self setVocabularyEntries:v10 forLocaleIdentifier:v9];
LABEL_14:
  }
}

- (id)localeIdentifiersRepresentedByAllVocabularyEntries
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  CFPropertyListRef v3 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(CACPreferences *)self vocabularyEntries];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
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
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) objectForKey:@"LocaleIdentifier"];
        id v10 = (void *)v9;
        if (v9) {
          uint64_t v11 = (__CFString *)v9;
        }
        else {
          uint64_t v11 = @"en_US";
        }
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  uint64_t v12 = [v3 allObjects];

  return v12;
}

- (void)fixMissingLocalesForVocabularyEntriesIfNecessary
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (!CFPreferencesGetAppBooleanValue(@"CACDidFixMissingVocabLocales", @"com.apple.speech.SpeechRecognitionCommandAndControl", 0))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    obuint64_t j = [(CACPreferences *)self vocabularyEntries];
    uint64_t v3 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      long long v22 = self;
      uint64_t v5 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v36 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = [*(id *)(*((void *)&v35 + 1) + 8 * i) objectForKey:@"LocaleIdentifier"];

          if (!v7)
          {

            obuint64_t j = +[CACLanguageAssetManager downloadedLocaleIdentifiers];
            id v8 = [MEMORY[0x263EFF980] array];
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            id v26 = [(CACPreferences *)v22 vocabularyEntries];
            uint64_t v9 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              uint64_t v11 = *(void *)v32;
              uint64_t v23 = *(void *)v32;
              do
              {
                uint64_t v12 = 0;
                uint64_t v24 = v10;
                do
                {
                  if (*(void *)v32 != v11) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * v12);
                  long long v14 = [v13 objectForKey:@"LocaleIdentifier"];

                  if (v14)
                  {
                    [v8 addObject:v13];
                  }
                  else
                  {
                    long long v29 = 0u;
                    long long v30 = 0u;
                    long long v27 = 0u;
                    long long v28 = 0u;
                    id v15 = obj;
                    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
                    if (v16)
                    {
                      uint64_t v17 = v16;
                      uint64_t v18 = *(void *)v28;
                      do
                      {
                        for (uint64_t j = 0; j != v17; ++j)
                        {
                          if (*(void *)v28 != v18) {
                            objc_enumerationMutation(v15);
                          }
                          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * j);
                          long long v21 = (void *)[v13 mutableCopy];
                          [v21 setObject:v20 forKey:@"LocaleIdentifier"];
                          [v8 addObject:v21];
                        }
                        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
                      }
                      while (v17);
                    }

                    uint64_t v11 = v23;
                    uint64_t v10 = v24;
                  }
                  ++v12;
                }
                while (v12 != v10);
                uint64_t v10 = [v26 countByEnumeratingWithState:&v31 objects:v40 count:16];
              }
              while (v10);
            }

            [(CACPreferences *)v22 setVocabularyEntries:v8];
            goto LABEL_29;
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_29:

    CFPreferencesSetAppValue(@"CACDidFixMissingVocabLocales", (CFPropertyListRef)*MEMORY[0x263EFFB40], @"com.apple.speech.SpeechRecognitionCommandAndControl");
  }
}

- (id)userHintsHistory
{
  BOOL v2 = [MEMORY[0x263EFF9A0] dictionary];
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"CACUserHintsHistory", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (v3)
  {
    uint64_t v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID()) {
      [v2 addEntriesFromDictionary:v4];
    }
    CFRelease(v4);
  }
  return v2;
}

- (void)setUserHintsHistory:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(@"CACUserHintsHistory", v3, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");

    CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  }
}

- (int64_t)userHintsFeatures
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACUserHintsFeatures", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  if (!v2) {
    return 3;
  }
  id v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID()) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 3;
  }
  CFRelease(v3);
  return v5;
}

- (void)setUserHintsFeatures:(int64_t)a3
{
  int64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  CFPreferencesSetAppValue(@"CACUserHintsFeatures", v5, @"com.apple.speech.SpeechRecognitionCommandAndControl");

  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationUserHintsSettingsChanged", 0, 0, 1u);
  if (!a3)
  {
    [(CACPreferences *)self removeUserCommandHistory];
  }
}

- (BOOL)overlayFadingEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACOverlayFadingEnabled", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setOverlayFadingEnabled:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACOverlayFadingEnabled", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationOverlayFadingSettingsChanged", 0, 0, 1u);
}

- (double)overlayFadeDelay
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACOverlayFadeDelay", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  if (!v2) {
    return 2.0;
  }
  id v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  double v5 = 2.0;
  if (v4 == CFNumberGetTypeID())
  {
    [v3 doubleValue];
    double v5 = v6;
  }
  CFRelease(v3);
  return v5;
}

- (void)setOverlayFadeDelay:(double)a3
{
  CFPreferencesSetAppValue(@"CACOverlayFadeDelay", (CFPropertyListRef)[NSNumber numberWithDouble:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationOverlayFadingSettingsChanged", 0, 0, 1u);
}

- (float)overlayFadeOpacity
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACOverlayFadeOpacity", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  if (v2)
  {
    id v3 = (void *)v2;
    CFTypeID v4 = CFGetTypeID(v2);
    double v5 = 0.25;
    if (v4 == CFNumberGetTypeID())
    {
      [v3 doubleValue];
      double v5 = v6;
    }
    CFRelease(v3);
  }
  else
  {
    return 0.25;
  }
  return v5;
}

- (void)setOverlayFadeOpacity:(float)a3
{
  CFPreferencesSetAppValue(@"CACOverlayFadeOpacity", (CFPropertyListRef)objc_msgSend(NSNumber, "numberWithFloat:"), @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationOverlayFadingSettingsChanged", 0, 0, 1u);
}

- (BOOL)gridOverlayCustomColumnsEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACGridOverlayUseCustomColumns", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayCustomColumnsEnabled:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACGridOverlayUseCustomColumns", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (BOOL)gridOverlayCustomRowsEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACGridOverlayUseCustomRows", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayCustomRowsEnabled:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACGridOverlayUseCustomRows", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (int64_t)gridOverlayCustomColumnsCount
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACGridOverlayDesiredColumns", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  if (!v2) {
    return 4;
  }
  id v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID()) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 4;
  }
  CFRelease(v3);
  return v5;
}

- (void)setGridOverlayCustomColumnsCount:(int64_t)a3
{
  CFPreferencesSetAppValue(@"CACGridOverlayDesiredColumns", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (int64_t)gridOverlayCustomRowsCount
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACGridOverlayDesiredRows", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  if (!v2) {
    return 6;
  }
  id v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID()) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 6;
  }
  CFRelease(v3);
  return v5;
}

- (void)setGridOverlayCustomRowsCount:(int64_t)a3
{
  CFPreferencesSetAppValue(@"CACGridOverlayDesiredRows", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (int64_t)gridOverlayMaxLevel
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACGridOverlayMaxLevel", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  if (!v2) {
    return 3;
  }
  id v3 = (void *)v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFNumberGetTypeID()) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 3;
  }
  CFRelease(v3);
  return v5;
}

- (void)setGridOverlayMaxLevel:(int64_t)a3
{
  CFPreferencesSetAppValue(@"CACGridOverlayMaxLevel", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (BOOL)gridOverlayPressOnFirstLevelEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACGridOverlayPressOnFirstLevel", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayPressOnFirstLevelEnabled:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACGridOverlayPressOnFirstLevel", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (BOOL)gridOverlayMaxDensityEnabled
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACGridOverlayUseMaxDensity", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayMaxDensityEnabled:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACGridOverlayUseMaxDensity", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (BOOL)gridOverlayShowsNumbersInTopLeft
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACGridOverlayShowsNumbersInTopLeft", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setGridOverlayShowsNumbersInTopLeft:(BOOL)a3
{
  id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    id v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACGridOverlayShowsNumbersInTopLeft", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationGridOverlaySettingsChanged", 0, 0, 1u);
}

- (BOOL)allowLetterKeysAsTapCommands
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CACKeyboardLetterKeysAsCommands", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)setAllowLetterKeysAsTapCommands:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACKeyboardLetterKeysAsCommands", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"CACNotificationKeyboardSettingsChanged", 0, 0, 1u);
}

- (id)targetApplicationProperties
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  BOOL v2 = (void *)CFPreferencesCopyAppValue(@"CACTargetApplications", @"com.apple.speech.SpeechRecognitionCommandAndControl");
  return v2;
}

- (void)setTargetApplicationProperties:(id)a3
{
  CFPreferencesSetAppValue(@"CACTargetApplications", a3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (BOOL)isEnabledForCommandIdentifier:(id)a3
{
  BOOL v3 = [(CACPreferences *)self _propertiesForIdentifier:a3];
  CFTypeID v4 = [v3 objectForKey:@"Enabled"];

  if (v4)
  {
    if (objc_opt_respondsToSelector()) {
      char v5 = [v4 BOOLValue];
    }
    else {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)isConfirmationRequiredForCommandIdentifier:(id)a3
{
  BOOL v3 = [(CACPreferences *)self _propertiesForIdentifier:a3];
  CFTypeID v4 = [v3 objectForKey:@"ConfirmationRequired"];

  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)propertiesForCommandIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(CACPreferences *)self bestLocaleIdentifier];
  double v6 = [(CACPreferences *)self propertiesForCommandIdentifier:v4 localeIdentifier:v5];

  return v6;
}

- (id)propertiesForCommandIdentifier:(id)a3 localeIdentifier:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CACPreferences *)self _propertiesForIdentifier:v6];
  uint64_t v9 = [v8 objectForKey:@"CustomType"];

  if (v9)
  {
    uint64_t v10 = [(CACPreferences *)self _mutablePropertiesForIdentifier:v6 create:0];
    uint64_t v11 = [v10 objectForKey:@"CustomCommands"];
    if (v11)
    {
      uint64_t v42 = v10;
      id v44 = v7;
      uint64_t v12 = objc_opt_new();
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      uint64_t v13 = [v11 allKeys];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v46 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            uint64_t v19 = [v11 objectForKey:v18];
            uint64_t v20 = +[CACLocaleUtilities normalizedLocaleIdentifier:v18];
            [v12 setObject:v19 forKey:v20];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v54 count:16];
        }
        while (v15);
      }

      uint64_t v10 = v42;
      [v42 setObject:v12 forKey:@"CustomCommands"];
    }
    else
    {
      uint64_t v12 = [v10 objectForKey:@"CustomTextLocalized"];
      if (!v12) {
        goto LABEL_31;
      }
      long long v40 = self;
      id v41 = v6;
      v43 = v10;
      id v44 = v7;
      long long v27 = [MEMORY[0x263EFF9A0] dictionary];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v28 = [v12 allKeys];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v50;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v50 != v31) {
              objc_enumerationMutation(v28);
            }
            uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * j);
            long long v34 = [v12 objectForKey:v33];
            if (v34)
            {
              long long v35 = [MEMORY[0x263EFF8C0] arrayWithObject:v34];
              [v27 setObject:v35 forKey:v33];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v49 objects:v55 count:16];
        }
        while (v30);
      }

      long long v36 = (void *)MEMORY[0x263EFF9A0];
      long long v37 = [MEMORY[0x263EFF9D0] null];
      long long v38 = objc_msgSend(v36, "dictionaryWithObjectsAndKeys:", v37, @"CustomTextLocalized", 0);

      uint64_t v10 = v43;
      if ([v27 count])
      {
        [v38 setObject:v27 forKey:@"CustomCommands"];
        [v43 setObject:v27 forKey:@"CustomCommands"];
      }
      id v6 = v41;
      [(CACPreferences *)v40 setProperties:v38 forCommandIdentifier:v41];
      [v43 removeObjectForKey:@"CustomTextLocalized"];
    }
    id v7 = v44;
  }
  else
  {
    long long v21 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
    uint64_t v11 = [v21 commandStringsTableForLocaleIdentifier:v7];

    long long v22 = [MEMORY[0x263F78BC8] activeTargetTypes];
    uint64_t v53 = 0;
    uint64_t v12 = [v11 languageModelDictionaryForCommandIdentifier:v6 targetTypes:v22 parsingErrorString:&v53];

    uint64_t v23 = [(CACPreferences *)self builtInCommandsStringsTableForLocaleIdentifier:v7];
    uint64_t v24 = [v11 spokenStringPermutationsOfLanguageModelDictionary:v12 stringsTable:v23 restrictPermutationsToShortestAndLongest:1];
    if ([v24 count])
    {
      uint64_t v10 = [(CACPreferences *)self _mutablePropertiesForIdentifier:v6 create:1];
      [v10 setObject:v24 forKey:@"BuiltInStrings"];
      uint64_t v25 = [NSString stringWithFormat:@"%@.search", v6];
      id v26 = [v23 objectForKey:v25];

      if (v26) {
        [v10 setObject:v26 forKey:@"SearchAlternates"];
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
LABEL_31:

  return v10;
}

- (void)setProperties:(id)a3 forCommandIdentifier:(id)a4
{
}

- (void)setProperties:(id)a3 forCommandIdentifier:(id)a4 client:(BOOL)a5
{
  BOOL v19 = a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v17 = a4;
  uint64_t v18 = self;
  id v8 = -[CACPreferences _mutablePropertiesForIdentifier:create:](self, "_mutablePropertiesForIdentifier:create:");
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = [v7 allKeys];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v15 = [v7 objectForKey:v14];
        uint64_t v16 = [MEMORY[0x263EFF9D0] null];

        if (v15 == v16) {
          [v8 removeObjectForKey:v14];
        }
        else {
          [v8 setObject:v15 forKey:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  [(CACPreferences *)v18 _setProperties:v8 forIdentifier:v17 client:v19];
}

- (void)removePropertiesForCommandIdentifier:(id)a3
{
}

- (id)uniqueCustomCommandIdentifier
{
  BOOL v3 = objc_msgSend(NSString, "stringWithFormat:", @"Custom.%lf", CFAbsoluteTimeGetCurrent());
  id v4 = [(CACPreferences *)self _propertiesForIdentifier:v3];

  if (v4)
  {
    do
    {
      char v5 = objc_msgSend(NSString, "stringWithFormat:", @"Custom.%lf", CFAbsoluteTimeGetCurrent());

      id v6 = [(CACPreferences *)self _propertiesForIdentifier:v5];

      BOOL v3 = v5;
    }
    while (v6);
  }
  else
  {
    char v5 = v3;
  }
  return v5;
}

- (void)beginPropertyTransaction
{
  if (!self->_propertyTransactions)
  {
    BOOL v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    propertyTransactions = self->_propertyTransactions;
    self->_propertyTransactions = v3;
  }
  id v5 = [MEMORY[0x263EFF9C0] set];
  [(NSMutableArray *)self->_propertyTransactions insertObject:v5 atIndex:0];
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
}

- (void)_propertyTransactionSynchronize
{
  if (!self->_propertyTransactions) {
    CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__CACPreferences__propertyTransactionSynchronize__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  if (_propertyTransactionSynchronize_sSetUpDefaultCommandSettings != -1) {
    dispatch_once(&_propertyTransactionSynchronize_sSetUpDefaultCommandSettings, block);
  }
}

uint64_t __49__CACPreferences__propertyTransactionSynchronize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _writeDefaultCommandSettingsIfNecessary];
}

- (void)_propertyTransactionPostNotification:(id)a3 identifier:(id)a4
{
  name = (__CFString *)a3;
  id v6 = a4;
  id v7 = [(NSMutableArray *)self->_propertyTransactions objectAtIndex:0];
  id v8 = v7;
  if (v7)
  {
    [v7 addObject:name];
  }
  else
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, name, v6, 0, 1u);
  }
}

- (void)endPropertyTransaction
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
  BOOL v3 = [(NSMutableArray *)self->_propertyTransactions objectAtIndex:0];
  if (v3)
  {
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_500];
    [(NSMutableArray *)self->_propertyTransactions removeObjectAtIndex:0];
    if (![(NSMutableArray *)self->_propertyTransactions count])
    {
      propertyTransactions = self->_propertyTransactions;
      self->_propertyTransactions = 0;
    }
  }
  MEMORY[0x270F9A758]();
}

void __40__CACPreferences_endPropertyTransaction__block_invoke(uint64_t a1, void *a2)
{
  name = a2;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (id)_allPropertyIdentifiers
{
  [(CACPreferences *)self _propertyTransactionSynchronize];
  CFArrayRef v2 = CFPreferencesCopyKeyList(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  return v2;
}

- (id)_propertiesForIdentifier:(id)a3
{
  id v4 = (__CFString *)a3;
  [(CACPreferences *)self _propertyTransactionSynchronize];
  id v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");

  return v5;
}

- (id)_mutablePropertiesForIdentifier:(id)a3 create:(BOOL)a4
{
  uint64_t v5 = [(CACPreferences *)self _propertiesForIdentifier:a3];
  id v6 = (void *)v5;
  if (a4 || v5)
  {
    id v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v5];
    id v8 = [v7 objectForKey:@"Enabled"];

    if (!v8) {
      [v7 setObject:MEMORY[0x263EFFA88] forKey:@"Enabled"];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_setProperties:(id)a3 forIdentifier:(id)a4 client:(BOOL)a5
{
  BOOL v5 = a5;
  id v19 = a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = [v19 objectForKey:@"Enabled"];
  uint64_t v10 = v9;
  if (v9 && [v9 BOOLValue])
  {
    id v11 = (id)[v19 mutableCopy];

    [v11 removeObjectForKey:@"Enabled"];
    uint64_t v12 = v19;
    uint64_t v13 = v11;
  }
  else
  {
    id v11 = 0;
    uint64_t v12 = v19;
    uint64_t v13 = v19;
  }
  uint64_t v14 = [v12 objectForKey:@"CustomType"];

  if (v14)
  {
    if (!v11)
    {
      id v11 = (id)[v19 mutableCopy];

      uint64_t v13 = v11;
    }
    uint64_t v15 = [MEMORY[0x263EFF910] date];
    [v11 setObject:v15 forKey:@"CustomModifyDate"];
  }
  if ([v13 count]) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = 0;
  }
  CFPreferencesSetAppValue(v8, v16, @"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
  [(CACPreferences *)self _propertyTransactionSynchronize];
  if (v5) {
    id v17 = @"CACNotificationClientCommandsSettingsChanged";
  }
  else {
    id v17 = @"CACNotificationCommandsSettingsChanged";
  }
  if (v5) {
    uint64_t v18 = v8;
  }
  else {
    uint64_t v18 = 0;
  }
  [(CACPreferences *)self _propertyTransactionPostNotification:v17 identifier:v18];
}

- (void)_writeDefaultCommandSettingsIfNecessary
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc(NSDictionary);
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v4 = [v3 pathForResource:@"DefaultCommandSettings" ofType:@"plist"];
  BOOL v5 = (void *)[v2 initWithContentsOfFile:v4];

  id v6 = [v5 allKeys];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
    CFArrayRef v8 = CFPreferencesCopyKeyList(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = objc_msgSend(v5, "allKeys", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      char v12 = 0;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v9);
          }
          CFStringRef v15 = *(const __CFString **)(*((void *)&v17 + 1) + 8 * i);
          if (([(__CFArray *)v8 containsObject:v15] & 1) == 0)
          {
            uint64_t v16 = [v5 objectForKey:v15];
            CFPreferencesSetAppValue(v15, v16, @"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");

            char v12 = 1;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);

      if (v12) {
        CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
      }
    }
    else
    {
    }
  }
}

+ (id)_builtinCommandsCatalogURL
{
  id v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 URLForResource:@"BuiltinCommandsCatalog" withExtension:@"plist"];

  return v3;
}

+ (id)_suffixedURLsForURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v23 = (id)objc_opt_new();
  uint64_t v4 = [v3 URLByDeletingLastPathComponent];
  uint64_t v24 = [v3 pathExtension];
  BOOL v5 = [v3 URLByDeletingPathExtension];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v22 = (void *)v4;
  uint64_t v7 = [v6 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:0];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v12 path];
        uint64_t v14 = [v3 path];
        char v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          uint64_t v16 = [v12 path];
          long long v17 = [v5 path];
          int v18 = [v16 hasPrefix:v17];

          if (v18)
          {
            uint64_t v19 = [v12 pathExtension];
            long long v20 = (void *)v19;
            if (!(v24 | v19)
              || (v24 == 0) == (v19 == 0) && [(id)v24 isEqualToString:v19])
            {
              [v23 addObject:v12];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v23;
}

- (id)builtInCommandsTable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__CACPreferences_builtInCommandsTable__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  if (builtInCommandsTable_builtInCommandsTableCacheSetup != -1) {
    dispatch_once(&builtInCommandsTable_builtInCommandsTableCacheSetup, block);
  }
  return self->_builtInCommandsTableCache;
}

void __38__CACPreferences_builtInCommandsTable__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = [(id)objc_opt_class() _builtinCommandsCatalogURL];
  uint64_t v3 = [objc_alloc(NSDictionary) initWithContentsOfURL:v2];
  uint64_t v4 = CACLogPreferences();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __38__CACPreferences_builtInCommandsTable__block_invoke_cold_1(v2);
  }

  uint64_t v18 = a1;
  long long v17 = v2;
  BOOL v5 = [(id)objc_opt_class() _suffixedURLsForURL:v2];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = (void *)v3;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        char v12 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v11];
        uint64_t v13 = CACLogPreferences();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v11 lastPathComponent];
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = v14;
          _os_log_impl(&dword_238377000, v13, OS_LOG_TYPE_DEFAULT, "Loaded commands override table: %@", buf, 0xCu);
        }
        uint64_t v3 = [v12 dictionaryByMergingEntriesFromDictionary:v10];

        ++v9;
        uint64_t v10 = (void *)v3;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }
  uint64_t v15 = *(void *)(v18 + 32);
  uint64_t v16 = *(void **)(v15 + 8);
  *(void *)(v15 + 8) = v3;
}

- (id)builtInCommandsStringsTableForLocaleIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)v5->_builtInLocalizedCommandStringsByLocaleIdentifier objectForKey:v4];
  objc_sync_exit(v5);

  id v20 = (id)v6;
  if (!v6)
  {
    id v19 = v4;
    id v20 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v7 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
    uint64_t v8 = [v7 commandStringsTableForLocaleIdentifier:v4];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [(id)AllValidCommandParameterIdentifiers() allObjects];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v14 = [MEMORY[0x263F78BC8] activeTargetTypes];
          uint64_t v15 = [v8 descriptionStringForCommandIdentifier:v13 descriptionType:@"NAME" targetTypes:v14];

          if ([v15 length]) {
            [v20 setObject:v15 forKey:v13];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v10);
    }

    if (v20)
    {
      uint64_t v16 = v5;
      objc_sync_enter(v16);
      [(NSMutableDictionary *)v5->_builtInLocalizedCommandStringsByLocaleIdentifier setObject:v20 forKey:v19];
      id v17 = v20;
      objc_sync_exit(v16);
    }
    id v4 = v19;
  }

  return v20;
}

- (void)_flushBuiltInCommandsStringsTable
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_builtInLocalizedCommandStringsByLocaleIdentifier removeAllObjects];
  objc_sync_exit(obj);
}

- (id)availableCommandSetIdentifiers
{
  return (id)[MEMORY[0x263F78BE0] allCollectionIdentifiers];
}

- (id)displayNameForCommandSetIdentifier:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  BOOL v5 = [v3 bundleForClass:objc_opt_class()];
  uint64_t v6 = [NSString stringWithFormat:@"%@.DisplayName", v4];

  uint64_t v7 = [v5 localizedStringForKey:v6 value:&stru_26EB332F0 table:0];

  return v7;
}

- (BOOL)hidePreferencesForCommandSetIdentifier:(id)a3
{
  return 0;
}

- (id)enabledCommandIdentifiersForCommandSetIdentifier:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CACPreferences *)self bestLocaleIdentifier];
  uint64_t v6 = [(CACPreferences *)self _commandIdentifiersForCommandSetIdentifier:v4 localeIdentifier:v5 enabledOnly:1];

  return v6;
}

- (id)commandIdentifiersForCommandSetIdentifier:(id)a3 localeIdentifier:(id)a4
{
  return [(CACPreferences *)self _commandIdentifiersForCommandSetIdentifier:a3 localeIdentifier:a4 enabledOnly:0];
}

- (id)_commandIdentifiersForCommandSetIdentifier:(id)a3 localeIdentifier:(id)a4 enabledOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v28 = [MEMORY[0x263EFF980] array];
  if ([v8 isEqualToString:@"Custom"])
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = [(CACPreferences *)self _allPropertyIdentifiers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v26 = v9;
      id v27 = v8;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v16 = [(CACPreferences *)self _propertiesForIdentifier:v15];
          id v17 = [v16 objectForKey:@"CustomType"];

          if (v17
            && (!v5 || [(CACPreferences *)self isEnabledForCommandIdentifier:v15]))
          {
            [v28 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v12);
      id v9 = v26;
      id v8 = v27;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x263F78BE0] collectionWithIdentifier:v8];
    id v19 = [v18 commandIdentifiersForCurrentDevice];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = v19;
    uint64_t v20 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v10);
          }
          uint64_t v24 = *(void *)(*((void *)&v29 + 1) + 8 * j);
          if ([(CACPreferences *)self isCommandIdentifier:v24 availableForLocaleIdentifier:v9]&& (!v5 || [(CACPreferences *)self isEnabledForCommandIdentifier:v24]))
          {
            [v28 addObject:v24];
          }
        }
        uint64_t v21 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v21);
    }
  }
  return v28;
}

- (BOOL)isCommandIdentifier:(id)a3 availableForLocaleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
  id v8 = [v7 commandStringsTableForLocaleIdentifier:v6];

  if (objc_opt_respondsToSelector()) {
    char v9 = [v8 isSupportedCommandIdentifier:v5 forLocaleIdentifier:v6];
  }
  else {
    char v9 = 1;
  }

  return v9;
}

- (id)setOfApplicationIdentifiersUsedByCustomCommands
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v13 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v3 = [(CACPreferences *)self _allPropertyIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [(CACPreferences *)self _propertiesForIdentifier:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        char v9 = [v8 objectForKey:@"CustomType"];

        if (v9)
        {
          id v10 = [v8 objectForKey:@"CustomScope"];
          uint64_t v11 = v10;
          if (v10 && ([v10 isEqualToString:@"com.apple.speech.SystemWideScope"] & 1) == 0) {
            [v13 addObject:v11];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v13;
}

- (id)allCustomCommandProperties
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [(CACPreferences *)self _allPropertyIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [(CACPreferences *)self _propertiesForIdentifier:v9];
        uint64_t v11 = [v10 objectForKey:@"CustomType"];

        if (v11) {
          [v3 setObject:v10 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)addOrUpdateCommandPropertiesFromImportedTable:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(v4, "allKeys", 0);
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
        CFStringRef v10 = *(const __CFString **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = [v4 objectForKey:v10];
        CFPreferencesSetAppValue(v10, v11, @"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [(CACPreferences *)self _propertyTransactionSynchronize];
  [(CACPreferences *)self _propertyTransactionPostNotification:@"CACNotificationCommandsSettingsChanged" identifier:0];
}

- (void)deleteAllCustomCommandEntries
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(CACPreferences *)self allCustomCommandProperties];
  id v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        CFPreferencesSetAppValue(*(CFStringRef *)(*((void *)&v9 + 1) + 8 * v8++), 0, @"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands");
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [(CACPreferences *)self _propertyTransactionSynchronize];
  [(CACPreferences *)self _propertyTransactionPostNotification:@"CACNotificationCommandsSettingsChanged" identifier:0];
}

- (BOOL)phoneticVocabularyShowDebugUI
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACPhoneticVocabularyShowDebugUI", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setPhoneticVocabularyShowDebugUI:(BOOL)a3
{
  uint64_t v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    uint64_t v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACPhoneticVocabularyShowDebugUI", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (BOOL)phoneticVocabularySkipPickingPronunciation
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CACPhoneticVocabularySkipPickingPronunciation", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)setPhoneticVocabularySkipPickingPronunciation:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACPhoneticVocabularySkipPickingPronunciation", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (BOOL)phoneticVocabularyShowUserFacingIPAToggle
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACPhoneticVocabularyShowUserFacingIPAToggle", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setPhoneticVocabularyShowUserFacingIPAToggle:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACPhoneticVocabularyShowUserFacingIPAToggle", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (BOOL)phoneticVocabularyShowUserFacingIPA
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACPhoneticVocabularyShowUserFacingIPA", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void)setPhoneticVocabularyShowUserFacingIPA:(BOOL)a3
{
  BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (!a3) {
    BOOL v3 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"CACPhoneticVocabularyShowUserFacingIPA", *v3, @"com.apple.speech.SpeechRecognitionCommandAndControl");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl");
}

- (double)lastCommandDate
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACLastCommandDate", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (!v2) {
    return 0.0;
  }
  BOOL v3 = (void *)v2;
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    double v4 = v5;
  }
  CFRelease(v3);
  return v4;
}

- (void)setLastCommandDate:(double)a3
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"CACLastCommandDate", (CFPropertyListRef)[NSNumber numberWithDouble:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
}

- (int64_t)correctionCount
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACCorrectionCount", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (v2)
  {
    BOOL v3 = (void *)v2;
    double v4 = 0.0;
    if (objc_opt_respondsToSelector()) {
      double v4 = (double)(int)[v3 intValue];
    }
    CFRelease(v3);
  }
  else
  {
    return (uint64_t)0.0;
  }
  return (uint64_t)v4;
}

- (void)setCorrectionCount:(int64_t)a3
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"CACCorrectionCount", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
}

- (int64_t)messageTracesSinceLastReport
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACMessageTracesSinceLastReport", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (v2)
  {
    BOOL v3 = (void *)v2;
    double v4 = 0.0;
    if (objc_opt_respondsToSelector()) {
      double v4 = (double)(int)[v3 intValue];
    }
    CFRelease(v3);
  }
  else
  {
    return (uint64_t)0.0;
  }
  return (uint64_t)v4;
}

- (void)setMessageTracesSinceLastReport:(int64_t)a3
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"CACMessageTracesSinceLastReport", (CFPropertyListRef)[NSNumber numberWithInteger:a3], @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
}

- (id)commandCounts
{
  CFPropertyListRef v2 = [MEMORY[0x263EFF9A0] dictionary];
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"CACCommandCounts", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (v3)
  {
    double v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID()) {
      [v2 addEntriesFromDictionary:v4];
    }
    CFRelease(v4);
  }
  return v2;
}

- (void)setCommandCounts:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(@"CACCommandCounts", v3, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");

    CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  }
}

- (id)targetApplicationCounts
{
  CFPropertyListRef v2 = [MEMORY[0x263EFF9A0] dictionary];
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"CACTargetApplicationCounts", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (v3)
  {
    double v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFDictionaryGetTypeID()) {
      [v2 addEntriesFromDictionary:v4];
    }
    CFRelease(v4);
  }
  return v2;
}

- (void)setTargetApplicationCounts:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(@"CACTargetApplicationCounts", v3, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");

    CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  }
}

- (id)recentCommandEntries
{
  CFPropertyListRef v2 = [MEMORY[0x263EFF980] array];
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v3 = CFPreferencesCopyAppValue(@"CACRecentCommands", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  if (v3)
  {
    double v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID()) {
      [v2 addObjectsFromArray:v4];
    }
    CFRelease(v4);
  }
  return v2;
}

- (void)setRecentCommandEntries:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    _CFPreferencesSetFileProtectionClass();
    CFPreferencesSetAppValue(@"CACRecentCommands", v3, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");

    CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  }
}

- (id)divertedCommandsLogPath
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACDivertCommandsToLogPath", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  id v3 = (void *)v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFStringGetTypeID())
    {
      CFRelease(v3);
      id v3 = 0;
    }
  }
  return v3;
}

- (BOOL)forceAllCommandsToBeActive
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  Boolean keyExistsAndHasValidFormat = 0;
  return CFPreferencesGetAppBooleanValue(@"CACForceAllCommandsToBeActive", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log", &keyExistsAndHasValidFormat) != 0;
}

- (BOOL)usingAutomationMode
{
  return CFPreferencesGetAppIntegerValue(@"RXDebugAutomationMode", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0) > 0;
}

- (id)externalContextOverrideFilePath
{
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"CACExternalContextOverrideFilePath", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  id v3 = (void *)v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFStringGetTypeID())
    {
      CFRelease(v3);
      id v3 = 0;
    }
  }
  return v3;
}

- (id)rawCustomCommandsPreferencesDictionary
{
  CFDictionaryRef v2 = CFPreferencesCopyMultiple(0, @"com.apple.speech.SpeechRecognitionCommandAndControl.CustomCommands", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  return v2;
}

- (void)removeUserCommandHistory
{
  _CFPreferencesSetFileProtectionClass();
  CFPreferencesSetAppValue(@"CACRecentCommands", 0, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPreferencesSetAppValue(@"CACCommandCounts", 0, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPreferencesSetAppValue(@"CACUserHintsHistory", 0, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
  CFPreferencesAppSynchronize(@"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
}

- (BOOL)shouldDisableDeviceIdleTimer
{
  CFPreferencesAppSynchronize(@"com.apple.SpeechRecognitionCore.Utility");
  Boolean keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(@"CACPrefsUtilityDisableDeviceIdleTimerKey", @"com.apple.SpeechRecognitionCore.Utility", &keyExistsAndHasValidFormat))
  {
    BOOL v2 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    BOOL v2 = 1;
  }
  return !v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyTransactions, 0);
  objc_storeStrong((id *)&self->_builtInLocalizedCommandStringsByLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_builtInCommandsTableCache, 0);
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_1(void *a1, NSObject *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  CFTypeID v5 = [a1 allObjects];
  *a3 = sel_compare_;
  uint64_t v6 = objc_msgSend(v5, "sortedArrayUsingSelector:");
  int v7 = 138412290;
  uint64_t v8 = v6;
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "supportedDeviceLocaleIDs: %@", (uint8_t *)&v7, 0xCu);
}

void __49__CACPreferences_userSelectableLocaleIdentifiers__block_invoke_cold_2(void *a1)
{
  v1 = [a1 allObjects];
  BOOL v2 = [v1 sortedArrayUsingSelector:sel_compare_];
  OUTLINED_FUNCTION_0_5(&dword_238377000, v3, v4, "supportedQuasarLocaleIDs: %@", v5, v6, v7, v8, 2u);
}

void __38__CACPreferences_builtInCommandsTable__block_invoke_cold_1(void *a1)
{
  v1 = [a1 lastPathComponent];
  OUTLINED_FUNCTION_0_5(&dword_238377000, v2, v3, "Loaded commands table: %@", v4, v5, v6, v7, 2u);
}

@end