@interface UIDictationConnection
+ (BOOL)dictationIsSupportedForLanguageCode:(id)a3 error:(id *)a4;
+ (BOOL)dictationRestricted;
+ (BOOL)hasSpeechRecognitionPauseAckPhrases:(id)a3;
+ (BOOL)isDictationAvailable;
+ (id)analytics;
+ (id)interpretationFromSpeechTokens:(id)a3 startIndex:(unint64_t)a4 filterBlock:(id)a5;
+ (void)_updateFromGlobalOptions:(id)a3;
+ (void)afDelegate:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7;
+ (void)cacheSupportedDictationLanguages;
- (AFDictationConnection)connection;
- (AFDictationOptions)dictationOptions;
- (BOOL)dictationIsAvailableForLanguage:(id)a3;
- (BOOL)ignoreSpeechRecognitionResults;
- (BOOL)isSecureInput;
- (BOOL)lowConfidenceAboutLanguageDetection;
- (BOOL)offlineOnly;
- (BOOL)receivedMultilingualResultsCommand;
- (BOOL)supportNewVoiceEditingCommandSPI;
- (NSMutableArray)lastUsedTopLanguages;
- (NSMutableDictionary)lastReceivedPartials;
- (NSString)lastUsedDetectedLanguage;
- (NSString)lastUsedPrimaryLanguage;
- (OS_dispatch_queue)analyticsQueue;
- (UIDictationConnectionDelegate)delegate;
- (UIDictationConnectionTokenFilterProtocol)tokenFilter;
- (float)averagePower;
- (id)_createConnectionOptions;
- (id)_dictationOptions:(id)a3;
- (id)_initializeWithOptions:(id)a3;
- (id)_speechOptions:(id)a3;
- (id)dictationSerializedResultWithPhrases:(id)a3 languageModel:(id)a4;
- (id)languageDetectionUserContext;
- (int64_t)speechEventTypeForDictationActivationType:(unint64_t)a3;
- (unsigned)charAfterInsertionPointOnDictationStart;
- (unsigned)charBeforeInsertionPointOnDictationStart;
- (void)_startWithOptions:(id)a3;
- (void)beginAvailabilityMonitoring;
- (void)cancelAvailabilityMonitoring;
- (void)cancelSpeech;
- (void)dictationConnection:(id)a3 didBeginLocalRecognitionWithModelInfo:(id)a4;
- (void)dictationConnection:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6;
- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7;
- (void)dictationConnection:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4;
- (void)dictationConnection:(id)a3 didRecognizeMultilingualSpeech:(id)a4;
- (void)dictationConnection:(id)a3 didRecognizePartialPackage:(id)a4 nluResult:(id)a5 languageModel:(id)a6;
- (void)dictationConnection:(id)a3 didRecognizePartialResult:(id)a4;
- (void)dictationConnection:(id)a3 didRecognizePhrases:(id)a4 languageModel:(id)a5 correctionIdentifier:(id)a6;
- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5;
- (void)dictationConnection:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 nluResult:(id)a5;
- (void)dictationConnection:(id)a3 languageDetectorFailedWithError:(id)a4;
- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidBeginWithOptions:(id)a4;
- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)dictationConnectionDidPauseRecognition:(id)a3;
- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3;
- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3;
- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3;
- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3;
- (void)dictationConnectionSpeechRecordingWillBegin:(id)a3;
- (void)dictationConnnectionDidChangeAvailability:(id)a3;
- (void)endSession;
- (void)euclidPhoneticString:(id)a3 maxResultsCount:(unint64_t)a4 completion:(id)a5;
- (void)logDidAcceptDictationResult:(id)a3 reason:(id)a4 result:(id)a5 correctionIdentifier:(id)a6;
- (void)logDidAcceptReplacement:(id)a3 replacementLanguageCode:(id)a4 originalText:(id)a5 correctionIdentifier:(id)a6 interactionIdentifier:(id)a7;
- (void)logDidSelectAlternative:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5;
- (void)logDidShowAlternatives:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5;
- (void)pauseSpeechRecognition;
- (void)preheat;
- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4;
- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4;
- (void)resumeSpeechRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)sendSpeechCorrection:(id)a3 forIdentifier:(id)a4;
- (void)sendSpeechCorrection:(id)a3 interactionIdentifier:(id)a4;
- (void)setAnalyticsQueue:(id)a3;
- (void)setCharAfterInsertionPointOnDictationStart:(unsigned int)a3;
- (void)setCharBeforeInsertionPointOnDictationStart:(unsigned int)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictationOptions:(id)a3;
- (void)setIgnoreSpeechRecognitionResults:(BOOL)a3;
- (void)setLastReceivedPartials:(id)a3;
- (void)setLastUsedDetectedLanguage:(id)a3;
- (void)setLastUsedPrimaryLanguage:(id)a3;
- (void)setLastUsedTopLanguages:(id)a3;
- (void)setLowConfidenceAboutLanguageDetection:(BOOL)a3;
- (void)setOfflineOnly:(BOOL)a3;
- (void)setReceivedMultilingualResultsCommand:(BOOL)a3;
- (void)setTokenFilter:(id)a3;
- (void)start;
- (void)startForFileAtURL:(id)a3 forLanguage:(id)a4;
- (void)stopSpeech:(id)a3 activationType:(unint64_t)a4 result:(id)a5 suppressAlert:(BOOL)a6;
- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4;
- (void)synthesizeDidRecognizePhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5;
- (void)synthesizeDidRecognizeTokens:(id)a3 languageModel:(id)a4;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9;
- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10;
@end

@implementation UIDictationConnection

+ (BOOL)dictationIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v5 = [a3 componentsSeparatedByString:@"_"];
  v6 = [v5 componentsJoinedByString:@"-"];

  if (cachedDictationLanguageCodes)
  {
    char v7 = [(id)cachedDictationLanguageCodes containsObject:v6];
LABEL_6:

    LOBYTE(v9) = v7;
    return (char)v9;
  }
  id v17 = 0;
  char v7 = [getAFDictationConnectionClass() dictationIsSupportedForLanguageCode:v6 error:&v17];
  id v8 = v17;
  if (a4 || (v7 & 1) != 0)
  {

    goto LABEL_6;
  }
  id v10 = v8;
  uint64_t v11 = [v8 code];
  v12 = (void *)MEMORY[0x1E4F28C58];
  if (v11 == 402)
  {
    v20 = @"UIDictationConnectionUnderlyingError";
    v21[0] = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v14 = v12;
    uint64_t v15 = 1;
  }
  else
  {
    v18 = @"UIDictationConnectionUnderlyingError";
    id v19 = v10;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v14 = v12;
    uint64_t v15 = -1;
  }
  id v9 = [v14 errorWithDomain:@"UIDictationConnection" code:v15 userInfo:v13];
  __break(1u);
  return (char)v9;
}

- (void)beginAvailabilityMonitoring
{
  id v2 = [(UIDictationConnection *)self connection];
  [v2 beginAvailabilityMonitoring];
}

- (BOOL)dictationIsAvailableForLanguage:(id)a3
{
  v4 = [a3 componentsSeparatedByString:@"_"];
  v5 = [v4 componentsJoinedByString:@"-"];

  v6 = [(UIDictationConnection *)self connection];
  LOBYTE(v4) = [v6 dictationIsAvailableForLanguage:v5];

  return (char)v4;
}

- (AFDictationConnection)connection
{
  p_connection = &self->_connection;
  connection = self->_connection;
  if (!connection)
  {
    v5 = self;
    objc_sync_enter(v5);
    if (!self->_connection)
    {
      id v6 = objc_alloc_init((Class)getAFDictationConnectionClass());
      if (v6)
      {
        objc_storeStrong((id *)p_connection, v6);
        [(AFDictationConnection *)*p_connection setDelegate:v5];
        id v7 = (id)[(id)objc_opt_class() analytics];
        uint64_t v8 = dispatch_get_global_queue(9, 0);
        analyticsQueue = v5->_analyticsQueue;
        v5->_analyticsQueue = (OS_dispatch_queue *)v8;
      }
    }
    objc_sync_exit(v5);

    connection = *p_connection;
  }
  return connection;
}

- (void)setTokenFilter:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

+ (id)analytics
{
  if (qword_1EB2619D0 != -1) {
    dispatch_once(&qword_1EB2619D0, &__block_literal_global_334);
  }
  id v2 = (void *)_MergedGlobals_1128;
  return v2;
}

+ (BOOL)isDictationAvailable
{
  return getAFDictationConnectionClass() != 0;
}

void __34__UIDictationConnection_analytics__block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)qword_1EB2619F8;
  uint64_t v8 = qword_1EB2619F8;
  if (!qword_1EB2619F8)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getAFAnalyticsClass_block_invoke;
    v4[3] = &unk_1E52D9900;
    v4[4] = &v5;
    __getAFAnalyticsClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  uint64_t v2 = [v1 sharedAnalytics];
  v3 = (void *)_MergedGlobals_1128;
  _MergedGlobals_1128 = v2;
}

- (void)dictationConnnectionDidChangeAvailability:(id)a3
{
  if (self->_connection == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnnectionDidChangeAvailability:self];
  }
}

- (void)cancelAvailabilityMonitoring
{
  id v2 = [(UIDictationConnection *)self connection];
  [v2 cancelAvailabilityMonitoring];
}

- (void)sendSpeechCorrection:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = objc_alloc_init((Class)getAFSpeechCorrectionInfoClass());
  objc_msgSend(v10, "setAlternativeSelectionCount:", (int)objc_msgSend(v7, "alternativeSelectionCount"));
  objc_msgSend(v10, "setCharacterModificationCount:", (int)objc_msgSend(v7, "characterModificationCount"));
  uint64_t v8 = [v7 correctedText];

  [v10 setCorrectedText:v8];
  id v9 = [(UIDictationConnection *)self connection];
  [v9 sendSpeechCorrection:v10 forIdentifier:v6];
}

- (void)sendSpeechCorrection:(id)a3 interactionIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v12 = objc_alloc_init((Class)getAFSpeechCorrectionInfoClass());
  objc_msgSend(v12, "setAlternativeSelectionCount:", (int)objc_msgSend(v7, "alternativeSelectionCount"));
  objc_msgSend(v12, "setCharacterModificationCount:", (int)objc_msgSend(v7, "characterModificationCount"));
  objc_msgSend(v12, "setCharacterInsertionCount:", (int)objc_msgSend(v7, "characterInsertionCount"));
  objc_msgSend(v12, "setCharacterDeletionCount:", (int)objc_msgSend(v7, "characterDeletionCount"));
  objc_msgSend(v12, "setCharacterSubstitutionCount:", (int)objc_msgSend(v7, "characterSubstitutionCount"));
  uint64_t v8 = [v7 correctedText];
  [v12 setCorrectedText:v8];

  id v9 = [v7 recognizedTextInfo];
  [v12 setRecognizedTextInfo:v9];

  id v10 = [v7 selectedAlternativesInfo];

  [v12 setSelectedAlternativesInfo:v10];
  uint64_t v11 = [(UIDictationConnection *)self connection];
  [v11 sendSpeechCorrection:v12 interactionIdentifier:v6];
}

