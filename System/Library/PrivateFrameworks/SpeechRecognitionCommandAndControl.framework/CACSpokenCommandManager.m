@interface CACSpokenCommandManager
+ (BOOL)doesEvaluatorKey:(id)a3 matchValue:(id)a4;
+ (id)_allCommandIdentifiers;
+ (id)_allCommandsTable;
+ (id)capitalizedStringFromString:(id)a3;
+ (id)commandPropertiesForIdentifier:(id)a3;
+ (id)hardwareEvaluatorKeys;
+ (id)sharedCACSpokenCommandManager;
- (BOOL)_attentionIsLostWithListeningOffAction;
- (BOOL)_isNumberOnlyString:(id)a3 lessThanOrEqualToValue:(int64_t)a4;
- (BOOL)_isSystemSleeping;
- (BOOL)_popInteractionLevel:(unsigned int)a3 referencingObject:(id)a4;
- (BOOL)_pushInteractionLevel:(unsigned int)a3 referencingObject:(id)a4;
- (BOOL)_shouldBeListening;
- (BOOL)_telephonyRequiresAirPods;
- (BOOL)doesCurrentLanguageSupportInterWordSpaces;
- (BOOL)doesFocusedElementRequireSecureInput;
- (BOOL)elementIsOccluded:(id)a3 occludedAppScenes:(id)a4;
- (BOOL)forceAllCommandsToBeActive;
- (BOOL)isActiveOverlayType:(id)a3;
- (BOOL)isAttentionAwareClientRunning;
- (BOOL)isFetchingElements;
- (BOOL)isListening;
- (BOOL)isNextPreviousResolverSpokenCommandEmojiBased;
- (BOOL)isSynchronizingRecognizers;
- (BOOL)shouldIgnoreCommand:(id)a3;
- (BOOL)shouldPreserveDisambiguationHandler;
- (BOOL)showUIAsListening;
- (BOOL)telephonyInterruptedListening;
- (BOOL)userIsTouching;
- (BOOL)usingAutomationMode;
- (CACAXNotificationObserver)axNotificationObserver;
- (CACDisambiguationHandler)disambiguationHandler;
- (CACLabeledElementsCollection)labeledScreenElementsCollection;
- (CACTextInsertionSpecifier)previousTextInsertionSpecifier;
- (CACTextInsertionSpecifier)stagedTextInsertionSpecifier;
- (CACTouchEventObserver)touchEventObserver;
- (CGRect)bestDictationRecognizerModeImageRectForView:(id)a3;
- (FBSALOToken)applicationAddedObservationToken;
- (FBSALOToken)applicationRemovedObservationToken;
- (FBSApplicationLibrary)appLibrary;
- (NSMutableArray)commandsToIgnore;
- (NSString)commandRecognitionLogPath;
- (NSString)recognizedCommandIdentifier;
- (NSString)transientOverlayType;
- (OS_dispatch_queue)recognizerSynchronizationDispatchQueue;
- (__RXLanguageObject)rxLanguageObjectForBuiltInLMIdentifier:(id)a3;
- (double)delayForNotification:(int)a3;
- (double)lastDictationInsertionTimeStamp;
- (id)_allElementsIncludingNonScanner;
- (id)_arrayFromExternalContextOverrideForBuiltInIdentifier:(id)a3;
- (id)_descriptionForAXTextUnit:(unint64_t)a3;
- (id)_fetchPresentationElements;
- (id)_nextResolverRelationships;
- (id)_previousResolverRelationships;
- (id)_stringInRecognitionLocaleFormatFromIntegerValue:(int64_t)a3;
- (id)_telephonyQueue;
- (id)_templateSpokenCommandWithIdentifier:(id)a3;
- (id)activeApplications;
- (id)activeCommandIdentifiers;
- (id)activeCommandsForLocaleIdentifier:(id)a3;
- (id)activeOverlayType;
- (id)allCommandsForLocaleIdentifier:(id)a3;
- (id)allCustomCommandsDetail;
- (id)contextSummary;
- (id)copySupportedCommandWithIdentifier:(id)a3;
- (id)focusedElement;
- (id)groupedCommandsForLocaleIdentifier:(id)a3;
- (id)inCallServiceApplication;
- (id)labeledElementsFromScreen;
- (id)labeledElementsFromScreenWithTitle:(id)a3;
- (id)labeledElementsFromScreenWithTrait:(unint64_t)a3;
- (id)languageModelForBuiltInLMIdentifier:(id)a3;
- (id)leadingTextForCurrentSelection;
- (id)nameOfAXNotification:(int)a3;
- (id)primaryStringForCommandIdentifier:(id)a3;
- (id)resolvedNextSpokenCommand;
- (id)resolvedPreviousSpokenCommand;
- (id)screenElements;
- (id)screenElementsForEscape;
- (id)stopRecordingGesture;
- (id)synchronousRecognitionOfString:(id)a3 timeoutInterval:(double)a4;
- (id)synchronousRecognitionUsingCommandIdentifier:(id)a3 parameters:(id)a4 timeoutInterval:(double)a5;
- (int)dictationRecognizerMode;
- (unsigned)currentInteractionLevel;
- (unsigned)currentInteractionLevelPassingBackTopReferencingObject:(id *)a3;
- (void)_appendSpokenCommand:(id)a3 toLogAtPath:(id)a4;
- (void)_attentionAwareSettingChanged;
- (void)_cancelSynchronousRemoteRecognition;
- (void)_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand:(id)a3;
- (void)_closeAllRecognizers;
- (void)_createCommandRecognizersIfNecessary;
- (void)_executeNextRepeatWithCompletionBlock:(id)a3;
- (void)_fetchElements;
- (void)_flushBuiltInLMIdentifierTable;
- (void)_handleLanguageChange;
- (void)_handlePendingCommands;
- (void)_intializeBuiltInLMIdentifierTableIfNecessary;
- (void)_markAsDirtyForBuiltInLMIdentifier:(id)a3;
- (void)_microphoneTurnedOffAfterInteruption;
- (void)_microphoneTurnedOn;
- (void)_microphoneTurnedOnAfterInteruption;
- (void)_notifyStatusChanged:(int64_t)a3;
- (void)_pushLeadingContextToSpeechRecognitionSystem;
- (void)_pushSecureFieldStatusToSpeechRecognitionSystem;
- (void)_rebuildCommandRecognizers;
- (void)_rebuildCustomCommandRecognizers;
- (void)_resetInteractionLevel;
- (void)_resetRecognitionSystems;
- (void)_scheduleFetchElementsWithDelay:(double)a3;
- (void)_scheduleFetchElementsWithDelay:(double)a3 andReason:(id)a4;
- (void)_startListening;
- (void)_startSynchronousRemoteRecognitionWithCompletionBlock:(id)a3;
- (void)_stopListening;
- (void)_updateAssetPurgeability;
- (void)_updateLanguageModelForBuiltInLMIdentifier:(id)a3;
- (void)_updateMostRecentLaunchTime;
- (void)_waitUntilElementsAreNumbered;
- (void)attemptGrabbingMic:(id)a3;
- (void)attentionAwareGained;
- (void)attentionAwareInterrupted;
- (void)attentionAwareInterruptionEnded;
- (void)attentionAwareLost;
- (void)beginExecutingRepeatingSpokenCommandNumberOfTimes:(int64_t)a3 completionBlock:(id)a4;
- (void)beginObservingApplications;
- (void)cancelAnyTransientOverlay;
- (void)dealloc;
- (void)didBeginTouches;
- (void)didEndTouches;
- (void)didFindCloseSpokenCommandIdentifiers:(id)a3;
- (void)didFinishExecutingSpokenCommand:(id)a3;
- (void)didObserveFirstTouchDownForObserver:(id)a3;
- (void)didObserveLastTouchUpForObserver:(id)a3;
- (void)dispatchPendingCommand;
- (void)displayMessageAndQuitVoiceControl;
- (void)displayRetryMessage;
- (void)displayRetryMessageAndRetryGrabbingMic;
- (void)enterDictatedString:(id)a3;
- (void)enterSleepInteractionLevel;
- (void)exitSleepInteractionLevel;
- (void)forceElementFetch;
- (void)forceElementFetchWithReason:(id)a3;
- (void)forceSynchronizeRecognizersForBuiltInLMIdentifier:(id)a3;
- (void)handleCommandWithIdentifier:(id)a3;
- (void)handleRecognizedCommand:(id)a3;
- (void)handleSRSystemBeginUtteranceWithID:(unint64_t)a3;
- (void)handleSRSystemServerError;
- (void)insertDictatedAttributedString:(id)a3;
- (void)insertDictatedString:(id)a3;
- (void)notifyUserOfCommandFailureUsingSound;
- (void)notifyUserOfCommandFailureWithTitle:(id)a3 description:(id)a4;
- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5;
- (void)performOnRecognizerSynchronizationDispatchQueueIfRunning:(id)a3;
- (void)registerSignPostBeginProcessingForSpeechRecognizer:(id)a3 message:(id)a4;
- (void)registerSignPostEndProcessingForSpeechRecognizer:(id)a3 message:(id)a4;
- (void)run;
- (void)setAppLibrary:(id)a3;
- (void)setApplicationAddedObservationToken:(id)a3;
- (void)setApplicationRemovedObservationToken:(id)a3;
- (void)setAxNotificationObserver:(id)a3;
- (void)setCommandsToIgnore:(id)a3;
- (void)setDictationRecognizerMode:(int)a3;
- (void)setDisambiguationHandler:(id)a3;
- (void)setNextFetchDelayFactor:(double)a3;
- (void)setNextPreviousResolverSpokenCommand:(id)a3;
- (void)setPreviousTextInsertionSpecifier:(id)a3;
- (void)setRecognizedCommandIdentifier:(id)a3;
- (void)setRecognizerSynchronizationDispatchQueue:(id)a3;
- (void)setRepeatingSpokenCommand:(id)a3;
- (void)setScreenElements:(id)a3 presentationElements:(id)a4 activeApplications:(id)a5 focusedTextAreaElement:(id)a6;
- (void)setShouldPreserveDisambiguationHandler:(BOOL)a3;
- (void)setStagedTextInsertionSpecifier:(id)a3;
- (void)setTelephonyInterruptedListening:(BOOL)a3;
- (void)setTouchEventObserver:(id)a3;
- (void)setTransientOverlayType:(id)a3;
- (void)startListening;
- (void)startRecordingGesture;
- (void)stopAnyRepeatingSpokenCommand;
- (void)stopListening;
- (void)stopObservingApplications;
- (void)suspendCommandDispatching:(BOOL)a3;
- (void)synchronizeRecognizersWithReason:(id)a3;
- (void)updateScreenElementsWithNonScannerElements:(id)a3;
- (void)updateStatusIndicatorView;
- (void)willTerminate;
- (void)willUpdateElementsSignificantly;
@end

@implementation CACSpokenCommandManager

+ (id)sharedCACSpokenCommandManager
{
  if (sharedCACSpokenCommandManager_singletonInit != -1) {
    dispatch_once(&sharedCACSpokenCommandManager_singletonInit, &__block_literal_global_16);
  }
  v2 = (void *)sCACSpokenCommandManager;
  return v2;
}

uint64_t __56__CACSpokenCommandManager_sharedCACSpokenCommandManager__block_invoke()
{
  sCACSpokenCommandManager = objc_alloc_init(CACSpokenCommandManager);
  return MEMORY[0x270F9A758]();
}

+ (id)capitalizedStringFromString:(id)a3
{
  v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  v5 = [v3 mainBundle];
  v6 = [v5 preferredLocalizations];
  v7 = [v6 objectAtIndex:0];

  v8 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v7];
  v9 = [MEMORY[0x263F089D8] stringWithString:v4];
  uint64_t v10 = [v4 length];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __55__CACSpokenCommandManager_capitalizedStringFromString___block_invoke;
  v16[3] = &unk_264D11E10;
  id v17 = v8;
  id v11 = v9;
  id v18 = v11;
  id v12 = v8;
  objc_msgSend(v4, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v16);

  v13 = v18;
  id v14 = v11;

  return v14;
}

void __55__CACSpokenCommandManager_capitalizedStringFromString___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 capitalizedStringWithLocale:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withString:", a3, a4, v7);
}

+ (id)hardwareEvaluatorKeys
{
  v4[6] = *MEMORY[0x263EF8340];
  v4[0] = kCACCommandContextRequires3DTouchHardware;
  v4[1] = kCACCommandContextRequiresRingerSwitch;
  v4[2] = kCACCommandContextRequiresIPad;
  v4[3] = kCACCommandContextRequiresAppleVision;
  v4[4] = kCACCommandContextPreventWithAppleVision;
  v4[5] = kCACCommandContextRequiresCameraButton;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:6];
  return v2;
}

+ (BOOL)doesEvaluatorKey:(id)a3 matchValue:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (__CFString *)a4;
  id v7 = [(id)sEvaluatorValueCache objectForKey:v5];
  int v8 = [v7 isEqual:v6];

  if (v8)
  {
    v9 = [(id)sEvaluatorResultCache objectForKey:v5];
    LOBYTE(v10) = [v9 BOOLValue];

    goto LABEL_20;
  }
  if (([v5 isEqualToString:kCACCommandContextRequiresFocusedStaticText] & 1) != 0
    || [v5 isEqualToString:kCACCommandContextRequiresFocusedEditableText])
  {
    id v11 = [(id)sCACSpokenCommandManager focusedElement];

    int v12 = sCACSpokenCommandManager;
    if (sCACSpokenCommandManager) {
      int v12 = *(unsigned __int8 *)(sCACSpokenCommandManager + 368) != 0;
    }
    if (v11 && !v12) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresInteractionLevel])
  {
    int v13 = [(id)sCACSpokenCommandManager currentInteractionLevel];
LABEL_14:
    uint64_t v10 = v13 == [(__CFString *)v6 integerValue];
    goto LABEL_18;
  }
  if ([v5 isEqualToString:kCACCommandContextSupportsInteractionLevel])
  {
    int v13 = [(id)sCACSpokenCommandManager currentInteractionLevel];
    if (v13) {
      goto LABEL_14;
    }
LABEL_9:
    uint64_t v10 = 1;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresActiveDictationRecognizerMode])
  {
    if ([(id)sCACSpokenCommandManager dictationRecognizerMode] != 1) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v10 = [(__CFString *)v6 BOOLValue] ^ 1;
    goto LABEL_18;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresSpellingModeSupportForLocale])
  {
    id v17 = +[CACPreferences sharedPreferences];
    id v18 = [(__CFString *)v17 bestLocaleIdentifier];
    v19 = (void *)RXLocalesSupportingSpellingMode();
    if (+[CACLocaleUtilities isLocaleIdentifier:v18 containedInLocaleIdentifiers:v19]|| CFPreferencesGetAppBooleanValue(@"EnableSpellingModeDuringDevelopment", @"com.apple.speech.SpeechRecognitionCommandAndControl", 0))
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = [(__CFString *)v6 BOOLValue] ^ 1;
    }
LABEL_25:

LABEL_26:
LABEL_48:

    goto LABEL_18;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresSpellingModeSupportInAsset])
  {
    id v17 = +[CACSpeechSystem speechSystem];
    if (([(__CFString *)v17 supportsSpellingMode] & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"EnableSpellingModeDuringDevelopment", @"com.apple.speech.SpeechRecognitionCommandAndControl", 0))
    {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresOriginalEmojiCommands])
  {
    if (!CFPreferencesGetAppBooleanValue(@"UseAssetSupportForEmojiNameRecogition", @"com.apple.SpeechRecognitionCore", 0))goto LABEL_9; {
    goto LABEL_17;
    }
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresSpecifiedBooleanPreferenceKeyIsTrue])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v10 = 1;
    if (v6 && (isKindOfClass & 1) != 0)
    {
      Boolean keyExistsAndHasValidFormat = 0;
      if (CFPreferencesGetAppBooleanValue(v6, @"com.apple.speech.SpeechRecognitionCommandAndControl", &keyExistsAndHasValidFormat))
      {
        BOOL v21 = keyExistsAndHasValidFormat == 0;
      }
      else
      {
        BOOL v21 = 1;
      }
      uint64_t v10 = !v21;
    }
    goto LABEL_18;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresAnyOverlay])
  {
    id v17 = +[CACDisplayManager sharedManager];
    if (([(__CFString *)v17 isDisplayingAnyOverlay] & 1) == 0)
    {
LABEL_46:
      int v22 = [(__CFString *)v6 BOOLValue];
LABEL_47:
      uint64_t v10 = v22 ^ 1u;
      goto LABEL_48;
    }
LABEL_30:
    uint64_t v10 = 1;
    goto LABEL_48;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresNumberedElementsOverlay])
  {
    v23 = (void *)sCACSpokenCommandManager;
    v24 = @"NumberedElements";
    goto LABEL_51;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresAnyNumberedOverlay])
  {
    id v17 = [(id)sCACSpokenCommandManager activeOverlayType];
    if (([(__CFString *)v17 isEqualToString:@"NumberedElements"] & 1) != 0
      || ([(__CFString *)v17 isEqualToString:@"NumberedGrid"] & 1) != 0)
    {
      goto LABEL_30;
    }
    goto LABEL_46;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresTextDisambiguationNumberedOverlay])
  {
    id v17 = [(id)sCACSpokenCommandManager activeOverlayType];
    if ([(__CFString *)v17 isEqualToString:@"NumberedElements"])
    {
      id v18 = [(id)sCACSpokenCommandManager disambiguationHandler];
      v19 = [v18 labeledElements];
      v25 = [v19 firstObject];
      v26 = [v25 textMarkerRange];
      if (v26) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = [(__CFString *)v6 BOOLValue] ^ 1;
      }

      goto LABEL_25;
    }
    goto LABEL_46;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresGridOverlay])
  {
    v23 = (void *)sCACSpokenCommandManager;
    v24 = @"NumberedGrid";
    goto LABEL_51;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresElementNamesOverlay])
  {
    v23 = (void *)sCACSpokenCommandManager;
    v24 = @"NamedElements";
LABEL_51:
    if ([v23 isActiveOverlayType:v24]) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
  if ([v5 isEqualToString:kCACCommandContextPreventDuringAnyPresentation])
  {
    id v17 = +[CACDisplayManager sharedManager];
    if ([(__CFString *)v17 isDisplayingAnyPresentation]) {
      goto LABEL_46;
    }
    goto LABEL_30;
  }
  if ([v5 isEqualToString:kCACCommandContextPreventDuringAnyOverlay])
  {
    id v17 = [(id)sCACSpokenCommandManager activeOverlayType];
    if (v17) {
      goto LABEL_46;
    }
    goto LABEL_30;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresOneOfAppIdentifiers])
  {
    id v17 = v6;
    if ([(__CFString *)v17 count])
    {
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v18 = [(id)sCACSpokenCommandManager activeApplications];
      uint64_t v10 = [v18 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v10)
      {
        uint64_t v27 = *(void *)v62;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v62 != v27) {
              objc_enumerationMutation(v18);
            }
            v29 = [*(id *)(*((void *)&v61 + 1) + 8 * i) bundleId];
            if ([v29 length] && -[__CFString containsObject:](v17, "containsObject:", v29))
            {

              uint64_t v10 = 1;
              goto LABEL_26;
            }
          }
          uint64_t v10 = [v18 countByEnumeratingWithState:&v61 objects:v69 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
      goto LABEL_26;
    }
    goto LABEL_30;
  }
  if ([v5 isEqualToString:kCACCommandContextPreventDuringLockScreen]
    || [v5 isEqualToString:kCACCommandContextPreventOniPhoneLockScreen]
    && (+[CACDisplayManager sharedManager],
        v30 = objc_claimAutoreleasedReturnValue(),
        char v31 = [v30 carPlayConnected],
        v30,
        (v31 & 1) == 0))
  {
    id v17 = [MEMORY[0x263F21668] systemApplication];
    int v22 = [(__CFString *)v17 isScreenLocked];
    goto LABEL_47;
  }
  if ([v5 isEqualToString:kCACCommandContextRequiresAnyGesture])
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v32 = +[CACSpokenCommandGestureManager allManagers];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v68 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v58;
LABEL_92:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v32);
        }
        if ([*(id *)(*((void *)&v57 + 1) + 8 * v36) isInGesture]) {
          break;
        }
        if (v34 == ++v36)
        {
          uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v68 count:16];
          if (v34) {
            goto LABEL_92;
          }
          goto LABEL_109;
        }
      }
LABEL_110:
      char v41 = 1;
      goto LABEL_111;
    }
  }
  else
  {
    if (![v5 isEqualToString:kCACCommandContextRequiresDragGesture])
    {
      if ([v5 isEqualToString:kCACCommandContextRequires3DTouchGesture])
      {
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        v44 = +[CACSpokenCommandGestureManager allManagers];
        uint64_t v45 = [v44 countByEnumeratingWithState:&v49 objects:v66 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v50;
          while (2)
          {
            for (uint64_t j = 0; j != v46; ++j)
            {
              if (*(void *)v50 != v47) {
                objc_enumerationMutation(v44);
              }
              if ([*(id *)(*((void *)&v49 + 1) + 8 * j) isIn3DTouchGesture])
              {

                goto LABEL_9;
              }
            }
            uint64_t v46 = [v44 countByEnumeratingWithState:&v49 objects:v66 count:16];
            if (v46) {
              continue;
            }
            break;
          }
        }

        goto LABEL_17;
      }
      if (![v5 isEqualToString:kCACCommandContextRequiresSOS])
      {
        if ([v5 isEqualToString:kCACCommandContextRequiresSiri])
        {
          if (AXDeviceIsSiriAvailable()) {
            goto LABEL_9;
          }
          goto LABEL_17;
        }
        if ([v5 isEqualToString:kCACCommandContextRequiresRingerSwitch])
        {
          if (AXDeviceIsRingerSwitchAvailable()) {
            goto LABEL_9;
          }
          goto LABEL_17;
        }
        if ([v5 isEqualToString:kCACCommandContextRequiresSpeakScreen])
        {
          if (UIAccessibilityIsSpeakScreenEnabled()) {
            goto LABEL_9;
          }
          goto LABEL_17;
        }
        if ([v5 isEqualToString:kCACCommandContextRequiresZoom])
        {
          if (_AXSZoomTouchEnabled()) {
            goto LABEL_9;
          }
          goto LABEL_17;
        }
        if ([v5 isEqualToString:kCACCommandContextRequiresSideAppSupport])
        {
          if (!AXDeviceSupportsSideApp()) {
            goto LABEL_17;
          }
        }
        else
        {
          if ([v5 isEqualToString:kCACCommandContextRequiresApplePay])
          {
            if (AXDeviceCanArmApplePay()) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
          if ([v5 isEqualToString:kCACCommandContextRequiresVoiceOver])
          {
            if (UIAccessibilityIsVoiceOverRunning()) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
          if ([v5 isEqualToString:kCACCommandContextPreventWithVoiceOver])
          {
            if (!UIAccessibilityIsVoiceOverRunning()) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
          if ([v5 isEqualToString:kCACCommandContextRequiresIPad])
          {
            if (AXDeviceIsPad()) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
          if ([v5 isEqualToString:kCACCommandContextRequiresAppleVision])
          {
            if (AXDeviceIsRealityDevice()) {
              goto LABEL_9;
            }
            goto LABEL_17;
          }
          if (![v5 isEqualToString:kCACCommandContextPreventWithAppleVision])
          {
            if ([v5 isEqualToString:kCACCommandContextRequiresCameraButton])
            {
              if (AXDeviceSupportsCameraButton()) {
                goto LABEL_9;
              }
              goto LABEL_17;
            }
            if ([v5 isEqualToString:kCACCommandContextRequires3DTouchHardware])
            {
              if (AXDeviceHas3DTouch() && !AXDeviceHasLongPress3dTouch()) {
                goto LABEL_9;
              }
              goto LABEL_17;
            }
            if (![v5 isEqualToString:kCACCommandContextRequiresCarPlay])
            {
              if ([v5 isEqualToString:kCACCommandContextRequiresVoiceControlEnabled])
              {
                if (_AXSCommandAndControlEnabled()) {
                  goto LABEL_9;
                }
              }
              else if (![v5 isEqualToString:kCACCommandContextPreventShowingCommand])
              {
                goto LABEL_9;
              }
              goto LABEL_17;
            }
            id v17 = +[CACDisplayManager sharedManager];
            if ([(__CFString *)v17 carPlayAvailable]) {
              goto LABEL_30;
            }
            goto LABEL_46;
          }
        }
      }
      if (!AXDeviceIsRealityDevice()) {
        goto LABEL_9;
      }
      goto LABEL_17;
    }
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v32 = +[CACSpokenCommandGestureManager allManagers];
    uint64_t v37 = [v32 countByEnumeratingWithState:&v53 objects:v67 count:16];
    if (v37)
    {
      uint64_t v38 = v37;
      uint64_t v39 = *(void *)v54;
LABEL_103:
      uint64_t v40 = 0;
      while (1)
      {
        if (*(void *)v54 != v39) {
          objc_enumerationMutation(v32);
        }
        if ([*(id *)(*((void *)&v53 + 1) + 8 * v40) isInDragGesture]) {
          goto LABEL_110;
        }
        if (v38 == ++v40)
        {
          uint64_t v38 = [v32 countByEnumeratingWithState:&v53 objects:v67 count:16];
          if (v38) {
            goto LABEL_103;
          }
          break;
        }
      }
    }
  }
LABEL_109:
  char v41 = 0;
LABEL_111:

  v42 = +[CACAXDragManager sharedManager];
  char v43 = [v42 isDragActive];

  uint64_t v10 = 1;
  if ((v41 & 1) == 0 && (v43 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
  if (sEvaluatorValueCache)
  {
    [(id)sEvaluatorValueCache setObject:v6 forKey:v5];
    id v14 = (void *)sEvaluatorResultCache;
    v15 = [NSNumber numberWithBool:v10];
    [v14 setObject:v15 forKey:v5];
  }
LABEL_20:

  return v10;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"CACNotificationLanguageChanged", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, @"CACNotificationOverlayFadingSettingsChanged", 0);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, @"CACNotificationGridOverlaySettingsChanged", 0);
  id v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v7, self, @"CACNotificationCommandsSettingsChanged", 0);
  int v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v8, self, @"CACNotificationUserHintsSettingsChanged", 0);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v9, self, @"com.apple.SpeechRecognitionCore.liveRecordingOn", 0);
  uint64_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v10, self, @"com.apple.SpeechRecognitionCore.liveRecordingOff", 0);
  id v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v11, self, @"com.apple.SpeechRecognitionCore.liveRecordingOnFromInterrupt", 0);
  int v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v12, self, @"com.apple.SpeechRecognitionCore.liveRecordingOffFromInterrupt", 0);
  if (self->_isAttentionAwareClientRunning)
  {
    int v13 = +[CACUserAttentionInterface sharedManager];
    [v13 stopUserAttentionControllerIfNeeded];
  }
  v14.receiver = self;
  v14.super_class = (Class)CACSpokenCommandManager;
  [(CACSpokenCommandManager *)&v14 dealloc];
}

- (void)run
{
  v3 = CACLogDictationCommands();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v59 = 0;
    _os_log_impl(&dword_238377000, v3, OS_LOG_TYPE_DEFAULT, "-[CACSpokenCommandManager run] called", v59, 2u);
  }

  self->_displayIsOff = [(CACSpokenCommandManager *)self _isSystemSleeping];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_NotificationLanguageSettingsChanged, @"CACNotificationLanguageChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)_NotificationAlwaysShowOverlayTypeSettingsChanged, @"NotificationAlwaysShowOverlayTypeSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_NotificationOverlayOptionsSettingsChanged, @"CACNotificationOverlayFadingSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v7, self, (CFNotificationCallback)_NotificationOverlayOptionsSettingsChanged, @"CACNotificationGridOverlaySettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v8, self, (CFNotificationCallback)_NotificationCommandsSettingsChanged, @"CACNotificationCommandsSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v9, self, (CFNotificationCallback)_NotificationUserHintsSettingsChanged, @"CACNotificationUserHintsSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v10, self, (CFNotificationCallback)_NotificationAttentionBasedSettingsChanged, @"CACNotificationAttentionBasedSettingsChanged", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v11, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOnAfterInterruption, @"com.apple.SpeechRecognitionCore.liveRecordingOnFromInterrupt", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v12, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOffAfterInterruption, @"com.apple.SpeechRecognitionCore.liveRecordingOffFromInterrupt", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  int v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v13, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOn, @"com.apple.SpeechRecognitionCore.liveRecordingOn", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_super v14 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v14, self, (CFNotificationCallback)_NotificationLiveMicrophoneDidTurnOff, @"com.apple.SpeechRecognitionCore.liveRecordingOff", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v15 = +[CACPreferences sharedPreferences];
  v16 = [v15 divertedCommandsLogPath];
  commandRecognitionLogPath = self->_commandRecognitionLogPath;
  self->_commandRecognitionLogPath = v16;

  self->_forceAllCommandsToBeActive = [v15 forceAllCommandsToBeActive];
  self->_usingAutomationMode = [v15 usingAutomationMode];
  id v18 = [v15 externalContextOverrideFilePath];
  if (v18)
  {
    id v19 = objc_alloc(NSDictionary);
    v20 = [v18 stringByExpandingTildeInPath];
    BOOL v21 = (NSDictionary *)[v19 initWithContentsOfFile:v20];
    externalContextOverrideTable = self->_externalContextOverrideTable;
    self->_externalContextOverrideTable = v21;
  }
  else
  {
    v20 = self->_externalContextOverrideTable;
    self->_externalContextOverrideTable = 0;
  }

  v23 = (NSMutableArray *)objc_opt_new();
  recognizers = self->_recognizers;
  self->_recognizers = v23;

  v25 = (NSMutableDictionary *)objc_opt_new();
  oldRXLangaugeObjects = self->_oldRXLangaugeObjects;
  self->_oldRXLangaugeObjects = v25;

  uint64_t v27 = (NSMutableArray *)objc_opt_new();
  recognizedCommandsReadyForDispatch = self->_recognizedCommandsReadyForDispatch;
  self->_recognizedCommandsReadyForDispatch = v27;

  v29 = (NSMutableDictionary *)objc_opt_new();
  recognizerInteractionLevels = self->_recognizerInteractionLevels;
  self->_recognizerInteractionLevels = v29;

  char v31 = (NSMutableDictionary *)objc_opt_new();
  identifierBasedLanguageModelCache = self->_identifierBasedLanguageModelCache;
  self->_identifierBasedLanguageModelCache = v31;

  uint64_t v33 = (NSMutableArray *)objc_opt_new();
  pendingCommandToExecute = self->_pendingCommandToExecute;
  self->_pendingCommandToExecute = v33;

  uint64_t v35 = (CACLabeledElementsCollection *)objc_opt_new();
  labeledScreenElementsCollection = self->_labeledScreenElementsCollection;
  self->_labeledScreenElementsCollection = v35;

  uint64_t v37 = objc_opt_new();
  [(CACSpokenCommandManager *)self setStagedTextInsertionSpecifier:v37];

  dispatch_queue_t v38 = dispatch_queue_create("com.apple.speech.RecognizerSynchronizationQueue", 0);
  [(CACSpokenCommandManager *)self setRecognizerSynchronizationDispatchQueue:v38];

  uint64_t v39 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.CommandsExecutionQueue", 0);
  commandExecutionDispatchQueue = self->_commandExecutionDispatchQueue;
  self->_commandExecutionDispatchQueue = v39;

  char v41 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.ElementFetchingQueue", 0);
  elementFetchingQueue = self->_elementFetchingQueue;
  self->_elementFetchingQueue = v41;

  char v43 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.NonScannerElementFetchingQueue", 0);
  nonScannerElementFetchingQueue = self->_nonScannerElementFetchingQueue;
  self->_nonScannerElementFetchingQueue = v43;

  uint64_t v45 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.speech.PerAppElementFetchingQueue", MEMORY[0x263EF83A8]);
  perAppElementFetchingQueue = self->_perAppElementFetchingQueue;
  self->_perAppElementFetchingQueue = v45;

  [v15 fixMissingLocalesForVocabularyEntriesIfNecessary];
  uint64_t v47 = [MEMORY[0x263F21F20] sharedInstance];
  [v47 warm];

  [MEMORY[0x263F21690] applyElementAttributeCacheScheme:6];
  [(CACSpokenCommandManager *)self _supressKeyboardDictation:1 withReason:@"Voice Control initialization"];
  [(CACSpokenCommandManager *)self _attentionAwareSettingChanged];
  [(CACSpokenCommandManager *)self startListening];
  +[CACSignPostLog FetchElementsEventBeganWithReason:@"First fetch" expectedDelay:0.0];
  [(CACSpokenCommandManager *)self _fetchElements];
  _UIAccessibilityBlockPostingOfNotification();
  v48 = [[CACAXNotificationObserver alloc] initWithNotifications:&unk_26EB4D028];
  [(CACAXNotificationObserver *)v48 setDelegate:self];
  [(CACSpokenCommandManager *)self setAxNotificationObserver:v48];
  long long v49 = objc_alloc_init(CACTouchEventObserver);
  [(CACTouchEventObserver *)v49 setDelegate:self];
  [(CACTouchEventObserver *)v49 beginObserving];
  [(CACSpokenCommandManager *)self setTouchEventObserver:v49];
  [(CACSpokenCommandManager *)self beginObservingApplications];
  long long v50 = +[CACPreferences sharedPreferences];
  [v50 setDidShowOnboarding:1];

  long long v51 = [MEMORY[0x263F22958] sharedManager];
  id v52 = (id)[v51 shortcuts];

  id v53 = +[CACSystemStatusManager sharedManager];
  dispatch_time_t v54 = dispatch_time(0, 500000000);
  long long v55 = dispatch_get_global_queue(21, 0);
  dispatch_after(v54, v55, &__block_literal_global_418);

  long long v56 = [MEMORY[0x263F1DFB0] currentNotificationCenter];
  [v56 setDelegate:self];
  [v56 setWantsNotificationResponsesDelivered];
  [(CACSpokenCommandManager *)self _updateMostRecentLaunchTime];
  [(CACSpokenCommandManager *)self _updateAssetPurgeability];
  long long v57 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__updateAssetPurgeability selector:0 userInfo:1 repeats:86400.0];
  assetPurgabilityTimer = self->_assetPurgabilityTimer;
  self->_assetPurgabilityTimer = v57;

  self->_isRunning = 1;
}

