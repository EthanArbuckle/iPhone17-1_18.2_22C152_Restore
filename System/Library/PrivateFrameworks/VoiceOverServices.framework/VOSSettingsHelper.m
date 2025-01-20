@interface VOSSettingsHelper
+ (id)activitiesFormatter;
+ (id)audioDuckingMode;
+ (id)brailleInputOutputFormatter;
+ (id)brailleTableFormatter;
+ (id)durationFormatter;
+ (id)gestureDirectionFormatter;
+ (id)mediaDescriptionsFormatter;
+ (id)navigateImagesFormatter;
+ (id)navigationStyleFormatter;
+ (id)percentageFormatter;
+ (id)phoneticFeedbackFormatter;
+ (id)punctuationFormatter;
+ (id)sharedInstance;
+ (id)typingFeedbackFormatter;
+ (id)typingStyleFormatter;
+ (id)voiceFormatterForEnabledVoiceCodes:(id)a3;
- (BOOL)isItemSupported:(id)a3;
- (BOOL)isSlideToTypeEnabled;
- (BOOL)itemIsSupportedForPlatform:(id)a3;
- (NSArray)enabledVoices;
- (double)sliderMaxValue;
- (double)sliderMinValue;
- (id)_enabledVoices;
- (id)_formatterForItem:(id)a3;
- (id)_init;
- (id)_volumeForActiveVoice;
- (id)formattedValue:(id)a3 withItem:(id)a4;
- (id)identifierForItem:(id)a3;
- (id)nameForItem:(id)a3;
- (id)possibleValuesForSettingsItem:(id)a3;
- (id)scaledValue:(id)a3 withItem:(id)a4;
- (id)userSettingsItems;
- (id)valueForSettingsItem:(id)a3;
- (void)_setVolumeForActiveVoice:(double)a3;
- (void)_turnOffBrailleIOSyncIfNeeded;
- (void)saveUserSettingsItems:(id)a3;
- (void)setEnabledVoices:(id)a3;
- (void)setNextValueForItem:(id)a3 inDirection:(int64_t)a4;
- (void)setSlideToTypeEnabled:(BOOL)a3;
- (void)setSliderMaxValue:(double)a3;
- (void)setSliderMinValue:(double)a3;
- (void)setValue:(id)a3 forSettingsItem:(id)a4;
@end

@implementation VOSSettingsHelper

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance__Shared;

  return v2;
}

uint64_t __35__VOSSettingsHelper_sharedInstance__block_invoke()
{
  sharedInstance__Shared = [[VOSSettingsHelper alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)VOSSettingsHelper;
  v2 = [(VOSSettingsHelper *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(VOSSettingsHelper *)v2 _enabledVoices];
    [(VOSSettingsHelper *)v3 setEnabledVoices:v4];

    [(VOSSettingsHelper *)v3 setSliderMaxValue:1.0];
    [(VOSSettingsHelper *)v3 setSliderMinValue:0.0];
  }
  return v3;
}

- (id)_enabledVoices
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F228D0] sharedInstance];
  v4 = [v3 dialectForSystemLanguage];
  uint64_t v5 = [v4 specificLanguageID];

  objc_super v6 = [MEMORY[0x263F22938] sharedInstance];
  v7 = [v6 voiceOverDefaultVoiceSelections];
  v8 = [v7 objectForKeyedSubscript:v5];

  v9 = [MEMORY[0x263F7EEA0] sharedInstance];
  v10 = [v8 voiceId];
  v11 = [v9 speechVoiceWithVoiceId:v10];

  if (!v8 || ![v11 isInstalled])
  {
    v13 = [MEMORY[0x263F22938] sharedInstance];
    v12 = [v13 speechVoiceIdentifierForLanguage:v5 sourceKey:*MEMORY[0x263F226D8] exists:0];

    if (!v12) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = [v8 voiceId];
  if (v12) {
LABEL_6:
  }
    [v2 addObject:v12];
LABEL_7:
  v26 = v11;
  v27 = v8;
  v28 = (void *)v5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v14 = [MEMORY[0x263F22938] sharedInstance];
  v15 = [v14 voiceOverVoiceRotors];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        v20 = v12;
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v12 = [v21 identifier];

        if (v12)
        {
          v22 = [v21 voiceId];
          v23 = [v9 speechVoiceWithVoiceId:v22];
          int v24 = [v23 isInstalled];

          if (v24) {
            [v2 addObject:v12];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v17);
  }

  return v2;
}

- (BOOL)isSlideToTypeEnabled
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"KeyboardContinuousPathEnabled", @"com.apple.keyboard.ContinuousPath", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (void)setSlideToTypeEnabled:(BOOL)a3
{
  BOOL v3 = [NSNumber numberWithBool:a3];
  CFPreferencesSetValue(@"KeyboardContinuousPathEnabled", v3, @"com.apple.keyboard.ContinuousPath", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleKeyboardsContinuousPathSettingsChangedNotification", 0, 0, 1u);
}

- (BOOL)itemIsSupportedForPlatform:(id)a3
{
  return 1;
}

- (id)userSettingsItems
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v28 = [MEMORY[0x263EFF980] array];
  BOOL v3 = [MEMORY[0x263F22938] sharedInstance];
  v4 = [v3 voiceOverQuickSettingsItems];

  v26 = [v4 axMapObjectsUsingBlock:&__block_literal_global_282_0];
  v25 = +[VOSSettingsItem allSettingsItems];
  uint64_t v5 = +[VOSSettingsItem settingsIDtoItemMap:](VOSSettingsItem, "settingsIDtoItemMap:");
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v11 = [v10 objectForKeyedSubscript:@"Item"];
        v12 = [v5 objectForKeyedSubscript:v11];
        if ([(VOSSettingsHelper *)self itemIsSupportedForPlatform:v12])
        {
          if (v12)
          {
            v41[0] = v12;
            v40[0] = @"Item";
            v40[1] = @"Included";
            v13 = objc_msgSend(v10, "objectForKeyedSubscript:");
            v41[1] = v13;
            v14 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
            [v28 addObject:v14];
          }
          else
          {
            v13 = VOTLogCommon();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = v11;
              _os_log_impl(&dword_21C3F9000, v13, OS_LOG_TYPE_DEFAULT, "Persistent QuickSettings identifier not found '%@'. skipping", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v44 count:16];
    }
    while (v7);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v25;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v30 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if ([(VOSSettingsHelper *)self itemIsSupportedForPlatform:v20])
        {
          v21 = [v20 identifier];
          char v22 = [v26 containsObject:v21];

          if ((v22 & 1) == 0)
          {
            v37[0] = @"Item";
            v37[1] = @"Included";
            v38[0] = v20;
            v38[1] = &unk_26CC93780;
            v23 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
            [v28 addObject:v23];
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v29 objects:v39 count:16];
    }
    while (v17);
  }

  return v28;
}

uint64_t __38__VOSSettingsHelper_userSettingsItems__block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:@"Item"];
}

- (void)saveUserSettingsItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        v20[0] = @"Included";
        v10 = [v9 objectForKeyedSubscript:@"Included"];
        v20[1] = @"Item";
        v21[0] = v10;
        v11 = [v9 objectForKeyedSubscript:@"Item"];
        v12 = [v11 identifier];
        v21[1] = v12;
        v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
        [v4 addObject:v13];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }

  v14 = [MEMORY[0x263F22938] sharedInstance];
  [v14 setVoiceOverQuickSettingsItems:v4];
}