- (float)averagePower
{
  id v2 = [(UIDictationConnection *)self connection];
  [v2 averagePower];
  float v4 = v3;

  return v4;
}

+ (void)cacheSupportedDictationLanguages
{
  id AFDictationConnectionClass = getAFDictationConnectionClass();
  [AFDictationConnectionClass fetchSupportedLanguageCodes:&__block_literal_global_107];
}

void __57__UIDictationConnection_cacheSupportedDictationLanguages__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = [a2 copy];
    float v3 = (void *)cachedDictationLanguageCodes;
    cachedDictationLanguageCodes = v2;
  }
}

- (void)endSession
{
  id v2 = [(UIDictationConnection *)self connection];
  [v2 endSession];
}

- (void)pauseSpeechRecognition
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  self->_ignoreSpeechRecognitionResults = 1;
  float v3 = _UIDictationConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[UIDictationConnection pauseSpeechRecognition]";
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting _ignoreSpeechRecognitionResults to YES and calling pauseRecognition", (uint8_t *)&v5, 0xCu);
  }

  float v4 = [(UIDictationConnection *)self connection];
  [v4 pauseRecognition];
}

- (void)resumeSpeechRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UIDictationConnection *)self connection];
  [v11 resumeRecognitionWithPrefixText:v10 postfixText:v9 selectedText:v8];
}

- (void)suppressLowStorageNotificationForLanguage:(id)a3 suppress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIDictationConnection *)self connection];
  [v7 suppressLowStorageNotificationForLanguage:v6 suppress:v4];
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9
{
  id v24 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v21 = [(UIDictationConnection *)self connection];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    v23 = [(UIDictationConnection *)self connection];
    [v23 updateVoiceCommandContextWithPrefixText:v24 postfixText:v15 selectedText:v16 disambiguationActive:v17 cursorInVisibleText:v18 favorCommandSuppression:v19 abortCommandSuppression:v20];
  }
}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v24 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if ([(UIDictationConnection *)self supportNewVoiceEditingCommandSPI])
  {
    v23 = [(UIDictationConnection *)self connection];
    [v23 updateVoiceCommandContextWithPrefixText:v24 postfixText:v16 selectedText:v17 disambiguationActive:v18 cursorInVisibleText:v19 favorCommandSuppression:v20 abortCommandSuppression:v21 undoEvent:v22];
  }
}

- (BOOL)supportNewVoiceEditingCommandSPI
{
  id v2 = [(UIDictationConnection *)self connection];
  char v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (void)requestOfflineDictationSupportForLanguage:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIDictationConnection *)self connection];
  id v10 = v8;
  if (v6) {
    id v9 = v6;
  }
  else {
    id v9 = &__block_literal_global_112;
  }
  [v8 requestOfflineDictationSupportForLanguage:v7 completion:v9];
}

+ (BOOL)dictationRestricted
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v2 = (uint64_t (*)(void))getAFDictationRestrictedSymbolLoc_ptr_0;
  id v10 = getAFDictationRestrictedSymbolLoc_ptr_0;
  if (!getAFDictationRestrictedSymbolLoc_ptr_0)
  {
    char v3 = AssistantServicesLibrary_0();
    v8[3] = (uint64_t)dlsym(v3, "AFDictationRestricted");
    getAFDictationRestrictedSymbolLoc_ptr_0 = (_UNKNOWN *)v8[3];
    id v2 = (uint64_t (*)(void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (v2) {
    return v2();
  }
  int v5 = [MEMORY[0x1E4F28B00] currentHandler];
  id v6 = [NSString stringWithUTF8String:"BOOL _AFDictationRestricted(void)"];
  objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"UIDictationConnection.m", 63, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (void)afDelegate:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
}

+ (void)_updateFromGlobalOptions:(id)a3
{
  uint64_t v3 = qword_1EB2619E0;
  id v5 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB2619E0, &__block_literal_global_114_1);
  }
  BOOL v4 = +[UIKeyboard keyboardBundleIdentifier];
  [v5 setApplicationName:v4];

  [v5 setApplicationVersion:qword_1EB2619D8];
  [v5 setReleaseAudioSessionOnRecordingCompletion:0];
}

void __50__UIDictationConnection__updateFromGlobalOptions___block_invoke()
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v3 infoDictionary];
  uint64_t v1 = [v0 objectForKey:*MEMORY[0x1E4F1D020]];
  id v2 = (void *)qword_1EB2619D8;
  qword_1EB2619D8 = v1;
}

- (id)languageDetectionUserContext
{
  id v2 = +[UIDictationConnectionPreferences sharedInstance];
  int v3 = [v2 isSmartLanguageSelectionEnabled];

  if (v3)
  {
    BOOL v4 = +[UIDictationController activeSLSDictationLanguages];
    if (v4)
    {
      id v5 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v30 = 0;
      v31 = &v30;
      uint64_t v32 = 0x2050000000;
      id v6 = (void *)getAFLanguageDetectionUserContextClass_softClass;
      uint64_t v33 = getAFLanguageDetectionUserContextClass_softClass;
      if (!getAFLanguageDetectionUserContextClass_softClass)
      {
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __getAFLanguageDetectionUserContextClass_block_invoke;
        v29[3] = &unk_1E52D9900;
        v29[4] = &v30;
        __getAFLanguageDetectionUserContextClass_block_invoke((uint64_t)v29);
        id v6 = (void *)v31[3];
      }
      uint64_t v7 = v6;
      _Block_object_dispose(&v30, 8);
      id v8 = objc_alloc_init(v7);
      [v8 setDictationLanguages:v4];
      uint64_t v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
      id v10 = [v9 preferencesActions];
      id v11 = [v10 inputModeSelectionSequence];

      objc_msgSend(v8, "setWasLanguageToggled:", (unint64_t)objc_msgSend(v11, "count") < 3);
      id v12 = [v5 currentInputMode];
      uint64_t v13 = [v12 dictationLanguage];
      [v8 setPrimaryLanguageCode:v13];

      v14 = [v5 currentInputMode];
      id v15 = [v14 multilingualLanguages];
      [v8 setMultiLingualKeyboardLanguages:v15];

      id v16 = [v5 currentInputModeInPreference];
      id v17 = [v16 identifier];
      id v18 = TIInputModeGetLanguageWithRegion();
      [v8 setGlobalLastUsedKeyboard:v18];

      id v19 = +[UIKeyboardImpl activeInstance];
      id v20 = [v19 textInputTraits];
      uint64_t v21 = [v20 keyboardType];

      if (v21 == 126)
      {
        id v22 = +[UIDictationController sharedInstance];
        v23 = [v22 lastMessageKeyboardLanguage];

        id v24 = +[UIKeyboardImpl activeInstance];
        v25 = [v24 textInputTraits];
        v26 = [v25 inputContextHistory];

        v27 = [v26 mostRecentTextEntries:10];
        [v8 setKeyboardConvoRecentMessages:v27];

        [v8 setPrevMessageLanguage:v23];
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_dictationOptions:(id)a3
{
  v38[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2050000000;
  id v5 = (void *)getAFDictationOptionsClass_softClass;
  uint64_t v36 = getAFDictationOptionsClass_softClass;
  if (!getAFDictationOptionsClass_softClass)
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __getAFDictationOptionsClass_block_invoke;
    v32[3] = &unk_1E52D9900;
    v32[4] = &v33;
    __getAFDictationOptionsClass_block_invoke((uint64_t)v32);
    id v5 = (void *)v34[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v33, 8);
  id v7 = objc_alloc_init(v6);
  [(id)objc_opt_class() _updateFromGlobalOptions:v7];
  [v7 setFieldLabel:&stru_1ED0E84C0];
  id v8 = [v4 fieldIdentifier];
  [v7 setFieldIdentifier:v8];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [v4 layoutIdentifier];
    [v7 setKeyboardIdentifier:v9];
  }
  uint64_t v10 = [v4 keyboardType];
  switch(v10)
  {
    case 1:
      uint64_t v11 = 2;
      break;
    case 2:
      goto LABEL_8;
    case 3:
      uint64_t v11 = 7;
      break;
    case 4:
      uint64_t v11 = 5;
      break;
    case 5:
      uint64_t v11 = 9;
      break;
    case 6:
      uint64_t v11 = 10;
      break;
    case 7:
      uint64_t v11 = 8;
      break;
    case 8:
      uint64_t v11 = 6;
      break;
    case 9:
      uint64_t v11 = 11;
      break;
    case 10:
      uint64_t v11 = 12;
      break;
    case 11:
      uint64_t v11 = 14;
      break;
    default:
      if (v10 == 123) {
LABEL_8:
      }
        uint64_t v11 = 4;
      else {
        uint64_t v11 = 1;
      }
      break;
  }
  [v7 setKeyboardType:v11];
  unint64_t v12 = [v4 returnKeyType];
  if (v12 > 0xB) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = qword_186B99FF0[v12];
  }
  [v7 setReturnKeyType:v13];
  if ([v7 returnKeyType] != 7
    && +[UIDictationController isInputDelegateSafariAddressBar])
  {
    [v7 setReturnKeyType:7];
  }
  objc_msgSend(v7, "setSecureOfflineOnly:", objc_msgSend(v4, "secureInput"));
  if ([v4 acceptsDictationSearchResults]) {
    [v7 setVoiceSearchTypeOptions:1];
  }
  v14 = [v4 prefixText];
  [v7 setPrefixText:v14];

  id v15 = [v4 postfixText];
  [v7 setPostfixText:v15];

  id v16 = [v4 selectedText];
  [v7 setSelectedText:v16];

  id v17 = +[UIDictationController sharedInstance];
  uint64_t v18 = [v17 dictationRequestOrigin];
  objc_msgSend(v7, "setDictationInputOrigin:", objc_msgSend((id)v18, "integerValue"));

  id v19 = +[UIDictationController sharedInstance];
  LOBYTE(v18) = [v19 smartLanguageSelectionOverridden];

  if ((v18 & 1) == 0)
  {
    id v20 = [(UIDictationConnection *)self languageDetectionUserContext];
    [v7 setLanguageDetectionUserContext:v20];
  }
  objc_msgSend(v7, "setPreferOnlineRecognition:", +[UIDictationController shouldPreferOnlineRecognition](UIDictationController, "shouldPreferOnlineRecognition"));
  objc_msgSend(v7, "setPreferOnDeviceRecognition:", +[UIDictationController shouldPreferOnDeviceRecognition](UIDictationController, "shouldPreferOnDeviceRecognition"));
  if (([v7 preferOnlineRecognition] & 1) == 0)
  {
    uint64_t v21 = [v7 languageDetectionUserContext];
    if (v21)
    {
LABEL_31:

      goto LABEL_42;
    }
    if ([v7 returnKeyType] != 7)
    {
      id v22 = +[UIDictationConnectionPreferences sharedInstance];
      v23 = [v4 languageCode];
      uint64_t v24 = [v22 isOnDeviceDictationSupportAvailableForLanguage:v23];

      [v7 setEmojiRecognition:v24];
      if (_os_feature_enabled_impl())
      {
        [v7 setDetectUtterances:1];
        [v7 setContinuousListening:1];
        [v7 setShouldHandleCapitalization:1];
        if (v24) {
          uint64_t v25 = [v4 shouldRecognizeCommands];
        }
        else {
          uint64_t v25 = 0;
        }
        [v7 setShouldRecognizeCommands:v25];
        [v7 setMaximumRecognitionDuration:-1.0];
      }
      if (+[UIKeyboard isMajelEnabled]
        && !+[UIDictationController supportsSiriDictationVoiceCommands]&& _os_feature_enabled_impl())
      {
        v37[0] = @"decoders.msg.lattice-biglm-lme-faster.inter-utt-sil";
        uint64_t v21 = [&unk_1ED3F4B90 stringValue];
        v38[0] = v21;
        v37[1] = @"decoders.msg.lattice-biglm-lme-faster.max-utt-length";
        v26 = [&unk_1ED3F4BA8 stringValue];
        v38[1] = v26;
        v37[2] = @"decoders.msg.lattice-biglm-lme-faster.max-utt-sil";
        v27 = [&unk_1ED3F4BC0 stringValue];
        v38[2] = v27;
        v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:3];
        [v7 setRecognitionOverrides:v28];

        goto LABEL_31;
      }
    }
  }
LABEL_42:
  if ([v7 returnKeyType] != 7) {
    objc_msgSend(v7, "setAutoPunctuation:", objc_msgSend(v4, "autoPunctuation"));
  }
  v29 = +[UIDictationController sharedInstance];
  uint64_t v30 = [v29 interactionIdentifier];
  [v7 setInteractionIdentifier:v30];

  return v7;
}

- (int64_t)speechEventTypeForDictationActivationType:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return qword_186B9A050[a3];
  }
}