void __30__CACSpokenCommandManager_run__block_invoke()
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CACDefaultRecognizerMode", @"com.apple.speech.SpeechRecognitionCommandAndControl", 0);
  if (AppIntegerValue)
  {
    id v1 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v1 setDictationRecognizerMode:AppIntegerValue];
  }
}

- (void)willTerminate
{
  [(CACSpokenCommandManager *)self _supressKeyboardDictation:0 withReason:@"Voice Control termination"];
  id v2 = +[CACDisplayManager sharedManager];
  [v2 enableStatusBarOverride:0];
}

- (void)performOnRecognizerSynchronizationDispatchQueueIfRunning:(id)a3
{
  id v4 = a3;
  id v5 = [(CACSpokenCommandManager *)self recognizerSynchronizationDispatchQueue];
  v6 = v5;
  if (v5)
  {
    dispatch_async(v5, v4);
  }
  else if (self->_isRunning)
  {
    id v7 = CACLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CACSpokenCommandManager performOnRecognizerSynchronizationDispatchQueueIfRunning:]();
    }
  }
}

- (id)screenElements
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = v3;
  if (self->_presentationElements || self->_topLevelElements) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  return v4;
}

- (id)_allElementsIncludingNonScanner
{
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = v3;
  if (self->_presentationElements || self->_topLevelAndNonScannerElements) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  return v4;
}

- (id)screenElementsForEscape
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  id v4 = [(CACSpokenCommandManager *)self labeledElementsFromScreen];
  id v5 = [v4 firstObject];
  v6 = [v5 element];

  id v7 = [(CACSpokenCommandManager *)self _allElementsIncludingNonScanner];
  int v8 = (void *)[v7 mutableCopy];

  if (v6)
  {
    [v3 addObject:v6];
    [v8 removeObject:v6];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
LABEL_5:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v16 != v12) {
        objc_enumerationMutation(v9);
      }
      objc_msgSend(v3, "addObject:", *(void *)(*((void *)&v15 + 1) + 8 * v13), (void)v15);
      if ((unint64_t)[v9 count] > 0x14) {
        break;
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  return v3;
}

- (void)updateScreenElementsWithNonScannerElements:(id)a3
{
}

- (void)setScreenElements:(id)a3 presentationElements:(id)a4 activeApplications:(id)a5 focusedTextAreaElement:(id)a6
{
  uint64_t v11 = (NSArray *)a3;
  uint64_t v12 = (NSArray *)a4;
  obuint64_t j = a5;
  uint64_t v13 = (NSArray *)a5;
  objc_super v14 = (AXElement *)a6;
  topLevelElements = self->_topLevelElements;
  if (topLevelElements == v11)
  {
    p_super = CACLogElementCollection();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      -[CACSpokenCommandManager setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:]();
    }
    int v17 = 0;
  }
  else
  {
    BOOL v16 = [(NSArray *)topLevelElements isVisuallyEqualToArray:v11];
    int v17 = !v16;
    if (v16)
    {
      long long v18 = CACLogElementCollection();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[CACSpokenCommandManager setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:]();
      }
    }
    else
    {
      [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:*MEMORY[0x263F78C58]];
      if ([(CACSpokenCommandManager *)self isActiveOverlayType:@"NumberedElements"]) {
        [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:*MEMORY[0x263F78C28]];
      }
    }
    uint64_t v20 = v11;
    p_super = &self->_topLevelElements->super;
    self->_topLevelElements = v20;
  }

  objc_storeStrong((id *)&self->_topLevelAndNonScannerElements, a3);
  presentationElements = self->_presentationElements;
  if (presentationElements != v12)
  {
    if (![(NSArray *)presentationElements isVisuallyEqualToArray:v12])
    {
      [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:*MEMORY[0x263F78C58]];
      [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:*MEMORY[0x263F78C28]];
      int v17 = 1;
    }
    objc_storeStrong((id *)&self->_presentationElements, a4);
  }
  p_focusedElement = (id *)&self->_focusedElement;
  id v23 = v14;
  if (self->_focusedElement != v14)
  {
    v24 = self;
    objc_sync_enter(v24);
    objc_storeStrong((id *)&self->_focusedElement, a6);
    objc_sync_exit(v24);

    if (!self->_focusedElement)
    {
      int v45 = 1;
      goto LABEL_29;
    }
    int v17 = 1;
    [(CACSpokenCommandManager *)v24 _supressKeyboardDictation:1 withReason:@"new text area focused"];
    id v23 = *p_focusedElement;
  }
  int v45 = v17;
  if (v23)
  {
    v25 = [v23 uiElement];
    v26 = [v25 stringWithAXAttribute:5019];

    if (![(__CFString *)v26 length])
    {
      uint64_t v27 = [*p_focusedElement recognitionStrings];
      uint64_t v28 = [v27 firstObject];

      v26 = (__CFString *)v28;
    }
    v29 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
    if ([(__CFString *)v26 length]) {
      v30 = v26;
    }
    else {
      v30 = &stru_26EB332F0;
    }
    [v29 setTextAreaIdentifierOrLabel:v30];

    char v31 = [*p_focusedElement cacTextSelectionCACTextMarkerRange];
    if (v31)
    {
      v32 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
      uint64_t v33 = NSString;
      uint64_t v34 = [v31 nsRange];
      [v31 nsRange];
      uint64_t v36 = objc_msgSend(v33, "stringWithFormat:", @"%ld,%ld", v34, v35);
      [v32 setTextAreaSelectionRange:v36];
    }
  }
LABEL_29:
  activeApplications = v13;
  if (self->_activeApplications != v13)
  {
    dispatch_queue_t v38 = self;
    objc_sync_enter(v38);
    objc_storeStrong((id *)&self->_activeApplications, obj);
    objc_sync_exit(v38);

    activeApplications = self->_activeApplications;
  }
  uint64_t v39 = [(NSArray *)activeApplications firstObject];
  uint64_t v40 = [v39 bundleId];

  char v41 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
  [v41 setTargetApplicationIdentifier:v40];

  unsigned int v42 = [(CACSpokenCommandManager *)self currentInteractionLevel];
  if (self->_lastSyncdInteractionLevel == v42)
  {
    if (!v45)
    {
      char v43 = CACLogElementCollection();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
        -[CACSpokenCommandManager setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:]();
      }
      goto LABEL_41;
    }
  }
  else
  {
    self->_lastSyncdInteractionLevel = v42;
  }
  v44 = [MEMORY[0x263EFF980] array];
  char v43 = v44;
  if (v11) {
    [v44 addObjectsFromArray:v11];
  }
  if (v12) {
    [v43 addObjectsFromArray:v12];
  }
  [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection updateWithAXElements:v43];
  [(CACSpokenCommandManager *)self synchronizeRecognizersWithReason:kSRUISyncReasonContentChanged];
LABEL_41:
}

- (id)focusedElement
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_focusedElement;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)doesFocusedElementRequireSecureInput
{
  id v2 = [(CACSpokenCommandManager *)self focusedElement];
  char v3 = [v2 hasAnyTraits:*MEMORY[0x263F21AE0]];

  return v3;
}

- (id)activeApplications
{
  id v2 = self;
  objc_sync_enter(v2);
  char v3 = v2->_activeApplications;
  objc_sync_exit(v2);

  return v3;
}

- (id)leadingTextForCurrentSelection
{
  id v2 = [(CACSpokenCommandManager *)self focusedElement];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 cacString];
    uint64_t v5 = [(__CFString *)v4 length];
    if (v5 < 1)
    {
LABEL_6:
      id v9 = 0;
      goto LABEL_7;
    }
    unint64_t v6 = v5;
    id v7 = [v3 cacTextSelectionCACTextMarkerRange];
    unint64_t v8 = [v7 nsRange];

    id v9 = 0;
    if (v8 && v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v8 > v6) {
        goto LABEL_6;
      }
      if (v8 >= 0x190) {
        v11.unint64_t location = v8 - 400;
      }
      else {
        v11.unint64_t location = 0;
      }
      v11.length = v8 - v11.location;
      id v9 = CFStringTokenizerCreate(0, v4, v11, 0, 0);
      if (v9)
      {
        unsigned int v12 = 0;
        unint64_t v13 = v8;
        while (1)
        {
          unint64_t v14 = v13 - 1;
          if (CFStringTokenizerGoToTokenAtIndex(v9, v13 - 1))
          {
            unint64_t location = CFStringTokenizerGetCurrentTokenRange(v9).location;
            if (location >= v13 || (++v12, (unint64_t v13 = location) == 0))
            {
LABEL_23:
              CFRelease(v9);
              -[__CFString substringWithRange:](v4, "substringWithRange:", v13, v8 - v13);
              id v9 = (__CFStringTokenizer *)objc_claimAutoreleasedReturnValue();
              break;
            }
          }
          else
          {
            --v13;
            if (!v14) {
              goto LABEL_23;
            }
          }
          if (v12 >= 0xA) {
            goto LABEL_23;
          }
        }
      }
    }
LABEL_7:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (CGRect)bestDictationRecognizerModeImageRectForView:(id)a3
{
  id v4 = a3;
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v9 = [(CACSpokenCommandManager *)self focusedElement];
  uint64_t v10 = v9;
  if (v9)
  {
    CFRange v11 = [v9 cacTextSelectionCACTextMarkerRange];
    uint64_t v12 = [v11 nsRange];
    uint64_t v14 = v13;

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v10 textCursorFrame];
      double x = CACViewRectFromPortraitUpRect(v4, v15, v16, v17, v18);
      double y = v20;
      double width = v22;
      double height = v24;
      if (!CGFloatIsValid()
        || !CGFloatIsValid()
        || !CGFloatIsValid()
        || (CGFloatIsValid() & 1) == 0)
      {
        unint64_t v26 = v12 + v14;
        uint64_t v27 = [v10 cacLastPosition];
        uint64_t v28 = [v27 index];

        BOOL v29 = v28 > 0;
        BOOL v30 = v26 >= v28;
        uint64_t v31 = v29 & v30;
        if (v29 && v30) {
          uint64_t v32 = v28 - 1;
        }
        else {
          uint64_t v32 = v26;
        }
        [v10 visibleFrame];
        CGFloat v47 = v34;
        CGFloat v48 = v33;
        CGFloat v45 = v36;
        CGFloat v46 = v35;
        objc_msgSend(v10, "rectForRange:", v12, 0);
        double v51 = v38;
        double v52 = v37;
        double v49 = v40;
        double v50 = v39;
        objc_msgSend(v10, "rectForRange:", v32, v31);
        double x = v53.origin.x;
        double y = v53.origin.y;
        double width = v53.size.width;
        double height = v53.size.height;
        v56.origin.double x = v5;
        v56.origin.double y = v6;
        v56.size.double width = v8;
        v56.size.double height = v7;
        if (CGRectEqualToRect(v53, v56)) {
          goto LABEL_12;
        }
        v54.origin.double x = x;
        v54.origin.double y = y;
        v54.size.double width = width;
        v54.size.double height = height;
        v57.origin.double y = v47;
        v57.origin.double x = v48;
        v57.size.double height = v45;
        v57.size.double width = v46;
        if (!CGRectIntersectsRect(v54, v57))
        {
LABEL_12:
          double y = v51;
          double x = v52;
          double height = v49;
          double width = v50;
        }
      }
      double v5 = x + width;
      double v6 = y + height + 6.0;
      CGFloat v7 = 16.0;
      CGFloat v8 = 16.0;
    }
  }

  double v41 = v5;
  double v42 = v6;
  double v43 = v8;
  double v44 = v7;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (void)didBeginTouches
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_userIsTouching = 1;
  [(CACSpokenCommandManager *)self cancelAnyTransientOverlay];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  char v3 = +[CACSpokenCommandGestureManager allManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) resetState];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(CACSpokenCommandManager *)self setPreviousTextInsertionSpecifier:0];
}

- (void)didEndTouches
{
  self->_userIsTouching = 0;
  [(CACSpokenCommandManager *)self _scheduleFetchElementsWithDelay:@"Ended touches" andReason:1.0];
}

- (void)willUpdateElementsSignificantly
{
  id v2 = [(CACSpokenCommandManager *)self activeOverlayType];
  char v3 = [v2 isEqualToString:@"NumberedGrid"];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = +[CACDisplayManager sharedManager];
    [v4 hideAnyNonInteractiveOverlay];

    id v5 = +[CACDisplayManager sharedManager];
    [v5 hideAnyInProcessPresentation];
  }
}

- (void)_pushLeadingContextToSpeechRecognitionSystem
{
  char v3 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CACSpokenCommandManager__pushLeadingContextToSpeechRecognitionSystem__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __71__CACSpokenCommandManager__pushLeadingContextToSpeechRecognitionSystem__block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x263EF8340];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v3 = v2;
  if (*(double *)&sEvaluatorResultCache_block_invoke_sDelayLeadingTextCalcUntilReferenceDate < v2)
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "leadingTextForCurrentSelection", *(double *)&sEvaluatorResultCache_block_invoke_sDelayLeadingTextCalcUntilReferenceDate);
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    if (v5 - v3 > 0.5)
    {
      [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
      *(double *)&sEvaluatorResultCache_block_invoke_sDelayLeadingTextCalcUntilReferenceDate = v6 + 60.0;
    }
    id v7 = *(id *)(*(void *)(a1 + 32) + 64);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 string];

      id v7 = (id)v8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v9 = [v4 string];

      uint64_t v4 = (void *)v9;
    }
    if (v4)
    {
      if (([v7 isEqualToString:v4] & 1) == 0)
      {
        long long v10 = +[CACSpeechSystem speechSystem];
        [v10 setLeadingContextString:v4];

        long long v11 = +[CACSpeechSystem speechSystem];
        v13[0] = v4;
        uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
        [v11 setAdditionalContextStrings:v12];

        objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v4);
      }
    }
  }
}

- (void)_pushSecureFieldStatusToSpeechRecognitionSystem
{
  BOOL v3 = [(CACSpokenCommandManager *)self doesFocusedElementRequireSecureInput];
  if (self->_previousStatusFocusOnSecureField != v3)
  {
    uint64_t v4 = +[CACSpeechSystem speechSystem];
    [v4 setSecureFieldFocused:v3];
  }
  self->_previousStatusFocusOnSecureField = v3;
}

- (void)cancelAnyTransientOverlay
{
  if (![(CACSpokenCommandManager *)self shouldPreserveDisambiguationHandler])
  {
    BOOL v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v3 setDisambiguationHandler:0];
  }
  if (self->_transientOverlayType) {
    goto LABEL_9;
  }
  uint64_t v4 = [(CACSpokenCommandManager *)self activeOverlayType];
  if (([v4 isEqualToString:@"NumberedGrid"] & 1) == 0)
  {

    goto LABEL_9;
  }
  double v5 = +[CACDisplayManager sharedManager];
  int v6 = [v5 isGridAtTopLevel];

  if (!v6)
  {
LABEL_9:
    long long v10 = +[CACDisplayManager sharedManager];
    [v10 hideAnyNonInteractiveOverlay];

    transientOverlayType = self->_transientOverlayType;
    self->_transientOverlayType = 0;
    goto LABEL_10;
  }
  id v7 = +[CACDisplayManager sharedManager];
  int v8 = [v7 updateGridLayoutFromPreferences];

  if (!v8) {
    return;
  }
  long long v11 = +[CACDisplayManager sharedManager];
  [v11 resetGrid];
  transientOverlayType = (NSString *)v11;
LABEL_10:
}

- (BOOL)isActiveOverlayType:(id)a3
{
  id v4 = a3;
  double v5 = [(CACSpokenCommandManager *)self activeOverlayType];
  char v6 = [v5 isEqualToString:v4];

  return v6;
}

- (id)activeOverlayType
{
  if ([(CACSpokenCommandManager *)self currentInteractionLevel]
    || (+[CACDisplayManager sharedManager],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 carPlayConnected],
        v3,
        (v4 & 1) != 0))
  {
    double v5 = 0;
    goto LABEL_4;
  }
  uint64_t v7 = [(CACSpokenCommandManager *)self disambiguationHandler];
  if (v7)
  {
    double v5 = (__CFString *)v7;
    int v8 = @"NumberedElements";
LABEL_9:

    double v5 = v8;
    goto LABEL_4;
  }
  uint64_t v9 = +[CACDisplayManager sharedManager];
  char v10 = [v9 isDisplayingAnyPresentation];

  if (v10)
  {
    double v5 = @"NumberedElements";
  }
  else
  {
    double v5 = self->_transientOverlayType;
    if (!v5)
    {
      long long v11 = +[CACPreferences sharedPreferences];
      double v5 = [v11 alwaysShowOverlayType];

      if (v5)
      {
        if ([(__CFString *)v5 isEqualToString:@"None"])
        {
          int v8 = 0;
          goto LABEL_9;
        }
      }
    }
  }
LABEL_4:
  return v5;
}

- (void)startRecordingGesture
{
  id v2 = [(CACSpokenCommandManager *)self touchEventObserver];
  [v2 startRecordingGesture];
}

- (id)stopRecordingGesture
{
  id v2 = [(CACSpokenCommandManager *)self touchEventObserver];
  BOOL v3 = [v2 stopRecordingGesture];

  return v3;
}

- (void)updateStatusIndicatorView
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CACSpokenCommandManager_updateStatusIndicatorView__block_invoke;
  block[3] = &unk_264D115D0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__CACSpokenCommandManager_updateStatusIndicatorView__block_invoke(uint64_t a1)
{
  id v2 = +[CACRecordedUserActionManager sharedManager];
  if ([v2 isRecording])
  {

LABEL_4:
    uint64_t v5 = 3;
    goto LABEL_5;
  }
  BOOL v3 = [*(id *)(a1 + 32) touchEventObserver];
  char v4 = [v3 isRecording];

  if (v4) {
    goto LABEL_4;
  }
  uint64_t v9 = *(unsigned char **)(a1 + 32);
  if (v9[272])
  {
    if ([v9 currentInteractionLevel]) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2;
    }
  }
  else
  {
    uint64_t v5 = 1;
  }
LABEL_5:
  char v6 = +[CACDisplayManager sharedManager];
  [v6 setStatusIndicatorType:v5];

  uint64_t v7 = *(void **)(a1 + 32);
  return [v7 _notifyStatusChanged:v5];
}

- (void)_notifyStatusChanged:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
  {
    char v6 = CACLogGeneral();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CACSpokenCommandManager _notifyStatusChanged:]();
    }
  }
  else
  {
    CFStringRef v3 = off_264D11F38[a3 - 1];
    char v4 = CACLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CACSpokenCommandManager _notifyStatusChanged:]();
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, v3, 0, 0, 1u);
  }
}

+ (id)_allCommandsTable
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CACSpokenCommandManager__allCommandsTable__block_invoke;
  block[3] = &unk_264D115D0;
  uint64_t v5 = @"CommandProperties";
  if (_allCommandsTable_onceToken != -1) {
    dispatch_once(&_allCommandsTable_onceToken, block);
  }
  id v2 = (id)_allCommandsTable_sAllCommandsTable;

  return v2;
}

void __44__CACSpokenCommandManager__allCommandsTable__block_invoke(uint64_t a1)
{
  id v5 = +[CACPreferences sharedPreferences];
  id v2 = [v5 builtInCommandsTable];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 32)];
  char v4 = (void *)_allCommandsTable_sAllCommandsTable;
  _allCommandsTable_sAllCommandsTable = v3;
}

+ (id)_allCommandIdentifiers
{
  id v2 = [MEMORY[0x263F78BE8] allCommandIdentifiersForCurrentDevice];
  uint64_t v3 = [v2 sortedArrayUsingSelector:sel_compare_];

  return v3;
}

+ (id)commandPropertiesForIdentifier:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F78BE8] commandWithIdentifier:a3];
  char v4 = [v3 commandProperties];

  return v4;
}

- (void)_createCommandRecognizersIfNecessary
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_recognizers;
  objc_sync_enter(v3);
  double v43 = self;
  uint64_t v4 = [(NSMutableArray *)self->_recognizers count];
  objc_sync_exit(v3);

  if (!v4)
  {
    double v44 = +[CACPreferences sharedPreferences];
    id v5 = objc_opt_new();
    double v42 = objc_opt_new();
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obuint64_t j = [(id)objc_opt_class() _allCommandIdentifiers];
    uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v6)
    {
      uint64_t v40 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v50 != v40) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          if (([v44 isEnabledForCommandIdentifier:v8] & 1) != 0 || v43->_forceAllCommandsToBeActive)
          {
            uint64_t v9 = [v44 bestLocaleIdentifier];
            int v10 = [v44 isCommandIdentifier:v8 availableForLocaleIdentifier:v9];

            if (v10)
            {
              long long v11 = [(id)objc_opt_class() commandPropertiesForIdentifier:v8];
              uint64_t v12 = (void *)[v11 mutableCopy];

              [v12 setObject:v8 forKey:kCACCommandPropertyIdentifier];
              uint64_t v13 = [[CACSpokenCommand alloc] initWithProperties:v12];
              uint64_t v14 = v13;
              if (v13)
              {
                id v15 = [(CACSpokenCommand *)v13 languageModel];
                double v16 = [(CACSpokenCommand *)v14 strings];

                if (v16)
                {
                  double v17 = objc_opt_new();
                  double v18 = [(CACSpokenCommand *)v14 contextEvaluation];
                  [v17 addEntriesFromDictionary:v18];

                  id v19 = [v12 objectForKey:@"RecognizerClassName"];
                  if (v19)
                  {
                    [v17 setObject:&unk_26EB4CEE8 forKey:v19];
                    double v20 = [(CACSpokenCommand *)v14 identifier];
                    [v42 setObject:v19 forKey:v20];
                  }
                  BOOL v21 = +[CACSpokenCommand stringFromContextEvaluationDictionary:v17 isCustom:0];
                  double v22 = [v5 objectForKey:v21];
                  if (!v22)
                  {
                    double v22 = objc_opt_new();
                    [v5 setObject:v22 forKey:v21];
                  }
                  [v22 addObject:v14];
                }
              }
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v6);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v23 = v5;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v24)
    {
      uint64_t v41 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v46 != v41) {
            objc_enumerationMutation(v23);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v27 = [v23 objectForKey:v26];
          uint64_t v28 = [v27 firstObject];
          BOOL v29 = [v28 identifier];
          BOOL v30 = [v42 objectForKey:v29];

          if ([(NSString *)v30 length]) {
            uint64_t v31 = (CACCommandRecognizer *)objc_alloc(NSClassFromString(v30));
          }
          else {
            uint64_t v31 = [CACCommandRecognizer alloc];
          }
          uint64_t v32 = v31;
          double v33 = [v27 firstObject];
          double v34 = [v33 contextEvaluation];
          double v35 = [(CACCommandRecognizer *)v32 initWithCommands:v27 contextEvaluators:v34 builtInLMIdentifiers:0];

          if (v35)
          {
            [(CACCommandRecognizer *)v35 setType:v26];
            double v36 = v43->_recognizers;
            objc_sync_enter(v36);
            [(NSMutableArray *)v43->_recognizers addObject:v35];
            objc_sync_exit(v36);
          }
        }
        uint64_t v24 = [v23 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v24);
    }

    double v37 = +[CACCommandRecognizerCustom customCommandRecognizers];
    if ([v37 count])
    {
      double v38 = v43->_recognizers;
      objc_sync_enter(v38);
      [(NSMutableArray *)v43->_recognizers addObjectsFromArray:v37];
      objc_sync_exit(v38);
    }
  }
}

- (void)_rebuildCommandRecognizers
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__CACSpokenCommandManager__rebuildCommandRecognizers__block_invoke;
  v3[3] = &unk_264D115D0;
  v3[4] = self;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v3];
  [(CACSpokenCommandManager *)self synchronizeRecognizersWithReason:kSRUISyncReasonRecognizersChanged];
}

uint64_t __53__CACSpokenCommandManager__rebuildCommandRecognizers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetRecognitionSystems];
}

- (void)_rebuildCustomCommandRecognizers
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __59__CACSpokenCommandManager__rebuildCustomCommandRecognizers__block_invoke;
  v3[3] = &unk_264D115D0;
  v3[4] = self;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v3];
  [(CACSpokenCommandManager *)self synchronizeRecognizersWithReason:kSRUISyncReasonRecognizersChanged];
}

void __59__CACSpokenCommandManager__rebuildCustomCommandRecognizers__block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 88);
  objc_sync_enter(v2);
  uint64_t v3 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 88);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v9 = [v8 speechRecognizer];
          [v9 closeSpeechRecognizer];

          [v3 addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = v3;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 88), "removeObject:", *(void *)(*((void *)&v16 + 1) + 8 * v13++), (void)v16);
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v11);
  }

  objc_sync_exit(v2);
  uint64_t v14 = +[CACCommandRecognizerCustom customCommandRecognizers];
  if ([v14 count])
  {
    id v15 = *(id *)(*(void *)(a1 + 32) + 88);
    objc_sync_enter(v15);
    [*(id *)(*(void *)(a1 + 32) + 88) addObjectsFromArray:v14];
    objc_sync_exit(v15);
  }
}

- (void)_markAsDirtyForBuiltInLMIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CACSpokenCommandManager__markAsDirtyForBuiltInLMIdentifier___block_invoke;
  v6[3] = &unk_264D117C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v6];
}

void __62__CACSpokenCommandManager__markAsDirtyForBuiltInLMIdentifier___block_invoke(uint64_t a1)
{
  obuint64_t j = *(id *)(*(void *)(a1 + 32) + 112);
  objc_sync_enter(obj);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 112) objectForKey:*(void *)(a1 + 40)];
  [v2 setIsCurrent:0];

  objc_sync_exit(obj);
}

- (id)languageModelForBuiltInLMIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_identifierBasedLanguageModelCache objectForKey:v4];
  id v7 = [v6 languageModel];

  objc_sync_exit(v5);
  return v7;
}

- (__RXLanguageObject)rxLanguageObjectForBuiltInLMIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v5);
  uint64_t v6 = [(NSMutableDictionary *)self->_identifierBasedLanguageModelCache objectForKey:v4];
  id v7 = (__RXLanguageObject *)[v6 rxLanguageObject];

  objc_sync_exit(v5);
  return v7;
}