- (void)setNextValueForItem:(id)a3 inDirection:(int64_t)a4
{
  id v39 = a3;
  uint64_t v6 = [v39 itemType];
  if (!v6)
  {
    uint64_t v23 = NSNumber;
    uint64_t v7 = [(VOSSettingsHelper *)self valueForSettingsItem:v39];
    uint64_t v24 = objc_msgSend(v23, "numberWithInt:", objc_msgSend(v7, "BOOLValue") ^ 1);
LABEL_44:
    v38 = (void *)v24;
    [(VOSSettingsHelper *)self setValue:v24 forSettingsItem:v39];

    goto LABEL_45;
  }
  if (v6 == 1)
  {
    v11 = [(VOSSettingsHelper *)self valueForSettingsItem:v39];
    [v11 floatValue];
    double v13 = v12;

    id v14 = +[VOSSettingsItem SpeakingRate];
    BOOL v15 = v14 == v39;

    id v16 = +[VOSSettingsItem BrailleAutoAdvanceDuration];

    if (v16 == v39)
    {
      long long v17 = +[VOSSettingsHelper sharedInstance];
      long long v18 = [NSNumber numberWithDouble:v13];
      long long v19 = [v17 scaledValue:v18 withItem:v39];
      [v19 doubleValue];
      double v13 = v20;
    }
    id v21 = +[VOSSettingsItem DuckingAmount];

    if (v21 == v39)
    {
      [(VOSSettingsHelper *)self setSliderMaxValue:0.99];
      [(VOSSettingsHelper *)self setSliderMinValue:0.01];
      double v22 = 0.05;
    }
    else
    {
      double v22 = dbl_21C4362E0[v15];
    }
    id v25 = +[VOSSettingsItem Volume];

    if (v25 == v39)
    {
      [(VOSSettingsHelper *)self setSliderMaxValue:1.0];
      [(VOSSettingsHelper *)self setSliderMinValue:0.00999999978];
      double v27 = dbl_21C4362F0[a4 == 1] + v13;
      double v22 = 0.05;
    }
    else
    {
      double v26 = -v22;
      if (a4 == 1) {
        double v26 = v22;
      }
      double v27 = v13 + v26;
      if (v21 != v39)
      {
        [(VOSSettingsHelper *)self sliderMinValue];
        if (v27 >= v28) {
          double v29 = v27;
        }
        else {
          double v29 = v28;
        }
        [(VOSSettingsHelper *)self sliderMaxValue];
        if (v29 < v30) {
          double v30 = v29;
        }
LABEL_39:
        uint64_t v7 = [NSNumber numberWithDouble:v30];
        [(VOSSettingsHelper *)self setValue:v7 forSettingsItem:v39];
        goto LABEL_45;
      }
    }
    [(VOSSettingsHelper *)self sliderMinValue];
    double v32 = v31;
    [(VOSSettingsHelper *)self sliderMaxValue];
    int v33 = (int)(v27 * 100.0);
    int v34 = (int)(v22 * 100.0);
    int v35 = v33 % v34;
    if (v33 % v34)
    {
      if (v34 >= 0) {
        int v36 = (int)(v22 * 100.0);
      }
      else {
        int v36 = v34 + 1;
      }
      if (v34 < 0) {
        int v34 = -v34;
      }
      if (v35 <= v36 >> 1) {
        int v34 = 0;
      }
      int v33 = v33 - v35 + v34;
    }
    double v37 = (double)v33 / 100.0;
    if (v37 <= v32) {
      double v37 = v32;
    }
    if (v37 <= v30) {
      double v30 = v37;
    }
    goto LABEL_39;
  }
  if (v6 != 2) {
    goto LABEL_46;
  }
  uint64_t v7 = [(VOSSettingsHelper *)self possibleValuesForSettingsItem:v39];
  uint64_t v8 = [(VOSSettingsHelper *)self valueForSettingsItem:v39];
  uint64_t v9 = [v7 indexOfObject:v8];

  if (!a4)
  {
    if (v9 <= 0) {
      uint64_t v9 = [v7 count];
    }
    uint64_t v10 = v9 - 1;
    goto LABEL_43;
  }
  if (a4 == 1)
  {
    if (v9 + 1 < (unint64_t)[v7 count]) {
      uint64_t v10 = v9 + 1;
    }
    else {
      uint64_t v10 = 0;
    }
LABEL_43:
    uint64_t v24 = [v7 objectAtIndexedSubscript:v10];
    goto LABEL_44;
  }
LABEL_45:

LABEL_46:
}

- (id)valueForSettingsItem:(id)a3
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[VOSSettingsItem Sounds];

  if (v5 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverSoundEffectsEnabled];
    goto LABEL_34;
  }
  id v6 = +[VOSSettingsItem AudioDucking];

  if (v6 == v4)
  {
    double v37 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v38 = [v35 voiceOverMediaDuckingMode];
LABEL_32:
    id v39 = [v37 numberWithLong:v38];
LABEL_35:
    v40 = v39;
LABEL_36:

    goto LABEL_37;
  }
  id v7 = +[VOSSettingsItem Pitch];

  if (v7 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverPitchChangeEnabled];
    goto LABEL_34;
  }
  id v8 = +[VOSSettingsItem DuckingAmount];

  if (v8 == v4)
  {
    v42 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    [v35 voiceOverMediaDuckingAmount];
LABEL_41:
    objc_msgSend(v42, "numberWithDouble:");
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  id v9 = +[VOSSettingsItem Volume];

  if (v9 == v4)
  {
    uint64_t v43 = [(VOSSettingsHelper *)self _volumeForActiveVoice];
LABEL_43:
    v40 = (void *)v43;
    goto LABEL_37;
  }
  id v10 = +[VOSSettingsItem SendToHDMI];

  if (v10 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverAudioFollowsHDMIAudio];
    goto LABEL_34;
  }
  id v11 = +[VOSSettingsItem SoundCurtain];

  if (v11 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverSoundCurtain];
    goto LABEL_34;
  }
  id v12 = +[VOSSettingsItem SpeakNotifications];

  if (v12 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverSpeakNotificationsEnabled];
    goto LABEL_34;
  }
  id v13 = +[VOSSettingsItem SpeakingRate];

  if (v13 == v4)
  {
    v44 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    [v35 voiceOverEffectiveSpeakingRate];
    objc_msgSend(v44, "numberWithFloat:");
    id v39 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  id v14 = +[VOSSettingsItem Voice];

  if (v14 == v4)
  {
    uint64_t v45 = [MEMORY[0x263F22938] sharedInstance];
    v46 = [v45 voiceOverCurrentRotorVoiceIdentifier];

    if (v46)
    {
      v47 = [(VOSSettingsHelper *)self enabledVoices];
      uint64_t v48 = [v47 indexOfObjectPassingTest:&__block_literal_global_294_0];

      if (v48 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v49 = 0;
      }
      else {
        uint64_t v49 = v48;
      }
    }
    else
    {
      uint64_t v49 = 0;
    }
    uint64_t v43 = [NSNumber numberWithUnsignedInteger:v49];
    goto LABEL_43;
  }
  id v15 = +[VOSSettingsItem Hints];

  if (v15 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverHintsEnabled];
    goto LABEL_34;
  }
  id v16 = +[VOSSettingsItem ScreenRecognition];

  if (v16 == v4)
  {
    v50 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    v51 = [v4 settingsData];
    v52 = [v51 frontmostAppIdentifier];
    v40 = objc_msgSend(v50, "numberWithInt:", objc_msgSend(v35, "automaticAccessibilityModeForBundleIdentifier:", v52) == 1);

LABEL_54:
    goto LABEL_36;
  }
  id v17 = +[VOSSettingsItem LiveRegions];

  if (v17 == v4)
  {
    v53 = [MEMORY[0x263F22938] sharedInstance];
    v54 = [v4 settingsData];
    v55 = [v54 frontmostAppIdentifier];
    if (v55)
    {
      int v35 = [v53 liveRegionStatusForWebOrApp:v55];
    }
    else
    {
      v67 = [v4 settingsData];
      v68 = [v67 webAreaURL];
      int v35 = [v53 liveRegionStatusForWebOrApp:v68];
    }
    v69 = NSNumber;
    if (v35) {
      uint64_t v70 = [v35 BOOLValue];
    }
    else {
      uint64_t v70 = 1;
    }
    id v39 = [v69 numberWithInt:v70];
    goto LABEL_35;
  }
  id v18 = +[VOSSettingsItem ImageDescriptions];

  if (v18 == v4)
  {
    v56 = [MEMORY[0x263F22938] sharedInstance];
    v57 = [v56 imageCaptioningDisabledApps];
    v58 = [v4 settingsData];
    v59 = [v58 frontmostAppIdentifier];
    int v60 = [v57 containsObject:v59];

    uint64_t v43 = [NSNumber numberWithInt:v60 ^ 1u];
    goto LABEL_43;
  }
  id v19 = +[VOSSettingsItem DirectTouch];

  if (v19 == v4)
  {
    v61 = [MEMORY[0x263F22938] sharedInstance];
    v62 = [v61 voiceOverDirectTouchEnabledApps];
    v63 = [v4 settingsData];
    v64 = [v63 frontmostAppIdentifier];
    v65 = [v62 objectForKeyedSubscript:v64];
    uint64_t v66 = [v65 BOOLValue];

    uint64_t v43 = [NSNumber numberWithBool:v66];
    goto LABEL_43;
  }
  id v20 = +[VOSSettingsItem RotorActionConfirmation];

  if (v20 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverSpeakActionConfirmation];
    goto LABEL_34;
  }
  id v21 = +[VOSSettingsItem BrailleAlerts];

  if (v21 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverBrailleAlertsEnabled];
    goto LABEL_34;
  }
  id v22 = +[VOSSettingsItem BrailleFormatting];

  if (v22 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverBrailleFormattingEnabled];
    goto LABEL_34;
  }
  id v23 = +[VOSSettingsItem Activities];

  if (v23 == v4)
  {
    v71 = [MEMORY[0x263F22938] sharedInstance];
    int v35 = [v71 voiceOverSelectedActivity];

    if (v35)
    {
      id v39 = v35;
      goto LABEL_35;
    }
    goto LABEL_73;
  }
  id v24 = +[VOSSettingsItem Punctuation];

  if (v24 == v4)
  {
    v72 = [MEMORY[0x263F22938] sharedInstance];
    int v35 = [v72 voiceOverPunctuationGroup];

    if (v35)
    {
      v51 = [MEMORY[0x263F220F8] sharedDatabase];
      v40 = [v51 punctuationGroupForUUID:v35];
      goto LABEL_54;
    }
LABEL_73:
    id v39 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_35;
  }
  id v25 = +[VOSSettingsItem NavigationStyle];

  if (v25 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverNavigationStyle];