- (id)_speechOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)getAFSpeechRequestOptionsClass()), "initWithActivationEvent:", -[UIDictationConnection speechEventTypeForDictationActivationType:](self, "speechEventTypeForDictationActivationType:", objc_msgSend(v4, "activationType")));
  [v5 setUseStreamingDictation:1];
  if ([v4 useAutomaticEndpointing])
  {
    if ([v4 secureInput]) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v5 setEndpointerOperationMode:v6];
  id v7 = [v4 activationIdentifier];
  [v5 setActivationDeviceIdentifier:v7];

  id v8 = [v4 turnIdentifier];
  [v5 setTurnIdentifier:v8];

  return v5;
}

- (id)_createConnectionOptions
{
  int v3 = objc_alloc_init(UIDictationConnectionOptions);
  [(UIDictationConnectionOptions *)v3 setVersion:1];
  [(UIDictationConnectionOptions *)v3 setActivationType:0];
  [(UIDictationConnectionOptions *)v3 setLanguageCode:0];
  [(UIDictationConnectionOptions *)v3 setRegionCode:0];
  [(UIDictationConnectionOptions *)v3 setFieldIdentifier:&stru_1ED0E84C0];
  [(UIDictationConnectionOptions *)v3 setActivationIdentifier:0];
  [(UIDictationConnectionOptions *)v3 setLayoutIdentifier:0];
  [(UIDictationConnectionOptions *)v3 setKeyboardType:0];
  [(UIDictationConnectionOptions *)v3 setReturnKeyType:0];
  [(UIDictationConnectionOptions *)v3 setSecureInput:0];
  [(UIDictationConnectionOptions *)v3 setUseAutomaticEndpointing:1];
  [(UIDictationConnectionOptions *)v3 setAcceptsDictationSearchResults:0];
  [(UIDictationConnectionOptions *)v3 setPrefixText:0];
  [(UIDictationConnectionOptions *)v3 setSelectedText:0];
  [(UIDictationConnectionOptions *)v3 setPostfixText:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained dictationConnection:self updateOptions:v3];

  self->_offlineOnly = [(UIDictationConnectionOptions *)v3 secureInput];
  return v3;
}

- (void)start
{
  id v7 = [(UIDictationConnection *)self _createConnectionOptions];
  int v3 = -[UIDictationConnection _initializeWithOptions:](self, "_initializeWithOptions:");
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnection:self didFailRecordingWithError:v3];
  }
  else
  {
    id WeakRetained = +[UIKeyboardImpl sharedInstance];
    id v5 = [WeakRetained inputDelegate];
    self->_charBeforeInsertionPointOnDictationStart = [v5 _characterBeforeCaretSelection];

    uint64_t v6 = [WeakRetained inputDelegate];
    self->_charAfterInsertionPointOnDictationStart = [v6 _characterAfterCaretSelection];

    [(UIDictationConnection *)self _startWithOptions:v7];
  }
}

- (void)startForFileAtURL:(id)a3 forLanguage:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [(UIDictationConnection *)self _createConnectionOptions];
  id v8 = [(UIDictationConnection *)self _initializeWithOptions:v7];
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnection:self didFailRecordingWithError:v8];
  }
  else
  {
    id WeakRetained = [(UIDictationConnection *)self _dictationOptions:v7];
    uint64_t v10 = [(UIDictationConnection *)self connection];
    [v10 startDictationWithSpeechFileAtURL:v11 options:WeakRetained forLanguage:v6];
  }
}

- (id)_initializeWithOptions:(id)a3
{
  int v3 = [(UIDictationConnection *)self connection];
  if (v3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"UIDictationConnection" code:0 userInfo:0];
  }

  return v4;
}

- (void)_startWithOptions:(id)a3
{
  v74[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[UIDictationController sharedInstance];
  int v6 = [v5 smartLanguageSelectionOverridden];

  if (v6)
  {
    id v7 = +[UIDictationController sharedInstance];
    uint64_t v8 = [(__CFString *)v7 smartLanguageSelectionOverrideLanguage];
  }
  else
  {
    uint64_t v9 = [v4 languageCode];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      unint64_t v12 = [MEMORY[0x1E4F1CA20] preferredLocale];
      id v11 = [v12 languageCode];
    }
    id v7 = [v4 regionCode];
    if ([(__CFString *)v11 isEqualToString:@"ko"]
      && [(__CFString *)v7 isEqualToString:@"KO"])
    {

      id v7 = @"KR";
    }
    else if (!v7)
    {
      goto LABEL_12;
    }
    uint64_t v8 = [NSString stringWithFormat:@"%@-%@", v11, v7];
  }
  id v11 = (__CFString *)v8;
LABEL_12:
  [v4 setLanguageCode:v11];
  uint64_t v13 = [(UIDictationConnection *)self _dictationOptions:v4];
  [(UIDictationConnection *)self setDictationOptions:v13];

  v14 = [(UIDictationConnection *)self _speechOptions:v4];
  id v15 = +[UIDictationController sharedInstance];
  uint64_t v16 = [v15 reasonType];

  uint64_t v17 = +[UIDictationController UIDictationStartStopReasonTypeDescription:v16];
  uint64_t v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = &stru_1ED0E84C0;
  }
  v74[0] = v19;
  v73[0] = @"startDictation";
  v73[1] = @"leftContext";
  uint64_t v20 = [v4 prefixText];
  uint64_t v21 = (void *)v20;
  if (v20) {
    id v22 = (__CFString *)v20;
  }
  else {
    id v22 = &stru_1ED0E84C0;
  }
  v74[1] = v22;
  v73[2] = @"rightContext";
  uint64_t v23 = [v4 postfixText];
  uint64_t v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = &stru_1ED0E84C0;
  }
  v74[2] = v25;
  v73[3] = @"selectedText";
  uint64_t v26 = [v4 selectedText];
  v27 = (void *)v26;
  if (v26) {
    v28 = (__CFString *)v26;
  }
  else {
    v28 = &stru_1ED0E84C0;
  }
  v74[3] = v28;
  v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:4];
  v64 = v14;
  [v14 setStartContext:v29];

  uint64_t v30 = _UIDictationConnectionLog();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = [(UIDictationConnection *)self dictationOptions];
    if ([v31 preferOnlineRecognition]) {
      uint64_t v32 = @"YES";
    }
    else {
      uint64_t v32 = @"NO";
    }
    *(_DWORD *)buf = 136315394;
    v66 = "-[UIDictationConnection _startWithOptions:]";
    __int16 v67 = 2112;
    v68 = v32;
    _os_log_impl(&dword_1853B0000, v30, OS_LOG_TYPE_DEFAULT, "%s shouldPreferOnlineRecognition=%@", buf, 0x16u);
  }
  uint64_t v33 = [(UIDictationConnection *)self dictationOptions];
  v34 = [v33 languageDetectionUserContext];

  uint64_t v35 = [v34 userContextLanguageCodeForKeyboardLangauge:v11 overrideLanguageCode:0];
  uint64_t v36 = (void *)v35;
  if (v35) {
    v37 = (void *)v35;
  }
  else {
    v37 = v11;
  }
  id v38 = v37;

  v39 = [v38 componentsSeparatedByString:@"-"];

  v40 = [v39 componentsJoinedByString:@"_"];

  [(UIDictationConnection *)self setLastUsedPrimaryLanguage:v40];
  [(UIDictationConnection *)self setLastUsedDetectedLanguage:0];
  [(UIDictationConnection *)self setLastUsedTopLanguages:0];
  [(UIDictationConnection *)self setLowConfidenceAboutLanguageDetection:0];
  [(UIDictationConnection *)self setReceivedMultilingualResultsCommand:0];
  v41 = [MEMORY[0x1E4F1CA60] dictionary];
  [(UIDictationConnection *)self setLastReceivedPartials:v41];

  v42 = _UIDictationConnectionLog();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = [(UIDictationConnection *)self dictationOptions];
    v44 = [v43 languageDetectionUserContext];
    *(_DWORD *)buf = 136315906;
    v45 = @"YES";
    if (v44) {
      v45 = @"NO";
    }
    v66 = "-[UIDictationConnection _startWithOptions:]";
    __int16 v67 = 2112;
    v68 = v11;
    __int16 v69 = 2112;
    v70 = v40;
    __int16 v71 = 2112;
    v72 = v45;
    _os_log_impl(&dword_1853B0000, v42, OS_LOG_TYPE_DEFAULT, "%s languageCode %@ siriDictationWithLanguageCode %@ monolingual %@", buf, 0x2Au);
  }
  v46 = +[UIDictationConnectionPreferences sharedInstance];
  uint64_t v47 = [v46 isOnDeviceDictationSupportAvailableForLanguage:v11];
  v48 = +[UIKeyboardInputMode dictationInputMode];
  [v48 setIsCurrentDictationLanguageOnDevice:v47];

  v49 = [(UIDictationConnection *)self dictationOptions];
  if ([v49 detectUtterances])
  {
    v50 = +[UIKeyboardInputMode dictationInputMode];
    int v51 = [v50 isCurrentDictationLanguageOnDevice];

    if (v51)
    {
      BOOL v52 = +[UIKeyboard isMajelEnabled];
      v53 = +[UIKeyboardInputMode dictationInputMode];
      [v53 setUsingTypeAndTalk:v52];

      v54 = _UIDictationConnectionLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        v55 = +[UIKeyboardInputMode dictationInputMode];
        int v56 = [v55 usingTypeAndTalk];
        *(_DWORD *)buf = 136315394;
        v66 = "-[UIDictationConnection _startWithOptions:]";
        __int16 v67 = 1024;
        LODWORD(v68) = v56;
        _os_log_impl(&dword_1853B0000, v54, OS_LOG_TYPE_DEFAULT, "%s usingTypeAndTalk = %d", buf, 0x12u);
      }
      goto LABEL_43;
    }
  }
  else
  {
  }
  v57 = +[UIKeyboardInputMode dictationInputMode];
  int v58 = [v57 usingTypeAndTalk];

  if (!v58) {
    goto LABEL_44;
  }
  v54 = +[UIKeyboardInputMode dictationInputMode];
  [v54 setUsingTypeAndTalk:0];
