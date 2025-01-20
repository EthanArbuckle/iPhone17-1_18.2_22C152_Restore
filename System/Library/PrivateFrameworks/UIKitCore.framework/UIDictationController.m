@interface UIDictationController
+ (BOOL)_applicationIsActive;
+ (BOOL)_checkTraitsSupportDictation:(id)a3;
+ (BOOL)_isDictationAllowedWithUserDefaults:(id)a3;
+ (BOOL)_isLowStorageForOnDeviceDictationAsset;
+ (BOOL)_shouldPerformPhrasesFinalizationIgnoringRTIChangesWithUserInteraction:(int64_t)a3;
+ (BOOL)canHandleCommandIdentifier:(unint64_t)a3;
+ (BOOL)canPerformDictation;
+ (BOOL)canShareDictationData;
+ (BOOL)canUndoOrRedo;
+ (BOOL)checkTraitsSupportDictation:(id)a3;
+ (BOOL)dictationInfoIsOnScreen;
+ (BOOL)dictationIsFunctional;
+ (BOOL)fetchCurrentInputModeSupportsDictation;
+ (BOOL)isDictationSearchBarButtonVisible;
+ (BOOL)isEventFromMessagesSendButton:(id)a3 inspectResponderChain:(BOOL)a4;
+ (BOOL)isInputDelegateSafariAddressBar;
+ (BOOL)isListening;
+ (BOOL)isRunning;
+ (BOOL)isRunningInTypeAndTalkMode;
+ (BOOL)isTextViewOnStarkScreen:(id)a3;
+ (BOOL)remoteCanDictateCurrentInputMode;
+ (BOOL)shouldDeleteBackward;
+ (BOOL)shouldForwardEventsToInputSystemUI;
+ (BOOL)shouldForwardInInputSystemUI;
+ (BOOL)shouldHideCursorForTextView:(id)a3;
+ (BOOL)shouldHideSelectionUIForTextView:(id)a3;
+ (BOOL)shouldInsertText:(id)a3;
+ (BOOL)shouldPreferOnDeviceRecognition;
+ (BOOL)shouldPreferOnlineRecognition;
+ (BOOL)shouldRemoveTextEntries;
+ (BOOL)shouldRemoveTextEntries:(id)a3;
+ (BOOL)starkSceneExists;
+ (BOOL)supportsSendVoiceCommand;
+ (BOOL)supportsSiriDictationVoiceCommands;
+ (BOOL)supportsSiriDictationVoiceCommandsGazeDisambiguation;
+ (BOOL)supportsSiriDictationVoiceCommandsUIRedesign;
+ (BOOL)supportsUndoCommandForCurrentDictationRequest;
+ (BOOL)takesPressesBegan:(id)a3 forTextView:(id)a4;
+ (BOOL)takesPressesChanged:(id)a3 forTextView:(id)a4;
+ (BOOL)takesPressesEnded:(id)a3 forTextView:(id)a4;
+ (BOOL)usingServerManualEndpointingThreshold;
+ (double)serverManualEndpointingThreshold;
+ (id)UIDictationInstrumentaionLocalIdentifierWithLocalString:(id)a3;
+ (id)UIDictationLanguageSourceType:(unint64_t)a3;
+ (id)UIDictationStartStopReasonTypeDescription:(unint64_t)a3;
+ (id)activeConnection;
+ (id)activeInstance;
+ (id)activeSLSDictationLanguages;
+ (id)arrayWithTextEntriesRemoved:(id)a3;
+ (id)bestInterpretationForDictationResult:(id)a3;
+ (id)convertEditValuesToHashByPosition:(id)a3 dictationResultEditType:(id)a4;
+ (id)dictionaryWithTextEntriesRemoved:(id)a3;
+ (id)firstParameterTextWithParameters:(id)a3;
+ (id)interpretation:(id)a3 forPhraseIndex:(unint64_t)a4 isShiftLocked:(BOOL)a5 autocapitalizationType:(int64_t)a6 useServerCapitalization:(BOOL)a7;
+ (id)logAutoPunctuationEdit:(id)a3 deletionValues:(id)a4 substitutionValues:(id)a5 withContext:(id)a6;
+ (id)mergePunctuationInsertAndDeleteIntoSubstituteTypeForSameStartEnd:(id)a3 deleteEditValues:(id)a4;
+ (id)removeTextIfNeeded:(id)a3;
+ (id)removeTextIfNeeded:(id)a3 metadata:(id)a4;
+ (id)secondParameterTextWithParameters:(id)a3;
+ (id)serializedDictationPhrases:(id)a3;
+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4;
+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4 autocapitalization:(int64_t)a5 capitalization:(unint64_t)a6;
+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4 capitalization:(unint64_t)a5;
+ (id)sharedInstance;
+ (id)slsDictationLanguages;
+ (id)streamingHypothesisForPhrases:(id)a3;
+ (id)stringForState:(int)a3;
+ (id)stringForViewMode:(int)a3;
+ (id)stripNonPunctuationEditValues:(id)a3;
+ (id)textRelatedMetadataKeys;
+ (id)whitelistedDictationDictionariesFromMetadataDictionaries:(id)a3;
+ (id)whitelistedDictationDictionaryFromMetadata:(id)a3;
+ (id)whitelistedDictationMetadataKeys;
+ (int)UIDictationStartStopReasonToInstrumentationDictationEndPointType:(unint64_t)a3;
+ (int)UIDictationStartStopReasonToInstrumentationInvocationSourceType:(unint64_t)a3;
+ (int)mapDictationCommandIdentifierToUEIcommandIdentifier:(unint64_t)a3;
+ (int)viewMode;
+ (unint64_t)commandIdentifierWithStringIdentifier:(id)a3;
+ (unint64_t)reasonType:(id)a3;
+ (unint64_t)specificReasonTypeMicButtonOnKeyboard;
+ (unint64_t)specificReasonTypeMicButtonOnKeyboardWithInputSwitcher;
+ (void)applicationDidEnterBackgroundNotification;
+ (void)didBeginEditingInTextView:(id)a3;
+ (void)inputSystemSessionWillEndForReason:(int64_t)a3;
+ (void)instrumentationDictationAlternativeSelectedWithInstrumentationContext:(id)a3 originalText:(id)a4 replacementText:(id)a5 replacementIndex:(unint64_t)a6 alternativesAvailableCount:(unint64_t)a7 dictationLanguage:(id)a8;
+ (void)instrumentationDictationAlternativesViewedWithInstrumentationContext:(id)a3 alternatives:(id)a4 dictationLanguage:(id)a5;
+ (void)keyboardDidShow;
+ (void)keyboardDidUpdateOnScreenStatus;
+ (void)keyboardWillChangeFromDelegate:(id)a3 toDelegate:(id)a4 shouldPause:(BOOL)a5;
+ (void)logCorrectionStatisticsForDelegate:(id)a3 reason:(unint64_t)a4;
+ (void)onDidBecomeActive;
+ (void)onWillResignActive;
+ (void)performOperations:(id)a3 keyboardShifted:(BOOL)a4;
+ (void)poppedLastStreamingOperation;
+ (void)remoteMicrophoneCapabilityChanged;
+ (void)siriPreferencesChanged;
+ (void)updateLandingView;
- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationContext;
- (AFAnalyticsTurnBasedInstrumentationContext)enablementInstrumentationContext;
- (BOOL)_allowsMicsInSearchField;
- (BOOL)_didRecognizeCommandWithIdentifier:(id)a3 strings:(id)a4 parameters:(id)a5 voiceCommandUUID:(id)a6;
- (BOOL)_handleMultipleTextTargetsForText:(id)a3 payloadText:(id)a4 voiceCommandUUID:(id)a5;
- (BOOL)_isNonEmptyDocumentRequiredForCommand:(unint64_t)a3;
- (BOOL)_resolvedIsDictationPossible;
- (BOOL)_shouldApplyLastHypothesis;
- (BOOL)_shouldDeleteBackward;
- (BOOL)_shouldInsertText:(id)a3;
- (BOOL)_shouldSuppressPartialForVoiceCommandGrammarParsePackage:(id)a3 commandPartialString:(id)a4;
- (BOOL)_shouldUpdateHelperMessageDisplay;
- (BOOL)_shouldUseDictationSearchFieldBehavior;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)canApplyVoiceCommandWithIdentifier:(id)a3 parameters:(id)a4 commandUtteranceString:(id)a5 voiceCommandUUID:(id)a6;
- (BOOL)canUndoOrRedo;
- (BOOL)currentLanguageIsVerbFirstCommandLanguage;
- (BOOL)currentViewModeSupportsDictationMics;
- (BOOL)dataSharingDecided;
- (BOOL)dictationConnection:(id)a3 filterState:(id)a4 shouldCheckpointAtToken:(id)a5;
- (BOOL)dictationDisabledDueToTelephonyActivity;
- (BOOL)dictationEnabled;
- (BOOL)dictationSearchFieldUIEnabled;
- (BOOL)dictationSearchFieldUISupportsTraitCollection:(id)a3;
- (BOOL)dictationWordwiseBackspaceEnabled;
- (BOOL)didToggleSoftwareKeyboardVisibleForDictation;
- (BOOL)discardNextHypothesis;
- (BOOL)enableEuclidAlternatives;
- (BOOL)enablementLoggingIsDictationEnabled;
- (BOOL)enablementLoggingIsLearnMoreButtonClicked;
- (BOOL)handleASRVoiceCommandRecognizedWithUtterance:(id)a3 commandIdentifier:(id)a4 parameters:(id)a5 voiceCommandUUID:(id)a6;
- (BOOL)handleCommandRecognizedWithPhrases:(id)a3 locale:(id)a4;
- (BOOL)hasCheckedForLeadingSpaceOnce;
- (BOOL)hasInsertedAtLeastOneSerializedDictationResult;
- (BOOL)hasPreheated;
- (BOOL)hasSelectedTextRange;
- (BOOL)hasTextMatchForString:(id)a3;
- (BOOL)haveLeakedPartialResultForCommandUtterance;
- (BOOL)haveReceivedFirstPartialResultForCurrentUtterance;
- (BOOL)ignoreFinalizePhrases;
- (BOOL)ignoreKeyboardDidHideNotification;
- (BOOL)ignoreUserInteraction;
- (BOOL)isDetectingUtterances;
- (BOOL)isDictationPaused;
- (BOOL)isDictationUndoGroupingOpen;
- (BOOL)isFallingBackToMonolingualDictation;
- (BOOL)isFinalizingRecognizedUtterance;
- (BOOL)isIgnoringDocumentChanges;
- (BOOL)isIgnoringRTIChanges;
- (BOOL)isProcessingPotentialVoiceCommand;
- (BOOL)isRecievingResults;
- (BOOL)isSelectionBasedCommand:(unint64_t)a3;
- (BOOL)isSelectionRequiredForCommand:(unint64_t)a3;
- (BOOL)isSendButtonPressedDuringDictation;
- (BOOL)languageSupportsAdaptiveDelete;
- (BOOL)localSpeechRecognitionForced;
- (BOOL)logAppEnterBackground;
- (BOOL)modelessUsedAtLeastOnce;
- (BOOL)pauseUpdatingHelperMessage;
- (BOOL)performingStreamingEditingOperation;
- (BOOL)remoteHasMicrophone;
- (BOOL)resigningFirstResponder;
- (BOOL)restoreStagedDictationOnIdle;
- (BOOL)secureOfflineOnlySpeechRecognition;
- (BOOL)selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate;
- (BOOL)selectionStartIsStartOfParagraph;
- (BOOL)selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate;
- (BOOL)shouldDeleteWordOnBackspaceTap;
- (BOOL)shouldOverrideManualEndpointingWithReturnKeyType:(int64_t)a3;
- (BOOL)shouldPresentOptInAlert;
- (BOOL)shouldResumeDictation;
- (BOOL)shouldStayInDictationInputMode;
- (BOOL)shouldSuppressPartialResults;
- (BOOL)shouldSuppressSoftwareKeyboard;
- (BOOL)shouldUseDictationSearchFieldBehavior;
- (BOOL)skipAutomaticResumeDictation;
- (BOOL)smartLanguageSelectionOverridden;
- (BOOL)supportsDictationLanguage:(id)a3 error:(id *)a4;
- (BOOL)supportsInputMode:(id)a3 error:(id *)a4;
- (BOOL)suppressDelegateTextInputDidChangeNotifications;
- (BOOL)useAutomaticEndpointing;
- (BOOL)userInteractionShouldDismissDictationTip:(int64_t)a3;
- (BOOL)userInteractionShouldResetAdaptiveDeleteActivationLogic:(int64_t)a3;
- (BOOL)wantsAvailabilityMonitoringWhenAppActive;
- (NSArray)dictationLanguages;
- (NSArray)lastSuppressedCommandPartialTokens;
- (NSMutableArray)pendingEdits;
- (NSMutableDictionary)cachedDisplayLowStorageNotification;
- (NSNumber)currentLanguageVerbFirstCommandLanguageStatusCached;
- (NSNumber)dictationRequestOrigin;
- (NSString)_inputDelegateClassName;
- (NSString)activationIdentifier;
- (NSString)currentEuclidLanguage;
- (NSString)currentKeyboardPrimaryLanguage;
- (NSString)detectedLanguage;
- (NSString)fallbackDictationLanguage;
- (NSString)initialDictationLanguage;
- (NSString)interactionIdentifier;
- (NSString)lastHypothesis;
- (NSString)lastMessageKeyboardLanguage;
- (NSString)lastRecognitionText;
- (NSString)modelInfo;
- (NSString)previousHypothesis;
- (NSString)smartLanguageSelectionOverrideLanguage;
- (NSString)targetHypothesis;
- (NSString)visibleContextBeforeInputAtCommandExecution;
- (NSTimer)idleTimerResetTimer;
- (NSValue)commandTargetRangeMatchingGazeRange;
- (RTIDocumentState)visibleRTIDocumentStateAtCommandRecognition;
- (RTIDocumentState)visibleRTIDocumentStateAtStart;
- (UIDictationController)init;
- (UIDictationCursorPositionRestorer)cursorPositionRestorer;
- (UIDictationInputModeOptions)inputModeOptions;
- (UIDictationSerializableResults)candidateDictationSerializableResults;
- (UIDictationTipController)dictationTipController;
- (UIKeyboardInputMode)currentInputModeForDictation;
- (UIKeyboardInputMode)keyboardInputModeToReturn;
- (UIWindow)dictationPresenterWindow;
- (_NSRange)_getRangeOfString:(id)a3 inDocumentText:(id)a4;
- (_NSRange)insertionRange;
- (_NSRange)preCommandExecutionPositionRange;
- (_NSRange)searchStringWithWordBoundariesValidation:(id)a3 substring:(id)a4 reverse:(BOOL)a5;
- (_NSRange)startRangeOfCurrentHypothesis;
- (_UIDictationPrivacySheetController)dictationPrivacySheetController;
- (__CFString)resultTransformForLanguageModel:(id)a3;
- (float)audioLevel;
- (float)maxRecordingLength;
- (id)_assistantCompatibleLanguageCodeForInputMode:(id)a3;
- (id)_containingSearchBarForView:(id)a3;
- (id)_currentLanguageForOfflineDictationMetrics;
- (id)_documentStateForCommandApplicability;
- (id)_finalDictationStartLanguageCodeWithKeyboardInputMode:(id)a3;
- (id)_getBestHypothesisRangeGivenHintRange:(id)a3 inputDelegateManager:(id)a4 hypothesisRange:(_NSRange *)a5 documentTextInRange:(id *)a6 forHypothesis:(id)a7;
- (id)_hypothesisRangeFromSelectionRange:(id)a3 inputDelegateManager:(id)a4 forHypothesis:(id)a5;
- (id)_obtainDisambiguationUIAssertion;
- (id)_rangeByExtendingRange:(id)a3 backward:(int64_t)a4 forward:(int64_t)a5 inputDelegateManager:(id)a6;
- (id)_voiceCommandGrammarParseResultWithParsePackage:(id)a3 completeCommands:(BOOL)a4;
- (id)commandTargetStringWithDictationCommandIdentifier:(unint64_t)a3 parameters:(id)a4;
- (id)connectionForStatisticsLogging;
- (id)currentDictationLanguageForDisplay;
- (id)dictationBlockForToken:(id)a3;
- (id)dictationConnection;
- (id)dictationConnection:(id)a3 willFilterTokensWithLanguageModel:(id)a4 forFinalize:(BOOL)a5;
- (id)dictationUIState;
- (id)fieldIdentifierInputDelegate:(id)a3;
- (id)language;
- (id)languageCodeForAssistantLanguageCode:(id)a3;
- (id)lastCorrectionIdentifier;
- (id)postfixTextForInputDelegate:(id)a3 wordCount:(unint64_t)a4;
- (id)prefixTextForInputDelegate:(id)a3 wordCount:(unint64_t)a4;
- (id)presentingViewControllerForPrivacySheet;
- (id)rangesForSearchStringWithWordBoundariesValidation:(id)a3 substring:(id)a4 reverse:(BOOL)a5;
- (id)resultWithTrailingSpace:(id)a3;
- (id)selectedTextForInputDelegate:(id)a3;
- (id)streamingOperations;
- (int)state;
- (int64_t)consecutiveKeyboardDeleteEventCount;
- (unint64_t)dictationSourceType;
- (unint64_t)reasonType;
- (unint64_t)specificReasonTypeFromApplicationDuringDictation;
- (unint64_t)stateHandler;
- (unsigned)initialCharacterAfterSelectionForAsyncDelegate;
- (unsigned)initialPreviousCharacterForAsyncDelegate;
- (unsigned)previousCharacter;
- (void)_addUndoNotificationObservationWithVoiceCommandUUID:(id)a3;
- (void)_applyWKAlternativesPayload:(id)a3 toAbsoluteRanges:(id)a4 valueRangeToText:(id)a5 context:(id)a6 originalSelectedRange:(_NSRange)a7 completionHandler:(id)a8;
- (void)_beginOfflineMetricsSession;
- (void)_beginUndoGroupingIfNecessary;
- (void)_clearExistingText;
- (void)_completeStartDictationWithContinuation:(id)a3;
- (void)_createDictationPresenterWindowIfNecessary;
- (void)_deleteBackwardIntoText;
- (void)_dictationDidRecieveDidBeginDictationNotification:(id)a3;
- (void)_dictationDidRecieveDidFinishDictationNotification:(id)a3;
- (void)_displayLinkFired:(id)a3;
- (void)_displaySecureContentsAsPlainText:(BOOL)a3 afterDelay:(double)a4;
- (void)_endEnableDictationPromptAnimated:(BOOL)a3;
- (void)_endOfflineMetricsSession;
- (void)_endUndoGroupingIfNecessary;
- (void)_finalizePhrasesOnDictationPause;
- (void)_handleDataSharingSheetDecision;
- (void)_handlePrivacySheetDismissal;
- (void)_handleRecognizedCommandWithCommandIdentifier:(unint64_t)a3 parameters:(id)a4 strings:(id)a5 voiceCommandUUID:(id)a6;
- (void)_handleWKMultipleTextTargetsForText:(id)a3 payloadText:(id)a4 voiceCommandUUID:(id)a5 completionHandler:(id)a6;
- (void)_insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)_logEnablementPromtMetricsWithStartDate:(id)a3;
- (void)_markOfflineDictationInputMetricEvent;
- (void)_performDictationRedo;
- (void)_performDictationUndo;
- (void)_performStandardEditAction:(SEL)a3 sender:(id)a4;
- (void)_presentAlertForDictationInputModeOfType:(int64_t)a3 completionHandler:(id)a4;
- (void)_presentDataSharingOptInAlertWithCompletion:(id)a3;
- (void)_presentEnablementAndDataSharingPromptIfNeeded:(id)a3;
- (void)_presentOptInAlertWithCompletion:(id)a3;
- (void)_presentPrivacySheetForType:(int64_t)a3 completion:(id)a4;
- (void)_refreshVisibleRTIDocumentStateWithContinuation:(id)a3;
- (void)_removeUndoNotificationObservation;
- (void)_requestDocumentContextWithCompletionHandler:(id)a3;
- (void)_requestFullDocumentContextWithCompletionHandler:(id)a3;
- (void)_restoreInsertionPointPositionWithKeyboard:(id)a3 originalPositionRange:(_NSRange)a4 targetRange:(_NSRange)a5 payloadRange:(_NSRange)a6 contextBefore:(BOOL)a7;
- (void)_runFinalizeOperation;
- (void)_runFinalizeOperation:(BOOL)a3;
- (void)_setFinalResultHandler:(id)a3;
- (void)_setupHypothesisAsFinalResults;
- (void)_startDictationWithContinuation:(id)a3;
- (void)_startStreamingAnimations;
- (void)_stopStreamingAnimation;
- (void)_touchPhaseChangedForTouch:(id)a3;
- (void)_updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)beginUserInteraction:(int64_t)a3;
- (void)cancelDictation;
- (void)cancelDictationForResponderIfNeeded:(id)a3 wantsKeyboard:(BOOL)a4 isPencil:(BOOL)a5;
- (void)cancelDictationForTextStoreChangesInResponder:(id)a3;
- (void)cancelRecordingLimitTimer;
- (void)clearKeyboardTrackpadModeIfNeeded;
- (void)clearSelectedTextAndLastDictationResult:(BOOL)a3;
- (void)clearTextFieldPlaceholder;
- (void)completeStartConnection;
- (void)completeStartConnectionForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4;
- (void)dealloc;
- (void)dictationConnection:(id)a3 didBeginLocalRecognitionWithModelInfo:(id)a4;
- (void)dictationConnection:(id)a3 didDetectLanguage:(id)a4;
- (void)dictationConnection:(id)a3 didFailRecognitionWithError:(id)a4;
- (void)dictationConnection:(id)a3 didFailRecordingWithError:(id)a4;
- (void)dictationConnection:(id)a3 didFilterTokensWithFilterState:(id)a4 forFinalize:(BOOL)a5;
- (void)dictationConnection:(id)a3 didReceiveCandidateDictationSerializableResults:(id)a4;
- (void)dictationConnection:(id)a3 didReceivePartialPackage:(id)a4 nluResult:(id)a5 languageModel:(id)a6;
- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7;
- (void)dictationConnection:(id)a3 didReceiveVoiceCommandCandidatePackage:(id)a4 nluResult:(id)a5;
- (void)dictationConnection:(id)a3 didStartRecordingWithOptions:(id)a4;
- (void)dictationConnection:(id)a3 filterState:(id)a4 processFilteredToken:(id)a5 forFinalize:(BOOL)a6;
- (void)dictationConnection:(id)a3 finalizePhrases:(id)a4 languageModel:(id)a5 correctionIdentifier:(id)a6 secureInput:(BOOL)a7 finalResult:(BOOL)a8;
- (void)dictationConnection:(id)a3 receivedInterpretation:(id)a4 languageModel:(id)a5 secureInput:(BOOL)a6;
- (void)dictationConnection:(id)a3 updateOptions:(id)a4;
- (void)dictationConnectionDidCancel:(id)a3;
- (void)dictationConnectionDidCancelIncompatibleLocalRecognizer:(id)a3;
- (void)dictationConnectionDidCancelRecording:(id)a3;
- (void)dictationConnectionDidEndRecording:(id)a3;
- (void)dictationConnectionDidFinish:(id)a3;
- (void)dictationConnectionDidStartRecording:(id)a3;
- (void)dictationConnectionWillStartRecording:(id)a3;
- (void)dictationConnnectionDidChangeAvailability:(id)a3;
- (void)dictationPrivacySheetControllerDidFinish:(id)a3;
- (void)dictationShortCutKey:(id)a3;
- (void)didShowAlternatives:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5 instrumentationContext:(id)a6 dictationLanguage:(id)a7;
- (void)dismissDictationView:(id)a3;
- (void)dismissSoftwareKeyboardIfNeeded;
- (void)endSessionIfNecessaryForTransitionFromState:(int)a3 toState:(int)a4;
- (void)endSmartLanguageSelectionOverride;
- (void)endUserInteraction;
- (void)errorAnimationDidFinish;
- (void)euclidPhoneticString:(id)a3 maxResultsCount:(unint64_t)a4 completion:(id)a5;
- (void)finalizeDictationRecognitionWithPhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5 secureInput:(BOOL)a6 finalResult:(BOOL)a7;
- (void)finishDictationRecognitionWithPhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5 secureInput:(BOOL)a6;
- (void)forceDictationReturnToKeyboardInputMode;
- (void)forceOOPDocumentStateSync;
- (void)handleDictationShouldPause:(BOOL)a3 withNewDelagate:(BOOL)a4;
- (void)handleHardwareKeyboardGesture;
- (void)handleWKActionMoveAfter;
- (void)handleWKActionMoveBefore;
- (void)insertLastHypothesisAsFinalResultLocally;
- (void)insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:(id)a3 disambiguationIndex:(id)a4 totalDisambiguationCount:(id)a5;
- (void)instrumentDictationVoiceCommandUndoTapActionWithVoiceCommandUUID:(id)a3 undoTapAlternativeSelection:(BOOL)a4;
- (void)instrumentationDictationContextEmitInstrumentation;
- (void)instrumentationDictationTranscriptionMetadataEmitInstrumentationWithDictationResult:(id)a3;
- (void)invalidateTextInputView;
- (void)keyboardDidHide:(id)a3;
- (void)launchDictationFeedbackApp;
- (void)logAlternativeSelected:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5;
- (void)logDidAcceptDictationResult:(id)a3 reasonType:(unint64_t)a4;
- (void)logDidAcceptReplacement:(id)a3 replacementLanguageCode:(id)a4 originalText:(id)a5 correctionIdentifier:(id)a6 interactionIdentifier:(id)a7;
- (void)logEuclidRequested;
- (void)logEuclidSelection:(id)a3 suggestedTokens:(id)a4 correctedToken:(id)a5 selectedIndex:(int64_t)a6;
- (void)markDictationTipDeletionEvent:(id)a3 deletedTextRange:(_NSRange)a4;
- (void)markDictationTipInputEvent;
- (void)markDictationTipKeyboardEventReset;
- (void)markDictationUndoEventWithVoiceCommandUUID:(id)a3 viaTapOnRevertBubble:(BOOL)a4;
- (void)markKeyboardDeleteMetricEvent;
- (void)markKeyboardDidReset;
- (void)markKeyboardInputMetricEvent;
- (void)notifyDocumentStateChangedAndResumeDictation:(id)a3;
- (void)optInButtonPressedForPresenter:(id)a3;
- (void)optOutButtonPressedForPresenter:(id)a3;
- (void)overrideSmartLanguageSelection:(id)a3;
- (void)pauseDictation;
- (void)pauseDictationOnUserInteraction:(int64_t)a3;
- (void)pauseSpeechRecognition;
- (void)performIgnoringDocumentChanges:(id)a3;
- (void)performIgnoringRTIChanges:(id)a3;
- (void)performTextReplacementForWebKitWithDeltaRange:(_NSRange)a3 targetText:(id)a4 replacementText:(id)a5 originalSelectedRange:(_NSRange)a6 voiceCommandDisambiguationSelectedIndex:(id)a7 voiceCommandDisambiguationTargetCount:(id)a8 voiceCommandUUID:(id)a9 completionHandler:(id)a10;
- (void)playVoiceCommandHapticFeedack;
- (void)postNotificationName:(id)a3 userInfo:(id)a4;
- (void)preferencesChanged:(id)a3;
- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4;
- (void)preheatIfNecessary;
- (void)prepareDoubleTapShortcutGesture:(id)a3;
- (void)prepareStartDictationKeyboardGestures;
- (void)prepareStartDictationKeyboardGesturesForDelegate:(id)a3;
- (void)prepareVoiceCommandSingleTapGesture:(id)a3;
- (void)presentAlertOfType:(int64_t)a3 withCompletion:(id)a4;
- (void)presentEnablementAndDataSharingPromptIfNeeded:(id)a3;
- (void)releaseConnection;
- (void)removeSelectedText;
- (void)removeStartDictationKeyboardGestures;
- (void)requestVisibleTextWithCompletionBlock:(id)a3;
- (void)resetAdaptiveDeleteActivationLogic;
- (void)resetDictation;
- (void)resetIdleTimer;
- (void)resetLastHypothesis;
- (void)resetSpeechRecognition;
- (void)resignFirstResponderWhenIdleIfNeeded;
- (void)restoreTextFieldPlaceholder;
- (void)resumeDictation;
- (void)resumeSpeechRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5;
- (void)rtiInputSessionWillChangeToNewProcess:(id)a3;
- (void)searchString:(id)a3 completionHandler:(id)a4;
- (void)searchString:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 completionHandler:(id)a6;
- (void)sendButtonPressedInMessages:(id)a3;
- (void)setActivationIdentifier:(id)a3;
- (void)setAppState:(int)a3;
- (void)setCachedDisplayLowStorageNotification:(id)a3;
- (void)setCanUndoOrRedo:(BOOL)a3;
- (void)setCandidateDictationSerializableResults:(id)a3;
- (void)setCommandTargetRangeMatchingGazeRange:(id)a3;
- (void)setCurrentEuclidLanguage:(id)a3;
- (void)setCurrentInputModeForDictation:(id)a3;
- (void)setCurrentInstrumentationContext:(id)a3;
- (void)setCurrentKeyboardPrimaryLanguage:(id)a3;
- (void)setCurrentLanguageVerbFirstCommandLanguageStatusCached:(id)a3;
- (void)setCursorPositionRestorer:(id)a3;
- (void)setDetectedLanguage:(id)a3;
- (void)setDetectingUtterances:(BOOL)a3;
- (void)setDictationInfoOnScreenNotifyKey:(BOOL)a3;
- (void)setDictationInputMode:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setDictationPresenterWindow:(id)a3;
- (void)setDictationPrivacySheetController:(id)a3;
- (void)setDictationSourceType:(unint64_t)a3;
- (void)setDictationTipController:(id)a3;
- (void)setDidToggleSoftwareKeyboardVisibleForDictation:(BOOL)a3;
- (void)setDisambiguationActiveEnabled:(BOOL)a3;
- (void)setDiscardNextHypothesis:(BOOL)a3;
- (void)setEnablementInstrumentationContext:(id)a3;
- (void)setEnablementLoggingIsDictationEnabled:(BOOL)a3;
- (void)setEnablementLoggingIsLearnMoreButtonClicked:(BOOL)a3;
- (void)setFallbackDictationLanguage:(id)a3;
- (void)setFinalizingRecognizedUtterance:(BOOL)a3;
- (void)setHasCheckedForLeadingSpaceOnce:(BOOL)a3;
- (void)setHasInsertedAtLeastOneSerializedDictationResult:(BOOL)a3;
- (void)setHasPreheated:(BOOL)a3;
- (void)setHasSelectedTextRange:(BOOL)a3;
- (void)setHaveLeakedPartialResultForCommandUtterance:(BOOL)a3;
- (void)setHaveReceivedFirstPartialResultForCurrentUtterance:(BOOL)a3;
- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4;
- (void)setIdleTimerResetTimer:(id)a3;
- (void)setIgnoreFinalizePhrases:(BOOL)a3;
- (void)setIgnoreKeyboardDidHideNotification:(BOOL)a3;
- (void)setIgnoreUserInteraction:(BOOL)a3;
- (void)setInitialCharacterAfterSelectionForAsyncDelegate:(unsigned __int16)a3;
- (void)setInitialDictationLanguage:(id)a3;
- (void)setInitialPreviousCharacterForAsyncDelegate:(unsigned __int16)a3;
- (void)setInputModeOptions:(id)a3;
- (void)setInsertionRange:(_NSRange)a3;
- (void)setInteractionIdentifier:(id)a3;
- (void)setIsDictationUndoGroupingOpen:(BOOL)a3;
- (void)setIsProcessingPotentialVoiceCommand:(BOOL)a3;
- (void)setKeyboardInputModeToReturn:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setLastCorrectionIdentifier:(id)a3;
- (void)setLastHypothesis:(id)a3;
- (void)setLastMessageKeyboardLanguage:(id)a3;
- (void)setLastRecognitionText:(id)a3;
- (void)setLastSuppressedCommandPartialTokens:(id)a3;
- (void)setLocalSpeechRecognitionForced:(BOOL)a3;
- (void)setLogAppEnterBackground:(BOOL)a3;
- (void)setModelInfo:(id)a3;
- (void)setModelessUsedAtLeastOnce:(BOOL)a3;
- (void)setPauseUpdatingHelperMessage:(BOOL)a3;
- (void)setPendingEdits:(id)a3;
- (void)setPerformingStreamingEditingOperation:(BOOL)a3;
- (void)setPreCommandExecutionPositionRange:(_NSRange)a3;
- (void)setPreviousCharacter:(unsigned __int16)a3;
- (void)setPreviousHypothesis:(id)a3;
- (void)setReasonType:(unint64_t)a3;
- (void)setResigningFirstResponder:(BOOL)a3;
- (void)setRestoreStagedDictationOnIdle:(BOOL)a3;
- (void)setSecureOfflineOnlySpeechRecognition:(BOOL)a3;
- (void)setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:(BOOL)a3;
- (void)setSelectionStartIsStartOfParagraph:(BOOL)a3;
- (void)setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:(BOOL)a3;
- (void)setSendButtonPressedDuringDictation:(BOOL)a3;
- (void)setShadowState:(int)a3;
- (void)setShouldDeleteWordOnBackspaceTap:(BOOL)a3;
- (void)setShouldResumeDictation:(BOOL)a3;
- (void)setShouldStayInDictationInputMode:(BOOL)a3;
- (void)setShouldSuppressSoftwareKeyboard:(BOOL)a3;
- (void)setSkipAutomaticResumeDictation:(BOOL)a3;
- (void)setSmartLanguageSelectionOverrideLanguage:(id)a3;
- (void)setStartRangeOfCurrentHypothesis:(_NSRange)a3;
- (void)setState:(int)a3;
- (void)setStateHandler:(unint64_t)a3;
- (void)setSuppressDelegateTextInputDidChangeNotifications:(BOOL)a3;
- (void)setTargetHypothesis:(id)a3;
- (void)setVisibleContextBeforeInputAtCommandExecution:(id)a3;
- (void)setVisibleRTIDocumentStateAtCommandRecognition:(id)a3;
- (void)setVisibleRTIDocumentStateAtStart:(id)a3;
- (void)setWantsAvailabilityMonitoringWhenAppActive:(BOOL)a3;
- (void)set_inputDelegateClassName:(id)a3;
- (void)set_shouldUseDictationSearchFieldBehavior:(BOOL)a3;
- (void)setupForAsyncDelegate;
- (void)setupForDictationStart;
- (void)setupForStreamingDictationStart;
- (void)setupToInsertResultForNewHypothesis:(id)a3;
- (void)showLowStorageUserAlertWithLanguage:(id)a3;
- (void)showSoftwareKeyboardIfNeeded;
- (void)startConnectionWithContinuation:(id)a3;
- (void)startDictation;
- (void)startDictationForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4;
- (void)startDictationWithContinuation:(id)a3;
- (void)startHelperMessageDisplayIfNeeded;
- (void)startRecordingLimitTimer;
- (void)stopAndCancelDictationIfNeededWithReasonType:(unint64_t)a3;
- (void)stopAndCancelDictationWithReasonType:(unint64_t)a3;
- (void)stopDictation;
- (void)stopDictation:(BOOL)a3;
- (void)stopDictationAndResignFirstResponder;
- (void)stopDictationByTimer;
- (void)stopDictationIgnoreFinalizePhrases;
- (void)stopDictationIgnoreFinalizePhrases:(BOOL)a3;
- (void)stopHelperMessageDisplayIfNeeded;
- (void)stopIdleTimerResetTimer;
- (void)switchToDictationInputMode;
- (void)switchToDictationInputModeWithOptions:(id)a3;
- (void)switchToDictationInputModeWithTouch:(id)a3;
- (void)switchToDictationInputModeWithTouch:(id)a3 options:(id)a4;
- (void)switchToDictationInputModeWithTouch:(id)a3 withKeyboardInputMode:(id)a4 options:(id)a5;
- (void)switchToDictationLanguage:(id)a3;
- (void)switchToDictationLanguage:(id)a3 inputOptions:(id)a4;
- (void)switchToKeyboardInputModeIfNeeded;
- (void)updateDoubleTapShortcutWithPreference:(int64_t)a3;
- (void)updateHelperMessageDisplayIfNeeded;
- (void)updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4;
- (void)updateRecordingLimitTimerIfNeeded;
- (void)voiceCommandSingleTapKey:(id)a3;
@end

@implementation UIDictationController

+ (id)activeInstance
{
  return (id)gSharedInstance;
}

+ (BOOL)isRunning
{
  BOOL v2 = +[UIKeyboard usesInputSystemUI];
  uint64_t v3 = 12;
  if (v2) {
    uint64_t v3 = 8;
  }
  return *(_DWORD *)&_MergedGlobals_33_1[v3] != 0;
}

+ (id)sharedInstance
{
  BOOL v2 = (void *)gSharedInstance;
  if (!gSharedInstance)
  {
    uint64_t v3 = objc_alloc_init(UIDictationController);
    v4 = (void *)gSharedInstance;
    gSharedInstance = (uint64_t)v3;

    BOOL v2 = (void *)gSharedInstance;
  }
  id v5 = v2;
  return v5;
}

- (BOOL)dictationSearchFieldUISupportsTraitCollection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 userInterfaceIdiom] == 1 || objc_msgSend(v3, "userInterfaceIdiom") == 0;

  return v4;
}

- (BOOL)dictationSearchFieldUIEnabled
{
  if ([(UIDictationController *)self currentViewModeSupportsDictationMics]
    && _UIIsPrivateMainBundle()
    && ![(UIDictationController *)self dictationDisabledDueToTelephonyActivity])
  {
    id v5 = _UIKitUserDefaults();
    if ([(id)objc_opt_class() _isDictationAllowedWithUserDefaults:v5])
    {
      if ([v5 BOOLForKey:@"Dictation Enabled"]) {
        goto LABEL_13;
      }
      v6 = +[UIDictationConnectionPreferences sharedInstance];
      char v7 = [v6 suppressDictationOptIn];

      if ((v7 & 1) == 0)
      {
        v8 = +[UIWindow _applicationKeyWindow];
        v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = +[UIKeyboardImpl keyboardWindow];
        }
        v11 = v10;

        char v12 = [v11 _isHostedInAnotherProcess];
        if ((v12 & 1) == 0)
        {
LABEL_13:
          if ([(UIDictationController *)self _allowsMicsInSearchField])
          {
            char v3 = 1;
LABEL_17:

            return v3;
          }
          if (os_variant_has_internal_diagnostics())
          {
            char v3 = [v5 BOOLForKey:@"UIDictationControllerForceDictationUIInSearchField"];
            goto LABEL_17;
          }
        }
      }
    }
    char v3 = 0;
    goto LABEL_17;
  }
  return 0;
}

- (BOOL)dictationDisabledDueToTelephonyActivity
{
  return [(_UIDictationTelephonyMonitor *)self->_monitor telephonyActivity];
}

- (BOOL)currentViewModeSupportsDictationMics
{
  int v2 = +[UIDictationController viewMode];
  if (v2) {
    BOOL v3 = v2 == 6;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)_allowsMicsInSearchField
{
  BOOL v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  BOOL v4 = [v3 firstObject];

  uint64_t v6 = 0;
  LOBYTE(self) = [(UIDictationController *)self supportsDictationLanguage:v4 error:&v6];

  return (char)self;
}

- (BOOL)supportsDictationLanguage:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")&& (([v5 isEqualToString:@"zh_CN"] & 1) != 0|| (objc_msgSend(v5, "hasPrefix:", @"zh-Hans") & 1) != 0))
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  BOOL v6 = +[UIDictationConnection dictationIsSupportedForLanguageCode:v5 error:a4];
  BOOL v7 = v6;
  if (a4 && !v6)
  {
    if ([*a4 code] == 1) {
      +[UIDictationConnection cacheSupportedDictationLanguages];
    }
    goto LABEL_8;
  }
LABEL_9:

  return v7;
}

+ (int)viewMode
{
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
  {
    return 6;
  }
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if (!+[UIDictationController starkSceneExists]) {
    goto LABEL_7;
  }
  uint64_t v4 = [v3 containerWindow];
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = (void *)v4;
  BOOL v6 = [v3 containerWindow];
  BOOL v7 = [v6 screen];
  uint64_t v8 = [v7 _userInterfaceIdiom];

  if (v8 == 3)
  {
    int v2 = 0;
  }
  else
  {
LABEL_7:
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (+[UIKeyboardImpl isFloating])
      {
        int v2 = 7;
      }
      else
      {
        v9 = [v3 inputViews];
        if ([v9 isSplit]) {
          int v2 = 4;
        }
        else {
          int v2 = 3;
        }
      }
    }
    else
    {
      int v2 = 2;
    }
  }

  return v2;
}

+ (BOOL)starkSceneExists
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v2 = +[UIScene _scenesIncludingInternal:](UIScene, "_scenesIncludingInternal:", 1, 0);
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
        BOOL v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v6 _hostsWindows])
        {
          BOOL v7 = [v6 _screen];
          uint64_t v8 = [v7 _userInterfaceIdiom];

          if (v8 == 3)
          {
            LOBYTE(v3) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

+ (BOOL)_isDictationAllowedWithUserDefaults:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"Dictation Allowed"];

  if (v4) {
    char v5 = [v3 BOOLForKey:@"Dictation Allowed"];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)endSmartLanguageSelectionOverride
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  smartLanguageSelectionOverrideLanguage = self->_smartLanguageSelectionOverrideLanguage;
  if (smartLanguageSelectionOverrideLanguage)
  {
    self->_smartLanguageSelectionOverrideLanguage = 0;

    id v3 = _UIDictationControllerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      char v5 = "-[UIDictationController endSmartLanguageSelectionOverride]";
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s ended", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (BOOL)supportsInputMode:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
  {
    [v6 defaultDictationLanguage];
  }
  else
  {
    [v6 languageWithRegion];
  BOOL v7 = };

  BOOL v8 = [(UIDictationController *)self supportsDictationLanguage:v7 error:a4];
  return v8;
}

- (id)dictationConnection
{
  dictationConnection = self->_dictationConnection;
  if (!dictationConnection)
  {
    int v4 = objc_alloc_init(UIDictationConnection);
    char v5 = self->_dictationConnection;
    self->_dictationConnection = v4;

    [(UIDictationConnection *)self->_dictationConnection setDelegate:self];
    [(UIDictationConnection *)self->_dictationConnection setTokenFilter:self];
    [(UIDictationConnection *)self->_dictationConnection beginAvailabilityMonitoring];
    dictationConnection = self->_dictationConnection;
  }
  return dictationConnection;
}

- (UIDictationController)init
{
  v31.receiver = self;
  v31.super_class = (Class)UIDictationController;
  int v2 = [(UIDictationController *)&v31 init];
  if (!v2) {
    return 0;
  }
  id v3 = v2;
  if (+[UIDictationConnection isDictationAvailable])
  {
    if (notify_register_check("com.apple.keyboard.isDictationRunning", &v3->_dictationInputModeNotifierToken)) {
      v3->_dictationInputModeNotifierToken = -1;
    }
    int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:objc_opt_class() selector:sel_applicationDidBecomeActive name:@"UIApplicationDidBecomeActiveNotification" object:0];
    [v4 addObserver:objc_opt_class() selector:sel_applicationWillResignActive name:@"UIApplicationWillResignActiveNotification" object:0];
    [v4 addObserver:objc_opt_class() selector:sel_viewServiceDidBecomeActive name:0x1ED180360 object:0];
    [v4 addObserver:objc_opt_class() selector:sel_viewServiceWillResignActive name:0x1ED180380 object:0];
    [v4 addObserver:objc_opt_class() selector:sel_applicationDidEnterBackgroundNotification name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v4 addObserver:objc_opt_class() selector:sel_siriPreferencesChanged name:0x1ED142D60 object:0];
    [v4 addObserver:objc_opt_class() selector:sel_remoteMicrophoneCapabilityChanged name:@"_UIDeviceRemoteHasMicrophoneDidChangeNotification" object:0];
    [v4 addObserver:v3 selector:sel_keyboardWillHide_ name:@"UIKeyboardPrivateWillHideNotification" object:0];
    [v4 addObserver:v3 selector:sel_keyboardDidHide_ name:@"UIKeyboardPrivateDidHideNotification" object:0];
    [v4 addObserver:v3 selector:sel_preferencesChanged_ name:*MEMORY[0x1E4FAEA28] object:0];
    [v4 addObserver:v3 selector:sel_sendButtonPressedInMessages_ name:@"CKMessageEntryViewSendButtonPressedNotification" object:0];
    if (+[UIKeyboard isKeyboardProcess])
    {
      [v4 addObserver:objc_opt_class() selector:sel_keyboardDidShow name:@"UIKeyboardDidShowNotification" object:0];
      [v4 addObserver:v3 selector:sel_rtiInputSessionWillChangeToNewProcess_ name:*MEMORY[0x1E4F95F30] object:0];
    }
    else
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 addObserver:v3 selector:sel__dictationDidRecieveDidBeginDictationNotification_ name:@"UIKeyboardDidBeginDictationNotification" object:0];

      BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v7 addObserver:v3 selector:sel__dictationDidRecieveDidFinishDictationNotification_ name:@"UIDictationControllerDictationDidFinish" object:0];
    }
    uint64_t v8 = +[UIDictationConnectionPreferences sharedInstance];
    preferences = v3->_preferences;
    v3->_preferences = (UIDictationConnectionPreferences *)v8;

    uint64_t v10 = objc_opt_new();
    monitor = v3->_monitor;
    v3->_monitor = (_UIDictationTelephonyMonitor *)v10;

    objc_initWeak(&location, v3);
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    v27 = __29__UIDictationController_init__block_invoke;
    v28 = &unk_1E52DC308;
    objc_copyWeak(&v29, &location);
    [(_UIDictationTelephonyMonitor *)v3->_monitor setActivityChanged:&v25];
    [(_UIDictationTelephonyMonitor *)v3->_monitor start];
    long long v12 = objc_alloc_init(UIDictationTipController);
    dictationTipController = v3->_dictationTipController;
    v3->_dictationTipController = v12;

    v14 = objc_alloc_init(UIDictationCursorPositionRestorer);
    cursorPositionRestorer = v3->_cursorPositionRestorer;
    v3->_cursorPositionRestorer = v14;

    _MergedGlobals_33_1[0] = 1;
    v3->_stateHandler = os_state_add_handler();
    v16 = [[_UIAssertionController alloc] initWithAssertionSubject:v3];
    assertionController = v3->_assertionController;
    v3->_assertionController = v16;

    v18 = +[_UIDictationSettingsDomain rootSettings];
    int v19 = [v18 commandHapticFeedbackEnabled];

    if (v19)
    {
      v20 = [UIImpactFeedbackGenerator alloc];
      v21 = +[_UIDictationSettingsDomain rootSettings];
      uint64_t v22 = -[UIImpactFeedbackGenerator initWithStyle:view:](v20, "initWithStyle:view:", [v21 impactStyle], 0);
      feedbackGenerator = v3->_feedbackGenerator;
      v3->_feedbackGenerator = (UIImpactFeedbackGenerator *)v22;
    }
    char v5 = v3;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

+ (void)onDidBecomeActive
{
  int v2 = +[UIDictationController activeInstance];
  int v3 = [v2 wantsAvailabilityMonitoringWhenAppActive];

  if (v3)
  {
    int v4 = +[UIDictationController sharedInstance];
    char v5 = [v4 dictationConnection];
    [v5 beginAvailabilityMonitoring];
  }
  _MergedGlobals_33_1[0] = 1;
  if (byte_1EB25A972 == 1)
  {
    id v6 = +[UIDictationController activeInstance];
    [v6 switchToDictationInputMode];

    byte_1EB25A972 = 0;
  }
  id v7 = +[UIDictationController activeInstance];
  [v7 setPauseUpdatingHelperMessage:0];
}

- (BOOL)wantsAvailabilityMonitoringWhenAppActive
{
  return self->_wantsAvailabilityMonitoringWhenAppActive;
}

- (void)setPauseUpdatingHelperMessage:(BOOL)a3
{
  self->_pauseUpdatingHelperMessage = a3;
}

- (void)cancelDictationForTextStoreChangesInResponder:(id)a3
{
  id v7 = a3;
  if (![(UIDictationController *)self isDetectingUtterances]
    && ![(UIDictationController *)self isIgnoringDocumentChanges])
  {
    if (+[UIDictationController isRunning])
    {
      int v4 = +[UIKeyboardImpl activeInstance];
      char v5 = [v4 inputDelegateManager];
      id v6 = [v5 delegateAsResponder];

      if (v6 == v7)
      {
        self->_deferredCancellationRequested = 1;
        [(UIDictationController *)self _startStreamingAnimations];
      }
    }
  }
}

- (BOOL)isIgnoringDocumentChanges
{
  return self->_updatingDocument > 0;
}

- (BOOL)isDetectingUtterances
{
  return self->_detectingUtterances;
}

- (void)dictationConnnectionDidChangeAvailability:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  char v5 = @"reason";
  v6[0] = @"Dictation connection did change availability";
  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(UIDictationController *)self postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v4];
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToString:@"UIKeyboardDictationAvailabilityDidChangeNotification"] & 1) != 0
    || ([v6 isEqualToString:@"UIDictationControllerDictationDidFinish"] & 1) != 0
    || ([v6 isEqualToString:@"UIKeyboardDidBeginDictationNotification"] & 1) != 0
    || ([v6 isEqualToString:@"UIDictationControllerDidResumeNotification"] & 1) != 0
    || ([v6 isEqualToString:@"UIDictationControllerDidPauseNotification"] & 1) != 0
    || [v6 isEqualToString:@"UIDictationWillInsertHypothesisNotification"])
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      if ([v6 isEqualToString:@"UIKeyboardDictationAvailabilityDidChangeNotification"])
      {
        uint64_t v8 = [v7 objectForKeyedSubscript:@"reason"];
        v9 = _UIDictationControllerLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v28 = "-[UIDictationController postNotificationName:userInfo:]";
          __int16 v29 = 2114;
          v30 = v8;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%s Dictation availability did change with reason: %{public}@", buf, 0x16u);
        }
      }
      uint64_t v10 = +[UIKeyboardImpl activeInstance];
      long long v11 = [v10 inputDelegateManager];
      long long v12 = [v11 inputSystemSourceSession];

      if (v12)
      {
        long long v13 = [v12 textOperations];
        [v13 setCustomInfoType:0x1ED14BAA0];
        v21 = @"selector";
        v14 = NSStringFromSelector(sel_postNotificationName_object_userInfo_);
        v24 = v14;
        id v25 = v6;
        uint64_t v22 = @"notificationName";
        v23 = @"userInfo";
        if (v7) {
          id v15 = v7;
        }
        else {
          id v15 = (id)MEMORY[0x1E4F1CC08];
        }
        id v26 = v15;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v21 count:3];
        objc_msgSend(v13, "setCustomInfo:", v16, v21, v22, v23, v24, v25);

        [v12 flushOperations];
      }
    }
    if ([v6 isEqualToString:@"UIKeyboardDidBeginDictationNotification"])
    {
      v17 = [v7 objectForKeyedSubscript:@"dictationLanguage"];
      v18 = +[UIKeyboardImpl activeInstance];
      [v18 setActiveDictationLanguage:v17];

      BOOL v19 = 1;
    }
    else
    {
      if (![v6 isEqualToString:@"UIDictationControllerDictationDidFinish"])
      {
LABEL_23:
        v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v20 postNotificationName:v6 object:0 userInfo:v7];

        goto LABEL_24;
      }
      v17 = +[UIKeyboardImpl activeInstance];
      [v17 setActiveDictationLanguage:0];
      BOOL v19 = 0;
    }

    self->_canSendDidFinishNotification = v19;
    goto LABEL_23;
  }
LABEL_24:
}

_DWORD *__29__UIDictationController_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) != 3) {
    return 0;
  }
  int v2 = +[UIDictationController sharedInstance];
  int v3 = [v2 dictationUIState];

  if (v3)
  {
    int v4 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v3 format:200 options:0 error:0];
    uint64_t v5 = [v4 length];
    id v6 = 0;
    if (v4) {
      BOOL v7 = v5 <= 4294967294;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      uint64_t v8 = v5;
      id v6 = malloc_type_malloc(v5 + 200, 0xA493E6E5uLL);
      _DWORD *v6 = 1;
      __strlcpy_chk();
      v6[1] = v8;
      [v4 getBytes:v6 + 50 length:v8];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (float)maxRecordingLength
{
  BOOL v2 = [(UIDictationController *)self isDetectingUtterances];
  float result = 60.0;
  if (v2) {
    return 30.0;
  }
  return result;
}

+ (BOOL)usingServerManualEndpointingThreshold
{
  BOOL v2 = +[UIDictationConnectionPreferences sharedInstance];
  char v3 = [v2 ignoreServerManualEndpointingThreshold] ^ 1;

  return v3;
}

+ (double)serverManualEndpointingThreshold
{
  BOOL v2 = +[UIDictationConnectionPreferences sharedInstance];
  char v3 = [v2 manualEndpointingThreshold];

  [v3 floatValue];
  double v5 = v4;

  return v5;
}

void __29__UIDictationController_init__block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = @"reason";
  v4[0] = @"Dictation controller init";
  BOOL v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  [WeakRetained postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v2];
}

- (id)streamingOperations
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    char v3 = 0;
  }
  else
  {
    streamingOperations = self->_streamingOperations;
    if (!streamingOperations)
    {
      double v5 = objc_alloc_init(UIDictationStreamingOperations);
      id v6 = self->_streamingOperations;
      self->_streamingOperations = v5;

      streamingOperations = self->_streamingOperations;
    }
    char v3 = streamingOperations;
  }
  return v3;
}

+ (BOOL)supportsUndoCommandForCurrentDictationRequest
{
  int v2 = [a1 supportsSiriDictationVoiceCommands];
  if (v2)
  {
    LOBYTE(v2) = +[UIKeyboard isModelessActive];
  }
  return v2;
}

+ (BOOL)canUndoOrRedo
{
  char v3 = +[UIDictationController activeInstance];
  if ([v3 canUndoOrRedo]) {
    char v4 = 1;
  }
  else {
    char v4 = [a1 supportsUndoCommandForCurrentDictationRequest];
  }

  return v4;
}

+ (BOOL)isListening
{
  BOOL v2 = +[UIKeyboard usesInputSystemUI];
  uint64_t v3 = 12;
  if (v2) {
    uint64_t v3 = 8;
  }
  return *(_DWORD *)&_MergedGlobals_33_1[v3] == 2;
}

+ (BOOL)isRunningInTypeAndTalkMode
{
  int v2 = [a1 isRunning];
  if (v2)
  {
    uint64_t v3 = +[UIKeyboardInputMode dictationInputMode];
    char v4 = [v3 usingTypeAndTalk];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)supportsSiriDictationVoiceCommands
{
  int v2 = _os_feature_enabled_impl();
  if (v2) {
    LOBYTE(v2) = MGGetSInt64Answer() > 31;
  }
  return v2;
}

+ (BOOL)supportsSiriDictationVoiceCommandsUIRedesign
{
  if (!+[UIKeyboard isInlineDictationGlowEffectEnabled]
    || !+[UIKeyboard isInlineDictationIndicatorEnabled])
  {
    return 0;
  }
  return _os_feature_enabled_impl();
}

+ (BOOL)supportsSiriDictationVoiceCommandsGazeDisambiguation
{
  return 0;
}

- (BOOL)_resolvedIsDictationPossible
{
  BOOL v3 = [(UIDictationController *)self remoteHasMicrophone];
  BOOL v4 = [(UIDictationController *)self dictationEnabled];
  double v5 = [(UIDictationController *)self currentInputModeForDictation];
  id v6 = [v5 dictationLanguage];

  if (v6)
  {
    uint64_t v13 = 0;
    BOOL v7 = [(UIDictationController *)self supportsDictationLanguage:v6 error:&v13];
  }
  else
  {
    BOOL v7 = 0;
  }
  uint64_t v8 = +[UIKeyboardImpl activeInstance];
  v9 = [v8 textInputTraits];
  BOOL v10 = +[UIDictationController _checkTraitsSupportDictation:v9];

  BOOL v11 = v3 && v4 && v7 && v10;
  return v11;
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4 capitalization:(unint64_t)a5
{
  id v8 = a3;
  v9 = +[UIKeyboardImpl activeInstance];
  BOOL v10 = [v9 textInputTraits];
  uint64_t v11 = [v10 autocapitalizationType];

  long long v12 = [a1 serializedInterpretationFromTokens:v8 transform:a4 autocapitalization:v11 capitalization:a5];

  return v12;
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4 autocapitalization:(int64_t)a5 capitalization:(unint64_t)a6
{
  char v6 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = +[UIDictationInterpretation serializedInterpretationFromTokens:a3 transform:a4];
  if ((v6 & 2) != 0)
  {
    v9 = +[UIKeyboardImpl activeInstance];
    int v10 = [v9 isShiftLocked];
    if (a5 == 3 || v10)
    {
      uint64_t v11 = [v8 uppercaseString];
    }
    else
    {
      if (a5 != 1) {
        goto LABEL_8;
      }
      uint64_t v11 = [v8 capitalizedString];
    }
    long long v12 = (void *)v11;

    id v8 = v12;
LABEL_8:
    if (![v8 length])
    {
LABEL_16:

      goto LABEL_17;
    }
    uint64_t v13 = +[UIDictationUtilities _properNameForString:v8];
    if (!qword_1EB25A980)
    {
      id v14 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
      id v15 = (void *)qword_1EB25A980;
      qword_1EB25A980 = (uint64_t)v14;
    }
    v16 = +[UIDictationController sharedInstance];
    v17 = [v16 language];

    if ((v6 & 1) != 0 || !v13)
    {
      if ((v6 & 4) != 0 && byte_1EB25A971)
      {
        unsigned int v35 = [v8 characterAtIndex:0];
        if (v35 > 0x7F) {
          int v36 = __maskrune(v35, 0x1000uLL);
        }
        else {
          int v36 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v35 + 60) & 0x1000;
        }
        if (!v36
          || ![(id)qword_1EB25A980 canChangeCaseOfFirstLetterInString:v8 toUpperCase:1 language:v17])
        {
          goto LABEL_15;
        }
        v39 = [v8 substringToIndex:1];
        uint64_t v40 = [v39 uppercaseString];
      }
      else
      {
        if (v6) {
          goto LABEL_15;
        }
        unsigned int v37 = [v8 characterAtIndex:0];
        int v38 = v37 > 0x7F ? __maskrune(v37, 0x8000uLL) : *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v37 + 60) & 0x8000;
        if ((v6 & 4) == 0
          || !v38
          || ![(id)qword_1EB25A980 canChangeCaseOfFirstLetterInString:v8 toUpperCase:0 language:v17])
        {
          goto LABEL_15;
        }
        v39 = [v8 substringToIndex:1];
        uint64_t v40 = [v39 lowercaseString];
      }
      v41 = (void *)v40;
      v42 = [v8 substringFromIndex:1];
      id v18 = [v41 stringByAppendingString:v42];

      id v8 = v39;
    }
    else
    {
      id v18 = v13;
    }

    id v8 = v18;
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:
  BOOL v19 = +[UIKeyboardImpl activeInstance];
  v20 = [v19 smartPunctuationController];

  if ([v8 length])
  {
    v21 = [v20 smartPunctuationOptions];

    if (v21)
    {
      uint64_t v22 = [v20 smartPunctuationResultsForString:v8];
      if ([v22 count])
      {
        v23 = (void *)[v8 mutableCopy];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        v43 = v22;
        id v24 = v22;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v45;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v45 != v27) {
                objc_enumerationMutation(v24);
              }
              __int16 v29 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              uint64_t v30 = [v29 range];
              uint64_t v32 = v31;
              v33 = [v29 replacementString];
              objc_msgSend(v23, "replaceCharactersInRange:withString:", v30, v32, v33);
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v48 count:16];
          }
          while (v26);
        }

        id v8 = v23;
        uint64_t v22 = v43;
      }
    }
  }

  return v8;
}

+ (BOOL)_checkTraitsSupportDictation:(id)a3
{
  id v3 = a3;
  BOOL v5 = MGGetBoolAnswer()
    && (+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")|| ([v3 isSecureTextEntry] & 1) == 0)&& (((unint64_t v4 = objc_msgSend(v3, "keyboardType"), v4 > 0xB) || ((1 << v4) & 0x938) == 0) && v4 != 127|| +[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")|| objc_msgSend(v3, "forceEnableDictation"))&& (objc_msgSend(v3, "forceDisableDictation") & 1) == 0&& objc_msgSend(v3, "keyboardAppearance") != 127;

  return v5;
}

+ (BOOL)checkTraitsSupportDictation:(id)a3
{
  int v3 = [a1 _checkTraitsSupportDictation:a3];
  if (v3)
  {
    unint64_t v4 = +[UIDictationController sharedInstance];
    char v5 = [v4 dictationEnabled];

    LOBYTE(v3) = v5;
  }
  return v3;
}

+ (BOOL)fetchCurrentInputModeSupportsDictation
{
  int v3 = +[UIKeyboardImpl activeInstance];
  unint64_t v4 = [v3 textInputTraits];
  LODWORD(a1) = [a1 checkTraitsSupportDictation:v4];

  if (!a1) {
    return 0;
  }
  char v5 = +[UIKeyboardImpl activeInstance];

  if (!v5) {
    return 0;
  }
  char v6 = +[UIDictationController sharedInstance];
  BOOL v7 = [v6 currentInputModeForDictation];
  id v8 = [v7 dictationLanguage];

  if (v8)
  {
    v9 = +[UIDictationController sharedInstance];
    uint64_t v12 = 0;
    char v10 = [v9 supportsDictationLanguage:v8 error:&v12];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (BOOL)dictationIsFunctional
{
  int v2 = +[UIKeyboardInputModeController sharedInputModeController];
  if ([v2 deviceStateIsLocked])
  {
    int v3 = +[UIDictationConnectionPreferences sharedInstance];
    int v4 = [v3 dictationIsEnabled];

    if (!v4) {
      return 0;
    }
  }
  else
  {
  }
  char v5 = +[UIDictationController sharedInstance];
  char v6 = [v5 dictationDisabledDueToTelephonyActivity];

  if (v6) {
    return 0;
  }
  id v8 = +[UIKeyboardImpl activeInstance];
  v9 = [v8 inputDelegateManager];
  char v10 = [v9 keyInputDelegate];

  if (objc_opt_respondsToSelector() & 1) != 0 && ([v10 _isPasscodeStyle])
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v11 = +[UIDictationController sharedInstance];
    uint64_t v12 = [v11 currentInputModeForDictation];
    uint64_t v13 = [v12 dictationLanguage];

    id v14 = [v11 dictationConnection];
    char v7 = [v14 dictationIsAvailableForLanguage:v13];
  }
  return v7;
}

+ (BOOL)canPerformDictation
{
  int v3 = +[UIKeyboardImpl activeInstance];
  int v4 = [v3 isCurrentEditResponderInEditingMode];

  if (!v4) {
    return 0;
  }
  char v5 = _UIKitUserDefaults();
  if ([a1 _isDictationAllowedWithUserDefaults:v5]
    && (+[UIKeyboardImpl activeInstance],
        char v6 = objc_claimAutoreleasedReturnValue(),
        [v6 textInputTraits],
        char v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [a1 checkTraitsSupportDictation:v7],
        v7,
        v6,
        v8))
  {
    char v9 = [a1 dictationIsFunctional];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

+ (id)logAutoPunctuationEdit:(id)a3 deletionValues:(id)a4 substitutionValues:(id)a5 withContext:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v38 = a4;
  id v37 = a5;
  id v35 = a6;
  v33 = v10;
  uint64_t v11 = [a1 stripNonPunctuationEditValues:v10];
  v41 = (void *)[v11 mutableCopy];

  uint64_t v12 = [a1 stripNonPunctuationEditValues:v38];
  v39 = (void *)[v12 mutableCopy];

  uint64_t v13 = [a1 stripNonPunctuationEditValues:v37];
  int v36 = (void *)[v13 mutableCopy];

  uint64_t v40 = [a1 mergePunctuationInsertAndDeleteIntoSubstituteTypeForSameStartEnd:v41 deleteEditValues:v39];
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = [v40 allKeys];
  [v41 removeObjectsForKeys:v14];

  id v15 = [v40 allKeys];
  [v39 removeObjectsForKeys:v15];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v16 addEntriesFromDictionary:v41];
  [v16 addEntriesFromDictionary:v39];
  [v16 addEntriesFromDictionary:v36];
  [v16 addEntriesFromDictionary:v40];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v34 = v16;
  id obj = [v16 allValues];
  uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(obj);
        }
        v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        v21 = [v20 objectForKeyedSubscript:@"dictationResultEditType"];
        uint64_t v49 = 0;
        v50 = &v49;
        uint64_t v51 = 0x2050000000;
        uint64_t v22 = (void *)getSISchemaAutoPunctuationEditClass_softClass;
        uint64_t v52 = getSISchemaAutoPunctuationEditClass_softClass;
        if (!getSISchemaAutoPunctuationEditClass_softClass)
        {
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __getSISchemaAutoPunctuationEditClass_block_invoke;
          v48[3] = &unk_1E52D9900;
          v48[4] = &v49;
          __getSISchemaAutoPunctuationEditClass_block_invoke((uint64_t)v48);
          uint64_t v22 = (void *)v50[3];
        }
        v23 = v22;
        _Block_object_dispose(&v49, 8);
        id v24 = objc_alloc_init(v23);
        uint64_t v25 = v24;
        if (v21 == @"insertion")
        {
          [v24 setRecognizedPunctuation:&stru_1ED0E84C0];
          v28 = [v20 objectForKeyedSubscript:@"text"];
          [v25 setCorrectedPunctuation:v28];
        }
        else if (v21 == @"deletion")
        {
          __int16 v29 = [v20 objectForKeyedSubscript:@"text"];
          [v25 setRecognizedPunctuation:v29];

          [v25 setCorrectedPunctuation:&stru_1ED0E84C0];
        }
        else
        {
          if (v21 != @"substitution") {
            goto LABEL_15;
          }
          uint64_t v26 = [v20 objectForKeyedSubscript:@"original"];
          [v25 setRecognizedPunctuation:v26];

          uint64_t v27 = [v20 objectForKeyedSubscript:@"replacement"];
          [v25 setCorrectedPunctuation:v27];
        }
        [v43 addObject:v25];
LABEL_15:
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v44 objects:v55 count:16];
    }
    while (v17);
  }

  uint64_t v30 = [v35 turnIdentifier];
  v53 = v30;
  id v54 = v43;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];

  return v31;
}

+ (id)stripNonPunctuationEditValues:(id)a3
{
  id v3 = a3;
  int v4 = (void *)[v3 mutableCopy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__UIDictationController_stripNonPunctuationEditValues___block_invoke;
  v7[3] = &unk_1E52ED238;
  id v5 = v4;
  id v8 = v5;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

void __55__UIDictationController_stripNonPunctuationEditValues___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v16 = a2;
  id v5 = a3;
  char v6 = [v5 objectForKeyedSubscript:@"dictationResultEditType"];
  char v7 = v6;
  if (v6 == @"insertion" || v6 == @"deletion")
  {
    char v9 = [v5 objectForKey:@"text"];
    id v10 = +[UIDictationUtilities trackingPunctuations];
    char v11 = [v10 containsObject:v9];

    if ((v11 & 1) == 0) {
      [*(id *)(a1 + 32) removeObjectForKey:v16];
    }
    goto LABEL_15;
  }
  if (v6 != @"substitution") {
    goto LABEL_16;
  }
  char v9 = [v5 objectForKey:@"original"];
  uint64_t v12 = [v5 objectForKey:@"replacement"];
  uint64_t v13 = +[UIDictationUtilities trackingPunctuations];
  if ([v13 containsObject:v9])
  {
    id v14 = +[UIDictationUtilities trackingPunctuations];
    char v15 = [v14 containsObject:v12];

    if (v15) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) removeObjectForKey:v16];
LABEL_14:

LABEL_15:
LABEL_16:
}

+ (id)mergePunctuationInsertAndDeleteIntoSubstituteTypeForSameStartEnd:(id)a3 deleteEditValues:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v23 = v5;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [v5 allKeys];
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    v21 = @"substitution";
    v20 = @"dictationResultEditType";
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "allKeys", v20, v21);
        int v13 = [v12 containsObject:v11];

        if (v13)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          char v15 = [v6 objectForKeyedSubscript:v11];
          id v16 = [v23 objectForKeyedSubscript:v11];
          uint64_t v17 = [v15 objectForKey:@"text"];
          uint64_t v18 = [v16 objectForKey:@"text"];
          [v14 setObject:v17 forKeyedSubscript:@"original"];
          [v14 setObject:v18 forKeyedSubscript:@"replacement"];
          [v14 setObject:v21 forKeyedSubscript:v20];
          [v22 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  return v22;
}

+ (id)convertEditValuesToHashByPosition:(id)a3 dictationResultEditType:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (__CFString *)a4;
  unint64_t v7 = 0x1E4F1C000uLL;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v28 = *(void *)v30;
    long long v25 = v6;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        id v12 = objc_alloc_init(*(Class *)(v7 + 2656));
        if (@"substitutions" == v6)
        {
          id v16 = [v11 objectForKeyedSubscript:@"original"];
          int v13 = [v16 objectForKeyedSubscript:@"start"];

          uint64_t v17 = [v11 objectForKeyedSubscript:@"original"];
          id v14 = [v17 objectForKeyedSubscript:@"end"];

          uint64_t v18 = [v11 objectForKeyedSubscript:@"original"];
          BOOL v19 = [v18 objectForKeyedSubscript:@"text"];
          [v12 setObject:v19 forKeyedSubscript:@"original"];

          v20 = [v11 objectForKeyedSubscript:@"replacement"];
          v21 = [v20 objectForKeyedSubscript:@"text"];
          [v12 setObject:v21 forKeyedSubscript:@"replacement"];

          unint64_t v7 = 0x1E4F1C000;
          id v6 = v25;

          [v12 setObject:@"substitution" forKeyedSubscript:@"dictationResultEditType"];
        }
        else
        {
          int v13 = [v11 objectForKey:@"start"];
          id v14 = [v11 objectForKey:@"end"];
          [v12 setObject:v6 forKeyedSubscript:@"dictationResultEditType"];
          char v15 = [v11 objectForKey:@"text"];
          [v12 setObject:v15 forKeyedSubscript:@"text"];
        }
        if (v13) {
          BOOL v22 = v14 == 0;
        }
        else {
          BOOL v22 = 1;
        }
        if (!v22)
        {
          v23 = [NSString stringWithFormat:@"start%@end%@", v13, v14];
          [v26 setObject:v12 forKeyedSubscript:v23];
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  return v26;
}

+ (void)logCorrectionStatisticsForDelegate:(id)a3 reason:(unint64_t)a4
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v60 = v5;
    objc_msgSend(NSString, "stringWithFormat:", @"%s", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]");

    v62 = [v5 metadataDictionariesForDictationResults];
    if ([v62 count])
    {
      v61 = +[UIDictationController activeInstance];
      v64 = [v61 connectionForStatisticsLogging];
      [v61 logDidAcceptDictationResult:v62 reasonType:a4];
      v63 = [MEMORY[0x1E4F1CA80] set];
      id v66 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id obj = v62;
      uint64_t v68 = [obj countByEnumeratingWithState:&v82 objects:v96 count:16];
      if (v68)
      {
        uint64_t v67 = *(void *)v83;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v83 != v67) {
              objc_enumerationMutation(obj);
            }
            unint64_t v7 = *(void **)(*((void *)&v82 + 1) + 8 * v6);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v8 = v7;
              id v74 = [MEMORY[0x1E4F1C9E8] dictionary];
              v73 = [MEMORY[0x1E4F1C9E8] dictionary];
              v72 = [MEMORY[0x1E4F1C9E8] dictionary];
              uint64_t v9 = objc_alloc_init(UIDictationConnectionCorrectionInfo);
              id v10 = [v8 objectForKey:@"recognizedTextInfo"];
              [(UIDictationConnectionCorrectionInfo *)v9 setRecognizedTextInfo:v10];

              uint64_t v11 = [v8 objectForKey:@"alternativesSelected"];
              [(UIDictationConnectionCorrectionInfo *)v9 setSelectedAlternativesInfo:v11];

              v71 = [v8 objectForKey:@"alternativesSelectedCount"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                -[UIDictationConnectionCorrectionInfo setAlternativeSelectionCount:](v9, "setAlternativeSelectionCount:", [v71 intValue]);
              }
              v70 = [v8 objectForKey:@"characterModificationCount"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                -[UIDictationConnectionCorrectionInfo setCharacterModificationCount:](v9, "setCharacterModificationCount:", [v70 intValue]);
              }
              id v12 = [v8 objectForKey:@"dictationInstrumentationContext"];
              int v13 = [v8 objectForKey:@"characterInsertionCount"];

              if (v13)
              {
                id v14 = [v8 objectForKey:@"characterInsertionCount"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  -[UIDictationConnectionCorrectionInfo setCharacterInsertionCount:](v9, "setCharacterInsertionCount:", [v14 intValue]);
                  objc_msgSend(NSString, "stringWithFormat:", @"%s characterInsertionCount: %ld", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterInsertionCount](v9, "characterInsertionCount"));
                }
                char v15 = [v8 objectForKey:@"insertions"];
                uint64_t v16 = [a1 convertEditValuesToHashByPosition:v15 dictationResultEditType:@"insertion"];

                id v74 = (id)v16;
              }
              uint64_t v17 = [v8 objectForKey:@"characterDeletionCount"];

              if (v17)
              {
                uint64_t v18 = [v8 objectForKey:@"characterDeletionCount"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  -[UIDictationConnectionCorrectionInfo setCharacterDeletionCount:](v9, "setCharacterDeletionCount:", [v18 intValue]);
                  objc_msgSend(NSString, "stringWithFormat:", @"%s characterDeletionCount: %ld", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterDeletionCount](v9, "characterDeletionCount"));
                }
                BOOL v19 = [v8 objectForKey:@"deletions"];
                uint64_t v20 = [a1 convertEditValuesToHashByPosition:v19 dictationResultEditType:@"deletion"];

                v73 = (void *)v20;
              }
              v21 = [v8 objectForKey:@"characterSubstitutionCount"];

              if (v21)
              {
                BOOL v22 = [v8 objectForKey:@"characterSubstitutionCount"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  -[UIDictationConnectionCorrectionInfo setCharacterSubstitutionCount:](v9, "setCharacterSubstitutionCount:", [v22 intValue]);
                  objc_msgSend(NSString, "stringWithFormat:", @"%s characterSubstitutionCount: %ld", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterSubstitutionCount](v9, "characterSubstitutionCount"));
                }
                v23 = [v8 objectForKey:@"substitutions"];
                uint64_t v24 = [a1 convertEditValuesToHashByPosition:v23 dictationResultEditType:@"substitutions"];

                v72 = (void *)v24;
              }
              if (v12)
              {
                long long v25 = [a1 logAutoPunctuationEdit:v74 deletionValues:v73 substitutionValues:v72 withContext:v12];
                [v66 addEntriesFromDictionary:v25];
              }
              id v26 = [v8 objectForKey:@"fullText"];
              [(UIDictationConnectionCorrectionInfo *)v9 setCorrectedText:v26];

              long long v27 = NSString;
              uint64_t v28 = [(UIDictationConnectionCorrectionInfo *)v9 correctedText];
              [v27 stringWithFormat:@"%s fullText: %@", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", v28];

              objc_msgSend(NSString, "stringWithFormat:", @"%s alternativeSelectionCount: %ld", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo alternativeSelectionCount](v9, "alternativeSelectionCount"));
              objc_msgSend(NSString, "stringWithFormat:", @"%s characterModificationCount: %ld", "+[UIDictationController logCorrectionStatisticsForDelegate:reason:]", -[UIDictationConnectionCorrectionInfo characterModificationCount](v9, "characterModificationCount"));

              long long v29 = [v8 objectForKey:@"correctionIdentifier"];
              long long v30 = [v8 objectForKey:@"dictationUIInteractionIdentifier"];
              long long v31 = [v8 objectForKey:@"speechRecognitionSource"];
              int v32 = [v31 isEqualToString:@"local"];

              BOOL v33 = [(UIDictationConnectionCorrectionInfo *)v9 alternativeSelectionCount]
                 || [(UIDictationConnectionCorrectionInfo *)v9 characterModificationCount]
                 || [(UIDictationConnectionCorrectionInfo *)v9 characterInsertionCount]
                 || [(UIDictationConnectionCorrectionInfo *)v9 characterDeletionCount]
                 || [(UIDictationConnectionCorrectionInfo *)v9 characterSubstitutionCount] != 0;
              int v34 = !v33;
              if (!v29) {
                int v34 = 1;
              }
              if (((v34 | v32) & 1) == 0) {
                [v64 sendSpeechCorrection:v9 forIdentifier:v29];
              }
              if ((v32 & v33) == 1)
              {
                id v35 = [getAFPreferencesClass_0() sharedPreferences];
                BOOL v36 = [v35 siriDataSharingOptInStatus] == 1;

                if (v36)
                {
                  id v37 = [v8 objectForKey:@"userEditedTextInfo"];
                  [(UIDictationConnectionCorrectionInfo *)v9 setUserEditedTextInfo:v37];

                  id v38 = [v8 objectForKey:@"alternativesSelected"];
                  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  v80[0] = MEMORY[0x1E4F143A8];
                  v80[1] = 3221225472;
                  v80[2] = __67__UIDictationController_logCorrectionStatisticsForDelegate_reason___block_invoke;
                  v80[3] = &unk_1E52FA8E8;
                  id v40 = v39;
                  id v81 = v40;
                  [v38 enumerateObjectsUsingBlock:v80];
                  if ([v40 count])
                  {
                    uint64_t v91 = 0;
                    v92 = &v91;
                    uint64_t v93 = 0x2050000000;
                    v41 = (void *)qword_1EB25AAA0;
                    uint64_t v94 = qword_1EB25AAA0;
                    if (!qword_1EB25AAA0)
                    {
                      uint64_t v86 = MEMORY[0x1E4F143A8];
                      uint64_t v87 = 3221225472;
                      v88 = __getSISchemaUEIDictationAlternativeTextPairsSelectedClass_block_invoke;
                      v89 = &unk_1E52D9900;
                      v90 = &v91;
                      __getSISchemaUEIDictationAlternativeTextPairsSelectedClass_block_invoke((uint64_t)&v86);
                      v41 = (void *)v92[3];
                    }
                    v42 = v41;
                    _Block_object_dispose(&v91, 8);
                    id v43 = objc_alloc_init(v42);
                    [v43 setAlternativeSelections:v40];
                    [v12 emitInstrumentation:v43];
                  }
                  [v64 sendSpeechCorrection:v9 interactionIdentifier:v30];
                }
              }
              if (v12) {
                BOOL v44 = v33;
              }
              else {
                BOOL v44 = 0;
              }
              if (v44) {
                [v63 addObject:v12];
              }
            }
            ++v6;
          }
          while (v68 != v6);
          uint64_t v45 = [obj countByEnumeratingWithState:&v82 objects:v96 count:16];
          uint64_t v68 = v45;
        }
        while (v45);
      }

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v75 = v63;
      uint64_t v46 = [v75 countByEnumeratingWithState:&v76 objects:v95 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v77 != v47) {
              objc_enumerationMutation(v75);
            }
            uint64_t v49 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            uint64_t v91 = 0;
            v92 = &v91;
            uint64_t v93 = 0x2050000000;
            v50 = (void *)qword_1EB25AAA8;
            uint64_t v94 = qword_1EB25AAA8;
            if (!qword_1EB25AAA8)
            {
              uint64_t v86 = MEMORY[0x1E4F143A8];
              uint64_t v87 = 3221225472;
              v88 = __getSISchemaDictationContentEditedClass_block_invoke;
              v89 = &unk_1E52D9900;
              v90 = &v91;
              __getSISchemaDictationContentEditedClass_block_invoke((uint64_t)&v86);
              v50 = (void *)v92[3];
            }
            uint64_t v51 = v50;
            _Block_object_dispose(&v91, 8);
            id v52 = objc_alloc_init(v51);
            [v52 setExists:1];
            v53 = [getAFPreferencesClass_0() sharedPreferences];
            BOOL v54 = [v53 siriDataSharingOptInStatus] == 1;

            if (v54)
            {
              uint64_t v91 = 0;
              v92 = &v91;
              uint64_t v93 = 0x2050000000;
              v55 = (void *)qword_1EB25AAB0;
              uint64_t v94 = qword_1EB25AAB0;
              if (!qword_1EB25AAB0)
              {
                uint64_t v86 = MEMORY[0x1E4F143A8];
                uint64_t v87 = 3221225472;
                v88 = __getSISchemaUEIDictationContentEditedTier1Class_block_invoke;
                v89 = &unk_1E52D9900;
                v90 = &v91;
                __getSISchemaUEIDictationContentEditedTier1Class_block_invoke((uint64_t)&v86);
                v55 = (void *)v92[3];
              }
              uint64_t v56 = v55;
              _Block_object_dispose(&v91, 8);
              id v57 = objc_alloc_init(v56);
              v58 = [v49 turnIdentifier];
              v59 = [v66 objectForKey:v58];
              [v57 setAutoPunctuationEdits:v59];

              [v49 emitInstrumentation:v57];
            }
            [v49 emitInstrumentation:v52];
          }
          uint64_t v46 = [v75 countByEnumeratingWithState:&v76 objects:v95 count:16];
        }
        while (v46);
      }

      [v61 releaseConnectionAfterStatisticsLogging];
    }

    id v5 = v60;
  }
}

void __67__UIDictationController_logCorrectionStatisticsForDelegate_reason___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"originalText"];
  unint64_t v7 = [v5 objectForKeyedSubscript:@"replacementText"];
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v8 = (void *)getASRSchemaASRConfusionPairTokenClass_softClass;
  uint64_t v17 = getASRSchemaASRConfusionPairTokenClass_softClass;
  if (!getASRSchemaASRConfusionPairTokenClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getASRSchemaASRConfusionPairTokenClass_block_invoke;
    v13[3] = &unk_1E52D9900;
    v13[4] = &v14;
    __getASRSchemaASRConfusionPairTokenClass_block_invoke((uint64_t)v13);
    id v8 = (void *)v15[3];
  }
  uint64_t v9 = v8;
  _Block_object_dispose(&v14, 8);
  id v10 = objc_alloc_init(v9);
  v19[0] = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v10 setRecognizedTokens:v11];

  uint64_t v18 = v7;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v10 setCorrectedTokens:v12];

  [v10 setRecognizedTokensStartIndex:a3];
  [*(id *)(a1 + 32) addObject:v10];
}

+ (unint64_t)reasonType:(id)a3
{
  id v4 = a3;
  id v5 = [v4 invocationSource];
  char v6 = [v5 isEqualToString:@"UIDictationInputModeInvocationSourceMicButtonInSafariAddressBar"];

  if (v6)
  {
    unint64_t v7 = 10;
  }
  else
  {
    id v8 = [v4 invocationSource];
    char v9 = [v8 isEqualToString:@"UIDictationInputModeInvocationSourceMicButtonInFirstResponderSafariAddressBar"];

    if (v9)
    {
      unint64_t v7 = 11;
    }
    else
    {
      id v10 = [v4 invocationSource];
      char v11 = [v10 isEqualToString:@"UIDictationInputModeInvocationSourceUCBBar"];

      if (v11)
      {
        unint64_t v7 = 12;
      }
      else
      {
        id v12 = [v4 invocationSource];
        char v13 = [v12 isEqualToString:@"UIDictationInputModeInvocationSourceMicButtonInMessagesTextField"];

        if (v13)
        {
          unint64_t v7 = 13;
        }
        else
        {
          uint64_t v14 = [v4 invocationSource];
          char v15 = [v14 isEqualToString:@"UIDictationInputModeInvocationSourceLongPressGesture"];

          if (v15)
          {
            unint64_t v7 = 26;
          }
          else
          {
            uint64_t v16 = [v4 invocationSource];
            char v17 = [v16 isEqualToString:@"UIDictationInputModeInvocationSourceMicButtonMicButtonInFirstResponderSearchBar"];

            if (v17)
            {
              unint64_t v7 = 9;
            }
            else
            {
              uint64_t v18 = [v4 invocationSource];
              char v19 = [v18 isEqualToString:@"UIDictationInputModeInvocationSourceMicButtonInKeyboard"];

              if (v19)
              {
                unint64_t v7 = 1;
              }
              else
              {
                uint64_t v20 = [v4 invocationSource];
                char v21 = [v20 isEqualToString:@"UIDictationInputModeInvocationSourceGenerativeField"];

                if (v21)
                {
                  unint64_t v7 = 30;
                }
                else
                {
                  BOOL v22 = [v4 invocationSource];
                  char v23 = [v22 isEqualToString:@"UIDictationInputModeInvocationSourceDictationPopUpUILanguageSwitcherIcon"];

                  if (v23)
                  {
                    unint64_t v7 = 28;
                  }
                  else
                  {
                    uint64_t v24 = [v4 invocationSource];
                    char v25 = [v24 isEqualToString:@"UIDictationInputModeInvocationSourceGlobalButtonOnDictationPlane"];

                    if (v25)
                    {
                      unint64_t v7 = 16;
                    }
                    else
                    {
                      id v26 = [v4 invocationSource];
                      int v27 = [v26 isEqualToString:@"UIDictationInputModeInvocationSourceMicButtonOnKeyboardWithInputSwitcher"];

                      if (v27) {
                        unint64_t v7 = [a1 specificReasonTypeMicButtonOnKeyboardWithInputSwitcher];
                      }
                      else {
                        unint64_t v7 = 18;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v7;
}

+ (id)UIDictationStartStopReasonTypeDescription:(unint64_t)a3
{
  if (a3 - 1 > 0x1E) {
    return @"Unknown";
  }
  else {
    return off_1E52FB250[a3 - 1];
  }
}

+ (id)UIDictationLanguageSourceType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E52FB348[a3 - 1];
  }
}

- (void)setDictationInputMode:(id)a3
{
  id v12 = a3;
  id v4 = +[UIKeyboardInputMode dictationInputMode];
  char v5 = [v12 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(UIDictationController *)self setCurrentInputModeForDictation:v12];
    [v12 setLastUsedDictationLanguage];
    char v6 = +[UIKeyboardInputModeController sharedInputModeController];
    unint64_t v7 = [v6 currentInputMode];
    [(UIDictationController *)self setKeyboardInputModeToReturn:v7];

    if (!+[UIDictationUtilities _isUsingLargeFormatDictationUI](UIDictationUtilities, "_isUsingLargeFormatDictationUI")|| (+[UIKeyboard activeKeyboard](UIKeyboard, "activeKeyboard"), id v8 = objc_claimAutoreleasedReturnValue(), [v8 _window], v9 = objc_claimAutoreleasedReturnValue(), v9, v8, v9))
    {
      id v10 = +[UIKeyboardImpl activeInstance];
      char v11 = +[UIKeyboardInputMode dictationInputMode];
      [v10 setKeyboardInputMode:v11 userInitiated:0];
    }
  }
}

- (void)handleDictationShouldPause:(BOOL)a3 withNewDelagate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning])
  {
    if (v5)
    {
      [(UIDictationController *)self setSkipAutomaticResumeDictation:1];
      unint64_t v7 = _UIDictationControllerLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        char v11 = "-[UIDictationController handleDictationShouldPause:withNewDelagate:]";
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s Set skipAutomaticResumeDictation to YES", buf, 0xCu);
      }

      id v8 = +[UIKeyboardImpl activeInstance];
      [v8 pauseDictationForResponderChange];
    }
    else if ([(UIDictationController *)self isDictationPaused] && v4)
    {
      if (!+[UIKeyboard isKeyboardProcess])
      {
        id v9 = +[UIKeyboardImpl activeInstance];
        [v9 resumeDictationForResponderChange];
      }
    }
    else
    {
      [(UIDictationController *)self setReasonType:20];
      [(UIDictationController *)self cancelDictation];
    }
  }
}

+ (void)keyboardWillChangeFromDelegate:(id)a3 toDelegate:(id)a4 shouldPause:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v7 != v8)
  {
    if (v7)
    {
      +[UIDictationController logCorrectionStatisticsForDelegate:v7 reason:20];
      if (!+[UIDictationUtilities _isUsingLargeFormatDictationUI])
      {
        id v9 = +[UIDictationController activeInstance];
        [v9 _endOfflineMetricsSession];
      }
    }
    if (v8)
    {
      if (!+[UIDictationUtilities _isUsingLargeFormatDictationUI])
      {
        id v10 = +[UIDictationController activeInstance];
        [v10 _beginOfflineMetricsSession];
      }
      if (+[UIKeyboard usesInputSystemUI])
      {
        char v11 = +[UIDictationController activeInstance];
        [v11 prepareStartDictationKeyboardGesturesForDelegate:v8];
LABEL_12:

        uint64_t v12 = +[UIKeyboardImpl activeInstance];
        objc_msgSend(v12, "forwardDictationEvent_handleDictationShouldPause:withNewDelagate:", v5, v8 != 0);

        goto LABEL_19;
      }
    }
    else if (+[UIKeyboard usesInputSystemUI])
    {
      char v11 = +[UIDictationController activeInstance];
      [v11 removeStartDictationKeyboardGestures];
      goto LABEL_12;
    }
    if (!+[UIKeyboard isKeyboardProcess])
    {
      char v13 = +[UIDictationController activeInstance];
      [v13 handleDictationShouldPause:v5 withNewDelagate:v8 != 0];
    }
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    char v19 = __79__UIDictationController_keyboardWillChangeFromDelegate_toDelegate_shouldPause___block_invoke;
    uint64_t v20 = &unk_1E52D9F98;
    id v21 = v8;
    id v22 = v7;
    uint64_t v14 = (void (**)(void))_Block_copy(&v17);
    char v15 = +[UIDictationController activeInstance];

    if (v15)
    {
      v14[2](v14);
    }
    else
    {
      uint64_t v16 = +[UIPeripheralHost sharedInstance];
      [v16 queueDelayedTask:v14];
    }
  }
LABEL_19:
}

void __79__UIDictationController_keyboardWillChangeFromDelegate_toDelegate_shouldPause___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    || (+[UIDictationController activeConnection],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v5))
  {
    if (!*(void *)(a1 + 40)
      && +[UIDictationController fetchCurrentInputModeSupportsDictation](UIDictationController, "fetchCurrentInputModeSupportsDictation")&& ((objc_opt_respondsToSelector() & 1) == 0 || ([*(id *)(a1 + 32) _isPasscodeStyle] & 1) == 0))
    {
      int v2 = +[UIDictationController activeInstance];
      id v3 = [v2 dictationConnection];
      [v3 beginAvailabilityMonitoring];

      BOOL v4 = +[UIDictationController activeInstance];
      [v4 setWantsAvailabilityMonitoringWhenAppActive:1];
LABEL_13:
    }
  }
  else
  {
    char v6 = +[UIDictationController activeInstance];
    id v7 = [v6 dictationConnection];
    [v7 cancelAvailabilityMonitoring];

    id v8 = +[UIDictationController activeInstance];
    [v8 setWantsAvailabilityMonitoringWhenAppActive:0];

    char v9 = 0;
    if (+[UIKeyboard isModelessActive])
    {
      id v10 = +[UIDictationController sharedInstance];
      char v9 = [v10 isDictationPaused];
    }
    if (+[UIDictationController viewMode] && (v9 & 1) == 0)
    {
      BOOL v4 = +[UIDictationController sharedInstance];
      [v4 releaseConnection];
      goto LABEL_13;
    }
  }
  if (!+[UIKeyboard isInputSystemUI])
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = +[UIDictationController activeInstance];
    if (v11) {
      [v12 prepareStartDictationKeyboardGesturesForDelegate:*(void *)(a1 + 32)];
    }
    else {
      [v12 removeStartDictationKeyboardGestures];
    }
  }
}

+ (void)keyboardDidUpdateOnScreenStatus
{
  int v2 = +[UIDictationController sharedInstance];
  if (![v2 _resolvedIsDictationPossible])
  {

    goto LABEL_9;
  }
  BOOL v3 = +[UIKeyboard isOnScreen];

  if (!v3)
  {
LABEL_9:
    id v8 = +[UIDictationController activeInstance];
    [v8 stopHelperMessageDisplayIfNeeded];

    id v9 = +[UIDictationController activeInstance];
    [v9 _endOfflineMetricsSession];
    goto LABEL_10;
  }
  BOOL v4 = +[UIDictationController activeInstance];
  [v4 updateHelperMessageDisplayIfNeeded];

  BOOL v5 = +[UIKeyboardImpl activeInstance];
  id v9 = [v5 textInputTraits];

  char v6 = v9;
  if (!v9) {
    goto LABEL_11;
  }
  if (UIKeyboardTypeSupportsDictationSpelling([v9 dictationKeyboardType])
    || ([v9 isSecureTextEntry] & 1) != 0
    || [v9 forceSpellingDictation])
  {
    id v7 = +[UIDictationController sharedInstance];
    [v7 _beginOfflineMetricsSession];
  }
LABEL_10:
  char v6 = v9;
LABEL_11:
}

+ (BOOL)isTextViewOnStarkScreen:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "__isKindOfUIResponder"))
  {
    BOOL v4 = [v3 _responderWindow];
    BOOL v5 = [v4 screen];
    BOOL v6 = [v5 _userInterfaceIdiom] == 3;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldHideSelectionUIForTextView:(id)a3
{
  return ([a1 isTextViewOnStarkScreen:a3] & 1) != 0
      || +[UIDictationController viewMode] == 6;
}

+ (BOOL)shouldHideCursorForTextView:(id)a3
{
  id v4 = a3;
  if ([a1 isTextViewOnStarkScreen:v4]
    && objc_msgSend(v4, "__isKindOfUIResponder"))
  {
    BOOL v5 = [v4 _responderWindow];
    BOOL v6 = [v5 screen];

    id v7 = [v6 _capabilityForKey:@"UIScreenCapabilityTouchLevelsKey"];
    BOOL v8 = [v7 integerValue] == 2;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)takesPressesBegan:(id)a3 forTextView:(id)a4
{
  id v6 = a3;
  if ([a1 isTextViewOnStarkScreen:a4])
  {
    if (_UIPressesContainsPressType(v6, 4)) {
      char v7 = 1;
    }
    else {
      char v7 = _UIPressesContainsPressType(v6, 7);
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)takesPressesChanged:(id)a3 forTextView:(id)a4
{
  return 0;
}

+ (BOOL)takesPressesEnded:(id)a3 forTextView:(id)a4
{
  return 0;
}

- (BOOL)_shouldDeleteBackward
{
  if ([(UIDictationController *)self performingStreamingEditingOperation]
    || !+[UIDictationController isRunning]
    || +[UIDictationController isRunningInTypeAndTalkMode])
  {
    return 1;
  }
  [(UIDictationController *)self setDiscardNextHypothesis:1];
  return 0;
}

+ (BOOL)shouldDeleteBackward
{
  int v2 = +[UIDictationController activeInstance];

  if (!v2) {
    return 1;
  }
  id v3 = +[UIDictationController activeInstance];
  char v4 = [v3 _shouldDeleteBackward];

  return v4;
}

- (BOOL)_shouldInsertText:(id)a3
{
  if (![(UIDictationController *)self performingStreamingEditingOperation]
    && +[UIDictationController isRunning])
  {
    id v3 = +[UIKeyboardInputMode dictationInputMode];
    [v3 usingTypeAndTalk];
  }
  return 1;
}

+ (BOOL)shouldInsertText:(id)a3
{
  id v3 = a3;
  char v4 = +[UIDictationController activeInstance];

  if (v4)
  {
    BOOL v5 = +[UIDictationController activeInstance];
    char v6 = [v5 _shouldInsertText:v3];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

+ (id)serializedDictationPhrases:(id)a3
{
  id v3 = +[UIDictationUtilities dictationPhrasesFromPhraseArray:a3];
  char v4 = [v3 textArray];

  return v4;
}

+ (id)bestInterpretationForDictationResult:(id)a3
{
  id v3 = a3;
  char v4 = [[UIDictationSerializableResults alloc] initWithArrayOfArrayOfStrings:v3];

  BOOL v5 = [(UIDictationSerializableResults *)v4 bestText];

  return v5;
}

+ (void)keyboardDidShow
{
  if (byte_1EB25A972 == 1)
  {
    int v2 = +[UIKeyboardImpl activeInstance];
    id v3 = [v2 delegate];

    if (v3)
    {
      byte_1EB25A972 = 0;
      id v4 = +[UIDictationController activeInstance];
      [v4 switchToDictationInputMode];
    }
  }
}

+ (void)onWillResignActive
{
  int v2 = (void *)qword_1EB25A988;
  qword_1EB25A988 = 0;

  id v3 = (void *)qword_1EB25A990;
  qword_1EB25A990 = 0;

  if (+[UIDictationController isRunning])
  {
    id v4 = +[UIDictationController sharedInstance];
    [v4 setReasonType:24];

    BOOL v5 = +[UIDictationController sharedInstance];
    [v5 cancelDictation];

    if (+[UIKeyboard usesInputSystemUI])
    {
      char v6 = +[UIDictationController sharedInstance];
      [v6 setShadowState:0];
    }
    else
    {
      char v6 = +[UIKeyboardImpl activeInstance];
      [v6 clearDictationMenuTimer];
    }
  }
  char v7 = +[UIKeyboardImpl activeInstance];
  [v7 dismissDictationTip];

  BOOL v8 = +[UIDictationView activeInstance];
  [v8 applicationWillResignActive];

  id v9 = +[UIDictationController sharedInstance];
  [v9 releaseConnection];

  _MergedGlobals_33_1[0] = 0;
  id v10 = +[UIDictationController sharedInstance];
  [v10 setPauseUpdatingHelperMessage:1];
}

+ (void)inputSystemSessionWillEndForReason:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 1) > 1)
  {
    id v4 = _UIDictationControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      char v6 = "+[UIDictationController inputSystemSessionWillEndForReason:]";
      __int16 v7 = 2048;
      int64_t v8 = a3;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Unhandled UIDictationInputSystemSessionWillEndReason. Reason=%ld", (uint8_t *)&v5, 0x16u);
    }
  }
  else
  {
    [a1 onWillResignActive];
  }
}

+ (void)applicationDidEnterBackgroundNotification
{
  v11[1] = *MEMORY[0x1E4F143B8];
  int v2 = +[UIDictationController sharedInstance];
  [v2 _endEnableDictationPromptAnimated:0];

  id v3 = +[UIDictationController sharedInstance];
  int v4 = [v3 logAppEnterBackground];

  if (v4)
  {
    int v5 = [getAFAnalyticsClass() sharedAnalytics];
    id v10 = @"isSuspendedUnderLock";
    int v6 = [(id)UIApp isSuspendedUnderLock];
    uint64_t v7 = MEMORY[0x1E4F1CC28];
    if (v6) {
      uint64_t v7 = MEMORY[0x1E4F1CC38];
    }
    v11[0] = v7;
    int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v5 logEventWithType:2218 context:v8];

    uint64_t v9 = +[UIDictationController sharedInstance];
    [v9 setLogAppEnterBackground:0];
  }
}

+ (void)siriPreferencesChanged
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)qword_1EB25A988;
  qword_1EB25A988 = 0;

  int v4 = (void *)qword_1EB25A990;
  qword_1EB25A990 = 0;

  [a1 keyboardDidUpdateOnScreenStatus];
  int v5 = +[UIDictationController sharedInstance];
  uint64_t v7 = @"reason";
  v8[0] = @"Dictation controller siri preferences changed";
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v6];
}

+ (void)remoteMicrophoneCapabilityChanged
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [a1 keyboardDidUpdateOnScreenStatus];
  int v2 = +[UIDictationController sharedInstance];
  int v4 = @"reason";
  v5[0] = @"Dictation controller remote microphone capability changed";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  [v2 postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v3];
}

+ (id)serializedInterpretationFromTokens:(id)a3 transform:(__CFString *)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  int v6 = [MEMORY[0x1E4F28E78] string];
  if (v5)
  {
    uint64_t v7 = 0;
    char v8 = 0;
    while (1)
    {
      uint64_t v9 = [v4 objectAtIndex:v7];
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0
        || (objc_opt_respondsToSelector() & 1) == 0)
      {
        break;
      }
      if ((v8 & 1) != 0 && ([v9 removeSpaceBefore] & 1) == 0) {
        [v6 appendString:@" "];
      }
      id v10 = [v9 text];
      [v6 appendString:v10];
      char v8 = [v9 removeSpaceAfter] ^ 1;

      if (v5 == ++v7) {
        goto LABEL_10;
      }
    }

    uint64_t v11 = 0;
  }
  else
  {
LABEL_10:
    uint64_t v11 = [v6 _stringByApplyingTransform:a4];
  }

  return v11;
}

+ (id)interpretation:(id)a3 forPhraseIndex:(unint64_t)a4 isShiftLocked:(BOOL)a5 autocapitalizationType:(int64_t)a6 useServerCapitalization:(BOOL)a7
{
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = v11;
  if (a6 == 3 || v9)
  {
    uint64_t v13 = [v11 uppercaseString];
    goto LABEL_6;
  }
  if (a6 == 1)
  {
    uint64_t v13 = [v11 capitalizedString];
LABEL_6:
    uint64_t v14 = (void *)v13;

    id v12 = v14;
  }
  if (!a4 && [v12 length])
  {
    char v15 = +[UIDictationUtilities _properNameForString:v12];
    if (!qword_1EB25A998)
    {
      id v16 = [[UITextChecker alloc] _initWithAsynchronousLoading:1];
      uint64_t v17 = (void *)qword_1EB25A998;
      qword_1EB25A998 = (uint64_t)v16;
    }
    uint64_t v18 = +[UIDictationController sharedInstance];
    char v19 = [v18 language];

    if (!v15 || a7)
    {
      if (byte_1EB25A971)
      {
        unsigned int v21 = [v12 characterAtIndex:0];
        if (v21 > 0x7F) {
          int v22 = __maskrune(v21, 0x1000uLL);
        }
        else {
          int v22 = *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v21 + 60) & 0x1000;
        }
        if (!v22
          || ![(id)qword_1EB25A998 canChangeCaseOfFirstLetterInString:v12 toUpperCase:0 language:v19])
        {
          goto LABEL_30;
        }
        char v25 = [v12 substringToIndex:1];
        uint64_t v26 = [v25 uppercaseString];
      }
      else
      {
        if (a7) {
          goto LABEL_30;
        }
        unsigned int v23 = [v12 characterAtIndex:0];
        int v24 = v23 > 0x7F ? __maskrune(v23, 0x8000uLL) : *(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v23 + 60) & 0x8000;
        if (!v24
          || ![(id)qword_1EB25A998 canChangeCaseOfFirstLetterInString:v12 toUpperCase:0 language:v19])
        {
          goto LABEL_30;
        }
        char v25 = [v12 substringToIndex:1];
        uint64_t v26 = [v25 lowercaseString];
      }
      int v27 = (void *)v26;
      uint64_t v28 = [v12 substringFromIndex:1];
      id v20 = [v27 stringByAppendingString:v28];

      id v12 = v25;
    }
    else
    {
      id v20 = v15;
    }

    id v12 = v20;
LABEL_30:
  }
  return v12;
}

+ (void)performOperations:(id)a3 keyboardShifted:(BOOL)a4
{
  char v4 = byte_1EB25A971;
  byte_1EB25A971 = a4;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  byte_1EB25A971 = v4;
}

+ (void)updateLandingView
{
  int v2 = +[UIDictationLandingView activeInstance];
  id v3 = [v2 superview];

  if (v3)
  {
    id v4 = +[UIDictationLandingView activeInstance];
    [v4 updatePosition];
  }
}

- (BOOL)remoteHasMicrophone
{
  int v2 = +[UIDevice currentDevice];
  char v3 = [v2 _remoteHasMicrophoneCapability];

  return v3;
}

+ (BOOL)remoteCanDictateCurrentInputMode
{
  int v2 = +[UIDictationController sharedInstance];
  uint64_t v3 = [v2 currentInputModeForDictation];
  uint64_t v6 = 0;
  int v4 = [v2 supportsInputMode:v3 error:&v6];

  LODWORD(v3) = [v2 dictationEnabled];
  LODWORD(v3) = [v2 remoteHasMicrophone] & v3 & v4;

  return v3;
}

- (id)languageCodeForAssistantLanguageCode:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"intl"] & 1) != 0
    || ([v3 isEqualToString:@"default"] & 1) != 0)
  {
    int v4 = @"en_US";
    goto LABEL_14;
  }
  uint64_t v5 = [v3 componentsSeparatedByString:@"-"];
  if ([v5 count] != 1)
  {
    uint64_t v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v5 objectAtIndex:1];
    if ([v6 isEqualToString:@"ko"]
      && [(__CFString *)v7 isEqualToString:@"KR"])
    {

      uint64_t v7 = @"KO";
    }
    else if (!v7)
    {
      int v4 = v6;
      goto LABEL_12;
    }
    int v4 = [NSString stringWithFormat:@"%@_%@", v6, v7];

LABEL_12:
    goto LABEL_13;
  }
  int v4 = (__CFString *)v3;
LABEL_13:

LABEL_14:
  return v4;
}

- (UIKeyboardInputMode)currentInputModeForDictation
{
  id v3 = +[UIKeyboardInputModeController sharedInputModeController];
  int v4 = [v3 currentInputMode];

  if (!v4)
  {
    uint64_t v5 = +[UIKeyboardInputModeController sharedInputModeController];
    id v6 = (id)[v5 enabledInputModeIdentifiers];
  }
  currentInputModeForDictation = self->_currentInputModeForDictation;
  if (currentInputModeForDictation)
  {
    char v8 = currentInputModeForDictation;
  }
  else
  {
    BOOL v9 = +[UIKeyboardInputModeController sharedInputModeController];
    char v8 = [v9 currentInputMode];
  }
  id v10 = +[UIKeyboardInputMode dictationInputMode];
  BOOL v11 = [(UIKeyboardInputMode *)v8 isEqual:v10];

  if (v11)
  {
    id v12 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v13 = [v12 currentInputModeInPreference];

    char v8 = (UIKeyboardInputMode *)v13;
  }
  return v8;
}

- (float)audioLevel
{
  int v2 = [(UIDictationController *)self dictationConnection];
  [v2 averagePower];
  float v4 = v3;

  return v4;
}

- (BOOL)shouldUseDictationSearchFieldBehavior
{
  float v3 = +[UIKeyboardImpl sharedInstance];
  float v4 = [v3 inputDelegate];

  if (+[UIKeyboard isKeyboardProcess])
  {
    char v5 = [(UIDictationController *)self _shouldUseDictationSearchFieldBehavior];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }
    char v5 = [v4 showDictationButton];
  }
  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (BOOL)shouldOverrideManualEndpointingWithReturnKeyType:(int64_t)a3
{
  BOOL v4 = [(UIDictationController *)self currentViewModeSupportsDictationMics];
  if (v4)
  {
    LOBYTE(v4) = [(UIDictationController *)self shouldUseDictationSearchFieldBehavior];
  }
  return v4;
}

- (NSNumber)dictationRequestOrigin
{
  uint64_t v2 = [(UIDictationController *)self shouldUseDictationSearchFieldBehavior];
  float v3 = NSNumber;
  return (NSNumber *)[v3 numberWithInteger:v2];
}

- (id)fieldIdentifierInputDelegate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 textInputView];
  if (v4)
  {
    char v5 = (void *)v4;
    BOOL v6 = &stru_1ED0E84C0;
    while (1)
    {
      uint64_t v7 = [NSString stringWithFormat:@"%@", objc_opt_class()];
      char v8 = [(__CFString *)v6 stringByAppendingString:v7];

      BOOL v9 = [v5 superview];
      if (!v9) {
        break;
      }
      id v10 = v9;
      BOOL v11 = NSString;
      id v12 = [v9 subviews];
      uint64_t v13 = [v11 stringWithFormat:@"%ld, ", objc_msgSend(v12, "indexOfObject:", v5)];
      BOOL v6 = [(__CFString *)v8 stringByAppendingString:v13];

      char v5 = v10;
    }
  }
  else
  {
    char v8 = &stru_1ED0E84C0;
  }

  return v8;
}

- (id)prefixTextForInputDelegate:(id)a3 wordCount:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 selectedTextRange];
  uint64_t v7 = [v6 start];

  if (v7)
  {
    id v8 = v7;
    id v9 = v8;
    id v10 = v8;
    if (a4)
    {
      BOOL v11 = v8;
      while (1)
      {
        id v12 = [v5 tokenizer];
        id v10 = [v12 positionFromPosition:v11 toBoundary:1 inDirection:1];

        if (!v10) {
          break;
        }
        uint64_t v13 = [v5 tokenizer];
        char v14 = [v13 isPosition:v10 withinTextUnit:1 inDirection:0];

        if ((v14 & 1) == 0)
        {
          char v15 = [v5 tokenizer];
          uint64_t v16 = [v15 positionFromPosition:v10 toBoundary:1 inDirection:1];

          id v10 = (void *)v16;
          if (!v16) {
            break;
          }
        }

        BOOL v11 = v10;
        if (!--a4) {
          goto LABEL_11;
        }
      }
      id v10 = v11;
    }
LABEL_11:
    uint64_t v18 = [v5 textRangeFromPosition:v10 toPosition:v9];
    uint64_t v17 = [v5 textInRange:v18];
  }
  else
  {
    uint64_t v17 = &stru_1ED0E84C0;
  }

  return v17;
}

- (id)postfixTextForInputDelegate:(id)a3 wordCount:(unint64_t)a4
{
  id v5 = a3;
  BOOL v6 = [v5 selectedTextRange];
  uint64_t v7 = [v6 end];

  if (v7)
  {
    id v8 = v7;
    id v9 = v8;
    id v10 = v8;
    if (a4)
    {
      BOOL v11 = v8;
      while (1)
      {
        id v12 = [v5 tokenizer];
        id v10 = [v12 positionFromPosition:v11 toBoundary:1 inDirection:0];

        if (!v10) {
          break;
        }
        uint64_t v13 = [v5 tokenizer];
        char v14 = [v13 isPosition:v10 withinTextUnit:1 inDirection:1];

        if ((v14 & 1) == 0)
        {
          char v15 = [v5 tokenizer];
          uint64_t v16 = [v15 positionFromPosition:v10 toBoundary:1 inDirection:0];

          id v10 = (void *)v16;
          if (!v16) {
            break;
          }
        }

        BOOL v11 = v10;
        if (!--a4) {
          goto LABEL_11;
        }
      }
      id v10 = v11;
    }
LABEL_11:
    uint64_t v18 = [v5 textRangeFromPosition:v9 toPosition:v10];
    uint64_t v17 = [v5 textInRange:v18];
  }
  else
  {
    uint64_t v17 = &stru_1ED0E84C0;
  }

  return v17;
}

- (id)selectedTextForInputDelegate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 selectedTextRange];
  id v5 = [v4 start];
  uint64_t v6 = [v4 end];
  uint64_t v7 = (void *)v6;
  id v8 = &stru_1ED0E84C0;
  if (v5
    && v6
    && [v3 comparePosition:v5 toPosition:v6]
    && [v3 comparePosition:v5 toPosition:v7] == -1)
  {
    id v8 = [v3 textInRange:v4];
  }

  return v8;
}

- (BOOL)useAutomaticEndpointing
{
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  id v3 = [v2 textInputTraits];

  if ([v3 acceptsDictationSearchResults]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 useAutomaticEndpointing];
  }

  return v4;
}

- (id)_finalDictationStartLanguageCodeWithKeyboardInputMode:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dictationLanguage];
  if (!v5)
  {
    if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
    {
      id v5 = [v4 languageWithRegion];
    }
    else
    {
      id v5 = 0;
    }
  }
  uint64_t v6 = TIInputModeGetLanguage();
  TIInputModeGetRegion();
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(id)objc_opt_class() viewMode])
  {
    uint64_t v8 = [(UIDictationConnectionPreferences *)self->_preferences languageCode];

    uint64_t v7 = 0;
    uint64_t v6 = (void *)v8;
  }
  if ([(UIDictationController *)self smartLanguageSelectionOverridden])
  {
    uint64_t v9 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
  }
  else
  {
    if (!v6)
    {
      id v10 = [MEMORY[0x1E4F1CA20] preferredLocale];
      uint64_t v6 = [v10 languageCode];
    }
    if ([v6 isEqualToString:@"ko"]
      && [(__CFString *)v7 isEqualToString:@"KO"])
    {

      uint64_t v7 = @"KR";
    }
    else if (!v7)
    {
      goto LABEL_17;
    }
    uint64_t v9 = [NSString stringWithFormat:@"%@-%@", v6, v7];
  }
  BOOL v11 = (void *)v9;

  uint64_t v6 = v11;
LABEL_17:

  return v6;
}

- (void)dictationConnection:(id)a3 updateOptions:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = +[UIKeyboardImpl sharedInstance];
  uint64_t v7 = [v6 inputDelegate];
  uint64_t v8 = [v6 textInputTraits];
  if ([v5 version])
  {
    [v5 setVersion:1];
    uint64_t v9 = [(UIDictationController *)self currentInputModeForDictation];
    id v10 = [v9 dictationLanguage];
    if (!v10)
    {
      if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
      {
        id v10 = [v9 languageWithRegion];
      }
      else
      {
        id v10 = 0;
      }
    }
    int v27 = v7;
    BOOL v11 = TIInputModeGetLanguage();
    id v12 = TIInputModeGetRegion();
    objc_msgSend(v5, "setUseAutomaticEndpointing:", -[UIDictationController useAutomaticEndpointing](self, "useAutomaticEndpointing"));
    uint64_t v13 = [v9 identifier];
    char v14 = TIInputModeGetVariant();
    [v5 setLayoutIdentifier:v14];

    objc_msgSend(v5, "setReturnKeyType:", objc_msgSend(v8, "returnKeyType"));
    if ([(id)objc_opt_class() viewMode])
    {
      if ([(id)objc_opt_class() viewMode] == 6) {
        [v5 setActivationType:2];
      }
    }
    else
    {
      uint64_t v15 = [(UIDictationConnectionPreferences *)self->_preferences languageCode];

      [v5 setActivationType:1];
      [v5 setUseAutomaticEndpointing:1];
      [v5 setReturnKeyType:6];
      id v12 = 0;
      BOOL v11 = (void *)v15;
    }
    uint64_t v16 = [(UIDictationController *)self activationIdentifier];
    [v5 setActivationIdentifier:v16];

    [v5 setLanguageCode:v11];
    [v5 setRegionCode:v12];
    uint64_t v17 = [(UIDictationController *)self fieldIdentifierInputDelegate:v27];
    [v5 setFieldIdentifier:v17];

    objc_msgSend(v5, "setKeyboardType:", objc_msgSend(v8, "dictationKeyboardType"));
    BOOL v18 = +[UIDictationUtilities _isUsingLargeFormatDictationUI];
    if (v18)
    {
      if (UIKeyboardTypeSupportsDictationSpelling([v5 keyboardType])
        || ([v8 isSecureTextEntry] & 1) != 0)
      {
        uint64_t v19 = 1;
      }
      else
      {
        uint64_t v19 = [v8 forceSpellingDictation];
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
    [v5 setSecureInput:v19];
    objc_msgSend(v5, "setAcceptsDictationSearchResults:", objc_msgSend(v8, "acceptsDictationSearchResults"));
    [v5 setPrefixText:self->_prefixTextForStart];
    [v5 setSelectedText:self->_selectionTextForStart];
    [v5 setPostfixText:self->_postfixTextForStart];
    if (-[UIDictationController shouldOverrideManualEndpointingWithReturnKeyType:](self, "shouldOverrideManualEndpointingWithReturnKeyType:", [v5 returnKeyType]))
    {
      [v5 setUseAutomaticEndpointing:1];
    }
    if ([v5 useAutomaticEndpointing])
    {
      id v20 = _UIDictationControllerLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        long long v29 = "-[UIDictationController dictationConnection:updateOptions:]";
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "%s Starting dictation with automatic endpointing", buf, 0xCu);
      }

      [v5 setReturnKeyType:6];
    }
    unsigned int v21 = [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext turnIdentifier];
    [v5 setTurnIdentifier:v21];

    if (((v18 | _os_feature_enabled_impl() ^ 1) & 1) == 0)
    {
      int v22 = [getAFPreferencesClass_0() sharedPreferences];
      objc_msgSend(v5, "setAutoPunctuation:", objc_msgSend(v22, "dictationAutoPunctuationEnabled"));
    }
    if ([v11 isEqualToString:@"en"]
      && [v12 isEqualToString:@"US"]
      && [(id)objc_opt_class() supportsSiriDictationVoiceCommands]
      && ([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign] & 1) != 0)
    {
      unsigned int v23 = +[UIKeyboard keyboardBundleIdentifier];
      objc_msgSend(v5, "setShouldRecognizeCommands:", +[UIDictationUtilities supportsDictationVoiceEditingUIForBundleIdentifier:](UIDictationUtilities, "supportsDictationVoiceEditingUIForBundleIdentifier:", v23));
    }
    else
    {
      [v5 setShouldRecognizeCommands:0];
    }
    prefixTextForStart = self->_prefixTextForStart;
    self->_prefixTextForStart = 0;

    selectionTextForStart = self->_selectionTextForStart;
    self->_selectionTextForStart = 0;

    postfixTextForStart = self->_postfixTextForStart;
    self->_postfixTextForStart = 0;

    uint64_t v7 = v27;
  }
}

- (void)completeStartConnection
{
  id v3 = [(UIDictationController *)self dictationConnection];
  [v3 start];

  self->_reasonType = 0;
}

- (void)startConnectionWithContinuation:(id)a3
{
  id v4 = a3;
  [(UIDictationController *)self setupForDictationStart];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __57__UIDictationController_startConnectionWithContinuation___block_invoke;
  v6[3] = &unk_1E52DA160;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDictationController *)self _completeStartDictationWithContinuation:v6];
}

uint64_t __57__UIDictationController_startConnectionWithContinuation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) completeStartConnection];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)startDictationForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__UIDictationController_startDictationForFileAtURL_forInputModeIdentifier___block_invoke;
  v10[3] = &unk_1E52DCB30;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(UIDictationController *)self _completeStartDictationWithContinuation:v10];
}

uint64_t __75__UIDictationController_startDictationForFileAtURL_forInputModeIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeStartConnectionForFileAtURL:*(void *)(a1 + 40) forInputModeIdentifier:*(void *)(a1 + 48)];
}

- (void)completeStartConnectionForFileAtURL:(id)a3 forInputModeIdentifier:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  [v6 stringWithFormat:@"%s Starting dictation connection from saved file for language code: %@", "-[UIDictationController completeStartConnectionForFileAtURL:forInputModeIdentifier:]", v7];

  [(UIDictationController *)self setState:1];
  id v9 = [(UIDictationController *)self dictationConnection];
  [v9 startForFileAtURL:v8 forLanguage:v7];
}

- (void)_completeStartDictationWithContinuation:(id)a3
{
  id v4 = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"%s Calling _refreshVisibleRTIDocumentStateWithContinuation", "-[UIDictationController _completeStartDictationWithContinuation:]");

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __65__UIDictationController__completeStartDictationWithContinuation___block_invoke;
  v6[3] = &unk_1E52FA910;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDictationController *)self _refreshVisibleRTIDocumentStateWithContinuation:v6];
}

uint64_t __65__UIDictationController__completeStartDictationWithContinuation___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [a2 copy];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 136);
  *(void *)(v10 + 136) = v9;

  uint64_t v12 = [v8 copy];
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(void **)(v13 + 152);
  *(void *)(v13 + 152) = v12;

  uint64_t v15 = [v7 copy];
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 144);
  *(void *)(v16 + 144) = v15;

  [*(id *)(a1 + 32) setIsProcessingPotentialVoiceCommand:0];
  [NSString stringWithFormat:@"%s Dictation options. prefixText: %@, postfixText: %@, selectedText: %@", "-[UIDictationController _completeStartDictationWithContinuation:]_block_invoke", *(void *)(*(void *)(a1 + 32) + 136), *(void *)(*(void *)(a1 + 32) + 152), *(void *)(*(void *)(a1 + 32) + 144)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v19 = *(uint64_t (**)(void))(result + 16);
    return v19();
  }
  return result;
}

- (void)_setFinalResultHandler:(id)a3
{
  id v4 = _Block_copy(a3);
  id finalResultsOperation = self->_finalResultsOperation;
  self->_id finalResultsOperation = v4;
}

- (void)setIgnoreFinalizePhrases:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  self->_ignoreFinalizePhrases = a3;
  id v4 = _UIDictationControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[UIDictationController setIgnoreFinalizePhrases:]";
    __int16 v7 = 1024;
    BOOL v8 = v3;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Setting ignoreFinalizePhrases flag %d", (uint8_t *)&v5, 0x12u);
  }
}

- (void)_setupHypothesisAsFinalResults
{
  if (+[UIKeyboard isKeyboardProcess]) {
    BOOL ignoreFinalizePhrases = self->_ignoreFinalizePhrases;
  }
  else {
    BOOL ignoreFinalizePhrases = 0;
  }
  uint64_t v4 = [(UIDictationController *)self targetHypothesis];
  int v5 = (void *)v4;
  if (!ignoreFinalizePhrases && !self->_finalResultsOperation && v4)
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __55__UIDictationController__setupHypothesisAsFinalResults__block_invoke;
    v6[3] = &unk_1E52D9960;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    [(UIDictationController *)self _setFinalResultHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __55__UIDictationController__setupHypothesisAsFinalResults__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = [WeakRetained lastHypothesis];
  [WeakRetained updateLastHypothesis:v3 WithNewHypothesis:&stru_1ED0E84C0];

  uint64_t v4 = [UIDictationSerializableResults alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  int v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v7 = [(UIDictationSerializableResults *)v4 initWithArrayOfArrayOfStrings:v6];

  [WeakRetained insertSerializedDictationResult:v7 withCorrectionIdentifier:0];
  [WeakRetained setIgnoreFinalizePhrases:1];
}

- (void)_runFinalizeOperation
{
}

- (void)_runFinalizeOperation:(BOOL)a3
{
  if (self->_finalResultsOperation)
  {
    -[UIDictationController performIgnoringDocumentChanges:](self, "performIgnoringDocumentChanges:");
    id finalResultsOperation = self->_finalResultsOperation;
    self->_id finalResultsOperation = 0;

    if (!a3) {
      [(UIDictationController *)self _stopStreamingAnimation];
    }
    [(UIDictationController *)self setPendingEdits:0];
    [(UIDictationController *)self setLastHypothesis:0];
    [(UIDictationController *)self setTargetHypothesis:0];
  }
}

- (void)endSessionIfNecessaryForTransitionFromState:(int)a3 toState:(int)a4
{
  BOOL v7 = a3 != 6 && a4 == 0;
  if (a4 == 6 || v7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s Calling endSession on the connection", "-[UIDictationController endSessionIfNecessaryForTransitionFromState:toState:]");

    uint64_t v8 = [(UIDictationController *)self dictationConnection];
    [v8 endSession];

    if (a4 == 6)
    {
      id finalResultsOperation = self->_finalResultsOperation;
      self->_id finalResultsOperation = 0;
    }
  }
}

- (void)switchToKeyboardInputModeIfNeeded
{
  id v5 = +[UIDictationView sharedInstance];
  if (([v5 switchingLanguage] & 1) == 0
    && ![(UIDictationController *)self shouldStayInDictationInputMode])
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    if (([v3 isDictationMenuPresented] & 1) == 0)
    {
      BOOL v4 = +[UIKeyboard isModelessActive];

      if (v4) {
        return;
      }
      id v5 = +[UIKeyboardImpl activeInstance];
      BOOL v3 = [(UIDictationController *)self keyboardInputModeToReturn];
      [v5 setKeyboardInputMode:v3 userInitiated:0];
    }
  }
}

+ (BOOL)shouldForwardInInputSystemUI
{
  if (!+[UIKeyboard isKeyboardProcess]) {
    return 0;
  }
  uint64_t v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v3 = [v2 keyboardWindow];

  BOOL v4 = +[UIKeyboardImpl activeInstance];
  id v5 = v4;
  if (v3)
  {
    id v6 = [v4 inputDelegate];
    BOOL v7 = [v6 _window];
    BOOL v8 = v7 != v3;
  }
  else
  {
    BOOL v8 = 1;
  }
  uint64_t v10 = [v5 inputDelegateManager];
  char v11 = [v10 shouldRespectForwardingInputDelegate];

  BOOL v9 = v8 & (v11 ^ 1);
  return v9;
}

- (void)resignFirstResponderWhenIdleIfNeeded
{
  v18[1] = *MEMORY[0x1E4F143B8];
  if ([(UIDictationController *)self shouldSuppressSoftwareKeyboard])
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    char v4 = [v3 isDictationLanguageMenuPresented];

    if ((v4 & 1) == 0)
    {
      id v5 = +[UIDictationLandingView sharedInstance];
      [v5 stopLanding];

      id v6 = +[UIKeyboardImpl sharedInstance];
      BOOL v7 = [v6 textInputTraits];
      uint64_t v8 = [v7 returnKeyType];

      if (v8 == 6)
      {
        BOOL v9 = +[UIKeyboardImpl sharedInstance];
        [v9 performReturn];
      }
      [(UIDictationController *)self setResigningFirstResponder:1];
      if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
      {
        uint64_t v10 = +[UIKeyboardImpl activeInstance];
        char v11 = [v10 inputDelegateManager];
        uint64_t v12 = [v11 inputSystemSourceSession];

        if (!v12)
        {
LABEL_12:

LABEL_13:
          if (+[UIDictationUtilities _isAutomaticKeyboardDownDictationDisabled])
          {
            [(UIDictationController *)self setShouldSuppressSoftwareKeyboard:0];
            uint64_t v16 = +[UIKeyboardImpl activeInstance];
            [v16 setKeyboardMinimizedByDictation:0];
          }
          return;
        }
        uint64_t v13 = [v12 textOperations];
        [v13 setCustomInfoType:0x1ED14BAA0];
        uint64_t v17 = @"selector";
        char v14 = NSStringFromSelector(sel_resignFirstResponderWhenIdleIfNeeded);
        v18[0] = v14;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
        [v13 setCustomInfo:v15];

        [v12 flushOperations];
      }
      else
      {
        if ([(id)objc_opt_class() isInputDelegateSafariAddressBar])
        {
          [(UIDictationController *)self setResigningFirstResponder:0];
          goto LABEL_13;
        }
        uint64_t v12 = +[UIKeyboardImpl sharedInstance];
        uint64_t v13 = [v12 inputDelegate];
        [v13 resignFirstResponder];
      }

      goto LABEL_12;
    }
  }
}

- (void)setShadowState:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v4 = _UIDictationControllerLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a3 > 6) {
      id v5 = @"Unknown state";
    }
    else {
      id v5 = off_1E52FB368[a3];
    }
    int v7 = 136315394;
    uint64_t v8 = "-[UIDictationController setShadowState:]";
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s State \"%@\"", (uint8_t *)&v7, 0x16u);
  }

  dword_1EB25A978 = a3;
  if (a3 == 3 || !a3)
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 clearDictationMenuTimer];
  }
}

- (void)setAppState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard isKeyboardProcess]
    && +[UIKeyboard isMajelEnabled]
    && ![(UIDictationController *)self isIgnoringRTIChanges])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    id v6 = [v5 inputDelegateManager];
    int v7 = [v6 inputSystemSourceSession];

    if (v7)
    {
      uint64_t v8 = _UIDictationControllerLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = [v7 documentTraits];
        uint64_t v10 = [v9 appId];
        int v15 = 136315394;
        uint64_t v16 = "-[UIDictationController setAppState:]";
        __int16 v17 = 2112;
        BOOL v18 = v10;
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s Invoking setShadowState. appID \"%@\"", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v11 = [v7 textOperations];
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v13 = NSStringFromSelector(sel_setShadowState_);
      [v12 setObject:v13 forKeyedSubscript:@"selector"];

      char v14 = [NSNumber numberWithUnsignedInt:v3];
      [v12 setObject:v14 forKeyedSubscript:@"state"];

      [v11 setCustomInfoType:0x1ED14BAA0];
      [v11 setCustomInfo:v12];
      [v7 flushOperations];
    }
  }
}

- (void)setState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v32[1] = *MEMORY[0x1E4F143B8];
  if (a3 != 6 || dword_1EB25A97C)
  {
    if (a3 > 6) {
      id v5 = @"Unknown state";
    }
    else {
      id v5 = off_1E52FB368[a3];
    }
    [NSString stringWithFormat:@"%s State: %@", "-[UIDictationController setState:]", v5];

    uint64_t v6 = dword_1EB25A97C;
    dword_1EB25A97C = v3;
    [(UIDictationController *)self setAppState:v3];
    int v7 = +[UIDictationView sharedInstance];
    [v7 setDisplayDelegate:0];

    uint64_t v8 = +[UIDictationView sharedInstance];
    [v8 setState:v3];

    [(UIDictationController *)self endSessionIfNecessaryForTransitionFromState:v6 toState:v3];
    if (![(UIDictationController *)self isDetectingUtterances])
    {
      __int16 v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      [(UIDictationController *)self setIdleTimerDisabled:v3 != 0 forReason:v10];
    }
    if (v3)
    {
      if (v3 == 6) {
        [(UIDictationController *)self switchToKeyboardInputModeIfNeeded];
      }
    }
    else
    {
      [(UIDictationController *)self _runFinalizeOperation];
      uint64_t v11 = +[UIKeyboardImpl activeInstance];
      [v11 clearDictationMenuTimer];

      long long v31 = @"reason";
      v32[0] = @"Dictation controller did switch state";
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      [(UIDictationController *)self postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v12];

      [(UIDictationController *)self releaseConnectionAfterDictationRequest];
      if ([(UIDictationController *)self isRecievingResults])
      {
        uint64_t v13 = +[UIKeyboardImpl sharedInstance];
        char v14 = [v13 inputDelegate];

        if (objc_opt_respondsToSelector())
        {
          int v15 = [v14 interactionAssistant];
          [v15 configureForSelectionMode];
        }
      }
      if (!self->_streamingAnimationActive)
      {
        [(UIDictationController *)self setTargetHypothesis:0];
        [(UIDictationController *)self setLastHypothesis:0];
        [(UIDictationController *)self setPendingEdits:0];
      }
      uint64_t v16 = +[UIDictationView sharedInstance];
      char v17 = [v16 switchingLanguage];

      if ((v17 & 1) == 0)
      {
        [(UIDictationController *)self resignFirstResponderWhenIdleIfNeeded];
        BOOL v18 = +[UIKeyboardImpl activeInstance];
        [v18 clearDictationMenuTimer];
      }
      [(UIDictationController *)self switchToKeyboardInputModeIfNeeded];
      uint64_t v19 = +[UIKeyboardImpl activeInstance];
      id v20 = [v19 userInteractionDelegate];

      if (v20 && [(UIDictationTipController *)self->_dictationTipController modelessTipShown])
      {
        unsigned int v21 = +[UIKeyboardImpl activeInstance];
        [v21 setUserInteractionDelegate:0];
      }
    }
    if ([(id)objc_opt_class() viewMode] == 6)
    {
      if ((v3 - 3) >= 3)
      {
        if (v3)
        {
          if (v3 != 6)
          {
            p_BOOL ignoreFinalizePhrases = &self->_ignoreFinalizePhrases;
            goto LABEL_33;
          }
          [(UIDictationController *)self _displaySecureContentsAsPlainText:0 afterDelay:2.0];
        }
        [(UIDictationController *)self restoreTextFieldPlaceholder];
      }
      else
      {
        [(UIDictationController *)self clearTextFieldPlaceholder];
      }
    }
    p_BOOL ignoreFinalizePhrases = &self->_ignoreFinalizePhrases;
    if (v3 == 3 && !self->_ignoreFinalizePhrases)
    {
      unsigned int v23 = +[UIKeyboardImpl activeInstance];
      [v23 clearDictationMenuTimer];

      int v24 = +[UIDictationLandingView sharedInstance];
      [v24 startLandingIfNecessary];
      goto LABEL_35;
    }
LABEL_33:
    char v25 = +[UIDictationLandingView sharedInstance];
    int v24 = v25;
    if (v3 != 6)
    {
      [v25 stopLanding];

      if (v3 == 2)
      {
        *p_BOOL ignoreFinalizePhrases = 0;
        uint64_t v26 = +[UIKeyboardImpl activeInstance];
        int v27 = [v26 inputDelegateManager];
        uint64_t v28 = [v27 selectionDisplayInteraction];
        [v28 _setGlowViewMode:1];

LABEL_40:
        return;
      }
      if (v3 <= 2) {
        return;
      }
LABEL_36:
      self->_shouldResumeDictation = 0;
      uint64_t v26 = _UIDictationControllerLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v30 = "-[UIDictationController setState:]";
        _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_DEFAULT, "%s Set _shouldResumeDictation to NO", buf, 0xCu);
      }
      goto LABEL_40;
    }
    [v25 stopLandingForError];
LABEL_35:

    goto LABEL_36;
  }
}

- (void)errorAnimationDidFinish
{
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController errorAnimationDidFinish]");

  if ([(UIDictationController *)self state] == 6)
  {
    [(UIDictationController *)self setState:0];
  }
}

- (int)state
{
  return dword_1EB25A97C;
}

- (void)dealloc
{
  [(UIDictationController *)self stopHelperMessageDisplayIfNeeded];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:objc_opt_class()];

  [(_UIDictationPrivacySheetController *)self->_dictationPrivacySheetController setPrivacyDelegate:0];
  [(UIDictationController *)self removeStartDictationKeyboardGestures];
  if (self->_stateHandler) {
    os_state_remove_handler();
  }
  int dictationInputModeNotifierToken = self->_dictationInputModeNotifierToken;
  if (dictationInputModeNotifierToken != -1) {
    notify_cancel(dictationInputModeNotifierToken);
  }
  v5.receiver = self;
  v5.super_class = (Class)UIDictationController;
  [(UIDictationController *)&v5 dealloc];
}

- (void)cancelRecordingLimitTimer
{
  recordingLimitTimer = self->_recordingLimitTimer;
  if (recordingLimitTimer)
  {
    [(NSTimer *)recordingLimitTimer invalidate];
    char v4 = self->_recordingLimitTimer;
    self->_recordingLimitTimer = 0;
  }
  [(UIDictationController *)self stopIdleTimerResetTimer];
}

- (void)stopDictationByTimer
{
  uint64_t v3 = +[UIDictationController sharedInstance];
  [v3 setReasonType:19];

  char v4 = +[UIKeyboardImpl activeInstance];
  [v4 dismissDictationTip];

  [(UIDictationController *)self stopDictation];
  LODWORD(v4) = +[UIKeyboard isModelessActive];
  id v6 = +[UIKeyboardImpl activeInstance];
  if (v4)
  {
    [v6 clearDictationMenuTimer];
  }
  else
  {
    objc_super v5 = [(UIDictationController *)self keyboardInputModeToReturn];
    [v6 setKeyboardInputMode:v5 userInitiated:0];
  }
}

- (void)startRecordingLimitTimer
{
  [(UIDictationController *)self cancelRecordingLimitTimer];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CB00];
  [(UIDictationController *)self maxRecordingLength];
  objc_super v5 = [v3 scheduledTimerWithTimeInterval:self target:sel_stopDictationByTimer selector:0 userInfo:0 repeats:v4];
  recordingLimitTimer = self->_recordingLimitTimer;
  self->_recordingLimitTimer = v5;

  if ([(UIDictationController *)self isDetectingUtterances])
  {
    [(UIDictationController *)self resetIdleTimer];
    [(UIDictationController *)self stopIdleTimerResetTimer];
    int v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_resetIdleTimer selector:0 userInfo:0 repeats:20.0];
    idleTimerResetTimer = self->_idleTimerResetTimer;
    self->_idleTimerResetTimer = v7;
  }
}

- (void)updateRecordingLimitTimerIfNeeded
{
  if ([(UIDictationController *)self isDetectingUtterances])
  {
    [(UIDictationController *)self startRecordingLimitTimer];
  }
}

- (void)setIdleTimerDisabled:(BOOL)a3 forReason:(id)a4
{
  BOOL v4 = a3;
  char v14 = (__CFString *)a4;
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    int v7 = [v6 inputDelegateManager];
    uint64_t v8 = [v7 inputSystemSourceSession];

    if (v8)
    {
      __int16 v9 = [v8 textOperations];
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = NSStringFromSelector(a2);
      [v10 setObject:v11 forKeyedSubscript:@"selector"];

      uint64_t v12 = [NSNumber numberWithBool:v4];
      [v10 setObject:v12 forKeyedSubscript:@"disabled"];

      if (v14) {
        uint64_t v13 = v14;
      }
      else {
        uint64_t v13 = &stru_1ED0E84C0;
      }
      [v10 setObject:v13 forKeyedSubscript:@"reason"];
      [v9 setCustomInfoType:0x1ED14BAA0];
      [v9 setCustomInfo:v10];
      [v8 flushOperations];
    }
  }
  else
  {
    [(id)UIApp _setIdleTimerDisabled:v4 forReason:v14];
  }
}

- (void)resetIdleTimer
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  BOOL v4 = NSStringFromClass(v3);
  [(UIDictationController *)self setIdleTimerDisabled:1 forReason:v4];

  objc_super v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UIDictationController *)self setIdleTimerDisabled:0 forReason:v6];
}

- (void)stopIdleTimerResetTimer
{
  idleTimerResetTimer = self->_idleTimerResetTimer;
  if (idleTimerResetTimer)
  {
    [(NSTimer *)idleTimerResetTimer invalidate];
    BOOL v4 = self->_idleTimerResetTimer;
    self->_idleTimerResetTimer = 0;
  }
}

+ (id)activeConnection
{
  uint64_t v2 = +[UIDictationController activeInstance];
  uint64_t v3 = [v2 dictationConnection];

  return v3;
}

- (void)releaseConnection
{
  [(UIDictationConnection *)self->_dictationConnection cancelAvailabilityMonitoring];
  [(UIDictationConnection *)self->_dictationConnection setDelegate:0];
  dictationConnection = self->_dictationConnection;
  self->_dictationConnection = 0;
}

- (id)connectionForStatisticsLogging
{
  if (self->_dictationConnection) {
    self->_connectionWasAlreadyAliveForStatisticsLogging = 1;
  }
  return [(UIDictationController *)self dictationConnection];
}

- (BOOL)dictationEnabled
{
  int v2 = MGGetBoolAnswer();
  if (v2)
  {
    if (+[UIDictationConnection dictationRestricted])
    {
      LOBYTE(v2) = 0;
      return v2;
    }
    uint64_t v3 = (void *)qword_1EB25A988;
    if (!qword_1EB25A988)
    {
      BOOL v4 = +[UIDictationConnectionPreferences sharedInstance];
      int v5 = [v4 dictationIsEnabled];

      id v6 = +[UIDictationConnectionPreferences sharedInstance];
      int v7 = [v6 suppressDictationOptIn];

      uint64_t v8 = +[UIWindow _applicationKeyWindow];
      if (v8)
      {
        __int16 v9 = v8;
        unsigned int v10 = ([v8 _isHostedInAnotherProcess] | v7) ^ 1;
      }
      else
      {
        uint64_t v11 = +[UIKeyboardImpl activeInstance];
        uint64_t v12 = [v11 delegateAsResponder];
        uint64_t v13 = [v12 _responderWindow];
        char v14 = v13;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = [v11 window];
        }
        __int16 v9 = v15;

        unsigned int v10 = ([v9 _isHostedInAnotherProcess] | v7) ^ 1;
        if (!v9)
        {
          LOBYTE(v2) = v5 | v10;
          return v2;
        }
      }
      uint64_t v16 = [objc_alloc(NSNumber) initWithBool:v5 | v10];
      char v17 = (void *)qword_1EB25A988;
      qword_1EB25A988 = v16;

      uint64_t v3 = (void *)qword_1EB25A988;
    }
    LOBYTE(v2) = [v3 BOOLValue];
  }
  return v2;
}

- (BOOL)dataSharingDecided
{
  int v2 = (void *)qword_1EB25A990;
  if (!qword_1EB25A990)
  {
    id v3 = objc_alloc(NSNumber);
    BOOL v4 = [getAFPreferencesClass_0() sharedPreferences];
    uint64_t v5 = objc_msgSend(v3, "initWithBool:", objc_msgSend(v4, "siriDataSharingOptInStatus") != 0);
    id v6 = (void *)qword_1EB25A990;
    qword_1EB25A990 = v5;

    int v2 = (void *)qword_1EB25A990;
  }
  return [v2 BOOLValue];
}

- (void)dismissDictationView:(id)a3
{
}

- (void)setupForStreamingDictationStart
{
  [(UIDictationController *)self setPreviousHypothesis:0];
  -[UIDictationController setInsertionRange:](self, "setInsertionRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  [(UIDictationController *)self setDiscardNextHypothesis:0];
  id v5 = [(UIDictationController *)self streamingOperations];
  id v3 = +[UIKeyboardImpl activeInstance];
  BOOL v4 = [v3 inputDelegate];
  [v5 dictationWillBeginInDocument:v4];
}

- (void)setupForAsyncDelegate
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    BOOL v4 = [v3 remoteTextInputPartner];
    [v4 forwardKeyboardOperation:sel_setupForAsyncDelegate object:0];
  }
  id v5 = +[UIKeyboardImpl activeInstance];
  id v11 = [v5 inputDelegate];

  if [v11 _usesAsynchronousProtocol] && (objc_opt_respondsToSelector())
  {
    id v6 = v11;
    int v7 = [v6 selectedTextRange];
    uint64_t v8 = [v7 start];
    -[UIDictationController setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:](self, "setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:", [v6 isPosition:v8 atBoundary:3 inDirection:1]);

    __int16 v9 = [v6 selectedTextRange];
    unsigned int v10 = [v9 end];
    -[UIDictationController setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:](self, "setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:", [v6 isPosition:v10 atBoundary:3 inDirection:0]);

    -[UIDictationController setInitialPreviousCharacterForAsyncDelegate:](self, "setInitialPreviousCharacterForAsyncDelegate:", (unsigned __int16)[v6 _characterInRelationToCaretSelection:0xFFFFFFFFLL]);
    LOWORD(v9) = [v6 _characterInRelationToCaretSelection:0];

    [(UIDictationController *)self setInitialCharacterAfterSelectionForAsyncDelegate:(unsigned __int16)v9];
  }
}

- (void)setupForDictationStart
{
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController setupForDictationStart]");

  self->cancelledByWaitingForLocalResults = [(UIDictationController *)self state] == 4;
  if ([(UIDictationController *)self state]) {
    [(UIDictationController *)self cancelDictation];
  }
  if (+[UIDictationController viewMode]
    && +[UIDictationController viewMode] != 6)
  {
    BOOL v4 = [(UIDictationController *)self currentInputModeForDictation];
    id v5 = [v4 dictationLanguage];
    id v12 = 0;
    BOOL v6 = [(UIDictationController *)self supportsDictationLanguage:v5 error:&v12];
    id v3 = v12;

    if (!v6) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = 0;
  }
  [(UIDictationController *)self setLastRecognitionText:0];
  [(UIDictationController *)self setLastCorrectionIdentifier:0];
  [(UIDictationController *)self setState:1];
  int v7 = +[UIKeyboardImpl activeInstance];
  [v7 forceShiftUpdate];
  byte_1EB25A971 = [v7 isShifted];
  self->_hasCheckedForLeadingSpaceOnce = 0;
  uint64_t v8 = [(UIDictationController *)self currentInputModeForDictation];
  __int16 v9 = [v8 dictationLanguage];

  if (![(id)objc_opt_class() viewMode])
  {
    unsigned int v10 = [(UIDictationConnectionPreferences *)self->_preferences languageCode];
    uint64_t v11 = [(UIDictationController *)self languageCodeForAssistantLanguageCode:v10];

    __int16 v9 = (void *)v11;
  }
  [(UIDictationController *)self setLanguage:v9];
  [(UIDictationController *)self startRecordingLimitTimer];
  self->_recievingResults = 0;
  [(UIDictationController *)self setupForStreamingDictationStart];
  [(UIDictationController *)self setupForAsyncDelegate];
  self->_ignoreUserInteraction = 1;

LABEL_10:
}

+ (BOOL)_applicationIsActive
{
  return _MergedGlobals_33_1;
}

- (void)_startDictationWithContinuation:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[UIKeyboardImpl activeInstance];
  BOOL v6 = [v5 keyboardState];
  int v7 = [v6 documentState];

  uint64_t v8 = [v7 selectedText];
  __int16 v9 = (NSString *)[v8 copy];
  selectedTextAtStart = self->_selectedTextAtStart;
  self->_selectedTextAtStart = v9;

  uint64_t v11 = [v7 contextBeforeInput];
  NSUInteger v12 = [v11 length];
  NSUInteger v13 = [(NSString *)self->_selectedTextAtStart length];
  self->_relativeRangeBefore.id location = v12;
  self->_relativeRangeBefore.length = v13;

  if ([(id)objc_opt_class() _applicationIsActive])
  {
    [(UIDictationController *)self startConnectionWithContinuation:v4];
  }
  else
  {
    char v14 = _UIDictationControllerLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[UIDictationController _startDictationWithContinuation:]";
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "%s Early return due to inactive application state", (uint8_t *)&v15, 0xCu);
    }
  }
}

+ (id)slsDictationLanguages
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v2 = [getAFPreferencesClass_0() sharedPreferences];
  id v3 = [v2 dictationSLSLanguagesEnabled];
  id v4 = [v3 keysOfEntriesPassingTest:&__block_literal_global_748];
  id v5 = [v4 allObjects];

  if ([v5 count])
  {
    BOOL v6 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
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
          NSUInteger v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "stringByReplacingOccurrencesOfString:withString:", @"_", @"-", (void)v15);
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    NSUInteger v13 = [MEMORY[0x1E4F1C978] arrayWithArray:v6];
  }
  else
  {
    NSUInteger v13 = 0;
  }

  return v13;
}

uint64_t __46__UIDictationController_slsDictationLanguages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue];
}

- (BOOL)isFallingBackToMonolingualDictation
{
  if ([(UIDictationController *)self smartLanguageSelectionOverridden]) {
    return 1;
  }
  id v3 = +[UIKeyboardInputModeController sharedInputModeController];
  id v4 = [v3 enabledDictationLanguages];
  unint64_t v5 = [v4 count];

  if (v5 < 2) {
    return 0;
  }
  BOOL v6 = +[UIDictationConnectionPreferences sharedInstance];
  int v7 = [v6 isSmartLanguageSelectionEnabled];

  uint64_t v8 = [(id)objc_opt_class() activeSLSDictationLanguages];

  BOOL result = 1;
  if (v8)
  {
    if (v7) {
      return 0;
    }
  }
  return result;
}

+ (BOOL)_isLowStorageForOnDeviceDictationAsset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v9 = 0;
  id v3 = [v2 attributesOfFileSystemForPath:@"/private/var/MobileAsset/AssetsV2" error:&v9];
  id v4 = v9;

  if (!v3)
  {
    BOOL v6 = _UIDictationControllerLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v11 = "+[UIDictationController _isLowStorageForOnDeviceDictationAsset]";
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "%s Error getting free disk space: %@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  unint64_t v5 = [v3 objectForKey:*MEMORY[0x1E4F283A0]];
  BOOL v6 = v5;
  if (!v5)
  {
LABEL_6:
    BOOL v7 = 0;
    goto LABEL_7;
  }
  BOOL v7 = (unint64_t)[v5 unsignedLongLongValue] >> 22 < 0x7D;
LABEL_7:

  return v7;
}

- (void)showLowStorageUserAlertWithLanguage:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (__CFString *)a3;
  if (+[UIKeyboard isKeyboardProcess])
  {
    BOOL v6 = +[UIKeyboardImpl activeInstance];
    BOOL v7 = [v6 inputDelegateManager];
    uint64_t v8 = [v7 inputSystemSourceSession];

    if (v8)
    {
      id v9 = [v8 textOperations];
      [v9 setCustomInfoType:0x1ED14BAA0];
      v41[0] = @"selector";
      uint64_t v10 = NSStringFromSelector(a2);
      v41[1] = @"language";
      v42[0] = v10;
      uint64_t v11 = &stru_1ED0E84C0;
      if (v5) {
        uint64_t v11 = v5;
      }
      v42[1] = v11;
      __int16 v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
      [v9 setCustomInfo:v12];

      [v8 flushOperations];
    }
  }
  else
  {
    [(UIDictationController *)self _createDictationPresenterWindowIfNecessary];
    id v13 = [(UIDictationController *)self dictationPresenterWindow];
    [v13 makeKeyAndVisible];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke;
    aBlock[3] = &unk_1E52DC290;
    aBlock[4] = self;
    uint64_t v14 = _Block_copy(aBlock);
    long long v15 = _UIKitBundle();
    long long v16 = [v15 localizedStringForKey:@"Low Storage User Alert Body", @"On-device Dictation is temporarily unavailable. You can still use Dictation, but 500 MB of space is needed to run all features.", @"Localizable" value table];

    long long v17 = +[UIKeyboardInputModeController sharedInputModeController];
    long long v18 = [v17 enabledDictationLanguages];
    unint64_t v19 = [v18 count];

    if (v19 >= 2)
    {
      if ([(__CFString *)v5 length])
      {
        uint64_t v20 = [MEMORY[0x1E4F1CA20] currentLocale];
        unsigned int v21 = [v20 displayNameForKey:*MEMORY[0x1E4F1C438] value:v5];

        if (v21 && ([v21 isEqualToString:v5] & 1) == 0)
        {
          int v22 = NSString;
          unsigned int v23 = _UIKitBundle();
          int v24 = [v23 localizedStringForKey:@"Low Storage User Alert Body", @"On-device Dictation is temporarily unavailable for %@. You can still use Dictation, but 500 MB of space is needed to run all features.", @"Localizable" value table];
          uint64_t v25 = objc_msgSend(v22, "stringWithFormat:", v24, v21);

          long long v16 = (void *)v25;
        }
      }
      else
      {
        unsigned int v21 = 0;
      }
    }
    uint64_t v26 = _UIKitBundle();
    int v27 = [v26 localizedStringForKey:@"Low Storage User Alert Title" value:@"Low Storage" table:@"Localizable"];
    uint64_t v28 = +[UIAlertController alertControllerWithTitle:v27 message:v16 preferredStyle:1];

    long long v29 = _UIKitBundle();
    uint64_t v30 = [v29 localizedStringForKey:@"Low Storage User Alert Manage Storage" value:@"Manage Storage" table:@"Localizable"];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke_2;
    v38[3] = &unk_1E52FB230;
    id v31 = v14;
    id v39 = v31;
    int v32 = +[UIAlertAction actionWithTitle:v30 style:0 handler:v38];

    [v28 addAction:v32];
    BOOL v33 = _UIKitBundle();
    int v34 = [v33 localizedStringForKey:@"Low Storage User Alert OK" value:@"OK" table:@"Localizable"];
    id v35 = +[UIAlertAction actionWithTitle:v34 style:1 handler:v31];
    [v28 addAction:v35];

    [v28 setPreferredAction:v32];
    if (v28)
    {
      BOOL v36 = [(UIDictationController *)self dictationPresenterWindow];
      id v37 = [v36 rootViewController];
      [v37 presentViewController:v28 animated:1 completion:0];
    }
  }
}

uint64_t __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) dictationPresenterWindow];
  [v2 resignKeyWindow];

  id v3 = [*(id *)(a1 + 32) dictationPresenterWindow];
  [v3 setHidden:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 setDictationPresenterWindow:0];
}

void __61__UIDictationController_showLowStorageUserAlertWithLanguage___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v1 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=STORAGE_MGMT"];
  [v2 openSensitiveURL:v1 withOptions:0 error:0];
}

- (void)resetAdaptiveDeleteActivationLogic
{
  [(UIDictationController *)self setShouldDeleteWordOnBackspaceTap:0];
  -[UIDictationController setStartRangeOfCurrentHypothesis:](self, "setStartRangeOfCurrentHypothesis:", 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)startDictation
{
}

- (void)startDictationWithContinuation:(id)a3
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v4, "forwardDictationEvent_startDictation");

    goto LABEL_62;
  }
  if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
  {
    unint64_t v5 = +[UIKeyboardImpl activeInstance];
    BOOL v6 = [v5 inputDelegateManager];

    BOOL v7 = [v6 inputSystemSourceSession];
    if (v7)
    {
      uint64_t v8 = [v6 textInputView];
      id v9 = [v6 selectedTextRange];
      uint64_t v10 = [v9 start];
      [v6 caretRectForPosition:v10];
      objc_msgSend(v8, "convertRect:toView:", 0);
      double v12 = v11;

      if (v12 > 2.0)
      {
        id v13 = [v7 textOperations];
        uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v15 = NSStringFromSelector(sel_updateCaretRectInWindowIfNeeded);
        [v14 setObject:v15 forKeyedSubscript:@"selector"];

        long long v16 = [NSNumber numberWithDouble:v12];
        [v14 setObject:v16 forKeyedSubscript:@"caretRectInWindow.y"];

        [v13 setCustomInfoType:0x1ED14BAA0];
        [v13 setCustomInfo:v14];
        [v7 flushOperations];
      }
    }
  }
  [(UIDictationController *)self resetAdaptiveDeleteActivationLogic];
  long long v17 = +[UIDictationConnectionPreferences sharedInstance];
  char v18 = [v17 dictationIsEnabled];

  if (v18)
  {
    [(UIDictationController *)self setCurrentLanguageVerbFirstCommandLanguageStatusCached:0];
    [(UIDictationController *)self setHasSelectedTextRange:0];
    [(UIDictationController *)self setVisibleRTIDocumentStateAtStart:0];
    [(UIDictationController *)self setVisibleRTIDocumentStateAtCommandRecognition:0];
    [(UIDictationController *)self setVisibleContextBeforeInputAtCommandExecution:0];
    [(UIDictationController *)self setCandidateDictationSerializableResults:0];
    [(UIDictationController *)self setDetectingUtterances:0];
    [(UIDictationController *)self setShouldResumeDictation:0];
    unint64_t v19 = _UIDictationControllerLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "%s Set shouldResumeDictation to NO", buf, 0xCu);
    }

    [(UIDictationController *)self setSkipAutomaticResumeDictation:0];
    [(UIDictationController *)self setHasInsertedAtLeastOneSerializedDictationResult:0];
    [(UIDictationController *)self setHaveReceivedFirstPartialResultForCurrentUtterance:0];
    uint64_t v20 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "%s Set haveReceivedFirstPartialResultForCurrentUtterance to NO", buf, 0xCu);
    }

    [(UIDictationController *)self setHaveLeakedPartialResultForCommandUtterance:0];
    unsigned int v21 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "%s Setting haveLeakedPartialResultForCommandUtterance to NO", buf, 0xCu);
    }

    [(UIDictationController *)self setSendButtonPressedDuringDictation:0];
    [(UIDictationController *)self setShouldStayInDictationInputMode:0];
    [(UIDictationController *)self setLogAppEnterBackground:1];
    int v22 = [MEMORY[0x1E4F29128] UUID];
    unsigned int v23 = [v22 UUIDString];
    [(UIDictationController *)self setInteractionIdentifier:v23];

    [(UIDictationController *)self setModelessUsedAtLeastOnce:0];
    [(UIDictationController *)self setLocalSpeechRecognitionForced:0];
    [(UIDictationController *)self setSecureOfflineOnlySpeechRecognition:0];
    if (self->_enablementInstrumentationContext)
    {
      -[UIDictationController setCurrentInstrumentationContext:](self, "setCurrentInstrumentationContext:");
    }
    else
    {
      uint64_t v25 = [getAFAnalyticsClass() sharedAnalytics];
      uint64_t v26 = (void *)[v25 newTurnBasedInstrumentationContext];
      [(UIDictationController *)self setCurrentInstrumentationContext:v26];
    }
    [(UIDictationController *)self setModelInfo:0];
    [(UIDictationController *)self setDetectedLanguage:0];
    [(UIDictationController *)self setFallbackDictationLanguage:0];
    [(UIDictationController *)self setInitialDictationLanguage:0];
    int v27 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v28 = [v27 currentInputMode];
    uint64_t v29 = [v28 primaryLanguage];
    uint64_t v30 = (void *)v29;
    if (v29) {
      id v31 = (__CFString *)v29;
    }
    else {
      id v31 = &stru_1ED0E84C0;
    }
    [(UIDictationController *)self setCurrentKeyboardPrimaryLanguage:v31];

    int v32 = +[UIKeyboardInputModeController sharedInputModeController];
    BOOL v33 = [v32 currentInputMode];
    int v34 = [v33 dictationLanguage];
    [(UIDictationController *)self setInitialDictationLanguage:v34];

    [(UIDictationController *)self setDictationSourceType:0];
    id v35 = [(id)objc_opt_class() slsDictationLanguages];
    [(UIDictationController *)self setDictationLanguages:v35];

    BOOL v36 = [(UIDictationController *)self currentInputModeForDictation];
    id v37 = [v36 dictationLanguage];
    id v38 = +[UIKeyboardImpl activeInstance];
    id v39 = [v38 _sessionIdentifier];
    id v40 = [v39 UUIDString];
    [(UIDictationController *)self preheatEuclidModelWithLanguageCode:v37 clientID:v40];

    v41 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];

    if (v41)
    {
      v99 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
      [(UIDictationController *)self setDictationSourceType:3];
    }
    else
    {
      v99 = [(UIDictationController *)self initialDictationLanguage];
      if ([v99 length])
      {
        v42 = +[UIKeyboardInputModeController sharedInputModeController];
        id v43 = [v42 keyboardLanguageForDictationLanguage:v99];

        BOOL v44 = +[UIKeyboardInputModeController sharedInputModeController];
        uint64_t v45 = [v44 currentInputMode];
        uint64_t v46 = [v45 languageWithRegion];
        if ([v43 isEqualToString:v46]) {
          uint64_t v47 = 1;
        }
        else {
          uint64_t v47 = 2;
        }
        [(UIDictationController *)self setDictationSourceType:v47];
      }
    }
    if (!v99)
    {
      if (!os_variant_has_internal_diagnostics())
      {
        v55 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25A9A0) + 8);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1853B0000, v55, OS_LOG_TYPE_ERROR, "dictationLanguage must not be nil or it's a programming error.", buf, 2u);
        }
        goto LABEL_61;
      }
      goto LABEL_69;
    }
    v98 = objc_msgSend((id)objc_opt_class(), "UIDictationLanguageSourceType:", -[UIDictationController dictationSourceType](self, "dictationSourceType"));
    v48 = +[UIKeyboardImpl activeInstance];
    uint64_t v49 = [v48 userInteractionDelegate];
    BOOL v50 = v49 == 0;

    if (v50)
    {
      uint64_t v51 = +[UIKeyboardImpl activeInstance];
      [v51 setUserInteractionDelegate:self];
    }
    id v52 = +[UIKeyboardImpl sharedInstance];
    v53 = [v52 inputDelegateManager];
    BOOL v54 = [v53 asyncInputDelegate];
    if (v54)
    {
    }
    else
    {
      uint64_t v56 = +[UIKeyboardImpl sharedInstance];
      id v57 = [v56 inputDelegateManager];
      v58 = [v57 webInputDelegate];
      BOOL v59 = v58 == 0;

      if (v59)
      {
        v90 = +[UIKeyboardImpl sharedInstance];
        uint64_t v91 = [v90 inputDelegateManager];
        v92 = [v91 asyncWebKitInteractionDelegate];

        if (v92)
        {
          id v60 = @"async";
        }
        else
        {
          uint64_t v93 = +[UIKeyboardImpl sharedInstance];
          uint64_t v94 = [v93 inputDelegate];

          if (v94) {
            id v60 = @"default";
          }
          else {
            id v60 = @"no delegate";
          }
        }
        goto LABEL_41;
      }
    }
    id v60 = @"async interaction";
LABEL_41:
    v61 = _UIDictationControllerLog();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      v62 = [(UIDictationController *)self currentKeyboardPrimaryLanguage];
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = "-[UIDictationController startDictationWithContinuation:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v99;
      *(_WORD *)&buf[22] = 2112;
      v108 = v98;
      *(_WORD *)v109 = 2112;
      *(void *)&v109[2] = v62;
      __int16 v110 = 2112;
      v111 = v60;
      _os_log_impl(&dword_1853B0000, v61, OS_LOG_TYPE_DEFAULT, "%s Dictation Language %@ Source: %@ Keyboard Language %@, InputDelegateType: %@", buf, 0x34u);
    }
    v63 = [getAFAnalyticsClass() sharedAnalytics];
    v105[0] = @"startDictation";
    v64 = objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonTypeDescription:", -[UIDictationController reasonType](self, "reasonType"));
    v106[0] = v64;
    v106[1] = v99;
    v105[1] = @"dictationLanguage";
    v105[2] = @"dictationLanguageSource";
    v106[2] = v98;
    v105[3] = @"dictationLanguages";
    uint64_t v65 = [(UIDictationController *)self dictationLanguages];
    id v66 = (void *)v65;
    uint64_t v67 = MEMORY[0x1E4F1CBF0];
    if (v65) {
      uint64_t v67 = v65;
    }
    v106[3] = v67;
    v105[4] = @"keyboardLocaleIdentifier";
    uint64_t v68 = [(UIDictationController *)self currentKeyboardPrimaryLanguage];
    v106[4] = v68;
    v105[5] = @"dictationUIInteractionIdentifier";
    uint64_t v69 = [(UIDictationController *)self interactionIdentifier];
    v70 = (void *)v69;
    if (v69) {
      v71 = (__CFString *)v69;
    }
    else {
      v71 = &stru_1ED0E84C0;
    }
    v106[5] = v71;
    v105[6] = @"dictationOptInStatus";
    v72 = [getAFPreferencesClass_0() sharedPreferences];
    uint64_t v73 = [v72 siriDataSharingOptInStatus];
    uint64_t v101 = 0;
    v102 = &v101;
    uint64_t v103 = 0x2020000000;
    id v74 = (void (*)(uint64_t))off_1EB25AAB8;
    v104 = off_1EB25AAB8;
    if (!off_1EB25AAB8)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAFSiriDataSharingOptInStatusGetNameSymbolLoc_block_invoke;
      v108 = &unk_1E52D9900;
      *(void *)v109 = &v101;
      id v75 = AssistantServicesLibrary_1();
      long long v76 = dlsym(v75, "AFSiriDataSharingOptInStatusGetName");
      *(void *)(*(void *)(*(void *)v109 + 8) + 24) = v76;
      off_1EB25AAB8 = *(_UNKNOWN **)(*(void *)(*(void *)v109 + 8) + 24);
      id v74 = (void (*)(uint64_t))v102[3];
    }
    _Block_object_dispose(&v101, 8);
    if (v74)
    {
      long long v77 = v74(v73);
      v106[6] = v77;
      long long v78 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:7];
      [v63 logEventWithType:1404 context:v78];

      uint64_t v101 = 0;
      v102 = &v101;
      uint64_t v103 = 0x2050000000;
      long long v79 = (void *)qword_1EB25AAC0;
      v104 = (void *)qword_1EB25AAC0;
      if (!qword_1EB25AAC0)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getSISchemaInvocationClass_block_invoke;
        v108 = &unk_1E52D9900;
        *(void *)v109 = &v101;
        __getSISchemaInvocationClass_block_invoke((uint64_t)buf);
        long long v79 = (void *)v102[3];
      }
      v80 = v79;
      _Block_object_dispose(&v101, 8);
      id v81 = objc_alloc_init(v80);
      if (+[UIDictationController viewMode] == 6) {
        uint64_t v82 = 42;
      }
      else {
        uint64_t v82 = [(id)objc_opt_class() UIDictationStartStopReasonToInstrumentationInvocationSourceType:self->_reasonType];
      }
      [v81 setInvocationSource:v82];
      [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v81];
      [(UIDictationController *)self instrumentationDictationContextEmitInstrumentation];
      id v83 = objc_alloc_init((Class)getSISchemaUEILaunchContextClass());
      uint64_t v101 = 0;
      v102 = &v101;
      uint64_t v103 = 0x2050000000;
      long long v84 = (void *)qword_1EB25AAC8;
      v104 = (void *)qword_1EB25AAC8;
      if (!qword_1EB25AAC8)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __getSISchemaUEILaunchStartedClass_block_invoke;
        v108 = &unk_1E52D9900;
        *(void *)v109 = &v101;
        __getSISchemaUEILaunchStartedClass_block_invoke((uint64_t)buf);
        long long v84 = (void *)v102[3];
      }
      long long v85 = v84;
      _Block_object_dispose(&v101, 8);
      id v86 = objc_alloc_init(v85);
      [v83 setStartedOrChanged:v86];

      uint64_t v87 = [v83 startedOrChanged];
      [v87 setExists:1];

      [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v83];
      if (+[UIDictationController viewMode] == 6) {
        [(UIDictationController *)self _displaySecureContentsAsPlainText:1 afterDelay:0.0];
      }
      [(UIDictationController *)self _startDictationWithContinuation:v100];
      [(UIDictationController *)self _markOfflineDictationInputMetricEvent];
      v88 = +[UIDictationView sharedInstance];
      [v88 setSwitchingLanguage:0];

      [(UIDictationTipController *)self->_dictationTipController reset];
      self->_dictationInputModeSwitchStarted = 0;
      v89 = +[UIKeyboardImpl activeInstance];
      [v89 dismissDictationTip];

LABEL_61:
      goto LABEL_62;
    }
    v95 = [MEMORY[0x1E4F28B00] currentHandler];
    v96 = [NSString stringWithUTF8String:"NSString *_AFSiriDataSharingOptInStatusGetName(AFSiriDataSharingOptInStatus)"];
    objc_msgSend(v95, "handleFailureInFunction:file:lineNumber:description:", v96, @"UIDictationController.m", 233, @"%s", dlerror());

    __break(1u);
LABEL_69:
    uint64_t v97 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v97, OS_LOG_TYPE_FAULT, "dictationLanguage must not be nil or it's a programming error.", buf, 2u);
    }

    goto LABEL_61;
  }
  int v24 = _UIDictationControllerLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[UIDictationController startDictationWithContinuation:]";
    _os_log_error_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "%s Attempted to start dictation when not enabled", buf, 0xCu);
  }

LABEL_62:
}

- (void)setCurrentInstrumentationContext:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_currentInstrumentationContext, a3);
  BOOL v5 = +[UIKeyboard isKeyboardProcess];
  BOOL v6 = v13;
  if (v5)
  {
    BOOL v7 = +[UIKeyboardImpl activeInstance];
    uint64_t v8 = [v7 inputDelegateManager];
    id v9 = [v8 inputSystemSourceSession];

    if (v9)
    {
      uint64_t v10 = [v9 textOperations];
      double v11 = [MEMORY[0x1E4F1CA60] dictionary];
      double v12 = NSStringFromSelector(sel_setCurrentInstrumentationContext_);
      [v11 setObject:v12 forKeyedSubscript:@"selector"];

      [v11 setObject:v13 forKeyedSubscript:@"instrumentationContext"];
      [v10 setCustomInfoType:0x1ED14BAA0];
      [v10 setCustomInfo:v11];
      [v9 flushOperations];
    }
    BOOL v6 = v13;
  }
}

- (void)setLocalSpeechRecognitionForced:(BOOL)a3
{
  BOOL v3 = a3;
  self->_localSpeechRecognitionForced = a3;
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    BOOL v5 = [v4 inputDelegateManager];
    id v10 = [v5 inputSystemSourceSession];

    if (v10)
    {
      BOOL v6 = [v10 textOperations];
      BOOL v7 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v8 = NSStringFromSelector(sel_setLocalSpeechRecognitionForced_);
      [v7 setObject:v8 forKeyedSubscript:@"selector"];

      id v9 = [NSNumber numberWithBool:v3];
      [v7 setObject:v9 forKeyedSubscript:@"forceOfflineRecognition"];

      [v6 setCustomInfoType:0x1ED14BAA0];
      [v6 setCustomInfo:v7];
      [v10 flushOperations];
    }
  }
}

- (void)setInteractionIdentifier:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_interactionIdentifier, a3);
  BOOL v5 = +[UIKeyboard isKeyboardProcess];
  BOOL v6 = v13;
  if (v5)
  {
    BOOL v7 = +[UIKeyboardImpl activeInstance];
    uint64_t v8 = [v7 inputDelegateManager];
    id v9 = [v8 inputSystemSourceSession];

    if (v9)
    {
      id v10 = [v9 textOperations];
      double v11 = [MEMORY[0x1E4F1CA60] dictionary];
      double v12 = NSStringFromSelector(sel_setInteractionIdentifier_);
      [v11 setObject:v12 forKeyedSubscript:@"selector"];

      [v11 setObject:v13 forKeyedSubscript:@"interactionIdentifier"];
      [v10 setCustomInfoType:0x1ED14BAA0];
      [v10 setCustomInfo:v11];
      [v9 flushOperations];
    }
    BOOL v6 = v13;
  }
}

- (void)switchToDictationLanguage:(id)a3
{
}

- (void)switchToDictationLanguage:(id)a3 inputOptions:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    if (!+[UIKeyboard isModelessActive])
    {
      id v9 = +[UIKeyboardImpl activeInstance];
      id v10 = [(UIDictationController *)self keyboardInputModeToReturn];
      [v9 setKeyboardInputMode:v10 userInitiated:0];
    }
    double v11 = +[UIDictationController sharedInstance];
    [v11 overrideSmartLanguageSelection:v6];

    double v12 = off_1E52D4000;
    id v13 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v14 = [v13 keyboardLanguageForDictationLanguage:v6];
    long long v15 = (void *)v14;
    if (v14) {
      long long v16 = (void *)v14;
    }
    else {
      long long v16 = v6;
    }
    id v17 = v16;

    char v18 = [(UIDictationController *)self keyboardInputModeToReturn];
    unint64_t v19 = [v18 languageWithRegion];
    int v20 = [v17 isEqualToString:v19];

    if (v20)
    {
      id v21 = [(UIDictationController *)self keyboardInputModeToReturn];
      if (!v21)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      int v22 = +[UIKeyboardInputModeController sharedInputModeController];
      unsigned int v23 = [v22 activeInputModes];

      uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        id v43 = v7;
        id v21 = 0;
        uint64_t v26 = *(void *)v45;
LABEL_13:
        uint64_t v27 = 0;
        uint64_t v28 = v21;
        while (1)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          id v21 = *(id *)(*((void *)&v44 + 1) + 8 * v27);

          uint64_t v29 = [v21 languageWithRegion];
          char v30 = [v17 isEqualToString:v29];

          if (v30) {
            break;
          }
          ++v27;
          uint64_t v28 = v21;
          if (v25 == v27)
          {
            uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v48 count:16];
            if (v25) {
              goto LABEL_13;
            }

            id v21 = 0;
            break;
          }
        }
        id v7 = v43;
        double v12 = off_1E52D4000;
      }
      else
      {
        id v21 = 0;
      }

      if (!v21) {
        goto LABEL_28;
      }
    }
    [v21 setDictationLanguage:v6];
    id v31 = +[UIDictationView sharedInstance];
    [v31 setShowLanguageLabel:1];

    int v32 = [(__objc2_class *)v12[14] sharedInputModeController];
    BOOL v33 = [v32 currentInputMode];
    int v34 = +[UIKeyboardInputMode dictationInputMode];
    int v35 = [v33 isEqual:v34];

    if (v35)
    {
      [v21 setLastUsedDictationLanguage];
      BOOL v36 = [(__objc2_class *)v12[14] sharedInputModeController];
      [v36 setCurrentInputModeInPreference:v21];

      id v37 = +[UIKeyboardInputMode dictationInputMode];
      [v37 setCurrentInputModeForDictation:v21];

      [(UIDictationController *)self setCurrentInputModeForDictation:v21];
      [(UIDictationController *)self setKeyboardInputModeToReturn:v21];
      id v38 = +[UIKeyboardImpl activeInstance];
      int v39 = [v38 isInHardwareKeyboardMode];

      if (v39)
      {
        id v40 = (void *)UIApp;
        v41 = [v21 automaticHardwareLayout];
        [v40 setHardwareKeyboardLayoutName:v41];
      }
      [(UIDictationController *)self setInputModeOptions:0];
      [(UIDictationController *)self startDictationWithContinuation:0];
    }
    else
    {
      v42 = +[UIKeyboardImpl activeInstance];
      [v42 setKeyboardInputMode:v21 userInitiated:1];

      [(UIDictationController *)self switchToDictationInputModeWithTouch:0 withKeyboardInputMode:v21 options:v7];
    }
    goto LABEL_28;
  }
  uint64_t v8 = +[UIKeyboardImpl activeInstance];
  objc_msgSend(v8, "forwardDictationEvent_switchToDictationLanguage:", v6);

LABEL_29:
}

- (void)presentEnablementAndDataSharingPromptIfNeeded:(id)a3
{
  id v6 = (void (**)(id, uint64_t))a3;
  id v4 = +[UIDictationConnectionPreferences sharedInstance];
  if ([v4 dictationIsEnabled])
  {
    BOOL v5 = [(UIDictationController *)self dataSharingDecided];

    if (v5)
    {
      v6[2](v6, 1);
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(UIDictationController *)self dismissSoftwareKeyboardIfNeeded];
  [(UIDictationController *)self _presentEnablementAndDataSharingPromptIfNeeded:v6];
LABEL_6:
}

- (void)switchToDictationInputModeWithTouch:(id)a3 withKeyboardInputMode:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = +[UIKeyboardImpl activeInstance];
  double v12 = [v11 inputDelegate];

  if (v12)
  {
    id v13 = +[UIDictationConnectionPreferences sharedInstance];
    if ([v13 dictationIsEnabled])
    {
      BOOL v14 = [(UIDictationController *)self dataSharingDecided];

      if (v14)
      {
        long long v15 = [(UIDictationController *)self _finalDictationStartLanguageCodeWithKeyboardInputMode:v9];
        long long v16 = [getAFPreferencesClass_0() sharedPreferences];
        char v17 = objc_opt_respondsToSelector();

        if (v17)
        {
          char v18 = [getAFPreferencesClass_0() sharedPreferences];
          uint64_t v19 = [v18 performSelector:sel_displayedLowStorageNotificationForLanguage_ withObject:v15];

          int v20 = [(UIDictationController *)self cachedDisplayLowStorageNotification];
          if (v20)
          {
            [(UIDictationController *)self setCachedDisplayLowStorageNotification:v20];
          }
          else
          {
            id v21 = [MEMORY[0x1E4F1CA60] dictionary];
            [(UIDictationController *)self setCachedDisplayLowStorageNotification:v21];
          }
          int v22 = [(UIDictationController *)self cachedDisplayLowStorageNotification];
          unsigned int v23 = [v22 objectForKey:v15];
          int v24 = [v23 BOOLValue];

          if (v19) {
            int v25 = 1;
          }
          else {
            int v25 = v24;
          }
          uint64_t v26 = +[UIDictationConnectionPreferences sharedInstance];
          int v27 = [v26 isOnDeviceDictationSupportMissingAssetForLanguage:v15];

          if (v27)
          {
            if ((v25 & 1) == 0
              && [(id)objc_opt_class() _isLowStorageForOnDeviceDictationAsset])
            {
              uint64_t v28 = [(UIDictationController *)self dictationConnection];
              [v28 suppressLowStorageNotificationForLanguage:v15 suppress:1];

              uint64_t v29 = [(UIDictationController *)self cachedDisplayLowStorageNotification];
              [v29 setObject:MEMORY[0x1E4F1CC38] forKey:v15];

              char v30 = [(UIDictationController *)self dictationConnection];
              [v30 requestOfflineDictationSupportForLanguage:v15 completion:0];

              [(UIDictationController *)self showLowStorageUserAlertWithLanguage:v15];
LABEL_25:

              goto LABEL_26;
            }
          }
          else if (v25)
          {
            id v31 = [(UIDictationController *)self dictationConnection];
            [v31 suppressLowStorageNotificationForLanguage:v15 suppress:0];

            int v32 = [(UIDictationController *)self cachedDisplayLowStorageNotification];
            [v32 setObject:MEMORY[0x1E4F1CC28] forKey:v15];
          }
        }
        BOOL v33 = +[UIKeyboard activeKeyboard];
        [v33 acceptAutocorrectionWithCompletionHandler:0];

        int v34 = +[UIKeyboardInputMode dictationInputMode];
        [v34 setTriggeringTouch:v8];
        [v34 setCurrentInputModeForDictation:v9];
        [(UIDictationController *)self setCurrentInputModeForDictation:v9];
        if (![v34 viewControllerClass])
        {
          -[UITouch _setPhaseChangeDelegate:]((uint64_t)v8, self);
          self->cancelledByWaitingForLocalResults = 0;
          if ([(UIDictationController *)self isFallingBackToMonolingualDictation]) {
            uint64_t v35 = 1;
          }
          else {
            uint64_t v35 = [v9 isDisplayed] ^ 1;
          }
          BOOL v36 = +[UIDictationView sharedInstance];
          [v36 setShowLanguageLabel:v35];

          [(UIDictationController *)self setInputModeOptions:v10];
          self->_reasonType = +[UIDictationController reasonType:v10];
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __91__UIDictationController_switchToDictationInputModeWithTouch_withKeyboardInputMode_options___block_invoke;
          v37[3] = &unk_1E52DCB30;
          v37[4] = self;
          id v38 = v9;
          id v39 = v8;
          [(UIDictationController *)self startDictationWithContinuation:v37];
        }
        goto LABEL_25;
      }
    }
    else
    {
    }
    [(UIDictationController *)self dismissSoftwareKeyboardIfNeeded];
    [(UIDictationController *)self _presentEnablementAndDataSharingPromptIfNeeded:0];
  }
LABEL_26:
}

void __91__UIDictationController_switchToDictationInputModeWithTouch_withKeyboardInputMode_options___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setDictationInputMode:*(void *)(a1 + 40)];
  if (*(void *)(a1 + 48))
  {
    id v2 = +[UIDictationView sharedInstance];
    [v2 highlightEndpointButton];
  }
  BOOL v3 = *(void **)(a1 + 32);
  BOOL v5 = @"reason";
  v6[0] = @"Dictation controller did switch input mode";
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [v3 postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v4];
}

- (void)switchToDictationInputModeWithTouch:(id)a3
{
  id v4 = a3;
  id v7 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v5 = [v7 currentInputMode];
  id v6 = +[UIDictationInputModeOptions dictationInputModeOptionsWithInvocationSource:@"UIDictationInputModeInvocationSourceMicButtonInKeyboard"];
  [(UIDictationController *)self switchToDictationInputModeWithTouch:v4 withKeyboardInputMode:v5 options:v6];
}

+ (BOOL)shouldForwardEventsToInputSystemUI
{
  return +[UIKeyboard usesInputSystemUI];
}

- (void)switchToDictationInputModeWithTouch:(id)a3 options:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  int v9 = [(id)objc_opt_class() shouldForwardEventsToInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (v9)
    {
      double v12 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Forwarding event with UITouch is not supported", buf, 2u);
      }
    }
  }
  else if (v9)
  {
    id v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &switchToDictationInputModeWithTouch_options____s_category)+ 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v14 = 0;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Forwarding event with UITouch is not supported", v14, 2u);
    }
  }
  id v10 = +[UIKeyboardInputModeController sharedInputModeController];
  double v11 = [v10 currentInputMode];
  [(UIDictationController *)self switchToDictationInputModeWithTouch:v7 withKeyboardInputMode:v11 options:v6];
}

- (id)currentDictationLanguageForDisplay
{
  if ([(UIDictationController *)self smartLanguageSelectionOverridden])
  {
    BOOL v3 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
  }
  else
  {
    id v4 = [(UIDictationController *)self currentInputModeForDictation];
    BOOL v5 = [v4 dictationLanguage];
    BOOL v3 = TIInputModeGetLanguageWithRegion();
  }
  return v3;
}

- (void)showSoftwareKeyboardIfNeeded
{
  if (![(UIDictationController *)self shouldSuppressSoftwareKeyboard])
  {
    BOOL v3 = +[UIKeyboardImpl activeInstance];
    int v4 = [v3 isMinimized];

    if (v4)
    {
      BOOL v5 = +[UIKeyboardImpl activeInstance];
      char v6 = [v5 isInHardwareKeyboardMode];

      if ((v6 & 1) == 0)
      {
        [(UIDictationController *)self setDidToggleSoftwareKeyboardVisibleForDictation:1];
        id v7 = +[UIKeyboardImpl activeInstance];
        [v7 ejectKeyDown];
      }
    }
    else
    {
      [(UIDictationController *)self setDidToggleSoftwareKeyboardVisibleForDictation:0];
    }
  }
}

- (void)dismissSoftwareKeyboardIfNeeded
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  char v4 = [v3 isMinimized];

  if ([(UIDictationController *)self didToggleSoftwareKeyboardVisibleForDictation]&& (v4 & 1) == 0)
  {
    BOOL v5 = +[UIKeyboardImpl activeInstance];
    [v5 ejectKeyDown];
  }
  [(UIDictationController *)self setDidToggleSoftwareKeyboardVisibleForDictation:0];
}

- (void)_displaySecureContentsAsPlainText:(BOOL)a3 afterDelay:(double)a4
{
  if (!a3)
  {
    BOOL v5 = +[UIKeyboardImpl sharedInstance];
    id v7 = [v5 inputDelegate];

    if ([v7 isSecureTextEntry])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v7;
        [v6 setDisplaySecureTextUsingPlainText:0];
        [v6 setDisplaySecureEditsUsingPlainText:0];
        [v6 _forceObscureAllText];
      }
    }
  }
}

- (void)clearTextFieldPlaceholder
{
  if ([(UIDictationController *)self _shouldUpdateHelperMessageDisplay])
  {
    BOOL v3 = +[UIKeyboardImpl sharedInstance];
    id v7 = [v3 inputDelegate];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v4 = (objc_class *)MEMORY[0x1E4F28B18];
      id v5 = v7;
      id v6 = (void *)[[v4 alloc] initWithString:&stru_1ED0E84C0];
      [v5 _setOverridePlaceholder:v6 alignment:4];
      self->_prevForceDisplayOverridePlaceholder = [v5 _forceDisplayOverridePlaceholder];
      [v5 setPlaceholder:0];
      [v5 _setForceDisplayOverridePlaceholder:0];
    }
  }
}

- (void)restoreTextFieldPlaceholder
{
  if ([(UIDictationController *)self _shouldUpdateHelperMessageDisplay])
  {
    BOOL v3 = +[UIKeyboardImpl sharedInstance];
    id v5 = [v3 inputDelegate];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v5;
      [v4 _setOverridePlaceholder:0 alignment:4];
      [v4 _setForceDisplayOverridePlaceholder:self->_prevForceDisplayOverridePlaceholder];
    }
  }
}

- (void)updateHelperMessageDisplayIfNeeded
{
  if ([(UIDictationController *)self _resolvedIsDictationPossible])
  {
    [(UIDictationController *)self startHelperMessageDisplayIfNeeded];
  }
  else
  {
    [(UIDictationController *)self stopHelperMessageDisplayIfNeeded];
  }
}

- (void)startHelperMessageDisplayIfNeeded
{
  v64[1] = *MEMORY[0x1E4F143B8];
  if ([(UIDictationController *)self _shouldUpdateHelperMessageDisplay])
  {
    id v2 = +[UIKeyboardImpl sharedInstance];
    BOOL v3 = [v2 inputDelegate];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_24:

      return;
    }
    id v60 = v3;
    id v4 = +[UIKeyboardImpl sharedInstance];
    id v5 = [v4 textInputTraits];

    uint64_t v6 = [v5 dictationInfoKeyboardType];
    id v7 = +[UIKeyboardImpl sharedInstance];
    id v8 = [v7 currentKey];
    if (v8)
    {
      int v9 = +[UIKeyboardImpl sharedInstance];
      id v10 = [v9 currentKey];
      BOOL v11 = [v10 interactionType] == 10;
    }
    else
    {
      BOOL v11 = 0;
    }

    double v12 = +[UIKeyboard activeKeyboard];
    int v13 = [v12 isFocused];

    BOOL v14 = +[UIKeyboardInputModeController sharedInputModeController];
    long long v15 = [v14 enabledDictationLanguages];
    unint64_t v16 = [v15 count];

    if (v16 <= 1)
    {
      char v18 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v19 = [v18 preferredLocalizations];
      int v20 = [v19 firstObject];

      id v21 = +[UIDictationController sharedInstance];
      [v21 currentInputModeForDictation];
      id v57 = v3;
      BOOL v22 = v11;
      uint64_t v23 = v6;
      int v25 = v24 = v5;
      uint64_t v26 = [v25 dictationLanguage];

      int v27 = (void *)MEMORY[0x1E4F1CA20];
      v64[0] = v20;
      uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
      v63 = v26;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
      char v30 = [v27 matchedLanguagesFromAvailableLanguages:v28 forPreferredLanguages:v29];
      BOOL v17 = [v30 count] == 0;

      id v5 = v24;
      uint64_t v6 = v23;
      BOOL v11 = v22;
      BOOL v3 = v57;
    }
    else
    {
      BOOL v17 = 1;
    }
    if ((v11 | v13 ^ 1) == 1)
    {
      id v31 = v60;
      [v60 _updateHelpMessageOverrideWithMessage:0];
LABEL_23:

      goto LABEL_24;
    }
    BOOL v59 = v5;
    if (UIKeyboardTypeSupportsDictationSpelling(v6)
      || ([v5 isSecureTextEntry] & 1) != 0
      || [v5 forceSpellingDictation])
    {
      if (v17)
      {
        int v32 = @"ATV_DICTATION_SPELLING_HELP_LANGUAGE";
        BOOL v33 = @"Help text for AppleTV spelling dictation with language";
        int v34 = @"Hold %@ to spell in %@";
LABEL_16:
        uint64_t v35 = _UILocalizedString(v32, (uint64_t)v33, v34);
        BOOL v36 = +[UIDictationController sharedInstance];
        id v37 = [v36 currentInputModeForDictation];
        id v38 = [v37 dictationLanguage];

        if ([v35 hasPrefix:@"%2$@"]) {
          uint64_t v39 = 4;
        }
        else {
          uint64_t v39 = 5;
        }
        id v40 = UIKeyboardDictationDisplayNameInUILanguage(v38, v39);
        v41 = [NSString stringWithValidatedFormat:v35, @"%@ %@", 0, @"%@", v40 validFormatSpecifiers error];

        goto LABEL_22;
      }
      v42 = @"ATV_DICTATION_SPELLING_HELP";
      id v43 = @"Help text for AppleTV spelling dictation";
      long long v44 = @"Hold %@ to spell";
    }
    else
    {
      if (v17)
      {
        int v32 = @"ATV_DICTATION_GENERIC_HELP_LANGUAGE";
        BOOL v33 = @"Help text for AppleTV generic dictation with language";
        int v34 = @"Hold %@ to dictate in %@";
        goto LABEL_16;
      }
      v42 = @"ATV_DICTATION_GENERIC_HELP";
      id v43 = @"Help text for AppleTV generic dictation";
      long long v44 = @"Hold %@ to dictate";
    }
    v41 = _UILocalizedString(v42, (uint64_t)v43, v44);
LABEL_22:
    long long v45 = +[UIImage systemImageNamed:@"mic.circle.fill"];
    v58 = [v45 imageWithRenderingMode:2];

    long long v46 = [off_1E52D2EB0 textAttachmentWithImage:v58];
    long long v47 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v46];
    v48 = (void *)[v47 mutableCopy];

    uint64_t v49 = [v41 rangeOfString:@"%@"];
    uint64_t v51 = v50;
    id v52 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
    id v31 = v60;
    v53 = [v60 _placeholderColor];
    BOOL v54 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v41];
    objc_msgSend(v54, "replaceCharactersInRange:withAttributedString:", v49, v51, v48);
    uint64_t v55 = *(void *)off_1E52D2040;
    v61[0] = *(void *)off_1E52D2048;
    v61[1] = v55;
    v62[0] = v53;
    v62[1] = v52;
    uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v62 forKeys:v61 count:2];
    objc_msgSend(v54, "addAttributes:range:", v56, 0, objc_msgSend(v54, "length"));

    [v60 _updateHelpMessageOverrideWithMessage:v54];
    id v5 = v59;
    goto LABEL_23;
  }
}

- (void)stopHelperMessageDisplayIfNeeded
{
  if ([(UIDictationController *)self _shouldUpdateHelperMessageDisplay])
  {
    id v2 = +[UIKeyboardImpl sharedInstance];
    id v3 = [v2 inputDelegate];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v3 _updateHelpMessageOverrideWithMessage:0];
    }
  }
}

- (BOOL)_shouldUpdateHelperMessageDisplay
{
  if ([(id)objc_opt_class() viewMode] != 6) {
    return 1;
  }
  if ([(id)objc_opt_class() viewMode] == 6) {
    return ![(UIDictationController *)self pauseUpdatingHelperMessage];
  }
  return 0;
}

+ (BOOL)dictationInfoIsOnScreen
{
  int v2 = dictationInfoIsOnScreen_token;
  if (!dictationInfoIsOnScreen_token)
  {
    notify_register_check("com.apple.keyboard.DictationInfoIsOnScreen", &dictationInfoIsOnScreen_token);
    int v2 = dictationInfoIsOnScreen_token;
  }
  uint64_t state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

- (void)setDictationInfoOnScreenNotifyKey:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = setDictationInfoOnScreenNotifyKey__token;
  if (!setDictationInfoOnScreenNotifyKey__token)
  {
    notify_register_check("com.apple.keyboard.DictationInfoIsOnScreen", &setDictationInfoOnScreenNotifyKey__token);
    int v4 = setDictationInfoOnScreenNotifyKey__token;
  }
  uint64_t state64 = 0;
  notify_get_state(v4, &state64);
  if (((((state64 & 1) == 0) ^ v3) & 1) == 0)
  {
    uint64_t state64 = v3;
    notify_set_state(setDictationInfoOnScreenNotifyKey__token, v3);
  }
}

- (void)_createDictationPresenterWindowIfNecessary
{
  BOOL v3 = [(UIDictationController *)self dictationPresenterWindow];

  if (!v3)
  {
    int v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v5 = [v4 scene];

    uint64_t v6 = objc_alloc_init(UIApplicationRotationFollowingWindow);
    [(UIDictationController *)self setDictationPresenterWindow:v6];

    id v7 = [(UIDictationController *)self dictationPresenterWindow];
    [v7 setOpaque:0];

    id v8 = [(UIDictationController *)self dictationPresenterWindow];
    int v9 = +[UIColor clearColor];
    [v8 setBackgroundColor:v9];

    id v10 = [(UIDictationController *)self dictationPresenterWindow];
    [v10 setWindowScene:v5];

    BOOL v11 = [(UIDictationController *)self dictationPresenterWindow];
    [v11 setWindowLevel:2000.0];

    double v12 = [(UIDictationController *)self dictationPresenterWindow];
    [v12 setHidden:1];

    int v13 = objc_alloc_init(UIApplicationRotationFollowingController);
    [(UIApplicationRotationFollowingController *)v13 setSizesWindowToScene:1];
    BOOL v14 = [(UIDictationController *)self dictationPresenterWindow];
    [v14 setRootViewController:v13];
  }
  id v16 = [(UIDictationController *)self dictationPresenterWindow];
  long long v15 = [(id)UIApp keyWindow];
  objc_msgSend(v16, "_setSecure:", objc_msgSend(v15, "_isSecure"));
}

- (void)_logEnablementPromtMetricsWithStartDate:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  [v5 timeIntervalSinceDate:v4];
  double v7 = v6;

  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  id v8 = (void *)getSISchemaUEIDictationEnablementPromptShownClass_softClass;
  uint64_t v18 = getSISchemaUEIDictationEnablementPromptShownClass_softClass;
  if (!getSISchemaUEIDictationEnablementPromptShownClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getSISchemaUEIDictationEnablementPromptShownClass_block_invoke;
    v14[3] = &unk_1E52D9900;
    v14[4] = &v15;
    __getSISchemaUEIDictationEnablementPromptShownClass_block_invoke((uint64_t)v14);
    id v8 = (void *)v16[3];
  }
  int v9 = v8;
  _Block_object_dispose(&v15, 8);
  id v10 = objc_alloc_init(v9);
  objc_msgSend(v10, "setIsDictationEnabled:", -[UIDictationController enablementLoggingIsDictationEnabled](self, "enablementLoggingIsDictationEnabled"));
  objc_msgSend(v10, "setIsLearnMoreButtonClicked:", -[UIDictationController enablementLoggingIsLearnMoreButtonClicked](self, "enablementLoggingIsLearnMoreButtonClicked"));
  [v10 setPromptVisibilityDurationInMs:(uint64_t)(v7 * 1000.0)];
  BOOL v11 = [getAFAnalyticsClass() sharedAnalytics];
  double v12 = (void *)[v11 newTurnBasedInstrumentationContext];

  [v12 emitInstrumentation:v10];
  if ([(UIDictationController *)self enablementLoggingIsDictationEnabled]) {
    int v13 = v12;
  }
  else {
    int v13 = 0;
  }
  objc_storeStrong((id *)&self->_enablementInstrumentationContext, v13);
}

- (void)_presentEnablementAndDataSharingPromptIfNeeded:(id)a3
{
  id v4 = a3;
  [(UIDictationController *)self setEnablementLoggingIsDictationEnabled:0];
  [(UIDictationController *)self setEnablementLoggingIsLearnMoreButtonClicked:0];
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  char v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 0;
  double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"UIKeyboardWillPresentDictationEnablementPromptNotification" object:0];

  double v7 = +[UIDictationConnectionPreferences sharedInstance];
  char v8 = [v7 suppressDataSharingOptIn];

  int v9 = objc_alloc_init(DispatchGroupWrapper);
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v10 = +[UIPeripheralHost sharedInstance];
    [v10 setDeactivatedKeyboard:1 forScene:0];
  }
  else
  {
    id v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    BOOL v11 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v10 _preserveInputViewsWithId:v11 animated:1];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke;
  v22[3] = &unk_1E52FA960;
  v22[4] = self;
  v22[5] = v27;
  v22[6] = v25;
  [(DispatchGroupWrapper *)v9 executeWithDispatchGroup:v22];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_3;
  v15[3] = &unk_1E52FAA00;
  char v21 = v8;
  uint64_t v19 = v27;
  v15[4] = self;
  id v12 = v5;
  id v16 = v12;
  id v13 = v4;
  id v18 = v13;
  BOOL v14 = v9;
  uint64_t v17 = v14;
  int v20 = v23;
  [(DispatchGroupWrapper *)v14 notify:v15];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_2;
  v6[3] = &unk_1E52FA938;
  long long v8 = *(_OWORD *)(a1 + 40);
  void v6[4] = v4;
  id v7 = v3;
  id v5 = v3;
  [v4 _presentAlertForDictationInputModeOfType:1 completionHandler:v6];
}

uint64_t __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_2(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  [*(id *)(a1 + 32) setEnablementLoggingIsDictationEnabled:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v5();
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) || *(unsigned char *)(a1 + 80))
  {
    int v2 = *(void **)(a1 + 48);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_4;
    v18[3] = &unk_1E52FA9B0;
    uint64_t v3 = *(void *)(a1 + 72);
    v18[4] = *(void *)(a1 + 32);
    v18[5] = v3;
    [v2 executeWithDispatchGroup:v18];
    id v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_6;
    v14[3] = &unk_1E52FA9D8;
    long long v17 = *(_OWORD *)(a1 + 64);
    v14[4] = *(void *)(a1 + 32);
    id v15 = v4;
    id v16 = *(id *)(a1 + 56);
    [v5 notify:v14];
  }
  else
  {
    [*(id *)(a1 + 32) _logEnablementPromtMetricsWithStartDate:*(void *)(a1 + 40)];
    double v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"UIKeyboardDidFinishPresentingDictationEnablementPromptNotification" object:0];

    if (+[UIKeyboard isKeyboardProcess])
    {
      id v7 = +[UIPeripheralHost sharedInstance];
      [v7 setDeactivatedKeyboard:0 forScene:0];
    }
    else
    {
      id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      long long v8 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
      [v7 _restoreInputViewsWithId:v8 animated:1];
    }
    if ([*(id *)(a1 + 32) shouldSuppressSoftwareKeyboard])
    {
      int v9 = +[UIKeyboardImpl activeInstance];
      [v9 setKeyboardMinimizedByDictation:0];

      id v10 = +[UIKeyboardImpl activeInstance];
      BOOL v11 = [v10 inputDelegate];
      [v11 resignFirstResponder];
    }
    uint64_t v12 = *(void *)(a1 + 56);
    if (v12)
    {
      id v13 = *(void (**)(void))(v12 + 16);
      v13();
    }
  }
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if ([*(id *)(a1 + 32) dataSharingDecided])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v3[2](v3);
  }
  else
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    void v5[2] = __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_5;
    v5[3] = &unk_1E52FA988;
    id v4 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    double v6 = v3;
    [v4 _presentAlertForDictationInputModeOfType:2 completionHandler:v5];
  }
}

uint64_t __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_5(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__UIDictationController__presentEnablementAndDataSharingPromptIfNeeded___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    BOOL v2 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }
  else {
    BOOL v2 = 0;
  }
  [*(id *)(a1 + 32) _logEnablementPromtMetricsWithStartDate:*(void *)(a1 + 40)];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIKeyboardDidFinishPresentingDictationEnablementPromptNotification" object:0];

  if (+[UIKeyboard isKeyboardProcess])
  {
    id v4 = +[UIPeripheralHost sharedInstance];
    [v4 setDeactivatedKeyboard:0 forScene:0];
  }
  else
  {
    id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v5 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(a1 + 32)];
    [v4 _restoreInputViewsWithId:v5 animated:1];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(void (**)(void))(v6 + 16);
    v7();
  }
  else
  {
    if (!v2) {
      return;
    }
    if ([(id)objc_opt_class() shouldForwardInInputSystemUI]) {
      goto LABEL_19;
    }
    long long v8 = +[UIKeyboardImpl activeInstance];
    int v9 = [v8 delegate];

    if (!v9) {
      return;
    }
    if (_MergedGlobals_33_1[0] != 1)
    {
LABEL_19:
      byte_1EB25A972 = 1;
    }
    else if (!*(void *)(a1 + 48))
    {
      id v10 = *(void **)(a1 + 32);
      [v10 switchToDictationInputMode];
    }
  }
}

- (void)_endEnableDictationPromptAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4FAE270] dismissEnableDictationPrompt];
  id v5 = [(UIDictationController *)self dictationPrivacySheetController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __59__UIDictationController__endEnableDictationPromptAnimated___block_invoke;
  v6[3] = &unk_1E52D9F70;
  void v6[4] = self;
  [v5 dismissViewControllerAnimated:v3 completion:v6];
}

uint64_t __59__UIDictationController__endEnableDictationPromptAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePrivacySheetDismissal];
}

- (void)presentAlertOfType:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  v41[0] = 0;
  v41[1] = v41;
  void v41[2] = 0x2020000000;
  char v42 = 0;
  BOOL v7 = +[UIKeyboard isKeyboardProcess];
  long long v8 = &xmmword_186B92000;
  if (v7)
  {
    int v9 = 0;
  }
  else
  {
    id v10 = [(id)UIApp keyWindow];
    BOOL v11 = [v10 firstResponder];
    uint64_t v12 = [v11 inputAccessoryView];
    id v13 = [v11 inputAccessoryViewController];
    *(void *)buf = 0;
    id v38 = buf;
    uint64_t v39 = 0x2020000000;
    char v40 = 0;
    BOOL v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v15 = [MEMORY[0x1E4F28F08] mainQueue];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke;
    v29[3] = &unk_1E52FAA50;
    uint64_t v35 = buf;
    id v16 = v10;
    id v30 = v16;
    id v17 = v11;
    id v31 = v17;
    id v18 = v12;
    id v32 = v18;
    id v19 = v13;
    BOOL v36 = v41;
    id v33 = v19;
    int v34 = self;
    int v9 = [v14 addObserverForName:@"UIWindowFirstResponderDidChangeNotification" object:v16 queue:v15 usingBlock:v29];

    _Block_object_dispose(buf, 8);
    long long v8 = &xmmword_186B92000;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = *((void *)v8 + 137);
  aBlock[2] = __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_3;
  aBlock[3] = &unk_1E52FAA78;
  aBlock[4] = self;
  char v28 = v41;
  id v20 = v9;
  id v26 = v20;
  id v21 = v6;
  id v27 = v21;
  BOOL v22 = _Block_copy(aBlock);
  if (a3 == 2)
  {
    [(UIDictationController *)self _presentDataSharingOptInAlertWithCompletion:v22];
  }
  else if (a3 == 1)
  {
    [(UIDictationController *)self _presentOptInAlertWithCompletion:v22];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    char v24 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v24, OS_LOG_TYPE_FAULT, "Asking to present a Dictation Alert for a type that doesn't exist", buf, 2u);
    }
  }
  else
  {
    uint64_t v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &presentAlertOfType_withCompletion____s_category) + 8);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Asking to present a Dictation Alert for a type that doesn't exist", buf, 2u);
    }
  }

  _Block_object_dispose(v41, 8);
}

void __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_2;
    block[3] = &unk_1E52FAA28;
    id v6 = *(id *)(a1 + 32);
    id v7 = *(id *)(a1 + 40);
    id v8 = *(id *)(a1 + 48);
    id v3 = *(id *)(a1 + 56);
    uint64_t v4 = *(void *)(a1 + 64);
    id v9 = v3;
    uint64_t v10 = v4;
    int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
    dispatch_after(0, MEMORY[0x1E4F14428], block);
  }
}

void __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_2(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) firstResponder];
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqual:") & 1) == 0)
  {
    BOOL v2 = *(void **)(a1 + 48);
    id v3 = [v6 inputAccessoryView];
    if ([v2 isEqual:v3])
    {
    }
    else
    {
      uint64_t v4 = *(void **)(a1 + 56);
      id v5 = [v6 inputAccessoryViewController];
      LOBYTE(v4) = [v4 isEqual:v5];

      if ((v4 & 1) == 0)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        [*(id *)(a1 + 64) _endEnableDictationPromptAnimated:0];
      }
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
}

void __59__UIDictationController_presentAlertOfType_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  int8x16_t v11 = a2;
  [*(id *)(a1 + 32) setDictationInfoOnScreenNotifyKey:0];
  id v3 = [*(id *)(a1 + 32) presentingWindowForPrivacySheet];
  [v3 resignKeyWindow];

  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
  {
    uint64_t v4 = [*(id *)(a1 + 32) dictationPresenterWindow];
    id v5 = [v4 subviews];
    id v6 = [v5 objectAtIndex:0];
    [v6 removeFromSuperview];
  }
  id v7 = [*(id *)(a1 + 32) presentingWindowForPrivacySheet];
  [v7 setHidden:1];

  [*(id *)(a1 + 32) setDictationPresenterWindow:0];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v8 = (void *)MEMORY[0x1E4F1CC28];
  }
  else
  {
    id v8 = v11[2]();
  }
  if (*(void *)(a1 + 40))
  {
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:*(void *)(a1 + 40)];
  }
  if (v8)
  {
    uint64_t v10 = *(void *)(a1 + 48);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, [v8 BOOLValue]);
    }
  }
}

- (BOOL)shouldPresentOptInAlert
{
  BOOL v2 = +[UIDictationConnectionPreferences sharedInstance];
  char v3 = [v2 dictationIsEnabled] ^ 1;

  return v3;
}

- (void)_presentOptInAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FAE270];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke;
  v7[3] = &unk_1E52FAAC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 promptToEnableDictationWithCompletionHandler:v7];
}

void __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_2;
  block[3] = &unk_1E52E5448;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_2(void *a1)
{
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_3;
  uint64_t v6 = &unk_1E52FAAA0;
  uint64_t v1 = (void (**)(void))a1[5];
  uint64_t v2 = a1[4];
  uint64_t v9 = a1[6];
  uint64_t v7 = v2;
  id v8 = v1;
  v1[2]();
}

id __58__UIDictationController__presentOptInAlertWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  if (v1 == 2)
  {
    [*(id *)(a1 + 32) setEnablementLoggingIsLearnMoreButtonClicked:1];
    [*(id *)(a1 + 32) _presentPrivacySheetForType:1 completion:*(void *)(a1 + 40)];
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [NSNumber numberWithInt:v1 == 1];
  }
  return v3;
}

- (void)_presentDataSharingOptInAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FAE270];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke;
  v7[3] = &unk_1E52EA988;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 promptToEnableDataSharingWithCompletionHandler:v7];
}

void __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke_2;
  block[3] = &unk_1E52DC8B0;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v6 = a2;
  void block[4] = v2;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke_2(void *a1)
{
  if (a1[6] == 2)
  {
    uint64_t v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    return [v2 _presentPrivacySheetForType:2 completion:v3];
  }
  else
  {
    uint64_t v5 = [objc_alloc(NSNumber) initWithBool:1];
    uint64_t v6 = (void *)qword_1EB25A990;
    qword_1EB25A990 = v5;

    uint64_t v7 = *(uint64_t (**)(void))(a1[5] + 16);
    return v7();
  }
}

uint64_t __69__UIDictationController__presentDataSharingOptInAlertWithCompletion___block_invoke_3()
{
  return MEMORY[0x1E4F1CC38];
}

- (void)_presentAlertForDictationInputModeOfType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, uint64_t, void))a4;
  if (a3 == 1
    && (+[UIDictationConnectionPreferences sharedInstance](UIDictationConnectionPreferences, "sharedInstance"), uint64_t v7 = objc_claimAutoreleasedReturnValue(), v8 = [v7 dictationIsEnabled], v7, v8))
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __84__UIDictationController__presentAlertForDictationInputModeOfType_completionHandler___block_invoke;
    v9[3] = &unk_1E52FAB10;
    int64_t v11 = a3;
    uint64_t v10 = v6;
    [(UIDictationController *)self presentAlertOfType:a3 withCompletion:v9];
  }
}

uint64_t __84__UIDictationController__presentAlertForDictationInputModeOfType_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40) == 1);
}

- (id)presentingViewControllerForPrivacySheet
{
  uint64_t v2 = [(UIDictationController *)self dictationPresenterWindow];
  uint64_t v3 = [v2 rootViewController];

  return v3;
}

- (void)_presentPrivacySheetForType:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  [(UIDictationController *)self _createDictationPresenterWindowIfNecessary];
  uint64_t v7 = _Block_copy(v6);

  id privacySheetDismissalHandler = self->_privacySheetDismissalHandler;
  self->_id privacySheetDismissalHandler = v7;

  uint64_t v9 = [_UIDictationPrivacySheetController alloc];
  if (a3 == 1)
  {
    uint64_t v10 = [(_UIDictationPrivacySheetController *)v9 initWithType:1];
  }
  else
  {
    uint64_t v23 = [(_UIDictationPrivacySheetController *)v9 initWithType:2];
    [(_UIDictationPrivacySheetController *)v23 setPresentationDelegate:self];
    uint64_t v10 = (uint64_t)v23;
  }
  id v24 = (id)v10;
  [(UIDictationController *)self setDictationPrivacySheetController:v10];
  int64_t v11 = [(UIDictationController *)self dictationPrivacySheetController];
  [v11 setPrivacyDelegate:self];

  uint64_t v12 = [(UIDictationController *)self dictationPrivacySheetController];
  id v13 = [v12 presentationController];
  [v13 setDelegate:self];

  BOOL v14 = [(UIDictationController *)self presentingWindowForPrivacySheet];
  [v14 makeKeyAndVisible];

  if (+[UIDictationUtilities _isUsingLargeFormatDictationUI])
  {
    id v15 = [(UIDictationController *)self presentingWindowForPrivacySheet];
    id v16 = [UIVisualEffectView alloc];
    id v17 = +[UIBlurEffect effectWithStyle:1];
    id v18 = [(UIVisualEffectView *)v16 initWithEffect:v17];

    [v15 bounds];
    -[UIView setFrame:](v18, "setFrame:");
    [v15 insertSubview:v18 atIndex:0];
  }
  if (a3 == 1)
  {
    id v19 = [v24 privacyPresenter];
    id v20 = [(UIDictationController *)self presentingViewControllerForPrivacySheet];
    [v19 setPresentingViewController:v20];

    id v21 = [v24 privacyPresenter];
    [v21 present];
  }
  else
  {
    id v21 = [(UIDictationController *)self presentingViewControllerForPrivacySheet];
    BOOL v22 = [(UIDictationController *)self dictationPrivacySheetController];
    [v21 presentViewController:v22 animated:1 completion:0];
  }
  [(UIDictationController *)self setDictationInfoOnScreenNotifyKey:1];
}

- (void)dictationPrivacySheetControllerDidFinish:(id)a3
{
  id v4 = [(UIDictationController *)self presentingViewControllerForPrivacySheet];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke;
  v5[3] = &unk_1E52D9F70;
  void v5[4] = self;
  [v4 dismissViewControllerAnimated:1 completion:v5];
}

void __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke_2;
  block[3] = &unk_1E52D9F70;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __66__UIDictationController_dictationPrivacySheetControllerDidFinish___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePrivacySheetDismissal];
}

- (void)_handlePrivacySheetDismissal
{
  uint64_t v3 = [(UIDictationController *)self dictationPrivacySheetController];
  uint64_t v4 = [v3 sheetType];

  [(UIDictationController *)self setDictationPrivacySheetController:0];
  id privacySheetDismissalHandler = self->_privacySheetDismissalHandler;
  if (privacySheetDismissalHandler)
  {
    BOOL v6 = v4 == 1;
    uint64_t v7 = _Block_copy(privacySheetDismissalHandler);
    id v8 = self->_privacySheetDismissalHandler;
    self->_id privacySheetDismissalHandler = 0;

    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    id v13 = __53__UIDictationController__handlePrivacySheetDismissal__block_invoke;
    BOOL v14 = &unk_1E52FAB38;
    BOOL v17 = v6;
    id v15 = self;
    id v16 = v7;
    uint64_t v9 = (void (*)(void))v7[2];
    uint64_t v10 = v7;
    v9();
  }
}

uint64_t __53__UIDictationController__handlePrivacySheetDismissal__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48) && ([(id)UIApp isSuspended] & 1) == 0)
  {
    [*(id *)(a1 + 32) _presentOptInAlertWithCompletion:*(void *)(a1 + 40)];
    return 0;
  }
  else
  {
    uint64_t v2 = [objc_alloc(NSNumber) initWithBool:1];
    uint64_t v3 = (void *)qword_1EB25A990;
    qword_1EB25A990 = v2;

    [MEMORY[0x1E4FAE270] dismissedDataSharingWithResponse:0];
    return MEMORY[0x1E4F1CC38];
  }
}

- (void)_handleDataSharingSheetDecision
{
  [(UIDictationController *)self setDictationPrivacySheetController:0];
  id privacySheetDismissalHandler = self->_privacySheetDismissalHandler;
  if (privacySheetDismissalHandler)
  {
    uint64_t v5 = (void (**)(id, void *))_Block_copy(privacySheetDismissalHandler);
    id v4 = self->_privacySheetDismissalHandler;
    self->_id privacySheetDismissalHandler = 0;

    v5[2](v5, &__block_literal_global_917);
  }
}

uint64_t __56__UIDictationController__handleDataSharingSheetDecision__block_invoke()
{
  return MEMORY[0x1E4F1CC38];
}

- (void)_touchPhaseChangedForTouch:(id)a3
{
  uint64_t v4 = [a3 phase];
  if ((unint64_t)(v4 - 3) <= 1)
  {
    if (v4 == 3)
    {
      self->_reasonType = 7;
      [(UIDictationController *)self stopDictation];
    }
    else
    {
      [(UIDictationController *)self cancelDictation];
    }
    id v6 = +[UIKeyboardImpl activeInstance];
    uint64_t v5 = [(UIDictationController *)self keyboardInputModeToReturn];
    [v6 setKeyboardInputMode:v5 userInitiated:0];
  }
}

- (void)switchToDictationInputMode
{
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    id v3 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v3, "forwardDictationEvent_switchToDictationInputModeWithOptions:", 0);
  }
  else
  {
    [(UIDictationController *)self switchToDictationInputModeWithTouch:0 options:0];
  }
}

- (void)switchToDictationInputModeWithOptions:(id)a3
{
  id v5 = a3;
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    uint64_t v4 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v4, "forwardDictationEvent_switchToDictationInputModeWithOptions:", v5);
  }
  else
  {
    [(UIDictationController *)self switchToDictationInputModeWithTouch:0 options:v5];
  }
}

- (_NSRange)_getRangeOfString:(id)a3 inDocumentText:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[a4 mutableCopy];
  uint64_t v7 = (void *)[v5 mutableCopy];

  if (qword_1EB25A9B0 != -1) {
    dispatch_once(&qword_1EB25A9B0, &__block_literal_global_919);
  }
  id v8 = (void *)qword_1EB25A9A8;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __58__UIDictationController__getRangeOfString_inDocumentText___block_invoke_934;
  id v19 = &unk_1E52FAB60;
  id v20 = v6;
  id v21 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateKeysAndObjectsUsingBlock:&v16];
  uint64_t v11 = objc_msgSend(v10, "rangeOfString:", v9, v16, v17, v18, v19);
  NSUInteger v13 = v12;

  NSUInteger v14 = v11;
  NSUInteger v15 = v13;
  result.length = v15;
  result.id location = v14;
  return result;
}

void __58__UIDictationController__getRangeOfString_inDocumentText___block_invoke()
{
  v3[4] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1ED3F4BF0;
  v2[1] = &unk_1ED3F4C20;
  v3[0] = &unk_1ED3F4C08;
  v3[1] = &unk_1ED3F4C08;
  v2[2] = &unk_1ED3F4C38;
  v2[3] = &unk_1ED3F4C68;
  v3[2] = &unk_1ED3F4C50;
  v3[3] = &unk_1ED3F4C50;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:4];
  uint64_t v1 = (void *)qword_1EB25A9A8;
  qword_1EB25A9A8 = v0;
}

uint64_t __58__UIDictationController__getRangeOfString_inDocumentText___block_invoke_934(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  objc_msgSend(v5, "_replaceOccurrencesOfCharacter:withCharacter:", objc_msgSend(v7, "longValue"), objc_msgSend(v6, "longValue"));
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [v7 longValue];

  uint64_t v10 = [v6 longValue];
  return [v8 _replaceOccurrencesOfCharacter:v9 withCharacter:v10];
}

- (void)cancelDictation
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    id v55 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v55, "forwardDictationEvent_cancelDictation");
  }
  else
  {
    [(UIDictationController *)self resetAdaptiveDeleteActivationLogic];
    objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController cancelDictation]");

    if ([(UIDictationController *)self isIgnoringDocumentChanges]
      && !self->_deferredCancellationRequested
      && !self->_recievingResults)
    {
      id v3 = UIKeyboardGetCurrentInputMode();
      uint64_t v4 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
    id v5 = _UIDictationControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [(UIDictationController *)self state];
      unint64_t reasonType = self->_reasonType;
      id v8 = [(id)objc_opt_class() UIDictationStartStopReasonTypeDescription:reasonType];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[UIDictationController cancelDictation]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v6;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = reasonType;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v8;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%s State: %d, reason: %lu, reason string: %@", buf, 0x26u);
    }
    if ([(UIDictationController *)self state]
      && (![(UIDictationController *)self isIgnoringDocumentChanges]
       || self->_deferredCancellationRequested))
    {
      uint64_t v9 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];

      if (v9)
      {
        uint64_t v10 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
        unint64_t v11 = 3;
      }
      else
      {
        NSUInteger v12 = [(UIDictationController *)self detectedLanguage];

        if (v12)
        {
          uint64_t v10 = [(UIDictationController *)self detectedLanguage];
          unint64_t v11 = 4;
        }
        else
        {
          NSUInteger v13 = [(UIDictationController *)self initialDictationLanguage];

          if (v13)
          {
            uint64_t v10 = [(UIDictationController *)self initialDictationLanguage];
            unint64_t v11 = [(UIDictationController *)self dictationSourceType];
          }
          else
          {
            unint64_t v11 = 0;
            uint64_t v10 = &stru_1ED0E84C0;
          }
        }
      }
      NSUInteger v14 = [(id)objc_opt_class() UIDictationLanguageSourceType:v11];
      NSUInteger v15 = [getAFAnalyticsClass() sharedAnalytics];
      v60[0] = @"cancelDictation";
      uint64_t v16 = objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonTypeDescription:", -[UIDictationController reasonType](self, "reasonType"));
      v61[0] = v16;
      v60[1] = @"dictationState";
      uint64_t v17 = objc_msgSend((id)objc_opt_class(), "stringForState:", -[UIDictationController state](self, "state"));
      v61[1] = v17;
      v60[2] = @"isReceivingResults";
      BOOL v18 = [(UIDictationController *)self isRecievingResults];
      uint64_t v19 = MEMORY[0x1E4F1CC28];
      uint64_t v20 = MEMORY[0x1E4F1CC38];
      if (v18) {
        uint64_t v21 = MEMORY[0x1E4F1CC38];
      }
      else {
        uint64_t v21 = MEMORY[0x1E4F1CC28];
      }
      void v61[2] = v21;
      v60[3] = @"lastRecognitionText";
      BOOL v22 = [(UIDictationController *)self lastRecognitionText];
      if (v22) {
        uint64_t v23 = v20;
      }
      else {
        uint64_t v23 = v19;
      }
      v61[3] = v23;
      v60[4] = @"dictationLanguage";
      v60[5] = @"dictationLanguageSource";
      v61[4] = v10;
      v61[5] = v14;
      v60[6] = @"keyboardLocaleIdentifier";
      id v24 = [(UIDictationController *)self currentKeyboardPrimaryLanguage];
      v61[6] = v24;
      v60[7] = @"dictationUIInteractionIdentifier";
      uint64_t v25 = [(UIDictationController *)self interactionIdentifier];
      id v26 = (void *)v25;
      id v27 = &stru_1ED0E84C0;
      if (v25) {
        id v27 = (__CFString *)v25;
      }
      v61[7] = v27;
      char v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v61 forKeys:v60 count:8];
      [v15 logEventWithType:1403 context:v28];

      uint64_t v56 = 0;
      id v57 = &v56;
      uint64_t v58 = 0x2050000000;
      uint64_t v29 = (void *)getSISchemaDictationEndPointCancelClass_softClass;
      uint64_t v59 = getSISchemaDictationEndPointCancelClass_softClass;
      if (!getSISchemaDictationEndPointCancelClass_softClass)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&uint8_t buf[16] = __getSISchemaDictationEndPointCancelClass_block_invoke;
        *(void *)&unsigned char buf[24] = &unk_1E52D9900;
        *(void *)&buf[32] = &v56;
        __getSISchemaDictationEndPointCancelClass_block_invoke((uint64_t)buf);
        uint64_t v29 = (void *)v57[3];
      }
      id v30 = v29;
      _Block_object_dispose(&v56, 8);
      id v31 = objc_alloc_init(v30);
      objc_msgSend(v31, "setDictationEndPointType:", objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonToInstrumentationDictationEndPointType:", self->_reasonType));
      [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v31];
      self->_deferredCancellationRequested = 0;
      id v32 = +[UIKeyboardImpl activeInstance];
      id v33 = [v32 inputDelegateManager];

      char v34 = [v33 hasAsyncCapableInputDelegate];
      uint64_t v35 = [v33 keyInputDelegate];

      if (v35) {
        char v36 = v34;
      }
      else {
        char v36 = 1;
      }
      if ((v36 & 1) == 0)
      {
        id v37 = [(UIDictationController *)self lastHypothesis];
        if (v37)
        {
          id v38 = [(UIDictationController *)self targetHypothesis];
          BOOL v39 = v38 == 0;

          if (!v39)
          {
            char v40 = [(UIDictationController *)self lastHypothesis];
            v41 = [(UIDictationController *)self _hypothesisRangeFromSelectionRange:0 inputDelegateManager:v33 forHypothesis:v40];

            char v42 = +[UIDictationLandingView activeInstance];
            id v43 = [v42 superview];
            BOOL v44 = v43 == 0;

            if (!v44)
            {
              uint64_t v45 = [(UIDictationController *)self _rangeByExtendingRange:v41 backward:+[UIDictationLandingView fallbackPlaceholderLength] forward:0 inputDelegateManager:v33];

              v41 = (void *)v45;
            }
            long long v46 = [v33 textInRange:v41];
            if (v46)
            {
              long long v47 = [(UIDictationController *)self lastHypothesis];
              if (v47)
              {
                v48 = [(UIDictationController *)self lastHypothesis];
                BOOL v49 = [(UIDictationController *)self _getRangeOfString:v48 inDocumentText:v46] == 0x7FFFFFFFFFFFFFFFLL;

                if (v49)
                {
                  [(UIDictationController *)self setTargetHypothesis:0];
                  [(UIDictationController *)self setLastHypothesis:0];
                  [(UIDictationController *)self setPendingEdits:0];
                  [(UIDictationController *)self _stopStreamingAnimation];
                }
              }
            }
          }
        }
      }
      [(UIDictationController *)self _setupHypothesisAsFinalResults];
      if ([(UIDictationController *)self state] == 2)
      {
        uint64_t v50 = [v33 _textSelectingContainer];
        if (objc_opt_respondsToSelector()) {
          [v50 dictationRecordingDidEnd];
        }
        if (!self->_recievingResults)
        {
          uint64_t v51 = UIKeyboardGetCurrentInputMode();
          id v52 = TIStatisticGetKeyForInputMode();
          TIStatisticScalarIncrement();
        }
      }
      v53 = [(UIDictationController *)self dictationConnection];
      [v53 cancelSpeech];

      [(UIDictationController *)self setState:0];
      [(UIDictationController *)self cancelRecordingLimitTimer];
      [(UIDictationController *)self switchToKeyboardInputModeIfNeeded];
      [(UIDictationController *)self postNotificationName:@"UIDictationControllerDictationDidFinish" userInfo:0];
      [(UIDictationController *)self setCurrentKeyboardPrimaryLanguage:&stru_1ED0E84C0];
      BOOL v54 = _UIDictationControllerUndoRedoLog();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[UIDictationController cancelDictation]";
        _os_log_impl(&dword_1853B0000, v54, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", buf, 0xCu);
      }

      [(UIDictationController *)self _endUndoGroupingIfNecessary];
    }
  }
}

- (void)stopDictation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    id v43 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v43, "forwardDictationEvent_stopDictation:", v3);

    return;
  }
  [(UIDictationController *)self resetAdaptiveDeleteActivationLogic];
  id v5 = +[UIDictationController sharedInstance];
  if ([v5 reasonType] == 15)
  {

LABEL_8:
    id v8 = +[UIDictationController sharedInstance];
    uint64_t v9 = [v8 dictationTipController];
    [v9 triggerModelessInputTipDictationStoppedSignal];

    goto LABEL_9;
  }
  int v6 = +[UIDictationController sharedInstance];
  uint64_t v7 = [v6 reasonType];

  if (v7 == 1) {
    goto LABEL_8;
  }
LABEL_9:
  if ([(UIDictationController *)self state] == 1 || [(UIDictationController *)self state] == 2)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController stopDictation:]");

    uint64_t v10 = _UIDictationControllerLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(UIDictationController *)self state];
      unint64_t reasonType = self->_reasonType;
      NSUInteger v13 = [(id)objc_opt_class() UIDictationStartStopReasonTypeDescription:reasonType];
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[UIDictationController stopDictation:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = reasonType;
      *(_WORD *)&buf[28] = 2112;
      *(void *)&buf[30] = v13;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "%s State: %d, reason: %lu, reason string: %@", buf, 0x26u);
    }
    NSUInteger v14 = +[UIKeyboardImpl activeInstance];
    NSUInteger v15 = [v14 inputDelegateManager];
    uint64_t v16 = [v15 _textSelectingContainer];

    if (objc_opt_respondsToSelector()) {
      [v16 dictationRecordingDidEnd];
    }
    if ((self->_reasonType | 8) == 0x19) {
      BOOL v44 = self->_lastHypothesis;
    }
    else {
      BOOL v44 = 0;
    }
    if ([(id)objc_opt_class() viewMode])
    {
      BOOL v17 = +[UIDictationUtilities _isUsingLargeFormatDictationUI];
      uint64_t v18 = 2;
      if (!v17) {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 1;
    }
    uint64_t v42 = v18;
    uint64_t v19 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];

    if (v19)
    {
      uint64_t v20 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
      unint64_t v21 = 3;
    }
    else
    {
      BOOL v22 = [(UIDictationController *)self detectedLanguage];

      if (v22)
      {
        uint64_t v20 = [(UIDictationController *)self detectedLanguage];
        unint64_t v21 = 4;
      }
      else
      {
        uint64_t v23 = [(UIDictationController *)self initialDictationLanguage];

        if (v23)
        {
          uint64_t v20 = [(UIDictationController *)self initialDictationLanguage];
          unint64_t v21 = [(UIDictationController *)self dictationSourceType];
        }
        else
        {
          unint64_t v21 = 0;
          uint64_t v20 = &stru_1ED0E84C0;
        }
      }
    }
    id v24 = +[UIDictationController sharedInstance];
    [v24 dismissSoftwareKeyboardIfNeeded];

    uint64_t v25 = +[UIKeyboardImpl activeInstance];
    int v26 = [v25 _hasMarkedText];

    if (v26)
    {
      id v27 = +[UIKeyboardImpl activeInstance];
      [v27 acceptAutocorrectionWithCompletionHandler:0];
    }
    char v28 = [(id)objc_opt_class() UIDictationLanguageSourceType:v21];
    uint64_t v29 = [getAFAnalyticsClass() sharedAnalytics];
    v49[0] = @"stopDictation";
    id v30 = +[UIDictationController UIDictationStartStopReasonTypeDescription:self->_reasonType];
    v50[0] = v30;
    v50[1] = v20;
    v49[1] = @"dictationLanguage";
    v49[2] = @"dictationLanguageSource";
    v50[2] = v28;
    v49[3] = @"keyboardLocaleIdentifier";
    id v31 = [(UIDictationController *)self currentKeyboardPrimaryLanguage];
    v50[3] = v31;
    v49[4] = @"dictationUIInteractionIdentifier";
    uint64_t v32 = [(UIDictationController *)self interactionIdentifier];
    id v33 = (void *)v32;
    char v34 = &stru_1ED0E84C0;
    if (v32) {
      char v34 = (__CFString *)v32;
    }
    v50[4] = v34;
    uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:5];
    [v29 logEventWithType:1405 context:v35];

    uint64_t v45 = 0;
    long long v46 = &v45;
    uint64_t v47 = 0x2050000000;
    char v36 = (void *)getSISchemaDictationEndPointStopClass_softClass;
    uint64_t v48 = getSISchemaDictationEndPointStopClass_softClass;
    if (!getSISchemaDictationEndPointStopClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __getSISchemaDictationEndPointStopClass_block_invoke;
      *(void *)&unsigned char buf[24] = &unk_1E52D9900;
      *(void *)&buf[32] = &v45;
      __getSISchemaDictationEndPointStopClass_block_invoke((uint64_t)buf);
      char v36 = (void *)v46[3];
    }
    id v37 = v36;
    _Block_object_dispose(&v45, 8);
    id v38 = objc_alloc_init(v37);
    objc_msgSend(v38, "setDictationEndPointType:", objc_msgSend((id)objc_opt_class(), "UIDictationStartStopReasonToInstrumentationDictationEndPointType:", self->_reasonType));
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v38];
    BOOL v39 = [(UIDictationController *)self dictationConnection];
    char v40 = +[UIDictationController UIDictationStartStopReasonTypeDescription:self->_reasonType];
    [v39 stopSpeech:v40 activationType:v42 result:v44 suppressAlert:v3 ^ 1];

    v41 = [(UIDictationController *)self dictationTipController];
    [v41 setDismissalReasonType:1];

    [(UIDictationController *)self setState:3];
    [(UIDictationController *)self cancelRecordingLimitTimer];
    [(UIDictationController *)self setCurrentKeyboardPrimaryLanguage:&stru_1ED0E84C0];
    if ([(id)objc_opt_class() viewMode] == 6) {
      [(UIDictationController *)self _displaySecureContentsAsPlainText:0 afterDelay:2.0];
    }
    [(UIDictationController *)self clearKeyboardTrackpadModeIfNeeded];
  }
}

- (void)stopDictationIgnoreFinalizePhrases:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    id v14 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v14, "forwardDictationEvent_stopDictationIgnoreFinalizePhrases");
  }
  else
  {
    [(UIDictationController *)self setIgnoreFinalizePhrases:1];
    if (+[UIDictationController isRunning]) {
      unint64_t v5 = [(UIDictationController *)self specificReasonTypeFromApplicationDuringDictation];
    }
    else {
      unint64_t v5 = 18;
    }
    int v6 = +[UIDictationController sharedInstance];
    [v6 setReasonType:v5];

    uint64_t v7 = _UIDictationControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(UIDictationController *)self lastHypothesis];
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[UIDictationController stopDictationIgnoreFinalizePhrases:]";
      __int16 v17 = 2112;
      uint64_t v18 = v8;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s Last hypothesis: \"%@\"", buf, 0x16u);
    }
    uint64_t v9 = +[UIKeyboardImpl activeInstance];
    uint64_t v10 = [v9 textInputTraits];
    uint64_t v11 = [v10 keyboardType];

    if (v11 == 126)
    {
      NSUInteger v12 = UIKeyboardGetCurrentInputMode();
      NSUInteger v13 = TIInputModeGetBaseLanguage();
      [(UIDictationController *)self setLastMessageKeyboardLanguage:v13];
    }
    [(UIDictationController *)self stopDictation:v3];
    [(UIDictationController *)self _setFinalResultHandler:0];
  }
}

- (void)stopDictationIgnoreFinalizePhrases
{
}

- (void)stopAndCancelDictationWithReasonType:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning])
  {
    unint64_t v5 = _UIDictationControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[UIDictationController stopAndCancelDictationWithReasonType:]";
      __int16 v8 = 2048;
      unint64_t v9 = a3;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%s reasonType=%lu", (uint8_t *)&v6, 0x16u);
    }
  }
  [(UIDictationController *)self setReasonType:a3];
  [(UIDictationController *)self stopDictation];
  [(UIDictationController *)self cancelDictation];
}

- (void)cancelDictationForResponderIfNeeded:(id)a3 wantsKeyboard:(BOOL)a4 isPencil:(BOOL)a5
{
  BOOL v5 = a5;
  id v36 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    __int16 v8 = v36;
  }
  else {
    __int16 v8 = 0;
  }
  id v9 = v8;
  uint64_t v10 = [v9 window];
  if ([v10 _isTextEffectsWindow])
  {
    uint64_t v11 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    NSUInteger v12 = [v11 inputViews];
    NSUInteger v13 = [v12 inputAccessoryView];
    int v14 = [v9 isDescendantOfView:v13];

    if (!v14) {
      goto LABEL_57;
    }
  }
  else
  {
  }
  if (+[UIDictationController isRunningInTypeAndTalkMode](UIDictationController, "isRunningInTypeAndTalkMode")&& (([v36 isFirstResponder] & 1) != 0 || a4 || v5))
  {
    if (([v36 isFirstResponder] & 1) == 0)
    {
      uint64_t v20 = +[UIKeyboardImpl activeInstance];
      [v20 updateIdleDetection:4];
    }
  }
  else if (+[UIDictationController isRunning])
  {
    if (!os_variant_has_internal_diagnostics()) {
      goto LABEL_66;
    }
    if (qword_1EB25A9B8 != -1) {
      dispatch_once(&qword_1EB25A9B8, &__block_literal_global_955);
    }
    if (!byte_1EB25A973)
    {
LABEL_66:
      NSUInteger v15 = [v36 _responderWindow];
      char v16 = [v15 _isTextEffectsWindow];

      if ((v16 & 1) == 0)
      {
        if (![(id)UIApp _isSpringBoard]
          || ([v36 _responderWindow],
              __int16 v17 = objc_claimAutoreleasedReturnValue(),
              char v18 = [v17 _isSystemGestureWindow],
              v17,
              (v18 & 1) == 0))
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            char v19 = [v36 _isMicButton];
          }
          else {
            char v19 = 0;
          }
          char v21 = [v9 _disableDictationTouchCancellation];
          if (+[UIDictationController isRunningInTypeAndTalkMode]|| (v21 & 1) != 0|| (v19 & 1) != 0)
          {
            BOOL v22 = +[UIKeyboardImpl activeInstance];
            uint64_t v23 = [v22 inputDelegateManager];
            id v24 = [v23 delegateAsResponder];

            uint64_t v25 = +[UIKeyboardImpl activeInstance];
            int v26 = [v25 inputDelegateManager];
            id v27 = [v26 textInputView];

            id v28 = v36;
            if (v36)
            {
              while (1)
              {
                char v29 = 0;
                id v36 = v28;
                if (v28 == v24 || v28 == v27) {
                  break;
                }
                if (v9 && ([v9 _disableDictationTouchCancellation] & 1) != 0
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                  && ([v36 _isMicButton] & 1) != 0)
                {
                  char v29 = 1;
                  break;
                }
                if (qword_1EB25A9C0 != -1) {
                  dispatch_once(&qword_1EB25A9C0, &__block_literal_global_962);
                }
                if ([v36 _conformsToProtocolUIKeyInput])
                {
                  if (qword_1EB25A9E8 && (objc_opt_isKindOfClass() & 1) != 0)
                  {
LABEL_51:
                    id v33 = +[UIDictationController activeInstance];
                    [v33 resetDictation];
                  }
LABEL_52:
                  char v29 = 0;
                  break;
                }
                if (qword_1EB25A9C8 && (objc_opt_isKindOfClass() & 1) != 0
                  || qword_1EB25A9D8 && (objc_opt_isKindOfClass() & 1) != 0
                  || qword_1EB25A9E0 && (objc_opt_isKindOfClass() & 1) != 0
                  || ([(id)objc_opt_class() isEventFromMessagesSendButton:v36 inspectResponderChain:0] & 1) != 0)
                {
                  goto LABEL_52;
                }
                id v30 = v36;
                if (qword_1EB25A9D0)
                {
                  char isKindOfClass = objc_opt_isKindOfClass();
                  id v30 = v36;
                  if (isKindOfClass) {
                    goto LABEL_51;
                  }
                }
                uint64_t v32 = [v30 nextResponder];

                id v28 = (id)v32;
                if (!v32) {
                  goto LABEL_47;
                }
              }
              BOOL v34 = +[UIDictationController isRunningInTypeAndTalkMode];
              if ((v29 & 1) == 0 && v34)
              {
                uint64_t v35 = +[UIKeyboardImpl activeInstance];
                [v35 updateIdleDetection:4];
              }
            }
            else
            {
LABEL_47:
              [(UIDictationController *)self setReasonType:20];
              [(UIDictationController *)self cancelDictation];
              id v36 = 0;
            }
          }
          else if (([(id)objc_opt_class() isEventFromMessagesSendButton:v36 inspectResponderChain:1] & 1) == 0)
          {
            [(UIDictationController *)self stopAndCancelDictationWithReasonType:20];
            [(UIDictationController *)self resignFirstResponderWhenIdleIfNeeded];
          }
        }
      }
    }
  }
LABEL_57:
}

void __84__UIDictationController_cancelDictationForResponderIfNeeded_wantsKeyboard_isPencil___block_invoke()
{
  id v1 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v0 = [v1 preferencesActions];
  byte_1EB25A973 = [v0 BOOLForPreferenceKey:@"DictationDisableTapAnywhereToDisable"];
}

Class __84__UIDictationController_cancelDictationForResponderIfNeeded_wantsKeyboard_isPencil___block_invoke_2()
{
  qword_1EB25A9C8 = (uint64_t)NSClassFromString(&cfstr_Emkoverlayview.isa);
  qword_1EB25A9D0 = (uint64_t)NSClassFromString(&cfstr_Nuicontainerst.isa);
  qword_1EB25A9D8 = (uint64_t)NSClassFromString(&cfstr_Mfmailcomposet.isa);
  qword_1EB25A9E0 = (uint64_t)NSClassFromString(&cfstr_Mfcomposesubje.isa);
  Class result = NSClassFromString(&cfstr_Cncomposerecip.isa);
  qword_1EB25A9E8 = (uint64_t)result;
  return result;
}

- (void)stopAndCancelDictationIfNeededWithReasonType:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning])
  {
    BOOL v5 = _UIDictationControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[UIDictationController stopAndCancelDictationIfNeededWithReasonType:]";
      __int16 v8 = 1024;
      BOOL v9 = [(UIDictationController *)self isFinalizingRecognizedUtterance];
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%s isFinalizingRecognizedUtterance=%d", (uint8_t *)&v6, 0x12u);
    }
  }
  if (![(UIDictationController *)self isFinalizingRecognizedUtterance]) {
    [(UIDictationController *)self stopAndCancelDictationWithReasonType:a3];
  }
}

- (void)stopDictation
{
  self->_ignoreUserInteraction = 1;
  [(UIDictationController *)self stopDictation:1];
  self->_ignoreUserInteraction = 0;
}

- (void)stopDictationAndResignFirstResponder
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _UIDictationControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[UIDictationController stopDictationAndResignFirstResponder]";
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(UIDictationController *)self setShouldStayInDictationInputMode:1];
  [(UIDictationController *)self stopAndCancelDictationWithReasonType:18];
  uint64_t v4 = +[UIKeyboardImpl sharedInstance];
  BOOL v5 = [v4 inputDelegate];
  [v5 resignFirstResponder];
}

- (void)forceDictationReturnToKeyboardInputMode
{
  BOOL v3 = +[UIDictationView sharedInstance];
  char v4 = [v3 switchingLanguage];

  if ((v4 & 1) == 0 && [(UIDictationController *)self shouldStayInDictationInputMode])
  {
    [(UIDictationController *)self setShouldStayInDictationInputMode:0];
    id v6 = +[UIKeyboardImpl activeInstance];
    BOOL v5 = [(UIDictationController *)self keyboardInputModeToReturn];
    [v6 setKeyboardInputMode:v5 userInitiated:0];
  }
}

- (void)performIgnoringDocumentChanges:(id)a3
{
}

- (BOOL)isIgnoringRTIChanges
{
  return self->_ignoreRTIChanges > 0;
}

- (void)performIgnoringRTIChanges:(id)a3
{
}

+ (id)streamingHypothesisForPhrases:(id)a3
{
  BOOL v3 = (void *)[a3 copy];
  [v3 setFromKeyboard:0];
  [v3 setTransform:0];
  [v3 setUseServerCapitalization:1];
  char v4 = [v3 bestText];

  return v4;
}

- (__CFString)resultTransformForLanguageModel:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = +[UIKeyboardInputModeController sharedInputModeController];
    id v6 = [(UIDictationController *)self language];
    uint64_t v7 = [v5 keyboardLanguageForDictationLanguage:v6];

    if ([v7 isEqualToString:@"zh_Hans"])
    {
      uint64_t v8 = @"Traditional-Simplified";
      if (([v4 isEqualToString:@"zh_HK"] & 1) == 0
        && ![v4 isEqualToString:@"zh_TW"])
      {
        uint64_t v8 = 0;
      }
    }
    else if ([v7 isEqualToString:@"zh_Hant"])
    {
      if ([v4 hasSuffix:@"CN"]) {
        uint64_t v8 = @"Simplified-Traditional";
      }
      else {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)logDidAcceptDictationResult:(id)a3 reasonType:(unint64_t)a4
{
  id v6 = a3;
  id v8 = [(UIDictationController *)self dictationConnection];
  uint64_t v7 = +[UIDictationController UIDictationStartStopReasonTypeDescription:a4];
  [v8 logDidAcceptDictationResult:v6 reason:v7 result:self->_lastRecognitionText correctionIdentifier:self->_lastCorrectionIdentifier];
}

- (void)logDidAcceptReplacement:(id)a3 replacementLanguageCode:(id)a4 originalText:(id)a5 correctionIdentifier:(id)a6 interactionIdentifier:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(UIDictationController *)self dictationConnection];
  [v17 logDidAcceptReplacement:v16 replacementLanguageCode:v15 originalText:v14 correctionIdentifier:v13 interactionIdentifier:v12];
}

- (void)didShowAlternatives:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5 instrumentationContext:(id)a6 dictationLanguage:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  [(id)objc_opt_class() instrumentationDictationAlternativesViewedWithInstrumentationContext:v13 alternatives:v16 dictationLanguage:v12];

  id v17 = [(UIDictationController *)self dictationConnection];
  [v17 logDidShowAlternatives:v16 correctionIdentifier:v15 interactionIdentifier:v14];
}

- (void)logAlternativeSelected:(id)a3 correctionIdentifier:(id)a4 interactionIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(UIDictationController *)self dictationConnection];
  [v11 logDidSelectAlternative:v10 correctionIdentifier:v9 interactionIdentifier:v8];
}

- (id)resultWithTrailingSpace:(id)a3
{
  return (id)[a3 arrayByAddingObject:&unk_1ED3F0550];
}

- (void)insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __82__UIDictationController_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke;
    v19[3] = &unk_1E52DCB30;
    v19[4] = self;
    id v9 = v7;
    id v20 = v9;
    id v10 = v8;
    id v21 = v10;
    [(UIDictationController *)self performIgnoringDocumentChanges:v19];
    id v11 = +[UIKeyboardImpl activeInstance];
    id v12 = [v11 inputDelegateManager];
    id v13 = [v12 inputSystemSourceSession];

    if (v13 && ![(UIDictationController *)self isIgnoringRTIChanges])
    {
      id v14 = [v13 textOperations];
      id v15 = [MEMORY[0x1E4F1CA60] dictionary];
      if (v9)
      {
        id v16 = (void *)[v9 copy];
        [v15 setObject:v16 forKeyedSubscript:@"dictationResult"];

        id v17 = NSStringFromSelector(a2);
        [v15 setObject:v17 forKeyedSubscript:@"selector"];

        if (v10) {
          [v15 setObject:v10 forKeyedSubscript:@"correctionIdentifier"];
        }
        [v14 setCustomInfoType:0x1ED14BAA0];
        [v14 setCustomInfo:v15];
        [v13 flushOperations];
        [(UIDictationController *)self forceOOPDocumentStateSync];
      }
    }
  }
  else
  {
    [(UIDictationController *)self _insertSerializedDictationResult:v7 withCorrectionIdentifier:v8];
  }
  char v18 = +[UIKeyboardImpl activeInstance];
  [v18 touchDictationMenuTimer];
}

uint64_t __82__UIDictationController_insertSerializedDictationResult_withCorrectionIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _insertSerializedDictationResult:*(void *)(a1 + 40) withCorrectionIdentifier:*(void *)(a1 + 48)];
}

- (void)_insertSerializedDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[UIKeyboardImpl activeInstance];
  id v9 = [v8 inputDelegateManager];
  id v10 = [v9 keyInputDelegate];

  id v11 = [v8 inputDelegateManager];
  uint64_t v51 = [v11 privateInputDelegate];

  id v12 = [v8 inputDelegateManager];
  uint64_t v13 = [v12 _textSelectingContainer];

  id v14 = _UIDictationControllerLog();
  uint64_t v52 = (void *)v13;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v49 = v7;
    int v47 = [v6 showMultilingualAlternatives];
    int v15 = [v6 lowConfidenceAboutLanguageDetection];
    int v16 = [v6 allowsAlternatives];
    [v6 multilingualAlternatives];
    char v18 = v17 = v6;
    char v19 = self;
    uint64_t v20 = [v18 count];
    id v21 = [v17 bestTextForMultilingualAlternatives];
    *(_DWORD *)buf = 136316418;
    uint64_t v59 = "-[UIDictationController _insertSerializedDictationResult:withCorrectionIdentifier:]";
    __int16 v60 = 1024;
    int v61 = v47;
    __int16 v62 = 1024;
    int v63 = v15;
    __int16 v64 = 1024;
    int v65 = v16;
    __int16 v66 = 2048;
    uint64_t v67 = v20;
    self = v19;
    __int16 v68 = 2048;
    uint64_t v69 = [v21 count];
    id v7 = v49;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "%s showMultilingualAlternatives=%d, lowConfidenceAboutLanguageDetection=%d, allowsAlternatives=%d, multilingualAlternatives count=%lu bestTextForMultilingualAlternatives=%lu", buf, 0x32u);

    uint64_t v13 = (uint64_t)v52;
    id v6 = v17;
  }

  [(UIDictationController *)self instrumentationDictationTranscriptionMetadataEmitInstrumentationWithDictationResult:v6];
  BOOL v22 = v51;
  [NSString stringWithFormat:@"%s Inserting into private input delegate: %@ public input delegate: %@", "-[UIDictationController _insertSerializedDictationResult:withCorrectionIdentifier:]", v51, v13];

  [v6 bestText];
  id v24 = v23 = (void *)v13;
  [(UIDictationController *)self setLastRecognitionText:v24];

  [(UIDictationController *)self setLastCorrectionIdentifier:v7];
  if (!+[UIDictationController viewMode])
  {
    uint64_t v25 = [v6 bestResults];
    int v26 = [v25 bestText];
    [(UIDictationController *)self setLastRecognitionText:v26];

    id v27 = [v8 inputDelegate];
    [v27 insertDictationResult:v25 withCorrectionIdentifier:v25];

    goto LABEL_7;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v25 = [v6 dictationPhraseArray];
    [v23 insertDictationResult:v25];
LABEL_7:

    goto LABEL_8;
  }
  if (objc_opt_respondsToSelector())
  {
    [v51 insertDictationResult:v6 withCorrectionIdentifier:v7];
  }
  else
  {
    id v33 = [v8 inputDelegateManager];
    int v34 = [v33 hasAsyncCapableInputDelegate];

    if (!v34)
    {
      uint64_t v25 = [v6 bestText];
      [v10 insertText:v25];
      goto LABEL_7;
    }
    long long v46 = self;
    id v48 = v6;
    id v50 = v7;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v35 = [v6 dictationPhraseArray];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v53 objects:v57 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v54 != v38) {
            objc_enumerationMutation(v35);
          }
          char v40 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          v41 = [v40 alternativeInterpretations];
          uint64_t v42 = [v41 count];

          if (v42)
          {
            id v43 = [v8 inputDelegateManager];
            BOOL v44 = [v40 text];
            uint64_t v45 = [v40 alternativeInterpretations];
            objc_msgSend(v43, "insertText:alternatives:style:", v44, v45, objc_msgSend(v40, "style"));
          }
          else
          {
            id v43 = [v40 text];
            [v10 insertText:v43];
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v53 objects:v57 count:16];
      }
      while (v37);
    }

    id v6 = v48;
    id v7 = v50;
    self = v46;
    BOOL v22 = v51;
  }
LABEL_8:
  if (![(UIDictationController *)self hasInsertedAtLeastOneSerializedDictationResult])[(UIDictationController *)self setHasInsertedAtLeastOneSerializedDictationResult:1]; {
  id v28 = [v6 bestText];
  }
  selectedTextAtStart = self->_selectedTextAtStart;
  uint64_t v30 = [(UIDictationController *)self language];
  id v31 = self;
  uint64_t v32 = (void *)v30;
  +[UIKBAnalyticsDispatcher didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:](UIKBAnalyticsDispatcher, "didInsertText:relativeRangeBefore:selectedTextBefore:withLanguage:", v28, v31->_relativeRangeBefore.location, v31->_relativeRangeBefore.length, selectedTextAtStart, v30);

  [v8 assertTextForDictation];
  [v8 syncDocumentStateToInputDelegate];
  [v8 _requestInputManagerSync];
}

- (void)_deleteBackwardIntoText
{
  uint64_t v2 = NSString;
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 inputDelegateManager];
  BOOL v5 = [v4 keyInputDelegate];
  [v2 stringWithFormat:@"%s Deleting text from input delegate: %@", "-[UIDictationController _deleteBackwardIntoText]", v5];

  id v7 = +[UIKeyboardImpl activeInstance];
  id v6 = [v7 inputDelegateManager];
  [v6 deleteBackward];
}

- (void)_clearExistingText
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  id v11 = [v3 inputDelegateManager];

  id v4 = NSString;
  BOOL v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 inputDelegateManager];
  id v7 = [v6 keyInputDelegate];
  [v4 stringWithFormat:@"%s Clearing text from input delegate: %@", "-[UIDictationController _clearExistingText]", v7];

  [(UIDictationController *)self setCanUndoOrRedo:0];
  id v8 = [v11 beginningOfDocument];
  id v9 = [v11 endOfDocument];
  id v10 = [v11 textRangeFromPosition:v8 toPosition:v9];

  [v11 replaceRange:v10 withText:&stru_1ED0E84C0];
  [(UIDictationController *)self setCanUndoOrRedo:1];
}

- (void)finalizeDictationRecognitionWithPhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5 secureInput:(BOOL)a6 finalResult:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  if (self->_ignoreFinalizePhrases)
  {
    int v15 = _UIDictationControllerLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v47 = "-[UIDictationController finalizeDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInp"
            "ut:finalResult:]";
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_DEFAULT, "%s Finalize phrases ignored", buf, 0xCu);
    }

    if (+[UIKeyboard usesInputSystemUI]) {
      [(UIDictationController *)self setShadowState:0];
    }
    else {
      [(UIDictationController *)self setState:0];
    }
    goto LABEL_32;
  }
  id v45 = v13;
  [(UIDictationController *)self setCanUndoOrRedo:0];
  int v16 = +[UIKeyboardImpl activeInstance];
  id v17 = [v16 inputDelegateManager];
  char v18 = [v17 asyncCapableInputDelegate];

  char v19 = [v16 inputDelegateManager];
  uint64_t v20 = v19;
  if (v18) {
    [v19 asyncCapableInputDelegate];
  }
  else {
  id v21 = [v19 asyncWebKitInteractionDelegate];
  }

  if (objc_opt_respondsToSelector()) {
    [v21 willInsertFinalDictationResult];
  }
  -[UIDictationController setSuppressDelegateTextInputDidChangeNotifications:](self, "setSuppressDelegateTextInputDidChangeNotifications:", 1, v21);
  BOOL v22 = [(UIDictationController *)self lastHypothesis];
  [(UIDictationController *)self updateLastHypothesis:v22 WithNewHypothesis:&stru_1ED0E84C0];

  [(UIDictationController *)self setSuppressDelegateTextInputDidChangeNotifications:0];
  uint64_t v23 = +[UIKeyboardInputModeController sharedInputModeController];
  id v24 = [v23 delegate];
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    int v26 = +[UIKeyboardInputModeController sharedInputModeController];
    id v27 = [v26 delegate];
    [v27 dictationRequestDidSucceed];
  }
  id v28 = [v12 bestText];
  if ([v28 length]) {
    BOOL v29 = +[UIDictationUtilities needsTrailingSpaceForPhrases:v12 secureInput:v8];
  }
  else {
    BOOL v29 = 0;
  }

  uint64_t v30 = [v12 bestText];
  if ([v30 length])
  {
    BOOL v31 = +[UIDictationUtilities needsLeadingSpaceForPhrases:v12 secureInput:v8];

    if (v31)
    {
      [(UIDictationController *)self setSuppressDelegateTextInputDidChangeNotifications:1];
      uint64_t v32 = [(UIDictationController *)self lastHypothesis];
      id v33 = @" ";
      [(UIDictationController *)self updateLastHypothesis:v32 WithNewHypothesis:@" "];

      [(UIDictationController *)self setSuppressDelegateTextInputDidChangeNotifications:0];
      [v16 forceShiftUpdate];
      byte_1EB25A971 = [v16 isShifted];
      goto LABEL_22;
    }
  }
  else
  {
  }
  id v33 = &stru_1ED0E84C0;
LABEL_22:
  [(UIDictationController *)self setCanUndoOrRedo:1];
  int v34 = [(UIDictationController *)self resultTransformForLanguageModel:v45];
  uint64_t v35 = (void *)[v12 copy];
  [v35 setFromKeyboard:1];
  [v35 setTransform:v34];
  if (!v7
    && [(UIDictationController *)self hasInsertedAtLeastOneSerializedDictationResult])
  {
    BOOL v8 = 1;
  }
  [v35 setUseServerCapitalization:v8];
  [v35 setAddTrailingSpace:v29];
  [v35 setIsFinalResult:v7];
  uint64_t v36 = [v35 bestText];
  uint64_t v37 = [(__CFString *)v33 stringByAppendingString:v36];

  uint64_t v38 = [(UIDictationController *)self visibleContextBeforeInputAtCommandExecution];
  BOOL v39 = v38;
  if (!v38) {
    uint64_t v38 = &stru_1ED0E84C0;
  }
  char v40 = [(__CFString *)v38 stringByAppendingString:v37];
  [(UIDictationController *)self setVisibleContextBeforeInputAtCommandExecution:v40];

  [(UIDictationController *)self insertSerializedDictationResult:v35 withCorrectionIdentifier:v14];
  [v16 updateReturnKey:0];
  v41 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v42 = +[UIKeyboardInputModeController sharedInputModeController];
  id v43 = [v42 currentInputModeInPreference];
  [v41 updateLastUsedInputMode:v43];

  [(UIDictationController *)self setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:0];
  [(UIDictationController *)self setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:0];
  [(UIDictationController *)self setInitialPreviousCharacterForAsyncDelegate:0];
  [(UIDictationController *)self setInitialCharacterAfterSelectionForAsyncDelegate:0];
  if (!v7) {
    self->_hasCheckedForLeadingSpaceOnce = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [v44 didInsertFinalDictationResult];
  }

  id v13 = v45;
LABEL_32:
}

- (void)finishDictationRecognitionWithPhrases:(id)a3 languageModel:(id)a4 correctionIdentifier:(id)a5 secureInput:(BOOL)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_ignoreFinalizePhrases)
  {
    id v13 = _UIDictationControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v32 = "-[UIDictationController finishDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:]";
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%s Finalize phrases ignored", buf, 0xCu);
    }

    [(UIDictationController *)self setState:0];
  }
  else
  {
    BOOL v14 = [(UIDictationController *)self isRecievingResults];
    if (!v14)
    {
      int v15 = +[UIDictationController streamingHypothesisForPhrases:v10];
      if (![v15 length])
      {
        [(UIDictationController *)self cancelDictation];

        goto LABEL_19;
      }
    }
    if (v10)
    {
      int v16 = [v10 phrases];
      BOOL v17 = [v16 count] == 0;
    }
    else
    {
      BOOL v17 = 1;
    }
    char v18 = +[UIDictationLandingView sharedInstance];
    [v18 setWillInsertResult:!v17];

    if (v14)
    {
      char v19 = [(UIDictationController *)self streamingOperations];
      int v20 = [v19 isNotEmpty];

      if (v20) {
        uint64_t v21 = 5;
      }
      else {
        uint64_t v21 = 0;
      }
    }
    else
    {
      uint64_t v21 = 0;
    }
    objc_initWeak((id *)buf, self);
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    id v24 = __110__UIDictationController_finishDictationRecognitionWithPhrases_languageModel_correctionIdentifier_secureInput___block_invoke;
    char v25 = &unk_1E52FAB88;
    objc_copyWeak(&v29, (id *)buf);
    id v26 = v10;
    id v27 = v11;
    id v28 = v12;
    BOOL v30 = a6;
    [(UIDictationController *)self _setFinalResultHandler:&v22];
    if (v17)
    {
      [NSString stringWithFormat:@"%s Recognition succeeded, but there were no results returned.", "-[UIDictationController finishDictationRecognitionWithPhrases:languageModel:correctionIdentifier:secureInput:]", v22, v23, v24, v25, v26, v27];

      uint64_t v21 = 6;
    }
    [(UIDictationController *)self setState:v21];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
LABEL_19:
}

void __110__UIDictationController_finishDictationRecognitionWithPhrases_languageModel_correctionIdentifier_secureInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained finalizeDictationRecognitionWithPhrases:*(void *)(a1 + 32) languageModel:*(void *)(a1 + 40) correctionIdentifier:*(void *)(a1 + 48) secureInput:*(unsigned __int8 *)(a1 + 64) finalResult:1];
}

- (id)_voiceCommandGrammarParseResultWithParsePackage:(id)a3 completeCommands:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = _UIDictationControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v47 = "-[UIDictationController _voiceCommandGrammarParseResultWithParsePackage:completeCommands:]";
    __int16 v48 = 2112;
    id v49 = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s AFVoiceCommandGrammarParsePackage: %@", buf, 0x16u);
  }

  if (v6)
  {
    id v37 = v6;
    uint64_t v36 = [v6 nBestParses];
    [v36 firstObject];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v35 = v44 = 0u;
    BOOL v8 = [v35 parseCandidates];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v38 = 0;
      uint64_t v40 = 0;
      uint64_t v11 = *(void *)v42;
      int v12 = !v4;
      id v13 = @"Suppressor";
      int v39 = v12;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v42 != v11) {
            objc_enumerationMutation(v8);
          }
          int v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          if (([v15 isComplete] | v12) == 1)
          {
            int v16 = [v15 commandId];
            char v17 = [v16 hasSuffix:v13];

            if ((v17 & 1) == 0)
            {
              uint64_t v18 = v11;
              char v19 = v8;
              int v20 = v13;
              [v15 commandId];
              uint64_t v22 = v21 = self;
              unint64_t v23 = +[UIDictationController commandIdentifierWithStringIdentifier:v22];

              self = v21;
              if ([(UIDictationController *)v21 shouldSuppressPartialResults])
              {
                BOOL v24 = [(UIDictationController *)v21 isSelectionBasedCommand:v23];
                id v13 = v20;
                BOOL v8 = v19;
                uint64_t v11 = v18;
                int v12 = v39;
                if (v24) {
                  goto LABEL_36;
                }
              }
              else if (v38)
              {
                id v13 = v20;
                BOOL v8 = v19;
                uint64_t v11 = v18;
                int v12 = v39;
                if (v40 == 14 && v23 == 15) {
                  goto LABEL_36;
                }
                BOOL v25 = v40 == 23;
                BOOL v26 = v23 == 25 && v40 == 23;
                if (v23 != 24) {
                  BOOL v25 = 0;
                }
                if (v26 || v25)
                {
LABEL_36:
                  id v33 = v15;

                  id v38 = v33;
                  goto LABEL_38;
                }
                if (v40 == 1)
                {
                  if ((v23 & 0xFFFFFFFFFFFFFFFELL) == 2) {
                    goto LABEL_36;
                  }
                  uint64_t v40 = 1;
                }
              }
              else
              {
                id v27 = v15;
                id v38 = v27;
                if (v23 == 1)
                {
                  id v28 = v27;
                  id v29 = [v27 commandId];
                  BOOL v30 = +[UIDictationUtilities dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:v28];
                  BOOL v31 = [v28 voiceCommandUUID];
                  BOOL v32 = [(UIDictationController *)v21 canApplyVoiceCommandWithIdentifier:v29 parameters:v30 commandUtteranceString:0 voiceCommandUUID:v31];

                  if (v32)
                  {
                    BOOL v8 = v19;
                    goto LABEL_38;
                  }
                  uint64_t v40 = 1;
                  self = v21;
                }
                else
                {
                  uint64_t v40 = v23;
                }
                id v13 = v20;
                BOOL v8 = v19;
                uint64_t v11 = v18;
                int v12 = v39;
              }
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v38 = 0;
    }
LABEL_38:

    id v6 = v37;
  }
  else
  {
    id v38 = 0;
  }

  return v38;
}

- (BOOL)_shouldSuppressPartialForVoiceCommandGrammarParsePackage:(id)a3 commandPartialString:(id)a4
{
  return 0;
}

- (void)dictationConnection:(id)a3 finalizePhrases:(id)a4 languageModel:(id)a5 correctionIdentifier:(id)a6 secureInput:(BOOL)a7 finalResult:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]");

  int v16 = NSString;
  char v17 = [v13 bestText];
  [v16 stringWithFormat:@"%s Best interpretation: '%@'", "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]", v17];

  uint64_t v18 = +[UIDictationLandingView activeInstance];
  LODWORD(v17) = [v18 canStopLanding];

  if (v17)
  {
    char v19 = +[UIDictationLandingView activeInstance];
    [v19 stopLanding];
  }
  BOOL v20 = [(UIDictationController *)self isDetectingUtterances];
  uint64_t v21 = _UIDictationControllerLog();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v22)
    {
      *(_DWORD *)buf = 136315138;
      BOOL v24 = "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "%s Finalizing detected utterance", buf, 0xCu);
    }

    self->_finalizingRecognizedUtterance = 1;
    [(UIDictationController *)self finalizeDictationRecognitionWithPhrases:v13 languageModel:v14 correctionIdentifier:v15 secureInput:v9 finalResult:v8];
    [(UIDictationController *)self _stopStreamingAnimation];
    [(UIDictationController *)self setTargetHypothesis:0];
    [(UIDictationController *)self setLastHypothesis:0];
    [(UIDictationController *)self setPendingEdits:0];
    self->_finalizingRecognizedUtterance = 0;
  }
  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 136315138;
      BOOL v24 = "-[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:]";
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "%s Finalizing dictation result", buf, 0xCu);
    }

    [(UIDictationController *)self finishDictationRecognitionWithPhrases:v13 languageModel:v14 correctionIdentifier:v15 secureInput:v9];
  }
  self->_recievingResults = 0;
}

- (void)_stopStreamingAnimation
{
  [(CADisplayLink *)self->_streamingAnimationDisplayLink invalidate];
  streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
  self->_streamingAnimationDisplayLink = 0;

  self->_streamingAnimationActive = 0;
}

- (void)_startStreamingAnimations
{
  if (!+[UIKeyboard usesInputSystemUI]
    && !self->_streamingAnimationActive)
  {
    self->_streamingAnimationActive = 1;
    BOOL v3 = +[UIScreen mainScreen];
    BOOL v4 = [v3 displayLinkWithTarget:self selector:sel__displayLinkFired_];
    streamingAnimationDisplayLink = self->_streamingAnimationDisplayLink;
    self->_streamingAnimationDisplayLink = v4;

    id v6 = +[_UIDictationSettingsDomain rootSettings];
    [v6 typewriterEffectFramesPerSecond];
    [(CADisplayLink *)self->_streamingAnimationDisplayLink setPreferredFramesPerSecond:(uint64_t)v7];

    BOOL v8 = self->_streamingAnimationDisplayLink;
    BOOL v9 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v8 addToRunLoop:v9 forMode:*MEMORY[0x1E4F1C4B0]];

    self->_lastAnimationUpdateTimeStamp = CACurrentMediaTime();
  }
}

- (void)_displayLinkFired:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_streamingAnimationActive)
  {
    if (self->_deferredCancellationRequested)
    {
      [(UIDictationController *)self cancelDictation];
      goto LABEL_54;
    }
    __int16 v68 = v4;
    uint64_t v69 = +[UIKeyboardImpl activeInstance];
    if (!v69)
    {
LABEL_53:

      BOOL v5 = v68;
      goto LABEL_54;
    }
    [v68 timestamp];
    double v7 = v6;
    double lastAnimationUpdateTimeStamp = self->_lastAnimationUpdateTimeStamp;
    BOOL v9 = [(UIDictationController *)self pendingEdits];
    double v10 = v7 - lastAnimationUpdateTimeStamp;
    if (![v9 count])
    {
      uint64_t v36 = [(UIDictationController *)self lastHypothesis];
      if ([v36 length])
      {
        id v37 = +[_UIDictationSettingsDomain rootSettings];
        [v37 typewriterEffectMinDurationBetweenHypotheses];
        double v39 = v38;

        if (v10 < v39) {
          goto LABEL_53;
        }
LABEL_7:
        uint64_t v11 = [(UIDictationController *)self targetHypothesis];
        int v12 = [(UIDictationController *)self lastHypothesis];
        if ([v11 isEqualToString:v12])
        {
          id v13 = [(UIDictationController *)self pendingEdits];
          uint64_t v14 = [v13 count];

          if (!v14)
          {
            [(UIDictationController *)self _stopStreamingAnimation];
            if (![(UIDictationController *)self state])
            {
              [(UIDictationController *)self setTargetHypothesis:0];
              [(UIDictationController *)self setLastHypothesis:0];
              [(UIDictationController *)self setPendingEdits:0];
            }
            if ([(UIDictationController *)self state] == 3)
            {
              id v15 = +[UIDictationLandingView activeInstance];
              [v15 startLandingIfNecessary];
            }
            uint64_t v79 = 0;
            v80 = &v79;
            uint64_t v81 = 0x2050000000;
            int v16 = (void *)qword_1EB25AAD0;
            uint64_t v82 = qword_1EB25AAD0;
            if (!qword_1EB25AAD0)
            {
              uint64_t v74 = MEMORY[0x1E4F143A8];
              uint64_t v75 = 3221225472;
              long long v76 = __getSISchemaUEIDictationPartialResultUpdatedClass_block_invoke;
              long long v77 = &unk_1E52D9900;
              long long v78 = &v79;
              __getSISchemaUEIDictationPartialResultUpdatedClass_block_invoke((uint64_t)&v74);
              int v16 = (void *)v80[3];
            }
            char v17 = v16;
            _Block_object_dispose(&v79, 8);
            id v66 = objc_alloc_init(v17);
            [v66 setExists:1];
            [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v66];
            if (self->_dictationInputModeSwitchStarted)
            {
              self->_dictationInputModeSwitchStarted = 0;
              id v18 = objc_alloc_init((Class)getSISchemaUEIDictationInputModeSwitchContextClass());
              uint64_t v79 = 0;
              v80 = &v79;
              uint64_t v81 = 0x2050000000;
              char v19 = (void *)qword_1EB25AAD8;
              uint64_t v82 = qword_1EB25AAD8;
              if (!qword_1EB25AAD8)
              {
                uint64_t v74 = MEMORY[0x1E4F143A8];
                uint64_t v75 = 3221225472;
                long long v76 = __getSISchemaUEIDictationInputModeSwitchEndedClass_block_invoke;
                long long v77 = &unk_1E52D9900;
                long long v78 = &v79;
                __getSISchemaUEIDictationInputModeSwitchEndedClass_block_invoke((uint64_t)&v74);
                char v19 = (void *)v80[3];
              }
              BOOL v20 = v19;
              _Block_object_dispose(&v79, 8);
              id v21 = objc_alloc_init(v20);
              [v21 setExists:1];
              [v18 setEnded:v21];
              [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v18];
            }
            goto LABEL_52;
          }
        }
        else
        {
        }
        BOOL v22 = +[UIDictationLandingView activeInstance];
        int v23 = [v22 canStopLanding];

        if (v23)
        {
          BOOL v24 = +[UIDictationLandingView activeInstance];
          [v24 stopLanding];
        }
        uint64_t v25 = [v69 inputDelegateManager];
        id v66 = [v25 selectedTextRange];

        if (v66 && ([v66 isEmpty] & 1) == 0)
        {
          [(UIDictationController *)self removeSelectedText];
LABEL_52:

          goto LABEL_53;
        }
        BOOL v26 = [(UIDictationController *)self pendingEdits];
        uint64_t v27 = [v26 count];

        if (v27)
        {
          id v28 = [(UIDictationController *)self targetHypothesis];
          id v29 = [(UIDictationController *)self previousHypothesis];
          char v30 = [v28 isEqualToString:v29];

          if (v30) {
            goto LABEL_33;
          }
          BOOL v31 = [(UIDictationController *)self previousHypothesis];
          BOOL v32 = [(UIDictationController *)self targetHypothesis];
          id v33 = +[_EditScriptRanged editScriptFromString:v31 toString:v32 chunkSize:0 orderAtomsAscending:1 operationPrecedence:-1 options:0];

          int v34 = [(UIDictationController *)self pendingEdits];
          uint64_t v35 = [v33 script];
          [v34 addObjectsFromArray:v35];
        }
        else
        {
          uint64_t v40 = [(UIDictationController *)self lastHypothesis];
          long long v41 = [(UIDictationController *)self targetHypothesis];
          id v33 = +[_EditScriptRanged editScriptFromString:v40 toString:v41 chunkSize:0 orderAtomsAscending:1 operationPrecedence:-1 options:0];

          long long v42 = [v33 script];
          int v34 = (void *)[v42 mutableCopy];

          [(UIDictationController *)self setPendingEdits:v34];
        }

LABEL_33:
        long long v43 = [(UIDictationController *)self pendingEdits];
        uint64_t v44 = [v43 count];

        if (v44)
        {
          id v45 = +[_UIDictationSettingsDomain rootSettings];
          [v45 typewriterEffectStreamingCharacterInsertionRate];
          unint64_t v47 = (unint64_t)(v10 * v46);

          if (v47)
          {
            [v68 timestamp];
            self->_double lastAnimationUpdateTimeStamp = v48;
            id v49 = [(UIDictationController *)self lastHypothesis];
            uint64_t v67 = (void *)[v49 mutableCopy];

            long long v72 = 0u;
            long long v73 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            id obj = [(UIDictationController *)self pendingEdits];
            uint64_t v50 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
            if (v50)
            {
              uint64_t v51 = 0;
              uint64_t v52 = *(void *)v71;
              while (2)
              {
                uint64_t v53 = 0;
                uint64_t v63 = v51;
                uint64_t v64 = v50 + v51;
                uint64_t v54 = v51 + 1;
                do
                {
                  if (*(void *)v71 != v52) {
                    objc_enumerationMutation(obj);
                  }
                  long long v55 = *(void **)(*((void *)&v70 + 1) + 8 * v53);
                  uint64_t v56 = [v55 editRange];
                  uint64_t v58 = v57;
                  uint64_t v59 = [v55 replacementText];
                  objc_msgSend(v67, "replaceCharactersInRange:withString:", v56, v58, v59);

                  __int16 v60 = [v55 replacementText];
                  LODWORD(v58) = [v60 isEqualToString:&stru_1ED0E84C0];

                  v47 += v58;
                  if (v47 <= v54 + v53)
                  {
                    uint64_t v64 = v63 + v53 + 1;
                    goto LABEL_48;
                  }
                  ++v53;
                }
                while (v50 != v53);
                uint64_t v50 = [obj countByEnumeratingWithState:&v70 objects:v83 count:16];
                uint64_t v51 = v64;
                if (v50) {
                  continue;
                }
                break;
              }
            }
            else
            {
              uint64_t v64 = 0;
            }
LABEL_48:

            int v61 = [(UIDictationController *)self pendingEdits];
            objc_msgSend(v61, "removeObjectsInRange:", 0, v64);

            if (self->_ignoreFinalizePhrases)
            {
              [(UIDictationController *)self setLastHypothesis:v67];
            }
            else
            {
              __int16 v62 = [(UIDictationController *)self lastHypothesis];
              [(UIDictationController *)self updateLastHypothesis:v62 WithNewHypothesis:v67];
            }
          }
        }
        else
        {
          [(UIDictationController *)self _stopStreamingAnimation];
        }
        goto LABEL_52;
      }
    }
    goto LABEL_7;
  }
LABEL_54:
}

- (id)_rangeByExtendingRange:(id)a3 backward:(int64_t)a4 forward:(int64_t)a5 inputDelegateManager:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  id v11 = [v9 start];
  int v12 = v11;
  if (a4)
  {
    int v12 = [v10 positionFromPosition:v11 offset:-a4];

    if (!v12)
    {
      int v12 = [v10 beginningOfDocument];
    }
  }
  id v13 = [v9 end];
  uint64_t v14 = v13;
  if (a5)
  {
    uint64_t v14 = [v10 positionFromPosition:v13 offset:a5];

    if (!v14)
    {
      uint64_t v14 = [v10 endOfDocument];
    }
  }
  uint64_t v15 = [v10 textRangeFromPosition:v12 toPosition:v14];
  int v16 = (void *)v15;
  if (v15) {
    char v17 = (void *)v15;
  }
  else {
    char v17 = v9;
  }
  id v18 = v17;

  return v18;
}

- (id)_hypothesisRangeFromSelectionRange:(id)a3 inputDelegateManager:(id)a4 forHypothesis:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    id v7 = [v8 selectedTextRange];
  }
  uint64_t v10 = [v7 end];
  if (v10)
  {
    id v11 = (void *)v10;
    int v12 = objc_msgSend(v8, "positionFromPosition:offset:", v10, -objc_msgSend(v9, "length"));
    if (!v12)
    {
      int v12 = [v8 beginningOfDocument];
    }
    id v13 = [v8 textRangeFromPosition:v12 toPosition:v11];
  }
  else
  {
    id v11 = [v8 endOfDocument];
    id v13 = [v8 textRangeFromPosition:v11 toPosition:v11];
  }

  return v13;
}

- (id)_getBestHypothesisRangeGivenHintRange:(id)a3 inputDelegateManager:(id)a4 hypothesisRange:(_NSRange *)a5 documentTextInRange:(id *)a6 forHypothesis:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (v12)
  {
    if (a5) {
      goto LABEL_3;
    }
LABEL_47:
    uint64_t v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2 object:self file:@"UIDictationController.m" lineNumber:6562 description:@"outTextRange == nil"];

    if (a6) {
      goto LABEL_4;
    }
LABEL_48:
    long long v41 = [MEMORY[0x1E4F28B00] currentHandler];
    [v41 handleFailureInMethod:a2 object:self file:@"UIDictationController.m" lineNumber:6563 description:@"outDocumentText == nil"];

    goto LABEL_4;
  }
  double v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2 object:self file:@"UIDictationController.m" lineNumber:6561 description:@"hintRange == nil"];

  if (!a5) {
    goto LABEL_47;
  }
LABEL_3:
  if (!a6) {
    goto LABEL_48;
  }
LABEL_4:
  id v15 = v14;
  uint64_t v16 = [v15 length];
  if ([v12 isEmpty] && !v16)
  {
    a5->id location = 0;
    a5->length = 0;
    *a6 = &stru_1ED0E84C0;
    id v12 = v12;
    id v17 = v12;
    goto LABEL_43;
  }
  *a5 = (_NSRange)xmmword_186B93450;
  *a6 = 0;
  id v17 = [v13 textInRange:v12];
  if (v17)
  {
    uint64_t v18 = [(UIDictationController *)self _getRangeOfString:v15 inDocumentText:v17];
    uint64_t v20 = v18;
    NSUInteger v21 = v19;
    if (!v18 && v19 == v16)
    {
      long long v42 = a5;
      long long v43 = a6;
      NSUInteger v22 = 0;
      NSUInteger v46 = v16;
LABEL_41:
      v42->id location = v22;
      v42->length = v46;
      id v23 = v17;
      id *v43 = v23;
      id v12 = v12;
      id v17 = v12;
      goto LABEL_42;
    }
    uint64_t v44 = v16;
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v43 = a6;
      uint64_t v27 = [v17 length] - (v18 + v19);
      goto LABEL_17;
    }
    uint64_t v24 = [(UIDictationController *)self _rangeByExtendingRange:v12 backward:+[UIDictationLandingView fallbackPlaceholderLength] forward:0 inputDelegateManager:v13];

    id v23 = [v13 textInRange:v24];

    uint64_t v25 = [(UIDictationController *)self _getRangeOfString:v15 inDocumentText:v23];
    id v17 = 0;
    if (v23)
    {
      uint64_t v20 = v25;
      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        NSUInteger v21 = v26;
        long long v43 = a6;
        uint64_t v27 = [v23 length] - (v25 + v26);
        id v17 = v23;
        id v12 = (id)v24;
LABEL_17:
        id v45 = v13;
        NSUInteger v46 = v21;
        long long v42 = a5;
        if (v20 < 1)
        {
          NSUInteger v22 = v20;
          id v33 = v17;
          id v32 = v12;
        }
        else
        {
          NSUInteger v22 = v20;
          while (1)
          {
            id v28 = -[UIDictationController _rangeByExtendingRange:backward:forward:inputDelegateManager:](self, "_rangeByExtendingRange:backward:forward:inputDelegateManager:", v12, -1, 0, v13, v42);
            id v29 = [v13 textInRange:v28];
            uint64_t v30 = [(UIDictationController *)self _getRangeOfString:v15 inDocumentText:v29];
            if (!v29 || v30 == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v33 = v17;
              id v32 = v12;
              goto LABEL_29;
            }
            NSUInteger v22 = v30;
            NSUInteger v46 = v31;
            id v32 = v28;

            id v33 = v29;
            if (!v22 && [v33 length] == v44) {
              break;
            }

            id v12 = v32;
            id v17 = v33;
            --v20;
            id v13 = v45;
            if (!v20) {
              goto LABEL_30;
            }
          }
          NSUInteger v22 = 0;
LABEL_29:

          id v13 = v45;
        }
LABEL_30:
        if (v27 < 1)
        {
          id v17 = v33;
          id v12 = v32;
        }
        else
        {
          while (1)
          {
            int v34 = -[UIDictationController _rangeByExtendingRange:backward:forward:inputDelegateManager:](self, "_rangeByExtendingRange:backward:forward:inputDelegateManager:", v32, 0, -1, v13, v42);
            uint64_t v35 = [v13 textInRange:v34];
            uint64_t v36 = [(UIDictationController *)self _getRangeOfString:v15 inDocumentText:v35];
            if (!v35 || v36 == 0x7FFFFFFFFFFFFFFFLL)
            {
              id v17 = v33;
              id v12 = v32;
              goto LABEL_40;
            }
            NSUInteger v22 = v36;
            NSUInteger v46 = v37;
            id v12 = v34;

            id v17 = v35;
            if (!v22 && [v17 length] == v44) {
              break;
            }

            id v32 = v12;
            id v33 = v17;
            --v27;
            id v13 = v45;
            if (!v27) {
              goto LABEL_41;
            }
          }
          NSUInteger v22 = 0;
LABEL_40:

          id v13 = v45;
        }
        goto LABEL_41;
      }
    }
    id v12 = (id)v24;
  }
  else
  {
    id v23 = 0;
  }
LABEL_42:

LABEL_43:
  return v17;
}

- (void)resetLastHypothesis
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v3 = _UIDictationControllerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      BOOL v5 = "-[UIDictationController resetLastHypothesis]";
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
    }

    [(UIDictationController *)self setLastHypothesis:0];
  }
}

- (void)updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(UIDictationController *)self _updateLastHypothesis:v7 WithNewHypothesis:v8];
  id v9 = +[UIKeyboardImpl activeInstance];
  [v9 touchDictationMenuTimer];

  if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
  {
    uint64_t v10 = +[UIKeyboardImpl activeInstance];
    id v11 = [v10 inputDelegateManager];
    id v12 = [v11 inputSystemSourceSession];

    if (v12)
    {
      if ([(UIDictationController *)self isIgnoringRTIChanges])
      {
        if ([v8 isEqualToString:&stru_1ED0E84C0])
        {
          id v13 = [v12 textOperations];
          [v13 setCustomInfoType:0x1ED14BAA0];
          uint64_t v20 = @"selector";
          id v14 = NSStringFromSelector(sel_resetLastHypothesis);
          v21[0] = v14;
          id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
          [v13 setCustomInfo:v15];

          [v12 flushOperations];
        }
      }
      else
      {
        uint64_t v16 = [v12 textOperations];
        [v16 setCustomInfoType:0x1ED14BAA0];
        id v17 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
        uint64_t v18 = v17;
        if (v7) {
          [v17 setObject:v7 forKeyedSubscript:@"lastHypothesis"];
        }
        if (v8) {
          [v18 setObject:v8 forKeyedSubscript:@"newHypothesis"];
        }
        NSUInteger v19 = NSStringFromSelector(a2);
        [v18 setObject:v19 forKeyedSubscript:@"selector"];

        [v16 setCustomInfo:v18];
        [v12 flushOperations];
      }
    }
  }
}

- (void)forceOOPDocumentStateSync
{
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  id v3 = objc_alloc_init(MEMORY[0x1E4FAE370]);
  [v3 setInsertionText:&stru_1ED0E84C0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __50__UIDictationController_forceOOPDocumentStateSync__block_invoke;
  v6[3] = &unk_1E52D9F98;
  id v7 = v2;
  id v8 = v3;
  id v4 = v3;
  id v5 = v2;
  [v5 performOperations:v6 withTextInputSource:2];
}

uint64_t __50__UIDictationController_forceOOPDocumentStateSync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performKeyboardOutput:*(void *)(a1 + 40)];
}

- (void)_updateLastHypothesis:(id)a3 WithNewHypothesis:(id)a4
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (__CFString *)a4;
  if (![(UIDictationController *)self _shouldApplyLastHypothesis]) {
    goto LABEL_29;
  }
  id v8 = +[UIKeyboardImpl activeInstance];
  id v9 = [v8 inputDelegateManager];
  int v10 = [v9 hasAsyncCapableInputDelegate];

  if (v7 && [(__CFString *)v7 length])
  {
    unint64_t v11 = [v6 length];
    if (v11 > [(__CFString *)v7 length]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 2;
    }
    uint64_t v51 = @"UIDictationGlowViewMode";
    id v13 = [NSNumber numberWithUnsignedInt:v12];
    v52[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];

    [(UIDictationController *)self postNotificationName:@"UIDictationWillInsertHypothesisNotification" userInfo:v14];
  }
  id v15 = [v8 inputDelegateManager];
  uint64_t v16 = [v15 selectedTextRange];

  [(UIDictationController *)self setHasSelectedTextRange:0];
  id v17 = [v8 inputDelegateManager];
  uint64_t v18 = v17;
  if (!v10)
  {
    NSUInteger v19 = [(UIDictationController *)self _hypothesisRangeFromSelectionRange:v16 inputDelegateManager:v17 forHypothesis:v6];

    uint64_t v43 = 0;
    uint64_t v44 = 0;
    if (v19 && (![v19 isEmpty] || objc_msgSend(v6, "length")))
    {
      uint64_t v20 = [v8 inputDelegateManager];
      id v42 = 0;
      uint64_t v21 = [(UIDictationController *)self _getBestHypothesisRangeGivenHintRange:v19 inputDelegateManager:v20 hypothesisRange:&v43 documentTextInRange:&v42 forHypothesis:v6];
      NSUInteger v22 = (__CFString *)v42;

      NSUInteger v19 = (void *)v21;
      if (v21)
      {
LABEL_14:
        if (v7) {
          id v23 = v7;
        }
        else {
          id v23 = &stru_1ED0E84C0;
        }
        uint64_t v24 = -[__CFString stringByReplacingCharactersInRange:withString:](v22, "stringByReplacingCharactersInRange:withString:", v43, v44, v23);
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke;
        v36[3] = &unk_1E52DF078;
        id v37 = v8;
        double v38 = self;
        id v39 = v19;
        id v40 = v6;
        id v41 = v24;
        id v25 = v24;
        [(UIDictationController *)self performIgnoringDocumentChanges:v36];

LABEL_22:
        goto LABEL_23;
      }
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      NSUInteger v22 = &stru_1ED0E84C0;
      if (v19) {
        goto LABEL_14;
      }
    }
    NSUInteger v26 = _UIDictationControllerLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      int v34 = [(UIDictationController *)self lastHypothesis];
      *(_DWORD *)buf = 136315650;
      NSUInteger v46 = "-[UIDictationController _updateLastHypothesis:WithNewHypothesis:]";
      __int16 v47 = 2112;
      double v48 = v34;
      __int16 v49 = 2112;
      uint64_t v50 = 0;
      _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "%s Could not find the last hypothesis \"%@\" in range '%@'. The likely cause is that something modified the text store or the hypothesis during dictation. Canceling dictation", buf, 0x20u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke_1060;
    block[3] = &unk_1E52D9F70;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
    goto LABEL_22;
  }
  [v17 replaceRange:0 oldText:v6 withText:v7 forReplaceAction:3];
  NSUInteger v19 = v18;
LABEL_23:

  if (+[UIKeyboard isModelessActive])
  {
    uint64_t v27 = +[UIKeyboardInputModeController sharedInputModeController];
    id v28 = [v27 currentPublicInputMode];
    if ([v28 isExtensionInputMode])
    {
      char v29 = [(__CFString *)v7 isEqualToString:&stru_1ED0E84C0];

      if ((v29 & 1) == 0) {
        [v8 _requestInputManagerSync];
      }
    }
    else
    {
    }
  }
  uint64_t v30 = [v8 inputDelegateManager];
  NSUInteger v31 = [v30 textInteractionAssistant];
  [v31 setNeedsSelectionDisplayUpdate];

  id v32 = [v8 _textChoicesAssistant];
  [v32 resetDictationChoices];

  id v33 = [v8 _textChoicesAssistant];
  [v33 resetDictationUnderlines];

LABEL_29:
  [(UIDictationController *)self setLastHypothesis:v7];
}

uint64_t __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) inputDelegateManager];
  id v3 = [v2 privateInputDelegate];
  objc_msgSend(v3, "set_textInputSource:", 2);

  [*(id *)(a1 + 40) setCanUndoOrRedo:0];
  [*(id *)(a1 + 32) setTextInputChangesIgnored:1];
  id v4 = [*(id *)(a1 + 32) inputDelegateManager];
  [v4 replaceRange:*(void *)(a1 + 48) oldText:*(void *)(a1 + 56) withText:*(void *)(a1 + 64) forReplaceAction:3];

  [*(id *)(a1 + 32) setTextInputChangesIgnored:0];
  [*(id *)(a1 + 32) updateReturnKey:0];
  [(id)objc_opt_class() updateLandingView];
  id v5 = *(void **)(a1 + 40);
  return [v5 setCanUndoOrRedo:1];
}

uint64_t __65__UIDictationController__updateLastHypothesis_WithNewHypothesis___block_invoke_1060(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelDictation];
}

- (BOOL)_shouldApplyLastHypothesis
{
  if (!+[UIKeyboard isKeyboardProcess]) {
    return 1;
  }
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 inputDelegateManager];
  char v4 = [v3 shouldRespectForwardingInputDelegate];

  return v4;
}

- (void)setupToInsertResultForNewHypothesis:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_streamingAnimationActive)
  {
    [(UIDictationController *)self setTargetHypothesis:v4];
  }
  else
  {
    id v5 = [(UIDictationController *)self lastHypothesis];

    if (!v5) {
      [(UIDictationController *)self setLastHypothesis:&stru_1ED0E84C0];
    }
    id v6 = +[UIDictationLandingView activeInstance];
    int v7 = [v6 canStopLanding];

    if (v7)
    {
      id v8 = +[UIDictationLandingView activeInstance];
      [v8 stopLanding];
    }
    [(UIDictationController *)self setTargetHypothesis:v9];
    [(UIDictationController *)self _startStreamingAnimations];
  }
}

- (BOOL)languageSupportsAdaptiveDelete
{
  if (+[UIKeyboard isModelessActive])
  {
    id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ED3F0568];
    id v4 = (void *)MEMORY[0x1E4F1CA20];
    id v5 = [(UIDictationController *)self language];
    id v6 = [v4 localeWithLocaleIdentifier:v5];
    int v7 = [v6 languageCode];

    int v8 = [v3 containsObject:v7] ^ 1;
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)dictationWordwiseBackspaceEnabled
{
  if (qword_1EB25A9F0 != -1) {
    dispatch_once(&qword_1EB25A9F0, &__block_literal_global_1081);
  }
  if (!byte_1EB25A974) {
    return 0;
  }
  uint64_t v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v3 = [v2 BOOLForPreferenceKey:@"DictationWordwiseBackspaceEnabled"];

  return v3;
}

uint64_t __58__UIDictationController_dictationWordwiseBackspaceEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  byte_1EB25A974 = result;
  return result;
}

- (void)dictationConnection:(id)a3 receivedInterpretation:(id)a4 languageModel:(id)a5 secureInput:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]");

  if ([v8 length])
  {
    if (self->_shouldResumeDictation)
    {
      id v9 = _UIDictationControllerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
        _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%s _shouldResumeDictation is YES. Early return", buf, 0xCu);
      }
    }
    else if ([(UIDictationController *)self isProcessingPotentialVoiceCommand])
    {
      id v9 = _UIDictationControllerLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
        _os_log_error_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "%s Received partial result while processing potential voice command. This partial result will be ignored.", buf, 0xCu);
      }
    }
    else
    {
      if ([(UIDictationController *)self dictationWordwiseBackspaceEnabled])
      {
        int v10 = +[UIDictationController sharedInstance];
        [v10 setShouldDeleteWordOnBackspaceTap:1];

        if ([(UIDictationController *)self startRangeOfCurrentHypothesis] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
          {
            unint64_t v11 = +[UIKeyboardImpl activeInstance];
            uint64_t v12 = [v11 inputDelegateManager];
            id v13 = [v12 inputSystemSourceSession];
            id v14 = [v13 documentState];
            uint64_t v15 = [v14 selectedTextRange];
            -[UIDictationController setStartRangeOfCurrentHypothesis:](self, "setStartRangeOfCurrentHypothesis:", v15, v16);
          }
          else
          {
            unint64_t v11 = +[UIKeyboardImpl sharedInstance];
            uint64_t v12 = [v11 documentState];
            uint64_t v17 = [v12 _selectedTextRange];
            -[UIDictationController setStartRangeOfCurrentHypothesis:](self, "setStartRangeOfCurrentHypothesis:", v17, v18);
          }
        }
      }
      [(UIDictationController *)self updateRecordingLimitTimerIfNeeded];
      if (!self->_hasCheckedForLeadingSpaceOnce)
      {
        self->_hasCheckedForLeadingSpaceOnce = 1;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __94__UIDictationController_dictationConnection_receivedInterpretation_languageModel_secureInput___block_invoke;
        void v42[3] = &unk_1E52FABB0;
        v42[4] = self;
        +[UIDictationUtilities selectionStartInfoWithBlock:v42];
      }
      if (+[UIDictationUtilities needsLeadingSpaceForText:v8 secureInput:v6 previousCharacter:self->_previousCharacter selectionStartIsStartOfParagraph:self->_selectionStartIsStartOfParagraph])
      {
        uint64_t v19 = [@" " stringByAppendingString:v8];

        id v8 = (id)v19;
      }
      if (+[UIDictationUtilities needsTrailingSpaceForText:v8 secureInput:v6])
      {
        uint64_t v20 = [v8 stringByAppendingString:@" "];

        id v8 = (id)v20;
      }
      self->_recievingResults = 1;
      uint64_t v21 = +[UIKeyboardImpl activeInstance];
      NSUInteger v22 = [v21 inputDelegateManager];

      if (!+[UIKeyboard isRedesignedTextCursorEnabled])
      {
        id v23 = [v22 textInteractionAssistant];
        [v23 configureForHighlightMode];
      }
      uint64_t v24 = [v22 selectedTextRange];
      id v9 = v22;
      id v25 = [v9 beginningOfDocument];
      NSUInteger v26 = [v24 start];
      uint64_t v27 = [v9 offsetFromPosition:v25 toPosition:v26];

      id v28 = [v24 start];
      char v29 = [v24 end];
      uint64_t v30 = [v9 offsetFromPosition:v28 toPosition:v29];

      if ([(UIDictationController *)self discardNextHypothesis])
      {
        uint64_t v31 = 0;
      }
      else
      {
        id v32 = [(UIDictationController *)self previousHypothesis];
        if (v32)
        {
          id v33 = [(UIDictationController *)self previousHypothesis];
          uint64_t v31 = [v8 isEqualToString:v33] ^ 1;
        }
        else
        {
          uint64_t v31 = 1;
        }
      }
      [NSString stringWithFormat:@"%s Hypothesis (willInsert: %d): '%@'", "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]", v31, v8];

      if ([(UIDictationController *)self discardNextHypothesis])
      {
        [(UIDictationController *)self setPreviousHypothesis:0];
        -[UIDictationController setInsertionRange:](self, "setInsertionRange:", v27, v30);
        [(UIDictationController *)self setDiscardNextHypothesis:0];
      }
      else
      {
        uint64_t v34 = [(UIDictationController *)self previousHypothesis];
        if (!v34
          || (uint64_t v35 = (void *)v34,
              [(UIDictationController *)self previousHypothesis],
              uint64_t v36 = objc_claimAutoreleasedReturnValue(),
              char v37 = [v8 isEqualToString:v36],
              v36,
              v35,
              (v37 & 1) == 0))
        {
          if (![(UIDictationController *)self haveReceivedFirstPartialResultForCurrentUtterance])
          {
            double v38 = _UIDictationControllerUndoRedoLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEFAULT, "%s First partial result received for current utterance", buf, 0xCu);
            }

            id v39 = _UIDictationControllerUndoRedoLog();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", buf, 0xCu);
            }

            [(UIDictationController *)self _endUndoGroupingIfNecessary];
            id v40 = _UIDictationControllerUndoRedoLog();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_1853B0000, v40, OS_LOG_TYPE_DEFAULT, "%s Beginning undo grouping if necessary", buf, 0xCu);
            }

            [(UIDictationController *)self _beginUndoGroupingIfNecessary];
            id v41 = _UIDictationControllerUndoRedoLog();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              uint64_t v44 = "-[UIDictationController dictationConnection:receivedInterpretation:languageModel:secureInput:]";
              _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "%s Updating haveReceivedFirstPartialResultForCurrentUtterance to YES", buf, 0xCu);
            }

            [(UIDictationController *)self setHaveReceivedFirstPartialResultForCurrentUtterance:1];
          }
          [(UIDictationController *)self setupToInsertResultForNewHypothesis:v8];
          [(UIDictationController *)self setPreviousHypothesis:v8];
        }
      }
    }
  }
}

uint64_t __94__UIDictationController_dictationConnection_receivedInterpretation_languageModel_secureInput___block_invoke(uint64_t result, __int16 a2, char a3)
{
  *(_WORD *)(*(void *)(result + 32) + 348) = a2;
  *(unsigned char *)(*(void *)(result + 32) + 339) = a3;
  return result;
}

- (id)dictationConnection:(id)a3 willFilterTokensWithLanguageModel:(id)a4 forFinalize:(BOOL)a5
{
  id v6 = a4;
  int v7 = objc_alloc_init(UIDictationConnectionFilterState);
  id v8 = [(UIDictationController *)self resultTransformForLanguageModel:v6];

  [(UIDictationConnectionFilterState *)v7 setTransform:v8];
  return v7;
}

- (id)dictationBlockForToken:(id)a3
{
  id v4 = [a3 text];
  if (([v4 isEqualToString:@"\\delete"] & 1) != 0
    || [v4 isEqualToString:@"\\backspace"])
  {
    id v5 = aBlock;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    id v6 = __48__UIDictationController_dictationBlockForToken___block_invoke;
LABEL_4:
    void v5[2] = v6;
    v5[3] = &unk_1E52D9F70;
    void v5[4] = self;
    int v7 = _Block_copy(v5);
    goto LABEL_5;
  }
  if ([v4 isEqualToString:@"\\clear"])
  {
    id v5 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    id v6 = __48__UIDictationController_dictationBlockForToken___block_invoke_2;
    goto LABEL_4;
  }
  int v7 = 0;
LABEL_5:
  id v8 = _Block_copy(v7);

  return v8;
}

uint64_t __48__UIDictationController_dictationBlockForToken___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupHypothesisAsFinalResults];
  [*(id *)(a1 + 32) _runFinalizeOperation:1];
  [*(id *)(a1 + 32) setLastHypothesis:&stru_1ED0E84C0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _deleteBackwardIntoText];
}

uint64_t __48__UIDictationController_dictationBlockForToken___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupHypothesisAsFinalResults];
  [*(id *)(a1 + 32) _runFinalizeOperation:1];
  [*(id *)(a1 + 32) setLastHypothesis:&stru_1ED0E84C0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _clearExistingText];
}

- (BOOL)dictationConnection:(id)a3 filterState:(id)a4 shouldCheckpointAtToken:(id)a5
{
  id v7 = a4;
  id v8 = [(UIDictationController *)self dictationBlockForToken:a5];
  id v9 = v8;
  if (v8)
  {
    int v10 = (void *)[v8 copy];
    [v7 setPendingDictationCommand:v10];
  }
  return v9 != 0;
}

- (void)dictationConnection:(id)a3 filterState:(id)a4 processFilteredToken:(id)a5 forFinalize:(BOOL)a6
{
  id v12 = a4;
  id v9 = [v12 pendingDictationCommand];

  if (v9)
  {
    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
  [v11 handleFailureInMethod:a2 object:self file:@"UIDictationController.m" lineNumber:7003 description:@"This should never be called unless there's a pending dictation command!"];

  if (!a6)
  {
LABEL_3:
    int v10 = [v12 pendingDictationCommand];
    v10[2]();
  }
LABEL_4:
  [v12 setPendingDictationCommand:0];
}

- (void)dictationConnection:(id)a3 didFilterTokensWithFilterState:(id)a4 forFinalize:(BOOL)a5
{
  id v7 = objc_msgSend(a4, "pendingDictationCommand", a3);

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"UIDictationController.m" lineNumber:7016 description:@"This should never be called with a pending dictation command!"];
  }
}

- (void)dictationConnectionWillStartRecording:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnectionWillStartRecording:]");

  [(UIDictationController *)self setState:2];
  id v5 = [getAFAnalyticsClass() sharedAnalytics];
  [v5 logEventWithType:1417 context:0];

  id v6 = objc_alloc_init((Class)getSISchemaUEILaunchContextClass());
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2050000000;
  id v7 = (void *)getSISchemaUEILaunchEndedClass_softClass;
  uint64_t v17 = getSISchemaUEILaunchEndedClass_softClass;
  if (!getSISchemaUEILaunchEndedClass_softClass)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __getSISchemaUEILaunchEndedClass_block_invoke;
    v13[3] = &unk_1E52D9900;
    v13[4] = &v14;
    __getSISchemaUEILaunchEndedClass_block_invoke((uint64_t)v13);
    id v7 = (void *)v15[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v14, 8);
  id v9 = objc_alloc_init(v8);
  [v6 setEnded:v9];

  int v10 = [v6 ended];
  [v10 setExists:1];

  [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v6];
  uint64_t v18 = @"dictationLanguage";
  unint64_t v11 = [(UIDictationController *)self currentDictationLanguageForDisplay];
  v19[0] = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];

  [(UIDictationController *)self postNotificationName:@"UIKeyboardDidBeginDictationNotification" userInfo:v12];
}

- (void)dictationConnectionDidStartRecording:(id)a3
{
  char v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnectionDidStartRecording:]");
}

- (void)dictationConnection:(id)a3 didStartRecordingWithOptions:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]");

  self->_localSpeechRecognitionForced = [v5 forceOfflineRecognition];
  self->_secureOfflineOnlySpeechRecognition = [v5 secureOfflineOnly];
  id v6 = _UIDictationControllerLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ([(id)objc_opt_class() canShareDictationData]) {
      id v7 = @"Yes";
    }
    else {
      id v7 = @"No";
    }
    *(_DWORD *)buf = 136315394;
    id v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%s Enhanced dictation logging enabled=%@", buf, 0x16u);
  }

  int v8 = [v5 detectUtterances];
  if (v8) {
    LOBYTE(v8) = [v5 continuousListening];
  }
  self->_detectingUtterances = v8;
  id v9 = _UIDictationControllerLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ([(UIDictationController *)self isDetectingUtterances]) {
      int v10 = @"Yes";
    }
    else {
      int v10 = @"No";
    }
    *(_DWORD *)buf = 136315394;
    id v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%s Utterances detection enabled=%@", buf, 0x16u);
  }

  if (self->_detectingUtterances)
  {
    [(UIDictationController *)self startRecordingLimitTimer];
    BOOL v11 = +[UIKeyboard isMajelEnabled];
    id v12 = +[UIKeyboardInputMode dictationInputMode];
    [v12 setUsingTypeAndTalk:v11];

    id v13 = _UIDictationControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = +[UIKeyboardInputMode dictationInputMode];
      int v15 = [v14 usingTypeAndTalk];
      *(_DWORD *)buf = 136315394;
      id v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
      __int16 v29 = 1024;
      LODWORD(v30) = v15;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%s usingTypeAndTalk = %d", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v16 = +[UIKeyboardInputMode dictationInputMode];
    int v17 = [v16 usingTypeAndTalk];

    if (!v17) {
      goto LABEL_20;
    }
    uint64_t v18 = +[UIKeyboardInputMode dictationInputMode];
    [v18 setUsingTypeAndTalk:0];

    id v13 = _UIDictationControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v28 = "-[UIDictationController dictationConnection:didStartRecordingWithOptions:]";
      _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "%s Failed to setup utterance detection.[FATAL] = ", buf, 0xCu);
    }
  }

LABEL_20:
  self->_ignoreUserInteraction = 0;
  if (+[UIKeyboard isMajelEnabled])
  {
    uint64_t v19 = +[UIKeyboardImpl activeInstance];
    uint64_t v20 = +[UIDictationController sharedInstance];
    uint64_t v21 = [v20 dictationTipController];
    [v21 resetShowModelessTipSignal];

    id v25 = @"reason";
    NSUInteger v26 = @"Dictation connection did start recording";
    NSUInteger v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    [(UIDictationController *)self postNotificationName:@"UIKeyboardDictationAvailabilityDidChangeNotification" userInfo:v22];
  }
  id v23 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v24 = [v23 _textInputSessionAnalytics];
  [v24 didDictationBegin:1 usesMultiModalDictation:self->_detectingUtterances];
}

- (void)dictationConnectionDidEndRecording:(id)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnectionDidEndRecording:]");

  if ([(UIDictationController *)self state] == 2
    && [(UIDictationInputModeOptions *)self->_inputModeOptions shouldStayInDictationInputModeIfAutoEndpointed]&& !+[UIKeyboard isModelessActive])
  {
    [(UIDictationController *)self setShouldStayInDictationInputMode:1];
  }
  if ([(UIDictationController *)self state] != 3)
  {
    [(UIDictationController *)self setState:3];
    [(UIDictationController *)self clearKeyboardTrackpadModeIfNeeded];
    [(UIDictationController *)self setReasonType:31];
    [(UIDictationController *)self postNotificationName:@"UIDictationControllerDictationDidFinish" userInfo:0];
  }
}

- (void)dictationConnectionDidCancelRecording:(id)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnectionDidCancelRecording:]");

  [(UIDictationController *)self setState:0];
}

- (void)dictationConnection:(id)a3 didFailRecordingWithError:(id)a4
{
  id v15 = a4;
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnection:didFailRecordingWithError:]");

  [NSString stringWithFormat:@"%s error: %@", "-[UIDictationController dictationConnection:didFailRecordingWithError:]", v15];
  id v5 = v15;
  if (!self->cancelledByWaitingForLocalResults)
  {
    id v6 = +[UIKeyboardInputModeController sharedInputModeController];
    id v7 = [v6 delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = +[UIKeyboardInputModeController sharedInputModeController];
      int v10 = [v9 delegate];
      [v10 dictationRequestDidFailWithError:v15];
    }
    [(UIDictationController *)self setState:6];
    BOOL v11 = +[UIKeyboardImpl activeInstance];
    id v12 = [v11 inputDelegateManager];
    id v13 = [v12 textInputDelegate];
    uint64_t v14 = [v13 _textSelectingContainer];

    if (objc_opt_respondsToSelector()) {
      [v14 dictationRecognitionFailed];
    }

    id v5 = v15;
  }
}

- (void)dictationConnection:(id)a3 didFailRecognitionWithError:(id)a4
{
  id v5 = a4;
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnection:didFailRecognitionWithError:]");

  [NSString stringWithFormat:@"%s error: %@", "-[UIDictationController dictationConnection:didFailRecognitionWithError:]", v5];
  id v6 = +[UIKeyboardInputModeController sharedInputModeController];
  id v7 = [v6 delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = +[UIKeyboardInputModeController sharedInputModeController];
    int v10 = [v9 delegate];
    [v10 dictationRequestDidFailWithError:v5];
  }
  [(UIDictationController *)self setState:6];
  BOOL v11 = +[UIKeyboardImpl sharedInstance];
  id v12 = [v11 inputDelegate];
  id v13 = [v12 _textSelectingContainer];

  if (objc_opt_respondsToSelector()) {
    [v13 dictationRecognitionFailed];
  }
  uint64_t v14 = [v5 code];
  if ((unint64_t)(v14 - 2) <= 2)
  {
    uint64_t v15 = v14;
    [(UIDictationController *)self _createDictationPresenterWindowIfNecessary];
    uint64_t v16 = [(UIDictationController *)self dictationPresenterWindow];
    [v16 makeKeyAndVisible];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke;
    aBlock[3] = &unk_1E52DC290;
    aBlock[4] = self;
    int v17 = _Block_copy(aBlock);
    switch(v15)
    {
      case 4:
        uint64_t v27 = NSString;
        id v28 = _UIKitBundle();
        __int16 v29 = [v28 localizedStringForKey:@"Dictation Supports On Device Only Body", @"Your device requires voice input to be processed on %@, but supporting data has not been downloaded yet.", @"Localizable" value table];
        +[UIDevice currentDevice];
        uint64_t v31 = v30 = v17;
        id v32 = _UILocalizedNameForIdiom([v31 userInterfaceIdiom]);
        uint64_t v24 = objc_msgSend(v27, "stringWithFormat:", v29, v32);

        id v33 = _UIKitBundle();
        uint64_t v34 = [v33 localizedStringForKey:@"Dictation Supports On Device Only Title" value:@"Dictation not ready" table:@"Localizable"];
        id v23 = +[UIAlertController alertControllerWithTitle:v34 message:v24 preferredStyle:1];

        uint64_t v35 = _UIKitBundle();
        uint64_t v36 = [v35 localizedStringForKey:@"Dictation Supports On Device Only Close" value:@"Close" table:@"Localizable"];
        char v37 = +[UIAlertAction actionWithTitle:v36 style:1 handler:v30];
        [v23 addAction:v37];

        int v17 = v30;
        double v38 = _UIKitBundle();
        id v39 = [v38 localizedStringForKey:@"Dictation Supports On Device Only Learn More" value:@"Learn More…" table:@"Localizable"];
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_3;
        v56[3] = &unk_1E52FB230;
        id v57 = v17;
        id v40 = +[UIAlertAction actionWithTitle:v39 style:0 handler:v56];
        [v23 addAction:v40];

        id v25 = v57;
        break;
      case 3:
        id v41 = NSString;
        id v42 = _UIKitBundle();
        uint64_t v43 = [v42 localizedStringForKey:@"Dictation On Device Model Required Body", @"An installed device management profile requires voice input to be processed on %@, but supporting data has not been downloaded yet.", @"Localizable" value table];
        +[UIDevice currentDevice];
        v45 = uint64_t v44 = v17;
        NSUInteger v46 = _UILocalizedNameForIdiom([v45 userInterfaceIdiom]);
        uint64_t v24 = objc_msgSend(v41, "stringWithFormat:", v43, v46);

        __int16 v47 = _UIKitBundle();
        double v48 = [v47 localizedStringForKey:@"Dictation On Device Model Required Title" value:@"Dictation Unavailable" table:@"Localizable"];
        id v23 = +[UIAlertController alertControllerWithTitle:v48 message:v24 preferredStyle:1];

        __int16 v49 = _UIKitBundle();
        uint64_t v50 = [v49 localizedStringForKey:@"Dictation On Device Model Required Close" value:@"Close" table:@"Localizable"];
        uint64_t v51 = +[UIAlertAction actionWithTitle:v50 style:1 handler:v44];
        [v23 addAction:v51];

        int v17 = v44;
        uint64_t v52 = _UIKitBundle();
        uint64_t v53 = [v52 localizedStringForKey:@"Dictation On Device Model Required Learn More" value:@"Learn More…" table:@"Localizable"];
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_2;
        v58[3] = &unk_1E52FB230;
        id v59 = v17;
        uint64_t v54 = +[UIAlertAction actionWithTitle:v53 style:0 handler:v58];
        [v23 addAction:v54];

        id v25 = v59;
        break;
      case 2:
        uint64_t v18 = _UIKitBundle();
        [v18 localizedStringForKey:@"Dictation Soon Title" value:@"You Can Start Using\nDictation Soon" table:@"Localizable"];
        v20 = uint64_t v19 = v17;
        uint64_t v21 = _UIKitBundle();
        NSUInteger v22 = [v21 localizedStringForKey:@"Dictation Soon Body" value:@"New users are being added for Dictation every day. You will receive an alert when you can start\nusing Dictation." table:@"Localizable"];
        id v23 = +[UIAlertController alertControllerWithTitle:v20 message:v22 preferredStyle:1];

        int v17 = v19;
        uint64_t v24 = _UIKitBundle();
        id v25 = [v24 localizedStringForKey:@"Dictation Soon OK" value:@"OK" table:@"Localizable"];
        NSUInteger v26 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v17];
        [v23 addAction:v26];

        break;
      default:
LABEL_14:

        goto LABEL_15;
    }

    if (v23)
    {
      long long v55 = [(UIDictationController *)self presentingViewControllerForPrivacySheet];
      [v55 presentViewController:v23 animated:1 completion:0];
    }
    goto LABEL_14;
  }
LABEL_15:
  [(UIDictationController *)self postNotificationName:@"UIDictationControllerDictationDidFinish" userInfo:0];
}

uint64_t __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dictationPresenterWindow];
  [v2 resignKeyWindow];

  char v3 = [*(id *)(a1 + 32) dictationPresenterWindow];
  [v3 setHidden:1];

  id v4 = *(void **)(a1 + 32);
  return [v4 setDictationPresenterWindow:0];
}

void __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_2(uint64_t a1, void *a2)
{
  char v3 = (void *)MEMORY[0x1E4F223E0];
  id v6 = a2;
  id v4 = [v3 defaultWorkspace];
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=Keyboard/DictationSettings"];
  [v4 openSensitiveURL:v5 withOptions:0 error:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __73__UIDictationController_dictationConnection_didFailRecognitionWithError___block_invoke_3(uint64_t a1, void *a2)
{
  char v3 = (void *)MEMORY[0x1E4F223E0];
  id v6 = a2;
  id v4 = [v3 defaultWorkspace];
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=Keyboard/DictationSettings"];
  [v4 openSensitiveURL:v5 withOptions:0 error:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dictationConnection:(id)a3 didBeginLocalRecognitionWithModelInfo:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  objc_msgSend(v5, "stringWithFormat:", @"%s", "-[UIDictationController dictationConnection:didBeginLocalRecognitionWithModelInfo:]");

  [(UIDictationController *)self setModelInfo:v6];
}

- (void)dictationConnectionDidCancelIncompatibleLocalRecognizer:(id)a3
{
  [(UIDictationController *)self _setupHypothesisAsFinalResults];
  [(UIDictationController *)self _runFinalizeOperation:1];
}

- (id)_containingSearchBarForView:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v4 = [v3 superview];

      id v3 = (id)v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    id v3 = v3;
  }
LABEL_6:

  return v3;
}

- (void)dictationConnection:(id)a3 didReceiveSearchResults:(id)a4 recognizedText:(id)a5 stable:(BOOL)a6 final:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v18 = a4;
  id v11 = a5;
  id v12 = +[UIKeyboardImpl sharedInstance];
  id v13 = [v12 inputDelegate];
  uint64_t v14 = [v13 _textSelectingContainer];

  uint64_t v15 = [(UIDictationController *)self _containingSearchBarForView:v14];
  uint64_t v16 = v15;
  if (v15)
  {
    id v17 = v15;

    uint64_t v14 = v17;
  }
  if _UIIsPrivateMainBundle() && (objc_opt_respondsToSelector()) {
    +[UIDictationConnection afDelegate:v14 didReceiveSearchResults:v18 recognizedText:v11 stable:v8 final:v7];
  }
}

- (void)dictationConnection:(id)a3 didDetectLanguage:(id)a4
{
}

- (void)dictationConnectionDidCancel:(id)a3
{
}

- (void)dictationConnectionDidFinish:(id)a3
{
  if (self->_detectingUtterances)
  {
    uint64_t v4 = +[UIDictationLandingView activeInstance];
    int v5 = [v4 canStopLanding];

    if (v5)
    {
      id v6 = +[UIDictationLandingView activeInstance];
      [v6 stopLanding];
    }
    [(UIDictationController *)self cancelDictation];
  }
  [(UIDictationController *)self switchToKeyboardInputModeIfNeeded];
  [(UIDictationController *)self postNotificationName:@"UIDictationControllerDictationDidFinish" userInfo:0];
}

- (void)setCandidateDictationSerializableResults:(id)a3
{
  id v16 = a3;
  p_candidateDictationSerializableResults = &self->_candidateDictationSerializableResults;
  objc_storeStrong((id *)&self->_candidateDictationSerializableResults, a3);
  int v7 = [(id)objc_opt_class() shouldForwardInInputSystemUI];
  BOOL v8 = v16;
  if (v7)
  {
    id v9 = +[UIKeyboardImpl activeInstance];
    int v10 = [v9 inputDelegateManager];
    id v11 = [v10 inputSystemSourceSession];

    if (v11 && ![(UIDictationController *)self isIgnoringRTIChanges])
    {
      id v12 = [v11 textOperations];
      [v12 setCustomInfoType:0x1ED14BAA0];
      id v13 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:3];
      uint64_t v14 = v13;
      if (*p_candidateDictationSerializableResults) {
        [v13 setObject:*p_candidateDictationSerializableResults forKeyedSubscript:@"candidateDictationSerializableResults"];
      }
      uint64_t v15 = NSStringFromSelector(a2);
      [v14 setObject:v15 forKeyedSubscript:@"selector"];

      [v12 setCustomInfo:v14];
      [v11 flushOperations];
    }
    BOOL v8 = v16;
  }
}

- (void)dictationConnection:(id)a3 didReceiveCandidateDictationSerializableResults:(id)a4
{
}

- (void)dictationConnection:(id)a3 didReceivePartialPackage:(id)a4 nluResult:(id)a5 languageModel:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  uint64_t v14 = [v10 recognition];
  uint64_t v15 = [v14 oneBestTokenList];

  [(UIDictationController *)self updateRecordingLimitTimerIfNeeded];
  id v16 = _UIDictationControllerLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v11 commandGrammarParsePackage];
    int v25 = 136315394;
    NSUInteger v26 = "-[UIDictationController dictationConnection:didReceivePartialPackage:nluResult:languageModel:]";
    __int16 v27 = 2112;
    id v28 = v17;
    _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "%s Partial AFVoiceCommandGrammarParsePackage: %@", (uint8_t *)&v25, 0x16u);
  }
  id v18 = [v10 potentialCommandUtterance];
  uint64_t v19 = [v18 recognition];
  uint64_t v20 = [v19 oneBestTranscript];

  uint64_t v21 = [v11 commandGrammarParsePackage];
  LODWORD(v19) = [(UIDictationController *)self _shouldSuppressPartialForVoiceCommandGrammarParsePackage:v21 commandPartialString:v20];

  if (v19)
  {
    [(UIDictationController *)self setLastSuppressedCommandPartialTokens:v15];
    NSUInteger v22 = [v10 potentialCommandPrecedingUtterance];
    id v23 = [v22 recognition];
    uint64_t v24 = [v23 oneBestTokenList];

    uint64_t v15 = (void *)v24;
  }
  else
  {
    [(UIDictationController *)self setLastSuppressedCommandPartialTokens:0];
  }
  [v13 synthesizeDidRecognizeTokens:v15 languageModel:v12];
}

- (void)dictationConnection:(id)a3 didReceiveVoiceCommandCandidatePackage:(id)a4 nluResult:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(UIDictationController *)self updateRecordingLimitTimerIfNeeded];
  id v11 = [v10 commandGrammarParsePackage];

  id v12 = _UIDictationControllerLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    __int16 v38 = 2112;
    id v39 = v11;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%s commandGrammarParsePackage: %@", buf, 0x16u);
  }

  id v13 = [(UIDictationController *)self _voiceCommandGrammarParseResultWithParsePackage:v11 completeCommands:1];
  if ([(UIDictationController *)self isProcessingPotentialVoiceCommand])
  {
    uint64_t v14 = _UIDictationControllerLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    uint64_t v15 = "%s Skipping processing of potential voice command because we are already processing another one";
LABEL_16:
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
    goto LABEL_21;
  }
  if (!v13)
  {
    uint64_t v14 = _UIDictationControllerLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315138;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    uint64_t v15 = "%s No command garmmar parse candidate was extracted, so skipping";
    goto LABEL_16;
  }
  id v16 = +[UIDictationUtilities dictationVoiceCommandParametersFromAFVoiceCommandGrammarParseCandidate:v13];
  id v17 = [v13 commandId];
  id v18 = [v13 voiceCommandUUID];
  uint64_t v19 = _UIDictationControllerLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    __int16 v38 = 2112;
    id v39 = v13;
    _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "%s commandGrammarParseCandidate: %@", buf, 0x16u);
  }

  uint64_t v20 = _UIDictationControllerLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "%s Setting isProcessingPotentialVoiceCommand to YES", buf, 0xCu);
  }

  [(UIDictationController *)self setIsProcessingPotentialVoiceCommand:1];
  BOOL v21 = [(UIDictationController *)self haveReceivedFirstPartialResultForCurrentUtterance];
  NSUInteger v22 = _UIDictationControllerUndoRedoLog();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v21)
  {
    if (v23)
    {
      *(_DWORD *)buf = 136315138;
      char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
      uint64_t v24 = "%s Setting haveLeakedPartialResultForCommandUtterance to YES";
LABEL_19:
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
    }
  }
  else if (v23)
  {
    *(_DWORD *)buf = 136315138;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    uint64_t v24 = "%s Setting haveLeakedPartialResultForCommandUtterance to NO";
    goto LABEL_19;
  }

  [(UIDictationController *)self setHaveLeakedPartialResultForCommandUtterance:v21];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __94__UIDictationController_dictationConnection_didReceiveVoiceCommandCandidatePackage_nluResult___block_invoke;
  v28[3] = &unk_1E52FABD8;
  v28[4] = self;
  id v29 = v17;
  id v30 = v16;
  id v31 = v18;
  id v32 = v9;
  id v33 = v8;
  id v34 = v11;
  id v35 = v13;
  id v25 = v18;
  id v26 = v16;
  uint64_t v14 = v17;
  [(UIDictationController *)self requestVisibleTextWithCompletionBlock:v28];

LABEL_21:
  __int16 v27 = _UIDictationControllerUndoRedoLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    char v37 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]";
    _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "%s Updating haveReceivedFirstPartialResultForCurrentUtterance to NO", buf, 0xCu);
  }

  [(UIDictationController *)self setHaveReceivedFirstPartialResultForCurrentUtterance:0];
}

void __94__UIDictationController_dictationConnection_didReceiveVoiceCommandCandidatePackage_nluResult___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setVisibleRTIDocumentStateAtCommandRecognition:v4];
  int v5 = [v4 documentState];

  id v6 = [v5 selectedText];

  objc_msgSend(*(id *)(a1 + 32), "setHasSelectedTextRange:", objc_msgSend(v6, "length") != 0);
  if ([*(id *)(a1 + 32) canApplyVoiceCommandWithIdentifier:*(void *)(a1 + 40) parameters:*(void *)(a1 + 48) commandUtteranceString:0 voiceCommandUUID:*(void *)(a1 + 56)])
  {
    uint64_t v7 = [(id)objc_opt_class() commandIdentifierWithStringIdentifier:*(void *)(a1 + 40)];
    if (v7 != 21 && v7 != 27)
    {
      id v8 = _UIDictationControllerUndoRedoLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v32 = 136315138;
        id v33 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]_block_invoke";
        _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s Command is neither undo nor redo, so ending and beginning undo grouping if necessary", (uint8_t *)&v32, 0xCu);
      }

      [*(id *)(a1 + 32) _endUndoGroupingIfNecessary];
      [*(id *)(a1 + 32) _beginUndoGroupingIfNecessary];
    }
    id v9 = [*(id *)(a1 + 64) potentialCommandPrecedingUtterance];
    id v10 = v9;
    if (v9)
    {
      id v11 = [v9 recognition];
      id v12 = [v11 phrases];
      uint64_t v13 = [v12 count];

      if (v13)
      {
        uint64_t v14 = *(void **)(a1 + 72);
        uint64_t v15 = [v10 recognition];
        id v16 = [v15 phrases];
        [v14 synthesizeDidRecognizePhrases:v16 languageModel:0 correctionIdentifier:0];
      }
    }
    id v17 = *(void **)(a1 + 32);
    id v18 = [*(id *)(a1 + 80) nBestParses];
    uint64_t v19 = [v18 firstObject];
    uint64_t v20 = [v19 utterance];
    uint64_t v21 = *(void *)(a1 + 40);
    if ([*(id *)(a1 + 48) count]) {
      uint64_t v22 = *(void *)(a1 + 48);
    }
    else {
      uint64_t v22 = 0;
    }
    char v29 = [v17 handleASRVoiceCommandRecognizedWithUtterance:v20 commandIdentifier:v21 parameters:v22 voiceCommandUUID:*(void *)(a1 + 56)];

    if ((v29 & 1) == 0)
    {
      id v30 = _UIDictationControllerLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 88);
        int v32 = 136315394;
        id v33 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]_block_invoke";
        __int16 v34 = 2112;
        uint64_t v35 = v31;
        _os_log_error_impl(&dword_1853B0000, v30, OS_LOG_TYPE_ERROR, "%s Command applicability check passed, command not handled. This should not happen: %@", (uint8_t *)&v32, 0x16u);
      }

      [*(id *)(a1 + 32) resetDictation];
    }
  }
  else
  {
    BOOL v23 = _UIDictationControllerLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136315138;
      id v33 = "-[UIDictationController dictationConnection:didReceiveVoiceCommandCandidatePackage:nluResult:]_block_invoke";
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting isProcessingPotentialVoiceCommand to NO", (uint8_t *)&v32, 0xCu);
    }

    [*(id *)(a1 + 32) setIsProcessingPotentialVoiceCommand:0];
    uint64_t v24 = [*(id *)(a1 + 32) lastSuppressedCommandPartialTokens];

    if (v24)
    {
      id v25 = *(void **)(a1 + 72);
      id v26 = [*(id *)(a1 + 32) lastSuppressedCommandPartialTokens];
      [v25 synthesizeDidRecognizeTokens:v26 languageModel:0];
    }
    __int16 v27 = [*(id *)(a1 + 64) recognition];
    id v10 = [v27 phrases];

    id v28 = [*(id *)(a1 + 72) dictationSerializedResultWithPhrases:v10 languageModel:0];
    [*(id *)(a1 + 32) dictationConnection:*(void *)(a1 + 72) didReceiveCandidateDictationSerializableResults:v28];
  }
}

+ (void)didBeginEditingInTextView:(id)a3
{
  if (+[UIDictationController isRunning])
  {
    id v3 = +[UIDictationController sharedInstance];
    [v3 cancelDictation];
  }
  id v4 = +[UIDictationController sharedInstance];
  [v4 setWantsAvailabilityMonitoringWhenAppActive:1];
}

+ (id)stringForState:(int)a3
{
  if (a3 > 6) {
    return @"Unknown state";
  }
  else {
    return off_1E52FB368[a3];
  }
}

+ (id)stringForViewMode:(int)a3
{
  if (a3 > 7) {
    return @"Unknown state";
  }
  else {
    return off_1E52FB3A0[a3];
  }
}

+ (void)poppedLastStreamingOperation
{
  uint64_t v2 = +[UIDictationController sharedInstance];
  int v3 = [v2 state];

  if (v3 == 5)
  {
    id v4 = +[UIDictationController sharedInstance];
    [v4 setState:0];
  }
}

- (BOOL)isRecievingResults
{
  return self->_recievingResults;
}

- (void)preheatIfNecessary
{
  if (![(UIDictationController *)self hasPreheated])
  {
    int v3 = [(UIDictationController *)self dictationConnection];
    [v3 preheat];

    [(UIDictationController *)self setHasPreheated:1];
  }
}

- (id)language
{
  if (+[UIDictationController viewMode])
  {
    int v3 = self->_language;
  }
  else
  {
    int v3 = [(UIDictationConnectionPreferences *)self->_preferences languageCode];
  }
  return v3;
}

- (void)setLanguage:(id)a3
{
  int v5 = (NSString *)a3;
  language = self->_language;
  p_language = &self->_language;
  if (language != v5)
  {
    id v8 = v5;
    objc_storeStrong((id *)p_language, a3);
    int v5 = v8;
  }
}

- (void)prepareStartDictationKeyboardGestures
{
  int v3 = +[UIKeyboardImpl activeInstance];
  int v4 = [v3 hardwareKeyboardAttached];

  if (v4)
  {
    id v7 = +[UIKeyboardImpl activeInstance];
    int v5 = [v7 inputDelegateManager];
    id v6 = [v5 keyInputDelegate];
    [(UIDictationController *)self prepareStartDictationKeyboardGesturesForDelegate:v6];
  }
  else
  {
    [(UIDictationController *)self removeStartDictationKeyboardGestures];
  }
}

- (void)prepareDoubleTapShortcutGesture:(id)a3
{
  id v14 = a3;
  hardwareShortcutRecognizer = self->_hardwareShortcutRecognizer;
  if (!hardwareShortcutRecognizer)
  {
    int v5 = [[_UITapTapHoldGestureRecognizer alloc] initWithTarget:self action:sel_dictationShortCutKey_];
    id v6 = self->_hardwareShortcutRecognizer;
    self->_hardwareShortcutRecognizer = v5;

    [(UITapGestureRecognizer *)self->_hardwareShortcutRecognizer setIsSingleKeyPressGesture:1];
    hardwareShortcutRecognizer = self->_hardwareShortcutRecognizer;
  }
  id v7 = [(UIGestureRecognizer *)hardwareShortcutRecognizer view];

  if (!v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v14;
    }
    else
    {
      id v8 = [v14 textInputView];
    }
    id v9 = v8;
    if (!v8)
    {
      +[UIWindowScene _keyWindowScene]();
      id v10 = (id *)objc_claimAutoreleasedReturnValue();
      id v9 = -[UIWindowScene _keyWindow](v10);
    }
    [v9 addGestureRecognizer:self->_hardwareShortcutRecognizer];
  }
  id v11 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v12 = [v11 valueForPreferenceKey:*MEMORY[0x1E4FAE600]];
  uint64_t v13 = (int)[v12 intValue];

  [(UIDictationController *)self updateDoubleTapShortcutWithPreference:v13];
}

- (void)prepareVoiceCommandSingleTapGesture:(id)a3
{
  id v11 = a3;
  hardwareVoiceCommandKeyRecognizer = self->_hardwareVoiceCommandKeyRecognizer;
  if (!hardwareVoiceCommandKeyRecognizer)
  {
    int v5 = [(UITapGestureRecognizer *)[_UIVoiceCommandButtonTapGestureRecognizer alloc] initWithTarget:self action:sel_voiceCommandSingleTapKey_];
    id v6 = self->_hardwareVoiceCommandKeyRecognizer;
    self->_hardwareVoiceCommandKeyRecognizer = v5;

    [(UITapGestureRecognizer *)self->_hardwareVoiceCommandKeyRecognizer setIsSingleKeyPressGesture:1];
    [(UITapGestureRecognizer *)self->_hardwareVoiceCommandKeyRecognizer setMaximumTapDuration:0.25];
    hardwareVoiceCommandKeyRecognizer = self->_hardwareVoiceCommandKeyRecognizer;
  }
  id v7 = [(UIGestureRecognizer *)hardwareVoiceCommandKeyRecognizer view];

  if (!v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v11;
    }
    else
    {
      id v8 = [v11 textInputView];
    }
    id v9 = v8;
    if (!v8)
    {
      +[UIWindowScene _keyWindowScene]();
      id v10 = (id *)objc_claimAutoreleasedReturnValue();
      id v9 = -[UIWindowScene _keyWindow](v10);
    }
    [v9 addGestureRecognizer:self->_hardwareVoiceCommandKeyRecognizer];
  }
  [(UITapGestureRecognizer *)self->_hardwareVoiceCommandKeyRecognizer setAllowedPressTypes:&unk_1ED3F0580];
  [(UIGestureRecognizer *)self->_hardwareVoiceCommandKeyRecognizer setAllowedTouchTypes:&unk_1ED3F0598];
}

- (void)prepareStartDictationKeyboardGesturesForDelegate:(id)a3
{
  id v6 = a3;
  [(UIDictationController *)self removeStartDictationKeyboardGestures];
  int v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 hardwareKeyboardAttached];

  if (v5)
  {
    [(UIDictationController *)self prepareDoubleTapShortcutGesture:v6];
    [(UIDictationController *)self prepareVoiceCommandSingleTapGesture:v6];
  }
}

- (void)removeStartDictationKeyboardGestures
{
  hardwareShortcutRecognizer = self->_hardwareShortcutRecognizer;
  if (hardwareShortcutRecognizer)
  {
    int v4 = [(UIGestureRecognizer *)hardwareShortcutRecognizer view];
    [v4 removeGestureRecognizer:self->_hardwareShortcutRecognizer];

    int v5 = self->_hardwareShortcutRecognizer;
    self->_hardwareShortcutRecognizer = 0;
  }
  hardwareVoiceCommandKeyRecognizer = self->_hardwareVoiceCommandKeyRecognizer;
  if (hardwareVoiceCommandKeyRecognizer)
  {
    id v7 = [(UIGestureRecognizer *)hardwareVoiceCommandKeyRecognizer view];
    [v7 removeGestureRecognizer:self->_hardwareVoiceCommandKeyRecognizer];

    id v8 = self->_hardwareVoiceCommandKeyRecognizer;
    self->_hardwareVoiceCommandKeyRecognizer = 0;
  }
}

- (void)updateDoubleTapShortcutWithPreference:(int64_t)a3
{
  if (self->_currentShortcutType != a3
    || ([(UIGestureRecognizer *)self->_hardwareShortcutRecognizer allowedPressTypes],
        int v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        !v6))
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
    id v8 = &unk_1ED3F05E0;
    if (a3 == 1) {
      id v7 = &unk_1ED3F05F8;
    }
    else {
      id v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (a3) {
      id v9 = v8;
    }
    else {
      id v9 = &unk_1ED3F05B0;
    }
    if (a3) {
      id v10 = v7;
    }
    else {
      id v10 = &unk_1ED3F05C8;
    }
    [(UITapGestureRecognizer *)self->_hardwareShortcutRecognizer setAllowedPressTypes:v9];
    [(UIGestureRecognizer *)self->_hardwareShortcutRecognizer setAllowedTouchTypes:v10];
    self->_currentShortcutType = a3;
  }
}

- (void)handleHardwareKeyboardGesture
{
  if (+[UIDictationController isRunning])
  {
    uint64_t v2 = +[UIDictationController sharedInstance];
    [v2 stopDictation];

    id v4 = +[UIKeyboardImpl activeInstance];
    [v4 clearDictationMenuTimer];
  }
  else
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    if ([v4 shouldShowDictationKey])
    {
      int v3 = [(id)objc_opt_class() dictationIsFunctional];

      if (!v3) {
        return;
      }
      id v4 = +[UIDictationController sharedInstance];
      [v4 switchToDictationInputMode];
    }
  }
}

- (void)dictationShortCutKey:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    if (+[UIDictationController isRunning]) {
      [v4 setState:4];
    }
    [(UIDictationController *)self setReasonType:21];
    [(UIDictationController *)self handleHardwareKeyboardGesture];
  }
  if ([v4 state] == 3
    && ([v4 gestureType] != 1
     || +[UIDictationController isRunning]))
  {
    [(UIDictationController *)self setReasonType:21];
    [(UIDictationController *)self handleHardwareKeyboardGesture];
  }
}

- (void)voiceCommandSingleTapKey:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (_UIVoiceCommandButtonTapGestureRecognizer *)a3;
  if ([(UIGestureRecognizer *)v4 state] == UIGestureRecognizerStateEnded
    && self->_hardwareVoiceCommandKeyRecognizer == v4)
  {
    int v5 = [(_UIVoiceCommandButtonTapGestureRecognizer *)v4 voiceCommandButtonTapDuration];
    [(UITapGestureRecognizer *)self->_hardwareVoiceCommandKeyRecognizer maximumTapDuration];
    double v7 = v6;
    id v8 = _UIDictationControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      [v5 doubleValue];
      int v11 = 136315650;
      id v12 = "-[UIDictationController voiceCommandSingleTapKey:]";
      __int16 v13 = 2048;
      uint64_t v14 = v9;
      __int16 v15 = 2048;
      double v16 = v7;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s Triggered with: tapDuration=%f, maxTapDuration=%f", (uint8_t *)&v11, 0x20u);
    }

    if (v5)
    {
      [v5 doubleValue];
      if (v10 <= v7)
      {
        [(UIDictationController *)self setReasonType:22];
        [(UIDictationController *)self handleHardwareKeyboardGesture];
      }
    }
  }
}

- (void)preferencesChanged:(id)a3
{
  id v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 hardwareKeyboardAttached];

  if (v5)
  {
    double v6 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    double v7 = [v6 valueForPreferenceKey:*MEMORY[0x1E4FAE600]];
    uint64_t v8 = (int)[v7 intValue];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __44__UIDictationController_preferencesChanged___block_invoke;
    v9[3] = &unk_1E52D9CD0;
    void v9[4] = self;
    v9[5] = v8;
    dispatch_async(MEMORY[0x1E4F14428], v9);
  }
}

uint64_t __44__UIDictationController_preferencesChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDoubleTapShortcutWithPreference:*(void *)(a1 + 40)];
}

- (void)_beginOfflineMetricsSession
{
  if (!self->_isOfflineMetricsSessionActive)
  {
    self->_lastOfflineDictationMetricEvent = 0;
    *(_WORD *)&self->_isOfflineMetricsSessionActive = 1;
  }
}

- (void)_endOfflineMetricsSession
{
  if (self->_isOfflineMetricsSessionActive)
  {
    int64_t lastOfflineDictationMetricEvent = self->_lastOfflineDictationMetricEvent;
    if (lastOfflineDictationMetricEvent == 1)
    {
      id AFAggregatorClass = getAFAggregatorClass();
      int v5 = [(UIDictationController *)self _currentLanguageForOfflineDictationMetrics];
      [AFAggregatorClass logDictationFollowedByContinueOccurredForLanguage:v5];
    }
    else
    {
      if (lastOfflineDictationMetricEvent != 2 || self->_didUseOfflineDictation) {
        goto LABEL_11;
      }
      id v7 = getAFAggregatorClass();
      int v5 = [(UIDictationController *)self _currentLanguageForOfflineDictationMetrics];
      [v7 logKeyboardInputFollowedByContinueOccurredForLanguage:v5];
    }

LABEL_11:
    self->_isOfflineMetricsSessionActive = 0;
  }
}

- (id)_assistantCompatibleLanguageCodeForInputMode:(id)a3
{
  id v3 = a3;
  id v4 = TIInputModeGetLanguage();
  TIInputModeGetRegion();
  int v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ([v4 isEqualToString:@"ko"]
    && [(__CFString *)v5 isEqualToString:@"KO"])
  {

    int v5 = @"KR";
LABEL_5:
    id v6 = [NSString stringWithFormat:@"%@-%@", v4, v5];

    goto LABEL_7;
  }
  if (v5) {
    goto LABEL_5;
  }
  id v6 = v4;
LABEL_7:

  return v6;
}

- (id)_currentLanguageForOfflineDictationMetrics
{
  id v3 = [(UIDictationController *)self currentInputModeForDictation];
  id v4 = [v3 dictationLanguage];
  int v5 = [(UIDictationController *)self _assistantCompatibleLanguageCodeForInputMode:v4];

  return v5;
}

- (void)_markOfflineDictationInputMetricEvent
{
  if (self->_isOfflineMetricsSessionActive)
  {
    self->_didUseOfflineDictation = 1;
    self->_int64_t lastOfflineDictationMetricEvent = 1;
  }
}

- (void)markKeyboardInputMetricEvent
{
  if (self->_isOfflineMetricsSessionActive)
  {
    if (self->_lastOfflineDictationMetricEvent == 1)
    {
      id AFAggregatorClass = getAFAggregatorClass();
      id v4 = [(UIDictationController *)self _currentLanguageForOfflineDictationMetrics];
      [AFAggregatorClass logDictationFollowedByKeyboardInputOccurredForLanguage:v4];
    }
    self->_int64_t lastOfflineDictationMetricEvent = 2;
  }
}

- (void)markDictationTipInputEvent
{
  self->_lastKeyboardMetricEvent = 2;
}

- (void)markDictationTipDeletionEvent:(id)a3 deletedTextRange:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  if (self->_lastKeyboardMetricEvent != 3
    || !+[UIDictationController isRunning])
  {
    [(UIDictationTipController *)self->_dictationTipController resetDeletionEventCount];
  }
  -[UIDictationTipController addDeletionEventCount:deletedTextRange:](self->_dictationTipController, "addDeletionEventCount:deletedTextRange:", v7, location, length);
  self->_lastKeyboardMetricEvent = 3;
}

- (void)markDictationTipKeyboardEventReset
{
  self->_lastKeyboardMetricEvent = 0;
}

- (int64_t)consecutiveKeyboardDeleteEventCount
{
  return [(UIDictationTipController *)self->_dictationTipController currentDeletionEventCount];
}

- (void)markKeyboardDeleteMetricEvent
{
  if (self->_isOfflineMetricsSessionActive)
  {
    if (self->_lastOfflineDictationMetricEvent == 1)
    {
      id AFAggregatorClass = getAFAggregatorClass();
      id v4 = [(UIDictationController *)self _currentLanguageForOfflineDictationMetrics];
      [AFAggregatorClass logDictationFollowedByKeyboardDeleteOccurredForLanguage:v4];
    }
    self->_int64_t lastOfflineDictationMetricEvent = 3;
  }
}

- (void)markKeyboardDidReset
{
  if (self->_isOfflineMetricsSessionActive)
  {
    self->_didUseOfflineDictation = 0;
    self->_int64_t lastOfflineDictationMetricEvent = 0;
  }
}

- (void)overrideSmartLanguageSelection:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIDictationController *)self setSmartLanguageSelectionOverrideLanguage:v4];
  int v5 = _UIDictationControllerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v15 = "-[UIDictationController overrideSmartLanguageSelection:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%s Dictation language: %@", buf, 0x16u);
  }

  id v6 = [getAFAnalyticsClass() sharedAnalytics];
  id v7 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
  v13[0] = v7;
  v12[1] = @"correctionIdentifier";
  uint64_t v8 = [(UIDictationController *)self lastCorrectionIdentifier];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1E4F1CC08];
  if (v8) {
    uint64_t v10 = v8;
  }
  v13[1] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v6 logEventWithType:2219 context:v11];
}

- (BOOL)smartLanguageSelectionOverridden
{
  uint64_t v2 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)rtiInputSessionWillChangeToNewProcess:(id)a3
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    if (+[UIDictationController isRunning])
    {
      [(UIDictationController *)self setAppState:0];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__UIDictationController_rtiInputSessionWillChangeToNewProcess___block_invoke;
      block[3] = &unk_1E52D9F70;
      void block[4] = self;
      dispatch_sync(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __63__UIDictationController_rtiInputSessionWillChangeToNewProcess___block_invoke(uint64_t a1)
{
  uint64_t result = +[UIKeyboard isKeyboardProcess];
  if (result)
  {
    uint64_t result = +[UIDictationController isRunning];
    if (result)
    {
      BOOL v3 = *(void **)(a1 + 32);
      return [v3 performIgnoringRTIChanges:&__block_literal_global_1231_0];
    }
  }
  return result;
}

void __63__UIDictationController_rtiInputSessionWillChangeToNewProcess___block_invoke_2()
{
  id v0 = +[UIDictationController sharedInstance];
  [v0 stopDictationIgnoreFinalizePhrases];
}

- (void)keyboardDidHide:(id)a3
{
  id v4 = +[UIDictationView activeInstance];
  char v5 = [v4 switchingLanguage];

  if ((v5 & 1) == 0)
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    if ([(UIDictationController *)self shouldStayInDictationInputMode])
    {
      [(UIDictationController *)self setShouldStayInDictationInputMode:0];
      id v7 = [(UIDictationController *)self keyboardInputModeToReturn];
      [v6 setKeyboardInputMode:v7 userInitiated:0];
    }
    else if (([v6 _shouldSuppressSoftwareKeyboard] & 1) == 0 {
           && ([v6 isInHardwareKeyboardMode] & 1) == 0
    }
           && ![(UIDictationController *)self ignoreKeyboardDidHideNotification])
    {
      [(UIDictationController *)self stopDictationIgnoreFinalizePhrases];
    }
  }
  [(UIDictationController *)self setIgnoreKeyboardDidHideNotification:0];
}

+ (BOOL)isDictationSearchBarButtonVisible
{
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  BOOL v3 = [v2 inputDelegate];

  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0
    && [v3 showDictationButton]
    && [v3 isEditing]
    && ![v3 hasText];

  return v4;
}

+ (id)textRelatedMetadataKeys
{
  if (qword_1EB25AA00 != -1) {
    dispatch_once(&qword_1EB25AA00, &__block_literal_global_1233_0);
  }
  uint64_t v2 = (void *)qword_1EB25A9F8;
  return v2;
}

void __48__UIDictationController_textRelatedMetadataKeys__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"fullText", @"originalText", @"replacementText", @"bestAlternatives", @"bestText", @"text", @"text", 0);
  id v1 = (void *)qword_1EB25A9F8;
  qword_1EB25A9F8 = v0;
}

+ (id)arrayWithTextEntriesRemoved:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F1CA48] array];
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
        int v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = [a1 arrayWithTextEntriesRemoved:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_msgSend(a1, "dictionaryWithTextEntriesRemoved:", v11, (void)v15);
            id v12 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v12 = v11;
          }
        }
        __int16 v13 = v12;
        objc_msgSend(v5, "addObject:", v12, (void)v15);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)dictionaryWithTextEntriesRemoved:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = [v4 dictionary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __58__UIDictationController_dictionaryWithTextEntriesRemoved___block_invoke;
  v9[3] = &unk_1E52FAC00;
  id v11 = a1;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v9];

  return v7;
}

void __58__UIDictationController_dictionaryWithTextEntriesRemoved___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [(id)objc_opt_class() textRelatedMetadataKeys];
  char v7 = [v6 containsObject:v12];

  if (v7)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v9 = @"*";
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(id)objc_opt_class() arrayWithTextEntriesRemoved:v5];
LABEL_7:
    id v11 = (__CFString *)v10;

    id v5 = v11;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(id)objc_opt_class() dictionaryWithTextEntriesRemoved:v5];
    goto LABEL_7;
  }
LABEL_8:
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = v5;
LABEL_9:
  [v8 setObject:v9 forKey:v12];
}

+ (id)whitelistedDictationMetadataKeys
{
  if (qword_1EB25AA10 != -1) {
    dispatch_once(&qword_1EB25AA10, &__block_literal_global_1236);
  }
  uint64_t v2 = (void *)qword_1EB25AA08;
  return v2;
}

void __57__UIDictationController_whitelistedDictationMetadataKeys__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"characterModificationCount", @"characterInsertionCount", @"characterDeletionCount", @"characterSubstitutionCount", @"correctionIdentifier", @"dictationUIInteractionIdentifier", @"fullText", @"speechRecognitionSource", @"multilingualIsLowConfidence", @"bestAlternatives", @"bestText", @"alternativesSelectedCount", @"alternativesSelected", @"insertions", @"deletions", @"substitutions", @"insertion",
         @"deletion",
         0);
  id v1 = (void *)qword_1EB25AA08;
  qword_1EB25AA08 = v0;
}

+ (id)whitelistedDictationDictionaryFromMetadata:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[UIDictationController whitelistedDictationMetadataKeys];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
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
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsObject:", v11, (void)v14))
        {
          id v12 = [v6 objectForKeyedSubscript:v11];
          [v5 setObject:v12 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)shouldRemoveTextEntries:(id)a3
{
  id v4 = a3;
  if ([a1 canShareDictationData])
  {
    id v5 = [v4 objectForKey:@"speechRecognitionSource"];
    if ([v5 isEqualToString:@"local"]) {
      int v6 = os_variant_has_internal_diagnostics() ^ 1;
    }
    else {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

+ (BOOL)canShareDictationData
{
  id v3 = [a1 sharedInstance];
  char v4 = [v3 isDetectingUtterances];

  if ((v4 & 1) == 0)
  {
    id v5 = [a1 sharedInstance];
    int v6 = [v5 secureOfflineOnlySpeechRecognition];

    if (!v6) {
      return 1;
    }
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v9 = [getAFPreferencesClass_0() sharedPreferences];
      BOOL v7 = [v9 siriDataSharingOptInStatus] == 1;

      return v7;
    }
  }
  return 0;
}

+ (BOOL)shouldRemoveTextEntries
{
  return [a1 canShareDictationData] ^ 1;
}

+ (id)removeTextIfNeeded:(id)a3
{
  id v3 = (__CFString *)a3;
  if (v3 && ([(id)objc_opt_class() shouldRemoveTextEntries] & 1) != 0) {
    char v4 = @"*";
  }
  else {
    char v4 = v3;
  }
  id v5 = v4;

  return v5;
}

+ (id)removeTextIfNeeded:(id)a3 metadata:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  if (v5 && ([(id)objc_opt_class() shouldRemoveTextEntries:v6] & 1) != 0) {
    BOOL v7 = @"*";
  }
  else {
    BOOL v7 = v5;
  }
  uint64_t v8 = v7;

  return v8;
}

+ (id)whitelistedDictationDictionariesFromMetadataDictionaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend((id)objc_opt_class(), "whitelistedDictationDictionaryFromMetadata:", v10, (void)v16);
        if (v11)
        {
          id v12 = (void *)v11;
          if ([(id)objc_opt_class() shouldRemoveTextEntries:v10])
          {
            uint64_t v13 = [(id)objc_opt_class() dictionaryWithTextEntriesRemoved:v12];

            id v12 = (void *)v13;
          }
          [v4 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  long long v14 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];

  return v14;
}

+ (id)activeSLSDictationLanguages
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!_os_feature_enabled_impl())
  {
    uint64_t v9 = 0;
    goto LABEL_32;
  }
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__126;
  uint64_t v36 = __Block_byref_object_dispose__126;
  uint64_t v2 = +[UIDictationConnectionPreferences sharedInstance];
  id v37 = [v2 dictationSLSEnabledLanguages];

  id v3 = +[UIKeyboardInputModeController sharedInputModeController];
  if ([(id)v33[5] count])
  {
    char v4 = _UIDictationControllerLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
      uint64_t v6 = [v5 preferencesActions];
      uint64_t v7 = [v6 valueForPreferenceKey:@"DictationLanguagesEnabled"];
      uint64_t v8 = v33[5];
      *(_DWORD *)buf = 136315650;
      uint64_t v40 = "+[UIDictationController activeSLSDictationLanguages]";
      __int16 v41 = 2112;
      id v42 = v7;
      __int16 v43 = 2112;
      uint64_t v44 = v8;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Getting dictation languages: enabledDictationLanguages %@ enabledSLSDictationLanguages %@", buf, 0x20u);
    }
  }
  else
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__UIDictationController_activeSLSDictationLanguages__block_invoke;
    v31[3] = &unk_1E52FAC28;
    v31[4] = &v32;
    [v3 updateEnabledDictationAndSLSLanguagesWithCompletionBlock:v31];
  }
  id v25 = [(id)v33[5] keysOfEntriesPassingTest:&__block_literal_global_1241];
  if ((unint64_t)[v25 count] >= 2)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA80];
    uint64_t v11 = [v3 enabledDictationLanguages];
    id v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = MEMORY[0x1E4F1CBF0];
    }
    id v26 = objc_msgSend(v10, "setWithArray:", v13, v25);

    [v26 intersectSet:v25];
    if ((unint64_t)[v26 count] < 2)
    {
      uint64_t v9 = 0;
LABEL_30:

      goto LABEL_31;
    }
    long long v14 = [v3 currentInputMode];
    long long v15 = [v14 languageWithRegion];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v16 = [v3 enabledDictationLanguages];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v17)
    {
      char v18 = 0;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v22 = [v3 keyboardLanguageForDictationLanguage:v21];
          int v23 = [v22 isEqualToString:v15];

          if (v23)
          {
            if ([v26 containsObject:v21]) {
              goto LABEL_27;
            }
            char v18 = 1;
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v17);

      if (v18)
      {
        uint64_t v9 = 0;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
LABEL_27:
    }
    uint64_t v9 = [v26 allObjects];
    goto LABEL_29;
  }
  uint64_t v9 = 0;
LABEL_31:

  _Block_object_dispose(&v32, 8);
LABEL_32:
  return v9;
}

void __52__UIDictationController_activeSLSDictationLanguages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  uint64_t v7 = _UIDictationControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "+[UIDictationController activeSLSDictationLanguages]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s Generated since no existing defafult for SLS languages: enabledDictationLanguages %@ enabledSLSDictationLanguages %@", (uint8_t *)&v8, 0x20u);
  }
}

uint64_t __52__UIDictationController_activeSLSDictationLanguages__block_invoke_1239(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 BOOLValue];
}

- (id)dictationUIState
{
  v40[8] = *MEMORY[0x1E4F143B8];
  v39[0] = @"EnabledDictationLanguages";
  __int16 v38 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v37 = [v38 preferencesActions];
  uint64_t v3 = [v37 valueForPreferenceKey:@"DictationLanguagesEnabled"];
  uint64_t v4 = MEMORY[0x1E4F1CC08];
  uint64_t v36 = (void *)v3;
  if (v3) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CC08];
  }
  v40[0] = v5;
  v39[1] = @"EnabledSLSDictationLanguages";
  uint64_t v35 = [getAFPreferencesClass_0() sharedPreferences];
  uint64_t v6 = [v35 dictationSLSLanguagesEnabled];
  uint64_t v34 = (void *)v6;
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v4;
  }
  v40[1] = v7;
  v39[2] = @"EffectiveEnabledDictationLanguages";
  id v33 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v8 = [v33 enabledDictationLanguages];
  uint64_t v9 = (void *)v8;
  uint64_t v10 = MEMORY[0x1E4F1CBF0];
  if (v8) {
    uint64_t v10 = v8;
  }
  v40[2] = v10;
  v39[3] = @"SmartLanguageSelectionOverridden";
  BOOL v32 = [(UIDictationController *)self smartLanguageSelectionOverridden];
  if (v32)
  {
    id v11 = NSString;
    long long v30 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
    __int16 v12 = [v11 stringWithFormat:@"with %@", v30];
  }
  else
  {
    __int16 v12 = @"No";
  }
  uint64_t v31 = v12;
  v40[3] = v12;
  v39[4] = @"CurrentKeyboardPrimaryLanguage";
  uint64_t v13 = [(UIDictationController *)self currentKeyboardPrimaryLanguage];
  uint64_t v14 = (void *)v13;
  long long v15 = @"Not set";
  if (v13) {
    long long v15 = (__CFString *)v13;
  }
  v40[4] = v15;
  v39[5] = @"CurrentKeyboardLanguage";
  long long v16 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v17 = [v16 currentInputMode];
  uint64_t v18 = [v17 primaryLanguage];
  uint64_t v19 = (void *)v18;
  if (v18) {
    uint64_t v20 = (__CFString *)v18;
  }
  else {
    uint64_t v20 = &stru_1ED0E84C0;
  }
  v40[5] = v20;
  v39[6] = @"DictationLanguage";
  uint64_t v21 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v22 = [v21 currentInputMode];
  uint64_t v23 = [v22 dictationLanguage];
  uint64_t v24 = (void *)v23;
  if (v23) {
    id v25 = (__CFString *)v23;
  }
  else {
    id v25 = &stru_1ED0E84C0;
  }
  v40[6] = v25;
  v39[7] = @"IsFallingBackToMonolingualDictation";
  BOOL v26 = [(UIDictationController *)self isFallingBackToMonolingualDictation];
  long long v27 = @"Yes";
  if (!v26) {
    long long v27 = @"No";
  }
  v40[7] = v27;
  long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:8];

  if (v32)
  {
  }
  return v28;
}

- (void)instrumentationDictationContextEmitInstrumentation
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v45 = 0;
  NSUInteger v46 = &v45;
  uint64_t v47 = 0x2050000000;
  uint64_t v3 = (void *)getSISchemaDictationContextClass_softClass;
  uint64_t v48 = getSISchemaDictationContextClass_softClass;
  if (!getSISchemaDictationContextClass_softClass)
  {
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __getSISchemaDictationContextClass_block_invoke;
    v44[3] = &unk_1E52D9900;
    v44[4] = &v45;
    __getSISchemaDictationContextClass_block_invoke((uint64_t)v44);
    uint64_t v3 = (void *)v46[3];
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v45, 8);
  id v5 = objc_alloc_init(v4);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(UIDictationController *)self currentKeyboardPrimaryLanguage];
  uint64_t v8 = [v6 UIDictationInstrumentaionLocalIdentifierWithLocalString:v7];
  [v5 setKeyboardLocale:v8];

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [(UIDictationController *)self initialDictationLanguage];
  id v11 = [v9 UIDictationInstrumentaionLocalIdentifierWithLocalString:v10];
  [v5 setDictationLocale:v11];

  __int16 v12 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = [(UIDictationController *)self smartLanguageSelectionOverrideLanguage];
    long long v15 = [v13 UIDictationInstrumentaionLocalIdentifierWithLocalString:v14];
    [v5 setUserSelectedLocale:v15];
  }
  else
  {
    [v5 setUserSelectedLocale:0];
  }

  id v16 = objc_alloc((Class)getSISchemaUUIDClass());
  uint64_t v17 = +[UIKeyboardImpl activeInstance];
  uint64_t v18 = [v17 _sessionIdentifier];
  uint64_t v19 = (void *)[v16 initWithNSUUID:v18];
  [v5 setTextInputSessionId:v19];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v20 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v21 = [v20 activeInputModes];

  uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v41 != v23) {
          objc_enumerationMutation(v21);
        }
        id v25 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        BOOL v26 = objc_opt_class();
        long long v27 = [v25 languageWithRegion];
        long long v28 = [v26 UIDictationInstrumentaionLocalIdentifierWithLocalString:v27];
        [v5 addKeyboardLocalesEnabled:v28];
      }
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v22);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v29 = +[UIKeyboardInputModeController sharedInputModeController];
  long long v30 = [v29 activeDictationLanguages];

  uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v37;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v37 != v32) {
          objc_enumerationMutation(v30);
        }
        uint64_t v34 = [(id)objc_opt_class() UIDictationInstrumentaionLocalIdentifierWithLocalString:*(void *)(*((void *)&v36 + 1) + 8 * j)];
        [v5 addDictationLocalesEnabled:v34];
      }
      uint64_t v31 = [v30 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v31);
  }

  uint64_t v35 = +[UIKeyboard keyboardBundleIdentifier];
  [v5 setBundleId:v35];

  [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v5];
}

- (void)instrumentationDictationTranscriptionMetadataEmitInstrumentationWithDictationResult:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  uint64_t v34 = [v35 dictationPhraseArray];
  uint64_t v3 = [v35 bestTextForMultilingualAlternatives];
  uint64_t v4 = (void *)v3;
  id v5 = (void *)MEMORY[0x1E4F1CBF0];
  if (v3) {
    id v5 = (void *)v3;
  }
  id v32 = v5;

  if ([v35 lowConfidenceAboutLanguageDetection]
    && [v35 showMultilingualAlternatives]
    && [v32 count])
  {
    uint64_t v6 = [v35 multilingualAlternatives];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [v35 multilingualAlternatives];
      uint64_t v9 = [v8 objectAtIndex:0];
      uint64_t v10 = [v9 dominantLanguage];

      uint64_t v11 = 0;
      uint64_t v12 = 0;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = 0;
      uint64_t v10 = 0;
    }
    uint64_t v22 = 1;
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v34;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v17, "style", v32) == 1)
          {
            uint64_t v18 = [v17 text];
            uint64_t v19 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
            uint64_t v20 = [v18 componentsSeparatedByCharactersInSet:v19];
            int v21 = [v20 count];

            uint64_t v12 = (v12 + 1);
            uint64_t v11 = (v11 + v21);
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v50 count:16];
      }
      while (v14);
    }

    uint64_t v22 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2050000000;
  uint64_t v23 = (void *)qword_1EB25AAE0;
  uint64_t v49 = qword_1EB25AAE0;
  if (!qword_1EB25AAE0)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    long long v43 = __getSISchemaDictationAlternativesPresentClass_block_invoke;
    uint64_t v44 = &unk_1E52D9900;
    uint64_t v45 = &v46;
    __getSISchemaDictationAlternativesPresentClass_block_invoke((uint64_t)&v41);
    uint64_t v23 = (void *)v47[3];
  }
  uint64_t v24 = v23;
  _Block_object_dispose(&v46, 8);
  id v25 = objc_alloc_init(v24);
  [v25 setNumberOfUnderlines:v12];
  [v25 setCountOfWordsUnderlined:v11];
  if (v10)
  {
    BOOL v26 = [(id)objc_opt_class() UIDictationInstrumentaionLocalIdentifierWithLocalString:v10];
    [v25 setAlternativesLocale:v26];
  }
  else
  {
    [v25 setAlternativesLocale:0];
  }
  objc_msgSend(v25, "setMultilingualIsLowConfidence:", v22, v32);
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2050000000;
  long long v27 = (void *)qword_1EB25AAE8;
  uint64_t v49 = qword_1EB25AAE8;
  if (!qword_1EB25AAE8)
  {
    uint64_t v41 = MEMORY[0x1E4F143A8];
    uint64_t v42 = 3221225472;
    long long v43 = __getSISchemaDictationTranscriptionMetadataClass_block_invoke;
    uint64_t v44 = &unk_1E52D9900;
    uint64_t v45 = &v46;
    __getSISchemaDictationTranscriptionMetadataClass_block_invoke((uint64_t)&v41);
    long long v27 = (void *)v47[3];
  }
  long long v28 = v27;
  _Block_object_dispose(&v46, 8);
  id v29 = objc_alloc_init(v28);
  if ([(UIDictationController *)self secureOfflineOnlySpeechRecognition]) {
    uint64_t v30 = 1;
  }
  else {
    uint64_t v30 = 2;
  }
  [v29 setDictationModel:v30];
  if ([(UIDictationController *)self secureOfflineOnlySpeechRecognition])
  {
    uint64_t v31 = [(UIDictationController *)self modelInfo];
    [v29 setDictationModelVersion:v31];
  }
  else
  {
    [v29 setDictationModelVersion:0];
  }
  [v29 setDictationAlternativesPresent:v25];
  [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v29];
}

+ (id)UIDictationInstrumentaionLocalIdentifierWithLocalString:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v4 = (void *)getSISchemaLocaleIdentifierClass_softClass;
  uint64_t v14 = getSISchemaLocaleIdentifierClass_softClass;
  if (!getSISchemaLocaleIdentifierClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getSISchemaLocaleIdentifierClass_block_invoke;
    v10[3] = &unk_1E52D9900;
    v10[4] = &v11;
    __getSISchemaLocaleIdentifierClass_block_invoke((uint64_t)v10);
    uint64_t v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_alloc_init(v5);
  uint64_t v7 = TIInputModeGetBaseLanguage();
  [v6 setLanguageCode:v7];

  uint64_t v8 = TIInputModeGetRegion();
  [v6 setCountryCode:v8];

  return v6;
}

+ (int)UIDictationStartStopReasonToInstrumentationInvocationSourceType:(unint64_t)a3
{
  if (a3 - 1 > 0x1B) {
    return 0;
  }
  else {
    return dword_186B9A088[a3 - 1];
  }
}

+ (int)UIDictationStartStopReasonToInstrumentationDictationEndPointType:(unint64_t)a3
{
  if (a3 - 1 > 0x1C) {
    return 0;
  }
  else {
    return dword_186B9A0F8[a3 - 1];
  }
}

+ (void)instrumentationDictationAlternativesViewedWithInstrumentationContext:(id)a3 alternatives:(id)a4 dictationLanguage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v20 = 0;
    int v21 = &v20;
    uint64_t v22 = 0x2050000000;
    uint64_t v11 = (void *)getSISchemaDictationAlternativesViewedClass_softClass;
    uint64_t v23 = getSISchemaDictationAlternativesViewedClass_softClass;
    if (!getSISchemaDictationAlternativesViewedClass_softClass)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __getSISchemaDictationAlternativesViewedClass_block_invoke;
      v19[3] = &unk_1E52D9900;
      v19[4] = &v20;
      __getSISchemaDictationAlternativesViewedClass_block_invoke((uint64_t)v19);
      uint64_t v11 = (void *)v21[3];
    }
    uint64_t v12 = v11;
    _Block_object_dispose(&v20, 8);
    id v13 = objc_alloc_init(v12);
    uint64_t v14 = [v9 objectForKeyedSubscript:@"alternatives"];
    objc_msgSend(v13, "setCountOfAlternativesAvailable:", objc_msgSend(v14, "count"));

    uint64_t v15 = [v9 objectForKeyedSubscript:@"originalText"];
    id v16 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v17 = [v15 componentsSeparatedByCharactersInSet:v16];
    objc_msgSend(v13, "setCountOfWordsUnderlined:", objc_msgSend(v17, "count"));

    if (v10)
    {
      uint64_t v18 = [a1 UIDictationInstrumentaionLocalIdentifierWithLocalString:v10];
      [v13 setAlternativesLocale:v18];
    }
    else
    {
      [v13 setAlternativesLocale:0];
    }
    [v8 emitInstrumentation:v13];
  }
}

+ (void)instrumentationDictationAlternativeSelectedWithInstrumentationContext:(id)a3 originalText:(id)a4 replacementText:(id)a5 replacementIndex:(unint64_t)a6 alternativesAvailableCount:(unint64_t)a7 dictationLanguage:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  if (v14)
  {
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v18 = (void *)getSISchemaDictationAlternativeSelectedClass_softClass;
    uint64_t v28 = getSISchemaDictationAlternativeSelectedClass_softClass;
    if (!getSISchemaDictationAlternativeSelectedClass_softClass)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getSISchemaDictationAlternativeSelectedClass_block_invoke;
      v24[3] = &unk_1E52D9900;
      v24[4] = &v25;
      __getSISchemaDictationAlternativeSelectedClass_block_invoke((uint64_t)v24);
      uint64_t v18 = (void *)v26[3];
    }
    uint64_t v19 = v18;
    _Block_object_dispose(&v25, 8);
    id v20 = objc_alloc_init(v19);
    [v20 setAlternativeListPosition:a6];
    [v20 setCountOfAlternativesAvailable:a7];
    int v21 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v22 = [v15 componentsSeparatedByCharactersInSet:v21];
    objc_msgSend(v20, "setCountOfWordsReplaced:", objc_msgSend(v22, "count"));

    if (v17)
    {
      uint64_t v23 = [a1 UIDictationInstrumentaionLocalIdentifierWithLocalString:v17];
      [v20 setAlternativesLocale:v23];
    }
    else
    {
      [v20 setAlternativesLocale:0];
    }
    [v14 emitInstrumentation:v20];
  }
}

- (void)optInButtonPressedForPresenter:(id)a3
{
  uint64_t v4 = [objc_alloc(NSNumber) initWithBool:1];
  id v5 = (void *)qword_1EB25A990;
  qword_1EB25A990 = v4;

  [(UIDictationController *)self _handleDataSharingSheetDecision];
  [MEMORY[0x1E4FAE270] dismissedDataSharingWithResponse:1];
  id v6 = [(UIDictationController *)self presentingViewControllerForPrivacySheet];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)optOutButtonPressedForPresenter:(id)a3
{
  uint64_t v4 = [objc_alloc(NSNumber) initWithBool:1];
  id v5 = (void *)qword_1EB25A990;
  qword_1EB25A990 = v4;

  [(UIDictationController *)self _handleDataSharingSheetDecision];
  [MEMORY[0x1E4FAE270] dismissedDataSharingWithResponse:3];
  id v6 = [(UIDictationController *)self presentingViewControllerForPrivacySheet];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

+ (BOOL)shouldPreferOnlineRecognition
{
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  id v3 = [v2 textInputTraits];
  char v4 = [v3 preferOnlineDictation];

  return v4;
}

+ (BOOL)shouldPreferOnDeviceRecognition
{
  if ([a1 shouldPreferOnlineRecognition]) {
    return 0;
  }
  uint64_t v2 = +[UIKeyboardImpl sharedInstance];
  id v3 = [v2 textInputTraits];
  uint64_t v4 = [v3 returnKeyType];

  if (v4 != 6) {
    return 0;
  }
  id v5 = +[UIKeyboard keyboardBundleIdentifier];
  char v6 = [&unk_1ED3F0610 containsObject:v5];

  return v6;
}

+ (BOOL)isInputDelegateSafariAddressBar
{
  if (!+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v2 = +[UIKeyboardImpl sharedInstance];
    id v3 = [v2 inputDelegate];
    NSClassFromString(&cfstr_Unifiedfield.isa);
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
LABEL_5:
    char v5 = 0;
    goto LABEL_6;
  }
  uint64_t v2 = +[UIDictationController sharedInstance];
  id v3 = [v2 _inputDelegateClassName];
  if (([v3 isEqualToString:@"UnifiedField"] & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = +[UIKeyboard keyboardBundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.mobilesafari"];

LABEL_6:
  return v5;
}

+ (BOOL)isEventFromMessagesSendButton:(id)a3 inspectResponderChain:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  char v6 = +[UIKeyboardImpl activeInstance];
  uint64_t v7 = [v6 textInputTraits];
  uint64_t v8 = [v7 keyboardType];

  if (v8 == 126)
  {
    if (qword_1EB25AA18 != -1) {
      dispatch_once(&qword_1EB25AA18, &__block_literal_global_1295_0);
    }
    do
    {
      if (qword_1EB25AA20 && (objc_opt_isKindOfClass() & 1) != 0)
      {
        id v9 = [v5 accessibilityIdentification];
        LODWORD(v10) = [v9 isEqualToString:@"sendButton"];
      }
      else
      {
        LODWORD(v10) = 0;
      }
      if ((v10 | !v4)) {
        break;
      }
      uint64_t v10 = [v5 nextResponder];

      id v5 = (id)v10;
    }
    while (v10);
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

Class __77__UIDictationController_isEventFromMessagesSendButton_inspectResponderChain___block_invoke()
{
  Class result = NSClassFromString(&cfstr_Ckentryviewbut.isa);
  qword_1EB25AA20 = (uint64_t)result;
  return result;
}

- (void)sendButtonPressedInMessages:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[UIDictationController isRunning])
  {
    [(UIDictationController *)self setSendButtonPressedDuringDictation:1];
    id v5 = [(UIDictationController *)self dictationTipController];
    [v5 signalDictationSendMessageTip];
  }
  char v6 = objc_opt_class();
  uint64_t v7 = +[UIKeyboardImpl activeInstance];
  uint64_t v8 = [v7 inputDelegate];
  [v6 logCorrectionStatisticsForDelegate:v8 reason:25];

  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v9 = (void *)getAFDictationDiscoverabilitySignalsStreamManagerClass_softClass;
  uint64_t v19 = getAFDictationDiscoverabilitySignalsStreamManagerClass_softClass;
  if (!getAFDictationDiscoverabilitySignalsStreamManagerClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getAFDictationDiscoverabilitySignalsStreamManagerClass_block_invoke;
    v15[3] = &unk_1E52D9900;
    v15[4] = &v16;
    __getAFDictationDiscoverabilitySignalsStreamManagerClass_block_invoke((uint64_t)v15);
    id v9 = (void *)v17[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v16, 8);
  uint64_t v11 = _UIMainBundleIdentifier();
  id v20 = @"dictation-active";
  BOOL v12 = [(UIDictationController *)self isSendButtonPressedDuringDictation];
  uint64_t v13 = MEMORY[0x1E4F1CC28];
  if (v12) {
    uint64_t v13 = MEMORY[0x1E4F1CC38];
  }
  v21[0] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  [v10 sendSendMessageSentEventWithBundleIdentifier:v11 context:0 userInfo:v14];
}

- (unint64_t)specificReasonTypeFromApplicationDuringDictation
{
  if ([(UIDictationController *)self isSendButtonPressedDuringDictation]) {
    return 25;
  }
  else {
    return 17;
  }
}

+ (unint64_t)specificReasonTypeMicButtonOnKeyboard
{
  if (+[UIDictationController isDictationSearchBarButtonVisible])
  {
    return 2;
  }
  if (+[UIDictationController isInputDelegateSafariAddressBar])
  {
    return 3;
  }
  return 1;
}

+ (unint64_t)specificReasonTypeMicButtonOnKeyboardWithInputSwitcher
{
  if (+[UIDictationController isDictationSearchBarButtonVisible])
  {
    return 5;
  }
  if (+[UIDictationController isInputDelegateSafariAddressBar])
  {
    return 6;
  }
  return 4;
}

- (void)insertLastHypothesisAsFinalResultLocally
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIDictationController *)self lastHypothesis];
  if (+[UIDictationController isRunning])
  {
    id v4 = +[UIKeyboardInputMode dictationInputMode];
    if ([v4 usingTypeAndTalk])
    {
      uint64_t v5 = [v3 length];

      if (v5)
      {
        char v6 = [(UIDictationController *)self candidateDictationSerializableResults];
        uint64_t v7 = v6;
        if (v6)
        {
          uint64_t v8 = v6;
        }
        else
        {
          id v9 = [UIDictationSerializableResults alloc];
          BOOL v12 = v3;
          id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
          v13[0] = v10;
          uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
          uint64_t v8 = [(UIDictationSerializableResults *)v9 initWithArrayOfArrayOfStrings:v11];
        }
        [(UIDictationController *)self setCandidateDictationSerializableResults:0];
        [(UIDictationController *)self finalizeDictationRecognitionWithPhrases:v8 languageModel:&stru_1ED0E84C0 correctionIdentifier:0 secureInput:0 finalResult:0];
        [(UIDictationController *)self setLastHypothesis:0];
      }
    }
    else
    {
    }
  }
}

- (BOOL)isDictationPaused
{
  return self->_shouldResumeDictation;
}

+ (BOOL)_shouldPerformPhrasesFinalizationIgnoringRTIChangesWithUserInteraction:(int64_t)a3
{
  return ((unint64_t)a3 > 7) | (0x3Cu >> a3) & 1;
}

- (void)_finalizePhrasesOnDictationPause
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIDictationController *)self candidateDictationSerializableResults];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
  }
  else
  {
    char v6 = [UIDictationSerializableResults alloc];
    uint64_t v7 = [(UIDictationController *)self lastHypothesis];
    BOOL v12 = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v13[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    uint64_t v5 = [(UIDictationSerializableResults *)v6 initWithArrayOfArrayOfStrings:v9];
  }
  [(UIDictationController *)self setCandidateDictationSerializableResults:0];
  id v10 = [(UIDictationController *)self dictationConnection];
  uint64_t v11 = [(UIDictationController *)self dictationConnection];
  -[UIDictationController dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:](self, "dictationConnection:finalizePhrases:languageModel:correctionIdentifier:secureInput:finalResult:", v10, v5, &stru_1ED0E84C0, 0, [v11 isSecureInput], 0);
}

- (void)pauseDictation
{
}

- (void)pauseDictationOnUserInteraction:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning]
    && !self->_shouldResumeDictation
    && ![(UIDictationController *)self dictationIsModifyingText])
  {
    uint64_t v5 = _UIDictationControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v12 = "-[UIDictationController pauseDictationOnUserInteraction:]";
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%s UIDictationController should pause dictation", buf, 0xCu);
    }

    [(UIDictationController *)self _stopStreamingAnimation];
    [(UIDictationController *)self pauseSpeechRecognition];
    char v6 = [(UIDictationController *)self lastHypothesis];
    uint64_t v7 = _UIDictationControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "-[UIDictationController pauseDictationOnUserInteraction:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s lastHypothesis at beginUserInteraction: '%@'", buf, 0x16u);
    }

    if ([v6 length])
    {
      if ([(id)objc_opt_class() _shouldPerformPhrasesFinalizationIgnoringRTIChangesWithUserInteraction:a3])
      {
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __57__UIDictationController_pauseDictationOnUserInteraction___block_invoke;
        v10[3] = &unk_1E52D9F70;
        v10[4] = self;
        [(UIDictationController *)self performIgnoringRTIChanges:v10];
      }
      else
      {
        [(UIDictationController *)self _finalizePhrasesOnDictationPause];
      }
    }
    self->_BOOL shouldResumeDictation = 1;
    uint64_t v8 = _UIDictationControllerLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL shouldResumeDictation = self->_shouldResumeDictation;
      *(_DWORD *)buf = 136315394;
      BOOL v12 = "-[UIDictationController pauseDictationOnUserInteraction:]";
      __int16 v13 = 1024;
      LODWORD(v14) = shouldResumeDictation;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s _shouldResumeDictation=%d", buf, 0x12u);
    }
  }
}

uint64_t __57__UIDictationController_pauseDictationOnUserInteraction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finalizePhrasesOnDictationPause];
}

- (void)resumeDictation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() shouldForwardEventsToInputSystemUI])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v5, "forwardDictationEvent_resumeDictation");
  }
  else if ([(UIDictationController *)self shouldResumeDictation] {
         && +[UIDictationController isRunning])
  }
  {
    id v3 = _UIDictationControllerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v8 = "-[UIDictationController resumeDictation]";
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    id v4 = +[UIKeyboardImpl activeInstance];
    byte_1EB25A971 = [v4 isShifted];

    [(UIDictationController *)self setupForAsyncDelegate];
    objc_msgSend(NSString, "stringWithFormat:", @"%s Calling _refreshVisibleRTIDocumentStateWithContinuation", "-[UIDictationController resumeDictation]");

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __40__UIDictationController_resumeDictation__block_invoke;
    v6[3] = &unk_1E52FAC50;
    void v6[4] = self;
    [(UIDictationController *)self _refreshVisibleRTIDocumentStateWithContinuation:v6];
  }
}

uint64_t __40__UIDictationController_resumeDictation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) resumeSpeechRecognitionWithPrefixText:a2 postfixText:a3 selectedText:a4];
}

- (void)resetSpeechRecognition
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = +[UIKeyboardInputMode dictationInputMode];
  if ([v5 usingTypeAndTalk]
    && +[UIDictationController isRunning])
  {
    BOOL shouldResumeDictation = self->_shouldResumeDictation;

    if (!shouldResumeDictation)
    {
      id v4 = _UIDictationControllerLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v8 = "-[UIDictationController resetSpeechRecognition]";
        _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s UIDictationController reset speech recognition, stopping streaming animation", buf, 0xCu);
      }

      [(UIDictationController *)self _stopStreamingAnimation];
      [(UIDictationController *)self pauseSpeechRecognition];
      objc_msgSend(NSString, "stringWithFormat:", @"%s Calling _refreshVisibleRTIDocumentStateWithContinuation", "-[UIDictationController resetSpeechRecognition]");

      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      void v6[2] = __47__UIDictationController_resetSpeechRecognition__block_invoke;
      v6[3] = &unk_1E52FAC50;
      void v6[4] = self;
      [(UIDictationController *)self _refreshVisibleRTIDocumentStateWithContinuation:v6];
    }
  }
  else
  {
  }
}

uint64_t __47__UIDictationController_resetSpeechRecognition__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) resumeSpeechRecognitionWithPrefixText:a2 postfixText:a3 selectedText:a4];
}

- (void)resetDictation
{
  [(UIDictationController *)self _stopStreamingAnimation];
  [(UIDictationController *)self setTargetHypothesis:0];
  [(UIDictationController *)self setLastHypothesis:0];
  [(UIDictationController *)self setPendingEdits:0];
  id v3 = +[UIDictationController activeInstance];
  [v3 resetSpeechRecognition];
}

- (BOOL)userInteractionShouldResetAdaptiveDeleteActivationLogic:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x3Bu >> a3);
}

- (BOOL)userInteractionShouldDismissDictationTip:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 3;
}

- (void)beginUserInteraction:(int64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [(UIDictationController *)self dictationTipController];
  [v5 setDismissalReasonType:2];

  if (+[UIDictationController isRunning]
    && !self->_ignoreUserInteraction)
  {
    uint64_t v7 = _UIDictationControllerLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v21 = "-[UIDictationController beginUserInteraction:]";
      __int16 v22 = 2048;
      int64_t v23 = a3;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s UIDictationController beginUserInteraction: %ld", buf, 0x16u);
    }

    if ([(UIDictationController *)self userInteractionShouldResetAdaptiveDeleteActivationLogic:a3])
    {
      [(UIDictationController *)self resetAdaptiveDeleteActivationLogic];
    }
    uint64_t v8 = +[UIKeyboardImpl activeInstance];
    if ([(UIDictationController *)self userInteractionShouldDismissDictationTip:a3])
    {
      [v8 dismissDictationTip];
    }
    [v8 _clearDictationMenuTimer:0];
    [(UIDictationController *)self updateRecordingLimitTimerIfNeeded];
    if ((unint64_t)a3 <= 1)
    {
      [(UIDictationController *)self _removeUndoNotificationObservation];
      uint64_t v9 = [v8 _textChoicesAssistant];
      [v9 resetDictationChoices];

      id v10 = [v8 _textChoicesAssistant];
      [v10 resetDictationUnderlines];
    }
    if (![(UIDictationController *)self shouldResumeDictation])
    {
      uint64_t v11 = +[UIKeyboardInputMode dictationInputMode];
      int v12 = [v11 usingTypeAndTalk];

      if (v12)
      {
        __int16 v13 = _UIDictationControllerUndoRedoLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          int v21 = "-[UIDictationController beginUserInteraction:]";
          _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", buf, 0xCu);
        }

        [(UIDictationController *)self _endUndoGroupingIfNecessary];
        [(UIDictationController *)self pauseDictationOnUserInteraction:a3];
        if (![(UIDictationController *)self modelessUsedAtLeastOnce])
        {
          id v14 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          uint64_t v15 = [v14 _textInputSessionAnalytics];
          [v15 didDictationBegin:0 usesMultiModalDictation:1];

          [(UIDictationController *)self setModelessUsedAtLeastOnce:1];
        }
        if (!self->_dictationInputModeSwitchStarted)
        {
          self->_dictationInputModeSwitchStarted = 1;
          id v16 = objc_alloc_init((Class)getSISchemaUEIDictationInputModeSwitchContextClass());
          id v17 = objc_alloc_init((Class)getSISchemaUEIDictationInputModeSwitchStartedClass());
          [v17 setExists:1];
          [v16 setStartedOrChanged:v17];
          [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v16];
        }
      }
      else
      {
        uint64_t v18 = _UIDictationControllerLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          int v21 = "-[UIDictationController beginUserInteraction:]";
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_DEFAULT, "%s UIDictationController should stop dictation", buf, 0xCu);
        }

        [(UIDictationController *)self stopAndCancelDictationWithReasonType:0];
      }
    }
  }
  else if (!a3)
  {
    id v19 = +[UIDictationController sharedInstance];
    char v6 = [v19 dictationTipController];
    [v6 processSoftwareKeyboardInteraction];
  }
}

- (void)endUserInteraction
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning])
  {
    if ([(UIDictationController *)self shouldResumeDictation]
      && ![(UIDictationController *)self skipAutomaticResumeDictation])
    {
      if (+[UIDictationController isRunningInTypeAndTalkMode])
      {
        [(UIDictationController *)self resumeDictation];
        self->_shouldAttemptToShowTips = 1;
      }
      else
      {
        char v6 = _UIDictationControllerLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v9 = "-[UIDictationController endUserInteraction]";
          _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting shouldResumeDictation to NO", buf, 0xCu);
        }

        [(UIDictationController *)self setShouldResumeDictation:0];
      }
    }
  }
  else
  {
    id v3 = +[UIDictationLandingView activeInstance];
    char v4 = [v3 hasActivePlaceholder];

    if ((v4 & 1) == 0)
    {
      id v7 = +[UIDictationController sharedInstance];
      id v5 = [v7 dictationTipController];
      [v5 processUserInteractionEnded];
    }
  }
}

- (void)resumeSpeechRecognitionWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(UIDictationController *)self dictationConnection];
  [v11 resumeSpeechRecognitionWithPrefixText:v10 postfixText:v9 selectedText:v8];

  self->_BOOL shouldResumeDictation = 0;
  int v12 = _UIDictationControllerLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL shouldResumeDictation = self->_shouldResumeDictation;
    int v14 = 136315394;
    uint64_t v15 = "-[UIDictationController resumeSpeechRecognitionWithPrefixText:postfixText:selectedText:]";
    __int16 v16 = 1024;
    BOOL v17 = shouldResumeDictation;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "%s _shouldResumeDictation=%d", (uint8_t *)&v14, 0x12u);
  }

  [(UIDictationController *)self setState:2];
  if (self->_shouldAttemptToShowTips)
  {
    [(UIDictationTipController *)self->_dictationTipController presentDelayedTipIfNeeded];
    self->_shouldAttemptToShowTips = 0;
  }
  [(UIDictationController *)self postNotificationName:@"UIDictationControllerDidResumeNotification" userInfo:0];
}

- (void)pauseSpeechRecognition
{
  id v3 = [(UIDictationController *)self dictationConnection];
  [v3 pauseSpeechRecognition];

  [(UIDictationController *)self postNotificationName:@"UIDictationControllerDidPauseNotification" userInfo:0];
}

- (void)clearKeyboardTrackpadModeIfNeeded
{
  id v5 = +[UIKeyboardImpl activeInstance];
  if ([v5 isTrackpadMode])
  {
    uint64_t v2 = [v5 _layout];
    [v2 didEndTrackpadModeForServerSideDictation];
  }
  if (([v5 isSyncingDictationLanguageForInputModeSwitch] & 1) == 0)
  {
    id v3 = +[UIDictationView activeInstance];
    char v4 = [v3 switchingLanguage];

    if ((v4 & 1) == 0) {
      [v5 clearDictationMenuTimer];
    }
  }
}

- (void)removeSelectedText
{
  id v3 = +[UIKeyboardImpl activeInstance];
  char v4 = [v3 inputDelegateManager];
  id v5 = [v4 selectedTextRange];

  if (v5 && ([v5 isEmpty] & 1) == 0)
  {
    [(UIDictationController *)self setCanUndoOrRedo:0];
    char v6 = [v3 inputDelegateManager];
    int v7 = [v6 hasAsyncCapableInputDelegate];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __43__UIDictationController_removeSelectedText__block_invoke;
    v12[3] = &unk_1E52D9FC0;
    id v13 = v3;
    char v14 = v7;
    [(UIDictationController *)self performIgnoringDocumentChanges:v12];
    if (v7)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      void v11[2] = __43__UIDictationController_removeSelectedText__block_invoke_3;
      v11[3] = &unk_1E52E37E0;
      v11[4] = self;
      [(UIDictationController *)self _requestDocumentContextWithCompletionHandler:v11];
    }
    [(UIDictationController *)self setCanUndoOrRedo:1];
  }
  [v3 dismissTextChoicePrompt];
  if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
  {
    id v8 = [v3 inputDelegateManager];
    id v9 = [v8 inputSystemSourceSession];

    if (v9)
    {
      id v10 = [v9 textOperations];
      [v10 setEditingActionSelector:sel_removeSelectedText];
      [v9 flushOperations];
    }
  }
}

void __43__UIDictationController_removeSelectedText__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setTextInputChangesIgnored:1];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  id v5 = __43__UIDictationController_removeSelectedText__block_invoke_2;
  char v6 = &unk_1E52D9FC0;
  char v8 = *(unsigned char *)(a1 + 40);
  id v7 = v2;
  [v7 performOperations:&v3 withTextInputSource:2];
  objc_msgSend(*(id *)(a1 + 32), "setTextInputChangesIgnored:", 0, v3, v4, v5, v6);
}

void __43__UIDictationController_removeSelectedText__block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)
    || ([*(id *)(a1 + 32) inputDelegateManager],
        uint64_t v2 = objc_claimAutoreleasedReturnValue(),
        [v2 textInteractionAssistant],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        !v3))
  {
    id v4 = [*(id *)(a1 + 32) inputDelegateManager];
    [v4 deleteBackward];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) inputDelegateManager];
    [v4 insertText:&stru_1ED0E84C0];
  }
}

uint64_t __43__UIDictationController_removeSelectedText__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setupForAsyncDelegate];
}

- (void)_requestDocumentContextWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v7 = objc_alloc_init(UIWKDocumentRequest);
  [(UIWKDocumentRequest *)v7 setFlags:133];
  if (_os_feature_enabled_impl()) {
    [(UIWKDocumentRequest *)v7 setFlags:[(UIWKDocumentRequest *)v7 flags] | 0x40];
  }
  [(UIWKDocumentRequest *)v7 setSurroundingGranularity:1];
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 inputDelegateManager];
  [v5 visibleTextRect];
  -[UIWKDocumentRequest setDocumentRect:](v7, "setDocumentRect:");

  char v6 = [v4 inputDelegateManager];
  [v6 requestDocumentContext:v7 completionHandler:v3];
}

- (void)_requestFullDocumentContextWithCompletionHandler:(id)a3
{
  id v3 = a3;
  char v8 = objc_alloc_init(UIWKDocumentRequest);
  [(UIWKDocumentRequest *)v8 setFlags:133];
  [(UIWKDocumentRequest *)v8 setSurroundingGranularity:5];
  if (_os_feature_enabled_impl()) {
    [(UIWKDocumentRequest *)v8 setFlags:[(UIWKDocumentRequest *)v8 flags] | 0x40];
  }
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 inputDelegateManager];
  char v6 = [v5 textInputView];
  [v6 bounds];
  -[UIWKDocumentRequest setDocumentRect:](v8, "setDocumentRect:");

  id v7 = [v4 inputDelegateManager];
  [v7 requestDocumentContext:v8 completionHandler:v3];
}

- (BOOL)shouldSuppressPartialResults
{
  id v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 inputDelegateManager];
  id v5 = [v4 selectedTextRange];
  if ([v5 isEmpty]) {
    BOOL v6 = [(UIDictationController *)self hasSelectedTextRange];
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

- (BOOL)isSelectionBasedCommand:(unint64_t)a3
{
  return (a3 < 0x16) & (0x271508u >> a3);
}

- (BOOL)isSelectionRequiredForCommand:(unint64_t)a3
{
  return (a3 < 0x12) & (0x31508u >> a3);
}

- (BOOL)_isNonEmptyDocumentRequiredForCommand:(unint64_t)a3
{
  return a3 == 2
      || a3 == 15
      || -[UIDictationController isSelectionRequiredForCommand:](self, "isSelectionRequiredForCommand:");
}

- (void)requestVisibleTextWithCompletionBlock:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  char v14 = &v13;
  uint64_t v15 = 0x2050000000;
  id v4 = (void *)qword_1EB25AAF0;
  uint64_t v16 = qword_1EB25AAF0;
  if (!qword_1EB25AAF0)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __getRTIDocumentRequestClass_block_invoke;
    v12[3] = &unk_1E52D9900;
    void v12[4] = &v13;
    __getRTIDocumentRequestClass_block_invoke((uint64_t)v12);
    id v4 = (void *)v14[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v13, 8);
  id v6 = objc_alloc_init(v5);
  [v6 setFlags:9];
  [v6 setTextGranularity:1];
  id v7 = +[UIKeyboardImpl activeInstance];
  char v8 = [v7 remoteTextInputPartnerPrivate];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke;
  v10[3] = &unk_1E52FAC78;
  id v11 = v3;
  id v9 = v3;
  [v8 _performDocumentRequest:v6 completion:v10];
}

void __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke_2;
  v5[3] = &unk_1E52DA160;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __63__UIDictationController_requestVisibleTextWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = _UIDictationControllerLog();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      char v8 = "-[UIDictationController requestVisibleTextWithCompletionBlock:]_block_invoke_2";
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Received visible RTIDocumentState", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v6 = +[UIKeyboard keyboardBundleIdentifier];
    int v7 = 136315394;
    char v8 = "-[UIDictationController requestVisibleTextWithCompletionBlock:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "%s Received nil RTIDocumentState, client: \"%@\"", (uint8_t *)&v7, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_refreshVisibleRTIDocumentStateWithContinuation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __73__UIDictationController__refreshVisibleRTIDocumentStateWithContinuation___block_invoke;
  v6[3] = &unk_1E52FACA0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(UIDictationController *)self requestVisibleTextWithCompletionBlock:v6];
}

void __73__UIDictationController__refreshVisibleRTIDocumentStateWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 documentState];
  id v4 = [v8 contextBeforeInput];
  id v5 = [v8 contextAfterInput];
  id v6 = [v8 selectedText];
  objc_msgSend(*(id *)(a1 + 32), "setHasSelectedTextRange:", objc_msgSend(v6, "length") != 0);
  [*(id *)(a1 + 32) setVisibleRTIDocumentStateAtStart:v3];

  [*(id *)(a1 + 32) setVisibleContextBeforeInputAtCommandExecution:v4];
  [*(id *)(a1 + 32) setVisibleRTIDocumentStateAtCommandRecognition:0];
  [NSString stringWithFormat:@"%s Dictation resume options. prefixText: %@, postfixText: %@, selectedText: %@", "-[UIDictationController _refreshVisibleRTIDocumentStateWithContinuation:]_block_invoke", v4, v5, v6];

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, void *, void *, void *))(v7 + 16))(v7, v4, v5, v6);
  }
}

- (void)handleWKActionMoveAfter
{
  id v3 = +[UIKeyboardImpl activeInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __48__UIDictationController_handleWKActionMoveAfter__block_invoke;
  v5[3] = &unk_1E52E37E0;
  id v6 = v3;
  id v4 = v3;
  [(UIDictationController *)self _requestDocumentContextWithCompletionHandler:v5];
}

void __48__UIDictationController_handleWKActionMoveAfter__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 selectedTextRange];
  uint64_t v6 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4 + v5, 0);
  uint64_t v8 = v7;

  __int16 v9 = [*(id *)(a1 + 32) inputDelegateManager];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__UIDictationController_handleWKActionMoveAfter__block_invoke_2;
  v10[3] = &unk_1E52D9F70;
  id v11 = *(id *)(a1 + 32);
  objc_msgSend(v9, "adjustSelection:completionHandler:", v6, v8, v10);
}

uint64_t __48__UIDictationController_handleWKActionMoveAfter__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForChangedSelection];
}

- (void)handleWKActionMoveBefore
{
  id v3 = +[UIKeyboardImpl activeInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __49__UIDictationController_handleWKActionMoveBefore__block_invoke;
  v5[3] = &unk_1E52E37E0;
  id v6 = v3;
  id v4 = v3;
  [(UIDictationController *)self _requestDocumentContextWithCompletionHandler:v5];
}

void __49__UIDictationController_handleWKActionMoveBefore__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "directionalRangeForSelectionRange:", objc_msgSend(v3, "selectedTextRange"), 0);
  uint64_t v6 = v5;

  uint64_t v7 = [*(id *)(a1 + 32) inputDelegateManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __49__UIDictationController_handleWKActionMoveBefore__block_invoke_2;
  v8[3] = &unk_1E52D9F70;
  id v9 = *(id *)(a1 + 32);
  objc_msgSend(v7, "adjustSelection:completionHandler:", v4, v6, v8);
}

uint64_t __49__UIDictationController_handleWKActionMoveBefore__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateForChangedSelection];
}

- (void)_dictationDidRecieveDidBeginDictationNotification:(id)a3
{
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    notify_set_state(self->_dictationInputModeNotifierToken, 1uLL);
    notify_post("com.apple.keyboard.isDictationRunning");
  }
}

- (void)_dictationDidRecieveDidFinishDictationNotification:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = _UIDictationControllerUndoRedoLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[UIDictationController _dictationDidRecieveDidFinishDictationNotification:]";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", (uint8_t *)&v9, 0xCu);
  }

  [(UIDictationController *)self _endUndoGroupingIfNecessary];
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    notify_set_state(self->_dictationInputModeNotifierToken, 0);
    notify_post("com.apple.keyboard.isDictationRunning");
  }
  if (!+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v5 = +[UIKeyboardImpl activeInstance];
    uint64_t v6 = [v5 _textChoicesAssistant];
    [v6 resetDictationChoices];

    uint64_t v7 = +[UIKeyboardImpl activeInstance];
    uint64_t v8 = [v7 _textChoicesAssistant];
    [v8 cancelPendingDictationPromptDisplay];
  }
}

- (BOOL)currentLanguageIsVerbFirstCommandLanguage
{
  if (qword_1EB25AA28 != -1) {
    dispatch_once(&qword_1EB25AA28, &__block_literal_global_1315);
  }
  id v3 = [(UIDictationController *)self currentLanguageVerbFirstCommandLanguageStatusCached];

  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v5 = [(UIDictationController *)self language];
    uint64_t v6 = [v4 localeWithLocaleIdentifier:v5];
    uint64_t v7 = [v6 languageCode];
    uint64_t v8 = (void *)v7;
    int v9 = &stru_1ED0E84C0;
    if (v7) {
      int v9 = (__CFString *)v7;
    }
    id v10 = v9;

    int v11 = [(id)qword_1EB25AA30 containsObject:v10];
    int v12 = [NSNumber numberWithBool:v11 ^ 1u];

    [(UIDictationController *)self setCurrentLanguageVerbFirstCommandLanguageStatusCached:v12];
  }
  uint64_t v13 = [(UIDictationController *)self currentLanguageVerbFirstCommandLanguageStatusCached];
  char v14 = [v13 BOOLValue];

  return v14;
}

void __66__UIDictationController_currentLanguageIsVerbFirstCommandLanguage__block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ja", 0);
  id v1 = (void *)qword_1EB25AA30;
  qword_1EB25AA30 = v0;
}

+ (id)firstParameterTextWithParameters:(id)a3
{
  id v3 = a3;
  if (+[UIDictationController supportsSiriDictationVoiceCommands])
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"Param0"];

    [v4 text];
  }
  else
  {
    uint64_t v4 = [v3 objectForKey:@"BuiltInLM.Dictation"];

    [v4 objectForKey:@"Text"];
  uint64_t v5 = };

  return v5;
}

+ (id)secondParameterTextWithParameters:(id)a3
{
  id v3 = a3;
  if (+[UIDictationController supportsSiriDictationVoiceCommands])
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:@"Param1"];

    [v4 text];
  }
  else
  {
    uint64_t v4 = [v3 objectForKey:@"BuiltInLM.Dictation.2"];

    [v4 objectForKey:@"Text"];
  uint64_t v5 = };

  return v5;
}

+ (unint64_t)commandIdentifierWithStringIdentifier:(id)a3
{
  uint64_t v3 = qword_1EB25AA38;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EB25AA38, &__block_literal_global_1332_0);
  }
  uint64_t v5 = [(id)qword_1EB25AA40 objectForKeyedSubscript:v4];

  unint64_t v6 = [v5 unsignedIntegerValue];
  return v6;
}

void __63__UIDictationController_commandIdentifierWithStringIdentifier___block_invoke()
{
  BOOL v0 = +[UIDictationController supportsSiriDictationVoiceCommands];
  id v1 = &unk_1ED3F79B0;
  uint64_t v2 = (void *)qword_1EB25AA40;
  if (v0) {
    id v1 = &unk_1ED3F7988;
  }
  qword_1EB25AA40 = (uint64_t)v1;
}

- (void)clearSelectedTextAndLastDictationResult:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__UIDictationController_clearSelectedTextAndLastDictationResult___block_invoke;
  v3[3] = &unk_1E52D9FC0;
  v3[4] = self;
  BOOL v4 = a3;
  [(UIDictationController *)self performIgnoringDocumentChanges:v3];
}

void __65__UIDictationController_clearSelectedTextAndLastDictationResult___block_invoke(uint64_t a1)
{
  id v9 = +[UIKeyboardImpl activeInstance];
  [v9 setTextInputChangesIgnored:1];
  [*(id *)(a1 + 32) setCanUndoOrRedo:0];
  if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) hasSelectedTextRange])
  {
    uint64_t v2 = [v9 inputDelegateManager];
    int v3 = [v2 hasAsyncCapableInputDelegate];

    BOOL v4 = [v9 inputDelegateManager];
    uint64_t v5 = v4;
    if (v3) {
      [v4 deleteBackward];
    }
    else {
      [v4 insertText:&stru_1ED0E84C0];
    }
  }
  else
  {
    unint64_t v6 = [*(id *)(a1 + 32) lastHypothesis];
    uint64_t v7 = [v6 length];

    for (; v7; --v7)
    {
      uint64_t v8 = [v9 inputDelegateManager];
      [v8 deleteBackward];
    }
    [*(id *)(a1 + 32) setLastHypothesis:0];
  }
  [v9 setTextInputChangesIgnored:0];
  [*(id *)(a1 + 32) setCanUndoOrRedo:1];
}

- (void)searchString:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[UIKeyboardImpl activeInstance];
  id v9 = [v8 inputDelegateManager];
  int v10 = [v9 hasAsyncCapableInputDelegate];

  if (!v10)
  {
    if (+[UIKeyboard inputUIOOP])
    {
      if (!+[UIKeyboard usesInputSystemUI])
      {
        uint64_t v13 = 0;
        uint64_t v16 = 0;
LABEL_12:
        id v19 = [v13 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        id v20 = [v16 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        [NSString stringWithFormat:@"%s contextBeforeInput: \n%@\ncontextAfterInput: \n%@", "-[UIDictationController searchString:completionHandler:]", v19, v20];
        [(UIDictationController *)self searchString:v6 contextBefore:v19 contextAfter:v20 completionHandler:v7];

        goto LABEL_13;
      }
      int v11 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      int v12 = [v11 documentState];
      uint64_t v13 = [v12 contextBeforeInput];

      char v14 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      uint64_t v15 = [v14 documentState];
      uint64_t v16 = [v15 contextAfterInput];
    }
    else
    {
      uint64_t v13 = [(UIDictationController *)self visibleContextBeforeInputAtCommandExecution];
      char v14 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      uint64_t v15 = [v14 documentState];
      if (v15) {
        [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      }
      else {
      BOOL v17 = [(UIDictationController *)self visibleRTIDocumentStateAtStart];
      }
      uint64_t v18 = [v17 documentState];
      uint64_t v16 = [v18 contextAfterInput];
    }
    goto LABEL_12;
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __56__UIDictationController_searchString_completionHandler___block_invoke;
  v21[3] = &unk_1E52FACC8;
  v21[4] = self;
  id v22 = v6;
  id v23 = v7;
  [(UIDictationController *)self _requestDocumentContextWithCompletionHandler:v21];

LABEL_13:
}

void __56__UIDictationController_searchString_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 selectedTextRange];
  objc_msgSend(*(id *)(a1 + 32), "setPreCommandExecutionPositionRange:", v4, v5);
  id v6 = [v3 contextBefore];
  id v7 = _stringForObject(v6);
  id v11 = [v7 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  uint64_t v8 = [v3 contextAfter];

  id v9 = _stringForObject(v8);
  int v10 = [v9 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  [*(id *)(a1 + 32) searchString:*(void *)(a1 + 40) contextBefore:v11 contextAfter:v10 completionHandler:*(void *)(a1 + 48)];
}

- (_NSRange)searchStringWithWordBoundariesValidation:(id)a3 substring:(id)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 rangeOfString:v7];
  uint64_t v11 = v10;
  int v12 = [[UIDictationWordsSeeker alloc] initWithString:v7 substring:v8 reverse:v5];
  if (v5) {
    uint64_t v13 = 5;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v11)
  {
    uint64_t v14 = v11;
    while (1)
    {
      uint64_t v15 = objc_msgSend(v7, "rangeOfString:options:range:", v8, v13, v9, v14);
      NSUInteger v17 = v16;
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v18 = v15;
      if (!-[UIDictationWordsSeeker validateWordBoundariesInRange:](v12, "validateWordBoundariesInRange:", v15, v16))
      {
        uint64_t v9 = v5 ? 0 : v18 + v17;
        uint64_t v14 = v5 ? v18 : v11 - (v18 + v17);
        if (v14) {
          continue;
        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    NSUInteger v17 = 0;
  }
  uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

  NSUInteger v19 = v18;
  NSUInteger v20 = v17;
  result.NSUInteger length = v20;
  result.NSUInteger location = v19;
  return result;
}

- (id)rangesForSearchStringWithWordBoundariesValidation:(id)a3 substring:(id)a4 reverse:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  id v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [v7 rangeOfString:v7];
  uint64_t v11 = v10;
  int v12 = [[UIDictationWordsSeeker alloc] initWithString:v7 substring:v8 reverse:v5];
  if (v5) {
    uint64_t v13 = 5;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v11)
  {
    uint64_t v14 = v11;
    do
    {
      uint64_t v15 = objc_msgSend(v7, "rangeOfString:options:range:", v8, v13, v9, v14);
      if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v17 = v15;
      uint64_t v18 = v16;
      if (-[UIDictationWordsSeeker validateWordBoundariesInRange:](v12, "validateWordBoundariesInRange:", v15, v16))
      {
        NSUInteger v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v17, v18);
        [v23 addObject:v19];
      }
      uint64_t v20 = v11 - (v17 + v18);
      uint64_t v9 = v5 ? 0 : v17 + v18;
      uint64_t v14 = v5 ? v17 : v20;
    }
    while (v14);
  }
  int v21 = [MEMORY[0x1E4F1C978] arrayWithArray:v23];

  return v21;
}

- (void)searchString:(id)a3 contextBefore:(id)a4 contextAfter:(id)a5 completionHandler:(id)a6
{
  id v30 = a3;
  uint64_t v10 = (UIDictationWordsSeeker *)a4;
  id v11 = a5;
  int v12 = (void (**)(id, id, uint64_t, void))a6;
  if (qword_1EB25AA50 != -1) {
    dispatch_once(&qword_1EB25AA50, &__block_literal_global_1510_0);
  }
  uint64_t v13 = [(UIDictationController *)self language];
  uint64_t v14 = TIInputModeGetLanguage();
  uint64_t v15 = (void *)v14;
  uint64_t v16 = &stru_1ED0E84C0;
  if (v14) {
    uint64_t v16 = (__CFString *)v14;
  }
  uint64_t v17 = v16;

  if ([(id)qword_1EB25AA48 containsObject:v17])
  {
    uint64_t v18 = [(UIDictationWordsSeeker *)v10 rangeOfString:v30 options:5];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v20 = v19) == 0)
    {
      uint64_t v21 = [v11 rangeOfString:v30 options:1];
      uint64_t v20 = v22;
      goto LABEL_20;
    }
  }
  else
  {
    uint64_t v18 = [(UIDictationController *)self searchStringWithWordBoundariesValidation:v10 substring:v30 reverse:1];
    if (v18 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v20 = v23) == 0)
    {
      uint64_t v24 = [(UIDictationController *)self searchStringWithWordBoundariesValidation:v11 substring:v30 reverse:0];
      if (v24 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v20 = v25) == 0)
      {
        BOOL v26 = objc_alloc_init(UIDictationWordsSeeker);
        uint64_t v27 = [(UIDictationWordsSeeker *)v26 rangeOfSubstring:v30 fullString:v10 reverse:1];
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v20 = v28;
          if (v28)
          {
            uint64_t v21 = v27;
            goto LABEL_21;
          }
        }
        uint64_t v21 = [(UIDictationWordsSeeker *)v26 rangeOfSubstring:v30 fullString:v11 reverse:0];
        uint64_t v20 = v29;
      }
      else
      {
        uint64_t v21 = v24;
      }
LABEL_20:
      BOOL v26 = v10;
      uint64_t v10 = 0;
LABEL_21:

      if (!v12) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  uint64_t v21 = v18;
  if (v12) {
LABEL_22:
  }
    v12[2](v12, v10, v21, v20);
LABEL_23:
}

void __83__UIDictationController_searchString_contextBefore_contextAfter_completionHandler___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ja", @"zh", @"wuu", @"yue", 0);
  id v1 = (void *)qword_1EB25AA48;
  qword_1EB25AA48 = v0;
}

+ (BOOL)canHandleCommandIdentifier:(unint64_t)a3
{
  if (a3 > 0x1B) {
    return 0;
  }
  if (((1 << a3) & 0xFF7DFFE) != 0) {
    return 1;
  }
  if (a3 == 19) {
    return [a1 supportsSendVoiceCommand];
  }
  else {
    return 0;
  }
}

+ (int)mapDictationCommandIdentifierToUEIcommandIdentifier:(unint64_t)a3
{
  if (a3 - 1 > 0x1A) {
    return 0;
  }
  else {
    return dword_186B9A16C[a3 - 1];
  }
}

- (void)_restoreInsertionPointPositionWithKeyboard:(id)a3 originalPositionRange:(_NSRange)a4 targetRange:(_NSRange)a5 payloadRange:(_NSRange)a6 contextBefore:(BOOL)a7
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a7) {
    NSUInteger location = a4.location - a5.length + a6.length;
  }
  uint64_t v10 = [a3 inputDelegateManager];
  objc_msgSend(v10, "_textRangeFromNSRange:", location, length);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v11 = [a3 inputDelegateManager];

  [v11 setSelectedTextRange:v12];
}

- (void)invalidateTextInputView
{
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 inputDelegateManager];
  id v4 = [v3 textInputView];

  [v4 layoutIfNeeded];
}

- (void)notifyDocumentStateChangedAndResumeDictation:(id)a3
{
  id v5 = a3;
  [(UIDictationController *)self invalidateTextInputView];
  if (+[UIKeyboard usesInputSystemUI]
    || !+[UIKeyboard inputUIOOP])
  {
    id v4 = [v5 remoteTextInputPartner];
    [v4 documentStateChanged];
  }
  [(UIDictationController *)self resumeDictation];
}

- (id)commandTargetStringWithDictationCommandIdentifier:(unint64_t)a3 parameters:(id)a4
{
  id v5 = a4;
  id v6 = 0;
  if (a3 <= 0x17)
  {
    if (((1 << a3) & 0xC04AC2) != 0)
    {
      uint64_t v7 = [(id)objc_opt_class() firstParameterTextWithParameters:v5];
    }
    else
    {
      if (((1 << a3) & 0x30) == 0) {
        goto LABEL_7;
      }
      uint64_t v7 = [(id)objc_opt_class() secondParameterTextWithParameters:v5];
    }
    id v6 = (void *)v7;
  }
LABEL_7:

  return v6;
}

+ (BOOL)supportsSendVoiceCommand
{
  if (qword_1EB25AA58 != -1) {
    dispatch_once(&qword_1EB25AA58, &__block_literal_global_1512);
  }
  if (+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v2 = (void *)qword_1EB25AA60;
    id v3 = +[UIKeyboard keyboardBundleIdentifier];
    char v4 = [v2 containsObject:v3];
  }
  else
  {
    if (+[UIKeyboard usesInputSystemUI]) {
      return 1;
    }
    if (qword_1EB25AA68 != -1) {
      dispatch_once(&qword_1EB25AA68, &__block_literal_global_1521);
    }
    if (!byte_1EB25A975) {
      return 0;
    }
    id v6 = +[UIKeyboardImpl activeInstance];
    uint64_t v7 = [v6 inputDelegateManager];
    id v3 = [v7 textInputDelegate];

    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      BOOL v5 = 0;
      goto LABEL_6;
    }
    char v4 = [v3 canPerformDictationAction:@"UITextInputDictationActionTypeSend"];
  }
  BOOL v5 = v4;
LABEL_6:

  return v5;
}

void __49__UIDictationController_supportsSendVoiceCommand__block_invoke()
{
  uint64_t v0 = (void *)qword_1EB25AA60;
  qword_1EB25AA60 = (uint64_t)&unk_1ED3F0628;
}

void __49__UIDictationController_supportsSendVoiceCommand__block_invoke_2()
{
  uint64_t v0 = (void *)qword_1EB25AA60;
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v1 = [v2 bundleIdentifier];
  byte_1EB25A975 = [v0 containsObject:v1];
}

- (void)_performStandardEditAction:(SEL)a3 sender:(id)a4
{
  id v8 = a4;
  BOOL v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 inputDelegateManager];
  uint64_t v7 = [v6 delegateAsResponder];

  if ([v7 canPerformAction:a3 withSender:0]) {
    [(id)UIApp sendAction:a3 to:v7 from:v8 forEvent:0];
  }
}

- (id)_documentStateForCommandApplicability
{
  id v3 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
  char v4 = [v3 documentState];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(UIDictationController *)self visibleRTIDocumentStateAtStart];
    id v6 = [v7 documentState];
  }
  return v6;
}

- (BOOL)hasTextMatchForString:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  BOOL v5 = [(UIDictationController *)self _documentStateForCommandApplicability];
  id v6 = [v5 contextBeforeInput];
  uint64_t v7 = [v6 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  id v8 = [v5 contextAfterInput];
  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __47__UIDictationController_hasTextMatchForString___block_invoke;
  v11[3] = &unk_1E52FACF0;
  v11[4] = &v12;
  [(UIDictationController *)self searchString:v4 contextBefore:v7 contextAfter:v9 completionHandler:v11];
  LOBYTE(self) = *((unsigned char *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return (char)self;
}

uint64_t __47__UIDictationController_hasTextMatchForString___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)canApplyVoiceCommandWithIdentifier:(id)a3 parameters:(id)a4 commandUtteranceString:(id)a5 voiceCommandUUID:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (char *)a3;
  id v11 = a4;
  id v44 = a5;
  id v12 = a6;
  uint64_t v13 = [(id)objc_opt_class() commandIdentifierWithStringIdentifier:v10];
  id v14 = objc_alloc_init((Class)getSISchemaUEIDictationVoiceCommandExecutedClass());
  objc_msgSend(v14, "setCommandType:", objc_msgSend((id)objc_opt_class(), "mapDictationCommandIdentifierToUEIcommandIdentifier:", v13));
  char v15 = (void *)[objc_alloc((Class)getSISchemaUUIDClass()) initWithNSUUID:v12];
  [v14 setVoiceCommandId:v15];

  if (v13)
  {
    if ([(id)objc_opt_class() canHandleCommandIdentifier:v13])
    {
      long long v43 = [(UIDictationController *)self _documentStateForCommandApplicability];
      uint64_t v16 = +[UIKeyboardImpl activeInstance];
      uint64_t v17 = [v16 delegateAsResponder];
      uint64_t v18 = [v17 _responderForEditing];
      uint64_t v42 = [v18 undoManager];

      if (v13 == 27)
      {
        if (([v42 canRedo] & 1) == 0) {
          goto LABEL_6;
        }
      }
      else if (v13 == 21 && ([v42 canUndo] & 1) == 0)
      {
LABEL_6:
        uint64_t v19 = _UIDictationControllerLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          uint64_t v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
          _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_DEFAULT, "%s Command applicability check: command was undo or redo but undo manager says we can't", buf, 0xCu);
        }
        goto LABEL_42;
      }
      if (v43)
      {
        uint64_t v41 = [(UIDictationController *)self commandTargetStringWithDictationCommandIdentifier:v13 parameters:v11];
        if ([(UIDictationController *)self isSelectionRequiredForCommand:v13])
        {
          uint64_t v23 = +[UIKeyboardImpl activeInstance];
          uint64_t v24 = [v23 inputDelegate];
          uint64_t v25 = [v24 selectedTextRange];
          if ([v25 isEmpty])
          {
            BOOL v26 = [(UIDictationController *)self hasSelectedTextRange];

            uint64_t v27 = v41;
            if (!v26)
            {
              uint64_t v28 = _UIDictationControllerLog();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                uint64_t v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
                __int16 v52 = 2112;
                uint64_t v53 = v10;
                uint64_t v29 = "%s Command applicability check: no selection found for command with identifier: %@";
LABEL_26:
                _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
                goto LABEL_27;
              }
              goto LABEL_27;
            }
          }
          else
          {

            uint64_t v27 = v41;
          }
LABEL_36:

          goto LABEL_37;
        }
        if (-[UIDictationController _isNonEmptyDocumentRequiredForCommand:](self, "_isNonEmptyDocumentRequiredForCommand:", v13)&& [v43 documentIsEmpty])
        {
          uint64_t v28 = _UIDictationControllerLog();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
            __int16 v52 = 2112;
            uint64_t v53 = v10;
            uint64_t v29 = "%s Command applicability check: document is empty but non-empty document required by command with identifier: %@";
            goto LABEL_26;
          }
LABEL_27:

LABEL_41:
          uint64_t v19 = v41;
LABEL_42:

          [v14 setCommandStatus:3];
          [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v14];
          BOOL v22 = 0;
          goto LABEL_43;
        }
        uint64_t v27 = v41;
        if (!v41) {
          goto LABEL_36;
        }
        uint64_t v46 = 0;
        uint64_t v47 = &v46;
        uint64_t v48 = 0x2020000000;
        char v49 = 0;
        id v30 = [v43 contextBeforeInput];
        uint64_t v31 = [v30 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        id v32 = [v43 contextAfterInput];
        uint64_t v39 = [v32 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        id v33 = v41;
        if ([v44 length])
        {
          uint64_t v35 = [v31 rangeOfString:v44 options:5];
          if (v35 != 0x7FFFFFFFFFFFFFFFLL && v35 + v34 == [v31 length])
          {
            uint64_t v36 = [v31 substringToIndex:v35];

            uint64_t v31 = (void *)v36;
            id v33 = v41;
          }
        }
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __111__UIDictationController_canApplyVoiceCommandWithIdentifier_parameters_commandUtteranceString_voiceCommandUUID___block_invoke;
        v45[3] = &unk_1E52FACF0;
        v45[4] = &v46;
        -[UIDictationController searchString:contextBefore:contextAfter:completionHandler:](self, "searchString:contextBefore:contextAfter:completionHandler:", v33, v31, v39, v45, v39);
        if (!*((unsigned char *)v47 + 24))
        {
          long long v37 = _UIDictationControllerLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
            __int16 v52 = 2112;
            uint64_t v53 = v10;
            __int16 v54 = 2112;
            long long v55 = v41;
            __int16 v56 = 2112;
            id v57 = v31;
            _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_DEFAULT, "%s Command applicability check: command target not found for command with identifier: %@, target: %@, context before \"%@\"", buf, 0x2Au);
          }

          _Block_object_dispose(&v46, 8);
          goto LABEL_41;
        }

        _Block_object_dispose(&v46, 8);
      }
LABEL_37:
      BOOL v22 = 1;
LABEL_43:

      goto LABEL_44;
    }
    uint64_t v21 = _UIDictationControllerLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v51 = v10;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "UIDictationController unhandled command with identifier: %@", buf, 0xCu);
    }

    [v14 setCommandStatus:2];
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v14];
  }
  else
  {
    uint64_t v20 = _UIDictationControllerLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v51 = "-[UIDictationController canApplyVoiceCommandWithIdentifier:parameters:commandUtteranceString:voiceCommandUUID:]";
      __int16 v52 = 2112;
      uint64_t v53 = v10;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "%s Unknown command with identifier: %@", buf, 0x16u);
    }

    [v14 setCommandStatus:0];
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v14];
  }
  BOOL v22 = 0;
LABEL_44:

  return v22;
}

uint64_t __111__UIDictationController_canApplyVoiceCommandWithIdentifier_parameters_commandUtteranceString_voiceCommandUUID___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

- (BOOL)_handleMultipleTextTargetsForText:(id)a3 payloadText:(id)a4 voiceCommandUUID:(id)a5
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v89 = a4;
  id v9 = a5;
  [(UIDictationController *)self setCommandTargetRangeMatchingGazeRange:0];
  uint64_t v10 = +[UIKeyboardImpl activeInstance];
  id v11 = [v10 inputDelegateManager];
  char v12 = [v11 hasAsyncCapableInputDelegate];

  v96 = v10;
  uint64_t v13 = [v10 inputDelegateManager];
  id v14 = [v13 keyInputDelegate];
  char v15 = objc_opt_respondsToSelector();

  uint64_t v16 = 0;
  uint64_t v17 = 0;
  if (v15)
  {
    uint64_t v18 = [v10 inputDelegateManager];
    uint64_t v19 = [v18 keyInputDelegate];
    uint64_t v17 = [v19 performSelector:sel_textLayoutController];

    uint64_t v16 = -[_UITextLayoutControllerBase textInputController](v17);
  }
  int v20 = [(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign];
  BOOL v21 = 0;
  if (v16) {
    int v22 = 1;
  }
  else {
    int v22 = v20;
  }
  if ((v12 & 1) == 0 && v22)
  {
    uint64_t v87 = v16;
    if (+[UIKeyboard inputUIOOP])
    {
      if (!+[UIKeyboard usesInputSystemUI])
      {
        uint64_t v28 = 0;
        uint64_t v25 = 0;
LABEL_20:
        uint64_t v36 = [v25 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        uint64_t v37 = [v28 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

        long long v38 = -[UIDictationController rangesForSearchStringWithWordBoundariesValidation:substring:reverse:](self, "rangesForSearchStringWithWordBoundariesValidation:substring:reverse:", v36, v8, [(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign] ^ 1);
        id v86 = (void *)v37;
        uint64_t v39 = [(UIDictationController *)self rangesForSearchStringWithWordBoundariesValidation:v37 substring:v8 reverse:0];
        v95 = [MEMORY[0x1E4F1CA48] array];
        uint64_t v40 = [v38 count];
        uint64_t v41 = [v39 count] + v40;
        uint64_t v42 = [(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign] ^ 1;
        BOOL v21 = v41 > v42;
        if (v41 <= v42)
        {
          __int16 v62 = v36;
          uint64_t v63 = v86;
          uint64_t v16 = v87;
        }
        else
        {
          uint64_t v84 = self;
          long long v85 = v17;
          v80 = v9;
          id v81 = v8;
          uint64_t v94 = [MEMORY[0x1E4F1CA48] array];
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          uint64_t v82 = v39;
          id v83 = v38;
          v116[0] = v38;
          v116[1] = v39;
          id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
          uint64_t v91 = [obj countByEnumeratingWithState:&v109 objects:v117 count:16];
          if (v91)
          {
            uint64_t v90 = *(void *)v110;
            do
            {
              uint64_t v43 = 0;
              do
              {
                if (*(void *)v110 != v90) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v92 = v43;
                id v44 = *(void **)(*((void *)&v109 + 1) + 8 * v43);
                long long v105 = 0u;
                long long v106 = 0u;
                long long v107 = 0u;
                long long v108 = 0u;
                id v45 = v44;
                uint64_t v46 = [v45 countByEnumeratingWithState:&v105 objects:v115 count:16];
                if (v46)
                {
                  uint64_t v47 = v46;
                  uint64_t v48 = *(void *)v106;
                  do
                  {
                    for (uint64_t i = 0; i != v47; ++i)
                    {
                      if (*(void *)v106 != v48) {
                        objc_enumerationMutation(v45);
                      }
                      int v50 = [*(id *)(*((void *)&v105 + 1) + 8 * i) rangeValue];
                      uint64_t v52 = v51;
                      if (v36) {
                        v50 -= [v36 length];
                      }
                      uint64_t v53 = [v96 inputDelegateManager];
                      __int16 v54 = [v53 textInputDelegate];
                      long long v55 = objc_msgSend(v54, "_rangeFromCurrentRangeWithDelta:", v50, v52);

                      [v94 addObject:v55];
                      __int16 v56 = (void *)MEMORY[0x1E4F29238];
                      id v57 = [v96 inputDelegateManager];
                      uint64_t v58 = [v57 textInputDelegate];
                      uint64_t v59 = [v58 _nsrangeForTextRange:v55];
                      int v61 = objc_msgSend(v56, "valueWithRange:", v59, v60);
                      [v95 addObject:v61];
                    }
                    uint64_t v47 = [v45 countByEnumeratingWithState:&v105 objects:v115 count:16];
                  }
                  while (v47);
                }

                uint64_t v36 = 0;
                uint64_t v43 = v92 + 1;
              }
              while (v92 + 1 != v91);
              uint64_t v36 = 0;
              __int16 v62 = 0;
              uint64_t v91 = [obj countByEnumeratingWithState:&v109 objects:v117 count:16];
            }
            while (v91);
          }
          else
          {
            __int16 v62 = v36;
          }

          if ([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign])
          {
            [(UIDictationController *)v84 playVoiceCommandHapticFeedack];
            uint64_t v64 = [v96 _textChoicesAssistant];
            v101[0] = MEMORY[0x1E4F143A8];
            v101[1] = 3221225472;
            v101[2] = __88__UIDictationController__handleMultipleTextTargetsForText_payloadText_voiceCommandUUID___block_invoke;
            v101[3] = &unk_1E52FAD18;
            v101[4] = v84;
            id v9 = v80;
            id v102 = v80;
            int v65 = v94;
            id v103 = v94;
            id v104 = v96;
            [v64 decorateTextInRanges:v103 replacementText:v89 allowAutomaticReplacement:1 autoHide:0 voiceCommandTrackingUUID:v102 withCompletionHandler:v101];

            id v8 = v81;
          }
          else
          {
            [v87 removeAllTextAlternatives];
            id v66 = [v96 inputDelegateManager];
            uint64_t v93 = [v66 selectedTextRange];

            long long v99 = 0u;
            long long v100 = 0u;
            long long v97 = 0u;
            long long v98 = 0u;
            id v67 = v94;
            uint64_t v68 = [v67 countByEnumeratingWithState:&v97 objects:v114 count:16];
            id v8 = v81;
            if (v68)
            {
              uint64_t v69 = v68;
              uint64_t v70 = *(void *)v98;
              do
              {
                for (uint64_t j = 0; j != v69; ++j)
                {
                  if (*(void *)v98 != v70) {
                    objc_enumerationMutation(v67);
                  }
                  uint64_t v72 = *(void *)(*((void *)&v97 + 1) + 8 * j);
                  long long v73 = [v96 inputDelegateManager];
                  uint64_t v74 = [v73 textInRange:v72];

                  if (([v74 isEqualToString:v89] & 1) == 0)
                  {
                    uint64_t v75 = [v96 inputDelegateManager];
                    [v75 setSelectedTextRange:v72];

                    long long v76 = [v96 inputDelegateManager];
                    id v113 = v89;
                    long long v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v113 count:1];
                    [v76 insertText:v74 alternatives:v77 style:1];
                  }
                }
                uint64_t v69 = [v67 countByEnumeratingWithState:&v97 objects:v114 count:16];
              }
              while (v69);
            }

            long long v78 = [v96 inputDelegateManager];
            [v78 setSelectedTextRange:v93];

            id v9 = v80;
            int v65 = v94;
          }

          uint64_t v17 = v85;
          uint64_t v63 = v86;
          uint64_t v16 = v87;
          BOOL v21 = 1;
          uint64_t v39 = v82;
          long long v38 = v83;
        }

        goto LABEL_54;
      }
      uint64_t v23 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      uint64_t v24 = [v23 documentState];
      uint64_t v25 = [v24 contextBeforeInput];

      BOOL v26 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      uint64_t v27 = [v26 documentState];
      uint64_t v28 = [v27 contextAfterInput];
    }
    else
    {
      uint64_t v29 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      id v30 = [v29 documentState];
      if (v30)
      {
        uint64_t v31 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
        id v32 = [v31 documentState];
        uint64_t v25 = [v32 contextBeforeInput];
      }
      else
      {
        uint64_t v25 = [(UIDictationController *)self visibleContextBeforeInputAtCommandExecution];
      }
      id v33 = v17;

      BOOL v26 = [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      uint64_t v27 = [v26 documentState];
      if (v27) {
        [(UIDictationController *)self visibleRTIDocumentStateAtCommandRecognition];
      }
      else {
      uint64_t v34 = [(UIDictationController *)self visibleRTIDocumentStateAtStart];
      }
      uint64_t v35 = [v34 documentState];
      uint64_t v28 = [v35 contextAfterInput];

      uint64_t v17 = v33;
    }

    goto LABEL_20;
  }
LABEL_54:

  return v21;
}

uint64_t __88__UIDictationController__handleMultipleTextTargetsForText_payloadText_voiceCommandUUID___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    BOOL v5 = NSNumber;
    id v6 = (void *)a1[6];
    id v7 = a2;
    id v8 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "count"));
    [v3 instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:v4 disambiguationIndex:v7 totalDisambiguationCount:v8];
  }
  id v9 = (void *)a1[4];
  uint64_t v10 = a1[7];
  return [v9 notifyDocumentStateChangedAndResumeDictation:v10];
}

- (void)instrumentDictationVoiceCommandUndoTapActionWithVoiceCommandUUID:(id)a3 undoTapAlternativeSelection:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v7 = (void *)getSISchemaUEIDictationVoiceCommandUndoTapActionClass_softClass;
  uint64_t v15 = getSISchemaUEIDictationVoiceCommandUndoTapActionClass_softClass;
  if (!getSISchemaUEIDictationVoiceCommandUndoTapActionClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __getSISchemaUEIDictationVoiceCommandUndoTapActionClass_block_invoke;
    v11[3] = &unk_1E52D9900;
    v11[4] = &v12;
    __getSISchemaUEIDictationVoiceCommandUndoTapActionClass_block_invoke((uint64_t)v11);
    id v7 = (void *)v13[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v12, 8);
  id v9 = objc_alloc_init(v8);
  uint64_t v10 = (void *)[objc_alloc((Class)getSISchemaUUIDClass()) initWithNSUUID:v6];
  [v9 setVoiceCommandId:v10];

  [v9 setIsUndoTapAlternativeSelection:v4];
  [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v9];
}

- (void)instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:(id)a3 disambiguationIndex:(id)a4 totalDisambiguationCount:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v11 = (void *)getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_softClass;
  uint64_t v19 = getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_softClass;
  if (!getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_softClass)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_block_invoke;
    v15[3] = &unk_1E52D9900;
    v15[4] = &v16;
    __getSISchemaUEIDictationVoiceCommandDisambiguationActionClass_block_invoke((uint64_t)v15);
    id v11 = (void *)v17[3];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v16, 8);
  id v13 = objc_alloc_init(v12);
  uint64_t v14 = (void *)[objc_alloc((Class)getSISchemaUUIDClass()) initWithNSUUID:v8];
  [v13 setVoiceCommandId:v14];

  [v13 setDisambiguationType:1];
  objc_msgSend(v13, "setDisambiguationIndex:", objc_msgSend(v9, "intValue"));
  objc_msgSend(v13, "setTotalDisambiguationAlternatives:", objc_msgSend(v10, "intValue"));
  [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v13];
}

- (void)_applyWKAlternativesPayload:(id)a3 toAbsoluteRanges:(id)a4 valueRangeToText:(id)a5 context:(id)a6 originalSelectedRange:(_NSRange)a7 completionHandler:(id)a8
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  id v16 = a6;
  uint64_t v17 = +[UIKeyboardImpl activeInstance];
  uint64_t v18 = [v13 lastObject];
  uint64_t v19 = [v18 rangeValue];
  uint64_t v21 = objc_msgSend(v16, "directionalRangeForSelectionRange:", v19, v20);
  uint64_t v23 = v22;

  uint64_t v24 = [v17 inputDelegateManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke;
  v33[3] = &unk_1E52FADB8;
  id v34 = v17;
  uint64_t v35 = self;
  id v36 = v14;
  id v37 = v18;
  id v38 = v12;
  id v39 = v13;
  NSUInteger v41 = location;
  NSUInteger v42 = length;
  id v40 = v15;
  id v25 = v15;
  id v26 = v13;
  id v27 = v12;
  id v28 = v18;
  id v29 = v14;
  id v30 = v17;
  objc_msgSend(v24, "adjustSelection:completionHandler:", v21, v23, v33);
}

void __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_2;
  v5[3] = &unk_1E52FAD90;
  id v2 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  id v9 = *(id *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 88);
  id v3 = *(id *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v4;
  id v12 = *(id *)(a1 + 80);
  [v2 _requestDocumentContextWithCompletionHandler:v5];
}

void __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = a2;
  id v6 = [v3 objectForKey:v4];
  id v7 = objc_alloc((Class)off_1E52D2EA8);
  v25[0] = *(void *)(a1 + 48);
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v9 = (void *)[v7 initWithPrimaryString:v6 alternativeStrings:v8 isLowConfidence:1];

  id v10 = [*(id *)(a1 + 56) inputDelegateManager];
  [v10 addTextAlternatives:v9];

  uint64_t v11 = objc_msgSend(v5, "directionalRangeForSelectionRange:", *(void *)(a1 + 88), *(void *)(a1 + 96));
  uint64_t v13 = v12;

  id v14 = [*(id *)(a1 + 56) inputDelegateManager];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_3;
  v17[3] = &unk_1E52FAD68;
  id v18 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 72);
  id v19 = v15;
  uint64_t v20 = v16;
  id v21 = *(id *)(a1 + 48);
  id v22 = *(id *)(a1 + 32);
  long long v24 = *(_OWORD *)(a1 + 88);
  id v23 = *(id *)(a1 + 80);
  objc_msgSend(v14, "adjustSelection:completionHandler:", v11, v13, v17);
}

void __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  [*(id *)(a1 + 40) removeLastObject];
  if ([*(id *)(a1 + 40) count])
  {
    id v2 = *(void **)(a1 + 48);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_4;
    v4[3] = &unk_1E52FAD40;
    v4[4] = v2;
    id v5 = *(id *)(a1 + 56);
    id v6 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 64);
    long long v9 = *(_OWORD *)(a1 + 80);
    id v8 = *(id *)(a1 + 72);
    [v2 _requestDocumentContextWithCompletionHandler:v4];
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    v3();
  }
}

uint64_t __135__UIDictationController__applyWKAlternativesPayload_toAbsoluteRanges_valueRangeToText_context_originalSelectedRange_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_applyWKAlternativesPayload:toAbsoluteRanges:valueRangeToText:context:originalSelectedRange:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), a2, *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 64));
}

- (void)_handleWKMultipleTextTargetsForText:(id)a3 payloadText:(id)a4 voiceCommandUUID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[UIKeyboardImpl activeInstance];
  id v15 = [v14 inputDelegateManager];
  char v16 = [v15 hasAsyncCapableInputDelegate];

  if (v16)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke;
    v17[3] = &unk_1E52FAE08;
    void v17[4] = self;
    id v18 = v10;
    id v19 = v11;
    id v20 = v14;
    id v21 = v12;
    id v22 = v13;
    [(UIDictationController *)self _requestDocumentContextWithCompletionHandler:v17];
  }
  else
  {
    (*((void (**)(id, void))v13 + 2))(v13, 0);
  }
}

void __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 contextBefore];
  id v5 = _stringForObject(v4);
  id v6 = [v5 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  id v7 = [v3 contextAfter];
  id v8 = _stringForObject(v7);
  uint64_t v9 = [v8 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];

  long long v85 = v3;
  uint64_t v84 = [v3 selectedTextRange];
  uint64_t v11 = v10;
  id v12 = objc_msgSend(*(id *)(a1 + 32), "rangesForSearchStringWithWordBoundariesValidation:substring:reverse:", v6, *(void *)(a1 + 40), objc_msgSend((id)objc_opt_class(), "supportsSiriDictationVoiceCommandsUIRedesign") ^ 1);
  long long v77 = (void *)v9;
  id v13 = [*(id *)(a1 + 32) rangesForSearchStringWithWordBoundariesValidation:v9 substring:*(void *)(a1 + 40) reverse:0];
  uint64_t v14 = [v12 count];
  uint64_t v15 = [v13 count] + v14;
  if (v15 <= ([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign] ^ 1))
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    long long v55 = v6;
  }
  else
  {
    uint64_t v70 = v11;
    id v83 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v82 = [MEMORY[0x1E4F1CA48] array];
    id v81 = [MEMORY[0x1E4F1CA48] array];
    v80 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v79 = [MEMORY[0x1E4F1CA48] array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v71 = v13;
    uint64_t v72 = v12;
    v106[0] = v12;
    v106[1] = v13;
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
    uint64_t v75 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
    if (v75)
    {
      uint64_t v74 = *(void *)v101;
      unint64_t v16 = 0x1E4F29000uLL;
      uint64_t v78 = a1;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v101 != v74) {
            objc_enumerationMutation(obj);
          }
          uint64_t v76 = v17;
          id v18 = *(void **)(*((void *)&v100 + 1) + 8 * v17);
          long long v96 = 0u;
          long long v97 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v89 = v18;
          uint64_t v19 = [v89 countByEnumeratingWithState:&v96 objects:v105 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v97;
            uint64_t v86 = *(void *)v97;
            uint64_t v87 = v6;
            do
            {
              uint64_t v22 = 0;
              uint64_t v88 = v20;
              do
              {
                if (*(void *)v97 != v21) {
                  objc_enumerationMutation(v89);
                }
                uint64_t v23 = [*(id *)(*((void *)&v96 + 1) + 8 * v22) rangeValue];
                uint64_t v25 = v24;
                if (v6)
                {
                  int v26 = v23 - [v6 length];
                  id v27 = v6;
                }
                else
                {
                  id v27 = v77;
                  int v26 = v23;
                }
                id v28 = objc_msgSend(v27, "substringWithRange:", v23, v25);
                if (([v28 isEqualToString:*(void *)(a1 + 48)] & 1) == 0)
                {
                  uint64_t v29 = v26;
                  uint64_t v30 = v26 + v84;
                  unint64_t v31 = v16;
                  id v32 = objc_msgSend(*(id *)(v16 + 568), "valueWithRange:", v30, v25);
                  [v82 addObject:v32];

                  id v33 = objc_msgSend(v85, "characterRectsForCharacterRange:", v30, v25);
                  id v34 = [v33 firstObject];
                  [v34 CGRectValue];
                  double x = v35;
                  double y = v37;
                  double width = v39;
                  double height = v41;

                  long long v94 = 0u;
                  long long v95 = 0u;
                  long long v92 = 0u;
                  long long v93 = 0u;
                  id v43 = v33;
                  uint64_t v44 = [v43 countByEnumeratingWithState:&v92 objects:v104 count:16];
                  if (v44)
                  {
                    uint64_t v45 = v44;
                    uint64_t v46 = *(void *)v93;
                    do
                    {
                      for (uint64_t i = 0; i != v45; ++i)
                      {
                        if (*(void *)v93 != v46) {
                          objc_enumerationMutation(v43);
                        }
                        [*(id *)(*((void *)&v92 + 1) + 8 * i) CGRectValue];
                        v111.origin.double x = v48;
                        v111.origin.double y = v49;
                        v111.size.double width = v50;
                        v111.size.double height = v51;
                        v109.origin.double x = x;
                        v109.origin.double y = y;
                        v109.size.double width = width;
                        v109.size.double height = height;
                        CGRect v110 = CGRectUnion(v109, v111);
                        double x = v110.origin.x;
                        double y = v110.origin.y;
                        double width = v110.size.width;
                        double height = v110.size.height;
                      }
                      uint64_t v45 = [v43 countByEnumeratingWithState:&v92 objects:v104 count:16];
                    }
                    while (v45);
                  }

                  unint64_t v16 = v31;
                  uint64_t v52 = objc_msgSend(*(id *)(v31 + 568), "valueWithCGRect:", x, y, width, height);
                  [v81 addObject:v52];

                  uint64_t v53 = objc_msgSend(*(id *)(v31 + 568), "valueWithRange:", v30, v25);
                  [v83 setObject:v28 forKey:v53];

                  __int16 v54 = objc_msgSend(*(id *)(v31 + 568), "valueWithRange:", v29, v25);
                  [v80 addObject:v54];

                  [v79 addObject:v28];
                  a1 = v78;
                  uint64_t v21 = v86;
                  id v6 = v87;
                  uint64_t v20 = v88;
                }

                ++v22;
              }
              while (v22 != v20);
              uint64_t v20 = [v89 countByEnumeratingWithState:&v96 objects:v105 count:16];
            }
            while (v20);
          }

          id v6 = 0;
          uint64_t v17 = v76 + 1;
        }
        while (v76 + 1 != v75);
        id v6 = 0;
        long long v55 = 0;
        uint64_t v75 = [obj countByEnumeratingWithState:&v100 objects:v107 count:16];
      }
      while (v75);
    }
    else
    {
      long long v55 = v6;
    }

    int v56 = [(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign];
    id v57 = *(void **)(a1 + 32);
    if (v56)
    {
      [*(id *)(a1 + 32) playVoiceCommandHapticFeedack];
      uint64_t v58 = [*(id *)(a1 + 56) _textChoicesAssistant];
      uint64_t v59 = *(void *)(a1 + 48);
      v90[0] = MEMORY[0x1E4F143A8];
      v90[1] = 3221225472;
      v90[2] = __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke_2;
      v90[3] = &unk_1E52FADE0;
      uint64_t v60 = *(void *)(a1 + 64);
      id v91 = *(id *)(a1 + 72);
      LOWORD(v69) = 1;
      __int16 v62 = v80;
      int v61 = v81;
      uint64_t v63 = v79;
      [v58 decorateTextInRects:v81 targetTextArray:v79 replacementText:v59 deltaRanges:v80 originalSelectedRange:v84 allowAutomaticReplacement:v70 autoHide:v69 voiceCommandUUID:v60 withCompletionHandler:v90];

      uint64_t v64 = v91;
      id v12 = v72;
      int v65 = v82;
      id v66 = v83;
    }
    else
    {
      uint64_t v67 = *(void *)(a1 + 48);
      id v66 = v83;
      uint64_t v64 = (void *)[v83 copy];
      uint64_t v68 = v67;
      int v65 = v82;
      objc_msgSend(v57, "_applyWKAlternativesPayload:toAbsoluteRanges:valueRangeToText:context:originalSelectedRange:completionHandler:", v68, v82, v64, v85, v84, v70, *(void *)(a1 + 72));
      id v12 = v72;
      __int16 v62 = v80;
      int v61 = v81;
      uint64_t v63 = v79;
    }

    id v13 = v71;
  }
}

uint64_t __108__UIDictationController__handleWKMultipleTextTargetsForText_payloadText_voiceCommandUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleRecognizedCommandWithCommandIdentifier:(unint64_t)a3 parameters:(id)a4 strings:(id)a5 voiceCommandUUID:(id)a6
{
  id v10 = a4;
  id v70 = a5;
  id v11 = a6;
  id v12 = +[UIKeyboardImpl activeInstance];
  id v13 = [v12 inputDelegateManager];
  uint64_t v14 = [v13 textInputDelegate];
  uint64_t v15 = [v12 inputDelegateManager];
  unint64_t v16 = [v15 selectedTextRange];
  uint64_t v17 = [v14 _nsrangeForTextRange:v16];
  -[UIDictationController setPreCommandExecutionPositionRange:](self, "setPreCommandExecutionPositionRange:", v17, v18);

  if (a3 == 21
    || ([(UIDictationController *)self _addUndoNotificationObservationWithVoiceCommandUUID:v11], a3 != 26))
  {
    uint64_t v25 = [v12 _textChoicesAssistant];
    [v25 resetDictationChoices];

    int v26 = [v12 _textChoicesAssistant];
    [v26 resetDictationUnderlines];

    switch(a3)
    {
      case 6uLL:
      case 7uLL:
      case 9uLL:
      case 0xBuLL:
        id v27 = [(id)objc_opt_class() firstParameterTextWithParameters:v10];
        id v28 = v27;
        if (a3 == 11)
        {
          uint64_t v29 = [v27 lowercaseString];
        }
        else if (a3 == 9)
        {
          uint64_t v29 = [v27 capitalizedString];
        }
        else
        {
          if (a3 == 7) {
            [v27 uppercaseString];
          }
          else {
          uint64_t v29 = [(id)objc_opt_class() secondParameterTextWithParameters:v10];
          }
        }
        id v43 = (void *)v29;
        v107[0] = MEMORY[0x1E4F143A8];
        v107[1] = 3221225472;
        v107[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_2;
        v107[3] = &unk_1E52FAEA8;
        v107[4] = self;
        id v108 = v12;
        id v109 = v28;
        id v110 = v43;
        id v111 = v11;
        id v44 = v43;
        id v31 = v28;
        [(UIDictationController *)self _handleWKMultipleTextTargetsForText:v31 payloadText:v44 voiceCommandUUID:v111 completionHandler:v107];

        goto LABEL_44;
      case 8uLL:
      case 0xAuLL:
      case 0xCuLL:
        uint64_t v30 = [v12 inputDelegateManager];
        id v31 = [v30 selectedTextRange];

        id v32 = [v12 inputDelegateManager];
        int v33 = [v32 hasAsyncCapableInputDelegate];

        if (v33)
        {
          v112[0] = MEMORY[0x1E4F143A8];
          v112[1] = 3221225472;
          v112[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke;
          v112[3] = &unk_1E52FAE30;
          unint64_t v115 = a3;
          id v113 = v12;
          v114 = self;
          [(UIDictationController *)self _requestDocumentContextWithCompletionHandler:v112];

          goto LABEL_44;
        }
        [v12 updateForChangedSelection];
        id v34 = [v12 inputDelegateManager];
        double v35 = [v34 textInRange:v31];

        switch(a3)
        {
          case 8uLL:
            uint64_t v36 = [v35 uppercaseString];
            break;
          case 0xCuLL:
            uint64_t v36 = [v35 lowercaseString];
            break;
          case 0xAuLL:
            uint64_t v36 = [v35 capitalizedString];
            break;
          default:
            goto LABEL_43;
        }
        uint64_t v45 = (void *)v36;

        double v35 = v45;
LABEL_43:
        uint64_t v46 = [v12 inputDelegateManager];
        [v46 insertText:v35];

        [(UIDictationController *)self notifyDocumentStateChangedAndResumeDictation:v12];
LABEL_44:

        break;
      case 0xEuLL:
        id v38 = [(id)objc_opt_class() firstParameterTextWithParameters:v10];
        v103[0] = MEMORY[0x1E4F143A8];
        v103[1] = 3221225472;
        v103[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_7;
        v103[3] = &unk_1E52DAF90;
        v103[4] = self;
        id v104 = v12;
        id v105 = v38;
        id v106 = v11;
        id v20 = v38;
        [(UIDictationController *)self _handleWKMultipleTextTargetsForText:v20 payloadText:0x1ED1450A0 voiceCommandUUID:v106 completionHandler:v103];

        uint64_t v24 = v104;
        goto LABEL_5;
      case 0xFuLL:
        [(UIDictationController *)self playVoiceCommandHapticFeedack];
        [(UIDictationController *)self _performStandardEditAction:sel_selectAll_ sender:0];
        goto LABEL_30;
      case 0x10uLL:
        double v39 = sel_cut_;
        goto LABEL_28;
      case 0x11uLL:
        [(UIDictationController *)self _performStandardEditAction:sel_copy_ sender:0];
        [v12 dismissDictationMenu];
        [v12 presentDictationMenu];
        goto LABEL_30;
      case 0x12uLL:
        double v39 = sel_paste_;
LABEL_28:
        [(UIDictationController *)self _performStandardEditAction:v39 sender:0];
LABEL_29:
        [v12 dismissDictationMenu];
LABEL_30:
        [(UIDictationController *)self notifyDocumentStateChangedAndResumeDictation:v12];
        break;
      case 0x14uLL:
        id v40 = +[UIDictationLandingView activeInstance];
        int v41 = [v40 canStopLanding];

        if (v41)
        {
          NSUInteger v42 = +[UIDictationLandingView activeInstance];
          [v42 stopLanding];
        }
        id v20 = +[UIDictationController activeInstance];
        [v20 stopDictation];
        goto LABEL_6;
      case 0x15uLL:
        [(UIDictationController *)self playVoiceCommandHapticFeedack];
        [(UIDictationController *)self _performDictationUndo];
        break;
      case 0x1BuLL:
        [(UIDictationController *)self playVoiceCommandHapticFeedack];
        [(UIDictationController *)self _performDictationRedo];
        break;
      default:
        if (a3 != 22 && a3 != 5)
        {
          switch(a3)
          {
            case 0x13uLL:
              uint64_t v47 = +[UIDictationLandingView sharedInstance];
              [v47 stopLanding];

              CGFloat v48 = +[UIKeyboardImpl activeInstance];
              [v48 performSendAction];
              goto LABEL_61;
            case 0x14uLL:
            case 0x15uLL:
            case 0x16uLL:
              goto LABEL_45;
            case 0x17uLL:
LABEL_56:
              uint64_t v97 = 0;
              long long v98 = &v97;
              uint64_t v99 = 0x3032000000;
              long long v100 = __Block_byref_object_copy__126;
              long long v101 = __Block_byref_object_dispose__126;
              uint64_t v102 = [(id)objc_opt_class() firstParameterTextWithParameters:v10];
              id v57 = [(id)objc_opt_class() secondParameterTextWithParameters:v10];
              if (+[UIDictationUtilities shouldInsertSpaceBetweenStringA:v57 andStringB:v98[5]])
              {
                [NSString stringWithFormat:@"%@ %@", v57, v98[5], v70];
              }
              else
              {
                [v57 stringByAppendingString:v98[5]];
              uint64_t v60 = };
              if (a3 == 23)
              {
                id v61 = (id)v98[5];

                __int16 v62 = @"_placeholder_UIDictationTextAlternativesActionMoveAfter_D48B4A2E-2FBE-41EE-A266-3B7B3FB8F4DD_";
                id v57 = v61;
                uint64_t v60 = v62;
              }
              v83[0] = MEMORY[0x1E4F143A8];
              v83[1] = 3221225472;
              v83[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_15;
              v83[3] = &unk_1E52FAF48;
              v83[4] = self;
              id v84 = v12;
              id v52 = v57;
              id v85 = v52;
              id v53 = v60;
              id v86 = v53;
              id v87 = v11;
              uint64_t v88 = &v97;
              unint64_t v89 = a3;
              [(UIDictationController *)self _handleWKMultipleTextTargetsForText:v52 payloadText:v53 voiceCommandUUID:v87 completionHandler:v83];

              __int16 v54 = v84;
              goto LABEL_52;
            case 0x18uLL:
              uint64_t v58 = +[UIKeyboardImpl activeInstance];
              CGFloat v48 = v58;
              uint64_t v59 = sel_moveToBeginningOfDocument_;
              goto LABEL_60;
            case 0x19uLL:
              uint64_t v58 = +[UIKeyboardImpl activeInstance];
              CGFloat v48 = v58;
              uint64_t v59 = sel_moveToEndOfDocument_;
LABEL_60:
              [v58 performTextOperationActionSelector:v59];
LABEL_61:

              goto LABEL_30;
            case 0x1AuLL:
              goto LABEL_4;
            default:
              switch(a3)
              {
                case 1uLL:
                  int v56 = [(id)objc_opt_class() firstParameterTextWithParameters:v10];
                  v73[0] = MEMORY[0x1E4F143A8];
                  v73[1] = 3221225472;
                  v73[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_24;
                  v73[3] = &unk_1E52DAF90;
                  v73[4] = self;
                  id v74 = v12;
                  id v75 = v56;
                  id v76 = v11;
                  id v20 = v56;
                  [(UIDictationController *)self _handleWKMultipleTextTargetsForText:v20 payloadText:0x1ED145080 voiceCommandUUID:v76 completionHandler:v73];

                  uint64_t v24 = v74;
                  goto LABEL_5;
                case 2uLL:
                  uint64_t v63 = [v12 inputDelegateManager];
                  int v64 = [v63 hasAsyncCapableInputDelegate];

                  if (v64)
                  {
                    v80[0] = MEMORY[0x1E4F143A8];
                    v80[1] = 3221225472;
                    v80[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_20;
                    v80[3] = &unk_1E52FAF98;
                    id v81 = v12;
                    uint64_t v82 = self;
                    [(UIDictationController *)self _requestFullDocumentContextWithCompletionHandler:v80];
                    long long v55 = v81;
                  }
                  else
                  {
                    [(UIDictationController *)self playVoiceCommandHapticFeedack];
                    [v12 handleClear];
                    dispatch_time_t v68 = dispatch_time(0, 160000000);
                    block[0] = MEMORY[0x1E4F143A8];
                    block[1] = 3221225472;
                    block[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_23;
                    block[3] = &unk_1E52D9F98;
                    id v78 = v12;
                    uint64_t v79 = self;
                    dispatch_after(v68, MEMORY[0x1E4F14428], block);
                    long long v55 = v78;
                  }
                  goto LABEL_53;
                case 3uLL:
                  int v65 = [v12 inputDelegateManager];
                  id v66 = [v65 selectedTextRange];
                  int v67 = [v66 isEmpty];

                  if (v67)
                  {
                    [v12 handleDeleteWordWithExecutionContext:0];
                  }
                  else
                  {
                    uint64_t v69 = [v12 inputDelegateManager];
                    [v69 deleteBackward];
                  }
                  goto LABEL_29;
                case 4uLL:
                  goto LABEL_56;
                default:
                  goto LABEL_45;
              }
              goto LABEL_45;
          }
        }
        uint64_t v97 = 0;
        long long v98 = &v97;
        uint64_t v99 = 0x3032000000;
        long long v100 = __Block_byref_object_copy__126;
        long long v101 = __Block_byref_object_dispose__126;
        uint64_t v102 = [(id)objc_opt_class() firstParameterTextWithParameters:v10];
        double v37 = [(id)objc_opt_class() secondParameterTextWithParameters:v10];
        if (+[UIDictationUtilities shouldInsertSpaceBetweenStringA:v98[5] andStringB:v37])
        {
          [NSString stringWithFormat:@"%@ %@", v98[5], v37, v70];
        }
        else
        {
          [(id)v98[5] stringByAppendingString:v37];
        CGFloat v49 = };
        if (a3 == 22)
        {
          id v50 = (id)v98[5];

          CGFloat v51 = @"_placeholder_UIDictationTextAlternativesActionMoveBefore_56C81A32-B231-496C-BAD4-559E159B46E8_";
          CGFloat v49 = v51;
          double v37 = v50;
        }
        v90[0] = MEMORY[0x1E4F143A8];
        v90[1] = 3221225472;
        v90[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_10;
        v90[3] = &unk_1E52FAF48;
        void v90[4] = self;
        id v91 = v12;
        id v52 = v37;
        id v92 = v52;
        id v53 = v49;
        id v93 = v53;
        id v94 = v11;
        long long v95 = &v97;
        unint64_t v96 = a3;
        [(UIDictationController *)self _handleWKMultipleTextTargetsForText:v52 payloadText:v53 voiceCommandUUID:v94 completionHandler:v90];

        __int16 v54 = v91;
LABEL_52:

        _Block_object_dispose(&v97, 8);
        long long v55 = (void *)v102;
LABEL_53:

        break;
    }
  }
  else
  {
    uint64_t v19 = [v12 _textChoicesAssistant];
    [v19 resetDictationUnderlines];

LABEL_4:
    id v20 = [(id)objc_opt_class() firstParameterTextWithParameters:v10];
    uint64_t v21 = [v20 integerValue];
    [(UIDictationController *)self playVoiceCommandHapticFeedack];
    uint64_t v22 = +[UIKeyboardImpl activeInstance];
    uint64_t v23 = [v22 _textChoicesAssistant];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_30;
    v71[3] = &unk_1E52FB010;
    v71[4] = self;
    id v72 = v12;
    [v23 updateDictationChoicesFromPromptIndex:v21 completionHandler:v71];

    uint64_t v24 = v72;
LABEL_5:

LABEL_6:
  }
LABEL_45:
  [(UIDictationController *)self setTargetHypothesis:0];
  [(UIDictationController *)self setLastHypothesis:0];
  [(UIDictationController *)self setPendingEdits:0];
  self->_hasCheckedForLeadingSpaceOnce = 0;
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 selectedText];
  _stringForObject(v3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if ([v8 length])
  {
    uint64_t v4 = *(void *)(a1 + 48);
    switch(v4)
    {
      case 8:
        uint64_t v5 = [v8 uppercaseString];
        break;
      case 12:
        uint64_t v5 = [v8 lowercaseString];
        break;
      case 10:
        uint64_t v5 = [v8 capitalizedString];
        break;
      default:
        goto LABEL_9;
    }
    id v6 = (void *)v5;

    id v8 = v6;
  }
LABEL_9:
  [*(id *)(a1 + 32) updateForChangedSelection];
  id v7 = [*(id *)(a1 + 32) inputDelegateManager];
  [v7 insertText:v8];

  [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_2(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (!a2)
  {
    int v5 = [v3 _handleMultipleTextTargetsForText:*(void *)(a1 + 48) payloadText:*(void *)(a1 + 56) voiceCommandUUID:*(void *)(a1 + 64)];
    id v6 = *(void **)(a1 + 32);
    if (!v5)
    {
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_3;
      void v25[3] = &unk_1E52FAE80;
      uint64_t v21 = *(void *)(a1 + 48);
      id v26 = *(id *)(a1 + 40);
      id v22 = *(id *)(a1 + 56);
      uint64_t v23 = *(void *)(a1 + 32);
      id v27 = v22;
      uint64_t v28 = v23;
      id v29 = *(id *)(a1 + 48);
      [v6 searchString:v21 completionHandler:v25];

      return;
    }
    if ([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign]) {
      return;
    }
    id v7 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];
      unint64_t v9 = [v8 rangeValue];
      uint64_t v11 = v10;

      id v12 = [*(id *)(a1 + 40) inputDelegateManager];
      id v13 = objc_msgSend(v12, "_textRangeFromNSRange:", v9, v11);

      uint64_t v14 = [*(id *)(a1 + 40) inputDelegateManager];
      [v14 setSelectedTextRange:v13];

      [*(id *)(a1 + 40) updateForChangedSelection];
      uint64_t v15 = [*(id *)(a1 + 40) inputDelegateManager];
      [v15 insertText:*(void *)(a1 + 56)];

      BOOL v16 = [*(id *)(a1 + 32) preCommandExecutionPositionRange] > v9;
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = [v17 preCommandExecutionPositionRange];
      LOBYTE(v24) = v16;
      objc_msgSend(v17, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v18, v19, v20, v9, v11, 0, objc_msgSend(*(id *)(a1 + 56), "length"), v24);
    }
    id v3 = *(void **)(a1 + 32);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  [v3 notifyDocumentStateChangedAndResumeDictation:v4];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_3(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    [a1[6] notifyDocumentStateChangedAndResumeDictation:a1[4]];
  }
  else
  {
    if (v7) {
      uint64_t v9 = a3 - [v7 length];
    }
    else {
      LODWORD(v9) = a3;
    }
    uint64_t v10 = (int)v9;
    uint64_t v11 = [a1[4] inputDelegateManager];
    int v12 = [v11 hasAsyncCapableInputDelegate];

    id v13 = [a1[4] inputDelegateManager];
    uint64_t v14 = v13;
    if (v12)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_4;
      v26[3] = &unk_1E52DF078;
      id v27 = a1[4];
      id v15 = a1[5];
      id v16 = a1[6];
      id v28 = v15;
      id v29 = v16;
      id v30 = v8;
      id v31 = a1[7];
      objc_msgSend(v14, "adjustSelection:completionHandler:", v10, a4, v26);
    }
    else
    {
      uint64_t v17 = [v13 textInputDelegate];
      uint64_t v18 = objc_msgSend(v17, "_rangeFromCurrentRangeWithDelta:", v10, a4);

      uint64_t v19 = [a1[4] inputDelegateManager];
      [v19 setSelectedTextRange:v18];

      [a1[4] updateForChangedSelection];
      uint64_t v20 = [a1[4] inputDelegateManager];
      [v20 insertText:a1[5]];

      id v21 = a1[6];
      id v22 = a1[4];
      uint64_t v23 = [v21 preCommandExecutionPositionRange];
      LOBYTE(v25) = v8 != 0;
      objc_msgSend(v21, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v22, v23, v24, a3, a4, 0, objc_msgSend(a1[5], "length"), v25);
      [a1[6] notifyDocumentStateChangedAndResumeDictation:a1[4]];
    }
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  id v2 = [*(id *)(a1 + 32) inputDelegateManager];
  [v2 insertText:*(void *)(a1 + 40)];

  id v3 = *(void **)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  void v4[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_5;
  v4[3] = &unk_1E52FAE58;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 64);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  [v3 _requestDocumentContextWithCompletionHandler:v4];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) preCommandExecutionPositionRange];
  uint64_t v6 = v5;
  if (*(void *)(a1 + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 48) length];
    uint64_t v4 = v4 - v7 + [*(id *)(a1 + 56) length];
  }
  uint64_t v8 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4, v6);
  uint64_t v10 = v9;
  uint64_t v11 = [*(id *)(a1 + 64) inputDelegateManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_6;
  v12[3] = &unk_1E52D9F98;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 64);
  objc_msgSend(v11, "adjustSelection:completionHandler:", v8, v10, v12);
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_7(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
LABEL_7:
    uint64_t v14 = *(void *)(a1 + 40);
    [v3 notifyDocumentStateChangedAndResumeDictation:v14];
    return;
  }
  int v4 = [v3 _handleMultipleTextTargetsForText:*(void *)(a1 + 48) payloadText:0x1ED1450A0 voiceCommandUUID:*(void *)(a1 + 56)];
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_8;
    v18[3] = &unk_1E52FAED0;
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v19 = v16;
    uint64_t v20 = v17;
    [v5 searchString:v15 completionHandler:v18];

    return;
  }
  uint64_t v6 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];
    uint64_t v8 = [v7 rangeValue];
    uint64_t v10 = v9;

    uint64_t v11 = [*(id *)(a1 + 40) inputDelegateManager];
    int v12 = objc_msgSend(v11, "_textRangeFromNSRange:", v8, v10);

    id v13 = [*(id *)(a1 + 40) inputDelegateManager];
    [v13 setSelectedTextRange:v12];

    [*(id *)(a1 + 40) updateForChangedSelection];
  }
  if (([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign] & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    goto LABEL_7;
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
  }
  else
  {
    if (v7) {
      LODWORD(a3) = a3 - [v7 length];
    }
    uint64_t v9 = [*(id *)(a1 + 32) inputDelegateManager];
    int v10 = [v9 hasAsyncCapableInputDelegate];

    uint64_t v11 = [*(id *)(a1 + 32) inputDelegateManager];
    int v12 = v11;
    if (v10)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_9;
      v18[3] = &unk_1E52D9F98;
      id v13 = *(id *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      id v19 = v13;
      uint64_t v20 = v14;
      objc_msgSend(v12, "adjustSelection:completionHandler:", (int)a3, a4, v18);
    }
    else
    {
      uint64_t v15 = [v11 textInputDelegate];
      id v16 = objc_msgSend(v15, "_rangeFromCurrentRangeWithDelta:", (int)a3, a4);

      uint64_t v17 = [*(id *)(a1 + 32) inputDelegateManager];
      [v17 setSelectedTextRange:v16];

      [*(id *)(a1 + 32) updateForChangedSelection];
      [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
    }
  }
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  return [v2 notifyDocumentStateChangedAndResumeDictation:v3];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_10(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
LABEL_2:
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 notifyDocumentStateChangedAndResumeDictation:v4];
    return;
  }
  int v5 = [v3 _handleMultipleTextTargetsForText:*(void *)(a1 + 48) payloadText:*(void *)(a1 + 56) voiceCommandUUID:*(void *)(a1 + 64)];
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_11;
    void v25[3] = &unk_1E52FAF70;
    uint64_t v12 = *(void *)(a1 + 80);
    uint64_t v27 = *(void *)(a1 + 72);
    uint64_t v28 = v12;
    void v25[4] = v6;
    uint64_t v13 = *(void *)(a1 + 48);
    id v26 = *(id *)(a1 + 40);
    [v6 searchString:v13 completionHandler:v25];

    return;
  }
  id v7 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];

  if (!v7)
  {
LABEL_13:
    if ([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign]) {
      return;
    }
    uint64_t v3 = *(void **)(a1 + 32);
    goto LABEL_2;
  }
  uint64_t v8 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];
  unint64_t v9 = [v8 rangeValue];

  int v10 = [*(id *)(a1 + 40) inputDelegateManager];
  objc_msgSend(v10, "_textRangeFromNSRange:", v9, 0);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [*(id *)(a1 + 40) inputDelegateManager];
  [v11 setSelectedTextRange:v24];

  [*(id *)(a1 + 40) updateForChangedSelection];
  if (*(void *)(a1 + 80) != 22)
  {
    uint64_t v14 = [NSString stringWithFormat:@"%@ ", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = [*(id *)(a1 + 40) inputDelegateManager];
    [v17 insertText:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    BOOL v18 = [*(id *)(a1 + 32) preCommandExecutionPositionRange] > v9;
    id v19 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v21 = [v19 preCommandExecutionPositionRange];
    LOBYTE(v23) = v18;
    objc_msgSend(v19, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v20, v21, v22, 0, 0, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "length"), v23);

    goto LABEL_13;
  }
  [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
  }
  else
  {
    if (v7) {
      LODWORD(a3) = a3 - [v7 length];
    }
    uint64_t v9 = (int)a3;
    int v10 = +[UIKeyboardImpl activeInstance];
    uint64_t v11 = [v10 inputDelegateManager];
    int v12 = [v11 hasAsyncCapableInputDelegate];

    uint64_t v13 = [v10 inputDelegateManager];
    uint64_t v14 = v13;
    if (v12)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_12;
      v29[3] = &unk_1E52FAF20;
      id v15 = v10;
      uint64_t v16 = *(void *)(a1 + 32);
      id v30 = v15;
      uint64_t v31 = v16;
      uint64_t v17 = *(void *)(a1 + 56);
      uint64_t v33 = *(void *)(a1 + 48);
      uint64_t v34 = v17;
      id v32 = v8;
      objc_msgSend(v14, "adjustSelection:completionHandler:", v9, 0, v29);
    }
    else
    {
      BOOL v18 = [v13 textInputDelegate];
      id v19 = objc_msgSend(v18, "_rangeFromCurrentRangeWithDelta:", v9, 0);

      uint64_t v20 = [v10 inputDelegateManager];
      [v20 setSelectedTextRange:v19];

      [v10 updateForChangedSelection];
      if (*(void *)(a1 + 56) != 22)
      {
        uint64_t v21 = [NSString stringWithFormat:@"%@ ", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v23 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v21;

        id v24 = [v10 inputDelegateManager];
        [v24 insertText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

        uint64_t v25 = *(void **)(a1 + 32);
        uint64_t v26 = [v25 preCommandExecutionPositionRange];
        LOBYTE(v28) = v8 != 0;
        objc_msgSend(v25, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v10, v26, v27, 0, 0, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"), v28);
      }
      [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:v10];
    }
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_12(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  if (*(void *)(a1 + 64) == 22)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    [v2 notifyDocumentStateChangedAndResumeDictation:v3];
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@"%@ ", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = [*(id *)(a1 + 32) inputDelegateManager];
    [v7 insertText:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_13;
    v11[3] = &unk_1E52FAEF8;
    v11[4] = v8;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = v9;
    uint64_t v14 = v10;
    id v13 = *(id *)(a1 + 32);
    [v8 _requestDocumentContextWithCompletionHandler:v11];
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) preCommandExecutionPositionRange];
  uint64_t v6 = v5;
  if (*(void *)(a1 + 40)) {
    v4 += [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length];
  }
  uint64_t v7 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4, v6);
  uint64_t v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 48) inputDelegateManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_14;
  v11[3] = &unk_1E52D9F98;
  v11[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  objc_msgSend(v10, "adjustSelection:completionHandler:", v7, v9, v11);
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_15(uint64_t a1, int a2)
{
  id v3 = *(void **)(a1 + 32);
  if (a2)
  {
LABEL_2:
    uint64_t v4 = *(void *)(a1 + 40);
    [v3 notifyDocumentStateChangedAndResumeDictation:v4];
    return;
  }
  int v5 = [v3 _handleMultipleTextTargetsForText:*(void *)(a1 + 48) payloadText:*(void *)(a1 + 56) voiceCommandUUID:*(void *)(a1 + 64)];
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v5)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_16;
    v30[3] = &unk_1E52FAF70;
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 32);
    id v31 = v16;
    uint64_t v32 = v17;
    uint64_t v18 = *(void *)(a1 + 80);
    uint64_t v33 = *(void *)(a1 + 72);
    uint64_t v34 = v18;
    [v6 searchString:v15 completionHandler:v30];

    return;
  }
  uint64_t v7 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];

  if (!v7)
  {
LABEL_13:
    if ([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign]) {
      return;
    }
    id v3 = *(void **)(a1 + 32);
    goto LABEL_2;
  }
  uint64_t v8 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];
  uint64_t v9 = [v8 rangeValue];
  uint64_t v11 = v10;

  unint64_t v12 = v9 + v11;
  id v13 = [*(id *)(a1 + 40) inputDelegateManager];
  objc_msgSend(v13, "_textRangeFromNSRange:", v12, 0);
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = [*(id *)(a1 + 40) inputDelegateManager];
  [v14 setSelectedTextRange:v29];

  [*(id *)(a1 + 40) updateForChangedSelection];
  if (*(void *)(a1 + 80) != 23)
  {
    uint64_t v19 = [NSString stringWithFormat:@" %@", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];
    uint64_t v20 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    uint64_t v22 = [*(id *)(a1 + 40) inputDelegateManager];
    [v22 insertText:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

    BOOL v23 = [*(id *)(a1 + 32) preCommandExecutionPositionRange] > v12;
    id v24 = *(void **)(a1 + 32);
    uint64_t v25 = *(void *)(a1 + 40);
    uint64_t v26 = [v24 preCommandExecutionPositionRange];
    LOBYTE(v28) = v23;
    objc_msgSend(v24, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v25, v26, v27, 0, 0, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "length"), v28);

    goto LABEL_13;
  }
  [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_16(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  uint64_t v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
  }
  else
  {
    if (v7) {
      uint64_t v9 = a3 + a4 - [v7 length];
    }
    else {
      LODWORD(v9) = a3 + a4;
    }
    uint64_t v10 = (int)v9;
    uint64_t v11 = [*(id *)(a1 + 32) inputDelegateManager];
    int v12 = [v11 hasAsyncCapableInputDelegate];

    id v13 = [*(id *)(a1 + 32) inputDelegateManager];
    uint64_t v14 = v13;
    if (v12)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_17;
      v31[3] = &unk_1E52FAF20;
      id v15 = *(id *)(a1 + 32);
      uint64_t v17 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 56);
      uint64_t v18 = *(void *)(a1 + 40);
      id v32 = v15;
      uint64_t v33 = v18;
      uint64_t v35 = v17;
      uint64_t v36 = v16;
      id v34 = v8;
      objc_msgSend(v14, "adjustSelection:completionHandler:", v10, 0, v31);
    }
    else
    {
      uint64_t v19 = [v13 textInputDelegate];
      uint64_t v20 = objc_msgSend(v19, "_rangeFromCurrentRangeWithDelta:", v10, 0);

      uint64_t v21 = [*(id *)(a1 + 32) inputDelegateManager];
      [v21 setSelectedTextRange:v20];

      [*(id *)(a1 + 32) updateForChangedSelection];
      if (*(void *)(a1 + 56) != 23)
      {
        uint64_t v22 = [NSString stringWithFormat:@" %@", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
        id v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        uint64_t v25 = [*(id *)(a1 + 32) inputDelegateManager];
        [v25 insertText:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

        uint64_t v27 = *(void *)(a1 + 32);
        uint64_t v26 = *(void **)(a1 + 40);
        uint64_t v28 = [v26 preCommandExecutionPositionRange];
        LOBYTE(v30) = v8 != 0;
        objc_msgSend(v26, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v27, v28, v29, 0, 0, 0, objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"), v30);
      }
      [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
    }
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_17(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  if (*(void *)(a1 + 64) == 23)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = *(void **)(a1 + 40);
    [v2 notifyDocumentStateChangedAndResumeDictation:v3];
  }
  else
  {
    uint64_t v4 = [NSString stringWithFormat:@" %@", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v7 = [*(id *)(a1 + 32) inputDelegateManager];
    [v7 insertText:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

    uint64_t v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_18;
    v11[3] = &unk_1E52FAEF8;
    v11[4] = v8;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = v9;
    uint64_t v14 = v10;
    id v13 = *(id *)(a1 + 32);
    [v8 _requestDocumentContextWithCompletionHandler:v11];
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) preCommandExecutionPositionRange];
  uint64_t v6 = v5;
  if (*(void *)(a1 + 40)) {
    v4 += [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) length];
  }
  uint64_t v7 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v4, v6);
  uint64_t v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 48) inputDelegateManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_19;
  v11[3] = &unk_1E52D9F98;
  v11[4] = *(void *)(a1 + 32);
  id v12 = *(id *)(a1 + 48);
  objc_msgSend(v10, "adjustSelection:completionHandler:", v7, v9, v11);
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_19(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_20(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 fullText];
  uint64_t v5 = objc_msgSend(v3, "directionalRangeForSelectionRange:", 0, objc_msgSend(v4, "length"));
  uint64_t v7 = v6;

  uint64_t v8 = [*(id *)(a1 + 32) inputDelegateManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_21;
  v11[3] = &unk_1E52D9F98;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = v9;
  uint64_t v13 = v10;
  objc_msgSend(v8, "adjustSelection:completionHandler:", v5, v7, v11);
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_21(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  [*(id *)(a1 + 40) playVoiceCommandHapticFeedack];
  id v2 = [*(id *)(a1 + 32) inputDelegateManager];
  [v2 deleteBackward];

  dispatch_time_t v3 = dispatch_time(0, 160000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_22;
  v6[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_after(v3, MEMORY[0x1E4F14428], v6);
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_22(uint64_t a1)
{
  [*(id *)(a1 + 32) presentDictationUndoMenu];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  return [v2 notifyDocumentStateChangedAndResumeDictation:v3];
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_23(uint64_t a1)
{
  [*(id *)(a1 + 32) presentDictationUndoMenu];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  return [v2 notifyDocumentStateChangedAndResumeDictation:v3];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_24(uint64_t a1, int a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
LABEL_7:
    uint64_t v32 = *(void *)(a1 + 40);
    [v3 notifyDocumentStateChangedAndResumeDictation:v32];
    return;
  }
  int v4 = [v3 _handleMultipleTextTargetsForText:*(void *)(a1 + 48) payloadText:0x1ED145080 voiceCommandUUID:*(void *)(a1 + 56)];
  uint64_t v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_25;
    v37[3] = &unk_1E52FAED0;
    uint64_t v33 = *(void *)(a1 + 48);
    id v34 = *(id *)(a1 + 40);
    uint64_t v35 = *(void *)(a1 + 32);
    id v38 = v34;
    uint64_t v39 = v35;
    [v5 searchString:v33 completionHandler:v37];

    return;
  }
  uint64_t v6 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) commandTargetRangeMatchingGazeRange];
    unint64_t v8 = [v7 rangeValue];
    uint64_t v10 = v9;

    uint64_t v11 = [*(id *)(a1 + 40) inputDelegateManager];
    id v12 = objc_msgSend(v11, "_textRangeFromNSRange:", v8, v10);

    uint64_t v13 = [*(id *)(a1 + 40) inputDelegateManager];
    [v13 setSelectedTextRange:v12];

    [*(id *)(a1 + 40) updateForChangedSelection];
    uint64_t v14 = [*(id *)(a1 + 40) inputDelegateManager];
    id v15 = [v14 textInputDelegate];
    uint64_t v16 = [*(id *)(a1 + 40) inputDelegateManager];
    uint64_t v17 = [v16 selectedTextRange];
    uint64_t v18 = [v15 _nsrangeForTextRange:v17];
    uint64_t v20 = v19;

    uint64_t v21 = [*(id *)(a1 + 40) inputDelegateManager];
    [v21 deleteBackward];

    uint64_t v22 = [*(id *)(a1 + 40) inputDelegateManager];
    uint64_t v23 = [v22 textInputDelegate];
    id v24 = [*(id *)(a1 + 40) inputDelegateManager];
    uint64_t v25 = [v24 selectedTextRange];
    uint64_t v26 = [v23 _nsrangeForTextRange:v25];

    uint64_t v27 = v18 + v20 - v26;
    LOBYTE(v22) = [*(id *)(a1 + 32) preCommandExecutionPositionRange] > v8;
    uint64_t v28 = *(void **)(a1 + 32);
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = [v28 preCommandExecutionPositionRange];
    LOBYTE(v36) = (_BYTE)v22;
    objc_msgSend(v28, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v29, v30, v31, 0, v27, 0, 0, v36);
  }
  if (([(id)objc_opt_class() supportsSiriDictationVoiceCommandsUIRedesign] & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    goto LABEL_7;
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_25(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  unint64_t v8 = v7;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || !a4)
  {
    [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
  }
  else
  {
    if (v7) {
      LODWORD(a3) = a3 - [v7 length];
    }
    uint64_t v9 = [*(id *)(a1 + 32) inputDelegateManager];
    int v10 = [v9 hasAsyncCapableInputDelegate];

    uint64_t v11 = (int)a3;
    id v12 = [*(id *)(a1 + 32) inputDelegateManager];
    uint64_t v13 = v12;
    if (v10)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_26;
      v38[3] = &unk_1E52DCB30;
      id v14 = *(id *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v39 = v14;
      uint64_t v40 = v15;
      id v41 = v8;
      objc_msgSend(v13, "adjustSelection:completionHandler:", v11, a4, v38);
    }
    else
    {
      HIDWORD(v37) = v8 != 0;
      uint64_t v16 = [v12 textInputDelegate];
      uint64_t v17 = objc_msgSend(v16, "_rangeFromCurrentRangeWithDelta:", v11, a4);

      uint64_t v18 = [*(id *)(a1 + 32) inputDelegateManager];
      [v18 setSelectedTextRange:v17];

      [*(id *)(a1 + 32) updateForChangedSelection];
      uint64_t v19 = [*(id *)(a1 + 32) inputDelegateManager];
      uint64_t v20 = [v19 textInputDelegate];
      uint64_t v21 = [*(id *)(a1 + 32) inputDelegateManager];
      uint64_t v22 = [v21 selectedTextRange];
      uint64_t v23 = [v20 _nsrangeForTextRange:v22];
      uint64_t v25 = v24;

      uint64_t v26 = [*(id *)(a1 + 32) inputDelegateManager];
      [v26 deleteBackward];

      uint64_t v27 = [*(id *)(a1 + 32) inputDelegateManager];
      uint64_t v28 = [v27 textInputDelegate];
      uint64_t v29 = [*(id *)(a1 + 32) inputDelegateManager];
      uint64_t v30 = [v29 selectedTextRange];
      uint64_t v31 = [v28 _nsrangeForTextRange:v30];

      uint64_t v32 = v23 + v25 - v31;
      uint64_t v34 = *(void *)(a1 + 32);
      uint64_t v33 = *(void **)(a1 + 40);
      uint64_t v35 = [v33 preCommandExecutionPositionRange];
      LOBYTE(v37) = v8 != 0;
      objc_msgSend(v33, "_restoreInsertionPointPositionWithKeyboard:originalPositionRange:targetRange:payloadRange:contextBefore:", v34, v35, v36, 0, v32, 0, 0, v37);
      [*(id *)(a1 + 40) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 32)];
    }
  }
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_26(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_27;
  v6[3] = &unk_1E52FAFE8;
  id v2 = *(void **)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(a1 + 48);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v2 _requestDocumentContextWithCompletionHandler:v6];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_27(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectedTextRange];
  uint64_t v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 32) inputDelegateManager];
  [v6 deleteBackward];

  id v7 = *(void **)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_28;
  v8[3] = &unk_1E52FAFC0;
  void v8[4] = v7;
  id v9 = *(id *)(a1 + 48);
  uint64_t v11 = v3;
  uint64_t v12 = v5;
  id v10 = *(id *)(a1 + 32);
  [v7 _requestDocumentContextWithCompletionHandler:v8];
}

void __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 selectedTextRange];
  uint64_t v5 = [*(id *)(a1 + 32) preCommandExecutionPositionRange];
  uint64_t v7 = v5;
  if (*(void *)(a1 + 40)) {
    uint64_t v7 = v5 + v4 - (*(void *)(a1 + 56) + *(void *)(a1 + 64));
  }
  uint64_t v8 = objc_msgSend(v3, "directionalRangeForSelectionRange:", v7, v6);
  uint64_t v10 = v9;

  uint64_t v11 = [*(id *)(a1 + 48) inputDelegateManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_29;
  v12[3] = &unk_1E52D9F98;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  objc_msgSend(v11, "adjustSelection:completionHandler:", v8, v10, v12);
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_29(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

uint64_t __107__UIDictationController__handleRecognizedCommandWithCommandIdentifier_parameters_strings_voiceCommandUUID___block_invoke_30(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

- (BOOL)_didRecognizeCommandWithIdentifier:(id)a3 strings:(id)a4 parameters:(id)a5 voiceCommandUUID:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [(id)objc_opt_class() commandIdentifierWithStringIdentifier:v10];
  id v15 = objc_alloc_init((Class)getSISchemaUEIDictationVoiceCommandExecutedClass());
  objc_msgSend(v15, "setCommandType:", objc_msgSend((id)objc_opt_class(), "mapDictationCommandIdentifierToUEIcommandIdentifier:", v14));
  uint64_t v16 = (void *)[objc_alloc((Class)getSISchemaUUIDClass()) initWithNSUUID:v13];
  [v15 setVoiceCommandId:v16];

  if ([(id)objc_opt_class() shouldForwardInInputSystemUI])
  {
    [(UIDictationController *)self clearSelectedTextAndLastDictationResult:[(UIDictationController *)self isSelectionBasedCommand:v14] ^ 1];
    uint64_t v17 = +[UIKeyboardImpl activeInstance];
    uint64_t v18 = [v17 inputDelegateManager];
    uint64_t v19 = [v18 inputSystemSourceSession];

    if (v19)
    {
      uint64_t v20 = [v19 textOperations];
      uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v22 = NSStringFromSelector(sel_didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID_gazeRangeAtCommandRecognitionTime_);
      [v21 setObject:v22 forKeyedSubscript:@"selector"];

      if (v10) {
        [v21 setObject:v10 forKeyedSubscript:@"identifier"];
      }
      if (v11) {
        [v21 setObject:v11 forKeyedSubscript:@"strings"];
      }
      if (v12)
      {
        [v21 setObject:v12 forKeyedSubscript:@"parameters"];
        [v21 setObject:v13 forKeyedSubscript:@"voiceCommandUUID"];
      }
      [v20 setCustomInfoType:0x1ED14BAA0];
      [v20 setCustomInfo:v21];
      [v19 flushOperations];
    }
    [(UIDictationController *)self pauseDictation];
    [(UIDictationController *)self setTargetHypothesis:0];
    [(UIDictationController *)self setLastHypothesis:0];
    [(UIDictationController *)self setPendingEdits:0];
    self->_hasCheckedForLeadingSpaceOnce = 0;
  }
  else
  {
    uint64_t v31 = v13;
    id v23 = v10;
    uint64_t v24 = v11;
    uint64_t v25 = [(id)objc_opt_class() firstParameterTextWithParameters:v12];
    uint64_t v26 = [(id)objc_opt_class() secondParameterTextWithParameters:v12];
    uint64_t v27 = +[UIDictationController sharedInstance];
    uint64_t v28 = [v27 dictationTipController];
    uint64_t v32 = (void *)v26;
    uint64_t v33 = (void *)v25;
    [v28 dictationCommandUsed:v14 firstTargetString:v25 secondTargetString:v26];

    [(UIDictationController *)self clearSelectedTextAndLastDictationResult:[(UIDictationController *)self isSelectionBasedCommand:v14] ^ 1];
    if (!+[UIKeyboard usesInputSystemUI]) {
      [(UIDictationController *)self pauseDictation];
    }
    uint64_t v29 = _UIDictationControllerLog();
    id v11 = v24;
    id v10 = v23;
    id v13 = v31;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      id v41 = "-[UIDictationController _didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:]";
      __int16 v42 = 2112;
      id v43 = v23;
      __int16 v44 = 2112;
      uint64_t v45 = v24;
      __int16 v46 = 2112;
      id v47 = v12;
      _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_DEFAULT, "%s Recognized command %@ with strings %@ parameters %@", buf, 0x2Au);
    }

    [(UIDictationController *)self invalidateTextInputView];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __96__UIDictationController__didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID___block_invoke;
    v34[3] = &unk_1E52FB038;
    v34[4] = self;
    uint64_t v39 = v14;
    id v35 = v12;
    id v36 = v24;
    id v37 = v31;
    id v38 = v15;
    [(UIDictationController *)self requestVisibleTextWithCompletionBlock:v34];
  }
  return 1;
}

uint64_t __96__UIDictationController__didRecognizeCommandWithIdentifier_strings_parameters_voiceCommandUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setVisibleRTIDocumentStateAtCommandRecognition:a2];
  [*(id *)(a1 + 32) _handleRecognizedCommandWithCommandIdentifier:*(void *)(a1 + 72) parameters:*(void *)(a1 + 40) strings:*(void *)(a1 + 48) voiceCommandUUID:*(void *)(a1 + 56)];
  [*(id *)(a1 + 64) setCommandStatus:1];
  [*(id *)(*(void *)(a1 + 32) + 648) emitInstrumentation:*(void *)(a1 + 64)];
  id v3 = _UIDictationControllerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[UIDictationController _didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:]_block_invoke";
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting isProcessingPotentialVoiceCommand to NO", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) setIsProcessingPotentialVoiceCommand:0];
}

- (BOOL)handleCommandRecognizedWithPhrases:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v8 = +[UIDictationCommandHandlerManager commandHandlerWithLocale:v7];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__UIDictationController_handleCommandRecognizedWithPhrases_locale___block_invoke;
  v10[3] = &unk_1E52FB060;
  void v10[4] = self;
  void v10[5] = &v11;
  [v8 recognizeCommandWithPhrases:v6 completionHandler:v10];
  LOBYTE(self) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

uint64_t __67__UIDictationController_handleCommandRecognizedWithPhrases_locale___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v4 = result;
    _NSRange result = [*(id *)(result + 32) didRecognizeCommandWithIdentifier:a2 strings:a3 parameters:a4 voiceCommandUUID:0 gazeRangeAtCommandRecognitionTime:0];
    *(unsigned char *)(*(void *)(*(void *)(v4 + 40) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)handleASRVoiceCommandRecognizedWithUtterance:(id)a3 commandIdentifier:(id)a4 parameters:(id)a5 voiceCommandUUID:(id)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v10 = (void *)MEMORY[0x1E4F1C978];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v10 arrayWithObjects:&v17 count:1];

  LOBYTE(v14) = -[UIDictationController didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:gazeRangeAtCommandRecognitionTime:](self, "didRecognizeCommandWithIdentifier:strings:parameters:voiceCommandUUID:gazeRangeAtCommandRecognitionTime:", v13, v15, v12, v11, 0, v17, v18);
  return (char)v14;
}

- (void)_beginUndoGroupingIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() supportsSiriDictationVoiceCommands])
  {
    if ([(UIDictationController *)self isDictationUndoGroupingOpen]) {
      return;
    }
    id v3 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[UIDictationController _beginUndoGroupingIfNecessary]";
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s Beginning undo grouping", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v4 = +[UIKeyboardImpl activeInstance];
    int v5 = [v4 delegateAsResponder];
    id v6 = [v5 _responderForEditing];
    id v7 = [v6 undoManager];

    [v7 beginUndoGrouping];
    uint64_t v8 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v7 groupingLevel];
      int v10 = 136315394;
      id v11 = "-[UIDictationController _beginUndoGroupingIfNecessary]";
      __int16 v12 = 2048;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s groupingLevel: %ld", (uint8_t *)&v10, 0x16u);
    }

    [(UIDictationController *)self setIsDictationUndoGroupingOpen:1];
  }
  else
  {
    id v7 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      id v11 = "-[UIDictationController _beginUndoGroupingIfNecessary]";
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "%s Skip undo grouping", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_endUndoGroupingIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (([(id)objc_opt_class() supportsSiriDictationVoiceCommands] & 1) == 0)
  {
    id v6 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "%s Skip undo grouping", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_14;
  }
  if (![(UIDictationController *)self isDictationUndoGroupingOpen]) {
    return;
  }
  id v3 = +[UIKeyboardImpl activeInstance];
  uint64_t v4 = [v3 delegateAsResponder];
  int v5 = [v4 _responderForEditing];
  id v6 = [v5 undoManager];

  uint64_t v7 = [v6 groupingLevel];
  uint64_t v8 = _UIDictationControllerUndoRedoLog();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 >= 1)
  {
    if (v9)
    {
      int v12 = 136315138;
      uint64_t v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping", (uint8_t *)&v12, 0xCu);
    }

    [v6 endUndoGrouping];
    uint64_t v8 = _UIDictationControllerUndoRedoLog();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_13;
    }
    uint64_t v10 = [v6 groupingLevel];
    int v12 = 136315394;
    uint64_t v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
    __int16 v14 = 2048;
    uint64_t v15 = v10;
    id v11 = "%s groupingLevel: %ld";
    goto LABEL_12;
  }
  if (v9)
  {
    int v12 = 136315394;
    uint64_t v13 = "-[UIDictationController _endUndoGroupingIfNecessary]";
    __int16 v14 = 2048;
    uint64_t v15 = [v6 groupingLevel];
    id v11 = "%s isDictationUndoGroupingOpen was YES but groupingLevel was %ld, so we will forgo ending of the undo grouping"
          " (this is likely because a voice command caused the field to lose focus before dictation has fully had a chance to finish)";
LABEL_12:
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0x16u);
  }
LABEL_13:

  [(UIDictationController *)self setIsDictationUndoGroupingOpen:0];
LABEL_14:
}

- (void)markDictationUndoEventWithVoiceCommandUUID:(id)a3 viaTapOnRevertBubble:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (self->_undoNotificationToken)
  {
    id v6 = [(UIDictationController *)self dictationConnection];
    uint64_t v7 = [NSNumber numberWithBool:1];
    [v6 updateVoiceCommandContextWithPrefixText:0 postfixText:0 selectedText:0 disambiguationActive:0 cursorInVisibleText:0 favorCommandSuppression:0 abortCommandSuppression:0 undoEvent:v7];

    [(UIDictationController *)self _removeUndoNotificationObservation];
  }
  [(UIDictationController *)self instrumentDictationVoiceCommandUndoTapActionWithVoiceCommandUUID:v8 undoTapAlternativeSelection:v4];
}

- (void)_addUndoNotificationObservationWithVoiceCommandUUID:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4F28A80];
  uint64_t v7 = [MEMORY[0x1E4F28F08] mainQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __77__UIDictationController__addUndoNotificationObservationWithVoiceCommandUUID___block_invoke;
  v11[3] = &unk_1E52FB088;
  void v11[4] = self;
  id v12 = v4;
  id v8 = v4;
  BOOL v9 = [v5 addObserverForName:v6 object:0 queue:v7 usingBlock:v11];
  id undoNotificationToken = self->_undoNotificationToken;
  self->_id undoNotificationToken = v9;
}

uint64_t __77__UIDictationController__addUndoNotificationObservationWithVoiceCommandUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) markDictationUndoEventWithVoiceCommandUUID:*(void *)(a1 + 40) viaTapOnRevertBubble:0];
}

- (void)_removeUndoNotificationObservation
{
  if (self->_undoNotificationToken)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_undoNotificationToken];

    id undoNotificationToken = self->_undoNotificationToken;
    self->_id undoNotificationToken = 0;
  }
}

- (void)_performDictationUndo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(UIDictationController *)self pauseDictation];
  id v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 delegateAsResponder];
  int v5 = [v4 _responderForEditing];
  uint64_t v6 = [v5 undoManager];

  if ([v6 canUndo])
  {
    uint64_t v7 = [(UIDictationController *)self cursorPositionRestorer];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __46__UIDictationController__performDictationUndo__block_invoke;
    v11[3] = &unk_1E52D9F98;
    void v11[4] = self;
    id v12 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __46__UIDictationController__performDictationUndo__block_invoke_1563;
    v9[3] = &unk_1E52D9F98;
    void v9[4] = self;
    id v10 = v3;
    [v7 saveCursorLocationAndRestoreAfterPerforming:v11 completion:v9];
  }
  else
  {
    id v8 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[UIDictationController _performDictationUndo]";
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s undoManager says we can't undo", buf, 0xCu);
    }

    [(UIDictationController *)self notifyDocumentStateChangedAndResumeDictation:v3];
  }
}

uint64_t __46__UIDictationController__performDictationUndo__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = _UIDictationControllerUndoRedoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[UIDictationController _performDictationUndo]_block_invoke";
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "%s Ending undo grouping if necessary", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) _endUndoGroupingIfNecessary];
  if ([*(id *)(a1 + 32) haveLeakedPartialResultForCommandUtterance])
  {
    id v3 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[UIDictationController _performDictationUndo]_block_invoke";
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "%s Performing extra [undoManager undo] to get rid of leaked partial", (uint8_t *)&v6, 0xCu);
    }

    [*(id *)(a1 + 40) undo];
  }
  id v4 = _UIDictationControllerUndoRedoLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[UIDictationController _performDictationUndo]_block_invoke";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Performing [undoManager undo]", (uint8_t *)&v6, 0xCu);
  }

  return [*(id *)(a1 + 40) undo];
}

uint64_t __46__UIDictationController__performDictationUndo__block_invoke_1563(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

- (void)_performDictationRedo
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(UIDictationController *)self pauseDictation];
  id v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 delegateAsResponder];
  int v5 = [v4 _responderForEditing];
  int v6 = [v5 undoManager];

  if ([v6 canRedo])
  {
    uint64_t v7 = [(UIDictationController *)self cursorPositionRestorer];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __46__UIDictationController__performDictationRedo__block_invoke;
    v11[3] = &unk_1E52D9F70;
    id v12 = v6;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __46__UIDictationController__performDictationRedo__block_invoke_1564;
    v9[3] = &unk_1E52D9F98;
    void v9[4] = self;
    id v10 = v3;
    [v7 saveCursorLocationAndRestoreAfterPerforming:v11 completion:v9];
  }
  else
  {
    uint64_t v8 = _UIDictationControllerUndoRedoLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[UIDictationController _performDictationRedo]";
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "%s undoManager says we can't redo", buf, 0xCu);
    }

    [(UIDictationController *)self notifyDocumentStateChangedAndResumeDictation:v3];
  }
}

uint64_t __46__UIDictationController__performDictationRedo__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = _UIDictationControllerUndoRedoLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[UIDictationController _performDictationRedo]_block_invoke";
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "%s Performing [undoManager redo]", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) redo];
}

uint64_t __46__UIDictationController__performDictationRedo__block_invoke_1564(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDocumentStateChangedAndResumeDictation:*(void *)(a1 + 40)];
}

- (void)performTextReplacementForWebKitWithDeltaRange:(_NSRange)a3 targetText:(id)a4 replacementText:(id)a5 originalSelectedRange:(_NSRange)a6 voiceCommandDisambiguationSelectedIndex:(id)a7 voiceCommandDisambiguationTargetCount:(id)a8 voiceCommandUUID:(id)a9 completionHandler:(id)a10
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  NSUInteger v26 = a3.length;
  NSUInteger v27 = a3.location;
  id v29 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a8;
  id v17 = a9;
  id v28 = a10;
  [(UIDictationController *)self instrumentDictationVoiceCommandDisambiguationActionWithVoiceCommandUUID:v17 disambiguationIndex:v15 totalDisambiguationCount:v16];
  uint64_t v18 = +[UIKeyboardImpl activeInstance];
  uint64_t v19 = [v18 inputDelegateManager];
  int v20 = [v19 hasAsyncCapableInputDelegate];

  if (v20)
  {
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3010000000;
    v43[3] = &unk_186D7DBA7;
    v43[4] = location;
    v43[5] = length;
    int v21 = [v14 isEqualToString:0x1ED145080];
    int v22 = [v14 isEqualToString:0x1ED1450A0];
    id v23 = [v18 inputDelegateManager];
    if (v21 | v22) {
      NSUInteger v24 = v26;
    }
    else {
      NSUInteger v24 = 0;
    }
    NSUInteger v25 = v24;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke;
    v30[3] = &unk_1E52FB178;
    id v31 = v18;
    char v41 = v21;
    id v32 = v14;
    uint64_t v33 = self;
    NSUInteger v39 = v27;
    NSUInteger v40 = v26;
    id v38 = v43;
    id v37 = v28;
    char v42 = v22;
    id v34 = v29;
    id v35 = v17;
    id v36 = v15;
    objc_msgSend(v23, "adjustSelection:completionHandler:", v27, v25, v30);

    _Block_object_dispose(v43, 8);
  }
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateForChangedSelection];
  id v2 = (__CFString *)*(id *)(a1 + 40);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 112))
  {

    int v4 = *(void **)(a1 + 48);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_2;
    v29[3] = &unk_1E52FB0D8;
    id v3 = &stru_1ED0E84C0;
    id v30 = *(id *)(a1 + 32);
    id v31 = &stru_1ED0E84C0;
    uint64_t v32 = *(void *)(a1 + 48);
    long long v17 = *(_OWORD *)(a1 + 80);
    int v5 = *(void **)(a1 + 80);
    long long v34 = *(_OWORD *)(a1 + 96);
    id v6 = v5;
    long long v33 = v17;
    [v4 _requestDocumentContextWithCompletionHandler:v29];
  }
  else if (*(unsigned char *)(a1 + 113))
  {
    uint64_t v7 = *(void *)(a1 + 80);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FAE318]) initWithCandidate:v2 forInput:*(void *)(a1 + 56)];
    BOOL v9 = [*(id *)(a1 + 32) inputDelegateManager];
    id v10 = [v8 candidate];
    id v11 = [v8 input];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    void v18[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_5;
    v18[3] = &unk_1E52FB150;
    id v19 = v8;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 48);
    id v20 = v12;
    uint64_t v21 = v13;
    id v14 = *(id *)(a1 + 64);
    long long v28 = *(_OWORD *)(a1 + 96);
    uint64_t v15 = *(void *)(a1 + 88);
    id v22 = v14;
    uint64_t v27 = v15;
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 40);
    id v26 = *(id *)(a1 + 80);
    id v25 = *(id *)(a1 + 72);
    id v16 = v8;
    [v9 applyAutocorrection:v10 toString:v11 shouldUnderline:1 withCompletionHandler:v18];
  }
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 selectedTextRange];
  uint64_t v5 = v4;
  id v6 = [*(id *)(a1 + 32) inputDelegateManager];
  [v6 insertText:*(void *)(a1 + 40)];

  uint64_t v7 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_3;
  v8[3] = &unk_1E52FB0B0;
  long long v12 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v13 = v3;
  uint64_t v14 = v5;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 56);
  [v7 _requestDocumentContextWithCompletionHandler:v8];
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 selectedTextRange];
  if ((*(unsigned char *)(a1 + 59) & 0x80) != 0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) += v4 - (*(void *)(a1 + 72) + *(void *)(a1 + 80));
  }
  uint64_t v5 = objc_msgSend(v3, "directionalRangeForSelectionRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  uint64_t v7 = v6;

  uint64_t v8 = [*(id *)(a1 + 32) inputDelegateManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_4;
  v9[3] = &unk_1E52DA040;
  id v10 = *(id *)(a1 + 40);
  objc_msgSend(v8, "adjustSelection:completionHandler:", v5, v7, v9);
}

uint64_t __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FAE278] listWithAutocorrection:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) _textChoicesAssistant];
  [v3 addList:v2 forCandidate:*(void *)(a1 + 32)];

  uint64_t v4 = [*(id *)(a1 + 40) _textChoicesAssistant];
  [v4 trackUnderlineForWebKitCandidate:*(void *)(a1 + 32)];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_6;
  v8[3] = &unk_1E52FB128;
  uint64_t v5 = *(void **)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 56);
  long long v17 = *(_OWORD *)(a1 + 104);
  uint64_t v7 = *(void *)(a1 + 96);
  id v11 = v6;
  uint64_t v16 = v7;
  id v12 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 88);
  id v14 = *(id *)(a1 + 80);
  [v5 _requestDocumentContextWithCompletionHandler:v8];
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 autocorrectedRanges];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v5 rangeValue];
  uint64_t v8 = v7;

  id v9 = objc_msgSend(v3, "characterRectsForCharacterRange:", v6, v8);
  id v10 = [v9 firstObject];
  [v10 CGRectValue];
  double x = v11;
  double y = v13;
  double width = v15;
  double height = v17;

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v19 = v9;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v54;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v54 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v53 + 1) + 8 * v23) CGRectValue];
        v64.origin.double x = v24;
        v64.origin.double y = v25;
        v64.size.double width = v26;
        v64.size.double height = v27;
        v61.origin.double x = x;
        v61.origin.double y = y;
        v61.size.double width = width;
        v61.size.double height = height;
        CGRect v62 = CGRectUnion(v61, v64);
        double x = v62.origin.x;
        double y = v62.origin.y;
        double width = v62.size.width;
        double height = v62.size.height;
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v21);
  }

  v63.origin.double x = x;
  v63.origin.double y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  if (CGRectIsEmpty(v63))
  {
    if ((*(unsigned char *)(a1 + 99) & 0x80) != 0)
    {
      uint64_t v28 = [*(id *)(a1 + 56) length];
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 32) += [*(id *)(a1 + 64) length] - v28;
    }
    uint64_t v29 = objc_msgSend(v3, "directionalRangeForSelectionRange:", *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40));
    uint64_t v31 = v30;
    uint64_t v32 = [*(id *)(a1 + 32) inputDelegateManager];
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_9;
    void v42[3] = &unk_1E52DB330;
    id v44 = *(id *)(a1 + 80);
    id v43 = *(id *)(a1 + 72);
    objc_msgSend(v32, "adjustSelection:completionHandler:", v29, v31, v42);

    long long v33 = v44;
  }
  else
  {
    long long v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", x, y, width, height);
    char v41 = [*(id *)(a1 + 32) _textChoicesAssistant];
    uint64_t v58 = v33;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    v34 = uint64_t v40 = v8;
    id v35 = [*(id *)(a1 + 40) input];
    id v57 = v35;
    id v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    id v37 = [*(id *)(a1 + 40) candidate];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_7;
    v45[3] = &unk_1E52FB100;
    long long v52 = *(_OWORD *)(a1 + 96);
    uint64_t v51 = *(void *)(a1 + 88);
    uint64_t v38 = *(void *)(a1 + 48);
    id v46 = *(id *)(a1 + 56);
    id v47 = *(id *)(a1 + 64);
    id v48 = v3;
    id v49 = *(id *)(a1 + 32);
    id v50 = *(id *)(a1 + 80);
    LOWORD(v39) = 256;
    [v41 decorateTextInRects:v34 targetTextArray:v36 replacementText:v37 deltaRanges:0 originalSelectedRange:v6 allowAutomaticReplacement:v40 autoHide:v39 voiceCommandUUID:v38 withCompletionHandler:v45];
  }
}

void __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_7(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 83) & 0x80) != 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) length];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32) += [*(id *)(a1 + 40) length] - v2;
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 48), "directionalRangeForSelectionRange:", *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  uint64_t v5 = v4;
  uint64_t v6 = [*(id *)(a1 + 56) inputDelegateManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_8;
  v7[3] = &unk_1E52DA040;
  id v8 = *(id *)(a1 + 64);
  objc_msgSend(v6, "adjustSelection:completionHandler:", v3, v5, v7);
}

uint64_t __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __233__UIDictationController_performTextReplacementForWebKitWithDeltaRange_targetText_replacementText_originalSelectedRange_voiceCommandDisambiguationSelectedIndex_voiceCommandDisambiguationTargetCount_voiceCommandUUID_completionHandler___block_invoke_9(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)playVoiceCommandHapticFeedack
{
  feedbackGenerator = self->_feedbackGenerator;
  id v3 = +[_UIDictationSettingsDomain rootSettings];
  [v3 impactIntensity];
  -[UIImpactFeedbackGenerator impactOccurredWithIntensity:atLocation:](feedbackGenerator, "impactOccurredWithIntensity:atLocation:");
}

- (void)setDisambiguationActiveEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isDisambiguationUIActive = a3;
  uint64_t v5 = [(UIDictationController *)self dictationConnection];
  int v6 = [v5 supportNewVoiceEditingCommandSPI];

  id v10 = [(UIDictationController *)self dictationConnection];
  if (v3)
  {
    uint64_t v7 = [NSNumber numberWithBool:1];
    id v8 = [NSNumber numberWithBool:1];
    if (v6) {
      [v10 updateVoiceCommandContextWithPrefixText:0 postfixText:0 selectedText:0 disambiguationActive:v7 cursorInVisibleText:0 favorCommandSuppression:v8 abortCommandSuppression:0 undoEvent:0];
    }
    else {
      [v10 updateVoiceCommandContextWithPrefixText:0 postfixText:0 selectedText:0 disambiguationActive:v7 cursorInVisibleText:0 favorCommandSuppression:v8 abortCommandSuppression:0];
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithBool:0];
    uint64_t v9 = [NSNumber numberWithBool:1];
    id v8 = (void *)v9;
    if (v6) {
      [v10 updateVoiceCommandContextWithPrefixText:0 postfixText:0 selectedText:0 disambiguationActive:v7 cursorInVisibleText:0 favorCommandSuppression:0 abortCommandSuppression:v9 undoEvent:0];
    }
    else {
      [v10 updateVoiceCommandContextWithPrefixText:0 postfixText:0 selectedText:0 disambiguationActive:v7 cursorInVisibleText:0 favorCommandSuppression:0 abortCommandSuppression:v9];
    }
  }
}

- (id)_obtainDisambiguationUIAssertion
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:42 initialState:1];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 == 42 && self->_isDisambiguationUIActive;
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 == 42) {
    [(UIDictationController *)self setDisambiguationActiveEnabled:a3];
  }
}

- (void)launchDictationFeedbackApp
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"dictationreporter://feedback"];
  [(id)UIApp openURL:v2 options:MEMORY[0x1E4F1CC08] completionHandler:&__block_literal_global_1573];
}

- (BOOL)enableEuclidAlternatives
{
  id v2 = +[UIDictationConnectionPreferences sharedInstance];
  char v3 = [v2 enableEuclidAlternatives];

  return v3;
}

- (void)preheatEuclidModelWithLanguageCode:(id)a3 clientID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(UIDictationController *)self currentEuclidLanguage];
  char v8 = [v10 isEqualToString:v7];

  if ((v8 & 1) == 0)
  {
    [(UIDictationController *)self setCurrentEuclidLanguage:v10];
    uint64_t v9 = [(UIDictationController *)self dictationConnection];
    [v9 preheatEuclidModelWithLanguageCode:v10 clientID:v6];
  }
}

- (void)euclidPhoneticString:(id)a3 maxResultsCount:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(UIDictationController *)self dictationConnection];
  [v10 euclidPhoneticString:v9 maxResultsCount:a4 completion:v8];
}

- (void)logEuclidRequested
{
  char v3 = [getAFPreferencesClass_0() sharedPreferences];
  uint64_t v4 = [v3 siriDataSharingOptInStatus];

  if (v4 == 1)
  {
    id v5 = objc_alloc_init((Class)getSISchemaUEIDictationEuclidSpeechAlternativesSelectedClass());
    [v5 setSpeechAlternativesType:1];
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v5];
  }
}

- (void)logEuclidSelection:(id)a3 suggestedTokens:(id)a4 correctedToken:(id)a5 selectedIndex:(int64_t)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v28 = a4;
  id v9 = a5;
  id v10 = [getAFPreferencesClass_0() sharedPreferences];
  uint64_t v11 = [v10 siriDataSharingOptInStatus];

  if (v11 == 1)
  {
    id v12 = objc_alloc_init((Class)getSISchemaUEIDictationEuclidSpeechAlternativesSelectedClass());
    [v12 setSpeechAlternativesType:2];
    [v12 setAlternativesIndexSelectedByUser:a6];
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2050000000;
    double v13 = (void *)qword_1EB25AB00;
    uint64_t v41 = qword_1EB25AB00;
    if (!qword_1EB25AB00)
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      id v35 = __getSISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1Class_block_invoke;
      id v36 = &unk_1E52D9900;
      id v37 = &v38;
      __getSISchemaUEIDictationEuclidSpeechAlternativesSelectedTier1Class_block_invoke((uint64_t)&v33);
      double v13 = (void *)v39[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v38, 8);
    id v15 = objc_alloc_init(v14);
    uint64_t v38 = 0;
    uint64_t v39 = &v38;
    uint64_t v40 = 0x2050000000;
    uint64_t v16 = (void *)qword_1EB25AB08;
    uint64_t v41 = qword_1EB25AB08;
    if (!qword_1EB25AB08)
    {
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      id v35 = __getSISchemaEuclidConfusionPairClass_block_invoke;
      id v36 = &unk_1E52D9900;
      id v37 = &v38;
      __getSISchemaEuclidConfusionPairClass_block_invoke((uint64_t)&v33);
      uint64_t v16 = (void *)v39[3];
    }
    double v17 = v16;
    _Block_object_dispose(&v38, 8);
    id v18 = objc_alloc_init(v17);
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v20 = v28;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v30;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v30 != v22) {
            objc_enumerationMutation(v20);
          }
          CGFloat v24 = [*(id *)(*((void *)&v29 + 1) + 8 * v23) candidate];
          [v19 addObject:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v29 objects:v42 count:16];
      }
      while (v21);
    }

    [v18 setRecognizedToken:v27];
    [v18 setSuggestedTokens:v19];
    CGFloat v25 = [v9 candidate];
    [v18 setCorrectedToken:v25];

    [v15 setConfusionPair:v18];
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v12];
    [(AFAnalyticsTurnBasedInstrumentationContext *)self->_currentInstrumentationContext emitInstrumentation:v15];
  }
}

- (NSString)activationIdentifier
{
  return self->_activationIdentifier;
}

- (void)setActivationIdentifier:(id)a3
{
}

- (NSString)smartLanguageSelectionOverrideLanguage
{
  return (NSString *)objc_getProperty(self, a2, 360, 1);
}

- (void)setSmartLanguageSelectionOverrideLanguage:(id)a3
{
}

- (NSMutableArray)pendingEdits
{
  return self->_pendingEdits;
}

- (void)setPendingEdits:(id)a3
{
}

- (BOOL)performingStreamingEditingOperation
{
  return self->_performingStreamingEditingOperation;
}

- (void)setPerformingStreamingEditingOperation:(BOOL)a3
{
  self->_performingStreamingEditingOperation = a3;
}

- (NSString)previousHypothesis
{
  return self->_previousHypothesis;
}

- (void)setPreviousHypothesis:(id)a3
{
}

- (NSString)lastHypothesis
{
  return self->_lastHypothesis;
}

- (void)setLastHypothesis:(id)a3
{
}

- (NSString)targetHypothesis
{
  return self->_targetHypothesis;
}

- (void)setTargetHypothesis:(id)a3
{
}

- (BOOL)discardNextHypothesis
{
  return self->_discardNextHypothesis;
}

- (void)setDiscardNextHypothesis:(BOOL)a3
{
  self->_discardNextHypothesis = a3;
}

- (_NSRange)insertionRange
{
  NSUInteger length = self->_insertionRange.length;
  NSUInteger location = self->_insertionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setInsertionRange:(_NSRange)a3
{
  self->_insertionRange = a3;
}

- (BOOL)hasPreheated
{
  return self->_hasPreheated;
}

- (void)setHasPreheated:(BOOL)a3
{
  self->_hasPreheated = a3;
}

- (UIWindow)dictationPresenterWindow
{
  return self->_dictationPresenterWindow;
}

- (void)setDictationPresenterWindow:(id)a3
{
}

- (unint64_t)reasonType
{
  return self->_reasonType;
}

- (void)setReasonType:(unint64_t)a3
{
  self->_unint64_t reasonType = a3;
}

- (NSString)lastRecognitionText
{
  return self->_lastRecognitionText;
}

- (void)setLastRecognitionText:(id)a3
{
}

- (id)lastCorrectionIdentifier
{
  return self->_lastCorrectionIdentifier;
}

- (void)setLastCorrectionIdentifier:(id)a3
{
}

- (NSString)interactionIdentifier
{
  return self->_interactionIdentifier;
}

- (NSString)lastMessageKeyboardLanguage
{
  return self->_lastMessageKeyboardLanguage;
}

- (void)setLastMessageKeyboardLanguage:(id)a3
{
}

- (BOOL)logAppEnterBackground
{
  return self->_logAppEnterBackground;
}

- (void)setLogAppEnterBackground:(BOOL)a3
{
  self->_logAppEnterBackground = a3;
}

- (BOOL)modelessUsedAtLeastOnce
{
  return self->_modelessUsedAtLeastOnce;
}

- (void)setModelessUsedAtLeastOnce:(BOOL)a3
{
  self->_modelessUsedAtLeastOnce = a3;
}

- (NSString)_inputDelegateClassName
{
  return self->__inputDelegateClassName;
}

- (void)set_inputDelegateClassName:(id)a3
{
}

- (BOOL)_shouldUseDictationSearchFieldBehavior
{
  return self->__shouldUseDictationSearchFieldBehavior;
}

- (void)set_shouldUseDictationSearchFieldBehavior:(BOOL)a3
{
  self->__shouldUseDictationSearchFieldBehavior = a3;
}

- (BOOL)shouldSuppressSoftwareKeyboard
{
  return self->_shouldSuppressSoftwareKeyboard;
}

- (void)setShouldSuppressSoftwareKeyboard:(BOOL)a3
{
  self->_shouldSuppressSoftwareKeyboard = a3;
}

- (BOOL)resigningFirstResponder
{
  return self->_resigningFirstResponder;
}

- (void)setResigningFirstResponder:(BOOL)a3
{
  self->_resigningFirstResponder = a3;
}

- (void)setCurrentInputModeForDictation:(id)a3
{
}

- (UIKeyboardInputMode)keyboardInputModeToReturn
{
  return self->_keyboardInputModeToReturn;
}

- (void)setKeyboardInputModeToReturn:(id)a3
{
}

- (BOOL)shouldStayInDictationInputMode
{
  return self->_shouldStayInDictationInputMode;
}

- (void)setShouldStayInDictationInputMode:(BOOL)a3
{
  self->_shouldStayInDictationInputMode = a3;
}

- (BOOL)ignoreKeyboardDidHideNotification
{
  return self->_ignoreKeyboardDidHideNotification;
}

- (void)setIgnoreKeyboardDidHideNotification:(BOOL)a3
{
  self->_ignoreKeyboardDidHideNotification = a3;
}

- (BOOL)haveReceivedFirstPartialResultForCurrentUtterance
{
  return self->_haveReceivedFirstPartialResultForCurrentUtterance;
}

- (void)setHaveReceivedFirstPartialResultForCurrentUtterance:(BOOL)a3
{
  self->_haveReceivedFirstPartialResultForCurrentUtterance = a3;
}

- (BOOL)haveLeakedPartialResultForCommandUtterance
{
  return self->_haveLeakedPartialResultForCommandUtterance;
}

- (void)setHaveLeakedPartialResultForCommandUtterance:(BOOL)a3
{
  self->_haveLeakedPartialResultForCommandUtterance = a3;
}

- (BOOL)isDictationUndoGroupingOpen
{
  return self->_isDictationUndoGroupingOpen;
}

- (void)setIsDictationUndoGroupingOpen:(BOOL)a3
{
  self->_isDictationUndoGroupingOpen = a3;
}

- (UIDictationCursorPositionRestorer)cursorPositionRestorer
{
  return self->_cursorPositionRestorer;
}

- (void)setCursorPositionRestorer:(id)a3
{
}

- (BOOL)isSendButtonPressedDuringDictation
{
  return self->_sendButtonPressedDuringDictation;
}

- (void)setSendButtonPressedDuringDictation:(BOOL)a3
{
  self->_sendButtonPressedDuringDictation = a3;
}

- (BOOL)hasInsertedAtLeastOneSerializedDictationResult
{
  return self->_hasInsertedAtLeastOneSerializedDictationResult;
}

- (void)setHasInsertedAtLeastOneSerializedDictationResult:(BOOL)a3
{
  self->_hasInsertedAtLeastOneSerializedDictationResult = a3;
}

- (BOOL)restoreStagedDictationOnIdle
{
  return self->_restoreStagedDictationOnIdle;
}

- (void)setRestoreStagedDictationOnIdle:(BOOL)a3
{
  self->_restoreStagedDictationOnIdle = a3;
}

- (NSTimer)idleTimerResetTimer
{
  return self->_idleTimerResetTimer;
}

- (void)setIdleTimerResetTimer:(id)a3
{
}

- (_NSRange)preCommandExecutionPositionRange
{
  NSUInteger length = self->_preCommandExecutionPositionRange.length;
  NSUInteger location = self->_preCommandExecutionPositionRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setPreCommandExecutionPositionRange:(_NSRange)a3
{
  self->_preCommandExecutionPositionRange = a3;
}

- (UIDictationSerializableResults)candidateDictationSerializableResults
{
  return self->_candidateDictationSerializableResults;
}

- (NSMutableDictionary)cachedDisplayLowStorageNotification
{
  return self->_cachedDisplayLowStorageNotification;
}

- (void)setCachedDisplayLowStorageNotification:(id)a3
{
}

- (RTIDocumentState)visibleRTIDocumentStateAtStart
{
  return self->_visibleRTIDocumentStateAtStart;
}

- (void)setVisibleRTIDocumentStateAtStart:(id)a3
{
}

- (RTIDocumentState)visibleRTIDocumentStateAtCommandRecognition
{
  return self->_visibleRTIDocumentStateAtCommandRecognition;
}

- (void)setVisibleRTIDocumentStateAtCommandRecognition:(id)a3
{
}

- (NSString)visibleContextBeforeInputAtCommandExecution
{
  return self->_visibleContextBeforeInputAtCommandExecution;
}

- (void)setVisibleContextBeforeInputAtCommandExecution:(id)a3
{
}

- (BOOL)isProcessingPotentialVoiceCommand
{
  return self->_isProcessingPotentialVoiceCommand;
}

- (void)setIsProcessingPotentialVoiceCommand:(BOOL)a3
{
  self->_isProcessingPotentialVoiceCommand = a3;
}

- (BOOL)hasSelectedTextRange
{
  return self->_hasSelectedTextRange;
}

- (void)setHasSelectedTextRange:(BOOL)a3
{
  self->_hasSelectedTextRange = a3;
}

- (NSNumber)currentLanguageVerbFirstCommandLanguageStatusCached
{
  return self->_currentLanguageVerbFirstCommandLanguageStatusCached;
}

- (void)setCurrentLanguageVerbFirstCommandLanguageStatusCached:(id)a3
{
}

- (NSArray)lastSuppressedCommandPartialTokens
{
  return self->_lastSuppressedCommandPartialTokens;
}

- (void)setLastSuppressedCommandPartialTokens:(id)a3
{
}

- (AFAnalyticsTurnBasedInstrumentationContext)enablementInstrumentationContext
{
  return self->_enablementInstrumentationContext;
}

- (void)setEnablementInstrumentationContext:(id)a3
{
}

- (BOOL)enablementLoggingIsDictationEnabled
{
  return self->_enablementLoggingIsDictationEnabled;
}

- (void)setEnablementLoggingIsDictationEnabled:(BOOL)a3
{
  self->_enablementLoggingIsDictationEnabled = a3;
}

- (BOOL)enablementLoggingIsLearnMoreButtonClicked
{
  return self->_enablementLoggingIsLearnMoreButtonClicked;
}

- (void)setEnablementLoggingIsLearnMoreButtonClicked:(BOOL)a3
{
  self->_enablementLoggingIsLearnMoreButtonClicked = a3;
}

- (NSValue)commandTargetRangeMatchingGazeRange
{
  return self->_commandTargetRangeMatchingGazeRange;
}

- (void)setCommandTargetRangeMatchingGazeRange:(id)a3
{
}

- (NSString)currentEuclidLanguage
{
  return self->_currentEuclidLanguage;
}

- (void)setCurrentEuclidLanguage:(id)a3
{
}

- (_UIDictationPrivacySheetController)dictationPrivacySheetController
{
  return self->_dictationPrivacySheetController;
}

- (void)setDictationPrivacySheetController:(id)a3
{
}

- (BOOL)didToggleSoftwareKeyboardVisibleForDictation
{
  return self->_didToggleSoftwareKeyboardVisibleForDictation;
}

- (void)setDidToggleSoftwareKeyboardVisibleForDictation:(BOOL)a3
{
  self->_didToggleSoftwareKeyboardVisibleForDictation = a3;
}

- (UIDictationInputModeOptions)inputModeOptions
{
  return self->_inputModeOptions;
}

- (void)setInputModeOptions:(id)a3
{
}

- (void)setWantsAvailabilityMonitoringWhenAppActive:(BOOL)a3
{
  self->_wantsAvailabilityMonitoringWhenAppActive = a3;
}

- (NSString)detectedLanguage
{
  return self->_detectedLanguage;
}

- (void)setDetectedLanguage:(id)a3
{
}

- (NSArray)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setDictationLanguages:(id)a3
{
}

- (NSString)initialDictationLanguage
{
  return self->_initialDictationLanguage;
}

- (void)setInitialDictationLanguage:(id)a3
{
}

- (NSString)fallbackDictationLanguage
{
  return self->_fallbackDictationLanguage;
}

- (void)setFallbackDictationLanguage:(id)a3
{
}

- (unint64_t)dictationSourceType
{
  return self->_dictationSourceType;
}

- (void)setDictationSourceType:(unint64_t)a3
{
  self->_dictationSourceType = a3;
}

- (NSString)currentKeyboardPrimaryLanguage
{
  return self->_currentKeyboardPrimaryLanguage;
}

- (void)setCurrentKeyboardPrimaryLanguage:(id)a3
{
}

- (BOOL)selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate
{
  return self->_selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate;
}

- (void)setSelectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate:(BOOL)a3
{
  self->_selectionEndWasInitiallyAtParagraphBoundaryForAsyncDelegate = a3;
}

- (BOOL)selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate
{
  return self->_selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate;
}

- (void)setSelectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate:(BOOL)a3
{
  self->_selectionStartWasInitiallyAtParagraphBoundaryForAsyncDelegate = a3;
}

- (unsigned)initialPreviousCharacterForAsyncDelegate
{
  return self->_initialPreviousCharacterForAsyncDelegate;
}

- (void)setInitialPreviousCharacterForAsyncDelegate:(unsigned __int16)a3
{
  self->_initialPreviousCharacterForAsyncDelegate = a3;
}

- (unsigned)initialCharacterAfterSelectionForAsyncDelegate
{
  return self->_initialCharacterAfterSelectionForAsyncDelegate;
}

- (void)setInitialCharacterAfterSelectionForAsyncDelegate:(unsigned __int16)a3
{
  self->_initialCharacterAfterSelectionForAsyncDelegate = a3;
}

- (unint64_t)stateHandler
{
  return self->_stateHandler;
}

- (void)setStateHandler:(unint64_t)a3
{
  self->_stateHandler = a3;
}

- (BOOL)localSpeechRecognitionForced
{
  return self->_localSpeechRecognitionForced;
}

- (BOOL)secureOfflineOnlySpeechRecognition
{
  return self->_secureOfflineOnlySpeechRecognition;
}

- (void)setSecureOfflineOnlySpeechRecognition:(BOOL)a3
{
  self->_secureOfflineOnlySpeechRecognition = a3;
}

- (NSString)modelInfo
{
  return self->_modelInfo;
}

- (void)setModelInfo:(id)a3
{
}

- (BOOL)ignoreFinalizePhrases
{
  return self->_ignoreFinalizePhrases;
}

- (BOOL)shouldResumeDictation
{
  return self->_shouldResumeDictation;
}

- (void)setShouldResumeDictation:(BOOL)a3
{
  self->_BOOL shouldResumeDictation = a3;
}

- (BOOL)skipAutomaticResumeDictation
{
  return self->_skipAutomaticResumeDictation;
}

- (void)setSkipAutomaticResumeDictation:(BOOL)a3
{
  self->_skipAutomaticResumeDictation = a3;
}

- (BOOL)ignoreUserInteraction
{
  return self->_ignoreUserInteraction;
}

- (void)setIgnoreUserInteraction:(BOOL)a3
{
  self->_ignoreUserInteraction = a3;
}

- (BOOL)canUndoOrRedo
{
  return self->_canUndoOrRedo;
}

- (void)setCanUndoOrRedo:(BOOL)a3
{
  self->_canUndoOrRedo = a3;
}

- (void)setDetectingUtterances:(BOOL)a3
{
  self->_detectingUtterances = a3;
}

- (BOOL)isFinalizingRecognizedUtterance
{
  return self->_finalizingRecognizedUtterance;
}

- (void)setFinalizingRecognizedUtterance:(BOOL)a3
{
  self->_finalizingRecognizedUtterance = a3;
}

- (BOOL)hasCheckedForLeadingSpaceOnce
{
  return self->_hasCheckedForLeadingSpaceOnce;
}

- (void)setHasCheckedForLeadingSpaceOnce:(BOOL)a3
{
  self->_hasCheckedForLeadingSpaceOnce = a3;
}

- (unsigned)previousCharacter
{
  return self->_previousCharacter;
}

- (void)setPreviousCharacter:(unsigned __int16)a3
{
  self->_previousCharacter = a3;
}

- (BOOL)selectionStartIsStartOfParagraph
{
  return self->_selectionStartIsStartOfParagraph;
}

- (void)setSelectionStartIsStartOfParagraph:(BOOL)a3
{
  self->_selectionStartIsStartOfParagraph = a3;
}

- (AFAnalyticsTurnBasedInstrumentationContext)currentInstrumentationContext
{
  return self->_currentInstrumentationContext;
}

- (BOOL)suppressDelegateTextInputDidChangeNotifications
{
  return self->_suppressDelegateTextInputDidChangeNotifications;
}

- (void)setSuppressDelegateTextInputDidChangeNotifications:(BOOL)a3
{
  self->_suppressDelegateTextInputDidChangeNotifications = a3;
}

- (BOOL)shouldDeleteWordOnBackspaceTap
{
  return self->_shouldDeleteWordOnBackspaceTap;
}

- (void)setShouldDeleteWordOnBackspaceTap:(BOOL)a3
{
  self->_shouldDeleteWordOnBackspaceTap = a3;
}

- (_NSRange)startRangeOfCurrentHypothesis
{
  NSUInteger length = self->_startRangeOfCurrentHypothesis.length;
  NSUInteger location = self->_startRangeOfCurrentHypothesis.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartRangeOfCurrentHypothesis:(_NSRange)a3
{
  self->_startRangeOfCurrentHypothesis = a3;
}

- (BOOL)pauseUpdatingHelperMessage
{
  return self->_pauseUpdatingHelperMessage;
}

- (UIDictationTipController)dictationTipController
{
  return self->_dictationTipController;
}

- (void)setDictationTipController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictationTipController, 0);
  objc_storeStrong((id *)&self->_currentInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_currentKeyboardPrimaryLanguage, 0);
  objc_storeStrong((id *)&self->_fallbackDictationLanguage, 0);
  objc_storeStrong((id *)&self->_initialDictationLanguage, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_inputModeOptions, 0);
  objc_storeStrong((id *)&self->_dictationPrivacySheetController, 0);
  objc_storeStrong((id *)&self->_currentEuclidLanguage, 0);
  objc_storeStrong((id *)&self->_commandTargetRangeMatchingGazeRange, 0);
  objc_storeStrong((id *)&self->_enablementInstrumentationContext, 0);
  objc_storeStrong((id *)&self->_lastSuppressedCommandPartialTokens, 0);
  objc_storeStrong((id *)&self->_currentLanguageVerbFirstCommandLanguageStatusCached, 0);
  objc_storeStrong((id *)&self->_visibleContextBeforeInputAtCommandExecution, 0);
  objc_storeStrong((id *)&self->_visibleRTIDocumentStateAtCommandRecognition, 0);
  objc_storeStrong((id *)&self->_visibleRTIDocumentStateAtStart, 0);
  objc_storeStrong((id *)&self->_cachedDisplayLowStorageNotification, 0);
  objc_storeStrong((id *)&self->_candidateDictationSerializableResults, 0);
  objc_storeStrong((id *)&self->_idleTimerResetTimer, 0);
  objc_storeStrong((id *)&self->_cursorPositionRestorer, 0);
  objc_storeStrong((id *)&self->_keyboardInputModeToReturn, 0);
  objc_storeStrong((id *)&self->_currentInputModeForDictation, 0);
  objc_storeStrong((id *)&self->__inputDelegateClassName, 0);
  objc_storeStrong((id *)&self->_lastMessageKeyboardLanguage, 0);
  objc_storeStrong((id *)&self->_interactionIdentifier, 0);
  objc_storeStrong(&self->_lastCorrectionIdentifier, 0);
  objc_storeStrong((id *)&self->_lastRecognitionText, 0);
  objc_storeStrong((id *)&self->_dictationPresenterWindow, 0);
  objc_storeStrong((id *)&self->_targetHypothesis, 0);
  objc_storeStrong((id *)&self->_lastHypothesis, 0);
  objc_storeStrong((id *)&self->_previousHypothesis, 0);
  objc_storeStrong((id *)&self->_pendingEdits, 0);
  objc_storeStrong((id *)&self->_smartLanguageSelectionOverrideLanguage, 0);
  objc_storeStrong((id *)&self->_activationIdentifier, 0);
  objc_storeStrong(&self->_undoNotificationToken, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_selectedTextAtStart, 0);
  objc_storeStrong((id *)&self->_hardwareVoiceCommandKeyRecognizer, 0);
  objc_storeStrong((id *)&self->_hardwareShortcutRecognizer, 0);
  objc_storeStrong(&self->_privacySheetDismissalHandler, 0);
  objc_storeStrong((id *)&self->_selectedAttributesForDictation, 0);
  objc_storeStrong((id *)&self->_postfixTextForStart, 0);
  objc_storeStrong((id *)&self->_selectionTextForStart, 0);
  objc_storeStrong((id *)&self->_prefixTextForStart, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
  objc_storeStrong((id *)&self->_streamingAnimationDisplayLink, 0);
  objc_storeStrong(&self->_finalResultsOperation, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_streamingOperations, 0);
  objc_storeStrong((id *)&self->_recordingLimitTimer, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
}

@end