LABEL_79:
    id v39 = [v73 numberWithInteger:v74];
    goto LABEL_35;
  }
  id v26 = +[VOSSettingsItem NavigateImages];

  if (v26 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverNavigateImagesOption];
    goto LABEL_79;
  }
  id v27 = +[VOSSettingsItem GestureDirection];

  if (v27 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverNavigationDirectionMode];
    goto LABEL_79;
  }
  id v28 = +[VOSSettingsItem PhoneticFeedback];

  if (v28 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverPhoneticsFeedback];
    goto LABEL_79;
  }
  id v29 = +[VOSSettingsItem MediaDescriptions];

  if (v29 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverDescribedMedia];
    goto LABEL_79;
  }
  id v30 = +[VOSSettingsItem CaptionPanel];

  if (v30 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 enableVoiceOverCaptions];
    goto LABEL_34;
  }
  id v31 = +[VOSSettingsItem LargeCursor];

  if (v31 == v4)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverLargeCursorEnabled];
    goto LABEL_34;
  }
  double v32 = [v4 identifier];
  int v33 = [v32 isEqualToString:@"ScreenCurtain"];

  if (v33)
  {
    int v34 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v36 = [v35 voiceOverScreenCurtainEnabled];
LABEL_34:
    id v39 = [v34 numberWithBool:v36];
    goto LABEL_35;
  }
  id v75 = +[VOSSettingsItem TypingStyle];

  if (v75 == v4)
  {
    double v37 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v38 = [v35 voiceOverTypingMode];
    goto LABEL_32;
  }
  id v76 = +[VOSSettingsItem SoftwareTypingFeedback];

  if (v76 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverSoftwareTypingFeedback];
    goto LABEL_79;
  }
  id v77 = +[VOSSettingsItem HardwareTypingFeedback];

  if (v77 == v4)
  {
    v73 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v74 = [v35 voiceOverHardwareTypingFeedback];
    goto LABEL_79;
  }
  id v78 = +[VOSSettingsItem SlideToType];

  if (v78 == v4)
  {
    int v34 = NSNumber;
    int v35 = +[VOSSettingsHelper sharedInstance];
    uint64_t v36 = [v35 isSlideToTypeEnabled];
    goto LABEL_34;
  }
  id v79 = +[VOSSettingsItem BrailleAutoAdvanceDuration];

  if (v79 == v4)
  {
    v42 = NSNumber;
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    [v35 voiceOverBrailleAutoAdvanceDuration];
    goto LABEL_41;
  }
  id v80 = +[VOSSettingsItem BrailleInput];

  if (v80 == v4)
  {
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    id v39 = [v35 voiceOverTouchBrailleDisplayInputTableIdentifier];
    goto LABEL_35;
  }
  id v81 = +[VOSSettingsItem BrailleOutput];

  if (v81 == v4)
  {
    int v35 = [MEMORY[0x263F22938] sharedInstance];
    id v39 = [v35 voiceOverTouchBrailleDisplayOutputTableIdentifier];
    goto LABEL_35;
  }
  v82 = VOTLogCommon();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    int v83 = 138412290;
    id v84 = v4;
    _os_log_impl(&dword_21C3F9000, v82, OS_LOG_TYPE_DEFAULT, "Unhandled pref getter for item: %@", (uint8_t *)&v83, 0xCu);
  }

  v40 = 0;
LABEL_37:

  return v40;
}