LABEL_43:

LABEL_44:
  v59 = _UIDictationConnectionLog();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    BOOL ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
    *(_DWORD *)buf = 136315394;
    v66 = "-[UIDictationConnection _startWithOptions:]";
    __int16 v67 = 1024;
    LODWORD(v68) = ignoreSpeechRecognitionResults;
    _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_DEFAULT, "%s Setting _ignoreSpeechRecognitionResults=%d", buf, 0x12u);
  }

  self->_BOOL ignoreSpeechRecognitionResults = 0;
  v61 = _UIDictationConnectionLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "-[UIDictationConnection _startWithOptions:]";
    _os_log_impl(&dword_1853B0000, v61, OS_LOG_TYPE_DEFAULT, "%s Calling startDictationWithLanguageCode on delegate", buf, 0xCu);
  }

  v62 = [(UIDictationConnection *)self connection];
  v63 = [(UIDictationConnection *)self dictationOptions];
  [v62 startDictationWithLanguageCode:v11 options:v63 speechOptions:v64];
}

- (void)stopSpeech:(id)a3 activationType:(unint64_t)a4 result:(id)a5 suppressAlert:(BOOL)a6
{
  BOOL v6 = a6;
  v24[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (__CFString *)a3;
  id v11 = a5;
  unint64_t v12 = objc_msgSend(objc_alloc((Class)getAFSpeechRequestOptionsClass()), "initWithActivationEvent:", -[UIDictationConnection speechEventTypeForDictationActivationType:](self, "speechEventTypeForDictationActivationType:", a4));
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v12 setSuppressStopAlert:1];
  }
  uint64_t v23 = @"stopDictation";
  v24[0] = v10;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
  [v12 setStopContext:v13];

  if (v11)
  {
    v14 = (void *)MEMORY[0x1E4F1CA60];
    id v15 = [v12 stopContext];
    uint64_t v16 = [v14 dictionaryWithDictionary:v15];

    if (v10) {
      uint64_t v17 = v10;
    }
    else {
      uint64_t v17 = &stru_1ED0E84C0;
    }
    [v16 setObject:v17 forKey:@"submitDictation"];
    uint64_t v18 = +[UIDictationController removeTextIfNeeded:v11];
    id v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    else {
      uint64_t v20 = &stru_1ED0E84C0;
    }
    [v16 setObject:v20 forKey:@"recognitionResult"];

    uint64_t v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v16];
    [v12 setStopContext:v21];
  }
  id v22 = [(UIDictationConnection *)self connection];
  [v22 stopSpeechWithOptions:v12];
}

- (void)cancelSpeech
{
  int v3 = +[UIDictationController sharedInstance];
  uint64_t v4 = [v3 reasonType];

  if (v4 == 20)
  {
    id v5 = +[UIDictationController sharedInstance];
    BOOL v6 = [v5 lastHypothesis];

    id v7 = +[UIDictationController sharedInstance];
    uint64_t v8 = [v7 keyboardInputModeToReturn];
    uint64_t v9 = [v8 primaryLanguage];

    uint64_t v10 = +[UIDictationController sharedInstance];
    id v11 = [v10 interactionIdentifier];

    analyticsQueue = self->_analyticsQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__UIDictationConnection_cancelSpeech__block_invoke;
    block[3] = &unk_1E52DCB30;
    id v18 = v6;
    id v19 = v9;
    id v20 = v11;
    id v13 = v11;
    id v14 = v9;
    id v15 = v6;
    dispatch_async(analyticsQueue, block);
  }
  uint64_t v16 = [(UIDictationConnection *)self connection];
  [v16 cancelSpeech];
}

void __37__UIDictationConnection_cancelSpeech__block_invoke(void *a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[UIDictationController UIDictationStartStopReasonTypeDescription:20];
  int v3 = (void *)v2;
  if (v2) {
    uint64_t v4 = (__CFString *)v2;
  }
  else {
    uint64_t v4 = &stru_1ED0E84C0;
  }
  v13[0] = @"stopDictation";
  v13[1] = @"submitDictation";
  v14[0] = v4;
  v14[1] = v4;
  v13[2] = @"recognitionResult";
  uint64_t v5 = +[UIDictationController removeTextIfNeeded:a1[4]];
  BOOL v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_1ED0E84C0;
  }
  uint64_t v8 = (__CFString *)a1[5];
  uint64_t v9 = (__CFString *)a1[6];
  if (!v8) {
    uint64_t v8 = &stru_1ED0E84C0;
  }
  v14[2] = v7;
  v14[3] = v8;
  v13[3] = 0x1ED1433E0;
  v13[4] = @"dictationUIInteractionIdentifier";
  if (v9) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = &stru_1ED0E84C0;
  }
  v14[4] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  unint64_t v12 = +[UIDictationConnection analytics];
  [v12 logEventWithType:2202 context:v11];
}

- (void)logDidShowAlternatives:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__UIDictationConnection_logDidShowAlternatives_correctionIdentifier_interactionIdentifier___block_invoke;
  block[3] = &unk_1E52DCB30;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(analyticsQueue, block);
}

void __91__UIDictationConnection_logDidShowAlternatives_correctionIdentifier_interactionIdentifier___block_invoke(void *a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (v1)
  {
    v12[0] = @"alternatesShown";
    v12[1] = @"correctionIdentifier";
    uint64_t v2 = MEMORY[0x1E4F1CC08];
    int v3 = (__CFString *)a1[6];
    if (a1[5]) {
      uint64_t v2 = a1[5];
    }
    v13[0] = v1;
    v13[1] = v2;
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = &stru_1ED0E84C0;
    }
    v13[2] = v4;
    v12[2] = @"dictationUIInteractionIdentifier";
    v12[3] = 0x1ED1433E0;
    uint64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
    BOOL v6 = [v5 currentInputMode];
    uint64_t v7 = [v6 primaryLanguage];
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    else {
      id v9 = &stru_1ED0E84C0;
    }
    v13[3] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

    id v11 = +[UIDictationConnection analytics];
    [v11 logEventWithType:2202 context:v10];
  }
}

- (void)logDidSelectAlternative:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __92__UIDictationConnection_logDidSelectAlternative_correctionIdentifier_interactionIdentifier___block_invoke;
  block[3] = &unk_1E52DCB30;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(analyticsQueue, block);
}

void __92__UIDictationConnection_logDidSelectAlternative_correctionIdentifier_interactionIdentifier___block_invoke(void *a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1[4];
  if (v1)
  {
    v12[0] = @"alternateSelected";
    v12[1] = @"correctionIdentifier";
    uint64_t v2 = MEMORY[0x1E4F1CC08];
    int v3 = (__CFString *)a1[6];
    if (a1[5]) {
      uint64_t v2 = a1[5];
    }
    v13[0] = v1;
    v13[1] = v2;
    if (v3) {
      uint64_t v4 = v3;
    }
    else {
      uint64_t v4 = &stru_1ED0E84C0;
    }
    v13[2] = v4;
    v12[2] = @"dictationUIInteractionIdentifier";
    v12[3] = 0x1ED1433E0;
    uint64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
    BOOL v6 = [v5 currentInputMode];
    uint64_t v7 = [v6 primaryLanguage];
    id v8 = (void *)v7;
    if (v7) {
      id v9 = (__CFString *)v7;
    }
    else {
      id v9 = &stru_1ED0E84C0;
    }
    v13[3] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

    id v11 = +[UIDictationConnection analytics];
    [v11 logEventWithType:2202 context:v10];
  }
}

- (void)logDidAcceptDictationResult:(id)a3 reason:(id)a4 result:(id)a5 correctionIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (![v10 count])
  {
    id v14 = 0;
    goto LABEL_6;
  }
  id v14 = +[UIDictationController whitelistedDictationDictionariesFromMetadataDictionaries:v10];
  if (!v14)
  {
LABEL_6:
    id v20 = 0;
    id v15 = 0;
    goto LABEL_8;
  }
  id v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];
  if (v15)
  {
    uint64_t v26 = (void *)MEMORY[0x1E4F1CAD0];
    v27 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_msgSend(v26, "setWithObjects:", v16, v17, v18, objc_opt_class(), 0);
    id v20 = [v27 unarchivedObjectOfClasses:v19 fromData:v15 error:0];

    id v14 = (void *)v19;
  }
  else
  {
    id v20 = 0;
  }
LABEL_8:

  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__UIDictationConnection_logDidAcceptDictationResult_reason_result_correctionIdentifier___block_invoke;
  block[3] = &unk_1E52DD450;
  id v29 = v20;
  id v30 = v11;
  id v31 = v12;
  id v32 = v13;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  id v25 = v20;
  dispatch_async(analyticsQueue, block);
}

void __88__UIDictationConnection_logDidAcceptDictationResult_reason_result_correctionIdentifier___block_invoke(uint64_t a1)
{
  v31[5] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v2 = *(void **)(a1 + 32);
    int v3 = *(__CFString **)(a1 + 40);
    if (!v3) {
      int v3 = &stru_1ED0E84C0;
    }
    v31[0] = v3;
    v30[0] = @"submitDictation";
    v30[1] = @"recognitionResult";
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = [v2 lastObject];
    uint64_t v6 = +[UIDictationController removeTextIfNeeded:v4 metadata:v5];
    uint64_t v7 = (void *)v6;
    if (v6) {
      id v8 = (__CFString *)v6;
    }
    else {
      id v8 = &stru_1ED0E84C0;
    }
    uint64_t v9 = *(void *)(a1 + 32);
    v31[1] = v8;
    v31[2] = v9;
    v30[2] = @"edits";
    v30[3] = 0x1ED1433E0;
    id v10 = +[UIKeyboardInputModeController sharedInputModeController];
    id v11 = [v10 currentInputMode];
    uint64_t v12 = [v11 primaryLanguage];
    id v13 = (void *)v12;
    if (v12) {
      id v14 = (__CFString *)v12;
    }
    else {
      id v14 = &stru_1ED0E84C0;
    }
    v31[3] = v14;
    v30[4] = @"dictationUIInteractionIdentifier";
    id v15 = +[UIDictationController sharedInstance];
    uint64_t v16 = [v15 interactionIdentifier];
    uint64_t v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = (__CFString *)v16;
    }
    else {
      uint64_t v18 = &stru_1ED0E84C0;
    }
    v31[4] = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:5];
  }
  else
  {
    v28[0] = @"submitDictation";
    v28[1] = @"recognitionResult";
    id v20 = *(__CFString **)(a1 + 40);
    uint64_t v21 = *(__CFString **)(a1 + 48);
    if (!v20) {
      id v20 = &stru_1ED0E84C0;
    }
    if (!v21) {
      uint64_t v21 = &stru_1ED0E84C0;
    }
    v29[0] = v20;
    v29[1] = v21;
    uint64_t v22 = *(void *)(a1 + 56);
    if (!v22) {
      uint64_t v22 = MEMORY[0x1E4F1CC08];
    }
    v29[2] = v22;
    v28[2] = @"correctionIdentifier";
    v28[3] = 0x1ED1433E0;
    uint64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v7 = [v5 currentInputMode];
    uint64_t v23 = [v7 primaryLanguage];
    id v10 = (void *)v23;
    if (v23) {
      id v24 = (__CFString *)v23;
    }
    else {
      id v24 = &stru_1ED0E84C0;
    }
    v29[3] = v24;
    v28[4] = @"dictationUIInteractionIdentifier";
    id v11 = +[UIDictationController sharedInstance];
    uint64_t v25 = [v11 interactionIdentifier];
    id v13 = (void *)v25;
    if (v25) {
      uint64_t v26 = (__CFString *)v25;
    }
    else {
      uint64_t v26 = &stru_1ED0E84C0;
    }
    v29[4] = v26;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:5];
  }

  v27 = +[UIDictationConnection analytics];
  [v27 logEventWithType:2202 context:v19];
}