- (void)_intializeBuiltInLMIdentifierTableIfNecessary
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v27 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v27);
  BOOL v30 = self;
  if (![(NSMutableDictionary *)self->_identifierBasedLanguageModelCache count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v4 = *MEMORY[0x263F78C58];
    v36[0] = *MEMORY[0x263F78C38];
    v36[1] = v4;
    uint64_t v5 = *MEMORY[0x263F78C30];
    v36[2] = *MEMORY[0x263F78C28];
    v36[3] = v5;
    uint64_t v6 = *MEMORY[0x263F78C00];
    v36[4] = *MEMORY[0x263F78BF8];
    v36[5] = v6;
    uint64_t v7 = *MEMORY[0x263F78C48];
    v36[6] = *MEMORY[0x263F78BF0];
    v36[7] = v7;
    uint64_t v8 = *MEMORY[0x263F78C20];
    v36[8] = *MEMORY[0x263F78C18];
    v36[9] = v8;
    uint64_t v9 = *MEMORY[0x263F78C08];
    v36[10] = *MEMORY[0x263F78C10];
    v36[11] = v9;
    id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:12];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v11)
    {
      obuint64_t j = v10;
      uint64_t v29 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v32 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v14 = objc_opt_new();
          id v15 = [CACLanguageModel alloc];
          int v16 = [v13 isEqualToString:*MEMORY[0x263F78C30]];
          if (v16)
          {
            id v2 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v13, kCACLanguageModelAttributeProxyIdentifier, 0);
            long long v17 = v2;
          }
          else
          {
            long long v17 = 0;
          }
          long long v18 = [(CACLanguageModel *)v15 initWithText:&stru_26EB332F0 identifier:0 attributes:v17];
          if (v16) {

          }
          long long v19 = [CACLanguageModel alloc];
          long long v20 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v13, kCACLanguageModelAttributeParameterIdentifier, 0);
          long long v21 = [(CACLanguageModel *)v19 initWithText:&stru_26EB332F0 identifier:v13 attributes:v20];

          [(CACLanguageModel *)v18 addChildLanguageModel:v21];
          [v14 setLanguageModel:v18];
          long long v22 = +[CACSpeechSystem speechSystem];
          long long v23 = (const void *)[v22 createRXLanguageObjectRefFromCACLanguageModel:v18 ignoreBuiltInLMTable:1];

          uint64_t v24 = *MEMORY[0x263F78C00];
          v35[0] = *MEMORY[0x263F78BF8];
          v35[1] = v24;
          v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
          char v26 = [v25 containsObject:v13];

          if ((v26 & 1) == 0) {
            RXObjectSetProperty();
          }
          [v14 setRxLanguageObject:v23];
          RXRelease(v23);
          [(NSMutableDictionary *)v30->_identifierBasedLanguageModelCache setObject:v14 forKey:v13];
        }
        id v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v11);
    }

    [(CACSpokenCommandManager *)v30 _updateLanguageModelForBuiltInLMIdentifier:*MEMORY[0x263F78BF0]];
    [(CACSpokenCommandManager *)v30 _updateLanguageModelForBuiltInLMIdentifier:*MEMORY[0x263F78C48]];
    [(CACSpokenCommandManager *)v30 _updateLanguageModelForBuiltInLMIdentifier:*MEMORY[0x263F78C18]];
    [(CACSpokenCommandManager *)v30 _updateLanguageModelForBuiltInLMIdentifier:*MEMORY[0x263F78C20]];
    [(CACSpokenCommandManager *)v30 _updateLanguageModelForBuiltInLMIdentifier:*MEMORY[0x263F78C10]];
    [(CACSpokenCommandManager *)v30 _updateLanguageModelForBuiltInLMIdentifier:*MEMORY[0x263F78C08]];
  }
  objc_sync_exit(v27);
}

- (void)_flushBuiltInLMIdentifierTable
{
  obuint64_t j = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_identifierBasedLanguageModelCache removeAllObjects];
  [(NSMutableDictionary *)self->_oldRXLangaugeObjects removeAllObjects];
  objc_sync_exit(obj);
}

- (void)_waitUntilElementsAreNumbered
{
  uint64_t v3 = +[CACDisplayManager sharedManager];
  uint64_t v4 = [v3 labeledElementsForItemNumbers];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    for (unint64_t i = 11; i > 1; --i)
    {
      if ([(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection areElementsNumbered])
      {
        break;
      }
      usleep(0x186A0u);
    }
  }
}

- (BOOL)_isNumberOnlyString:(id)a3 lessThanOrEqualToValue:(int64_t)a4
{
  id v5 = a3;
  int64_t v6 = [v5 integerValue];
  BOOL v7 = v6 >= 1 && v6 <= a4;
  if (v7 && (int64_t v8 = v6, [v5 length]))
  {
    uint64_t v9 = objc_opt_new();
    [v9 setNumberStyle:1];
    id v10 = (void *)MEMORY[0x263EFF960];
    uint64_t v11 = +[CACPreferences sharedPreferences];
    uint64_t v12 = [v11 bestLocaleIdentifier];
    uint64_t v13 = [v10 localeWithLocaleIdentifier:v12];

    if (v13)
    {
      [v9 setLocale:v13];
      uint64_t v14 = [NSNumber numberWithInteger:v8];
      id v15 = [v9 stringFromNumber:v14];

      char v16 = [v15 isEqualToString:v5];
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (void)_updateLanguageModelForBuiltInLMIdentifier:(id)a3
{
  uint64_t v441 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = self->_identifierBasedLanguageModelCache;
  objc_sync_enter(v5);
  v290 = v4;
  int64_t v6 = [(NSMutableDictionary *)self->_identifierBasedLanguageModelCache objectForKey:v4];
  BOOL v7 = v6;
  if (v6)
  {
    char v8 = [v6 isCurrent];

    objc_sync_exit(v5);
    if (v8) {
      goto LABEL_193;
    }
  }
  else
  {
    objc_sync_exit(v5);
  }
  v319 = self;
  uint64_t v9 = [CACLanguageModel alloc];
  id v10 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v290, kCACLanguageModelAttributeParameterIdentifier, 0);
  v320 = [(CACLanguageModel *)v9 initWithText:&stru_26EB332F0 identifier:v290 attributes:v10];

  if (![v290 isEqualToString:*MEMORY[0x263F78C58]])
  {
    if (([v290 isEqualToString:*MEMORY[0x263F78C28]] & 1) != 0
      || [v290 isEqualToString:*MEMORY[0x263F78C30]])
    {
      if (self->_externalContextOverrideTable)
      {
        long long v392 = 0u;
        long long v391 = 0u;
        long long v390 = 0u;
        long long v389 = 0u;
        long long v21 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v389 objects:v435 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v390;
          uint64_t v24 = *MEMORY[0x263EFFB40];
          v25 = (void *)MEMORY[0x263F78C68];
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v390 != v23) {
                objc_enumerationMutation(v21);
              }
              uint64_t v27 = *(void **)(*((void *)&v389 + 1) + 8 * i);
              if ([v27 length])
              {
                uint64_t v28 = [CACLanguageModel alloc];
                uint64_t v29 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v24, *v25, 0);
                BOOL v30 = [(CACLanguageModel *)v28 initWithText:v27 identifier:0 attributes:v29];

                [(CACLanguageModel *)v320 addChildLanguageModel:v30];
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v389 objects:v435 count:16];
          }
          while (v22);
        }

        goto LABEL_164;
      }
      double v39 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v40 = [v39 isActiveOverlayType:@"NumberedGrid"];

      if (v40)
      {
        long long v388 = 0u;
        long long v387 = 0u;
        long long v386 = 0u;
        long long v385 = 0u;
        uint64_t v41 = +[CACDisplayManager sharedManager];
        obuint64_t j = [v41 labeledElementsForGrid];

        uint64_t v42 = [obj countByEnumeratingWithState:&v385 objects:v434 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v386;
          uint64_t v44 = *MEMORY[0x263EFFB40];
          long long v45 = (void *)MEMORY[0x263F78C68];
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v386 != v43) {
                objc_enumerationMutation(obj);
              }
              long long v47 = *(void **)(*((void *)&v385 + 1) + 8 * j);
              long long v48 = [v47 numberedLabel];
              long long v49 = [CACLanguageModel alloc];
              long long v50 = NSDictionary;
              long long v51 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v47, kCACCommandParameterLabeledElement, 0);
              long long v52 = objc_msgSend(v50, "dictionaryWithObjectsAndKeys:", v51, kCACLanguageModelAttributeCommandParameters, v44, *v45, 0);
              CGRect v53 = [(CACLanguageModel *)v49 initWithText:v48 identifier:0 attributes:v52];

              [(CACLanguageModel *)v320 addChildLanguageModel:v53];
            }
            uint64_t v42 = [obj countByEnumeratingWithState:&v385 objects:v434 count:16];
          }
          while (v42);
        }
      }
      else
      {
        v94 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        int v95 = [v94 isActiveOverlayType:@"NumberedElements"];

        if (!v95) {
          goto LABEL_155;
        }
        v96 = [(CACSpokenCommandManager *)self disambiguationHandler];
        obuint64_t j = v96;
        if (v96) {
          [v96 labeledElements];
        }
        else {
        v137 = [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection collectedElements];
        }
        [(CACSpokenCommandManager *)self _waitUntilElementsAreNumbered];
        long long v384 = 0u;
        long long v383 = 0u;
        long long v382 = 0u;
        long long v381 = 0u;
        id v306 = v137;
        uint64_t v138 = [v306 countByEnumeratingWithState:&v381 objects:v433 count:16];
        if (v138)
        {
          uint64_t v139 = *(void *)v382;
          uint64_t v140 = *MEMORY[0x263EFFB40];
          v141 = (void *)MEMORY[0x263F78C68];
          do
          {
            for (uint64_t k = 0; k != v138; ++k)
            {
              if (*(void *)v382 != v139) {
                objc_enumerationMutation(v306);
              }
              v143 = *(void **)(*((void *)&v381 + 1) + 8 * k);
              v144 = [v143 numberedLabel];
              v145 = [CACLanguageModel alloc];
              v146 = NSDictionary;
              v147 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v143, kCACCommandParameterLabeledElement, 0);
              v148 = objc_msgSend(v146, "dictionaryWithObjectsAndKeys:", v147, kCACLanguageModelAttributeCommandParameters, v140, *v141, 0);
              v149 = [(CACLanguageModel *)v145 initWithText:v144 identifier:0 attributes:v148];

              [(CACLanguageModel *)v320 addChildLanguageModel:v149];
            }
            uint64_t v138 = [v306 countByEnumeratingWithState:&v381 objects:v433 count:16];
          }
          while (v138);
        }
      }
LABEL_155:
      v150 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int objg = [v150 isActiveOverlayType:@"NumberedElements"];
      v151 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v307 = [v151 isActiveOverlayType:@"NamedElements"];
      v152 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v302 = [v152 isActiveOverlayType:@"NumberedWords"];
      v153 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v298 = [v153 isActiveOverlayType:@"NumberedLines"];
      v154 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v155 = [v154 isActiveOverlayType:@"NumberedCharacters"];
      v156 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v157 = [v156 isActiveOverlayType:@"NumberedSentences"];
      v158 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v159 = [v158 isActiveOverlayType:@"NumberedParagraphs"];

      if (objg | v307 | v302 | v298 | v155 | v157 | v159)
      {
        v160 = +[CACDisplayManager sharedManager];
        v161 = [v160 labeledTextSegmentElements];

        long long v380 = 0u;
        long long v379 = 0u;
        long long v378 = 0u;
        long long v377 = 0u;
        id objc = v161;
        uint64_t v162 = [objc countByEnumeratingWithState:&v377 objects:v432 count:16];
        if (v162)
        {
          uint64_t v163 = *(void *)v378;
          uint64_t v164 = *MEMORY[0x263EFFB40];
          v165 = (void *)MEMORY[0x263F78C68];
          do
          {
            for (uint64_t m = 0; m != v162; ++m)
            {
              if (*(void *)v378 != v163) {
                objc_enumerationMutation(objc);
              }
              v167 = *(void **)(*((void *)&v377 + 1) + 8 * m);
              v168 = [v167 numberedLabel];
              v169 = [CACLanguageModel alloc];
              v170 = NSDictionary;
              v171 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v167, kCACCommandParameterLabeledElement, 0);
              v172 = objc_msgSend(v170, "dictionaryWithObjectsAndKeys:", v171, kCACLanguageModelAttributeCommandParameters, v164, *v165, 0);
              v173 = [(CACLanguageModel *)v169 initWithText:v168 identifier:0 attributes:v172];

              [(CACLanguageModel *)v320 addChildLanguageModel:v173];
            }
            uint64_t v162 = [objc countByEnumeratingWithState:&v377 objects:v432 count:16];
          }
          while (v162);
        }
      }
      goto LABEL_164;
    }
    if ([v290 isEqualToString:*MEMORY[0x263F78C38]])
    {
      if (self->_externalContextOverrideTable)
      {
        long long v376 = 0u;
        long long v375 = 0u;
        long long v374 = 0u;
        long long v373 = 0u;
        CGRect v54 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
        uint64_t v55 = [v54 countByEnumeratingWithState:&v373 objects:v431 count:16];
        if (v55)
        {
          uint64_t v56 = *(void *)v374;
          uint64_t v57 = *MEMORY[0x263EFFB40];
          long long v58 = (void *)MEMORY[0x263F78C68];
          do
          {
            for (uint64_t n = 0; n != v55; ++n)
            {
              if (*(void *)v374 != v56) {
                objc_enumerationMutation(v54);
              }
              long long v60 = *(void **)(*((void *)&v373 + 1) + 8 * n);
              if ([v60 length])
              {
                long long v61 = [CACLanguageModel alloc];
                long long v62 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v57, *v58, 0);
                long long v63 = [(CACLanguageModel *)v61 initWithText:v60 identifier:0 attributes:v62];

                [(CACLanguageModel *)v320 addChildLanguageModel:v63];
              }
            }
            uint64_t v55 = [v54 countByEnumeratingWithState:&v373 objects:v431 count:16];
          }
          while (v55);
        }
      }
      else
      {
        +[CACApplicationUtilities targetApplications];
        long long v372 = 0u;
        long long v370 = 0u;
        long long v371 = 0u;
        long long v369 = 0u;
        id objb = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v110 = [objb countByEnumeratingWithState:&v369 objects:v430 count:16];
        if (v110)
        {
          uint64_t v111 = *(void *)v370;
          uint64_t v112 = *MEMORY[0x263EFFB40];
          do
          {
            for (iuint64_t i = 0; ii != v110; ++ii)
            {
              if (*(void *)v370 != v111) {
                objc_enumerationMutation(objb);
              }
              v114 = *(void **)(*((void *)&v369 + 1) + 8 * ii);
              v115 = [v114 objectForKey:kCACCommandParameterAppName];
              v116 = [CACLanguageModel alloc];
              v117 = NSDictionary;
              v118 = [MEMORY[0x263EFF8C0] arrayWithObject:v114];
              v119 = objc_msgSend(v117, "dictionaryWithObjectsAndKeys:", v118, kCACCommandParameterMatchingApps, 0);
              v120 = objc_msgSend(v117, "dictionaryWithObjectsAndKeys:", v119, kCACLanguageModelAttributeCommandParameters, v112, *MEMORY[0x263F78C68], 0);
              v121 = [(CACLanguageModel *)v116 initWithText:v115 identifier:0 attributes:v120];

              [(CACLanguageModel *)v320 addChildLanguageModel:v121];
            }
            uint64_t v110 = [objb countByEnumeratingWithState:&v369 objects:v430 count:16];
          }
          while (v110);
        }

        if (![objb count])
        {
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000;
          v429 = 0;
          v368[0] = MEMORY[0x263EF8330];
          v368[1] = 3221225472;
          v368[2] = __70__CACSpokenCommandManager__updateLanguageModelForBuiltInLMIdentifier___block_invoke;
          v368[3] = &unk_264D11E38;
          v368[5] = buf;
          v368[4] = v319;
          v122 = (void *)MEMORY[0x23EC8F1E0](v368);
          uint64_t v123 = 10;
          int64_t v124 = 1000000000;
          do
          {
            dispatch_time_t v125 = dispatch_time(0, v124);
            v126 = [(CACSpokenCommandManager *)v319 recognizerSynchronizationDispatchQueue];
            dispatch_after(v125, v126, v122);

            v124 += 1000000000;
            --v123;
          }
          while (v123);

          _Block_object_dispose(buf, 8);
        }
      }
      goto LABEL_164;
    }
    v97 = (void *)MEMORY[0x263F78BF0];
    if ([v290 isEqualToString:*MEMORY[0x263F78BF0]])
    {
      v98 = [MEMORY[0x263F78BC8] deviceName];
      v99 = [[CACLanguageModel alloc] initWithText:v98 identifier:*v97 attributes:0];
      [(CACLanguageModel *)v320 addChildLanguageModel:v99];

      goto LABEL_164;
    }
    if ([v290 isEqualToString:*MEMORY[0x263F78C10]])
    {
      if (self->_externalContextOverrideTable)
      {
        long long v366 = 0u;
        long long v367 = 0u;
        long long v364 = 0u;
        long long v365 = 0u;
        v100 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
        uint64_t v101 = [v100 countByEnumeratingWithState:&v364 objects:v427 count:16];
        if (v101)
        {
          uint64_t v102 = *(void *)v365;
          uint64_t v103 = *MEMORY[0x263EFFB40];
          v104 = (void *)MEMORY[0x263F78C68];
          do
          {
            for (juint64_t j = 0; jj != v101; ++jj)
            {
              if (*(void *)v365 != v102) {
                objc_enumerationMutation(v100);
              }
              v106 = *(void **)(*((void *)&v364 + 1) + 8 * jj);
              if ([v106 length])
              {
                v107 = [CACLanguageModel alloc];
                v108 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v103, *v104, 0);
                v109 = [(CACLanguageModel *)v107 initWithText:v106 identifier:0 attributes:v108];

                [(CACLanguageModel *)v320 addChildLanguageModel:v109];
              }
            }
            uint64_t v101 = [v100 countByEnumeratingWithState:&v364 objects:v427 count:16];
          }
          while (v101);
        }

        goto LABEL_164;
      }
      v213 = [CACLanguageModel alloc];
      uint64_t v214 = *MEMORY[0x263EFFB40];
      v215 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263EFFB40], *MEMORY[0x263F78C68], 0);
      v286 = [(CACLanguageModel *)v213 initWithText:&stru_26EB332F0 identifier:0 attributes:v215];

      v284 = +[CACPreferences sharedPreferences];
      v282 = [v284 bestLocaleIdentifier];
      v425[0] = @"ModifierKeyName.Command";
      v216 = [NSNumber numberWithUnsignedInteger:1];
      v426[0] = v216;
      v425[1] = @"ModifierKeyName.Option";
      v217 = [NSNumber numberWithUnsignedInteger:2];
      v426[1] = v217;
      v425[2] = @"ModifierKeyName.Shift";
      v218 = [NSNumber numberWithUnsignedInteger:8];
      v426[2] = v218;
      v425[3] = @"ModifierKeyName.Control";
      v219 = [NSNumber numberWithUnsignedInteger:4];
      v426[3] = v219;
      v425[4] = @"ModifierKeyName.Caps Lock";
      v220 = [NSNumber numberWithUnsignedInteger:16];
      v426[4] = v220;
      v288 = [NSDictionary dictionaryWithObjects:v426 forKeys:v425 count:5];

      v221 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
      id v309 = [v221 dictionaryForLocaleIdentifier:v282 resourceFileName:@"ModifierKeyNames" resourceFileExtension:@"strings"];

      v222 = [CACLanguageModel alloc];
      v223 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v214, *MEMORY[0x263F78C60], 0);
      v292 = [(CACLanguageModel *)v222 initWithText:&stru_26EB332F0 identifier:0 attributes:v223];

      long long v362 = 0u;
      long long v363 = 0u;
      long long v360 = 0u;
      long long v361 = 0u;
      id v299 = [v288 allKeys];
      id obje = (id)[v299 countByEnumeratingWithState:&v360 objects:v424 count:16];
      if (!obje) {
        goto LABEL_233;
      }
      uint64_t v303 = *(void *)v361;
LABEL_208:
      uint64_t v224 = 0;
      while (1)
      {
        if (*(void *)v361 != v303) {
          objc_enumerationMutation(v299);
        }
        uint64_t v225 = *(void *)(*((void *)&v360 + 1) + 8 * v224);
        v226 = [v309 objectForKey:v225];
        if (![v226 length])
        {
          v228 = CACLogDictationCommands();
          if (os_log_type_enabled(v228, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v225;
            _os_log_impl(&dword_238377000, v228, OS_LOG_TYPE_DEFAULT, "Error loading modifier key name string: %@", buf, 0xCu);
          }
          goto LABEL_220;
        }
        id v359 = 0;
        v227 = [MEMORY[0x263F78BC8] languageModelDictionaryFromCommandText:v226 parsingErrorString:&v359];
        v228 = v359;
        if ([v228 length])
        {
          v229 = 0;
        }
        else
        {
          v229 = +[CACSpokenCommand languageModelFromCommandDictionary:v227 tokenResolution:0 containsBuiltInIdentifier:0 error:0];
          if (v229 && ![v228 length])
          {
            [v229 setIdentifier:v225];
            v231 = NSDictionary;
            v232 = [v288 objectForKey:v225];
            v233 = objc_msgSend(v231, "dictionaryWithObjectsAndKeys:", v232, kCACCommandParameterAXModifierFlag, 0);
            [v229 setObject:v233 forAttribute:kCACLanguageModelAttributeCommandParameters];

            long long v357 = 0u;
            long long v358 = 0u;
            long long v355 = 0u;
            long long v356 = 0u;
            v234 = [v229 children];
            uint64_t v235 = [v234 countByEnumeratingWithState:&v355 objects:v423 count:16];
            if (v235)
            {
              uint64_t v236 = *(void *)v356;
              do
              {
                for (kuint64_t k = 0; kk != v235; ++kk)
                {
                  if (*(void *)v356 != v236) {
                    objc_enumerationMutation(v234);
                  }
                  [*(id *)(*((void *)&v355 + 1) + 8 * kk) setIdentifier:v225];
                }
                uint64_t v235 = [v234 countByEnumeratingWithState:&v355 objects:v423 count:16];
              }
              while (v235);
            }

            [(CACLanguageModel *)v292 addChildLanguageModel:v229];
            goto LABEL_217;
          }
        }
        v230 = CACLogDictationCommands();
        if (os_log_type_enabled(v230, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v225;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v226;
          *(_WORD *)&buf[22] = 2112;
          v429 = v228;
          _os_log_impl(&dword_238377000, v230, OS_LOG_TYPE_DEFAULT, "Error parsing modifier key name: %@, '%@', %@", buf, 0x20u);
        }

LABEL_217:
LABEL_220:

        if ((id)++v224 == obje)
        {
          uint64_t v238 = [v299 countByEnumeratingWithState:&v360 objects:v424 count:16];
          id obje = (id)v238;
          if (!v238)
          {
LABEL_233:

            uint64_t v239 = 4;
            do
            {
              [(CACLanguageModel *)v286 addChildLanguageModel:v292];
              --v239;
            }
            while (v239);
            [(CACLanguageModel *)v320 addChildLanguageModel:v286];

            goto LABEL_164;
          }
          goto LABEL_208;
        }
      }
    }
    if (![v290 isEqualToString:*MEMORY[0x263F78C08]])
    {
      if ([v290 isEqualToString:*MEMORY[0x263F78C48]])
      {
        if (self->_externalContextOverrideTable)
        {
          long long v335 = 0u;
          long long v336 = 0u;
          long long v333 = 0u;
          long long v334 = 0u;
          v203 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
          uint64_t v204 = [v203 countByEnumeratingWithState:&v333 objects:v418 count:16];
          if (v204)
          {
            uint64_t v205 = *(void *)v334;
            uint64_t v206 = *MEMORY[0x263EFFB40];
            v207 = (void *)MEMORY[0x263F78C68];
            do
            {
              for (muint64_t m = 0; mm != v204; ++mm)
              {
                if (*(void *)v334 != v205) {
                  objc_enumerationMutation(v203);
                }
                v209 = *(void **)(*((void *)&v333 + 1) + 8 * mm);
                if ([v209 length])
                {
                  v210 = [CACLanguageModel alloc];
                  v211 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v206, *v207, 0);
                  v212 = [(CACLanguageModel *)v210 initWithText:v209 identifier:0 attributes:v211];

                  [(CACLanguageModel *)v320 addChildLanguageModel:v212];
                }
              }
              uint64_t v204 = [v203 countByEnumeratingWithState:&v333 objects:v418 count:16];
            }
            while (v204);
          }
        }
        else
        {
          for (nuint64_t n = 2; nn != 101; ++nn)
          {
            v273 = [(CACSpokenCommandManager *)v319 _stringInRecognitionLocaleFormatFromIntegerValue:nn];
            v274 = [[CACLanguageModel alloc] initWithText:v273 identifier:0 attributes:0];
            [(CACLanguageModel *)v320 addChildLanguageModel:v274];
          }
        }
      }
      else if (([v290 isEqualToString:*MEMORY[0x263F78C18]] & 1) != 0 {
             || [v290 isEqualToString:*MEMORY[0x263F78C20]])
      }
      {
        if (self->_externalContextOverrideTable)
        {
          long long v331 = 0u;
          long long v332 = 0u;
          long long v329 = 0u;
          long long v330 = 0u;
          v240 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
          uint64_t v241 = [v240 countByEnumeratingWithState:&v329 objects:v417 count:16];
          if (v241)
          {
            uint64_t v242 = *(void *)v330;
            uint64_t v243 = *MEMORY[0x263EFFB40];
            v244 = (void *)MEMORY[0x263F78C68];
            do
            {
              for (uint64_t i1 = 0; i1 != v241; ++i1)
              {
                if (*(void *)v330 != v242) {
                  objc_enumerationMutation(v240);
                }
                v246 = *(void **)(*((void *)&v329 + 1) + 8 * i1);
                if ([v246 length])
                {
                  v247 = [CACLanguageModel alloc];
                  v248 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v243, *v244, 0);
                  v249 = [(CACLanguageModel *)v247 initWithText:v246 identifier:0 attributes:v248];

                  [(CACLanguageModel *)v320 addChildLanguageModel:v249];
                }
              }
              uint64_t v241 = [v240 countByEnumeratingWithState:&v329 objects:v417 count:16];
            }
            while (v241);
          }
        }
        else
        {
          for (uint64_t i2 = 2; i2 != 100; ++i2)
          {
            v276 = [(CACSpokenCommandManager *)v319 _stringInRecognitionLocaleFormatFromIntegerValue:i2];
            v277 = [[CACLanguageModel alloc] initWithText:v276 identifier:0 attributes:0];
            [(CACLanguageModel *)v320 addChildLanguageModel:v277];
          }
        }
      }
      goto LABEL_164;
    }
    if (self->_externalContextOverrideTable)
    {
      long long v353 = 0u;
      long long v354 = 0u;
      long long v351 = 0u;
      long long v352 = 0u;
      v127 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
      uint64_t v128 = [v127 countByEnumeratingWithState:&v351 objects:v422 count:16];
      if (v128)
      {
        uint64_t v129 = *(void *)v352;
        uint64_t v130 = *MEMORY[0x263EFFB40];
        v131 = (void *)MEMORY[0x263F78C68];
        do
        {
          for (uint64_t i3 = 0; i3 != v128; ++i3)
          {
            if (*(void *)v352 != v129) {
              objc_enumerationMutation(v127);
            }
            v133 = *(void **)(*((void *)&v351 + 1) + 8 * i3);
            if ([v133 length])
            {
              v134 = [CACLanguageModel alloc];
              v135 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v130, *v131, 0);
              v136 = [(CACLanguageModel *)v134 initWithText:v133 identifier:0 attributes:v135];

              [(CACLanguageModel *)v320 addChildLanguageModel:v136];
            }
          }
          uint64_t v128 = [v127 countByEnumeratingWithState:&v351 objects:v422 count:16];
        }
        while (v128);
      }

      goto LABEL_164;
    }
    v280 = +[CACPreferences sharedPreferences];
    v278 = [v280 builtInCommandsTable];
    v279 = [v280 bestLocaleIdentifier];
    v289 = [v278 objectForKey:@"KeyboardKeyProperties"];
    v250 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
    v304 = [v250 dictionaryForLocaleIdentifier:v279 resourceFileName:@"KeyboardKeyNames" resourceFileExtension:@"strings"];

    v251 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
    v252 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v285 = [v251 dictionaryForLocaleIdentifier:v279 bundle:v252 subDirectory:@"LocalizedPhoneticAlphabet" rootFileName:@"PhoneticAlphabet" rootFileExtension:@"plist"];

    long long v349 = 0u;
    long long v350 = 0u;
    long long v347 = 0u;
    long long v348 = 0u;
    v296 = [v289 allKeys];
    id v310 = (id)[v296 countByEnumeratingWithState:&v347 objects:v421 count:16];
    if (!v310)
    {
LABEL_291:

      goto LABEL_164;
    }
    id v300 = *(id *)v348;