uint64_t __42__VOSSettingsHelper_valueForSettingsItem___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F22938];
  id v3 = a2;
  id v4 = [v2 sharedInstance];
  id v5 = [v4 voiceOverCurrentRotorVoiceIdentifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)setValue:(id)a3 forSettingsItem:(id)a4
{
  uint64_t v118 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[VOSSettingsItem Sounds];

  if (v8 == v7)
  {
    uint64_t v39 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverSoundEffectsEnabled:v39];
    goto LABEL_39;
  }
  id v9 = +[VOSSettingsItem AudioDucking];

  if (v9 == v7)
  {
    uint64_t v40 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverMediaDuckingMode:v40];
    goto LABEL_39;
  }
  id v10 = +[VOSSettingsItem DuckingAmount];

  if (v10 == v7)
  {
    [v6 doubleValue];
    double v42 = v41;
    uint64_t v43 = [MEMORY[0x263F22938] sharedInstance];
    [v43 setVoiceOverMediaDuckingAmount:v42];
    goto LABEL_33;
  }
  id v11 = +[VOSSettingsItem Pitch];

  if (v11 == v7)
  {
    uint64_t v44 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverPitchChangeEnabled:v44];
    goto LABEL_39;
  }
  id v12 = +[VOSSettingsItem Volume];

  if (v12 == v7)
  {
    [v6 floatValue];
    [(VOSSettingsHelper *)self _setVolumeForActiveVoice:v45];
    goto LABEL_40;
  }
  id v13 = +[VOSSettingsItem SendToHDMI];

  if (v13 == v7)
  {
    uint64_t v46 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverAudioFollowsHDMIAudio:v46];
    goto LABEL_39;
  }
  id v14 = +[VOSSettingsItem SoundCurtain];

  if (v14 == v7)
  {
    uint64_t v47 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverSoundCurtain:v47];
    goto LABEL_39;
  }
  id v15 = +[VOSSettingsItem SpeakNotifications];

  if (v15 == v7)
  {
    uint64_t v48 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverSpeakNotificationsEnabled:v48];
    goto LABEL_39;
  }
  id v16 = +[VOSSettingsItem SpeakingRate];

  if (v16 == v7)
  {
    [v6 floatValue];
    int v52 = v51;
    uint64_t v43 = [MEMORY[0x263F22938] sharedInstance];
    LODWORD(v53) = v52;
    [v43 setVoiceOverEffectiveSpeakingRate:v53];
    goto LABEL_33;
  }
  id v17 = +[VOSSettingsItem Voice];

  if (v17 == v7)
  {
    if (![v6 integerValue])
    {
      uint64_t v43 = [MEMORY[0x263F22938] sharedInstance];
      [v43 setVoiceOverCurrentRotorVoiceIdentifier:&stru_26CC86DC0];
      goto LABEL_33;
    }
    uint64_t v43 = -[NSArray objectAtIndexedSubscript:](self->_enabledVoices, "objectAtIndexedSubscript:", [v6 integerValue]);
    v54 = [MEMORY[0x263F22938] sharedInstance];
    [v54 setVoiceOverCurrentRotorVoiceIdentifier:v43];
    goto LABEL_44;
  }
  id v18 = +[VOSSettingsItem Hints];

  if (v18 == v7)
  {
    uint64_t v55 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverHintsEnabled:v55];
    goto LABEL_39;
  }
  id v19 = +[VOSSettingsItem RotorActionConfirmation];

  if (v19 == v7)
  {
    uint64_t v56 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverSpeakActionConfirmation:v56];
    goto LABEL_39;
  }
  id v20 = +[VOSSettingsItem BrailleAlerts];

  if (v20 == v7)
  {
    uint64_t v57 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverBrailleAlertsEnabled:v57];
    goto LABEL_39;
  }
  id v21 = +[VOSSettingsItem BrailleFormatting];

  if (v21 == v7)
  {
    uint64_t v58 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverBrailleFormattingEnabled:v58];
    goto LABEL_39;
  }
  id v22 = +[VOSSettingsItem ImageDescriptions];

  if (v22 == v7)
  {
    int v59 = [v6 BOOLValue];
    int v60 = [v7 settingsData];
    uint64_t v43 = [v60 frontmostAppIdentifier];

    if (v43)
    {
      v61 = [MEMORY[0x263F22938] sharedInstance];
      v62 = [v61 imageCaptioningDisabledApps];
      v63 = (void *)[v62 mutableCopy];

      if (!v63)
      {
        v63 = [MEMORY[0x263EFF980] array];
      }
      if (v59)
      {
        [v63 removeObject:v43];
      }
      else if (([v63 containsObject:v43] & 1) == 0)
      {
        [v63 addObject:v43];
      }
      v73 = [MEMORY[0x263F22938] sharedInstance];
      [v73 setImageCaptioningDisabledApps:v63];
    }
    goto LABEL_33;
  }
  id v23 = +[VOSSettingsItem DirectTouch];

  if (v23 == v7)
  {
    v64 = [v7 settingsData];
    uint64_t v43 = [v64 frontmostAppIdentifier];

    if (!v43) {
      goto LABEL_33;
    }
    v65 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v66 = [v65 voiceOverDirectTouchEnabledApps];
    v54 = (void *)[v66 mutableCopy];

    v67 = [v54 objectForKey:v43];
    LODWORD(v66) = [v67 BOOLValue];

    v68 = [NSNumber numberWithInt:v66 ^ 1];
    [v54 setObject:v68 forKeyedSubscript:v43];

    v69 = [MEMORY[0x263F22938] sharedInstance];
    [v69 setVoiceOverDirectTouchEnabledApps:v54];

    goto LABEL_44;
  }
  id v24 = +[VOSSettingsItem LiveRegions];

  if (v24 == v7)
  {
    uint64_t v70 = [v7 settingsData];
    v71 = [v70 frontmostAppIdentifier];
    v72 = v71;
    if (v71)
    {
      uint64_t v43 = v71;
    }
    else
    {
      v82 = [v7 settingsData];
      uint64_t v43 = [v82 webAreaURL];
    }
    int v83 = [MEMORY[0x263F22938] sharedInstance];
    v54 = [v83 liveRegionStatusForWebOrApp:v43];

    if (v54) {
      uint64_t v84 = [v54 BOOLValue] ^ 1;
    }
    else {
      uint64_t v84 = 0;
    }
    uint64_t v85 = [MEMORY[0x263F22938] sharedInstance];
    v86 = [NSNumber numberWithInt:v84];
    [v85 setLiveRegionStatusForWebOrApp:v43 status:v86];

LABEL_44:
    goto LABEL_33;
  }
  id v25 = +[VOSSettingsItem ScreenRecognition];

  if (v25 == v7)
  {
    uint64_t v74 = [MEMORY[0x263F22938] sharedInstance];
    id v75 = [v7 settingsData];
    id v76 = [v75 frontmostAppIdentifier];
    uint64_t v77 = [v74 automaticAccessibilityModeForBundleIdentifier:v76];

    BOOL v78 = v77 != 1;
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    id v79 = [v7 settingsData];
    id v80 = [v79 frontmostAppIdentifier];
    [v38 setAutomaticAccessibilityMode:v78 forBundleIdentifier:v80];

    goto LABEL_39;
  }
  id v26 = +[VOSSettingsItem NavigationStyle];

  if (v26 == v7)
  {
    uint64_t v81 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverNavigationStyle:v81];
    goto LABEL_39;
  }
  id v27 = +[VOSSettingsItem NavigateImages];

  if (v27 == v7)
  {
    uint64_t v87 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverNavigateImagesOption:v87];
    goto LABEL_39;
  }
  id v28 = +[VOSSettingsItem GestureDirection];

  if (v28 == v7)
  {
    uint64_t v88 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverNavigationDirectionMode:v88];
    goto LABEL_39;
  }
  id v29 = +[VOSSettingsItem PhoneticFeedback];

  if (v29 == v7)
  {
    uint64_t v89 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverPhoneticsFeedback:v89];
    goto LABEL_39;
  }
  id v30 = +[VOSSettingsItem MediaDescriptions];

  if (v30 == v7)
  {
    uint64_t v90 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverDescribedMedia:v90];
    goto LABEL_39;
  }
  id v31 = +[VOSSettingsItem CaptionPanel];

  if (v31 == v7)
  {
    uint64_t v91 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setEnableVoiceOverCaptions:v91];
    goto LABEL_39;
  }
  id v32 = +[VOSSettingsItem LargeCursor];

  if (v32 == v7)
  {
    uint64_t v92 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverLargeCursorEnabled:v92];
    goto LABEL_39;
  }
  id v33 = +[VOSSettingsItem Activities];

  if (v33 == v7)
  {
    v93 = [MEMORY[0x263EFF9D0] null];
    int v94 = [v6 isEqual:v93];

    if (v94)
    {

      id v6 = 0;
    }
    uint64_t v43 = [MEMORY[0x263F22938] sharedInstance];
    [v43 setVoiceOverSelectedActivity:v6];
    goto LABEL_33;
  }
  id v34 = +[VOSSettingsItem Punctuation];

  if (v34 == v7)
  {
    v95 = [MEMORY[0x263EFF9D0] null];
    int v96 = [v6 isEqual:v95];

    if (v96)
    {

      id v6 = 0;
    }
    uint64_t v43 = [v6 uuid];
    v54 = [MEMORY[0x263F22938] sharedInstance];
    [v54 setVoiceOverPunctuationGroup:v43];
    goto LABEL_44;
  }
  int v35 = [v7 identifier];
  int v36 = [v35 isEqualToString:@"ScreenCurtain"];

  if (v36)
  {
    uint64_t v37 = [v6 BOOLValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverScreenCurtainEnabled:v37];
LABEL_39:

    goto LABEL_40;
  }
  id v97 = +[VOSSettingsItem TypingStyle];

  if (v97 == v7)
  {
    uint64_t v104 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverTypingMode:v104];
    goto LABEL_39;
  }
  id v98 = +[VOSSettingsItem SoftwareTypingFeedback];

  if (v98 == v7)
  {
    uint64_t v105 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverSoftwareTypingFeedback:v105];
    goto LABEL_39;
  }
  id v99 = +[VOSSettingsItem HardwareTypingFeedback];

  if (v99 == v7)
  {
    uint64_t v106 = [v6 integerValue];
    uint64_t v38 = [MEMORY[0x263F22938] sharedInstance];
    [v38 setVoiceOverHardwareTypingFeedback:v106];
    goto LABEL_39;
  }
  id v100 = +[VOSSettingsItem SlideToType];

  if (v100 == v7)
  {
    uint64_t v107 = [v6 BOOLValue];
    uint64_t v38 = +[VOSSettingsHelper sharedInstance];
    [v38 setSlideToTypeEnabled:v107];
    goto LABEL_39;
  }
  id v101 = +[VOSSettingsItem BrailleAutoAdvanceDuration];

  if (v101 != v7)
  {
    id v102 = +[VOSSettingsItem BrailleInput];

    if (v102 == v7)
    {
      v112 = [v6 stringValue];
      v113 = [MEMORY[0x263F22938] sharedInstance];
      [v113 setVoiceOverTouchBrailleDisplayInputTableIdentifier:v112];
    }
    else
    {
      id v103 = +[VOSSettingsItem BrailleOutput];

      if (v103 != v7)
      {
        uint64_t v43 = VOTLogCommon();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v117 = v7;
          _os_log_impl(&dword_21C3F9000, v43, OS_LOG_TYPE_DEFAULT, "Unhandled pref setter for item: %@", buf, 0xCu);
        }
        goto LABEL_33;
      }
      v112 = [v6 stringValue];
      v113 = [MEMORY[0x263F22938] sharedInstance];
      [v113 setVoiceOverTouchBrailleDisplayOutputTableIdentifier:v112];
    }

    [(VOSSettingsHelper *)self _turnOffBrailleIOSyncIfNeeded];
    goto LABEL_40;
  }
  double v108 = *MEMORY[0x263F22AE8];
  double v109 = *MEMORY[0x263F22AE0] - *MEMORY[0x263F22AE8];
  [v6 floatValue];
  double v111 = v108 + v109 * v110;
  uint64_t v43 = [MEMORY[0x263F22938] sharedInstance];
  [v43 setVoiceOverBrailleAutoAdvanceDuration:v111];
LABEL_33:

LABEL_40:
  uint64_t v49 = [MEMORY[0x263F08A00] defaultCenter];
  v114 = @"SettingsItem";
  id v115 = v7;
  v50 = [NSDictionary dictionaryWithObjects:&v115 forKeys:&v114 count:1];
  [v49 postNotificationName:@"VOSDidUpdateValueForSettingsItemNotification" object:self userInfo:v50];
}