- (void)logDidAcceptReplacement:(id)a3 replacementLanguageCode:(id)a4 originalText:(id)a5 correctionIdentifier:(id)a6 interactionIdentifier:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  analyticsQueue = self->_analyticsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__UIDictationConnection_logDidAcceptReplacement_replacementLanguageCode_originalText_correctionIdentifier_interactionIdentifier___block_invoke;
  block[3] = &unk_1E52DF078;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v28 = v15;
  id v29 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(analyticsQueue, block);
  uint64_t v23 = [(UIDictationConnection *)self connection];
  [v23 sendUserSelectedAlternativeDictationLanguageCode:v21];
}

void __129__UIDictationConnection_logDidAcceptReplacement_replacementLanguageCode_originalText_correctionIdentifier_interactionIdentifier___block_invoke(void *a1)
{
  v19[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"text";
  v16[1] = @"languageCode";
  uint64_t v2 = (__CFString *)a1[4];
  int v3 = (__CFString *)a1[5];
  if (!v2) {
    uint64_t v2 = &stru_1ED0E84C0;
  }
  if (!v3) {
    int v3 = &stru_1ED0E84C0;
  }
  v17[0] = v2;
  v17[1] = v3;
  v16[2] = @"originalText";
  uint64_t v4 = (__CFString *)a1[6];
  if (!v4) {
    uint64_t v4 = &stru_1ED0E84C0;
  }
  v17[2] = v4;
  v18[0] = @"replacementInfo";
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];
  uint64_t v6 = (void *)v5;
  uint64_t v7 = a1[7];
  if (!v7) {
    uint64_t v7 = MEMORY[0x1E4F1CC08];
  }
  v19[0] = v5;
  v19[1] = v7;
  v18[1] = @"correctionIdentifier";
  v18[2] = 0x1ED1433E0;
  id v8 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v9 = [v8 currentInputMode];
  uint64_t v10 = [v9 primaryLanguage];
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = &stru_1ED0E84C0;
  }
  v18[3] = @"dictationUIInteractionIdentifier";
  id v13 = (__CFString *)a1[8];
  if (!v13) {
    id v13 = &stru_1ED0E84C0;
  }
  v19[2] = v12;
  v19[3] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];

  id v15 = +[UIDictationConnection analytics];
  [v15 logEventWithType:2202 context:v14];
}

- (void)synthesizeDidRecognizeTokens:(id)a3 languageModel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIDictationConnection *)self connection];
  [(UIDictationConnection *)self dictationConnection:v8 didRecognizeTokens:v7 languageModel:v6];
}

- (void)synthesizeDidRecognizePhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UIDictationConnection *)self connection];
  [(UIDictationConnection *)self dictationConnection:v11 didRecognizePhrases:v10 languageModel:v9 correctionIdentifier:v8];
}

- (void)preheat
{
  id v2 = [(UIDictationConnection *)self connection];
  [v2 preheat];
}

+ (id)interpretationFromSpeechTokens:(id)a3 startIndex:(unint64_t)a4 filterBlock:(id)a5
{
  id v7 = a3;
  id v8 = (void (**)(id, id, unint64_t, unsigned char *))a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v10 = [v7 count];
  double v11 = 0.0;
  double v12 = 0.0;
  if (v10 > a4)
  {
    unint64_t v13 = v10 - 1;
    while (1)
    {
      id v14 = [v7 objectAtIndex:a4];
      unsigned __int8 v21 = 0;
      id v15 = v14;
      if (v8)
      {
        v8[2](v8, v15, a4, &v21);
        if (v21) {
          goto LABEL_7;
        }
      }
      if (v15) {
        break;
      }
      int v17 = 0;
LABEL_9:

      if (v13 != a4)
      {
        ++a4;
        if (!v17) {
          continue;
        }
      }
      goto LABEL_11;
    }
    [v9 addObject:v15];
    [v15 confidenceScore];
    double v12 = v12 + v16;
LABEL_7:

    int v17 = v21;
    goto LABEL_9;
  }
LABEL_11:
  id v18 = [UIDictationInterpretation alloc];
  if ([v9 count]) {
    double v11 = v12 / (double)(unint64_t)[v9 count];
  }
  id v19 = [(UIDictationInterpretation *)v18 initWithTokens:v9 score:v11];

  return v19;
}

- (BOOL)isSecureInput
{
  return self->_offlineOnly;
}

+ (BOOL)hasSpeechRecognitionPauseAckPhrases:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    uint64_t v4 = [v3 firstObject];
    uint64_t v5 = [v4 interpretations];
    if ([v5 count] == 1)
    {
      id v6 = [v3 firstObject];
      id v7 = [v6 interpretations];
      id v8 = [v7 firstObject];
      id v9 = [v8 tokens];
      if ([v9 count] == 1)
      {
        int v17 = [v3 firstObject];
        double v16 = [v17 interpretations];
        id v15 = [v16 firstObject];
        [v15 tokens];
        unint64_t v10 = v18 = v6;
        double v11 = [v10 firstObject];
        double v12 = [v11 text];
        char v13 = [v12 isEqualToString:@"DUMMYTOKEN"];

        id v6 = v18;
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (void)dictationConnection:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  unint64_t v10 = (AFDictationConnection *)a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [v11 componentsSeparatedByString:@"-"];
  id v14 = [v13 componentsJoinedByString:@"_"];
  [(UIDictationConnection *)self setLastUsedDetectedLanguage:v14];

  id v15 = +[UIKeyboardImpl sharedInstance];
  double v16 = [v15 textInputTraits];
  unint64_t v17 = [v16 keyboardType];

  if (v17 > 0xB || ((1 << v17) & 0x930) == 0)
  {
    uint64_t v35 = +[UIDictationController sharedInstance];
    uint64_t v36 = [v35 currentKeyboardPrimaryLanguage];

    LODWORD(v35) = UIKeyboardInputModeIsDefaultRightToLeft(v36);
    v37 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
    int IsDefaultRightToLeft = UIKeyboardInputModeIsDefaultRightToLeft(v37);

    if (v35 != IsDefaultRightToLeft)
    {
      unsigned int charBeforeInsertionPointOnDictationStart = self->_charBeforeInsertionPointOnDictationStart;
      if (charBeforeInsertionPointOnDictationStart == 10 || !charBeforeInsertionPointOnDictationStart)
      {
        unsigned int charAfterInsertionPointOnDictationStart = self->_charAfterInsertionPointOnDictationStart;
        if (charAfterInsertionPointOnDictationStart == 10 || !charAfterInsertionPointOnDictationStart)
        {
          v41 = +[UIKeyboardImpl sharedInstance];
          v42 = [v41 inputDelegate];

          v43 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
          uint64_t v44 = UIKeyboardInputModeIsDefaultRightToLeft(v43);
          v45 = [v42 selectedTextRange];
          [v42 setBaseWritingDirection:v44 forRange:v45];
        }
      }
    }
  }
  id v19 = [v12 keysSortedByValueUsingComparator:&__block_literal_global_173_1];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(UIDictationConnection *)self setLastUsedTopLanguages:v20];

  unint64_t v21 = [v19 count];
  if (v21 >= 3) {
    unint64_t v22 = 3;
  }
  else {
    unint64_t v22 = v21;
  }
  if (v22 >= 2)
  {
    for (uint64_t i = 1; i != v22; ++i)
    {
      id v24 = [(UIDictationConnection *)self lastUsedTopLanguages];
      id v25 = [v19 objectAtIndexedSubscript:i];
      [v24 addObject:v25];
    }
  }
  self->_lowConfidenceAboutLanguageDetection = !a6;
  if (self->_connection == v10)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnection:self didDetectLanguage:v11];

    id v27 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v46 = 136315394;
      uint64_t v47 = "-[UIDictationConnection dictationConnection:didDetectLanguage:confidenceScores:isConfident:]";
      __int16 v48 = 2112;
      id v49 = v11;
      _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "%s languageCode %@", (uint8_t *)&v46, 0x16u);
    }

    if (!self->_receivedMultilingualResultsCommand)
    {
      id v28 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
      id v29 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
      char v30 = [v28 isEqualToString:v29];

      if ((v30 & 1) == 0)
      {
        id v31 = [(UIDictationConnection *)self lastReceivedPartials];
        id v32 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
        uint64_t v33 = [v31 objectForKeyedSubscript:v32];

        if (v33)
        {
          v34 = _UIDictationConnectionLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            int v46 = 136315394;
            uint64_t v47 = "-[UIDictationConnection dictationConnection:didDetectLanguage:confidenceScores:isConfident:]";
            __int16 v48 = 2112;
            id v49 = v11;
            _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_DEFAULT, "%s Replaying last partial result for %@ by calling didRecognizePartialResult", (uint8_t *)&v46, 0x16u);
          }

          [(UIDictationConnection *)self dictationConnection:v10 didRecognizePartialResult:v33];
        }
      }
    }
  }
}

uint64_t __92__UIDictationConnection_dictationConnection_didDetectLanguage_confidenceScores_isConfident___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (void)dictationConnection:(id)a3 languageDetectorFailedWithError:(id)a4
{
  if (self->_connection == a3)
  {
    id v4 = [(UIDictationConnection *)self dictationOptions];
    [v4 setLanguageDetectionUserContext:0];
  }
}

- (void)dictationConnectionSpeechRecordingWillBegin:(id)a3
{
  if (self->_connection == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnectionWillStartRecording:self];
  }
}

- (void)dictationConnectionSpeechRecordingDidBegin:(id)a3
{
  if (self->_connection == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnectionDidStartRecording:self];
  }
}

- (void)dictationConnection:(id)a3 speechRecordingDidBeginWithOptions:(id)a4
{
  if (self->_connection == a3)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained dictationConnection:self didStartRecordingWithOptions:v6];
  }
}