LABEL_251:
    uint64_t v253 = 0;
    while (1)
    {
      if (*(id *)v348 != v300) {
        objc_enumerationMutation(v296);
      }
      uint64_t v254 = *(void *)(*((void *)&v347 + 1) + 8 * v253);
      v255 = [v304 objectForKey:v254];
      if (!v255) {
        goto LABEL_260;
      }
      id v346 = 0;
      v256 = [MEMORY[0x263F78BC8] languageModelDictionaryFromCommandText:v255 parsingErrorString:&v346];
      v257 = v346;
      if ([v257 length]
        || (+[CACSpokenCommand languageModelFromCommandDictionary:v256 tokenResolution:0 containsBuiltInIdentifier:0 error:0], (id objf = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        id objf = 0;
LABEL_257:
        v258 = CACLogDictationCommands();
        if (os_log_type_enabled(v258, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&buf[4] = v254;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v255;
          *(_WORD *)&buf[22] = 2112;
          v429 = v257;
          _os_log_impl(&dword_238377000, v258, OS_LOG_TYPE_DEFAULT, "Error parsing keyboard key name: %@, '%@', %@", buf, 0x20u);
        }
        goto LABEL_259;
      }
      if ([v257 length]) {
        goto LABEL_257;
      }
      [objf setIdentifier:v254];
      v259 = [v289 objectForKey:v254];
      [objf setObject:v259 forAttribute:kCACLanguageModelAttributeCommandParameters];

      long long v344 = 0u;
      long long v345 = 0u;
      long long v342 = 0u;
      long long v343 = 0u;
      v260 = [objf children];
      uint64_t v261 = [v260 countByEnumeratingWithState:&v342 objects:v420 count:16];
      if (v261)
      {
        uint64_t v262 = *(void *)v343;
        do
        {
          for (uint64_t i4 = 0; i4 != v261; ++i4)
          {
            if (*(void *)v343 != v262) {
              objc_enumerationMutation(v260);
            }
            [*(id *)(*((void *)&v342 + 1) + 8 * i4) setIdentifier:v254];
          }
          uint64_t v261 = [v260 countByEnumeratingWithState:&v342 objects:v420 count:16];
        }
        while (v261);
      }

      [(CACLanguageModel *)v320 addChildLanguageModel:objf];
      v264 = [v285 objectForKey:@"PhoneticPronunciationMapping"];
      v258 = v264;
      if (v264) {
        break;
      }
LABEL_259:

LABEL_260:
      if ((id)++v253 == v310)
      {
        uint64_t v271 = [v296 countByEnumeratingWithState:&v347 objects:v421 count:16];
        id v310 = (id)v271;
        if (!v271) {
          goto LABEL_291;
        }
        goto LABEL_251;
      }
    }
    v293 = [v264 objectForKey:v254];
    if (![v293 length])
    {
LABEL_279:

      goto LABEL_259;
    }
    id v341 = 0;
    v281 = [MEMORY[0x263F78BC8] languageModelDictionaryFromCommandText:v293 parsingErrorString:&v341];
    v283 = v341;
    if ([v283 length]
      || (+[CACSpokenCommand languageModelFromCommandDictionary:v281 tokenResolution:0 containsBuiltInIdentifier:0 error:0], (v287 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v287 = 0;
    }
    else if (![v283 length])
    {
      [v287 setIdentifier:v254];
      v266 = [v289 objectForKey:v254];
      [v287 setObject:v266 forAttribute:kCACLanguageModelAttributeCommandParameters];

      long long v339 = 0u;
      long long v340 = 0u;
      long long v337 = 0u;
      long long v338 = 0u;
      v267 = [v287 children];
      uint64_t v268 = [v267 countByEnumeratingWithState:&v337 objects:v419 count:16];
      if (v268)
      {
        uint64_t v269 = *(void *)v338;
        do
        {
          for (uint64_t i5 = 0; i5 != v268; ++i5)
          {
            if (*(void *)v338 != v269) {
              objc_enumerationMutation(v267);
            }
            [*(id *)(*((void *)&v337 + 1) + 8 * i5) setIdentifier:v254];
          }
          uint64_t v268 = [v267 countByEnumeratingWithState:&v337 objects:v419 count:16];
        }
        while (v268);
      }

      [(CACLanguageModel *)v320 addChildLanguageModel:v287];
LABEL_278:

      goto LABEL_279;
    }
    v265 = CACLogDictationCommands();
    if (os_log_type_enabled(v265, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v254;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v293;
      *(_WORD *)&buf[22] = 2112;
      v429 = v283;
      _os_log_impl(&dword_238377000, v265, OS_LOG_TYPE_DEFAULT, "Error parsing phonetic key name: %@, '%@', %@", buf, 0x20u);
    }

    goto LABEL_278;
  }
  if (!self->_externalContextOverrideTable)
  {
    id v294 = [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection copyTableOfCollectedElementsByTitle];
    id v297 = [MEMORY[0x263EFF9C0] set];
    long long v31 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    if ([v31 isActiveOverlayType:@"NumberedElements"])
    {
      long long v32 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v33 = [v32 doesFocusedElementRequireSecureInput];

      if (v33)
      {
        long long v408 = 0u;
        long long v407 = 0u;
        long long v406 = 0u;
        long long v405 = 0u;
        long long v34 = [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection collectedElements];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v405 objects:v439 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v406;
          do
          {
            for (uint64_t i6 = 0; i6 != v35; ++i6)
            {
              if (*(void *)v406 != v36) {
                objc_enumerationMutation(v34);
              }
              uint64_t v38 = [*(id *)(*((void *)&v405 + 1) + 8 * i6) numberedLabel];
              if ([v38 length]) {
                [v297 addObject:v38];
              }
            }
            uint64_t v35 = [v34 countByEnumeratingWithState:&v405 objects:v439 count:16];
          }
          while (v35);
        }
      }
    }
    else
    {
    }
    long long v404 = 0u;
    long long v403 = 0u;
    long long v402 = 0u;
    long long v401 = 0u;
    long long v64 = [v294 allKeys];
    v295 = [v64 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    id obja = (id)[v295 countByEnumeratingWithState:&v401 objects:v438 count:16];
    if (!obja)
    {
LABEL_103:

      goto LABEL_164;
    }
    id v305 = *(id *)v402;
    uint64_t v291 = *MEMORY[0x263EFFB40];
LABEL_66:
    uint64_t v65 = 0;
    while (1)
    {
      if (*(id *)v402 != v305) {
        objc_enumerationMutation(v295);
      }
      v66 = *(void **)(*((void *)&v401 + 1) + 8 * v65);
      if (![v66 length]) {
        goto LABEL_101;
      }
      v67 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v68 = [v67 isActiveOverlayType:@"NumberedGrid"];

      if (v68)
      {
        v69 = +[CACDisplayManager sharedManager];
        uint64_t v70 = [v69 labeledElementsForGrid];
        uint64_t v71 = [v70 count];

        if (v71 >= 1
          && [(CACSpokenCommandManager *)v319 _isNumberOnlyString:v66 lessThanOrEqualToValue:v71])
        {
          goto LABEL_101;
        }
      }
      if ([v297 containsObject:v66]) {
        goto LABEL_101;
      }
      v72 = [v294 objectForKey:v66];
      if ([v72 count])
      {
        v301 = [v72 objectAtIndex:0];
      }
      else
      {
        v301 = 0;
      }
      long long v400 = 0u;
      long long v399 = 0u;
      long long v398 = 0u;
      long long v397 = 0u;
      id v73 = v72;
      uint64_t v74 = 0;
      uint64_t v75 = [v73 countByEnumeratingWithState:&v397 objects:v437 count:16];
      if (v75)
      {
        uint64_t v76 = *(void *)v398;
        do
        {
          for (uint64_t i7 = 0; i7 != v75; ++i7)
          {
            if (*(void *)v398 != v76) {
              objc_enumerationMutation(v73);
            }
            v78 = [*(id *)(*((void *)&v397 + 1) + 8 * i7) axIdentifier];
            unsigned int v79 = [v78 hasPrefix:@"_CAC_NUMBERED_ONLY_ELEMENT_"];

            v74 += v79;
          }
          uint64_t v75 = [v73 countByEnumeratingWithState:&v397 objects:v437 count:16];
        }
        while (v75);
      }

      long long v396 = 0u;
      long long v395 = 0u;
      long long v394 = 0u;
      long long v393 = 0u;
      v80 = [v301 recognitionStrings];
      uint64_t v81 = [v80 countByEnumeratingWithState:&v393 objects:v436 count:16];
      if (v81)
      {
        uint64_t v82 = *(void *)v394;
        while (2)
        {
          for (uint64_t i8 = 0; i8 != v81; ++i8)
          {
            if (*(void *)v394 != v82) {
              objc_enumerationMutation(v80);
            }
            v84 = *(void **)(*((void *)&v393 + 1) + 8 * i8);
            if (![v84 caseInsensitiveCompare:v66])
            {
              id v85 = v84;
              goto LABEL_94;
            }
          }
          uint64_t v81 = [v80 countByEnumeratingWithState:&v393 objects:v436 count:16];
          if (v81) {
            continue;
          }
          break;
        }
      }
      id v85 = 0;
LABEL_94:

      if ([v85 length])
      {
        if ([v73 count] - v74 == 1)
        {
          v86 = [CACLanguageModel alloc];
          v87 = NSDictionary;
          v88 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v301, kCACCommandParameterLabeledElement, 0);
          v89 = objc_msgSend(v87, "dictionaryWithObjectsAndKeys:", v88, kCACLanguageModelAttributeCommandParameters, v291, *MEMORY[0x263F78C68], 0);
          uint64_t v90 = [(CACLanguageModel *)v86 initWithText:v85 identifier:0 attributes:v89];
LABEL_99:
          v93 = (void *)v90;

          [(CACLanguageModel *)v320 addChildLanguageModel:v93];
          goto LABEL_100;
        }
        if ((unint64_t)([v73 count] - v74) >= 2)
        {
          v91 = [CACLanguageModel alloc];
          v92 = NSDictionary;
          v88 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v301, kCACCommandParameterLabeledElementForDisambiguation, 0);
          v89 = objc_msgSend(v92, "dictionaryWithObjectsAndKeys:", v88, kCACLanguageModelAttributeCommandParameters, v291, *MEMORY[0x263F78C68], 0);
          uint64_t v90 = [(CACLanguageModel *)v91 initWithText:v85 identifier:0 attributes:v89];
          goto LABEL_99;
        }
      }
LABEL_100:

LABEL_101:
      if ((id)++v65 == obja)
      {
        id obja = (id)[v295 countByEnumeratingWithState:&v401 objects:v438 count:16];
        if (!obja) {
          goto LABEL_103;
        }
        goto LABEL_66;
      }
    }
  }
  long long v412 = 0u;
  long long v411 = 0u;
  long long v410 = 0u;
  long long v409 = 0u;
  uint64_t v11 = [(CACSpokenCommandManager *)self _arrayFromExternalContextOverrideForBuiltInIdentifier:v290];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v409 objects:v440 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v410;
    uint64_t v14 = *MEMORY[0x263EFFB40];
    id v15 = (void *)MEMORY[0x263F78C68];
    do
    {
      for (uint64_t i9 = 0; i9 != v12; ++i9)
      {
        if (*(void *)v410 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v17 = *(void **)(*((void *)&v409 + 1) + 8 * i9);
        if ([v17 length])
        {
          long long v18 = [CACLanguageModel alloc];
          long long v19 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v14, *v15, 0);
          long long v20 = [(CACLanguageModel *)v18 initWithText:v17 identifier:0 attributes:v19];

          [(CACLanguageModel *)v320 addChildLanguageModel:v20];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v409 objects:v440 count:16];
    }
    while (v12);
  }

LABEL_164:
  v308 = v319->_identifierBasedLanguageModelCache;
  objc_sync_enter(v308);
  v174 = +[CACSpeechSystem speechSystem];
  id objd = (id)[v174 createRXLanguageObjectRefFromCACLanguageModel:v320 ignoreBuiltInLMTable:1];

  if (objd)
  {
    v416 = v290;
    v175 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v416 count:1];
    char v176 = [v290 isEqualToString:*MEMORY[0x263F78C28]];
    v177 = (void *)MEMORY[0x263F78C28];
    if ((v176 & 1) != 0 || [v290 isEqualToString:*MEMORY[0x263F78C30]])
    {
      uint64_t v178 = *MEMORY[0x263F78C30];
      v415[0] = *v177;
      v415[1] = v178;
      uint64_t v179 = [MEMORY[0x263EFF8C0] arrayWithObjects:v415 count:2];

      v175 = (void *)v179;
    }
    long long v327 = 0u;
    long long v328 = 0u;
    long long v325 = 0u;
    long long v326 = 0u;
    id v180 = v175;
    uint64_t v181 = [v180 countByEnumeratingWithState:&v325 objects:v414 count:16];
    if (v181)
    {
      uint64_t v182 = *(void *)v326;
      do
      {
        for (uint64_t i10 = 0; i10 != v181; ++i10)
        {
          if (*(void *)v326 != v182) {
            objc_enumerationMutation(v180);
          }
          v184 = [(NSMutableDictionary *)v319->_identifierBasedLanguageModelCache objectForKey:*(void *)(*((void *)&v325 + 1) + 8 * i10)];
          v185 = v184;
          if (v184)
          {
            [v184 setIsCurrent:1];
            v186 = [v185 languageModel];
            [v185 rxLanguageObject];
            [v186 removeAllChildren];
            [v186 addChildLanguageModel:v320];
            if (RXLanguageObjectGetCount() < 1)
            {
              RXLanguageObjectAddObject();
            }
            else
            {
              v187 = [[CACRXLanguageObjectWrapper alloc] initWithRXLanguageObject:RXLanguageObjectGetObjectAtIndex()];
              if (v187)
              {
                oldRXLangaugeObjects = v319->_oldRXLangaugeObjects;
                v189 = NSString;
                [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
                v191 = objc_msgSend(v189, "stringWithFormat:", @"%f", v190);
                [(NSMutableDictionary *)oldRXLangaugeObjects setObject:v187 forKey:v191];

                RXLanguageObjectSetObjectAtIndex();
              }
            }
          }
        }
        uint64_t v181 = [v180 countByEnumeratingWithState:&v325 objects:v414 count:16];
      }
      while (v181);
    }

    RXRelease(objd);
  }
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double v193 = v192;
  v194 = [(NSMutableDictionary *)v319->_oldRXLangaugeObjects allKeys];
  v195 = (void *)[v194 copy];

  long long v323 = 0u;
  long long v324 = 0u;
  long long v321 = 0u;
  long long v322 = 0u;
  id v196 = v195;
  uint64_t v197 = [v196 countByEnumeratingWithState:&v321 objects:v413 count:16];
  if (v197)
  {
    uint64_t v198 = *(void *)v322;
    double v199 = v193 + -60.0;
    do
    {
      for (uint64_t i11 = 0; i11 != v197; ++i11)
      {
        if (*(void *)v322 != v198) {
          objc_enumerationMutation(v196);
        }
        v201 = *(void **)(*((void *)&v321 + 1) + 8 * i11);
        [v201 doubleValue];
        if (v202 < v199) {
          [(NSMutableDictionary *)v319->_oldRXLangaugeObjects removeObjectForKey:v201];
        }
      }
      uint64_t v197 = [v196 countByEnumeratingWithState:&v321 objects:v413 count:16];
    }
    while (v197);
  }

  objc_sync_exit(v308);
LABEL_193:
}

void __70__CACSpokenCommandManager__updateLanguageModelForBuiltInLMIdentifier___block_invoke(uint64_t a1)
{
  id v2 = +[CACApplicationUtilities targetApplications];
  uint64_t v3 = [v2 count];

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v4 + 24) != v3)
  {
    *(void *)(v4 + 24) = v3;
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *MEMORY[0x263F78C38];
    [v5 forceSynchronizeRecognizersForBuiltInLMIdentifier:v6];
  }
}

- (id)_arrayFromExternalContextOverrideForBuiltInIdentifier:(id)a3
{
  externalContextOverrideTable = self->_externalContextOverrideTable;
  id v5 = a3;
  uint64_t v6 = [(NSDictionary *)externalContextOverrideTable objectForKey:@"CommandParameters"];
  BOOL v7 = [v6 objectForKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [(NSDictionary *)self->_externalContextOverrideTable objectForKey:@"CommandParameters"];
    id v9 = [v8 objectForKey:v7];
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

- (id)labeledElementsFromScreenWithTitle:(id)a3
{
  return [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection collectedElementsWithTitle:a3];
}

- (id)labeledElementsFromScreenWithTrait:(unint64_t)a3
{
  return [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection collectedElementsWithTrait:a3];
}

- (id)labeledElementsFromScreen
{
  return [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection collectedElements];
}

- (id)_stringInRecognitionLocaleFormatFromIntegerValue:(int64_t)a3
{
  uint64_t v4 = objc_opt_new();
  [v4 setNumberStyle:1];
  id v5 = (void *)MEMORY[0x263EFF960];
  uint64_t v6 = +[CACPreferences sharedPreferences];
  BOOL v7 = [v6 bestLocaleIdentifier];
  char v8 = [v5 localeWithLocaleIdentifier:v7];

  if (v8) {
    [v4 setLocale:v8];
  }
  id v9 = [NSNumber numberWithInteger:a3];
  id v10 = [v4 stringFromNumber:v9];

  return v10;
}

- (unsigned)currentInteractionLevel
{
  return [(CACSpokenCommandManager *)self currentInteractionLevelPassingBackTopReferencingObject:0];
}

- (unsigned)currentInteractionLevelPassingBackTopReferencingObject:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = self->_recognizerInteractionLevels;
  objc_sync_enter(v4);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [(NSMutableDictionary *)self->_recognizerInteractionLevels allKeys];
  unsigned int v6 = 0;
  BOOL v7 = 0;
  uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        unsigned int v12 = [v11 intValue];
        if (v12 > v6)
        {
          uint64_t v13 = [(NSMutableDictionary *)self->_recognizerInteractionLevels objectForKey:v11];
          uint64_t v14 = [v13 lastObject];

          unsigned int v6 = v12;
          BOOL v7 = (void *)v14;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  if (a3) {
    *a3 = v7;
  }
  objc_sync_exit(v4);

  return v6;
}

- (BOOL)_pushInteractionLevel:(unsigned int)a3 referencingObject:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6)
  {
    BOOL v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v4);
    uint64_t v8 = self->_recognizerInteractionLevels;
    objc_sync_enter(v8);
    uint64_t v9 = [(NSMutableDictionary *)self->_recognizerInteractionLevels objectForKey:v7];
    BOOL v10 = v9 == 0;
    uint64_t v11 = (void *)v9;
    if (!v9)
    {
      uint64_t v11 = [MEMORY[0x263EFF980] array];
      [(NSMutableDictionary *)self->_recognizerInteractionLevels setObject:v11 forKey:v7];
    }
    [v11 addObject:v6];

    objc_sync_exit(v8);
    if (!v9)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__CACSpokenCommandManager__pushInteractionLevel_referencingObject___block_invoke;
      block[3] = &unk_264D115D0;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
      [(CACSpokenCommandManager *)self forceElementFetchWithReason:@"Interaction pushInteractionLevel"];
      [(CACSpokenCommandManager *)self updateStatusIndicatorView];
      unsigned int v12 = CACLogRecognition();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CACSpokenCommandManager _pushInteractionLevel:referencingObject:](v4, v12);
      }

      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v7 = CACLogRecognition();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CACSpokenCommandManager _pushInteractionLevel:referencingObject:]();
    }
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __67__CACSpokenCommandManager__pushInteractionLevel_referencingObject___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelAnyTransientOverlay];
}

- (BOOL)_popInteractionLevel:(unsigned int)a3 referencingObject:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a4;
  BOOL v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", v4);
  uint64_t v8 = self->_recognizerInteractionLevels;
  objc_sync_enter(v8);
  uint64_t v9 = [(NSMutableDictionary *)self->_recognizerInteractionLevels objectForKey:v7];
  if ((unint64_t)[v9 count] < 2)
  {
    if ([v9 count] == 1) {
      [v9 removeLastObject];
    }
  }
  else
  {
    int v18 = v4;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
LABEL_4:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        if ([v14 isEqual:v6]) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v15 = v14;

      LODWORD(v4) = v18;
      if (!v15) {
        goto LABEL_15;
      }
      [v10 removeObject:v15];
    }
    else
    {
LABEL_10:

      LODWORD(v4) = v18;
LABEL_15:
      [v10 removeLastObject];
      id v15 = 0;
    }
  }
  uint64_t v16 = [v9 count];
  if (v16)
  {

    objc_sync_exit(v8);
  }
  else
  {
    [(NSMutableDictionary *)self->_recognizerInteractionLevels removeObjectForKey:v7];

    objc_sync_exit(v8);
    [(CACSpokenCommandManager *)self forceElementFetchWithReason:@"Interaction popInteractionLevel"];
    [(CACSpokenCommandManager *)self updateStatusIndicatorView];
    CACLogRecognition();
    uint64_t v8 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v8->super.super, OS_LOG_TYPE_ERROR)) {
      -[CACSpokenCommandManager _popInteractionLevel:referencingObject:](v4, &v8->super.super);
    }
  }

  return v16 == 0;
}

- (void)_resetInteractionLevel
{
  obuint64_t j = self->_recognizerInteractionLevels;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)self->_recognizerInteractionLevels removeAllObjects];
  objc_sync_exit(obj);
}

- (void)setDictationRecognizerMode:(int)a3
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  int dictationRecognizerMode = v4->_dictationRecognizerMode;
  if (dictationRecognizerMode != 1) {
    v4->_attentionAwarePreviousDictationRecognizerMode = dictationRecognizerMode;
  }
  v4->_int dictationRecognizerMode = a3;
  objc_sync_exit(v4);

  uint64_t v6 = kSRUISyncReasonRecognizerModeChanged;
  [(CACSpokenCommandManager *)v4 synchronizeRecognizersWithReason:v6];
}

- (int)dictationRecognizerMode
{
  id v2 = self;
  objc_sync_enter(v2);
  int dictationRecognizerMode = v2->_dictationRecognizerMode;
  objc_sync_exit(v2);

  return dictationRecognizerMode;
}

- (void)enterSleepInteractionLevel
{
  if ([(CACSpokenCommandManager *)self _pushInteractionLevel:1 referencingObject:self])
  {
    id v2 = +[CACUserHintsManager sharedManager];
    int v3 = [v2 shouldDisplayUserHintAfterRegisteringIdentifier:@"EnteringCommandSleep"];

    if (v3)
    {
      uint64_t v4 = NSString;
      id v5 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.EnteringCommandSleep"];
      uint64_t v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      BOOL v7 = [v6 primaryStringForCommandIdentifier:@"System.WakeListening"];
      id v9 = [v4 stringWithValidatedFormat:v5, @"%@", 0, v7 validFormatSpecifiers error];

      uint64_t v8 = +[CACDisplayManager sharedManager];
      [v8 displayMessageString:v9 type:0];
    }
  }
}

- (void)exitSleepInteractionLevel
{
}

- (BOOL)_telephonyRequiresAirPods
{
  return MGGetBoolAnswer() ^ 1;
}

- (id)_telephonyQueue
{
  if (_telephonyQueue_onceToken != -1) {
    dispatch_once(&_telephonyQueue_onceToken, &__block_literal_global_570);
  }
  id v2 = (void *)_telephonyQueue_sQueue;
  return v2;
}

uint64_t __42__CACSpokenCommandManager__telephonyQueue__block_invoke()
{
  _telephonyQueue_sQueue = (uint64_t)dispatch_queue_create("com.apple.speech.CallCenterQueue", 0);
  return MEMORY[0x270F9A758]();
}

- (void)_microphoneTurnedOffAfterInteruption
{
  if (self->_initialListenRequestWasSuccessful)
  {
    if ([(CACSpokenCommandManager *)self currentInteractionLevel] == 2)
    {
      int v3 = CACLogAudio();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_238377000, v3, OS_LOG_TYPE_INFO, "Received excessive notification of audio loss!", v8, 2u);
      }
    }
    else
    {
      uint64_t v4 = (void *)MEMORY[0x263F7E1A0];
      id v5 = [(CACSpokenCommandManager *)self _telephonyQueue];
      uint64_t v6 = [v4 callCenterWithQueue:v5];

      BOOL v7 = [(CACSpokenCommandManager *)self _telephonyQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_3;
      block[3] = &unk_264D117C0;
      void block[4] = self;
      id v10 = v6;
      int v3 = v6;
      dispatch_async(v7, block);

      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_574);
    }

    [(CACSpokenCommandManager *)self _pushInteractionLevel:2 referencingObject:self];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke;
    v11[3] = &unk_264D115D0;
    v11[4] = self;
    if (_microphoneTurnedOffAfterInteruption_sRetryMicToken != -1) {
      dispatch_once(&_microphoneTurnedOffAfterInteruption_sRetryMicToken, v11);
    }
  }
}

void __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_2;
  block[3] = &unk_264D115D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) displayRetryMessageAndRetryGrabbingMic];
}

void __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 40) incomingCall];
  if (v4)
  {
    [*(id *)(a1 + 32) setTelephonyInterruptedListening:1];
  }
  else
  {
    id v2 = [*(id *)(a1 + 40) incomingVideoCall];
    if (v2) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = [*(id *)(a1 + 40) hasCurrentCalls];
    }
    [*(id *)(a1 + 32) setTelephonyInterruptedListening:v3];
  }
}

void __63__CACSpokenCommandManager__microphoneTurnedOffAfterInteruption__block_invoke_4()
{
  id v1 = +[CACDisplayManager sharedManager];
  v0 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ListeningInterruptionBegan"];
  [v1 displayMessageString:v0 type:1];
}

- (void)_microphoneTurnedOnAfterInteruption
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  char v4 = [v3 _attentionIsLostWithListeningOffAction];

  if ((v4 & 1) == 0)
  {
    [(CACSpokenCommandManager *)self _popInteractionLevel:2 referencingObject:self];
  }
}

- (void)_microphoneTurnedOn
{
  if (!self->_initialListenRequestWasSuccessful) {
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  }
  self->_initialListenRequestWasSuccessful = 1;
  [(CACSpokenCommandManager *)self updateStatusIndicatorView];
}

- (BOOL)_attentionIsLostWithListeningOffAction
{
  return self->_attentionAwareStatus == 2
      && [(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"ListeningOffAndOn"];
}

- (void)displayRetryMessageAndRetryGrabbingMic
{
}

- (void)attemptGrabbingMic:(id)a3
{
  uint64_t v4 = [a3 integerValue];
  if (self->_initialListenRequestWasSuccessful)
  {
    id v5 = (void *)MEMORY[0x263F8C6D0];
    [v5 cancelPreviousPerformRequestsWithTarget:self];
  }
  else
  {
    uint64_t v6 = v4;
    double v7 = (double)v4 * 10.0;
    if (v7 <= 80.0)
    {
      if (!v4) {
        [(CACSpokenCommandManager *)self displayRetryMessage];
      }
      if (v7 <= 80.0 && !self->_initialListenRequestWasSuccessful)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __46__CACSpokenCommandManager_attemptGrabbingMic___block_invoke;
        v9[3] = &unk_264D115D0;
        v9[4] = self;
        [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v9];
        uint64_t v8 = [NSNumber numberWithInteger:v6 + 1];
        [(CACSpokenCommandManager *)self performSelector:sel_attemptGrabbingMic_ withObject:v8 afterDelay:10.0];
      }
    }
    else
    {
      [(CACSpokenCommandManager *)self displayMessageAndQuitVoiceControl];
    }
  }
}

uint64_t __46__CACSpokenCommandManager_attemptGrabbingMic___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetRecognitionSystems];
}

- (void)displayRetryMessage
{
}

void __46__CACSpokenCommandManager_displayRetryMessage__block_invoke()
{
  id v1 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.MicrophoneBusy"];
  v0 = +[CACDisplayManager sharedManager];
  [v0 displayMessageString:v1 type:0];
}

- (void)displayMessageAndQuitVoiceControl
{
}

void __60__CACSpokenCommandManager_displayMessageAndQuitVoiceControl__block_invoke()
{
  id v3 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.MicrophoneCannotBeObtained"];
  v0 = +[CACDisplayManager sharedManager];
  [v0 displayMessageString:v3 type:1];

  +[CACDisplayManager durationToDisplayMessageString:v3];
  dispatch_time_t v2 = dispatch_time(0, (uint64_t)(v1 * 1000000000.0));
  dispatch_after(v2, MEMORY[0x263EF83A0], &__block_literal_global_597);
}

uint64_t __60__CACSpokenCommandManager_displayMessageAndQuitVoiceControl__block_invoke_2()
{
  v0 = +[CACPreferences sharedPreferences];
  [v0 setCommandAndControlEnabled:0];

  return MEMORY[0x270F906B8](0);
}

- (void)attentionAwareLost
{
  self->_attentionAwareStatus = 2;
  if ([(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"SleepAndWake"])
  {
    [(CACSpokenCommandManager *)self enterSleepInteractionLevel];
  }
  else if ([(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"ListeningOffAndOn"])
  {
    [(CACSpokenCommandManager *)self _pushInteractionLevel:2 referencingObject:self];
  }
  else if ([(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"DictationOffAndNormal"])
  {
    id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v3 setDictationRecognizerMode:1];
  }
}

- (void)attentionAwareGained
{
  self->_attentionAwareStatus = 1;
  if ([(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"SleepAndWake"])
  {
    if ([(CACSpokenCommandManager *)self isListening])
    {
      id v3 = +[CACSpeechSystem speechSystem];
      [v3 rxRecognitionSystemReset];
    }
    [(CACSpokenCommandManager *)self exitSleepInteractionLevel];
  }
  else if ([(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"ListeningOffAndOn"])
  {
    [(CACSpokenCommandManager *)self _popInteractionLevel:2 referencingObject:self];
  }
  else if ([(NSString *)self->_currentAttentionAwarenessAction isEqualToString:@"DictationOffAndNormal"])
  {
    id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v4 setDictationRecognizerMode:self->_attentionAwarePreviousDictationRecognizerMode];
  }
}

- (void)attentionAwareInterrupted
{
  id v4 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.CameraInterruption"];
  id v3 = +[CACDisplayManager sharedManager];
  [v3 displayMessageString:v4 type:0];

  [(CACSpokenCommandManager *)self attentionAwareGained];
}

- (void)attentionAwareInterruptionEnded
{
  id v3 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.CameraInterruptionEnded"];
  dispatch_time_t v2 = +[CACDisplayManager sharedManager];
  [v2 displayMessageString:v3 type:0];
}

- (void)_attentionAwareSettingChanged
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = CACLogAttentionAware();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_238377000, v3, OS_LOG_TYPE_INFO, "Attention Aware setting changed", (uint8_t *)&v13, 2u);
  }

  id v4 = +[CACPreferences sharedPreferences];
  id v5 = [v4 attentionAwareAction];

  uint64_t v6 = +[CACDisplayManager sharedManager];
  int v7 = [v6 carPlayConnected];

  if (v7)
  {

    uint64_t v8 = CACLogAttentionAware();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_238377000, v8, OS_LOG_TYPE_INFO, "Disabling attention aware due to carplay active", (uint8_t *)&v13, 2u);
    }

    id v5 = @"None";
  }
  id v9 = CACLogAttentionAware();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_238377000, v9, OS_LOG_TYPE_INFO, "Resolved attention aware setting - %@", (uint8_t *)&v13, 0xCu);
  }

  if (![(NSString *)self->_currentAttentionAwarenessAction isEqualToString:v5])
  {
    p_currentAttentionAwarenessActiouint64_t n = &self->_currentAttentionAwarenessAction;
    if ([(__CFString *)v5 isEqualToString:@"None"])
    {
      if (self->_isAttentionAwareClientRunning)
      {
        self->_isAttentionAwareClientRunning = 0;
        self->_attentionAwareStatus = 0;
        uint64_t v11 = +[CACUserAttentionInterface sharedManager];
        [v11 stopUserAttentionControllerIfNeeded];
LABEL_15:
      }
    }
    else if (!self->_isAttentionAwareClientRunning)
    {
      self->_isAttentionAwareClientRunning = 1;
      uint64_t v11 = +[CACUserAttentionInterface sharedManager];
      [v11 startUserAttentionControllerIfNeededForTypes:1];
      goto LABEL_15;
    }
    if ([(NSString *)*p_currentAttentionAwarenessAction isEqualToString:@"SleepAndWake"])
    {
      [(CACSpokenCommandManager *)self exitSleepInteractionLevel];
    }
    else if ([(NSString *)*p_currentAttentionAwarenessAction isEqualToString:@"ListeningOffAndOn"])
    {
      [(CACSpokenCommandManager *)self _popInteractionLevel:2 referencingObject:self];
    }
    else if ([(NSString *)*p_currentAttentionAwarenessAction isEqualToString:@"DictationOffAndNormal"])
    {
      uint64_t v12 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v12 setDictationRecognizerMode:self->_attentionAwarePreviousDictationRecognizerMode];
    }
    objc_storeStrong((id *)&self->_currentAttentionAwarenessAction, v5);
  }
}

