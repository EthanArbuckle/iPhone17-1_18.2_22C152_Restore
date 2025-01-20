@interface CACMessageTracerUtilities
+ (id)sharedCACMessageTracerUtilities;
- (CACMessageTracerUtilities)init;
- (NSDictionary)customUserCommandProperties;
- (NSDictionary)dictationProperties;
- (NSDictionary)recognitionProperties;
- (NSString)localeIdentifier;
- (NSString)targetApplicationIdentifier;
- (NSString)textAreaIdentifierOrLabel;
- (NSString)textAreaSelectionRange;
- (id)_mutablePlistCompatibleObjectFromObject:(id)a3;
- (id)dictionaryOfNormallyStaticPreferenceValuesForCoreAnalytics;
- (void)_prepareToSendAudioDataToAppleServers;
- (void)logCommandWithIdentifier:(id)a3;
- (void)removeCachedAudioFile;
- (void)sendCoreAnalyticsForRecognizedCommandIdentifier:(id)a3 appIdentifier:(id)a4;
- (void)setCustomUserCommandProperties:(id)a3;
- (void)setDictationProperties:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setRecognitionProperties:(id)a3;
- (void)setTargetApplicationIdentifier:(id)a3;
- (void)setTextAreaIdentifierOrLabel:(id)a3;
- (void)setTextAreaSelectionRange:(id)a3;
- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4;
- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4;
- (void)speechRecognitionTaskWasCancelled:(id)a3;
@end

@implementation CACMessageTracerUtilities

+ (id)sharedCACMessageTracerUtilities
{
  if (sharedCACMessageTracerUtilities_instaniateReporter != -1) {
    dispatch_once(&sharedCACMessageTracerUtilities_instaniateReporter, &__block_literal_global_10);
  }
  v2 = (void *)sCACMessageTracerUtilities;
  return v2;
}

uint64_t __60__CACMessageTracerUtilities_sharedCACMessageTracerUtilities__block_invoke()
{
  sCACMessageTracerUtilities = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (CACMessageTracerUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)CACMessageTracerUtilities;
  v2 = [(CACMessageTracerUtilities *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    remoteSpeechOperationQueue = v2->_remoteSpeechOperationQueue;
    v2->_remoteSpeechOperationQueue = (NSOperationQueue *)v3;

    [(CACMessageTracerUtilities *)v2 _prepareToSendAudioDataToAppleServers];
  }
  return v2;
}

- (void)logCommandWithIdentifier:(id)a3
{
  v58[1] = *MEMORY[0x263EF8340];
  v4 = (__CFString *)a3;
  v5 = +[CACPreferences sharedPreferences];
  objc_super v6 = NSNumber;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  v7 = objc_msgSend(v6, "numberWithDouble:");
  if (!self->_localeIdentifier)
  {
    v8 = [v5 bestLocaleIdentifier];
    [(CACMessageTracerUtilities *)self setLocaleIdentifier:v8];
  }
  v9 = [MEMORY[0x263EFF9A0] dictionary];
  v10 = v9;
  if (v4) {
    v11 = v4;
  }
  else {
    v11 = &stru_26EB332F0;
  }
  [v9 setObject:v11 forKey:@"CommandIdentifier"];
  if (self->_targetApplicationIdentifier) {
    targetApplicationIdentifier = (__CFString *)self->_targetApplicationIdentifier;
  }
  else {
    targetApplicationIdentifier = &stru_26EB332F0;
  }
  [v10 setObject:targetApplicationIdentifier forKey:@"TargetApplicationIdentifier"];
  [v10 setObject:v7 forKey:@"RecordedTime"];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"CACAddDebuggingInfoToRecentCommands", @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat);
  customUserCommandProperties = self->_customUserCommandProperties;
  if (AppBooleanValue && keyExistsAndHasValidFormat)
  {
    if (customUserCommandProperties)
    {
      v15 = [(CACMessageTracerUtilities *)self _mutablePlistCompatibleObjectFromObject:self->_customUserCommandProperties];
      if (v15) {
        [v10 setObject:v15 forKey:@"CustomUserCommandProperties"];
      }
    }
    v16 = [(CACMessageTracerUtilities *)self recognitionProperties];
    if (v16)
    {
    }
    else
    {
      v19 = [(CACMessageTracerUtilities *)self dictationProperties];
      BOOL v20 = v19 == 0;

      if (v20)
      {
LABEL_31:
        v28 = NSNumber;
        v29 = [v5 alwaysShowOverlayType];
        v30 = [v28 numberWithBool:v29 != 0];
        [v10 setObject:v30 forKey:@"AlwaysShowOverlayType"];

        textAreaIdentifierOrLabel = self->_textAreaIdentifierOrLabel;
        if (textAreaIdentifierOrLabel) {
          [v10 setObject:textAreaIdentifierOrLabel forKey:@"TextAreaIdentifierOrLabel"];
        }
        textAreaSelectionRange = self->_textAreaSelectionRange;
        if (textAreaSelectionRange) {
          [v10 setObject:textAreaSelectionRange forKey:@"TextAreaSelectionRange"];
        }
        goto LABEL_35;
      }
    }
    v21 = objc_opt_new();
    v22 = [(CACMessageTracerUtilities *)self recognitionProperties];

    if (v22)
    {
      v23 = [(CACMessageTracerUtilities *)self recognitionProperties];
      v24 = [(CACMessageTracerUtilities *)self _mutablePlistCompatibleObjectFromObject:v23];

      if (v24) {
        [v21 addEntriesFromDictionary:v24];
      }
    }
    v25 = [(CACMessageTracerUtilities *)self dictationProperties];

    if (v25)
    {
      v26 = [(CACMessageTracerUtilities *)self dictationProperties];
      v27 = [(CACMessageTracerUtilities *)self _mutablePlistCompatibleObjectFromObject:v26];

      if (v27) {
        [v21 addEntriesFromDictionary:v27];
      }
    }
    if ([v21 count]) {
      [v10 setObject:v21 forKey:@"RecognitionParameters"];
    }

    goto LABEL_31;
  }
  if (customUserCommandProperties)
  {
    v57 = @"CustomType";
    v17 = -[NSDictionary objectForKey:](customUserCommandProperties, "objectForKey:");
    v58[0] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v58 forKeys:&v57 count:1];
    [v10 setObject:v18 forKey:@"CustomUserCommandProperties"];
  }