- (void)_turnOffBrailleIOSyncIfNeeded
{
  v2 = [MEMORY[0x263F22938] sharedInstance];
  id v3 = [v2 voiceOverTouchBrailleDisplayInputTableIdentifier];
  id v4 = [MEMORY[0x263F22938] sharedInstance];
  id v5 = [v4 voiceOverTouchBrailleDisplayOutputTableIdentifier];
  char v6 = [v3 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F22938] sharedInstance];
    [v7 setVoiceOverTouchBrailleDisplaySyncInputOutputTables:0];
  }
}

- (id)nameForItem:(id)a3
{
  id v3 = a3;
  id v4 = +[VOSSettingsItem PhoneticFeedback];

  if (v4 == v3)
  {
    id v31 = @"PHONETICS_TITLE";
    goto LABEL_43;
  }
  id v5 = +[VOSSettingsItem MediaDescriptions];

  if (v5 == v3)
  {
    id v31 = @"MEDIA_DESC_TITLE";
    goto LABEL_43;
  }
  id v6 = +[VOSSettingsItem Pitch];

  if (v6 == v3)
  {
    id v31 = @"PITCH_CHANGES_TITLE";
    goto LABEL_43;
  }
  id v7 = +[VOSSettingsItem RotorActionConfirmation];

  if (v7 == v3)
  {
    id v31 = @"ACTION_CONFIRMATION_EXTENDED";
    goto LABEL_43;
  }
  id v8 = +[VOSSettingsItem NavigateImages];

  if (v8 == v3)
  {
    id v31 = @"NAVIGATE_IMAGES_TITLE";
    goto LABEL_43;
  }
  id v9 = +[VOSSettingsItem GestureDirection];

  if (v9 == v3)
  {
    uint64_t v32 = AXVoiceOverRotorLocString();
LABEL_44:
    id v33 = (void *)v32;
    goto LABEL_45;
  }
  id v10 = +[VOSSettingsItem Activities];

  if (v10 == v3)
  {
    id v31 = @"ACTIVITIES";
    goto LABEL_43;
  }
  id v11 = +[VOSSettingsItem Punctuation];

  if (v11 == v3)
  {
    id v31 = @"PUNCTUATION";
    goto LABEL_43;
  }
  id v12 = +[VOSSettingsItem SoftwareTypingFeedback];

  if (v12 == v3)
  {
    id v31 = @"SOFTWARE_TYPING_FEEDBACK";
    goto LABEL_43;
  }
  id v13 = +[VOSSettingsItem HardwareTypingFeedback];

  if (v13 == v3)
  {
    id v31 = @"HARDWARE_TYPING_FEEDBACK";
    goto LABEL_43;
  }
  id v14 = +[VOSSettingsItem SendToHDMI];

  if (v14 == v3)
  {
    id v31 = @"ROUTE_TO_HDMI";
    goto LABEL_43;
  }
  id v15 = +[VOSSettingsItem SoundCurtain];

  if (v15 == v3)
  {
    id v31 = @"SOUND_CURTAIN";
    goto LABEL_43;
  }
  id v16 = +[VOSSettingsItem CaptionPanel];

  if (v16 == v3)
  {
    id v31 = @"CAPTION_PANEL";
    goto LABEL_43;
  }
  id v17 = +[VOSSettingsItem LargeCursor];

  if (v17 == v3)
  {
    id v31 = @"CURSOR_STYLE";
    goto LABEL_43;
  }
  id v18 = +[VOSSettingsItem SpeakNotifications];

  if (v18 == v3)
  {
    id v31 = @"ALWAYS_SPEAK_NOTIFICATIONS";
    goto LABEL_43;
  }
  id v19 = +[VOSSettingsItem BrailleAlerts];

  if (v19 == v3)
  {
    int v35 = @"BRAILLE_DISPLAY_TIMEOUT";
LABEL_50:
    uint64_t v32 = soft_AXUILocalizedStringForKey(v35);
    goto LABEL_44;
  }
  id v20 = +[VOSSettingsItem BrailleFormatting];

  if (v20 == v3)
  {
    int v35 = @"BRAILLE_TEXT_FORMATTING";
    goto LABEL_50;
  }
  id v21 = +[VOSSettingsItem ScreenRecognition];

  if (v21 == v3)
  {
    int v36 = [v3 settingsData];
    uint64_t v37 = [v36 frontmostAppIdentifier];

    if (v37)
    {
      uint64_t v38 = NSString;
      uint64_t v39 = @"VO_SCREEN_RECOGNITION_WITH_APP";
LABEL_61:
      uint64_t v43 = AXVoiceOverSettingsLocalizedStringForKey(v39);
      uint64_t v44 = [v3 settingsData];
      float v45 = [v44 frontmostAppIdentifier];
      v50 = AXAppNameForBundleId();
      id v33 = objc_msgSend(v38, "stringWithFormat:", v43, v50);

      goto LABEL_62;
    }
    id v31 = @"VO_SCREEN_RECOGNITION";
LABEL_43:
    uint64_t v32 = AXVoiceOverSettingsLocalizedStringForKey(v31);
    goto LABEL_44;
  }
  id v22 = +[VOSSettingsItem LiveRegions];

  if (v22 != v3)
  {
    id v23 = +[VOSSettingsItem ImageDescriptions];

    if (v23 != v3)
    {
      id v24 = +[VOSSettingsItem BrailleAutoAdvanceDuration];

      if (v24 == v3)
      {
        id v31 = @"BRAILLE_AUTO_ADVANCE_DURATION";
      }
      else
      {
        id v25 = +[VOSSettingsItem DirectTouch];

        if (v25 == v3)
        {
          id v31 = @"DIRECT_TOUCH";
        }
        else
        {
          id v26 = +[VOSSettingsItem Voice];

          if (v26 == v3)
          {
            id v31 = @"QUICK_SETTINGS_ITEM_VO_VOICE";
          }
          else
          {
            id v27 = +[VOSSettingsItem BrailleInput];

            if (v27 == v3)
            {
              id v31 = @"BRAILLE_INPUT";
            }
            else
            {
              id v28 = +[VOSSettingsItem BrailleOutput];

              if (v28 == v3)
              {
                id v31 = @"BRAILLE_OUTPUT";
              }
              else
              {
                id v29 = [v3 identifier];
                int v30 = [v29 isEqualToString:@"ScreenCurtain"];

                if (!v30)
                {
                  uint64_t v32 = [v3 localizedName];
                  goto LABEL_44;
                }
                id v31 = @"SCREEN_CURTAIN";
              }
            }
          }
        }
      }
      goto LABEL_43;
    }
    uint64_t v46 = [v3 settingsData];
    uint64_t v47 = [v46 frontmostAppIdentifier];

    if (v47)
    {
      uint64_t v38 = NSString;
      uint64_t v39 = @"VO_IMAGE_DESCRIPTIONS_WITH_APP";
      goto LABEL_61;
    }
    id v31 = @"VO_IMAGE_DESCRIPTIONS";
    goto LABEL_43;
  }
  uint64_t v40 = [v3 settingsData];
  double v41 = [v40 webAreaURL];

  if (!v41)
  {
    uint64_t v48 = [v3 settingsData];
    uint64_t v49 = [v48 frontmostAppIdentifier];

    if (v49)
    {
      uint64_t v38 = NSString;
      uint64_t v39 = @"VO_LIVE_REGION_WITH_APP";
      goto LABEL_61;
    }
    id v31 = @"VO_LIVE_REGION";
    goto LABEL_43;
  }
  double v42 = NSString;
  uint64_t v43 = AXVoiceOverSettingsLocalizedStringForKey(@"VO_LIVE_REGION_WITH_APP");
  uint64_t v44 = [v3 settingsData];
  float v45 = [v44 webAreaURL];
  id v33 = objc_msgSend(v42, "stringWithFormat:", v43, v45);
LABEL_62:

LABEL_45:

  return v33;
}

- (void)_setVolumeForActiveVoice:(double)a3
{
  id v5 = [MEMORY[0x263F22938] sharedInstance];
  *(float *)&double v4 = a3;
  [v5 setVoiceOverEffectiveSpeakingVolume:v4];
}

- (id)_volumeForActiveVoice
{
  v2 = NSNumber;
  id v3 = [MEMORY[0x263F22938] sharedInstance];
  [v3 voiceOverEffectiveSpeakingVolume];
  double v4 = objc_msgSend(v2, "numberWithFloat:");

  return v4;
}