- (void)beginObservingApplications
{
  if (!self->_appLibrary)
  {
    id v3 = (FBSApplicationLibrary *)objc_alloc_init(MEMORY[0x263F3F6D0]);
    appLibrardouble y = self->_appLibrary;
    self->_appLibrardouble y = v3;
  }
  id v5 = [(CACSpokenCommandManager *)self appLibrary];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __53__CACSpokenCommandManager_beginObservingApplications__block_invoke;
  v10[3] = &unk_264D11E60;
  v10[4] = self;
  uint64_t v6 = [v5 observeDidAddApplicationsWithBlock:v10];

  int v7 = [(CACSpokenCommandManager *)self appLibrary];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__CACSpokenCommandManager_beginObservingApplications__block_invoke_612;
  v9[3] = &unk_264D11E60;
  v9[4] = self;
  uint64_t v8 = [v7 observeDidRemoveApplicationsWithBlock:v9];

  [(CACSpokenCommandManager *)self setApplicationAddedObservationToken:v6];
  [(CACSpokenCommandManager *)self setApplicationRemovedObservationToken:v8];
}

void __53__CACSpokenCommandManager_beginObservingApplications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CACLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_INFO, "Resyncing: Application newly added %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) synchronizeRecognizersWithReason:kSRUISyncReasonApplicationsChanged];
}

void __53__CACSpokenCommandManager_beginObservingApplications__block_invoke_612(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CACLogGeneral();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_INFO, "Resyncing: Application removed %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) synchronizeRecognizersWithReason:kSRUISyncReasonApplicationsChanged];
}

- (void)stopObservingApplications
{
  id v3 = [(CACSpokenCommandManager *)self appLibrary];
  id v4 = [(CACSpokenCommandManager *)self applicationAddedObservationToken];
  [v3 removeObserverForToken:v4];

  int v5 = [(CACSpokenCommandManager *)self appLibrary];
  id v6 = [(CACSpokenCommandManager *)self applicationRemovedObservationToken];
  [v5 removeObserverForToken:v6];

  [(CACSpokenCommandManager *)self setApplicationAddedObservationToken:0];
  [(CACSpokenCommandManager *)self setApplicationRemovedObservationToken:0];
}

- (void)synchronizeRecognizersWithReason:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (self->_isListening)
  {
    if ([v4 isEqualToString:kSRUISyncReasonOverlayStateChanged])
    {
      [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:*MEMORY[0x263F78C28]];
      if ([(CACSpokenCommandManager *)self isActiveOverlayType:@"NumberedGrid"]
        || [(CACSpokenCommandManager *)self isActiveOverlayType:@"NumberedElements"])
      {
        [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:*MEMORY[0x263F78C58]];
      }
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __60__CACSpokenCommandManager_synchronizeRecognizersWithReason___block_invoke;
    v6[3] = &unk_264D117C0;
    id v7 = v5;
    uint64_t v8 = self;
    [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v6];
  }
}

void __60__CACSpokenCommandManager_synchronizeRecognizersWithReason___block_invoke(uint64_t a1)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  dispatch_time_t v2 = RXSignpostLog();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = [*(id *)(a1 + 32) UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v53 = v3;
    _os_signpost_emit_with_name_impl(&dword_238377000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdPrep: Syncing recognizers", "%s", buf, 0xCu);
  }

  id v4 = *(id *)(a1 + 40);
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(double *)(v5 + 128) == 0.0) {
    *(void *)(v5 + 128) = 0;
  }
  objc_sync_exit(v4);

  double v6 = 2.0;
  do
  {
    id v7 = [*(id *)(a1 + 40) labeledScreenElementsCollection];
    int v8 = [v7 isCollecting];

    if (!v8) {
      break;
    }
    usleep(0x186A0u);
    double v6 = v6 + -0.1;
  }
  while (v6 > 0.0);
  id v9 = *(id *)(*(void *)(a1 + 40) + 112);
  objc_sync_enter(v9);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 112) allKeys];
  uint64_t v11 = (void *)[v10 copy];

  objc_sync_exit(v9);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v12 = [v11 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 40) _updateLanguageModelForBuiltInLMIdentifier:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v13);
  }

  [*(id *)(a1 + 40) _pushLeadingContextToSpeechRecognitionSystem];
  [*(id *)(a1 + 40) _pushSecureFieldStatusToSpeechRecognitionSystem];
  id v16 = *(id *)(*(void *)(a1 + 40) + 88);
  objc_sync_enter(v16);
  long long v17 = (void *)[*(id *)(*(void *)(a1 + 40) + 88) copy];
  objc_sync_exit(v16);

  uint64_t v18 = objc_opt_new();
  long long v19 = (void *)sEvaluatorValueCache;
  sEvaluatorValueCache = v18;

  uint64_t v20 = objc_opt_new();
  long long v21 = (void *)sEvaluatorResultCache;
  sEvaluatorResultCache = v20;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v22 = v17;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v43 != v24) {
          objc_enumerationMutation(v22);
        }
        objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * j), "synchronizeWithReason:", *(void *)(a1 + 32), (void)v42);
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v23);
  }

  char v26 = (void *)sEvaluatorValueCache;
  sEvaluatorValueCache = 0;

  uint64_t v27 = (void *)sEvaluatorResultCache;
  sEvaluatorResultCache = 0;

  id v28 = *(id *)(a1 + 40);
  objc_sync_enter(v28);
  uint64_t v29 = *(void *)(a1 + 40);
  if (*(double *)(v29 + 128) == 0.0) {
    *(void *)(v29 + 128) = 0;
  }
  objc_sync_exit(v28);

  BOOL v30 = +[CACSpeechSystem speechSystem];
  uint64_t v31 = [v30 recognitionSystemRef];

  if (v31)
  {
    unsigned int v32 = [*(id *)(a1 + 40) currentInteractionLevel] - 1;
    uint64_t v33 = *(void *)(a1 + 40);
    if (v32 >= 2)
    {
      int v35 = [(id)v33 dictationRecognizerMode];
      uint64_t v33 = *(void *)(a1 + 40);
      if (v35 == 1 || !*(void *)(v33 + 32))
      {
        uint64_t v34 = 2;
      }
      else
      {
        uint64_t v36 = +[CACDisplayManager sharedManager];
        int v37 = [v36 carPlayConnected];

        uint64_t v34 = v37 ? 2 : 1;
        uint64_t v33 = *(void *)(a1 + 40);
      }
    }
    else
    {
      uint64_t v34 = 3;
    }
    if (*(_DWORD *)(v33 + 360) != v34)
    {
      uint64_t v38 = +[CACSpeechSystem speechSystem];
      [v38 setRxRecognitionSystemResetMode:v34];

      *(_DWORD *)(*(void *)(a1 + 40) + 360) = v34;
    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", kSRUISyncReasonRecognizerModeChanged, (void)v42)&& objc_msgSend(*(id *)(a1 + 40), "isListening"))
  {
    double v39 = +[CACSpeechSystem speechSystem];
    [v39 rxRecognitionSystemReset];
  }
  int v40 = RXSignpostLog();
  if (os_signpost_enabled(v40))
  {
    uint64_t v41 = [*(id *)(a1 + 32) UTF8String];
    *(_DWORD *)buf = 136315138;
    uint64_t v53 = v41;
    _os_signpost_emit_with_name_impl(&dword_238377000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdPrep: Syncing recognizers", "%s", buf, 0xCu);
  }
}

- (BOOL)isSynchronizingRecognizers
{
  dispatch_time_t v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_recognizerSyncTransactionID != 0.0;
  objc_sync_exit(v2);

  return v3;
}

- (id)activeCommandIdentifiers
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  obuint64_t j = self->_recognizers;
  objc_sync_enter(obj);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = self->_recognizers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v8 isListening])
        {
          long long v18 = 0u;
          long long v19 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          id v9 = [v8 spokenCommands];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v17;
            do
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v17 != v11) {
                  objc_enumerationMutation(v9);
                }
                uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * j) identifier];
                [v3 addObject:v13];
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v24 count:16];
            }
            while (v10);
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  objc_sync_exit(obj);
  return v3;
}

- (void)forceSynchronizeRecognizersForBuiltInLMIdentifier:(id)a3
{
  [(CACSpokenCommandManager *)self _markAsDirtyForBuiltInLMIdentifier:a3];
  uint64_t v4 = kSRUISyncReasonRecognizersChanged;
  [(CACSpokenCommandManager *)self synchronizeRecognizersWithReason:v4];
}

- (void)suspendCommandDispatching:(BOOL)a3
{
  obuint64_t j = self->_recognizedCommandsReadyForDispatch;
  objc_sync_enter(obj);
  self->_suspendCommandDispatching = a3;
  if (!a3) {
    [(CACSpokenCommandManager *)self dispatchPendingCommand];
  }
  objc_sync_exit(obj);
}

- (void)handleRecognizedCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = CACLogRecognition();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[CACSpokenCommandManager handleRecognizedCommand:](v4, v5);
  }

  if (self->_commandRecognitionLogPath)
  {
    -[CACSpokenCommandManager _appendSpokenCommand:toLogAtPath:](self, "_appendSpokenCommand:toLogAtPath:", v4);
  }
  else
  {
    uint64_t v6 = [v4 identifier];
    [(CACSpokenCommandManager *)self setRecognizedCommandIdentifier:v6];

    id v7 = [v4 identifier];
    BOOL v8 = [(CACSpokenCommandManager *)self shouldIgnoreCommand:v7];

    if (!v8)
    {
      id v9 = self->_recognizedCommandsReadyForDispatch;
      objc_sync_enter(v9);
      [(NSMutableArray *)self->_recognizedCommandsReadyForDispatch addObject:v4];
      if (!self->_suspendCommandDispatching) {
        [(CACSpokenCommandManager *)self dispatchPendingCommand];
      }
      objc_sync_exit(v9);
    }
  }
}

- (void)dispatchPendingCommand
{
  if ([(NSMutableArray *)self->_recognizedCommandsReadyForDispatch count])
  {
    BOOL v3 = [(NSMutableArray *)self->_recognizedCommandsReadyForDispatch objectAtIndex:0];
    [(NSMutableArray *)self->_recognizedCommandsReadyForDispatch removeObjectAtIndex:0];
    if (v3)
    {
      commandExecutionDispatchQueue = self->_commandExecutionDispatchQueue;
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      long long v16 = __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke;
      long long v17 = &unk_264D117C0;
      id v5 = v3;
      id v18 = v5;
      long long v19 = self;
      dispatch_async(commandExecutionDispatchQueue, &v14);
      uint64_t v6 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
      id v7 = [v5 recognizedParameters];
      [v6 setRecognitionProperties:v7];

      BOOL v8 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = [v5 performSelector:sel_customProperties withObject:0];
      }
      else {
        uint64_t v9 = 0;
      }
      [v8 setCustomUserCommandProperties:v9];

      if (([v5 executedIndirectly] & 1) == 0)
      {
        uint64_t v10 = [MEMORY[0x263F21668] systemApplication];
        char v11 = [v10 isScreenLocked];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = +[CACMessageTracerUtilities sharedCACMessageTracerUtilities];
          uint64_t v13 = [v5 identifier];
          [v12 logCommandWithIdentifier:v13];
        }
      }
    }
  }
}

void __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  BOOL v3 = [*(id *)(a1 + 32) commandRecognizer];
  id v4 = [v3 speechRecognizer];
  id v5 = [*(id *)(a1 + 32) identifier];
  [v2 registerSignPostEndProcessingForSpeechRecognizer:v4 message:v5];

  uint64_t v6 = [*(id *)(a1 + 40) stagedTextInsertionSpecifier];
  id v7 = [*(id *)(a1 + 32) identifier];
  [v6 setCommandIdentifier:v7];

  BOOL v8 = [*(id *)(a1 + 40) stagedTextInsertionSpecifier];
  uint64_t v9 = [*(id *)(a1 + 32) recognizedParameters];
  [v8 setRecognizedParams:v9];

  [*(id *)(a1 + 32) performAction];
  uint64_t v10 = dispatch_get_global_queue(21, 0);
  dispatch_async(v10, &__block_literal_global_614);

  [*(id *)(a1 + 40) setNextPreviousResolverSpokenCommand:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) setRepeatingSpokenCommand:*(void *)(a1 + 32)];
  char v11 = +[CACRecordedUserActionManager sharedManager];
  [v11 addRecognizedSpokenCommand:*(void *)(a1 + 32)];

  uint64_t v12 = NSString;
  uint64_t v13 = [*(id *)(a1 + 32) identifier];
  id v14 = [v12 stringWithFormat:@"Command executed: %@", v13];

  [*(id *)(a1 + 40) forceElementFetchWithReason:v14];
}

void __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke_2()
{
  v0 = [MEMORY[0x263F4B5A8] sharedInstance];
  id v4 = 0;
  double v1 = (void *)[v0 newAssertionToDisableIdleTimerForReason:@"CommandAndControl.CommandExecution" error:&v4];
  id v2 = v4;

  [v1 invalidate];
  if (v2)
  {
    BOOL v3 = CACLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke_2_cold_1();
    }
  }
}

- (void)_appendSpokenCommand:(id)a3 toLogAtPath:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v33 = a4;
  uint64_t v6 = [MEMORY[0x263F089D8] string];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  objc_msgSend(v6, "appendFormat:", @"%f\t", v7);
  BOOL v8 = [v5 recognizedParameters];
  uint64_t v9 = [v8 objectForKey:kCACCommandParameterText];
  [v6 appendFormat:@"%@\t", v9];

  uint64_t v10 = [v5 identifier];
  char v11 = v6;
  [v6 appendFormat:@"%@\t", v10];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v12 = *MEMORY[0x263F78C58];
  v40[0] = *MEMORY[0x263F78C38];
  v40[1] = v12;
  uint64_t v13 = *MEMORY[0x263F78C00];
  v40[2] = *MEMORY[0x263F78BF8];
  v40[3] = v13;
  uint64_t v14 = *MEMORY[0x263F78C30];
  v40[4] = *MEMORY[0x263F78C28];
  v40[5] = v14;
  uint64_t v15 = *MEMORY[0x263F78C48];
  v40[6] = *MEMORY[0x263F78BF0];
  v40[7] = v15;
  uint64_t v16 = *MEMORY[0x263F78C20];
  v40[8] = *MEMORY[0x263F78C18];
  v40[9] = v16;
  long long v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:10];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v23 = v5;
        uint64_t v24 = [v5 recognizedParameters];
        v25 = [v24 objectForKey:v22];
        uint64_t v26 = [v25 objectForKey:kCACCommandParameterText];

        if (v26) {
          [v11 appendFormat:@"%@:%@\t", v22, v26];
        }

        id v5 = v23;
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v19);
  }

  id v27 = [v33 stringByExpandingTildeInPath];
  id v28 = fopen((const char *)[v27 UTF8String], "a");

  id v29 = v11;
  fprintf(v28, "%s\n", (const char *)[v29 UTF8String]);
  fclose(v28);
  synchronousRemoteRequestCompletionBlocuint64_t k = (void (**)(id, void *, void))self->_synchronousRemoteRequestCompletionBlock;
  if (synchronousRemoteRequestCompletionBlock)
  {
    id v39 = v5;
    uint64_t v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
    synchronousRemoteRequestCompletionBlock[2](synchronousRemoteRequestCompletionBlock, v31, 0);

    id v32 = self->_synchronousRemoteRequestCompletionBlock;
    self->_synchronousRemoteRequestCompletionBlocuint64_t k = 0;
  }
}

- (BOOL)shouldIgnoreCommand:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CACSpokenCommandManager *)self commandsToIgnore];

  if (v5)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = [(CACSpokenCommandManager *)self commandsToIgnore];
    id v5 = (void *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v10 + 1) + 8 * i) isEqualToString:v4])
          {
            LOBYTE(v5) = 1;
            goto LABEL_12;
          }
        }
        id v5 = (void *)[v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return (char)v5;
}

- (void)_startSynchronousRemoteRecognitionWithCompletionBlock:(id)a3
{
  obuint64_t j = self;
  id v4 = a3;
  objc_sync_enter(obj);
  uint64_t v5 = MEMORY[0x23EC8F1E0](v4);

  synchronousRemoteRequestCompletionBlocuint64_t k = obj->_synchronousRemoteRequestCompletionBlock;
  obj->_synchronousRemoteRequestCompletionBlocuint64_t k = (id)v5;

  objc_sync_exit(obj);
}

- (void)_cancelSynchronousRemoteRecognition
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  synchronousRemoteRequestCompletionBlocuint64_t k = obj->_synchronousRemoteRequestCompletionBlock;
  obj->_synchronousRemoteRequestCompletionBlocuint64_t k = 0;

  objc_sync_exit(obj);
}

- (void)didFinishExecutingSpokenCommand:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  synchronousRemoteRequestCompletionBlocuint64_t k = (void (**)(id, void *, void))v5->_synchronousRemoteRequestCompletionBlock;
  if (synchronousRemoteRequestCompletionBlock)
  {
    v10[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    synchronousRemoteRequestCompletionBlock[2](synchronousRemoteRequestCompletionBlock, v7, 0);

    id v8 = v5->_synchronousRemoteRequestCompletionBlock;
    v5->_synchronousRemoteRequestCompletionBlocuint64_t k = 0;
  }
  uint64_t v9 = objc_opt_new();
  [(CACSpokenCommandManager *)v5 setStagedTextInsertionSpecifier:v9];

  [(CACSpokenCommandManager *)v5 _clearPreviousTextInsertionSpecifierBasedOnExecutedCommand:v4];
  objc_sync_exit(v5);
}

- (void)didFindCloseSpokenCommandIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (v5->_synchronousRemoteRequestCompletionBlock)
  {
    uint64_t v6 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          long long v11 = -[CACSpokenCommandManager _templateSpokenCommandWithIdentifier:](v5, "_templateSpokenCommandWithIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * v10), (void)v13);
          if (v11) {
            [v6 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    (*((void (**)(void))v5->_synchronousRemoteRequestCompletionBlock + 2))();
    synchronousRemoteRequestCompletionBlocuint64_t k = v5->_synchronousRemoteRequestCompletionBlock;
    v5->_synchronousRemoteRequestCompletionBlocuint64_t k = 0;
  }
  objc_sync_exit(v5);
}

- (void)notifyUserOfCommandFailureUsingSound
{
}

- (void)notifyUserOfCommandFailureWithTitle:(id)a3 description:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = +[CACDisplayManager sharedManager];
  id v7 = [NSString stringWithFormat:@"%@ %@", v6, v5];

  [v8 displayMessageString:v7 type:1];
}

- (void)setNextPreviousResolverSpokenCommand:(id)a3
{
  id v11 = a3;
  id v5 = [v11 identifier];
  if ([(CACSpokenCommandManager *)v5 isEqualToString:@"Text.SelectNext"]) {
    goto LABEL_8;
  }
  id v6 = [v11 identifier];
  if ([v6 isEqualToString:@"Text.SelectPrevious"]) {
    goto LABEL_7;
  }
  id v7 = [v11 identifier];
  if ([v7 isEqualToString:@"System.OverlayChooseLabel"])
  {
LABEL_6:

LABEL_7:
LABEL_8:

    goto LABEL_9;
  }
  id v8 = [v11 identifier];
  if ([v8 isEqualToString:@"System.OverlayChooseLabelWithoutPrefix"])
  {

    goto LABEL_6;
  }
  uint64_t v9 = [v11 identifier];
  char v10 = [v9 isEqualToString:@"System.OverlayChooseAllLabels"];

  if ((v10 & 1) == 0)
  {
    id v5 = self;
    objc_sync_enter(v5);
    objc_storeStrong((id *)&v5->_currentNextPreviousResolverSpokenCommand, a3);
    objc_sync_exit(v5);
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)isNextPreviousResolverSpokenCommandEmojiBased
{
  id v2 = [(CACSpokenCommand *)self->_currentNextPreviousResolverSpokenCommand identifier];
  char v3 = [v2 isEqualToString:@"Text.SelectEmojiWithPhrase"];

  return v3;
}

- (id)resolvedNextSpokenCommand
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_currentNextPreviousResolverSpokenCommand)
  {
    char v3 = [(CACSpokenCommandManager *)v2 _nextResolverRelationships];
    id v4 = [(CACSpokenCommand *)v2->_currentNextPreviousResolverSpokenCommand identifier];
    id v5 = [v3 objectForKey:v4];

    if (v5)
    {
      id v6 = (void *)[(CACSpokenCommand *)v2->_currentNextPreviousResolverSpokenCommand copy];
      [v6 setIdentifier:v5];
      if (([v5 isEqualToString:@"Text.SelectNext"] & 1) == 0)
      {
        id v7 = [(CACSpokenCommandManager *)v2 _templateSpokenCommandWithIdentifier:v5];
        id v8 = v7;
        if (v7) {
          objc_msgSend(v6, "setAction:", objc_msgSend(v7, "action"));
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(CACSpokenCommandManager *)v2 _templateSpokenCommandWithIdentifier:@"Text.SelectNextWord"];
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)resolvedPreviousSpokenCommand
{
  id v2 = self;
  objc_sync_enter(v2);
  if (v2->_currentNextPreviousResolverSpokenCommand)
  {
    char v3 = [(CACSpokenCommandManager *)v2 _previousResolverRelationships];
    id v4 = [(CACSpokenCommand *)v2->_currentNextPreviousResolverSpokenCommand identifier];
    id v5 = [v3 objectForKey:v4];

    if (v5)
    {
      id v6 = (void *)[(CACSpokenCommand *)v2->_currentNextPreviousResolverSpokenCommand copy];
      [v6 setIdentifier:v5];
      if (([v5 isEqualToString:@"Text.SelectPrevious"] & 1) == 0)
      {
        id v7 = [(CACSpokenCommandManager *)v2 _templateSpokenCommandWithIdentifier:v5];
        id v8 = v7;
        if (v7) {
          objc_msgSend(v6, "setAction:", objc_msgSend(v7, "action"));
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = [(CACSpokenCommandManager *)v2 _templateSpokenCommandWithIdentifier:@"Text.SelectPreviousWord"];
  }
  objc_sync_exit(v2);

  return v6;
}

- (id)_nextResolverRelationships
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CACSpokenCommandManager__nextResolverRelationships__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  if (_nextResolverRelationships_nextResolverRelationshipsLoad != -1) {
    dispatch_once(&_nextResolverRelationships_nextResolverRelationshipsLoad, block);
  }
  return self->_nextResolverRelationships;
}

uint64_t __53__CACSpokenCommandManager__nextResolverRelationships__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"Text.SelectCurrentCharacter", @"Text.SelectNextCharacter", @"Text.SelectNextCharacter", @"Text.SelectNextCharacter", @"Text.SelectPreviousCharacter", @"Text.SelectNextCharactersUsingCardinalNumber", @"Text.SelectNextCharactersUsingCardinalNumber", @"Text.SelectNextCharactersUsingCardinalNumber", @"Text.SelectPreviousCharactersUsingCardinalNumber", @"Text.SelectNextWord", @"Text.SelectCurrentWord", @"Text.SelectNextWord", @"Text.SelectNextWord", @"Text.SelectNextWord", @"Text.SelectPreviousWord", @"Text.SelectNextWordsUsingCardinalNumber", @"Text.SelectNextWordsUsingCardinalNumber",
                                                @"Text.SelectNextWordsUsingCardinalNumber",
                                                @"Text.SelectPreviousWordsUsingCardinalNumber",
                                                @"Text.SelectNextSentence",
                                                @"Text.SelectCurrentSentence",
                                                @"Text.SelectNextSentence",
                                                @"Text.SelectNextSentence",
                                                @"Text.SelectNextSentence",
                                                @"Text.SelectPreviousSentence",
                                                @"Text.SelectNextSentencesUsingCardinalNumber",
                                                @"Text.SelectNextSentencesUsingCardinalNumber",
                                                @"Text.SelectNextSentencesUsingCardinalNumber",
                                                @"Text.SelectPreviousSentencesUsingCardinalNumber",
                                                @"Text.SelectNextParagraph",
                                                @"Text.SelectCurrentParagraph",
                                                @"Text.SelectNextParagraph",
                                                @"Text.SelectNextParagraph",
                                                @"Text.SelectNextParagraph",
                                                @"Text.SelectPreviousParagraph",
                                                @"Text.SelectNextParagraphsUsingCardinalNumber",
                                                @"Text.SelectNextParagraphsUsingCardinalNumber",
                                                @"Text.SelectNextParagraphsUsingCardinalNumber",
                                                @"Text.SelectPreviousParagraphsUsingCardinalNumber",
                                                @"Text.SelectNextLine",
                                                @"Text.SelectCurrentLine",
                                                @"Text.SelectNextLine",
                                                @"Text.SelectNextLine",
                                                @"Text.SelectNextLine",
                                                @"Text.SelectPreviousLine",
                                                @"Text.SelectNextLinesUsingCardinalNumber",
                                                @"Text.SelectNextLinesUsingCardinalNumber",
                                                @"Text.SelectNextLinesUsingCardinalNumber",
                                                @"Text.SelectPreviousLinesUsingCardinalNumber",
                                                @"Text.SelectNext",
                                                @"Text.SelectPhrase",
                                                @"Text.SelectNext",
                                                @"Text.SelectEmojiWithPhrase",
                                                @"Text.SelectNext",
                                                @"Text.SelectPhraseThroughPhrase",
                                                @"Text.SelectNext",
                                                @"Text.SelectNext",
                                                @"Text.SelectNext",
                                                @"Text.SelectPrevious",
                                                0);
  return MEMORY[0x270F9A758]();
}

- (id)_previousResolverRelationships
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CACSpokenCommandManager__previousResolverRelationships__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  if (_previousResolverRelationships_previousResolverRelationshipsLoad != -1) {
    dispatch_once(&_previousResolverRelationships_previousResolverRelationshipsLoad, block);
  }
  return self->_previousResolverRelationships;
}

uint64_t __57__CACSpokenCommandManager__previousResolverRelationships__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 184) = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"Text.SelectCurrentCharacter", @"Text.SelectPreviousCharacter", @"Text.SelectNextCharacter", @"Text.SelectPreviousCharacter", @"Text.SelectPreviousCharacter", @"Text.SelectPreviousCharactersUsingCardinalNumber", @"Text.SelectNextCharactersUsingCardinalNumber", @"Text.SelectPreviousCharactersUsingCardinalNumber", @"Text.SelectPreviousCharactersUsingCardinalNumber", @"Text.SelectPreviousWord", @"Text.SelectCurrentWord", @"Text.SelectPreviousWord", @"Text.SelectNextWord", @"Text.SelectPreviousWord", @"Text.SelectPreviousWord", @"Text.SelectPreviousWordsUsingCardinalNumber", @"Text.SelectNextWordsUsingCardinalNumber",
                                                @"Text.SelectPreviousWordsUsingCardinalNumber",
                                                @"Text.SelectPreviousWordsUsingCardinalNumber",
                                                @"Text.SelectPreviousSentence",
                                                @"Text.SelectCurrentSentence",
                                                @"Text.SelectPreviousSentence",
                                                @"Text.SelectNextSentence",
                                                @"Text.SelectPreviousSentence",
                                                @"Text.SelectPreviousSentence",
                                                @"Text.SelectPreviousSentencesUsingCardinalNumber",
                                                @"Text.SelectNextSentencesUsingCardinalNumber",
                                                @"Text.SelectPreviousSentencesUsingCardinalNumber",
                                                @"Text.SelectPreviousSentencesUsingCardinalNumber",
                                                @"Text.SelectPreviousParagraph",
                                                @"Text.SelectCurrentParagraph",
                                                @"Text.SelectPreviousParagraph",
                                                @"Text.SelectNextParagraph",
                                                @"Text.SelectPreviousParagraph",
                                                @"Text.SelectPreviousParagraph",
                                                @"Text.SelectPreviousParagraphsUsingCardinalNumber",
                                                @"Text.SelectNextParagraphsUsingCardinalNumber",
                                                @"Text.SelectPreviousParagraphsUsingCardinalNumber",
                                                @"Text.SelectPreviousParagraphsUsingCardinalNumber",
                                                @"Text.SelectPreviousLine",
                                                @"Text.SelectCurrentLine",
                                                @"Text.SelectPreviousLine",
                                                @"Text.SelectNextLine",
                                                @"Text.SelectPreviousLine",
                                                @"Text.SelectPreviousLine",
                                                @"Text.SelectPreviousLinesUsingCardinalNumber",
                                                @"Text.SelectNextLinesUsingCardinalNumber",
                                                @"Text.SelectPreviousLinesUsingCardinalNumber",
                                                @"Text.SelectPreviousLinesUsingCardinalNumber",
                                                @"Text.SelectPrevious",
                                                @"Text.SelectPhrase",
                                                @"Text.SelectPrevious",
                                                @"Text.SelectEmojiWithPhrase",
                                                @"Text.SelectPrevious",
                                                @"Text.SelectPhraseThroughPhrase",
                                                @"Text.SelectPrevious",
                                                @"Text.SelectNext",
                                                @"Text.SelectPrevious",
                                                @"Text.SelectPrevious",
                                                0);
  return MEMORY[0x270F9A758]();
}

- (id)_templateSpokenCommandWithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = self->_recognizers;
  objc_sync_enter(v17);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = self->_recognizers;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v19 = *(void *)v26;
    id v20 = 0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = objc_msgSend(v7, "spokenCommands", v17);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v8);
              }
              long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              long long v13 = [v12 identifier];
              int v14 = [v13 isEqualToString:v4];

              if (v14)
              {
                id v15 = v12;

                id v20 = v15;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    id v20 = 0;
  }

  objc_sync_exit(v17);
  return v20;
}

- (void)setRepeatingSpokenCommand:(id)a3
{
  id v9 = a3;
  id v4 = [v9 identifier];
  char v5 = [v4 isEqualToString:@"System.RepeatPreviousCommand"];

  if ((v5 & 1) == 0)
  {
    id v6 = self;
    objc_sync_enter(v6);
    uint64_t v7 = [v9 copy];
    currentRepeatingSpokenCommand = v6->_currentRepeatingSpokenCommand;
    v6->_currentRepeatingSpokenCommand = (CACSpokenCommand *)v7;

    objc_sync_exit(v6);
  }
}

- (void)stopAnyRepeatingSpokenCommand
{
  obuint64_t j = self;
  objc_sync_enter(obj);
  obj->_repeatingSpokenCommandRemainingCount = 0;
  objc_sync_exit(obj);
}

- (void)beginExecutingRepeatingSpokenCommandNumberOfTimes:(int64_t)a3 completionBlock:(id)a4
{
  id v7 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  v6->_repeatingSpokenCommandRemainingCount = a3;
  [(CACSpokenCommand *)v6->_currentRepeatingSpokenCommand setExecutedIndirectly:1];
  objc_sync_exit(v6);

  [(CACSpokenCommandManager *)v6 _executeNextRepeatWithCompletionBlock:v7];
}