LABEL_35:
  if ([(__CFString *)v4 length])
  {
    v33 = self;
    objc_sync_enter(v33);
    v34 = [v5 recentCommandEntries];
    [v34 insertObject:v10 atIndex:0];
    if ((unint64_t)[v34 count] >= 0x65) {
      objc_msgSend(v34, "removeObjectsInRange:", 100, objc_msgSend(v34, "count") - 100);
    }
    [v5 setRecentCommandEntries:v34];

    objc_sync_exit(v33);
  }
  if ([(__CFString *)v4 length])
  {
    v35 = self;
    objc_sync_enter(v35);
    v36 = [v5 commandCounts];
    v37 = NSNumber;
    v38 = [v36 objectForKey:v4];
    v39 = objc_msgSend(v37, "numberWithUnsignedLongLong:", objc_msgSend(v38, "unsignedLongLongValue") + 1);
    [v36 setObject:v39 forKey:v4];

    [v5 setCommandCounts:v36];
    objc_sync_exit(v35);
  }
  if ([(NSString *)self->_targetApplicationIdentifier length])
  {
    v40 = self;
    objc_sync_enter(v40);
    v41 = [v5 targetApplicationCounts];
    v42 = NSNumber;
    v43 = [v41 objectForKey:self->_targetApplicationIdentifier];
    v44 = objc_msgSend(v42, "numberWithUnsignedLongLong:", objc_msgSend(v43, "unsignedLongLongValue") + 1);
    [v41 setObject:v44 forKey:self->_targetApplicationIdentifier];

    [v5 setTargetApplicationCounts:v41];
    objc_sync_exit(v40);
  }
  uint64_t AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CACMessageTraceRandomizedCountDown", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log", 0);
  [v7 doubleValue];
  double v47 = v46;
  [v5 lastCommandDate];
  if (v47 <= v48 + 3481.0)
  {
    if (AppIntegerValue < 1) {
      goto LABEL_48;
    }
    v49 = (const void *)[NSNumber numberWithInteger:--AppIntegerValue];
  }
  else
  {
    uint64_t AppIntegerValue = rand() % 11;
    v49 = (const void *)[NSNumber numberWithInteger:AppIntegerValue];
  }
  CFPreferencesSetAppValue(@"CACMessageTraceRandomizedCountDown", v49, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
LABEL_48:
  if (!AppIntegerValue)
  {
    v50 = (void *)CFPreferencesCopyAppValue(@"CACLastCommandRecognizedMessageTrace", @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
    if (!v50
      || (objc_opt_respondsToSelector() & 1) != 0
      && ([v7 doubleValue], double v52 = v51, objc_msgSend(v50, "doubleValue"), v52 > v53 + 3481.0))
    {
      [(CACMessageTracerUtilities *)self sendCoreAnalyticsForRecognizedCommandIdentifier:v4 appIdentifier:self->_targetApplicationIdentifier];
      v54 = [MEMORY[0x263F285A0] sharedPreferences];
      BOOL v55 = [v54 siriDataSharingOptInStatus] == 1;

      if (v55) {
        [(CACMessageTracerUtilities *)self sendRecentAudioDataToAppleServers];
      }
      CFPreferencesSetAppValue(@"CACLastCommandRecognizedMessageTrace", v7, @"com.apple.speech.SpeechRecognitionCommandAndControl.Log");
    }
  }
  [v7 doubleValue];
  objc_msgSend(v5, "setLastCommandDate:");
  [(CACMessageTracerUtilities *)self setCustomUserCommandProperties:0];
  [(CACMessageTracerUtilities *)self setRecognitionProperties:0];
  [(CACMessageTracerUtilities *)self setDictationProperties:0];
}

- (void)sendCoreAnalyticsForRecognizedCommandIdentifier:(id)a3 appIdentifier:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v44 = a3;
  objc_super v6 = (__CFString *)a4;
  v7 = [MEMORY[0x263EFF980] array];
  v8 = +[CACPreferences sharedPreferences];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v8 recentCommandEntries];
  uint64_t v9 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    v41 = self;
    v42 = v8;
    v43 = v6;
    v11 = @"Custom";
    uint64_t v12 = *(void *)v47;
    double v13 = 0.0;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        v16 = [v15 objectForKey:@"CommandIdentifier"];
        if ([v16 hasPrefix:v11])
        {
          v17 = NSString;
          v18 = [v15 objectForKey:@"CustomUserCommandProperties"];
          [v18 objectForKey:@"CustomType"];
          uint64_t v19 = v10;
          uint64_t v20 = v12;
          v21 = v7;
          v23 = v22 = v11;
          uint64_t v24 = [v17 stringWithFormat:@"Custom_%@", v23];

          v11 = v22;
          v7 = v21;
          uint64_t v12 = v20;
          uint64_t v10 = v19;

          v16 = (void *)v24;
        }
        if (v13 == 0.0)
        {
          v25 = [v15 objectForKey:@"RecordedTime"];
          [v25 doubleValue];
          double v13 = v26;
        }
        [v7 insertObject:v16 atIndex:0];
        if ((unint64_t)[v7 count] >= 3)
        {
          v28 = [v15 objectForKey:@"RecordedTime"];
          [v28 doubleValue];
          double v30 = v13 - v29;

          if (v30 > 60.0)
          {

            v7 = 0;
          }
          v8 = v42;
          objc_super v6 = v43;
          self = v41;
          v27 = v44;

          goto LABEL_18;
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (v10) {
        continue;
      }
      break;
    }
    v8 = v42;
    objc_super v6 = v43;
    self = v41;
  }
  v27 = v44;