- (id)identifierForItem:(id)a3
{
  return (id)[a3 identifier];
}

- (id)possibleValuesForSettingsItem:(id)a3
{
  v61[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[VOSSettingsItem NavigationStyle];

  if (v5 == v4)
  {
    id v21 = &unk_26CC936C0;
    goto LABEL_20;
  }
  id v6 = +[VOSSettingsItem TypingStyle];

  if (v6 == v4)
  {
    id v21 = &unk_26CC936D8;
    goto LABEL_20;
  }
  uint64_t v7 = +[VOSSettingsItem SoftwareTypingFeedback];
  if ((id)v7 == v4)
  {

    goto LABEL_19;
  }
  id v8 = (void *)v7;
  id v9 = +[VOSSettingsItem HardwareTypingFeedback];

  if (v9 == v4)
  {
LABEL_19:
    id v21 = &unk_26CC936F0;
    goto LABEL_20;
  }
  id v10 = +[VOSSettingsItem PhoneticFeedback];

  if (v10 == v4)
  {
    id v21 = &unk_26CC93708;
    goto LABEL_20;
  }
  id v11 = +[VOSSettingsItem MediaDescriptions];

  if (v11 == v4)
  {
    id v21 = &unk_26CC93720;
    goto LABEL_20;
  }
  id v12 = +[VOSSettingsItem NavigateImages];

  if (v12 == v4)
  {
    id v21 = &unk_26CC93738;
    goto LABEL_20;
  }
  id v13 = +[VOSSettingsItem GestureDirection];

  if (v13 == v4)
  {
    id v21 = &unk_26CC93750;
    goto LABEL_20;
  }
  id v14 = +[VOSSettingsItem AudioDucking];

  if (v14 == v4)
  {
    id v21 = &unk_26CC93768;
    goto LABEL_20;
  }
  id v15 = +[VOSSettingsItem Activities];

  if (v15 == v4)
  {
    id v23 = [MEMORY[0x263EFF9D0] null];
    v61[0] = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v61 count:1];
    id v25 = [MEMORY[0x263F22938] sharedInstance];
    uint64_t v26 = [v25 voiceOverActivities];
LABEL_30:
    id v27 = (void *)v26;
    id v21 = [v24 arrayByAddingObjectsFromArray:v26];

    goto LABEL_20;
  }
  id v16 = +[VOSSettingsItem Punctuation];

  if (v16 == v4)
  {
    id v23 = [MEMORY[0x263EFF9D0] null];
    int v60 = v23;
    id v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v60 count:1];
    id v25 = [MEMORY[0x263F220F8] sharedDatabase];
    uint64_t v26 = [v25 punctuationGroups];
    goto LABEL_30;
  }
  uint64_t v17 = +[VOSSettingsItem BrailleInput];
  if ((id)v17 == v4)
  {
  }
  else
  {
    id v18 = (void *)v17;
    id v19 = +[VOSSettingsItem BrailleOutput];

    if (v19 != v4)
    {
      id v20 = +[VOSSettingsItem Voice];

      if (v20 == v4)
      {
        id v21 = objc_opt_new();
        uint64_t v47 = [(VOSSettingsHelper *)self enabledVoices];
        uint64_t v48 = [v47 count];

        if (v48)
        {
          unint64_t v49 = 0;
          do
          {
            v50 = [NSNumber numberWithInt:v49];
            [v21 addObject:v50];

            ++v49;
            int v51 = [(VOSSettingsHelper *)self enabledVoices];
            unint64_t v52 = [v51 count];
          }
          while (v52 > v49);
        }
      }
      else
      {
        id v21 = (void *)MEMORY[0x263EFFA68];
      }
      goto LABEL_20;
    }
  }
  id v53 = v4;
  id v28 = (void *)_AXSVoiceOverTouchCopyBrailleLanguageRotorItems();
  id v21 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v28, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v29 = v28;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v59 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    id v33 = @"Enabled";
    v54 = v21;
    do
    {
      for (uint64_t i = 0; i != v31; ++i)
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v29);
        }
        int v35 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        int v36 = objc_msgSend(v35, "objectForKeyedSubscript:", v33, v53);
        int v37 = [v36 BOOLValue];

        if (v37)
        {
          id v38 = [v35 objectForKeyedSubscript:@"RotorItem"];
          if (!v38)
          {
            uint64_t v39 = [v35 objectForKeyedSubscript:@"LanguageDefaults"];
            uint64_t v40 = [MEMORY[0x263F228D0] sharedInstance];
            double v41 = [v40 userLocale];

            double v42 = [v41 localeIdentifier];
            uint64_t v43 = [v39 objectForKeyedSubscript:v42];

            if (v43)
            {
              id v38 = v43;
            }
            else
            {
              [MEMORY[0x263F2BAB8] defaultTableForLocale:v41];
              uint64_t v44 = v33;
              v46 = id v45 = v29;
              id v38 = [v46 identifier];

              id v29 = v45;
              id v33 = v44;
              id v21 = v54;
            }
          }
          [v21 addObject:v38];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v59 count:16];
    }
    while (v31);
  }

  id v4 = v53;
LABEL_20:

  return v21;
}

- (BOOL)isItemSupported:(id)a3
{
  id v4 = a3;
  id v5 = +[VOSSettingsItem ImageDescriptions];

  if (v5 == v4)
  {
    id v10 = [MEMORY[0x263F22938] sharedInstance];
    if (![v10 voiceOverImageCaptionsEnabled])
    {
LABEL_10:
      char v9 = 0;
LABEL_15:

      goto LABEL_16;
    }
LABEL_7:
    id v11 = [MEMORY[0x263F08AB0] processInfo];
    if ((unint64_t)[v11 physicalMemory] <= 0x773593FF) {
      char v9 = 0;
    }
    else {
      char v9 = AXRuntimeCheck_HasANE();
    }

    goto LABEL_15;
  }
  id v6 = +[VOSSettingsItem ScreenRecognition];

  if (v6 == v4)
  {
    id v10 = [MEMORY[0x263F22938] sharedInstance];
    if (![v10 automaticAccessibilityEnabled]) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  id v7 = +[VOSSettingsItem LiveRegions];

  if (v7 == v4)
  {
    char v9 = 1;
    goto LABEL_16;
  }
  id v8 = +[VOSSettingsItem GestureDirection];

  if (v8 == v4)
  {
    id v10 = [MEMORY[0x263F22938] sharedInstance];
    char v9 = [v10 anyUserPreferredLangaugeIsRTL];
    goto LABEL_15;
  }
  char v9 = [(VOSSettingsHelper *)self itemIsSupportedForPlatform:v4];
LABEL_16:

  return v9;
}

- (id)_formatterForItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[VOSSettingsItem Volume];
  id v6 = v4;
  if ((id)v5 == v4) {
    goto LABEL_21;
  }
  id v7 = (void *)v5;
  uint64_t v8 = +[VOSSettingsItem SpeakingRate];
  if ((id)v8 == v4)
  {

    id v6 = v7;
LABEL_21:

    goto LABEL_22;
  }
  char v9 = (void *)v8;
  id v10 = +[VOSSettingsItem DuckingAmount];

  if (v10 == v4)
  {
LABEL_22:
    uint64_t v29 = +[VOSSettingsHelper percentageFormatter];
    goto LABEL_23;
  }
  id v11 = +[VOSSettingsItem NavigationStyle];

  if (v11 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper navigationStyleFormatter];
    goto LABEL_23;
  }
  id v12 = +[VOSSettingsItem PhoneticFeedback];

  if (v12 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper phoneticFeedbackFormatter];
    goto LABEL_23;
  }
  id v13 = +[VOSSettingsItem MediaDescriptions];

  if (v13 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper mediaDescriptionsFormatter];
    goto LABEL_23;
  }
  id v14 = +[VOSSettingsItem NavigateImages];

  if (v14 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper navigateImagesFormatter];
    goto LABEL_23;
  }
  id v15 = +[VOSSettingsItem GestureDirection];

  if (v15 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper gestureDirectionFormatter];
    goto LABEL_23;
  }
  id v16 = +[VOSSettingsItem Activities];

  if (v16 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper activitiesFormatter];
    goto LABEL_23;
  }
  id v17 = +[VOSSettingsItem Punctuation];

  if (v17 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper punctuationFormatter];
    goto LABEL_23;
  }
  id v18 = +[VOSSettingsItem TypingStyle];

  if (v18 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper typingStyleFormatter];
    goto LABEL_23;
  }
  uint64_t v19 = +[VOSSettingsItem SoftwareTypingFeedback];
  if ((id)v19 == v4)
  {

    goto LABEL_36;
  }
  id v20 = (void *)v19;
  id v21 = +[VOSSettingsItem HardwareTypingFeedback];

  if (v21 == v4)
  {
LABEL_36:
    uint64_t v29 = +[VOSSettingsHelper typingFeedbackFormatter];
    goto LABEL_23;
  }
  id v22 = +[VOSSettingsItem BrailleAutoAdvanceDuration];

  if (v22 == v4)
  {
    uint64_t v29 = +[VOSSettingsHelper durationFormatter];
    goto LABEL_23;
  }
  id v23 = +[VOSSettingsItem Voice];

  if (v23 != v4)
  {
    uint64_t v24 = +[VOSSettingsItem BrailleInput];
    if ((id)v24 == v4)
    {
    }
    else
    {
      id v25 = (void *)v24;
      id v26 = +[VOSSettingsItem BrailleOutput];

      if (v26 != v4)
      {
        id v27 = +[VOSSettingsItem AudioDucking];

        if (v27 != v4)
        {
          id v28 = 0;
          goto LABEL_24;
        }
        uint64_t v29 = +[VOSSettingsHelper audioDuckingMode];
        goto LABEL_23;
      }
    }
    uint64_t v29 = +[VOSSettingsHelper brailleTableFormatter];
LABEL_23:
    id v28 = (void *)v29;
    goto LABEL_24;
  }
  uint64_t v31 = [(VOSSettingsHelper *)self enabledVoices];
  id v28 = +[VOSSettingsHelper voiceFormatterForEnabledVoiceCodes:v31];