- (void)_executeNextRepeatWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  char v5 = self;
  objc_sync_enter(v5);
  id v6 = v5->_currentRepeatingSpokenCommand;
  uint64_t repeatingSpokenCommandRemainingCount = v5->_repeatingSpokenCommandRemainingCount;
  objc_sync_exit(v5);

  if (repeatingSpokenCommandRemainingCount < 1)
  {
    uint64_t v10 = CACMakeSuccessError();
    v4[2](v4, v10);
  }
  else
  {
    if ([(CACSpokenCommand *)v6 isCustomCommand]
      || [(CACSpokenCommand *)v6 isListening])
    {
      goto LABEL_9;
    }
    id v8 = [(CACSpokenCommand *)v6 contextEvaluation];
    id v9 = [v8 objectForKey:kCACCommandContextRequiresNumberedElementsOverlay];
    if ([v9 BOOLValue])
    {

LABEL_9:
      int v14 = dispatch_get_global_queue(21, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke;
      block[3] = &unk_264D11730;
      void block[4] = v5;
      long long v17 = v6;
      uint64_t v18 = v4;
      dispatch_async(v14, block);

      goto LABEL_10;
    }
    id v11 = [(CACSpokenCommand *)v6 contextEvaluation];
    long long v12 = [v11 objectForKey:kCACCommandContextRequiresAnyNumberedOverlay];
    int v13 = [v12 BOOLValue];

    if (v13) {
      goto LABEL_9;
    }
    uint64_t v10 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.PreviousCommandNotAppropriate"];
    id v15 = CACMakeError(3002, v10);
    v4[2](v4, v15);
  }
LABEL_10:
}

void __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  --*(void *)(*(void *)(a1 + 32) + 168);
  objc_sync_exit(v2);

  uint64_t v4 = MEMORY[0x263EF8330];
  uint64_t v5 = 3221225472;
  id v6 = __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke_2;
  id v7 = &unk_264D11E88;
  char v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(id *)(a1 + 48);
  [v3 setCompletionBlock:&v4];
  objc_msgSend(*(id *)(a1 + 32), "handleRecognizedCommand:", *(void *)(a1 + 40), v4, v5, v6, v7, v8);
}

uint64_t __65__CACSpokenCommandManager__executeNextRepeatWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  +[CACSpokenCommand defaultDelayBetweenCommands];
  usleep((v2 * 1000000.0));
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 _executeNextRepeatWithCompletionBlock:v4];
}

- (BOOL)isFetchingElements
{
  double v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_fetchingTransactionID != 0.0;
  objc_sync_exit(v2);

  return v3;
}

- (void)forceElementFetchWithReason:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CACSpokenCommandManager_forceElementFetchWithReason___block_invoke;
  v6[3] = &unk_264D117C0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __55__CACSpokenCommandManager_forceElementFetchWithReason___block_invoke(uint64_t a1)
{
  id v2 = [NSString stringWithFormat:@"Forced fetch: %@", *(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _scheduleFetchElementsWithDelay:v2 andReason:0.05];
}

- (void)forceElementFetch
{
}

- (void)setNextFetchDelayFactor:(double)a3
{
  self->_nextFetchDelayFactor = a3;
}

- (id)_fetchPresentationElements
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  BOOL v3 = [MEMORY[0x263F81198] options];
  [v3 setLeafNodePredicate:&__block_literal_global_755];
  id v4 = +[CACDisplayManager sharedManager];
  id v5 = [v4 view];
  id v6 = [v5 window];
  id v7 = [v6 _accessibilityLeafDescendantsWithOptions:v3];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = _AXCreateAXUIElementWithElement();
        if (v14)
        {
          id v15 = (const void *)v14;
          long long v16 = [CACLocalAXElement alloc];
          long long v17 = -[CACLocalAXElement initWithAXUIElement:](v16, "initWithAXUIElement:", v15, (void)v19);
          [(CACLocalAXElement *)v17 setLocalElement:v13];
          [v2 addObject:v17];
          CFRelease(v15);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  +[CACSignPostLog FetchElementsEventCompletedWithNumberOfElements:numberOfElementsAlreadyCached:](CACSignPostLog, "FetchElementsEventCompletedWithNumberOfElements:numberOfElementsAlreadyCached:", [v2 count], 0);
  return v2;
}

uint64_t __53__CACSpokenCommandManager__fetchPresentationElements__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement]) {
    uint64_t v3 = [v2 accessibilityRespondsToUserInteraction];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)elementIsOccluded:(id)a3 occludedAppScenes:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "fbSceneIdentifier", (void)v14);
        uint64_t v11 = [v5 fbSceneIdentifier];
        char v12 = [v10 isEqual:v11];

        if (v12)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)inCallServiceApplication
{
  id v2 = [MEMORY[0x263F21668] systemWideElement];
  uint64_t v3 = [v2 elementForAttribute:1007 shouldFetchAttributes:0];

  LODWORD(v2) = [v3 pid];
  if (v2 == getpid())
  {
    id v4 = 0;
  }
  else
  {
    id v5 = [v3 uiElement];
    id v6 = [v5 objectWithAXAttribute:3003];

    if ([v6 isEqualToString:@"com.apple.InCallService"]) {
      id v4 = v3;
    }
    else {
      id v4 = 0;
    }
  }
  return v4;
}

- (void)_fetchElements
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "Skipping fetch elements. A fetch elements transaction is already enqueued", v2, v3, v4, v5, v6);
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  double v3 = *(double *)(*(void *)(v1 + 32) + 328);
  objc_sync_exit(v2);

  uint64_t v4 = +[CACDisplayManager sharedManager];
  int v5 = [v4 carPlayConnected];

  if (v5)
  {
    uint8_t v6 = [MEMORY[0x263F21668] systemWideElement];
    uint64_t v7 = [v6 elementsForAttribute:1009];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = [v8 currentApplications];
  }
  else
  {
    uint8_t v6 = [MEMORY[0x263F21668] systemApplication];
    uint64_t v9 = [v6 currentApplications];
  }

  uint64_t v10 = [*(id *)(v1 + 32) inCallServiceApplication];
  uint64_t v60 = v1;
  if (v10)
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v85 objects:v91 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v86;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v86 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = [*(id *)(*((void *)&v85 + 1) + 8 * i) bundleId];
          long long v17 = [v10 bundleId];
          char v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            uint64_t v9 = v11;
            goto LABEL_15;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v85 objects:v91 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    uint64_t v9 = [v11 arrayByAddingObject:v10];
LABEL_15:

    uint64_t v1 = v60;
  }
  long long v58 = [MEMORY[0x263EFF980] array];
  uint64_t v54 = [MEMORY[0x263EFF980] array];
  if ([*(id *)(v1 + 32) _chamoisSupportEnabledForVoiceControl])
  {
    uint64_t v19 = (void *)[v9 mutableCopy];
    long long v20 = [MEMORY[0x263F21668] systemApplication];
    char v21 = [v19 containsObject:v20];

    if ((v21 & 1) == 0)
    {
      long long v22 = [MEMORY[0x263F21668] systemApplication];
      [v19 addObject:v22];
    }
    id v23 = v19;

    uint64_t v24 = [MEMORY[0x263F22968] server];

    long long v59 = [v24 focusedOccludedAppScenes];

    uint64_t v9 = v23;
  }
  else
  {
    long long v59 = (void *)MEMORY[0x263EFFA68];
  }
  uint64_t v55 = v10;
  if (_AXSTwiceRemoteScreenEnabled())
  {
    long long v25 = (void *)[v9 mutableCopy];
    long long v26 = [MEMORY[0x263F21668] systemWideElement];
    long long v27 = [v26 accessibilityUIServerApplication];

    if (v27 && ([v25 containsObject:v27] & 1) == 0) {
      [v25 addObject:v27];
    }
  }
  else
  {
    long long v25 = v9;
  }
  group = dispatch_group_create();
  uint64_t v57 = objc_opt_new();
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  obuint64_t j = v25;
  uint64_t v28 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    id v30 = 0;
    uint64_t v31 = *(void *)v82;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v82 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*((void *)&v81 + 1) + 8 * j);
        if (!v30)
        {
          id v30 = [*(id *)(*((void *)&v81 + 1) + 8 * j) firstResponder];
        }
        uint64_t v34 = *(NSObject **)(*(void *)(v60 + 32) + 352);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_2;
        block[3] = &unk_264D11ED0;
        id v76 = v59;
        uint64_t v77 = v33;
        uint64_t v78 = *(void *)(v60 + 32);
        id v79 = v57;
        id v80 = v58;
        dispatch_group_async(group, v34, block);
      }
      uint64_t v29 = [obj countByEnumeratingWithState:&v81 objects:v90 count:16];
    }
    while (v29);
  }
  else
  {
    id v30 = 0;
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  if (!v30)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v35 = v58;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v89 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v72;
      while (2)
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v72 != v38) {
            objc_enumerationMutation(v35);
          }
          uint64_t v40 = [*(id *)(*((void *)&v71 + 1) + 8 * k) elementForTextInsertionAndDeletion];
          if (v40)
          {
            id v30 = (id)v40;
            goto LABEL_49;
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v71 objects:v89 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }
    id v30 = 0;
LABEL_49:
  }
  uint64_t v41 = +[CACDisplayManager sharedManager];
  [v41 hideObsoletePresentationsIfNeededForElements:v58];

  uint64_t v42 = +[CACDisplayManager sharedManager];
  int v43 = [v42 isDisplayingAnyInteractiveContentInProcess];

  if (v43)
  {
    long long v44 = +[CACDisplayManager sharedManager];
    char v45 = [v44 isDisplayingAnyOutOfProcessPresentation];

    if ((v45 & 1) == 0)
    {

      id v30 = 0;
    }
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_3;
    v68[3] = &unk_264D11850;
    v68[4] = *(void *)(v60 + 32);
    id v69 = obj;
    id v30 = v30;
    id v70 = v30;
    dispatch_async(MEMORY[0x263EF83A0], v68);
  }
  else
  {
    [*(id *)(v60 + 32) setScreenElements:v58 presentationElements:0 activeApplications:obj focusedTextAreaElement:v30];
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_766);
  }
  id v46 = *(id *)(v60 + 32);
  objc_sync_enter(v46);
  uint64_t v47 = *(void *)(v60 + 32);
  if (v3 == *(double *)(v47 + 328))
  {
    *(void *)(v47 + 328) = 0;
    long long v48 = *(NSObject **)(*(void *)(v60 + 32) + 344);
    v63[0] = MEMORY[0x263EF8330];
    v63[1] = 3221225472;
    v63[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_5;
    v63[3] = &unk_264D11A18;
    id v49 = obj;
    uint64_t v50 = *(void *)(v60 + 32);
    id v64 = v49;
    uint64_t v65 = v50;
    id v66 = v59;
    id v67 = v54;
    dispatch_async(v48, v63);
  }
  objc_sync_exit(v46);

  long long v51 = RXSignpostLog();
  if (os_signpost_enabled(v51))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_238377000, v51, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdPrep: Fetching Elements", "", buf, 2u);
  }

  long long v52 = CACLogElementCollection();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
    __41__CACSpokenCommandManager__fetchElements__block_invoke_cold_1();
  }

  id v53 = *(id *)(v60 + 32);
  objc_sync_enter(v53);
  --_fetchElements___fetchQueueDepth;
  objc_sync_exit(v53);
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_2(id *a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v33 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v2 = a1[4];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v39 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v8 = [v7 bundleIdentifier];
        uint64_t v9 = [a1[5] bundleId];
        int v10 = [v8 isEqual:v9];

        if (v10) {
          [v33 addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v4);
  }

  id v11 = [a1[5] uiElement];
  uint64_t v12 = [v11 uiElementsWithAttribute:94500 parameter:&unk_26EB4D040];

  id v30 = [MEMORY[0x263EFF980] array];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v12;
  uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v35;
    unint64_t v16 = 0x263F21000uLL;
    unint64_t v17 = 0x264D10000uLL;
    uint64_t v31 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v35 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = objc_msgSend(*(id *)(v16 + 1640), "elementWithUIElement:", *(void *)(*((void *)&v34 + 1) + 8 * j), v30);
        int v20 = [v19 isVisible];
        char v21 = [*(id *)(v17 + 2960) sharedManager];
        if ([v21 carPlayConnected])
        {
          long long v22 = a1;
          unint64_t v23 = v16;
          int v24 = [v19 windowDisplayId];
          [*(id *)(v17 + 2960) sharedManager];
          long long v26 = v25 = v17;
          int v27 = v24 != [v26 carPlayDisplayID];

          unint64_t v17 = v25;
          int v28 = (v19 != 0) & ~v27;
          unint64_t v16 = v23;
          a1 = v22;
          uint64_t v15 = v31;
          if ((v28 & v20) != 1) {
            goto LABEL_24;
          }
LABEL_22:
          if (([a1[6] elementIsOccluded:v19 occludedAppScenes:v33] & 1) == 0) {
            [v30 addObject:v19];
          }
          goto LABEL_24;
        }

        if (v19) {
          char v29 = v20;
        }
        else {
          char v29 = 0;
        }
        if (v29) {
          goto LABEL_22;
        }
LABEL_24:
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v14);
  }

  [a1[7] lock];
  [a1[8] addObjectsFromArray:v30];
  [a1[7] unlock];
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_3(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = [v2 _fetchPresentationElements];
  [v2 setScreenElements:0 presentationElements:v3 activeApplications:a1[5] focusedTextAreaElement:a1[6]];

  id v4 = +[CACDisplayManager sharedManager];
  [v4 refreshOverlays];
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_4()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 refreshOverlays];
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_5(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = dispatch_group_create();
  uint64_t v3 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * v7);
        uint64_t v9 = *(NSObject **)(*(void *)(a1 + 40) + 352);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_6;
        block[3] = &unk_264D11ED0;
        id v16 = *(id *)(a1 + 48);
        uint64_t v17 = v8;
        uint64_t v18 = *(void *)(a1 + 40);
        id v19 = v3;
        id v20 = *(id *)(a1 + 56);
        dispatch_group_async(v2, v9, block);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = *(NSObject **)(v10 + 336);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  void v13[2] = __41__CACSpokenCommandManager__fetchElements__block_invoke_7;
  v13[3] = &unk_264D117C0;
  v13[4] = v10;
  id v14 = *(id *)(a1 + 56);
  dispatch_async(v11, v13);
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_6(id *a1)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263EFF980] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = a1[4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v9 = [v8 bundleIdentifier];
        uint64_t v10 = [a1[5] bundleId];
        int v11 = [v9 isEqual:v10];

        if (v11) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v5);
  }

  int v12 = [a1[5] pid];
  if (v12 != getpid())
  {
    uint64_t v13 = [a1[5] uiElement];
    id v14 = [v13 uiElementsWithAttribute:94500 parameter:&unk_26EB4D058];

    uint64_t v33 = [MEMORY[0x263EFF980] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (!v16) {
      goto LABEL_25;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v35;
    unint64_t v19 = 0x263F21000uLL;
    unint64_t v20 = 0x264D10000uLL;
    uint64_t v31 = v2;
    uint64_t v32 = *(void *)v35;
    id v30 = v15;
    while (1)
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v22 = objc_msgSend(*(id *)(v19 + 1640), "elementWithUIElement:", *(void *)(*((void *)&v34 + 1) + 8 * j), v30, v31, v32);
        if (v22 && ([a1[6] elementIsOccluded:v22 occludedAppScenes:v2] & 1) == 0)
        {
          long long v23 = [*(id *)(v20 + 2960) sharedManager];
          if (([v23 carPlayConnected] & 1) == 0)
          {

LABEL_22:
            [v33 addObject:v22];
            goto LABEL_23;
          }
          int v24 = [v22 windowDisplayId];
          [*(id *)(v20 + 2960) sharedManager];
          uint64_t v26 = v25 = v19;
          unint64_t v27 = v20;
          int v28 = [v26 carPlayDisplayID];

          unint64_t v19 = v25;
          BOOL v29 = v24 == v28;
          unint64_t v20 = v27;
          id v15 = v30;
          id v2 = v31;
          uint64_t v18 = v32;
          if (v29) {
            goto LABEL_22;
          }
        }
LABEL_23:
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (!v17)
      {
LABEL_25:

        [a1[7] lock];
        [a1[8] addObjectsFromArray:v33];
        [a1[7] unlock];

        break;
      }
    }
  }
}

uint64_t __41__CACSpokenCommandManager__fetchElements__block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateScreenElementsWithNonScannerElements:*(void *)(a1 + 40)];
}

- (void)_scheduleFetchElementsWithDelay:(double)a3 andReason:(id)a4
{
  id v6 = a4;
  if (!self->_elementFetchingQueue)
  {
    uint64_t v7 = [MEMORY[0x263F08B88] callStackSymbols];
    uint64_t v8 = CACLogElementCollection();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CACSpokenCommandManager _scheduleFetchElementsWithDelay:andReason:]();
    }
  }
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel__fetchElements object:0];
  +[CACSignPostLog FetchElementsEventBeganWithReason:v6 expectedDelay:a3];
  uint64_t v9 = self;
  objc_sync_enter(v9);
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  v9->_fetchingTransactionID = v10;
  objc_sync_exit(v9);

  [(CACSpokenCommandManager *)v9 performSelector:sel__fetchElements withObject:0 afterDelay:fmax(v9->_nextFetchDelayFactor, 1.0) * a3];
  v9->_nextFetchDelayFactor = 0.0;
}

- (void)_scheduleFetchElementsWithDelay:(double)a3
{
}

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  uint64_t v9 = CACLogDictationCommands();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v23 = v6;
    __int16 v24 = 2112;
    unint64_t v25 = a5;
    _os_log_impl(&dword_238377000, v9, OS_LOG_TYPE_INFO, "did observe notification: %d, notification data: %@", buf, 0x12u);
  }

  if ((int)v6 <= 1068)
  {
    if ((v6 - 1000) > 0x12) {
      goto LABEL_32;
    }
    int v10 = 1 << (v6 + 24);
    if ((v10 & 0x13) != 0)
    {
      int v11 = self;
      objc_sync_enter(v11);
      BOOL displayIsOff = v11->_displayIsOff;
      if (displayIsOff != [(CACSpokenCommandManager *)v11 _isSystemSleeping])
      {
        BOOL v13 = [(CACSpokenCommandManager *)v11 _isSystemSleeping];
        v11->_BOOL displayIsOff = v13;
        if (v13) {
          [(CACSpokenCommandManager *)v11 _microphoneTurnedOffAfterInteruption];
        }
        else {
          [(CACSpokenCommandManager *)v11 _microphoneTurnedOnAfterInteruption];
        }
      }
      objc_sync_exit(v11);

      if (v6 == 1000)
      {
        [(CACSpokenCommandManager *)v11 willUpdateElementsSignificantly];
      }
      else if (v6 != 1001 && v6 != 1004)
      {
        goto LABEL_32;
      }
    }
    else if ((v10 & 0x40280) == 0)
    {
      goto LABEL_32;
    }
LABEL_27:
    uint64_t v17 = NSString;
    uint64_t v18 = [(CACSpokenCommandManager *)self nameOfAXNotification:v6];
    unint64_t v19 = [v17 stringWithFormat:@"AXNotification: %@", v18];

    [(CACSpokenCommandManager *)self delayForNotification:v6];
    double v21 = v20;
    if (a5 && CFEqual(a5, (CFTypeRef)*MEMORY[0x263F21A08])) {
      [(CACSpokenCommandManager *)self forceElementFetchWithReason:v19];
    }
    else {
      [(CACSpokenCommandManager *)self _scheduleFetchElementsWithDelay:v19 andReason:v21];
    }

    goto LABEL_32;
  }
  if ((int)v6 <= 5799)
  {
    if (v6 != 1069 && v6 != 5001) {
      goto LABEL_32;
    }
    goto LABEL_27;
  }
  if (v6 == 5800)
  {
    if (!self->_recognitionModeOverriddenForDictation)
    {
      self->_recognitionModeOverriddenForDictatiouint64_t n = 1;
      id v15 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      self->_recognitionModePriorToDictatiouint64_t n = [v15 dictationRecognizerMode];

      uint64_t v16 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v16 setDictationRecognizerMode:1];
    }
  }
  else if (v6 == 5801 && self->_recognitionModeOverriddenForDictation)
  {
    id v14 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v14 setDictationRecognizerMode:self->_recognitionModePriorToDictation];

    self->_recognitionModeOverriddenForDictatiouint64_t n = 0;
  }
LABEL_32:
}

- (double)delayForNotification:(int)a3
{
  double result = 0.3;
  if (a3 == 1069) {
    return 0.75;
  }
  return result;
}

- (id)nameOfAXNotification:(int)a3
{
  if (a3 > 1017)
  {
    switch(a3)
    {
      case 1018:
        uint64_t v4 = @"kAXFirstResponderChangedNotification";
        break;
      case 1069:
        uint64_t v4 = @"kAXScrollViewDidEndDeceleratingNotification";
        break;
      case 5001:
        uint64_t v4 = @"kAXFocusedApplicationsDidChangeNotification";
        break;
      default:
LABEL_27:
        uint64_t v4 = [NSString stringWithFormat:@"Unknown, %i", *(void *)&a3];
LABEL_28:
        break;
    }
  }
  else
  {
    uint64_t v4 = @"kAXScreenLockedNotification";
    switch(a3)
    {
      case 1000:
        uint64_t v4 = @"kAXScreenChangedNotification";
        break;
      case 1001:
        uint64_t v4 = @"kAXLayoutChangedNotification";
        break;
      case 1004:
        goto LABEL_28;
      case 1007:
        uint64_t v4 = @"kAXWebPageLoadedNotification";
        break;
      case 1009:
        uint64_t v4 = @"kAXElementScrolledByPageNotification";
        break;
      default:
        goto LABEL_27;
    }
  }
  return v4;
}

- (void)didObserveFirstTouchDownForObserver:(id)a3
{
  uint64_t v4 = CACLogDictationCommands();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_DEFAULT, "Did observe first touch down", v5, 2u);
  }

  [(CACSpokenCommandManager *)self didBeginTouches];
}

- (void)didObserveLastTouchUpForObserver:(id)a3
{
  uint64_t v4 = CACLogDictationCommands();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_DEFAULT, "Did observe last touch up", v5, 2u);
  }

  [(CACSpokenCommandManager *)self didEndTouches];
}

- (void)insertDictatedAttributedString:(id)a3
{
  id v4 = [a3 string];
  [(CACSpokenCommandManager *)self insertDictatedString:v4];
}

- (void)insertDictatedString:(id)a3
{
  focusedElement = self->_focusedElement;
  id v5 = a3;
  uint64_t v6 = [(AXElement *)focusedElement cacTextSelectionCACTextMarkerRange];
  uint64_t v7 = [v6 nsRange];

  [(AXElement *)self->_focusedElement insertText:v5 asUndoableAction:1];
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_lastDictationInsertionTimeStamp = v8;
  uint64_t v9 = [(CACSpokenCommandManager *)self stagedTextInsertionSpecifier];
  [v9 setInsertedString:v5];

  int v10 = [(CACSpokenCommandManager *)self stagedTextInsertionSpecifier];
  uint64_t v11 = [v5 length];

  objc_msgSend(v10, "setInsertedRange:", v7, v11);
  int v12 = [(CACSpokenCommandManager *)self stagedTextInsertionSpecifier];
  [v12 setAxElement:self->_focusedElement];

  id v13 = [(CACSpokenCommandManager *)self stagedTextInsertionSpecifier];
  [(CACSpokenCommandManager *)self setPreviousTextInsertionSpecifier:v13];
}

- (void)enterDictatedString:(id)a3
{
  [(CACSpokenCommandManager *)self insertDictatedString:a3];
  id v4 = [(AXElement *)self->_focusedElement uiElement];
  [v4 performAXAction:2054];
}

- (id)primaryStringForCommandIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_recognizers count])
  {
    id v5 = [(CACSpokenCommandManager *)self _templateSpokenCommandWithIdentifier:v4];
    uint64_t v6 = [v5 strings];
    uint64_t v7 = [v6 firstObject];
  }
  else
  {
    id v5 = +[CACPreferences sharedPreferences];
    double v8 = [v5 localeIdentifier];
    uint64_t v6 = [v5 propertiesForCommandIdentifier:v4 localeIdentifier:v8];

    uint64_t v9 = [v6 objectForKey:@"BuiltInStrings"];
    uint64_t v7 = [v9 firstObject];
  }
  return v7;
}

- (void)_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSetInit != -1)
  {
    dispatch_once(&_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSetInit, &__block_literal_global_807);
    id v4 = v7;
  }
  id v5 = (void *)_clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSet;
  uint64_t v6 = [v4 identifier];
  LODWORD(v5) = [v5 containsObject:v6];

  if (v5) {
    [(CACSpokenCommandManager *)self setPreviousTextInsertionSpecifier:0];
  }
}

uint64_t __86__CACSpokenCommandManager__clearPreviousTextInsertionSpecifierBasedOnExecutedCommand___block_invoke()
{
  _clearPreviousTextInsertionSpecifierBasedOnExecutedCommand__sPotentiallyDestructiveCommandsSet = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"System.Cut", @"Text.EditingCompletion", @"System.KeyTab", @"System.Paste", @"System.Shake", @"System.Undo", @"Text.DeleteSelection", @"Text.DeleteAll", @"Text.DeletePhrase", @"Text.DeleteCurrentCharacter", @"Text.DeleteCurrentLine", @"Text.DeleteCurrentParagraph", @"Text.DeleteCurrentSentence", @"Text.DeleteCurrentWord", @"Text.DeleteNextCharacter", @"Text.DeleteNextCharactersUsingCardinalNumber", @"Text.DeleteNextLine",
                                                                                                     @"Text.DeleteNextLinesUsingCardinalNumber",
                                                                                                     @"Text.DeleteNextParagraph",
                                                                                                     @"Text.DeleteNextParagraphsUsingCardinalNumber",
                                                                                                     @"Text.DeleteNextSentence",
                                                                                                     @"Text.DeleteNextSentencesUsingCardinalNumber",
                                                                                                     @"Text.DeleteNextWord",
                                                                                                     @"Text.DeleteNextWordsUsingCardinalNumber",
                                                                                                     @"Text.DeletePreviousCharacter",
                                                                                                     @"Text.DeletePreviousCharactersUsingCardinalNumber",
                                                                                                     @"Text.DeletePreviousLine",
                                                                                                     @"Text.DeletePreviousLinesUsingCardinalNumber",
                                                                                                     @"Text.DeletePreviousParagraph",
                                                                                                     @"Text.DeletePreviousParagraphsUsingCardinalNumber",
                                                                                                     @"Text.DeletePreviousSentence",
                                                                                                     @"Text.DeletePreviousSentencesUsingCardinalNumber",
                                                                                                     @"Text.DeletePreviousWord",
                                                                                                     @"Text.DeletePreviousWordsUsingCardinalNumber",
                                                                                                     0);
  return MEMORY[0x270F9A758]();
}

- (BOOL)_isSystemSleeping
{
  id v2 = [MEMORY[0x263F229A0] server];
  if ([v2 isSystemSleeping])
  {
    uint64_t v3 = +[CACDisplayManager sharedManager];
    int v4 = [v3 carPlayConnected] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_closeAllRecognizers
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_recognizers;
  objc_sync_enter(v3);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v4 = self->_recognizers;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "speechRecognizer", (void)v9);
        [v8 closeSpeechRecognizer];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_recognizers removeAllObjects];
  objc_sync_exit(v3);
}

- (void)handleSRSystemServerError
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __52__CACSpokenCommandManager_handleSRSystemServerError__block_invoke;
  v2[3] = &unk_264D115D0;
  v2[4] = self;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v2];
}

uint64_t __52__CACSpokenCommandManager_handleSRSystemServerError__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopListening];
  [*(id *)(a1 + 32) _flushBuiltInLMIdentifierTable];
  [*(id *)(a1 + 32) _closeAllRecognizers];
  +[CACSpeechSystem closeSpeechSystem];
  id v2 = *(void **)(a1 + 32);
  return [v2 _startListening];
}

- (void)handleSRSystemBeginUtteranceWithID:(unint64_t)a3
{
}

- (BOOL)doesCurrentLanguageSupportInterWordSpaces
{
  id v2 = +[CACPreferences sharedPreferences];
  [v2 bestLocaleIdentifier];
  char v3 = RXIsLocaleWithNoSpaceInPostITN() ^ 1;

  return v3;
}

- (void)_handleLanguageChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__CACSpokenCommandManager__handleLanguageChange__block_invoke;
  v2[3] = &unk_264D115D0;
  v2[4] = self;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v2];
}

void __48__CACSpokenCommandManager__handleLanguageChange__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 289) = 0;
  [*(id *)(a1 + 32) _resetRecognitionSystems];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__CACSpokenCommandManager__handleLanguageChange__block_invoke_2;
  block[3] = &unk_264D115D0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__CACSpokenCommandManager__handleLanguageChange__block_invoke_2(uint64_t a1)
{
  id v2 = +[CACDisplayManager sharedManager];
  [v2 displayReadyToUseWithLanguageMessage];

  char v3 = *(void **)(a1 + 32);
  return [v3 _updateAssetPurgeability];
}

- (void)_resetRecognitionSystems
{
  [(CACSpokenCommandManager *)self _stopListening];
  [(CACSpokenCommandManager *)self _flushBuiltInLMIdentifierTable];
  [(CACSpokenCommandManager *)self _closeAllRecognizers];
  +[CACSpeechSystem closeSpeechSystem];
  +[CACEmojiManager resetSharedManager];
  if (self->_dictationRecognizerMode == 3) {
    self->_int dictationRecognizerMode = 0;
  }
  [(CACSpokenCommandManager *)self _startListening];
}

- (void)startListening
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__CACSpokenCommandManager_startListening__block_invoke;
  v2[3] = &unk_264D115D0;
  v2[4] = self;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v2];
}

uint64_t __41__CACSpokenCommandManager_startListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startListening];
}

- (void)_startListening
{
  if (!self->_isListening)
  {
    self->_isListening = 1;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_startedListeningTimeStamp = v3;
    [(CACSpokenCommandManager *)self _intializeBuiltInLMIdentifierTableIfNecessary];
    [(CACSpokenCommandManager *)self _createCommandRecognizersIfNecessary];
    [(CACSpokenCommandManager *)self synchronizeRecognizersWithReason:kSRUISyncReasonStartedListening];
    [(CACSpokenCommandManager *)self _handlePendingCommands];
    if ((int)(CFPreferencesGetAppIntegerValue(@"RXDebugAutomationMode", @"com.apple.SpeechRecognitionCore.speechrecognitiond", 0) << 24) >= 1)
    {
      dispatch_time_t v4 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __42__CACSpokenCommandManager__startListening__block_invoke;
      block[3] = &unk_264D115D0;
      void block[4] = self;
      dispatch_after(v4, MEMORY[0x263EF83A0], block);
    }
    uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 postNotificationName:@"CACSpokenCommandManagerStartedListening" object:0];
  }
}