- (void)dictationConnection:(id)a3 didBeginLocalRecognitionWithModelInfo:(id)a4
{
  if (self->_connection == a3)
  {
    p_delegate = &self->_delegate;
    id v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained dictationConnection:self didBeginLocalRecognitionWithModelInfo:v6];
  }
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v6 = (AFDictationConnection *)a3;
  if (self->_connection == v6)
  {
    self->_connection = 0;
    id v7 = a4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = (void *)MEMORY[0x1E4F28C58];
    id v12 = @"UIDictationConnectionUnderlyingError";
    v13[0] = v7;
    unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    id v11 = [v9 errorWithDomain:@"UIDictationConnection" code:-1 userInfo:v10];

    [WeakRetained dictationConnection:self didFailRecordingWithError:v11];
  }
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = (AFDictationConnection *)a3;
  id v7 = a4;
  if (self->_connection == v6)
  {
    self->_connection = 0;

    if ([v7 code] == 6)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = @"UIDictationConnectionUnderlyingError";
      v24[0] = v7;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      unint64_t v10 = v8;
      uint64_t v11 = 2;
    }
    else if ([v7 code] == 602)
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v21 = @"UIDictationConnectionUnderlyingError";
      id v22 = v7;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      unint64_t v10 = v12;
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v13 = [v7 code];
      id v14 = (void *)MEMORY[0x1E4F28C58];
      if (v13 == 603)
      {
        id v19 = @"UIDictationConnectionUnderlyingError";
        id v20 = v7;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        unint64_t v10 = v14;
        uint64_t v11 = 4;
      }
      else
      {
        unint64_t v17 = @"UIDictationConnectionUnderlyingError";
        id v18 = v7;
        id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        unint64_t v10 = v14;
        uint64_t v11 = -1;
      }
    }
    id v15 = [v10 errorWithDomain:@"UIDictationConnection" code:v11 userInfo:v9];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnection:self didFailRecognitionWithError:v15];
  }
}

- (void)dictationConnectionSpeechRecordingDidEnd:(id)a3
{
  if (self->_connection == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnectionDidEndRecording:self];
  }
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
  id v4 = (AFDictationConnection *)a3;
  if (self->_connection == v4)
  {
    self->_connection = 0;
    id v6 = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnectionDidCancel:self];

    id v4 = v6;
  }
}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = (AFDictationConnection *)a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_connection == v8)
  {
    uint64_t v11 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[UIDictationConnection dictationConnection:didRecognizeTokens:languageModel:]";
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    if (self->_ignoreSpeechRecognitionResults)
    {
      id v12 = _UIDictationConnectionLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        BOOL ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[UIDictationConnection dictationConnection:didRecognizeTokens:languageModel:]";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = ignoreSpeechRecognitionResults;
        _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%s _ignoreSpeechRecognitionResults=%d. Early return", buf, 0x12u);
      }
    }
    else
    {
      id v14 = +[UIDictationController sharedInstance];
      [v14 updateRecordingLimitTimerIfNeeded];

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dictationConnection:self didReceiveCandidateDictationSerializableResults:0];

      location = (id *)&self->_tokenFilter;
      id v16 = objc_loadWeakRetained((id *)&self->_tokenFilter);
      uint64_t v35 = [v16 resultTransformForLanguageModel:v10];

      unint64_t v17 = [v10 componentsSeparatedByString:@"-"];
      uint64_t v37 = [v17 componentsJoinedByString:@"_"];

      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke;
      v47[3] = &unk_1E52FA810;
      id v12 = v18;
      __int16 v48 = v12;
      [v9 enumerateObjectsUsingBlock:v47];
      if ([v12 count])
      {
        id v19 = [v12 firstObject];
        [v19 setRemoveSpaceBefore:1];

        id v20 = objc_loadWeakRetained(location);
        uint64_t v36 = [v20 dictationConnection:self willFilterTokensWithLanguageModel:v37 forFinalize:0];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        uint64_t v50 = 0;
        uint64_t v43 = 0;
        uint64_t v44 = &v43;
        uint64_t v45 = 0x2020000000;
        char v46 = 0;
        id v21 = objc_loadWeakRetained(location);

        if (v21)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke_2;
          aBlock[3] = &unk_1E52FA838;
          aBlock[4] = self;
          id v40 = v36;
          v41 = &v43;
          v42 = buf;
          id v22 = _Block_copy(aBlock);
        }
        else
        {
          id v22 = 0;
        }
        unint64_t v23 = [v12 count] - 1;
        while (v23 >= *(void *)(*(void *)&buf[8] + 24))
        {
          *((unsigned char *)v44 + 24) = 0;
          id v24 = +[UIDictationConnection interpretationFromSpeechTokens:startIndex:filterBlock:](UIDictationConnection, "interpretationFromSpeechTokens:startIndex:filterBlock:", v12);
          BOOL offlineOnly = self->_offlineOnly;
          id v26 = [v24 tokens];
          id v27 = +[UIDictationController serializedInterpretationFromTokens:v26 transform:v35 capitalization:offlineOnly];

          LOBYTE(offlineOnly) = *((unsigned char *)v44 + 24) == 0;
          id v28 = objc_loadWeakRetained(v34);
          id v29 = v28;
          BOOL v30 = self->_offlineOnly;
          if (offlineOnly)
          {
            [v28 dictationConnection:self receivedInterpretation:v27 languageModel:v37 secureInput:v30];

            break;
          }
          [v28 dictationConnection:self receivedInterpretation:v27 languageModel:v37 secureInput:v30];

          ++*(void *)(*(void *)&buf[8] + 24);
          id v31 = -[NSObject objectAtIndex:](v12, "objectAtIndex:");
          id v32 = objc_loadWeakRetained(location);
          [v32 dictationConnection:self filterState:v36 processFilteredToken:v31 forFinalize:0];
        }
        id v33 = objc_loadWeakRetained(location);
        [v33 dictationConnection:self didFilterTokensWithFilterState:v36 forFinalize:0];

        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(buf, 8);
      }
      id v10 = (id)v37;
    }
  }
}

void __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = +[UIDictationUtilities tokenFromAFToken:a2];
  id v7 = *(void **)(a1 + 32);
  id v8 = (id)v6;
  if (v6)
  {
    [v7 addObject:v6];
  }
  else
  {
    [v7 removeAllObjects];
    *a4 = 1;
  }
}

void __78__UIDictationConnection_dictationConnection_didRecognizeTokens_languageModel___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (id *)(a1[4] + 32);
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  int v10 = [WeakRetained dictationConnection:a1[4] filterState:a1[5] shouldCheckpointAtToken:v8];

  if (v10)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
  }
}

- (void)dictationConnection:(id)a3 didRecognizePartialResult:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (AFDictationConnection *)a3;
  id v7 = a4;
  id v49 = v6;
  if (self->_connection == v6)
  {
    id v47 = v7;
    id v8 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
    id v9 = v8;
    if (v8)
    {
      id v45 = v8;
    }
    else
    {
      id v45 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
    }

    __int16 v48 = [v47 language];
    int v10 = [v48 componentsSeparatedByString:@"-"];
    uint64_t v51 = [v10 componentsJoinedByString:@"_"];

    uint64_t v11 = [(UIDictationConnection *)self dictationOptions];
    id v12 = [v11 languageDetectionUserContext];

    if (v12)
    {
      uint64_t v13 = [(UIDictationConnection *)self lastReceivedPartials];
      [v13 setObject:v47 forKeyedSubscript:v48];
    }
    uint64_t v44 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
    id v14 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
      id v16 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[UIDictationConnection dictationConnection:didRecognizePartialResult:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2112;
      v63 = v16;
      __int16 v64 = 2112;
      v65 = v51;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "%s Keyboard language code %@, detected language code %@, partial language code %@", buf, 0x2Au);
    }
    unint64_t v17 = [(UIDictationConnection *)self lastUsedDetectedLanguage];

    int v18 = [v51 isEqualToString:v45];
    int v19 = [v48 isEqualToString:v44];
    if (v17) {
      int v20 = 0;
    }
    else {
      int v20 = v19;
    }
    if (((v18 | v20) & 1) != 0
      || ([(UIDictationConnection *)self dictationOptions],
          id v21 = objc_claimAutoreleasedReturnValue(),
          [v21 languageDetectionUserContext],
          id v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = v22 == 0,
          v22,
          v21,
          v23))
    {
      location = (id *)&self->_tokenFilter;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_tokenFilter);
      uint64_t v46 = [WeakRetained resultTransformForLanguageModel:v51];

      id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v26 = objc_msgSend(v47, "af_tokens");
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke;
      v60[3] = &unk_1E52FA810;
      id v27 = v25;
      id v61 = v27;
      [v26 enumerateObjectsUsingBlock:v60];

      if ([v27 count])
      {
        id v28 = [v27 firstObject];
        [v28 setRemoveSpaceBefore:1];

        id v29 = objc_loadWeakRetained(location);
        BOOL v30 = [v29 dictationConnection:self willFilterTokensWithLanguageModel:v51 forFinalize:0];

        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        v63 = 0;
        uint64_t v56 = 0;
        v57 = &v56;
        uint64_t v58 = 0x2020000000;
        char v59 = 0;
        id v31 = objc_loadWeakRetained(location);

        if (v31)
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke_2;
          aBlock[3] = &unk_1E52FA838;
          aBlock[4] = self;
          id v53 = v30;
          v54 = &v56;
          v55 = buf;
          id v32 = _Block_copy(aBlock);
        }
        else
        {
          id v32 = 0;
        }
        unint64_t v33 = [v27 count] - 1;
        if (v33 >= *(void *)(*(void *)&buf[8] + 24))
        {
          while (1)
          {
            *((unsigned char *)v57 + 24) = 0;
            v34 = +[UIDictationConnection interpretationFromSpeechTokens:startIndex:filterBlock:](UIDictationConnection, "interpretationFromSpeechTokens:startIndex:filterBlock:", v27);
            BOOL offlineOnly = self->_offlineOnly;
            uint64_t v36 = [v34 tokens];
            uint64_t v37 = +[UIDictationController serializedInterpretationFromTokens:v36 transform:v46 capitalization:offlineOnly];

            LOBYTE(v36) = *((unsigned char *)v57 + 24) == 0;
            id v38 = objc_loadWeakRetained((id *)&self->_delegate);
            v39 = v38;
            BOOL v40 = self->_offlineOnly;
            if (v36) {
              break;
            }
            [v38 dictationConnection:self receivedInterpretation:v37 languageModel:v51 secureInput:v40];

            ++*(void *)(*(void *)&buf[8] + 24);
            v41 = objc_msgSend(v27, "objectAtIndex:");
            id v42 = objc_loadWeakRetained(location);
            [v42 dictationConnection:self filterState:v30 processFilteredToken:v41 forFinalize:0];

            if (v33 < *(void *)(*(void *)&buf[8] + 24)) {
              goto LABEL_23;
            }
          }
          [v38 dictationConnection:self receivedInterpretation:v37 languageModel:v51 secureInput:v40];
        }
LABEL_23:
        id v43 = objc_loadWeakRetained(location);
        [v43 dictationConnection:self didFilterTokensWithFilterState:v30 forFinalize:0];

        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(buf, 8);
      }
    }

    id v7 = v47;
  }
}

void __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = +[UIDictationUtilities tokenFromAFToken:a2];
  id v7 = *(void **)(a1 + 32);
  id v8 = (id)v6;
  if (v6)
  {
    [v7 addObject:v6];
  }
  else
  {
    [v7 removeAllObjects];
    *a4 = 1;
  }
}