LABEL_24:

  return v28;
}

- (id)formattedValue:(id)a3 withItem:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(VOSSettingsHelper *)self _formatterForItem:v7];
    char v9 = (void *)v8;
    if (v8)
    {
      uint64_t v10 = (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    }
    else
    {
      if ([v7 itemType])
      {
        id v12 = VOTLogCommon();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412546;
          id v15 = v6;
          __int16 v16 = 2112;
          id v17 = v7;
          _os_log_impl(&dword_21C3F9000, v12, OS_LOG_TYPE_DEFAULT, "Error. no formatter provided to format value: '%@'. item: %@", (uint8_t *)&v14, 0x16u);
        }
      }
      uint64_t v10 = [v6 description];
    }
    id v11 = (void *)v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)scaledValue:(id)a3 withItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[VOSSettingsItem BrailleAutoAdvanceDuration];

  if (v7 == v6)
  {
    char v9 = NSNumber;
    [v5 doubleValue];
    id v8 = [v9 numberWithDouble:(v10 - *MEMORY[0x263F22AE8]) / (*MEMORY[0x263F22AE0] - *MEMORY[0x263F22AE8])];
  }
  else
  {
    id v8 = v5;
  }
  id v11 = v8;

  return v11;
}

+ (id)percentageFormatter
{
  if (percentageFormatter_onceToken != -1) {
    dispatch_once(&percentageFormatter_onceToken, &__block_literal_global_438);
  }
  v2 = _Block_copy((const void *)percentageFormatter_formatter);

  return v2;
}

void __40__VOSSettingsHelper_percentageFormatter__block_invoke()
{
  v0 = (void *)percentageFormatter_formatter;
  percentageFormatter_formatter = (uint64_t)&__block_literal_global_441;
}

uint64_t __40__VOSSettingsHelper_percentageFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  [a2 floatValue];

  return MEMORY[0x270F0A108](0);
}

+ (id)durationFormatter
{
  if (durationFormatter_onceToken != -1) {
    dispatch_once(&durationFormatter_onceToken, &__block_literal_global_443_0);
  }
  v2 = _Block_copy((const void *)durationFormatter_formatter);

  return v2;
}

void __38__VOSSettingsHelper_durationFormatter__block_invoke()
{
  v0 = (void *)durationFormatter_formatter;
  durationFormatter_formatter = (uint64_t)&__block_literal_global_445_1;
}

id __38__VOSSettingsHelper_durationFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 floatValue];
  float v4 = v3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  id v5 = (void (*)(void, double))getAXLocalizedTimeSummarySymbolLoc_ptr;
  id v13 = getAXLocalizedTimeSummarySymbolLoc_ptr;
  if (!getAXLocalizedTimeSummarySymbolLoc_ptr)
  {
    id v6 = (void *)AccessibilityUIUtilitiesLibrary();
    v11[3] = (uint64_t)dlsym(v6, "AXLocalizedTimeSummary");
    getAXLocalizedTimeSummarySymbolLoc_ptr = (_UNKNOWN *)v11[3];
    id v5 = (void (*)(void, double))v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (!v5)
  {
    char v9 = (_Unwind_Exception *)soft_AXUILocalizedStringForKey_cold_1();
    _Block_object_dispose(&v10, 8);
    _Unwind_Resume(v9);
  }
  id v7 = v5(0, v4);

  return v7;
}

+ (id)typingFeedbackFormatter
{
  if (typingFeedbackFormatter_onceToken != -1) {
    dispatch_once(&typingFeedbackFormatter_onceToken, &__block_literal_global_447_1);
  }
  id v2 = _Block_copy((const void *)typingFeedbackFormatter_formatter);

  return v2;
}

void __44__VOSSettingsHelper_typingFeedbackFormatter__block_invoke()
{
  v0 = (void *)typingFeedbackFormatter_formatter;
  typingFeedbackFormatter_formatter = (uint64_t)&__block_literal_global_449;
}

id __44__VOSSettingsHelper_typingFeedbackFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = AXVoiceOverSettingsTypingFeedbackLocalizedStringForKey(off_2643FDA18[v2]);
  }

  return v3;
}

+ (id)audioDuckingMode
{
  if (audioDuckingMode_onceToken != -1) {
    dispatch_once(&audioDuckingMode_onceToken, &__block_literal_global_463);
  }
  unint64_t v2 = _Block_copy((const void *)audioDuckingMode_formatter);

  return v2;
}

void __37__VOSSettingsHelper_audioDuckingMode__block_invoke()
{
  v0 = (void *)audioDuckingMode_formatter;
  audioDuckingMode_formatter = (uint64_t)&__block_literal_global_465_1;
}

id __37__VOSSettingsHelper_audioDuckingMode__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 2)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = AXVoiceOverSettingsLocalizedStringForKey(off_2643FDA38[v2]);
  }

  return v3;
}

+ (id)typingStyleFormatter
{
  if (typingStyleFormatter_onceToken != -1) {
    dispatch_once(&typingStyleFormatter_onceToken, &__block_literal_global_476);
  }
  unint64_t v2 = _Block_copy((const void *)typingStyleFormatter_formatter);

  return v2;
}

void __41__VOSSettingsHelper_typingStyleFormatter__block_invoke()
{
  v0 = (void *)typingStyleFormatter_formatter;
  typingStyleFormatter_formatter = (uint64_t)&__block_literal_global_478;
}

id __41__VOSSettingsHelper_typingStyleFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 2)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = VOSLocString(off_2643FDA50[v2]);
  }

  return v3;
}

+ (id)brailleInputOutputFormatter
{
  if (brailleInputOutputFormatter_onceToken != -1) {
    dispatch_once(&brailleInputOutputFormatter_onceToken, &__block_literal_global_489);
  }
  unint64_t v2 = _Block_copy((const void *)brailleInputOutputFormatter_formatter);

  return v2;
}

void __48__VOSSettingsHelper_brailleInputOutputFormatter__block_invoke()
{
  v0 = (void *)brailleInputOutputFormatter_formatter;
  brailleInputOutputFormatter_formatter = (uint64_t)&__block_literal_global_491;
}

id __48__VOSSettingsHelper_brailleInputOutputFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue] - 1;
  if (v2 > 2)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = AXVoiceOverBrailleOptionsLocalizedStringForKey(off_2643FDA68[v2]);
  }

  return v3;
}

+ (id)phoneticFeedbackFormatter
{
  if (phoneticFeedbackFormatter_onceToken != -1) {
    dispatch_once(&phoneticFeedbackFormatter_onceToken, &__block_literal_global_502_0);
  }
  unint64_t v2 = _Block_copy((const void *)phoneticFeedbackFormatter_formatter);

  return v2;
}

void __46__VOSSettingsHelper_phoneticFeedbackFormatter__block_invoke()
{
  v0 = (void *)phoneticFeedbackFormatter_formatter;
  phoneticFeedbackFormatter_formatter = (uint64_t)&__block_literal_global_504;
}

id __46__VOSSettingsHelper_phoneticFeedbackFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 2)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = AXVoiceOverSettingsLocalizedStringForKey(off_2643FDA80[v2]);
  }

  return v3;
}