LABEL_18:

  v31 = [MEMORY[0x263EFF9A0] dictionary];
  id v32 = v27;
  v33 = v32;
  if ([v32 hasPrefix:@"Custom"])
  {
    customUserCommandProperties = self->_customUserCommandProperties;
    v33 = v32;
    if (customUserCommandProperties)
    {
      v35 = NSString;
      v36 = [(NSDictionary *)customUserCommandProperties objectForKey:@"CustomType"];
      v33 = [v35 stringWithFormat:@"Custom_%@", v36];
    }
  }
  [v31 setObject:v33 forKey:@"CommandIdentifier"];
  if (v6) {
    v37 = v6;
  }
  else {
    v37 = &stru_26EB332F0;
  }
  [v31 setObject:v37 forKey:@"AppIdentifier"];
  if ([v7 count] == 3)
  {
    v38 = [v7 componentsJoinedByString:@","];
    [v31 setObject:v38 forKey:@"RecentCommandTriplet"];
  }
  v39 = [(CACMessageTracerUtilities *)self dictionaryOfNormallyStaticPreferenceValuesForCoreAnalytics];
  [v31 addEntriesFromDictionary:v39];

  AnalyticsSendEvent();
  v40 = CACLogGeneral();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v51 = @"com.apple.commandandcontrol.commandrecognized";
    _os_log_impl(&dword_238377000, v40, OS_LOG_TYPE_DEFAULT, "Sent %@ event to CoreAnalytics.", buf, 0xCu);
  }
}