uint64_t __42__CACSpokenCommandManager__startListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _microphoneTurnedOn];
}

- (void)stopListening
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__CACSpokenCommandManager_stopListening__block_invoke;
  v2[3] = &unk_264D115D0;
  v2[4] = self;
  [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v2];
}

uint64_t __40__CACSpokenCommandManager_stopListening__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopListening];
}

- (void)_stopListening
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_isListening)
  {
    self->_isListening = 0;
    double v3 = self->_recognizers;
    objc_sync_enter(v3);
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    dispatch_time_t v4 = self->_recognizers;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "stopListening", (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    objc_sync_exit(v3);
    if ([(CACSpokenCommandManager *)self currentInteractionLevel] != 1) {
      [(CACSpokenCommandManager *)self _resetInteractionLevel];
    }
    [(CACSpokenCommandManager *)self updateStatusIndicatorView];
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_924);
  }
}

void __41__CACSpokenCommandManager__stopListening__block_invoke()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 hideAnyOverlay];
}

- (BOOL)isListening
{
  return self->_isListening;
}

- (BOOL)showUIAsListening
{
  return 1;
}

- (BOOL)_shouldBeListening
{
  return ![(CACSpokenCommandManager *)self _isSystemSleeping];
}

- (id)copySupportedCommandWithIdentifier:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v17 = self->_recognizers;
  objc_sync_enter(v17);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = self->_recognizers;
  uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v19 = *(void *)v26;
    double v20 = 0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v8 = objc_msgSend(v7, "spokenCommands", v17);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v22 != v10) {
                objc_enumerationMutation(v8);
              }
              long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v13 = [v12 identifier];
              int v14 = [v4 isEqualToString:v13];

              if (v14)
              {
                uint64_t v15 = [v12 copy];

                double v20 = (void *)v15;
                goto LABEL_16;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v5 = [(NSMutableArray *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }
  else
  {
    double v20 = 0;
  }

  objc_sync_exit(v17);
  return v20;
}

- (void)_handlePendingCommands
{
  while ([(NSMutableArray *)self->_pendingCommandToExecute count])
  {
    double v3 = [(NSMutableArray *)self->_pendingCommandToExecute objectAtIndexedSubscript:0];
    id v4 = [(CACSpokenCommandManager *)self _templateSpokenCommandWithIdentifier:v3];
    if (v4)
    {
      uint64_t v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v5 handleRecognizedCommand:v4];
    }
    [(NSMutableArray *)self->_pendingCommandToExecute removeObjectAtIndex:0];
  }
}

- (void)handleCommandWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__CACSpokenCommandManager_handleCommandWithIdentifier___block_invoke;
  v6[3] = &unk_264D117C0;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

unsigned char *__55__CACSpokenCommandManager_handleCommandWithIdentifier___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 240) addObject:*(void *)(a1 + 40)];
  double result = *(unsigned char **)(a1 + 32);
  if (result[272])
  {
    return (unsigned char *)[result _handlePendingCommands];
  }
  return result;
}

- (id)synchronousRecognitionOfString:(id)a3 timeoutInterval:(double)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = __Block_byref_object_copy__0;
  uint64_t v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__CACSpokenCommandManager_synchronousRecognitionOfString_timeoutInterval___block_invoke;
  v12[3] = &unk_264D11EF8;
  v12[4] = &v13;
  [(CACSpokenCommandManager *)self _startSynchronousRemoteRecognitionWithCompletionBlock:v12];
  +[CACSpeechSystem recognizeString:v6];
  if (!v14[5])
  {
    while (1)
    {
      usleep(0xF4240u);
      a4 = a4 + -1.0;
      uint64_t v7 = v14[5];
      if (a4 <= 0.0) {
        break;
      }
      if (v7) {
        goto LABEL_7;
      }
    }
    if (!v7)
    {
      uint64_t v8 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Timed out!", @"ERROR:", 0);
      uint64_t v9 = (void *)v14[5];
      v14[5] = v8;
    }
  }
LABEL_7:
  [(CACSpokenCommandManager *)self _cancelSynchronousRemoteRecognition];
  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __74__CACSpokenCommandManager_synchronousRecognitionOfString_timeoutInterval___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        id v10 = objc_opt_new();
        long long v11 = [v9 identifier];
        [v10 setObject:v11 forKey:@"CommandIdentifier"];

        long long v12 = [v9 recognizedParameters];
        uint64_t v13 = [v12 objectForKey:kCACCommandParameterText];

        if (v13)
        {
          int v14 = [v9 recognizedParameters];
          uint64_t v15 = [v14 objectForKey:kCACCommandParameterText];
          [v10 setObject:v15 forKey:@"RecognizedText"];
        }
        [v4 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [v4 count];
  uint64_t v17 = NSDictionary;
  if (v16)
  {
    id v18 = [NSNumber numberWithBool:a3];
    uint64_t v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v4, @"CommandInfoDictionaries", v18, @"WasCloseResult", 0);
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  else
  {
    uint64_t v22 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Timed out!", @"ERROR:", 0);
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
    id v18 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

- (id)synchronousRecognitionUsingCommandIdentifier:(id)a3 parameters:(id)a4 timeoutInterval:(double)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = CACLogRecognition();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[CACSpokenCommandManager synchronousRecognitionUsingCommandIdentifier:parameters:timeoutInterval:]((uint64_t)v8, v9, v10);
  }

  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  long long v36 = __Block_byref_object_copy__0;
  long long v37 = __Block_byref_object_dispose__0;
  id v38 = 0;
  id v11 = [(CACSpokenCommandManager *)self copySupportedCommandWithIdentifier:v8];
  if (([v8 isEqualToString:@"Dictation.Streaming"] & 1) != 0
    || ([v8 isEqualToString:@"Dictation.Literal"] & 1) != 0
    || [v8 isEqualToString:@"Dictation.SpellAs"])
  {
    long long v12 = +[CACDisplayManager sharedManager];
    [v12 hideAnyNonInteractiveOverlay];

    uint64_t v13 = [v9 firstObject];

    if (!v13) {
      goto LABEL_9;
    }
    int v14 = [v9 firstObject];
    [(CACSpokenCommandManager *)self insertDictatedString:v14];

    sleep(1u);
    uint64_t v15 = objc_opt_new();
    [v15 setObject:v8 forKey:@"CommandIdentifier"];
    uint64_t v16 = [v9 firstObject];
    [v15 setObject:v16 forKey:@"RecognizedText"];

    uint64_t v17 = NSDictionary;
    v39[0] = v15;
    id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    uint64_t v19 = [NSNumber numberWithBool:0];
    uint64_t v20 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v18, @"CommandInfoDictionaries", v19, @"WasCloseResult", 0);
    long long v21 = (void *)v34[5];
    v34[5] = v20;

    goto LABEL_8;
  }
  if (v11)
  {
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke;
    v32[3] = &unk_264D11EF8;
    v32[4] = &v33;
    [(CACSpokenCommandManager *)self _startSynchronousRemoteRecognitionWithCompletionBlock:v32];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke_2;
    v27[3] = &unk_264D11A18;
    id v28 = v8;
    id v29 = v9;
    id v30 = v11;
    uint64_t v31 = self;
    [(CACSpokenCommandManager *)self performOnRecognizerSynchronizationDispatchQueueIfRunning:v27];
    if (!v34[5])
    {
      while (1)
      {
        usleep(0xF4240u);
        a5 = a5 + -1.0;
        uint64_t v24 = v34[5];
        if (a5 <= 0.0) {
          break;
        }
        if (v24) {
          goto LABEL_19;
        }
      }
      if (!v24)
      {
        uint64_t v25 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Timed out!", @"ERROR:", 0);
        long long v26 = (void *)v34[5];
        v34[5] = v25;
      }
    }
LABEL_19:
    [(CACSpokenCommandManager *)self _cancelSynchronousRemoteRecognition];

    uint64_t v15 = v28;
LABEL_8:
  }
LABEL_9:
  id v22 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  return v22;
}

void __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v27 + 1) + 8 * v8);
        id v10 = objc_opt_new();
        id v11 = [v9 identifier];
        [v10 setObject:v11 forKey:@"CommandIdentifier"];

        long long v12 = [v9 recognizedParameters];
        uint64_t v13 = [v12 objectForKey:kCACCommandParameterText];

        if (v13)
        {
          int v14 = [v9 recognizedParameters];
          uint64_t v15 = [v14 objectForKey:kCACCommandParameterText];
          [v10 setObject:v15 forKey:@"RecognizedText"];
        }
        [v4 addObject:v10];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [v4 count];
  uint64_t v17 = NSDictionary;
  if (v16)
  {
    id v18 = [NSNumber numberWithBool:a3];
    uint64_t v19 = objc_msgSend(v17, "dictionaryWithObjectsAndKeys:", v4, @"CommandInfoDictionaries", v18, @"WasCloseResult", 0);
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    long long v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  else
  {
    uint64_t v22 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", @"Timed out!", @"ERROR:", 0);
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8);
    id v18 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;
  }
}

void __99__CACSpokenCommandManager_synchronousRecognitionUsingCommandIdentifier_parameters_timeoutInterval___block_invoke_2(id *a1)
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  id v2 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
  id v3 = [v2 commandStringsTableForLocaleIdentifier:@"en_US"];

  id v4 = a1[4];
  uint64_t v5 = [MEMORY[0x263F78BC8] activeTargetTypes];
  uint64_t v6 = [v3 unparsedCommandTextForCommandIdentifier:v4 targetTypes:v5];

  if ([a1[4] isEqualToString:@"System.SwitchToApplication"])
  {
    uint64_t v7 = [a1[5] firstObject];
    if (v7)
    {
      long long v87 = a1;
      uint64_t v90 = v6;
      uint64_t v92 = v3;
      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      obuint64_t j = +[CACApplicationUtilities runningApplications];
      uint64_t v8 = [obj countByEnumeratingWithState:&v102 objects:v128 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v103;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v103 != v10) {
              objc_enumerationMutation(obj);
            }
            long long v12 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            uint64_t v13 = [v12 objectForKey:kCACCommandParameterAppName];
            int v14 = [v13 lowercaseString];
            uint64_t v15 = [v7 lowercaseString];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              long long v21 = [MEMORY[0x263EFF9A0] dictionary];
              v126 = @"MatchingApps";
              v124[0] = v7;
              v123[0] = @"TargetAppName";
              v123[1] = @"TargetAppIdentifier";
              long long v30 = [v12 objectForKey:kCACCommandParameterAppIdentifier];
              v124[1] = v30;
              uint64_t v31 = [NSDictionary dictionaryWithObjects:v124 forKeys:v123 count:2];
              dispatch_time_t v125 = v31;
              uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v125 count:1];
              v127 = v32;
              uint64_t v33 = [NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];
              [v21 setObject:v33 forKey:@"BuiltInLM.SwitchableApplication"];

              long long v34 = [NSString stringWithFormat:@"%@:%@", v87[4], v7];
              [v21 setObject:v34 forKey:@"Text"];

              [v87[6] setRecognizedParameters:v21];
              [v87[7] handleRecognizedCommand:v87[6]];
              goto LABEL_36;
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v102 objects:v128 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_37:

LABEL_38:
      uint64_t v6 = v90;
      id v3 = v92;
      goto LABEL_39;
    }
    goto LABEL_39;
  }
  if ([v6 rangeOfString:*MEMORY[0x263F78C58]] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ([v6 rangeOfString:*MEMORY[0x263F78C28]] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 rangeOfString:@"BuiltInLM.Dictation"] == 0x7FFFFFFFFFFFFFFFLL
        || [v6 rangeOfString:@"BuiltInLM.Dictation.2"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v6 rangeOfString:@"BuiltInLM.Dictation"] == 0x7FFFFFFFFFFFFFFFLL)
        {
          v106 = @"Text";
          uint64_t v17 = [a1[6] strings];
          id v18 = [v17 firstObject];
          v107 = v18;
          uint64_t v7 = [NSDictionary dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        }
        else
        {
          uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
          char v45 = [a1[5] firstObject];

          if (v45)
          {
            v109[0] = @"Text";
            id v46 = [a1[5] firstObject];
            v109[1] = @"TextVariants";
            v110[0] = v46;
            uint64_t v47 = [a1[5] firstObject];
            v108 = v47;
            [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
            id v49 = v48 = v6;
            v110[1] = v49;
            uint64_t v50 = [NSDictionary dictionaryWithObjects:v110 forKeys:v109 count:2];
            [v7 setObject:v50 forKey:@"BuiltInLM.Dictation"];

            uint64_t v6 = v48;
          }
          long long v51 = NSString;
          id v52 = a1[4];
          id v53 = [a1[5] firstObject];
          uint64_t v54 = [v51 stringWithFormat:@"%@:%@", v52, v53];
          [v7 setObject:v54 forKey:@"Text"];
        }
      }
      else
      {
        uint64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
        if ([a1[5] count] == 2)
        {
          v115[0] = @"Text";
          [a1[5] firstObject];
          v91 = v6;
          v59 = long long v58 = v7;
          v115[1] = @"TextVariants";
          v116[0] = v59;
          uint64_t v60 = [a1[5] firstObject];
          v114 = v60;
          long long v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v114 count:1];
          v116[1] = v61;
          [NSDictionary dictionaryWithObjects:v116 forKeys:v115 count:2];
          v63 = long long v62 = a1;
          [v7 setObject:v63 forKey:@"BuiltInLM.Dictation"];

          v112[0] = @"Text";
          id v64 = [v62[5] objectAtIndex:1];
          v112[1] = @"TextVariants";
          v113[0] = v64;
          uint64_t v65 = [v62[5] objectAtIndex:1];
          uint64_t v111 = v65;
          id v66 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v111 count:1];
          v113[1] = v66;
          id v67 = [NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:2];
          [v7 setObject:v67 forKey:@"BuiltInLM.Dictation.2"];

          a1 = v62;
          int v68 = NSString;
          id v69 = v62[4];
          id v70 = [v62[5] firstObject];
          long long v71 = [v62[5] objectAtIndex:1];
          long long v72 = [v68 stringWithFormat:@"%@:%@,%@", v69, v70, v71];
          [v58 setObject:v72 forKey:@"Text"];

          uint64_t v6 = v91;
          uint64_t v7 = v58;
        }
      }
      [a1[6] setRecognizedParameters:v7];
      [a1[7] handleRecognizedCommand:a1[6]];
      goto LABEL_39;
    }
    uint64_t v7 = [a1[5] firstObject];
    if (!v7) {
      goto LABEL_39;
    }
    uint64_t v35 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v36 = [v35 isActiveOverlayType:@"NumberedGrid"];

    uint64_t v90 = v6;
    uint64_t v92 = v3;
    v89 = a1;
    if (v36)
    {
      long long v37 = +[CACDisplayManager sharedManager];
      uint64_t v38 = [v37 labeledElementsForGrid];
    }
    else
    {
      uint64_t v55 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v56 = [v55 isActiveOverlayType:@"NumberedElements"];

      if (!v56)
      {
        uint64_t v57 = 0;
        goto LABEL_50;
      }
      long long v37 = +[CACDisplayManager sharedManager];
      uint64_t v38 = [v37 labeledElementsForItemNumbers];
    }
    uint64_t v57 = (void *)v38;

LABEL_50:
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v73 = v57;
    uint64_t v74 = [v73 countByEnumeratingWithState:&v94 objects:v119 count:16];
    if (v74)
    {
      uint64_t v75 = v74;
      uint64_t v76 = *(void *)v95;
      while (2)
      {
        for (uint64_t j = 0; j != v75; ++j)
        {
          if (*(void *)v95 != v76) {
            objc_enumerationMutation(v73);
          }
          uint64_t v78 = *(void **)(*((void *)&v94 + 1) + 8 * j);
          id v79 = [v78 numberedLabel];
          id v80 = [v79 lowercaseString];
          long long v81 = v7;
          long long v82 = [v7 lowercaseString];
          int v83 = [v80 isEqualToString:v82];

          if (v83)
          {
            long long v84 = [MEMORY[0x263EFF9A0] dictionary];
            v117[0] = @"Text";
            v117[1] = kCACCommandParameterLabeledElement;
            uint64_t v7 = v81;
            v118[0] = v81;
            v118[1] = v78;
            long long v85 = [NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:2];
            [v84 setObject:v85 forKey:*MEMORY[0x263F78C28]];

            long long v86 = [NSString stringWithFormat:@"%@:%@", v89[4], v81];
            [v84 setObject:v86 forKey:@"Text"];

            [v89[6] setRecognizedParameters:v84];
            [v89[7] handleRecognizedCommand:v89[6]];

            goto LABEL_60;
          }
          uint64_t v7 = v81;
        }
        uint64_t v75 = [v73 countByEnumeratingWithState:&v94 objects:v119 count:16];
        if (v75) {
          continue;
        }
        break;
      }
    }
LABEL_60:

    goto LABEL_38;
  }
  uint64_t v7 = [a1[5] firstObject];
  if (v7)
  {
    uint64_t v90 = v6;
    uint64_t v92 = v3;
    long long v88 = a1;
    uint64_t v19 = (void *)[*((id *)a1[7] + 31) copyTableOfCollectedElementsByTitle];
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    obuint64_t j = v19;
    uint64_t v20 = [v19 allKeys];
    long long v21 = [v20 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    uint64_t v22 = [v21 countByEnumeratingWithState:&v98 objects:v122 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v99;
      while (2)
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v99 != v24) {
            objc_enumerationMutation(v21);
          }
          long long v26 = *(void **)(*((void *)&v98 + 1) + 8 * k);
          long long v27 = [v26 lowercaseString];
          long long v28 = [v7 lowercaseString];
          int v29 = [v27 isEqualToString:v28];

          if (v29)
          {
            long long v39 = [obj objectForKey:v26];
            if ([v39 count])
            {
              uint64_t v40 = [v39 objectAtIndex:0];
              if (v40)
              {
                long long v41 = (void *)v40;
                uint64_t v42 = [MEMORY[0x263EFF9A0] dictionary];
                v120[0] = @"Text";
                v120[1] = kCACCommandParameterLabeledElement;
                v121[0] = v7;
                v121[1] = v41;
                int v43 = [NSDictionary dictionaryWithObjects:v121 forKeys:v120 count:2];
                [v42 setObject:v43 forKey:*MEMORY[0x263F78C58]];

                uint64_t v44 = [NSString stringWithFormat:@"%@:%@", v88[4], v7];
                [v42 setObject:v44 forKey:@"Text"];

                [v88[6] setRecognizedParameters:v42];
                [v88[7] handleRecognizedCommand:v88[6]];
              }
            }

            goto LABEL_36;
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v98 objects:v122 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
LABEL_36:

    goto LABEL_37;
  }
LABEL_39:
}

- (id)allCustomCommandsDetail
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v76 = [MEMORY[0x263EFF980] array];
  id v2 = +[CACPreferences sharedPreferences];
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id v3 = [v2 bestLocaleIdentifier];
  id v4 = [v2 commandIdentifiersForCommandSetIdentifier:@"Custom" localeIdentifier:v3];

  obuint64_t j = v4;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = @"Identifier";
    uint64_t v8 = *(void *)v89;
    uint64_t v9 = @"CustomCommands";
    long long v72 = v2;
    uint64_t v64 = *(void *)v89;
    do
    {
      uint64_t v10 = 0;
      uint64_t v65 = v6;
      do
      {
        if (*(void *)v89 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v78 = v10;
        uint64_t v11 = *(void *)(*((void *)&v88 + 1) + 8 * v10);
        id v12 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v13 = [v2 propertiesForCommandIdentifier:v11];
        int v14 = (void *)[v12 initWithDictionary:v13];

        [v14 setObject:v11 forKey:v7];
        uint64_t v15 = [v14 objectForKey:v9];
        int v16 = [v2 bestLocaleIdentifier];
        uint64_t v17 = [v15 objectForKey:v16];
        id v18 = [v17 firstObject];

        uint64_t v19 = v14;
        if (v18) {
          [v14 setObject:v18 forKey:@"UnparsedString"];
        }
        uint64_t v20 = objc_msgSend(v14, "objectForKey:", @"CustomType", v64);
        if ([v20 isEqualToString:@"PasteText"])
        {
          id v21 = [v19 objectForKey:@"CustomTextToInsert"];
          if (v21)
          {
            uint64_t v22 = [v19 objectForKey:@"CustomTextToInsert"];
            [v19 setObject:v22 forKey:@"InsertionText"];
          }
          else
          {
            [v19 setObject:&stru_26EB332F0 forKey:@"InsertionText"];
          }
        }
        else
        {
          if ([v20 isEqualToString:@"PasteBoard"]) {
            goto LABEL_39;
          }
          if ([v20 isEqualToString:@"RunShortcutsWorkflow"])
          {
            uint64_t v23 = v6;
            uint64_t v24 = v9;
            uint64_t v25 = v8;
            long long v26 = v7;
            uint64_t v27 = [v19 objectForKey:@"CustomShortcutsWorkflow"];
            if (v27)
            {
              long long v28 = [v19 objectForKey:@"CustomShortcutsWorkflow"];
              [v19 setObject:v28 forKey:@"ShortcutIdentifier"];
            }
            else
            {
              [v19 setObject:&stru_26EB332F0 forKey:@"ShortcutIdentifier"];
            }
            id v21 = (id)v27;
            uint64_t v7 = v26;
            uint64_t v8 = v25;
            uint64_t v9 = v24;
            uint64_t v6 = v23;
            id v2 = v72;
          }
          else if ([v20 isEqualToString:@"RunGesture"])
          {
            id v67 = v18;
            int v29 = (void *)MEMORY[0x263F08928];
            uint64_t v30 = objc_opt_class();
            [v19 objectForKeyedSubscript:@"CustomGesture"];
            v32 = uint64_t v31 = v19;
            id v87 = 0;
            uint64_t v33 = [v29 unarchivedObjectOfClass:v30 fromData:v32 error:&v87];
            id v21 = v87;

            if (v33)
            {
              id v68 = v21;
              id v70 = v31;
              id v66 = v20;
              long long v34 = objc_opt_new();
              if ([v33 numberOfEvents])
              {
                unint64_t v35 = 0;
                uint64_t v74 = v34;
                do
                {
                  int v36 = objc_opt_new();
                  long long v37 = (void *)MEMORY[0x263EFF910];
                  [v33 timeAtEventIndex:v35];
                  uint64_t v38 = objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
                  uint64_t v77 = v36;
                  [v36 setObject:v38 forKey:@"GestureEventDate"];

                  long long v81 = objc_opt_new();
                  long long v83 = 0u;
                  long long v84 = 0u;
                  long long v85 = 0u;
                  long long v86 = 0u;
                  id v79 = [v33 fingerIdentifiersAtEventIndex:v35];
                  uint64_t v39 = [v79 countByEnumeratingWithState:&v83 objects:v94 count:16];
                  if (v39)
                  {
                    uint64_t v40 = v39;
                    uint64_t v80 = *(void *)v84;
                    do
                    {
                      for (uint64_t i = 0; i != v40; ++i)
                      {
                        if (*(void *)v84 != v80) {
                          objc_enumerationMutation(v79);
                        }
                        uint64_t v42 = *(void *)(*((void *)&v83 + 1) + 8 * i);
                        int v43 = objc_opt_new();
                        [v43 setObject:v42 forKey:@"FingerIdentifier"];
                        [v33 pointForFingerIdentifier:v42 atEventIndex:v35];
                        double v45 = v44;
                        v92[0] = @"x";
                        *(float *)&double v46 = v46;
                        uint64_t v47 = [NSNumber numberWithFloat:v46];
                        v92[1] = @"y";
                        v93[0] = v47;
                        *(float *)&double v48 = v45;
                        id v49 = [NSNumber numberWithFloat:v48];
                        v93[1] = v49;
                        uint64_t v50 = [NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
                        [v43 setObject:v50 forKey:@"FingerPoint"];

                        long long v51 = NSNumber;
                        [v33 forceForFingerIdentifier:v42 atEventIndex:v35];
                        *(float *)&double v52 = v52;
                        id v53 = [v51 numberWithFloat:v52];
                        [v43 setObject:v53 forKey:@"FingerForce"];

                        [v81 addObject:v43];
                      }
                      uint64_t v40 = [v79 countByEnumeratingWithState:&v83 objects:v94 count:16];
                    }
                    while (v40);
                  }

                  [v77 setObject:v81 forKey:@"GestureEventFingers"];
                  long long v34 = v74;
                  [v74 addObject:v77];

                  ++v35;
                }
                while (v35 < [v33 numberOfEvents]);
              }
              uint64_t v19 = v70;
              [v70 setObject:v34 forKey:@"GestureEvents"];
              id v2 = v72;
              uint64_t v7 = @"Identifier";
              uint64_t v8 = v64;
              uint64_t v6 = v65;
              uint64_t v9 = @"CustomCommands";
              uint64_t v20 = v66;
              id v21 = v68;
            }
            else
            {
              uint64_t v75 = [v21 localizedDescription];
              [v31 setObject:v75 forKey:@"GesturesError"];
              uint64_t v19 = v31;
              long long v34 = (void *)v75;
            }

            id v18 = v67;
          }
          else
          {
            if (![v20 isEqualToString:@"RunUserActionFlow"]) {
              goto LABEL_39;
            }
            uint64_t v54 = (void *)MEMORY[0x263F08928];
            uint64_t v55 = objc_opt_class();
            [v19 objectForKeyedSubscript:@"CustomUserActionFlow"];
            int v56 = v71 = v19;
            id v82 = 0;
            uint64_t v57 = [v54 unarchivedObjectOfClass:v55 fromData:v56 error:&v82];
            id v58 = v82;

            id v69 = v58;
            if (v57)
            {
              long long v59 = [v57 plistDescription];
              uint64_t v19 = v71;
              uint64_t v60 = v71;
              long long v61 = v59;
              long long v62 = @"UserActionFlow";
            }
            else
            {
              long long v59 = [v58 localizedDescription];
              uint64_t v19 = v71;
              uint64_t v60 = v71;
              long long v61 = v59;
              long long v62 = @"UserActionFlowError";
            }
            [v60 setObject:v61 forKey:v62];

            id v21 = v69;
          }
        }

LABEL_39:
        [v76 addObject:v19];

        uint64_t v10 = v78 + 1;
      }
      while (v78 + 1 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v88 objects:v95 count:16];
    }
    while (v6);
  }

  return v76;
}

- (id)allCommandsForLocaleIdentifier:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v47 = [MEMORY[0x263EFF980] array];
  double v48 = [MEMORY[0x263EFF9A0] dictionary];
  id v49 = +[CACPreferences sharedPreferences];
  id v4 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
  int v43 = v3;
  uint64_t v42 = [v4 commandStringsTableForLocaleIdentifier:v3];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  uint64_t v5 = [(id)objc_opt_class() _allCommandIdentifiers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v63 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        uint64_t v11 = [(id)objc_opt_class() commandPropertiesForIdentifier:v10];
        id v12 = (void *)[v11 mutableCopy];

        [v12 setObject:v10 forKey:@"Identifier"];
        [v48 setObject:v12 forKey:v10];
        uint64_t v13 = [MEMORY[0x263F78BC8] activeTargetTypes];
        int v14 = [v42 unparsedCommandTextForCommandIdentifier:v10 targetTypes:v13];

        if (v14) {
          [v12 setObject:v14 forKey:@"UnparsedString"];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v7);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v15 = [v49 bestLocaleIdentifier];
  int v16 = [v49 commandIdentifiersForCommandSetIdentifier:@"Custom" localeIdentifier:v15];

  obuint64_t j = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v58 + 1) + 8 * j);
        id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v23 = [v49 propertiesForCommandIdentifier:v21];
        uint64_t v24 = (void *)[v22 initWithDictionary:v23];

        [v24 setObject:v21 forKey:@"Identifier"];
        uint64_t v25 = [v24 objectForKey:@"CustomCommands"];
        long long v26 = [v49 bestLocaleIdentifier];
        uint64_t v27 = [v25 objectForKey:v26];
        long long v28 = [v27 firstObject];

        if (v28) {
          [v24 setObject:v28 forKey:@"UnparsedString"];
        }
        [v48 setObject:v24 forKey:v21];
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v18);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v40 = [v49 availableCommandSetIdentifiers];
  uint64_t v44 = [v40 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (v44)
  {
    uint64_t v41 = *(void *)v55;
    do
    {
      int v29 = 0;
      do
      {
        if (*(void *)v55 != v41) {
          objc_enumerationMutation(v40);
        }
        id obja = v29;
        uint64_t v30 = *(void *)(*((void *)&v54 + 1) + 8 * (void)v29);
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        uint64_t v31 = [v49 commandIdentifiersForCommandSetIdentifier:v30 localeIdentifier:v43];
        uint64_t v32 = [v31 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v51;
          do
          {
            for (uint64_t k = 0; k != v33; ++k)
            {
              if (*(void *)v51 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v50 + 1) + 8 * k);
              long long v37 = [v48 objectForKey:v36];
              [v47 addObject:v37];
              [v37 setObject:v30 forKey:@"CommandSet"];
              uint64_t v38 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v49, "isEnabledForCommandIdentifier:", v36));
              [v37 setObject:v38 forKey:@"Enabled"];
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v50 objects:v66 count:16];
          }
          while (v33);
        }

        int v29 = obja + 1;
      }
      while (obja + 1 != (char *)v44);
      uint64_t v44 = [v40 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (v44);
  }

  return v47;
}