void __71__UIDictationConnection_dictationConnection_didRecognizePartialResult___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = (id *)(a1[4] + 32);
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained(v7);
  int v10 = [WeakRetained dictationConnection:a1[4] filterState:a1[5] shouldCheckpointAtToken:v8];

  if (v10)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    *(void *)(*(void *)(a1[7] + 8) + 24) = a3;
  }
}

- (id)dictationSerializedResultWithPhrases:(id)a3 languageModel:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tokenFilter);
  uint64_t v9 = [WeakRetained resultTransformForLanguageModel:v7];

  int v10 = [v7 componentsSeparatedByString:@"-"];

  uint64_t v11 = [v10 componentsJoinedByString:@"_"];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v13);
        }
        int v18 = +[UIDictationUtilities phraseFromAFPhrase:*(void *)(*((void *)&v33 + 1) + 8 * i)];
        [v12 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v15);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v19 = objc_msgSend(v12, "firstObject", 0);
  int v20 = [v19 interpretations];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = [*(id *)(*((void *)&v29 + 1) + 8 * j) tokens];
        id v26 = [v25 firstObject];
        [v26 setRemoveSpaceBefore:1];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v22);
  }

  id v27 = [[UIDictationSerializableResults alloc] initWithPhrases:v12];
  [(UIDictationSerializableResults *)v27 setTransform:v9];

  return v27;
}

- (void)dictationConnection:(id)a3 didRecognizePhrases:(id)a4 languageModel:(id)a5 correctionIdentifier:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_connection == a3)
  {
    id v13 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 136315138;
      uint64_t v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v36, 0xCu);
    }

    if ([(id)objc_opt_class() hasSpeechRecognitionPauseAckPhrases:v10])
    {
      uint64_t v14 = _UIDictationConnectionLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315138;
        uint64_t v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
        uint64_t v15 = "%s This is a speech recognition pause acknowledgement callback. Early return";
LABEL_10:
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v36, 0xCu);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    if (self->_ignoreSpeechRecognitionResults)
    {
      uint64_t v14 = _UIDictationConnectionLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v36 = 136315138;
        uint64_t v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
        uint64_t v15 = "%s _ignoreSpeechRecognitionResults == YES. Early return";
        goto LABEL_10;
      }
LABEL_28:

      goto LABEL_29;
    }
    if (!_os_feature_enabled_impl()) {
      goto LABEL_21;
    }
    if (+[UIDictationController supportsSiriDictationVoiceCommands])
    {
      goto LABEL_21;
    }
    uint64_t v16 = +[UIDictationController sharedInstance];
    int v17 = [v16 isDetectingUtterances];

    if (!v17) {
      goto LABEL_21;
    }
    int v18 = +[UIDictationController sharedInstance];
    if ([v11 length])
    {
      char v19 = [v18 handleCommandRecognizedWithPhrases:v10 locale:v11];

      if (v19) {
        goto LABEL_29;
      }
      goto LABEL_21;
    }
    int v20 = +[UIDictationController sharedInstance];
    uint64_t v21 = [v20 smartLanguageSelectionOverrideLanguage];
    if (v21)
    {
      uint64_t v22 = (void *)v21;
      char v23 = [v18 handleCommandRecognizedWithPhrases:v10 locale:v21];

      if (v23) {
        goto LABEL_29;
      }
      goto LABEL_21;
    }
    id v24 = +[UIDictationController sharedInstance];
    id v25 = [v24 language];
    char v26 = [v18 handleCommandRecognizedWithPhrases:v10 locale:v25];

    if ((v26 & 1) == 0)
    {
LABEL_21:
      id v27 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
      id v28 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
      char v29 = [v27 isEqualToString:v28];

      if (self->_receivedMultilingualResultsCommand) {
        goto LABEL_25;
      }
      long long v30 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
      if (!v30) {
        char v29 = 1;
      }

      if (v29)
      {
LABEL_25:
        long long v31 = _UIDictationConnectionLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v36 = 136315394;
          uint64_t v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
          __int16 v38 = 2112;
          id v39 = v11;
          _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_DEFAULT, "%s languageModel %@", (uint8_t *)&v36, 0x16u);
        }

        uint64_t v14 = [(UIDictationConnection *)self dictationSerializedResultWithPhrases:v10 languageModel:v11];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained dictationConnection:self finalizePhrases:v14 languageModel:v11 correctionIdentifier:v12 secureInput:self->_offlineOnly finalResult:1];
      }
      else
      {
        long long v33 = _UIDictationConnectionLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          long long v34 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
          long long v35 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
          int v36 = 136315650;
          uint64_t v37 = "-[UIDictationConnection dictationConnection:didRecognizePhrases:languageModel:correctionIdentifier:]";
          __int16 v38 = 2112;
          id v39 = v34;
          __int16 v40 = 2112;
          v41 = v35;
          _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_DEFAULT, "%s Calling didCancelIncompatibleLocalRecognizer on delegate because of language mismatch (%@ vs %@)", (uint8_t *)&v36, 0x20u);
        }
        uint64_t v14 = [(UIDictationConnection *)self delegate];
        [v14 dictationConnectionDidCancelIncompatibleLocalRecognizer:self];
      }
      goto LABEL_28;
    }
  }
LABEL_29:
}

- (void)dictationConnection:(id)a3 didRecognizePartialPackage:(id)a4 nluResult:(id)a5 languageModel:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (self->_connection == a3)
  {
    id v13 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      int v17 = "-[UIDictationConnection dictationConnection:didRecognizePartialPackage:nluResult:languageModel:]";
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v16, 0xCu);
    }

    if (self->_ignoreSpeechRecognitionResults)
    {
      id WeakRetained = _UIDictationConnectionLog();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        BOOL ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        int v16 = 136315394;
        int v17 = "-[UIDictationConnection dictationConnection:didRecognizePartialPackage:nluResult:languageModel:]";
        __int16 v18 = 1024;
        BOOL v19 = ignoreSpeechRecognitionResults;
        _os_log_impl(&dword_1853B0000, WeakRetained, OS_LOG_TYPE_DEFAULT, "%s _ignoreSpeechRecognitionResults=%d. Early return", (uint8_t *)&v16, 0x12u);
      }
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dictationConnection:self didReceivePartialPackage:v10 nluResult:v11 languageModel:v12];
    }
  }
}

- (void)dictationConnection:(id)a3 didRecognizeMultilingualSpeech:(id)a4
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_connection == a3)
  {
    [(UIDictationConnection *)self setReceivedMultilingualResultsCommand:1];
    id v7 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v132 = "-[UIDictationConnection dictationConnection:didRecognizeMultilingualSpeech:]";
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    id v8 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
    uint64_t v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id v10 = [(UIDictationConnection *)self lastUsedPrimaryLanguage];
    }
    id v11 = v10;

    id v85 = v6;
    v91 = [v6 speechRecognizedByLanguage];
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = [(UIDictationConnection *)self lastUsedDetectedLanguage];

    v86 = v11;
    v87 = self;
    if (v12)
    {
      long long v122 = 0u;
      long long v123 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      obuint64_t j = [(UIDictationConnection *)self lastUsedTopLanguages];
      uint64_t v92 = [obj countByEnumeratingWithState:&v120 objects:v130 count:16];
      if (v92)
      {
        uint64_t v89 = *(void *)v121;
        do
        {
          for (uint64_t i = 0; i != v92; ++i)
          {
            if (*(void *)v121 != v89) {
              objc_enumerationMutation(obj);
            }
            uint64_t v93 = *(void *)(*((void *)&v120 + 1) + 8 * i);
            v94 = objc_msgSend(v91, "objectForKey:");
            uint64_t v14 = [v94 recognition];
            uint64_t v15 = objc_msgSend(v14, "af_speechPhrases");

            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            long long v116 = 0u;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v119 = 0u;
            id v17 = v15;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v116 objects:v129 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v117;
              do
              {
                for (uint64_t j = 0; j != v19; ++j)
                {
                  if (*(void *)v117 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v22 = +[UIDictationUtilities phraseFromAFPhrase:*(void *)(*((void *)&v116 + 1) + 8 * j)];
                  [v16 addObject:v22];
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v116 objects:v129 count:16];
              }
              while (v19);
            }

            long long v114 = 0u;
            long long v115 = 0u;
            long long v112 = 0u;
            long long v113 = 0u;
            char v23 = [v16 firstObject];
            id v24 = [v23 interpretations];

            uint64_t v25 = [v24 countByEnumeratingWithState:&v112 objects:v128 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v113;
              do
              {
                for (uint64_t k = 0; k != v26; ++k)
                {
                  if (*(void *)v113 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  char v29 = [*(id *)(*((void *)&v112 + 1) + 8 * k) tokens];
                  long long v30 = [v29 firstObject];
                  [v30 setRemoveSpaceBefore:1];
                }
                uint64_t v26 = [v24 countByEnumeratingWithState:&v112 objects:v128 count:16];
              }
              while (v26);
            }

            long long v31 = [[UIDictationMultilingualResults alloc] initWithPhrases:v16 dominantLanguage:v93];
            [v90 addObject:v31];
          }
          uint64_t v92 = [obj countByEnumeratingWithState:&v120 objects:v130 count:16];
        }
        while (v92);
      }

      id v11 = v86;
      self = v87;
    }
    uint64_t v32 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
    if (v32
      && (long long v33 = (void *)v32,
          BOOL v34 = [(UIDictationConnection *)self lowConfidenceAboutLanguageDetection], v33, v34))
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      int v36 = [(UIDictationConnection *)self lastUsedDetectedLanguage];
      uint64_t v37 = [v36 componentsSeparatedByString:@"_"];
      __int16 v38 = [v37 componentsJoinedByString:@"-"];
      id v39 = [v91 objectForKey:v38];

      __int16 v40 = [v39 recognition];
      v41 = objc_msgSend(v40, "af_speechPhrases");

      objc_msgSend(v39, "af_correctionContext");
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      long long v100 = 0u;
      long long v101 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id v43 = v41;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v100 objects:v125 count:16];
      if (v44)
      {
        uint64_t v45 = v44;
        uint64_t v46 = *(void *)v101;
        do
        {
          for (uint64_t m = 0; m != v45; ++m)
          {
            if (*(void *)v101 != v46) {
              objc_enumerationMutation(v43);
            }
            __int16 v48 = +[UIDictationUtilities phraseFromAFPhrase:*(void *)(*((void *)&v100 + 1) + 8 * m)];
            [v35 addObject:v48];
          }
          uint64_t v45 = [v43 countByEnumeratingWithState:&v100 objects:v125 count:16];
        }
        while (v45);
      }

      long long v98 = 0u;
      long long v99 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v49 = [v35 firstObject];
      uint64_t v50 = [v49 interpretations];

      uint64_t v51 = [v50 countByEnumeratingWithState:&v96 objects:v124 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v97;
        do
        {
          for (uint64_t n = 0; n != v52; ++n)
          {
            if (*(void *)v97 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = [*(id *)(*((void *)&v96 + 1) + 8 * n) tokens];
            uint64_t v56 = [v55 firstObject];
            [v56 setRemoveSpaceBefore:1];
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v96 objects:v124 count:16];
        }
        while (v52);
      }

      v57 = v90;
      uint64_t v58 = [[UIDictationSerializableResults alloc] initWithDetectedPhrases:v35 multilingualAlternatives:v90];
      [(UIDictationSerializableResults *)v58 setLowConfidenceAboutLanguageDetection:[(UIDictationConnection *)v87 lowConfidenceAboutLanguageDetection]];
      id WeakRetained = objc_loadWeakRetained((id *)&v87->_delegate);
      v60 = WeakRetained;
      BOOL offlineOnly = v87->_offlineOnly;
      v62 = v87;
      v63 = v58;
      __int16 v64 = v86;
      v65 = v86;
      id v66 = v42;
    }
    else
    {
      __int16 v67 = [v11 componentsSeparatedByString:@"_"];
      v68 = [v67 componentsJoinedByString:@"-"];
      id v35 = [v91 objectForKey:v68];

      __int16 v69 = [v35 recognition];
      v70 = objc_msgSend(v69, "af_speechPhrases");

      objc_msgSend(v35, "af_correctionContext");
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      id v71 = objc_loadWeakRetained((id *)&self->_tokenFilter);
      uint64_t v95 = [v71 resultTransformForLanguageModel:v11];

      id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v39 = v70;
      uint64_t v72 = [v39 countByEnumeratingWithState:&v108 objects:v127 count:16];
      if (v72)
      {
        uint64_t v73 = v72;
        uint64_t v74 = *(void *)v109;
        do
        {
          for (iuint64_t i = 0; ii != v73; ++ii)
          {
            if (*(void *)v109 != v74) {
              objc_enumerationMutation(v39);
            }
            v76 = +[UIDictationUtilities phraseFromAFPhrase:*(void *)(*((void *)&v108 + 1) + 8 * ii)];
            [v42 addObject:v76];
          }
          uint64_t v73 = [v39 countByEnumeratingWithState:&v108 objects:v127 count:16];
        }
        while (v73);
      }

      long long v106 = 0u;
      long long v107 = 0u;
      long long v104 = 0u;
      long long v105 = 0u;
      v77 = [v42 firstObject];
      v78 = [v77 interpretations];

      uint64_t v79 = [v78 countByEnumeratingWithState:&v104 objects:v126 count:16];
      if (v79)
      {
        uint64_t v80 = v79;
        uint64_t v81 = *(void *)v105;
        do
        {
          for (juint64_t j = 0; jj != v80; ++jj)
          {
            if (*(void *)v105 != v81) {
              objc_enumerationMutation(v78);
            }
            v83 = [*(id *)(*((void *)&v104 + 1) + 8 * jj) tokens];
            v84 = [v83 firstObject];
            [v84 setRemoveSpaceBefore:1];
          }
          uint64_t v80 = [v78 countByEnumeratingWithState:&v104 objects:v126 count:16];
        }
        while (v80);
      }

      v57 = v90;
      uint64_t v58 = [[UIDictationSerializableResults alloc] initWithDetectedPhrases:v42 multilingualAlternatives:v90];
      [(UIDictationSerializableResults *)v58 setLowConfidenceAboutLanguageDetection:[(UIDictationConnection *)v87 lowConfidenceAboutLanguageDetection]];
      [(UIDictationSerializableResults *)v58 setTransform:v95];
      id WeakRetained = objc_loadWeakRetained((id *)&v87->_delegate);
      v60 = WeakRetained;
      BOOL offlineOnly = v87->_offlineOnly;
      v62 = v87;
      v63 = v58;
      __int16 v64 = v86;
      v65 = v86;
      id v66 = v43;
    }
    [WeakRetained dictationConnection:v62 finalizePhrases:v63 languageModel:v65 correctionIdentifier:v66 secureInput:offlineOnly finalResult:0];

    id v6 = v85;
  }
}