- (id)dictionaryOfNormallyStaticPreferenceValuesForCoreAnalytics
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v38 = +[CACPreferences sharedPreferences];
  [v38 rawCustomCommandsPreferencesDictionary];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v39 = 0;
    uint64_t v41 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v45 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v11 = [obj objectForKey:v10];
        uint64_t v12 = [v11 objectForKey:@"Enabled"];
        [v12 BOOLValue];

        double v13 = [v11 objectForKey:@"ConfirmationRequired"];
        [v13 BOOLValue];

        if ([v10 hasPrefix:@"Custom"])
        {
          ++v7;
          v14 = [v11 objectForKey:@"CustomType"];
          v6 += [v14 isEqualToString:@"RunGesture"];
          v4 += [v14 isEqualToString:@"RunShortcutsWorkflow"];
          v5 += [v14 isEqualToString:@"RunUserActionFlow"];
          v39 += [v14 isEqualToString:@"PasteText"];
          v41 += [v14 isEqualToString:@"PasteBoard"];
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v39 = 0;
    uint64_t v41 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  v48[0] = @"LocaleIdentifier";
  v37 = [v38 bestLocaleIdentifier];
  v49[0] = v37;
  v48[1] = @"VocabularyEntriesCountLog2Bucket";
  v36 = [v38 bestLocaleIdentifier];
  v35 = [v38 vocabularyEntriesForLocaleIdentifier:v36];
  v34 = NumberWithLog2BucketForIntegerValue([v35 count]);
  v49[1] = v34;
  v48[2] = @"CustomCommandsCountLog2Bucket";
  v33 = NumberWithLog2BucketForIntegerValue(v7);
  v49[2] = v33;
  v48[3] = @"CustomGesturesCountLog2Bucket";
  id v32 = NumberWithLog2BucketForIntegerValue(v6);
  v49[3] = v32;
  v48[4] = @"CustomShortcutsCountLog2Bucket";
  v31 = NumberWithLog2BucketForIntegerValue(v4);
  v49[4] = v31;
  v48[5] = @"CustomRecordedActionsCountLog2Bucket";
  double v30 = NumberWithLog2BucketForIntegerValue(v5);
  v49[5] = v30;
  v48[6] = @"CustomTextInsertLog2Bucket";
  v40 = NumberWithLog2BucketForIntegerValue(v39);
  v49[6] = v40;
  v48[7] = @"CustomPasteboardLog2Bucket";
  v42 = NumberWithLog2BucketForIntegerValue(v41);
  v49[7] = v42;
  v48[8] = @"ContinousOverlayType";
  double v29 = [v38 alwaysShowOverlayType];
  v49[8] = v29;
  v48[9] = @"GridOverlayIsCustomized";
  v28 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v38, "gridOverlayCustomColumnsEnabled") | objc_msgSend(v38, "gridOverlayCustomRowsEnabled"));
  v49[9] = v28;
  v48[10] = @"VisualConfirmationIsEnabled";
  v27 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v38, "showTextResponseUponRecognition"));
  v49[10] = v27;
  v48[11] = @"AudioConfirmationIsEnabled";
  double v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v38, "playSoundUponRecognition"));
  v49[11] = v26;
  v48[12] = @"ShowHintsIsEnabled";
  v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v38, "userHintsFeatures") != 0);
  v49[12] = v15;
  v48[13] = @"ShareAudioDataIsEnabled";
  v16 = NSNumber;
  v17 = [MEMORY[0x263F285A0] sharedPreferences];
  v18 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "siriDataSharingOptInStatus") == 1);
  v49[13] = v18;
  v48[14] = @"AttentionAwareMode";
  uint64_t v19 = [v38 attentionAwareAction];
  v49[14] = v19;
  v48[15] = @"VoiceOverIsEnabled";
  uint64_t v20 = [NSNumber numberWithUnsignedChar:_AXSVoiceOverTouchEnabled()];
  v49[15] = v20;
  v48[16] = @"AssistiveTouchIsEnabled";
  v21 = [NSNumber numberWithUnsignedChar:_AXSAssistiveTouchEnabled()];
  v49[16] = v21;
  v48[17] = @"ZoomIsEnabled";
  v22 = [NSNumber numberWithUnsignedChar:_AXSZoomTouchEnabled()];
  v49[17] = v22;
  v48[18] = @"SwitchControlIsEnabled";
  v23 = [NSNumber numberWithUnsignedChar:_AXSAssistiveTouchScannerEnabled()];
  v49[18] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:19];

  return v24;
}

- (void)_prepareToSendAudioDataToAppleServers
{
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v4 = [v3 siriDataSharingOptInStatus];

  uint64_t v5 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (v4 != 1) {
    uint64_t v5 = (CFPropertyListRef *)MEMORY[0x263EFFB38];
  }
  CFPreferencesSetAppValue(@"SaveUtteranceToFile", *v5, @"com.apple.SpeechRecognitionCore");
  CFPreferencesAppSynchronize(@"com.apple.SpeechRecognitionCore");
  if (v4 != 1)
  {
    [(CACMessageTracerUtilities *)self removeCachedAudioFile];
  }
}

