@interface UIKeyboardImpl
+ (BOOL)canShowInternationalKey;
+ (BOOL)isActivatingForeground;
+ (BOOL)isDictationPopoverEnabled;
+ (BOOL)isFloating;
+ (BOOL)isFloatingForced;
+ (BOOL)isHardwareCommandKeyBeingHeld;
+ (BOOL)isHardwareShiftKeyBeingHeld;
+ (BOOL)isSplit;
+ (BOOL)keyboardOrientation:(int64_t)a3 isEquivalentToOrientation:(int64_t)a4;
+ (BOOL)overrideNativeScreen;
+ (BOOL)rivenInstalled;
+ (BOOL)rivenPreference;
+ (BOOL)rivenShouldUndock;
+ (BOOL)rivenTranslationPreference;
+ (BOOL)shouldAccessInputManagerService;
+ (BOOL)shouldMergeAssistantBarWithKeyboardLayout;
+ (BOOL)showsGlobeAndDictationKeysExternally;
+ (BOOL)smartInsertDeleteIsEnabled;
+ (BOOL)supportsFloating;
+ (BOOL)supportsSplit;
+ (CGPoint)_normalizedScreenPoint:(CGPoint)a3;
+ (CGPoint)_screenPointFromNormalizedPoint:(CGPoint)a3;
+ (CGPoint)defaultUndockedOffsetForFloating:(BOOL)a3;
+ (CGPoint)floatingNormalizedPersistentOffset;
+ (CGPoint)floatingPersistentOffset;
+ (CGPoint)normalizedPersistentOffset;
+ (CGPoint)normalizedPersistentOffsetIgnoringState;
+ (CGPoint)persistentOffset;
+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3;
+ (CGSize)keyboardSizeForInterfaceOrientation:(int64_t)a3;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4;
+ (Class)layoutClassForCurrentInputMode;
+ (Class)layoutClassForInputMode:(id)a3 keyboardType:(int64_t)a4 screenTraits:(id)a5;
+ (UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4;
+ (UIEdgeInsets)deviceSpecificStaticHitBufferForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4;
+ (UIEdgeInsets)requestedFloatingInsets;
+ (double)additionalInstanceHeight;
+ (double)additionalInstanceHeightForInterfaceOrientation:(int64_t)a3;
+ (double)additionalInstanceHeightForInterfaceOrientation:(int64_t)a3 hasInputView:(BOOL)a4;
+ (double)floatingHeight;
+ (double)floatingScreenWidthToEmulate;
+ (double)floatingWidth;
+ (double)keyboardWidthForScreen:(id)a3 withOrientation:(int64_t)a4;
+ (double)persistentSplitProgress;
+ (double)topMarginForInterfaceOrientation:(int64_t)a3;
+ (id)_applicationClientComponent;
+ (id)activeInstance;
+ (id)keyboardScreen;
+ (id)keyboardWindow;
+ (id)normalizedInputModesFromPreference;
+ (id)sharedInstance;
+ (id)sharedInstanceForCustomInputView:(BOOL)a3;
+ (id)uniqueNumberPadInputModesFromInputModes:(id)a3 forKeyboardType:(int64_t)a4;
+ (int64_t)floatingIdiom;
+ (void)applicationDidBecomeActive:(id)a3;
+ (void)applicationDidEnterBackground:(id)a3;
+ (void)applicationDidReceiveMemoryWarning:(id)a3;
+ (void)applicationWillEnterForeground:(id)a3;
+ (void)applicationWillResignActive:(id)a3;
+ (void)applicationWillSuspend:(id)a3;
+ (void)performWithoutFloatingLock:(id)a3;
+ (void)purgeImageCache;
+ (void)refreshRivenStateWithTraits:(id)a3 isKeyboard:(BOOL)a4;
+ (void)releaseSharedInstance;
+ (void)sendPerformanceNotification:(id)a3;
+ (void)sendPerformanceNotification:(id)a3 userInfo:(id)a4;
+ (void)setFloating:(BOOL)a3;
+ (void)setFloating:(BOOL)a3 positionedAtDefaultOffsetAnimated:(BOOL)a4;
+ (void)setFloating:(BOOL)a3 positionedAtOffset:(CGPoint)a4 animated:(BOOL)a5;
+ (void)setFloatingPersistentOffset:(CGPoint)a3;
+ (void)setParentTestForProfiling:(id)a3;
+ (void)setPersistentOffset:(CGPoint)a3;
+ (void)setPersistentSplitProgress:(double)a3;
+ (void)suppressSetPersistentOffset:(BOOL)a3;
+ (void)switchControlStatusDidChange:(id)a3;
- (BOOL)_canHandleResponderCommand:(SEL)a3;
- (BOOL)_cancelOperation:(BOOL)a3 testOnly:(BOOL)a4;
- (BOOL)_containsUsernamePasswordPairsInAutofillGroup:(id)a3;
- (BOOL)_everPresentedPasswordAutofillPanel;
- (BOOL)_handleKeyCommand:(id)a3;
- (BOOL)_handleKeyInputMethodCommandForEvent:(id)a3 canHandleAppKeyCommand:(BOOL)a4;
- (BOOL)_handlesKeyCommandForEvent:(id)a3;
- (BOOL)_hasCandidates;
- (BOOL)_hasMarkedText;
- (BOOL)_isAutoFillPopoverTypeExplicit:(int)a3;
- (BOOL)_isBackdropVisible;
- (BOOL)_isKeyCommand:(id)a3;
- (BOOL)_isShowingCandidateUIWithAvailableCandidates;
- (BOOL)_isShowingSuggestionForKeyboardCamera;
- (BOOL)_mimicShiftBeingHeld;
- (BOOL)_needsCandidates;
- (BOOL)_shouldAcceptAutocorrectionOnSelectionChange;
- (BOOL)_shouldLoadPredictionsBasedOnCurrentTraits;
- (BOOL)_shouldMinimizeForHardwareKeyboard;
- (BOOL)_shouldSuppressAssistantBar;
- (BOOL)_shouldSuppressSoftwareKeyboard;
- (BOOL)_shouldSuppressSoftwareKeyboardAndAssistantView;
- (BOOL)_shouldSuppressSoftwareKeyboardByDictation;
- (BOOL)_shouldSuppressSoftwareKeyboardByOneness;
- (BOOL)_shouldSuppressSoftwareKeyboardForResponder:(id)a3 ignoringPolicyDelegate:(BOOL)a4;
- (BOOL)_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:(BOOL)a3;
- (BOOL)_showsScribbleIconsInAssistantView;
- (BOOL)acceptInputString:(id)a3;
- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4;
- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4 forInput:(id)a5;
- (BOOL)accessibilityUsesExtendedKeyboardPredictionsEnabled;
- (BOOL)allowsReachableKeyboard;
- (BOOL)animateUpdateBars;
- (BOOL)assertTextForRemoteDocument:(id)a3 withSelectionDelta:(id)a4 updatingSelection:(BOOL)a5;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)autocorrectSpellingEnabled;
- (BOOL)autocorrectionPreference;
- (BOOL)automaticMinimizationEnabled;
- (BOOL)callLayoutIsGeometricShiftOrMoreKeyForTouch:(id)a3;
- (BOOL)callLayoutIsShiftKeyBeingHeld;
- (BOOL)callShouldDeleteWithWordCountForRapidDelete:(int)a3 characterCountForRapidDelete:(int)a4;
- (BOOL)callShouldInsertText:(id)a3;
- (BOOL)callShouldInsertText:(id)a3 onDelegate:(id)a4;
- (BOOL)canHandleDelete;
- (BOOL)canHandleKeyHitTest;
- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4;
- (BOOL)canInsertAdaptiveImageGlyph;
- (BOOL)canInsertEmojiImageTextAttachment;
- (BOOL)canInsertStickerAsTextInputPayload;
- (BOOL)canPasteImage;
- (BOOL)canPresentDictationMenuWithAnimationStyle:(int64_t)a3;
- (BOOL)canPresentEmojiPopover;
- (BOOL)canPresentOrDismissEmojiPopover;
- (BOOL)canShowAppConnections;
- (BOOL)canShowPredictionBar;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)canUseCandidateBarAsSupplementToInlineView;
- (BOOL)candidateSelectionPredictionForTraits;
- (BOOL)capsLockKeyHasLanguageSwitchLabel;
- (BOOL)caretBlinks;
- (BOOL)caretVisible;
- (BOOL)centerFilled;
- (BOOL)checkSpellingPreferenceForTraits;
- (BOOL)continuousPathUnderway;
- (BOOL)currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:(BOOL)a3;
- (BOOL)cursorIsAtEndOfMarkedText;
- (BOOL)deferEventHandlingToSystemWithContext:(id)a3;
- (BOOL)delayedCandidateList;
- (BOOL)delegateRequiresKeyEvents;
- (BOOL)delegateSuggestionsForCurrentInput;
- (BOOL)delegateSupportsCorrectionUI;
- (BOOL)delegateSupportsImagePaste;
- (BOOL)deleteForwardAndNotify:(BOOL)a3;
- (BOOL)deleteForwardAndNotify:(BOOL)a3 producedByDeleteInput:(BOOL)a4;
- (BOOL)disableInputBars;
- (BOOL)displaysCandidates;
- (BOOL)editingTraitsMarkedDirty;
- (BOOL)floatingForced;
- (BOOL)forCustomInputView;
- (BOOL)geometryIsChanging;
- (BOOL)globeKeyDisplaysAsEmojiKey;
- (BOOL)handleKeyAppCommandForCurrentEvent;
- (BOOL)handleKeyCommand:(id)a3 repeatOkay:(BOOL *)a4 beforePublicKeyCommands:(BOOL)a5;
- (BOOL)handleKeyInputMethodCommandForCurrentEvent;
- (BOOL)handleKeyTextCommandForCurrentEvent;
- (BOOL)handleMoveResponderWithShift:(BOOL)a3;
- (BOOL)handleTabWithShift:(BOOL)a3;
- (BOOL)handleTabWithShift:(BOOL)a3 beforePublicKeyCommands:(BOOL)a4;
- (BOOL)handleTabWithShift:(BOOL)a3 beforePublicKeyCommands:(BOOL)a4 isMoveAction:(BOOL)a5 testOnly:(BOOL)a6;
- (BOOL)hardwareKeyboardAttached;
- (BOOL)hardwareKeyboardIsSeen;
- (BOOL)hasAdvancedInputDelegate;
- (BOOL)hasAsyncCapableInputDelegate;
- (BOOL)hasAutocorrectPrompt;
- (BOOL)hasCursorAssertion;
- (BOOL)hasEditableMarkedText;
- (BOOL)hasInlineCompletionAsMarkedText;
- (BOOL)hasLanguageIndicator;
- (BOOL)hasMarkedText;
- (BOOL)hasNextKeyResponder;
- (BOOL)hasPreviousKeyResponder;
- (BOOL)hideAccessoryViewsDuringSplit;
- (BOOL)hideInlineCandidates;
- (BOOL)imageSuggestionEnabled;
- (BOOL)inputModeSwitcherVisible;
- (BOOL)insertTextIfShould:(id)a3;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isAutoFillMode;
- (BOOL)isAutoShifted;
- (BOOL)isCallingInputDelegate;
- (BOOL)isCallingTextChangedDuringInputModeSwitch;
- (BOOL)isCapsLockASCIIToggle;
- (BOOL)isCapsLockSignOn;
- (BOOL)isCapsLockSwitchEnabled;
- (BOOL)isCurrentEditResponderInEditingMode;
- (BOOL)isDictationLanguageMenuPresented;
- (BOOL)isDictationMenuPresented;
- (BOOL)isDictationPopoverPresented;
- (BOOL)isEmojiPopoverBeingDismissed;
- (BOOL)isEmojiPopoverBeingPresented;
- (BOOL)isEmojiPopoverPresented;
- (BOOL)isEmojiPopoverVisibleOrDismissing;
- (BOOL)isFloatingLocked;
- (BOOL)isHardwareKeyboardAttachedNow;
- (BOOL)isInHardwareKeyboardMode;
- (BOOL)isInitializing;
- (BOOL)isLongPress;
- (BOOL)isMemberOfAutofillGroup:(id)a3;
- (BOOL)isMemberOfPossibleAutofillGroup:(id)a3;
- (BOOL)isMinimized;
- (BOOL)isPredictionViewControllerVisible;
- (BOOL)isPressAndHoldPopoverPresented;
- (BOOL)isRTIClient;
- (BOOL)isRotating;
- (BOOL)isSelectionChanging;
- (BOOL)isSettingDelegate;
- (BOOL)isShiftKeyBeingHeld;
- (BOOL)isShiftLocked;
- (BOOL)isShifted;
- (BOOL)isSyncingDictationLanguageForInputModeSwitch;
- (BOOL)isTrackpadMode;
- (BOOL)isUsingDictationLayout;
- (BOOL)keyboardDrawsOpaque;
- (BOOL)keyboardIsInPencilTextInputMode;
- (BOOL)keyboardIsKeyPad;
- (BOOL)keyboardLayoutIsInAnotherProcess;
- (BOOL)keyboardsExpandedPreference;
- (BOOL)layoutIsResizing;
- (BOOL)liveConversionEnabled;
- (BOOL)maximizing;
- (BOOL)needAutofillLogin;
- (BOOL)nextCharacterIsWordCharacter;
- (BOOL)nextInputWouldStartSentence;
- (BOOL)noContent;
- (BOOL)performKeyboardEvent:(id)a3;
- (BOOL)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4 forwardToRemoteInputSource:(BOOL)a5;
- (BOOL)performingRemoteTextOperations;
- (BOOL)playInputClick;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)predictionFromPreference;
- (BOOL)presentTextCompletionAsMarkedText:(id)a3;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)prewarmsPredictiveCandidates;
- (BOOL)receivedCandidatesInCurrentInputMode;
- (BOOL)returnKeyEnabled;
- (BOOL)returnKeyEnabledInLayout;
- (BOOL)rivenPreference;
- (BOOL)rivenSplitLock;
- (BOOL)selectionScrolling;
- (BOOL)shiftLockedEnabled;
- (BOOL)shouldAllowRepeatEvent:(id)a3;
- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5;
- (BOOL)shouldAllowTwoFingerSelectionGestureOnView:(id)a3;
- (BOOL)shouldApplyKeyboardCommandToUIHost;
- (BOOL)shouldCollapseButtonBarForFeedbackUI;
- (BOOL)shouldIgnoreTextInputChanges;
- (BOOL)shouldLoadAutofillSignUpInputViewController;
- (BOOL)shouldShowCandidateBar;
- (BOOL)shouldShowCandidateBarIfReceivedCandidatesInCurrentInputMode:(BOOL)a3 ignoreHidePredictionTrait:(BOOL)a4;
- (BOOL)shouldShowContinuousPathIntroductionView;
- (BOOL)shouldShowDictationKey;
- (BOOL)shouldShowEditingIntroductionView;
- (BOOL)shouldShowInternationalKey;
- (BOOL)shouldShowInternationalKeyIntroduction;
- (BOOL)shouldShowLongPredictionList;
- (BOOL)shouldShowModelessInputTip;
- (BOOL)shouldShowSmartReplyFeedbackInputDashboardViewController;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)shouldSuppressSelectionCommands;
- (BOOL)shouldUnderlineCandidate:(id)a3;
- (BOOL)shouldUpdateLayoutAutomatically;
- (BOOL)shouldUseAdaptiveDelete;
- (BOOL)shouldUseCarPlayModes;
- (BOOL)shouldUsePinyinStyleRowNavigation;
- (BOOL)showInputModeIndicator;
- (BOOL)showingEmojiSearch;
- (BOOL)showsCandidateBar;
- (BOOL)showsCandidateInline;
- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton;
- (BOOL)skipRecomputeInputMode;
- (BOOL)smartInsertDeleteIsEnabled;
- (BOOL)splitTransitionInProgress;
- (BOOL)suppliesCompletions;
- (BOOL)supportsNumberKeySelection;
- (BOOL)suppressUpdateAssistantView;
- (BOOL)suppressUpdateCandidateView;
- (BOOL)suppressUpdateInputMode;
- (BOOL)suppressUpdateLayout;
- (BOOL)suppressUpdateShiftState;
- (BOOL)textInputTraitsNeedAutofill;
- (BOOL)textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact;
- (BOOL)textInputTraitsNeedContactAutoFill;
- (BOOL)textInputTraitsNeedOneTimeCode;
- (BOOL)updateLayoutOnShowKeyboard;
- (BOOL)updatingPreferences;
- (BOOL)userSelectedCurrentCandidate;
- (BOOL)usesCandidateSelection;
- (BOOL)usesContinuousPath;
- (BOOL)usesContinuousPathProgressiveCandidates;
- (CGRect)convertRectToAutocorrectRect:(CGRect)a3 delegateView:(id)a4 container:(id)a5;
- (CGRect)correctionRect;
- (CGRect)dragGestureRectInView:(id)a3;
- (CGRect)frameForKeylayoutName:(id)a3;
- (CGRect)getCorrectionRectIsVertical:(BOOL *)a3;
- (CGRect)keyboardIntroductionFrame;
- (CGRect)overrideEditMenuTargetRectForConfiguration:(id)a3;
- (CGRect)subtractKeyboardFrameFromRect:(CGRect)a3 inView:(id)a4;
- (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3;
- (KFAViewController)keyboardFeedbackAssistantViewController;
- (NSNumber)isAttachedHardwareKeyboard;
- (NSString)activeDictationLanguage;
- (NSValue)contentScrollInitialContentOffset;
- (NSValue)environmentScrollInitialContentOffset;
- (TIKeyboardInputManagerState)inputManagerState;
- (TIKeyboardInputManagerStub)inputManager;
- (TIKeyboardLayout)layoutForKeyHitTest;
- (TIKeyboardState)keyboardState;
- (UIAutocorrectBubbleContainer)autocorrectBubbleContainer;
- (UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4;
- (UIEdgeInsets)deviceSpecificStaticHitBufferForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4;
- (UIKBInputDelegateManager)inputDelegateManager;
- (UIKBRTIPartner)remoteTextInputPartner;
- (UIKBTree)currentKey;
- (UIKeyInput)delegate;
- (UIKeyboardAutocorrectionController)autocorrectionController;
- (UIKeyboardCandidateController)candidateController;
- (UIKeyboardImpl)initWithFrame:(CGRect)a3;
- (UIKeyboardImpl)initWithFrame:(CGRect)a3 forCustomInputView:(BOOL)a4;
- (UIKeyboardImplGeometryDelegate)geometryDelegate;
- (UIKeyboardInputModeIndicatorController)inputModeIndicatorController;
- (UIKeyboardLayout)activeLayout;
- (UIKeyboardLayout)layout;
- (UIKeyboardScheduledTask)autocorrectPromptTask;
- (UIKeyboardTaskQueue)taskQueue;
- (UIPressAndHoldPopoverController)pressAndHoldPopoverController;
- (UITextCursorAssertion)capslockAssertion;
- (UITextCursorAssertion)cursorAssertion;
- (UITextCursorAssertion)inputModeAssertion;
- (UITextInteractionAssistant)textInteractionAssistant;
- (UIView)internationalKeyIntroductionView;
- (UIView)overlayContainerObserved;
- (UIViewController)emojiPopoverController;
- (_UIKBFeedbackGenerating)feedbackGenerator;
- (_UIKeyboardStateManager)keyboardStateManager;
- (_UIKeyboardTextSelectionController)textSelectionController;
- (_UIStringAndPositionPair)lastMatchedSupplementalCandidate;
- (_UIStringAndPositionPair)pendingSupplementalCandidateToInsert;
- (_UITextChoiceAccelerationAssistant)_textChoicesAssistant;
- (_UITextInputUserInteractionDelegate)userInteractionDelegate;
- (_UITextInteractionEditMenuAssistant)_editMenuAssistant;
- (double)biasedKeyboardWidthRatio;
- (double)deleteWordLastDelete;
- (double)lastTouchDownTimestamp;
- (double)timestampOfLastTouchesEnded;
- (id)UILanguagePreference;
- (id)_activeAssertionController;
- (id)_autofillContext;
- (id)_autofillGroup;
- (id)_fallbackAutofillGroup;
- (id)_getAutocorrection;
- (id)_getAutocorrectionList;
- (id)_getCandidateList;
- (id)_getCurrentKeyboardName;
- (id)_getCurrentKeyplaneName;
- (id)_getLocalizedInputMode;
- (id)_keyboardBehaviorState;
- (id)_layout;
- (id)_markedText;
- (id)_passwordRules;
- (id)_rangeForAutocorrectionText:(id)a3;
- (id)_remoteAppId;
- (id)_remoteAssociatedDomains;
- (id)_remoteLocalizedAppName;
- (id)_remoteUnlocalizedAppName;
- (id)_sessionIdentifier;
- (id)_supplementalCandidateIcon:(id)a3;
- (id)_targetForResponderCommand:(SEL)a3;
- (id)acceptCurrentCandidate;
- (id)acceptInlineCandidate;
- (id)arrowKeyHistory;
- (id)asyncCapableInputDelegate;
- (id)asyncInputDelegate;
- (id)asyncWebKitInteractionDelegate;
- (id)autocorrectPrompt;
- (id)autocorrectPromptRectsForInput:(id)a3;
- (id)autocorrectPromptRectsFromFirstDelegateRect:(CGRect)a3 lastDelegateRect:(CGRect)a4;
- (id)autocorrectionRecordForWord:(id)a3;
- (id)buildInputSourceState;
- (id)candidateList;
- (id)delegateAsResponder;
- (id)dictationPopoverController;
- (id)didTeardownExistingDelegate;
- (id)documentState;
- (id)dynamicCaretList;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)editMenuTipView;
- (id)generateAutocorrectionListForSelectedText;
- (id)generateAutocorrectionReplacements:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inlineCandidateView;
- (id)inlineCompletionAsMarkedText;
- (id)inlineTextCompletionController;
- (id)inputDelegate;
- (id)inputForMarkedText;
- (id)inputModeLastUsedPreference;
- (id)inputModePreference;
- (id)inputOverlayContainer;
- (id)inputOverlayContainerForCandidateView:(BOOL)a3;
- (id)inputStringFromPhraseBoundary;
- (id)inputSystemSourceSession;
- (id)internationalKeyDisplayStringOnEmojiKeyboard;
- (id)keyboardMenuElements;
- (id)keyboardMenuTipIdentifier;
- (id)keyboardViewController;
- (id)keyboardWindowSnapshot;
- (id)keyedLayouts;
- (id)keyplaneView;
- (id)languageIndicator;
- (id)layoutState;
- (id)markedText;
- (id)markedTextOverlay;
- (id)obtainHideInlineCandidatesAssertionForReason:(id)a3;
- (id)physicalKeyboardEventWithInput:(id)a3 inputFlags:(int)a4;
- (id)remoteTextEditingMetadata;
- (id)remoteTextInputPartnerPrivate;
- (id)replacementsFromSelectedText;
- (id)responderForSendCurrentLocation;
- (id)responderStylingTraitsForceEditingMask:(BOOL)a3;
- (id)returnKeyDisplayName;
- (id)searchStringForMarkedText;
- (id)smartPunctuationController;
- (id)stopDictationMenuElementsForTextInputView:(id)a3;
- (id)stopDictationMenuElementsShowingTitle:(BOOL)a3;
- (id)textContentTypeForCurrentInputDelegate;
- (id)textInputTraits;
- (id)textSuggestions;
- (id)updatedKeyBehaviors;
- (id)webInputDelegate;
- (id)willSetupNewDelegate;
- (id)window;
- (int)changeCount;
- (int)promptTypeForInputString:(id)a3;
- (int)returnKeyState;
- (int)returnKeyType;
- (int64_t)_autoFillModeForPopoverType:(int)a3;
- (int64_t)_needAutofillCandidate:(id)a3;
- (int64_t)_positionInCandidateList:(id)a3;
- (int64_t)_textInputSourceForDelegate:(id)a3;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (int64_t)currentHandBias;
- (unint64_t)_clipCornersOfView:(id)a3;
- (unint64_t)autocorrectionPreferenceForTraits;
- (unint64_t)delegateConformanceType;
- (unint64_t)lastChooseSupplementalItemToInsertCallbackIdentifier;
- (unint64_t)minimumTouchesForTranslation;
- (unint64_t)phraseBoundary;
- (unint64_t)requestedInteractionModel;
- (unint64_t)serviceRole;
- (unsigned)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 lastInputString:(id)a6 searchString:(id)a7 compareAttributes:(BOOL)a8;
- (unsigned)assertIntermediateText:(id)a3;
- (void)_addInputString:(id)a3 withFlags:(unint64_t)a4 withInputManagerHint:(id)a5 withInputSource:(int64_t)a6;
- (void)_attemptAuthenticationWithMessage:(id)a3;
- (void)_clearDictationMenuTimer:(BOOL)a3;
- (void)_conditionallyNotifyPredictionsAreAvailableForCandidates:(id)a3 containingProactiveTriggers:(BOOL)a4;
- (void)_configureMarkedTextAttributesForConversion:(id)a3 selectedRange:(_NSRange)a4 highlightRange:(_NSRange)a5;
- (void)_deactiveActiveKeys;
- (void)_deleteFromInputWithFlags:(unint64_t)a3;
- (void)_dictationDidRecieveDidBeginDictationNotification:(id)a3;
- (void)_didChangeKeyplaneWithContext:(id)a3;
- (void)_dispatchInsertionPointExitedRangeWithSupplementalCandidate;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_ensureRTIConnection;
- (void)_forwardScrollEventToUIHost:(SEL)a3 scrollView:(id)a4;
- (void)_generateTextSuggestionForKeyboardCamera;
- (void)_handleAutoFillPopoverCommandWithType:(int)a3 action:(SEL)a4;
- (void)_handleKeyBehavior:(unint64_t)a3 forKeyType:(id)a4;
- (void)_handleKeyEvent:(id)a3 executionContext:(id)a4;
- (void)_handleWebKeyEvent:(id)a3 withEventType:(unint64_t)a4 withInputString:(id)a5 withInputStringIgnoringModifiers:(id)a6;
- (void)_handleWebKeyEvent:(id)a3 withIndex:(unint64_t)a4 inInputString:(id)a5;
- (void)_moveWithEvent:(id)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_performInputViewControllerOutput:(id)a3;
- (void)_postInputResponderCapabilitiesChangedNotificationWithOutput:(id)a3 selectionChanged:(BOOL)a4;
- (void)_postInputResponderChangedNotification;
- (void)_presentDictationMenuIfAllowed;
- (void)_presentKeyboardPopoverWithType:(int)a3 keyString:(id)a4 popoverController:(id)a5 textInputView:(id)a6 caretRect:(CGRect)a7 isVerticalText:(BOOL)a8 completion:(id)a9;
- (void)_requestInputManagerSync;
- (void)_resetCapsLock;
- (void)_selectionScrolling:(BOOL)a3 scroller:(id)a4;
- (void)_setAutocorrects:(BOOL)a3;
- (void)_setAutofillGroup:(id)a3;
- (void)_setCandidateController:(id)a3;
- (void)_setCapsLockIfNeeded:(__GSKeyboard *)a3 event:(__IOHIDEvent *)a4;
- (void)_setInputManager:(id)a3;
- (void)_setNeedsCandidates:(BOOL)a3;
- (void)_setShiftLockedEnabled:(BOOL)a3;
- (void)_setShouldSuppressAssistantBar:(BOOL)a3;
- (void)_setShouldSuppressSoftwareKeyboard:(BOOL)a3;
- (void)_setTransientSelectionModeEnabled:(BOOL)a3 forInputDelegate:(id)a4;
- (void)_shouldClearTextSuggestions:(BOOL)a3;
- (void)_showAutofillExtras;
- (void)_showKeyboardIgnoringPolicyDelegate:(BOOL)a3;
- (void)_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:(BOOL)a3;
- (void)_tagTouchForTypingMenu:(unsigned int)a3;
- (void)_textSelectionEditMenuDidShow;
- (void)_updateCanSuggestSupplementalItemsForCurrentSelection;
- (void)_updateDelegateRequiresKeyEventsFromRemoteTextInput;
- (void)_updateExternalDeviceInputSetting;
- (void)_updateExternalDeviceInputSettingForWindow:(id)a3;
- (void)_updateKeyboardLanguage:(id)a3;
- (void)_updateKeyboardSuppression:(id)a3;
- (void)_updateShouldSuppressAssistantBar;
- (void)_updateSoundPreheating;
- (void)_updateSoundPreheatingForWindow:(id)a3;
- (void)_updateTextInputPencilSource;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)acceptAutocorrection;
- (void)acceptAutocorrectionAndEndComposition;
- (void)acceptAutocorrectionWithCompletionHandler:(id)a3;
- (void)acceptAutocorrectionWithCompletionHandler:(id)a3 requestedByRemoteInputDestination:(BOOL)a4;
- (void)acceptCandidate:(id)a3;
- (void)acceptCurrentCandidateIfSelected;
- (void)acceptFirstCandidate;
- (void)acceptHandwritingCandidate;
- (void)acceptInlineCompletionWithCompletionHandler:(id)a3;
- (void)acceptPredictiveInput:(id)a3;
- (void)acceptPredictiveInput:(id)a3 appendSeparator:(BOOL)a4 executionContext:(id)a5;
- (void)acceptRecentInput:(id)a3;
- (void)acceptingCandidateWithTrigger:(id)a3;
- (void)addInputObject:(id)a3;
- (void)addInputString:(id)a3;
- (void)addInputString:(id)a3 fromVariantKey:(BOOL)a4;
- (void)addInputString:(id)a3 withFlags:(unint64_t)a4;
- (void)addInputString:(id)a3 withFlags:(unint64_t)a4 withInputManagerHint:(id)a5;
- (void)addSupplementalLexicon:(id)a3;
- (void)adjustAutoDeleteTimerForForce:(double)a3;
- (void)adjustCapsLockDelayOverride;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 executionContext:(id)a5;
- (void)adjustSegmentSize:(int64_t)a3;
- (void)allowResponderChainFirstChanceToHandleKeyEvent:(id)a3;
- (void)animateAutocorrectionToRect:(CGRect)a3 fromRect:(CGRect)a4;
- (void)animateAutocorrectionToText:(id)a3 fromRect:(CGRect)a4;
- (void)applicationResumed:(id)a3;
- (void)applicationResumedEventsOnly:(id)a3;
- (void)applicationSuspendedEventsOnly:(id)a3;
- (void)applyAssistantItem:(id)a3;
- (void)assertCursorForForSelectionChange;
- (void)assertTextForDictation;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)autocorrectionAnimationDidStopWithAutocorrectionView:(id)a3;
- (void)becomeFirstResponderAndMakeVisible:(BOOL)a3;
- (void)beginAcceptingInlineCompletionByDirectTap;
- (void)beginFloatingTransitionFromPanGestureRecognizer:(id)a3;
- (void)beginObservingInputOverlayContainerFrame;
- (void)callLayoutUpdateAllLocalizedKeys;
- (void)callLayoutUpdateLocalizedKeys;
- (void)callLayoutUpdateRecentInputs;
- (void)callLayoutUpdateReturnKey;
- (void)cancelAllKeyEvents;
- (void)cancelSplitTransition;
- (void)candidateBarDidExtendWithGesture;
- (void)candidateListAcceptCandidate:(id)a3;
- (void)candidateListInvalidateSelection:(id)a3;
- (void)candidateListSelectionDidChange:(id)a3;
- (void)changingContextWithTrigger:(id)a3;
- (void)cleanupKeyboardPopover:(id)a3;
- (void)clearAnimations;
- (void)clearAutocorrectPromptTimer;
- (void)clearAutofillGroup;
- (void)clearChangeTimeAndCount;
- (void)clearCursorAccessory;
- (void)clearCursorAssertion;
- (void)clearDelegate;
- (void)clearDetachHardwareKeyboardAction;
- (void)clearDictationMenuTimer;
- (void)clearExcessKeyboardMemory;
- (void)clearForwardingInputDelegateAndResign:(BOOL)a3;
- (void)clearInput;
- (void)clearInputForMarkedText;
- (void)clearInputModeAssertion;
- (void)clearInputWithCandidatesCleared:(BOOL)a3;
- (void)clearKeyboardWindowSnapshot;
- (void)clearLanguageIndicator;
- (void)clearLayouts;
- (void)clearLongPressTimer;
- (void)clearRecentInput;
- (void)clearSelection;
- (void)clearShiftState;
- (void)clearTimers;
- (void)clearTransientState;
- (void)collapseSelection;
- (void)completeDelete;
- (void)completeDeleteFromInput;
- (void)completeDeleteOnceFromInputWithCharacterBefore:(unsigned int)a3;
- (void)completeHandleKeyEvent:(id)a3;
- (void)configureTipViewWithTitle:(id)a3 description:(id)a4 closeButtonAction:(id)a5;
- (void)copyOperation;
- (void)createTypoTrackerReport;
- (void)cutOperation;
- (void)deactivateLayout;
- (void)dealloc;
- (void)defaultsDidChange;
- (void)deferReplaceTextActionToSystem:(id)a3;
- (void)delayedInit;
- (void)deleteBackward;
- (void)deleteBackwardAndNotify:(BOOL)a3;
- (void)deleteBackwardAndNotifyAtEnd:(BOOL)a3 deletionCount:(unint64_t)a4 reinsertTextInLoop:(BOOL)a5;
- (void)deleteFromInput;
- (void)deleteFromInputWithFlags:(unint64_t)a3;
- (void)deleteHandwritingStrokesAtIndexes:(id)a3;
- (void)detach;
- (void)detachHardwareKeyboard;
- (void)didChangeForwardingInputDelegate:(id)a3;
- (void)didChangePhraseBoundary;
- (void)didClearText;
- (void)didCompleteUpdateDefaults;
- (void)didDismissMemojiCard;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)didPresentMemojiCard;
- (void)disableTransientSelectionMode;
- (void)dismissAutoFillPopover;
- (void)dismissContinuousPathIntroductionView;
- (void)dismissCursorAccessory;
- (void)dismissDictationMenu;
- (void)dismissDictationPopover;
- (void)dismissDictationPopoverAndCancelDictation;
- (void)dismissDictationTip;
- (void)dismissEditingIntroductionView;
- (void)dismissEducationTip;
- (void)dismissEmojiPopoverBeforeCleanup:(BOOL)a3;
- (void)dismissEmojiPopoverIfNecessaryWithCompletion:(id)a3;
- (void)dismissFloatingKeyboardFromPencilKitIfNeeded;
- (void)dismissKeyboard;
- (void)dismissKeyboardFeedbackAssistantViewController;
- (void)dismissKeyboardPopover:(id)a3 beforeCleanup:(BOOL)a4 completion:(id)a5;
- (void)dismissMultilingualKeyboardTip;
- (void)dismissMultilingualSettingTip;
- (void)dismissPressAndHoldPopover;
- (void)dismissStickerEditor:(BOOL)a3;
- (void)dismissTextChoicePrompt;
- (void)displayAutoFillPopoverIfAutoFillModeDetected;
- (void)documentStateDidChange;
- (void)documentStateFromInputDelegate:(id)a3;
- (void)ejectKeyDown;
- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4;
- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4 selectionMethod:(id)a5 inputType:(id)a6;
- (void)enable;
- (void)enableTransientInputDelegateSelectionMode;
- (void)enableTransientSelectionMode;
- (void)endAcceptingInlineCompletionByDirectTap;
- (void)endObservingInputOverlayContainerFrame;
- (void)fadeAutocorrectPrompt;
- (void)finishLayoutChangeWithArguments:(id)a3;
- (void)finishLayoutToCurrentInterfaceOrientation;
- (void)finishSplitTransitionWithProgress:(double)a3;
- (void)flushDelayedTasks;
- (void)forceShiftUpdate;
- (void)forceShiftUpdateIfKeyboardStateChanged;
- (void)forwardDictationEvent_cancelDictation;
- (void)forwardDictationEvent_handleDictationShouldPause:(BOOL)a3 withNewDelagate:(BOOL)a4;
- (void)forwardDictationEvent_handleTip:(id)a3 title:(id)a4;
- (void)forwardDictationEvent_movePopoverView:(id)a3;
- (void)forwardDictationEvent_resumeDictation;
- (void)forwardDictationEvent_startDictation;
- (void)forwardDictationEvent_stopDictation:(BOOL)a3;
- (void)forwardDictationEvent_stopDictationIgnoreFinalizePhrases;
- (void)forwardDictationEvent_switchToDictationInputModeWithOptions:(id)a3;
- (void)forwardDictationEvent_switchToDictationLanguage:(id)a3;
- (void)forwardDictationEvent_updateIdleDetection:(int64_t)a3;
- (void)forwardKeyboardCameraEvent_selfDestruct;
- (void)forwardKeyboardCameraEvent_startCameraInput:(id)a3;
- (void)forwardKeyboardCameraEvent_updatePreviewText:(id)a3 asMarkedText:(BOOL)a4;
- (void)forwardStickerEvent_presentCard;
- (void)generateAutocorrectionWithExecutionContext:(id)a3;
- (void)generateCandidates;
- (void)generateCandidatesWithOptions:(int)a3;
- (void)geometryChangeDone:(BOOL)a3;
- (void)handleAutoDeleteContinuationOnDestinationWithDeletionCount:(unint64_t)a3;
- (void)handleAutoFillContactDetected;
- (void)handleAutoFillContactPopoverCommand;
- (void)handleAutoFillCreditCardDetected;
- (void)handleAutoFillCreditCardPopoverCommand;
- (void)handleAutoFillPasswordDetected;
- (void)handleAutoFillPasswordPopoverCommand;
- (void)handleAutofillCredentialSaveIfNeeded:(id)a3;
- (void)handleClear;
- (void)handleClearWithInsertBeforeAdvance:(id)a3;
- (void)handleDelete;
- (void)handleDeleteWithExecutionContext:(id)a3;
- (void)handleDeleteWordWithExecutionContext:(id)a3;
- (void)handleDictationForResponderChange;
- (void)handleEmojiPopoverKeyCommand;
- (void)handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:(id)a3 toReplaceText:(id)a4;
- (void)handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)handleEventFromRemoteSource_autoFillIsMenuPresented:(BOOL)a3;
- (void)handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert;
- (void)handleEventFromRemoteSource_chooseSupplementalItem:(id)a3 toReplaceText:(id)a4;
- (void)handleEventFromRemoteSource_insertAutofillContent:(id)a3;
- (void)handleEventFromRemoteSource_insertSupplementalCandidate:(id)a3 textToCommit:(id)a4;
- (void)handleEventFromRemoteSource_insertionPointEnteredText:(id)a3 withSupplementalCandidate:(id)a4;
- (void)handleGrammarCorrectionEntries:(id)a3;
- (void)handleKeyEvent:(id)a3;
- (void)handleKeyboardInput:(id)a3 executionContext:(id)a4;
- (void)handleObserverCallback;
- (void)handleRemoteDictationEvent_cancelDictation;
- (void)handleRemoteDictationEvent_handleTip:(id)a3;
- (void)handleRemoteDictationEvent_movePopoverView:(id)a3;
- (void)handleRemoteDictationEvent_resumeDictation;
- (void)handleRemoteDictationEvent_setEditMenuFrame:(id)a3;
- (void)handleRemoteDictationEvent_startDictation;
- (void)handleRemoteDictationEvent_stopDictation:(BOOL)a3;
- (void)handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases;
- (void)handleRemoteDictationEvent_switchToDictationInputModeWithOptions:(id)a3;
- (void)handleRemoteDictationEvent_switchToDictationLanguage:(id)a3;
- (void)handleRemoteDictationEvent_updateIdleDetection:(int64_t)a3;
- (void)handleRemoteIndirectGestureWithState:(id)a3;
- (void)handleRemoteKeyboardCameraEvent_startCameraInput:(id)a3;
- (void)handleStickerEvent_presentCard;
- (void)handleWebViewCredentialsSaveForWebsiteURL:(id)a3 user:(id)a4 password:(id)a5 passwordIsAutoGenerated:(BOOL)a6;
- (void)hardwareKeyboardAvailabilityChanged;
- (void)hardwareKeyboardAvailabilityDidChange:(id)a3;
- (void)hideDictationMenuIfNeeded:(BOOL)a3;
- (void)hideInternationalKeyIntroductionIfNeeded;
- (void)hideKeyboard;
- (void)hideKeyboardIgnoringHardwareLayouts:(BOOL)a3;
- (void)hideKeyboardWithoutPreflightChecks;
- (void)insertAdaptiveImageGlyph:(id)a3;
- (void)insertAttributedText:(id)a3;
- (void)insertCustomTextSuggestion:(id)a3;
- (void)insertDictationResult:(id)a3;
- (void)insertEmojiImageTextAttachment:(id)a3;
- (void)insertSticker:(id)a3;
- (void)insertedAccentVariantFromPopover:(id)a3;
- (void)insertedEmojiFromPopover:(id)a3 selectionMethod:(id)a4;
- (void)jumpToCompositions;
- (void)keyboardDidHide:(id)a3;
- (void)keyboardSceneDelegate:(id)a3 startedPinningInputViewsOnBehalfOfResponder:(id)a4;
- (void)keyboardSceneDelegate:(id)a3 stoppedPinningInputViewsOnBehalfOfResponder:(id)a4;
- (void)layoutDidResize;
- (void)layoutSubviews;
- (void)longPressAction;
- (void)lookUpResponderChainForCustomInputView;
- (void)modifyTextInputTraits:(id)a3 forceSync:(BOOL)a4;
- (void)moveCursorByAmount:(int64_t)a3;
- (void)moveCursorLeftShifted:(BOOL)a3;
- (void)moveCursorRightShifted:(BOOL)a3;
- (void)movePhraseBoundaryToDirection:(int64_t)a3 granularity:(int64_t)a4;
- (void)nonDestructivelyDismissKeyboard;
- (void)notifyInputSourceStateChangeIfNeeded;
- (void)notifyShiftState;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)optOutASPInTextField;
- (void)pasteOperation;
- (void)pauseDictationForResponderChange;
- (void)performBlockWithTextInputChangesIgnoredForNonMacOS:(id)a3;
- (void)performDelete;
- (void)performHitTestForTouchEvent:(id)a3 executionContextPassingNSNumber:(id)a4;
- (void)performHitTestForTouchEvents:(id)a3 executionContextPassingNSNumber:(id)a4;
- (void)performKeyBehaviorCommitInline;
- (void)performKeyBehaviorConfirm;
- (void)performKeyBehaviorConfirmFirstCandidate;
- (void)performKeyboardOutput:(id)a3;
- (void)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4;
- (void)performKeyboardOutputAsInputViewControllerOutput:(id)a3;
- (void)performOperations:(id)a3 withTextInputSource:(int64_t)a4;
- (void)performReturn;
- (void)performSendAction;
- (void)performSendCurrentLocation;
- (void)performStopAutoDeleteAtDocumentStart;
- (void)performTextOperationActionSelector:(SEL)a3;
- (void)playDeleteKeyFeedbackIfNecessaryRepeat:(BOOL)a3 rapid:(BOOL)a4;
- (void)playDeleteKeyFeedbackRepeat:(BOOL)a3 rapid:(BOOL)a4;
- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5;
- (void)postInputResponderCapabilitiesChangedNotification;
- (void)postInputViewControllerShouldUpdateNotification:(id)a3;
- (void)prepareForFloatingTransition:(BOOL)a3;
- (void)prepareForGeometryChange;
- (void)prepareKeyboardInputModeFromPreferences:(id)a3;
- (void)prepareLayoutForInterfaceOrientation:(int64_t)a3;
- (void)presentContinuousPathIntroductionView;
- (void)presentDictationMenu;
- (void)presentDictationMenuTip:(id)a3;
- (void)presentDictationMenuTipWithTitle:(id)a3 description:(id)a4;
- (void)presentDictationMenuWithAnimationStyle:(int64_t)a3;
- (void)presentDictationPopover;
- (void)presentDictationUndoMenu;
- (void)presentEditingIntroductionView;
- (void)presentEducationTipWithTitle:(id)a3 description:(id)a4;
- (void)presentEmojiPopoverViaTrigger:(id)a3 completion:(id)a4;
- (void)presentKeyboardFeedbackAssistantViewControllerForLogURL:(id)a3;
- (void)presentKeyboardMenu:(int)a3;
- (void)presentKeyboardPopoverWithType:(int)a3 keyString:(id)a4 completion:(id)a5;
- (void)presentMultilingualKeyboardTip:(id)a3;
- (void)presentMultilingualSettingTip:(id)a3;
- (void)presentPressAndHoldPopoverWithKeyString:(id)a3;
- (void)presentStickerEditorWithStickerIdentifier:(id)a3 sourceRect:(CGRect)a4;
- (void)presentTextChoicePromptForRange:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)prewarmEmojiKeyboardIfNeeded;
- (void)processPayloadInfo:(id)a3;
- (void)provideAutoFillTypingUpdatesIfNecessary;
- (void)recomputeActiveInputModesWithExtensions:(BOOL)a3;
- (void)recomputeActiveInputModesWithExtensions:(BOOL)a3 allowNonLinguisticInputModes:(BOOL)a4;
- (void)refreshRivenPreferences;
- (void)reinitializeAfterInputModeSwitch:(BOOL)a3;
- (void)rejectAutocorrection:(id)a3;
- (void)releaseEmojiKeyboardPrewarmingAssertion;
- (void)releaseInputManager;
- (void)releaseInputManagerIfInactive;
- (void)releaseSuppressUpdateCandidateView;
- (void)reloadCurrentInputMode;
- (void)remoteControlReceivedWithEvent:(id)a3;
- (void)removeASPVisualEffectsIfNecessary:(id)a3;
- (void)removeAllDynamicDictionaries;
- (void)removeAutocorrectPrompt;
- (void)removeAutocorrectPromptAndCandidateList;
- (void)removeAutocorrection;
- (void)removeCandidateList;
- (void)removeCapsLockDelayOverride;
- (void)removeFromSuperview;
- (void)removeInlineTextCompletionPrompt;
- (void)removeRecentInput:(id)a3 completionHandler:(id)a4;
- (void)removeSupplementalLexicon:(id)a3;
- (void)removeTextChoicePrompt;
- (void)removeTextChoicePromptAndAutocorrection;
- (void)removeTextChoicePromptWithUnderline;
- (void)removeTextChoiceUnderlines;
- (void)removeTextChoiceUnderlinesInRange:(id)a3;
- (void)replaceRange:(id)a3 oldText:(id)a4 withText:(id)a5;
- (void)replaceText:(id)a3;
- (void)reportSmartRepliesConcern;
- (void)reportSmartReplyFeedbackUIWasPresented;
- (void)representDictationMenu;
- (void)resetInputDelegate;
- (void)resetIsPhysicallyAttachedHardwareKeyboard;
- (void)resetSmartReplyFeedbackUIIfAlreadyShown;
- (void)responseContextDidChange;
- (void)restoreFocusFromEntryPoint:(CGPoint)a3;
- (void)restoreTextSuggestions;
- (void)resumeDictationForResponderChange;
- (void)revealHiddenCandidates;
- (void)saveInputModesPreference:(id)a3;
- (void)scheduleReplacementsWithOptions:(unint64_t)a3;
- (void)scribbleWillBeginWriting:(id)a3;
- (void)selectionDidChange:(id)a3;
- (void)selectionScrolling:(id)a3;
- (void)selectionWillChange:(id)a3;
- (void)sendCallbacksForPostCorrectionsRemoval;
- (void)sendCallbacksForPreCorrectionsDisplay;
- (void)sendKeyboardDismissalNotification;
- (void)setActiveDictationLanguage:(id)a3;
- (void)setActiveLayout:(id)a3;
- (void)setAnimateUpdateBars:(BOOL)a3;
- (void)setArrowKeyHistory:(id)a3;
- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 searchString:(id)a6;
- (void)setAutocorrectBubbleContainer:(id)a3;
- (void)setAutocorrectPromptTask:(id)a3;
- (void)setAutocorrectSpellingEnabled:(BOOL)a3;
- (void)setAutocorrection:(id)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutomaticMinimizationEnabled:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)setCandidateDisplayIsExtended:(BOOL)a3;
- (void)setCandidateList:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setCapsLockIfNeeded;
- (void)setCapsLockIfNeededForPhysicalKeyboardEvent:(id)a3;
- (void)setCapsLockSign;
- (void)setCapslockAssertion:(id)a3;
- (void)setCaretBlinks:(BOOL)a3;
- (void)setCaretVisible:(BOOL)a3;
- (void)setContentScrollInitialContentOffset:(id)a3;
- (void)setCorrectionLearningAllowed:(BOOL)a3;
- (void)setCursorAssertion:(id)a3;
- (void)setDefaultTextInputTraits:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 force:(BOOL)a4;
- (void)setDelegate:(id)a3 force:(BOOL)a4 delayEndInputSession:(BOOL)a5;
- (void)setDeleteWordLastDelete:(double)a3;
- (void)setDidTeardownExistingDelegate:(id)a3;
- (void)setDocumentState:(id)a3;
- (void)setEditMenuFrame:(CGRect)a3;
- (void)setEditingTraitsMarkedDirty:(BOOL)a3;
- (void)setEnvironmentScrollInitialContentOffset:(id)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setForCustomInputView:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGeometryDelegate:(id)a3;
- (void)setGeometryIsChanging:(BOOL)a3;
- (void)setHardWareKeyboardAttached:(BOOL)a3;
- (void)setHardwareKeyboardIsSeen;
- (void)setHardwareKeyboardIsSeen:(BOOL)a3;
- (void)setHasNextKeyResponder:(BOOL)a3;
- (void)setHasPreviousKeyResponder:(BOOL)a3;
- (void)setHideInlineCandidates:(BOOL)a3;
- (void)setInHardwareKeyboardMode:(BOOL)a3;
- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4;
- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4 shouldMoveKeyboard:(BOOL)a5;
- (void)setInHardwareKeyboardMode:(BOOL)a3 shouldMoveKeyboard:(BOOL)a4;
- (void)setInSplitKeyboardMode:(BOOL)a3;
- (void)setInitialDirection;
- (void)setInlineCompletionAsMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 searchString:(id)a6;
- (void)setInputManagerState:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4;
- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4 updateIndicator:(BOOL)a5 executionContext:(id)a6;
- (void)setInputModeAssertion:(id)a3;
- (void)setInputModeAssertionWithReason:(id)a3;
- (void)setInputModeFromPreferences;
- (void)setInputModeSwitcherVisibleInRemote:(BOOL)a3;
- (void)setInputModeToNextInPreferredListWithExecutionContext:(id)a3;
- (void)setInternationalKeyIntroductionView:(id)a3;
- (void)setIsAttachedHardwareKeyboard:(id)a3;
- (void)setIsCallingTextChangedDuringInputModeSwitch:(BOOL)a3;
- (void)setKeyboardFeedbackAssistantViewController:(id)a3;
- (void)setKeyboardInputMode:(id)a3 userInitiated:(BOOL)a4;
- (void)setKeyboardMinimizedByDictation:(BOOL)a3;
- (void)setKeyboardState:(id)a3;
- (void)setLabel:(id)a3 forKey:(id)a4;
- (void)setLastChooseSupplementalItemToInsertCallbackIdentifier:(unint64_t)a3;
- (void)setLastMatchedSupplementalCandidate:(id)a3;
- (void)setLayoutAllowsContinuousPath:(BOOL)a3;
- (void)setLayoutForKeyHitTest:(id)a3;
- (void)setLayoutRenderConfig:(id)a3;
- (void)setLockFloating:(BOOL)a3;
- (void)setNeedsAutocorrectionRectsUpdate;
- (void)setOverlayContainerObserved:(id)a3;
- (void)setOverrideTextInputTraits:(id)a3;
- (void)setPendingSupplementalCandidateToInsert:(id)a3;
- (void)setPerformingRemoteTextOperations:(BOOL)a3;
- (void)setPreviousGlobeKeyEvent:(id)a3;
- (void)setPrewarmsPredictiveCandidates:(BOOL)a3;
- (void)setReceivedCandidatesInCurrentInputMode:(BOOL)a3;
- (void)setRemoteDelegateSupportsImagePaste:(BOOL)a3;
- (void)setRemoteDictationPopover:(id)a3;
- (void)setRequestedInteractionModel:(unint64_t)a3;
- (void)setRestoresToEmojiInputMode;
- (void)setReturnKeyEnabled:(BOOL)a3;
- (void)setRivenSplitLock:(BOOL)a3;
- (void)setSelectionWithPoint:(CGPoint)a3;
- (void)setServiceRole:(unint64_t)a3;
- (void)setShift:(BOOL)a3;
- (void)setShift:(BOOL)a3 autoshift:(BOOL)a4;
- (void)setShiftLocked:(BOOL)a3;
- (void)setShiftLockedForced:(BOOL)a3;
- (void)setShiftNeedsUpdate;
- (void)setShiftOffIfNeeded;
- (void)setShiftPreventAutoshift:(BOOL)a3;
- (void)setShiftStatesNeededInDestination:(BOOL)a3 autoShifted:(BOOL)a4 shiftLocked:(BOOL)a5;
- (void)setShouldIgnoreTextInputChanges:(BOOL)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3 userInitiated:(BOOL)a4;
- (void)setShouldUpdateCacheOnInputModesChange:(BOOL)a3;
- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3;
- (void)setShowInputModeIndicator:(BOOL)a3;
- (void)setShowsCandidateBar:(BOOL)a3;
- (void)setShowsCandidateInline:(BOOL)a3;
- (void)setSkipRecomputeInputMode:(BOOL)a3;
- (void)setSplit:(BOOL)a3 animated:(BOOL)a4;
- (void)setSplitProgress:(double)a3;
- (void)setSuggestions:(id)a3;
- (void)setSuppressUpdateAssistantView:(BOOL)a3;
- (void)setSuppressUpdateCandidateView:(BOOL)a3;
- (void)setSuppressUpdateInputMode:(BOOL)a3;
- (void)setSuppressUpdateLayout:(BOOL)a3;
- (void)setSuppressUpdateShiftState:(BOOL)a3;
- (void)setTextInputChangesIgnored:(BOOL)a3;
- (void)setTwoFingerTapTimestamp:(double)a3;
- (void)setUpdateLayoutOnShowKeyboard:(BOOL)a3;
- (void)setUserInteractionDelegate:(id)a3;
- (void)setUserSelectedCurrentCandidate:(BOOL)a3;
- (void)setUsesCandidateSelection:(BOOL)a3;
- (void)setWillSetupNewDelegate:(id)a3;
- (void)set_mimicShiftBeingHeld:(BOOL)a3;
- (void)showDictationMenuIfNeeded;
- (void)showInternationalKeyIntroductionIfNeededWithPreviousInputMode:(id)a3;
- (void)showKeyboard;
- (void)showKeyboardIfNeeded;
- (void)showKeyboardWithoutSuppressionPolicy;
- (void)showNextCandidates;
- (void)showNextPage;
- (void)showPreviousCandidate;
- (void)showSelectionCommands;
- (void)skipHitTestForTouchEvent:(id)a3;
- (void)skipHitTestForTouchEvent:(id)a3 delayed:(BOOL)a4;
- (void)skipHitTestForTouchEvents:(id)a3;
- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 completion:(id)a6;
- (void)startAutoDeleteTimer;
- (void)startAutoDeleteTimerForForce:(double)a3;
- (void)stickerPickerKeyboardSessionDidFinish;
- (void)stopAutoDelete;
- (void)syncDocumentStateToInputDelegate;
- (void)syncInputManagerToAcceptedAutocorrection:(id)a3 forInput:(id)a4;
- (void)syncInputManagerToKeyboardState;
- (void)takeTextInputTraitsFromDelegate;
- (void)textAccepted:(id)a3;
- (void)textChanged:(id)a3;
- (void)textDidChange:(id)a3;
- (void)textDidScroll;
- (void)textFrameChanged:(id)a3;
- (void)textSelectionInteractionWillBegin:(id)a3;
- (void)textSuggestionDidChange:(id)a3;
- (void)textWillChange:(id)a3;
- (void)textWillScroll;
- (void)toggleShift;
- (void)toggleSoftwareKeyboard;
- (void)touchAutocorrectPromptTimer;
- (void)touchDictationMenuTimer;
- (void)touchDictationMenuTimer:(BOOL)a3;
- (void)touchLongPressTimer;
- (void)touchLongPressTimerWithDelay:(double)a3;
- (void)trackUsageForCandidateAcceptedAction:(id)a3;
- (void)trackUsageForPromptedCorrection:(id)a3 inputString:(id)a4 previousPrompt:(id)a5;
- (void)traitCollectionDidChange;
- (void)triggerPendingKeyup;
- (void)underlineCandidate:(id)a3;
- (void)undoWithKeyboardInput:(id)a3;
- (void)unmarkText:(id)a3;
- (void)unsetEmojiPopoverToRestoreAfterRotation;
- (void)unsetPolicyDelegateResult;
- (void)updateActiveAutocorrectionRects;
- (void)updateAssistantView;
- (void)updateAssistantViewInfo:(id)a3;
- (void)updateAutocorrectContainerWithAutocorrection:(id)a3 parentView:(id)a4 correctionRects:(id)a5;
- (void)updateAutocorrectPrompt:(id)a3;
- (void)updateAutocorrectPrompt:(id)a3 correctionRects:(id)a4;
- (void)updateAutocorrectPrompt:(id)a3 executionContext:(id)a4;
- (void)updateCandidateDisplay;
- (void)updateChangeTimeAndIncrementCount;
- (void)updateDefaultsWithResults:(id)a3;
- (void)updateDictationButtonForDelegate:(id)a3;
- (void)updateDictationIgnoreKeyboardDidHideNotification;
- (void)updateDictationPopoverLocationForCandidateInlineView:(id)a3 yOffset:(double)a4;
- (void)updateDictationPopoverLocationIfNeeded;
- (void)updateDocumentViewsAfterKeyboardOutput:(id)a3;
- (void)updateForChangedSelection;
- (void)updateForExpectedRemoteDocumentStateChange:(id)a3 selectedTextRange:(_NSRange)a4 forceSync:(BOOL)a5;
- (void)updateForHandBiasChange;
- (void)updateFromTextInputTraits;
- (void)updateHardwareKeyboardLayout;
- (void)updateHardwareKeyboardLayout:(BOOL)a3;
- (void)updateIdleDetection:(int64_t)a3;
- (void)updateInputAssistantButtonItems;
- (void)updateInputDelegateForRemoteDocumentStateChange:(id)a3 selectedTextRange:(_NSRange)a4 hasText:(BOOL)a5 forceSync:(BOOL)a6;
- (void)updateInputDelegateForRemoteTraitChange:(id)a3 forceSync:(BOOL)a4;
- (void)updateInputModeIndicatorOnSingleKeyOnly:(BOOL)a3;
- (void)updateInputModeIndicatorOnSingleKeyOnly:(BOOL)a3 preserveIfPossible:(BOOL)a4;
- (void)updateIsAttachedHardwareKeyboard;
- (void)updateKeyboardConfigurations;
- (void)updateKeyboardStateForDeletion;
- (void)updateKeyboardStateForInsertion:(id)a3;
- (void)updateKeyboardStateForReplacingText:(id)a3 withText:(id)a4;
- (void)updateLayout;
- (void)updateLayoutAndSetShift;
- (void)updateLayoutIfNecessary;
- (void)updateLayoutIfNeeded;
- (void)updateLayoutToCurrentInterfaceOrientation;
- (void)updateLegacyAutocorrectPromptWithAutocorrection:(id)a3 parentView:(id)a4 correctionRects:(id)a5;
- (void)updateNoContentViews;
- (void)updateObserverState;
- (void)updateReturnKey;
- (void)updateReturnKey:(BOOL)a3;
- (void)updateShiftState;
- (void)updateShiftStateAfterAsyncSelectionChange;
- (void)updateShowCandidateBar;
- (void)updateStylingTraitsIfNeeded;
- (void)updateTextCandidateView;
- (void)updateTextInputKeyboardSource;
- (void)updateTextInputKeyboardSource:(id)a3;
- (void)willDismissEditMenu;
- (void)willMoveToWindow:(id)a3;
- (void)writingToolsDidEnd;
@end

@implementation UIKeyboardImpl

+ (id)activeInstance
{
  return (id)qword_1EB259F38;
}

- (BOOL)isMemberOfPossibleAutofillGroup:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isMemberOfPossibleAutofillGroup:a3];
}

- (id)window
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardImpl;
  v2 = [(UIView *)&v4 window];
  return v2;
}

+ (BOOL)rivenPreference
{
  return byte_1EB259F24;
}

- (void)setDelegate:(id)a3 force:(BOOL)a4 delayEndInputSession:(BOOL)a5
{
}

- (void)restoreTextSuggestions
{
}

- (void)_shouldClearTextSuggestions:(BOOL)a3
{
}

- (UIKeyInput)delegate
{
  v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  v3 = [v2 keyInputDelegate];

  return (UIKeyInput *)v3;
}

- (BOOL)callLayoutIsGeometricShiftOrMoreKeyForTouch:(id)a3
{
  id v4 = a3;
  BOOL v5 = (objc_opt_respondsToSelector() & 1) != 0
    && [(UIKeyboardLayout *)self->m_layout isGeometricShiftOrMoreKeyForTouch:v4];

  return v5;
}

+ (BOOL)shouldMergeAssistantBarWithKeyboardLayout
{
  v2 = [(id)qword_1EB259F38 _layout];
  char v3 = [v2 shouldMergeAssistantBarWithKeyboardLayout];

  return v3;
}

- (BOOL)layoutIsResizing
{
  v2 = [(UIKeyboardImpl *)self _layout];
  char v3 = [v2 isResizing];

  return v3;
}

- (id)_layout
{
  return self->m_layout;
}

- (void)resetIsPhysicallyAttachedHardwareKeyboard
{
  isAttachedHardwareKeyboard = self->_isAttachedHardwareKeyboard;
  self->_isAttachedHardwareKeyboard = 0;
}

- (BOOL)isHardwareKeyboardAttachedNow
{
  v2 = +[UIDevice currentDevice];
  char v3 = [v2 _isHardwareKeyboardAvailable];

  return v3;
}

- (void)selectionScrolling:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 name];
  uint64_t v6 = [v5 isEqualToString:@"UITextSelectionWillScroll"];

  id v8 = [v4 object];

  if (+[UIKeyboard usesInputSystemUI])
  {
    if (v6) {
      v7 = sel_textSelectionWillScroll;
    }
    else {
      v7 = sel_textSelectionDidScroll;
    }
    [(UIKeyboardImpl *)self _forwardScrollEventToUIHost:v7 scrollView:v8];
  }
  else
  {
    [(UIKeyboardImpl *)self _selectionScrolling:v6 scroller:v8];
  }
}

- (void)_selectionScrolling:(BOOL)a3 scroller:(id)a4
{
  int v4 = a3;
  id v61 = a4;
  uint64_t v6 = [(UIKeyboardImpl *)self inputDelegate];
  if (objc_opt_respondsToSelector())
  {
    v7 = [(UIKeyboardImpl *)self inputDelegate];
    id v8 = [v7 textInputView];
  }
  else
  {
    id v8 = 0;
  }

  BOOL v9 = +[UIKeyboard isKeyboardProcess];
  if (!v61 && v9) {
    id v61 = v8;
  }
  v10 = [(UIKeyboardImpl *)self window];
  if (!v10 || !v8) {
    goto LABEL_51;
  }
  int v11 = [v8 isDescendantOfView:v61];

  if (!v11) {
    goto LABEL_52;
  }
  int m_scrolling = self->m_scrolling;
  self->int m_scrolling = v4;
  v13 = [(UIKeyboardImpl *)self keyboardState];
  if (![v13 autofillMode]
    || !+[UIKeyboard isAutoFillPanelUIEnabled]
    || +[UIKeyboard isAlwaysBlockedAutoFillPanelClient])
  {
    goto LABEL_19;
  }
  if (+[UIKeyboard isAlwaysAllowedAutoFillPanelClient]) {
    char v14 = 0;
  }
  else {
    char v14 = !+[UIKeyboard isAutoFillPanelInAppsEnabled];
  }

  if (m_scrolling != v4 && (v14 & 1) == 0)
  {
    v13 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v13 documentStateChanged];
LABEL_19:
  }
  v15 = [(UIView *)self->m_autocorrectPrompt superview];

  if (v15)
  {
    v16 = self->m_autocorrectPrompt;
LABEL_24:
    v10 = v16;
    goto LABEL_25;
  }
  v17 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
  v18 = [v17 superview];

  if (v18)
  {
    v16 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    goto LABEL_24;
  }
  v10 = 0;
LABEL_25:
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    BOOL v19 = self->m_scrolling;
    if (m_scrolling != v4 && self->m_scrolling)
    {
      if (!+[UIKeyboard usesInputSystemUI])
      {
        v20 = [(UIKeyboardImpl *)self _textChoicesAssistant];
        [v20 textWillBeginScrolling];
      }
      BOOL v19 = self->m_scrolling;
    }
    if (v19 || !+[UIKeyboard usesInputSystemUI])
    {
      v21 = [(UIKeyboardImpl *)self _textChoicesAssistant];
      [v21 updateActivePromptForCandidate:0 displayRects:0 highlightOnly:0];

      v22 = [(UIKeyboardImpl *)self _textChoicesAssistant];
      [v22 dismissIfPresented];
    }
    if (m_scrolling != v4
      && !self->m_scrolling
      && !+[UIKeyboard usesInputSystemUI])
    {
      v23 = [(UIKeyboardImpl *)self _textChoicesAssistant];
      [v23 textDidEndScrolling];
    }
  }
  if (!v10) {
    goto LABEL_51;
  }
  if (self->m_scrolling)
  {
    v24 = [v10 window];
    int v25 = [v24 _isTextEffectsWindow];

    if (v25)
    {
      v26 = [v10 window];
      [v10 frame];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      v35 = [v10 superview];
      objc_msgSend(v26, "convertRect:fromView:", v35, v28, v30, v32, v34);
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;

      v44 = [v10 window];
      objc_msgSend(v44, "convertRect:toView:", v61, v37, v39, v41, v43);
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;

      [v10 removeFromSuperview];
      objc_msgSend(v10, "setFrame:", v46, v48, v50, v52);
      [v61 addSubview:v10];
    }
    goto LABEL_51;
  }
  id v53 = [v10 superview];
  v54 = v61;
  if (v53 == v61) {
    goto LABEL_48;
  }
  v55 = [v10 superview];
  v56 = [(UIKeyboardImpl *)self inputDelegate];
  uint64_t v57 = [v56 textInputView];
  if (v55 == (void *)v57)
  {

    v54 = v53;
LABEL_48:

LABEL_49:
    [v10 removeFromSuperview];
    if (!+[UIKeyboard isKeyboardProcess]) {
      [(UIKeyboardImpl *)self updateCandidateDisplay];
    }
    goto LABEL_51;
  }
  v58 = (void *)v57;
  v59 = [v10 window];
  char v60 = [v59 _isTextEffectsWindow];

  if (v60) {
    goto LABEL_49;
  }
LABEL_51:

LABEL_52:
}

- (id)inputDelegate
{
  v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  char v3 = [v2 textInputDelegate];

  return v3;
}

+ (BOOL)showsGlobeAndDictationKeysExternally
{
  char v3 = [a1 keyboardScreen];
  int v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  char v6 = +[UIDevice _hasHomeButton];
  v7 = [a1 _applicationClientComponent];
  id v8 = v7;
  if (v7) {
    int v9 = [v7 isKeyboardDockDisabled] ^ 1;
  }
  else {
    LOBYTE(v9) = 1;
  }
  char v10 = v9 & ~v6;
  if (v5) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

+ (id)keyboardScreen
{
  v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 delegateAsResponder];
  int v4 = [v3 _responderWindow];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v2 window];
  }
  v7 = v6;

  id v8 = [v7 screen];
  int v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = +[UIScreen mainScreen];
  }
  BOOL v11 = v10;

  return v11;
}

+ (id)_applicationClientComponent
{
  v2 = [a1 keyboardWindow];
  char v3 = [v2 windowScene];
  int v4 = [v3 _settingsScene];
  uint64_t v5 = [v4 _keyboardClientComponent];

  return v5;
}

+ (id)keyboardWindow
{
  v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 delegateAsResponder];
  uint64_t v4 = [v3 _responderWindow];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = [v2 window];

    if (!v5)
    {
      uint64_t v5 = +[UIWindow _applicationKeyWindow];
    }
  }

  return v5;
}

- (BOOL)canShowAppConnections
{
  char v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v4 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v5 = [v4 beginningOfDocument];
  id v6 = [(UIKeyboardImpl *)self inputDelegateManager];
  v7 = [v6 endOfDocument];
  uint64_t v8 = [v3 comparePosition:v5 toPosition:v7];

  int v9 = [(UIKeyboardImpl *)self textInputTraits];
  id v10 = [v9 textContentType];

  if (v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10 == 0;
  }
  return !v11;
}

- (id)delegateAsResponder
{
  v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  char v3 = [v2 delegateAsResponder];

  return v3;
}

- (UIKBInputDelegateManager)inputDelegateManager
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputDelegateManager];
}

- (id)textInputTraits
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
}

+ (BOOL)isActivatingForeground
{
  int v2 = [(id)UIApp _isActivating];
  if (v2)
  {
    char v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v4 = [v3 scene];
    uint64_t v5 = [v4 _FBSScene];
    id v6 = [v5 settings];
    char v7 = [v6 isForeground];

    LOBYTE(v2) = v7;
  }
  return v2;
}

- (BOOL)isMinimized
{
  char v3 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  uint64_t v4 = [v3 rtiInputSourceState];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    BOOL v6 = +[UIKeyboard usesLocalKeyboard];

    if (!v6)
    {
      char v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
      uint64_t v8 = [v7 rtiInputSourceState];
      LOBYTE(v9) = [v8 minimized];
LABEL_14:

      return v9;
    }
  }
  else
  {
  }
  int v9 = [(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached];
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);

  if (WeakRetained)
  {
    id v11 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
    char v12 = [v11 isMinimized];

    if ((v12 & 1) == 0) {
      goto LABEL_10;
    }
  }
  else if (!v9)
  {
    return v9;
  }
  if ([(UIKeyboardImpl *)self floatingForced])
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (![(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboard])
  {
    char v7 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v8 = [v7 currentInputMode];
    int v9 = [v8 showSWLayoutWithHWKeyboard] ^ 1;
    goto LABEL_14;
  }
  LOBYTE(v9) = 1;
  return v9;
}

+ (BOOL)isSplit
{
  char v3 = [a1 activeInstance];
  uint64_t v4 = [v3 remoteTextInputPartner];
  uint64_t v5 = [v4 rtiInputSourceState];

  if (v5)
  {
    BOOL v6 = [a1 activeInstance];
    char v7 = [v6 remoteTextInputPartner];
    uint64_t v8 = [v7 rtiInputSourceState];
    char v9 = [v8 split];

    return v9;
  }
  else
  {
    if (byte_1EB259F24) {
      BOOL v11 = byte_1EB259F10 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    return !v11 && byte_1EB259F30 == 0;
  }
}

- (BOOL)isInHardwareKeyboardMode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isInHardwareKeyboardMode];
}

+ (BOOL)isFloating
{
  char v3 = [a1 activeInstance];
  uint64_t v4 = [v3 remoteTextInputPartner];
  uint64_t v5 = [v4 rtiInputSourceState];

  if (v5)
  {
    BOOL v6 = [a1 activeInstance];
    char v7 = [v6 remoteTextInputPartner];
    uint64_t v8 = [v7 rtiInputSourceState];
    char v9 = [v8 floating];

    LOBYTE(v10) = v9;
  }
  else if (byte_1EB259F30)
  {
    int v10 = [a1 supportsFloating];
    if (v10)
    {
      if ([(id)qword_1EB259F38 isMinimized]
        && ([(id)qword_1EB259F38 isFloatingLocked] & 1) == 0)
      {
        BOOL v11 = (void *)qword_1EB259F38;
        LOBYTE(v10) = [v11 maximizing];
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (UIKBRTIPartner)remoteTextInputPartner
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager remoteTextInputPartner];
}

- (BOOL)shouldShowCandidateBar
{
  if ([(UIKeyboardImpl *)self shouldShowLongPredictionList]) {
    return 1;
  }
  BOOL v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager receivedCandidatesInCurrentInputMode];
  return [(UIKeyboardImpl *)self shouldShowCandidateBarIfReceivedCandidatesInCurrentInputMode:v4 ignoreHidePredictionTrait:0];
}

- (BOOL)shouldShowLongPredictionList
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldShowLongPredictionList];
}

- (BOOL)shouldShowCandidateBarIfReceivedCandidatesInCurrentInputMode:(BOOL)a3 ignoreHidePredictionTrait:(BOOL)a4
{
  BOOL v4 = a4;
  char v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v8 = [v7 inputViews];

  if (([v8 isCustomInputView] & 1) == 0
    && ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
     || (unint64_t)([(UIView *)self _keyboardOrientation] - 3) < 2
     || a3
     || (UIKeyboardAlwaysShowCandidateBarForCurrentInputMode() & 1) != 0
     || [(UIKeyboardImpl *)self canShowAppConnections])
    && [(UIKeyboardImpl *)self usesCandidateSelection]
    && self->m_layout
    && ![(UIKeyboardImpl *)self isUsingDictationLayout]
    && ![(UIKeyboardLayout *)self->m_layout isResized])
  {
    char v9 = [(UIKeyboardLayout *)self->m_layout candidateList];
    if (v9 || [(UIKeyboardLayout *)self->m_layout hasCandidateKeys])
    {
      BOOL v10 = 0;
    }
    else
    {
      char v12 = [(UIKeyboardImpl *)self dynamicCaretList];
      BOOL v10 = !v12
         && ([(UIKeyboardImpl *)self canUseCandidateBarAsSupplementToInlineView]|| (![(UIKeyboardImpl *)self isMinimized] || self->m_maximizing)&& ![(UIKeyboardImpl *)self showsCandidateInline])&& [(UIKeyboardImpl *)self currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:v4];
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  if (self->m_showsCandidateBar != a3)
  {
    BOOL v3 = a3;
    self->m_showsCandidateBar = a3;
    [(UIKeyboardImpl *)self _postInputResponderChangedNotification];
    uint64_t v5 = [(UIView *)self _rootInputWindowController];
    [v5 updateInputAssistantViewForInputViewSet:0];

    BOOL v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    char v7 = [v6 existingContainerRootController];
    [v7 updateInputAssistantViewForInputViewSet:0];

    if (v3)
    {
      uint64_t v8 = [(UIKeyboardImpl *)self candidateController];
      [v8 setActiveCandidateViewType:2];

      char v9 = [(UIKeyboardImpl *)self candidateController];
      BOOL v10 = [(UIView *)self _inheritedRenderConfig];
      [v9 _setRenderConfig:v10];
    }
    if (+[UIKeyboard isInputSystemUI])
    {
      BOOL v11 = [(UIKeyboardImpl *)self inputSystemSourceSession];
      if (v11)
      {
        id v14 = v11;
        char v12 = [v11 textOperations];
        [v12 setCustomInfoType:0x1ED14BC20];
        v13 = [(UIKeyboardImpl *)self buildInputSourceState];
        [v12 setInputSourceState:v13];

        [v14 flushOperations];
        BOOL v11 = v14;
      }
    }
  }
}

+ (BOOL)smartInsertDeleteIsEnabled
{
  int v2 = (void *)qword_1EB259F38;
  if (qword_1EB259F38)
  {
    return [v2 smartInsertDeleteIsEnabled];
  }
  else
  {
    BOOL v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v5 = [v4 preferencesActions];
    char v6 = [v5 BOOLForPreferenceKey:*MEMORY[0x1E4FAEAA0]];

    return v6;
  }
}

- (void)clearKeyboardWindowSnapshot
{
}

- (void)refreshRivenPreferences
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  +[UIKeyboardImpl refreshRivenStateWithTraits:v2 isKeyboard:1];
}

+ (void)refreshRivenStateWithTraits:(id)a3 isKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v31 = a3;
  uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  byte_1EB259F1A = (SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1;
  char v6 = v31;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (!v31) {
      goto LABEL_7;
    }
    uint64_t v7 = [v31 keyboardType];
    BOOL v8 = 0;
    if (v7 != 12 && v7 != 122) {
      BOOL v8 = v7 != 127;
    }
    byte_1EB259F20 = v8;
    char v9 = byte_1EB259F1A;
    if (!byte_1EB259F1A)
    {
      byte_1EB259F24 = 0;
    }
    else
    {
LABEL_7:
      BOOL v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
      BOOL v11 = [v10 preferencesActions];
      byte_1EB259F24 = [v11 BOOLForPreferenceKey:*MEMORY[0x1E4FAEA90]];

      char v9 = byte_1EB259F24;
    }
    byte_1EB259F28 = v9;
    char v12 = UIKeyboardDeviceSupportsSplit();
    byte_1EB259F20 = v12;
    if (byte_1EB259F24) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
    byte_1EB259F24 = v13;
    +[UIKeyboardImpl persistentSplitProgress];
    byte_1EB259F10 = 1.0 - v14 < 0.00000011920929;
    if (v4)
    {
      char v15 = UIKeyboardSupportsSplit();
      if (byte_1EB259F24) {
        char v16 = v15;
      }
      else {
        char v16 = 0;
      }
      byte_1EB259F24 = v16;
    }
    if (v31)
    {
      char v17 = [v31 acceptsSplitKeyboard];
      if (byte_1EB259F24) {
        char v18 = v17;
      }
      else {
        char v18 = 0;
      }
      byte_1EB259F24 = v18;
      uint64_t v19 = [v31 keyboardType];
      BOOL v20 = 0;
      if (v19 != 12 && v19 != 122) {
        BOOL v20 = v19 != 127;
      }
      if (!byte_1EB259F24) {
        BOOL v20 = 0;
      }
      byte_1EB259F24 = v20;
      char v21 = [v31 acceptsFloatingKeyboard];
      if (byte_1EB259F28) {
        char v22 = v21;
      }
      else {
        char v22 = 0;
      }
      byte_1EB259F28 = v22;
      [v31 floatingKeyboardEdgeInsets];
      qword_1EB259F70 = v23;
      *(void *)algn_1EB259F78 = v24;
      qword_1EB259F80 = v25;
      unk_1EB259F88 = v26;
    }
    double v27 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v28 = [v27 preferencesActions];
    char v29 = [v28 BOOLForPreferenceKey:*MEMORY[0x1E4FAE8B0]];

    BOOL v30 = (v29 & 1) != 0 || +[UIKeyboardImpl isFloatingForced];
    char v6 = v31;
    byte_1EB259F30 = v30;
  }
}

+ (id)sharedInstance
{
  return (id)[a1 sharedInstanceForCustomInputView:0];
}

+ (id)sharedInstanceForCustomInputView:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_1EB259F38)
  {
    if (!a3 && [(id)qword_1EB259F38 forCustomInputView])
    {
      [(id)qword_1EB259F38 setForCustomInputView:0];
      [(id)qword_1EB259F38 setInputModeFromPreferences];
    }
  }
  else
  {
    id v5 = objc_alloc((Class)a1);
    uint64_t v6 = objc_msgSend(v5, "initWithFrame:forCustomInputView:", v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v7 = (void *)qword_1EB259F38;
    qword_1EB259F38 = v6;

    [(id)UIApp _registerForUserDefaultsChanges];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardImpl_sharedInstanceForCustomInputView___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB259F40 != -1) {
    dispatch_once(&qword_1EB259F40, block);
  }
  BOOL v8 = (void *)qword_1EB259F38;
  return v8;
}

void __51__UIKeyboardImpl_sharedInstanceForCustomInputView___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_applicationWillSuspend_ name:@"UIApplicationSuspendedNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_applicationDidReceiveMemoryWarning_ name:@"UIApplicationDidReceiveMemoryWarningNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_applicationWillResignActive_ name:@"UIApplicationWillResignActiveNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_applicationDidBecomeActive_ name:@"UIApplicationDidBecomeActiveNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_applicationWillEnterForeground_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_applicationDidEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel_switchControlStatusDidChange_ name:@"UIAccessibilitySwitchControlStatusDidChangeNotification" object:0];
}

+ (void)releaseSharedInstance
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB259F38)
  {
    if (os_variant_has_internal_diagnostics())
    {
      BOOL v3 = _UIKeyboardExtendedLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(qword_1EB259F38 + 712);
        int v5 = 134217984;
        uint64_t v6 = v4;
        _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "releasing shared Impl (id=%ld)", (uint8_t *)&v5, 0xCu);
      }
    }
    [(id)qword_1EB259F38 releaseInputManager];
    [(id)qword_1EB259F38 clearDelegate];
    [(id)qword_1EB259F38 clearAnimations];
    [(id)qword_1EB259F38 clearTimers];
    [(id)qword_1EB259F38 clearLayouts];
    [(id)qword_1EB259F38 removeFromSuperview];
    [(id)qword_1EB259F38 detach];
    id v2 = (void *)qword_1EB259F38;
    qword_1EB259F38 = 0;
  }
  loadsAddressBook = 1;
}

+ (void)purgeImageCache
{
  id v2 = +[UIKeyboardCache sharedInstance];
  [v2 purge];
}

+ (void)applicationWillSuspend:(id)a3
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  int v4 = [v3 usesCandidateSelection];

  if (v4)
  {
    int v5 = +[UIKeyboard activeKeyboard];
    [v5 acceptAutocorrectionWithCompletionHandler:0];
  }
  uint64_t v6 = +[UIKeyboardImpl activeInstance];
  uint64_t v7 = [v6 _layout];
  [v7 resetTouchProcessingForKeyboardChange];

  BOOL v8 = +[UIKeyboardImpl activeInstance];
  char v9 = [v8 _layout];
  [v9 clearUnusedObjects:0];

  +[UIKBRenderer clearInternalCaches];
  BOOL v10 = +[UIKeyboardCache sharedInstance];
  [v10 commitTransaction];

  id v11 = +[UIKeyboardCache sharedInstance];
  [v11 clearNonPersistentCache];
}

+ (void)applicationWillResignActive:(id)a3
{
  BOOL v3 = +[UIKeyboard isSpotlight];
  int v4 = +[UIKeyboardImpl activeInstance];
  [v4 dismissEmojiPopoverBeforeCleanup:v3];

  int v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v6 = [v5 scene];
  uint64_t v7 = [v6 _effectiveUISettings];
  [v7 deactivationReasons];

  BOOL v8 = +[UIKeyboardImpl activeInstance];
  [v8 dismissAutoFillPopover];

  char v9 = +[UIKeyboardCache sharedInstance];
  [v9 commitTransaction];

  BOOL v10 = +[UIKeyboardCache sharedInstance];
  [v10 clearNonPersistentCache];

  id v11 = +[UIKeyboardImpl activeInstance];
  char v12 = [v11 _layout];
  [v12 clearTransientState];

  char v13 = +[UIKeyboardImpl activeInstance];
  double v14 = [v13 _layout];
  [v14 setCursorLocation:0];

  char v15 = +[UIKeyboardImpl activeInstance];
  [v15 deactivateLayout];

  char v16 = +[UIKeyboardImpl activeInstance];
  char v17 = [v16 _layout];
  [v17 resetTouchProcessingForKeyboardChange];

  char v18 = +[UIKeyboardImpl activeInstance];
  [v18 cancelAllKeyEvents];

  uint64_t v19 = +[UIKeyboardImpl activeInstance];
  [v19 dismissEditingIntroductionView];

  BOOL v20 = +[UIKeyboardImpl activeInstance];
  [v20 dismissMultilingualKeyboardTip];

  char v21 = +[UIKeyboardImpl activeInstance];
  [v21 dismissMultilingualSettingTip];

  char v22 = +[UIKeyboardImpl activeInstance];
  [v22 setPreviousGlobeKeyEvent:0];

  +[_UIKBFeedbackGeneratorPartner cooldownSystemSoundsForObject:qword_1EB259F38];
  id v24 = +[UIKeyboardImpl activeInstance];
  uint64_t v23 = [v24 inputModeIndicatorController];
  [v23 willResignActive];
}

+ (void)applicationDidBecomeActive:(id)a3
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  int v4 = [v3 _layout];
  [v4 setCursorLocation:258];

  id v6 = +[UIKeyboardImpl activeInstance];
  int v5 = [v6 _layout];
  [v5 updateTouchProcessingForKeyboardChange];
}

+ (void)applicationDidEnterBackground:(id)a3
{
  id v7 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v7 _layout];
  [v3 resetTouchProcessingForKeyboardChange];

  [v7 cancelAllKeyEvents];
  [(id)qword_1EB259F38 _updateSoundPreheatingForWindow:0];
  [v7 dismissEditingIntroductionView];
  [v7 dismissMultilingualKeyboardTip];
  [v7 dismissMultilingualSettingTip];
  [v7 dismissStickerEditor:0];
  int v4 = [v7 keyboardStateManager];
  [v4 hostApplicationDidEnterBackground];

  int v5 = (void *)UIKeyboardSupportsTouch;
  UIKeyboardSupportsTouch = 0;

  id v6 = (void *)UIKeyboardCachedIsRightHandDrive;
  UIKeyboardCachedIsRightHandDrive = 0;
}

+ (void)applicationWillEnterForeground:(id)a3
{
  _UIKBRT_ResetSystemUptimeOnResume();
  BOOL v3 = (void *)qword_1EB259F38;
  int v4 = [(id)qword_1EB259F38 window];
  [v3 _updateSoundPreheatingForWindow:v4];

  id v6 = +[UIKeyboardImpl activeInstance];
  int v5 = [v6 keyboardStateManager];
  [v5 hostApplicationWillEnterForeground];
}

+ (void)applicationDidReceiveMemoryWarning:(id)a3
{
  id v3 = a3;
  +[UICompatibilityInputViewController applicationDidReceiveMemoryWarning:v3];
}

+ (void)switchControlStatusDidChange:(id)a3
{
  id v3 = +[UIKeyboardImpl activeInstance];
  [v3 reloadCurrentInputMode];
}

+ (Class)layoutClassForCurrentInputMode
{
  id v3 = UIKeyboardGetCurrentInputMode();
  int v4 = [a1 layoutClassForInputMode:v3 keyboardType:0 screenTraits:0];

  return (Class)v4;
}

+ (UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v6 = a4;
  id v7 = [a1 keyboardScreen];
  BOOL v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v9 = [v8 keyboardWindow];

  BOOL v10 = [v9 rootViewController];
  id v11 = [v10 bottomEdgeView];
  char v12 = [v10 placement];
  v64 = v11;
  if (([v12 showsInputViews] & 1) != 0 || objc_msgSend(v12, "isUndocked"))
  {
    objc_msgSend(v11, "frame", v11);
    if (v13 > 0.0)
    {
      [v11 safeAreaInsets];
LABEL_7:
      double v15 = v14;
      goto LABEL_9;
    }
  }
  if (v9)
  {
    [v9 _managedSafeAreaInsets];
    goto LABEL_7;
  }
  char v16 = [a1 keyboardWindow];
  [v16 _managedSafeAreaInsets];
  double v15 = v17;

LABEL_9:
  objc_msgSend(v7, "_referenceBounds", v64);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  [v7 _unjailedReferenceBounds];
  v69.origin.x = v26;
  v69.origin.y = v27;
  v69.size.width = v28;
  v69.size.height = v29;
  v67.origin.x = v19;
  v67.origin.y = v21;
  v67.size.width = v23;
  v67.size.height = v25;
  v66 = v9;
  if (CGRectEqualToRect(v67, v69)
    || (unint64_t)(+[UIApplication _classicMode] - 5) <= 1)
  {
    BOOL v30 = v12;
    id v31 = a1;
    double v32 = v6;
    if (+[UIKeyboard isInputSystemUI])
    {
      double v33 = +[UIDevice currentDevice];
      uint64_t v34 = [v33 userInterfaceIdiom];

      char v35 = ((v34 & 0xFFFFFFFFFFFFFFFBLL) == 1) ^ ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1);
    }
    else
    {
      char v35 = 0;
    }
  }
  else
  {
    BOOL v30 = v12;
    id v31 = a1;
    double v32 = v6;
    char v35 = 1;
  }
  BOOL v36 = +[UIKeyboardImpl isFloating];
  BOOL v37 = +[UIDevice _hasHomeButton];
  int64_t v38 = a3;
  if ((v35 & 1) != 0 || v37) {
    goto LABEL_23;
  }
  char v39 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1 || v36;
  if ((v39 & 1) == 0 && !+[UIKeyboardImpl isSplit])
  {
    double v45 = 0.0;
    double v41 = 20.0;
    goto LABEL_43;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
LABEL_23:
    uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    double v41 = 0.0;
    if ((unint64_t)(a3 - 3) <= 1 && (SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      double v42 = [v32 identifier];
      if (UIKeyboardShouldAddMarginOnLandscapeLargePhoneKeyboard(v42))
      {
        [v7 _referenceBounds];
        double v44 = v43;

        if (v44 >= 667.0)
        {
          double v45 = 72.0;
          goto LABEL_43;
        }
      }
      else
      {
      }
    }
    double v45 = 0.0;
    goto LABEL_43;
  }
  double v45 = 0.0;
  if ((unint64_t)(a3 - 1) >= 2) {
    double v41 = 0.0;
  }
  else {
    double v41 = 75.0;
  }
  if ((unint64_t)(a3 - 3) <= 1)
  {
    if ([v32 isExtensionInputMode]) {
      double v41 = v15;
    }
    else {
      double v41 = v15 + -2.0;
    }
    double v46 = [v32 identifier];
    int v47 = [v46 hasPrefix:@"emoji"];

    if (v47) {
      double v48 = 44.0;
    }
    else {
      double v48 = 75.0;
    }
    [v7 _referenceBounds];
    if (v49 >= 896.0) {
      double v45 = v48 + 42.0;
    }
    else {
      double v45 = v48;
    }
  }
LABEL_43:
  double v50 = [v31 _applicationClientComponent];
  [v50 minimumKeyboardPadding];
  if (v52 == 0.0 && v51 == 0.0 && v54 == 0.0 && (double v55 = 0.0, v53 == 0.0))
  {
    double v56 = v45;
  }
  else
  {
    double v55 = fmax(v51, 0.0);
    double v57 = fmax(v45, v52);
    double v41 = fmax(v41, v53);
    double v58 = fmax(v45, v54);
    double v59 = fmax(v57, v58);
    if ((unint64_t)(v38 - 3) >= 2) {
      double v45 = v58;
    }
    else {
      double v45 = v59;
    }
    if ((unint64_t)(v38 - 3) >= 2) {
      double v56 = v57;
    }
    else {
      double v56 = v59;
    }
  }

  double v60 = v55;
  double v61 = v56;
  double v62 = v41;
  double v63 = v45;
  result.right = v63;
  result.bottom = v62;
  result.left = v61;
  result.top = v60;
  return result;
}

+ (UIEdgeInsets)deviceSpecificStaticHitBufferForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v6 = a4;
  double v7 = 0.0;
  if ((_UIApplicationIsFirstPartyStickers() & 1) == 0)
  {
    int v8 = [v6 isExtensionInputMode];
    char v9 = [(id)objc_opt_class() keyboardScreen];
    BOOL v10 = +[UIKBScreenTraits traitsWithScreen:v9 orientation:a3];

    uint64_t v11 = [v10 idiom];
    [a1 deviceSpecificPaddingForInterfaceOrientation:a3 inputMode:v6];
    BOOL v13 = v12 <= 0.0 || v11 == 3;
    double v14 = 17.0;
    if (v13) {
      double v14 = 0.0;
    }
    if (v8) {
      double v7 = 0.0;
    }
    else {
      double v7 = v14;
    }
  }
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = 0.0;
  double v18 = v7;
  result.right = v17;
  result.bottom = v18;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  int v4 = objc_opt_class();
  [v4 defaultSizeForInterfaceOrientation:a3];
  result.height = v6;
  result.width = v5;
  return result;
}

- (UIEdgeInsets)deviceSpecificStaticHitBufferForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v5 = a4;
  [(id)objc_opt_class() deviceSpecificStaticHitBufferForInterfaceOrientation:a3 inputMode:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)deviceSpecificPaddingForInterfaceOrientation:(int64_t)a3 inputMode:(id)a4
{
  id v5 = a4;
  [(id)objc_opt_class() deviceSpecificPaddingForInterfaceOrientation:a3 inputMode:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  id v5 = [(id)objc_opt_class() keyboardScreen];
  double v6 = +[UIKBScreenTraits traitsWithScreen:v5 orientation:a3];

  double v7 = [(id)objc_opt_class() activeInstance];
  double v8 = [v7 textInputTraits];

  if (v8) {
    uint64_t v9 = [v8 keyboardType];
  }
  else {
    uint64_t v9 = 0;
  }
  if ([v6 idiom] == 2)
  {
    double v10 = +[UIKeyboard activeKeyboard];
    if (v10)
    {
      double v11 = +[UIKeyboard activeKeyboard];
      uint64_t v12 = [v11 _useLinearLayout];
    }
    else
    {
      uint64_t v12 = 0;
    }

    [v6 updateForLinearLayout:v12];
  }
  else if ([v6 idiom] == 3)
  {
    double v13 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v6, "updateForTextInputTraits:supportedInteractionModel:", 0, objc_msgSend(v13, "requestedInteractionModel"));
  }
  double v14 = +[UIKeyboardInputModeController sharedInputModeController];
  double v15 = [v14 currentInputMode];

  double v16 = [v15 identifier];
  double v17 = (void *)[a1 layoutClassForInputMode:v16 keyboardType:v9 screenTraits:v6];

  double v18 = [v15 identifier];
  [v17 keyboardSizeForInputMode:v18 screenTraits:v6 keyboardType:v9];
  double v20 = v19;
  double v22 = v21;

  [a1 topMarginForInterfaceOrientation:a3];
  double v24 = v22 + v23;
  [a1 deviceSpecificStaticHitBufferForInterfaceOrientation:a3 inputMode:v15];
  double v26 = v24 + v25;

  double v27 = v20;
  double v28 = v26;
  result.height = v28;
  result.width = v27;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3
{
  [a1 sizeForInterfaceOrientation:a3 ignoreInputView:0];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4
{
  double v7 = +[UIPeripheralHost sharedInstance];
  double v8 = [v7 loadAwareInputViews];

  uint64_t v9 = +[UIKeyboardInputModeController sharedInputModeController];
  double v10 = [v9 currentInputMode];
  int v11 = [v10 isExtensionInputMode];

  if (!v11) {
    goto LABEL_7;
  }
  uint64_t v12 = [v8 inputViewController];
  double v13 = [v12 view];
  [v13 bounds];
  double v15 = v14;
  double v17 = v16;

  if ([v8 isCustomInputView] && a4 || v17 <= 0.0)
  {
    double v18 = +[UIKeyboardInputModeController sharedInputModeController];
    double v19 = [v18 currentInputMode];
    double v20 = +[UICompatibilityInputViewController inputSnapshotViewForInputMode:v19 orientation:a3];

    if (v20)
    {
      [v20 bounds];
      double v15 = v21;
      double v17 = v22;
LABEL_13:

      goto LABEL_14;
    }
LABEL_7:
    [a1 keyboardSizeForInterfaceOrientation:a3];
    double v15 = v23;
    double v17 = v24;
    double v25 = +[UIKeyboardImpl activeInstance];
    double v20 = v25;
    if (v25)
    {
      double v26 = [v25 _layout];

      if (v26)
      {
        if (a4) {
          uint64_t v27 = 0;
        }
        else {
          uint64_t v27 = [v8 isCustomInputView];
        }
        [a1 additionalInstanceHeightForInterfaceOrientation:a3 hasInputView:v27];
        double v29 = v28;
        [a1 topMarginForInterfaceOrientation:a3];
        double v17 = v17 + v29 - v30;
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  double v31 = v15;
  double v32 = v17;
  result.height = v32;
  result.width = v31;
  return result;
}

+ (BOOL)keyboardOrientation:(int64_t)a3 isEquivalentToOrientation:(int64_t)a4
{
  if (a3 && a4) {
    return ((unint64_t)(a3 - 5) < 0xFFFFFFFFFFFFFFFELL) ^ ((unint64_t)(a4 - 3) < 2);
  }
  else {
    return a3 == a4;
  }
}

+ (CGSize)keyboardSizeForInterfaceOrientation:(int64_t)a3
{
  objc_msgSend(a1, "defaultSizeForInterfaceOrientation:");
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = +[UIKeyboardImpl activeInstance];
  double v10 = [v9 _layout];

  [v10 frame];
  double v12 = v11;
  if (v10)
  {
    if (([v10 isDynamicLayout] & 1) == 0
      && objc_msgSend(a1, "keyboardOrientation:isEquivalentToOrientation:", objc_msgSend(v10, "orientation"), a3)&& objc_msgSend(v10, "isMemberOfClass:", objc_msgSend(a1, "layoutClassForCurrentInputMode"))&& v6 == v12)
    {
      [v10 frame];
      double v6 = v14;
LABEL_10:
      double v18 = v13;
      [a1 topMarginForInterfaceOrientation:a3];
      double v8 = v18 + v19;
      goto LABEL_11;
    }
    if (+[UIKeyboardImpl isSplit])
    {
      double v15 = +[UIKeyboardImpl activeInstance];
      double v16 = [v15 textInputTraits];
      int v17 = [v16 acceptsSplitKeyboard];

      if (v17)
      {
        [v10 frame];
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  if ([v10 idiom] == 3) {
    double v6 = v12;
  }

  double v20 = v6;
  double v21 = v8;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (id)normalizedInputModesFromPreference
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  double v3 = [v2 normalizedEnabledInputModeIdentifiers];

  return v3;
}

+ (double)topMarginForInterfaceOrientation:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__UIKeyboardImpl_topMarginForInterfaceOrientation___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB259F60 != -1) {
    dispatch_once(&qword_1EB259F60, block);
  }
  double v5 = 0.0;
  if (([a1 isSplit] & 1) == 0 && (objc_msgSend(a1, "isFloating") & 1) == 0)
  {
    uint64_t v6 = qword_1EB259F58;
    double v7 = +[UIKeyboardInputModeController sharedInputModeController];
    double v8 = [v7 currentInputMode];
    uint64_t v9 = [v8 normalizedIdentifier];
    LOBYTE(v6) = [(id)v6 containsObject:v9];

    if ((v6 & 1) == 0)
    {
      double v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v11 = [v10 preferencesActions];
      char v12 = [v11 currentInputModeSupportsCrescendo];

      if ((v12 & 1) == 0)
      {
        if ((unint64_t)(a3 - 3) >= 2) {
          double v13 = &qword_1EB259F48;
        }
        else {
          double v13 = (uint64_t *)&unk_1EB259F50;
        }
        return *(double *)v13;
      }
    }
  }
  return v5;
}

void __51__UIKeyboardImpl_topMarginForInterfaceOrientation___block_invoke(uint64_t a1)
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v2 = [*(id *)(a1 + 32) keyboardScreen];
    id v7 = +[UIKBScreenTraits traitsWithScreen:v2 orientation:1];

    if ([v7 isKeyboardMinorEdgeWidth] && (objc_msgSend(v7, "keyboardWidth"), v3 >= 1024.0))
    {
      double v4 = 7.0;
      double v5 = 5.0;
    }
    else
    {
      double v4 = 10.0;
      double v5 = 7.0;
    }
    qword_1EB259F48 = *(void *)&v5;
    unk_1EB259F50 = *(void *)&v4;
    uint64_t v6 = (void *)qword_1EB259F58;
    qword_1EB259F58 = (uint64_t)&unk_1ED3F0898;
  }
}

+ (double)additionalInstanceHeightForInterfaceOrientation:(int64_t)a3 hasInputView:(BOOL)a4
{
  if ([a1 shouldMergeAssistantBarWithKeyboardLayout])
  {
    id v7 = +[UIKeyboardInputModeController sharedInputModeController];
    double v8 = [v7 currentInputMode];
    int v9 = [v8 isEmojiInputMode];

    if (!v9) {
      return 0.0;
    }
  }
  if (([(id)qword_1EB259F38 disableInputBars] & 1) != 0 || a4) {
    return 0.0;
  }
  if (!a3) {
    a3 = +[UIKeyboardSceneDelegate interfaceOrientation];
  }
  [a1 topMarginForInterfaceOrientation:a3];
  return result;
}

+ (double)additionalInstanceHeight
{
  double v3 = +[UIKeyboard activeKeyboard];
  objc_msgSend(a1, "additionalInstanceHeightForInterfaceOrientation:hasInputView:", objc_msgSend(v3, "interfaceOrientation"), 0);
  double v5 = v4;

  return v5;
}

+ (double)additionalInstanceHeightForInterfaceOrientation:(int64_t)a3
{
  [a1 additionalInstanceHeightForInterfaceOrientation:a3 hasInputView:0];
  return result;
}

+ (BOOL)canShowInternationalKey
{
  return 1;
}

- (void)didMoveToWindow
{
  double v3 = [(UIView *)self _rootInputWindowController];
  double v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  objc_msgSend(v3, "setDisableUpdateMaskForSecureTextEntry:", objc_msgSend(v4, "isSecureTextEntry"));

  if (+[UIKeyboardImpl showsGlobeAndDictationKeysExternally])
  {
    double v5 = [(UIView *)self _rootInputWindowController];
    [v5 updateSupportsDockViewController];
  }
  uint64_t v6 = [(UIView *)self _window];
  if (v6)
  {
    id v7 = (void *)v6;
    double m_bottomPadding = self->m_bottomPadding;
    int64_t v9 = [(UIView *)self _keyboardOrientation];
    double v10 = +[UIKeyboardInputModeController sharedInputModeController];
    double v11 = [v10 currentInputMode];
    +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:v9 inputMode:v11];
    double v13 = v12;

    if (m_bottomPadding != v13)
    {
      [(UIKeyboardImpl *)self updateLayout];
    }
  }
}

- (BOOL)hardwareKeyboardIsSeen
{
  id v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v3 = [v2 preferencesActions];
  char v4 = [v3 oneTimeActionCompleted:*MEMORY[0x1E4FAE618]];

  return v4;
}

- (void)setHardwareKeyboardIsSeen
{
}

- (void)setHardwareKeyboardIsSeen:(BOOL)a3
{
  if (a3 && ![(UIKeyboardImpl *)self hardwareKeyboardIsSeen])
  {
    id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v3 = [v4 preferencesActions];
    [v3 didTriggerOneTimeAction:*MEMORY[0x1E4FAE618]];
  }
}

- (void)setCapsLockSign
{
  if (!+[UIKeyboard isCapslockIndicatorEnabled])
  {
    id v37 = [(UIKeyboardImpl *)self textInputTraits];
    if ([v37 isSecureTextEntry])
    {
      uint64_t v6 = [(UIKeyboardImpl *)self textInputTraits];
      if ([v6 displaySecureTextUsingPlainText])
      {
LABEL_7:

        goto LABEL_8;
      }
      double v8 = [(UIKeyboardImpl *)self inputDelegateManager];
      int64_t v9 = [v8 keyInputDelegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        return;
      }
      double v11 = [(UIKeyboardImpl *)self inputDelegateManager];
      id v37 = [v11 keyInputDelegate];

      uint64_t v12 = [v37 rightView];
      if (v12)
      {
        double v13 = (void *)v12;
        double v14 = [v37 rightView];
        m_capsLockSign = self->m_capsLockSign;

        id v7 = v37;
        if (v14 != m_capsLockSign) {
          goto LABEL_9;
        }
      }
      if ([(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached]
        && self->m_isCapsLocked
        || [(_UIKeyboardStateManager *)self->_keyboardStateManager shiftLocked]
        && [(UIKeyboardLayout *)self->m_layout isAlphabeticPlane])
      {
        double v16 = [v37 font];
        [v16 pointSize];
        double v18 = v17 + 6.0;

        [v37 bounds];
        if (v18 > v19)
        {
          [v37 bounds];
          double v18 = v20;
        }
        double v21 = self->m_capsLockSign;
        if (!v21)
        {
          double v22 = [UIImageView alloc];
          double v23 = _UIImageWithName(@"password-capslock.png");
          double v24 = [(UIImageView *)v22 initWithImage:v23];
          double v25 = self->m_capsLockSign;
          self->m_capsLockSign = v24;

          double v21 = self->m_capsLockSign;
        }
        [(UIView *)v21 frame];
        double v27 = v26;
        double v29 = v28;
        uint64_t v30 = [v37 rightView];
        if (v30)
        {
          double v31 = (void *)v30;
          [(UIView *)self->m_capsLockSign frame];
          v40.origin.x = v27;
          v40.origin.y = v29;
          v40.size.width = v18;
          v40.size.height = v18;
          BOOL v32 = CGRectEqualToRect(v39, v40);

          id v7 = v37;
          if (v32) {
            goto LABEL_9;
          }
        }
        -[UIView setFrame:](self->m_capsLockSign, "setFrame:", v27, v29, v18, v18);
        [v37 bounds];
        objc_msgSend(v37, "_setRightViewOffset:", (v33 - v18) * -0.5, 0.0);
        uint64_t v34 = self->m_capsLockSign;
        uint64_t v35 = 1;
      }
      else
      {
        BOOL v36 = [v37 rightView];

        id v7 = v37;
        if (!v36) {
          goto LABEL_9;
        }
        uint64_t v34 = 0;
        uint64_t v35 = 0;
      }
      [v37 setRightView:v34];
      [v37 setRightViewMode:v35];
    }
LABEL_8:
    id v7 = v37;
LABEL_9:

    return;
  }
  BOOL m_isCapsLocked = self->m_isCapsLocked;
  id v4 = [(UIKeyboardImpl *)self capslockAssertion];
  double v5 = v4;
  if (m_isCapsLocked)
  {

    if (v5) {
      return;
    }
    id v37 = [(UIKeyboardImpl *)self _activeAssertionController];
    uint64_t v6 = [v37 capslockAssertionWithReason:@"setCapsLockSign"];
    [(UIKeyboardImpl *)self setCapslockAssertion:v6];
    goto LABEL_7;
  }
  [v4 invalidate];

  [(UIKeyboardImpl *)self setCapslockAssertion:0];
}

- (void)setCapsLockIfNeeded
{
  uint64_t v3 = [(id)UIApp _hardwareKeyboard:0];
  [(UIKeyboardImpl *)self _setCapsLockIfNeeded:v3 event:0];
}

- (void)setCapsLockIfNeededForPhysicalKeyboardEvent:(id)a3
{
  uint64_t v4 = [(id)UIApp _hardwareKeyboardForPhysicalKeyboardEvent:a3 createIfNeeded:0];
  [(UIKeyboardImpl *)self _setCapsLockIfNeeded:v4 event:0];
}

- (void)_setCapsLockIfNeeded:(__GSKeyboard *)a3 event:(__IOHIDEvent *)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unsigned int v6 = GSKeyboardGetModifierState() & 0x40000;
  BOOL v7 = v6 == 0;
  if (a4)
  {
    double v8 = BKSHIDEventGetKeyboardAttributes();
    int IsCapsLockLightOn = ([v8 GSModifierState] >> 18) & 1;
  }
  else
  {
    int IsCapsLockLightOn = BKSHIDKeyboardIsCapsLockLightOn();
  }
  if (v6 >> 18 == IsCapsLockLightOn)
  {
    BOOL v7 = v6 != 0;
  }
  else
  {
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    GSKeyboardTranslateKeyExtendedCommandWithUsagePage();
    double v10 = _UIHardwareKeyboardLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[UIKeyboardImpl _setCapsLockIfNeeded:event:]";
      __int16 v13 = 1024;
      int v14 = (v6 >> 18) ^ 1;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "%s, toggle capslock state to %d", buf, 0x12u);
    }
  }
  if (self->m_isCapsLocked != v7)
  {
    self->BOOL m_isCapsLocked = v7;
    if ([(UIKeyboardImpl *)self isMinimized]) {
      [(UIKeyboardImpl *)self notifyShiftState];
    }
    else {
      [(UIKeyboardImpl *)self setCapsLockSign];
    }
  }
}

- (BOOL)isCapsLockSignOn
{
  return self->m_isCapsLocked;
}

- (void)_resetCapsLock
{
  if (_lastUsedKeyboardSenderID) {
    BKSHIDKeyboardSetCapsLockActive();
  }
  [(UIKeyboardImpl *)self setCapsLockIfNeeded];
}

- (UIKeyboardImpl)initWithFrame:(CGRect)a3
{
  return -[UIKeyboardImpl initWithFrame:forCustomInputView:](self, "initWithFrame:forCustomInputView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)isInitializing
{
  return !self->m_initializationDone;
}

- (UIKeyboardImpl)initWithFrame:(CGRect)a3 forCustomInputView:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)UIKeyboardImpl;
  double v5 = -[UIView initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  unsigned int v6 = v5;
  if (v5)
  {
    uint64_t v7 = qword_1EB25A028++;
    v5->_int64_t id = v7;
    if (os_variant_has_internal_diagnostics())
    {
      double v27 = _UIKeyboardExtendedLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        double v28 = "No";
        int64_t id = v6->_id;
        if (v4) {
          double v28 = "Yes";
        }
        *(_DWORD *)buf = 136315394;
        uint64_t v34 = v28;
        __int16 v35 = 2048;
        int64_t v36 = id;
        _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "Impl init forCustomInputView:%s (id=%ld)", buf, 0x16u);
      }
    }
    objc_storeStrong((id *)&qword_1EB259F38, v6);
    _UIKBRT_ResetSystemUptimeOnResume();
    double v8 = [[_UIKeyboardStateManager alloc] initWithPresentationDelegateView:v6 forCustomInputView:v4];
    keyboardStateManager = v6->_keyboardStateManager;
    v6->_keyboardStateManager = v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    m_keyedLayouts = v6->m_keyedLayouts;
    v6->m_keyedLayouts = (NSMutableDictionary *)v10;

    uint64_t v12 = +[UIKeyboardCandidateController sharedInstance];
    m_candidateController = v6->m_candidateController;
    v6->m_candidateController = (UIKeyboardCandidateController *)v12;

    [(UIKeyboardCandidateController *)v6->m_candidateController setDelegate:v6->_keyboardStateManager];
    v6->m_returnKeyState = 0;
    v6->m_animateUpdateBars = 1;
    int v14 = v6->_keyboardStateManager;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __51__UIKeyboardImpl_initWithFrame_forCustomInputView___block_invoke;
    v30[3] = &unk_1E52D9F70;
    uint64_t v15 = v6;
    double v31 = v15;
    [(_UIKeyboardStateManager *)v14 updatePreferencesWithBlock:v30];
    if ([(_UIKeyboardStateManager *)v6->_keyboardStateManager hardwareKeyboardAttached])
    {
      double v16 = (void *)UIApp;
      double v17 = +[UIKeyboardInputModeController sharedInputModeController];
      double v18 = [v17 hardwareInputMode];
      double v19 = [v18 automaticHardwareLayout];
      [v16 setHardwareKeyboardLayoutName:v19];

      [(UIKeyboardImpl *)v15 setCapsLockIfNeeded];
    }
    [(UIKeyboardImpl *)v15 updateLayout];
    objc_storeWeak((id *)&v15->m_geometryDelegate, 0);
    v15->_shouldUpdateLayoutAutomatically = 1;
    if (!+[UIKeyboard usesInputSystemUI])
    {
      uint64_t v20 = +[_UIKBFeedbackGeneratorPartner feedbackGeneratorWithView:v15];
      m_feedbackGenerator = v15->m_feedbackGenerator;
      v15->m_feedbackGenerator = (_UIKBFeedbackGenerating *)v20;
    }
    v15->_hideInlineCandidates = 0;
    double v22 = [[_UIAssertionController alloc] initWithAssertionSubject:v15];
    assertionController = v15->_assertionController;
    v15->_assertionController = v22;

    double v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v15 selector:sel_hardwareKeyboardAvailabilityDidChange_ name:@"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification" object:0];

    v15->m_initializationDone = 1;
    [(UIView *)v15 _setSafeAreaInsetsFrozen:1];
    [(UIKeyboardImpl *)v15 performSelector:sel_delayedInit withObject:0 afterDelay:0.0];
    double v25 = v15;
  }
  return v6;
}

void __51__UIKeyboardImpl_initWithFrame_forCustomInputView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshRivenPreferences];
  id v2 = *(void **)(a1 + 32);
  +[UIKeyboardImpl splitProgress];
  [v2 setInSplitKeyboardMode:v3 > 0.00000011920929];
  if (([*(id *)(a1 + 32) forCustomInputView] & 1) == 0) {
    [*(id *)(a1 + 32) setInputModeFromPreferences];
  }
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v4 = [v5 preferencesActions];
  *(unsigned char *)(*(void *)(a1 + 32) + 723) = [v4 automaticMinimizationEnabled];
}

- (void)delayedInit
{
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel_applicationSuspendedEventsOnly_ name:@"UIApplicationSuspendedEventsOnlyNotification" object:0];
  [v8 addObserver:self selector:sel_applicationResumedEventsOnly_ name:@"UIApplicationResumedEventsOnlyNotification" object:0];
  [v8 addObserver:self selector:sel_applicationResumed_ name:@"UIApplicationResumedNotification" object:0];
  uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
  BOOL v4 = &selRef_updateInputAssistantButtonItems;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    BOOL v4 = &selRef_keyboardDidHide_;
  }
  id v5 = *v4;
  unsigned int v6 = &UIContentSizeCategoryDidChangeNotification;
  if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    unsigned int v6 = &UIKeyboardDidHideNotification;
  }
  [v8 addObserver:self selector:v5 name:*v6 object:0];
  [v8 addObserver:self selector:sel_selectionScrolling_ name:@"UITextSelectionWillScroll" object:0];
  [v8 addObserver:self selector:sel_selectionScrolling_ name:@"UITextSelectionDidScroll" object:0];
  uint64_t v7 = [(UIKeyboardImpl *)self inputDelegateManager];
  [v7 setupResponderChangeListeners];

  [v8 addObserver:self selector:sel__updateKeyboardSuppression_ name:@"UITextInputUpdateKeyboardSuppressionNotification" object:0];
  [v8 addObserver:self selector:sel__updateKeyboardLanguage_ name:@"UITextInputUpdateKeyboardLanguageNotification" object:0];
  [v8 addObserver:self selector:sel_scribbleWillBeginWriting_ name:@"_UIScribbleWillBeginWriting" object:0];
  [v8 addObserver:self selector:sel_beginObservingInputOverlayContainerFrame name:@"UIWindowSceneDidBeginLiveResizeNotification" object:0];
  [v8 addObserver:self selector:sel_endObservingInputOverlayContainerFrame name:@"UIWindowSceneDidEndLiveResizeNotification" object:0];
  [v8 addObserver:self selector:sel__dictationDidRecieveDidBeginDictationNotification_ name:@"UIKeyboardDidBeginDictationNotification" object:0];
  [v8 addObserver:self selector:sel_textSelectionInteractionWillBegin_ name:@"UITextSelectionInteractionWillBegin" object:0];
}

- (void)scribbleWillBeginWriting:(id)a3
{
  id v7 = a3;
  if ([(UIKeyboardImpl *)self isEmojiPopoverBeingPresented]
    || [(UIKeyboardImpl *)self isEmojiPopoverPresented]
    && ![(UIKeyboardImpl *)self isEmojiPopoverBeingDismissed])
  {
    BOOL v4 = [v7 object];
    id v5 = [(UIViewController *)self->_emojiPopoverController view];
    char v6 = [v4 isDescendantOfView:v5];

    if ((v6 & 1) == 0) {
      [(UIKeyboardImpl *)self dismissEmojiPopoverIfNecessaryWithCompletion:0];
    }
  }
}

- (void)keyboardDidHide:(id)a3
{
  id v10 = +[UIPeripheralHost sharedInstance];
  if ([v10 isRotating])
  {
LABEL_4:

    return;
  }
  BOOL v4 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v5 = [v4 keyInputDelegate];
  if (v5)
  {

    goto LABEL_4;
  }
  char v6 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
  id v7 = [v6 candidates];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    keyboardStateManager = self->_keyboardStateManager;
    [(_UIKeyboardStateManager *)keyboardStateManager setReceivedCandidatesInCurrentInputMode:0];
  }
}

- (void)detach
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    id v7 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t id = self->_id;
      *(_DWORD *)buf = 134217984;
      int64_t v11 = id;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "Impl detach (id=%ld)", buf, 0xCu);
    }
  }
  [(_UIKeyboardStateManager *)self->_keyboardStateManager presentationDelegateWillDetach];
  double v3 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v3 cancelPerformSelectorsWithTarget:self];

  BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9[0] = @"_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification";
  v9[1] = @"UIApplicationSuspendedEventsOnlyNotification";
  v9[2] = @"UIApplicationResumedEventsOnlyNotification";
  v9[3] = @"UIApplicationResumedNotification";
  v9[4] = @"UIKeyboardDidHideNotification";
  v9[5] = @"UIContentSizeCategoryDidChangeNotification";
  v9[6] = @"UITextSelectionWillScroll";
  v9[7] = @"UITextSelectionDidScroll";
  v9[8] = @"UITextInputUpdateKeyboardSuppressionNotification";
  v9[9] = @"UITextInputUpdateKeyboardLanguageNotification";
  v9[10] = @"_UIScribbleWillBeginWriting";
  v9[11] = @"UIWindowSceneDidBeginLiveResizeNotification";
  v9[12] = @"UIWindowSceneDidEndLiveResizeNotification";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:13];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  m_observer = self->m_observer;
  if (m_observer)
  {
    CFRunLoopObserverInvalidate(m_observer);
    CFRelease(self->m_observer);
    self->m_observer = 0;
  }
  if (self->m_isRotating) {
    [(UIKeyboardImpl *)self updateLayoutToCurrentInterfaceOrientation];
  }
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (os_variant_has_internal_diagnostics())
  {
    double v16 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int64_t id = self->_id;
      *(_DWORD *)buf = 134217984;
      int64_t v20 = id;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_DEFAULT, "Impl dealloc (id=%ld)", buf, 0xCu);
    }
  }
  self->m_inDealloc = 1;
  objc_storeWeak((id *)&self->m_geometryDelegate, 0);
  [(UIKeyboardImpl *)self detach];
  [(UIView *)self->m_markedTextOverlay removeFromSuperview];
  [(UIView *)self->m_languageIndicator removeFromSuperview];
  [(UIKeyboardImpl *)self removeAutocorrectPromptAndCandidateList];
  [(UIKeyboardImpl *)self removeTextChoicePrompt];
  [(UIKeyboardImpl *)self removeTextChoiceUnderlines];
  [(UIKeyboardImpl *)self dismissAutoFillPopover];
  double v3 = [(UIViewController *)self->_emojiPopoverController presentingViewController];
  [v3 dismissViewControllerAnimated:0 completion:0];

  emojiPopoverController = self->_emojiPopoverController;
  self->_emojiPopoverController = 0;

  id v5 = [(UIViewController *)self->_dictationPopoverController presentingViewController];
  [v5 dismissViewControllerAnimated:0 completion:0];

  dictationPopoverController = self->_dictationPopoverController;
  self->_dictationPopoverController = 0;

  id v7 = [(UIViewController *)self->_pressAndHoldPopoverController presentingViewController];
  [v7 dismissViewControllerAnimated:0 completion:0];

  pressAndHoldPopoverController = self->_pressAndHoldPopoverController;
  self->_pressAndHoldPopoverController = 0;

  self->_emojiPopoverToRestoreAfterRotation = 0;
  isAttachedHardwareKeyboard = self->_isAttachedHardwareKeyboard;
  self->_isAttachedHardwareKeyboard = 0;

  p_overlayContainerObserved = &self->_overlayContainerObserved;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

  if (WeakRetained)
  {
    id v12 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    __int16 v13 = [v12 layer];
    id v14 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    [v13 removeObserver:self forKeyPath:@"bounds" context:v14];

    objc_storeWeak((id *)p_overlayContainerObserved, 0);
  }
  uint64_t v15 = [(UIKeyboardImpl *)self keyboardFeedbackAssistantViewController];

  if (v15) {
    [(UIKeyboardImpl *)self dismissKeyboardFeedbackAssistantViewController];
  }
  v18.receiver = self;
  v18.super_class = (Class)UIKeyboardImpl;
  [(UIView *)&v18 dealloc];
}

- (BOOL)forCustomInputView
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager forCustomInputView];
}

- (void)setForCustomInputView:(BOOL)a3
{
}

- (UIKeyboardTaskQueue)taskQueue
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager taskQueue];
}

- (id)layoutState
{
  if (self->m_layout)
  {
    double v3 = objc_opt_new();
    BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 currentSystemInputMode];
    char v6 = [v5 identifier];
    [v3 setInputMode:v6];

    objc_msgSend(v3, "setHasCandidateKey:", -[UIKeyboardLayout hasCandidateKeys](self->m_layout, "hasCandidateKeys"));
    objc_msgSend(v3, "setHasAccentKey:", -[UIKeyboardLayout hasAccentKey](self->m_layout, "hasAccentKey"));
    objc_msgSend(v3, "setCanMultitap:", -[UIKeyboardLayout canMultitap](self->m_layout, "canMultitap"));
    BOOL v7 = ![(UIKeyboardImpl *)self isMinimized]
      && [(UIKeyboardLayout *)self->m_layout isAlphabeticPlane];
    [v3 setIsAlphabeticPlane:v7];
    objc_msgSend(v3, "setIsKanaPlane:", -[UIKeyboardLayout isKanaPlane](self->m_layout, "isKanaPlane"));
    objc_msgSend(v3, "setDiacriticForwardCompose:", -[UIKeyboardLayout diacriticForwardCompose](self->m_layout, "diacriticForwardCompose"));
    uint64_t v8 = [(UIKeyboardLayout *)self->m_layout layoutTag];
    [v3 setLayoutTag:v8];

    int64_t v9 = [(id)objc_opt_class() keyboardScreen];
    id v10 = +[UIKBScreenTraits traitsWithScreen:v9 orientation:[(UIView *)self _keyboardOrientation]];

    uint64_t v11 = [v10 idiom];
    uint64_t v12 = v11;
    if ((unint64_t)(v11 - 2) >= 3 && v11)
    {
      if (v11 == 1)
      {
        if (+[UIKeyboardImpl isFloating]) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = +[UIKeyboardImpl isSplit] ^ 1;
        }
      }
      else
      {
        uint64_t v12 = -1;
      }
    }
    [v3 setUserInterfaceIdiom:v12];
  }
  else
  {
    double v3 = 0;
  }
  return v3;
}

- (BOOL)_mimicShiftBeingHeld
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _mimicShiftBeingHeld];
}

- (void)set_mimicShiftBeingHeld:(BOOL)a3
{
}

- (BOOL)hasPreviousKeyResponder
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager hasPreviousKeyResponder];
}

- (void)setHasPreviousKeyResponder:(BOOL)a3
{
}

- (UIKeyboardInputModeIndicatorController)inputModeIndicatorController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputModeIndicatorController];
}

- (BOOL)hasNextKeyResponder
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager hasNextKeyResponder];
}

- (void)setHasNextKeyResponder:(BOOL)a3
{
}

- (id)textContentTypeForCurrentInputDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textContentTypeForCurrentInputDelegate];
}

- (BOOL)textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraitsNeedAutofillExcludeOneTimeCodeAndContact];
}

- (BOOL)textInputTraitsNeedAutofill
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraitsNeedAutofill];
}

- (BOOL)needAutofillLogin
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager needAutofillLogin];
}

- (BOOL)textInputTraitsNeedOneTimeCode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraitsNeedOneTimeCode];
}

- (BOOL)textInputTraitsNeedContactAutoFill
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraitsNeedContactAutoFill];
}

- (BOOL)isMemberOfAutofillGroup:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isMemberOfAutofillGroup:a3];
}

- (void)clearAutofillGroup
{
}

- (void)removeASPVisualEffectsIfNecessary:(id)a3
{
}

- (void)handleAutofillCredentialSaveIfNeeded:(id)a3
{
}

- (void)provideAutoFillTypingUpdatesIfNecessary
{
}

- (TIKeyboardLayout)layoutForKeyHitTest
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager layoutForKeyHitTest];
}

- (void)setLayoutForKeyHitTest:(id)a3
{
}

- (id)keyedLayouts
{
  return self->m_keyedLayouts;
}

- (void)clearLayouts
{
  double v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v4 = [v3 keyInputDelegate];
  if (!v4)
  {

    goto LABEL_7;
  }
  id v5 = (void *)v4;
  char v6 = [(UIKeyboardImpl *)self autocorrectionController];
  BOOL v7 = [v6 autocorrection];
  if (v7)
  {
  }
  else
  {
    BOOL v8 = [(UIKeyboardImpl *)self _hasMarkedText];

    if (!v8) {
      goto LABEL_7;
    }
  }
  [(UIKeyboardImpl *)self acceptAutocorrectionWithCompletionHandler:0];
LABEL_7:
  [(UIKeyboardImpl *)self clearInput];
  [(UIKeyboardImpl *)self removeAutocorrectPromptAndCandidateList];
  [(UIView *)self->m_layout removeFromSuperview];
  m_layout = self->m_layout;
  self->m_layout = 0;

  id v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  m_keyedLayouts = self->m_keyedLayouts;
  self->m_keyedLayouts = v10;
}

- (void)deactivateLayout
{
  [(UIKeyboardImpl *)self clearLanguageIndicator];
  m_layout = self->m_layout;
  [(UIKeyboardLayout *)m_layout deactivateActiveKeys];
}

- (void)removeFromSuperview
{
  [(_UIKeyboardStateManager *)self->_keyboardStateManager presentationDelegateWillRemoveFromSuperview];
  [(UIKeyboardImpl *)self clearTimers];
  double v3 = [(UIView *)self superview];

  if (v3)
  {
    [(UIKeyboardImpl *)self deactivateLayout];
    [(UIKeyboardLayout *)self->m_layout resetTouchProcessingForKeyboardChange];
  }
  [(UIKeyboardImpl *)self hideInternationalKeyIntroductionIfNeeded];
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardImpl;
  [(UIView *)&v4 removeFromSuperview];
}

- (void)applicationSuspendedEventsOnly:(id)a3
{
  [(UIKeyboardImpl *)self setCaretBlinks:0];
  if (qword_1EB259F68 != -1) {
    dispatch_once(&qword_1EB259F68, &__block_literal_global_355);
  }
  objc_super v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v5 = [v4 scene];
  char v6 = [v5 _effectiveUISettings];
  uint64_t v7 = [v6 deactivationReasons];

  uint64_t v8 = -262184;
  if (!_MergedGlobals_70) {
    uint64_t v8 = -1;
  }
  if ((v8 & v7) != 0)
  {
    if ([(UIKeyboardImpl *)self usesCandidateSelection]) {
      [(UIKeyboardImpl *)self acceptAutocorrectionWithCompletionHandler:0];
    }
    [(UIKeyboardImpl *)self clearChangeTimeAndCount];
  }
}

void __49__UIKeyboardImpl_applicationSuspendedEventsOnly___block_invoke()
{
  _MergedGlobals_70 = 1;
}

- (void)applicationResumed:(id)a3
{
}

- (void)applicationResumedEventsOnly:(id)a3
{
  [(UIKeyboardImpl *)self applicationResumed:a3];
  if ([(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached])
  {
    objc_super v4 = (void *)UIApp;
    id v5 = +[UIKeyboardInputModeController sharedInputModeController];
    char v6 = [v5 hardwareInputMode];
    uint64_t v7 = [v6 automaticHardwareLayout];
    [v4 setHardwareKeyboardLayoutName:v7];

    [(UIKeyboardImpl *)self setCapsLockIfNeeded];
  }
}

- (void)_forwardScrollEventToUIHost:(SEL)a3 scrollView:(id)a4
{
  id v6 = a4;
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v28.c = v7;
  *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&v27.a = *(_OWORD *)&v28.a;
  *(_OWORD *)&v27.c = v7;
  *(_OWORD *)&v27.tx = *(_OWORD *)&v28.tx;
  uint64_t v8 = [(UIKeyboardImpl *)self contentScrollInitialContentOffset];

  if (v8)
  {
    int64_t v9 = [(UIKeyboardImpl *)self contentScrollInitialContentOffset];
    [v9 CGPointValue];
    double v11 = v10;
    double v13 = v12;

    [v6 contentOffset];
    CGAffineTransformMakeTranslation(&v28, v11 - v14, v13 - v15);
  }
  double v16 = [(UIKeyboardImpl *)self environmentScrollInitialContentOffset];

  if (v16)
  {
    double v17 = [(UIKeyboardImpl *)self environmentScrollInitialContentOffset];
    [v17 CGPointValue];
    double v19 = v18;
    double v21 = v20;

    [v6 contentOffset];
    CGAffineTransformMakeTranslation(&v27, v19 - v22, v21 - v23);
  }
  double v24 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  CGAffineTransform v26 = v28;
  CGAffineTransform v25 = v27;
  [v24 forwardScrollEventToUIHost:a3 contentTransform:&v26 environmentTransform:&v25];
}

- (void)_observeScrollViewDidScroll:(id)a3
{
}

- (void)textWillScroll
{
}

- (void)textDidScroll
{
}

- (BOOL)selectionScrolling
{
  return self->m_scrolling;
}

- (void)updateDefaultsWithResults:(id)a3
{
}

- (void)didCompleteUpdateDefaults
{
  objc_super v4 = +[UIPeripheralHost sharedInstance];
  char v5 = [v4 isOnScreen];
  if ((v5 & 1) == 0)
  {
    id v2 = +[UIPeripheralHost sharedInstance];
    if (([v2 isUndocked] & 1) == 0) {
      goto LABEL_9;
    }
  }
  id v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  if (![v6 keyboardActive])
  {

    if (v5) {
      goto LABEL_10;
    }
LABEL_9:

    goto LABEL_10;
  }
  BOOL v7 = +[UIKeyboard usesInputSystemUI];

  if ((v5 & 1) == 0) {
  if (!v7)
  }
  {
    objc_super v4 = +[UIPeripheralHost sharedInstance];
    [v4 moveToPersistentOffset];
LABEL_10:
  }
  [(id)objc_opt_class() suppressSetPersistentOffset:0];
  [(UIKeyboardImpl *)self updateInputAssistantButtonItems];
}

- (void)defaultsDidChange
{
}

- (BOOL)centerFilled
{
  double v3 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  objc_super v4 = [v3 rtiInputSourceState];

  if (v4)
  {
    char v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    id v6 = [v5 rtiInputSourceState];
    char v7 = [v6 centerFilled];
  }
  else
  {
    BOOL m_rivenCenterFilled = self->m_rivenCenterFilled;
    int64_t v9 = +[UIPeripheralHost sharedInstance];
    char v5 = [v9 loadAwareInputViews];

    if ([v5 supportsSplit]) {
      BOOL v10 = [(UIKeyboardImpl *)self isPredictionViewControllerVisible];
    }
    else {
      BOOL v10 = 1;
    }
    self->BOOL m_rivenCenterFilled = v10;
    if ([v5 isEmpty])
    {
      self->BOOL m_rivenCenterFilled = m_rivenCenterFilled;
    }
    else if (m_rivenCenterFilled != self->m_rivenCenterFilled)
    {
      double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 postNotificationName:@"UIKeyboardRivenVisualStyleDidChange" object:0 userInfo:0];

      if (objc_opt_respondsToSelector()) {
        [(UIKeyboardLayout *)self->m_layout setKeyboardAppearance:-1];
      }
    }
    char v7 = self->m_rivenCenterFilled;
  }

  return v7;
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  id v4 = a3;
  char v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  id v6 = [v5 rtiInputSourceState];

  if (!v6) {
    goto LABEL_7;
  }
  if (![v4 isEqualToString:@"split-left"])
  {
    if ([v4 isEqualToString:@"split-right"])
    {
      [v6 rightSplitFrame];
      goto LABEL_6;
    }
LABEL_7:
    double v15 = [(NSMutableDictionary *)self->m_keyedLayouts objectForKey:objc_opt_class()];
    [v15 frameForKeylayoutName:v4];
    double v11 = v16;
    double v12 = v17;
    double v13 = v18;
    double v14 = v19;

    goto LABEL_8;
  }
  [v6 leftSplitFrame];
LABEL_6:
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
LABEL_8:

  double v20 = v11;
  double v21 = v12;
  double v22 = v13;
  double v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  m_layout = self->m_layout;
  id v5 = a3;
  if (m_layout)
  {
    [(UIKeyboardLayout *)m_layout dragGestureRectInView:v5];
  }
  else
  {
    [(UIView *)self bounds];
    -[UIView convertRect:toView:](self, "convertRect:toView:", v5, v10 + v11 + -80.0, v12 + v13 + -80.0, 80.0, 80.0);
  }
  double v14 = v6;
  double v15 = v7;
  double v16 = v8;
  double v17 = v9;

  double v18 = v14;
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)rivenPreference
{
  return byte_1EB259F24;
}

+ (BOOL)rivenInstalled
{
  return byte_1EB259F1A;
}

+ (BOOL)rivenTranslationPreference
{
  return byte_1EB259F28;
}

+ (BOOL)rivenShouldUndock
{
  return byte_1EB259F20;
}

- (BOOL)rivenSplitLock
{
  id v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v3 = [v2 preferencesActions];
  char v4 = [v3 BOOLForPreferenceKey:*MEMORY[0x1E4FAEF60]];

  return v4;
}

- (void)setRivenSplitLock:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v5 = [v7 preferencesActions];
  double v6 = [(UIKeyboardImpl *)self keyboardState];
  objc_msgSend(v5, "updateKeyboardIsSplit:locked:", objc_msgSend(v6, "splitKeyboardMode"), v3);
}

- (unint64_t)minimumTouchesForTranslation
{
  return 1;
}

- (BOOL)splitTransitionInProgress
{
  if (objc_opt_respondsToSelector()) {
    char v3 = [(UIKeyboardLayout *)self->m_layout pinchDetected];
  }
  else {
    char v3 = 0;
  }
  char v4 = [(UIView *)self _rootInputWindowController];
  char v5 = v3 | [v4 isSplitting];

  return v5;
}

+ (BOOL)supportsSplit
{
  uint64_t v2 = +[UIKeyboardImpl activeInstance];
  if (v2)
  {
    char v3 = (void *)v2;
    LODWORD(v4) = +[UIKeyboardImpl rivenPreference];

    if (v4)
    {
      char v4 = +[UIKeyboardImpl activeInstance];
      char v5 = [v4 textInputTraits];

      uint64_t v6 = [v5 keyboardType];
      LOBYTE(v4) = 0;
      if (v6 != 12 && v6 != 122 && v6 != 127) {
        LOBYTE(v4) = UIKeyboardSupportsSplit();
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

+ (BOOL)supportsFloating
{
  uint64_t v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v3 = [v2 isKeyboardOnEmbeddedScreen];

  uint64_t v4 = qword_1EB259F90++;
  if (v4 < 1)
  {
    uint64_t SafeDeviceIdiom = UIKeyboardGetSafeDeviceIdiom();
    --qword_1EB259F90;
    if ((SafeDeviceIdiom & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      int v9 = v3;
    }
    else {
      int v9 = 0;
    }
    if (v9 != 1) {
      return 0;
    }
  }
  else
  {
    char v5 = +[UIDevice currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    --qword_1EB259F90;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      char v7 = v3;
    }
    else {
      char v7 = 0;
    }
    if ((v7 & 1) == 0) {
      return 0;
    }
  }
  double v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v11 = [v10 preferencesActions];
  int v12 = [v11 BOOLForPreferenceKey:*MEMORY[0x1E4FAE870]];

  if (!v12) {
    return 0;
  }
  double v13 = [(id)qword_1EB259F38 textInputTraits];
  double v14 = v13;
  if (v13) {
    char v15 = [v13 acceptsSplitKeyboard];
  }
  else {
    char v15 = 1;
  }
  if ([v14 keyboardAppearance] == 127
    || [v14 keyboardType] == 12
    || [v14 keyboardType] == 125)
  {
    char v15 = 0;
  }

  return v15;
}

+ (UIEdgeInsets)requestedFloatingInsets
{
  double v2 = *(double *)&qword_1EB259F70;
  double v3 = *(double *)algn_1EB259F78;
  double v4 = *(double *)&qword_1EB259F80;
  double v5 = unk_1EB259F88;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (BOOL)isFloatingForced
{
  double v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 floatingForced];

  return v3;
}

+ (void)performWithoutFloatingLock:(id)a3
{
  char v3 = (void *)qword_1EB259F38;
  double v4 = (void (**)(void))a3;
  uint64_t v5 = [v3 isFloatingLocked];
  [(id)qword_1EB259F38 setLockFloating:0];
  v4[2](v4);

  uint64_t v6 = (void *)qword_1EB259F38;
  [v6 setLockFloating:v5];
}

+ (void)setFloating:(BOOL)a3
{
  BOOL v3 = a3;
  if ([a1 supportsFloating])
  {
    uint64_t v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    int v6 = [v5 keyboardActive];

    if (v6)
    {
      char v7 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v8 = [v7 preferencesActions];
      [v8 updateKeyboardIsFloating:v3];

      int v9 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v10 = [v9 preferencesActions];
      [v10 synchronizePreferences];
    }
    int v11 = byte_1EB259F30;
    byte_1EB259F30 = v3;
    int v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v13 = [v12 preferencesActions];
    [v13 synchronizePreferences];

    if (+[UIKeyboard isKeyboardProcess])
    {
      double v14 = +[UIKeyboardImpl activeInstance];
      char v15 = [v14 remoteTextInputPartner];
      double v16 = [NSNumber numberWithBool:v3];
      [v15 forwardKeyboardOperation:a2 object:v16];
    }
    if (v11 != v3)
    {
      double v17 = +[UIKeyboardImpl activeInstance];
      [v17 acceptHandwritingCandidate];

      double v18 = +[UIKeyboardImpl activeInstance];
      char v19 = [v18 isUsingDictationLayout];

      if ((v19 & 1) == 0)
      {
        double v20 = +[UIKeyboardImpl activeInstance];
        [v20 recomputeActiveInputModesWithExtensions:1 allowNonLinguisticInputModes:1];
      }
      double v21 = +[UIKeyboardImpl activeInstance];
      [v21 updateDictationIgnoreKeyboardDidHideNotification];

      double v22 = +[UIKeyboardImpl activeInstance];
      [v22 notifyInputSourceStateChangeIfNeeded];
    }
    double v23 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v30 = [v23 systemInputAssistantViewController];

    [v30 prepareForFloating:v3];
    double v24 = +[UIKeyboardImpl sharedInstance];
    [v24 updateLayout];

    CGAffineTransform v25 = +[UIKeyboardImpl activeInstance];
    CGAffineTransform v26 = [v25 keyboardStateManager];
    [v26 refreshAutofillModeIfNecessary];

    CGAffineTransform v27 = +[UIKeyboardImpl activeInstance];
    [v27 syncInputManagerToKeyboardState];

    CGAffineTransform v28 = +[UIKeyboardImpl activeInstance];
    double v29 = [v28 keyboardStateManager];
    [v29 refreshSecureCandidatesIfNecessary];
  }
}

+ (void)setFloating:(BOOL)a3 positionedAtDefaultOffsetAnimated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (a3)
  {
    +[UIKeyboardImpl floatingPersistentOffset];
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  objc_msgSend(a1, "setFloating:positionedAtOffset:animated:", v5, v4, v7, v8);
}

+ (void)setFloating:(BOOL)a3 positionedAtOffset:(CGPoint)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  +[UIKeyboardImpl setFloating:a3];
  id v8 = +[UIPeripheralHost sharedInstance];
  objc_msgSend(v8, "setUndockedWithOffset:animated:", v5, x, y);
}

+ (int64_t)floatingIdiom
{
  return 0;
}

+ (double)floatingWidth
{
  if ([a1 floatingIdiom] != 1) {
    return 320.0;
  }
  double v2 = +[UIScreen mainScreen];
  [v2 _pointsPerInch];

  BOOL v3 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v3);
  double v5 = v4;

  return v5;
}

+ (double)floatingHeight
{
  if ([a1 floatingIdiom] != 1) {
    return -1.0;
  }
  double v2 = +[UIScreen mainScreen];
  [v2 _pointsPerInch];

  BOOL v3 = +[UIScreen mainScreen];
  UIRoundToScreenScale(v3);
  double v5 = v4;

  return v5;
}

+ (double)floatingScreenWidthToEmulate
{
  if ([a1 floatingIdiom] != 1) {
    return 320.0;
  }
  double v2 = +[UIScreen mainScreen];
  [v2 _referenceBounds];
  double v4 = v3;

  return v4;
}

+ (double)keyboardWidthForScreen:(id)a3 withOrientation:(int64_t)a4
{
  id v6 = a3;
  if ([a1 isFloating])
  {
    [a1 floatingWidth];
    double v8 = v7;
  }
  else
  {
    [v6 _boundsForInterfaceOrientation:a4];
    double v8 = v9;
  }

  return v8;
}

- (void)beginFloatingTransitionFromPanGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = [(UIKeyboardImpl *)self window];
  if (v5)
  {
    double v9 = self;
  }
  else
  {
    id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v7 = [v6 inputViews];
    double v9 = [v7 inputView];
  }
  double v8 = [(UIView *)v9 _rootInputWindowController];
  [v8 beginFloatingTransitionFromPanGestureRecognizer:v4];
}

- (BOOL)shouldAllowTwoFingerSelectionGestureOnView:(id)a3
{
  id v4 = (UIKeyboardImpl *)a3;
  double v5 = v4;
  if (v4
    && (v4 == self
     || [(UIView *)v4 isDescendantOfView:self]
     || [(UIView *)self isDescendantOfView:v5]))
  {
    BOOL v6 = !+[UIKeyboardImpl isFloating];
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)setInSplitKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(UIKeyboardImpl *)self keyboardState];
  [v5 setSplitKeyboardMode:v3];

  BOOL v6 = +[UIKeyboardImpl isSplit];
  id v7 = [(UIKeyboardLayout *)self->m_layout screenTraits];
  [v7 setIsSplit:v6];
}

- (void)setSplitProgress:(double)a3
{
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    [(UIKeyboardLayout *)m_layout setSplitProgress:a3];
  }
}

+ (double)persistentSplitProgress
{
  if (!byte_1EB259F24) {
    return 0.0;
  }
  double v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v3 = [v2 preferencesActions];
  id v4 = [v3 valueForPreferenceKey:*MEMORY[0x1E4FAEF68]];
  [v4 floatValue];
  double v6 = v5;

  return v6;
}

+ (void)setPersistentSplitProgress:(double)a3
{
  byte_1EB259F10 = a3 > 0.5;
  id v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int v5 = [v4 keyboardActive];

  if (v5)
  {
    double v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v7 = [v6 preferencesActions];
    [v7 updateKeyboardIsSplit:a3 > 0.00000011920929 locked:0];
  }
  double v8 = +[UIKeyboardImpl activeInstance];
  [v8 setInSplitKeyboardMode:a3 > 0.00000011920929];

  id v9 = +[UIKeyboardImpl activeInstance];
  [v9 syncInputManagerToKeyboardState];
}

+ (void)suppressSetPersistentOffset:(BOOL)a3
{
  byte_1EB259F2A = a3;
}

+ (CGPoint)_normalizedScreenPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v5 = +[UIScreen mainScreen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = +[UIKeyboardSceneDelegate interfaceOrientation];
  if ((unint64_t)(v10 - 3) >= 2) {
    double v11 = v9;
  }
  else {
    double v11 = v7;
  }
  if ((unint64_t)(v10 - 3) >= 2) {
    double v12 = v7;
  }
  else {
    double v12 = v9;
  }
  double v13 = x / v12;
  double v14 = y / v11;
  result.double y = v14;
  result.double x = v13;
  return result;
}

+ (CGPoint)_screenPointFromNormalizedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int v5 = +[UIScreen mainScreen];
  [v5 _referenceBounds];
  double v7 = v6;
  double v9 = v8;

  int64_t v10 = +[UIKeyboardSceneDelegate interfaceOrientation];
  if ((unint64_t)(v10 - 3) >= 2) {
    double v11 = v9;
  }
  else {
    double v11 = v7;
  }
  if ((unint64_t)(v10 - 3) >= 2) {
    double v12 = v7;
  }
  else {
    double v12 = v9;
  }
  double v13 = x * v12;
  double v14 = y * v11;
  result.double y = v14;
  result.double x = v13;
  return result;
}

+ (void)setPersistentOffset:(CGPoint)a3
{
  if (!byte_1EB259F2A)
  {
    double y = a3.y;
    double x = a3.x;
    [a1 normalizedPersistentOffset];
    if (v7 != x || v6 != y)
    {
      +[UIKeyboardImpl persistentSplitProgress];
      if (fabs(y) < 6.0 && v9 == 0.0) {
        double y = 0.0;
      }
      double v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      int v12 = [v11 keyboardActive];

      if (v12)
      {
        if (+[UIKeyboardImpl isFloating])
        {
          +[UIKeyboardImpl setFloatingPersistentOffset:](UIKeyboardImpl, "setFloatingPersistentOffset:", x, y);
        }
        else if (byte_1EB259F20)
        {
          objc_msgSend(a1, "_normalizedScreenPoint:", x, y);
          double v14 = v13;
          double v16 = v15;
          double v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
          double v18 = [v17 preferencesActions];
          objc_msgSend(v18, "setKeyboardPosition:", v16, v14);

          char v19 = +[UIKeyboardPreferencesController sharedPreferencesController];
          double v20 = [v19 preferencesActions];
          [v20 synchronizePreferences];
        }
      }
      if (y == 0.0 && ([a1 isSplit] & 1) == 0)
      {
        id v21 = +[UIKeyboardImpl activeInstance];
        [v21 setRivenSplitLock:0];
      }
    }
  }
}

+ (CGPoint)normalizedPersistentOffset
{
  if (!byte_1EB259F28 && !+[UIKeyboardImpl isFloating])
  {
    BOOL v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    char v4 = [v3 remoteKeyboardUndocked];

    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
  }
  if (!+[UIKeyboardImpl isFloating])
  {
    if (byte_1EB259F20)
    {
      [a1 normalizedPersistentOffsetIgnoringState];
      goto LABEL_9;
    }
LABEL_8:
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    goto LABEL_9;
  }
  +[UIKeyboardImpl floatingNormalizedPersistentOffset];
LABEL_9:
  result.double y = v6;
  result.double x = v5;
  return result;
}

+ (CGPoint)normalizedPersistentOffsetIgnoringState
{
  double v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v3 = [v2 preferencesActions];
  [v3 keyboardPosition];
  double v5 = v4;
  double v7 = v6;

  if (v5 <= -0.001) {
    double v8 = v5;
  }
  else {
    double v8 = 0.0;
  }
  double v9 = v7;
  result.double y = v8;
  result.double x = v9;
  return result;
}

+ (CGPoint)persistentOffset
{
  BOOL v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  double v4 = [(id)qword_1EB259F38 delegate];
  if (v4)
  {
  }
  else if ([v3 isFloating])
  {
    [v3 persistentOffset];
    double v6 = v5;
    double v8 = v7;
    goto LABEL_13;
  }
  if (byte_1EB259F28
    || +[UIKeyboardImpl isFloating]
    || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), double v9 = objc_claimAutoreleasedReturnValue(), v10 = [v9 remoteKeyboardUndocked], v9, (v10 & 1) != 0))
  {
    [a1 normalizedPersistentOffset];
    objc_msgSend(a1, "_screenPointFromNormalizedPoint:");
    double v12 = v11;
    double v14 = v13;
    +[UIKeyboardImpl persistentSplitProgress];
    BOOL v16 = v15 == 0.0;
    double v17 = 0.0;
    double v18 = -6.0;
    if (!v16) {
      double v18 = 0.0;
    }
    if (v14 <= v18) {
      double v17 = v14;
    }
    double v6 = round(v12);
    double v8 = round(v17);
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
LABEL_13:

  double v19 = v6;
  double v20 = v8;
  result.double y = v20;
  result.double x = v19;
  return result;
}

+ (CGPoint)defaultUndockedOffsetForFloating:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 30.0;
  }
  double v4 = -70.0;
  result.double y = v4;
  result.double x = v3;
  return result;
}

+ (CGPoint)floatingNormalizedPersistentOffset
{
  double v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v4 = [v3 preferencesActions];
  [v4 floatingKeyboardPosition];
  double v6 = v5;
  double v8 = v7;

  if (v6 == *MEMORY[0x1E4F1DAD8] && v8 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    [a1 defaultUndockedOffsetForFloating:1];
    objc_msgSend(a1, "_normalizedScreenPoint:");
  }
  else
  {
    double v10 = v6;
    double v11 = v8;
  }
  result.double y = v11;
  result.double x = v10;
  return result;
}

+ (CGPoint)floatingPersistentOffset
{
  double v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v4 = [v3 preferencesActions];
  [v4 floatingKeyboardPosition];
  double v6 = v5;
  double v8 = v7;

  objc_msgSend(a1, "_screenPointFromNormalizedPoint:", v6, v8);
  result.double y = v10;
  result.double x = v9;
  return result;
}

+ (void)setFloatingPersistentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  int v7 = [v6 keyboardActive];

  if (v7)
  {
    objc_msgSend(a1, "_normalizedScreenPoint:", x, y);
    double v9 = v8;
    double v11 = v10;
    double v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v13 = [v12 preferencesActions];
    [v13 floatingKeyboardPosition];
    double v15 = v14;
    double v17 = v16;

    if (v15 != v9 || v17 != v11)
    {
      double v19 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v20 = [v19 preferencesActions];
      objc_msgSend(v20, "setFloatingKeyboardPosition:", v9, v11);

      id v22 = +[UIKeyboardPreferencesController sharedPreferencesController];
      id v21 = [v22 preferencesActions];
      [v21 synchronizePreferences];
    }
  }
}

- (BOOL)hideAccessoryViewsDuringSplit
{
  double v3 = +[UIPeripheralHost sharedInstance];
  double v4 = [v3 inputViews];
  char v5 = [v4 supportsSplit];

  if (v5) {
    return 1;
  }
  if (objc_opt_respondsToSelector()) {
    return [(UIKeyboardLayout *)self->m_layout pinchSplitGestureEnabled] ^ 1;
  }
  return 0;
}

- (void)cancelSplitTransition
{
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    [(UIKeyboardLayout *)m_layout showSplitTransitionView:0];
  }
}

- (BOOL)autocorrectionPreference
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager autocorrectionPreference];
}

- (BOOL)keyboardIsKeyPad
{
  double v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  unsigned int v3 = [v2 keyboardType];
  BOOL v5 = v3 <= 0xB && ((1 << v3) & 0x930) != 0 || v3 == 127;

  return v5;
}

- (BOOL)keyboardIsInPencilTextInputMode
{
  unsigned int v3 = [(UIKeyboardImpl *)self delegateAsResponder];
  if ([v3 _suppressSoftwareKeyboard]) {
    BOOL v4 = [(UIKeyboardImpl *)self _textInputSourceForDelegate:v3] == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (int64_t)_textInputSourceForDelegate:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    int64_t v4 = [v3 _textInputSource];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)performReturn
{
}

- (void)performDelete
{
}

- (void)performOperations:(id)a3 withTextInputSource:(int64_t)a4
{
}

- (void)_updateTextInputPencilSource
{
  id v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v2 updateEventSource:3 options:5];
}

- (void)updateTextInputKeyboardSource
{
}

- (void)updateTextInputKeyboardSource:(id)a3
{
  id v10 = a3;
  int64_t v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  BOOL v5 = [v10 objectForKeyedSubscript:@"inputSource"];
  uint64_t v6 = (int)[v5 intValue];
  int v7 = [v10 objectForKeyedSubscript:@"options"];
  objc_msgSend(v4, "updateEventSource:options:", v6, (int)objc_msgSend(v7, "intValue"));

  if (+[UIKeyboard isKeyboardProcess])
  {
    double v8 = +[UIKeyboardImpl activeInstance];
    double v9 = [v8 remoteTextInputPartner];
    [v9 forwardKeyboardOperation:a2 object:v10];
  }
}

- (unint64_t)autocorrectionPreferenceForTraits
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager autocorrectionPreferenceForTraits];
}

- (BOOL)_shouldLoadPredictionsBasedOnCurrentTraits
{
  if ([(UIKeyboardImpl *)self predictionFromPreference])
  {
    BOOL v5 = [(UIKeyboardImpl *)self prewarmsPredictiveCandidates];
    if (!v5)
    {
      id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      if ([v2 disablePrediction])
      {
LABEL_6:
        LOBYTE(v6) = 0;
LABEL_12:

        return v6;
      }
      id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      if ([v3 hidePrediction])
      {

        goto LABEL_6;
      }
    }
    int v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    uint64_t v8 = [v7 autocorrectionType];

    if (!v5)
    {
    }
    if (v8 != 1)
    {
      id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      int v6 = [v2 isSecureTextEntry] ^ 1;
      goto LABEL_12;
    }
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (BOOL)canShowPredictionBar
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canShowPredictionBar];
}

- (id)keyboardViewController
{
  id v2 = [(UIView *)self superview];
  id v3 = [v2 superview];
  int64_t v4 = -[UIView __viewDelegate](v3);

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isPredictionViewControllerVisible
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int64_t v4 = [v3 systemInputAssistantViewController];

  id v5 = [v4 predictionViewController];
  uint64_t v6 = [(UIKeyboardImpl *)self inputDelegateManager];
  int v7 = [(id)v6 keyInputDelegate];
  char v8 = [v5 isVisibleForInputDelegate:v7 inputViews:0];

  LOBYTE(v6) = [v4 isEmojiSearchResultsVisible];
  double v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v10 = [v9 visualModeManager];
  char v11 = [v10 useVisualModeWindowed];

  return v8 & ((v6 | v11) ^ 1);
}

- (BOOL)disableInputBars
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  if ([v3 disableInputBars])
  {
    int64_t v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    BOOL v5 = ([v4 isDevicePasscodeEntry] & 1) != 0 || -[UIKeyboardImpl isMinimized](self, "isMinimized");
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)candidateSelectionPredictionForTraits
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateSelectionPredictionForTraits];
}

- (BOOL)smartInsertDeleteIsEnabled
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager smartInsertDeleteIsEnabled];
}

- (BOOL)liveConversionEnabled
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager liveConversionEnabled];
}

- (BOOL)delayedCandidateList
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager delayedCandidateList];
}

- (BOOL)checkSpellingPreferenceForTraits
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager checkSpellingPreferenceForTraits];
}

- (id)smartPunctuationController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager smartPunctuationController];
}

- (id)UILanguagePreference
{
  id v2 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  if ([v2 count])
  {
    id v3 = [v2 objectAtIndex:0];
  }
  else
  {
    id v3 = @"intl";
  }

  return v3;
}

- (BOOL)keyboardsExpandedPreference
{
  id v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v3 = [v2 preferencesActions];
  char v4 = [v3 BOOLForPreferenceKey:*MEMORY[0x1E4FAE518]];

  return v4;
}

- (BOOL)automaticMinimizationEnabled
{
  if (self->m_automaticMinimizationEnabled) {
    return 1;
  }
  else {
    return !+[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate];
  }
}

- (void)setAutomaticMinimizationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIKeyboardImpl *)self automaticMinimizationEnabled] != a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
    if (!WeakRetained
      || (uint64_t v6 = WeakRetained,
          id v7 = objc_loadWeakRetained((id *)&self->m_geometryDelegate),
          int v8 = [v7 shouldSaveMinimizationState],
          v7,
          v6,
          v8))
    {
      self->m_automaticMinimizationEnabled = v3;
      double v9 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      char v10 = [v9 handlingRemoteEvent];

      if ((v10 & 1) == 0)
      {
        id v12 = +[UIKeyboardPreferencesController sharedPreferencesController];
        char v11 = [v12 preferencesActions];
        [v11 setAutomaticMinimizationEnabled:v3];
      }
    }
  }
}

- (BOOL)suppressUpdateLayout
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager suppressUpdateLayout];
}

- (void)setSuppressUpdateLayout:(BOOL)a3
{
}

- (BOOL)suppressUpdateShiftState
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager suppressUpdateShiftState];
}

- (void)setSuppressUpdateShiftState:(BOOL)a3
{
}

- (BOOL)suppressUpdateAssistantView
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager suppressUpdateAssistantView];
}

- (void)setSuppressUpdateAssistantView:(BOOL)a3
{
}

- (BOOL)suppressUpdateInputMode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager suppressUpdateInputMode];
}

- (void)setSuppressUpdateInputMode:(BOOL)a3
{
}

- (BOOL)isCallingTextChangedDuringInputModeSwitch
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isCallingTextChangedDuringInputModeSwitch];
}

- (void)setIsCallingTextChangedDuringInputModeSwitch:(BOOL)a3
{
}

- (NSString)activeDictationLanguage
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager activeDictationLanguage];
}

- (void)setActiveDictationLanguage:(id)a3
{
}

- (_UIStringAndPositionPair)lastMatchedSupplementalCandidate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager lastMatchedSupplementalCandidate];
}

- (void)setLastMatchedSupplementalCandidate:(id)a3
{
}

- (_UIStringAndPositionPair)pendingSupplementalCandidateToInsert
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager pendingSupplementalCandidateToInsert];
}

- (void)setPendingSupplementalCandidateToInsert:(id)a3
{
}

- (unint64_t)lastChooseSupplementalItemToInsertCallbackIdentifier
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager lastChooseSupplementalItemToInsertCallbackIdentifier];
}

- (void)setLastChooseSupplementalItemToInsertCallbackIdentifier:(unint64_t)a3
{
}

- (id)arrowKeyHistory
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager arrowKeyHistory];
}

- (void)setArrowKeyHistory:(id)a3
{
}

- (BOOL)performingRemoteTextOperations
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager performingRemoteTextOperations];
}

- (void)setPerformingRemoteTextOperations:(BOOL)a3
{
}

- (BOOL)floatingForced
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager floatingForced];
}

- (void)saveInputModesPreference:(id)a3
{
  id v3 = a3;
  id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v4 = [v5 preferencesActions];
  [v4 saveInputModes:v3];
}

- (id)inputModePreference
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [v2 activeInputModeIdentifiers];

  return v3;
}

- (id)inputModeLastUsedPreference
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v3 = [v2 currentInputModeInPreference];
  char v4 = [v3 identifier];

  return v4;
}

- (BOOL)updatingPreferences
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager updatingPreferences];
}

- (void)setShouldUpdateCacheOnInputModesChange:(BOOL)a3
{
}

- (void)setInputMode:(id)a3
{
}

- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4
{
}

- (void)setInputMode:(id)a3 userInitiated:(BOOL)a4 updateIndicator:(BOOL)a5 executionContext:(id)a6
{
}

- (void)setKeyboardInputMode:(id)a3 userInitiated:(BOOL)a4
{
}

- (void)postInputViewControllerShouldUpdateNotification:(id)a3
{
  id v10 = a3;
  char v4 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v5 = [v4 keyInputDelegate];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    if (v10) {
      [v6 setObject:v10 forKey:@"UICompatibilityInputViewControllerInputModeKey"];
    }
    id v7 = [(id)objc_opt_class() keyboardWindow];
    int v8 = [v7 screen];

    if (v8) {
      [v6 setObject:v8 forKey:@"UICompatibilityInputViewControllerScreenKey"];
    }
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"UICompatibilityInputViewControllerShouldUpdateNotification" object:0 userInfo:v6];
  }
}

- (void)reloadCurrentInputMode
{
}

- (void)updateForHandBiasChange
{
  if ([(UIKeyboardImpl *)self showsCandidateBar])
  {
    id v3 = [(UIKeyboardImpl *)self candidateController];
    [v3 updateStates];
  }
}

- (void)reinitializeAfterInputModeSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIKeyboardImpl *)self isMinimized]
    && ![(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached])
  {
    id v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    if ([v5 isSecureTextEntry])
    {
    }
    else
    {
      BOOL v6 = [(UIKeyboardImpl *)self isPredictionViewControllerVisible];

      if (!v6)
      {
        self->m_updateLayoutOnShowKeyboard = 1;
        if (!v3) {
          return;
        }
        goto LABEL_9;
      }
    }
  }
  if (byte_1EB259F1A) {
    [(UIKeyboardImpl *)self refreshRivenPreferences];
  }
  [(UIKeyboardImpl *)self updateLayout];
  [(UIKeyboardImpl *)self callLayoutUpdateLocalizedKeys];
  [(UIKeyboardImpl *)self updateShowCandidateBar];
  if (v3)
  {
LABEL_9:
    [(UIKeyboardImpl *)self updateInputModeIndicatorOnSingleKeyOnly:0];
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  emojiPopoverController = self->_emojiPopoverController;
  id v5 = [a3 presentedViewController];

  if (emojiPopoverController != v5) {
    return 1;
  }
  BOOL v6 = [(UIKeyboardEmojiPopoverController *)self->_emojiPopoverController layout];
  int v7 = [v6 hasActiveKeys];

  if (!v7
    || +[UIKeyboard isRemoteEmojiCollectionViewEnabled])
  {
    return 1;
  }
  double v9 = (void *)MEMORY[0x1E4FBA8A8];
  id v10 = [(UIKeyboardEmojiPopoverController *)self->_emojiPopoverController layout];
  [v9 cancelPreviousPerformRequestsWithTarget:v10 selector:sel_deactivateActiveKeys object:0];

  char v11 = [(UIKeyboardEmojiPopoverController *)self->_emojiPopoverController layout];
  [v11 performSelector:sel_deactivateActiveKeys withObject:0 afterDelay:0.0];

  return 0;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v9 = a3;
  char v4 = [v9 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  BOOL v6 = v9;
  if (isKindOfClass)
  {
    int v7 = [v9 presentedViewController];
    if (self->_dictationPopoverController == v7)
    {
      int v8 = +[UIDictationController activeInstance];
      [v8 stopDictation];
    }
    [(UIKeyboardImpl *)self cleanupKeyboardPopover:v7];

    BOOL v6 = v9;
  }
}

- (BOOL)isEmojiPopoverBeingPresented
{
  return [(UIViewController *)self->_emojiPopoverController isBeingPresented];
}

- (BOOL)isEmojiPopoverBeingDismissed
{
  return [(UIViewController *)self->_emojiPopoverController isBeingDismissed];
}

- (BOOL)isEmojiPopoverPresented
{
  return [(UIKeyboardPopoverController *)self->_emojiPopoverController isPresented];
}

- (BOOL)isPressAndHoldPopoverPresented
{
  return [(UIKeyboardPopoverController *)self->_pressAndHoldPopoverController isPresented];
}

- (BOOL)isEmojiPopoverVisibleOrDismissing
{
  id v2 = [(UIViewController *)self->_emojiPopoverController presentingViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)canPresentEmojiPopover
{
  if (((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
     || [(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardByOneness])
    && [(UIKeyboardImpl *)self isMinimized])
  {
    BOOL v3 = [(UIKeyboardImpl *)self inputDelegate];
    if (v3 && UIKeyboardIsEmojiInputModeActive() && (_UIApplicationIsFirstPartyStickers() & 1) == 0) {
      int v4 = _UIApplicationIsEmojiPoster() ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)canPresentOrDismissEmojiPopover
{
  BOOL v3 = [(UIKeyboardImpl *)self isMinimized];
  if (v3)
  {
    BOOL v3 = [(UIKeyboardImpl *)self isCurrentEditResponderInEditingMode];
    if (v3)
    {
      if (UIKeyboardIsEmojiInputModeActive())
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        LOBYTE(v3) = [(UIKeyboardImpl *)self isEmojiPopoverPresented];
      }
    }
  }
  return v3;
}

- (void)presentEmojiPopoverViaTrigger:(id)a3 completion:(id)a4
{
  id v6 = a3;
  int v7 = (void (**)(id, uint64_t))a4;
  if ([(UIKeyboardImpl *)self isEmojiPopoverPresented])
  {
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else if ([(UIKeyboardImpl *)self canPresentEmojiPopover])
  {
    [(UIKeyboardImpl *)self dismissDictationPopoverAndCancelDictation];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __59__UIKeyboardImpl_presentEmojiPopoverViaTrigger_completion___block_invoke;
    v18[3] = &unk_1E52DA040;
    double v19 = v7;
    [(UIKeyboardImpl *)self presentKeyboardPopoverWithType:0 keyString:0 completion:v18];
    int v8 = [(UIKeyboardImpl *)self inputDelegate];
    if (v8)
    {
      id v9 = [(UIKeyboardImpl *)self inputDelegateManager];
      id v10 = [v9 selectedTextRange];
      char v11 = [v10 start];

      id v12 = [v8 tokenizer];
      double v13 = [v12 positionFromPosition:v11 toBoundary:0 inDirection:1];

      if (v13)
      {
        double v14 = [v8 textRangeFromPosition:v13 toPosition:v11];
        double v15 = [(UIKeyboardImpl *)self inputDelegateManager];
        double v16 = [v15 textInRange:v14];

        uint64_t v17 = [v16 _containsEmoji];
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
    +[UIKBAnalyticsDispatcher emojiPopoverSummoned:v6 appendsEmoji:v17];
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }
}

uint64_t __59__UIKeyboardImpl_presentEmojiPopoverViaTrigger_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)handleAutoFillContactPopoverCommand
{
}

- (void)handleAutoFillCreditCardPopoverCommand
{
}

- (void)handleAutoFillPasswordPopoverCommand
{
  [(_UIKeyboardStateManager *)self->_keyboardStateManager setEverPresentedPasswordAutofillPanel:1];
  [(UIKeyboardImpl *)self _handleAutoFillPopoverCommandWithType:6 action:sel_handleAutoFillPasswordPopoverCommand];
}

- (BOOL)_everPresentedPasswordAutofillPanel
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager everPresentedPasswordAutofillPanel];
}

- (void)handleAutoFillContactDetected
{
}

- (void)handleAutoFillCreditCardDetected
{
}

- (void)handleAutoFillPasswordDetected
{
}

- (void)_handleAutoFillPopoverCommandWithType:(int)a3 action:(SEL)a4
{
  uint64_t v5 = *(void *)&a3;
  if ((a3 - 3) >= 7)
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"UIKeyboardImpl.m", 3074, @"Invalid parameter not satisfying: %@", @"isAutoFillKeyboardPopoverType(type)" object file lineNumber description];
  }
  if (+[UIKeyboard usesInputSystemUI]
    || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI])
  {
    int v7 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [v7 assertNeedsAutofillUI];

    id v19 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v19 forwardInputDestinationEventToUIHost:a4];
  }
  else if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone])
  {
    int v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v9 = [v8 localAuthenticationObserver];

    if (([v9 localAuthenticationPresentedOrBeingRecoveredFrom] & 1) == 0)
    {
      objc_initWeak(&location, self);
      if (getAFUIPanelClass())
      {
        if (!self->_autoFillPanel)
        {
          id v10 = (AFUIPanel *)objc_alloc_init((Class)getAFUIPanelClass());
          autoFillPanel = self->_autoFillPanel;
          self->_autoFillPanel = v10;
        }
        if (+[UIKeyboard inputUIOOP])
        {
          id v12 = [(UIKeyboardImpl *)self inputSystemSourceSession];
          double v13 = [v12 documentTraits];
          double v14 = (void *)[v13 copy];
        }
        else
        {
          double v14 = [MEMORY[0x1E4F95EB0] currentRTIDocumentTraitsForAutoFillPanel];
        }
        double v15 = [(_UIKeyboardStateManager *)self->_keyboardStateManager _rtiDocumentStateForAutoFillPopover];
        objc_msgSend(v14, "setAutofillMode:", -[UIKeyboardImpl _autoFillModeForPopoverType:](self, "_autoFillModeForPopoverType:", v5));
        objc_msgSend(v14, "setExplicitAutoFillMode:", -[UIKeyboardImpl _isAutoFillPopoverTypeExplicit:](self, "_isAutoFillPopoverTypeExplicit:", v5));
        double v16 = self->_autoFillPanel;
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __63__UIKeyboardImpl__handleAutoFillPopoverCommandWithType_action___block_invoke;
        v20[3] = &unk_1E52FC650;
        objc_copyWeak(&v21, &location);
        [(AFUIPanel *)v16 displayForDocumentTraits:v14 documentState:v15 textOperationsHandler:v20];
        objc_destroyWeak(&v21);
      }
      objc_destroyWeak(&location);
    }
  }
}

void __63__UIKeyboardImpl__handleAutoFillPopoverCommandWithType_action___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  int v4 = [WeakRetained keyboardStateManager];
  [v4 _performTextOperationsForAutoFill:v3];

  [WeakRetained dismissAutoFillPopover];
}

- (int64_t)_autoFillModeForPopoverType:(int)a3
{
  if ((a3 - 4) > 5) {
    return 0;
  }
  else {
    return qword_186B9AAA8[a3 - 4];
  }
}

- (BOOL)_isAutoFillPopoverTypeExplicit:(int)a3
{
  return (a3 - 3) < 4;
}

- (void)displayAutoFillPopoverIfAutoFillModeDetected
{
  if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone]
    && !+[UIKeyboard isAlwaysBlockedAutoFillPanelClient]
    && +[UIKeyboard isAutoFillPanelUIEnabled]
    && (+[UIKeyboard isAutoFillPanelInAppsEnabled]
     || +[UIKeyboard isAlwaysAllowedAutoFillPanelClient])
    && (+[UIKeyboard isKeyboardProcess]
     || +[UIKeyboard usesInputSystemUIForAutoFillOnly]))
  {
    if (+[UIKeyboard inputUIOOP])
    {
      id v3 = [(UIKeyboardImpl *)self inputSystemSourceSession];
      int v4 = [v3 documentTraits];
      uint64_t v5 = [v4 autofillMode];
    }
    else
    {
      uint64_t v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager cachedAutofillMode];
    }
    switch(v5)
    {
      case 1:
      case 8:
        [(UIKeyboardImpl *)self handleAutoFillPasswordDetected];
        break;
      case 5:
      case 6:
      case 7:
        [(UIKeyboardImpl *)self handleAutoFillContactDetected];
        break;
      case 9:
        [(UIKeyboardImpl *)self handleAutoFillCreditCardDetected];
        break;
      default:
        return;
    }
  }
}

- (void)cleanupKeyboardPopover:(id)a3
{
  double v15 = (UIKeyboardEmojiPopoverController *)a3;
  int v4 = [(UIKeyboardImpl *)self inputDelegate];
  uint64_t v5 = [v4 textInputView];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 keyboardSceneDelegate];
    [v7 destroyKeyboardWindowIfNecessary];
  }
  if ((UIKeyboardEmojiPopoverController *)self->_dictationPopoverController == v15)
  {
    self->_dictationPopoverController = 0;

    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->m_editMenuFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->m_editMenuFrame.size = v10;
    if (![(UIKeyboardImpl *)self isDictationMenuPresented])
    {
      if (+[UIDictationController isRunning])
      {
        char v11 = +[UIDictationController sharedInstance];
        char v12 = [v11 isDictationPaused];

        if ((v12 & 1) == 0)
        {
          double v13 = +[UIDictationController sharedInstance];
          [v13 stopDictation];
        }
      }
    }
    double v14 = +[UIDictationView activeInstance];
    [v14 returnToKeyboard];
  }
  else if ((UIKeyboardEmojiPopoverController *)self->_pressAndHoldPopoverController == v15)
  {
    self->_pressAndHoldPopoverController = 0;
  }
  else if (self->_emojiPopoverController == v15)
  {
    self->_emojiPopoverController = 0;

    int v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    uint64_t v9 = [v8 keyboardType];

    if (v9 == 124)
    {
      [v4 resignFirstResponder];
      goto LABEL_18;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(UIKeyboardLayout *)self->m_layout reloadCurrentKeyplane];
    }
    [(UIKeyboardImpl *)self dismissDictationPopoverAndCancelDictation];
    [(UIKeyboardImpl *)self dismissPressAndHoldPopover];
    [(UIKeyboardImpl *)self dismissInputModeIndicator];
  }
  [(UIKeyboardImpl *)self _requestInputManagerSync];
LABEL_18:
}

- (void)representDictationMenu
{
  [(UIDelayedAction *)self->m_dictationMenuAction cancel];
  m_dictationMenuAction = self->m_dictationMenuAction;
  self->m_dictationMenuAction = 0;

  [(UIKeyboardImpl *)self touchDictationMenuTimer:0];
  int v4 = [(UIKeyboardImpl *)self candidateController];
  id v7 = [v4 loadInlineCandidateView];

  if ((!v7 || [v7 isHidden]) && !self->m_autocorrectPrompt)
  {
    uint64_t v5 = [(UIKeyboardImpl *)self inlineTextCompletionController];
    char v6 = [v5 hasPrompt];

    if ((v6 & 1) == 0) {
      [(UIKeyboardImpl *)self _presentDictationMenuIfAllowed];
    }
  }
}

- (void)_presentDictationMenuIfAllowed
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v3 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v5 = [v3 inputSystemSourceSession];

    if (v5)
    {
      int v4 = [v5 textOperations];
      [v4 setEditingActionSelector:sel__presentDictationMenuIfAllowed];
      [v5 flushOperations];
    }
  }
  else if ([(UIKeyboardImpl *)self canPresentDictationMenuWithAnimationStyle:2])
  {
    [(UIKeyboardImpl *)self presentDictationMenuWithAnimationStyle:2];
  }
}

- (void)clearDictationMenuTimer
{
}

- (void)_clearDictationMenuTimer:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIDelayedAction *)self->m_dictationMenuAction cancel];
  m_dictationMenuAction = self->m_dictationMenuAction;
  self->m_dictationMenuAction = 0;

  if (v3)
  {
    char v6 = [(UIKeyboardImpl *)self _editMenuAssistant];
    [v6 hideSelectionCommands];
  }
  if (self->m_presentingKeyboardMenuType != 2)
  {
    [(UIKeyboardImpl *)self dismissDictationMenu];
  }
}

- (void)touchDictationMenuTimer
{
}

- (void)touchDictationMenuTimer:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[UIKeyboard inputUIOOP]
    || +[UIKeyboard isKeyboardProcess])
  {
    if (v3) {
      [(UIKeyboardImpl *)self dismissDictationMenu];
    }
    if (+[UIDictationController isRunning])
    {
      m_dictationMenuAction = self->m_dictationMenuAction;
      if (m_dictationMenuAction)
      {
        [(UIDelayedAction *)m_dictationMenuAction touch];
      }
      else
      {
        char v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
        id v7 = [v6 preferencesActions];
        int v8 = [v7 valueForPreferenceKey:@"DictationMenuReturnPauseInterval"];
        [v8 floatValue];
        double v10 = v9;

        char v11 = [[UIDelayedAction alloc] initWithTarget:self action:sel_representDictationMenu userInfo:0 delay:v10];
        char v12 = self->m_dictationMenuAction;
        self->m_dictationMenuAction = v11;
      }
    }
  }
}

- (void)showDictationMenuIfNeeded
{
  if (+[UIDictationController isListening])
  {
    [(UIKeyboardImpl *)self touchDictationMenuTimer];
  }
}

- (void)hideDictationMenuIfNeeded:(BOOL)a3
{
  if (!+[UIKeyboard isRedesignedTextCursorEnabled])
  {
    if (+[UIDictationController isRunning])
    {
      [(UIKeyboardImpl *)self clearDictationMenuTimer];
    }
    else if (!a3 && self->m_presentingKeyboardMenuType == 2)
    {
      [(UIKeyboardImpl *)self dismissDictationMenu];
    }
  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v5 = [(UIKeyboardImpl *)self keyboardMenuElements];
  char v6 = +[UIMenu menuWithChildren:v5];

  return v6;
}

- (id)stopDictationMenuElementsForTextInputView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardImpl *)self inputDelegate];
  id v6 = [v5 textInputView];

  if (v6 == v4)
  {
    id v7 = [(UIKeyboardImpl *)self stopDictationMenuElementsShowingTitle:1];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v7;
}

- (id)stopDictationMenuElementsShowingTitle:(BOOL)a3
{
  BOOL v3 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning])
  {
    if (v3)
    {
      _UINSLocalizedStringWithDefaultValue(@"Stop", @"Stop");
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = &stru_1ED0E84C0;
    }
    id v6 = _UIImageWithName(@"mic_badge_xmark");
    id v7 = +[UIAction actionWithTitle:v4 image:v6 identifier:0 handler:&__block_literal_global_263_0];

    [v7 setAccessibilityIdentifier:@"stopDictationMenuElementIdentifier"];
    [v7 setAccessibilityLabel:@"stopDictationMenuElement"];
    [v7 _setPreferredDisplayMode:1];
    if (+[UIDictationUtilities shouldAddDeleteMenuElement])
    {
      int v8 = _UIImageWithName(@"delete_landscape");
      float v9 = +[UIAction actionWithTitle:&stru_1ED0E84C0 image:v8 identifier:0 handler:&__block_literal_global_275];

      [v9 setAccessibilityIdentifier:@"deleteSelectedTextMenuElementIdentifier"];
      [v9 setAccessibilityLabel:@"deleteSelectedTextMenuElement"];
      v12[0] = v7;
      v12[1] = v9;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    }
    else
    {
      char v11 = v7;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __56__UIKeyboardImpl_stopDictationMenuElementsShowingTitle___block_invoke()
{
  v0 = +[UIDictationController sharedInstance];
  [v0 setReasonType:29];

  id v1 = +[UIDictationController activeInstance];
  [v1 stopDictation];
}

void __56__UIKeyboardImpl_stopDictationMenuElementsShowingTitle___block_invoke_2()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 deleteBackward];
}

- (void)updateDictationIgnoreKeyboardDidHideNotification
{
  if (+[UIDictationController isRunning])
  {
    id v2 = +[UIDictationController activeInstance];
    [v2 setIgnoreKeyboardDidHideNotification:1];
  }
}

- (BOOL)isDictationLanguageMenuPresented
{
  return self->m_keyboardMenuType == 2;
}

- (void)willDismissEditMenu
{
  id v4 = +[UIDictationController activeInstance];
  if ([v4 shouldSuppressSoftwareKeyboard]
    && [(UIKeyboardImpl *)self isDictationMenuPresented])
  {
    int m_presentingKeyboardMenuType = self->m_presentingKeyboardMenuType;

    if (m_presentingKeyboardMenuType != 2) {
      return;
    }
    id v4 = +[UIDictationController activeInstance];
    [v4 resignFirstResponderWhenIdleIfNeeded];
  }
}

- (id)keyboardMenuElements
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int m_keyboardMenuType = self->m_keyboardMenuType;
  if (m_keyboardMenuType == 4)
  {
    if (+[UIDictationController isRunning])
    {
      char v11 = _UINSLocalizedStringWithDefaultValue(@"Undo", @"Undo");
      char v12 = +[UIImage systemImageNamed:@"arrow.uturn.backward"];
      double v13 = +[UIAction actionWithTitle:v11 image:v12 identifier:0 handler:&__block_literal_global_296_0];

      [v13 _setPreferredDisplayMode:1];
      objc_super v32 = v13;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];

      goto LABEL_29;
    }
    goto LABEL_9;
  }
  if (m_keyboardMenuType == 2)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v14 = +[UIKeyboardInputModeController sharedInputModeController];
    double v15 = [v14 enabledDictationLanguages];

    id obj = v15;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(obj);
          }
          double v20 = UIKeyboardLocalizedDictationDisplayName(*(void **)(*((void *)&v27 + 1) + 8 * i));
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_2;
          v26[3] = &unk_1E52DB038;
          v26[4] = self;
          id v21 = +[UIAction actionWithTitle:v20 image:0 identifier:0 handler:v26];

          if (v4)
          {
            uint64_t v22 = [v4 arrayByAddingObject:v21];

            id v4 = (void *)v22;
          }
          else
          {
            double v33 = v21;
            id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v17);
    }
    else
    {
      id v4 = (void *)MEMORY[0x1E4F1CBF0];
    }

    if ([v4 count])
    {
      int v23 = self->m_keyboardMenuType;
      goto LABEL_28;
    }
LABEL_27:
    int v23 = 0;
    goto LABEL_28;
  }
  if (m_keyboardMenuType != 1)
  {
LABEL_9:
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_29;
  }
  if (+[UIDictationController isRunning])
  {
    id v4 = [(UIKeyboardImpl *)self stopDictationMenuElementsShowingTitle:0];
    id v5 = [(UIKeyboardImpl *)self activeDictationLanguage];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      id v7 = [(UIKeyboardImpl *)self activeDictationLanguage];
      int v8 = UIKeyboardLocalizedDictationDisplayName(v7);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke;
      v31[3] = &unk_1E52DB038;
      v31[4] = self;
      float v9 = +[UIAction actionWithTitle:v8 image:0 identifier:0 handler:v31];

      uint64_t v10 = [v4 arrayByAddingObject:v9];

      id v4 = (void *)v10;
    }
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if (![v4 count]) {
    goto LABEL_27;
  }
  int v23 = self->m_keyboardMenuType;
LABEL_28:
  self->int m_presentingKeyboardMenuType = v23;
LABEL_29:
  return v4;
}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(a1 + 32) + 656) = 2;
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_initWeak(&location, v4);

  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  double v20 = __Block_byref_object_copy__133;
  id v21 = __Block_byref_object_dispose__133;
  id v22 = 0;
  id v5 = objc_loadWeakRetained(&location);
  uint64_t v6 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  char v12 = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_283;
  double v13 = &unk_1E52FC678;
  uint64_t v14 = *(void *)(a1 + 32);
  objc_copyWeak(&v16, &location);
  double v15 = &v17;
  uint64_t v7 = [v5 addObserverForName:@"UIDictationControllerDictationDidFinish" object:0 queue:v6 usingBlock:&v10];
  int v8 = (void *)v18[5];
  v18[5] = v7;

  float v9 = +[UIDictationController activeInstance];
  [v9 cancelDictation];

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_283(uint64_t a1)
{
  [*(id *)(a1 + 32) presentKeyboardMenu:2];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [v4 enabledDictationLanguages];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_3;
  v20[3] = &unk_1E52F33B0;
  id v6 = v3;
  id v21 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v20];

  int v8 = [*(id *)(a1 + 32) _editMenuAssistant];
  [v8 hideSelectionCommands];

  [*(id *)(a1 + 32) dismissDictationMenu];
  float v9 = +[UIDictationController sharedInstance];
  [v9 setReasonType:28];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v16 = +[UIDictationController sharedInstance];
    uint64_t v17 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v18 = [v17 enabledDictationLanguages];
    uint64_t v19 = [v18 objectAtIndexedSubscript:v7];
    [v16 switchToDictationLanguage:v19];

    goto LABEL_8;
  }
  uint64_t v10 = +[UIDictationController activeInstance];
  [v10 startDictation];

  if (os_variant_has_internal_diagnostics())
  {
    char v12 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      goto LABEL_6;
    }
    double v13 = [v6 title];
    uint64_t v14 = +[UIKeyboardInputModeController sharedInputModeController];
    double v15 = [v14 enabledDictationLanguages];
    *(_DWORD *)buf = 138412546;
    int v23 = v13;
    __int16 v24 = 2112;
    CGAffineTransform v25 = v15;
    _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Something goes wrong, could not find dictation lauguage (%@) from enabledDictationLanguages: %@", buf, 0x16u);
LABEL_5:

LABEL_6:
    goto LABEL_8;
  }
  uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &kbLineSeparator_block_invoke___s_category) + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    char v12 = v11;
    double v13 = [v6 title];
    uint64_t v14 = +[UIKeyboardInputModeController sharedInputModeController];
    double v15 = [v14 enabledDictationLanguages];
    *(_DWORD *)buf = 138412546;
    int v23 = v13;
    __int16 v24 = 2112;
    CGAffineTransform v25 = v15;
    _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Something goes wrong, could not find dictation lauguage (%@) from enabledDictationLanguages: %@", buf, 0x16u);
    goto LABEL_5;
  }
LABEL_8:
}

uint64_t __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 title];
  id v5 = UIKeyboardLocalizedDictationDisplayName(v3);

  uint64_t v6 = [v4 isEqualToString:v5];
  return v6;
}

void __38__UIKeyboardImpl_keyboardMenuElements__block_invoke_294()
{
  id v0 = +[UIDictationController activeInstance];
  [v0 _performDictationUndo];
}

- (void)presentDictationMenuTip:(id)a3
{
  id v4 = a3;
  id v6 = [v4 objectForKeyedSubscript:@"title"];
  id v5 = [v4 objectForKeyedSubscript:@"description"];

  [(UIKeyboardImpl *)self presentDictationMenuTipWithTitle:v6 description:v5];
}

- (void)presentDictationMenuTipWithTitle:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[UIKeyboard isKeyboardProcess]
    && ![(UIKeyboardImpl *)self showingEmojiSearch])
  {
    uint64_t v17 = +[UIKeyboardImpl activeInstance];
    uint64_t v18 = [v17 inputDelegateManager];
    uint64_t v19 = [v18 inputSystemSourceSession];

    if (v19)
    {
      double v20 = [v19 textOperations];
      id v21 = [MEMORY[0x1E4F1CA60] dictionary];
      id v22 = NSStringFromSelector(sel_presentDictationMenuTip_);
      [v21 setObject:v22 forKeyedSubscript:@"selector"];

      [v21 setObject:v6 forKeyedSubscript:@"title"];
      [v21 setObject:v7 forKeyedSubscript:@"description"];
      [v20 setCustomInfoType:0x1ED14BAA0];
      [v20 setCustomInfo:v21];
      [v19 flushOperations];
    }
  }
  else
  {
    int v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
    float v9 = [v8 preferencesActions];
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    [v9 updateDictationTipLastShownDate:v10];

    uint64_t v11 = [(UIKeyboardImpl *)self _editMenuAssistant];
    [v11 hideSelectionCommands];

    [(UIKeyboardImpl *)self dismissDictationMenu];
    objc_initWeak(&location, self);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    CGAffineTransform v25 = __63__UIKeyboardImpl_presentDictationMenuTipWithTitle_description___block_invoke;
    uint64_t v26 = &unk_1E52DDB60;
    objc_copyWeak(&v27, &location);
    char v12 = +[UIAction actionWithHandler:&v23];
    -[UIKeyboardImpl configureTipViewWithTitle:description:closeButtonAction:](self, "configureTipViewWithTitle:description:closeButtonAction:", v6, v7, v12, v23, v24, v25, v26);

    double v13 = [(UIKeyboardImpl *)self inputDelegate];
    uint64_t v14 = [v13 interactionAssistant];
    double v15 = [(UIKeyboardImpl *)self keyboardMenuTipIdentifier];
    [v14 presentMenuForInputUI:v15 preferredArrowDirection:0];

    self->int m_keyboardMenuType = 3;
    m_tipView = self->m_tipView;
    self->m_tipView = 0;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
}

void __63__UIKeyboardImpl_presentDictationMenuTipWithTitle_description___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissDictationTip];
    id WeakRetained = v2;
  }
}

- (void)presentEducationTipWithTitle:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[UIKeyboard isInlineTextCompletionEducationUIEnabled](UIKeyboard, "isInlineTextCompletionEducationUIEnabled")&& !+[UIKeyboard isKeyboardProcess])
  {
    int v8 = [(UIKeyboardImpl *)self _editMenuAssistant];
    [v8 hideSelectionCommands];

    objc_initWeak(&location, self);
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __59__UIKeyboardImpl_presentEducationTipWithTitle_description___block_invoke;
    uint64_t v17 = &unk_1E52DDB60;
    objc_copyWeak(&v18, &location);
    float v9 = +[UIAction actionWithHandler:&v14];
    -[UIKeyboardImpl configureTipViewWithTitle:description:closeButtonAction:](self, "configureTipViewWithTitle:description:closeButtonAction:", v6, v7, v9, v14, v15, v16, v17);

    uint64_t v10 = [(UIKeyboardImpl *)self inputDelegate];
    uint64_t v11 = [v10 interactionAssistant];
    char v12 = [(UIKeyboardImpl *)self keyboardMenuTipIdentifier];
    [v11 presentMenuForInputUI:v12 preferredArrowDirection:1];

    self->int m_keyboardMenuType = 5;
    m_tipView = self->m_tipView;
    self->m_tipView = 0;

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
}

void __59__UIKeyboardImpl_presentEducationTipWithTitle_description___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained dismissEducationTip];
    id WeakRetained = v2;
  }
}

- (CGRect)overrideEditMenuTargetRectForConfiguration:(id)a3
{
  double v4 = *MEMORY[0x1E4F1DB20];
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  int v8 = [a3 identifier];
  float v9 = [(UIKeyboardImpl *)self keyboardMenuTipIdentifier];
  int v10 = [v8 isEqual:v9];

  if (v10)
  {
    uint64_t v11 = +[UIDictationController sharedInstance];
    char v12 = [v11 dictationTipController];
    uint64_t v13 = [v12 activeTipType];

    if (v13 == 7)
    {
      uint64_t v17 = [(UIKeyboardImpl *)self inputDelegate];
      uint64_t v19 = [v17 textInputView];
      [v19 bounds];
      double v4 = v27;
      double v6 = 0.0;
      double v7 = 0.0;
      double v5 = 0.0;
      goto LABEL_6;
    }
    if (v13 == 3)
    {
      uint64_t v14 = [(UIKeyboardImpl *)self textInteractionAssistant];
      uint64_t v15 = [v14 activeSelection];
      id v16 = [v15 selectedRange];
      uint64_t v17 = [v16 start];

      id v18 = [(UIKeyboardImpl *)self inputDelegate];
      uint64_t v19 = [v18 positionFromPosition:v17 inDirection:3 offset:1];

      double v20 = [(UIKeyboardImpl *)self inputDelegate];
      id v21 = [v20 textRangeFromPosition:v19 toPosition:v17];

      id v22 = [(UIKeyboardImpl *)self inputDelegate];
      [v22 firstRectForRange:v21];
      double v4 = v23;
      double v5 = v24;
      double v7 = v25;
      double v6 = v26;

LABEL_6:
    }
  }
  double v28 = v4;
  double v29 = v5;
  double v30 = v7;
  double v31 = v6;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (id)editMenuTipView
{
  return self->m_tipView;
}

- (void)configureTipViewWithTitle:(id)a3 description:(id)a4 closeButtonAction:(id)a5
{
  v66[12] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  int v10 = objc_opt_new();
  uint64_t v11 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
  [v10 setFont:v11];

  [v10 setNumberOfLines:0];
  [v10 setText:v9];

  [v10 setTextAlignment:0];
  [v10 setPreferredMaxLayoutWidth:180.0];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v12 = objc_opt_new();
  uint64_t v13 = +[UIColor secondaryLabelColor];
  [v12 setTextColor:v13];

  uint64_t v14 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleFootnote"];
  [v12 setFont:v14];

  [v12 setNumberOfLines:0];
  [v12 setText:v8];

  [v12 setTextAlignment:0];
  [v12 setPreferredMaxLayoutWidth:180.0];
  uint64_t v15 = v12;
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v16 = objc_opt_new();
  [v16 addAction:v7 forControlEvents:0x2000];

  uint64_t v17 = +[UIImage systemImageNamed:@"xmark"];
  id v18 = +[UIColor quaternaryLabelColor];
  uint64_t v19 = [v17 imageWithTintColor:v18 renderingMode:1];
  double v20 = +[UIImageSymbolConfiguration configurationWithWeight:6];
  v64 = [v19 imageByApplyingSymbolConfiguration:v20];

  [v16 setImage:v64 forState:0];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v63 = (UIView *)objc_opt_new();
  -[UIView setLayoutMargins:](v63, "setLayoutMargins:", 14.0, 13.0, 16.0, 13.0);
  [(UIView *)v63 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v63 addSubview:v10];
  [(UIView *)v63 addSubview:v15];
  [(UIView *)v63 addSubview:v16];
  id v21 = [(UIView *)v63 layoutMarginsGuide];
  int v47 = (void *)MEMORY[0x1E4F5B268];
  double v62 = [v10 topAnchor];
  double v61 = [v21 topAnchor];
  double v60 = [v62 constraintEqualToAnchor:v61];
  v66[0] = v60;
  double v59 = [v10 leadingAnchor];
  double v58 = [v21 leadingAnchor];
  double v57 = [v59 constraintEqualToAnchor:v58];
  v66[1] = v57;
  double v56 = [v10 widthAnchor];
  double v55 = [v15 widthAnchor];
  double v54 = [v56 constraintEqualToAnchor:v55 constant:-18.0];
  v66[2] = v54;
  double v53 = [v16 topAnchor];
  double v51 = [v10 topAnchor];
  double v50 = [v53 constraintEqualToAnchor:v51];
  v66[3] = v50;
  double v49 = [v16 leftAnchor];
  double v48 = [v10 rightAnchor];
  double v46 = [v49 constraintEqualToAnchor:v48];
  v66[4] = v46;
  double v45 = [v16 heightAnchor];
  double v44 = [v45 constraintEqualToConstant:18.0];
  v66[5] = v44;
  double v41 = [v16 widthAnchor];
  double v52 = v16;
  CGRect v40 = [v16 heightAnchor];
  CGRect v39 = [v41 constraintEqualToAnchor:v40];
  v66[6] = v39;
  id v22 = v21;
  double v42 = v21;
  int64_t v38 = [v21 trailingAnchor];
  uint64_t v37 = [v16 trailingAnchor];
  int64_t v36 = [v38 constraintEqualToAnchor:v37];
  v66[7] = v36;
  uint64_t v35 = [v15 topAnchor];
  uint64_t v34 = [v10 bottomAnchor];
  double v33 = [v35 constraintEqualToAnchor:v34 constant:4.0];
  v66[8] = v33;
  double v43 = v15;
  double v23 = [v15 leadingAnchor];
  double v24 = [v10 leadingAnchor];
  double v25 = [v23 constraintEqualToAnchor:v24];
  v66[9] = v25;
  double v26 = [v10 widthAnchor];
  double v27 = [v26 constraintGreaterThanOrEqualToConstant:180.0];
  v66[10] = v27;
  double v28 = [v22 bottomAnchor];
  double v29 = [v15 bottomAnchor];
  double v30 = [v28 constraintEqualToAnchor:v29];
  v66[11] = v30;
  double v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:12];
  [v47 activateConstraints:v31];

  m_tipView = self->m_tipView;
  self->m_tipView = v63;
}

- (void)presentKeyboardMenu:(int)a3
{
  self->int m_keyboardMenuType = a3;
  [(UIKeyboardImpl *)self touchDictationMenuTimer:0];
  double v4 = [(UIKeyboardImpl *)self inputDelegate];
  double v5 = [v4 interactionAssistant];
  double v6 = [v5 _editMenuAssistant];
  id v7 = [v6 _selectionView];
  id v8 = [v7 window];

  if (v8)
  {
    id v9 = [(UIKeyboardImpl *)self inputDelegate];
    int v10 = [v9 interactionAssistant];
    [v10 presentMenuForInputUI:0 preferredArrowDirection:0];

    m_editMenuInteraction = self->m_editMenuInteraction;
    self->m_editMenuInteraction = 0;
LABEL_6:

    goto LABEL_7;
  }
  if (self->m_editMenuInteraction
    || (char v12 = [[UIEditMenuInteraction alloc] initWithDelegate:self], v13 = self->m_editMenuInteraction, self->m_editMenuInteraction = v12, v13, [(UIEditMenuInteraction *)self->m_editMenuInteraction setPresentsContextMenuAsSecondaryAction:0], self->m_editMenuInteraction))
  {
    uint64_t v14 = [(UIKeyboardImpl *)self inputDelegate];
    uint64_t v15 = [v14 textInputView];
    [v15 addInteraction:self->m_editMenuInteraction];

    id v16 = [(UIKeyboardImpl *)self inputDelegateManager];
    uint64_t v17 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v18 = [v17 selectedTextRange];
    uint64_t v19 = [v18 start];
    [v16 caretRectForPosition:v19];
    double v22 = v21 + v20 * 0.5;
    double v25 = v24 + v23 * 0.5;

    m_editMenuInteraction = +[UIEditMenuConfiguration configurationWithIdentifier:sourcePoint:](UIEditMenuConfiguration, "configurationWithIdentifier:sourcePoint:", 0, v22, v25);
    objc_msgSend(m_editMenuInteraction, "set_ignoresPassthroughInView:", 1);
    [(UIEditMenuInteraction *)self->m_editMenuInteraction presentEditMenuWithConfiguration:m_editMenuInteraction];
    goto LABEL_6;
  }
LABEL_7:
  self->int m_keyboardMenuType = 0;
}

- (void)presentDictationPopover
{
  if (+[UIKeyboard isMajelEnabled])
  {
    [(UIKeyboardImpl *)self dismissInputModeIndicator];
    [(UIKeyboardImpl *)self presentKeyboardPopoverWithType:1 keyString:0 completion:0];
  }
}

- (id)keyboardMenuTipIdentifier
{
  return @"KeyboardMenuTipIdentifier";
}

- (BOOL)canPresentDictationMenuWithAnimationStyle:(int64_t)a3
{
  double v5 = [(UIKeyboardImpl *)self textInteractionAssistant];
  double v6 = [v5 _caretView];

  id v7 = [v6 window];
  [v7 frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toView:", 0);
  v32.origin.double x = v16;
  v32.origin.double y = v17;
  v32.size.width = v18;
  v32.size.height = v19;
  v31.origin.double x = v9;
  v31.origin.double y = v11;
  v31.size.width = v13;
  v31.size.height = v15;
  if (CGRectIntersectsRect(v31, v32)) {
    char v20 = 0;
  }
  else {
    char v20 = !+[UIKeyboard isInlineDictationIndicatorEnabled];
  }

  if (self->m_editMenuInteraction)
  {
    double v21 = +[UIMenuController sharedMenuController];
    int v22 = [v21 isMenuVisible];

    m_editMenuInteraction = self->m_editMenuInteraction;
    if (m_editMenuInteraction)
    {
      int v24 = [(UIEditMenuInteraction *)m_editMenuInteraction isDisplayingMenu];
      goto LABEL_9;
    }
  }
  else
  {
    int v22 = 0;
  }
  double v25 = [(UIKeyboardImpl *)self inputDelegate];
  double v26 = [v25 interactionAssistant];
  int v24 = [v26 isDisplayingMenu];

LABEL_9:
  if (a3 == 1) {
    int v27 = 1;
  }
  else {
    int v27 = (v24 | v22) ^ 1;
  }
  if ((v20 & 1) != 0
    || self->m_dictationIndicatorAssertion
    || (v27 & ~[(UIKeyboardImpl *)self hasAutocorrectPrompt]) != 1
    || +[UIKeyboard isInlineDictationIndicatorEnabled]
    && [(UIKeyboardImpl *)self inputModeSwitcherVisible])
  {
    LOBYTE(v28) = 0;
  }
  else
  {
    double v30 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    int v28 = [v30 showingPromptsIncludingDictationChoices] ^ 1;
  }
  return v28;
}

- (void)presentDictationMenuWithAnimationStyle:(int64_t)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->m_keyboardMenuType != 3)
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)CGFloat v15 = 0;
        _os_log_fault_impl(&dword_1853B0000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Dictation Menu should not be presented in keyboard process", v15, 2u);
      }
    }
    else if (+[UIKeyboard isInlineDictationIndicatorEnabled](UIKeyboard, "isInlineDictationIndicatorEnabled")&& (-[UIKeyboardImpl inputDelegateManager](self, "inputDelegateManager"), double v5 = objc_claimAutoreleasedReturnValue(), [v5 selectionDisplayInteraction], v6 = objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v6, "isActivated"), v6, v5, v7))
    {
      if ([(UIKeyboardImpl *)self canPresentDictationMenuWithAnimationStyle:a3])
      {
        double v8 = [(UIKeyboardImpl *)self inputDelegateManager];
        CGFloat v9 = [v8 selectionDisplayInteraction];
        [v9 _setGlowViewMode:1];

        double v10 = [(UIKeyboardImpl *)self _activeAssertionController];
        CGFloat v16 = @"_UITextCursorAnimationStyleUserInfoKey";
        CGFloat v11 = [NSNumber numberWithInteger:a3];
        v17[0] = v11;
        double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        CGFloat v13 = [v10 dictationIndicatorAssertionWithReason:@"Starting dictation" userInfo:v12];
        m_dictationIndicatorAssertion = self->m_dictationIndicatorAssertion;
        self->m_dictationIndicatorAssertion = v13;
      }
    }
    else
    {
      [(UIKeyboardImpl *)self presentKeyboardMenu:1];
    }
  }
}

- (void)presentDictationUndoMenu
{
}

- (void)presentDictationMenu
{
}

- (void)_dictationDidRecieveDidBeginDictationNotification:(id)a3
{
  if (!+[UIKeyboard isKeyboardProcess])
  {
    if (!+[UIKeyboard isRedesignedTextCursorEnabled]
      || +[UIKeyboard isInlineDictationIndicatorEnabled]
      && ([(UIKeyboardImpl *)self inputDelegateManager],
          double v4 = objc_claimAutoreleasedReturnValue(),
          [v4 selectionDisplayInteraction],
          double v5 = objc_claimAutoreleasedReturnValue(),
          char v6 = [v5 isActivated],
          v5,
          v4,
          (v6 & 1) == 0))
    {
      id v7 = +[UIKeyboardImpl activeInstance];
      [v7 presentDictationMenu];
    }
  }
}

- (void)presentPressAndHoldPopoverWithKeyString:(id)a3
{
}

- (void)dismissPressAndHoldPopover
{
}

- (void)setRemoteDictationPopover:(id)a3
{
  id v16 = a3;
  double v4 = [v16 objectForKeyedSubscript:@"appear"];
  int v5 = [v4 BOOLValue];

  dictationPopoverController = self->_dictationPopoverController;
  if (v5)
  {
    if (!dictationPopoverController)
    {
      id v7 = +[UIDictationView sharedInstance];
      double v8 = [UIDictationPopoverController alloc];
      [v7 frame];
      double v10 = v9;
      double v12 = v11;
      CGFloat v13 = [(UIKeyboardImpl *)self inputDelegate];
      double v14 = -[UIDictationPopoverController initWithContentView:contentSize:inputDelegate:](v8, "initWithContentView:contentSize:inputDelegate:", v7, v13, v10, v12);
      CGFloat v15 = self->_dictationPopoverController;
      self->_dictationPopoverController = v14;

      dictationPopoverController = self->_dictationPopoverController;
    }
    [(UIDictationPopoverController *)dictationPopoverController setRemoteDictationPopover:v16];
  }
  else
  {
    self->_dictationPopoverController = 0;
  }
}

- (id)dictationPopoverController
{
  return self->_dictationPopoverController;
}

- (BOOL)isDictationPopoverPresented
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    LOBYTE(v3) = self->_dictationPopoverController != 0;
  }
  else
  {
    BOOL v3 = +[UIKeyboard isMajelEnabled];
    if (v3)
    {
      dictationPopoverController = self->_dictationPopoverController;
      LOBYTE(v3) = [(UIKeyboardPopoverController *)dictationPopoverController isPresented];
    }
  }
  return v3;
}

- (BOOL)isDictationMenuPresented
{
  m_editMenuInteraction = self->m_editMenuInteraction;
  if (m_editMenuInteraction)
  {
    BOOL v4 = [(UIEditMenuInteraction *)m_editMenuInteraction isDisplayingMenu];
    BOOL v5 = +[UIKeyboard isRedesignedTextCursorEnabled];
    if (v4) {
      return 1;
    }
  }
  else
  {
    id v7 = [(UIKeyboardImpl *)self inputDelegate];
    double v8 = [v7 interactionAssistant];
    char v9 = [v8 isDisplayingMenuForInputUI];

    BOOL v5 = +[UIKeyboard isRedesignedTextCursorEnabled];
    if (v9) {
      return 1;
    }
  }
  uint64_t v10 = 34;
  if (v5) {
    uint64_t v10 = 39;
  }
  return *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIKeyboardImpl__id[v10]) != 0;
}

+ (BOOL)isDictationPopoverEnabled
{
  if (os_variant_has_internal_diagnostics())
  {
    BOOL v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    BOOL v5 = [v4 preferencesActions];
    char v6 = [v5 valueForPreferenceKey:@"DictationDisableInlinePopoverUI"];

    int v2 = [v6 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v2) = 1;
  }
  return v2;
}

- (void)dismissDictationPopoverAndCancelDictation
{
  if (self->m_keyboardMenuType != 3)
  {
    BOOL v3 = +[UIDictationController activeInstance];
    [v3 cancelDictation];

    [(UIKeyboardImpl *)self dismissDictationPopover];
  }
}

- (void)dismissDictationPopover
{
  if ([(UIKeyboardImpl *)self isDictationPopoverPresented])
  {
    dictationPopoverController = self->_dictationPopoverController;
    [(UIKeyboardImpl *)self dismissKeyboardPopover:dictationPopoverController beforeCleanup:1 completion:0];
  }
}

- (void)dismissDictationMenu
{
  if (!+[UIKeyboard isKeyboardProcess]
    || [(UIKeyboardImpl *)self showingEmojiSearch])
  {
    if (self->m_keyboardMenuType == 3) {
      return;
    }
    if (self->m_dictationIndicatorAssertion)
    {
      BOOL v3 = [(UIKeyboardImpl *)self inputDelegateManager];
      BOOL v4 = [v3 selectionDisplayInteraction];
      [v4 clearInputModeCursorAssertion];

      [(UITextCursorAssertion *)self->m_dictationIndicatorAssertion invalidate];
      m_dictationIndicatorAssertion = self->m_dictationIndicatorAssertion;
      self->m_dictationIndicatorAssertion = 0;
    }
    if (self->m_editMenuInteraction)
    {
      if (self->m_keyboardMenuType == 3) {
        return;
      }
      char v6 = [(UIKeyboardImpl *)self inputDelegate];
      id v7 = [v6 textInputView];
      [v7 removeInteraction:self->m_editMenuInteraction];

      [(UIEditMenuInteraction *)self->m_editMenuInteraction dismissMenu];
      double v8 = +[UIMenuController sharedMenuController];
      LODWORD(v6) = [v8 isMenuVisible];

      if (!v6) {
        return;
      }
      id v15 = +[UIMenuController sharedMenuController];
      [v15 hideMenu];
      goto LABEL_15;
    }
    id v15 = [(UIKeyboardImpl *)self inputDelegate];
    double v12 = [v15 interactionAssistant];
    [v12 dismissMenuForInputUI];
LABEL_14:

LABEL_15:
    double v11 = v15;
    goto LABEL_16;
  }
  char v9 = +[UIKeyboardImpl activeInstance];
  uint64_t v10 = [v9 inputDelegateManager];
  id v15 = [v10 inputSystemSourceSession];

  double v11 = v15;
  if (v15)
  {
    double v12 = [v15 textOperations];
    CGFloat v13 = [MEMORY[0x1E4F1CA60] dictionary];
    double v14 = NSStringFromSelector(sel_dismissDictationMenu);
    [v13 setObject:v14 forKeyedSubscript:@"selector"];

    [v12 setCustomInfoType:0x1ED14BAA0];
    [v12 setCustomInfo:v13];
    [v15 flushOperations];

    goto LABEL_14;
  }
LABEL_16:
}

- (void)dismissDictationTip
{
  BOOL v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v4 = [v3 BOOLForPreferenceKey:@"DictationCommandTipsEnabled"];

  if (v4 && self->m_keyboardMenuType == 3)
  {
    BOOL v5 = [(UIKeyboardImpl *)self inputDelegate];
    char v6 = [v5 interactionAssistant];
    int v7 = [v6 isDisplayingMenuForInputUI];

    if (v7)
    {
      double v8 = +[UIDictationController activeInstance];
      char v9 = [v8 dictationTipController];
      [v9 logDictationTipDimissialInstrumentation];
    }
    self->int m_keyboardMenuType = 0;
    if (+[UIDictationController isRunning]) {
      [(UIKeyboardImpl *)self touchDictationMenuTimer];
    }
    [(UIDictationPopoverController *)self->_dictationPopoverController dismissTip];
    [(UIKeyboardImpl *)self dismissDictationPopover];
    [(UIKeyboardImpl *)self dismissDictationMenu];
  }
}

- (void)dismissEducationTip
{
  if (self->m_keyboardMenuType == 5)
  {
    self->int m_keyboardMenuType = 0;
    id v3 = [(UIKeyboardImpl *)self inputDelegate];
    int v2 = [v3 interactionAssistant];
    [v2 dismissMenuForInputUI];
  }
}

- (void)setInputModeAssertionWithReason:(id)a3
{
  id v4 = a3;
  id v6 = [(UIKeyboardImpl *)self _activeAssertionController];
  BOOL v5 = [v6 activeInputModeAssertionWithReason:v4];

  [(UIKeyboardImpl *)self setInputModeAssertion:v5];
}

- (void)clearInputModeAssertion
{
  id v3 = [(UIKeyboardImpl *)self inputModeAssertion];
  [v3 invalidate];

  [(UIKeyboardImpl *)self setInputModeAssertion:0];
}

- (UIViewController)emojiPopoverController
{
  return (UIViewController *)self->_emojiPopoverController;
}

- (void)presentKeyboardPopoverWithType:(int)a3 keyString:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  if ([(UIKeyboardImpl *)self isSettingDelegate])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke;
    aBlock[3] = &unk_1E52FC6A0;
    aBlock[4] = self;
    int v96 = v6;
    id v94 = v8;
    id v95 = v9;
    uint64_t v10 = _Block_copy(aBlock);
    if (+[UIKeyboard isKeyboardProcess])
    {
      double v11 = [(UIKeyboardImpl *)self inputSystemSourceSession];
      if (v11)
      {
        double v12 = v11;
        CGFloat v13 = [v11 documentState];
        [v13 clientFrameInWindow];
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        CGFloat v21 = v20;

        v97.origin.double x = v15;
        v97.origin.double y = v17;
        v97.size.width = v19;
        v97.size.height = v21;
        if (CGRectIsEmpty(v97))
        {
          dispatch_time_t v22 = dispatch_time(0, 500000000);
          dispatch_after(v22, MEMORY[0x1E4F14428], v10);

LABEL_34:
          goto LABEL_50;
        }
      }
    }
    dispatch_async(MEMORY[0x1E4F14428], v10);
    goto LABEL_34;
  }
  if (v6 == 1)
  {
    if (![(id)objc_opt_class() isDictationPopoverEnabled]) {
      goto LABEL_50;
    }
LABEL_12:
    double v23 = [(UIKeyboardImpl *)self inputDelegate];
    int v24 = [v23 textInputView];
    double v25 = [v24 keyboardSceneDelegate];
    double v26 = v25;
    if (v25)
    {
      id v27 = v25;
    }
    else
    {
      id v27 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    }
    int v28 = v27;

    if ([(UIKeyboardImpl *)self isEmojiPopoverPresented])
    {
      BOOL v29 = ((v6 != 1) & [(UIKeyboardImpl *)self isDictationPopoverPresented]) == 0;
      uint64_t v30 = 17;
      if (!v29) {
        uint64_t v30 = 23;
      }
      uint64_t v31 = OBJC_IVAR___UIKeyboardImpl__id[v30];
    }
    else
    {
      if (!v6)
      {
        if ([(UIKeyboardImpl *)self _showsScribbleIconsInAssistantView]
          || ([v28 visualModeManager],
              double v56 = objc_claimAutoreleasedReturnValue(),
              int v57 = [v56 shouldShowWithinAppWindow],
              v56,
              v57))
        {
          id v32 = [v28 containerRootController];
LABEL_23:
          double v33 = v32;
          if (v32) {
            goto LABEL_24;
          }
LABEL_40:
          if (os_variant_has_internal_diagnostics())
          {
            v65 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1853B0000, v65, OS_LOG_TYPE_FAULT, "Why don't we have a view controller for the keyboard popover?", buf, 2u);
            }
          }
          else
          {
            double v59 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259F98) + 8);
            if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v59, OS_LOG_TYPE_ERROR, "Why don't we have a view controller for the keyboard popover?", buf, 2u);
            }
          }
LABEL_24:
          uint64_t v34 = [v33 presentedViewController];

          if (v34)
          {
            uint64_t v35 = [v33 presentedViewController];
            v89[0] = MEMORY[0x1E4F143A8];
            v89[1] = 3221225472;
            v89[2] = __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_338;
            v89[3] = &unk_1E52FC6A0;
            v89[4] = self;
            int v92 = v6;
            id v90 = v8;
            id v91 = v9;
            [v35 dismissViewControllerAnimated:0 completion:v89];

LABEL_49:
            goto LABEL_50;
          }
          v70 = v24;
          v68 = v28;
          if (!v6
            && self->_emojiPopoverController
            && [(UIKeyboardImpl *)self isEmojiPopoverPresented])
          {
            if (os_variant_has_internal_diagnostics())
            {
              v66 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_1853B0000, v66, OS_LOG_TYPE_FAULT, "We're being asked to present the Emoji Popover when it's already presented.", buf, 2u);
              }
            }
            else
            {
              v64 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259FA0) + 8);
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1853B0000, v64, OS_LOG_TYPE_ERROR, "We're being asked to present the Emoji Popover when it's already presented.", buf, 2u);
              }
            }
          }
          int64_t v36 = [(UIKeyboardImpl *)self inputDelegateManager];
          uint64_t v37 = [v36 selectedTextRange];

          int64_t v38 = [(UIKeyboardImpl *)self inputDelegateManager];
          CGRect v39 = [v38 selectionRectsForRange:v37];
          CGRect v40 = [v39 firstObject];
          unsigned int v69 = [v40 isVertical];

          double v41 = v37;
          double v42 = [(UIKeyboardImpl *)self inputDelegateManager];
          double v43 = [v37 start];
          [v42 caretRectForPosition:v43];
          double v45 = v44;
          double v47 = v46;
          double v49 = v48;
          double v51 = v50;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v52 = v23;
            [v52 bounds];
            double Height = CGRectGetHeight(v98);
            v99.origin.double x = v45;
            v99.origin.double y = v47;
            v99.size.width = v49;
            v99.size.height = v51;
            if (Height <= CGRectGetHeight(v99))
            {
              BOOL v55 = 1;
            }
            else
            {
              [v52 bounds];
              double Width = CGRectGetWidth(v100);
              v101.origin.double x = v45;
              v101.origin.double y = v47;
              v101.size.width = v49;
              v101.size.height = v51;
              BOOL v55 = Width <= CGRectGetWidth(v101);
            }
            if ([v52 isScrollEnabled])
            {
              [v52 bounds];
              v103.origin.double x = v45;
              v103.origin.double y = v47;
              v103.size.width = v49;
              v103.size.height = v51;
              if (!CGRectIntersectsRect(v102, v103) && !v55)
              {
                *(void *)buf = 0;
                v84 = buf;
                uint64_t v85 = 0x3032000000;
                v86 = __Block_byref_object_copy__133;
                v87 = __Block_byref_object_dispose__133;
                id v88 = 0;
                CGRect v67 = [MEMORY[0x1E4F28EB8] defaultCenter];
                double v60 = [MEMORY[0x1E4F28F08] mainQueue];
                v71[0] = MEMORY[0x1E4F143A8];
                v71[1] = 3221225472;
                v71[2] = __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_341;
                v71[3] = &unk_1E52FC6C8;
                v76 = buf;
                v71[4] = self;
                int v81 = v6;
                id v72 = v8;
                id v73 = v33;
                id v74 = v70;
                double v77 = v45;
                double v78 = v47;
                double v79 = v49;
                double v80 = v51;
                char v82 = v69;
                id v75 = v9;
                uint64_t v61 = [v67 addObserverForName:@"UITextSelectionDidScroll" object:v52 queue:v60 usingBlock:v71];
                double v62 = (void *)*((void *)v84 + 5);
                *((void *)v84 + 5) = v61;

                double v63 = [v52 interactionAssistant];
                [v63 scrollSelectionToVisible];

                _Block_object_dispose(buf, 8);
                int v28 = v68;
                double v41 = v37;
                int v24 = v70;
                goto LABEL_48;
              }
            }

            int v28 = v68;
            double v41 = v37;
          }
          else
          {
            int v28 = v68;
          }
          int v24 = v70;
          -[UIKeyboardImpl _presentKeyboardPopoverWithType:keyString:popoverController:textInputView:caretRect:isVerticalText:completion:](self, "_presentKeyboardPopoverWithType:keyString:popoverController:textInputView:caretRect:isVerticalText:completion:", v6, v8, v33, v70, v69, v9, v45, v47, v49, v51);
LABEL_48:

          goto LABEL_49;
        }
      }
      if (![(UIKeyboardImpl *)self isDictationPopoverPresented])
      {
        double v58 = [v28 forceCreateKeyboardWindow];
        double v33 = [v58 rootViewController];

        if (v33) {
          goto LABEL_24;
        }
        goto LABEL_40;
      }
      uint64_t v31 = 576;
    }
    id v32 = *(id *)((char *)&self->super.super.super.isa + v31);
    goto LABEL_23;
  }
  if (v6 != 2
    || ![(UIKeyboardImpl *)self isPressAndHoldPopoverPresented]
    || ![(UIPressAndHoldPopoverController *)self->_pressAndHoldPopoverController isSamePressAndHoldPopoverForKeyString:v8])
  {
    goto LABEL_12;
  }
LABEL_50:
}

uint64_t __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canPresentEmojiPopover];
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  if ((result & 1) != 0 || v3 == 1)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    return [v4 presentKeyboardPopoverWithType:v3 keyString:v5 completion:v6];
  }
  return result;
}

void __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_338(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) inputDelegate];

  if (v2)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 56);
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    [v4 presentKeyboardPopoverWithType:v3 keyString:v5 completion:v6];
  }
}

uint64_t __70__UIKeyboardImpl_presentKeyboardPopoverWithType_keyString_completion___block_invoke_341(uint64_t a1)
{
  int v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

  uint64_t v3 = *(unsigned int *)(a1 + 112);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 116);
  uint64_t v9 = *(void *)(a1 + 64);
  double v10 = *(double *)(a1 + 80);
  double v11 = *(double *)(a1 + 88);
  double v12 = *(double *)(a1 + 96);
  double v13 = *(double *)(a1 + 104);
  return objc_msgSend(v4, "_presentKeyboardPopoverWithType:keyString:popoverController:textInputView:caretRect:isVerticalText:completion:", v3, v5, v6, v7, v8, v9, v10, v11, v12, v13);
}

- (void)_presentKeyboardPopoverWithType:(int)a3 keyString:(id)a4 popoverController:(id)a5 textInputView:(id)a6 caretRect:(CGRect)a7 isVerticalText:(BOOL)a8 completion:(id)a9
{
  CGFloat height = a7.size.height;
  CGFloat width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  CGFloat v21 = (void (**)(void))a9;
  dispatch_time_t v22 = [(UIKeyboardImpl *)self inputDelegate];

  if (v22)
  {
    CGFloat v161 = width;
    double v23 = [v19 view];
    int v24 = [v23 window];

    [v20 bounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    BOOL v33 = [(UIKeyboardImpl *)self showingEmojiSearch];
    if (+[UIKeyboard isKeyboardProcess] && !v33)
    {
      uint64_t v35 = [(UIKeyboardImpl *)self inputSystemSourceSession];
      int64_t v36 = v35;
      if (v35)
      {
        uint64_t v37 = [v35 documentState];
        [v37 clientFrameInWindow];
        CGFloat v26 = v38;
        CGFloat v28 = v39;
        CGFloat v30 = v40;
        CGFloat v32 = v41;
      }
      double v34 = height;
    }
    else
    {
      double v34 = height;
    }
    v173.origin.double x = v26;
    v173.origin.double y = v28;
    v173.size.CGFloat width = v30;
    v173.size.CGFloat height = v32;
    double MinX = CGRectGetMinX(v173);
    v174.origin.double x = v26;
    v174.origin.double y = v28;
    v174.size.CGFloat width = v30;
    v174.size.CGFloat height = v32;
    double v43 = fmax(MinX, fmin(x, CGRectGetMaxX(v174)));
    v175.origin.double x = v26;
    v175.origin.double y = v28;
    v175.size.CGFloat width = v30;
    v175.size.CGFloat height = v32;
    double MinY = CGRectGetMinY(v175);
    v176.origin.double x = v26;
    v176.origin.double y = v28;
    v176.size.CGFloat width = v30;
    v176.size.CGFloat height = v32;
    double v45 = fmax(MinY, fmin(y, CGRectGetMaxY(v176)));
    id v163 = v18;
    BOOL v158 = a8;
    double v46 = v43;
    double v47 = v45;
    if (a8)
    {
      double v48 = v161;
      CGFloat v49 = v161;
      double v50 = v34;
      if (CGRectGetWidth(*(CGRect *)&v46) > 100.0)
      {
        v177.origin.double x = v43;
        v177.origin.double y = v45;
        v177.size.CGFloat width = v161;
        v177.size.CGFloat height = v34;
        double v43 = CGRectGetMaxX(v177) + -1.0;
        double v48 = 1.0;
      }
      uint64_t v51 = 12;
    }
    else
    {
      double v48 = v161;
      CGFloat v52 = v161;
      double v53 = v34;
      if (CGRectGetHeight(*(CGRect *)&v46) > 100.0)
      {
        v178.origin.double x = v43;
        v178.origin.double y = v45;
        v178.size.CGFloat width = v161;
        v178.size.CGFloat height = v34;
        double v45 = CGRectGetMaxY(v178) + -1.0;
        double v34 = 1.0;
      }
      uint64_t v51 = 3;
    }
    double v54 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    BOOL v55 = [v54 visualModeManager];
    unsigned int v56 = [v55 shouldShowWithinAppWindow];

    unsigned int v162 = v56;
    if (v56) {
      uint64_t v51 = 15;
    }
    int v57 = [v20 keyboardSceneDelegate];
    if (v57) {
      [v20 keyboardSceneDelegate];
    }
    else {
    double v58 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    }
    double v59 = [v58 containerWindow];

    if ([v59 _isHostedInAnotherProcess] && (objc_msgSend(v59, "_isFullscreen") & 1) == 0)
    {
      if (a3)
      {
        objc_msgSend(v59, "convertRect:fromView:", v20, v43, v45, v48, v34);
        double v61 = v96;
        double v63 = v97;
        double v65 = v98;
        double v67 = v99;
        id v100 = v59;

        uint64_t v101 = [v100 rootViewController];

        int v24 = v100;
        id v19 = (id)v101;
      }
      else
      {
        v128 = [v20 window];
        objc_msgSend(v20, "convertRect:toView:", v128, v43, v45, v48, v34);
        double v130 = v129;
        double v132 = v131;
        double v134 = v133;
        double v136 = v135;

        v137 = [v20 window];
        objc_msgSend(v59, "convertRect:fromWindow:", v137, v130, v132, v134, v136);
        double v61 = v138;
        double v63 = v139;
        double v65 = v140;
        double v67 = v141;
      }
    }
    else
    {
      objc_msgSend(v59, "convertRect:fromView:", v20, v43, v45, v48, v34);
      objc_msgSend(v59, "convertRect:toView:", v24);
      double v61 = v60;
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
    }
    if (v24)
    {
      v68 = [v59 screen];
      unsigned int v69 = [v24 screen];

      uint64_t v160 = v51;
      if (v68 != v69)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v156 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v156, OS_LOG_TYPE_FAULT, "The input view is on a different screen than the popover window; popover will have the wrong frame.",
              buf,
              2u);
          }
        }
        else
        {
          v154 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259FA8) + 8);
          if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v154, OS_LOG_TYPE_ERROR, "The input view is on a different screen than the popover window; popover will have the wrong frame.",
              buf,
              2u);
          }
        }
      }
      double v159 = v67;
      double v70 = v65;
      [v59 frame];
      CGFloat v72 = v71;
      CGFloat v74 = v73;
      CGFloat v76 = v75;
      CGFloat v78 = v77;
      [v24 frame];
      v194.origin.double x = v79;
      v194.origin.double y = v80;
      v194.size.CGFloat width = v81;
      v194.size.CGFloat height = v82;
      v179.origin.double x = v72;
      v179.origin.double y = v74;
      v179.size.CGFloat width = v76;
      v179.size.CGFloat height = v78;
      if (!CGRectEqualToRect(v179, v194))
      {
        if (os_variant_has_internal_diagnostics())
        {
          v157 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v157, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v157, OS_LOG_TYPE_FAULT, "The input view's window has a different frame than the popover window; popover may have the wrong frame.",
              buf,
              2u);
          }
        }
        else
        {
          v155 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB259FB0) + 8);
          if (os_log_type_enabled(v155, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v155, OS_LOG_TYPE_ERROR, "The input view's window has a different frame than the popover window; popover may have the wrong frame.",
              buf,
              2u);
          }
        }
      }
      [v24 bounds];
      CGFloat v83 = v180.origin.x;
      CGFloat v84 = v180.origin.y;
      CGFloat v85 = v180.size.width;
      CGFloat v86 = v180.size.height;
      double v87 = CGRectGetMinX(v180);
      v181.origin.double x = v83;
      v181.origin.double y = v84;
      v181.size.CGFloat width = v85;
      v181.size.CGFloat height = v86;
      double v88 = fmax(v87, fmin(v61, CGRectGetMaxX(v181)));
      v182.origin.double x = v83;
      v182.origin.double y = v84;
      v182.size.CGFloat width = v85;
      v182.size.CGFloat height = v86;
      double v89 = CGRectGetMinY(v182);
      v183.origin.double x = v83;
      v183.origin.double y = v84;
      v183.size.CGFloat width = v85;
      v183.size.CGFloat height = v86;
      double v90 = fmax(v89, fmin(v63, CGRectGetMaxY(v183)));
      if (a3 == 1)
      {
        [(UIKeyboardImpl *)self dismissKeyboardPopover:self->_dictationPopoverController beforeCleanup:1 completion:0];
        CGRect v102 = +[UIDictationView sharedInstance];
        CGRect v103 = [UIDictationPopoverController alloc];
        [v102 frame];
        double v105 = v104;
        double v107 = v106;
        v108 = [(UIKeyboardImpl *)self inputDelegate];
        v109 = -[UIDictationPopoverController initWithContentView:contentSize:inputDelegate:](v103, "initWithContentView:contentSize:inputDelegate:", v102, v108, v105, v107);
        dictationPopoverController = self->_dictationPopoverController;
        self->_dictationPopoverController = v109;

        id v94 = self->_dictationPopoverController;
        [v102 frame];
        double v111 = CGRectGetHeight(v184);
        [v24 safeAreaInsets];
        double v113 = v111 + v112;
        [(objc_class *)+[_UIPopoverStandardChromeView standardChromeViewClass] arrowHeight];
        double v115 = v113 + v114;
        double v91 = v70;
        double v95 = v159;
        if (!v158)
        {
          v185.origin.double x = v88;
          v185.origin.double y = v90;
          v185.size.CGFloat width = v91;
          v185.size.CGFloat height = v159;
          CGFloat v116 = CGRectGetMinY(v185);
          uint64_t v117 = v51;
          if (v116 > v115) {
            uint64_t v117 = 2;
          }
          uint64_t v160 = v117;
        }
        p_m_editMenuFrame = &self->m_editMenuFrame;
        if (!CGRectIsEmpty(self->m_editMenuFrame))
        {
          v186.origin.double x = p_m_editMenuFrame->origin.x;
          v186.origin.double y = self->m_editMenuFrame.origin.y;
          v186.size.CGFloat width = self->m_editMenuFrame.size.width;
          v186.size.CGFloat height = self->m_editMenuFrame.size.height;
          double MidY = CGRectGetMidY(v186);
          v187.origin.double x = v88;
          v187.origin.double y = v90;
          v187.size.CGFloat width = v91;
          v187.size.CGFloat height = v159;
          if (MidY >= CGRectGetMidY(v187))
          {
            v191.origin.double x = v88;
            v191.origin.double y = v90;
            v191.size.CGFloat width = v91;
            v191.size.CGFloat height = v159;
            CGFloat v142 = CGRectGetMinX(v191);
            v192.origin.double x = p_m_editMenuFrame->origin.x;
            v192.origin.double y = self->m_editMenuFrame.origin.y;
            v192.size.CGFloat width = self->m_editMenuFrame.size.width;
            v192.size.CGFloat height = self->m_editMenuFrame.size.height;
            double MaxY = CGRectGetMaxY(v192);
            v193.origin.double x = v88;
            v193.origin.double y = v90;
            v193.size.CGFloat width = v91;
            v193.size.CGFloat height = v159;
            double v90 = MaxY - CGRectGetHeight(v193);
            uint64_t v160 = 1;
            double v88 = v142;
          }
          else
          {
            v188.origin.double x = p_m_editMenuFrame->origin.x;
            v188.origin.double y = self->m_editMenuFrame.origin.y;
            v188.size.CGFloat width = self->m_editMenuFrame.size.width;
            v188.size.CGFloat height = self->m_editMenuFrame.size.height;
            if (CGRectGetMinY(v188) <= v115)
            {
              uint64_t v160 = 1;
            }
            else
            {
              v189.origin.double x = v88;
              v189.origin.double y = v90;
              v189.size.CGFloat width = v91;
              v189.size.CGFloat height = v159;
              double v88 = CGRectGetMinX(v189);
              v190.origin.double x = p_m_editMenuFrame->origin.x;
              v190.origin.double y = self->m_editMenuFrame.origin.y;
              v190.size.CGFloat width = self->m_editMenuFrame.size.width;
              v190.size.CGFloat height = self->m_editMenuFrame.size.height;
              double v90 = CGRectGetMinY(v190);
            }
          }
          -[UIDictationPopoverController movePopoverViewForEditMenuFrame:](self->_dictationPopoverController, "movePopoverViewForEditMenuFrame:", p_m_editMenuFrame->origin.x, self->m_editMenuFrame.origin.y, self->m_editMenuFrame.size.width, self->m_editMenuFrame.size.height);
        }

        id v18 = v163;
      }
      else
      {
        double v91 = v70;
        if (a3 == 2)
        {
          [(UIKeyboardImpl *)self dismissKeyboardPopover:self->_pressAndHoldPopoverController beforeCleanup:1 completion:0];
          id v18 = v163;
          int v92 = [[UIPressAndHoldPopoverController alloc] initWithKeyString:v163];
          pressAndHoldPopoverController = self->_pressAndHoldPopoverController;
          self->_pressAndHoldPopoverController = v92;

          id v94 = self->_pressAndHoldPopoverController;
          double v95 = v159;
        }
        else
        {
          double v95 = v159;
          if (qword_1EB25A040 != -1) {
            dispatch_once(&qword_1EB25A040, &__block_literal_global_2462);
          }
          v120 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
          v121 = [v120 valueForPreferenceKey:@"VerticalScrollingInEmojiPopover"];

          if ([v121 BOOLValue]) {
            uint64_t v122 = 1;
          }
          else {
            uint64_t v122 = _os_feature_enabled_impl();
          }

          [(UIKeyboardImpl *)self dismissKeyboardPopover:self->_emojiPopoverController beforeCleanup:1 completion:0];
          v123 = [UIKeyboardEmojiPopoverController alloc];
          v124 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
          v125 = [(UIKeyboardImpl *)self taskQueue];
          v126 = -[UIKeyboardEmojiPopoverController initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:](v123, "initWithTextInputTraits:taskQueue:scrollingDirection:window:caretRect:", v124, v125, v122, v24, v88, v90, v91, v159);
          emojiPopoverController = self->_emojiPopoverController;
          self->_emojiPopoverController = v126;

          id v94 = self->_emojiPopoverController;
          id v18 = v163;
        }
      }
      [(UIViewController *)v94 setModalPresentationStyle:7];
      v144 = [(UIViewController *)v94 traitCollection];
      if ([v144 userInterfaceIdiom])
      {

        uint64_t v145 = v160;
      }
      else
      {
        v146 = [(UIViewController *)v94 traitCollection];
        uint64_t v147 = [v146 verticalSizeClass];

        BOOL v148 = v147 == 1;
        id v18 = v163;
        uint64_t v145 = v160;
        if (v148) {
          uint64_t v145 = 15;
        }
      }
      v149 = [(UIViewController *)v94 popoverPresentationController];
      [(UIKeyboardPopoverController *)v94 configurePopoverPresentationController:v149];
      [v149 setDelegate:self];
      [v149 setSourceView:v24];
      objc_msgSend(v149, "setSourceRect:", v88, v90, v91, v95);
      [v149 setPermittedArrowDirections:v145];
      [v149 setCanOverlapSourceViewRect:v162];
      if (a3 == 1)
      {
        objc_msgSend(v149, "setPopoverLayoutMargins:", -5.0, 19.0, 10.0, 19.0);
        [v149 _setIgnoresKeyboardNotifications:1];
      }
      else if (a3 == 2)
      {
        [v149 setPopoverBackgroundViewClass:objc_opt_class()];
        v150 = [(UIView *)self traitCollection];
        if ([v150 userInterfaceStyle] == 2) {
          +[UIColor tertiarySystemFillColor];
        }
        else {
        v151 = +[UIColor whiteColor];
        }
        [v149 setBackgroundColor:v151];

        id v18 = v163;
      }
      v165[0] = MEMORY[0x1E4F143A8];
      v165[1] = 3221225472;
      v165[2] = __128__UIKeyboardImpl__presentKeyboardPopoverWithType_keyString_popoverController_textInputView_caretRect_isVerticalText_completion___block_invoke;
      v165[3] = &unk_1E52FC6F0;
      v166 = v94;
      id v167 = v19;
      v168 = self;
      int v171 = a3;
      id v169 = v149;
      v170 = v21;
      id v152 = v149;
      v153 = v94;
      [v167 presentViewController:v153 animated:1 completion:v165];
    }
    else
    {
      id v18 = v163;
      if (v21) {
        v21[2](v21);
      }
    }
  }
  else if (v21)
  {
    v21[2](v21);
  }
}

uint64_t __128__UIKeyboardImpl__presentKeyboardPopoverWithType_keyString_popoverController_textInputView_caretRect_isVerticalText_completion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) wantsDimmingView] & 1) == 0
    && (*(void *)(a1 + 40) == *(void *)(*(void *)(a1 + 48) + 568) || *(_DWORD *)(a1 + 72) != 2))
  {
    int v2 = [*(id *)(a1 + 56) dimmingView];
    [v2 removeFromSuperview];

    uint64_t v3 = [*(id *)(a1 + 56) shadowView];
    id v4 = [v3 layer];
    [v4 setAllowsHitTesting:0];
  }
  if ((*(_DWORD *)(a1 + 72) - 1) <= 1)
  {
    uint64_t v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v6 = [v5 systemInputAssistantViewController];
    [v6 setNeedsValidation];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 48) + 736) reloadCurrentKeyplane];
    }
    [*(id *)(a1 + 48) _requestInputManagerSync];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  dictationPopoverController = self->_dictationPopoverController;
  id v8 = a3;
  id v9 = [(UIViewController *)dictationPopoverController popoverPresentationController];

  if (v9 == v8)
  {
    [(UIDictationPopoverController *)self->_dictationPopoverController sourceRect];
    a4->origin.double x = v10;
    a4->origin.double y = v11;
    a4->size.CGFloat width = v12;
    a4->size.CGFloat height = v13;
  }
}

- (void)updateDictationPopoverLocationIfNeeded
{
  uint64_t v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  int v4 = [v3 hasAsyncCapableInputDelegate];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__UIKeyboardImpl_updateDictationPopoverLocationIfNeeded__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
  }
  else
  {
    dictationPopoverController = self->_dictationPopoverController;
    [(UIDictationPopoverController *)dictationPopoverController movePopoverViewToCurrentCareLocation];
  }
}

uint64_t __56__UIKeyboardImpl_updateDictationPopoverLocationIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 576) movePopoverViewToCurrentCareLocation];
}

- (void)setEditMenuFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v22[1] = *MEMORY[0x1E4F143B8];
  if (!CGRectIsEmpty(a3))
  {
LABEL_5:
    p_m_editMenuFrame = &self->m_editMenuFrame;
    self->m_editMenuFrame.origin.CGFloat x = x;
    self->m_editMenuFrame.origin.CGFloat y = y;
    self->m_editMenuFrame.size.CGFloat width = width;
    self->m_editMenuFrame.size.CGFloat height = height;
    if (+[UIKeyboard usesInputSystemUI])
    {
      CGFloat v12 = [(UIKeyboardImpl *)self remoteTextInputPartner];
      CGFloat v21 = @"editMenuFrame";
      CGFloat v13 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", p_m_editMenuFrame->origin.x, self->m_editMenuFrame.origin.y, self->m_editMenuFrame.size.width, self->m_editMenuFrame.size.height);
      v22[0] = v13;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      [v12 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_setEditMenuFrame_ withOptionalObject:v14];

      v24.origin.CGFloat x = p_m_editMenuFrame->origin.x;
      v24.origin.CGFloat y = self->m_editMenuFrame.origin.y;
      v24.size.CGFloat width = self->m_editMenuFrame.size.width;
      v24.size.CGFloat height = self->m_editMenuFrame.size.height;
      if (CGRectIsEmpty(v24)) {
        [(UIKeyboardImpl *)self updateDictationPopoverLocationIfNeeded];
      }
    }
    else
    {
      dictationPopoverController = self->_dictationPopoverController;
      double v16 = p_m_editMenuFrame->origin.x;
      double v17 = self->m_editMenuFrame.origin.y;
      double v18 = self->m_editMenuFrame.size.width;
      double v19 = self->m_editMenuFrame.size.height;
      -[UIDictationPopoverController movePopoverViewForEditMenuFrame:](dictationPopoverController, "movePopoverViewForEditMenuFrame:", v16, v17, v18, v19);
    }
    return;
  }
  id v8 = [(UIKeyboardImpl *)self candidateController];
  id v20 = [v8 loadInlineCandidateView];

  id v9 = v20;
  if (!v20 || (v10 = [v20 isHidden], id v9 = v20, v10))
  {

    goto LABEL_5;
  }
}

- (void)updateDictationPopoverLocationForCandidateInlineView:(id)a3 yOffset:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    id v18 = v6;
    if ([v6 isHidden])
    {
      -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
    else
    {
      uint64_t v7 = [(UIKeyboardImpl *)self inputDelegate];
      id v8 = [v7 textInputView];
      id v9 = [v8 keyboardSceneDelegate];
      if (v9)
      {
        int v10 = [(UIKeyboardImpl *)self inputDelegate];
        CGFloat v11 = [v10 textInputView];
        CGFloat v12 = [v11 keyboardSceneDelegate];
        CGFloat v13 = [v12 containerWindow];
      }
      else
      {
        int v10 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        CGFloat v13 = [v10 containerWindow];
      }

      double v14 = [(UIViewController *)self->_dictationPopoverController view];
      CGFloat v15 = [v14 window];

      [v18 bounds];
      objc_msgSend(v13, "convertRect:fromView:", v18);
      if (v13 != v15) {
        objc_msgSend(v13, "convertRect:toView:", v15);
      }
      -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:", v16 + 0.0, v17 + a4);
    }
    id v6 = v18;
  }
}

- (void)dismissEmojiPopoverIfNecessaryWithCompletion:(id)a3
{
}

- (void)dismissEmojiPopoverBeforeCleanup:(BOOL)a3
{
}

- (void)unsetEmojiPopoverToRestoreAfterRotation
{
  self->_emojiPopoverToRestoreAfterRotation = 0;
}

- (void)dismissAutoFillPopover
{
  if (!+[UIKeyboard useAutoFillUIRTIInterfaceForIphone])
  {
    uint64_t v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v4 = [v3 localAuthenticationObserver];

    if (([v4 localAuthenticationPresentedOrBeingRecoveredFrom] & 1) == 0 && getAFUIPanelClass()) {
      [(AFUIPanel *)self->_autoFillPanel hide];
    }
  }
}

- (void)dismissKeyboardPopover:(id)a3 beforeCleanup:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    int v10 = [v8 presentingViewController];
    if (v10)
    {
      if (v6) {
        [(UIKeyboardImpl *)self cleanupKeyboardPopover:v8];
      }
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __66__UIKeyboardImpl_dismissKeyboardPopover_beforeCleanup_completion___block_invoke;
      v11[3] = &unk_1E52DA138;
      BOOL v14 = v6;
      v11[4] = self;
      id v12 = v8;
      id v13 = v9;
      [v10 dismissViewControllerAnimated:1 completion:v11];
    }
    else
    {
      [(UIKeyboardImpl *)self cleanupKeyboardPopover:v8];
      if (v9) {
        (*((void (**)(id, void))v9 + 2))(v9, 0);
      }
    }
  }
}

uint64_t __66__UIKeyboardImpl_dismissKeyboardPopover_beforeCleanup_completion___block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) cleanupKeyboardPopover:*(void *)(a1 + 40)];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)didPresentMemojiCard
{
  emojiPopoverController = self->_emojiPopoverController;
  if (emojiPopoverController)
  {
    uint64_t v3 = [(UIViewController *)emojiPopoverController popoverPresentationController];
    id v4 = [v3 containerView];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__UIKeyboardImpl_didPresentMemojiCard__block_invoke;
    v6[3] = &unk_1E52D9F70;
    id v7 = v4;
    id v5 = v4;
    +[UIView animateWithDuration:v6 animations:0.2];
  }
}

uint64_t __38__UIKeyboardImpl_didPresentMemojiCard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (void)didDismissMemojiCard
{
  if (self->_emojiPopoverController) {
    [(UIKeyboardImpl *)self dismissEmojiPopoverBeforeCleanup:0];
  }
}

- (void)dismissCursorAccessory
{
  [(UIKeyboardImpl *)self dismissDictationPopoverAndCancelDictation];
  id v2 = +[UIInputSwitcher activeInstance];
  [v2 hideSwitcherIfNeeded];
}

- (void)setInputModeFromPreferences
{
}

- (void)prepareKeyboardInputModeFromPreferences:(id)a3
{
}

- (BOOL)hasLanguageIndicator
{
  return self->m_languageIndicator != 0;
}

- (id)languageIndicator
{
  return self->m_languageIndicator;
}

- (void)updateInputModeIndicatorOnSingleKeyOnly:(BOOL)a3 preserveIfPossible:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  self->m_showInputModeIndicator = 0;
  if (![(UIKeyboardLayout *)self->m_layout shouldShowIndicator]
    || [(UIKeyboardImpl *)self isTrackpadMode]
    || v5)
  {
    [(UIKeyboardImpl *)self clearLanguageIndicator];
  }
  else
  {
    id v7 = [(UIKeyboardLayout *)self->m_layout activationIndicatorView];
    if (!v4) {
      goto LABEL_9;
    }
    [(UIView *)self->m_languageIndicator frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v7 frame];
    v41.origin.CGFloat x = v16;
    v41.origin.CGFloat y = v17;
    v41.size.CGFloat width = v18;
    v41.size.CGFloat height = v19;
    v40.origin.CGFloat x = v9;
    v40.origin.CGFloat y = v11;
    v40.size.CGFloat width = v13;
    v40.size.CGFloat height = v15;
    if (!CGRectEqualToRect(v40, v41))
    {
LABEL_9:
      [(UIKeyboardImpl *)self clearLanguageIndicator];
      p_m_languageIndicator = &self->m_languageIndicator;
      objc_storeStrong((id *)&self->m_languageIndicator, v7);
      m_layout = self->m_layout;
      if (!m_layout) {
        m_layout = self;
      }
      dispatch_time_t v22 = *p_m_languageIndicator;
      id v23 = m_layout;
      [(UIView *)v22 setAutoresizingMask:8];
      [v23 addSubview:*p_m_languageIndicator];

      CGRect v24 = [(UIView *)*p_m_languageIndicator subviews];
      double v25 = [v24 lastObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        CGFloat v26 = *p_m_languageIndicator;

        double v25 = v26;
      }
      [(UIKeyboardLayout *)self->m_layout setHideKeysUnderIndicator:1];
      double v27 = *p_m_languageIndicator;
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke;
      v36[3] = &unk_1E52D9F98;
      id v37 = v25;
      double v38 = self;
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      CGFloat v32 = __77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke_2;
      BOOL v33 = &unk_1E52DA660;
      double v34 = v27;
      uint64_t v35 = self;
      CGFloat v28 = v27;
      id v29 = v25;
      +[UIView animateWithDuration:0 delay:v36 options:&v30 animations:0.25 completion:0.75];
      -[UIKeyboardLayout fadeActivationIndicatorWithDuration:withDelay:](self->m_layout, "fadeActivationIndicatorWithDuration:withDelay:", 0.25, 0.75, v30, v31, v32, v33);
    }
  }
}

uint64_t __77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 40) + 736);
  return [v2 setHideKeysUnderIndicator:0];
}

void *__77__UIKeyboardImpl_updateInputModeIndicatorOnSingleKeyOnly_preserveIfPossible___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v2 == result[51]) {
    return (void *)[result clearLanguageIndicator];
  }
  return result;
}

- (void)updateInputModeIndicatorOnSingleKeyOnly:(BOOL)a3
{
}

- (BOOL)shouldShowInternationalKeyIntroduction
{
  if ([(UIKeyboardLayout *)self->m_layout idiom] == 3) {
    return 0;
  }
  if (+[UIKeyboardImpl isFloating]) {
    return 0;
  }
  uint64_t v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  char v4 = [v3 isSecureTextEntry];

  if (v4) {
    return 0;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || +[UIKeyboardImpl isFloating])
  {
    BOOL v5 = [(UIKeyboardImpl *)self textInputTraits];
    unsigned int v6 = [v5 keyboardType];
    if (v6 <= 0xB && ((1 << v6) & 0x930) != 0 || v6 == 127)
    {

      return 0;
    }
  }
  id v8 = (id)UIKeyboardActiveUserSelectableInputModes;
  uint64_t v9 = [v8 count];

  double v10 = +[UIKeyboardInputModeController sharedInputModeController];
  CGFloat v11 = [v10 normalizedEnabledInputModeIdentifiers];
  int v12 = [v11 containsObject:@"emoji"];

  if (v12
    && ([(UIKeyboardImpl *)self showsDedicatedEmojiKeyAlongsideGlobeButton]
     || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
     && [(UIKeyboardImpl *)self globeKeyDisplaysAsEmojiKey]))
  {
    --v9;
  }
  return v9 > 2;
}

- (CGRect)keyboardIntroductionFrame
{
  uint64_t v3 = [(UIView *)self _rootInputWindowController];
  char v4 = [v3 bottomEdgeView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGFloat v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v14 = [v13 systemInputAssistantViewController];

  double v15 = 0.0;
  if (([v14 shouldBeShownForInputDelegate:0 inputViews:0] & 1) == 0)
  {
    CGFloat v16 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    char v17 = [v16 hidePrediction];

    if ((v17 & 1) == 0)
    {
      CGFloat v18 = [(UIView *)self traitCollection];
      [v14 preferredHeightForTraitCollection:v18];
      double v15 = v19 + 0.0;
    }
  }

  double v20 = v6;
  double v21 = v8 - v15;
  double v22 = v10 + 0.0;
  double v23 = v12 + v15;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (void)showInternationalKeyIntroductionIfNeededWithPreviousInputMode:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardImpl *)self shouldShowInternationalKeyIntroduction])
  {
    double v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v6 = [v5 preferencesActions];
    char v7 = [v6 oneTimeActionCompleted:*MEMORY[0x1E4FAEF58]];

    if ((v7 & 1) == 0)
    {
      [(UIKeyboardImpl *)self keyboardIntroductionFrame];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      CGFloat v16 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];

      if (!v16)
      {
        objc_initWeak(&location, self);
        char v17 = [UIKeyboardGlobeKeyIntroductionView alloc];
        uint64_t v23 = MEMORY[0x1E4F143A8];
        uint64_t v24 = 3221225472;
        double v25 = __80__UIKeyboardImpl_showInternationalKeyIntroductionIfNeededWithPreviousInputMode___block_invoke;
        CGFloat v26 = &unk_1E52DC308;
        objc_copyWeak(&v27, &location);
        CGFloat v18 = -[UIKeyboardGlobeKeyIntroductionView initWithFrame:completion:](v17, "initWithFrame:completion:", &v23, v9, v11, v13, v15);
        -[UIKeyboardImpl setInternationalKeyIntroductionView:](self, "setInternationalKeyIntroductionView:", v18, v23, v24, v25, v26);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }
      double v19 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];
      objc_msgSend(v19, "setFrame:", v9, v11, v13, v15);

      double v20 = [(UIView *)self _rootInputWindowController];
      double v21 = [v20 bottomEdgeView];
      double v22 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];
      [v21 addSubview:v22];
    }
  }
}

void __80__UIKeyboardImpl_showInternationalKeyIntroductionIfNeededWithPreviousInputMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained hideInternationalKeyIntroductionIfNeeded];
}

- (void)hideInternationalKeyIntroductionIfNeeded
{
  uint64_t v3 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];

  if (v3)
  {
    id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v5 = [v4 preferencesActions];
    [v5 didTriggerOneTimeAction:*MEMORY[0x1E4FAEF58]];

    double v6 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];
    [v6 removeFromSuperview];

    [(UIKeyboardImpl *)self setInternationalKeyIntroductionView:0];
  }
}

- (BOOL)shouldShowModelessInputTip
{
  int v2 = +[UIKeyboard isModelessActive];
  if (v2)
  {
    uint64_t v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v4 = [v3 preferencesActions];
    if ([v4 oneTimeActionCompleted:*MEMORY[0x1E4FAEA18]])
    {

LABEL_6:
      LOBYTE(v2) = 0;
      return v2;
    }
    double v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    int v6 = [v5 BOOLForPreferenceKey:@"DictationCommandTipsEnabled"];

    if (!v6) {
      goto LABEL_6;
    }
    char v7 = +[UIDictationController activeInstance];
    char v8 = [v7 shouldSuppressSoftwareKeyboard];

    LOBYTE(v2) = v8 ^ 1;
  }
  return v2;
}

- (void)setInputModeToNextInPreferredListWithExecutionContext:(id)a3
{
}

- (void)_updateSoundPreheating
{
  id v3 = [(UIKeyboardImpl *)self window];
  [(UIKeyboardImpl *)self _updateSoundPreheatingForWindow:v3];
}

- (void)_updateSoundPreheatingForWindow:(id)a3
{
  id v9 = a3;
  if (!v9) {
    goto LABEL_12;
  }
  id v4 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v5 = [v4 keyInputDelegate];
  if (!v5) {
    goto LABEL_11;
  }
  int v6 = (void *)v5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  if ([WeakRetained isMinimized]
    && ![(UIKeyboardImpl *)self isPredictionViewControllerVisible])
  {

LABEL_11:
    goto LABEL_12;
  }
  if (![(id)UIApp isSuspended]
    || +[UIKeyboardImpl isActivatingForeground])
  {

    goto LABEL_8;
  }
  int v8 = [v9 _isHostedInAnotherProcess];

  if (v8)
  {
LABEL_8:
    +[_UIKBFeedbackGeneratorPartner preheatSystemSoundsForObject:self];
    if (([(_UIKBFeedbackGenerating *)self->m_feedbackGenerator isActive] & 1) == 0) {
      [(_UIKBFeedbackGenerating *)self->m_feedbackGenerator activateWithCompletionBlock:0];
    }
    goto LABEL_15;
  }
LABEL_12:
  if ([(_UIKBFeedbackGenerating *)self->m_feedbackGenerator isActive]) {
    [(_UIKBFeedbackGenerating *)self->m_feedbackGenerator deactivate];
  }
  +[_UIKBFeedbackGeneratorPartner cooldownSystemSoundsForObject:self];
LABEL_15:
}

- (void)updateLayoutIfNecessary
{
  if (self->m_updatingLayout) {
    return;
  }
  id v3 = +[UIPeripheralHost activeInstance];
  id v4 = [v3 loadAwareInputViews];
  id v21 = [v4 keyboard];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = v21;
  }
  else
  {
    uint64_t v6 = +[UIKeyboard activeKeyboard];

    uint64_t v5 = (void *)v6;
  }
  id v22 = v5;
  if (v5) {
    uint64_t v7 = [v5 interfaceOrientation];
  }
  else {
    uint64_t v7 = [(UIView *)self _keyboardOrientation];
  }
  uint64_t v8 = v7;
  id v9 = [v22 window];
  if (v9)
  {
    double v10 = [v22 window];
    double v11 = [v10 _screen];
    uint64_t v12 = [v11 _userInterfaceIdiom];
  }
  else
  {
    double v10 = [(id)objc_opt_class() keyboardScreen];
    uint64_t v12 = [v10 _userInterfaceIdiom];
  }

  double v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v14 = [v13 visualModeManager];
  if (([v14 windowingModeEnabled] & 1) == 0)
  {

    int v17 = 0;
    goto LABEL_15;
  }
  double v15 = [(UIKeyboardImpl *)self window];
  CGFloat v16 = objc_opt_class();
  LODWORD(v16) = [v16 isEqual:objc_opt_class()];

  if (v16)
  {
    double v13 = [(UIKeyboardImpl *)self window];
    int v17 = [v13 sceneIsResizing];
LABEL_15:

    goto LABEL_17;
  }
  int v17 = 0;
LABEL_17:
  if (!objc_msgSend((id)objc_opt_class(), "keyboardOrientation:isEquivalentToOrientation:", v8, -[UIKeyboardLayout orientation](self->m_layout, "orientation"))|| v12 != -[UIKeyboardLayout idiom](self->m_layout, "idiom")|| objc_msgSend(v22, "isAutomatic")&& (objc_msgSend(v22, "bounds"), double v19 = v18, -[UIView bounds](self->m_layout, "bounds"), v19 != v20))
  {
    int v17 = 1;
  }
  if (v12 == 8 || !v17)
  {
    if ([(UIKeyboardImpl *)self shouldShowCandidateBar]) {
      [(UIKeyboardImpl *)self setShowsCandidateBar:1];
    }
  }
  else
  {
    [(UIKeyboardImpl *)self updateLayout];
    if ([(UIKeyboardImpl *)self showInputModeIndicator] && self->m_languageIndicator) {
      [(UIKeyboardImpl *)self updateInputModeIndicatorOnSingleKeyOnly:0];
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (_UIApplicationIsFirstPartyStickers())
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKeyboardImpl;
    -[UIView setFrame:](&v9, sel_setFrame_, x, y, width, height);
  }
  else
  {
    [(UIView *)self frame];
    v11.origin.double x = x;
    v11.origin.double y = y;
    v11.size.double width = width;
    v11.size.double height = height;
    if (!CGRectEqualToRect(v10, v11))
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __27__UIKeyboardImpl_setFrame___block_invoke;
      v8[3] = &unk_1E52DA520;
      *(double *)&v8[5] = x;
      *(double *)&v8[6] = y;
      *(double *)&v8[7] = width;
      *(double *)&v8[8] = height;
      v8[4] = self;
      +[UIView performWithoutAnimation:v8];
      if ([(UIKeyboardImpl *)self shouldUpdateLayoutAutomatically]) {
        [(UIKeyboardImpl *)self updateLayoutIfNecessary];
      }
    }
  }
}

id __27__UIKeyboardImpl_setFrame___block_invoke(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)UIKeyboardImpl;
  return objc_msgSendSuper2(&v2, sel_setFrame_, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  double v8 = CGRectGetWidth(v12);
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  double v9 = CGRectGetWidth(v13);
  v11.receiver = self;
  v11.super_class = (Class)UIKeyboardImpl;
  -[UIView setBounds:](&v11, sel_setBounds_, x, y, width, height);
  BOOL v10 = self->m_updatingLayout || v8 == v9;
  if (!v10 && width != 0.0 && height != 0.0)
  {
    if (_UIApplicationIsFirstPartyStickers()) {
      [(UIKeyboardImpl *)self updateLayoutIfNecessary];
    }
  }
}

- (void)prepareLayoutForInterfaceOrientation:(int64_t)a3
{
  if (self->m_isRotating) {
    [(UIKeyboardImpl *)self updateLayoutToCurrentInterfaceOrientation];
  }
  self->m_isRotating = 1;
  [(UIKeyboardImpl *)self hideDictationMenuIfNeeded:0];
  [(UIKeyboardImpl *)self updateDictationIgnoreKeyboardDidHideNotification];
  if (+[UIKeyboard isRedesignedTextCursorEnabled]
    && (+[UIKeyboard usesInputSystemUI]
     || !+[UIKeyboard inputUIOOP]))
  {
    [(UIKeyboardImpl *)self updateIdleDetection:8];
  }
  if ((unint64_t)(a3 - 3) < 2 != (unint64_t)([(UIKeyboardLayout *)self->m_layout orientation]- 3) < 2|| +[UIKeyboard resizable])
  {
    self->m_preRotateShift = [(_UIKeyboardStateManager *)self->_keyboardStateManager shifted];
    self->m_preRotateShiftLocked = [(_UIKeyboardStateManager *)self->_keyboardStateManager shiftLocked];
    [(UIKeyboardImpl *)self acceptHandwritingCandidate];
    [(UIKeyboardImpl *)self prepareForGeometryChange];
    if (objc_opt_respondsToSelector()) {
      [(UIKeyboardLayout *)self->m_layout willRotate:a3];
    }
    uint64_t v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];

    if (v5)
    {
      uint64_t v6 = [(UIKeyboardImpl *)self candidateController];
      if ([v6 barIsExtended])
      {
        uint64_t v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
        [v7 setUIKeyboardCandidateListDelegate:0];

        [v6 collapse];
      }
    }
    if ([(UIKeyboardImpl *)self usesCandidateSelection])
    {
      double v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
      uint64_t v9 = [v8 slottedCandidatesCount];

      if (v9) {
        [(UIKeyboardImpl *)self setCandidates:0];
      }
    }
    emojiPopoverController = self->_emojiPopoverController;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __55__UIKeyboardImpl_prepareLayoutForInterfaceOrientation___block_invoke;
    v11[3] = &unk_1E52DC3A0;
    v11[4] = self;
    [(UIKeyboardImpl *)self dismissKeyboardPopover:emojiPopoverController beforeCleanup:0 completion:v11];
    if ([(UIKeyboardImpl *)self isDictationPopoverPresented]) {
      [(UIKeyboardImpl *)self dismissDictationPopoverAndCancelDictation];
    }
    if (self->m_presentingKeyboardMenuType == 2
      && ![(UIKeyboardImpl *)self isDictationMenuPresented])
    {
      self->int m_presentingKeyboardMenuType = 0;
    }
    [(_UIKeyboardStateManager *)self->_keyboardStateManager setKeyboardDelegateStateNeedsRefresh:1];
  }
}

uint64_t __55__UIKeyboardImpl_prepareLayoutForInterfaceOrientation___block_invoke(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(result + 32) + 592) = a2;
  return result;
}

- (void)updateLayoutToCurrentInterfaceOrientation
{
  if (objc_opt_respondsToSelector()) {
    [(UIKeyboardLayout *)self->m_layout didRotate];
  }
  if (self->m_preRotateShiftLocked) {
    [(UIKeyboardImpl *)self setShiftLocked:1];
  }
  else {
    [(UIKeyboardImpl *)self setShift:self->m_preRotateShift];
  }
  [(UIKeyboardImpl *)self updateStylingTraitsIfNeeded];
  self->m_isRotating = 0;
  if (!+[UIKeyboard isRedesignedTextCursorEnabled]) {
    [(UIKeyboardImpl *)self showDictationMenuIfNeeded];
  }
  [(UIKeyboardImpl *)self syncInputManagerToKeyboardState];
}

- (BOOL)isRotating
{
  return self->m_isRotating;
}

- (void)finishLayoutToCurrentInterfaceOrientation
{
  [(UIKeyboardImpl *)self geometryChangeDone:1];
  if (self->_emojiPopoverToRestoreAfterRotation)
  {
    if ([(UIKeyboardImpl *)self isInHardwareKeyboardMode]) {
      [(UIKeyboardImpl *)self presentKeyboardPopoverWithType:0 keyString:0 completion:0];
    }
    self->_emojiPopoverToRestoreAfterRotation = 0;
  }
  if (!+[UIKeyboard isRedesignedTextCursorEnabled])
  {
    if (+[UIDictationController isRunning])
    {
      [(UIKeyboardImpl *)self presentDictationMenu];
    }
    else if (self->m_presentingKeyboardMenuType == 2)
    {
      [(UIKeyboardImpl *)self presentKeyboardMenu:2];
    }
  }
}

- (void)setCorrectionLearningAllowed:(BOOL)a3
{
}

- (void)_updateCanSuggestSupplementalItemsForCurrentSelection
{
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canSuggestSupplementalItemsForCurrentSelection];
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager keyboardState];
  [v4 setCanSuggestSupplementalItemsForCurrentSelection:v3];
}

- (void)takeTextInputTraitsFromDelegate
{
}

- (void)setLayoutRenderConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardImpl *)self activeLayout];
  [v5 setRenderConfig:v4];
}

- (void)addSupplementalLexicon:(id)a3
{
}

- (void)removeSupplementalLexicon:(id)a3
{
}

- (_UIKeyboardTextSelectionController)textSelectionController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textSelectionController];
}

- (BOOL)delegateRequiresKeyEvents
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager delegateRequiresKeyEvents];
}

- (id)_sessionIdentifier
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _sessionIdentifier];
}

- (void)_postInputResponderChangedNotification
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v4 = [v3 keyInputDelegate];
  if (v4)
  {
    uint64_t v9 = @"UITextInputResponderCapabilitiesChangedInputResponderKey";
    id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
    uint64_t v6 = [v5 keyInputDelegate];
    v10[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }

  double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"UITextInputResponderDidChangeNotification" object:0 userInfo:v7];
}

- (void)_postInputResponderCapabilitiesChangedNotificationWithOutput:(id)a3 selectionChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (v8) {
    [v5 setObject:v8 forKeyedSubscript:@"UITextInputResponderCapabilitiesChangedKeyboardOutputKey"];
  }
  uint64_t v6 = [NSNumber numberWithBool:v4];
  [v5 setObject:v6 forKeyedSubscript:@"UITextInputResponderCapabilitiesChangedSelectionDidChangeKey"];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"UITextInputResponderCapabilitiesChangedNotification" object:0 userInfo:v5];
}

- (void)postInputResponderCapabilitiesChangedNotification
{
  BOOL v3 = [(UIKeyboardImpl *)self textInteractionAssistant];
  id v7 = [v3 activeSelection];

  if (v7)
  {
    BOOL v4 = [v7 selectedRange];
    if (v4)
    {
      id v5 = [v7 selectedRange];
      if ([v5 _isRanged]) {
        uint64_t v6 = [v7 isCommitting] ^ 1;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(UIKeyboardImpl *)self _postInputResponderCapabilitiesChangedNotificationWithOutput:0 selectionChanged:v6];
}

- (id)asyncInputDelegate
{
  objc_super v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  BOOL v3 = [v2 asyncInputDelegate];

  return v3;
}

- (id)webInputDelegate
{
  objc_super v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  BOOL v3 = [v2 webInputDelegate];

  return v3;
}

- (id)asyncCapableInputDelegate
{
  objc_super v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  BOOL v3 = [v2 asyncCapableInputDelegate];

  return v3;
}

- (BOOL)hasAdvancedInputDelegate
{
  BOOL v3 = [(UIKeyboardImpl *)self inputDelegate];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UIKeyboardImpl *)self asyncInputDelegate];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (BOOL)hasAsyncCapableInputDelegate
{
  objc_super v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  char v3 = [v2 hasAsyncCapableInputDelegate];

  return v3;
}

- (void)dismissFloatingKeyboardFromPencilKitIfNeeded
{
  if (![(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboard])
  {
    +[UIAssistantBarButtonItemProvider dismissFloatingKeyboardFromPencilKitIfNeeded];
  }
}

- (void)_updateDelegateRequiresKeyEventsFromRemoteTextInput
{
}

- (void)setDelegate:(id)a3
{
  if (self->m_initializationDone) {
    [(UIKeyboardImpl *)self setDelegate:a3 force:0];
  }
}

- (void)setDelegate:(id)a3 force:(BOOL)a4
{
}

- (void)updateDictationButtonForDelegate:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(UIView *)self _rootInputWindowController];
  id v5 = [v4 placement];
  if ([v5 isFloatingAssistantView])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_5;
    }
    BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v5 = [v4 systemInputAssistantViewController];
    [v5 setInputAssistantButtonItemsForResponder:v7];
  }

LABEL_5:
}

- (id)didTeardownExistingDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager didTeardownExistingDelegate];
}

- (void)setDidTeardownExistingDelegate:(id)a3
{
}

- (id)willSetupNewDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager willSetupNewDelegate];
}

- (void)setWillSetupNewDelegate:(id)a3
{
}

- (BOOL)isSettingDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isSettingDelegate];
}

- (void)prewarmEmojiKeyboardIfNeeded
{
  char v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [v3 normalizedEnabledInputModeIdentifiers];
  int v5 = [v4 containsObject:@"emoji"];

  if (v5 && !self->_emojiKeyboardPrewarmingAssertion)
  {
    id v8 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    uint64_t v6 = [v8 vendEmojiKeyboardPrewarmingAssertionForReason:@"Emoji keyboard"];
    emojiKeyboardPrewarmingAssertion = self->_emojiKeyboardPrewarmingAssertion;
    self->_emojiKeyboardPrewarmingAssertion = v6;
  }
}

- (void)releaseEmojiKeyboardPrewarmingAssertion
{
  emojiKeyboardPrewarmingAssertion = self->_emojiKeyboardPrewarmingAssertion;
  if (emojiKeyboardPrewarmingAssertion)
  {
    [(_UIAssertion *)emojiKeyboardPrewarmingAssertion _invalidate];
    BOOL v4 = self->_emojiKeyboardPrewarmingAssertion;
    self->_emojiKeyboardPrewarmingAssertion = 0;
  }
}

- (void)keyboardSceneDelegate:(id)a3 startedPinningInputViewsOnBehalfOfResponder:(id)a4
{
}

- (void)keyboardSceneDelegate:(id)a3 stoppedPinningInputViewsOnBehalfOfResponder:(id)a4
{
}

- (BOOL)delegateSupportsImagePaste
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager delegateSupportsImagePaste];
}

- (void)setRemoteDelegateSupportsImagePaste:(BOOL)a3
{
}

- (BOOL)imageSuggestionEnabled
{
  if ([(UIKeyboardImpl *)self usesCandidateSelection])
  {
    char v3 = [(UIKeyboardImpl *)self candidateController];
    char v4 = [v3 activeCandidateViewType];

    if ((v4 & 4) != 0) {
      return 0;
    }
  }
  return [(UIKeyboardImpl *)self delegateSupportsImagePaste];
}

- (void)flushDelayedTasks
{
}

- (BOOL)delegateSupportsCorrectionUI
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager delegateSupportsCorrectionUI];
}

- (void)setAutocorrectSpellingEnabled:(BOOL)a3
{
}

- (BOOL)autocorrectSpellingEnabled
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager autocorrectSpellingEnabled];
}

- (void)textWillChange:(id)a3
{
}

- (void)textChanged:(id)a3
{
}

- (void)textSuggestionDidChange:(id)a3
{
  id v4 = a3;
  if (qword_1EB259FC0 != -1) {
    dispatch_once(&qword_1EB259FC0, &__block_literal_global_373_0);
  }
  int v5 = [(UIKeyboardImpl *)self taskQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__UIKeyboardImpl_textSuggestionDidChange___block_invoke_3;
  v8[3] = &unk_1E52E3628;
  v8[4] = self;
  id v9 = v4;
  uint64_t v6 = qword_1EB259FB8;
  id v7 = v4;
  [v5 addTask:v8 breadcrumb:v6];
}

void __42__UIKeyboardImpl_textSuggestionDidChange___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_376 copy];
  id v1 = (void *)qword_1EB259FB8;
  qword_1EB259FB8 = v0;
}

uint64_t __42__UIKeyboardImpl_textSuggestionDidChange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __42__UIKeyboardImpl_textSuggestionDidChange___block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  [v2 textDidChange:v3];
  [v4 returnExecutionToParent];
}

- (void)textDidChange:(id)a3
{
}

- (void)setDefaultTextInputTraits:(id)a3
{
}

- (void)setOverrideTextInputTraits:(id)a3
{
}

- (void)enable
{
}

- (BOOL)predictionFromPreference
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager predictionFromPreference];
}

- (id)textSuggestions
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textSuggestions];
}

- (void)setSuggestions:(id)a3
{
}

- (void)insertCustomTextSuggestion:(id)a3
{
}

- (void)insertSticker:(id)a3
{
}

- (void)insertAdaptiveImageGlyph:(id)a3
{
}

- (void)insertEmojiImageTextAttachment:(id)a3
{
}

- (void)handleWebViewCredentialsSaveForWebsiteURL:(id)a3 user:(id)a4 password:(id)a5 passwordIsAutoGenerated:(BOOL)a6
{
}

- (id)keyplaneView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [(UIKeyboardLayout *)self->m_layout currentKeyplaneView];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (void)prepareForFloatingTransition:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3 && [(UIKeyboardImpl *)self isUsingDictationLayout])
  {
    int v5 = +[UIDictationView sharedInstance];
    uint64_t v6 = +[UIDictationController sharedInstance];
    objc_msgSend(v5, "setState:", objc_msgSend(v6, "state"));
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIKeyboardLayout *)self->m_layout prepareForFloatingTransition:v3];
  }
  if (v3)
  {
    [(UIKeyboardImpl *)self clearLanguageIndicator];
  }
  else
  {
    [(UIKeyboardImpl *)self forceShiftUpdate];
    [(UIKeyboardImpl *)self setCaretBlinks:1];
  }
}

- (BOOL)isTrackpadMode
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  m_layout = self->m_layout;
  return [(UIKeyboardLayout *)m_layout isTrackpadMode];
}

- (void)updateAssistantView
{
  if (![(UIKeyboardImpl *)self suppressUpdateAssistantView])
  {
    id v3 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v3 setUpdateAssistantView:1];
    [(UIKeyboardImpl *)self _didChangeKeyplaneWithContext:v3];
  }
}

- (BOOL)isSyncingDictationLanguageForInputModeSwitch
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager syncingDictationLanguageForInputModeSwitch];
}

- (void)adjustCapsLockDelayOverride
{
}

- (void)removeCapsLockDelayOverride
{
}

- (BOOL)hasCursorAssertion
{
  objc_super v2 = [(UIKeyboardImpl *)self cursorAssertion];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)assertCursorForForSelectionChange
{
  id v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager _activeAssertionController];
  BOOL v3 = [v4 nonBlinkingAssertionWithReason:@"UIKeyboardImpl selection change"];
  [(UIKeyboardImpl *)self setCursorAssertion:v3];
}

- (void)clearCursorAssertion
{
  BOOL v3 = [(UIKeyboardImpl *)self cursorAssertion];

  if (v3)
  {
    id v4 = [(UIKeyboardImpl *)self cursorAssertion];
    [v4 invalidate];

    [(UIKeyboardImpl *)self setCursorAssertion:0];
  }
}

- (void)clearCursorAccessory
{
  BOOL v3 = [(UIKeyboardImpl *)self capslockAssertion];
  [v3 invalidate];

  [(UIKeyboardImpl *)self setCapslockAssertion:0];
  id v4 = [(UIKeyboardImpl *)self inputModeAssertion];
  [v4 invalidate];

  [(UIKeyboardImpl *)self setInputModeAssertion:0];
  [(UITextCursorAssertion *)self->m_dictationIndicatorAssertion invalidate];
  m_dictationIndicatorAssertion = self->m_dictationIndicatorAssertion;
  self->m_dictationIndicatorAssertion = 0;
}

- (void)performKeyboardOutputAsInputViewControllerOutput:(id)a3
{
}

- (id)physicalKeyboardEventWithInput:(id)a3 inputFlags:(int)a4
{
  int v5 = +[UIPhysicalKeyboardEvent _eventWithInput:a3 inputFlags:*(void *)&a4];
  objc_msgSend(v5, "setSource:", -[_UIKeyboardStateManager textInputSource](self->_keyboardStateManager, "textInputSource"));
  return v5;
}

- (void)optOutASPInTextField
{
  BOOL v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autofillController];
  [v3 didOptOutOfAutofillSignup];

  id v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autofillController];
  [v4 optOutASPInTextField];
}

- (void)performTextOperationActionSelector:(SEL)a3
{
}

- (id)documentState
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager documentState];
}

- (void)setDocumentState:(id)a3
{
}

- (void)documentStateDidChange
{
  if (getAFUIPanelClass()
    && !+[UIKeyboard useAutoFillUIRTIInterfaceForIphone])
  {
    id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager _rtiDocumentStateForAutoFillPopover];
    [(AFUIPanel *)self->_autoFillPanel documentStateChanged:v3];
  }
}

- (void)didClearText
{
}

- (BOOL)callShouldInsertText:(id)a3
{
  id v4 = a3;
  int v5 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v6 = [v5 keyInputDelegate];

  BOOL v7 = [(UIKeyboardImpl *)self callShouldInsertText:v4 onDelegate:v6];
  id v8 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v9 = [v8 keyInputDelegate];

  BOOL v10 = v6 == v9 && v7;
  return v10;
}

- (BOOL)insertTextIfShould:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardImpl *)self callShouldInsertText:v4];
  if (v5)
  {
    uint64_t v6 = [(UIKeyboardImpl *)self inputDelegateManager];
    [v6 insertText:v4];
  }
  return v5;
}

- (void)performSendAction
{
  id v2 = +[UIPhysicalKeyboardEvent _eventWithInput:@"\r" inputFlags:0];
  mach_absolute_time();
  objc_msgSend(v2, "_setHIDEvent:keyboard:", IOHIDEventCreateKeyboardEvent(), objc_msgSend((id)UIApp, "_hardwareKeyboard"));
  [(id)UIApp _handleKeyCommandForKeyboardEvent:v2 allowsRepeat:0];
}

- (BOOL)callShouldDeleteWithWordCountForRapidDelete:(int)a3 characterCountForRapidDelete:(int)a4
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager callShouldDeleteWithWordCountForRapidDelete:*(void *)&a3 characterCountForRapidDelete:*(void *)&a4];
}

- (void)textFrameChanged:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardImpl *)self inputDelegate];
  id v6 = [v5 _textSelectingContainer];

  if (v6 != v4) {
    return;
  }
  BOOL v7 = [(UIView *)self->m_autocorrectPrompt superview];
  id v8 = [(UIView *)self->m_autocorrectPrompt window];
  if (v7 == v8)
  {
    id v9 = [(UIView *)self->m_autocorrectPrompt window];
    char v10 = [v9 _isTextEffectsWindow];

    if (v10)
    {
LABEL_7:
      objc_super v11 = [(UIKeyboardImpl *)self autocorrectionController];
      CGFloat v16 = [v11 autocorrection];
      [(UIKeyboardImpl *)self updateAutocorrectPrompt:v16];

      goto LABEL_8;
    }
  }
  else
  {
  }
  objc_super v11 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
  uint64_t v12 = [v11 superview];
  if (v12)
  {
    CGRect v13 = (void *)v12;
    double v14 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    double v15 = [v14 window];

    if (!v15) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_8:

LABEL_9:
  int v17 = [(UIKeyboardImpl *)self candidateController];
  double v18 = [v17 inlineCandidateView];
  id v22 = [v18 superview];

  double v19 = v22;
  if (v22)
  {
    double v20 = +[UIPeripheralHost sharedInstance];
    id v21 = [v20 transformedContainerView];

    double v19 = v22;
    if (v22 == v21)
    {
      [(UIKeyboardImpl *)self updateTextCandidateView];
      double v19 = v22;
    }
  }
}

- (void)updateObserverState
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager changedDelegate];
  if (v3)
  {
  }
  else if (![(_UIKeyboardStateManager *)self->_keyboardStateManager shiftNeedsUpdate])
  {
    return;
  }
  if (!self->m_observer)
  {
    self->m_observer = CFRunLoopObserverCreate(0, 4uLL, 0, 0, (CFRunLoopObserverCallBack)observerCallback, 0);
    Current = CFRunLoopGetCurrent();
    m_observer = self->m_observer;
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D410];
    CFRunLoopAddObserver(Current, m_observer, v6);
  }
}

- (void)handleObserverCallback
{
  m_observer = self->m_observer;
  if (m_observer)
  {
    CFRelease(m_observer);
    self->m_observer = 0;
  }
  id v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager changedDelegate];

  if (v4) {
    [(_UIKeyboardStateManager *)self->_keyboardStateManager callChangedDelegate];
  }
  if ([(_UIKeyboardStateManager *)self->_keyboardStateManager shiftNeedsUpdate])
  {
    [(_UIKeyboardStateManager *)self->_keyboardStateManager _setShiftNeedsUpdate:0];
    [(UIKeyboardImpl *)self updateShiftState];
  }
  m_layout = self->m_layout;
  [(UIKeyboardLayout *)m_layout updateUndoKeyState];
}

- (BOOL)shouldAllowRepeatEvent:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldAllowRepeatEvent:a3];
}

- (id)_targetForResponderCommand:(SEL)a3
{
  id v4 = [(UIKeyboardImpl *)self delegateAsResponder];
  BOOL v5 = [v4 _responderForEditing];
  CFStringRef v6 = _UIResponderTargetForAction(v5, a3, 0);

  return v6;
}

- (BOOL)_canHandleResponderCommand:(SEL)a3
{
  id v4 = -[UIKeyboardImpl _targetForResponderCommand:](self, "_targetForResponderCommand:");
  LOBYTE(a3) = [v4 canPerformAction:a3 withSender:0];

  return (char)a3;
}

- (BOOL)_cancelOperation:(BOOL)a3 testOnly:(BOOL)a4
{
  if ([(UIKeyboardImpl *)self isEmojiPopoverPresented])
  {
    [(UIKeyboardImpl *)self dismissEmojiPopoverBeforeCleanup:0];
LABEL_21:
    LOBYTE(v23) = 1;
    return v23;
  }
  uint64_t v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
  if (v7)
  {
    id v8 = (void *)v7;
    BOOL v9 = [(UIKeyboardImpl *)self isPredictionViewControllerVisible];

    if (![(UIKeyboardImpl *)self liveConversionEnabled])
    {
      if (!v9)
      {
        char v10 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
        if ([v10 hasCandidates])
        {
          objc_super v11 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
          int v12 = [v11 hasCandidates];

          if (v12)
          {
            CGRect v13 = [(UIKeyboardImpl *)self keyboardState];
            double v14 = [v13 inputForMarkedText];
            uint64_t v15 = [v14 length];

            if (!v15)
            {
              [(UIKeyboardImpl *)self clearInput];
              [(UIKeyboardImpl *)self removeAutocorrectPromptAndCandidateList];
              goto LABEL_21;
            }
            CGFloat v16 = [(UIKeyboardImpl *)self _markedText];
            int v17 = [(UIKeyboardImpl *)self inputDelegateManager];
            int v18 = objc_msgSend(v17, "callShouldReplaceExtendedRange:withText:includeMarkedText:", objc_msgSend(v16, "length"), &stru_1ED0E84C0, 1);

            if (v18)
            {
              [(UIKeyboardImpl *)self clearInput];
              [(UIKeyboardImpl *)self unmarkText:&stru_1ED0E84C0];
              [(UIKeyboardImpl *)self updateReturnKey];
            }
            goto LABEL_17;
          }
        }
        else
        {
        }
      }
      goto LABEL_19;
    }
  }
  else if (![(UIKeyboardImpl *)self liveConversionEnabled])
  {
    goto LABEL_19;
  }
  double v19 = [(UIKeyboardImpl *)self keyboardState];
  double v20 = [v19 inputForMarkedText];
  uint64_t v21 = [v20 length];

  if (v21)
  {
    id v22 = [(UIKeyboardImpl *)self keyboardState];
    [v22 setUserSelectedCurrentCandidate:0];

    if (a4) {
      goto LABEL_21;
    }
    if (qword_1EB259FD0 != -1) {
      dispatch_once(&qword_1EB259FD0, &__block_literal_global_387_1);
    }
    CGFloat v16 = [(UIKeyboardImpl *)self taskQueue];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_3;
    v28[3] = &unk_1E52E34C8;
    v28[4] = self;
    [v16 performSingleTask:v28 breadcrumb:qword_1EB259FC8];
LABEL_17:

    goto LABEL_21;
  }
LABEL_19:
  if ([(UIKeyboardImpl *)self hasAutocorrectPrompt])
  {
    [(UIKeyboardImpl *)self fadeAutocorrectPrompt];
    goto LABEL_21;
  }
  if (a3
    || ([(UIKeyboardImpl *)self delegateAsResponder],
        (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    LOBYTE(v23) = 0;
  }
  else
  {
    CGFloat v26 = (void *)v25;
    BOOL v23 = [(UIKeyboardImpl *)self _canHandleResponderCommand:sel__cancelOperation_];

    if (v23 && !a4)
    {
      id v27 = [(UIKeyboardImpl *)self _targetForResponderCommand:sel__cancelOperation_];
      [v27 _cancelOperation:0];
    }
  }
  return v23;
}

void __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_389_0 copy];
  id v1 = (void *)qword_1EB259FC8;
  qword_1EB259FC8 = v0;
}

uint64_t __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4FAE328];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  [v5 setString:@"\x1B"];
  CFStringRef v6 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_4;
  v8[3] = &unk_1E52E34C8;
  v8[4] = v6;
  uint64_t v7 = [v4 childWithContinuation:v8];

  [v6 handleKeyboardInput:v5 executionContext:v7];
}

void __44__UIKeyboardImpl__cancelOperation_testOnly___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) generateCandidates];
  if ([*(id *)(a1 + 32) delayedCandidateList])
  {
    id v3 = [*(id *)(a1 + 32) candidateController];
    id v4 = [v3 inlineCandidateView];

    if (v4) {
      [*(id *)(a1 + 32) removeCandidateList];
    }
  }
  [v5 returnExecutionToParent];
}

- (BOOL)isCurrentEditResponderInEditingMode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isCurrentEditResponderInEditingMode];
}

- (BOOL)handleKeyCommand:(id)a3 repeatOkay:(BOOL *)a4 beforePublicKeyCommands:(BOOL)a5
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager handleKeyCommand:a3 repeatOkay:a4 beforePublicKeyCommands:a5];
}

- (BOOL)inputModeSwitcherVisible
{
  if (+[UIKeyboard usesInputSystemUI]) {
    return self->m_inputModeSwitcherVisible;
  }
  id v4 = +[UIInputSwitcher sharedInstance];
  char v5 = [v4 isVisible];

  return v5;
}

- (void)setInputModeSwitcherVisibleInRemote:(BOOL)a3
{
  self->m_inputModeSwitcherVisible = a3;
}

- (void)handleEmojiPopoverKeyCommand
{
}

- (void)dismissKeyboardFeedbackAssistantViewController
{
  id v3 = [(UIKeyboardImpl *)self keyboardFeedbackAssistantViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];

  [(UIKeyboardImpl *)self setKeyboardFeedbackAssistantViewController:0];
}

- (void)updateLayoutIfNeeded
{
  if (!self->m_layout) {
    [(UIKeyboardImpl *)self updateLayout];
  }
}

- (void)releaseSuppressUpdateCandidateView
{
  self->m_suppressUpdateCandidateView = 0;
}

- (void)prepareForGeometryChange
{
  [(UIKeyboardImpl *)self setGeometryIsChanging:1];
  [(UIKeyboardImpl *)self updateLayoutIfNeeded];
  [(UIKeyboardImpl *)self removeAutocorrectPrompt];
  self->m_originalOrientation = [(UIKeyboardLayout *)self->m_layout orientation];
  self->m_suppressUpdateCandidateView = 1;
  [(UIKeyboardImpl *)self performSelector:sel_releaseSuppressUpdateCandidateView withObject:0 afterDelay:0.5];
}

- (void)geometryChangeDone:(BOOL)a3
{
  self->m_suppressUpdateCandidateView = 0;
  if (!a3) {
    goto LABEL_15;
  }
  [(UIKeyboardImpl *)self clearLongPressTimer];
  if (![(UIKeyboardImpl *)self showsCandidateBar])
  {
    id v4 = [(UIKeyboardImpl *)self inputDelegateManager];
    char v5 = [v4 keyInputDelegate];

    if (!v5) {
      goto LABEL_15;
    }
  }
  [(UIKeyboardImpl *)self updateCandidateDisplay];
  if ([(UIKeyboardImpl *)self isPredictionViewControllerVisible]
    && [(_UIKeyboardStateManager *)self->_keyboardStateManager predictionType])
  {
    CFStringRef v6 = [(UIKeyboardImpl *)self autocorrectionController];
    [v6 setNeedsAutocorrection];
  }
  if ([(UIKeyboardImpl *)self usesCandidateSelection])
  {
    uint64_t v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
    if ([v7 slottedCandidatesCount])
    {

LABEL_11:
      [(UIKeyboardImpl *)self generateCandidates];
      goto LABEL_12;
    }
    id v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];

    if (!v8) {
      goto LABEL_11;
    }
  }
LABEL_12:
  int64_t m_originalOrientation = self->m_originalOrientation;
  if (m_originalOrientation == [(UIKeyboardLayout *)self->m_layout orientation]
    && (unint64_t)[(id)UIKeyboardActiveUserSelectableInputModes count] >= 2)
  {
    [(UIKeyboardImpl *)self updateInputModeIndicatorOnSingleKeyOnly:1];
  }
LABEL_15:
  [(UIKeyboardImpl *)self setGeometryIsChanging:0];
}

- (CGRect)subtractKeyboardFrameFromRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  char v10 = [(UIKeyboardImpl *)self window];

  if (v10)
  {
    objc_super v11 = +[UIPeripheralHost sharedInstance];
    int v12 = [v11 transformedContainerView];

    objc_msgSend(v12, "convertRect:fromView:", v9, x, y, width, height);
    CGFloat v14 = v13;
    double v41 = v15;
    CGFloat rect1 = v16;
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v43 = *MEMORY[0x1E4F1DB28];
    double v40 = v19;
    if (!+[UIKeyboardImpl isSplit])
    {
      double v20 = +[UIPeripheralHost sharedInstance];
      char v21 = [v20 isUndocked];

      if ((v21 & 1) == 0)
      {
        id v22 = self;
        BOOL v23 = [(UIKeyboardImpl *)v22 window];
        uint64_t v24 = [v12 window];

        if (v23 != v24)
        {
          uint64_t v25 = [v12 window];
          CGFloat v26 = [v25 rootViewController];
          id v27 = [v26 inputViewSet];
          uint64_t v28 = [v27 inputView];

          id v22 = (UIKeyboardImpl *)v28;
        }
        [(UIView *)v22 bounds];
        objc_msgSend(v12, "convertRect:fromView:", v22);
        CGFloat v42 = v30;
        CGFloat v43 = v29;
        double v17 = v31;
        CGFloat v18 = v32;
      }
    }
    double v33 = height;
    v44.origin.double x = v14;
    v44.origin.double y = v41;
    v44.size.double width = rect1;
    v44.size.double height = v40;
    v46.size.double width = v42;
    v46.origin.double x = v43;
    v46.origin.double y = v17;
    v46.size.double height = v18;
    if (CGRectIntersectsRect(v44, v46))
    {
      double v34 = v41 + v40 - v17;
      if (v34 > 0.0)
      {
        double height = height - v34;
        if (v33 - v34 < 0.0) {
          double height = 0.0;
        }
      }
    }
  }
  double v35 = x;
  double v36 = y;
  double v37 = width;
  double v38 = height;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboardImpl;
  [(UIView *)&v2 layoutSubviews];
}

- (BOOL)currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:(BOOL)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager currentKeyboardTraitsAllowCandidateBarWhileIgnoringHidePredictionTrait:a3];
}

- (BOOL)receivedCandidatesInCurrentInputMode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager receivedCandidatesInCurrentInputMode];
}

- (void)setReceivedCandidatesInCurrentInputMode:(BOOL)a3
{
}

+ (Class)layoutClassForInputMode:(id)a3 keyboardType:(int64_t)a4 screenTraits:(id)a5
{
  unsigned int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEqualToString:@"intl_HWR"])
  {
    id v9 = 0;
  }
  else
  {
    if (UIKeyboardInputModeWithTypeUsesKBStar(v7, v6)) {
      [(id)objc_opt_class() _subclassForScreenTraits:v8];
    }
    else {
    id v9 = UIKeyboardLayoutClassForInputMode(v7);
    }
  }

  return (Class)v9;
}

- (void)finishLayoutChangeWithArguments:(id)a3
{
  id v46 = a3;
  BOOL v4 = [v46 count] == 2;
  char v5 = v46;
  if (v4)
  {
    unsigned int v6 = [v46 objectAtIndex:0];
    id v7 = [v46 objectAtIndex:1];
    p_m_layout = &self->m_layout;
    id v9 = self->m_layout;
    objc_storeStrong((id *)&self->m_layout, v6);
    m_layout = self->m_layout;
    if (v9)
    {
      BOOL v4 = v9 == m_layout;
      m_layout = v9;
      if (!v4)
      {
        [(UIView *)v9 removeFromSuperview];
        m_layout = *p_m_layout;
      }
    }
    [(UIKeyboardLayout *)m_layout setSizeDelegate:self];
    [(UIView *)self addSubview:*p_m_layout];
    if (+[UIKeyboard resizable])
    {
      [(UIView *)*p_m_layout setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_super v11 = [(UIView *)*p_m_layout topAnchor];
      int v12 = [(UIView *)self topAnchor];
      double v13 = [v11 constraintEqualToAnchor:v12];
      [v13 setActive:1];

      CGFloat v14 = [(UIView *)*p_m_layout bottomAnchor];
      double v15 = [(UIView *)self bottomAnchor];
      double v16 = [v14 constraintEqualToAnchor:v15];
      [v16 setActive:1];

      double v17 = [(UIView *)*p_m_layout leadingAnchor];
      CGFloat v18 = [(UIView *)self leadingAnchor];
      double v19 = [v17 constraintEqualToAnchor:v18];
      [v19 setActive:1];

      double v20 = [(UIView *)*p_m_layout trailingAnchor];
      char v21 = [(UIView *)self trailingAnchor];
      id v22 = [v20 constraintEqualToAnchor:v21];
      [v22 setActive:1];
    }
    [(UIKeyboardImpl *)self setShouldSkipCandidateSelection:0];
    [(_UIKeyboardStateManager *)self->_keyboardStateManager setOriginalShouldSkipCandidateSelection:0];
    if (+[UIKeyboardImpl isSplit]
      && (+[UIKeyboardImpl activeInstance],
          BOOL v23 = objc_claimAutoreleasedReturnValue(),
          [v23 textInputTraits],
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          int v25 = [v24 acceptsSplitKeyboard],
          v24,
          v23,
          v25))
    {
      CGFloat v26 = [(UIKeyboardLayout *)v9 currentKeyplane];
      [v26 frameForKeylayoutName:@"split-left"];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      [v26 frameForKeylayoutName:@"split-right"];
      double v39 = +[UIKBSplitTraits traitsWithLeftFrame:rightFrame:corners:](UIKBSplitTraits, "traitsWithLeftFrame:rightFrame:corners:", -1, v28, v30, v32, v34, v35, v36, v37, v38);
    }
    else
    {
      double v39 = 0;
    }
    BOOL v40 = [(_UIKeyboardStateManager *)self->_keyboardStateManager updatingPreferences];
    double v41 = *p_m_layout;
    CGFloat v42 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    if (v40) {
      [(UIKeyboardLayout *)v41 reloadKeyboardWithInputTraits:v42 screenTraits:v7 splitTraits:v39];
    }
    else {
      [(UIKeyboardLayout *)v41 showKeyboardWithInputTraits:v42 screenTraits:v7 splitTraits:v39];
    }

    [(UIKeyboardImpl *)self updateShiftState];
    [(_UIKeyboardStateManager *)self->_keyboardStateManager _setShiftNeedsUpdate:0];
    CGFloat v43 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v43 postNotificationName:@"UIKeyboardLayoutDidChangedNotification" object:0];

    [(UIKeyboardImpl *)self callLayoutUpdateReturnKey];
    [(UIKeyboardImpl *)self hideInternationalKeyIntroductionIfNeeded];
    if ([(UIKeyboardImpl *)self floatingForced])
    {
      CGRect v44 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
      int v45 = [v44 usesContinuousPath];

      if (v45) {
        [(UIKeyboardImpl *)self performSelector:sel_presentContinuousPathIntroductionView withObject:0 afterDelay:0.0];
      }
    }

    char v5 = v46;
  }
}

- (void)updateLayout
{
  v64[2] = *MEMORY[0x1E4F143B8];
  if (self->m_initializationDone
    && !self->m_updatingLayout
    && ![(UIKeyboardImpl *)self suppressUpdateLayout])
  {
    if ([(UIKeyboardImpl *)self keyboardLayoutIsInAnotherProcess])
    {
      m_layout = self->m_layout;
      if (m_layout)
      {
        [(UIView *)m_layout removeFromSuperview];
        BOOL v4 = self->m_layout;
        self->m_layout = 0;
      }
    }
    else
    {
      self->m_updatingLayout = 1;
      objc_storeWeak((id *)&self->_activeLayout, 0);
      char v5 = UIKeyboardGetCurrentInputMode();
      unsigned int v6 = TIInputModeGetNormalizedIdentifier();
      id v7 = [(id)objc_opt_class() keyboardWindow];
      id v8 = [v7 screen];
      id v9 = +[UIKBScreenTraits traitsWithScreen:v8 orientation:[(UIView *)self _keyboardOrientation]];

      if ([v9 idiom] == 2)
      {
        char v10 = +[UIKeyboard activeKeyboard];
        if (v10)
        {
          +[UIKeyboard activeKeyboard];
          v12 = objc_super v11 = v7;
          uint64_t v13 = [v12 _useLinearLayout];

          id v7 = v11;
        }
        else
        {
          uint64_t v13 = 0;
        }

        [v9 updateForLinearLayout:v13];
      }
      else if ([v9 idiom] == 3)
      {
        CGFloat v14 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
        objc_msgSend(v9, "updateForTextInputTraits:supportedInteractionModel:", v14, -[UIKeyboardImpl requestedInteractionModel](self, "requestedInteractionModel"));
      }
      objc_msgSend(v9, "setSupportsSplit:", +[UIKeyboardImpl supportsSplit](UIKeyboardImpl, "supportsSplit"));
      objc_msgSend(v9, "setIsSplit:", +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"));
      objc_msgSend(v9, "setCenterFilled:", -[UIKeyboardImpl centerFilled](self, "centerFilled"));
      double v15 = [(UIKeyboardImpl *)self candidateController];
      int v16 = [v15 barIsExtended];

      if (v16)
      {
        double v17 = [(UIKeyboardImpl *)self candidateController];
        [v17 collapse];
      }
      CGFloat v18 = [(UIKeyboardImpl *)self candidateController];
      [v18 setScreenTraits:v9];

      [(UIKeyboardLayout *)self->m_layout clearTransientState];
      double v19 = objc_opt_class();
      double v20 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      char v21 = objc_msgSend(v19, "layoutClassForInputMode:keyboardType:screenTraits:", v6, objc_msgSend(v20, "keyboardType"), v9);

      if (v21)
      {
        double v60 = v7;
        double v62 = v5;
        double v61 = v6;
        if (![v6 isEqualToString:@"dictation"]
          || ([(UIView *)self bounds], double v23 = *MEMORY[0x1E4F1DB30], *MEMORY[0x1E4F1DB30] == v24)
          && (double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8), v23 == v22))
        {
          int v25 = +[UIKeyboard activeKeyboard];
          uint64_t v26 = [v25 interfaceOrientation];

          +[UIKeyboardImpl keyboardSizeForInterfaceOrientation:v26];
          double v28 = v27;
          double v30 = v29;
          +[UIKeyboardImpl topMarginForInterfaceOrientation:v26];
          double v32 = v30 - v31;
          int64_t v33 = [(UIView *)self _keyboardOrientation];
          double v34 = +[UIKeyboardInputModeController sharedInputModeController];
          double v35 = [v34 currentInputMode];
          +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:v33 inputMode:v35];
          self->double m_bottomPadding = v36;

          double v37 = v32 + self->m_bottomPadding;
        }
        else
        {
          [(UIView *)self bounds];
          double v28 = v38;
          double v37 = v39;
        }
        BOOL v40 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v41 = [v40 systemInputAssistantViewController];

        CGFloat v42 = [(UIView *)self traitCollection];
        [v41 preferredHeightForTraitCollection:v42];
        double v44 = v43;

        [v9 setKeyboardBarHeight:v44];
        int v45 = [(NSMutableDictionary *)self->m_keyedLayouts objectForKey:v21];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v46 = v45;
          +[UIKeyboardImpl additionalInstanceHeight];
          objc_msgSend(v46, "setFrame:", 0.0, v47, v28, v37);
        }
        else
        {
          id v46 = (id)objc_msgSend((id)objc_msgSend(v21, "alloc"), "initWithFrame:", 0.0, 0.0, v28, v37);
          double v48 = [(UIKeyboardImpl *)self taskQueue];
          [v46 setTaskQueue:v48];

          if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || _UIGetUseTwoFingerPhone())
          {
            CGFloat v49 = +[_UIKeyboardTextSelectionGestureController sharedInstance];
            id v50 = (id)[v49 addTwoFingerTextSelectionInteractionsToView:v46];
          }
          uint64_t v51 = +[_UIKeyboardTextSelectionGestureController sharedInstance];
          id v52 = (id)[v51 addOneFingerTextSelectionInteractionsToView:v46];

          [(NSMutableDictionary *)self->m_keyedLayouts setObject:v46 forKey:v21];
        }
        double v53 = self->m_layout;
        if (v53
          && [(UIKeyboardLayout *)v53 shouldFadeFromLayout]
          && [v46 shouldFadeToLayout])
        {
          id v54 = objc_alloc(MEMORY[0x1E4F28D68]);
          v64[0] = v46;
          v64[1] = v9;
          BOOL v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
          unsigned int v56 = (void *)[v54 initWithTarget:self selector:sel_finishLayoutChangeWithArguments_ object:v55];

          [(UIKeyboardLayout *)self->m_layout fadeWithInvocation:v56];
        }
        else
        {
          v63[0] = v46;
          v63[1] = v9;
          unsigned int v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:2];
          [(UIKeyboardImpl *)self finishLayoutChangeWithArguments:v56];
        }

        if (+[UIKeyboard isKeyboardProcess])
        {
          int v57 = [(UIKeyboardImpl *)self inputSystemSourceSession];
          if (v57)
          {
            double v58 = [(UIKeyboardImpl *)self buildInputSourceState];
            double v59 = [v57 textOperations];
            [v59 setInputSourceState:v58];

            [v57 flushOperations];
          }
        }
        self->m_updatingLayout = 0;

        unsigned int v6 = v61;
        char v5 = v62;
        id v7 = v60;
      }
      else
      {
        self->m_updatingLayout = 0;
      }
    }
  }
}

- (double)timestampOfLastTouchesEnded
{
  [(UIKeyboardLayout *)self->m_layout timestampOfLastTouchesEnded];
  return result;
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  BOOL v8 = a3;
  char v10 = [(UIKeyboardImpl *)self inputDelegate];
  if (v10 && !self->m_isRotating)
  {
    uint64_t v13 = [(UIKeyboardImpl *)self textInputTraits];
    char v14 = [v13 isSecureTextEntry];

    if (v14) {
      goto LABEL_7;
    }
    if ([(UIKeyboardImpl *)self usesCandidateSelection])
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        double v15 = [(UIKeyboardImpl *)self candidateController];
        char v16 = [v15 activeCandidateViewType];

        if ((v16 & 2) != 0)
        {
          double v17 = [(UIKeyboardImpl *)self candidateController];
          char v18 = [v17 barIsExtended];

          if (v18) {
            goto LABEL_7;
          }
        }
      }
    }
    if (![(UIKeyboardImpl *)self keyboardLayoutIsInAnotherProcess])
    {
      m_layout = self->m_layout;
      if (!m_layout
        || !-[UIKeyboardLayout shouldAllowSelectionGestures:atPoint:toBegin:](m_layout, "shouldAllowSelectionGestures:atPoint:toBegin:", v8, v5, x, y))
      {
LABEL_7:
        LOBYTE(v11) = 0;
        return v11;
      }
    }
    char v10 = [(UIView *)self _rootInputWindowController];
    int v11 = [v10 isTransitioningBetweenFloatingStates] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)setTwoFingerTapTimestamp:(double)a3
{
}

- (void)_updateExternalDeviceInputSetting
{
  id v3 = [(UIKeyboardImpl *)self window];
  [(UIKeyboardImpl *)self _updateExternalDeviceInputSettingForWindow:v3];
}

- (void)_updateExternalDeviceInputSettingForWindow:(id)a3
{
  if (a3)
  {
    id v6 = [a3 screen];
    BOOL v4 = [(UIKeyboardImpl *)self inputDelegateManager];
    BOOL v5 = [v4 keyInputDelegate];
    [v6 _setExternalDeviceShouldInputText:v5 != 0];
  }
  else
  {
    id v6 = [(UIKeyboardImpl *)self window];
    BOOL v4 = [v6 screen];
    [v4 _setExternalDeviceShouldInputText:0];
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  [(UIKeyboardImpl *)self _updateExternalDeviceInputSettingForWindow:v4];
  [(UIKeyboardImpl *)self _updateSoundPreheatingForWindow:v4];

  if (!v4)
  {
    [(UIKeyboardImpl *)self dismissContinuousPathIntroductionView];
    [(UIKeyboardImpl *)self dismissMultilingualKeyboardTip];
    [(UIKeyboardImpl *)self dismissMultilingualSettingTip];
    [(UIKeyboardImpl *)self dismissStickerEditor:0];
  }
}

- (void)didMoveToSuperview
{
  [(UIView *)self bounds];
  +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v3, v4);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setSplitWidthsChanged:byte_1EB259F18 != byte_1EB259F10];
  BOOL v5 = [(UIKeyboardImpl *)self textInputTraits];
  objc_msgSend(v7, "setIsSecureTextEntry:", objc_msgSend(v5, "isSecureTextEntry"));

  id v6 = [(UIView *)self superview];
  [v6 _didChangeKeyplaneWithContext:v7];

  byte_1EB259F18 = byte_1EB259F10;
}

- (void)updateInputAssistantButtonItems
{
  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  objc_super v2 = [v5 systemInputAssistantViewController];
  double v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v4 = [v3 responder];
  [v2 setInputAssistantButtonItemsForResponder:v4];
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardImpl *)self textInputTraits];
  objc_msgSend(v4, "setIsSecureTextEntry:", objc_msgSend(v5, "isSecureTextEntry"));

  if ([v4 sizeDidChange])
  {
    [v4 size];
    double v7 = v6;
    double v9 = v8;
    +[UIKeyboardImpl additionalInstanceHeight];
    double v11 = v10;
    double v12 = v9 + v10;
    [(UIView *)self bounds];
    if (v7 != v14 || v12 != v13)
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
        && ([(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits],
            double v15 = objc_claimAutoreleasedReturnValue(),
            uint64_t v16 = [v15 keyboardType],
            v15,
            v16 == 127))
      {
        -[UIKeyboardImpl setFrame:](self, "setFrame:", 0.0, 0.0, v7, v9);
      }
      else
      {
        -[UIView setFrame:](self->m_layout, "setFrame:", 0.0, v11, v7, v9);
        -[UIKeyboardImpl setFrame:](self, "setFrame:", 0.0, 0.0, v7, v12);
        if ([(UIKeyboardImpl *)self showsCandidateBar]) {
          [(UIKeyboardImpl *)self setShowsCandidateBar:1];
        }
      }
    }
    [(UIView *)self->m_layout frame];
    if (v11 != v18 || ([(UIView *)self->m_layout frame], v19 != 0.0))
    {
      double v20 = +[UIKeyboardPreferencesController sharedPreferencesController];
      char v21 = [v20 preferencesActions];
      if ([v21 currentInputModeSupportsCrescendo])
      {
      }
      else
      {
        BOOL v22 = +[UIKeyboard resizable];

        if (!v22) {
          -[UIView setFrameOrigin:](self->m_layout, "setFrameOrigin:", 0.0, v11);
        }
      }
    }
    [(UIView *)self bounds];
    objc_msgSend(v4, "setSize:", v23, v24);
    int v25 = self;
    double v17 = &v25;
  }
  else
  {
    uint64_t v26 = self;
    double v17 = &v26;
  }
  v17[1] = (UIKeyboardImpl *)UIKeyboardImpl;
  objc_msgSendSuper2((objc_super *)v17, sel__didChangeKeyplaneWithContext_, v4, v25);
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardImpl *)self splitTransitionInProgress];
  if (v4)
  {
    if ([(UIKeyboardImpl *)self centerFilled])
    {
      unint64_t v6 = 0;
      goto LABEL_20;
    }
    [(UIView *)self bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    [v4 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v4);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    v39.origin.double x = v12;
    v39.origin.double y = v14;
    v39.size.double width = v16;
    v39.size.double height = v18;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.double x = v20;
    v40.origin.double y = v22;
    v40.size.double width = v24;
    v40.size.double height = v26;
    if (MaxY == CGRectGetMaxY(v40)) {
      uint64_t v28 = 12;
    }
    else {
      uint64_t v28 = 0;
    }
    if ([(UIKeyboardImpl *)self shouldShowCandidateBar]) {
      uint64_t v29 = v28;
    }
    else {
      uint64_t v29 = v28 | 3;
    }
    double v30 = [(UIKeyboardImpl *)self window];
    if (v30)
    {
    }
    else
    {
      double v32 = +[UIKeyboard activeKeyboard];

      if (v32)
      {
        int64_t v33 = +[UIPeripheralHost sharedInstance];
        uint64_t v31 = [v33 _clipCornersOfView:v4];

        goto LABEL_19;
      }
    }
    v35.receiver = self;
    v35.super_class = (Class)UIKeyboardImpl;
    uint64_t v31 = [(UIView *)&v35 _clipCornersOfView:v4];
LABEL_19:
    unint64_t v6 = v31 & v29;
    goto LABEL_20;
  }
  BOOL v7 = v5;
  v36.receiver = self;
  v36.super_class = (Class)UIKeyboardImpl;
  unint64_t v6 = [(UIView *)&v36 _clipCornersOfView:0];
  if (v7)
  {
    [(UIView *)self frame];
    double v8 = CGRectGetMaxY(v37);
    double v9 = [(UIView *)self superview];
    [v9 bounds];
    BOOL v10 = v8 == CGRectGetMaxY(v38);

    if (v10) {
      v6 |= 0xCuLL;
    }
  }
LABEL_20:

  return v6;
}

- (void)_configureMarkedTextAttributesForConversion:(id)a3 selectedRange:(_NSRange)a4 highlightRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  NSUInteger v7 = a4.length;
  NSUInteger v8 = a4.location;
  id v20 = a3;
  uint64_t v10 = [v20 length];
  double v11 = [MEMORY[0x1E4F1CA48] array];
  if (+[UIKeyboard isRedesignedTextCursorEnabled])
  {
    [v20 beginEditing];
    uint64_t v12 = *(void *)off_1E52D23E8;
    objc_msgSend(v20, "addAttribute:value:range:", *(void *)off_1E52D23E8, &unk_1ED3F53E8, 0, v10);
    if (length) {
      objc_msgSend(v20, "addAttribute:value:range:", v12, &unk_1ED3F5400, location, length);
    }
    [v11 addObject:v12];
    double v13 = [(UIKeyboardImpl *)self inputDelegateManager];
    CGFloat v14 = [v13 tintColor];

    if (v14)
    {
      uint64_t v15 = *(void *)off_1E52D23E0;
      objc_msgSend(v20, "addAttribute:value:range:", *(void *)off_1E52D23E0, v14, 0, v10);
      [v11 addObject:v15];
    }
    CGFloat v16 = v20;
    if (v7)
    {
      unint64_t v17 = [v20 length];
      CGFloat v16 = v20;
      if (v8 + v7 <= v17)
      {
        objc_msgSend(v20, "addAttribute:value:range:", @"NSMarkedTextSelectionAttributeName", MEMORY[0x1E4F1CC38], v8, v7);
        [v11 addObject:@"NSMarkedTextSelectionAttributeName"];
        CGFloat v16 = v20;
      }
    }
    [v16 endEditing];
  }
  else
  {
    uint64_t v18 = *(void *)off_1E52D1F58;
    double v19 = +[UIColor _markedTextBackgroundColor];
    objc_msgSend(v20, "addAttribute:value:range:", v18, v19, 0, v10);

    [v11 addObject:v18];
  }
  objc_msgSend(v20, "addAttribute:value:range:", 0x1ED176740, v11, 0, v10);
}

- (void)setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 searchString:(id)a6
{
  LOBYTE(v6) = 1;
  -[_UIKeyboardStateManager _setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:](self->_keyboardStateManager, "_setAttributedMarkedText:selectedRange:inputString:lastInputString:searchString:compareAttributes:", a3, a4.location, a4.length, a5, 0, a6, v6);
}

- (void)setInlineCompletionAsMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 searchString:(id)a6
{
}

- (unsigned)_setAttributedMarkedText:(id)a3 selectedRange:(_NSRange)a4 inputString:(id)a5 lastInputString:(id)a6 searchString:(id)a7 compareAttributes:(BOOL)a8
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _setAttributedMarkedText:a3 selectedRange:a4.location inputString:a4.length lastInputString:a5 searchString:a6 compareAttributes:a7];
}

- (void)clearInputForMarkedText
{
}

- (BOOL)hasEditableMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager hasEditableMarkedText];
}

- (BOOL)hasInlineCompletionAsMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager hasInlineCompletionAsMarkedText];
}

- (id)inputForMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputForMarkedText];
}

- (void)smartSelectionForTextInDocument:(id)a3 inRange:(_NSRange)a4 options:(unint64_t)a5 completion:(id)a6
{
}

- (id)markedTextOverlay
{
  m_markedTextOverladouble y = self->m_markedTextOverlay;
  if (!m_markedTextOverlay)
  {
    id v4 = [UIView alloc];
    BOOL v5 = -[UIView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    uint64_t v6 = self->m_markedTextOverlay;
    self->m_markedTextOverladouble y = v5;

    m_markedTextOverladouble y = self->m_markedTextOverlay;
  }
  return m_markedTextOverlay;
}

- (id)searchStringForMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager searchStringForMarkedText];
}

- (id)inputStringFromPhraseBoundary
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputStringFromPhraseBoundary];
}

- (BOOL)cursorIsAtEndOfMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager cursorIsAtEndOfMarkedText];
}

- (void)syncDocumentStateToInputDelegate
{
}

- (void)documentStateFromInputDelegate:(id)a3
{
}

- (void)selectionWillChange:(id)a3
{
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
}

- (void)updateForChangedSelection
{
}

- (void)selectionDidChange:(id)a3
{
}

- (void)deleteHandwritingStrokesAtIndexes:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIKeyboardLayout *)self->m_layout deleteHandwritingStrokesAtIndexes:v4];
  }
}

- (void)showSelectionCommands
{
  id v2 = [(UIKeyboardImpl *)self _editMenuAssistant];
  [v2 showSelectionCommands];
}

- (void)acceptingCandidateWithTrigger:(id)a3
{
}

- (void)changingContextWithTrigger:(id)a3
{
}

- (void)syncInputManagerToKeyboardState
{
}

- (void)setLabel:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  int v7 = [v9 isEqualToString:@"UI-Nothing"];
  m_layout = self->m_layout;
  if (v7) {
    [(UIKeyboardLayout *)m_layout restoreDefaultsForKey:v6];
  }
  else {
    [(UIKeyboardLayout *)m_layout setLabel:v9 forKey:v6];
  }
}

- (void)handleKeyboardInput:(id)a3 executionContext:(id)a4
{
}

- (void)insertDictationResult:(id)a3
{
}

- (void)handleRemoteIndirectGestureWithState:(id)a3
{
}

- (void)performKeyboardOutput:(id)a3
{
}

- (BOOL)performKeyboardEvent:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager performKeyboardEvent:a3];
}

- (void)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4
{
}

- (BOOL)performKeyboardOutput:(id)a3 checkingDelegate:(BOOL)a4 forwardToRemoteInputSource:(BOOL)a5
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager performKeyboardOutput:a3 checkingDelegate:a4 forwardToRemoteInputSource:a5];
}

- (void)generateAutocorrectionWithExecutionContext:(id)a3
{
}

- (void)_dispatchInsertionPointExitedRangeWithSupplementalCandidate
{
}

- (void)skipHitTestForTouchEvent:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v7 = a3;
    id v4 = (void *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    id v6 = [v4 arrayWithObjects:&v7 count:1];

    -[UIKeyboardImpl skipHitTestForTouchEvents:](self, "skipHitTestForTouchEvents:", v6, v7, v8);
  }
}

- (void)skipHitTestForTouchEvents:(id)a3
{
}

- (void)skipHitTestForTouchEvent:(id)a3 delayed:(BOOL)a4
{
}

- (void)performHitTestForTouchEvent:(id)a3 executionContextPassingNSNumber:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 arrayWithObjects:&v10 count:1];

  -[UIKeyboardImpl performHitTestForTouchEvents:executionContextPassingNSNumber:](self, "performHitTestForTouchEvents:executionContextPassingNSNumber:", v9, v7, v10, v11);
}

- (void)performHitTestForTouchEvents:(id)a3 executionContextPassingNSNumber:(id)a4
{
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4 executionContext:(id)a5
{
}

- (void)removeAllDynamicDictionaries
{
}

- (TIKeyboardInputManagerStub)inputManager
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManager];
}

+ (BOOL)shouldAccessInputManagerService
{
  id v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 keyboardLayoutIsInAnotherProcess];

  return v3 ^ 1;
}

- (void)releaseInputManager
{
}

- (void)releaseInputManagerIfInactive
{
  char v3 = [(UIKeyboardImpl *)self delegate];

  if (!v3)
  {
    [(UIKeyboardImpl *)self releaseInputManager];
  }
}

- (BOOL)shouldUseCarPlayModes
{
  if ([(id)UIApp _isSpringBoard]) {
    return 0;
  }
  char v3 = [(id)objc_opt_class() keyboardWindow];
  id v4 = [v3 screen];
  id v5 = +[UIKBScreenTraits traitsWithScreen:v4 orientation:0];

  BOOL v2 = [v5 idiom] == 3;
  return v2;
}

+ (id)uniqueNumberPadInputModesFromInputModes:(id)a3 forKeyboardType:(int64_t)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    int v6 = !+[UIKeyboardImpl isFloating];
  }
  else {
    LOBYTE(v6) = 0;
  }
  if (![v5 count] || (a4 > 0xB || ((1 << a4) & 0x930) == 0) && a4 != 127) {
    goto LABEL_11;
  }
  char v7 = v6 ^ 1;
  if (a4 == 127) {
    char v7 = 1;
  }
  if ((v7 & 1) == 0)
  {
LABEL_11:
    id v8 = v5;
    goto LABEL_12;
  }
  if ([v5 count] == 1)
  {
    id v10 = [v5 firstObject];
    if ([v10 isExtensionInputMode])
    {
      uint64_t v11 = +[UIKeyboardInputMode intlInputMode];
      id v8 = [v5 arrayByAddingObject:v11];
    }
    else
    {
      id v8 = v5;
    }

    goto LABEL_12;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA20] currentLocale];
  double v13 = objc_opt_new();
  v68 = (void *)v12;
  [v13 setLocale:v12];
  [v13 setNumberStyle:0];
  double v66 = v13;
  double v60 = [v13 stringFromNumber:&unk_1ED3F5418];
  uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
  double v65 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v15 = +[UIKeyboardImpl activeInstance];
  int v16 = [v15 isInHardwareKeyboardMode];

  if (v16)
  {
    BKSHIDServicesGetHardwareKeyboardLanguage();
    double v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
    double v61 = UIKeyboardGetInputModesSupportingHardwareKeyboard();
  }
  else
  {
    double v59 = &stru_1ED0E84C0;
    double v61 = (void *)MEMORY[0x1E4F1CBF0];
  }
  double v64 = (void *)v14;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  id v58 = v5;
  id v17 = v5;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v77 objects:v83 count:16];
  id obj = v17;
  if (v18)
  {
    uint64_t v19 = v18;
    int64_t v57 = a4;
    double v62 = 0;
    id v20 = 0;
    uint64_t v21 = *(void *)v78;
    CGFloat v22 = v61;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v78 != v21) {
          objc_enumerationMutation(obj);
        }
        CGFloat v24 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        if (objc_msgSend(v24, "isExtensionInputMode", v57)) {
          __74__UIKeyboardImpl_uniqueNumberPadInputModesFromInputModes_forKeyboardType___block_invoke(v24);
        }
        else {
        double v25 = [v24 identifier];
        }
        if (UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v25, v68))
        {
          if (!v20) {
            goto LABEL_34;
          }
          CGFloat v26 = +[UIKeyboardInputModeController sharedInputModeController];
          double v27 = [v26 currentInputMode];
          int v28 = [v24 isEqual:v27];

          CGFloat v22 = v61;
          if (v28)
          {
LABEL_34:
            id v29 = v24;

            id v20 = v29;
          }
        }
        if (v16)
        {
          if ([v22 count])
          {
            double v30 = [v24 normalizedIdentifier];
            int v31 = [v22 containsObject:v30];

            if (v31)
            {
              double v32 = @"Automatic";

              double v62 = v32;
            }
          }
        }
      }
      id v17 = obj;
      uint64_t v19 = [obj countByEnumeratingWithState:&v77 objects:v83 count:16];
    }
    while (v19);

    BOOL v33 = v20 == 0;
    if (v57 == 127 && v20)
    {
      int v34 = 0;
      goto LABEL_67;
    }
  }
  else
  {

    id v20 = 0;
    double v62 = 0;
    BOOL v33 = 1;
  }
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v35 = v17;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v73 objects:v82 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    char v63 = 0;
    uint64_t v38 = *(void *)v74;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v74 != v38) {
          objc_enumerationMutation(v35);
        }
        CGRect v40 = *(void **)(*((void *)&v73 + 1) + 8 * j);
        if (v40 != v20)
        {
          if ([*(id *)(*((void *)&v73 + 1) + 8 * j) isExtensionInputMode]) {
            __74__UIKeyboardImpl_uniqueNumberPadInputModesFromInputModes_forKeyboardType___block_invoke(v40);
          }
          else {
          double v41 = [v40 identifier];
          }
          CGFloat v42 = UIKeyboardInputModeGetNumericLocale(v41);
          [v66 setLocale:v42];

          double v43 = [v66 stringFromNumber:&unk_1ED3F5418];
          double v44 = v43;
          if ((v33 || ([v43 isEqualToString:v60] & 1) == 0)
            && ([v64 containsObject:v44] & 1) == 0)
          {
            [v65 addObject:v40];
            [v64 addObject:v44];
            char v63 = v63 & 1 | (([v40 isExtensionInputMode] & 1) == 0);
          }
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v73 objects:v82 count:16];
    }
    while (v37);
  }
  else
  {
    char v63 = 0;
  }

  if (v33)
  {
    id v20 = 0;
    id v5 = v58;
    int v45 = v64;
    if (v63) {
      goto LABEL_83;
    }
    goto LABEL_70;
  }
  int v34 = v63 & 1;
LABEL_67:
  if (v62)
  {
    id v46 = [v20 identifier];
    double v47 = UIKeyboardInputModeWithNewHWLayout((uint64_t)v46, v62);
    uint64_t v48 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v47];

    id v20 = (void *)v48;
  }
  id v5 = v58;
  int v45 = v64;
  [v65 insertObject:v20 atIndex:0];
  if ((v34 | [v20 isExtensionInputMode] ^ 1)) {
    goto LABEL_83;
  }
LABEL_70:
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v49 = obj;
  uint64_t v50 = [v49 countByEnumeratingWithState:&v69 objects:v81 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    char v52 = 0;
    uint64_t v53 = *(void *)v70;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v70 != v53) {
          objc_enumerationMutation(v49);
        }
        BOOL v55 = *(void **)(*((void *)&v69 + 1) + 8 * k);
        if (([v55 isExtensionInputMode] & 1) == 0)
        {
          [v65 addObject:v55];
          char v52 = 1;
        }
      }
      uint64_t v51 = [v49 countByEnumeratingWithState:&v69 objects:v81 count:16];
    }
    while (v51);

    if (v52) {
      goto LABEL_83;
    }
  }
  else
  {
  }
  unsigned int v56 = +[UIKeyboardInputMode intlInputMode];
  [v65 addObject:v56];

LABEL_83:
  id v8 = v65;

LABEL_12:
  return v8;
}

id __74__UIKeyboardImpl_uniqueNumberPadInputModesFromInputModes_forKeyboardType___block_invoke(void *a1)
{
  id v1 = [a1 primaryLanguage];
  BOOL v2 = TIGetDefaultInputModesForLanguage();
  char v3 = [v2 firstObject];

  if (!v3)
  {
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 defaultEnabledInputModesForCurrentLocale:1];
    char v3 = [v5 firstObject];
  }
  return v3;
}

- (void)recomputeActiveInputModesWithExtensions:(BOOL)a3
{
  BOOL v3 = a3;
  keyboardStateManager = self->_keyboardStateManager;
  id v5 = [(_UIKeyboardStateManager *)keyboardStateManager textInputTraits];
  -[_UIKeyboardStateManager recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:](keyboardStateManager, "recomputeActiveInputModesWithExtensions:allowNonLinguisticInputModes:", v3, [v5 acceptsInitialEmojiKeyboard]);
}

- (void)recomputeActiveInputModesWithExtensions:(BOOL)a3 allowNonLinguisticInputModes:(BOOL)a4
{
}

- (void)setRestoresToEmojiInputMode
{
}

- (void)notifyShiftState
{
}

- (void)updateShiftState
{
}

- (id)responderStylingTraitsForceEditingMask:(BOOL)a3
{
  if (a3) {
    unint64_t v4 = 6;
  }
  else {
    unint64_t v4 = [(UIKeyboardLayout *)self->m_layout textEditingKeyMask];
  }
  id v5 = [(UIKeyboardImpl *)self delegateAsResponder];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    char v7 = [(UIKeyboardImpl *)self delegateAsResponder];
    int v8 = [v7 isEditable];

    if (!v8) {
      v4 &= ~1uLL;
    }
  }
  id v9 = [(UIKeyboardImpl *)self delegateAsResponder];
  id v10 = [v9 _responderForEditing];
  uint64_t v11 = +[UIKBTextEditingTraits traitsWithResponder:v10 keyMaskFlags:v4];

  return v11;
}

- (void)updateStylingTraitsIfNeeded
{
  id v3 = [(UIKeyboardImpl *)self responderStylingTraitsForceEditingMask:0];
  [(UIKeyboardLayout *)self->m_layout setTextEditingTraits:v3];
}

- (BOOL)editingTraitsMarkedDirty
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager editingTraitsMarkedDirty];
}

- (void)setEditingTraitsMarkedDirty:(BOOL)a3
{
}

- (void)cutOperation
{
  id v3 = [(UIKeyboardImpl *)self delegateAsResponder];
  unint64_t v4 = [(UIKeyboardImpl *)self delegateAsResponder];
  int v5 = [v3 canPerformAction:sel_cut_ withSender:v4];

  if (v5)
  {
    id v7 = [(UIKeyboardImpl *)self delegateAsResponder];
    char v6 = [(UIKeyboardImpl *)self delegateAsResponder];
    [v7 cut:v6];
  }
}

- (void)copyOperation
{
  id v3 = [(UIKeyboardImpl *)self delegateAsResponder];
  unint64_t v4 = [(UIKeyboardImpl *)self delegateAsResponder];
  int v5 = [v3 canPerformAction:sel_copy_ withSender:v4];

  if (v5)
  {
    id v7 = [(UIKeyboardImpl *)self delegateAsResponder];
    char v6 = [(UIKeyboardImpl *)self delegateAsResponder];
    [v7 copy:v6];
  }
}

- (void)pasteOperation
{
  id v3 = [(UIKeyboardImpl *)self delegateAsResponder];
  unint64_t v4 = [(UIKeyboardImpl *)self delegateAsResponder];
  int v5 = [v3 canPerformAction:sel_paste_ withSender:v4];

  if (v5)
  {
    id v7 = [(UIKeyboardImpl *)self delegateAsResponder];
    char v6 = [(UIKeyboardImpl *)self delegateAsResponder];
    [v7 paste:v6];
  }
}

- (BOOL)canPasteImage
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canPasteImage];
}

- (BOOL)canInsertAdaptiveImageGlyph
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canInsertAdaptiveImageGlyph];
}

- (BOOL)canInsertEmojiImageTextAttachment
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canInsertEmojiImageTextAttachment];
}

- (BOOL)canInsertStickerAsTextInputPayload
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canInsertStickerAsTextInputPayload];
}

- (BOOL)nextInputWouldStartSentence
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager nextInputWouldStartSentence];
}

- (void)setShiftOffIfNeeded
{
}

- (void)toggleShift
{
  uint64_t v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager shifted] ^ 1;
  [(UIKeyboardImpl *)self setShift:v3 autoshift:0];
}

- (void)setShift:(BOOL)a3
{
}

- (void)setShift:(BOOL)a3 autoshift:(BOOL)a4
{
}

- (void)setShiftPreventAutoshift:(BOOL)a3
{
}

- (void)setShiftNeedsUpdate
{
}

- (void)setShiftLocked:(BOOL)a3
{
}

- (void)setShiftLockedForced:(BOOL)a3
{
}

- (BOOL)isShifted
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shifted];
}

- (BOOL)isAutoShifted
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager autoshifted];
}

- (BOOL)isShiftLocked
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shiftLocked];
}

- (void)setShiftStatesNeededInDestination:(BOOL)a3 autoShifted:(BOOL)a4 shiftLocked:(BOOL)a5
{
}

- (void)updateShiftStateAfterAsyncSelectionChange
{
}

- (BOOL)shiftLockedEnabled
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shiftLockedEnabled];
}

- (BOOL)isCapsLockASCIIToggle
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isCapsLockASCIIToggle];
}

- (BOOL)isCapsLockSwitchEnabled
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isCapsLockSwitchEnabled];
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager capsLockKeyHasLanguageSwitchLabel];
}

- (void)clearShiftState
{
}

- (void)forceShiftUpdate
{
}

- (void)forceShiftUpdateIfKeyboardStateChanged
{
}

- (BOOL)shouldSkipCandidateSelection
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldSkipCandidateSelection];
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3 userInitiated:(BOOL)a4
{
}

- (UIKeyboardCandidateController)candidateController
{
  return self->m_candidateController;
}

- (UIKeyboardAutocorrectionController)autocorrectionController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager autocorrectionController];
}

- (TIKeyboardState)keyboardState
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager keyboardState];
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
}

- (void)setInputManagerState:(id)a3
{
}

- (void)updateShowCandidateBar
{
  BOOL v3 = [(UIKeyboardImpl *)self shouldShowCandidateBar];
  [(UIKeyboardImpl *)self setShowsCandidateBar:v3];
}

- (BOOL)usesCandidateSelection
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager usesCandidateSelection];
}

- (void)setUsesCandidateSelection:(BOOL)a3
{
}

- (BOOL)usesContinuousPath
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager usesContinuousPath];
}

- (BOOL)usesContinuousPathProgressiveCandidates
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager usesContinuousPathProgressiveCandidates];
}

- (void)setLayoutAllowsContinuousPath:(BOOL)a3
{
}

- (BOOL)continuousPathUnderway
{
  BOOL v2 = [(UIKeyboardImpl *)self _layout];
  char v3 = [v2 hasActiveContinuousPathInput];

  return v3;
}

- (BOOL)accessibilityUsesExtendedKeyboardPredictionsEnabled
{
  if (![(UIKeyboardImpl *)self canShowPredictionBar]
    || [(UIKeyboardImpl *)self keyboardIsKeyPad])
  {
    return 0;
  }
  unint64_t v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
  BOOL v3 = ([v4 usesCandidateSelection] & 1) == 0
    && [(_UIKeyboardStateManager *)self->_keyboardStateManager isDefaultPrediction]
    && _AXSExtendedKeyboardPredictionsEnabled() != 0;

  return v3;
}

- (BOOL)suppliesCompletions
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager suppliesCompletions];
}

- (BOOL)supportsNumberKeySelection
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager supportsNumberKeySelection];
}

- (BOOL)shouldUsePinyinStyleRowNavigation
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldUsePinyinStyleRowNavigation];
}

- (void)playDeleteKeyFeedbackIfNecessaryRepeat:(BOOL)a3 rapid:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autoDeleteTask];

  if (v7)
  {
    if ([(UIKeyboardLayout *)self->m_layout idiom] == 3)
    {
      id v8 = +[UIDevice currentDevice];
      [v8 _playSystemSound:1123];
    }
    else
    {
      [(UIKeyboardImpl *)self playDeleteKeyFeedbackRepeat:v5 rapid:v4];
    }
  }
}

- (void)playDeleteKeyFeedbackRepeat:(BOOL)a3 rapid:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(UIKeyboardLayout *)self->m_layout currentKeyplane];
  id v14 = [v7 firstCachedKeyWithName:@"Delete-Key"];

  [v14 frame];
  double MidX = CGRectGetMidX(v16);
  [v14 frame];
  double MidY = CGRectGetMidY(v17);
  id v10 = [(UIKeyboardImpl *)self textInputTraits];
  int v11 = [v10 isSecureTextEntry];

  uint64_t v12 = 4;
  if (v4) {
    uint64_t v12 = 5;
  }
  if (!v5) {
    uint64_t v12 = 3;
  }
  if (v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v12;
  }
  -[_UIKBFeedbackGenerating actionOccurred:atLocation:](self->m_feedbackGenerator, "actionOccurred:atLocation:", v13, MidX, MidY);
}

- (void)handleDeleteWithExecutionContext:(id)a3
{
}

- (void)completeDelete
{
  [(UIKeyboardImpl *)self generateCandidates];
  [(UIKeyboardImpl *)self updateCandidateDisplay];
  [(UIKeyboardImpl *)self updateReturnKey];
  [(UIKeyboardImpl *)self updateNoContentViews];
}

- (BOOL)shouldUseAdaptiveDelete
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldUseAdaptiveDelete];
}

- (void)handleDeleteWordWithExecutionContext:(id)a3
{
}

- (void)handleDelete
{
}

- (BOOL)canHandleDelete
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canHandleDelete];
}

- (void)handleClearWithInsertBeforeAdvance:(id)a3
{
}

- (void)handleClear
{
}

- (BOOL)handleTabWithShift:(BOOL)a3
{
  return [(UIKeyboardImpl *)self handleTabWithShift:a3 beforePublicKeyCommands:0 isMoveAction:0 testOnly:0];
}

- (BOOL)handleMoveResponderWithShift:(BOOL)a3
{
  return [(UIKeyboardImpl *)self handleTabWithShift:a3 beforePublicKeyCommands:0 isMoveAction:1 testOnly:0];
}

- (BOOL)handleTabWithShift:(BOOL)a3 beforePublicKeyCommands:(BOOL)a4
{
  return [(UIKeyboardImpl *)self handleTabWithShift:a3 beforePublicKeyCommands:a4 isMoveAction:0 testOnly:0];
}

- (void)becomeFirstResponderAndMakeVisible:(BOOL)a3
{
  BOOL v5 = [(UIKeyboardImpl *)self delegateAsResponder];
  id v9 = v5;
  if (a3) {
    [v5 _previousKeyResponder];
  }
  else {
  char v6 = [v5 _nextKeyResponder];
  }
  if (v6)
  {
    id v7 = [(UIKeyboardImpl *)self delegate];

    if (v6 != v7)
    {
      id v8 = [(UIKeyboardImpl *)self textInputTraits];
      [(_UIKeyboardStateManager *)self->_keyboardStateManager setTraitsForPreviousDelegate:v8];

      [v6 _becomeFirstResponderAndMakeVisible];
      [(_UIKeyboardStateManager *)self->_keyboardStateManager setTraitsForPreviousDelegate:0];
    }
  }
}

- (BOOL)handleTabWithShift:(BOOL)a3 beforePublicKeyCommands:(BOOL)a4 isMoveAction:(BOOL)a5 testOnly:(BOOL)a6
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager handleTabWithShift:a3 beforePublicKeyCommands:a4 isMoveAction:a5 testOnly:a6];
}

- (BOOL)acceptInputString:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager acceptInputString:a3];
}

- (void)setPreviousGlobeKeyEvent:(id)a3
{
}

- (void)updateKeyboardStateForReplacingText:(id)a3 withText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(UIKeyboardImpl *)self documentState];
  id v8 = [v9 documentStateAfterReplacingText:v7 withText:v6];

  [(UIKeyboardImpl *)self setDocumentState:v8];
}

- (void)updateKeyboardStateForInsertion:(id)a3
{
}

- (void)moveCursorByAmount:(int64_t)a3
{
  id v4 = [(UIKeyboardImpl *)self inputDelegateManager];
  [v4 _moveCurrentSelection:a3];
}

- (void)deleteBackwardAndNotify:(BOOL)a3
{
}

- (void)deleteBackwardAndNotifyAtEnd:(BOOL)a3 deletionCount:(unint64_t)a4 reinsertTextInLoop:(BOOL)a5
{
}

- (void)updateKeyboardStateForDeletion
{
}

- (BOOL)deleteForwardAndNotify:(BOOL)a3
{
  return [(UIKeyboardImpl *)self deleteForwardAndNotify:a3 producedByDeleteInput:0];
}

- (BOOL)deleteForwardAndNotify:(BOOL)a3 producedByDeleteInput:(BOOL)a4
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager deleteForwardAndNotify:a3 producedByDeleteInput:a4];
}

- (void)deleteBackward
{
}

- (BOOL)isCallingInputDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isCallingInputDelegate];
}

- (BOOL)_handleKeyInputMethodCommandForEvent:(id)a3 canHandleAppKeyCommand:(BOOL)a4
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _handleKeyInputMethodCommandForEvent:a3 canHandleAppKeyCommand:a4];
}

- (BOOL)handleKeyInputMethodCommandForCurrentEvent
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager handleKeyInputMethodCommandForCurrentEvent];
}

- (BOOL)handleKeyTextCommandForCurrentEvent
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager handleKeyTextCommandForCurrentEvent];
}

- (BOOL)handleKeyAppCommandForCurrentEvent
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager handleKeyAppCommandForCurrentEvent];
}

- (void)addInputString:(id)a3
{
}

- (void)addInputString:(id)a3 fromVariantKey:(BOOL)a4
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  [(UIKeyboardImpl *)self addInputString:a3 withFlags:v4];
}

- (void)addInputString:(id)a3 withFlags:(unint64_t)a4
{
}

- (void)addInputString:(id)a3 withFlags:(unint64_t)a4 withInputManagerHint:(id)a5
{
}

- (void)_addInputString:(id)a3 withFlags:(unint64_t)a4 withInputManagerHint:(id)a5 withInputSource:(int64_t)a6
{
}

- (void)syncInputManagerToAcceptedAutocorrection:(id)a3 forInput:(id)a4
{
}

- (void)insertedEmojiFromPopover:(id)a3 selectionMethod:(id)a4
{
}

- (void)insertedAccentVariantFromPopover:(id)a3
{
}

- (BOOL)showingEmojiSearch
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager showingEmojiSearch];
}

- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4
{
}

- (void)emojiSearchWillInsertEmoji:(id)a3 forSearchQuery:(id)a4 selectionMethod:(id)a5 inputType:(id)a6
{
}

- (void)updateDocumentViewsAfterKeyboardOutput:(id)a3
{
}

- (void)didChangePhraseBoundary
{
}

- (unint64_t)phraseBoundary
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager phraseBoundary];
}

- (void)adjustSegmentSize:(int64_t)a3
{
}

- (void)movePhraseBoundaryToDirection:(int64_t)a3 granularity:(int64_t)a4
{
  if ([(UIKeyboardImpl *)self hasEditableMarkedText]
    && [(UIKeyboardImpl *)self phraseBoundary] != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (qword_1EB259FE0 != -1) {
      dispatch_once(&qword_1EB259FE0, &__block_literal_global_446_0);
    }
    id v7 = [(UIKeyboardImpl *)self taskQueue];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__UIKeyboardImpl_movePhraseBoundaryToDirection_granularity___block_invoke_3;
    v8[3] = &unk_1E52E3EB0;
    v8[4] = self;
    void v8[5] = a3;
    v8[6] = a4;
    [v7 performTask:v8 breadcrumb:qword_1EB259FD8];
  }
}

void __60__UIKeyboardImpl_movePhraseBoundaryToDirection_granularity___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_448 copy];
  id v1 = (void *)qword_1EB259FD8;
  qword_1EB259FD8 = v0;
}

uint64_t __60__UIKeyboardImpl_movePhraseBoundaryToDirection_granularity___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __60__UIKeyboardImpl_movePhraseBoundaryToDirection_granularity___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) adjustPhraseBoundaryInForwardDirection:*(void *)(a1 + 40) == 0 granularity:*(unsigned int *)(a1 + 48) executionContext:a2];
}

- (void)updateLayoutAndSetShift
{
  [(UIKeyboardImpl *)self updateLayout];
  [(UIKeyboardImpl *)self setShift:1];
}

- (BOOL)nextCharacterIsWordCharacter
{
  BOOL v3 = [(UIKeyboardImpl *)self inputDelegate];
  uint64_t v4 = [v3 _characterAfterCaretSelection];

  BOOL v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
  if (v5) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    id v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
    id v8 = [NSString _stringWithUnichar:v4];
    int v9 = [v7 stringEndsWord:v8] ^ 1;
  }
  return v9;
}

- (void)collapseSelection
{
  id v2 = [(UIKeyboardImpl *)self inputDelegateManager];
  [v2 collapseSelectionAndAdjustByOffset:0];
}

- (void)completeDeleteOnceFromInputWithCharacterBefore:(unsigned int)a3
{
}

- (void)deleteFromInput
{
}

- (void)_deleteFromInputWithFlags:(unint64_t)a3
{
}

- (void)deleteFromInputWithFlags:(unint64_t)a3
{
}

- (void)undoWithKeyboardInput:(id)a3
{
}

- (void)completeDeleteFromInput
{
}

- (BOOL)_shouldAcceptAutocorrectionOnSelectionChange
{
  BOOL v3 = [(UIKeyboardImpl *)self autocorrectionController];
  if ([v3 requestedAutocorrection])
  {
    BOOL v4 = [(UIKeyboardImpl *)self _hasMarkedText];
  }
  else
  {
    BOOL v5 = [(UIKeyboardImpl *)self autocorrectionController];
    BOOL v6 = [v5 autocorrection];
    if (v6) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(UIKeyboardImpl *)self _hasMarkedText];
    }
  }
  return v4;
}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3
{
}

- (void)acceptInlineCompletionWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _UIKeyboardLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v10 = "-[UIKeyboardImpl acceptInlineCompletionWithCompletionHandler:]";
    _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "%s Initiating accept inline completion", buf, 0xCu);
  }

  [(UIKeyboardImpl *)self beginAcceptingInlineCompletionByDirectTap];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__UIKeyboardImpl_acceptInlineCompletionWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E52E45A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(UIKeyboardImpl *)self acceptAutocorrectionWithCompletionHandler:v7];
}

uint64_t __62__UIKeyboardImpl_acceptInlineCompletionWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) endAcceptingInlineCompletionByDirectTap];
  id v4 = _UIKeyboardLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[UIKeyboardImpl acceptInlineCompletionWithCompletionHandler:]_block_invoke";
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "%s Completed accept inline completion", (uint8_t *)&v6, 0xCu);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)beginAcceptingInlineCompletionByDirectTap
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v3 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v3 forwardInputDestinationEventToUIHost:sel_beginAcceptingInlineCompletionByDirectTap];
  }
  else
  {
    id v3 = [(UIKeyboardImpl *)self inlineTextCompletionController];
    [v3 setCurrentlyAcceptingInlineCompletionByDirectTap:1];
  }
}

- (void)endAcceptingInlineCompletionByDirectTap
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v3 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v3 forwardInputDestinationEventToUIHost:sel_endAcceptingInlineCompletionByDirectTap];
  }
  else
  {
    id v3 = [(UIKeyboardImpl *)self inlineTextCompletionController];
    [v3 setCurrentlyAcceptingInlineCompletionByDirectTap:0];
  }
}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3 requestedByRemoteInputDestination:(BOOL)a4
{
}

- (void)acceptAutocorrection
{
}

- (void)removeAutocorrection
{
}

- (void)acceptPredictiveInput:(id)a3
{
}

- (void)rejectAutocorrection:(id)a3
{
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
  char v3 = [v2 insertsSpaceAfterPredictiveInput];

  return v3;
}

- (void)textAccepted:(id)a3
{
}

- (void)acceptPredictiveInput:(id)a3 appendSeparator:(BOOL)a4 executionContext:(id)a5
{
}

- (void)acceptCandidate:(id)a3
{
}

- (void)acceptHandwritingCandidate
{
  if ([(UIKeyboardLayout *)self->m_layout isHandwritingPlane]) {
    id v3 = [(UIKeyboardImpl *)self acceptCurrentCandidate];
  }
}

- (id)acceptCurrentCandidate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager acceptCurrentCandidate];
}

- (id)acceptInlineCandidate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager acceptInlineCandidate];
}

- (void)acceptFirstCandidate
{
}

- (BOOL)userSelectedCurrentCandidate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager userSelectedCurrentCandidate];
}

- (void)setUserSelectedCurrentCandidate:(BOOL)a3
{
}

- (void)acceptCurrentCandidateIfSelected
{
}

- (void)showNextCandidates
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
  [v2 showCandidateInForwardDirection:1 granularity:0];
}

- (void)showPreviousCandidate
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
  [v2 showCandidateInForwardDirection:0 granularity:0];
}

- (void)showNextPage
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
  [v2 showCandidateInForwardDirection:1 granularity:2];
}

- (void)jumpToCompositions
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
    [v5 jumpToCompositions];
  }
}

- (void)revealHiddenCandidates
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
    [v5 revealHiddenCandidates];
  }
}

- (void)candidateListAcceptCandidate:(id)a3
{
}

- (void)candidateListSelectionDidChange:(id)a3
{
}

- (void)candidateListInvalidateSelection:(id)a3
{
}

- (id)candidateList
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
}

- (void)clearInput
{
}

- (void)clearInputWithCandidatesCleared:(BOOL)a3
{
}

- (void)clearRecentInput
{
  id v2 = (void *)MEMORY[0x1E4FAE3E8];
  id v5 = [(UIKeyboardImpl *)self keyboardState];
  id v3 = [v5 textInputTraits];
  char v4 = [v3 recentInputIdentifier];
  [v2 clearRecentInputForIdentifier:v4];
}

- (void)removeRecentInput:(id)a3 completionHandler:(id)a4
{
}

- (void)acceptRecentInput:(id)a3
{
}

- (void)addInputObject:(id)a3
{
}

- (void)clearAnimations
{
  id v3 = [(UIView *)self layer];
  [v3 removeAllAnimations];

  m_layout = self->m_layout;
  [(UIKeyboardLayout *)m_layout deactivateActiveKeys];
}

- (void)clearTransientState
{
  self->int m_scrolling = 0;
}

- (void)clearDelegate
{
}

- (void)deferReplaceTextActionToSystem:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIKeyboardImpl.m" lineNumber:7425 description:@"Expected argument to be of class UITextReplacement"];
  }
  [(UIKeyboardImpl *)self replaceText:v6];
}

- (void)replaceText:(id)a3
{
}

- (void)replaceRange:(id)a3 oldText:(id)a4 withText:(id)a5
{
}

- (void)scheduleReplacementsWithOptions:(unint64_t)a3
{
  id v5 = [(UIKeyboardImpl *)self inputDelegate];
  id v11 = [v5 interactionAssistant];

  id v6 = v11;
  if (v11)
  {
    [v11 scheduleReplacementsWithOptions:a3];
  }
  else
  {
    if ((a3 & 0x20) == 0) {
      goto LABEL_6;
    }
    id v7 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    uint64_t v8 = [(UIKeyboardImpl *)self inputDelegate];
    int v9 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v10 = [v9 selectedTextRange];
    [v7 showAutocorrectReplacementChoicesIfNeeded:v8 forRange:v10];
  }
  id v6 = v11;
LABEL_6:
}

- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4
{
  return [(UIKeyboardImpl *)self acceptWord:a3 firstDelete:a4 forInput:0];
}

- (BOOL)acceptWord:(id)a3 firstDelete:(unint64_t)a4 forInput:(id)a5
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager acceptWord:a3 firstDelete:a4 forInput:a5];
}

- (void)processPayloadInfo:(id)a3
{
}

- (void)setCandidateList:(id)a3
{
}

- (BOOL)displaysCandidates
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager displaysCandidates];
}

- (void)_conditionallyNotifyPredictionsAreAvailableForCandidates:(id)a3 containingProactiveTriggers:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = a3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v12, "isResponseKitCandidate", (void)v17))
        {
          uint64_t v13 = [v12 responseKitCategory];
          char v14 = [&unk_1ED3F08B0 containsObject:v13];

          if ((v14 & 1) == 0)
          {

            BOOL v4 = 1;
            goto LABEL_15;
          }
          char v9 = 1;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }

    if (v9) {
      BOOL v4 = 0;
    }
  }
  else
  {
  }
LABEL_15:
  BOOL v15 = [(UIKeyboardImpl *)self predictionFromPreference];
  if (v15) {
    BOOL v15 = [(UIKeyboardImpl *)self continuousPathUnderway];
  }
  if (v15 || v4)
  {
    CGRect v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 postNotificationName:@"UIKeyboardPredictionsAvailable" object:0];
  }
}

- (void)setCandidateDisplayIsExtended:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIKeyboardImpl *)self candidateController];
  [v4 setIsExtended:v3];
}

- (unsigned)assertIntermediateText:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager assertIntermediateText:a3];
}

- (BOOL)presentTextCompletionAsMarkedText:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager presentTextCompletionAsMarkedText:a3];
}

- (void)updateCandidateDisplay
{
  if ([(UIKeyboardImpl *)self usesCandidateSelection]
    || [(UIKeyboardImpl *)self usesAutocorrectionLists]
    && [(UIKeyboardImpl *)self isPredictionViewControllerVisible])
  {
    if (![(_UIKeyboardStateManager *)self->_keyboardStateManager needsToDeferUpdateTextCandidateView])
    {
      [(UIKeyboardImpl *)self updateTextCandidateView];
      goto LABEL_18;
    }
    BOOL v3 = [(UIKeyboardImpl *)self autocorrectPromptTask];
    int v4 = [v3 isValid];

    if (v4)
    {
      id v5 = [(UIKeyboardImpl *)self autocorrectPromptTask];
      [v5 resetTimer];
LABEL_16:

      goto LABEL_18;
    }
    id v5 = [(UIKeyboardImpl *)self taskQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__UIKeyboardImpl_updateCandidateDisplay__block_invoke;
    v13[3] = &unk_1E52E34C8;
    v13[4] = self;
    id v11 = [v5 scheduleTask:v13 timeInterval:0 repeats:0.4];
    [(UIKeyboardImpl *)self setAutocorrectPromptTask:v11];
LABEL_15:

    goto LABEL_16;
  }
  if (![(_UIKeyboardStateManager *)self->_keyboardStateManager autoDeleteOK])
  {
    [(UIKeyboardImpl *)self updateKeyboardConfigurations];
    BOOL v6 = [(UIKeyboardImpl *)self hasAutocorrectPrompt];
    uint64_t v7 = [(UIKeyboardImpl *)self inputDelegateManager];
    char v8 = [v7 hasAsyncCapableInputDelegate];

    if ((v8 & 1) != 0
      || !v6
      || ([(UIKeyboardImpl *)self autocorrectionController],
          char v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 hasAutocorrection],
          v9,
          !v10))
    {
      [(UIKeyboardImpl *)self touchAutocorrectPromptTimer];
      goto LABEL_18;
    }
    id v5 = [(UIKeyboardImpl *)self autocorrectionController];
    id v11 = [v5 autocorrection];
    [(UIKeyboardImpl *)self updateAutocorrectPrompt:v11];
    goto LABEL_15;
  }
  [(UIKeyboardImpl *)self removeAutocorrectPromptAndCandidateList];
LABEL_18:
  uint64_t v12 = [(UIKeyboardImpl *)self inlineTextCompletionController];
  [v12 updateTextCompletionDisplay];
}

void __40__UIKeyboardImpl_updateCandidateDisplay__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 updateTextCandidateView];
  [v3 returnExecutionToParent];
}

- (BOOL)canUseCandidateBarAsSupplementToInlineView
{
  id v3 = [(UIView *)self _rootInputWindowController];
  int v4 = [v3 placement];

  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v6 = [v5 visualModeManager];
  if ([v6 useVisualModeWindowed])
  {
    uint64_t v7 = [v5 visualModeManager];
    if ([v7 windowingModeEnabled]) {
      int v8 = [v4 isFloatingAssistantView];
    }
    else {
      int v8 = 0;
    }
  }
  else
  {
    int v8 = 0;
  }

  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (![(id)objc_opt_class() isFloating]
     || [v4 isFloatingAssistantView]))
  {
    char v9 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    if ([v9 autocorrectionType] == 1) {
      int v10 = 1;
    }
    else {
      int v10 = v8;
    }
    if (v10 == 1)
    {
      id v11 = [(UIKeyboardImpl *)self autocorrectionController];
      char v12 = [v11 hasAutofillCandidates];
    }
    else
    {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (void)setShowsCandidateInline:(BOOL)a3
{
  if ([(UIKeyboardImpl *)self isPredictionViewControllerVisible]
    || ([(UIKeyboardImpl *)self textInputTraits],
        id v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isSecureTextEntry],
        v5,
        v6))
  {
    self->m_showsCandidateInline = 0;
  }
  else
  {
    self->m_showsCandidateInline = a3;
    if (a3) {
      goto LABEL_5;
    }
  }
  [(UIKeyboardImpl *)self removeAutocorrectPromptAndCandidateList];
LABEL_5:
  BOOL v7 = (unint64_t)([(UIKeyboardLayout *)self->m_layout orientation] - 3) < 2;
  BOOL v8 = (unint64_t)([(UIView *)self _keyboardOrientation] - 3) < 2;
  if (self->m_layout && ((v7 ^ v8) & 1) == 0)
  {
    [(UIKeyboardImpl *)self prepareForGeometryChange];
    [(UIKeyboardImpl *)self setShowsCandidateBar:[(UIKeyboardImpl *)self shouldShowCandidateBar]];
    [(_UIKeyboardStateManager *)self->_keyboardStateManager _setCandidateList:0];
    [(UIKeyboardImpl *)self geometryChangeDone:1];
  }
}

- (BOOL)showsCandidateBar
{
  id v3 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  int v4 = [v3 rtiInputSourceState];

  if (!v4) {
    return self->m_showsCandidateBar;
  }
  id v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  int v6 = [v5 rtiInputSourceState];
  char v7 = [v6 showsCandidateBar];

  return v7;
}

- (void)candidateBarDidExtendWithGesture
{
}

- (BOOL)maximizing
{
  return self->m_maximizing;
}

- (void)layoutDidResize
{
}

- (void)responseContextDidChange
{
}

- (void)setAutocorrection:(id)a3
{
}

- (id)_supplementalCandidateIcon:(id)a3
{
  int v4 = objc_msgSend(a3, "ui_supplementalItems");
  if (![v4 count])
  {
    char v7 = 0;
    goto LABEL_9;
  }
  if ([v4 count] == 1)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    uint64_t v6 = [v5 icon];
LABEL_7:
    char v7 = (void *)v6;

    goto LABEL_9;
  }
  BOOL v8 = [(UIKeyboardImpl *)self textInputTraits];
  char v9 = [v8 supplementalLexiconAmbiguousItemIcon];

  if (v9)
  {
    id v5 = [(UIKeyboardImpl *)self textInputTraits];
    uint64_t v6 = [v5 supplementalLexiconAmbiguousItemIcon];
    goto LABEL_7;
  }
  char v7 = +[UIImage systemImageNamed:@"questionmark.circle"];
LABEL_9:

  return v7;
}

- (void)setAutocorrectionList:(id)a3
{
}

- (id)autocorrectPrompt
{
  return self->m_autocorrectPrompt;
}

- (BOOL)hasAutocorrectPrompt
{
  if (!+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    id v3 = [(UIKeyboardImpl *)self autocorrectPrompt];
    if (!v3) {
      goto LABEL_3;
    }
LABEL_5:
    BOOL v5 = 1;
    goto LABEL_6;
  }
  id v3 = [(UIKeyboardImpl *)self _textChoicesAssistant];
  if ([v3 showingAutocorrectInlinePrompt]) {
    goto LABEL_5;
  }
LABEL_3:
  int v4 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
  BOOL v5 = v4 != 0;

LABEL_6:
  return v5;
}

- (void)removeAutocorrectPrompt
{
  [(UIKeyboardImpl *)self updateKeyboardConfigurations];
  [(UIKeyboardImpl *)self clearAutocorrectPromptTimer];
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    id v3 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    [v3 updateActivePromptForCandidate:0 displayRects:0 highlightOnly:0];
  }
  int v4 = [(UIView *)self->m_autocorrectPrompt superview];

  if (v4)
  {
    [(UIView *)self->m_autocorrectPrompt removeFromSuperview];
    m_autocorrectPrompt = self->m_autocorrectPrompt;
    self->m_autocorrectPrompt = 0;
  }
  else
  {
    uint64_t v6 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    char v7 = [v6 superview];

    if (!v7) {
      return;
    }
    m_autocorrectPrompt = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    [m_autocorrectPrompt reset];
  }

  [(UIKeyboardImpl *)self sendCallbacksForPostCorrectionsRemoval];
  id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"UIKeyboardCandidateCorrectionDidChangeNotification" object:0 userInfo:0];
}

- (void)removeCandidateList
{
}

- (void)removeAutocorrectPromptAndCandidateList
{
}

- (void)removeInlineTextCompletionPrompt
{
}

- (void)removeTextChoicePromptWithUnderline
{
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    id v3 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    [v3 removeActivePromptAndUnderline];

    id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
    int v4 = [v5 selectedTextRange];
    [(UIKeyboardImpl *)self removeTextChoiceUnderlinesInRange:v4];
  }
}

- (void)removeTextChoicePrompt
{
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    id v3 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    [v3 dismissIfPresented];
  }
}

- (void)removeTextChoicePromptAndAutocorrection
{
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    [(UIKeyboardImpl *)self removeTextChoicePrompt];
  }
  else
  {
    [(UIKeyboardImpl *)self removeAutocorrection];
  }
}

- (void)removeTextChoiceUnderlines
{
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    id v3 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    [v3 removeAllUnderlines];
  }
}

- (void)removeTextChoiceUnderlinesInRange:(id)a3
{
  id v10 = a3;
  BOOL v4 = +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled];
  id v5 = v10;
  if (v10 && v4)
  {
    int v6 = [v10 isEmpty];
    char v7 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    id v8 = v7;
    if (v6)
    {
      char v9 = [v10 start];
      [v8 clearUnderlineForPosition:v9];
    }
    else
    {
      [v7 removeAllUnderlines];
    }

    id v5 = v10;
  }
}

- (void)dismissTextChoicePrompt
{
}

- (void)presentTextChoicePromptForRange:(id)a3
{
  id v5 = a3;
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v4 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v4 forwardInputDestinationEventToUIHost:sel_presentTextChoicePromptForRange_];
  }
  else
  {
    BOOL v4 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    [v4 presentIfNeededForRange:v5];
  }
}

- (void)setCandidates:(id)a3
{
}

- (BOOL)noContent
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager noContent];
}

- (int)returnKeyType
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager returnKeyType];
}

- (id)returnKeyDisplayName
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  if ([v3 emptyContentReturnKeyType] == 1)
  {
    BOOL v4 = [(UIKeyboardImpl *)self noContent];

    if (v4)
    {
      id v5 = UIKeyboardLocalizedString(@"UI-Cancel", 0, 0, 0);
      goto LABEL_6;
    }
  }
  else
  {
  }
  int v6 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  id v5 = UIKeyboardLocalizedReturnKeyName([v6 returnKeyType]);

LABEL_6:
  return v5;
}

- (int)returnKeyState
{
  return self->m_returnKeyState;
}

- (BOOL)returnKeyEnabled
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  if ([v3 keyboardType] == 122)
  {
    BOOL v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    uint64_t v5 = [v4 returnKeyType];

    if (v5 == 9) {
      return 1;
    }
  }
  else
  {
  }
  char v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  if ([v7 enablesReturnKeyAutomatically])
  {
  }
  else
  {
    id v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    char v9 = [v8 enablesReturnKeyOnNonWhiteSpaceContent];

    if ((v9 & 1) == 0)
    {
      id v10 = [(UIKeyboardImpl *)self updatedKeyBehaviors];
      uint64_t v11 = [v10 returnKeyBehavior];

      if (v11 != 9)
      {
        if (v11) {
          return 1;
        }
      }
    }
  }
  return (self->m_returnKeyState & 0xFFFFFFFD) == 0;
}

- (void)setReturnKeyEnabled:(BOOL)a3
{
  int m_returnKeyState;
  int v5;
  id v6;
  uint64_t vars8;

  m_returnKeyState = self->m_returnKeyState;
  if (a3) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 3;
  }
  self->m_returnKeyState = v5;
  [(UIKeyboardImpl *)self callLayoutUpdateReturnKey];
  if (+[UIKeyboard usesInputSystemUI]
    && self->m_returnKeyState != m_returnKeyState)
  {
    int v6 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v6 documentTraitsChanged];
  }
}

- (void)updateReturnKey
{
}

- (void)updateReturnKey:(BOOL)a3
{
  int m_returnKeyState;
  BOOL v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void v28[2];
  void v29[3];

  v29[2] = *MEMORY[0x1E4F143B8];
  if (!self->m_inDealloc)
  {
    uint64_t v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    int v6 = [v5 emptyContentReturnKeyType];

    if (v6)
    {
LABEL_28:
      [(UIKeyboardImpl *)self callLayoutUpdateReturnKey];
      v28[0] = @"UITextInputReturnKeyStateChangedDisplayStringKey";
      CGFloat v24 = [(UIKeyboardImpl *)self returnKeyDisplayName];
      v29[0] = v24;
      v28[1] = @"UITextInputReturnKeyStateChangedStateKey";
      double v25 = objc_msgSend(NSNumber, "numberWithBool:", -[UIKeyboardImpl returnKeyEnabled](self, "returnKeyEnabled"));
      v29[1] = v25;
      CGFloat v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];

      double v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v27 postNotificationName:@"UITextInputReturnKeyStateChangedNotification" object:0 userInfo:v26];

      return;
    }
    char v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    if ([v7 enablesReturnKeyAutomatically])
    {
    }
    else
    {
      id v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      int v9 = [v8 enablesReturnKeyOnNonWhiteSpaceContent];

      if (!v9)
      {
        if (self->m_returnKeyEnabledInLayout != [(UIKeyboardImpl *)self returnKeyEnabled]) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
    }
    m_returnKeyState = self->m_returnKeyState;
    uint64_t v11 = [(UIKeyboardImpl *)self noContent];
    char v12 = [(UIKeyboardImpl *)self inputDelegate];
    if (v12 && !v11)
    {
      uint64_t v13 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      char v14 = [v13 enablesReturnKeyOnNonWhiteSpaceContent];

      if (!v14 || [(UIKeyboardImpl *)self _hasMarkedText])
      {
        uint64_t v11 = 0;
LABEL_15:
        long long v18 = [(UIKeyboardImpl *)self inputDelegateManager];
        long long v19 = [v18 keyInputDelegate];
        if (v19) {
          long long v20 = v11;
        }
        else {
          long long v20 = 1;
        }

        if ((v20 & 1) == 0 && m_returnKeyState == 1 || (v20 & 1) == 0 && (m_returnKeyState | 2) == 3)
        {
          uint64_t v21 = 0;
LABEL_23:
          self->m_returnKeyState = v21;
          goto LABEL_28;
        }
        if (v11 && (m_returnKeyState | 2) == 2)
        {
          uint64_t v22 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
          double v23 = [v22 emptyContentReturnKeyType];

          if (!v23)
          {
            uint64_t v21 = 1;
            goto LABEL_23;
          }
        }
LABEL_27:
        if (!a3) {
          return;
        }
        goto LABEL_28;
      }
      char v12 = [(UIKeyboardImpl *)self inputDelegate];
      BOOL v15 = [v12 _fullText];
      CGRect v16 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      long long v17 = [v15 stringByTrimmingCharactersInSet:v16];
      uint64_t v11 = [v17 length] == 0;
    }
    goto LABEL_15;
  }
}

- (BOOL)shouldShowInternationalKey
{
  id v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [v3 currentInputMode];
  uint64_t v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:@"autofillsignup"];

  if (v6)
  {
    LOBYTE(v7) = 0;
    return v7;
  }
  if ([(id)objc_opt_class() canShowInternationalKey])
  {
    id v8 = [(UIKeyboardImpl *)self textInputTraits];
    if ([v8 isSecureTextEntry])
    {
      char HasMultipleActiveSecureInputModes = UIKeyboardHasMultipleActiveSecureInputModes();

      if ((HasMultipleActiveSecureInputModes & 1) == 0) {
        goto LABEL_11;
      }
    }
    else if ((unint64_t)[(id)UIKeyboardActiveUserSelectableInputModes count] < 2)
    {
      id v10 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      uint64_t v11 = [v10 keyboardType];

      if (v11 != 122) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    LOBYTE(v7) = 1;
    return v7;
  }
LABEL_11:
  int v7 = UIKeyboardHas10KeyChineseKeyboard();
  if (v7)
  {
    char v12 = UIKeyboardGetCurrentInputMode();
    uint64_t v13 = TIInputModeGetLanguage();
    char v14 = [v13 isEqualToString:@"zh"];

    LOBYTE(v7) = v14 ^ 1;
  }
  return v7;
}

- (BOOL)shouldShowDictationKey
{
  id v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  BOOL v4 = [v3 keyInputDelegate];

  if (!v4)
  {
    if (!+[UIKeyboard usesInputSystemUI]) {
      return 0;
    }
    char v6 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    int v7 = [v6 rtiInputSourceState];
    int v8 = [v7 showingEmojiSearch];

    if (!v8) {
      return 0;
    }
  }
  return +[UIDictationController fetchCurrentInputModeSupportsDictation];
}

- (void)_handleKeyBehavior:(unint64_t)a3 forKeyType:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v29 = v6;
  if (a3 == 1)
  {
    [(UIKeyboardLayout *)self->m_layout restoreDefaultsForKey:v6];
    [(UIKeyboardLayout *)self->m_layout setTarget:self forKey:v29];
    [(UIKeyboardLayout *)self->m_layout setAction:sel__nop forKey:v29];
  }
  else if (a3)
  {
    int v8 = (objc_class *)a3;
    if (a3 == 8)
    {
      int v9 = [v6 isEqualToString:@"_keyid_space_"];
      id v7 = v29;
      uint64_t v10 = 53;
      if (v9) {
        uint64_t v10 = 52;
      }
      int v8 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___UIKeyboardImpl__id[v10]);
    }
    [(UIKeyboardLayout *)self->m_layout setTarget:self forKey:v7];
    [(UIKeyboardLayout *)self->m_layout setLongPressAction:0 forKey:v29];
    switch((unint64_t)v8)
    {
      case 2uLL:
        BOOL v11 = [(UIKeyboardImpl *)self usesCandidateSelection];
        char v12 = UIKeyboardStringConfirmCandidate;
        if (!v11) {
          char v12 = UIKeyboardStringConfirm;
        }
        [(UIKeyboardLayout *)self->m_layout setLabel:*v12 forKey:v29];
        m_layout = self->m_layout;
        char v14 = sel_performKeyBehaviorConfirm;
        goto LABEL_25;
      case 3uLL:
        long long v17 = self->m_layout;
        long long v18 = UIKeyboardStringSelectFirstCandidate;
        goto LABEL_17;
      case 4uLL:
        long long v17 = self->m_layout;
        long long v18 = UIKeyboardStringSelectNextCandidate;
LABEL_17:
        [(UIKeyboardLayout *)v17 setLabel:*v18 forKey:v29];
        m_layout = self->m_layout;
        char v14 = sel_showNextCandidates;
        goto LABEL_25;
      case 5uLL:
        [(UIKeyboardLayout *)self->m_layout setLabel:@"UI-Confirm-Candidate" forKey:v29];
        m_layout = self->m_layout;
        char v14 = sel_performKeyBehaviorConfirmFirstCandidate;
        goto LABEL_25;
      case 6uLL:
        [(UIKeyboardLayout *)self->m_layout setLabel:@"UI-NextPage" forKey:v29];
        [(UIKeyboardLayout *)self->m_layout setAction:sel_showNextPage forKey:v29];
        [(UIKeyboardLayout *)self->m_layout setLongPressAction:sel_jumpToCompositions forKey:@"_keyid_space_"];
        break;
      case 7uLL:
        BOOL v15 = self->m_layout;
        CGRect v16 = UIKeyboardStringSpace;
        goto LABEL_21;
      case 8uLL:
        break;
      case 9uLL:
        long long v19 = self->m_layout;
        long long v20 = [(UIKeyboardImpl *)self returnKeyDisplayName];
        [(UIKeyboardLayout *)v19 setLabel:v20 forKey:v29];

        goto LABEL_23;
      case 0xAuLL:
        [(UIKeyboardLayout *)self->m_layout setLabel:@"UI-Confirm" forKey:v29];
        m_layout = self->m_layout;
        char v14 = sel_performKeyBehaviorCommitInline;
        goto LABEL_25;
      case 0xBuLL:
        uint64_t v22 = @"UI-Space";
        double v23 = [(UIKeyboardImpl *)self keyboardState];
        CGFloat v24 = [v23 layoutState];
        if (![v24 isAlphabeticPlane]) {
          goto LABEL_42;
        }
        double v25 = [(UIKeyboardImpl *)self keyboardState];
        int v26 = [v25 shiftState];

        if (v26 == 1)
        {
          double v23 = [(UIKeyboardImpl *)self keyboardState];
          int v27 = [v23 shouldOutputFullwidthSpace];
          int v28 = UIKeyboardStringHalfwidthSpace;
          if (!v27) {
            int v28 = UIKeyboardStringFullwidthSpace;
          }
          CGFloat v24 = v22;
          uint64_t v22 = *v28;
LABEL_42:
        }
        [(UIKeyboardLayout *)self->m_layout setLabel:v22 forKey:v29];
        [(UIKeyboardLayout *)self->m_layout setAction:0 forKey:v29];

        break;
      default:
        if (v8 != (objc_class *)100) {
          break;
        }
        BOOL v15 = self->m_layout;
        CGRect v16 = UIKeyboardStringZhuyinFirstTone;
LABEL_21:
        [(UIKeyboardLayout *)v15 setLabel:*v16 forKey:v29];
LABEL_23:
        m_layout = self->m_layout;
        char v14 = 0;
LABEL_25:
        [(UIKeyboardLayout *)m_layout setAction:v14 forKey:v29];
        break;
    }
    if (a3 == 8)
    {
      [(UIKeyboardLayout *)self->m_layout setAction:sel__nop forKey:v29];
    }
    else
    {
      if ([v29 isEqualToString:@"_keyid_space_"]) {
        uint64_t v21 = 480;
      }
      else {
        uint64_t v21 = 488;
      }
      *(Class *)((char *)&self->super.super.super.isa + v21) = v8;
    }
    if ([v29 isEqualToString:@"_keyid_return_"]) {
      [(UIKeyboardImpl *)self updateReturnKey:0];
    }
  }
  else
  {
    [(UIKeyboardLayout *)self->m_layout restoreDefaultsForKey:v6];
  }
}

- (void)performKeyBehaviorConfirm
{
}

- (void)performKeyBehaviorConfirmFirstCandidate
{
}

- (void)performKeyBehaviorCommitInline
{
}

- (id)_keyboardBehaviorState
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _keyboardBehaviorState];
}

- (id)updatedKeyBehaviors
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager updatedKeyBehaviors];
}

- (void)updateKeyboardConfigurations
{
}

- (UIKeyboardLayout)activeLayout
{
  id v3 = [(UIKeyboardEmojiPopoverController *)self->_emojiPopoverController layout];
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
  }
  else
  {
    id WeakRetained = (UIKeyboardLayout *)objc_loadWeakRetained((id *)&self->_activeLayout);
    m_layout = WeakRetained;
    if (!WeakRetained) {
      m_layout = self->m_layout;
    }
    uint64_t v5 = m_layout;
  }
  return v5;
}

- (BOOL)returnKeyEnabledInLayout
{
  return self->m_returnKeyEnabledInLayout;
}

- (void)callLayoutUpdateReturnKey
{
  BOOL m_returnKeyEnabledInLayout;
  id v5;
  uint64_t vars8;

  self->m_returnKeyEnabledInLayout = [(UIKeyboardImpl *)self returnKeyEnabled];
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    m_returnKeyEnabledInLayout = self->m_returnKeyEnabledInLayout;
    uint64_t v5 = [(UIKeyboardImpl *)self returnKeyDisplayName];
    [(UIKeyboardLayout *)m_layout setReturnKeyEnabled:m_returnKeyEnabledInLayout withDisplayName:v5 withType:[(UIKeyboardImpl *)self returnKeyType]];
  }
}

- (BOOL)callLayoutIsShiftKeyBeingHeld
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  m_layout = self->m_layout;
  return [(UIKeyboardLayout *)m_layout isShiftKeyBeingHeld];
}

- (void)callLayoutUpdateLocalizedKeys
{
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    [(UIKeyboardLayout *)m_layout updateLocalizedKeys:0];
  }
}

- (void)callLayoutUpdateAllLocalizedKeys
{
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    [(UIKeyboardLayout *)m_layout updateLocalizedKeys:1];
  }
}

- (void)callLayoutUpdateRecentInputs
{
  m_recentInputs = self->m_recentInputs;
  if (m_recentInputs)
  {
    self->m_recentInputs = 0;
  }
  BOOL v4 = [(UIKeyboardImpl *)self textInputTraits];
  char v5 = [v4 isSecureTextEntry];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)MEMORY[0x1E4FAE3E8];
    id v7 = [(UIKeyboardImpl *)self keyboardState];
    int v8 = [v7 textInputTraits];
    int v9 = [v8 recentInputIdentifier];
    uint64_t v10 = [v6 recentInputForIdentifier:v9];

    BOOL v11 = +[UILexicon _lexiconWithTILexicon:v10];
    char v12 = self->m_recentInputs;
    self->m_recentInputs = v11;
  }
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    char v14 = self->m_recentInputs;
    [(UIKeyboardLayout *)m_layout setRecentInputs:v14];
  }
}

- (id)inlineCandidateView
{
  id v2 = [(UIKeyboardImpl *)self candidateController];
  id v3 = [v2 inlineCandidateView];

  return v3;
}

- (id)inputOverlayContainer
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputOverlayContainer];
}

- (id)inputOverlayContainerForCandidateView:(BOOL)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputOverlayContainerForCandidateView:a3];
}

- (CGRect)correctionRect
{
  [(UIKeyboardImpl *)self getCorrectionRectIsVertical:0];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (CGRect)getCorrectionRectIsVertical:(BOOL *)a3
{
  [(_UIKeyboardStateManager *)self->_keyboardStateManager getCorrectionRectIsVertical:a3];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)updateTextCandidateView
{
  if (self->m_suppressUpdateCandidateView) {
    return;
  }
  double v3 = [(UIKeyboardImpl *)self inputDelegate];

  if (!v3) {
    return;
  }
  double v4 = [(UIKeyboardImpl *)self inputDelegateManager];
  char v5 = [v4 shouldSuppressUpdateCandidateView];

  if (v5) {
    return;
  }
  double v6 = [(UIKeyboardImpl *)self candidateController];
  int v7 = [v6 inLineCandidateViewIsHosted];

  if (v7)
  {
    [(UIKeyboardImpl *)self updateHostedInlineCandidateView];
    return;
  }
  if ([(UIKeyboardImpl *)self usesCandidateSelection]
    && [(_UIKeyboardStateManager *)self->_keyboardStateManager predictionType] == 4)
  {
    [(_UIKeyboardStateManager *)self->_keyboardStateManager setPredictionType:2];
  }
  if (![(UIKeyboardImpl *)self isPredictionViewControllerVisible])
  {
    [(UIKeyboardImpl *)self clearAutocorrectPromptTimer];
    if (![(_UIKeyboardStateManager *)self->_keyboardStateManager _isSelecting]
      || [(UIKeyboardImpl *)self hasEditableMarkedText])
    {
      unsigned __int8 v168 = 0;
      [(UIKeyboardImpl *)self getCorrectionRectIsVertical:&v168];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      uint64_t v16 = v168;
      long long v17 = [(UIKeyboardImpl *)self candidateController];
      [v17 setInlineRectIsVertical:v16];

      long long v18 = [(id)objc_opt_class() keyboardScreen];
      long long v19 = +[UIKBScreenTraits traitsWithScreen:v18 orientation:[(UIView *)self _keyboardOrientation]];

      long long v20 = [(UIKeyboardImpl *)self candidateController];
      [v20 setScreenTraits:v19];

      uint64_t v21 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
      if (!v21)
      {
        if ([(UIKeyboardImpl *)self isInHardwareKeyboardMode])
        {
          id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
          char v23 = [WeakRetained isMinimized];

          if (v23) {
            goto LABEL_21;
          }
        }
        keyboardStateManager = self->_keyboardStateManager;
        double v25 = [(UIKeyboardLayout *)self->m_layout candidateList];
        [(_UIKeyboardStateManager *)keyboardStateManager _setCandidateList:v25];

        int v26 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];

        if (!v26)
        {
LABEL_21:
          int v27 = [(UIKeyboardImpl *)self candidateController];
          char v28 = [v27 activeCandidateViewType];

          id v29 = [(UIKeyboardImpl *)self candidateController];
          double v30 = v29;
          if (v28)
          {
            double v32 = [v29 candidateKey];
          }
          else
          {
            char v31 = [v29 activeCandidateViewType];

            if ((v31 & 4) == 0) {
              goto LABEL_26;
            }
            double v30 = [(UIKeyboardImpl *)self candidateController];
            double v32 = [v30 inlineCandidateView];
          }
          BOOL v33 = v32;
          int v34 = [v32 superview];

          if (v34)
          {
LABEL_27:
            BOOL v35 = [(UIKeyboardImpl *)self shouldShowCandidateBar];
            if (![(UIKeyboardImpl *)self floatingForced]) {
              goto LABEL_30;
            }
            if ([(UIKeyboardImpl *)self _shouldSuppressAssistantBar]) {
              goto LABEL_30;
            }
            uint64_t v36 = +[UIKeyboardInputModeController sharedInputModeController];
            uint64_t v37 = [v36 currentInputMode];
            uint64_t v38 = [v37 identifier];
            int v39 = [v38 containsString:@"HWR"];

            if (v39)
            {
LABEL_30:
              CGRect v40 = [(UIKeyboardImpl *)self delegateAsResponder];
              double v41 = [v40 _responderForEditing];
              int v42 = [v41 _alwaysRequireInlineCandidateView];
            }
            else
            {
              int v42 = 1;
            }
            double v43 = [(UIKeyboardImpl *)self inputStringFromPhraseBoundary];
            int v44 = [v43 length];
            if ([(UIKeyboardImpl *)self isMinimized]
              && ![(UIKeyboardImpl *)self isPredictionViewControllerVisible]
              || ([(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList],
                  (int v45 = objc_claimAutoreleasedReturnValue()) == 0)
              && [(UIKeyboardImpl *)self showsCandidateInline]
              || (v45, v42))
            {
              int v46 = ![(UIKeyboardImpl *)self keyboardIsInPencilTextInputMode];
            }
            else
            {
              int v46 = 0;
            }
            if ((v35 | v46) == 1)
            {
              double v47 = self->_keyboardStateManager;
              uint64_t v48 = [(UIKeyboardImpl *)self candidateController];
              [(_UIKeyboardStateManager *)v47 _setCandidateList:v48];

              uint64_t v49 = 4;
              if (!v46) {
                uint64_t v49 = 0;
              }
              if (v35) {
                uint64_t v50 = v49 | 2;
              }
              else {
                uint64_t v50 = v49;
              }
              uint64_t v51 = [(UIKeyboardImpl *)self candidateController];
              [v51 setActiveCandidateViewType:v50];

              if (v35)
              {
                double v164 = v15;
                double v52 = v13;
                double v53 = v11;
                id v54 = [(UIKeyboardImpl *)self candidateController];
                BOOL v55 = [v54 loadCandidateBar];
                int v56 = [v55 isHidden];

                if (v56)
                {
                  int64_t v57 = [(UIKeyboardImpl *)self candidateController];
                  id v58 = [v57 candidateBar];
                  [v58 setHidden:0];
                }
                double v59 = v9;
                if (![(UIKeyboardImpl *)self showsCandidateBar]) {
                  [(UIKeyboardImpl *)self setShowsCandidateBar:1];
                }
                double v60 = [(UIKeyboardImpl *)self candidateController];
                double v61 = [v60 loadCandidateBar];

                [v61 frame];
                double v63 = v62;
                double v65 = v64;
                double v67 = v66;
                double v69 = v68;
                long long v70 = [(UIKeyboardImpl *)self candidateController];
                objc_msgSend(v70, "candidateBarHeightForOrientation:", -[UIKeyboardLayout orientation](self->m_layout, "orientation"));
                double v72 = v71;

                if (v69 != v72)
                {
                  long long v73 = [(UIKeyboardImpl *)self candidateController];
                  char v74 = [v73 isExtendedList];

                  if ((v74 & 1) == 0) {
                    objc_msgSend(v61, "setFrame:", v63, v65, v67, v72);
                  }
                }

                double v9 = v59;
                double v11 = v53;
                double v13 = v52;
                double v15 = v164;
              }
              else
              {
                [(UIKeyboardImpl *)self setShowsCandidateBar:0];
              }
              if (v46)
              {
                long long v78 = [(UIKeyboardImpl *)self candidateController];
                long long v79 = [v78 loadInlineCandidateView];
              }
              else
              {
                long long v79 = 0;
              }
              long long v80 = [(UIKeyboardImpl *)self candidateController];
              [v80 updateStates];

              if (v79)
              {
                int v165 = v44;
                CGFloat v81 = [(UIKeyboardImpl *)self inputOverlayContainerForCandidateView:1];
                CGFloat v82 = [(UIKeyboardImpl *)self candidateController];
                [v82 maximumSizeForInlineView];
                double v84 = v83;
                double v86 = v85;

                if (!self->m_scrolling)
                {
                  double v87 = [(UIViewController *)self->_emojiPopoverController popoverPresentationController];
                  uint64_t v88 = [v87 containerView];
                  if (v81 == (void *)v88)
                  {
                    uint64_t v92 = (uint64_t)v81;
                  }
                  else
                  {
                    double v89 = (void *)v88;
                    [v81 bounds];
                    if (v90 >= v84 && ([v81 bounds], v91 >= v86 + v86))
                    {
                      objc_opt_class();
                      char isKindOfClass = objc_opt_isKindOfClass();

                      if ((isKindOfClass & 1) == 0) {
                        goto LABEL_74;
                      }
                    }
                    else
                    {
                    }
                    double v87 = +[UIPeripheralHost sharedInstance];
                    uint64_t v92 = [v87 transformedContainerView];
                  }

                  CGFloat v81 = (void *)v92;
                }
LABEL_74:
                if ((objc_opt_respondsToSelector() & 1) == 0 || ([v79 isFloating] & 1) == 0)
                {
                  uint64_t v93 = [v79 superview];
                  if (v81 == (void *)v93)
                  {
                  }
                  else
                  {
                    id v94 = (void *)v93;
                    double v95 = [v79 superview];

                    if (v95)
                    {
                      [v79 frame];
                      double v97 = v96;
                      double v99 = v98;
                      double v101 = v100;
                      double v103 = v102;
                      double v104 = [v79 superview];
                      objc_msgSend(v81, "convertPoint:fromView:", v104, v97, v99);
                      double v106 = v105;
                      double v108 = v107;

                      objc_msgSend(v79, "setFrame:", v106, v108, v101, v103);
                      [v81 addSubview:v79];
                      id v109 = v81;
                      goto LABEL_82;
                    }
                  }
                }
                v110 = [v79 superview];

                if (!v110)
                {
                  int v44 = v165;
                  goto LABEL_84;
                }
                id v109 = [v79 superview];
LABEL_82:
                id v111 = v109;
                int v44 = v165;

                int v34 = v111;
LABEL_84:
              }
            }
            else
            {
              long long v75 = [(UIKeyboardImpl *)self dynamicCaretList];

              if (v75)
              {
                long long v76 = self->_keyboardStateManager;
                long long v77 = [(UIKeyboardImpl *)self dynamicCaretList];
                [(_UIKeyboardStateManager *)v76 _setCandidateList:v77];
              }
              else if ([(UIKeyboardImpl *)self showsCandidateBar])
              {
                [(UIKeyboardImpl *)self setShowsCandidateBar:0];
              }
            }
            double v112 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];

            if (v112)
            {
              double v113 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
              double v114 = [v113 candidates];
              uint64_t v115 = [v114 count];

              if (!v115) {
                goto LABEL_101;
              }
              CGFloat v116 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
              char v117 = [v116 hasCandidates];

              if (v117)
              {
                if (v44
                  || [(UIKeyboardImpl *)self suppliesCompletions]
                  || [(UIKeyboardImpl *)self usesAutocorrectionLists]
                  || [(_UIKeyboardStateManager *)self->_keyboardStateManager predictionType] == 2
                  || [(_UIKeyboardStateManager *)self->_keyboardStateManager predictionType] == 4)
                {
                  if (!v46
                    || (v170.origin.double x = v9,
                        v170.origin.double y = v11,
                        v170.size.double width = v13,
                        v170.size.double height = v15,
                        !CGRectIsNull(v170))
                    && v34
                    && [(UIKeyboardImpl *)self delegateSupportsCorrectionUI])
                  {
                    if ([(UIKeyboardImpl *)self geometryIsChanging])
                    {
                      v118 = [(UIKeyboardImpl *)self keyboardState];
                      id v119 = [v118 currentCandidate];
                    }
                    else
                    {
                      id v119 = 0;
                    }
                    uint64_t v122 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
                    v123 = [(UIKeyboardImpl *)self keyboardStateManager];
                    [v122 setUIKeyboardCandidateListDelegate:v123];

                    v124 = [(UIKeyboardImpl *)self inputDelegate];
                    v125 = [v124 textInputView];

                    -[UIKeyboardImpl convertRectToAutocorrectRect:delegateView:container:](self, "convertRectToAutocorrectRect:delegateView:container:", v125, v34, v9, v11, v13, v15);
                    double v127 = v126;
                    double v129 = v128;
                    double v131 = v130;
                    double v133 = v132;
                    double v134 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
                    char v135 = objc_opt_respondsToSelector();

                    if (v135)
                    {
                      uint64_t v136 = [(UIKeyboardImpl *)self promptTypeForInputString:v43];
                      [v34 bounds];
                      double v139 = v137 + v138;
                      double v140 = +[UIKeyboardImpl sharedInstance];
                      int v141 = [v140 isInHardwareKeyboardMode];

                      if (v141)
                      {
                        if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
                          && ![(UIKeyboardImpl *)self isEmojiPopoverPresented])
                        {
                          v166 = +[UIPeripheralHost sharedInstance];
                          CGFloat v142 = [v166 transformedContainerView];
                          v143 = [v142 window];
                          [v143 actualSceneBounds];
                          double v144 = CGRectGetMaxX(v171) + -15.0;

                          if (v139 >= v144) {
                            double v139 = v144;
                          }
                        }
                      }
                      uint64_t v145 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
                      v146 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
                      objc_msgSend(v145, "setCandidates:type:inlineText:inlineRect:maxX:layout:", v146, v136, v43, 1, v127, v129, v131, v133, v139);
                    }
                    else
                    {
                      uint64_t v145 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
                      v146 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
                      [v34 bounds];
                      objc_msgSend(v145, "setCandidates:inlineText:inlineRect:maxX:layout:", v146, v43, 1, v127, v129, v131, v133, v147 + v148);
                    }

                    if ([(UIKeyboardImpl *)self shouldShowLongPredictionList])
                    {
                      id v167 = v125;
                      v149 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
                      v150 = [v149 candidates];
                      v151 = [v150 firstObject];
                      id v152 = [MEMORY[0x1E4F1CA98] null];

                      if (v151 != v152)
                      {
                        v153 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
                        v154 = [v153 candidates];
                        uint64_t v155 = [v154 firstObject];

                        id v119 = (id)v155;
                      }
                      v125 = v167;
                    }
                    if (!v119
                      || ([(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList],
                          v156 = objc_claimAutoreleasedReturnValue(),
                          char v157 = [v156 showCandidate:v119],
                          v156,
                          (v157 & 1) == 0))
                    {
                      BOOL v158 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
                      double v159 = [v158 currentCandidate];

                      if (!v159)
                      {
                        uint64_t v160 = [(UIKeyboardImpl *)self liveConversionEnabled];
                        CGFloat v161 = [(UIKeyboardImpl *)self candidateController];
                        unsigned int v162 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
                        objc_msgSend(v161, "showCandidateAtIndex:animated:scrollPosition:", objc_msgSend(v162, "initialSelectedIndex"), 0, v160);
                      }
                    }
                    [(UIKeyboardImpl *)self setUserSelectedCurrentCandidate:0];
                    [(UIKeyboardImpl *)self updateKeyboardConfigurations];

                    goto LABEL_120;
                  }
                }
                goto LABEL_101;
              }
              v120 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
              char v121 = [v120 hasCandidates];

              if ((v121 & 1) == 0) {
LABEL_101:
              }
                [(UIKeyboardImpl *)self removeCandidateList];
            }
            else
            {
              [(UIKeyboardImpl *)self setShowsCandidateBar:0];
            }
LABEL_120:

            return;
          }
LABEL_26:
          int v34 = [(UIKeyboardImpl *)self inputOverlayContainerForCandidateView:1];
          goto LABEL_27;
        }
        [(UIKeyboardImpl *)self setShowsCandidateBar:0];
        uint64_t v21 = [(UIKeyboardImpl *)self candidateController];
        [v21 setActiveCandidateViewType:1];
      }

      goto LABEL_21;
    }
    [(UIKeyboardImpl *)self removeCandidateList];
  }
}

- (int)promptTypeForInputString:(id)a3
{
  id v4 = a3;
  char v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
  char v6 = [v5 supportsSetPhraseBoundary];

  if (v6)
  {
    int v7 = 6;
  }
  else
  {
    int v7 = 5;
    if (![v4 length])
    {
      double v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
      int v9 = [v8 suppressCompletionsForFieldEditor];

      if (v9) {
        int v7 = 7;
      }
      else {
        int v7 = 5;
      }
    }
  }

  return v7;
}

- (void)beginObservingInputOverlayContainerFrame
{
  id obj = [(UIKeyboardImpl *)self inputOverlayContainerForCandidateView:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

  id v4 = obj;
  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
      int v7 = [v6 layer];
      id v8 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
      [v7 removeObserver:self forKeyPath:@"bounds" context:v8];
    }
    id v9 = objc_storeWeak((id *)&self->_overlayContainerObserved, obj);
    double v10 = [obj layer];
    id v11 = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
    [v10 addObserver:self forKeyPath:@"bounds" options:0 context:v11];

    id v4 = obj;
  }
}

- (void)endObservingInputOverlayContainerFrame
{
  p_overlayContainerObserved = &self->_overlayContainerObserved;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    id v6 = [v5 layer];
    id v7 = objc_loadWeakRetained((id *)p_overlayContainerObserved);
    [v6 removeObserver:self forKeyPath:@"bounds" context:v7];

    [(UIKeyboardImpl *)self updateInputOverlayForContainerFrameChange];
    objc_storeWeak((id *)p_overlayContainerObserved, 0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  p_overlayContainerObserved = &self->_overlayContainerObserved;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
  if (WeakRetained)
  {
    double v10 = WeakRetained;
    id v11 = objc_loadWeakRetained((id *)p_overlayContainerObserved);

    if (v11 == a6)
    {
      [(UIKeyboardImpl *)self updateInputOverlayForContainerFrameChange];
    }
  }
}

- (CGRect)convertRectToAutocorrectRect:(CGRect)a3 delegateView:(id)a4 container:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  id v11 = a5;
  double v12 = v11;
  if (v11 != v10)
  {
    double v13 = [v11 window];
    if (v13)
    {
      double v14 = [v10 window];
      if (v14)
      {
        double v15 = [v12 window];
        uint64_t v16 = [v10 window];
        BOOL v17 = v15 != v16;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }

    long long v18 = [v12 window];
    char v19 = [v18 _shouldTextEffectsWindowBeHostedForView:v10];

    if ((v19 & 1) == 0 && !v17)
    {
      objc_msgSend(v12, "convertRect:fromView:", v10, x, y, width, height);
      CGRect v59 = CGRectIntegral(v58);
LABEL_11:
      double x = v59.origin.x;
      double y = v59.origin.y;
      double width = v59.size.width;
      double height = v59.size.height;
      goto LABEL_16;
    }
    long long v20 = [v12 window];
    objc_msgSend(v20, "convertRect:fromView:", v10, x, y, width, height);
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    id v29 = [v12 window];
    objc_msgSend(v29, "convertRect:toView:", v12, v22, v24, v26, v28);
    double x = v30;
    double y = v31;
    double width = v32;
    double height = v33;

    int v34 = [v12 window];
    [v34 windowLevel];
    double v36 = v35;
    uint64_t v37 = [v10 window];
    [v37 windowLevel];
    double v39 = v38;

    if (v36 < v39)
    {
      CGRect v40 = [v10 _rootInputWindowController];
      [v40 visibleFrame];
      CGFloat v42 = v41;
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;

      v60.origin.double x = x;
      v60.origin.double y = y;
      v60.size.double width = width;
      v60.size.double height = height;
      v66.origin.double x = v42;
      v66.origin.double y = v44;
      v66.size.double width = v46;
      v66.size.double height = v48;
      CGRect v61 = CGRectIntersection(v60, v66);
      CGFloat v49 = v61.origin.x;
      CGFloat v50 = v61.origin.y;
      CGFloat v51 = v61.size.width;
      CGFloat v52 = v61.size.height;
      if (!CGRectIsNull(v61))
      {
        v62.origin.double x = v49;
        v62.origin.double y = v50;
        v62.size.double width = v51;
        v62.size.double height = v52;
        if (CGRectGetHeight(v62) > 0.0)
        {
          v63.origin.double x = v49;
          v63.origin.double y = v50;
          v63.size.double width = v51;
          v63.size.double height = v52;
          CGFloat v53 = -CGRectGetHeight(v63);
          v64.origin.double x = x;
          v64.origin.double y = y;
          v64.size.double width = width;
          v64.size.double height = height;
          CGRect v59 = CGRectOffset(v64, 0.0, v53);
          goto LABEL_11;
        }
      }
    }
  }
LABEL_16:

  double v54 = x;
  double v55 = y;
  double v56 = width;
  double v57 = height;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (void)sendCallbacksForPreCorrectionsDisplay
{
  double v3 = [(UIKeyboardImpl *)self inputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKeyboardImpl *)self inputDelegate];
    [v5 _willShowCorrections];
  }
}

- (void)sendCallbacksForPostCorrectionsRemoval
{
  double v3 = [(UIKeyboardImpl *)self inputDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIKeyboardImpl *)self inputDelegate];
    [v5 _didHideCorrections];
  }
}

- (void)touchAutocorrectPromptTimer
{
  if ([(UIKeyboardImpl *)self hasAdvancedInputDelegate])
  {
    double v3 = [(UIKeyboardImpl *)self autocorrectPromptTask];
    int v4 = [v3 isValid];

    if (v4)
    {
      id v7 = [(UIKeyboardImpl *)self autocorrectPromptTask];
      [v7 resetTimer];
    }
    else
    {
      id v5 = [(UIKeyboardImpl *)self taskQueue];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __45__UIKeyboardImpl_touchAutocorrectPromptTimer__block_invoke;
      v8[3] = &unk_1E52E34C8;
      v8[4] = self;
      id v6 = [v5 scheduleTask:v8 timeInterval:0 repeats:0.2];
      [(UIKeyboardImpl *)self setAutocorrectPromptTask:v6];
    }
  }
}

void __45__UIKeyboardImpl_touchAutocorrectPromptTimer__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  double v3 = [*(id *)(a1 + 32) autocorrectionController];
  int v4 = [v3 hasAutocorrection];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) autocorrectionController];
    id v6 = [v5 autocorrection];

    [*(id *)(a1 + 32) updateAutocorrectPrompt:v6 executionContext:v7];
  }
  else
  {
    [v7 returnExecutionToParent];
  }
}

- (void)clearAutocorrectPromptTimer
{
  double v3 = [(UIKeyboardImpl *)self autocorrectPromptTask];
  [v3 invalidate];

  [(UIKeyboardImpl *)self setAutocorrectPromptTask:0];
  keyboardStateManager = self->_keyboardStateManager;
  [(_UIKeyboardStateManager *)keyboardStateManager clearDelayDeleteTimer];
}

- (id)_rangeForAutocorrectionText:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _rangeForAutocorrectionText:a3];
}

- (id)autocorrectPromptRectsFromFirstDelegateRect:(CGRect)a3 lastDelegateRect:(CGRect)a4
{
  return -[_UIKeyboardStateManager autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:](self->_keyboardStateManager, "autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)updateAutocorrectPrompt:(id)a3
{
  id v4 = a3;
  if (qword_1EB259FF0 != -1) {
    dispatch_once(&qword_1EB259FF0, &__block_literal_global_551);
  }
  id v5 = [(UIKeyboardImpl *)self taskQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__UIKeyboardImpl_updateAutocorrectPrompt___block_invoke_3;
  v8[3] = &unk_1E52E3628;
  v8[4] = self;
  id v9 = v4;
  uint64_t v6 = qword_1EB259FE8;
  id v7 = v4;
  [v5 performSingleTask:v8 breadcrumb:v6];
}

void __42__UIKeyboardImpl_updateAutocorrectPrompt___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_553 copy];
  id v1 = (void *)qword_1EB259FE8;
  qword_1EB259FE8 = v0;
}

uint64_t __42__UIKeyboardImpl_updateAutocorrectPrompt___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t __42__UIKeyboardImpl_updateAutocorrectPrompt___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateAutocorrectPrompt:*(void *)(a1 + 40) executionContext:a2];
}

- (void)updateAutocorrectPrompt:(id)a3 executionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 candidate];
  id v9 = [v6 input];
  if (![(UIKeyboardImpl *)self hasAdvancedInputDelegate]) {
    goto LABEL_12;
  }
  [(UIKeyboardImpl *)self clearAutocorrectPromptTimer];
  if ([(_UIKeyboardStateManager *)self->_keyboardStateManager _isSelecting]) {
    goto LABEL_11;
  }
  id v10 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v11 = [v10 selectedTextRange];
  char v12 = [v11 isEmpty];

  if ((v12 & 1) == 0
    || ![v8 length]
    || ![(UIKeyboardImpl *)self delegateSupportsCorrectionUI]
    || [(UIKeyboardImpl *)self autocorrectionPreferenceForTraits] == 2)
  {
    goto LABEL_11;
  }
  if ([v8 isEqualToString:v9])
  {
    if (self->m_autocorrectPrompt)
    {
      double v13 = UIKeyboardGetCurrentInputMode();
      double v14 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v13);

      [(UIAutocorrectInlinePrompt *)self->m_autocorrectPrompt usageTrackingMask];
      TIStatisticScalarIncrementAutocorrectionKey();
    }
    goto LABEL_11;
  }
  if ([(UIKeyboardImpl *)self showingEmojiSearch])
  {
LABEL_11:
    [(UIKeyboardImpl *)self removeAutocorrectPrompt];
LABEL_12:
    [v7 returnExecutionToParent];
    goto LABEL_13;
  }
  if ([(UIKeyboardImpl *)self hasAsyncCapableInputDelegate])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke;
    aBlock[3] = &unk_1E52E3678;
    aBlock[4] = self;
    id v19 = v6;
    id v20 = v9;
    double v15 = _Block_copy(aBlock);
    if (qword_1EB25A010 != -1) {
      dispatch_once(&qword_1EB25A010, &__block_literal_global_562);
    }
    uint64_t v16 = [(UIKeyboardImpl *)self taskQueue];
    [v16 addTask:v15 breadcrumb:qword_1EB25A008];

    [v7 returnExecutionToParent];
  }
  else
  {
    BOOL v17 = [(UIKeyboardImpl *)self autocorrectPromptRectsForInput:v9];
    [(UIKeyboardImpl *)self updateAutocorrectPrompt:v6 correctionRects:v17];
    [v7 returnExecutionToParent];
  }
LABEL_13:
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_2;
  aBlock[3] = &unk_1E52FC718;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v20 = v4;
  uint64_t v21 = v5;
  id v22 = v6;
  id v7 = _Block_copy(aBlock);
  id v8 = [*(id *)(a1 + 32) asyncInputDelegate];
  if (v8)
  {

LABEL_4:
    id v10 = [*(id *)(a1 + 32) inputDelegateManager];
    uint64_t v11 = *(void *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    void v17[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_6;
    v17[3] = &unk_1E52E3E60;
    char v12 = &v18;
    id v18 = v7;
    [v10 requestTextRectsForString:v11 withCompletionHandler:v17];
    goto LABEL_5;
  }
  id v9 = [*(id *)(a1 + 32) webInputDelegate];

  if (v9) {
    goto LABEL_4;
  }
  double v13 = [*(id *)(a1 + 32) asyncWebKitInteractionDelegate];

  if (!v13) {
    goto LABEL_6;
  }
  id v10 = [*(id *)(a1 + 32) asyncWebKitInteractionDelegate];
  uint64_t v14 = *(void *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_7;
  v15[3] = &unk_1E52E3E88;
  char v12 = &v16;
  id v16 = v7;
  [v10 requestAutocorrectionRectsForString:v14 withCompletionHandler:v15];
LABEL_5:

LABEL_6:
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_2(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (qword_1EB25A000 != -1) {
    dispatch_once(&qword_1EB25A000, &__block_literal_global_555);
  }
  id v18 = (void *)a1[4];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_5;
  v20[3] = &unk_1E52E3E10;
  double v22 = a2;
  double v23 = a3;
  double v24 = a4;
  double v25 = a5;
  double v26 = a6;
  double v27 = a7;
  double v28 = a8;
  double v29 = a9;
  id v19 = (void *)a1[6];
  void v20[4] = a1[5];
  id v21 = v19;
  [v18 transferExecutionToMainThreadWithTask:v20 breadcrumb:qword_1EB259FF8];
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_3()
{
  uint64_t v0 = [&__block_literal_global_557 copy];
  id v1 = (void *)qword_1EB259FF8;
  qword_1EB259FF8 = v0;
}

uint64_t __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_5(uint64_t a1, void *a2)
{
  CGFloat v3 = *(double *)(a1 + 48);
  CGFloat v4 = *(double *)(a1 + 56);
  CGFloat v5 = *(double *)(a1 + 64);
  CGFloat v6 = *(double *)(a1 + 72);
  id v7 = a2;
  v11.origin.double x = v3;
  v11.origin.double y = v4;
  v11.size.double width = v5;
  v11.size.double height = v6;
  if (CGRectIsEmpty(v11) && CGRectIsEmpty(*(CGRect *)(a1 + 80)))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  id v9 = (id)v8;
  [*(id *)(a1 + 32) updateAutocorrectPrompt:*(void *)(a1 + 40) correctionRects:v8];
  [v7 returnExecutionToParent];
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v17 = [v3 firstObject];
  [v17 rect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  char v12 = [v3 lastObject];

  [v12 rect];
  (*(void (**)(uint64_t, double, double, double, double, double, double, double, double))(v2 + 16))(v2, v5, v7, v9, v11, v13, v14, v15, v16);
}

uint64_t __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 firstRect];
  unint64_t v5 = v4;
  unint64_t v7 = v6;
  unint64_t v9 = v8;
  unint64_t v11 = v10;
  [v3 lastRect];
  unint64_t v13 = v12;
  unint64_t v15 = v14;
  unint64_t v17 = v16;
  unint64_t v19 = v18;

  id v20 = *(uint64_t (**)(uint64_t, __n128, __n128, __n128, __n128, __n128, __n128, __n128, __n128))(v2 + 16);
  v21.n128_u64[0] = v5;
  v22.n128_u64[0] = v7;
  v23.n128_u64[0] = v9;
  v24.n128_u64[0] = v11;
  v25.n128_u64[0] = v13;
  v26.n128_u64[0] = v15;
  v27.n128_u64[0] = v17;
  v28.n128_u64[0] = v19;
  return v20(v2, v21, v22, v23, v24, v25, v26, v27, v28);
}

void __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_8()
{
  uint64_t v0 = [&__block_literal_global_564_1 copy];
  id v1 = (void *)qword_1EB25A008;
  qword_1EB25A008 = v0;
}

uint64_t __59__UIKeyboardImpl_updateAutocorrectPrompt_executionContext___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (id)autocorrectPromptRectsForInput:(id)a3
{
  unint64_t v4 = [(UIKeyboardImpl *)self _rangeForAutocorrectionText:a3];
  unint64_t v5 = v4;
  if (v4 && ([v4 isEmpty] & 1) == 0)
  {
    unint64_t v7 = [(UIKeyboardImpl *)self inputDelegate];
    [v7 firstRectForRange:v5];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    unint64_t v16 = [(UIKeyboardImpl *)self inputDelegate];
    [v16 _lastRectForRange:v5];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    unint64_t v6 = -[UIKeyboardImpl autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:](self, "autocorrectPromptRectsFromFirstDelegateRect:lastDelegateRect:", v9, v11, v13, v15, v18, v20, v22, v24);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (void)setNeedsAutocorrectionRectsUpdate
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_updateActiveAutocorrectionRects object:0];
  [(UIKeyboardImpl *)self performSelector:sel_updateActiveAutocorrectionRects withObject:0 afterDelay:0.0];
}

- (void)updateActiveAutocorrectionRects
{
  if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
  {
    id v10 = [(UIKeyboardImpl *)self _textChoicesAssistant];
    if ([v10 autocorrectInlinePromptIsVisible])
    {
      id v3 = [(UIKeyboardImpl *)self autocorrectionController];
      int v4 = [v3 hasAutocorrection];

      if (!v4) {
        return;
      }
      unint64_t v5 = [(UIKeyboardImpl *)self autocorrectionController];
      id v10 = [v5 autocorrection];

      unint64_t v6 = [v10 input];
      unint64_t v7 = [(UIKeyboardImpl *)self autocorrectPromptRectsForInput:v6];

      if ([v7 count])
      {
        double v8 = [(UIKeyboardImpl *)self _textChoicesAssistant];
        double v9 = [v10 candidate];
        [v8 updateActivePromptForCandidate:v9 displayRects:v7 highlightOnly:1];
      }
    }
  }
}

- (void)updateAutocorrectPrompt:(id)a3 correctionRects:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  unint64_t v7 = [v28 candidate];
  double v8 = [v28 input];
  if (![v6 count]) {
    goto LABEL_3;
  }
  double v9 = [v6 lastObject];
  [v9 rect];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v30.origin.double x = v11;
  v30.origin.double y = v13;
  v30.size.double width = v15;
  v30.size.double height = v17;
  if (CGRectIsEmpty(v30))
  {
LABEL_3:
    [(UIKeyboardImpl *)self removeAutocorrectPrompt];
    goto LABEL_15;
  }
  double v18 = [(UIKeyboardImpl *)self inputOverlayContainer];
  if (v18 && [(UIKeyboardImpl *)self delegateSupportsCorrectionUI])
  {
    [(UIKeyboardImpl *)self updateKeyboardConfigurations];
    double v19 = [(UIKeyboardImpl *)self inlineTextCompletionController];
    int v20 = [v19 hasPrompt];

    if (!v20)
    {
      if (+[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled])
      {
        double v21 = +[UIDevice currentDevice];
        uint64_t v22 = [v21 userInterfaceIdiom];

        if (![(UIKeyboardImpl *)self isMinimized] || v22) {
          uint64_t v22 = [(UIKeyboardImpl *)self isPredictionViewControllerVisible]
        }
             || [(UIKeyboardImpl *)self accessibilityUsesExtendedKeyboardPredictionsEnabled];
        double v24 = [(UIKeyboardImpl *)self _textChoicesAssistant];
        __n128 v25 = [v28 candidate];
        [v24 updateActivePromptForCandidate:v25 displayRects:v6 highlightOnly:v22];
      }
      else
      {
        [(UIKeyboardImpl *)self updateLegacyAutocorrectPromptWithAutocorrection:v28 parentView:v18 correctionRects:v6];
      }
      if ([v7 length])
      {
        [(UIKeyboardImpl *)self sendCallbacksForPreCorrectionsDisplay];
        __n128 v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
        __n128 v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"correction"];
        [v26 postNotificationName:@"UIKeyboardCandidateCorrectionDidChangeNotification" object:0 userInfo:v27];
      }
      goto LABEL_14;
    }
  }
  else
  {
    [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:1];
    double v23 = [(UIKeyboardImpl *)self inputDelegate];
    [v23 _replaceCurrentWordWithText:v7];

    [(UIKeyboardImpl *)self syncDocumentStateToInputDelegate];
    [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:0];
  }
  [(UIKeyboardImpl *)self removeAutocorrectPrompt];
LABEL_14:

LABEL_15:
}

- (void)updateLegacyAutocorrectPromptWithAutocorrection:(id)a3 parentView:(id)a4 correctionRects:(id)a5
{
  id v40 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = [v40 candidate];
  CGFloat v11 = [v40 input];
  m_autocorrectPrompt = self->m_autocorrectPrompt;
  if (!m_autocorrectPrompt)
  {
    double v14 = [UIAutocorrectInlinePrompt alloc];
    CGFloat v15 = -[UIAutocorrectInlinePrompt initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v16 = self->m_autocorrectPrompt;
    self->m_autocorrectPrompt = v15;

    goto LABEL_5;
  }
  id v13 = [(UIView *)m_autocorrectPrompt superview];

  if (v13 != v8) {
LABEL_5:
  }
    [v8 addSubview:self->m_autocorrectPrompt];
  CGFloat v17 = self->m_autocorrectPrompt;
  double v18 = [(UIKeyboardImpl *)self inputDelegate];
  double v19 = [v18 textInputView];
  [v19 _convertVisualAltitude:self->m_autocorrectPrompt toView:0.0];
  -[UIView _setVisualAltitude:](v17, "_setVisualAltitude:");

  [(UIKeyboardImpl *)self trackUsageForPromptedCorrection:v10 inputString:v11 previousPrompt:self->m_autocorrectPrompt];
  -[UIAutocorrectInlinePrompt setUsageTrackingMask:](self->m_autocorrectPrompt, "setUsageTrackingMask:", [v40 usageTrackingMask]);
  int v20 = [v9 lastObject];
  [v20 rect];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  [v8 bounds];
  double v31 = v29 + v30;
  if (v29 + v30 == 0.0)
  {
    double v32 = [v8 superview];
    [v32 bounds];
    double v31 = v33 + v34;
  }
  -[UIAutocorrectInlinePrompt setCorrection:typedText:inRect:maxX:](self->m_autocorrectPrompt, "setCorrection:typedText:inRect:maxX:", v10, v11, v22, v24, v26, v28, v31);
  -[UIView setSize:](self->m_autocorrectPrompt, "setSize:", v26, v28);
  uint64_t v35 = [v9 count];
  uint64_t v36 = v35 - 1;
  if (v35 != 1)
  {
    uint64_t v37 = 0;
    do
    {
      double v38 = self->m_autocorrectPrompt;
      double v39 = [v9 objectAtIndex:v37];
      [v39 rect];
      -[UIAutocorrectInlinePrompt addTypedTextRect:](v38, "addTypedTextRect:");

      ++v37;
    }
    while (v36 != v37);
  }
}

- (void)updateAutocorrectContainerWithAutocorrection:(id)a3 parentView:(id)a4 correctionRects:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  CGFloat v11 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];

  if (!v11)
  {
    double v12 = objc_alloc_init(UIAutocorrectBubbleContainer);
    [(UIKeyboardImpl *)self setAutocorrectBubbleContainer:v12];
  }
  id v13 = [v9 superview];
  double v14 = [v13 subviews];
  CGFloat v15 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
  char v16 = [v14 containsObject:v15];

  if ((v16 & 1) == 0)
  {
    CGFloat v17 = [v9 superview];
    double v18 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    [v17 addSubview:v18];

    double v19 = [v9 superview];
    int v20 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    [v19 bringSubviewToFront:v20];
  }
  double v21 = [v10 lastObject];
  [v21 rect];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  id v30 = v9;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v31 = objc_msgSend(v30, "subviews", 0);
  id v32 = (id)[v31 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v50;
    while (2)
    {
      for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v50 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v32 = v35;
          goto LABEL_15;
        }
      }
      id v32 = (id)[v31 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v32) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  uint64_t v36 = [v30 superview];
  objc_msgSend(v36, "convertRect:fromView:", v32, v23, v25, v27, v29);
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;

  double v45 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
  CGFloat v46 = [v8 candidate];
  double v47 = [v8 input];
  CGFloat v48 = [v30 superview];
  objc_msgSend(v45, "updateWithAutocorrectionText:typedText:referenceTextView:referenceRect:", v46, v47, v48, v38, v40, v42, v44);
}

- (void)animateAutocorrectionToText:(id)a3 fromRect:(CGRect)a4
{
  id v18 = [(UIKeyboardImpl *)self _rangeForAutocorrectionText:a3];
  if (self->m_autocorrectPrompt)
  {
    unint64_t v5 = [(UIKeyboardImpl *)self inputOverlayContainer];
    id v6 = [(UIKeyboardImpl *)self inputDelegate];
    unint64_t v7 = [v6 textInputView];

    if (v18)
    {
      id v8 = [(UIKeyboardImpl *)self inputDelegate];
      [v8 firstRectForRange:v18];
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
    }
    else
    {
      double v10 = *MEMORY[0x1E4F1DB20];
      double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
    -[UIKeyboardImpl convertRectToAutocorrectRect:delegateView:container:](self, "convertRectToAutocorrectRect:delegateView:container:", v7, v5, v10, v12, v14, v16);
    -[UIKeyboardImpl animateAutocorrectionToRect:fromRect:](self, "animateAutocorrectionToRect:fromRect:");
  }
  else
  {
    CGFloat v17 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];

    if (!v17) {
      goto LABEL_9;
    }
    unint64_t v5 = [(UIKeyboardImpl *)self autocorrectBubbleContainer];
    [v5 animateAutocorrectionAccepted];
  }

LABEL_9:
}

- (void)animateAutocorrectionToRect:(CGRect)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (![(UIKeyboardImpl *)self isPredictionViewControllerVisible]
    && ![(UIKeyboardImpl *)self shouldShowLongPredictionList])
  {
    -[UIView setFrame:](self->m_autocorrectPrompt, "setFrame:", x, y, width, height);
    if (-[UIAutocorrectInlinePrompt prepareForAnimation:](self->m_autocorrectPrompt, "prepareForAnimation:", v11, v10, v9, v8))
    {
      double v13 = [(UIAutocorrectInlinePrompt *)self->m_autocorrectPrompt typedTextView];
      double v14 = [(UIAutocorrectInlinePrompt *)self->m_autocorrectPrompt correctionView];
      double v15 = [(UIAutocorrectInlinePrompt *)self->m_autocorrectPrompt correctionAnimationView];
      double v16 = [(UIAutocorrectInlinePrompt *)self->m_autocorrectPrompt correctionShadowView];
      [v13 frameOrigin];
      uint64_t v18 = v17;
      double v20 = v19;
      [(UIView *)self->m_autocorrectPrompt bounds];
      double v22 = round(v21 * 0.5);
      [v13 bounds];
      double v24 = v20 + v22 - round(v23 * 0.5);
      double v25 = self->m_autocorrectPrompt;
      m_autocorrectPrompt = self->m_autocorrectPrompt;
      self->m_autocorrectPrompt = 0;

      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke;
      v33[3] = &unk_1E52E9D28;
      uint64_t v37 = v18;
      double v38 = v24;
      id v34 = v14;
      id v35 = v15;
      id v36 = v16;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke_2;
      v31[3] = &unk_1E52DA660;
      v31[4] = self;
      id v32 = v25;
      double v27 = v25;
      id v28 = v16;
      id v29 = v15;
      id v30 = v14;
      +[UIView animateWithDuration:0 delay:v33 options:v31 animations:0.15 completion:0.0];
    }
  }
}

uint64_t __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  objc_msgSend(*(id *)(a1 + 32), "setFrameOrigin:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setFrameOrigin:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 48), "setFrameOrigin:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v2 = *(void **)(a1 + 48);
  return [v2 setAlpha:0.0];
}

uint64_t __55__UIKeyboardImpl_animateAutocorrectionToRect_fromRect___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) autocorrectionAnimationDidStopWithAutocorrectionView:*(void *)(a1 + 40)];
}

- (void)fadeAutocorrectPrompt
{
  id v3 = [(UIKeyboardImpl *)self inputDelegate];

  if (v3 && [(UIKeyboardImpl *)self hasAutocorrectPrompt])
  {
    int v4 = UIKeyboardGetCurrentInputMode();
    unint64_t v5 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v4);

    [(UIAutocorrectInlinePrompt *)self->m_autocorrectPrompt usageTrackingMask];
    TIStatisticScalarIncrementAutocorrectionKey();
    BOOL v6 = +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled];
    m_autocorrectPrompt = self->m_autocorrectPrompt;
    if (v6)
    {
      if (m_autocorrectPrompt)
      {
        [(UIView *)m_autocorrectPrompt setAlpha:0.0];
        double v8 = self->m_autocorrectPrompt;
        self->m_autocorrectPrompt = 0;
      }
      double v9 = [(UIKeyboardImpl *)self _textChoicesAssistant];
      [v9 dismissWithoutSelection];
    }
    else
    {
      double v10 = m_autocorrectPrompt;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke;
      v14[3] = &unk_1E52D9F70;
      v14[4] = self;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke_2;
      void v12[3] = &unk_1E52DA660;
      v12[4] = self;
      double v13 = v10;
      double v11 = v10;
      +[UIView animateWithDuration:0 delay:v14 options:v12 animations:0.1 completion:0.0];
    }
    [(_UIKeyboardStateManager *)self->_keyboardStateManager rejectAutocorrectionForPromptFade];
    [(UIKeyboardImpl *)self setAutocorrection:0];
    [(UIKeyboardImpl *)self updateKeyboardConfigurations];
  }
}

void __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 416);
  *(void *)(v2 + 416) = 0;
}

uint64_t __39__UIKeyboardImpl_fadeAutocorrectPrompt__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) autocorrectionAnimationDidStopWithAutocorrectionView:*(void *)(a1 + 40)];
}

- (void)autocorrectionAnimationDidStopWithAutocorrectionView:(id)a3
{
  id v6 = a3;
  int v4 = [v6 superview];

  if (v4) {
    [v6 removeFromSuperview];
  }
  unint64_t v5 = [(UIKeyboardImpl *)self cursorAssertion];
  [v5 invalidate];

  [(UIKeyboardImpl *)self setCursorAssertion:0];
}

- (void)underlineCandidate:(id)a3
{
  id v12 = a3;
  BOOL v4 = +[UITextSelectionDisplayInteraction isTextAccelerationUIEnabled];
  unint64_t v5 = v12;
  if (v12 && v4)
  {
    if ([(UIKeyboardImpl *)self shouldUnderlineCandidate:v12])
    {
      id v6 = [v12 candidate];
      unint64_t v7 = [(UIKeyboardImpl *)self _rangeForAutocorrectionText:v6];

      if ([v12 isAutocorrection])
      {
        double v8 = [(UIKeyboardImpl *)self inputDelegateManager];
        double v9 = [v12 input];
        [v8 correctedTypedText:v9 rangeOfReplacement:v7];
      }
      double v10 = [(UIKeyboardImpl *)self _textChoicesAssistant];
      [v10 addUnderlineForCandidate:v12 range:v7];
    }
    else
    {
      BOOL v11 = +[UIKeyboard usesInputSystemUI];
      unint64_t v5 = v12;
      if (!v11) {
        goto LABEL_10;
      }
      unint64_t v7 = [(UIKeyboardImpl *)self _textChoicesAssistant];
      [v7 setNeedsUnderlineUpdate];
    }

    unint64_t v5 = v12;
  }
LABEL_10:
}

- (BOOL)shouldUnderlineCandidate:(id)a3
{
  id v3 = a3;
  if ([v3 confidence]) {
    BOOL v4 = [v3 confidence] != 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)autocorrectionRecordForWord:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager autocorrectionRecordForWord:a3];
}

- (BOOL)delegateSuggestionsForCurrentInput
{
  id v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
  BOOL v4 = [v3 textSuggestionDelegate];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_34:
    BOOL v30 = 1;
    goto LABEL_35;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || [v4 hasCurrentSuggestions])
  {
    unint64_t v5 = [(UIKeyboardImpl *)self inputDelegate];
    id v6 = [v5 _fullText];

    unint64_t v7 = [(UIKeyboardImpl *)self inputDelegate];
    uint64_t v8 = [v7 _selectedNSRange];

    double v9 = (void *)[v4 suggestionsForString:v6 inputIndex:v8];
    unint64_t v11 = v10;
    id v12 = v9;
    if ([v12 count])
    {
      double v13 = [v12 objectAtIndex:0];
    }
    else
    {
      double v13 = 0;
    }
    uint64_t v14 = [v13 length];
    if (v14)
    {
      unint64_t v15 = v14;
      if ([v6 isEqualToString:v13])
      {
LABEL_28:
        if ((unint64_t)[v12 count] < 2)
        {
          id v34 = 0;
        }
        else
        {
          id v32 = [v12 objectAtIndex:1];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v34 = [v12 objectAtIndex:1];
          }
          else
          {
            id v35 = (void *)MEMORY[0x1E4FAE318];
            id v36 = [v12 objectAtIndex:1];
            id v34 = [v35 candidateWithCandidate:v36 forInput:v6];
          }
        }
        [(UIKeyboardImpl *)self setAutocorrection:v34];
        [(UIKeyboardImpl *)self syncInputManagerToKeyboardState];

        goto LABEL_34;
      }
      if (!delegateSuggestionsForCurrentInput_nbspString_0)
      {
        uint64_t v16 = [NSString _stringWithUnichar:160];
        uint64_t v17 = (void *)delegateSuggestionsForCurrentInput_nbspString_0;
        delegateSuggestionsForCurrentInput_nbspString_0 = v16;
      }
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v13];
      objc_msgSend(v18, "replaceOccurrencesOfString:withString:options:range:", @" ", delegateSuggestionsForCurrentInput_nbspString_0, 2, 0, v15);
      [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:1];
      double v19 = [(UIKeyboardImpl *)self inputDelegate];
      [v19 _selectAll];

      [(UIKeyboardImpl *)self syncDocumentStateToInputDelegate];
      [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:0];
      double v20 = [(UIKeyboardImpl *)self inputDelegateManager];
      [v20 insertText:v18 updateInputSource:0];

      if (v11 >= v15) {
        unint64_t v21 = v15;
      }
      else {
        unint64_t v21 = v11;
      }
      if (v15 > v11)
      {
        uint64_t v22 = (v21 - v15);
        unint64_t v38 = v21;
        [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:1];
        uint64_t v23 = [(UIKeyboardImpl *)self inputDelegate];
        [(id)v23 _moveCurrentSelection:v22];

        double v24 = [(UIKeyboardImpl *)self inputDelegate];
        LOBYTE(v23) = objc_opt_respondsToSelector();

        if (v23)
        {
          char v25 = [v13 _isNaturallyRTL];
          if (v38 > 5 || (v25 & 1) != 0)
          {
            char v31 = v25 ^ 1;
            if (v38 < v15 - 5) {
              char v31 = 1;
            }
            if (v31) {
              goto LABEL_26;
            }
            double v26 = [(UIKeyboardImpl *)self inputDelegate];
            double v27 = v26;
            unint64_t v28 = v15 - 1;
          }
          else
          {
            double v26 = [(UIKeyboardImpl *)self inputDelegate];
            double v27 = v26;
            unint64_t v28 = 0;
          }
          objc_msgSend(v26, "_scrollRangeToVisible:animated:", v28, 0, 0);
        }
LABEL_26:
        [(UIKeyboardImpl *)self syncDocumentStateToInputDelegate];
        [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:0];
      }
    }
    else
    {
      [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:1];
      id v29 = [(UIKeyboardImpl *)self inputDelegate];
      [v29 _selectAll];

      [(UIKeyboardImpl *)self syncDocumentStateToInputDelegate];
      [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:0];
      uint64_t v18 = [(UIKeyboardImpl *)self inputDelegateManager];
      [v18 insertText:&stru_1ED0E84C0 updateInputSource:0];
    }

    goto LABEL_28;
  }
  BOOL v30 = 0;
LABEL_35:

  return v30;
}

- (void)generateCandidates
{
}

- (void)generateCandidatesWithOptions:(int)a3
{
}

- (BOOL)_isShowingSuggestionForKeyboardCamera
{
  uint64_t v2 = [(UIKeyboardImpl *)self autocorrectionController];
  id v3 = [v2 textSuggestionList];
  char v4 = [v3 isShowingSuggestionForKeyboardCamera];

  return v4;
}

- (void)_generateTextSuggestionForKeyboardCamera
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKeyboardImpl *)self delegate];
  char v4 = +[UIAction _textFromCameraTitleForResponder:v3];
  unint64_t v5 = +[UITextSuggestion textSuggestionWithInputText:v4];
  [v5 setTarget:v3];
  [v5 setAction:sel_captureTextFromCamera_];
  id v6 = +[UIAction _textFromCameraImage];
  [v5 setImage:v6];

  v8[0] = v5;
  unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [(UIKeyboardImpl *)self setSuggestions:v7];
}

- (id)replacementsFromSelectedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager replacementsFromSelectedText];
}

- (id)generateAutocorrectionReplacements:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager generateAutocorrectionReplacements:a3];
}

- (id)generateAutocorrectionListForSelectedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager generateAutocorrectionListForSelectedText];
}

- (void)handleAutoDeleteContinuationOnDestinationWithDeletionCount:(unint64_t)a3
{
}

- (void)performStopAutoDeleteAtDocumentStart
{
}

- (void)startAutoDeleteTimer
{
}

- (void)startAutoDeleteTimerForForce:(double)a3
{
}

- (void)adjustAutoDeleteTimerForForce:(double)a3
{
}

- (double)deleteWordLastDelete
{
  [(_UIKeyboardStateManager *)self->_keyboardStateManager deleteWordLastDelete];
  return result;
}

- (void)setDeleteWordLastDelete:(double)a3
{
}

- (void)stopAutoDelete
{
}

- (void)touchLongPressTimerWithDelay:(double)a3
{
}

- (void)touchLongPressTimer
{
}

- (void)clearLongPressTimer
{
}

- (void)longPressAction
{
}

- (BOOL)isLongPress
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isLongPress];
}

- (void)clearTimers
{
  if (pthread_main_np())
  {
    [(_UIKeyboardStateManager *)self->_keyboardStateManager clearTimers];
    [(UIKeyboardImpl *)self clearAutocorrectPromptTimer];
    [(UIKeyboardImpl *)self clearDetachHardwareKeyboardAction];
  }
  else
  {
    [(UIKeyboardImpl *)self performSelectorOnMainThread:a2 withObject:0 waitUntilDone:0];
  }
}

- (void)clearChangeTimeAndCount
{
}

- (void)updateChangeTimeAndIncrementCount
{
}

- (int)changeCount
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager changeCount];
}

- (void)updateHardwareKeyboardLayout
{
}

- (void)updateHardwareKeyboardLayout:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = (void *)UIApp;
  id v6 = +[UIKeyboardInputModeController sharedInputModeController];
  unint64_t v7 = [v6 hardwareInputMode];
  uint64_t v8 = [v7 automaticHardwareLayout];
  [v5 setHardwareKeyboardLayoutName:v8 forceRebuild:v3];

  [(UIKeyboardImpl *)self setCapsLockIfNeeded];
  [(UIKeyboardImpl *)self callLayoutUpdateAllLocalizedKeys];
}

- (void)clearDetachHardwareKeyboardAction
{
  [(UIDelayedAction *)self->m_detachHardwareKeyboardAction cancel];
  [(UIDelayedAction *)self->m_detachHardwareKeyboardAction setTarget:0];
  m_detachHardwareKeyboardAction = self->m_detachHardwareKeyboardAction;
  self->m_detachHardwareKeyboardAction = 0;
}

- (void)detachHardwareKeyboard
{
  [(UIKeyboardImpl *)self clearDetachHardwareKeyboardAction];
  BOOL v3 = +[UIDevice currentDevice];
  -[_UIKeyboardStateManager setHardwareKeyboardAttached:](self->_keyboardStateManager, "setHardwareKeyboardAttached:", [v3 _isHardwareKeyboardAvailable]);

  [(UIKeyboardImpl *)self setInHardwareKeyboardMode:[(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached]];
  [(UIKeyboardImpl *)self setCapsLockSign];
  [(UIKeyboardImpl *)self setIsAttachedHardwareKeyboard:0];
  id v5 = +[UIInputSwitcher activeInstance];
  [v5 hideSwitcherIfNeeded];
  char v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputModeIndicatorController];
  [v4 hardwareKeyboardDettached];
}

- (void)hardwareKeyboardAvailabilityDidChange:(id)a3
{
  char v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v5 = [v4 inputViews];
  id v6 = [v5 inputView];

  if (v6)
  {
    [(UIKeyboardImpl *)self hardwareKeyboardAvailabilityChanged];
  }
}

- (void)hardwareKeyboardAvailabilityChanged
{
  [(_UIKeyboardStateManager *)self->_keyboardStateManager updateHardwareKeyboardExclusivityIdentifier];
  BOOL v3 = +[UIDevice currentDevice];
  int v4 = [v3 _isHardwareKeyboardAvailable];

  if (v4)
  {
    if (self->m_detachHardwareKeyboardAction
      && ([(UIKeyboardImpl *)self clearDetachHardwareKeyboardAction],
          [(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached]))
    {
      [(UIKeyboardImpl *)self setCapsLockIfNeeded];
      [(UIKeyboardImpl *)self setIsAttachedHardwareKeyboard:0];
    }
    else
    {
      [(UIKeyboardImpl *)self setAutomaticMinimizationEnabled:1];
      if ([(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached]) {
        [(UIKeyboardImpl *)self updateHardwareKeyboardLayout];
      }
      else {
        [(_UIKeyboardStateManager *)self->_keyboardStateManager setHardwareKeyboardAttached:1];
      }
      [(UIKeyboardImpl *)self setInHardwareKeyboardMode:1 forceRebuild:0];
      [(UIKeyboardImpl *)self setIsAttachedHardwareKeyboard:0];
      [(_UIKeyboardStateManager *)self->_keyboardStateManager unsetDidUpdateCapsLockLanguageSwitchSetting];
      id v20 = +[UIDictationController activeInstance];
      [v20 prepareStartDictationKeyboardGestures];
    }
    return;
  }
  id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v6 = [v5 keyInputDelegate];
  if (v6)
  {
    unint64_t v7 = (void *)v6;
    if (([(id)UIApp isSuspended] & 1) == 0)
    {

      goto LABEL_22;
    }
    uint64_t v8 = +[UIPeripheralHost sharedInstance];
    double v9 = [v8 containerWindow];
    char v10 = [v9 _isHostedInAnotherProcess];

    if (v10)
    {
LABEL_22:
      m_detachHardwareKeyboardAction = self->m_detachHardwareKeyboardAction;
      if (m_detachHardwareKeyboardAction)
      {
        [(UIDelayedAction *)m_detachHardwareKeyboardAction touch];
      }
      else if ([(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached])
      {
        double v13 = +[UIKeyboardPreferencesController sharedPreferencesController];
        uint64_t v14 = [v13 preferencesActions];
        unint64_t v15 = [v14 valueForPreferenceKey:@"DetachHardwareKeyboardDelayInterval"];
        [v15 floatValue];
        float v17 = v16;

        [(UIKeyboardImpl *)self cancelAllKeyEvents];
        [(id)UIApp _deliverRemainingKeyUpEvents];
        if (v17 <= 0.0)
        {
          [(UIKeyboardImpl *)self detachHardwareKeyboard];
        }
        else
        {
          uint64_t v18 = [[UIDelayedAction alloc] initWithTarget:self action:sel_detachHardwareKeyboard userInfo:0 delay:v17];
          double v19 = self->m_detachHardwareKeyboardAction;
          self->m_detachHardwareKeyboardAction = v18;
        }
      }
      return;
    }
  }
  else
  {
  }
  [(UIKeyboardImpl *)self cancelAllKeyEvents];
  [(id)UIApp _deliverRemainingKeyUpEvents];
  [(UIKeyboardImpl *)self detachHardwareKeyboard];
  keyboardStateManager = self->_keyboardStateManager;
  [(_UIKeyboardStateManager *)keyboardStateManager unsetDidUpdateCapsLockLanguageSwitchSetting];
}

- (void)hideKeyboardWithoutPreflightChecks
{
  [(UIKeyboardImpl *)self prepareForGeometryChange];
  [(UIKeyboardImpl *)self removeCandidateList];
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  [WeakRetained setMinimized:1];

  int v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [v4 currentInputMode];
  int v6 = [v5 isExtensionInputMode];

  if (v6)
  {
    unint64_t v7 = +[UIPeripheralHost sharedInstance];
    [v7 minimize];
  }
  [(UIKeyboardImpl *)self deactivateLayout];
  [(UIKeyboardLayout *)self->m_layout resetTouchProcessingForKeyboardChange];
  [(UIKeyboardImpl *)self notifyShiftState];
  uint64_t v8 = [(UIKeyboardImpl *)self window];
  [(UIKeyboardImpl *)self _updateSoundPreheatingForWindow:v8];

  [(UIKeyboardImpl *)self geometryChangeDone:1];
  [(UIKeyboardImpl *)self hideInternationalKeyIntroductionIfNeeded];
  [(UIKeyboardImpl *)self dismissContinuousPathIntroductionView];
  [(UIKeyboardImpl *)self dismissEditingIntroductionView];
  [(UIKeyboardImpl *)self dismissMultilingualKeyboardTip];
  [(UIKeyboardImpl *)self dismissMultilingualSettingTip];
  [(UIKeyboardImpl *)self dismissStickerEditor:0];
}

- (void)hideKeyboard
{
}

- (void)hideKeyboardIgnoringHardwareLayouts:(BOOL)a3
{
  if (a3
    || (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), int v4 = objc_claimAutoreleasedReturnValue(), [v4 currentInputMode], v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "showSWLayoutWithHWKeyboard"), v5, v4, (v6 & 1) == 0))
  {
    if (![(UIKeyboardImpl *)self showingEmojiSearch])
    {
      [(UIKeyboardImpl *)self hideKeyboardWithoutPreflightChecks];
    }
  }
}

- (void)showKeyboard
{
}

- (void)showKeyboardWithoutSuppressionPolicy
{
  [(UIKeyboardImpl *)self setHardwareKeyboardIsSeen:1];
  [(UIKeyboardImpl *)self setAutomaticMinimizationEnabled:0];
  [(UIKeyboardImpl *)self _showKeyboardIgnoringPolicyDelegate:1];
  [(UIKeyboardImpl *)self updateTextInputKeyboardSource];
}

- (void)_showKeyboardIgnoringPolicyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UIDictationController activeInstance];
  char v6 = [v5 shouldSuppressSoftwareKeyboard];

  if ((v6 & 1) == 0)
  {
    unint64_t v7 = +[UIKeyboardCameraSession activeSession];
    char v8 = [v7 shouldSuppressSoftwareKeyboard];

    if ((v8 & 1) == 0
      && +[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate]&& ![(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:v3])
    {
      self->m_maximizing = 1;
      if (self->m_updateLayoutOnShowKeyboard
        || +[UIKeyboardImpl isFloating])
      {
        if (byte_1EB259F1A) {
          [(UIKeyboardImpl *)self refreshRivenPreferences];
        }
        [(UIKeyboardImpl *)self updateLayout];
        [(UIKeyboardImpl *)self callLayoutUpdateLocalizedKeys];
        self->m_updateLayoutOnShowKeyboard = 0;
      }
      if ([(UIKeyboardImpl *)self isEmojiPopoverPresented]) {
        [(UIKeyboardImpl *)self dismissEmojiPopoverBeforeCleanup:0];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
      [WeakRetained setMinimized:0];

      char v10 = +[UIKeyboardInputModeController sharedInputModeController];
      unint64_t v11 = [v10 currentInputMode];
      int v12 = [v11 isExtensionInputMode];

      if (v12)
      {
        double v13 = +[UIPeripheralHost sharedInstance];
        [v13 maximize];
      }
      [(UIView *)self->m_layout setAlpha:1.0];
      uint64_t v14 = [(UIKeyboardImpl *)self window];
      [(UIKeyboardImpl *)self _updateSoundPreheatingForWindow:v14];

      [(UIKeyboardImpl *)self prepareForGeometryChange];
      [(UIKeyboardImpl *)self removeCandidateList];
      BOOL v15 = [(UIKeyboardImpl *)self autocorrectionPreferenceForTraits] != 0;
      float v16 = [(UIKeyboardImpl *)self keyboardState];
      [v16 setAutocorrectionEnabled:v15];

      float v17 = [(UIKeyboardImpl *)self keyboardStateManager];
      uint64_t v18 = [v17 isInlineCompletionEnabled];
      double v19 = [(UIKeyboardImpl *)self keyboardState];
      [v19 setInlineCompletionEnabled:v18];

      [(UIKeyboardImpl *)self updateForChangedSelection];
      [(UIKeyboardImpl *)self setShowsCandidateBar:[(UIKeyboardImpl *)self shouldShowCandidateBar]];
      id v20 = +[UIKeyboardInputModeController sharedInputModeController];
      unint64_t v21 = [v20 currentInputMode];
      [(UIKeyboardImpl *)self setKeyboardInputMode:v21 userInitiated:0];

      if ([(UIKeyboardImpl *)self showsCandidateBar]) {
        [(UIKeyboardImpl *)self generateCandidates];
      }
      [(UIKeyboardImpl *)self geometryChangeDone:1];
      self->m_maximizing = 0;
    }
  }
}

- (void)setInHardwareKeyboardMode:(BOOL)a3
{
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4
{
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 shouldMoveKeyboard:(BOOL)a4
{
}

- (void)setInHardwareKeyboardMode:(BOOL)a3 forceRebuild:(BOOL)a4 shouldMoveKeyboard:(BOOL)a5
{
}

- (void)nonDestructivelyDismissKeyboard
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  int v4 = [WeakRetained canDismiss];

  if (!v4) {
    return;
  }
  id v13 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v5 = [v13 ignoresPinning];
  [v13 setIgnoresPinning:1];
  [(UIKeyboardImpl *)self setGeometryIsChanging:1];
  [(UIKeyboardImpl *)self clearForwardingInputDelegateAndResign:1];
  if (+[UIKeyboard isKeyboardProcess])
  {
    char v6 = [(UIKeyboardImpl *)self inputSystemSourceSession];
    unint64_t v7 = v6;
    if (v6)
    {
      char v8 = [v6 textOperations];
      [v8 setEditingActionSelector:sel_cancelOperation_];

      double v9 = [(UIKeyboardImpl *)self buildInputSourceState];
      char v10 = [v7 textOperations];
      [v10 setInputSourceState:v9];

      [v7 flushOperations];
    }
  }
  else
  {
    unint64_t v11 = [(UIKeyboardImpl *)self delegateAsResponder];
    int v12 = [v11 isFirstResponder];

    if (!v12)
    {
      [v13 _reloadInputViewsForResponder:0];
      goto LABEL_10;
    }
    unint64_t v7 = [(UIKeyboardImpl *)self delegateAsResponder];
    [v7 resignFirstResponder];
  }

LABEL_10:
  [(UIKeyboardImpl *)self setGeometryIsChanging:0];
  [v13 setIgnoresPinning:v5];
  [(UIKeyboardImpl *)self sendKeyboardDismissalNotification];
}

- (void)sendKeyboardDismissalNotification
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__UIKeyboardImpl_sendKeyboardDismissalNotification__block_invoke;
  aBlock[3] = &unk_1E52E34C8;
  void aBlock[4] = self;
  BOOL v3 = _Block_copy(aBlock);
  if (qword_1EB25A020 != -1) {
    dispatch_once(&qword_1EB25A020, &__block_literal_global_593_0);
  }
  int v4 = [(UIKeyboardImpl *)self taskQueue];
  [v4 addTask:v3 breadcrumb:qword_1EB25A018];
}

void __51__UIKeyboardImpl_sendKeyboardDismissalNotification__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [*(id *)(a1 + 32) inputDelegateManager];
  char v4 = [v3 callKeyboardWillDismiss];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 postNotificationName:@"UIKeyboardPrivateDidRequestDismissalNotification" object:0];
  }
  [v6 returnExecutionToParent];
}

void __51__UIKeyboardImpl_sendKeyboardDismissalNotification__block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_595_0 copy];
  id v1 = (void *)qword_1EB25A018;
  qword_1EB25A018 = v0;
}

uint64_t __51__UIKeyboardImpl_sendKeyboardDismissalNotification__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

- (void)dismissKeyboard
{
  p_m_geometryDelegate = &self->m_geometryDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  int v5 = [WeakRetained canDismiss];

  if (v5)
  {
    id v6 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    uint64_t v7 = [v6 keyboardAppearance];

    if (v7 == 127
      || ![(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached]
      || (+[UIKeyboardInputModeController sharedInputModeController](UIKeyboardInputModeController, "sharedInputModeController"), char v8 = objc_claimAutoreleasedReturnValue(), [v8 currentInputMode], v9 = objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v9, "showSWLayoutWithHWKeyboard"), v9, v8, (v10 & 1) != 0))
    {
      [(UIKeyboardImpl *)self nonDestructivelyDismissKeyboard];
    }
    else
    {
      if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        [(UIKeyboardImpl *)self setShowsCandidateBar:0];
      }
      [(UIKeyboardImpl *)self prepareForGeometryChange];
      id v11 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
      [v11 setMinimized:1];

      [(UIKeyboardImpl *)self geometryChangeDone:0];
      [(UIKeyboardImpl *)self setAutomaticMinimizationEnabled:1];
    }
    [(UIKeyboardImpl *)self sendKeyboardDismissalNotification];
  }
}

- (void)_attemptAuthenticationWithMessage:(id)a3
{
}

- (void)cancelAllKeyEvents
{
}

- (void)_handleWebKeyEvent:(id)a3 withEventType:(unint64_t)a4 withInputString:(id)a5 withInputStringIgnoringModifiers:(id)a6
{
}

- (void)_handleWebKeyEvent:(id)a3 withIndex:(unint64_t)a4 inInputString:(id)a5
{
}

- (void)triggerPendingKeyup
{
}

- (void)allowResponderChainFirstChanceToHandleKeyEvent:(id)a3
{
}

- (void)_handleKeyEvent:(id)a3 executionContext:(id)a4
{
}

- (void)handleKeyEvent:(id)a3
{
}

- (BOOL)_isKeyCommand:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _isKeyCommand:a3];
}

- (BOOL)_handlesKeyCommandForEvent:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _handlesKeyCommandForEvent:a3];
}

- (BOOL)_handleKeyCommand:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _handleKeyCommand:a3];
}

- (void)completeHandleKeyEvent:(id)a3
{
}

- (BOOL)deferEventHandlingToSystemWithContext:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager deferEventHandlingToSystemWithContext:a3];
}

- (void)toggleSoftwareKeyboard
{
  p_m_geometryDelegate = &self->m_geometryDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  if ([WeakRetained isActive])
  {
    id v4 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
    int v5 = [v4 isAutomatic];

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
      -[UIKeyboardImpl setAutomaticMinimizationEnabled:](self, "setAutomaticMinimizationEnabled:", [v6 isMinimized] ^ 1);

      id v7 = objc_loadWeakRetained((id *)p_m_geometryDelegate);
      LODWORD(v6) = [v7 isMinimized];

      if (v6)
      {
        [(UIKeyboardImpl *)self showKeyboard];
      }
      else
      {
        [(UIKeyboardImpl *)self hideKeyboard];
      }
    }
  }
  else
  {
  }
}

- (void)ejectKeyDown
{
}

- (void)updateIsAttachedHardwareKeyboard
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  cf = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  CFArrayRef v2 = IOHIDEventSystemClientCopyServices(cf);
  uint64_t v3 = [(__CFArray *)v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v29;
    CFArrayRef v20 = v2;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v6 = 0;
      uint64_t v18 = v4;
      do
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(v2);
        }
        service = *(__IOHIDServiceClient **)(*((void *)&v28 + 1) + 8 * v6);
        id v7 = (void *)IOHIDServiceClientCopyProperty(service, @"DeviceUsagePairs");
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = v6;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v8 = v7;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v25;
            while (2)
            {
              for (uint64_t i = 0; i != v10; ++i)
              {
                if (*(void *)v25 != v11) {
                  objc_enumerationMutation(v8);
                }
                id v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v14 = [v13 objectForKey:@"DeviceUsagePage"];
                  BOOL v15 = [v13 objectForKey:@"DeviceUsage"];
                  if ([v14 isEqual:&unk_1ED3F5448]
                    && [v15 isEqual:&unk_1ED3F5460])
                  {
                    float v16 = (void *)IOHIDServiceClientCopyProperty(service, @"Transport");
                    if (([v16 isEqualToString:@"AID"] & 1) != 0
                      || [v16 isEqualToString:@"USB"])
                    {
                      [(UIKeyboardImpl *)self setIsAttachedHardwareKeyboard:MEMORY[0x1E4F1CC38]];
                      CFRelease(cf);

                      CFArrayRef v2 = v20;
                      goto LABEL_27;
                    }
                  }
                }
              }
              uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }

          uint64_t v6 = v19;
          CFArrayRef v2 = v20;
          uint64_t v5 = v17;
          uint64_t v4 = v18;
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [(__CFArray *)v2 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v4);
  }

  [(UIKeyboardImpl *)self setIsAttachedHardwareKeyboard:MEMORY[0x1E4F1CC28]];
  if (cf) {
    CFRelease(cf);
  }
LABEL_27:
}

- (void)setKeyboardMinimizedByDictation:(BOOL)a3
{
}

- (void)showKeyboardIfNeeded
{
  if (+[UIDictationController isRunningInTypeAndTalkMode])
  {
    uint64_t v3 = +[UIDictationController activeInstance];
    if ([v3 shouldSuppressSoftwareKeyboard]
      && [(UIKeyboardImpl *)self isMinimized])
    {
      int v4 = ![(UIKeyboardImpl *)self isInHardwareKeyboardMode];
    }
    else
    {
      int v4 = 0;
    }
  }
  else
  {
    int v4 = 0;
  }
  if ([(UIKeyboardImpl *)self hardwareKeyboardIsSeen] && !v4
    || ![(UIKeyboardImpl *)self isMinimized]
    || [(UIKeyboardImpl *)self isEmojiPopoverPresented]
    || [(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardByOneness])
  {
    return;
  }
  uint64_t v5 = [(UIKeyboardImpl *)self isAttachedHardwareKeyboard];

  if (!v5) {
    [(UIKeyboardImpl *)self updateIsAttachedHardwareKeyboard];
  }
  id v9 = [(UIKeyboardImpl *)self isAttachedHardwareKeyboard];
  if (![v9 BOOLValue])
  {

LABEL_21:
    id v7 = +[UIDictationController activeInstance];
    int v8 = [v7 shouldSuppressSoftwareKeyboard];

    if (v8) {
      [(UIKeyboardImpl *)self setKeyboardMinimizedByDictation:0];
    }
    [(UIKeyboardImpl *)self toggleSoftwareKeyboard];
    return;
  }
  if (v4)
  {
    BOOL v6 = [(UIKeyboardImpl *)self isMinimized];

    if (!v6) {
      return;
    }
    goto LABEL_21;
  }
}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 2) {
    [(UIResponder *)self->m_layout remoteControlReceivedWithEvent:v4];
  }
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 7) {
    [(UIResponder *)self->m_layout _wheelChangedWithEvent:v4];
  }
}

- (void)_moveWithEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 5 && -[UIKeyboardLayout canHandleEvent:](self->m_layout, "canHandleEvent:", v4))
  {
    [(UIKeyboardImpl *)self clearLanguageIndicator];
    [(UIResponder *)self->m_layout _moveWithEvent:v4];
  }
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  m_layout = self->m_layout;
  if (m_layout) {
    LOBYTE(m_layout) = [(UIKeyboardLayout *)m_layout canHandlePresses:a3 withEvent:a4];
  }
  return (char)m_layout;
}

- (id)_activeAssertionController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _activeAssertionController];
}

- (void)setCaretBlinks:(BOOL)a3
{
  id v6 = [(UIKeyboardImpl *)self textInteractionAssistant];
  if (a3)
  {
    uint64_t v5 = [(UIKeyboardImpl *)self _activeAssertionController];
    objc_msgSend(v6, "setCursorBlinks:", objc_msgSend(v5, "_isNonBlinking") ^ 1);
  }
  else
  {
    [v6 setCursorBlinks:0];
  }
}

- (void)setCaretVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIKeyboardImpl *)self textInteractionAssistant];
  [v4 setCursorVisible:v3];
}

- (BOOL)caretBlinks
{
  CFArrayRef v2 = [(UIKeyboardImpl *)self textInteractionAssistant];
  char v3 = [v2 cursorBlinks];

  return v3;
}

- (BOOL)caretVisible
{
  CFArrayRef v2 = [(UIKeyboardImpl *)self textInteractionAssistant];
  char v3 = [v2 cursorVisible];

  return v3;
}

- (void)clearSelection
{
}

- (id)dynamicCaretList
{
  CFArrayRef v2 = [(UIKeyboardImpl *)self textInteractionAssistant];
  char v3 = [v2 _legacySelectionView];
  id v4 = [v3 dynamicCaretList];

  return v4;
}

- (void)updateNoContentViews
{
  char v3 = [(UIKeyboardImpl *)self dynamicCaretList];

  if (v3)
  {
    id v5 = [(UIKeyboardImpl *)self textInteractionAssistant];
    id v4 = [v5 _legacySelectionView];
    objc_msgSend(v4, "updateDocumentHasContent:", -[UIKeyboardImpl noContent](self, "noContent") ^ 1);
  }
}

- (BOOL)canHandleKeyHitTest
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager canHandleKeyHitTest];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  BOOL v8 = -[UIKeyboardImpl pointInside:forEvent:](self, "pointInside:forEvent:", [v7 _gsEvent], x, y)
    || -[UIView pointInside:withEvent:](self->m_layout, "pointInside:withEvent:", v7, x, y);

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(UIKeyboardImpl *)self isMinimized])
  {
    [(UIView *)self bounds];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(UIKeyboardLayout *)self->m_layout hitBuffer];
    double v18 = v17;
    CGFloat v19 = -v17;
    v35.origin.double x = v10;
    v35.origin.double y = v12;
    v35.size.CGFloat width = v14;
    v35.size.CGFloat height = v16;
    CGRect v36 = CGRectInset(v35, 0.0, v19);
    CGFloat v20 = v36.origin.x;
    CGFloat v21 = v36.origin.y;
    CGFloat width = v36.size.width;
    CGFloat height = v36.size.height;
    long long v24 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];
    continuousPathIntroductionView = v24;
    if (v24
      || (continuousPathIntroductionView = self->_continuousPathIntroductionView) != 0
      || (continuousPathIntroductionView = self->_editingGestureIntroductionView) != 0
      || (continuousPathIntroductionView = self->_multilingualKeyboardIntroductionView) != 0)
    {
      long long v26 = continuousPathIntroductionView;
    }
    else
    {
      long long v26 = self->_multilingualSettingIntroductionView;
      if (!v26) {
        goto LABEL_11;
      }
    }
    -[UIView convertPoint:fromView:](v26, "convertPoint:fromView:", self, x, y);
    if (-[UIView pointInside:forEvent:](v26, "pointInside:forEvent:", a4))
    {
      LOBYTE(v8) = 1;
LABEL_24:

      return v8;
    }
LABEL_11:
    v37.origin.double x = v20;
    v37.origin.double y = v21;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    v34.double x = x;
    v34.double y = y;
    BOOL v27 = CGRectContainsPoint(v37, v34);
    m_layout = self->m_layout;
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", m_layout, x, y);
    int v8 = -[UIView pointInside:forEvent:](m_layout, "pointInside:forEvent:", a4);
    BOOL v29 = v18 != 0.0 || !v27;
    if (v29
      || !+[UIKeyboardImpl isSplit]
      || [(UIKeyboardImpl *)self centerFilled])
    {
      v8 |= v27;
    }
    if ([(UIKeyboardImpl *)self showsCandidateBar])
    {
      long long v30 = [(UIKeyboardImpl *)self candidateController];
      long long v31 = [v30 candidateBar];

      if ([v31 isHiddenOrHasHiddenAncestor])
      {
        int HasAlphaHittable = 0;
      }
      else
      {
        int HasAlphaHittable = -[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v31);
        if (HasAlphaHittable)
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v31, x, y);
          int HasAlphaHittable = objc_msgSend(v31, "pointInside:forEvent:", a4);
        }
      }
      LOBYTE(v8) = (HasAlphaHittable | v8) != 0;
    }
    goto LABEL_24;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  int v8 = [(UIKeyboardImpl *)self internationalKeyIntroductionView];
  continuousPathIntroductionView = v8;
  if (v8
    || (continuousPathIntroductionView = self->_continuousPathIntroductionView) != 0
    || (continuousPathIntroductionView = self->_editingGestureIntroductionView) != 0
    || (continuousPathIntroductionView = self->_multilingualKeyboardIntroductionView) != 0)
  {
    CGFloat v10 = continuousPathIntroductionView;
  }
  else
  {
    CGFloat v10 = self->_multilingualSettingIntroductionView;
    if (!v10) {
      goto LABEL_7;
    }
  }
  -[UIView convertPoint:fromView:](v10, "convertPoint:fromView:", self, x, y);
  double v11 = -[UIView hitTest:withEvent:](v10, "hitTest:withEvent:", v7);
  if (v11) {
    goto LABEL_34;
  }
LABEL_7:
  if ([(UIKeyboardImpl *)self showsCandidateBar])
  {
    CGFloat v12 = [(UIKeyboardImpl *)self candidateController];
    double v13 = [v12 candidateBar];

    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v13, x, y);
    double v15 = v14;
    double v17 = v16;
    if (([v13 isHiddenOrHasHiddenAncestor] & 1) == 0
      && -[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v13)
      && (objc_msgSend(v13, "pointInside:withEvent:", v7, v15, v17) & 1) != 0)
    {
      double v11 = objc_msgSend(v13, "hitTest:withEvent:", v7, v15, v17);
LABEL_25:

      goto LABEL_34;
    }
  }
  m_layout = self->m_layout;
  -[UIView convertPoint:fromView:](m_layout, "convertPoint:fromView:", self, x, y);
  -[UIView hitTest:withEvent:](m_layout, "hitTest:withEvent:", v7);
  CGFloat v19 = (UIKeyboardLayout *)objc_claimAutoreleasedReturnValue();
  CGFloat v20 = self->m_layout;

  if (v19 != v20)
  {
    if ([(UIKeyboardImpl *)self showsCandidateBar])
    {
LABEL_32:
      v35.receiver = self;
      v35.super_class = (Class)UIKeyboardImpl;
      -[UIView hitTest:withEvent:](&v35, sel_hitTest_withEvent_, v7, x, y);
      uint64_t v22 = (UIKeyboardLayout *)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    double v13 = [(UIKeyboardLayout *)self->m_layout candidateList];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v21 = v13;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v31 = [(UIKeyboardImpl *)self candidateController];
        char v32 = [v31 activeCandidateViewType];

        if (v32)
        {
          uint64_t v33 = [(UIKeyboardImpl *)self candidateController];
          uint64_t v23 = [v33 candidateKey];

          if (v23) {
            goto LABEL_21;
          }
        }
        else
        {
          uint64_t v23 = 0;
        }
        goto LABEL_31;
      }
      id v21 = [v13 view];
    }
    uint64_t v23 = v21;
    if (v21)
    {
LABEL_21:
      if (([v23 isHidden] & 1) == 0)
      {
        long long v24 = [(UIKeyboardImpl *)self candidateController];
        long long v25 = [v24 candidateResultSet];
        int v26 = [v25 hasCandidates];

        if (v26)
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v23, x, y);
          double v28 = v27;
          double v30 = v29;
          if (objc_msgSend(v23, "pointInside:withEvent:", v7))
          {
            double v11 = objc_msgSend(v23, "hitTest:withEvent:", v7, v28, v30);

            goto LABEL_25;
          }
        }
      }
    }
LABEL_31:

    goto LABEL_32;
  }
  uint64_t v22 = self->m_layout;
LABEL_33:
  double v11 = v22;
LABEL_34:

  return v11;
}

- (BOOL)isAutoFillMode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isAutoFillMode];
}

- (void)trackUsageForPromptedCorrection:(id)a3 inputString:(id)a4 previousPrompt:(id)a5
{
}

- (void)trackUsageForCandidateAcceptedAction:(id)a3
{
}

- (id)responderForSendCurrentLocation
{
  CFArrayRef v2 = [(UIKeyboardImpl *)self inputDelegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && (uint64_t v3 = [v2 _sendCurrentLocationAction]) != 0)
  {
    id v4 = [v2 targetForAction:v3 withSender:0];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)performSendCurrentLocation
{
  id v5 = [(UIKeyboardImpl *)self inputDelegate];
  uint64_t v3 = [(UIKeyboardImpl *)self responderForSendCurrentLocation];
  if (v3)
  {
    id v4 = (const char *)[v5 _sendCurrentLocationAction];
    if (dyld_program_sdk_at_least()) {
      [v3 v4];
    }
    else {
      objc_msgSend(v3, sel_performSelector_, v4);
    }
  }
}

- (void)enableTransientInputDelegateSelectionMode
{
  uint64_t v3 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__UIKeyboardImpl_enableTransientInputDelegateSelectionMode__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  [v3 performBlock:v4];
}

uint64_t __59__UIKeyboardImpl_enableTransientInputDelegateSelectionMode__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enableTransientSelectionMode];
}

- (void)enableTransientSelectionMode
{
  uint64_t v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v4 = [v3 delegateRespectingForwardingDelegate:0];
  [(UIKeyboardImpl *)self _setTransientSelectionModeEnabled:1 forInputDelegate:v4];

  if (+[UIKeyboard isKeyboardProcess])
  {
    id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v7 = [v5 inputSystemSourceSession];

    if (v7)
    {
      id v6 = [v7 textOperations];
      [v6 setEditingActionSelector:sel_enableTransientSelectionMode];
      [v7 flushOperations];
    }
  }
}

- (void)disableTransientSelectionMode
{
  uint64_t v3 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v4 = [v3 delegateRespectingForwardingDelegate:0];
  [(UIKeyboardImpl *)self _setTransientSelectionModeEnabled:0 forInputDelegate:v4];

  if (+[UIKeyboard isKeyboardProcess])
  {
    id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v7 = [v5 inputSystemSourceSession];

    if (v7)
    {
      id v6 = [v7 textOperations];
      [v6 setEditingActionSelector:sel_disableTransientSelectionMode];
      [v7 flushOperations];
    }
  }
}

- (void)clearForwardingInputDelegateAndResign:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIKeyboardImpl *)self _hasMarkedText])
  {
    if (+[UIKeyboard isInputSystemUI])
    {
      id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
      id v6 = [v5 forwardingInputDelegate];

      if (v6)
      {
        id v7 = [(UIKeyboardImpl *)self inputDelegateManager];
        [v7 unmarkText];
      }
    }
  }
  int v8 = [(UIKeyboardImpl *)self inputDelegateManager];
  [v8 clearForwardingInputDelegateAndResign:v3];

  id v9 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v9 forwardClearForwardingInputDelegateAndResign:v3];
}

- (void)didChangeForwardingInputDelegate:(id)a3
{
  [(UIKeyboardImpl *)self takeTextInputTraitsFromDelegate];
  if (a3)
  {
    id v5 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v6 = [v5 forwardingInputDelegate];
    uint64_t v7 = [v6 keyboardType];

    if (v7 == 122)
    {
      [(UIKeyboardImpl *)self recomputeActiveInputModesWithExtensions:0 allowNonLinguisticInputModes:1];
    }
  }
  else
  {
    [(UIKeyboardImpl *)self disableTransientSelectionMode];
    [(UIKeyboardImpl *)self recomputeActiveInputModesWithExtensions:1 allowNonLinguisticInputModes:1];
    int v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v8 updateRenderConfigForCurrentResponder];

    [(UIKeyboardImpl *)self reinitializeAfterInputModeSwitch:0];
    if (objc_opt_respondsToSelector())
    {
      m_layout = self->m_layout;
      [(UIKeyboardLayout *)m_layout didTriggerDestructiveRenderConfigChange];
    }
  }
}

- (void)_setTransientSelectionModeEnabled:(BOOL)a3 forInputDelegate:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v6 interactionAssistant];
    [v5 setSelectionDisplayVisible:1];
    [v5 setCursorBlinkAnimationEnabled:v4 ^ 1];
    [v5 setGhostAppearance:v4];
  }
}

- (void)_ensureRTIConnection
{
}

- (id)remoteTextInputPartnerPrivate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager remoteTextInputPartnerPrivate];
}

- (id)buildInputSourceState
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F95EC0]);
  BOOL v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v5 = [v4 currentInputMode];
  id v6 = [v5 identifier];
  [v3 setInputMode:v6];

  objc_msgSend(v3, "setMinimized:", -[UIKeyboardImpl isMinimized](self, "isMinimized"));
  objc_msgSend(v3, "setHardwareKeyboardMode:", -[UIKeyboardImpl isInHardwareKeyboardMode](self, "isInHardwareKeyboardMode"));
  objc_msgSend(v3, "setCenterFilled:", -[UIKeyboardImpl centerFilled](self, "centerFilled"));
  objc_msgSend(v3, "setSplit:", objc_msgSend((id)objc_opt_class(), "isSplit"));
  if ([v3 split])
  {
    [(UIKeyboardImpl *)self frameForKeylayoutName:@"split-left"];
    objc_msgSend(v3, "setLeftSplitFrame:");
    [(UIKeyboardImpl *)self frameForKeylayoutName:@"split-right"];
    objc_msgSend(v3, "setRightSplitFrame:");
  }
  objc_msgSend(v3, "setFloating:", objc_msgSend((id)objc_opt_class(), "isFloating"));
  objc_msgSend(v3, "setShowingEmojiSearch:", -[UIKeyboardImpl showingEmojiSearch](self, "showingEmojiSearch"));
  objc_msgSend(v3, "setUsesCandidateSelection:", -[UIKeyboardImpl usesCandidateSelection](self, "usesCandidateSelection"));
  objc_msgSend(v3, "setShowsCandidateBar:", -[UIKeyboardImpl showsCandidateBar](self, "showsCandidateBar"));
  uint64_t v7 = [(_UIKeyboardStateManager *)self->_keyboardStateManager inputManagerState];
  objc_msgSend(v3, "setSupportsSetPhraseBoundary:", objc_msgSend(v7, "supportsSetPhraseBoundary"));

  return v3;
}

- (void)notifyInputSourceStateChangeIfNeeded
{
}

- (id)remoteTextEditingMetadata
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager remoteTextEditingMetadata];
}

- (unint64_t)delegateConformanceType
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager delegateConformanceType];
}

- (void)resetInputDelegate
{
}

- (id)inputSystemSourceSession
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inputSystemSourceSession];
}

- (void)modifyTextInputTraits:(id)a3 forceSync:(BOOL)a4
{
}

- (void)updateInputDelegateForRemoteTraitChange:(id)a3 forceSync:(BOOL)a4
{
}

- (void)updateInputDelegateForRemoteDocumentStateChange:(id)a3 selectedTextRange:(_NSRange)a4 hasText:(BOOL)a5 forceSync:(BOOL)a6
{
}

- (void)updateForExpectedRemoteDocumentStateChange:(id)a3 selectedTextRange:(_NSRange)a4 forceSync:(BOOL)a5
{
}

- (BOOL)assertTextForRemoteDocument:(id)a3 withSelectionDelta:(id)a4 updatingSelection:(BOOL)a5
{
  return -[_UIKeyboardStateManager assertTextForRemoteDocument:withSelectionDelta:updatingSelection:](self->_keyboardStateManager, "assertTextForRemoteDocument:withSelectionDelta:updatingSelection:", a3, a4.var0, a4.var1, a5);
}

- (id)asyncWebKitInteractionDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager asyncWebKitInteractionDelegate];
}

- (void)insertAttributedText:(id)a3
{
}

- (void)updateAssistantViewInfo:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v5 = [v4 systemInputAssistantViewController];

  [v5 setRemoteAssistantViewInfo:v3];
}

- (void)applyAssistantItem:(id)a3
{
  id v4 = a3;
  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v6 = [v5 systemInputAssistantViewController];

  [v6 applyRemoteAssistantItem:v4];
  [(UIKeyboardImpl *)self updateInputAssistantButtonItems];
}

- (void)unmarkText:(id)a3
{
}

- (BOOL)hasMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _hasMarkedText];
}

- (BOOL)_hasMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _hasMarkedText];
}

- (id)markedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _markedText];
}

- (id)_markedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _markedText];
}

- (void)handleRemoteDictationEvent_switchToDictationInputModeWithOptions:(id)a3
{
  id v3 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v5 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      uint64_t v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v5)
  {
    int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_switchToDictationInputModeWithOptions____s_category_0)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unexpected event handling", v9, 2u);
    }
  }
  id v6 = +[UIDictationController sharedInstance];
  [v6 switchToDictationInputModeWithOptions:v3];
}

- (void)handleRemoteDictationEvent_switchToDictationLanguage:(id)a3
{
  id v3 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v5 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      uint64_t v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v5)
  {
    int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_switchToDictationLanguage____s_category_0)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unexpected event handling", v9, 2u);
    }
  }
  id v6 = +[UIDictationController sharedInstance];
  [v6 switchToDictationLanguage:v3];
}

- (void)handleRemoteDictationEvent_startDictation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v3 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      BOOL v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_startDictation___s_category_0)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unexpected event handling", v7, 2u);
    }
  }
  id v4 = +[UIDictationController sharedInstance];
  [v4 startDictation];
}

- (void)handleRemoteDictationEvent_stopDictation:(BOOL)a3
{
  BOOL v3 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v5 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v5)
    {
      int v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v5)
  {
    id v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_stopDictation____s_category_0)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected event handling", v10, 2u);
    }
  }
  id v6 = +[UIDictationController sharedInstance];
  [v6 stopDictation:v3];

  uint64_t v7 = +[UIDictationController activeInstance];
  [v7 resignFirstResponderWhenIdleIfNeeded];
}

- (void)handleRemoteDictationEvent_cancelDictation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v3 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      id v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    uint64_t v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_cancelDictation___s_category_0)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unexpected event handling", v8, 2u);
    }
  }
  id v4 = +[UIDictationController sharedInstance];
  [v4 cancelDictation];

  BOOL v5 = +[UIDictationController activeInstance];
  [v5 resignFirstResponderWhenIdleIfNeeded];
}

- (void)handleRemoteDictationEvent_handleTip:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      CGFloat v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_handleTip____s_category_0)
                       + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CGFloat v12 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Unexpected event handling", v12, 2u);
    }
  }
  dictationPopoverController = self->_dictationPopoverController;
  if (v4)
  {
    int v8 = [v4 objectForKeyedSubscript:@"text"];
    id v9 = [v4 objectForKeyedSubscript:@"title"];
    [(UIDictationPopoverController *)dictationPopoverController presentTip:v8 tipDescription:v9];
  }
  else
  {
    [(UIDictationPopoverController *)dictationPopoverController dismissTip];
  }
}

- (void)handleRemoteDictationEvent_movePopoverView:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      double v14 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_movePopoverView____s_category_0)+ 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v16 = 0;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Unexpected event handling", v16, 2u);
    }
  }
  uint64_t v7 = [(UIKeyboardImpl *)self inputDelegate];
  int v8 = [v7 _window];
  id v9 = [(UIKeyboardImpl *)self window];

  if (v8 != v9)
  {
    dictationPopoverController = self->_dictationPopoverController;
    double v11 = [v4 objectForKeyedSubscript:@"sourceRect"];
    [v11 rectValue];
    -[UIDictationPopoverController movePopoverView:](dictationPopoverController, "movePopoverView:");

    CGFloat v12 = [v4 objectForKeyedSubscript:@"editMenuFrame"];
    double v13 = v12;
    if (v12)
    {
      [v12 rectValue];
      -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:");
    }
  }
}

- (void)handleRemoteDictationEvent_setEditMenuFrame:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      double v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    CGFloat v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_setEditMenuFrame____s_category_0)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Unexpected event handling", v13, 2u);
    }
  }
  uint64_t v7 = [(UIKeyboardImpl *)self inputDelegate];
  int v8 = [v7 _window];
  id v9 = [(UIKeyboardImpl *)self window];

  if (v8 != v9)
  {
    CGFloat v10 = [v4 objectForKeyedSubscript:@"editMenuFrame"];
    [v10 rectValue];
    -[UIKeyboardImpl setEditMenuFrame:](self, "setEditMenuFrame:");
  }
}

- (void)handleRemoteDictationEvent_updateIdleDetection:(int64_t)a3
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      uint64_t v7 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v7, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    int v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_updateIdleDetection____s_category_0)+ 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "Unexpected event handling", v9, 2u);
    }
  }
  [(UIKeyboardImpl *)self updateIdleDetection:a3];
}

- (void)handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v3 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      BOOL v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    BOOL v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unexpected event handling", v7, 2u);
    }
  }
  id v4 = +[UIDictationController sharedInstance];
  [v4 stopDictationIgnoreFinalizePhrases];
}

- (void)handleRemoteDictationEvent_resumeDictation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v3 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v3)
    {
      BOOL v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v3)
  {
    BOOL v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteDictationEvent_resumeDictation___s_category_0)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Unexpected event handling", v7, 2u);
    }
  }
  id v4 = +[UIDictationController sharedInstance];
  [v4 resumeDictation];
}

- (void)handleRemoteKeyboardCameraEvent_startCameraInput:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      id v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Unexpected event handling", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    CGFloat v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &handleRemoteKeyboardCameraEvent_startCameraInput____s_category_0)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Unexpected event handling", v11, 2u);
    }
  }
  uint64_t v7 = +[UIKeyboardCameraSession sharedSession];
  int v8 = [(UIKeyboardImpl *)self inputDelegate];
  [v7 showForResponder:v8 sender:0 rtiConfiguration:v4];
}

- (void)handleEventFromRemoteSource_insertSupplementalCandidate:(id)a3 textToCommit:(id)a4
{
}

- (void)handleEventFromRemoteSource_chooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
}

- (void)handleEventCallbackFromRemoteDestination_didChooseSupplementalItem:(id)a3 toReplaceText:(id)a4
{
}

- (void)handleEventFromRemoteSource_cancelChooseSupplementalItemToInsert
{
}

- (void)handleEventFromRemoteSource_insertionPointEnteredText:(id)a3 withSupplementalCandidate:(id)a4
{
}

- (void)handleEventFromRemoteDestination_canSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
}

- (void)handleEventFromRemoteSource_insertAutofillContent:(id)a3
{
}

- (void)handleEventFromRemoteSource_autoFillIsMenuPresented:(BOOL)a3
{
}

- (BOOL)shouldSuppressSelectionCommands
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldSuppressSelectionCommands];
}

- (void)pauseDictationForResponderChange
{
  if (+[UIDictationController isRunning])
  {
    BOOL v3 = _UIDictationControllerLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "UIDictationController pauseDictationForResponderChange", v7, 2u);
    }

    id v4 = +[UIDictationController sharedInstance];
    [v4 pauseDictation];

    [(UIKeyboardImpl *)self dismissDictationPopover];
    BOOL v5 = +[UIDictationLandingView activeInstance];
    LODWORD(v4) = [v5 canStopLanding];

    if (v4)
    {
      BOOL v6 = +[UIDictationLandingView activeInstance];
      [v6 stopLanding];
    }
  }
}

- (void)handleDictationForResponderChange
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (+[UIDictationController isRunning])
  {
    BOOL v3 = [(UIKeyboardImpl *)self textInputTraits];
    BOOL v4 = +[UIDictationController checkTraitsSupportDictation:v3];

    BOOL v5 = _UIDictationControllerLog();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "UIDictationController resumeDictationForResponderChange", (uint8_t *)&v17, 2u);
      }

      uint64_t v7 = +[UIDictationController sharedInstance];
      [v7 resumeDictation];

      if (!+[UIKeyboard isRedesignedTextCursorEnabled]
        && ![(UIKeyboardImpl *)self isDictationMenuPresented])
      {
        [(UIKeyboardImpl *)self presentDictationMenu];
      }
    }
    else
    {
      if (v6)
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "UIDictationController resumeDictationForResponderChange cancelDictation instead -> new responder does not support dictation", (uint8_t *)&v17, 2u);
      }

      CGFloat v10 = +[UIDictationController sharedInstance];
      [v10 setReasonType:20];

      double v11 = +[UIDictationController sharedInstance];
      [v11 cancelDictation];
    }
    CGFloat v12 = +[UIDictationController sharedInstance];
    [v12 setSkipAutomaticResumeDictation:0];

    double v13 = _UIDictationControllerLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = +[UIDictationController sharedInstance];
      int v15 = [v14 skipAutomaticResumeDictation];
      int v17 = 136315394;
      double v18 = "-[UIKeyboardImpl handleDictationForResponderChange]";
      __int16 v19 = 1024;
      int v20 = v15;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "%s, set skipAutomaticResumeDictation=%d", (uint8_t *)&v17, 0x12u);
    }
    m_resumeDictationForResponderChange = self->m_resumeDictationForResponderChange;
    self->m_resumeDictationForResponderChange = 0;
  }
  else
  {
    int v8 = +[UIDictationController sharedInstance];
    [v8 setShouldResumeDictation:0];

    id v9 = self->m_resumeDictationForResponderChange;
    self->m_resumeDictationForResponderChange = 0;
  }
}

- (void)resumeDictationForResponderChange
{
  if (+[UIDictationController isRunning]
    && (+[UIDictationController sharedInstance],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isDictationPaused],
        v3,
        v4))
  {
    m_resumeDictationForResponderChange = self->m_resumeDictationForResponderChange;
    if (m_resumeDictationForResponderChange)
    {
      [(UIDelayedAction *)m_resumeDictationForResponderChange touch];
    }
    else
    {
      CGFloat v10 = [[UIDelayedAction alloc] initWithTarget:self action:sel_handleDictationForResponderChange userInfo:0 delay:0.5];
      double v11 = self->m_resumeDictationForResponderChange;
      self->m_resumeDictationForResponderChange = v10;
    }
  }
  else
  {
    BOOL v6 = +[UIDictationController sharedInstance];
    int v7 = [v6 shouldResumeDictation];

    if (v7)
    {
      int v8 = +[UIDictationController sharedInstance];
      [v8 setShouldResumeDictation:0];

      id v9 = self->m_resumeDictationForResponderChange;
      self->m_resumeDictationForResponderChange = 0;
    }
  }
}

- (void)assertTextForDictation
{
  BOOL v3 = [(UIKeyboardImpl *)self inputSystemSourceSession];
  if (v3)
  {
    double v13 = v3;
    BOOL v4 = +[UIKeyboard isKeyboardProcess];
    BOOL v3 = v13;
    if (!v4)
    {
      BOOL v5 = [(UIKeyboardImpl *)self documentState];
      BOOL v6 = [v5 contextBeforeInput];
      uint64_t v7 = [v6 length];
      int v8 = [v5 selectedText];
      uint64_t v9 = [v8 length];

      CGFloat v10 = [v5 fullString];
      double v11 = [v13 textOperations];
      [v11 setTextToAssert:v10];

      CGFloat v12 = [v13 textOperations];
      objc_msgSend(v12, "setSelectionRangeToAssert:", v7, v9);

      [v13 flushOperations];
      BOOL v3 = v13;
    }
  }
}

- (id)inlineTextCompletionController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inlineTextCompletionController];
}

- (id)inlineCompletionAsMarkedText
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager inlineCompletionAsMarkedText];
}

- (void)handleGrammarCorrectionEntries:(id)a3
{
  id v5 = a3;
  if (+[UIKeyboard usesInputSystemUI])
  {
    BOOL v4 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v4 forwardGrammarCorrectionEntries:v5];
  }
  else
  {
    +[UITextChecker handleGrammarCorrectionEntries:v5];
  }
}

- (BOOL)shouldIgnoreTextInputChanges
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputChangesIgnored];
}

- (void)setShouldIgnoreTextInputChanges:(BOOL)a3
{
}

- (_UITextInputUserInteractionDelegate)userInteractionDelegate
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager userInteractionDelegate];
}

- (void)setUserInteractionDelegate:(id)a3
{
}

+ (void)setParentTestForProfiling:(id)a3
{
}

+ (void)sendPerformanceNotification:(id)a3
{
}

+ (void)sendPerformanceNotification:(id)a3 userInfo:(id)a4
{
  if (kbProfilingParentTest)
  {
    id v5 = (void *)MEMORY[0x1E4F28EB8];
    id v6 = a4;
    id v7 = a3;
    id v8 = [v5 defaultCenter];
    [v8 postNotificationName:v7 object:0 userInfo:v6];
  }
}

- (void)_setInputManager:(id)a3
{
}

- (void)_setShiftLockedEnabled:(BOOL)a3
{
}

- (void)updateFromTextInputTraits
{
  [(UIKeyboardImpl *)self takeTextInputTraitsFromDelegate];
  [(UIKeyboardImpl *)self updateReturnKey:1];
}

- (BOOL)_isShowingCandidateUIWithAvailableCandidates
{
  _UIDeviceNativeUserInterfaceIdiom();
  BOOL v3 = [(UIKeyboardImpl *)self showsCandidateBar];
  if (v3)
  {
    BOOL v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
    char v5 = [v4 hasCandidates];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (int64_t)_needAutofillCandidate:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager needAutofillCandidate:a3];
}

- (void)_setAutofillGroup:(id)a3
{
}

- (id)_autofillGroup
{
  CFArrayRef v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autofillController];
  BOOL v3 = [v2 autofillGroup];

  return v3;
}

- (id)_fallbackAutofillGroup
{
  CFArrayRef v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autofillController];
  BOOL v3 = [v2 fallbackAutofillGroup];

  return v3;
}

- (BOOL)_containsUsernamePasswordPairsInAutofillGroup:(id)a3
{
  keyboardStateManager = self->_keyboardStateManager;
  id v4 = a3;
  char v5 = [(_UIKeyboardStateManager *)keyboardStateManager autofillController];
  char v6 = [v5 containsUsernamePasswordPairsInAutofillGroup:v4];

  return v6;
}

- (void)_setCandidateController:(id)a3
{
  objc_storeStrong((id *)&self->m_candidateController, a3);
  id v5 = a3;
  [(_UIKeyboardStateManager *)self->_keyboardStateManager _setCandidateList:v5];
}

- (void)_textSelectionEditMenuDidShow
{
  if (self->m_showsCandidateBar)
  {
    BOOL v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    uint64_t v4 = [v3 allowsTextAnimationsType];

    if (v4 == 2)
    {
      m_candidateController = self->m_candidateController;
      [(UIKeyboardCandidateController *)m_candidateController updateStates];
    }
  }
}

- (BOOL)isSelectionChanging
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager isSelectionChanging];
}

- (void)createTypoTrackerReport
{
}

- (void)presentKeyboardFeedbackAssistantViewControllerForLogURL:(id)a3
{
  id v4 = a3;
  if (+[UIKeyboard isKeyboardProcess])
  {
    id v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v5 forwardTypologyLogURL:v4];
  }
  else
  {
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x2050000000;
    char v6 = (void *)qword_1EB25A048;
    uint64_t v18 = qword_1EB25A048;
    if (!qword_1EB25A048)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getKFAViewControllerClass_block_invoke;
      location[3] = &unk_1E52D9900;
      location[4] = &v15;
      __getKFAViewControllerClass_block_invoke((uint64_t)location);
      char v6 = (void *)v16[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v15, 8);
    id v8 = objc_alloc_init(v7);
    [(UIKeyboardImpl *)self setKeyboardFeedbackAssistantViewController:v8];

    uint64_t v9 = [(UIKeyboardImpl *)self keyboardFeedbackAssistantViewController];
    [v9 setDelegate:self];

    objc_initWeak(location, self);
    CGFloat v10 = [(UIKeyboardImpl *)self keyboardFeedbackAssistantViewController];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke;
    v11[3] = &unk_1E52DF168;
    objc_copyWeak(&v13, location);
    id v12 = v4;
    [v10 prepareWithCompletion:v11];

    objc_destroyWeak(&v13);
    objc_destroyWeak(location);
  }
}

void __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke(uint64_t a1, int a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      char v6 = [WeakRetained keyboardFeedbackAssistantViewController];
      id v7 = [v6 sheetPresentationController];

      id v8 = +[UISheetPresentationControllerDetent mediumDetent];
      v21[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
      [v7 setDetents:v9];

      CGFloat v10 = [v5 delegateAsResponder];
      double v11 = [v10 _window];
      id v12 = [v11 rootViewController];

      id v13 = [v12 presentedViewController];

      if (v13)
      {
        do
        {
          double v14 = [v12 presentedViewController];

          uint64_t v15 = [v14 presentedViewController];

          id v12 = v14;
        }
        while (v15);
      }
      else
      {
        double v14 = v12;
      }
      [v5 hideKeyboard];
      uint64_t v17 = [v5 keyboardFeedbackAssistantViewController];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke_2;
      v19[3] = &unk_1E52D9F98;
      v19[4] = v5;
      id v20 = *(id *)(a1 + 32);
      [v14 presentViewController:v17 animated:1 completion:v19];
    }
    else
    {
      double v16 = _UIKeyboardImplLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_error_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Failed to prepare Keyboard Feedback Assistant.", v18, 2u);
      }

      [v5 setKeyboardFeedbackAssistantViewController:0];
    }
  }
}

void __74__UIKeyboardImpl_presentKeyboardFeedbackAssistantViewControllerForLogURL___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) keyboardFeedbackAssistantViewController];
  [v2 setTypologyLogURL:*(void *)(a1 + 40)];
}

+ (BOOL)overrideNativeScreen
{
  return +[UIApplication _classicMode] == 7;
}

- (void)_performInputViewControllerOutput:(id)a3
{
}

- (void)_requestInputManagerSync
{
}

- (void)_tagTouchForTypingMenu:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  id v4 = (void (*)(uint64_t))off_1EB25A058;
  double v11 = off_1EB25A058;
  if (!off_1EB25A058)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __getSBSTagTouchForTypingMenuSymbolLoc_block_invoke_0;
    v7[3] = &unk_1E52D9900;
    v7[4] = &v8;
    __getSBSTagTouchForTypingMenuSymbolLoc_block_invoke_0(v7);
    id v4 = (void (*)(uint64_t))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (v4)
  {
    v4(v3);
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    char v6 = [NSString stringWithUTF8String:"void UIKBSBSTagTouchForTypingMenu(uint32_t)"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"UIKeyboardImpl.m", 290, @"%s", dlerror());

    __break(1u);
  }
}

- (void)clearExcessKeyboardMemory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([(id)UIApp _isSpringBoard])
  {
    uint64_t v3 = [(UIKeyboardImpl *)self inputDelegateManager];
    id v4 = [v3 delegateRespectingForwardingDelegate:0];

    if (!v4)
    {
      +[UIKBRenderer clearInternalCaches];
      id v5 = +[UIKeyboardCache sharedInstance];
      [v5 commitTransaction];

      char v6 = +[UIKeyboardCache sharedInstance];
      [v6 clearNonPersistentCache];

      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = self->m_keyedLayouts;
      uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = -[NSMutableDictionary objectForKey:](self->m_keyedLayouts, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
            [v12 clearUnusedObjects:1];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
    [(UIKeyboardLayout *)self->m_layout updateTouchProcessingForKeyboardChange];
  }
}

- (BOOL)keyboardDrawsOpaque
{
  BOOL v3 = [(UIView *)self->m_layout isOpaque];
  if (v3 != [(UIView *)self isOpaque]) {
    [(UIView *)self setOpaque:v3];
  }
  return v3;
}

- (void)clearLanguageIndicator
{
  m_languageIndicator = self->m_languageIndicator;
  if (m_languageIndicator)
  {
    [(UIView *)m_languageIndicator removeFromSuperview];
    id v4 = self->m_languageIndicator;
    self->m_languageIndicator = 0;
  }
}

- (BOOL)_shouldMinimizeForHardwareKeyboard
{
  if (!+[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate])return 1; {
  keyboardStateManager = self->_keyboardStateManager;
  }
  id v4 = +[UIDevice currentDevice];
  -[_UIKeyboardStateManager setHardwareKeyboardAttached:](keyboardStateManager, "setHardwareKeyboardAttached:", [v4 _isHardwareKeyboardAvailable]);

  if ([(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardByOneness]) {
    return 1;
  }
  if (![(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached]
    || ![(UIKeyboardImpl *)self automaticMinimizationEnabled])
  {
    return 0;
  }
  id v7 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v8 = [v7 currentInputMode];
  if ([v8 showSWLayoutWithHWKeyboard])
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v9 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
    BOOL v5 = [v9 keyboardAppearance] != 127;
  }
  return v5;
}

- (BOOL)_showsScribbleIconsInAssistantView
{
  BOOL v3 = +[UIKeyboard isMajelEnabled];
  if (v3)
  {
    if ([(UIKeyboardImpl *)self _shouldSuppressAssistantBar])
    {
      LOBYTE(v3) = 0;
    }
    else if ([(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboard] {
           || (BOOL v3 = [(UIKeyboardImpl *)self floatingForced]))
    }
    {
      BOOL v3 = +[UIKeyboardVisualModeManager softwareKeyboardAllowedForActiveKeyboardSceneDelegate];
      if (v3)
      {
        if ([(UIKeyboardImpl *)self isEmojiPopoverPresented]) {
          LOBYTE(v3) = 1;
        }
        else {
          LOBYTE(v3) = ![(UIKeyboardImpl *)self showingEmojiSearch];
        }
      }
    }
  }
  return v3;
}

- (BOOL)_shouldSuppressSoftwareKeyboardByDictation
{
  id v2 = +[UIDictationController activeInstance];
  char v3 = [v2 shouldSuppressSoftwareKeyboard];

  return v3;
}

- (BOOL)_shouldSuppressSoftwareKeyboardByOneness
{
  char v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 hardwareKeyboardExclusivityIdentifier];
  BOOL v5 = [(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardExclusivityIdentifier];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (BOOL)_shouldSuppressSoftwareKeyboardAndAssistantView
{
  if ([(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardByDictation]
    || (+[UIKeyboardCameraSession activeSession],
        char v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 shouldSuppressSoftwareKeyboard],
        v3,
        (v4 & 1) != 0))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    BOOL v5 = [(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboard];
    if (v5) {
      LOBYTE(v5) = ![(UIKeyboardImpl *)self _showsScribbleIconsInAssistantView];
    }
  }
  return v5;
}

- (BOOL)_shouldSuppressSoftwareKeyboard
{
  if ([(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardByDictation]) {
    return 1;
  }
  if ([(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardByOneness]) {
    return 1;
  }
  char v3 = +[UIKeyboardCameraSession activeSession];
  char v4 = [v3 shouldSuppressSoftwareKeyboard];

  if (v4) {
    return 1;
  }
  return [(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:0];
}

- (BOOL)_shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIKeyboardImpl *)self delegateAsResponder];
  LOBYTE(v3) = [(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardForResponder:v5 ignoringPolicyDelegate:v3];

  return v3;
}

- (void)_setShouldSuppressSoftwareKeyboard:(BOOL)a3
{
  self->m_shouldSuppressSoftwareKeyboard = a3;
}

- (void)unsetPolicyDelegateResult
{
  self->m_policyDelegateResult = 0;
}

- (BOOL)_shouldSuppressSoftwareKeyboardForResponder:(id)a3 ignoringPolicyDelegate:(BOOL)a4
{
  id v6 = a3;
  if (+[UIKeyboard isInputSystemUI])
  {
    char m_shouldSuppressSoftwareKeyboard = self->m_shouldSuppressSoftwareKeyboard;
  }
  else
  {
    [(UIKeyboardImpl *)self _updateShouldSuppressAssistantBar];
    char m_shouldSuppressSoftwareKeyboard = [v6 _suppressSoftwareKeyboard];
    if ((m_shouldSuppressSoftwareKeyboard & 1) == 0 && !a4)
    {
      uint64_t v8 = +[UIKeyboard suppressionPolicyDelegate];
      if (v8)
      {
        uint64_t v9 = (void *)v8;
        if (+[UIKeyboard isMajelEnabled]
          && [(UIKeyboardImpl *)self _textInputSourceForDelegate:v6] == 2)
        {
          char m_shouldSuppressSoftwareKeyboard = self->m_policyDelegateResult;
        }
        else
        {
          char m_shouldSuppressSoftwareKeyboard = [v9 _shouldSuppressForDelegate:v6];
          self->m_policyDelegateResult = m_shouldSuppressSoftwareKeyboard;
        }
      }
      else
      {
        char m_shouldSuppressSoftwareKeyboard = 0;
      }
    }
  }

  return m_shouldSuppressSoftwareKeyboard;
}

- (void)_updateKeyboardLanguage:(id)a3
{
  BOOL v3 = [a3 userInfo];
  id v9 = [v3 objectForKey:@"UITextInputUpdateKeyboardLanguageKey"];

  if ([v9 length])
  {
    char v4 = +[UIKeyboardInputModeController sharedInputModeController];
    BOOL v5 = [v4 inputModeIdentifierLastUsedForLanguage:v9];

    id v6 = (id)UIKeyboardActiveInputModes;
    int v7 = [v6 containsObject:v5];

    if (v7)
    {
      uint64_t v8 = +[UIKeyboardImpl activeInstance];
      [v8 setInputMode:v5 userInitiated:1];
    }
  }
}

- (void)_setShouldSuppressAssistantBar:(BOOL)a3
{
  self->m_shouldSuppressAssistantBar = a3;
}

- (BOOL)_shouldSuppressAssistantBar
{
  return self->m_shouldSuppressAssistantBar;
}

- (void)_updateShouldSuppressAssistantBar
{
  if (!+[UIKeyboard isInputSystemUI]
    && ![(UIKeyboardImpl *)self showingEmojiSearch])
  {
    BOOL v3 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    char v4 = [v3 wantsAssistantWhileSuppressingKeyboard];

    if ((v4 & 1) == 0)
    {
      BOOL v5 = +[UIKeyboard suppressionPolicyDelegate];
      if (objc_opt_respondsToSelector())
      {
        id v6 = +[UIKeyboard suppressionPolicyDelegate];
        int v7 = [(UIKeyboardImpl *)self inputDelegate];
        int v8 = [v6 _shouldSuppressAssistantBarForDelegate:v7];
      }
      else
      {
        int v8 = 0;
      }

      if (self->m_shouldSuppressAssistantBar != v8)
      {
        self->m_shouldSuppressAssistantBar = v8;
        if (!self->m_dismissingFloatingKeyboard)
        {
          self->m_dismissingFloatingKeyboard = 1;
          +[UIAssistantBarButtonItemProvider dismissFloatingKeyboardFromPencilKitIfNeeded];
          self->m_dismissingFloatingKeyboard = 0;
        }
      }
    }
  }
}

- (void)_updateKeyboardSuppression:(id)a3
{
}

- (void)_suppressSoftwareKeyboardStateChangedIgnoringPolicyDelegate:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v6 = [v5 keyInputDelegate];
  if (!v6) {
    goto LABEL_24;
  }
  int v7 = (void *)v6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  if (([WeakRetained isActive] & 1) == 0)
  {

    goto LABEL_23;
  }
  id v9 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  int v10 = [v9 isAutomatic];

  if (!v10) {
    goto LABEL_25;
  }
  BOOL v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v11 = [(UIKeyboardImpl *)self _shouldSuppressSoftwareKeyboardIgnoringPolicyDelegate:v3];
  id v12 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  int v13 = [v12 isMinimized];

  if (!v13)
  {
    if (v11) {
      [(UIKeyboardImpl *)self hideKeyboardIgnoringHardwareLayouts:1];
    }
    goto LABEL_20;
  }
  if (v11 || [(UIKeyboardImpl *)self _shouldMinimizeForHardwareKeyboard])
  {
    if ([(UIKeyboardImpl *)self floatingForced]) {
      goto LABEL_20;
    }
    long long v14 = [v5 keyboardWindow];
    long long v15 = [v14 rootViewController];

    long long v16 = [v15 placement];
    if ([v16 showsInputOrAssistantViews])
    {
      BOOL v17 = [(UIKeyboardImpl *)self _shouldSuppressAssistantBar];

      if (!v17) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    [v5 minimize];
LABEL_18:

    goto LABEL_20;
  }
  uint64_t v18 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  char v19 = [v18 handlingRemoteEvent];

  if (v19)
  {
    long long v15 = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
    [v15 setMinimized:0];
    goto LABEL_18;
  }
  [(UIKeyboardImpl *)self _showKeyboardIgnoringPolicyDelegate:v3];
LABEL_20:
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1 && !v3) {
    goto LABEL_24;
  }
  int v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  objc_msgSend(v7, "forwardKeyboardSuppression:suppressAssistantBar:", v11, -[UIKeyboardImpl _shouldSuppressAssistantBar](self, "_shouldSuppressAssistantBar"));
LABEL_23:

LABEL_24:
LABEL_25:
  id v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v20 postNotificationName:@"UIKeyboardSuppressionDidChange" object:0];
}

- (void)setInitialDirection
{
}

- (UITextInteractionAssistant)textInteractionAssistant
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager textInteractionAssistant];
}

- (_UITextInteractionEditMenuAssistant)_editMenuAssistant
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _editMenuAssistant];
}

- (_UITextChoiceAccelerationAssistant)_textChoicesAssistant
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _textChoicesAssistant];
}

- (void)setSplit:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (objc_opt_respondsToSelector())
  {
    m_layout = self->m_layout;
    [(UIKeyboardLayout *)m_layout setSplit:v5 animated:v4];
  }
}

- (void)traitCollectionDidChange
{
  [(UIKeyboardImpl *)self takeTextInputTraitsFromDelegate];
  BOOL v3 = [(UIKeyboardImpl *)self activeLayout];
  [v3 traitCollectionDidChange];

  if (+[UIKeyboard usesInputSystemUI]
    || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI])
  {
    id v4 = [(UIKeyboardImpl *)self remoteTextInputPartner];
    [v4 documentTraitsChanged];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  id v4 = [v3 inputDelegateManager];
  BOOL v5 = [v4 keyInputDelegate];

  if ((objc_msgSend(v5, "__isKindOfUIResponder") & 1) == 0)
  {
    uint64_t v6 = +[UIKeyboardImpl activeInstance];
    uint64_t v7 = [v6 delegateAsResponder];

    BOOL v5 = (void *)v7;
  }
  if (v5)
  {
    BOOL v8 = (objc_opt_respondsToSelector() & 1) == 0 || [v5 keyboardAppearance] == 10;
  }
  else
  {
    BOOL v8 = 1;
  }
  id v9 = [(UIView *)self traitCollection];
  uint64_t v10 = [v9 userInterfaceStyle];

  if (v8)
  {
    BOOL v11 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];

    if (v11)
    {
      id v12 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      id v14 = v12;
      if (v10 == 2) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = 2;
      }
      [v12 setKeyboardAppearance:v13];
    }
  }
}

- (void)finishSplitTransitionWithProgress:(double)a3
{
  if (objc_opt_respondsToSelector()) {
    [(UIKeyboardLayout *)self->m_layout finishSplitTransitionWithProgress:a3];
  }
  +[UIKeyboardImpl setPersistentSplitProgress:a3];
}

- (void)setTextInputChangesIgnored:(BOOL)a3
{
}

- (BOOL)isUsingDictationLayout
{
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v3 = [v2 currentInputMode];
  if ([v3 isExtensionInputMode])
  {
    char isKindOfClass = 0;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (BOOL)allowsReachableKeyboard
{
  BOOL v3 = +[UIScreen mainScreen];
  [v3 _unjailedReferenceBounds];
  double v5 = v4;

  _UIDeviceNativeUserInterfaceIdiom();
  unint64_t v6 = UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL;
  uint64_t v7 = [(UIKeyboardImpl *)self _layout];
  uint64_t v8 = [v7 orientation];

  BOOL result = 0;
  if (v6 != 1 && v5 > 320.0 && (unint64_t)(v8 - 3) >= 2) {
    return ![(UIKeyboardImpl *)self keyboardIsKeyPad];
  }
  return result;
}

- (int64_t)currentHandBias
{
  return [(UIKeyboardLayout *)self->m_layout currentHandBias];
}

- (double)biasedKeyboardWidthRatio
{
  [(UIKeyboardLayout *)self->m_layout biasedKeyboardWidthRatio];
  return result;
}

- (void)acceptAutocorrectionAndEndComposition
{
  BOOL v3 = [(UIKeyboardImpl *)self autocorrectionController];
  double v4 = [v3 autocorrection];

  if (v4)
  {
    [(UIKeyboardImpl *)self acceptAutocorrectionWithCompletionHandler:0];
  }
  else
  {
    [(UIKeyboardImpl *)self textAccepted:0];
  }
}

- (BOOL)globeKeyDisplaysAsEmojiKey
{
  id v2 = [(UIKeyboardImpl *)self _layout];
  char v3 = [v2 globeKeyDisplaysAsEmojiKey];

  return v3;
}

- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton
{
  id v2 = [(UIKeyboardImpl *)self _layout];
  char v3 = [v2 showsDedicatedEmojiKeyAlongsideGlobeButton];

  return v3;
}

- (id)internationalKeyDisplayStringOnEmojiKeyboard
{
  char v3 = +[UIKeyboardInputModeController sharedInputModeController];
  double v4 = [v3 currentInputMode];
  char v5 = [v4 isExtensionInputMode];

  if (v5)
  {
    unint64_t v6 = 0;
  }
  else
  {
    uint64_t v7 = [(UIKeyboardImpl *)self _layout];
    unint64_t v6 = [v7 internationalKeyDisplayStringOnEmojiKeyboard];
  }
  return v6;
}

- (id)_autofillContext
{
  id v2 = [(UIKeyboardImpl *)self keyboardState];
  char v3 = [v2 autofillContext];

  return v3;
}

- (id)_remoteAppId
{
  id v2 = [(UIKeyboardImpl *)self inputSystemSourceSession];
  char v3 = [v2 documentTraits];
  double v4 = [v3 appId];

  return v4;
}

- (id)_remoteLocalizedAppName
{
  id v2 = [(UIKeyboardImpl *)self inputSystemSourceSession];
  char v3 = [v2 documentTraits];
  double v4 = [v3 localizedAppName];

  return v4;
}

- (id)_remoteUnlocalizedAppName
{
  id v2 = [(UIKeyboardImpl *)self inputSystemSourceSession];
  char v3 = [v2 documentTraits];
  double v4 = [v3 appName];

  return v4;
}

- (id)_remoteAssociatedDomains
{
  id v2 = [(UIKeyboardImpl *)self inputSystemSourceSession];
  char v3 = [v2 documentTraits];
  double v4 = [v3 associatedDomains];

  return v4;
}

- (id)_passwordRules
{
  if (+[UIKeyboard isKeyboardProcess])
  {
    char v3 = [(UIKeyboardImpl *)self inputSystemSourceSession];
    double v4 = [v3 documentTraits];

    char v5 = [v4 passwordRules];
    goto LABEL_33;
  }
  unint64_t v6 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autofillController];
  uint64_t v7 = [v6 autofillGroup];
  double v4 = [v7 objectForKey:@"password"];

  uint64_t v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager autofillController];
  id v9 = [v8 autofillGroup];
  uint64_t v10 = [v9 objectForKey:@"new-password"];

  if (v4) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  id v12 = v4;
  if (v11 || (!v4 ? (v13 = v10 == 0) : (v13 = 1), id v12 = v10, !v13))
  {
    id v20 = v12;
    goto LABEL_27;
  }
  if (v4) {
    BOOL v14 = v10 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      long long v15 = [v4 passwordRules];
      long long v16 = [v15 passwordRulesDescriptor];
      uint64_t v17 = [v16 length];

      if (v17)
      {
        uint64_t v18 = v4;
LABEL_20:
        char v19 = [v18 passwordRules];
        id v20 = 0;
        goto LABEL_30;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v21 = [v10 passwordRules];
        uint64_t v22 = [v21 passwordRulesDescriptor];
        uint64_t v23 = [v22 length];

        if (v23)
        {
          uint64_t v18 = v10;
          goto LABEL_20;
        }
      }
    }
  }
  id v20 = 0;
LABEL_27:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    char v5 = 0;
    goto LABEL_32;
  }
  char v19 = [v20 passwordRules];
LABEL_30:
  char v5 = [v19 passwordRulesDescriptor];

LABEL_32:
LABEL_33:

  return v5;
}

- (BOOL)shouldLoadAutofillSignUpInputViewController
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager shouldLoadAutofillSignUpInputViewController];
}

- (void)_showAutofillExtras
{
}

- (void)_deactiveActiveKeys
{
}

- (void)performBlockWithTextInputChangesIgnoredForNonMacOS:(id)a3
{
  keyboardStateManager = self->_keyboardStateManager;
  char v5 = (void (**)(void))a3;
  uint64_t v6 = [(_UIKeyboardStateManager *)keyboardStateManager textInputChangesIgnored];
  [(_UIKeyboardStateManager *)self->_keyboardStateManager setTextInputChangesIgnored:1];
  v5[2](v5);

  uint64_t v7 = self->_keyboardStateManager;
  [(_UIKeyboardStateManager *)v7 setTextInputChangesIgnored:v6];
}

- (BOOL)hardwareKeyboardAttached
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached];
}

- (void)setHardWareKeyboardAttached:(BOOL)a3
{
}

+ (BOOL)isHardwareShiftKeyBeingHeld
{
  return (GSKeyboardGetLiveModifierState() & 0x220000) != 0;
}

+ (BOOL)isHardwareCommandKeyBeingHeld
{
  return (GSKeyboardGetLiveModifierState() & 0x1010000) != 0;
}

- (BOOL)isShiftKeyBeingHeld
{
  BOOL v3 = +[UIKeyboardImpl isHardwareShiftKeyBeingHeld];
  BOOL v4 = [(UIKeyboardImpl *)self callLayoutIsShiftKeyBeingHeld];
  return v3 | v4 | [(UIKeyboardImpl *)self _mimicShiftBeingHeld];
}

- (void)moveCursorLeftShifted:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(UIKeyboardImpl *)self hasEditableMarkedText])
  {
    uint64_t v7 = [(UIKeyboardImpl *)self delegateAsResponder];
    uint64_t v8 = [(UIKeyboardImpl *)self arrowKeyHistory];
    id v9 = [v7 _moveLeft:v3 withHistory:v8];
    [(UIKeyboardImpl *)self setArrowKeyHistory:v9];

    goto LABEL_13;
  }
  if (v3)
  {
    char v5 = self;
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v10 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
    int v11 = [v10 hasCandidates];

    if (!v11) {
      goto LABEL_13;
    }
    if ([(UIKeyboardImpl *)self cursorIsAtEndOfMarkedText])
    {
      id v12 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
      if ([v12 currentIndex] == 0x7FFFFFFFFFFFFFFFLL)
      {
      }
      else
      {
        BOOL v13 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
        uint64_t v14 = [v13 currentIndex];

        if (v14)
        {
          long long v15 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
          [v15 showCandidateInForwardDirection:0 granularity:0];

          goto LABEL_13;
        }
      }
    }
    char v5 = self;
    uint64_t v6 = 1;
  }
  [(UIKeyboardImpl *)v5 movePhraseBoundaryToDirection:1 granularity:v6];
LABEL_13:
  [(UIKeyboardImpl *)self updateForChangedSelection];
}

- (void)moveCursorRightShifted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIKeyboardImpl *)self hasEditableMarkedText])
  {
    if (v3)
    {
LABEL_3:
      [(UIKeyboardImpl *)self movePhraseBoundaryToDirection:0 granularity:0];
      goto LABEL_5;
    }
    uint64_t v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateResultSet];
    int v9 = [v8 hasCandidates];

    if (v9)
    {
      if (![(UIKeyboardImpl *)self cursorIsAtEndOfMarkedText]) {
        goto LABEL_3;
      }
      uint64_t v10 = [(_UIKeyboardStateManager *)self->_keyboardStateManager candidateList];
      [v10 showCandidateInForwardDirection:1 granularity:0];
    }
  }
  else
  {
    char v5 = [(UIKeyboardImpl *)self delegateAsResponder];
    uint64_t v6 = [(UIKeyboardImpl *)self arrowKeyHistory];
    uint64_t v7 = [v5 _moveRight:v3 withHistory:v6];
    [(UIKeyboardImpl *)self setArrowKeyHistory:v7];
  }
LABEL_5:
  [(UIKeyboardImpl *)self updateForChangedSelection];
}

- (void)lookUpResponderChainForCustomInputView
{
}

- (double)lastTouchDownTimestamp
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0.0;
  }
  m_layout = self->m_layout;
  [(UIKeyboardLayout *)m_layout lastTouchDownTimestamp];
  return result;
}

- (BOOL)callShouldInsertText:(id)a3 onDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 conformsToProtocol:&unk_1ED42E8E0]) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;
  if ([v7 conformsToProtocol:&unk_1ED42F658]) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;
  if (objc_opt_respondsToSelector())
  {
    char v12 = [v9 keyboardInput:v9 shouldInsertText:v6 isMarkedText:0];
  }
  else if (objc_opt_respondsToSelector())
  {
    BOOL v13 = [(UIKeyboardImpl *)self inputDelegateManager];
    uint64_t v14 = [v13 selectedTextRange];
    char v12 = [v11 shouldChangeTextInRange:v14 replacementText:v6];
  }
  else
  {
    char v12 = 1;
  }

  return v12;
}

- (BOOL)keyboardLayoutIsInAnotherProcess
{
  if (+[UIKeyboard usesInputSystemUI]
    && [(UIKeyboardImpl *)self isRTIClient])
  {
    BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    if ([v3 automaticAppearanceEnabled]) {
      BOOL v4 = !+[UIKeyboard usesLocalKeyboard];
    }
    else {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)shouldApplyKeyboardCommandToUIHost
{
  BOOL v3 = [(_UIKeyboardStateManager *)self->_keyboardStateManager hardwareKeyboardAttached];
  if (v3)
  {
    LOBYTE(v3) = [(UIKeyboardImpl *)self keyboardLayoutIsInAnotherProcess];
  }
  return v3;
}

- (BOOL)isRTIClient
{
  BOOL v3 = [(id)objc_opt_class() keyboardScreen];
  BOOL v4 = +[UIKBScreenTraits traitsWithScreen:v3 orientation:[(UIView *)self _keyboardOrientation]];

  if ([v4 idiom] == 3)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [(UIKeyboardImpl *)self remoteTextInputPartnerPrivate];
    char v5 = [v6 inputSystemClientEnabled];
  }
  return v5;
}

- (BOOL)playInputClick
{
  m_feedbackGenerator = self->m_feedbackGenerator;
  if (m_feedbackGenerator) {
    [(_UIKBFeedbackGenerating *)self->m_feedbackGenerator actionOccurred:1];
  }
  return m_feedbackGenerator != 0;
}

- (BOOL)_isBackdropVisible
{
  BOOL v3 = [(id)objc_opt_class() keyboardScreen];
  BOOL v4 = +[UIKBScreenTraits traitsWithScreen:v3 orientation:[(UIView *)self _keyboardOrientation]];

  char v5 = [(UIKeyboardImpl *)self textInputTraits];
  uint64_t v6 = [v5 keyboardAppearance];

  if (v6 == 127)
  {
    char v7 = 0;
  }
  else
  {
    uint64_t v8 = +[UIKeyboard keyboardBundleIdentifier];
    if ([v8 isEqualToString:@"com.apple.Spotlight"]) {
      char v9 = 1;
    }
    else {
      char v9 = [v8 isEqualToString:@"com.apple.SpotlightTest"];
    }
    uint64_t v10 = [(UIKeyboardImpl *)self textInputTraits];
    uint64_t v11 = [v10 keyboardAppearance];

    if (v11 == 11) {
      char v7 = v9 ^ 1;
    }
    else {
      char v7 = 1;
    }
  }
  return v7;
}

- (BOOL)shouldShowContinuousPathIntroductionView
{
  BOOL v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v4 = [v3 preferencesActions];
  char v5 = [v4 oneTimeActionCompleted:*MEMORY[0x1E4FAE5E0]];

  if ((v5 & 1) != 0 || ![(UIKeyboardLayout *)self->m_layout _allowContinuousPathUI])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    uint64_t v6 = +[UIKeyboard keyboardBundleIdentifier];
    int v7 = [v6 isEqualToString:@"com.apple.purplebuddy"] ^ 1;
  }
  return v7;
}

- (void)presentContinuousPathIntroductionView
{
  if (([(id)UIApp isSuspended] & 1) != 0 || -[UIKeyboardImpl isMinimized](self, "isMinimized")) {
    return;
  }
  BOOL v3 = [(UIView *)self->_continuousPathIntroductionView window];
  if (v3) {
    goto LABEL_5;
  }
  id v16 = [(UIKeyboardImpl *)self inputDelegateManager];
  uint64_t v4 = [v16 keyInputDelegate];
  if (!v4)
  {
    BOOL v3 = v16;
LABEL_5:

    return;
  }
  char v5 = (void *)v4;
  BOOL v6 = [(UIKeyboardImpl *)self shouldShowContinuousPathIntroductionView];

  if (v6)
  {
    if (!self->_continuousPathIntroductionView)
    {
      int v7 = [UIContinuousPathIntroductionView alloc];
      uint64_t v8 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      char v9 = -[UIContinuousPathIntroductionView initWithKeyboardAppearance:](v7, "initWithKeyboardAppearance:", [v8 keyboardAppearance]);
      continuousPathIntroductionView = self->_continuousPathIntroductionView;
      self->_continuousPathIntroductionView = v9;
    }
    uint64_t v11 = [(UIView *)self _rootInputWindowController];
    char v12 = [v11 bottomEdgeView];
    [v12 addSubview:self->_continuousPathIntroductionView];

    dispatch_time_t v13 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__UIKeyboardImpl_presentContinuousPathIntroductionView__block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    uint64_t v14 = MEMORY[0x1E4F14428];
    dispatch_after(v13, MEMORY[0x1E4F14428], block);
    dispatch_time_t v15 = dispatch_time(0, 300000000000);
    dispatch_after(v15, v14, &__block_literal_global_933);
  }
}

void __55__UIKeyboardImpl_presentContinuousPathIntroductionView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 528) superview];

  if (v1)
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v2 = [v3 preferencesActions];
    [v2 didTriggerOneTimeAction:*MEMORY[0x1E4FAE5E0]];
  }
}

void __55__UIKeyboardImpl_presentContinuousPathIntroductionView__block_invoke_2()
{
  id v0 = +[UIKeyboardImpl activeInstance];
  [v0 dismissContinuousPathIntroductionView];
}

- (void)dismissContinuousPathIntroductionView
{
  continuousPathIntroductionView = self->_continuousPathIntroductionView;
  if (continuousPathIntroductionView)
  {
    [(UIContinuousPathIntroductionView *)continuousPathIntroductionView removeFromSuperview];
    uint64_t v4 = self->_continuousPathIntroductionView;
    self->_continuousPathIntroductionView = 0;
  }
}

- (BOOL)shouldShowEditingIntroductionView
{
  return +[UIKBEditingGesturesIntroduction shouldShowEditingIntroduction];
}

- (void)presentEditingIntroductionView
{
  if ([(UIKeyboardImpl *)self shouldShowEditingIntroductionView])
  {
    if (!self->_editingGestureIntroductionView)
    {
      id v3 = [UIKBEditingGesturesIntroduction alloc];
      uint64_t v4 = [(_UIKeyboardStateManager *)self->_keyboardStateManager textInputTraits];
      char v5 = -[UIKBTutorialModalDisplay initWithKeyboardAppearance:](v3, "initWithKeyboardAppearance:", [v4 keyboardAppearance]);
      editingGestureIntroductionView = self->_editingGestureIntroductionView;
      self->_editingGestureIntroductionView = v5;
    }
    id v8 = [(UIView *)self _rootInputWindowController];
    int v7 = [v8 bottomEdgeView];
    [v7 addSubview:self->_editingGestureIntroductionView];
  }
}

- (void)dismissEditingIntroductionView
{
  editingGestureIntroductionView = self->_editingGestureIntroductionView;
  if (editingGestureIntroductionView)
  {
    [(UIView *)editingGestureIntroductionView removeFromSuperview];
    uint64_t v4 = self->_editingGestureIntroductionView;
    self->_editingGestureIntroductionView = 0;
  }
}

- (void)presentStickerEditorWithStickerIdentifier:(id)a3 sourceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a3;
  if (self->_stickerEditorViewController) {
    [(UIKeyboardImpl *)self dismissStickerEditor:0];
  }
  char v9 = -[UIKeyboardStickerEditorViewController initWithStickerIdentifier:sourceRect:]([UIKeyboardStickerEditorViewController alloc], "initWithStickerIdentifier:sourceRect:", v11, x, y, width, height);
  stickerEditorViewController = self->_stickerEditorViewController;
  self->_stickerEditorViewController = v9;

  [(UIKeyboardStickerEditorViewController *)self->_stickerEditorViewController showInKeyboard];
}

- (void)dismissStickerEditor:(BOOL)a3
{
  stickerEditorViewController = self->_stickerEditorViewController;
  if (stickerEditorViewController)
  {
    [(UIKeyboardStickerEditorViewController *)stickerEditorViewController dismissAnimated:a3];
    char v5 = self->_stickerEditorViewController;
    self->_stickerEditorViewController = 0;
  }
}

- (void)presentMultilingualKeyboardTip:(id)a3
{
  id v4 = a3;
  char v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v6 = [v5 preferencesActions];
  char v7 = [v6 oneTimeActionCompleted:@"MultilingualKeyboardTip"];

  if ((v7 & 1) == 0)
  {
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__UIKeyboardImpl_presentMultilingualKeyboardTip___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    [(UIKeyboardImpl *)self keyboardIntroductionFrame];
    double v13 = v9;
    double v14 = v10;
    double v15 = v11;
    double v16 = v12;
    multilingualKeyboardIntroductionView = self->_multilingualKeyboardIntroductionView;
    if (!multilingualKeyboardIntroductionView)
    {
      uint64_t v18 = -[UIKBMultilingualKeyboardIntroductionView initWithInputMode:frame:]([UIKBMultilingualKeyboardIntroductionView alloc], "initWithInputMode:frame:", v4, v9, v10, v11, v12);
      char v19 = self->_multilingualKeyboardIntroductionView;
      self->_multilingualKeyboardIntroductionView = v18;

      multilingualKeyboardIntroductionView = self->_multilingualKeyboardIntroductionView;
    }
    -[UIView setFrame:](multilingualKeyboardIntroductionView, "setFrame:", v13, v14, v15, v16);
    id v20 = [(UIView *)self _rootInputWindowController];
    uint64_t v21 = [v20 bottomEdgeView];
    [v21 addSubview:self->_multilingualKeyboardIntroductionView];
  }
}

void __49__UIKeyboardImpl_presentMultilingualKeyboardTip___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 552) superview];

  if (v1)
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v2 = [v3 preferencesActions];
    [v2 didTriggerOneTimeAction:@"MultilingualKeyboardTip"];
  }
}

- (void)dismissMultilingualKeyboardTip
{
  multilingualKeyboardIntroductionView = self->_multilingualKeyboardIntroductionView;
  if (multilingualKeyboardIntroductionView)
  {
    [(UIView *)multilingualKeyboardIntroductionView removeFromSuperview];
    id v4 = self->_multilingualKeyboardIntroductionView;
    self->_multilingualKeyboardIntroductionView = 0;
  }
}

- (void)presentMultilingualSettingTip:(id)a3
{
  id v4 = a3;
  char v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v6 = [v5 preferencesActions];
  char v7 = [v6 oneTimeActionCompleted:@"MultilingualSettingTip"];

  if ((v7 & 1) == 0)
  {
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__UIKeyboardImpl_presentMultilingualSettingTip___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
    [(UIKeyboardImpl *)self keyboardIntroductionFrame];
    if (!self->_multilingualSettingIntroductionView)
    {
      double v13 = -[UIKBMultilingualSettingIntroductionView initWithInputMode:frame:]([UIKBMultilingualSettingIntroductionView alloc], "initWithInputMode:frame:", v4, v9, v10, v11, v12);
      multilingualSettingIntroductionView = self->_multilingualSettingIntroductionView;
      self->_multilingualSettingIntroductionView = v13;
    }
    double v15 = [(UIView *)self _rootInputWindowController];
    double v16 = [v15 bottomEdgeView];
    [v16 addSubview:self->_multilingualSettingIntroductionView];
  }
}

void __48__UIKeyboardImpl_presentMultilingualSettingTip___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 560) superview];

  if (v1)
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v2 = [v3 preferencesActions];
    [v2 didTriggerOneTimeAction:@"MultilingualSettingTip"];
  }
}

- (void)dismissMultilingualSettingTip
{
  multilingualSettingIntroductionView = self->_multilingualSettingIntroductionView;
  if (multilingualSettingIntroductionView)
  {
    [(UIView *)multilingualSettingIntroductionView removeFromSuperview];
    id v4 = self->_multilingualSettingIntroductionView;
    self->_multilingualSettingIntroductionView = 0;
  }
}

- (UIKBTree)currentKey
{
  return 0;
}

- (void)restoreFocusFromEntryPoint:(CGPoint)a3
{
}

- (unint64_t)serviceRole
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager serviceRole];
}

- (void)setServiceRole:(unint64_t)a3
{
}

- (BOOL)skipRecomputeInputMode
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager skipRecomputeInputMode];
}

- (void)setSkipRecomputeInputMode:(BOOL)a3
{
}

- (id)keyboardWindowSnapshot
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager keyboardWindowSnapshot];
}

- (void)updateIdleDetection:(int64_t)a3
{
}

- (void)textSelectionInteractionWillBegin:(id)a3
{
}

- (void)forwardDictationEvent_switchToDictationInputModeWithOptions:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      dispatch_time_t v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_switchToDictationInputModeWithOptions____s_category_0)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v10, 2u);
    }
  }
  char v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v7 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_switchToDictationInputModeWithOptions_ withOptionalObject:v4];
}

- (void)forwardDictationEvent_handleDictationShouldPause:(BOOL)a3 withNewDelagate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  void v17[2] = *MEMORY[0x1E4F143B8];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v8 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v8)
    {
      double v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v15 = 0;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", v15, 2u);
      }
    }
  }
  else if (!v8)
  {
    double v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_handleDictationShouldPause_withNewDelagate____s_category_0)+ 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v15, 2u);
    }
  }
  double v9 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  v16[0] = @"shouldPause";
  double v10 = [NSNumber numberWithBool:v5];
  v16[1] = @"withNewDelagate";
  v17[0] = v10;
  double v11 = [NSNumber numberWithBool:v4];
  v17[1] = v11;
  double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  [v9 forwardDictationEventToUIHost:sel_handleDictationShouldPause_withNewDelagate_ withOptionalObject:v12];
}

- (void)forwardDictationEvent_switchToDictationLanguage:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      BOOL v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_switchToDictationLanguage____s_category_0)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v10, 2u);
    }
  }
  char v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v7 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_switchToDictationLanguage_ withOptionalObject:v4];
}

- (void)forwardDictationEvent_startDictation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v4 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      BOOL v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    char v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_startDictation___s_category_0) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v8, 2u);
    }
  }
  BOOL v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v5 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_startDictation withOptionalObject:0];
}

- (void)forwardDictationEvent_stopDictation:(BOOL)a3
{
  BOOL v3 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      double v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_stopDictation____s_category_0) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v11, 2u);
    }
  }
  char v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  BOOL v8 = [NSNumber numberWithBool:v3];
  [v7 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_stopDictation_ withOptionalObject:v8];
}

- (void)forwardDictationEvent_cancelDictation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v4 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      BOOL v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    char v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_cancelDictation___s_category_0) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v8, 2u);
    }
  }
  BOOL v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v5 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_cancelDictation withOptionalObject:0];
}

- (void)forwardDictationEvent_movePopoverView:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      BOOL v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_movePopoverView____s_category_0)
                      + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v10, 2u);
    }
  }
  char v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v7 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_movePopoverView_ withOptionalObject:v4];
}

- (void)forwardDictationEvent_handleTip:(id)a3 title:(id)a4
{
  void v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v9 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v9)
    {
      double v13 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v15 = 0;
        _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", v15, 2u);
      }
    }
  }
  else if (!v9)
  {
    double v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_handleTip_title____s_category_0)
                       + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v15, 2u);
    }
  }
  double v10 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  double v11 = v10;
  if (v6)
  {
    v16[0] = @"text";
    v16[1] = @"title";
    v17[0] = v6;
    v17[1] = v7;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
    [v11 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_handleTip_ withOptionalObject:v12];
  }
  else
  {
    [v10 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_handleTip_ withOptionalObject:0];
  }
}

- (void)forwardDictationEvent_updateIdleDetection:(int64_t)a3
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      double v10 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v10, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    double v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_updateIdleDetection____s_category_0)+ 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v12 = 0;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v12, 2u);
    }
  }
  id v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  BOOL v8 = [NSNumber numberWithInteger:a3];
  [v7 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_updateIdleDetection_ withOptionalObject:v8];

  BOOL v9 = +[UIDictationController sharedInstance];
  [v9 insertLastHypothesisAsFinalResultLocally];
}

- (void)forwardDictationEvent_stopDictationIgnoreFinalizePhrases
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v4 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      BOOL v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_stopDictationIgnoreFinalizePhrases___s_category_0)+ 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v8, 2u);
    }
  }
  BOOL v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v5 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_stopDictationIgnoreFinalizePhrases withOptionalObject:0];
}

- (void)forwardDictationEvent_resumeDictation
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v4 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      BOOL v6 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    id v7 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardDictationEvent_resumeDictation___s_category_0) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v8, 2u);
    }
  }
  BOOL v5 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  [v5 forwardDictationEventToUIHost:sel_handleRemoteDictationEvent_resumeDictation withOptionalObject:0];
}

- (void)forwardKeyboardCameraEvent_startCameraInput:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v6 = +[UIKeyboard usesInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v6)
    {
      BOOL v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    BOOL v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardKeyboardCameraEvent_startCameraInput____s_category_0)+ 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v10, 2u);
    }
  }
  id v7 = [(UIKeyboardImpl *)self remoteTextInputPartner];
  objc_msgSend(v7, "forwardKeyboardCameraEvent_startCameraInput:", v4);
}

- (void)forwardKeyboardCameraEvent_selfDestruct
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v4 = +[UIKeyboard isInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      BOOL v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    BOOL v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardKeyboardCameraEvent_selfDestruct___s_category_0)
                      + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v10, 2u);
    }
  }
  BOOL v5 = [(UIKeyboardImpl *)self inputDelegateManager];
  BOOL v6 = [v5 inputSystemSourceSession];

  if (v6)
  {
    id v7 = [v6 textOperations];
    [v7 setEditingActionSelector:sel_handleRemoteKeyboardCameraEvent_selfDestruct];
    [v6 flushOperations];
  }
}

- (void)forwardKeyboardCameraEvent_updatePreviewText:(id)a3 asMarkedText:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v8 = +[UIKeyboard isKeyboardProcess];
  if (has_internal_diagnostics)
  {
    if (!v8)
    {
      double v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v8)
  {
    double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardKeyboardCameraEvent_updatePreviewText_asMarkedText____s_category_0)+ 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v17, 2u);
    }
  }
  BOOL v9 = [(UIKeyboardImpl *)self inputDelegateManager];
  double v10 = [v9 inputSystemSourceSession];

  if (v10)
  {
    if (v4)
    {
      double v11 = [MEMORY[0x1E4FAE350] intermediateTextWithInputString:&stru_1ED0E84C0 displayString:v6];
      double v12 = [v10 textOperations];
      [v12 setIntermediateText:v11];
    }
    else
    {
      double v13 = [MEMORY[0x1E4FAE350] intermediateTextWithInputString:&stru_1ED0E84C0 displayString:&stru_1ED0E84C0];
      double v14 = [v10 textOperations];
      [v14 setIntermediateText:v13];

      double v11 = [v10 textOperations];
      double v12 = [v11 keyboardOutput];
      [v12 insertText:v6];
    }

    [v10 flushOperations];
  }
}

- (void)forwardStickerEvent_presentCard
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  BOOL v4 = +[UIKeyboard isInputSystemUI];
  if (has_internal_diagnostics)
  {
    if (!v4)
    {
      BOOL v8 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Unexpected forwarding event", buf, 2u);
      }
    }
  }
  else if (!v4)
  {
    BOOL v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &forwardStickerEvent_presentCard___s_category) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Unexpected forwarding event", v10, 2u);
    }
  }
  BOOL v5 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v6 = [v5 inputSystemSourceSession];

  if (v6)
  {
    id v7 = [v6 textOperations];
    [v7 setEditingActionSelector:sel_handleStickerEvent_presentCard];
    [v6 flushOperations];
  }
}

- (void)handleStickerEvent_presentCard
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_stickerPickerSession)
  {
    BOOL v3 = objc_alloc_init(_UIStickerPickerKeyboardSession);
    stickerPickerSession = self->_stickerPickerSession;
    self->_stickerPickerSession = v3;

    [(_UIStickerPickerKeyboardSession *)self->_stickerPickerSession setDelegate:self];
  }
  BOOL v5 = [(UIKeyboardImpl *)self inputDelegateManager];
  id v6 = [v5 delegateRespectingForwardingDelegate:0];

  id v7 = [v6 textInputView];
  if ([v6 conformsToProtocol:&unk_1ED42F658])
  {
    [(_UIStickerPickerKeyboardSession *)self->_stickerPickerSession presentWithTextInput:v6 view:v7];
  }
  else
  {
    BOOL v8 = _UIKeyboardImplLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      double v10 = v6;
      _os_log_error_impl(&dword_1853B0000, v8, OS_LOG_TYPE_ERROR, "responder %@ does not conform to UITextInput. Cannot present stickers.", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)stickerPickerKeyboardSessionDidFinish
{
  stickerPickerSession = self->_stickerPickerSession;
  self->_stickerPickerSession = 0;
}

- (void)reportSmartReplyFeedbackUIWasPresented
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager smartReplyFeedbackManager];
  [v2 reportFeedbackUIPresented];
}

- (void)writingToolsDidEnd
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager smartReplyFeedbackManager];
  [v2 reportWritingToolsPanelDismissed];
}

- (void)reportSmartRepliesConcern
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager smartReplyFeedbackManager];
  [v2 reportSmartRepliesConcern];
}

- (void)resetSmartReplyFeedbackUIIfAlreadyShown
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager smartReplyFeedbackManager];
  [v2 resetSmartReplyFeedbackUIIfAlreadyShown];
}

- (BOOL)shouldShowSmartReplyFeedbackInputDashboardViewController
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager smartReplyFeedbackManager];
  char v3 = objc_msgSend(v2, "shouldShowSmartReplyFeedbackInputDashboardViewControllerWithKeyboardIsSplit:", +[UIKeyboardImpl isSplit](UIKeyboardImpl, "isSplit"));

  return v3;
}

- (BOOL)shouldCollapseButtonBarForFeedbackUI
{
  id v2 = [(_UIKeyboardStateManager *)self->_keyboardStateManager smartReplyFeedbackManager];
  char v3 = [v2 willShowFeedbackUI];

  return v3;
}

- (id)obtainHideInlineCandidatesAssertionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:0 initialState:1 reason:a3 requiresExplicitInvalidation:1];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return !a3 && [(UIKeyboardImpl *)self hideInlineCandidates];
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (!a4)
  {
    [(UIKeyboardImpl *)self setHideInlineCandidates:a3];
    [(UIKeyboardImpl *)self removeCandidateList];
    [(UIKeyboardImpl *)self generateCandidates];
  }
}

- (id)_getCurrentKeyplaneName
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [(UIKeyboardLayout *)self->m_layout keyplaneName];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (id)_getCurrentKeyboardName
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [(UIKeyboardLayout *)self->m_layout keyboardName];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (id)_getLocalizedInputMode
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v3 = [(UIKeyboardLayout *)self->m_layout localizedInputMode];
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (void)_setAutocorrects:(BOOL)a3
{
}

- (id)_getAutocorrection
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _getAutocorrection];
}

- (id)_getAutocorrectionList
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v3 = [v2 systemInputAssistantViewController];
  uint64_t v4 = [v3 centerViewController];
  BOOL v5 = [v4 displayedCandidates];

  return v5;
}

- (id)_getCandidateList
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _getCandidateList];
}

- (BOOL)_hasCandidates
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _hasCandidates];
}

- (int64_t)_positionInCandidateList:(id)a3
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _positionInCandidateList:a3];
}

- (void)_setNeedsCandidates:(BOOL)a3
{
}

- (BOOL)_needsCandidates
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager _needsCandidates];
}

- (BOOL)prewarmsPredictiveCandidates
{
  return [(_UIKeyboardStateManager *)self->_keyboardStateManager prewarmsPredictiveCandidates];
}

- (void)setPrewarmsPredictiveCandidates:(BOOL)a3
{
}

- (UIKeyboardLayout)layout
{
  return self->m_layout;
}

- (UIKeyboardImplGeometryDelegate)geometryDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->m_geometryDelegate);
  return (UIKeyboardImplGeometryDelegate *)WeakRetained;
}

- (void)setGeometryDelegate:(id)a3
{
}

- (BOOL)showInputModeIndicator
{
  return self->m_showInputModeIndicator;
}

- (void)setShowInputModeIndicator:(BOOL)a3
{
  self->m_showInputModeIndicator = a3;
}

- (BOOL)showsCandidateInline
{
  return self->m_showsCandidateInline;
}

- (BOOL)animateUpdateBars
{
  return self->m_animateUpdateBars;
}

- (void)setAnimateUpdateBars:(BOOL)a3
{
  self->m_animateUpdateBars = a3;
}

- (_UIKBFeedbackGenerating)feedbackGenerator
{
  return self->m_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (BOOL)suppressUpdateCandidateView
{
  return self->m_suppressUpdateCandidateView;
}

- (void)setSuppressUpdateCandidateView:(BOOL)a3
{
  self->m_suppressUpdateCandidateView = a3;
}

- (BOOL)updateLayoutOnShowKeyboard
{
  return self->m_updateLayoutOnShowKeyboard;
}

- (void)setUpdateLayoutOnShowKeyboard:(BOOL)a3
{
  self->m_updateLayoutOnShowKeyboard = a3;
}

- (BOOL)geometryIsChanging
{
  return self->_geometryIsChanging;
}

- (void)setGeometryIsChanging:(BOOL)a3
{
  self->_geometryIsChanging = a3;
}

- (BOOL)shouldUpdateLayoutAutomatically
{
  return self->_shouldUpdateLayoutAutomatically;
}

- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3
{
  self->_shouldUpdateLayoutAutomaticalldouble y = a3;
}

- (BOOL)isFloatingLocked
{
  return self->_lockFloating;
}

- (void)setLockFloating:(BOOL)a3
{
  self->_lockFloating = a3;
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (void)setRequestedInteractionModel:(unint64_t)a3
{
  self->_requestedInteractionModel = a3;
}

- (UIKeyboardScheduledTask)autocorrectPromptTask
{
  return self->_autocorrectPromptTask;
}

- (void)setAutocorrectPromptTask:(id)a3
{
}

- (UITextCursorAssertion)cursorAssertion
{
  return self->_cursorAssertion;
}

- (void)setCursorAssertion:(id)a3
{
}

- (UITextCursorAssertion)capslockAssertion
{
  return self->_capslockAssertion;
}

- (void)setCapslockAssertion:(id)a3
{
}

- (UITextCursorAssertion)inputModeAssertion
{
  return self->_inputModeAssertion;
}

- (void)setInputModeAssertion:(id)a3
{
}

- (UIView)internationalKeyIntroductionView
{
  return self->_internationalKeyIntroductionView;
}

- (void)setInternationalKeyIntroductionView:(id)a3
{
}

- (NSNumber)isAttachedHardwareKeyboard
{
  return self->_isAttachedHardwareKeyboard;
}

- (void)setIsAttachedHardwareKeyboard:(id)a3
{
}

- (UIAutocorrectBubbleContainer)autocorrectBubbleContainer
{
  return self->_autocorrectBubbleContainer;
}

- (void)setAutocorrectBubbleContainer:(id)a3
{
}

- (UIView)overlayContainerObserved
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_overlayContainerObserved);
  return (UIView *)WeakRetained;
}

- (void)setOverlayContainerObserved:(id)a3
{
}

- (NSValue)contentScrollInitialContentOffset
{
  return self->_contentScrollInitialContentOffset;
}

- (void)setContentScrollInitialContentOffset:(id)a3
{
}

- (NSValue)environmentScrollInitialContentOffset
{
  return self->_environmentScrollInitialContentOffset;
}

- (void)setEnvironmentScrollInitialContentOffset:(id)a3
{
}

- (KFAViewController)keyboardFeedbackAssistantViewController
{
  return self->_keyboardFeedbackAssistantViewController;
}

- (void)setKeyboardFeedbackAssistantViewController:(id)a3
{
}

- (BOOL)hideInlineCandidates
{
  return self->_hideInlineCandidates;
}

- (void)setHideInlineCandidates:(BOOL)a3
{
  self->_hideInlineCandidates = a3;
}

- (UIPressAndHoldPopoverController)pressAndHoldPopoverController
{
  return self->_pressAndHoldPopoverController;
}

- (_UIKeyboardStateManager)keyboardStateManager
{
  return self->_keyboardStateManager;
}

- (void)setActiveLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activeLayout);
  objc_storeStrong((id *)&self->_keyboardStateManager, 0);
  objc_storeStrong((id *)&self->_pressAndHoldPopoverController, 0);
  objc_storeStrong((id *)&self->_keyboardFeedbackAssistantViewController, 0);
  objc_storeStrong((id *)&self->_environmentScrollInitialContentOffset, 0);
  objc_storeStrong((id *)&self->_contentScrollInitialContentOffset, 0);
  objc_destroyWeak((id *)&self->_overlayContainerObserved);
  objc_storeStrong((id *)&self->_autocorrectBubbleContainer, 0);
  objc_storeStrong((id *)&self->_isAttachedHardwareKeyboard, 0);
  objc_storeStrong((id *)&self->_internationalKeyIntroductionView, 0);
  objc_storeStrong((id *)&self->_inputModeAssertion, 0);
  objc_storeStrong((id *)&self->_capslockAssertion, 0);
  objc_storeStrong((id *)&self->_cursorAssertion, 0);
  objc_storeStrong((id *)&self->_autocorrectPromptTask, 0);
  objc_storeStrong((id *)&self->m_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->m_candidateController, 0);
  objc_destroyWeak((id *)&self->m_geometryDelegate);
  objc_storeStrong((id *)&self->m_layout, 0);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_emojiKeyboardPrewarmingAssertion, 0);
  objc_storeStrong((id *)&self->_stickerPickerSession, 0);
  objc_storeStrong((id *)&self->m_tipView, 0);
  objc_storeStrong((id *)&self->m_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->m_dictationIndicatorAssertion, 0);
  objc_storeStrong((id *)&self->m_dictationMenuAction, 0);
  objc_storeStrong((id *)&self->_autoFillPanel, 0);
  objc_storeStrong((id *)&self->_dictationPopoverController, 0);
  objc_storeStrong((id *)&self->_emojiPopoverController, 0);
  objc_storeStrong((id *)&self->_multilingualSettingIntroductionView, 0);
  objc_storeStrong((id *)&self->_multilingualKeyboardIntroductionView, 0);
  objc_storeStrong((id *)&self->_stickerEditorViewController, 0);
  objc_storeStrong((id *)&self->_editingGestureIntroductionView, 0);
  objc_storeStrong((id *)&self->_continuousPathIntroductionView, 0);
  objc_storeStrong((id *)&self->m_capsLockSign, 0);
  objc_storeStrong((id *)&self->m_resumeDictationForResponderChange, 0);
  objc_storeStrong((id *)&self->m_detachHardwareKeyboardAction, 0);
  objc_storeStrong((id *)&self->m_recentInputs, 0);
  objc_storeStrong((id *)&self->m_keyedLayouts, 0);
  objc_storeStrong((id *)&self->m_markedTextOverlay, 0);
  objc_storeStrong((id *)&self->m_autocorrectPrompt, 0);
  objc_storeStrong((id *)&self->m_languageIndicator, 0);
}

@end