- (void)dictationConnectionSpeechRecognitionDidSucceed:(id)a3
{
  id v4 = (AFDictationConnection *)a3;
  if (self->_connection == v4)
  {
    self->_connectiouint64_t n = 0;
    id v6 = v4;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dictationConnectionDidFinish:self];

    id v4 = v6;
  }
}

- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
  if (self->_connection == a3)
  {
    BOOL v7 = a7;
    BOOL v8 = a6;
    p_delegate = &self->_delegate;
    id v12 = a5;
    id v13 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained dictationConnection:self didReceiveSearchResults:v13 recognizedText:v12 stable:v8 final:v7];
  }
}

- (void)dictationConnectionDidPauseRecognition:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_connection == a3)
  {
    self->_BOOL ignoreSpeechRecognitionResults = 0;
    id v4 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      BOOL ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
      int v6 = 136315394;
      BOOL v7 = "-[UIDictationConnection dictationConnectionDidPauseRecognition:]";
      __int16 v8 = 1024;
      BOOL v9 = ignoreSpeechRecognitionResults;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting _ignoreSpeechRecognitionResults=%d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (void)dictationConnection:(id)a3 didRecognizeFinalResultCandidatePackage:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int v6 = (AFDictationConnection *)a3;
  id v7 = a4;
  __int16 v8 = v7;
  if (self->_connection == v6)
  {
    if (self->_ignoreSpeechRecognitionResults)
    {
      BOOL v9 = _UIDictationConnectionLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        int v15 = 136315394;
        id v16 = "-[UIDictationConnection dictationConnection:didRecognizeFinalResultCandidatePackage:]";
        __int16 v17 = 1024;
        BOOL v18 = ignoreSpeechRecognitionResults;
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%s _ignoreSpeechRecognitionResults=%d. Early return", (uint8_t *)&v15, 0x12u);
      }
    }
    else
    {
      id v11 = [v7 recognition];
      id v12 = [v11 phrases];

      id v13 = [(UIDictationConnection *)self dictationSerializedResultWithPhrases:v12 languageModel:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dictationConnection:self didReceiveCandidateDictationSerializableResults:v13];
    }
  }
}

- (void)dictationConnection:(id)a3 didRecognizeVoiceCommandCandidatePackage:(id)a4 nluResult:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (self->_connection == a3)
  {
    uint64_t v10 = _UIDictationConnectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[UIDictationConnection dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:]";
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
    }

    id v11 = [v8 recognition];
    id v12 = [v11 phrases];

    if ([(id)objc_opt_class() hasSpeechRecognitionPauseAckPhrases:v12])
    {
      id WeakRetained = _UIDictationConnectionLog();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        uint64_t v19 = "-[UIDictationConnection dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:]";
        uint64_t v14 = "%s This is a speech recognition pause acknowledgement callback. Early return";
        int v15 = WeakRetained;
        uint32_t v16 = 12;
LABEL_10:
        _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, v16);
      }
    }
    else
    {
      if (!self->_ignoreSpeechRecognitionResults)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained dictationConnection:self didReceiveVoiceCommandCandidatePackage:v8 nluResult:v9];
        goto LABEL_12;
      }
      id WeakRetained = _UIDictationConnectionLog();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        BOOL ignoreSpeechRecognitionResults = self->_ignoreSpeechRecognitionResults;
        int v18 = 136315394;
        uint64_t v19 = "-[UIDictationConnection dictationConnection:didRecognizeVoiceCommandCandidatePackage:nluResult:]";
        __int16 v20 = 1024;
        BOOL v21 = ignoreSpeechRecognitionResults;
        uint64_t v14 = "%s _ignoreSpeechRecognitionResults=%d. Early return";
        int v15 = WeakRetained;
        uint32_t v16 = 18;
        goto LABEL_10;
      }
    }
LABEL_12:
  }
}

- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIDictationConnection *)self connection];
  [v8 preheatEuclidModelWithLanguage:v7 clientID:v6];
}

- (void)euclidPhoneticString:(id)a3 maxResultsCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(UIDictationConnection *)self connection];
  [v10 getEuclidPhonetic:v9 maxResultsCount:a4 completion:v8];
}

- (UIDictationConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIDictationConnectionDelegate *)WeakRetained;
}

- (UIDictationConnectionTokenFilterProtocol)tokenFilter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tokenFilter);
  return (UIDictationConnectionTokenFilterProtocol *)WeakRetained;
}

- (BOOL)receivedMultilingualResultsCommand
{
  return self->_receivedMultilingualResultsCommand;
}

- (void)setReceivedMultilingualResultsCommand:(BOOL)a3
{
  self->_receivedMultilingualResultsCommand = a3;
}

- (AFDictationOptions)dictationOptions
{
  return self->_dictationOptions;
}

- (void)setDictationOptions:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (BOOL)offlineOnly
{
  return self->_offlineOnly;
}

- (void)setOfflineOnly:(BOOL)a3
{
  self->_BOOL offlineOnly = a3;
}

- (BOOL)ignoreSpeechRecognitionResults
{
  return self->_ignoreSpeechRecognitionResults;
}

- (void)setIgnoreSpeechRecognitionResults:(BOOL)a3
{
  self->_BOOL ignoreSpeechRecognitionResults = a3;
}

- (OS_dispatch_queue)analyticsQueue
{
  return self->_analyticsQueue;
}

- (void)setAnalyticsQueue:(id)a3
{
}

- (NSString)lastUsedPrimaryLanguage
{
  return self->_lastUsedPrimaryLanguage;
}

- (void)setLastUsedPrimaryLanguage:(id)a3
{
}

- (NSString)lastUsedDetectedLanguage
{
  return self->_lastUsedDetectedLanguage;
}

- (void)setLastUsedDetectedLanguage:(id)a3
{
}

- (NSMutableArray)lastUsedTopLanguages
{
  return self->_lastUsedTopLanguages;
}

- (void)setLastUsedTopLanguages:(id)a3
{
}

- (BOOL)lowConfidenceAboutLanguageDetection
{
  return self->_lowConfidenceAboutLanguageDetection;
}

- (void)setLowConfidenceAboutLanguageDetection:(BOOL)a3
{
  self->_lowConfidenceAboutLanguageDetectiouint64_t n = a3;
}

- (unsigned)charBeforeInsertionPointOnDictationStart
{
  return self->_charBeforeInsertionPointOnDictationStart;
}

- (void)setCharBeforeInsertionPointOnDictationStart:(unsigned int)a3
{
  self->_unsigned int charBeforeInsertionPointOnDictationStart = a3;
}

- (unsigned)charAfterInsertionPointOnDictationStart
{
  return self->_charAfterInsertionPointOnDictationStart;
}

- (void)setCharAfterInsertionPointOnDictationStart:(unsigned int)a3
{
  self->_unsigned int charAfterInsertionPointOnDictationStart = a3;
}

- (NSMutableDictionary)lastReceivedPartials
{
  return self->_lastReceivedPartials;
}

- (void)setLastReceivedPartials:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastReceivedPartials, 0);
  objc_storeStrong((id *)&self->_lastUsedTopLanguages, 0);
  objc_storeStrong((id *)&self->_lastUsedDetectedLanguage, 0);
  objc_storeStrong((id *)&self->_lastUsedPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_dictationOptions, 0);
  objc_destroyWeak((id *)&self->_tokenFilter);
  objc_destroyWeak((id *)&self->_delegate);
}

@end