- (void)removeCachedAudioFile
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFArrayRef v2 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  CFURLRef ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v2, 0);
  CFURLRef v4 = CFURLCreateCopyAppendingPathComponent(0, ValueAtIndex, @"com.apple.SpeechRecognitionCore", 1u);
  CFRelease(v2);
  CFStringRef v5 = CFURLCopyPath(v4);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFStringGetCString(v5, buffer, 2000, 0x8000100u);
    if (!opendir(buffer) && mkdir(buffer, 0x1EDu)) {
      NSLog(&cfstr_Copysrcacheurl.isa, v4);
    }
    CFRelease(v6);
  }
  uint64_t v7 = [(__CFURL *)v4 path];
  uint64_t v8 = [v7 stringByAppendingPathComponent:@"srcLogAudioFile.wav"];

  if ([v8 length])
  {
    uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
    [v9 removeItemAtPath:v8 error:0];
  }
}

- (void)speechRecognitionTask:(id)a3 didFinishRecognition:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = CACLogAudio();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 requestIdentifier];
    int v9 = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_238377000, v7, OS_LOG_TYPE_DEFAULT, "speechRecognitionTask:didFinishRecognition:, task ID: %@, result: %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)speechRecognitionTaskWasCancelled:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CFURLRef v4 = CACLogAudio();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 requestIdentifier];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_DEFAULT, "speechRecognitionTaskWasCancelled:, task ID: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)speechRecognitionTask:(id)a3 didFinishSuccessfully:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = CACLogAudio();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v5 requestIdentifier];
    int v8 = 138412546;
    int v9 = v7;
    __int16 v10 = 1024;
    BOOL v11 = v4;
    _os_log_impl(&dword_238377000, v6, OS_LOG_TYPE_DEFAULT, "speechRecognitionTask:didFinishSuccessfully:, task ID: %@, successfully: %d", (uint8_t *)&v8, 0x12u);
  }
}

- (id)_mutablePlistCompatibleObjectFromObject:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x263EFF9A0] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v6 = [v4 allKeys];
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
          uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v12 = [v4 objectForKey:v11];
          uint64_t v13 = [(CACMessageTracerUtilities *)self _mutablePlistCompatibleObjectFromObject:v12];

          if (v13) {
            [v5 setObject:v13 forKey:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v8);
    }
LABEL_22:

    goto LABEL_29;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x263EFF980] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v6 = v4;
    uint64_t v14 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v6);
          }
          v18 = -[CACMessageTracerUtilities _mutablePlistCompatibleObjectFromObject:](self, "_mutablePlistCompatibleObjectFromObject:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21);
          if (v18) {
            [v5 addObject:v18];
          }
        }
        uint64_t v15 = [v6 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }
      while (v15);
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v19 = v4;
  }
  else
  {
    id v19 = [v4 description];
  }
  id v5 = v19;
LABEL_29:

  return v5;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)targetApplicationIdentifier
{
  return self->_targetApplicationIdentifier;
}

- (void)setTargetApplicationIdentifier:(id)a3
{
}

- (NSString)textAreaIdentifierOrLabel
{
  return self->_textAreaIdentifierOrLabel;
}

- (void)setTextAreaIdentifierOrLabel:(id)a3
{
}

- (NSString)textAreaSelectionRange
{
  return self->_textAreaSelectionRange;
}

- (void)setTextAreaSelectionRange:(id)a3
{
}

- (NSDictionary)customUserCommandProperties
{
  return self->_customUserCommandProperties;
}

- (void)setCustomUserCommandProperties:(id)a3
{
}

- (NSDictionary)recognitionProperties
{
  return self->_recognitionProperties;
}

- (void)setRecognitionProperties:(id)a3
{
}

- (NSDictionary)dictationProperties
{
  return self->_dictationProperties;
}

- (void)setDictationProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationProperties, 0);
  objc_storeStrong((id *)&self->_remoteSpeechOperationQueue, 0);
  objc_storeStrong((id *)&self->_recognitionProperties, 0);
  objc_storeStrong((id *)&self->_customUserCommandProperties, 0);
  objc_storeStrong((id *)&self->_textAreaSelectionRange, 0);
  objc_storeStrong((id *)&self->_textAreaIdentifierOrLabel, 0);
  objc_storeStrong((id *)&self->_targetApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end