+ (id)mediaDescriptionsFormatter
{
  if (mediaDescriptionsFormatter_onceToken != -1) {
    dispatch_once(&mediaDescriptionsFormatter_onceToken, &__block_literal_global_515_1);
  }
  unint64_t v2 = _Block_copy((const void *)mediaDescriptionsFormatter_formatter);

  return v2;
}

void __47__VOSSettingsHelper_mediaDescriptionsFormatter__block_invoke()
{
  v0 = (void *)mediaDescriptionsFormatter_formatter;
  mediaDescriptionsFormatter_formatter = (uint64_t)&__block_literal_global_517_0;
}

id __47__VOSSettingsHelper_mediaDescriptionsFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  switch([a2 integerValue])
  {
    case 0:
    case 1:
    case 2:
    case 3:
      unint64_t v2 = AXParameterizedLocalizedString();
      break;
    default:
      unint64_t v2 = 0;
      break;
  }

  return v2;
}

+ (id)navigationStyleFormatter
{
  if (navigationStyleFormatter_onceToken != -1) {
    dispatch_once(&navigationStyleFormatter_onceToken, &__block_literal_global_534);
  }
  unint64_t v2 = _Block_copy((const void *)navigationStyleFormatter_formatter);

  return v2;
}

void __45__VOSSettingsHelper_navigationStyleFormatter__block_invoke()
{
  v0 = (void *)navigationStyleFormatter_formatter;
  navigationStyleFormatter_formatter = (uint64_t)&__block_literal_global_536;
}

id __45__VOSSettingsHelper_navigationStyleFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  if (!v2)
  {
    float v3 = @"VOSPref.item.value.flatNavigation";
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    float v3 = @"VOSPref.item.value.groupedNavigation";
LABEL_5:
    float v4 = VOSLocString(v3);
    goto LABEL_7;
  }
  float v4 = 0;
LABEL_7:

  return v4;
}

+ (id)gestureDirectionFormatter
{
  if (gestureDirectionFormatter_onceToken != -1) {
    dispatch_once(&gestureDirectionFormatter_onceToken, &__block_literal_global_544);
  }
  uint64_t v2 = _Block_copy((const void *)gestureDirectionFormatter_formatter);

  return v2;
}

void __46__VOSSettingsHelper_gestureDirectionFormatter__block_invoke()
{
  v0 = (void *)gestureDirectionFormatter_formatter;
  gestureDirectionFormatter_formatter = (uint64_t)&__block_literal_global_546;
}

id __46__VOSSettingsHelper_gestureDirectionFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 2)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = AXVoiceOverLocalizedStringForKey(off_2643FDA98[v2]);
  }

  return v3;
}

+ (id)navigateImagesFormatter
{
  if (navigateImagesFormatter_onceToken != -1) {
    dispatch_once(&navigateImagesFormatter_onceToken, &__block_literal_global_557_0);
  }
  unint64_t v2 = _Block_copy((const void *)navigateImagesFormatter_formatter);

  return v2;
}

void __44__VOSSettingsHelper_navigateImagesFormatter__block_invoke()
{
  v0 = (void *)navigateImagesFormatter_formatter;
  navigateImagesFormatter_formatter = (uint64_t)&__block_literal_global_559;
}

id __44__VOSSettingsHelper_navigateImagesFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 integerValue];
  if (v2 > 3)
  {
    float v3 = 0;
  }
  else
  {
    float v3 = AXVoiceOverSettingsLocalizedStringForKey(off_2643FDAB0[v2]);
  }

  return v3;
}

+ (id)punctuationFormatter
{
  if (punctuationFormatter_onceToken != -1) {
    dispatch_once(&punctuationFormatter_onceToken, &__block_literal_global_570_1);
  }
  unint64_t v2 = _Block_copy((const void *)punctuationFormatter_formatter);

  return v2;
}

void __41__VOSSettingsHelper_punctuationFormatter__block_invoke()
{
  v0 = (void *)punctuationFormatter_formatter;
  punctuationFormatter_formatter = (uint64_t)&__block_literal_global_572_0;
}

id __41__VOSSettingsHelper_punctuationFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    float v3 = [MEMORY[0x263EFF9D0] null];
    if ([v2 isEqual:v3])
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v5 = [v2 name];
        goto LABEL_7;
      }
    }
  }
  uint64_t v5 = soft_AXUILocalizedStringForKey(@"OFF");
LABEL_7:
  id v6 = (void *)v5;

  return v6;
}

+ (id)activitiesFormatter
{
  if (activitiesFormatter_onceToken != -1) {
    dispatch_once(&activitiesFormatter_onceToken, &__block_literal_global_578);
  }
  id v2 = _Block_copy((const void *)activitiesFormatter_formatter);

  return v2;
}

void __40__VOSSettingsHelper_activitiesFormatter__block_invoke()
{
  v0 = (void *)activitiesFormatter_formatter;
  activitiesFormatter_formatter = (uint64_t)&__block_literal_global_580_1;
}

id __40__VOSSettingsHelper_activitiesFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    float v3 = [MEMORY[0x263EFF9D0] null];
    if ([v2 isEqual:v3])
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v5 = [v2 name];
        goto LABEL_7;
      }
    }
  }
  uint64_t v5 = soft_AXUILocalizedStringForKey(@"OFF");
LABEL_7:
  id v6 = (void *)v5;

  return v6;
}

+ (id)brailleTableFormatter
{
  if (brailleTableFormatter_onceToken != -1) {
    dispatch_once(&brailleTableFormatter_onceToken, &__block_literal_global_583);
  }
  id v2 = _Block_copy((const void *)brailleTableFormatter_formatter);

  return v2;
}

void __42__VOSSettingsHelper_brailleTableFormatter__block_invoke()
{
  v0 = (void *)brailleTableFormatter_formatter;
  brailleTableFormatter_formatter = (uint64_t)&__block_literal_global_585_1;
}

id __42__VOSSettingsHelper_brailleTableFormatter__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F2BAA8];
  id v3 = a2;
  float v4 = (void *)[[v2 alloc] initWithIdentifier:v3];

  uint64_t v5 = [v4 localizedNameWithService];

  return v5;
}

+ (id)voiceFormatterForEnabledVoiceCodes:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VOSSettingsHelper_voiceFormatterForEnabledVoiceCodes___block_invoke;
  aBlock[3] = &unk_2643FD998;
  id v9 = v3;
  id v4 = v3;
  uint64_t v5 = _Block_copy(aBlock);
  id v6 = _Block_copy(v5);

  return v6;
}

id __56__VOSSettingsHelper_voiceFormatterForEnabledVoiceCodes___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 integerValue])
  {
    uint64_t v12 = [*(id *)(a1 + 32) objectAtIndexedSubscript:0];
    goto LABEL_6;
  }
  id v4 = [MEMORY[0x263F22938] sharedInstance];
  uint64_t v5 = [v4 voiceOverVoiceRotors];
  id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v3, "integerValue") - 1);

  uint64_t v7 = [v6 userDefinedName];
  if (!v7
    || (id v8 = (void *)v7,
        [v6 userDefinedName],
        id v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v9 isEqual:&stru_26CC86DC0],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    id v11 = [v6 selection];
    uint64_t v12 = [v11 voiceId];

LABEL_6:
    id v13 = [MEMORY[0x263F7EEA0] sharedInstance];
    id v6 = [v13 speechVoiceWithVoiceId:v12];

    int v14 = [v6 localizedNameWithFootprint];
    id v15 = [v6 language];
    __int16 v16 = [MEMORY[0x263F228D0] sharedInstance];
    id v17 = [v16 dialectForLanguageID:v15];

    uint64_t v18 = [v17 languageNameAndLocaleInCurrentLocale];
    uint64_t v19 = [NSString stringWithFormat:@"%@ - %@", v14, v18];

    goto LABEL_8;
  }
  uint64_t v19 = [v6 userDefinedName];
  uint64_t v12 = &stru_26CC86DC0;
LABEL_8:

  return v19;
}

- (NSArray)enabledVoices
{
  return self->_enabledVoices;
}

- (void)setEnabledVoices:(id)a3
{
}

- (double)sliderMaxValue
{
  return self->_sliderMaxValue;
}

- (void)setSliderMaxValue:(double)a3
{
  self->_sliderMaxValue = a3;
}

- (double)sliderMinValue
{
  return self->_sliderMinValue;
}

- (void)setSliderMinValue:(double)a3
{
  self->_sliderMinValue = a3;
}

- (void).cxx_destruct
{
}

@end