- (id)groupedCommandsForLocaleIdentifier:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v46 = [MEMORY[0x263EFF980] array];
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = +[CACPreferences sharedPreferences];
  uint64_t v6 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
  double v45 = v3;
  uint64_t v44 = [v6 commandStringsTableForLocaleIdentifier:v3];

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = [(id)objc_opt_class() _allCommandIdentifiers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v63 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        id v12 = [(id)objc_opt_class() commandPropertiesForIdentifier:v11];
        uint64_t v13 = (void *)[v12 mutableCopy];

        [v13 setObject:v11 forKey:@"Identifier"];
        [v4 setObject:v13 forKey:v11];
        int v14 = [MEMORY[0x263F78BC8] activeTargetTypes];
        uint64_t v15 = [v44 unparsedCommandTextForCommandIdentifier:v11 targetTypes:v14];

        if (v15) {
          [v13 setObject:v15 forKey:@"UnparsedString"];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v8);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  int v16 = [v5 bestLocaleIdentifier];
  uint64_t v17 = [v5 commandIdentifiersForCommandSetIdentifier:@"Custom" localeIdentifier:v16];

  id v42 = v17;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v58 objects:v68 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    id obja = *(id *)v59;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(id *)v59 != obja) {
          objc_enumerationMutation(v42);
        }
        uint64_t v21 = *(void *)(*((void *)&v58 + 1) + 8 * j);
        id v22 = objc_alloc(MEMORY[0x263EFF9A0]);
        uint64_t v23 = [v5 propertiesForCommandIdentifier:v21];
        uint64_t v24 = (void *)[v22 initWithDictionary:v23];

        [v24 setObject:v21 forKey:@"Identifier"];
        uint64_t v25 = [v24 objectForKey:@"CustomCommands"];
        long long v26 = [v5 bestLocaleIdentifier];
        uint64_t v27 = [v25 objectForKey:v26];
        long long v28 = [v27 firstObject];

        if (v28) {
          [v24 setObject:v28 forKey:@"UnparsedString"];
        }
        [v4 setObject:v24 forKey:v21];
      }
      uint64_t v19 = [v42 countByEnumeratingWithState:&v58 objects:v68 count:16];
    }
    while (v19);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v41 = [v5 availableCommandSetIdentifiers];
  id objb = (id)[v41 countByEnumeratingWithState:&v54 objects:v67 count:16];
  if (objb)
  {
    id v43 = *(id *)v55;
    do
    {
      for (uint64_t k = 0; k != objb; uint64_t k = (char *)k + 1)
      {
        if (*(id *)v55 != v43) {
          objc_enumerationMutation(v41);
        }
        uint64_t v30 = *(void *)(*((void *)&v54 + 1) + 8 * (void)k);
        uint64_t v31 = [MEMORY[0x263EFF9A0] dictionary];
        [v31 setObject:v30 forKey:@"Identifier"];
        uint64_t v32 = [v5 displayNameForCommandSetIdentifier:v30];
        [v31 setObject:v32 forKey:@"Text"];

        uint64_t v33 = [MEMORY[0x263EFF980] array];
        [v31 setObject:v33 forKey:@"Commands"];
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        uint64_t v34 = [v5 commandIdentifiersForCommandSetIdentifier:v30 localeIdentifier:v45];
        uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v66 count:16];
        if (v35)
        {
          uint64_t v36 = v35;
          uint64_t v37 = *(void *)v51;
          do
          {
            for (uint64_t m = 0; m != v36; ++m)
            {
              if (*(void *)v51 != v37) {
                objc_enumerationMutation(v34);
              }
              uint64_t v39 = [v4 objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * m)];
              if (v39) {
                [v33 addObject:v39];
              }
            }
            uint64_t v36 = [v34 countByEnumeratingWithState:&v50 objects:v66 count:16];
          }
          while (v36);
        }

        [v46 addObject:v31];
      }
      id objb = (id)[v41 countByEnumeratingWithState:&v54 objects:v67 count:16];
    }
    while (objb);
  }

  return v46;
}

- (id)activeCommandsForLocaleIdentifier:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v22 = a3;
  id v4 = [MEMORY[0x263EFF980] array];
  uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = [(CACSpokenCommandManager *)self allCommandsForLocaleIdentifier:v22];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v11 = [v10 objectForKey:@"Identifier"];
        [v5 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v7);
  }

  uint64_t v21 = self->_recognizers;
  objc_sync_enter(v21);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = self->_recognizers;
  uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v25; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8 * j);
        if (objc_msgSend(v12, "isListening", v21))
        {
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v13 = [v12 spokenCommands];
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v28;
            do
            {
              for (uint64_t k = 0; k != v14; ++k)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = [*(id *)(*((void *)&v27 + 1) + 8 * k) identifier];
                uint64_t v18 = [v5 objectForKey:v17];

                if (v18)
                {
                  uint64_t v19 = [v12 type];
                  [v18 setObject:v19 forKey:@"RecognizerType"];

                  [v4 addObject:v18];
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
            }
            while (v14);
          }
        }
      }
      uint64_t v25 = [(NSMutableArray *)obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v25);
  }

  objc_sync_exit(v21);
  return v4;
}

- (id)_descriptionForAXTextUnit:(unint64_t)a3
{
  if (a3 > 4) {
    return @"unknown";
  }
  else {
    return off_264D11F50[a3];
  }
}

- (id)contextSummary
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  long long v98 = [MEMORY[0x263EFF9A0] dictionary];
  long long v105 = [MEMORY[0x263EFF980] array];
  long long v101 = self;
  id v3 = [(CACLabeledElementsCollection *)self->_labeledScreenElementsCollection copyTableOfCollectedElementsByTitle];
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v126 = 0u;
  long long v102 = v3;
  id v4 = [v3 allKeys];
  uint64_t v5 = [v4 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  obuint64_t j = v5;
  uint64_t v103 = [v5 countByEnumeratingWithState:&v123 objects:v130 count:16];
  if (v103)
  {
    uint64_t v100 = *(void *)v124;
    unint64_t v6 = 0x263F08000uLL;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v124 != v100) {
          objc_enumerationMutation(obj);
        }
        uint64_t v104 = v7;
        uint64_t v8 = [v102 objectForKey:*(void *)(*((void *)&v123 + 1) + 8 * v7)];
        long long v119 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        long long v122 = 0u;
        uint64_t v109 = [v8 countByEnumeratingWithState:&v119 objects:v129 count:16];
        if (v109)
        {
          id v106 = *(id *)v120;
          do
          {
            for (uint64_t i = 0; i != v109; ++i)
            {
              if (*(id *)v120 != v106) {
                objc_enumerationMutation(v8);
              }
              uint64_t v10 = *(void **)(*((void *)&v119 + 1) + 8 * i);
              uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
              [v10 rectangle];
              int v16 = [NSString stringWithFormat:@"(%4.0f, %4.0f, %4.0f, %4.0f)", v12, v13, v14, v15];
              [v11 setObject:v16 forKey:@"Rectangle"];

              unint64_t v17 = v6;
              uint64_t v18 = objc_msgSend(*(id *)(v6 + 2584), "numberWithInteger:", objc_msgSend(v8, "count"));
              [v11 setObject:v18 forKey:@"Count"];

              uint64_t v19 = [v10 element];
              uint64_t v20 = [v19 recognitionStrings];
              uint64_t v21 = [v20 firstObject];

              id v22 = [v19 application];
              uint64_t v23 = [v22 recognitionStrings];
              uint64_t v24 = [v23 firstObject];

              if (v21) {
                uint64_t v25 = v21;
              }
              else {
                uint64_t v25 = &stru_26EB332F0;
              }
              [v11 setObject:v25 forKey:@"Text"];
              if (v24) {
                long long v26 = v24;
              }
              else {
                long long v26 = &stru_26EB332F0;
              }
              [v11 setObject:v26 forKey:@"AppLabel"];
              long long v27 = [v19 value];
              if (v27)
              {
                long long v28 = [v19 value];
                [v11 setObject:v28 forKey:@"Value"];
              }
              else
              {
                [v11 setObject:&stru_26EB332F0 forKey:@"Value"];
              }

              long long v29 = [v10 numberedLabel];
              if (v29)
              {
                long long v30 = [v10 numberedLabel];
                [v11 setObject:v30 forKey:@"Number"];
              }
              else
              {
                [v11 setObject:&stru_26EB332F0 forKey:@"Number"];
              }

              unint64_t v6 = v17;
              long long v31 = objc_msgSend(*(id *)(v17 + 2584), "numberWithLongLong:", objc_msgSend(v19, "traits"));
              [v11 setObject:v31 forKey:@"Traits"];

              [v105 addObject:v11];
            }
            uint64_t v109 = [v8 countByEnumeratingWithState:&v119 objects:v129 count:16];
          }
          while (v109);
        }

        uint64_t v7 = v104 + 1;
      }
      while (v104 + 1 != v103);
      uint64_t v103 = [obj countByEnumeratingWithState:&v123 objects:v130 count:16];
    }
    while (v103);
  }

  [v98 setObject:v105 forKey:@"Elements"];
  uint64_t v110 = [MEMORY[0x263EFF980] array];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v32 = +[CACDisplayManager sharedManager];
  long long v33 = objc_msgSend(v32, "_test_activeEditingOverlayElements");

  id v107 = v33;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v115 objects:v128 count:16];
  long long v35 = v101;
  if (v34)
  {
    uint64_t v36 = v34;
    uint64_t v37 = *(void *)v116;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v116 != v37) {
          objc_enumerationMutation(v107);
        }
        uint64_t v39 = *(void **)(*((void *)&v115 + 1) + 8 * j);
        id v40 = [MEMORY[0x263EFF9A0] dictionary];
        uint64_t v41 = [v39 label];
        uint64_t v42 = (void *)v41;
        if (v41) {
          id v43 = (__CFString *)v41;
        }
        else {
          id v43 = &stru_26EB332F0;
        }
        [v40 setObject:v43 forKey:@"label"];

        v133.unint64_t location = [v39 range];
        uint64_t v44 = NSStringFromRange(v133);
        double v45 = (void *)v44;
        if (v44) {
          id v46 = (__CFString *)v44;
        }
        else {
          id v46 = &stru_26EB332F0;
        }
        [v40 setObject:v46 forKey:@"range"];

        uint64_t v47 = [v39 representedText];
        double v48 = (void *)v47;
        if (v47) {
          id v49 = (__CFString *)v47;
        }
        else {
          id v49 = &stru_26EB332F0;
        }
        [v40 setObject:v49 forKey:@"representedText"];

        uint64_t v50 = [v39 textUnit];
        long long v35 = v101;
        long long v51 = [(CACSpokenCommandManager *)v101 _descriptionForAXTextUnit:v50];
        [v40 setObject:v51 forKey:@"type"];

        [v110 addObject:v40];
      }
      uint64_t v36 = [v107 countByEnumeratingWithState:&v115 objects:v128 count:16];
    }
    while (v36);
  }

  long long v52 = v98;
  [v98 setObject:v110 forKey:@"OverlayElements"];
  long long v53 = +[CACApplicationUtilities targetApplications];
  [v98 setObject:v53 forKey:@"Applications"];

  if (v35->_focusedElement)
  {
    long long v54 = [MEMORY[0x263EFF9A0] dictionary];
    long long v55 = [(AXElement *)v35->_focusedElement recognitionStrings];
    long long v56 = [v55 firstObject];

    if (v56) {
      long long v57 = v56;
    }
    else {
      long long v57 = &stru_26EB332F0;
    }
    [v54 setObject:v57 forKey:@"Text"];
    long long v58 = [(AXElement *)v35->_focusedElement uiElement];
    long long v59 = [v58 stringWithAXAttribute:5019];

    if (v59) {
      long long v60 = v59;
    }
    else {
      long long v60 = &stru_26EB332F0;
    }
    [v54 setObject:v60 forKey:@"Identifier"];
    uint64_t v61 = [(AXElement *)v35->_focusedElement value];
    long long v62 = (void *)v61;
    if (v61) {
      long long v63 = (__CFString *)v61;
    }
    else {
      long long v63 = &stru_26EB332F0;
    }
    [v54 setObject:v63 forKey:@"Value"];
    long long v64 = [(AXElement *)v35->_focusedElement cacTextOperations];
    if (v64) {
      [v54 setObject:v64 forKey:@"AvaiableTextOperations"];
    }
    long long v65 = [(AXElement *)v35->_focusedElement cacTextSelectionCACTextMarkerRange];
    id v66 = NSString;
    uint64_t v67 = [v65 nsRange];
    [v65 nsRange];
    id v69 = [v66 stringWithFormat:@"%ld, %ld", v67, v68];
    [v54 setObject:v69 forKey:@"SelectionRange"];

    uint64_t v70 = [(AXElement *)v35->_focusedElement cacStringForCACTextMarkerRange:v65];
    long long v71 = (void *)v70;
    if (v70) {
      long long v72 = (__CFString *)v70;
    }
    else {
      long long v72 = &stru_26EB332F0;
    }
    [v54 setObject:v72 forKey:@"SelectedText"];
    [v98 setObject:v54 forKey:@"FocusedTextElement"];
  }
  id v73 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v74 = [v73 isActiveOverlayType:@"NumberedElements"];

  if (v74)
  {
    uint64_t v75 = [MEMORY[0x263EFF980] array];
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    id v76 = +[CACDisplayManager sharedManager];
    uint64_t v77 = [v76 labeledElementsForItemNumbers];

    id v108 = v77;
    uint64_t v78 = [v77 countByEnumeratingWithState:&v111 objects:v127 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v112;
      do
      {
        for (uint64_t k = 0; k != v79; ++k)
        {
          if (*(void *)v112 != v80) {
            objc_enumerationMutation(v108);
          }
          id v82 = *(void **)(*((void *)&v111 + 1) + 8 * k);
          long long v83 = [MEMORY[0x263EFF9A0] dictionary];
          uint64_t v84 = [v82 numberedLabel];
          long long v85 = (void *)v84;
          if (v84) {
            long long v86 = (__CFString *)v84;
          }
          else {
            long long v86 = &stru_26EB332F0;
          }
          [v83 setObject:v86 forKey:@"Text"];
          [v82 rectangle];
          long long v91 = [NSString stringWithFormat:@"(%4.0f, %4.0f, %4.0f, %4.0f)", v87, v88, v89, v90];
          [v83 setObject:v91 forKey:@"Rectangle"];

          [v82 labelRectangle];
          uint64_t v96 = [NSString stringWithFormat:@"(%4.0f, %4.0f, %4.0f, %4.0f)", v92, v93, v94, v95];
          [v83 setObject:v96 forKey:@"LabelRectangle"];

          [v75 addObject:v83];
        }
        uint64_t v79 = [v108 countByEnumeratingWithState:&v111 objects:v127 count:16];
      }
      while (v79);
    }

    long long v52 = v98;
    [v98 setObject:v75 forKey:@"LabeledElements"];
  }
  return v52;
}

- (void)registerSignPostBeginProcessingForSpeechRecognizer:(id)a3 message:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_recognizers;
  objc_sync_enter(v8);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = self->_recognizers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v50;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11 + v10;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v13), "speechRecognizer", (void)v49);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v16 = v15 == v6;

        if (v16)
        {
          switch(v11 + v13)
          {
            case 0:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v18 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v18;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 0.";
                goto LABEL_71;
              }
              break;
            case 1:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v20 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v20;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 1.";
                goto LABEL_71;
              }
              break;
            case 2:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v21 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v21;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 2.";
                goto LABEL_71;
              }
              break;
            case 3:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v22 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v22;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 3.";
                goto LABEL_71;
              }
              break;
            case 4:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v23 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v23;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 4.";
                goto LABEL_71;
              }
              break;
            case 5:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v24 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v24;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 5.";
                goto LABEL_71;
              }
              break;
            case 6:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v25 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v25;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 6.";
                goto LABEL_71;
              }
              break;
            case 7:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v26 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v26;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 7.";
                goto LABEL_71;
              }
              break;
            case 8:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v27 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v27;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 8.";
                goto LABEL_71;
              }
              break;
            case 9:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v28 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v28;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 9.";
                goto LABEL_71;
              }
              break;
            case 10:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v29 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v29;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 10.";
                goto LABEL_71;
              }
              break;
            case 11:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v30 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v30;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 11.";
                goto LABEL_71;
              }
              break;
            case 12:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v31 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v31;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 12.";
                goto LABEL_71;
              }
              break;
            case 13:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v32 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v32;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 13.";
                goto LABEL_71;
              }
              break;
            case 14:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v33 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v33;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 14.";
                goto LABEL_71;
              }
              break;
            case 15:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v34 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v34;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 15.";
                goto LABEL_71;
              }
              break;
            case 16:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v35 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v35;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 16.";
                goto LABEL_71;
              }
              break;
            case 17:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v36 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v36;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 17.";
                goto LABEL_71;
              }
              break;
            case 18:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v37 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v37;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 18.";
                goto LABEL_71;
              }
              break;
            case 19:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v38 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v38;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 19.";
                goto LABEL_71;
              }
              break;
            case 20:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v39 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v39;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 20.";
                goto LABEL_71;
              }
              break;
            case 21:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v40 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v40;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 21.";
                goto LABEL_71;
              }
              break;
            case 22:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v41 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v41;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 22.";
                goto LABEL_71;
              }
              break;
            case 23:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v42 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v42;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 24.";
                goto LABEL_71;
              }
              break;
            case 25:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v44 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v44;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 25.";
                goto LABEL_71;
              }
              break;
            case 26:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v45 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v45;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 26.";
                goto LABEL_71;
              }
              break;
            case 27:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v48 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v48;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 27.";
                goto LABEL_71;
              }
              break;
            case 28:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v46 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v46;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 28.";
                goto LABEL_71;
              }
              break;
            case 29:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v47 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v47;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 29.";
                goto LABEL_71;
              }
              break;
            default:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v43 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v43;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer >= 30.";
LABEL_71:
                _os_signpost_emit_with_name_impl(&dword_238377000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v19, "%s", buf, 0xCu);
              }
              break;
          }

          goto LABEL_73;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
      uint64_t v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_73:

  objc_sync_exit(v8);
}

- (void)registerSignPostEndProcessingForSpeechRecognizer:(id)a3 message:(id)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_recognizers;
  objc_sync_enter(v8);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v9 = self->_recognizers;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v50;
    while (2)
    {
      uint64_t v13 = 0;
      uint64_t v14 = v11 + v10;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v49 + 1) + 8 * v13), "speechRecognizer", (void)v49);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v16 = v15 == v6;

        if (v16)
        {
          switch(v11 + v13)
          {
            case 0:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v18 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v18;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 0.";
                goto LABEL_71;
              }
              break;
            case 1:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v20 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v20;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 1.";
                goto LABEL_71;
              }
              break;
            case 2:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v21 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v21;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 2.";
                goto LABEL_71;
              }
              break;
            case 3:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v22 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v22;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 3.";
                goto LABEL_71;
              }
              break;
            case 4:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v23 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v23;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 4.";
                goto LABEL_71;
              }
              break;
            case 5:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v24 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v24;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 5.";
                goto LABEL_71;
              }
              break;
            case 6:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v25 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v25;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 6.";
                goto LABEL_71;
              }
              break;
            case 7:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v26 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v26;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 7.";
                goto LABEL_71;
              }
              break;
            case 8:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v27 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v27;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 8.";
                goto LABEL_71;
              }
              break;
            case 9:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v28 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v28;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 9.";
                goto LABEL_71;
              }
              break;
            case 10:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v29 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v29;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 10.";
                goto LABEL_71;
              }
              break;
            case 11:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v30 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v30;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 11.";
                goto LABEL_71;
              }
              break;
            case 12:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v31 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v31;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 12.";
                goto LABEL_71;
              }
              break;
            case 13:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v32 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v32;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 13.";
                goto LABEL_71;
              }
              break;
            case 14:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v33 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v33;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 14.";
                goto LABEL_71;
              }
              break;
            case 15:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v34 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v34;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 15.";
                goto LABEL_71;
              }
              break;
            case 16:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v35 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v35;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 16.";
                goto LABEL_71;
              }
              break;
            case 17:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v36 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v36;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 17.";
                goto LABEL_71;
              }
              break;
            case 18:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v37 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v37;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 18.";
                goto LABEL_71;
              }
              break;
            case 19:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v38 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v38;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 19.";
                goto LABEL_71;
              }
              break;
            case 20:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v39 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v39;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 20.";
                goto LABEL_71;
              }
              break;
            case 21:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v40 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v40;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 21.";
                goto LABEL_71;
              }
              break;
            case 22:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v41 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v41;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 22.";
                goto LABEL_71;
              }
              break;
            case 23:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v42 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v42;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 24.";
                goto LABEL_71;
              }
              break;
            case 25:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v44 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v44;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 25.";
                goto LABEL_71;
              }
              break;
            case 26:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v45 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v45;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 26.";
                goto LABEL_71;
              }
              break;
            case 27:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v48 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v48;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 27.";
                goto LABEL_71;
              }
              break;
            case 28:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v46 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v46;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 28.";
                goto LABEL_71;
              }
              break;
            case 29:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v47 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v47;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer 29.";
                goto LABEL_71;
              }
              break;
            default:
              unint64_t v17 = RXSignpostLog();
              if (os_signpost_enabled(v17))
              {
                uint64_t v43 = [v7 UTF8String];
                *(_DWORD *)buf = 136315138;
                uint64_t v54 = v43;
                uint64_t v19 = "CAC, CmdRec: Processing recognzer >= 30.";
LABEL_71:
                _os_signpost_emit_with_name_impl(&dword_238377000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v19, "%s", buf, 0xCu);
              }
              break;
          }

          goto LABEL_73;
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v49 objects:v55 count:16];
      uint64_t v11 = v14;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_73:

  objc_sync_exit(v8);
}

- (void)_updateAssetPurgeability
{
  id v2 = dispatch_get_global_queue(21, 0);
  dispatch_async(v2, &__block_literal_global_1167);
}

void __51__CACSpokenCommandManager__updateAssetPurgeability__block_invoke()
{
  v5[1] = *MEMORY[0x263EF8340];
  id v0 = +[CACPreferences sharedPreferences];
  uint64_t v1 = [v0 bestLocaleIdentifier];

  if (v1)
  {
    v5[0] = v1;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
    RXObjectSetProperty();
  }
  else
  {
    id v2 = CACLogRecognition();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __51__CACSpokenCommandManager__updateAssetPurgeability__block_invoke_cold_1();
    }
  }
  id v3 = (const void *)[MEMORY[0x263EFF910] date];
  CFStringRef v4 = (const __CFString *)_AXSAccessibilityPreferenceDomain();
  CFPreferencesSetValue(@"LastPurgabilityUpdate", v3, v4, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
}

- (void)_updateMostRecentLaunchTime
{
  id v2 = (const void *)[MEMORY[0x263EFF910] date];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE70];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x263EFFE50];
  CFPreferencesSetValue(@"LastVoiceControlLaunch", v2, @"com.apple.speech.SpeechRecognitionCommandAndControl", v3, v4);
}

- (OS_dispatch_queue)recognizerSynchronizationDispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setRecognizerSynchronizationDispatchQueue:(id)a3
{
}

- (CACLabeledElementsCollection)labeledScreenElementsCollection
{
  return (CACLabeledElementsCollection *)objc_getProperty(self, a2, 248, 1);
}

- (CACDisambiguationHandler)disambiguationHandler
{
  return (CACDisambiguationHandler *)objc_getProperty(self, a2, 256, 1);
}

- (void)setDisambiguationHandler:(id)a3
{
}

- (NSString)transientOverlayType
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (void)setTransientOverlayType:(id)a3
{
}

- (BOOL)userIsTouching
{
  return self->_userIsTouching;
}

- (double)lastDictationInsertionTimeStamp
{
  return self->_lastDictationInsertionTimeStamp;
}

- (NSString)recognizedCommandIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (void)setRecognizedCommandIdentifier:(id)a3
{
}

- (NSMutableArray)commandsToIgnore
{
  return (NSMutableArray *)objc_getProperty(self, a2, 384, 1);
}

- (void)setCommandsToIgnore:(id)a3
{
}

- (BOOL)isAttentionAwareClientRunning
{
  return self->_isAttentionAwareClientRunning;
}

- (BOOL)telephonyInterruptedListening
{
  return self->_telephonyInterruptedListening;
}

- (void)setTelephonyInterruptedListening:(BOOL)a3
{
  self->_telephonyInterruptedListening = a3;
}

- (BOOL)shouldPreserveDisambiguationHandler
{
  return self->_shouldPreserveDisambiguationHandler;
}

- (void)setShouldPreserveDisambiguationHandler:(BOOL)a3
{
  self->_shouldPreserveDisambiguationHandler = a3;
}

- (CACTextInsertionSpecifier)previousTextInsertionSpecifier
{
  return (CACTextInsertionSpecifier *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPreviousTextInsertionSpecifier:(id)a3
{
}

- (CACTextInsertionSpecifier)stagedTextInsertionSpecifier
{
  return (CACTextInsertionSpecifier *)objc_getProperty(self, a2, 400, 1);
}

- (void)setStagedTextInsertionSpecifier:(id)a3
{
}

- (BOOL)forceAllCommandsToBeActive
{
  return self->_forceAllCommandsToBeActive;
}

- (NSString)commandRecognitionLogPath
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (BOOL)usingAutomationMode
{
  return self->_usingAutomationMode;
}

- (CACAXNotificationObserver)axNotificationObserver
{
  return self->_axNotificationObserver;
}

- (void)setAxNotificationObserver:(id)a3
{
}

- (CACTouchEventObserver)touchEventObserver
{
  return self->_touchEventObserver;
}

- (void)setTouchEventObserver:(id)a3
{
}

- (FBSApplicationLibrary)appLibrary
{
  return self->_appLibrary;
}

- (void)setAppLibrary:(id)a3
{
}

- (FBSALOToken)applicationAddedObservationToken
{
  return self->_applicationAddedObservationToken;
}

- (void)setApplicationAddedObservationToken:(id)a3
{
}

- (FBSALOToken)applicationRemovedObservationToken
{
  return self->_applicationRemovedObservationToken;
}

- (void)setApplicationRemovedObservationToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRemovedObservationToken, 0);
  objc_storeStrong((id *)&self->_applicationAddedObservationToken, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_touchEventObserver, 0);
  objc_storeStrong((id *)&self->_axNotificationObserver, 0);
  objc_storeStrong((id *)&self->_stagedTextInsertionSpecifier, 0);
  objc_storeStrong((id *)&self->_previousTextInsertionSpecifier, 0);
  objc_storeStrong((id *)&self->_commandsToIgnore, 0);
  objc_storeStrong((id *)&self->_recognizedCommandIdentifier, 0);
  objc_storeStrong((id *)&self->_perAppElementFetchingQueue, 0);
  objc_storeStrong((id *)&self->_nonScannerElementFetchingQueue, 0);
  objc_storeStrong((id *)&self->_elementFetchingQueue, 0);
  objc_storeStrong((id *)&self->_currentAttentionAwarenessAction, 0);
  objc_storeStrong((id *)&self->_assetPurgabilityTimer, 0);
  objc_storeStrong((id *)&self->_transientOverlayType, 0);
  objc_storeStrong((id *)&self->_disambiguationHandler, 0);
  objc_storeStrong((id *)&self->_labeledScreenElementsCollection, 0);
  objc_storeStrong((id *)&self->_pendingCommandToExecute, 0);
  objc_storeStrong(&self->_synchronousRemoteRequestCompletionBlock, 0);
  objc_storeStrong((id *)&self->_externalContextOverrideTable, 0);
  objc_storeStrong((id *)&self->_commandRecognitionLogPath, 0);
  objc_storeStrong((id *)&self->_builtInLocalizedCommandStrings, 0);
  objc_storeStrong((id *)&self->_previousResolverRelationships, 0);
  objc_storeStrong((id *)&self->_nextResolverRelationships, 0);
  objc_storeStrong((id *)&self->_currentRepeatingSpokenCommand, 0);
  objc_storeStrong((id *)&self->_currentNextPreviousResolverSpokenCommand, 0);
  objc_storeStrong((id *)&self->_commandExecutionDispatchQueue, 0);
  objc_storeStrong((id *)&self->_oldRXLangaugeObjects, 0);
  objc_storeStrong((id *)&self->_identifierBasedLanguageModelCache, 0);
  objc_storeStrong((id *)&self->_recognizerInteractionLevels, 0);
  objc_storeStrong((id *)&self->_recognizedCommandsReadyForDispatch, 0);
  objc_storeStrong((id *)&self->_recognizers, 0);
  objc_storeStrong((id *)&self->_recognizerSynchronizationDispatchQueue, 0);
  objc_storeStrong((id *)&self->_previousLeadingTextString, 0);
  objc_storeStrong((id *)&self->_presentationElements, 0);
  objc_storeStrong((id *)&self->_focusedElement, 0);
  objc_storeStrong((id *)&self->_topLevelAndNonScannerElements, 0);
  objc_storeStrong((id *)&self->_topLevelElements, 0);
  objc_storeStrong((id *)&self->_activeApplications, 0);
}

- (void)performOnRecognizerSynchronizationDispatchQueueIfRunning:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_238377000, v0, v1, "Unexpected behavior on performAsynchronouslyOnRecognizerSynchronizationDispatchQueue.  _isRunning== YES, but recognizerSynchronizationDispatchQueue is not yet initialized", v2, v3, v4, v5, v6);
}

- (void)setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "No change in elements!", v2, v3, v4, v5, v6);
}

- (void)setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "No change in top level elements! 2", v2, v3, v4, v5, v6);
}

- (void)setScreenElements:presentationElements:activeApplications:focusedTextAreaElement:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "No change in top level elements!", v2, v3, v4, v5, v6);
}

- (void)_notifyStatusChanged:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_238377000, v1, OS_LOG_TYPE_DEBUG, "Sending notification %@ for status %ld", v2, 0x16u);
}

- (void)_notifyStatusChanged:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_238377000, v0, OS_LOG_TYPE_DEBUG, "NOT sending notification for status %ld", v1, 0xCu);
}

- (void)_pushInteractionLevel:referencingObject:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_238377000, v0, v1, "_pushInteractionLevel: called with nil referencing object.", v2, v3, v4, v5, v6);
}

- (void)_pushInteractionLevel:(int)a1 referencingObject:(NSObject *)a2 .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "_pushInteractionLevel: pushed level %d.", (uint8_t *)v2, 8u);
}

- (void)_popInteractionLevel:(int)a1 referencingObject:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "_popInteractionLevel: popped level %d.", (uint8_t *)v2, 8u);
}

- (void)handleRecognizedCommand:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 recognizedParameters];
  uint64_t v4 = [v3 description];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_238377000, a2, OS_LOG_TYPE_DEBUG, "handleRecognizedCommand recognizedParameters: %@", v5, 0xCu);
}

void __49__CACSpokenCommandManager_dispatchPendingCommand__block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_238377000, v0, OS_LOG_TYPE_ERROR, "Error invalidating idle assertion %@", v1, 0xCu);
}

void __41__CACSpokenCommandManager__fetchElements__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_238377000, v0, v1, "Did fetch elements", v2, v3, v4, v5, v6);
}

- (void)_scheduleFetchElementsWithDelay:andReason:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_238377000, v0, OS_LOG_TYPE_ERROR, "Asked to fetch elements before -[CACSpokenCommandManager run] has finished. Callstack: %{public}@", v1, 0xCu);
}

- (void)synchronousRecognitionUsingCommandIdentifier:(uint64_t)a1 parameters:(void *)a2 timeoutInterval:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 description];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_238377000, a3, OS_LOG_TYPE_DEBUG, "synchronousRecognitionUsingCommandIdentifier: identifier (%@), parameters (%@)", (uint8_t *)&v6, 0x16u);
}

void __51__CACSpokenCommandManager__updateAssetPurgeability__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_238377000, v0, v1, "No current locale for dictation, not preventing purgeability for any languages", v2, v3, v4, v5, v6);
}

@end