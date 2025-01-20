@interface UIKeyboardLayoutStar
+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5;
+ (Class)_subclassForScreenTraits:(id)a3;
+ (id)keyboardFromFactoryWithName:(id)a3 screenTraits:(id)a4;
+ (id)keyboardWithName:(id)a3 screenTraits:(id)a4;
+ (id)sharedPunctuationCharacterSet;
+ (id)sharedRivenKeyplaneGenerator;
+ (void)accessibilitySensitivityChanged;
- (BOOL)_allowContinuousPathUI;
- (BOOL)_allowPaddle;
- (BOOL)_allowStartingContinuousPathForTouchInfo:(id)a3 alreadyActiveKeyExisting:(BOOL)a4;
- (BOOL)_continuousPathModalPunctuationPlaneEnabled;
- (BOOL)_continuousPathSpotlightEffectEnabled;
- (BOOL)_handRestRecognizerCancelShouldBeEnd;
- (BOOL)_handleTouchForEmojiInputView;
- (BOOL)_pointAllowedInStaticHitBuffer:(CGPoint)a3;
- (BOOL)_shouldAttemptToAddSupplementaryControlKeys;
- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor;
- (BOOL)_shouldSwapGlobeAndMore;
- (BOOL)_stringContainsCurrencyCharacters:(id)a3;
- (BOOL)allKeyplanesHaveSameHeight;
- (BOOL)autoShift;
- (BOOL)canAddRomanSwitchKey;
- (BOOL)canForceTouchUUIDCommit:(id)a3 inWindow:(id)a4;
- (BOOL)canMultitap;
- (BOOL)canProduceString:(id)a3;
- (BOOL)canReuseKeyplaneView;
- (BOOL)diacriticForwardCompose;
- (BOOL)didLongPress;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)globeKeyDisplaysAsEmojiKey;
- (BOOL)handRestRecognizerShouldNeverIgnoreTouchState:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 forRestingState:(unint64_t)a6 otherRestedTouchLocations:(id)a7;
- (BOOL)handleFlick:(id)a3;
- (BOOL)hasAccentKey;
- (BOOL)hasActiveContinuousPathInput;
- (BOOL)hasActiveKeys;
- (BOOL)hasCandidateKeys;
- (BOOL)ignoreWriteboard;
- (BOOL)ignoresShiftState;
- (BOOL)is10KeyRendering;
- (BOOL)isAlphabeticPlane;
- (BOOL)isDeadkeyInput:(id)a3;
- (BOOL)isDeveloperGestureKeybaord;
- (BOOL)isEmojiKeyplane;
- (BOOL)isGeometricShiftOrMoreKeyForTouch:(id)a3;
- (BOOL)isHandwritingPlane;
- (BOOL)isKanaPlane;
- (BOOL)isKeyScriptSwitchKey:(id)a3;
- (BOOL)isLongPressedKey:(id)a3;
- (BOOL)isMultitapKey:(id)a3;
- (BOOL)isResized;
- (BOOL)isResizing;
- (BOOL)isRotating;
- (BOOL)isShiftKeyBeingHeld;
- (BOOL)isShiftKeyPlaneChooser;
- (BOOL)isTrackpadMode;
- (BOOL)keyHasAccentedVariants:(id)a3;
- (BOOL)keyplaneContainsDismissKey;
- (BOOL)keyplaneContainsEmojiKey;
- (BOOL)keyplaneSupportsResizingGesture;
- (BOOL)keyplaneUsesResizingOffset;
- (BOOL)muteNextKeyClickSound;
- (BOOL)performReturnAction;
- (BOOL)performSpaceAction;
- (BOOL)pinchCanBeginWithTouches:(id)a3 andScale:(double)a4;
- (BOOL)pinchDetected;
- (BOOL)pinchSplitGestureEnabled;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)preventPaddlesForPointerTouches;
- (BOOL)shift;
- (BOOL)shouldAllowCurrentKeyplaneReload;
- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5;
- (BOOL)shouldCommitPrecedingTouchesForTouchDownWithActions:(unint64_t)a3;
- (BOOL)shouldDeactivateWithoutWindow;
- (BOOL)shouldHitTestKey:(id)a3;
- (BOOL)shouldIgnoreContinuousPathRequirements;
- (BOOL)shouldIgnoreDistantKey;
- (BOOL)shouldMatchCaseForDomainKeys;
- (BOOL)shouldMergeAssistantBarWithKeyboardLayout;
- (BOOL)shouldMergeKey:(id)a3;
- (BOOL)shouldPreventInputManagerHitTestingForKey:(id)a3;
- (BOOL)shouldRetestKey:(id)a3 slidOffKey:(id)a4 withKeyplane:(id)a5;
- (BOOL)shouldRetestTouchDraggedFromKey:(id)a3;
- (BOOL)shouldRetestTouchUp:(id)a3;
- (BOOL)shouldSendStringForFlick:(id)a3;
- (BOOL)shouldSendTouchUpToInputManager:(id)a3;
- (BOOL)shouldShowDictationKey;
- (BOOL)shouldShowGestureKeyboardIntroduction;
- (BOOL)shouldShowIndicator;
- (BOOL)shouldShowInternationalMenuForKey:(id)a3;
- (BOOL)shouldSkipResponseToGlobeKey:(id)a3 atPoint:(CGPoint)a4;
- (BOOL)shouldUseDefaultShiftStateFromLayout;
- (BOOL)shouldYieldToControlCenterForFlickWithInitialPoint:(CGPoint)a3 finalPoint:(CGPoint)a4;
- (BOOL)showGestureKeyboardIntroductionIfNeeded;
- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton;
- (BOOL)showsDictationKey;
- (BOOL)showsGlobeAndDictationKeysInDockView;
- (BOOL)showsInternationalKey;
- (BOOL)stretchKeyboardToFit;
- (BOOL)stretchKeyboardToFitKeyplane:(id)a3;
- (BOOL)supportStylingWithKey:(id)a3;
- (BOOL)supportsContinuousPath;
- (BOOL)supportsEmoji;
- (BOOL)supportsSupplementalDisplayString;
- (BOOL)touchPassesDragThreshold:(id)a3;
- (BOOL)useCrescendoLayout;
- (BOOL)useDismissForMessagesWriteboard;
- (BOOL)useUndoForMessagesWriteboard;
- (BOOL)usesAutoShift;
- (CGImage)cachedCompositeImageWithCacheKey:(id)a3;
- (CGImage)renderedImageWithStateFallbacksForToken:(id)a3;
- (CGImage)renderedImageWithToken:(id)a3;
- (CGImage)renderedKeyplaneWithToken:(id)a3 split:(BOOL)a4;
- (CGPoint)applyError:(CGPoint)a3 toKey:(id)a4;
- (CGPoint)getCenterForKeyUnderLeftIndexFinger;
- (CGPoint)getCenterForKeyUnderRightIndexFinger;
- (CGRect)_paddedKeyUnionFrame;
- (CGRect)dragGestureRectInView:(id)a3;
- (CGRect)frameForKeyWithRepresentedString:(id)a3;
- (CGRect)frameForKeylayoutName:(id)a3;
- (CGRect)frameForKeylayoutName:(id)a3 onKeyplaneName:(id)a4;
- (CGRect)frameForLastKeyWithRepresentedString:(id)a3;
- (CGSize)handRestRecognizerStandardKeyPixelSize;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeForKeyplane:(id)a3;
- (CGSize)stretchFactor;
- (NSString)keyboardName;
- (NSString)keyplaneName;
- (NSString)layoutTag;
- (NSString)localizedInputKey;
- (NSString)localizedInputMode;
- (NSString)preTouchKeyplaneName;
- (SEL)handlerForNotification:(id)a3;
- (UIEdgeInsets)keyplanePadding;
- (UIKBRenderConfig)renderConfig;
- (UIKBTree)activeKey;
- (UIKBTree)keyboard;
- (UIKBTree)keyplane;
- (UIKeyboardEmojiKeyDisplayController)emojiKeyManager;
- (UIKeyboardKeyplaneTransitionDelegate)splitKeyplaneTransitionDelegate;
- (UIKeyboardLayoutStar)initWithFrame:(CGRect)a3;
- (UIKeyboardLayoutStarDelegate)delegate;
- (UIKeyboardPathEffectView)pathEffectView;
- (UISelectionFeedbackGenerator)slideBehaviour;
- (UITextCursorAssertion)blinkAssertion;
- (UIView)modalDisplayView;
- (double)biasedKeyboardWidthRatio;
- (double)hitBuffer;
- (double)lastTouchDownTimestamp;
- (double)lastTouchUpTimestamp;
- (double)lastTwoFingerTapTimestamp;
- (double)stretchFactorHeight;
- (id)_appendingSecondaryStringToVariantsTop:(id)a3 secondaryString:(id)a4 withDirection:(id)a5;
- (id)_currentKeyplaneTransformationContext;
- (id)_keyboardLongPressInteractionRegions;
- (id)_keyplaneVariantsKeyForString:(id)a3;
- (id)_variantsByAppendingDualStringKey:(id)a3 toVariants:(id)a4;
- (id)_variantsOfCurrencyKey:(id)a3 language:(id)a4;
- (id)accessibilityIdentifier;
- (id)activationIndicatorView;
- (id)activeMultitapCompleteKey;
- (id)activeTouchInfoForShift;
- (id)baseKeyForString:(id)a3;
- (id)cacheIdentifierForKeyplaneNamed:(id)a3;
- (id)cacheTokenForKeyplane:(id)a3 caseAlternates:(BOOL)a4;
- (id)candidateList;
- (id)createKeyEventForStringAction:(id)a3 forKey:(id)a4 inputFlags:(int)a5;
- (id)createKeyEventForStringAction:(id)a3 forKey:(id)a4 touchInfo:(id)a5 inputFlags:(int)a6;
- (id)currentKeyplane;
- (id)currentKeyplaneView;
- (id)currentRepresentedStringForDualDisplayKey:(id)a3;
- (id)defaultKeyplaneForKeyplane:(id)a3;
- (id)defaultNameForKeyplaneName:(id)a3;
- (id)flickPopupStringForKey:(id)a3 withString:(id)a4;
- (id)flickStringForInputKey:(id)a3 direction:(int64_t)a4;
- (id)generateInfoForTouch:(id)a3;
- (id)getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:(int64_t)a3;
- (id)getSortedKeysForDisplayRowHint:(int)a3;
- (id)handRestRecognizerGetHomeRowHint;
- (id)handRestRecognizerSilenceNextTouchDown;
- (id)highlightedVariantListForStylingKey:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)infoForTouch:(id)a3;
- (id)infoForTouchUUID:(id)a3;
- (id)initialKeyplaneNameWithKBStarName:(id)a3;
- (id)inputModeToMergeCapsLockKey;
- (id)internationalKeyDisplayStringOnEmojiKeyboard;
- (id)keyForKeyboardName:(id)a3 screenTraits:(id)a4;
- (id)keyHitTest:(CGPoint)a3;
- (id)keyHitTestClosestToPoint:(CGPoint)a3;
- (id)keyHitTestClosestToPoint:(CGPoint)a3 inKeys:(id)a4;
- (id)keyHitTestContainingPoint:(CGPoint)a3;
- (id)keyHitTestWithoutCharging:(CGPoint)a3;
- (id)keyViewAnimator;
- (id)keyViewHitTestForPoint:(CGPoint)a3;
- (id)keyWithRepresentedString:(id)a3;
- (id)keylistContainingKey:(id)a3;
- (id)keyplaneFactory;
- (id)keyplaneForKey:(id)a3;
- (id)keyplaneNameForRevertAfterTouch;
- (id)keyplaneNamed:(id)a3;
- (id)keyplaneView:(id)a3 containingViewForActiveKey:(id)a4;
- (id)multitapCompleteKeys;
- (id)multitapForwardKeys;
- (id)popupKeyViews;
- (id)simulateTouch:(CGPoint)a3;
- (id)simulateTouchForCharacter:(id)a3 errorVector:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6;
- (id)splitNameForKeyplane:(id)a3;
- (id)splitNameForKeyplaneName:(id)a3;
- (id)splitTransitionDelegate;
- (id)synthesizeTouchUpEventForKey:(id)a3;
- (id)touchInfoForKey:(id)a3;
- (id)unprocessedTouchEventsForTouchInfo:(id)a3 touchStage:(int)a4 forcedKeyCode:(int)a5;
- (id)viewForKey:(id)a3;
- (int)displayTypeHintForMoreKey;
- (int)displayTypeHintForShiftKey;
- (int)keycodeForKey:(id)a3;
- (int)playKeyClickSoundOn;
- (int)stateForCandidateListKey:(id)a3;
- (int)stateForDictationKey:(id)a3;
- (int)stateForKey:(id)a3;
- (int)stateForKeyplaneSwitchKey:(id)a3;
- (int)stateForManipulationKey:(id)a3;
- (int)stateForMultitapReverseKey:(id)a3;
- (int)stateForShiftKey:(id)a3;
- (int)stateForStylingKey:(id)a3;
- (int)visualStyleForKeyboardIfSplit:(BOOL)a3;
- (int64_t)currentHandBias;
- (int64_t)defaultSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4;
- (unint64_t)downActionFlagsForKey:(id)a3;
- (unint64_t)keyplaneShiftState;
- (unint64_t)targetEdgesForScreenGestureRecognition;
- (unint64_t)textEditingKeyMask;
- (unint64_t)upActionFlagsForKey:(id)a3;
- (unsigned)getHandRestRecognizerState;
- (void)_addExtraControlKeysIfNecessary;
- (void)_addResizeTransformationsIfNecessary;
- (void)_autoSplit:(id)a3;
- (void)_cleanUpBlinkAssertionIfNecessary;
- (void)_didChangeKeyplaneWithContext:(id)a3;
- (void)_didTapBiasEscapeButton:(id)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_recordKeystrokeStatisticForKeyPress;
- (void)_setBiasEscapeButtonVisible:(BOOL)a3;
- (void)_setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5;
- (void)_swapGlobeAndMoreKeysIfNecessary;
- (void)_transformCarPlayIfNecessary;
- (void)_transformFloatingKeyboardIfNecessary;
- (void)_transitionToContinuousPathState:(int64_t)a3 forTouchInfo:(id)a4;
- (void)_updateSupplementaryKeys;
- (void)accessibilitySensitivityChanged;
- (void)addContinuousPathPoint:(CGPoint)a3 withTimestamp:(double)a4;
- (void)annotateKeysWithDeveloperPunctuation;
- (void)annotateWriteboardDisplayTypeHintForKeyIfNeeded;
- (void)calculateReachabilityScoreWithKey:(id)a3 keyError:(CGPoint)a4;
- (void)cancelDelayedCentroidUpdate;
- (void)cancelModalDoubleConsonantKeysTimer;
- (void)cancelMultitapTimer;
- (void)cancelTouchIfNecessaryForInfo:(id)a3 forResting:(BOOL)a4;
- (void)cancelTouchesForTwoFingerTapGesture:(id)a3;
- (void)changeToKeyplane:(id)a3;
- (void)cleanupPreviousKeyboardWithNewInputTraits:(id)a3;
- (void)clearAllTouchInfo;
- (void)clearContinuousPathView;
- (void)clearHandwritingStrokesIfNeededAndNotify:(BOOL)a3;
- (void)clearInfoForTouch:(id)a3;
- (void)clearInfoForTouch:(id)a3 forResting:(BOOL)a4;
- (void)clearKeyAnnotationsIfNecessary;
- (void)clearTransientState;
- (void)clearUnusedObjects:(BOOL)a3;
- (void)completeCommitTouchesPrecedingTouchDownWithKey:(id)a3 withActions:(unint64_t)a4 executionContext:(id)a5;
- (void)completeDeleteActionForTouchDownWithActions:(unint64_t)a3 executionContext:(id)a4;
- (void)completeHitTestForTouchDown:(id)a3 executionContext:(id)a4;
- (void)completeHitTestForTouchDragged:(id)a3 hitKey:(id)a4;
- (void)completeRetestForTouchUp:(id)a3 timestamp:(double)a4 interval:(double)a5 executionContext:(id)a6;
- (void)completeSendStringActionForTouchDownWithKey:(id)a3 withActions:(unint64_t)a4 executionContext:(id)a5;
- (void)completeSendStringActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9;
- (void)continueFromInternationalActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9;
- (void)createLayoutFromName:(id)a3;
- (void)deactivateActiveKey;
- (void)deactivateActiveKeys;
- (void)deactivateActiveKeysClearingTouchInfo:(BOOL)a3 clearingDimming:(BOOL)a4;
- (void)dealloc;
- (void)deleteHandwritingStrokesAtIndexes:(id)a3;
- (void)didBeginContinuousPath;
- (void)didClearInput;
- (void)didDetectPinchWithSeparation:(double)a3;
- (void)didEndIndirectSelectionGesture;
- (void)didEndIndirectSelectionGesture:(BOOL)a3;
- (void)didEndTrackpadModeForServerSideDictation;
- (void)didMoveToWindow;
- (void)didRotate;
- (void)didTriggerDestructiveRenderConfigChange;
- (void)dismissGestureKeyboardIntroduction;
- (void)divideKeysIntoLeft:(id)a3 right:(id)a4;
- (void)downActionShiftWithKey:(id)a3;
- (void)endMultitapForKey:(id)a3;
- (void)fadeWithInvocation:(id)a3;
- (void)finishContinuousPathView:(BOOL)a3;
- (void)finishSliderBehaviorFeedback;
- (void)finishSplitTransition;
- (void)finishSplitTransitionWithCompletion:(id)a3;
- (void)finishSplitTransitionWithProgress:(double)a3;
- (void)finishSplitWithCompletion:(id)a3;
- (void)flushKeyCache:(id)a3;
- (void)handRestRecognizerNotifyRestForBegin:(BOOL)a3 location:(CGPoint)a4 timestamp:(double)a5 pathIndex:(int)a6 touchUUID:(id)a7 context:(id)a8;
- (void)handleDelayedCentroidUpdate;
- (void)handleDismissFlickView;
- (void)handleDismissFlickView:(id)a3;
- (void)handleDoubleConsonantKeysTimerFired;
- (void)handleKeyboardMenusForTouch:(id)a3;
- (void)handleMultitapTimerFired;
- (void)handlePopupView;
- (void)handlePopupView:(id)a3;
- (void)incrementPunctuationIfNeeded:(id)a3;
- (void)installGestureRecognizers;
- (void)layoutSubviews;
- (void)logHandwritingData;
- (void)longPressAction;
- (void)mergeKeysIfNeeded;
- (void)multitapExpired;
- (void)multitapInterrupted;
- (void)nextToUseInputModeDidChange:(id)a3;
- (void)performHitTestForTouchInfo:(id)a3 touchStage:(int)a4 executionContextPassingUIKBTree:(id)a5;
- (void)pinchDidConsumeTouch:(id)a3;
- (void)pinchHandler:(id)a3;
- (void)playKeyClickSoundForKey:(id)a3;
- (void)playKeyClickSoundOnDownForKey:(id)a3;
- (void)playKeyFeedbackIfNecessaryForTouchDownOnKey:(id)a3 touchInfo:(id)a4;
- (void)playKeyReleaseSoundForKey:(id)a3;
- (void)populateFlickPopupsForKey:(id)a3;
- (void)prepareForFloatingTransition:(BOOL)a3;
- (void)prepareForSplitTransition;
- (void)preparePopupVariantsForKey:(id)a3 onKeyplane:(id)a4;
- (void)prepareSliderBehaviorFeedback;
- (void)presentModalDisplayForKey:(id)a3;
- (void)provideSliderBehaviorFeedback;
- (void)rebuildSplitTransitionView;
- (void)recenterMonolithKeyplaneSwitchKeys;
- (void)refreshDualStringKeys;
- (void)refreshForDictationAvailablityDidChange;
- (void)refreshForRivenPreferences;
- (void)refreshGhostKeyState;
- (void)relayoutForWriteboardKey;
- (void)reloadCurrentKeyplane;
- (void)reloadKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5;
- (void)removeFromSuperview;
- (void)removePathEffectViewConstraintsIfNeeded;
- (void)resetHRRLayoutState;
- (void)resetPanAlternativesForEndedTouch:(id)a3;
- (void)resizeKeyplaneAndRedraw:(BOOL)a3;
- (void)restoreDefaultsForAllKeys;
- (void)restoreDefaultsForKey:(id)a3;
- (void)rollbackKeyplaneTransformations;
- (void)setAction:(SEL)a3 forKey:(id)a4;
- (void)setActiveKey:(id)a3;
- (void)setAutoShift:(BOOL)a3;
- (void)setAutoshift:(BOOL)a3;
- (void)setBlinkAssertion:(id)a3;
- (void)setCurrencyKeysForCurrentLocaleOnKeyplane:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidLongPress:(BOOL)a3;
- (void)setDisableInteraction:(BOOL)a3;
- (void)setHideKeysUnderIndicator:(BOOL)a3;
- (void)setKeyForTouchInfo:(id)a3 key:(id)a4;
- (void)setKeyboardAppearance:(int64_t)appearance;
- (void)setKeyboardBias:(int64_t)a3;
- (void)setKeyboardDim:(BOOL)a3;
- (void)setKeyboardDim:(BOOL)a3 amount:(double)a4 withDuration:(double)a5;
- (void)setKeyboardName:(id)a3;
- (void)setKeyboardName:(id)a3 appearance:(int64_t)a4;
- (void)setKeyplaneName:(id)a3;
- (void)setLabel:(id)a3 forKey:(id)a4;
- (void)setLastTwoFingerTapTimestamp:(double)a3;
- (void)setLayoutTag:(id)a3;
- (void)setLocalizedInputKey:(id)a3;
- (void)setLongPressAction:(SEL)a3 forKey:(id)a4;
- (void)setModalDisplayView:(id)a3;
- (void)setMultitapReverseKeyState;
- (void)setMuteNextKeyClickSound:(BOOL)a3;
- (void)setNeedsVirtualDriftUpdate;
- (void)setPasscodeOutlineAlpha:(double)a3;
- (void)setPathEffectView:(id)a3;
- (void)setPercentSignKeysForCurrentLocaleOnKeyplane:(id)a3;
- (void)setPlayKeyClickSoundOn:(int)a3;
- (void)setPreTouchKeyplaneName:(id)a3;
- (void)setPreferredHeight:(double)a3;
- (void)setPreventPaddlesForPointerTouches:(BOOL)a3;
- (void)setRenderConfig:(id)a3;
- (void)setRenderConfig:(id)a3 updateKeyplane:(BOOL)a4;
- (void)setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5;
- (void)setShift:(BOOL)a3;
- (void)setSlideBehaviour:(id)a3;
- (void)setSplit:(BOOL)a3 animated:(BOOL)a4;
- (void)setSplitKeyplaneTransitionDelegate:(id)a3;
- (void)setSplitProgress:(double)a3;
- (void)setState:(int)a3 forKey:(id)a4;
- (void)setTarget:(id)a3 forKey:(id)a4;
- (void)setTextEditingTraits:(id)a3;
- (void)setToInitialKeyplane;
- (void)setTrackpadMode:(BOOL)a3 animated:(BOOL)a4;
- (void)showFlickView:(int64_t)a3 withKey:(id)a4 flickString:(id)a5;
- (void)showKeyboardWithInputMode:(id)a3 renderConfig:(id)a4 inputTraits:(id)a5 screenTraits:(id)a6 splitTraits:(id)a7;
- (void)showKeyboardWithInputMode:(id)a3 renderConfig:(id)a4 inputTraits:(id)a5 screenTraits:(id)a6 splitTraits:(id)a7 reload:(BOOL)a8;
- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5;
- (void)showMenu:(id)a3 forKey:(id)a4;
- (void)showPopupVariantsForKey:(id)a3;
- (void)showPopupView:(int64_t)a3 withKey:(id)a4 popupInfo:(id)a5 force:(BOOL)a6;
- (void)showSplitTransitionView:(BOOL)a3;
- (void)swipeDetected:(id)a3;
- (void)switchKeyplane:(id)a3;
- (void)tearDownSplitTransitionView;
- (void)touchCancelled:(id)a3 executionContext:(id)a4;
- (void)touchCancelled:(id)a3 forResting:(BOOL)a4 executionContext:(id)a5;
- (void)touchChanged:(id)a3 executionContext:(id)a4;
- (void)touchDown:(id)a3 executionContext:(id)a4;
- (void)touchDownWithKey:(id)a3 withTouchInfo:(id)a4 atPoint:(CGPoint)a5 executionContext:(id)a6;
- (void)touchDragged:(id)a3;
- (void)touchDragged:(id)a3 executionContext:(id)a4;
- (void)touchModalDoubleConsonantKeysTimer;
- (void)touchMultitapTimer;
- (void)touchUp:(id)a3 executionContext:(id)a4;
- (void)traitCollectionDidChange;
- (void)transitionToModalContinuousPathKeyplane;
- (void)transitionToPunctuationKeysVisible:(BOOL)a3;
- (void)triggerSpaceKeyplaneSwitchIfNecessary;
- (void)typingStyleEstimator:(id)a3 didChangeTypingStyleEstimate:(unint64_t)a4;
- (void)uninstallGestureRecognizers;
- (void)upActionShift;
- (void)updateAllKeyStates;
- (void)updateAutolocalizedKeysForKeyplane:(id)a3;
- (void)updateBackgroundCorners;
- (void)updateBackgroundIfNeeded;
- (void)updateCachedKeyplaneKeycaps;
- (void)updateCurrencySymbolForKey:(id)a3 withCurrencyString:(id)a4;
- (void)updateGlobeKeyAndLayoutOriginBeforeSnapshotForInputView:(id)a3;
- (void)updateGlobeKeyDisplayString;
- (void)updateInputModeLocalizedKeysForKeyplane:(id)a3;
- (void)updateKeyCentroids;
- (void)updateKeyboardForKeyplane:(id)a3;
- (void)updateLayoutTags;
- (void)updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:(id)a3 withInputMode:(id)a4;
- (void)updateLocalizedDisplayStringsForKeys:(id)a3;
- (void)updateLocalizedKeys:(BOOL)a3;
- (void)updateLocalizedKeysForKeyplane:(id)a3 updateAllKeyplanes:(BOOL)a4;
- (void)updateLocalizedKeysOnKeyplane:(id)a3;
- (void)updateMoreAndInternationalKeys;
- (void)updatePanAlternativesForTouchInfo:(id)a3;
- (void)updatePhysicalKeyboardEvent:(id)a3 withMarkedInput:(id)a4;
- (void)updateReturnKeysIfNeeded;
- (void)updateSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4 withPoint:(CGPoint)a5;
- (void)updateShiftKeyState;
- (void)updateState:(int)a3 forKey:(id)a4;
- (void)updateStateForKey:(id)a3;
- (void)updateTransitionWithFlags:(unint64_t)a3;
- (void)updateUndoKeyState;
- (void)willBeginIndirectSelectionGesture;
- (void)willBeginIndirectSelectionGesture:(BOOL)a3;
- (void)willBeginTrackpadModeForServerSideDictation;
- (void)willMoveToWindow:(id)a3;
- (void)willRotate:(int64_t)a3;
@end

@implementation UIKeyboardLayoutStar

- (BOOL)isRotating
{
  return self->_preRotateKeyplaneName != 0;
}

+ (Class)_subclassForScreenTraits:(id)a3
{
  id v4 = a3;
  UIKeyboardComputeKeyboardIdiomFromScreenTraits(v4, [v4 idiom], objc_msgSend(v4, "isSplit"));
  if ([v4 idiom] == 3
    && (([v4 knobInput] & 1) != 0 || objc_msgSend(v4, "touchpadInput")))
  {
    objc_opt_class();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }
  v6 = v5;

  return (Class)v6;
}

- (id)accessibilityIdentifier
{
  return @"UIKeyboardLayoutStar Preview";
}

- (UIKeyboardLayoutStar)initWithFrame:(CGRect)a3
{
  v34.receiver = self;
  v34.super_class = (Class)UIKeyboardLayoutStar;
  v3 = -[UIKeyboardLayout initWithFrame:](&v34, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v3->_lastTwoFingerTapTimestamp = CFAbsoluteTimeGetCurrent();
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keyboards = v3->_keyboards;
    v3->_keyboards = v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    allKeyplaneViews = v3->_allKeyplaneViews;
    v3->_allKeyplaneViews = v6;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    allKeyplaneKeycaps = v3->_allKeyplaneKeycaps;
    v3->_allKeyplaneKeycaps = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    keysUnderIndicator = v3->_keysUnderIndicator;
    v3->_keysUnderIndicator = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    extendedTouchInfoMap = v3->_extendedTouchInfoMap;
    v3->_extendedTouchInfoMap = v12;

    v14 = objc_alloc_init(UIKBResizingKeyplaneCoordinator);
    resizingKeyplaneCoordinator = v3->_resizingKeyplaneCoordinator;
    v3->_resizingKeyplaneCoordinator = v14;

    [(UIKBResizingKeyplaneCoordinator *)v3->_resizingKeyplaneCoordinator setDelegate:v3];
    [(UIKeyboardLayoutStar *)v3 installGestureRecognizers];
    keyplaneView = v3->_keyplaneView;
    v3->_keyplaneView = 0;

    backgroundView = v3->_backgroundView;
    v3->_backgroundView = 0;

    localizedInputKey = v3->_localizedInputKey;
    v3->_localizedInputKey = 0;

    flickPopuptimer = v3->_flickPopuptimer;
    v3->_flickPopuptimer = 0;

    flickPopupView = v3->_flickPopupView;
    v3->_flickPopupView = 0;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    compositeImages = v3->_compositeImages;
    v3->_compositeImages = v21;

    v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v23 addObserver:v3 selector:sel_refreshForDictationAvailablityDidChange name:@"UIKeyboardDictationAvailabilityDidChangeNotification" object:0];
    [v23 addObserver:v3 selector:sel_refreshForDictationAvailablityDidChange name:@"UIDictationControllerDictationDidFinish" object:0];
    [v23 addObserver:v3 selector:sel_nextToUseInputModeDidChange_ name:@"UITextInputNextInputModeInputModeDidChangeNotification" object:0];
    [v23 addObserver:v3 selector:sel_didTriggerDestructiveRenderConfigChange name:@"UIAccessibilityBoldTextStatusDidChangeNotification" object:0];
    v24 = objc_alloc_init(_UIKeyboardTypingSpeedLogger);
    typingSpeedLogger = v3->_typingSpeedLogger;
    v3->_typingSpeedLogger = v24;

    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    keyplaneTransformations = v3->_keyplaneTransformations;
    v3->_keyplaneTransformations = v26;

    uint64_t v28 = [MEMORY[0x1E4F1C9C8] distantPast];
    prevProgressiveCandidateRequestTime = v3->_prevProgressiveCandidateRequestTime;
    v3->_prevProgressiveCandidateRequestTime = (NSDate *)v28;

    progressiveCandidateUpdateTimer = v3->_progressiveCandidateUpdateTimer;
    v3->_progressiveCandidateUpdateTimer = 0;

    v31 = [(UIKeyboardLayout *)v3 typingStyleEstimator];
    [v31 setDelegate:v3];

    objc_storeWeak(&currentInstance, v3);
    v32 = v3;
  }
  return v3;
}

- (void)dealloc
{
  v15[3] = *MEMORY[0x1E4F143B8];
  self->_inDealloc = 1;
  v3 = +[UIInputSwitcherView activeInstance];
  [v3 setLayout:0];

  objc_storeWeak(&currentInstance, 0);
  [(UIKeyboardLayoutStar *)self uninstallGestureRecognizers];
  [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
  multitapKey = self->_multitapKey;
  self->_multitapKey = 0;

  [(UIKeyboardLayoutStar *)self cancelMultitapTimer];
  [(UIKeyboardLayoutStar *)self cancelModalDoubleConsonantKeysTimer];
  [(UIKeyboardLayoutStar *)self rollbackKeyplaneTransformations];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v15[0] = @"UIKeyboardDictationAvailabilityDidChangeNotification";
  v15[1] = @"UITextInputNextInputModeInputModeDidChangeNotification";
  v15[2] = @"UIAccessibilityBoldTextStatusDidChangeNotification";
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  -[NSNotificationCenter _uiRemoveObserver:names:](v5, self, v6);

  if (self->_transitionView)
  {
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self->_transitionView];

    transitionView = self->_transitionView;
  }
  else
  {
    transitionView = 0;
  }
  [(UIKeyboardSplitTransitionView *)transitionView setSplitTransitionDataSource:0];
  v9 = self->_transitionView;
  self->_transitionView = 0;

  objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, 0);
  passcodeRenderConfig = self->_passcodeRenderConfig;
  self->_passcodeRenderConfig = 0;

  accentInfo = self->_accentInfo;
  self->_accentInfo = 0;

  hasAccents = self->_hasAccents;
  self->_hasAccents = 0;

  [(UIKeyboardLayoutStar *)self dismissGestureKeyboardIntroduction];
  [(NSTimer *)self->_flickPopuptimer invalidate];
  flickPopuptimer = self->_flickPopuptimer;
  self->_flickPopuptimer = 0;

  [(NSTimer *)self->_progressiveCandidateUpdateTimer invalidate];
  [(_UIKeyboardTypingSpeedLogger *)self->_typingSpeedLogger logToAggregate];
  [(UIKeyboardLayoutStar *)self removePathEffectViewConstraintsIfNeeded];
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v14 dealloc];
}

- (void)removePathEffectViewConstraintsIfNeeded
{
  if (self->_pathEffectViewConstraints)
  {
    objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
    pathEffectViewConstraints = self->_pathEffectViewConstraints;
    self->_pathEffectViewConstraints = 0;
  }
}

- (void)accessibilitySensitivityChanged
{
}

+ (void)accessibilitySensitivityChanged
{
  id WeakRetained = objc_loadWeakRetained(&currentInstance);
  [WeakRetained accessibilitySensitivityChanged];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  if (self->_gestureKeyboardIntroduction)
  {
    id v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKeyboardLayoutStar;
    id v4 = -[UIView hitTest:withEvent:](&v6, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (!v4
    && [(UIKeyboardLayoutStar *)self shouldDeactivateWithoutWindow]
    && !+[UIKeyboard resizable])
  {
    [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v5 willMoveToWindow:v4];
}

- (void)clearUnusedObjects:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  [(UIKeyboardLayoutStar *)self clearTransientState];
  [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
  if (self->_transitionView)
  {
    objc_super v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_transitionView];

    transitionView = self->_transitionView;
  }
  else
  {
    transitionView = 0;
  }
  [(UIKeyboardSplitTransitionView *)transitionView setSplitTransitionDataSource:0];
  [(UIView *)self->_transitionView removeFromSuperview];
  v7 = self->_transitionView;
  self->_transitionView = 0;

  id v8 = objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, 0);
  v9 = (void *)MEMORY[0x18C108260](v8);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v10 = [(NSMutableDictionary *)self->_keyboards keyEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v10);
        }
        if ([*(id *)(*((void *)&v26 + 1) + 8 * i) _containsSubstring:@"Emoji"])
        {
          +[UIKeyboardEmojiKeyDisplayController writeEmojiDefaultsAndReleaseActiveInputView];
          goto LABEL_14;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  if (v3)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v15 = [(NSMutableDictionary *)self->_allKeyplaneViews objectEnumerator];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = *(void **)(*((void *)&v22 + 1) + 8 * j);
          [v20 purgeSubviews];
          [v20 purgeKeyViews];
          [v20 purgeLayerContents];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }
  }
  keyplaneName = self->_keyplaneName;
  self->_keyplaneName = 0;
}

- (void)clearTransientState
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self modalDisplayView];

  if (v3)
  {
    id v4 = [(UIKeyboardLayoutStar *)self modalDisplayView];
    [v4 removeFromSuperview];

    [(UIKeyboardLayoutStar *)self setModalDisplayView:0];
    liveKeyplaneView = self->_liveKeyplaneView;
    if (liveKeyplaneView) {
      [(TUIKeyplaneView *)liveKeyplaneView setHidden:0];
    }
    if (![(UIKeyboardLayoutStar *)self useCrescendoLayout])
    {
      keyplaneView = self->_keyplaneView;
      [(UIView *)keyplaneView setHidden:0];
    }
  }
}

- (void)removeFromSuperview
{
  [(UIKeyboardLayoutStar *)self clearTransientState];
  [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
  [(UIKeyboardLayoutStar *)self cancelDelayedCentroidUpdate];
  [(UIKeyboardSplitTransitionView *)self->_transitionView setCompletionBlock:0];
  [(UIKeyboardLayoutStar *)self cancelMultitapTimer];
  [(UIKeyboardLayoutStar *)self cancelModalDoubleConsonantKeysTimer];
  [(UIKeyboardLayoutStar *)self rollbackKeyplaneTransformations];
  [(UIKeyboardLayoutStar *)self dismissGestureKeyboardIntroduction];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  [(UIView *)&v3 removeFromSuperview];
}

- (void)flushKeyCache:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    if (+[UIView _isInAnimationBlock]) {
      goto LABEL_9;
    }
    id v4 = [v15 userInfo];
    objc_super v5 = [v4 objectForKey:@"UIKeyboardChangedAccessoryOnly"];
    char v6 = [v5 BOOLValue];

    if (v6) {
      goto LABEL_9;
    }
    if (![(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected])
    {
      [(UIKeyboardLayoutStar *)self clearAllTouchInfo];
      [(UIKeyboardLayoutStar *)self handleDismissFlickView:0];
    }
  }
  v7 = +[UIKeyboardImpl activeInstance];
  [v7 stopAutoDelete];

  id v8 = +[UIKeyboardImpl activeInstance];
  [v8 cancelAllKeyEvents];

  v9 = +[UIKeyboardImpl activeInstance];
  [v9 clearLongPressTimer];

  flickPopuptimer = self->_flickPopuptimer;
  if (flickPopuptimer)
  {
    [(NSTimer *)flickPopuptimer invalidate];
    uint64_t v11 = self->_flickPopuptimer;
    self->_flickPopuptimer = 0;
  }
  [(UIKeyboardLayoutStar *)self deactivateActiveKeysClearingTouchInfo:0 clearingDimming:0];
  uint64_t v12 = +[UIInputSwitcherView activeInstance];
  [v12 hide];

  uint64_t v13 = +[UIKeyboardSplitControlMenu activeInstance];
  [v13 hide];

  objc_super v14 = +[UIKeyboardDictationMenu activeInstance];
  [v14 hide];

  [(UIKeyboardLayoutStar *)self setActiveKey:0];
  [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:0];
LABEL_9:
}

- (SEL)handlerForNotification:(id)a3
{
  return 0;
}

- (NSString)localizedInputMode
{
  localizedInputKey = self->_localizedInputKey;
  if (localizedInputKey)
  {
    objc_super v3 = [(NSString *)localizedInputKey componentsSeparatedByString:@"^"];
    id v4 = [v3 objectAtIndex:0];
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

+ (id)keyboardFromFactoryWithName:(id)a3 screenTraits:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    id v8 = [v6 screen];
    v9 = +[UIKBGraphCache graphCacheForScreen:v8];
    v10 = [v9 graphCache];

    uint64_t v11 = NSString;
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "idiom"));
    uint64_t v13 = [v11 stringWithFormat:@"%@", v12];

    if ([v5 hasPrefix:@"Dynamic"])
    {
      uint64_t v14 = [v13 stringByAppendingString:@"_Dynamic"];

      uint64_t v13 = (void *)v14;
    }
    id v15 = [v10 objectForKey:v13];
    if (!v15)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v10 setObject:v15 forKey:v13];
    }
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x2050000000;
    uint64_t v16 = (void *)getTUIKeyboardLayoutFactoryClass_softClass;
    uint64_t v25 = getTUIKeyboardLayoutFactoryClass_softClass;
    if (!getTUIKeyboardLayoutFactoryClass_softClass)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __getTUIKeyboardLayoutFactoryClass_block_invoke_1;
      v21[3] = &unk_1E52D9900;
      v21[4] = &v22;
      __getTUIKeyboardLayoutFactoryClass_block_invoke_1((uint64_t)v21);
      uint64_t v16 = (void *)v23[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v22, 8);
    uint64_t v18 = [v17 sharedKeyboardFactory];
    v19 = [v18 keyboardWithName:v5 inCache:v15];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)keyboardWithName:(id)a3 screenTraits:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x18C108260]();
    v9 = [a1 keyboardFromFactoryWithName:v6 screenTraits:v7];
    if ([v6 hasSuffix:@"PasscodePad"]
      && [v6 hasPrefix:@"Wildcat-"])
    {
      uint64_t v10 = [a1 keyboardFromFactoryWithName:@"iPhone-Portrait-NumberPad" screenTraits:v7];

      v9 = (void *)v10;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__UIKeyboardLayoutStar_keyboardWithName_screenTraits___block_invoke;
    v14[3] = &unk_1E52FA498;
    id v16 = a1;
    id v15 = v7;
    uint64_t v11 = _Block_copy(v14);
    uint64_t v12 = v11;
    if (!v9)
    {
      v9 = (*((void (**)(void *, id))v11 + 2))(v11, v6);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __54__UIKeyboardLayoutStar_keyboardWithName_screenTraits___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  while (1)
  {
    uint64_t v4 = [v3 rangeOfString:@"-" options:4];
    if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v5 = [v3 substringToIndex:v4];

    uint64_t v6 = [*(id *)(a1 + 40) keyboardFromFactoryWithName:v5 screenTraits:*(void *)(a1 + 32)];
    id v3 = (id)v5;
    if (v6)
    {
      id v7 = (void *)v6;
      id v3 = (id)v5;
      goto LABEL_6;
    }
  }
  id v7 = 0;
LABEL_6:

  return v7;
}

+ (CGSize)keyboardSizeForInputMode:(id)a3 screenTraits:(id)a4 keyboardType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v11 = [v10 preferencesActions];
  int v12 = [v11 inputModeSupportsCrescendo:v8];

  if (v12)
  {
    [getTUIKeyplaneViewClass() keyplaneSizeForLayout:v8 screenTraits:v9 keyboardType:a5];
    double v14 = v13;
    double v16 = v15;
  }
  else
  {
    id v17 = UIKeyboardGetKBStarName(v8, v9, a5, 0);
    uint64_t v18 = [a1 keyboardWithName:v17 screenTraits:v9];
    objc_msgSend(v18, "setIsFloating:", objc_msgSend(v9, "isFloating"));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v18 frame];
      double v14 = v19;
      double v16 = v20;
    }
    else
    {
      v21 = (double *)MEMORY[0x1E4F1DB30];
      uint64_t v30 = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      uint64_t v32 = __75__UIKeyboardLayoutStar_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke;
      v33 = &unk_1E52D9F98;
      id v34 = v17;
      id v35 = v18;
      if (keyboardSizeForInputMode_screenTraits_keyboardType__once_0 != -1) {
        dispatch_once(&keyboardSizeForInputMode_screenTraits_keyboardType__once_0, &v30);
      }
      double v14 = *v21;
      double v16 = v21[1];
    }
    uint64_t v22 = UIKeyboardGetDerivedKeyboard(v8, v9, a5);
    long long v23 = v22;
    if (v22)
    {
      [v22 keyboardSize];
      if (v24 != -1.0)
      {
        [v23 keyboardSize];
        double v16 = v25;
      }
      objc_msgSend(v23, "keyboardSize", v30, v31, v32, v33);
      if (v26 != -1.0)
      {
        [v23 keyboardSize];
        double v14 = v27;
      }
    }
  }
  double v28 = v14;
  double v29 = v16;
  result.height = v29;
  result.width = v28;
  return result;
}

void __75__UIKeyboardLayoutStar_keyboardSizeForInputMode_screenTraits_keyboardType___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &currentInstance_block_invoke___s_category) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138412546;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_ERROR, "Error: LayoutStar keyboardName %@ resulted in %@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)defaultNameForKeyplaneName:(id)a3
{
  return (id)[a3 stringByReplacingOccurrencesOfString:@"-split" withString:&stru_1ED0E84C0];
}

- (id)splitNameForKeyplaneName:(id)a3
{
  uint64_t v3 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:a3];
  uint64_t v4 = [v3 stringByAppendingString:@"-split"];

  return v4;
}

- (id)splitNameForKeyplane:(id)a3
{
  id v4 = a3;
  int v5 = [v4 stringForProperty:@"split-alternate"];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    uint64_t v8 = [v4 name];
    id v7 = [(UIKeyboardLayoutStar *)self splitNameForKeyplaneName:v8];
  }
  return v7;
}

- (id)defaultKeyplaneForKeyplane:(id)a3
{
  keyboard = self->_keyboard;
  int v5 = [a3 name];
  uint64_t v6 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:v5];
  id v7 = [(UIKBTree *)keyboard subtreeWithName:v6];

  return v7;
}

- (CGRect)dragGestureRectInView:(id)a3
{
  v36.receiver = self;
  v36.super_class = (Class)UIKeyboardLayoutStar;
  id v4 = a3;
  [(UIKeyboardLayout *)&v36 dragGestureRectInView:v4];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(UIKBTree *)self->_keyplane keysWithString:@"Dismiss", v36.receiver, v36.super_class];
  uint64_t v10 = [v9 lastObject];
  [v10 frame];
  double x = v11;
  double y = v13;
  double width = v15;
  double height = v17;

  if (self->_flickPopuptimer)
  {
    [(UIView *)self bounds];
    double v20 = v19;
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = width;
    v37.size.double height = height;
    double v21 = v20 - CGRectGetMaxX(v37);
    if (x < v21) {
      double v21 = x;
    }
    CGFloat v22 = -v21;
    v38.origin.double x = x;
    v38.origin.double y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    CGRect v39 = CGRectInset(v38, v22, v22);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
  }
  if (width >= v6) {
    double v23 = v6;
  }
  else {
    double v23 = width;
  }
  -[UIView convertRect:toView:](self, "convertRect:toView:", v4, width * 0.5 + x - v23 * 0.5, height * 0.5 + y - v8 * 0.5);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (CGRect)frameForKeylayoutName:(id)a3 onKeyplaneName:(id)a4
{
  keyboard = self->_keyboard;
  id v6 = a3;
  double v7 = [(UIKBTree *)keyboard subtreeWithName:a4];
  [v7 frameForKeylayoutName:v6];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)frameForKeylayoutName:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    int v5 = [v4 hasSuffix:@"right"];
    liveKeyplaneView = self->_liveKeyplaneView;
    if (v5) {
      [(TUIKeyplaneView *)liveKeyplaneView rightSplitSize];
    }
    else {
      [(TUIKeyplaneView *)liveKeyplaneView leftSplitSize];
    }
    double v15 = v7 + 10.0;
    double v17 = v8 + 10.0;
    CGFloat v13 = 0.0;
    CGFloat v11 = 0.0;
  }
  else
  {
    double v9 = [(UIKBTree *)self->_keyplane name];
    [(UIKeyboardLayoutStar *)self frameForKeylayoutName:v4 onKeyplaneName:v9];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    double v15 = v14;
    double v17 = v16;

    v28.origin.double x = v11;
    v28.origin.double y = v13;
    v28.size.double width = v15;
    v28.size.double height = v17;
    if (CGRectEqualToRect(v28, *MEMORY[0x1E4F1DB28]))
    {
      double v18 = [(UIKBTree *)self->_keyplane name];
      double v19 = [(UIKeyboardLayoutStar *)self splitNameForKeyplaneName:v18];

      [(UIKeyboardLayoutStar *)self frameForKeylayoutName:v4 onKeyplaneName:v19];
      CGFloat v11 = v20;
      CGFloat v13 = v21;
      double v15 = v22;
      double v17 = v23;
    }
  }

  double v24 = v11;
  double v25 = v13;
  double v26 = v15;
  double v27 = v17;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)tearDownSplitTransitionView
{
  transitionView = self->_transitionView;
  if (transitionView)
  {
    [(UIKeyboardSplitTransitionView *)transitionView setSplitTransitionDataSource:0];
    [(UIView *)self->_transitionView removeFromSuperview];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_transitionView];

    int v5 = self->_transitionView;
    self->_transitionView = 0;
  }
  objc_storeWeak((id *)&self->_splitKeyplaneTransitionDelegate, 0);
}

- (void)refreshForRivenPreferences
{
  if (![(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    if ([(UIKBScreenTraits *)self->super._screenTraits supportsSplit])
    {
      UIKeyboardSplitTransitionViewClass();
      char isKindOfClass = objc_opt_isKindOfClass();
      if (!self->_transitionView || (isKindOfClass & 1) == 0)
      {
        [(UIKeyboardLayoutStar *)self tearDownSplitTransitionView];
        id v4 = (UIKeyboardSplitTransitionView *)objc_msgSend(objc_alloc((Class)UIKeyboardSplitTransitionViewClass()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        transitionView = self->_transitionView;
        self->_transitionView = v4;

        [(UIView *)self->_transitionView setHidden:1];
        [(UIKeyboardSplitTransitionView *)self->_transitionView setSplitTransitionDataSource:self];
        [(UIView *)self addSubview:self->_transitionView];
      }
    }
    else
    {
      [(UIKeyboardLayoutStar *)self tearDownSplitTransitionView];
    }
    [(UIView *)self addGestureRecognizer:self->_upSwipeRecognizer];
    [v6 removeObserver:self name:@"UIKeyboardDidHideNotification" object:0];
    [v6 removeObserver:self name:@"UIKeyboardDidShowNotification" object:0];
  }
}

- (int)visualStyleForKeyboardIfSplit:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIKBTree *)self->_keyboard visualStyle];
  int v6 = [(UIKBTree *)self->_keyboard visualStyle];
  if (v3)
  {
    if (v6 == 102) {
      return 106;
    }
    int v8 = 109;
    int v9 = 108;
  }
  else
  {
    if (v6 == 106 || [(UIKBTree *)self->_keyboard visualStyle] == 107) {
      return 102;
    }
    int v8 = 108;
    int v9 = 109;
  }
  if ([(UIKBTree *)self->_keyboard visualStyle] == v9) {
    return v8;
  }
  else {
    return v5;
  }
}

- (void)setKeyboardAppearance:(int64_t)appearance
{
  if (appearance == -1) {
    appearance = self->_appearance;
  }
  self->_appearance = appearance;
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
  {
    int v4 = ![(UIKeyboardLayout *)self isFloating];
  }
  else
  {
    int v4 = 0;
  }
  if ([(UIKBTree *)self->_keyboard visualStyle] != 101
    && [(UIKBTree *)self->_keyboard visualStyle] != 4
    && [(UIKBTree *)self->_keyboard visualStyle] != 108
    && [(UIKBTree *)self->_keyboard visualStyle] != 301
    && [(UIKBTree *)self->_keyboard visualStyle] != 109)
  {
    int v5 = self->_appearance;
    switch(v5)
    {
      case 0:
      case 2:
        keyboard = self->_keyboard;
        if (v4) {
          goto LABEL_19;
        }
        goto LABEL_24;
      case 1:
      case 9:
        keyboard = self->_keyboard;
        if (v4) {
LABEL_19:
        }
          uint64_t v7 = 102;
        else {
          uint64_t v7 = 3;
        }
        goto LABEL_27;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 10:
        goto LABEL_28;
      case 11:
        goto LABEL_21;
      case 12:
        keyboard = self->_keyboard;
LABEL_24:
        uint64_t v7 = 1;
        goto LABEL_27;
      default:
        if (v5 == 127)
        {
LABEL_21:
          keyboard = self->_keyboard;
          if (v4) {
            uint64_t v7 = 105;
          }
          else {
            uint64_t v7 = 5;
          }
LABEL_27:
          [(UIKBTree *)keyboard setVisualStyle:v7];
        }
LABEL_28:
        if ([(UIKBTree *)self->_keyboard dynamicLayout]
          && ![(UIKBTree *)self->_keyboard visualStyle])
        {
          if (v4) {
            uint64_t v8 = 102;
          }
          else {
            uint64_t v8 = 1;
          }
          [(UIKBTree *)self->_keyboard setVisualStyle:v8];
        }
        break;
    }
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits supportsSplit])
  {
    [(UIKBTree *)self->_keyboard setVisualStyle:[(UIKeyboardLayoutStar *)self visualStyleForKeyboardIfSplit:[(UIKBScreenTraits *)self->super._screenTraits isSplit]]];
    [(UIKBTree *)self->_keyplane setVisualStyle:[(UIKBTree *)self->_keyboard visualStyle]];
    [(UIKeyboardLayoutStar *)self updateBackgroundIfNeeded];
  }
  else
  {
    uint64_t v9 = [(UIKBTree *)self->_keyboard visualStyle];
    keyplane = self->_keyplane;
    [(UIKBTree *)keyplane setVisualStyle:v9];
  }
}

- (BOOL)allKeyplanesHaveSameHeight
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(UIKBTree *)self->_keyboard subtrees];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    double v6 = -1.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        double v8 = v6;
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 type] == 2)
        {
          [v9 originalFrame];
          double Height = CGRectGetHeight(v19);
          double v6 = Height;
          if (v8 >= 0.0)
          {
            double v6 = v8;
            if (Height != v8)
            {
              BOOL v11 = 0;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (CGSize)sizeForKeyplane:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]
    && (liveKeyplaneView = self->_liveKeyplaneView) != 0)
  {
    [(TUIKeyplaneView *)liveKeyplaneView bounds];
    double v7 = v6;
    double v9 = v8;
  }
  else
  {
    if (!_UIApplicationIsStickerPickerService()) {
      goto LABEL_7;
    }
    uint64_t v10 = [(UIView *)self superview];
    if (!v10) {
      goto LABEL_7;
    }
    BOOL v11 = (void *)v10;
    double v12 = +[UIKeyboardImpl activeInstance];
    long long v13 = [v12 inputDelegateManager];
    long long v14 = [v13 keyInputDelegate];

    if (!v14)
    {
      double v31 = [(UIView *)self superview];
      [v31 bounds];
      double v7 = v32;
      double v9 = v33;
    }
    else
    {
LABEL_7:
      long long v15 = UIKeyboardGetCurrentInputMode();
      long long v16 = UIKeyboardGetDerivedKeyboard(v15, self->super._screenTraits, [(UITextInputTraits *)self->super._inputTraits keyboardType]);

      double v17 = [v4 subtrees];
      uint64_t v18 = [v17 count];

      if (v18)
      {
        [v4 frame];
        double v7 = v19;
        double v9 = v20;
        if ([(UIKeyboardLayoutStar *)self currentHandBias])
        {
          [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
          double v7 = v21;
        }
        else if (!+[UIKeyboard resizable] && v16)
        {
          [v16 keyboardSize];
          if (v27 != -1.0)
          {
            [v16 keyboardSize];
            double v7 = v28;
          }
          [v16 keyboardSize];
          if (v29 != -1.0
            && ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
             || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
             || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
             || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
             || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23
             || [(UIKeyboardLayoutStar *)self allKeyplanesHaveSameHeight]))
          {
            [v16 keyboardSize];
            double v9 = v30;
          }
        }
      }
      else
      {
        double v22 = [(UIKeyboardLayout *)self sizeDelegate];
        objc_msgSend(v22, "defaultSizeForInterfaceOrientation:", -[UIKeyboardLayout orientation](self, "orientation"));
        double v7 = v23;
        double v9 = v24;
      }
    }
  }

  double v25 = v7;
  double v26 = v9;
  result.double height = v26;
  result.double width = v25;
  return result;
}

- (UIEdgeInsets)keyplanePadding
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]
    && (liveKeyplaneView = self->_liveKeyplaneView) != 0)
  {
    [(TUIKeyplaneView *)liveKeyplaneView keyplaneInsets];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKeyboardLayoutStar;
    [(UIKeyboardLayout *)&v8 keyplanePadding];
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (void)updateKeyboardForKeyplane:(id)a3
{
  [(UIKeyboardLayoutStar *)self sizeForKeyplane:a3];
  double v4 = +[UIKeyboardInputModeController sharedInputModeController];
  id v7 = [v4 currentInputMode];

  double v5 = [(UIKeyboardLayout *)self sizeDelegate];
  objc_msgSend(v5, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", -[UIKeyboardLayout orientation](self, "orientation"), v7);

  [(UIView *)self frame];
  -[UIView setFrame:](self, "setFrame:");
  homeRowHint = self->_homeRowHint;
  self->_homeRowHint = 0;
}

- (id)keyForKeyboardName:(id)a3 screenTraits:(id)a4
{
  double v5 = NSString;
  id v6 = a3;
  id v7 = [v5 stringWithFormat:@"%@_%ld", v6, objc_msgSend(a4, "idiom")];

  return v7;
}

- (void)setKeyboardName:(id)a3 appearance:(int64_t)a4
{
  id v6 = a3;
  id v22 = v6;
  if (!v6)
  {
    NSLog(&cfstr_AttemptToSetKe.isa);
    goto LABEL_24;
  }
  id v7 = [(UIKeyboardLayoutStar *)self keyForKeyboardName:v6 screenTraits:self->super._screenTraits];
  objc_super v8 = [(NSMutableDictionary *)self->_keyboards objectForKey:v7];
  if (v8
    || ([(id)objc_opt_class() keyboardWithName:v22 screenTraits:self->super._screenTraits],
        (objc_super v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v9 = UIKeyboardGetCurrentInputMode();
    uint64_t v10 = [(UIKeyboardLayoutStar *)self localizedInputMode];
    if (v9 == v10) {
      int v11 = 0;
    }
    else {
      int v11 = [v9 isEqual:v10] ^ 1;
    }
    int64_t v21 = a4;
    if ([v22 isEqualToString:self->_keyboardName]
      && self->_appearance == a4
      && [(UITextInputTraits *)self->super._inputTraits keyboardType] != 126
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 3)
    {
      char v19 = (char)[(UIKBTree *)self->_keyplane visualStyling];
      BOOL v12 = (v19 & 0x3F) == 3;
      if ((v19 & 0x3F) == 3) {
        int v20 = 1;
      }
      else {
        int v20 = v11;
      }
      if (v20 != 1)
      {
LABEL_20:
        if (!+[UIKeyboardImpl rivenPreference]
          || self->_transitionView)
        {
LABEL_22:

          goto LABEL_23;
        }
LABEL_14:
        homeRowHint = self->_homeRowHint;
        self->_homeRowHint = 0;

        [(NSMutableDictionary *)self->_keyboards setObject:v8 forKey:v7];
        [(NSMutableDictionary *)self->_allKeyplaneViews removeAllObjects];
        [(NSMutableSet *)self->_keysUnderIndicator removeAllObjects];
        [(UIKBTree *)self->_keyplane clearManualAddedKey];
        long long v16 = (NSString *)[v22 copy];
        keyboardName = self->_keyboardName;
        self->_keyboardName = v16;

        objc_storeStrong((id *)&self->_keyboard, v8);
        keyplane = self->_keyplane;
        self->_keyplane = 0;

        [(UIView *)self setOpaque:0];
        [(NSMutableSet *)self->_validInputStrings removeAllObjects];
        [(UIKeyboardLayoutStar *)self setKeyboardAppearance:v21];
        [(UIKeyboardLayoutStar *)self clearAllTouchInfo];
        if (+[UIKeyboardImpl rivenInstalled]) {
          [(UIKeyboardLayoutStar *)self refreshForRivenPreferences];
        }
        goto LABEL_22;
      }
    }
    else
    {
      BOOL v12 = 1;
    }
    [(UIKeyboardLayoutStar *)self setLocalizedInputKey:&stru_1ED0E84C0];
    [(UIKeyboardLayoutStar *)self cancelMultitapTimer];
    [(UIKeyboardLayoutStar *)self cancelModalDoubleConsonantKeysTimer];
    long long v13 = [(NSMutableDictionary *)self->_allKeyplaneViews allValues];
    [v13 makeObjectsPerformSelector:sel_purgeSubviews];

    long long v14 = [(NSMutableDictionary *)self->_allKeyplaneViews allValues];
    [v14 makeObjectsPerformSelector:sel_purgeFactory];

    [(NSMutableSet *)self->_accentInfo removeAllObjects];
    [(NSMutableSet *)self->_hasAccents removeAllObjects];
    if (v12) {
      goto LABEL_14;
    }
    goto LABEL_20;
  }
LABEL_23:

LABEL_24:
}

- (double)lastTouchUpTimestamp
{
  return self->_prevTouchUpTime;
}

- (double)lastTouchDownTimestamp
{
  return self->_prevTouchDownTime;
}

- (BOOL)hasActiveKeys
{
  v2 = [(UIKeyboardLayoutStar *)self currentKeyplaneView];
  uint64_t v3 = [v2 activeKeyViews];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)canProduceString:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  validInputStrings = self->_validInputStrings;
  if (!validInputStrings)
  {
    id v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v7 = self->_validInputStrings;
    self->_validInputStrings = v6;

    validInputStrings = self->_validInputStrings;
  }
  if (![(NSMutableSet *)validInputStrings count])
  {
    id v33 = v4;
    CGRect v39 = UIKeyboardGetCurrentInputMode();
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = [(UIKBTree *)self->_keyboard subtrees];
    uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v36)
    {
      uint64_t v35 = *(void *)v45;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v45 != v35) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v8;
          double v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
          [(UIKeyboardLayoutStar *)self setCurrencyKeysForCurrentLocaleOnKeyplane:v9];
          long long v42 = 0u;
          long long v43 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v38 = [v9 keys];
          uint64_t v10 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v41;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v41 != v12) {
                  objc_enumerationMutation(v38);
                }
                long long v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                long long v15 = [v14 representedString];

                if (v15)
                {
                  long long v16 = self->_validInputStrings;
                  double v17 = [v14 fullRepresentedString];
                  [(NSMutableSet *)v16 addObject:v17];

                  uint64_t v18 = [v14 representedString];
                  if ([v14 displayType] == 7)
                  {
                    char v19 = [v14 secondaryRepresentedStrings];
                    uint64_t v20 = [v19 count];

                    if (v20)
                    {
                      int64_t v21 = [v14 secondaryRepresentedStrings];
                      id v22 = [v21 firstObject];

                      [(NSMutableSet *)self->_validInputStrings addObject:v22];
                      uint64_t v23 = [v18 stringByAppendingString:v22];

                      uint64_t v18 = (void *)v23;
                    }
                  }
                  if ([v14 variantType] == 3)
                  {
                    double v24 = [(UIKeyboardLayoutStar *)self _variantsOfCurrencyKey:v14 language:v39];
                    double v25 = self->_validInputStrings;
                    double v26 = [v24 objectForKeyedSubscript:@"Strings"];
                    [(NSMutableSet *)v25 addObjectsFromArray:v26];
                  }
                  double v27 = UIKeyboardRomanAccentVariants((uint64_t)v18, v39, 7);
                  double v28 = [v27 objectForKey:@"Strings"];

                  [(NSMutableSet *)self->_validInputStrings addObjectsFromArray:v28];
                }
              }
              uint64_t v11 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
            }
            while (v11);
          }

          uint64_t v8 = v37 + 1;
        }
        while (v37 + 1 != v36);
        uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v36);
    }

    id v4 = v33;
  }
  double v29 = (__CFString *)v4;
  if ([(__CFString *)v29 _isDelete])
  {
    double v30 = @"Delete";
LABEL_30:

    goto LABEL_31;
  }
  double v30 = v29;
  if ([(__CFString *)v29 _isNewlineOrReturn])
  {
    double v30 = @"\n";
    goto LABEL_30;
  }
LABEL_31:
  char v31 = [(NSMutableSet *)self->_validInputStrings containsObject:v30];

  return v31;
}

- (void)updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:(id)a3 withInputMode:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(UITextInputTraits *)self->super._inputTraits keyboardType];
  BOOL v9 = v8 > 0xB || ((1 << v8) & 0x930) == 0;
  if (v9 && v8 != 127)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = [v6 cachedKeysByKeyName:@"Emoji-International-Key"];
    uint64_t v18 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (!v18) {
      goto LABEL_13;
    }
    uint64_t v19 = v18;
    id v27 = v6;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v10);
        }
        id v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v23 = [v7 normalizedIdentifier];
        uint64_t v24 = [v23 rangeOfString:@"HWR"];

        if (v24 == 0x7FFFFFFFFFFFFFFFLL)
        {
          double v25 = [v7 identifier];
          double v26 = UIKeyboardLocalizedString(@"UI-ABC", v25, 0, @"ABC");
          [v22 setDisplayString:v26];
        }
        else
        {
          [v22 setDisplayString:@""];
        }
      }
      uint64_t v19 = [v10 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v19);
    goto LABEL_12;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v10 = [v6 cachedKeysByKeyName:@"NumberPad-International"];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    id v27 = v6;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        long long v16 = [v7 identifier];
        double v17 = UIKeyboardLocalizedString(@"UI-Numbers", v16, 0, @"123");
        [v15 setDisplayString:v17];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
LABEL_12:
    id v6 = v27;
  }
LABEL_13:
}

- (id)internationalKeyDisplayStringOnEmojiKeyboard
{
  if ([(UIKeyboardLayoutStar *)self showsDedicatedEmojiKeyAlongsideGlobeButton])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Emoji-International-Key"];
    uint64_t v3 = [v4 displayString];
  }
  return v3;
}

- (void)nextToUseInputModeDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v6 = [v4 objectForKey:@"UITextInputNextInputModeInputModeDidChangeKey"];

  [(UIKeyboardLayoutStar *)self updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:self->_keyplane withInputMode:v6];
  double v5 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Emoji-International-Key"];
  [v5 setRendering:38];
  [(UIKeyboardLayoutStar *)self setState:2 forKey:v5];
}

- (void)updateLocalizedKeysOnKeyplane:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  double v5 = [v4 cachedKeysByKeyName:@"Shift-Key"];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v63 objects:v71 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v64;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v63 + 1) + 8 * i);
        objc_msgSend(v10, "setDisplayTypeHint:", -[UIKeyboardLayoutStar displayTypeHintForShiftKey](self, "displayTypeHintForShiftKey"));
        uint64_t v11 = UIKBShiftKeyStringForActiveInputMode(v10);
        uint64_t v12 = (void *)v11;
        if (v11) {
          uint64_t v13 = (__CFString *)v11;
        }
        else {
          uint64_t v13 = @"shift";
        }
        [v10 setDisplayString:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v63 objects:v71 count:16];
    }
    while (v7);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v14 = [v4 cachedKeysByKeyName:@"More-Key"];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v59 objects:v70 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v60 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        if ([v19 interactionType] == 11)
        {
          objc_msgSend(v19, "setDisplayTypeHint:", -[UIKeyboardLayoutStar displayTypeHintForMoreKey](self, "displayTypeHintForMoreKey"));
          uint64_t v20 = UIKBMoreKeyStringForActiveInputMode(self->_keyboard, v19);
          [v19 setDisplayString:v20];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v59 objects:v70 count:16];
    }
    while (v16);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  int64_t v21 = [v4 cachedKeysByKeyName:@"Return-Key"];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v55 objects:v69 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v56;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v56 != v24) {
          objc_enumerationMutation(v21);
        }
        double v26 = *(void **)(*((void *)&v55 + 1) + 8 * k);
        id v27 = UIKeyboardLocalizedReturnKeyName((int)[v26 displayTypeHint]);
        [v26 setDisplayString:v27];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v55 objects:v69 count:16];
    }
    while (v23);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v28 = [v4 cachedKeysByKeyName:@"Dictation-Key"];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v51 objects:v68 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v52;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v52 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * m), "setDisplayTypeHint:", (unint64_t)objc_msgSend((id)UIKeyboardActiveUserSelectableInputModes, "count") > 1);
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v51 objects:v68 count:16];
    }
    while (v30);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v33 = objc_msgSend(v4, "cachedKeysByKeyName:", @"NumberPad-More", 0);
  uint64_t v34 = [v33 countByEnumeratingWithState:&v47 objects:v67 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v48;
    do
    {
      for (uint64_t n = 0; n != v35; ++n)
      {
        if (*(void *)v48 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void **)(*((void *)&v47 + 1) + 8 * n);
        objc_msgSend(v38, "setDisplayTypeHint:", -[UIKeyboardLayoutStar displayTypeHintForMoreKey](self, "displayTypeHintForMoreKey"));
        CGRect v39 = UIKBMoreKeyStringForActiveInputMode(self->_keyboard, v38);
        [v38 setDisplayString:v39];
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v47 objects:v67 count:16];
    }
    while (v35);
  }

  long long v40 = +[UIKeyboardInputModeController sharedInputModeController];
  long long v41 = [v40 inputModeThatInvokeEmoji];
  long long v42 = v41;
  if (v41)
  {
    id v43 = v41;
  }
  else
  {
    long long v44 = +[UIKeyboardInputModeController sharedInputModeController];
    long long v45 = +[UIKeyboardImpl activeInstance];
    long long v46 = [v45 textInputTraits];
    id v43 = [v44 nextInputModeInPreferenceListForTraits:v46 updatePreference:0];
  }
  [(UIKeyboardLayoutStar *)self updateLocalizedDisplayStringOnEmojiInternationalWithKeyplane:v4 withInputMode:v43];
  [(UIKeyboardLayoutStar *)self updateInputModeLocalizedKeysForKeyplane:v4];
}

- (void)updateAutolocalizedKeysForKeyplane:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = objc_msgSend(a3, "autolocalizedKeyCacheIterator", 0);
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
        [(UIKeyboardLayoutStar *)self updateLocalizedDisplayStringsForKeys:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateLocalizedDisplayStringsForKeys:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v43 = UIKeyboardGetCurrentInputMode();
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  obuint64_t j = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v47;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v47 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v46 + 1) + 8 * v7);
        if ([v8 displayType] != 23
          || ([v8 displayString],
              long long v9 = objc_claimAutoreleasedReturnValue(),
              int v10 = [v9 isEqualToString:@"shift"],
              v9,
              v10))
        {
          long long v11 = [v8 localizationKey];
          if ([v11 hasPrefix:@"Localized-Number-"])
          {
            long long v12 = [v11 substringFromIndex:objc_msgSend(@"Localized-Number-", "length")];
            int64_t v13 = [(UITextInputTraits *)self->super._inputTraits keyboardType];
            if (v13 == 127
              || ([MEMORY[0x1E4F1CA20] preferredLocale],
                  uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                  int v15 = UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v43, v14),
                  v14,
                  v15))
            {
              uint64_t v16 = UIKeyboardGetNumberFormatterForPreferredLocale();
              uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
              uint64_t v18 = [v16 stringFromNumber:v17];

              [v8 setDisplayString:v18];
              if (v13 == 127) {
                uint64_t v19 = v12;
              }
              else {
                uint64_t v19 = v18;
              }
              [v8 setRepresentedString:v19];
            }
            else
            {
              long long v33 = [MEMORY[0x1E4F1CA20] currentLocale];
              int v34 = UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v43, v33);

              if (v34)
              {
                uint64_t v35 = objc_msgSend(NSString, "localizedStringWithFormat:", @"%ld", objc_msgSend(v12, "integerValue"));
                [v8 setDisplayString:v35];
                [v8 setRepresentedString:v35];
              }
              else
              {
                [v8 setDisplayString:v12];
                [v8 setRepresentedString:v12];
              }
            }
            if ([v8 displayType] == 20)
            {
              if (+[UIKeyboard usesInputSystemUI]
                && (+[UIDevice currentDevice],
                    uint64_t v20 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v21 = [v20 userInterfaceIdiom],
                    v20,
                    v21 == 6))
              {
                [v8 setSecondaryDisplayStrings:&unk_1ED3F0268];
                [v8 setSecondaryRepresentedStrings:&unk_1ED3F0280];
              }
              else
              {
                uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"UI-NumberPad-%u", objc_msgSend(v12, "integerValue"));
                uint64_t v30 = UIKeyboardLocalizedString(v29, v43, 0, 0);

                if (v30)
                {
                  long long v51 = v30;
                  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
                  [v8 setSecondaryDisplayStrings:v31];

                  long long v50 = v30;
                  long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
                  [v8 setSecondaryRepresentedStrings:v32];
                }
              }
            }
          }
          else if ([v8 interactionType] == 9)
          {
            long long v12 = [v8 representedString];
            if (([v12 isEqualToString:@"NonASCII"] & 1) != 0
              || [v12 isEqualToString:@"ASCIICapable"])
            {
              uint64_t v22 = [(UIKeyboardLayoutStar *)self inputModeToMergeCapsLockKey];
              uint64_t v23 = [v22 identifier];

              if (v23)
              {
                id v24 = v23;

                long long v12 = v24;
              }
            }
            double v25 = UIKeyboardLocalizedString(v11, v12, 0, 0);
            [v8 setDisplayString:v25];
          }
          else
          {
            if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 2
              && [v11 hasSuffix:@"TV"])
            {
              double v26 = UIKeyboardLocalizedString(v11, 0, 0, 0);
              [v8 setDisplayString:v26];

              id v27 = [v8 displayString];

              uint64_t v28 = 0;
              if (!v27)
              {
                uint64_t v28 = [v11 substringToIndex:objc_msgSend(v11, "length") - objc_msgSend(@"TV", "length")];
              }

              long long v11 = (void *)v28;
            }
            if ([v11 hasSuffix:@"Caps"])
            {
              uint64_t v36 = [v11 substringToIndex:objc_msgSend(v11, "length") - objc_msgSend(@"Caps", "length")];

              long long v12 = UIKeyboardLocalizedString(v36, 0, 0, 0);
              uint64_t v37 = [MEMORY[0x1E4F1CA20] preferredLocale];
              uint64_t v38 = [v12 uppercaseStringWithLocale:v37];
              [v8 setDisplayString:v38];

              long long v11 = v36;
            }
            else
            {
              if ([v8 displayType] == 20
                && [v8 interactionType] == 14
                && [v11 isEqualToString:@"UI-Numbers"]
                && ([MEMORY[0x1E4F1CA20] preferredLocale],
                    CGRect v39 = objc_claimAutoreleasedReturnValue(),
                    int v40 = UIKeyboardInputModeLanguageMatchesLocaleLanguage((uint64_t)v43, v39),
                    v39,
                    v40))
              {
                uint64_t v41 = UIKeyboardGetNumbersStringForPreferredLocale();
              }
              else
              {
                if (!v11) {
                  goto LABEL_48;
                }
                uint64_t v41 = UIKeyboardLocalizedString(v11, 0, 0, 0);
              }
              long long v12 = (void *)v41;
              [v8 setDisplayString:v41];
            }
          }
        }
LABEL_48:
        ++v7;
      }
      while (v5 != v7);
      uint64_t v42 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      uint64_t v5 = v42;
    }
    while (v42);
  }
}

- (void)updateInputModeLocalizedKeysForKeyplane:(id)a3
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIKeyboardLayoutStar *)self updateAutolocalizedKeysForKeyplane:v4];
  uint64_t v5 = UIKeyboardGetCurrentInputMode();
  uint64_t v6 = UIKeyboardInputModeGetDecimalSeparator(v5);
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v68 = v4;
  uint64_t v7 = [v4 cachedKeysByKeyName:@"NumberPad-Dot"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v91 objects:v101 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v92 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        [v12 setDisplayString:v6];
        [v12 setRepresentedString:v6];
        [(UIKeyboardLayoutStar *)self setState:2 forKey:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v91 objects:v101 count:16];
    }
    while (v9);
  }
  long long v66 = (void *)v6;

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  int64_t v13 = [v68 cachedKeysByKeyName:@"Primary-Tag-Symbol"];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v87 objects:v100 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v88 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v87 + 1) + 8 * j);
        uint64_t v19 = UIKeyboardLocalizedString(@"UI-PrimaryTagSymbol", v5, 0, @"@");
        [v18 setDisplayString:v19];
        [v18 setRepresentedString:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v87 objects:v100 count:16];
    }
    while (v15);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  uint64_t v20 = [v68 cachedKeysByKeyName:@"Alternate-Tag-Symbol"];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v83 objects:v99 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v84;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v84 != v23) {
          objc_enumerationMutation(v20);
        }
        double v25 = *(void **)(*((void *)&v83 + 1) + 8 * k);
        double v26 = UIKeyboardLocalizedString(@"UI-AlternateTagSymbol", v5, 0, @"#");
        [v25 setDisplayString:v26];
        [v25 setRepresentedString:v26];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v83 objects:v99 count:16];
    }
    while (v22);
  }
  v70 = v5;

  v67 = [v68 cachedKeysByKeyName:@"Top-Level-Domain-Key"];
  if ([v67 count])
  {
    id v27 = [MEMORY[0x1E4F1CA20] preferredLocale];
    uint64_t v28 = [v27 localeIdentifier];

    uint64_t v29 = UIKeyboardTopLevelDomainVariants(v28, 3);
    uint64_t v30 = [v29 objectForKey:@"Strings"];
    uint64_t v31 = [v30 lastObject];

    if (v31) {
      goto LABEL_25;
    }
    long long v32 = UIKeyboardTopLevelDomainVariants(0, 3);

    long long v33 = [v32 objectForKey:@"Strings"];
    uint64_t v31 = [v33 lastObject];

    uint64_t v29 = v32;
    if (v31)
    {
LABEL_25:
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v34 = v67;
      uint64_t v35 = [v34 countByEnumeratingWithState:&v79 objects:v98 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v80;
        do
        {
          for (uint64_t m = 0; m != v36; ++m)
          {
            if (*(void *)v80 != v37) {
              objc_enumerationMutation(v34);
            }
            CGRect v39 = *(void **)(*((void *)&v79 + 1) + 8 * m);
            [v39 setDisplayString:v31];
            [v39 setRepresentedString:v31];
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v79 objects:v98 count:16];
        }
        while (v36);
      }
    }
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  int v40 = [v68 cachedKeysByKeyName:@"Single-Domain-Key"];
  uint64_t v69 = [v40 countByEnumeratingWithState:&v75 objects:v97 count:16];
  if (v69)
  {
    uint64_t v41 = *(void *)v76;
    while (2)
    {
      for (uint64_t n = 0; n != v69; ++n)
      {
        if (*(void *)v76 != v41) {
          objc_enumerationMutation(v40);
        }
        id v43 = *(void **)(*((void *)&v75 + 1) + 8 * n);
        long long v44 = UIKeyboardTopLevelDomainVariants(0, 3);
        long long v45 = [v44 objectForKey:@"Strings"];
        long long v46 = v45;
        if (!v45 || (unint64_t)[v45 count] < 3)
        {

          goto LABEL_53;
        }
        if ([v43 intForProperty:@"popup-bias"] == 2) {
          uint64_t v47 = -2;
        }
        else {
          uint64_t v47 = -1;
        }
        if ([v43 intForProperty:@"popup-bias"] == 29) {
          uint64_t v47 = -3;
        }
        long long v48 = objc_msgSend(v46, "objectAtIndex:", v47 + objc_msgSend(v46, "count"));
        if ([(UIKeyboardLayoutStar *)self shouldMatchCaseForDomainKeys]
          && [v68 isShiftKeyplane])
        {
          [MEMORY[0x1E4F1CA20] preferredLocale];
          uint64_t v49 = v41;
          v51 = long long v50 = v40;
          uint64_t v52 = [v48 uppercaseStringWithLocale:v51];

          int v40 = v50;
          uint64_t v41 = v49;
          long long v48 = (void *)v52;
        }
        [v43 setDisplayString:v48];
        [v43 setRepresentedString:v48];
      }
      uint64_t v69 = [v40 countByEnumeratingWithState:&v75 objects:v97 count:16];
      if (v69) {
        continue;
      }
      break;
    }
  }
LABEL_53:

  [(UIKeyboardLayoutStar *)self setCurrencyKeysForCurrentLocaleOnKeyplane:v68];
  [(UIKeyboardLayoutStar *)self setPercentSignKeysForCurrentLocaleOnKeyplane:v68];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v53 = [v68 cachedKeysByKeyName:@"Space-Key"];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v71 objects:v96 count:16];
  long long v55 = v70;
  if (v54)
  {
    uint64_t v56 = v54;
    uint64_t v57 = *(void *)v72;
    do
    {
      for (iuint64_t i = 0; ii != v56; ++ii)
      {
        if (*(void *)v72 != v57) {
          objc_enumerationMutation(v53);
        }
        long long v59 = *(void **)(*((void *)&v71 + 1) + 8 * ii);
        if (_os_feature_enabled_impl())
        {
          long long v60 = +[UIKeyboardInputModeController sharedInputModeController];
          long long v61 = [v60 currentInputMode];
          long long v62 = [v61 _iconLabelForMultilingualSet];

          if ([v62 length])
          {
            [v59 setDisplayString:@" "];
            v95 = v62;
            long long v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
            [v59 setSecondaryDisplayStrings:v63];
          }
          else
          {
            long long v64 = [v59 name];
            if ([v64 containsString:@"Unlabeled-Space-Key"])
            {
              [v59 setDisplayString:0];
            }
            else
            {
              long long v65 = UIKeyboardLocalizedString(@"UI-Space", 0, 0, 0);
              [v59 setDisplayString:v65];
            }
            [v59 setSecondaryDisplayStrings:0];
          }

          long long v55 = v70;
        }
      }
      uint64_t v56 = [v53 countByEnumeratingWithState:&v71 objects:v96 count:16];
    }
    while (v56);
  }
}

- (void)updateLocalizedKeys:(BOOL)a3
{
  if (self->_keyplaneName)
  {
    BOOL v3 = a3;
    keyplane = self->_keyplane;
    if (keyplane) {
      [(UIKeyboardLayoutStar *)self updateLocalizedKeysForKeyplane:keyplane updateAllKeyplanes:v3];
    }
  }
}

- (void)updateLocalizedKeysForKeyplane:(id)a3 updateAllKeyplanes:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = UIKeyboardGetCurrentInputMode();
  uint64_t v8 = [MEMORY[0x1E4F1CA20] preferredLocale];
  uint64_t v9 = [v8 localeIdentifier];

  uint64_t v10 = NSString;
  long long v11 = [v6 name];
  [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
  int64_t v13 = [v10 stringWithFormat:@"%@^%@^%@^%d", v7, v9, v11, (int)v12];

  if (v13 == self->_localizedInputKey)
  {
    int v14 = 0;
  }
  else
  {
    int v14 = -[NSString isEqual:](v13, "isEqual:") ^ 1;
    if (v14) {
      goto LABEL_6;
    }
  }
  if (!v4) {
    goto LABEL_18;
  }
LABEL_6:
  if (!v4)
  {
    [(UIKeyboardLayoutStar *)self updateLocalizedKeysOnKeyplane:v6];
    if (!v14) {
      goto LABEL_18;
    }
LABEL_17:
    [(UIKeyboardLayoutStar *)self setLocalizedInputKey:v13];
    goto LABEL_18;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = [(UIKBTree *)self->_keyboard subtrees];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [(UIKeyboardLayoutStar *)self updateLocalizedKeysOnKeyplane:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v17);
  }

  if (v14) {
    goto LABEL_17;
  }
LABEL_18:
}

- (BOOL)shouldMatchCaseForDomainKeys
{
  return 0;
}

- (void)rebuildSplitTransitionView
{
  if (![(UIKeyboardLayoutStar *)self useCrescendoLayout] && !self->_isRebuilding)
  {
    BOOL v3 = [(UIKBTree *)self->_keyplane name];
    BOOL v4 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:v3];
    uint64_t v15 = [(UIKeyboardLayoutStar *)self keyplaneNamed:v4];

    uint64_t v5 = [(UIKBTree *)self->_keyplane name];
    id v6 = [(UIKeyboardLayoutStar *)self splitNameForKeyplaneName:v5];
    uint64_t v7 = [(UIKeyboardLayoutStar *)self keyplaneNamed:v6];

    if (v15 | v7 && ![(UIKeyboardLayoutStar *)self isRotating] && self->_transitionView)
    {
      int64_t v8 = [(UIKeyboardLayout *)self orientation];
      id v9 = (id)v15;
      uint64_t v10 = v9;
      if ([v9 looksLikeShiftAlternate])
      {
        uint64_t v10 = v9;
        if ([v9 isShiftKeyplane])
        {
          keyboard = self->_keyboard;
          double v12 = [v9 shiftAlternateKeyplaneName];
          uint64_t v10 = [(UIKBTree *)keyboard subtreeWithName:v12];
        }
      }
      if (![v10 visualStyle]) {
        objc_msgSend(v10, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      }
      int64_t v13 = [(UIKeyboardLayoutStar *)self cacheTokenForKeyplane:v9 caseAlternates:0];
      int v14 = [(UIKeyboardLayoutStar *)self cacheTokenForKeyplane:v7 caseAlternates:0];
      if (!self->_isRebuilding)
      {
        self->_isRebuilding = 1;
        [(UIKeyboardLayoutStar *)self showSplitTransitionView:0];
        self->_splitTransitionNeedsRebuild = 0;
        [(UIKeyboardSplitTransitionView *)self->_transitionView rebuildFromKeyplane:v10 toKeyplane:v7 startToken:v13 endToken:v14 keyboardType:[(UITextInputTraits *)self->super._inputTraits keyboardType] orientation:v8];
        self->_isRebuilding = 0;
      }
    }
  }
}

- (CGImage)cachedCompositeImageWithCacheKey:(id)a3
{
  v22[5] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 arrayWithCapacity:5];
  uint64_t v7 = [(UIKeyboardLayoutStar *)self renderConfig];
  int64_t v8 = +[UIKBRenderingContext renderingContextForRenderConfig:v7];

  id v9 = +[UIKBRenderFactory cacheKeyForString:v5 withRenderFlags:2 renderingContext:v8];
  [v6 addObject:v9];

  uint64_t v10 = +[UIKBRenderFactory cacheKeyForString:v5 withRenderFlags:1 renderingContext:v8];
  [v6 addObject:v10];

  long long v11 = +[UIKBRenderFactory cacheKeyForString:v5 withRenderFlags:3 renderingContext:v8];
  [v6 addObject:v11];

  double v12 = +[UIKBRenderFactory cacheKeyForString:v5 withRenderFlags:6 renderingContext:v8];
  [v6 addObject:v12];

  int64_t v13 = +[UIKBRenderFactory cacheKeyForString:v5 withRenderFlags:4 renderingContext:v8];

  [v6 addObject:v13];
  int v14 = NSNumber;
  uint64_t v15 = [(UIKeyboardLayoutStar *)self renderConfig];
  [v15 keycapOpacity];
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:");
  v22[1] = v16;
  v22[2] = &unk_1ED3F4AA0;
  v22[3] = &unk_1ED3F4AA0;
  v22[4] = &unk_1ED3F4AA0;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];

  uint64_t v18 = +[UIKeyboardCache sharedInstance];
  uint64_t v19 = [(UIKBTree *)self->_keyplane layoutName];
  long long v20 = (const void *)[v18 cachedCompositeImageForCacheKeys:v6 fromLayout:v19 opacities:v17];

  if (v20) {
    CFAutorelease(v20);
  }

  return (CGImage *)v20;
}

- (CGImage)renderedImageWithStateFallbacksForToken:(id)a3
{
  id v4 = a3;
  id v5 = [v4 stringForState:2];
  id v6 = [(UIKeyboardLayoutStar *)self cachedCompositeImageWithCacheKey:v5];
  if (!v6)
  {
    int64_t v8 = [v4 stringForState:1];

    id v9 = [(UIKeyboardLayoutStar *)self cachedCompositeImageWithCacheKey:v8];
    if (v9)
    {
      uint64_t v7 = v9;
      id v5 = v8;
      goto LABEL_5;
    }
    id v5 = [v4 stringForState:4];

    id v6 = [(UIKeyboardLayoutStar *)self cachedCompositeImageWithCacheKey:v5];
  }
  uint64_t v7 = v6;
LABEL_5:

  return v7;
}

- (CGImage)renderedImageWithToken:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setStyling:", objc_msgSend(v4, "styling") & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)((unsigned __int16)-[UIKBTree visualStyling](self->_keyplane, "visualStyling") >> 8) << 8));
  keyplane = self->_keyplane;
  id v6 = [v4 name];
  uint64_t v7 = [(UIKBTree *)keyplane keysByKeyName:v6];

  if ((int)[v4 emptyFields] >= 2 && (objc_msgSend(v4, "hasKey") & 1) != 0
    || [v4 emptyFields] == 1 && !objc_msgSend(v7, "count"))
  {
    uint64_t v10 = [(UIKeyboardLayoutStar *)self renderedImageWithStateFallbacksForToken:v4];
    goto LABEL_22;
  }
  if (![v7 count])
  {
    int64_t v8 = 0;
    goto LABEL_12;
  }
  int64_t v8 = [v7 objectAtIndex:0];
  if (!v8)
  {
LABEL_12:
    int v9 = 2;
    goto LABEL_13;
  }
  int v9 = [(UIKeyboardLayoutStar *)self stateForKey:v8];
  if (v9 == 4)
  {
    if ([v8 displayType] != 14)
    {
      uint64_t v11 = 2;
      goto LABEL_14;
    }
    int v9 = 4;
  }
LABEL_13:
  uint64_t v11 = v9 & 0xFFFFFFFB;
LABEL_14:
  [v8 paddedFrame];
  objc_msgSend(v4, "setSize:", v12, v13);
  [v4 resetAnnotations];
  if ([v8 isRightToLeftSensitive])
  {
    int v14 = +[UIKeyboardInputModeController sharedInputModeController];
    uint64_t v15 = [v14 currentLinguisticInputMode];
    objc_msgSend(v4, "annotateWithBool:", objc_msgSend(v15, "isDefaultRightToLeft"));
  }
  if ([v8 displayTypeHint] == 10 && objc_msgSend(v8, "displayType") == 7) {
    objc_msgSend(v4, "annotateWithBool:", -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"));
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3) {
    [v4 annotateWithBool:UIKeyboardCarPlayIsRightHandDrive()];
  }
  uint64_t v16 = [v4 stringForKey:v8 state:v11];
  uint64_t v10 = [(UIKeyboardLayoutStar *)self cachedCompositeImageWithCacheKey:v16];

LABEL_22:
  return v10;
}

- (CGImage)renderedKeyplaneWithToken:(id)a3 split:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v6, "stringForSplitState:handBias:", v4, -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"));

  int64_t v8 = [(UIKeyboardLayoutStar *)self cachedCompositeImageWithCacheKey:v7];
  return v8;
}

+ (id)sharedRivenKeyplaneGenerator
{
  if (qword_1EB25AB50 != -1) {
    dispatch_once(&qword_1EB25AB50, &__block_literal_global_333);
  }
  v2 = (void *)qword_1EB25AB48;
  return v2;
}

void __52__UIKeyboardLayoutStar_sharedRivenKeyplaneGenerator__block_invoke()
{
  v0 = objc_alloc_init(UIKBSplitKeyplaneGenerator);
  v1 = (void *)qword_1EB25AB48;
  qword_1EB25AB48 = (uint64_t)v0;
}

- (void)traitCollectionDidChange
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIView *)self _inheritedRenderConfig];
  if (v3) {
    [(UIKeyboardLayoutStar *)self setRenderConfig:v3];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v4 = [(NSMutableDictionary *)self->_allKeyplaneViews objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 purgeFactory];
        if (v3) {
          [v9 setRenderConfig:v3];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  [(UIKeyboardLayoutStar *)self reloadCurrentKeyplane];
}

- (void)setRenderConfig:(id)a3
{
}

- (void)setRenderConfig:(id)a3 updateKeyplane:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = (UIKBRenderConfig *)a3;
  uint64_t v6 = [(UIKeyboardLayoutStar *)self delegate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    int64_t v8 = [(UIKeyboardLayoutStar *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      long long v10 = [(UIKeyboardLayoutStar *)self delegate];
      uint64_t v11 = [v10 keyboardLayout:self willChangeRenderConfig:v30];

      uint64_t v30 = (UIKBRenderConfig *)v11;
    }
  }
  if (![(UIKBRenderConfig *)self->_renderConfig isEqual:v30])
  {
    if (v4)
    {
      BOOL v12 = [(UIKBRenderConfig *)self->_renderConfig lightKeyboard];
      int v13 = v12 ^ [(UIKBRenderConfig *)v30 lightKeyboard];
    }
    else
    {
      int v13 = 0;
    }
    if (([(UIKBTree *)self->_keyplane visualStyling] & 0xFF00) != 0x7F00
      || (passcodeRenderConfig = self->_passcodeRenderConfig) == 0)
    {
      passcodeRenderConfig = v30;
    }
    uint64_t v15 = passcodeRenderConfig;
    renderConfig = self->_renderConfig;
    self->_renderConfig = v15;

    uint64_t v17 = +[UIKeyboardImpl activeInstance];
    uint64_t v18 = [v17 delegateAsResponder];
    uint64_t v19 = [v18 inputAssistantItem];
    long long v20 = [v19 _dictationReplacementAction];

    if (v20) {
      char v21 = v13;
    }
    else {
      char v21 = 0;
    }
    if ((v21 & 1) != 0
      || (long long v22 = self->_dictationReplacementKeycap,
          [v20 title],
          long long v23 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v22) = [(NSString *)v22 isEqualToString:v23],
          v23,
          (v22 & 1) == 0))
    {
      id v24 = [v20 title];
      dictationReplacementKeycap = self->_dictationReplacementKeycap;
      self->_dictationReplacementKeycap = v24;

      [(UIKBRenderConfig *)self->_renderConfig overrideKeycapWithSymbol:self->_dictationReplacementKeycap forDisplayType:4];
      [(UIKBRenderConfig *)self->_renderConfig overrideKeycapWithSymbol:self->_dictationReplacementKeycap forDisplayType:56];
    }
    if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
    {
      double v26 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
    }
    else
    {
      [(UIKBKeyplaneView *)self->_keyplaneView setRenderConfig:self->_renderConfig];
      double v26 = &OBJC_IVAR___UIKeyboardLayoutStar__resizingKeyplaneCoordinator;
      [(UIKBBackgroundView *)self->_backgroundView setRenderConfig:self->_renderConfig];
    }
    [*(id *)((char *)&self->super.super.super.super.isa + *v26) setRenderConfig:self->_renderConfig];
    id v27 = +[UIInputSwitcherView activeInstance];
    int v28 = [v27 isVisible];

    if (v28)
    {
      uint64_t v29 = +[UIInputSwitcherView activeInstance];
      [v29 setRenderConfig:v30];
    }
    if (v13) {
      [(UIKeyboardLayoutStar *)self didTriggerDestructiveRenderConfigChange];
    }
  }
}

- (void)didTriggerDestructiveRenderConfigChange
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    liveKeyplaneView = self->_liveKeyplaneView;
    renderConfig = self->_renderConfig;
    [(TUIKeyplaneView *)liveKeyplaneView setRenderConfig:renderConfig];
  }
  else
  {
    [(UIKBKeyplaneView *)self->_keyplaneView purgeFactory];
    [(UIKeyboardLayoutStar *)self reloadCurrentKeyplane];
  }
}

- (void)setPasscodeOutlineAlpha:(double)a3
{
  passcodeRenderConfig = self->_passcodeRenderConfig;
  if (!passcodeRenderConfig)
  {
    uint64_t v6 = +[UIKBRenderConfig darkConfig];
    uint64_t v7 = (UIKBRenderConfig *)[v6 copy];
    int64_t v8 = self->_passcodeRenderConfig;
    self->_passcodeRenderConfig = v7;

    passcodeRenderConfig = self->_passcodeRenderConfig;
  }
  [(UIKBRenderConfig *)passcodeRenderConfig setKeycapOpacity:a3 * 0.5];
  if (([(UIKBTree *)self->_keyplane visualStyling] & 0xFF00) == 0x7F00)
  {
    char v9 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
    p_renderConfig = &self->_renderConfig;
    objc_storeStrong((id *)&self->_renderConfig, self->_passcodeRenderConfig);
    if (![(UIKeyboardLayoutStar *)self useCrescendoLayout])
    {
      [(UIKBKeyplaneView *)self->_keyplaneView setRenderConfig:*p_renderConfig];
      char v9 = &OBJC_IVAR___UIKeyboardLayoutStar__backgroundView;
    }
    uint64_t v11 = *(Class *)((char *)&self->super.super.super.super.isa + *v9);
    BOOL v12 = *p_renderConfig;
    [v11 setRenderConfig:v12];
  }
}

- (void)willBeginIndirectSelectionGesture
{
}

- (void)willBeginIndirectSelectionGesture:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v5 willBeginIndirectSelectionGesture];
  [(UIKeyboardLayoutStar *)self setTrackpadMode:1 animated:v3];
}

- (void)cancelTouchesForTwoFingerTapGesture:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v4 cancelTouchesForTwoFingerTapGesture:a3];
  [(UIKeyboardLayoutStar *)self deactivateActiveKeysClearingTouchInfo:1 clearingDimming:1];
}

- (void)didEndIndirectSelectionGesture
{
}

- (BOOL)isDeveloperGestureKeybaord
{
  return ([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) != 0x17
      && [(UITextInputTraits *)self->super._inputTraits keyboardType] == 12;
}

- (void)didEndIndirectSelectionGesture:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v5 didEndIndirectSelectionGesture];
  [(UIKeyboardLayoutStar *)self setTrackpadMode:0 animated:v3];
}

- (void)willBeginTrackpadModeForServerSideDictation
{
}

- (void)didEndTrackpadModeForServerSideDictation
{
}

- (void)setTrackpadMode:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v32[2] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    self->_isTrackpadMode = 0;
    int v14 = +[UIKeyboard activeKeyboard];
    [v14 setTypingEnabled:1];

    LODWORD(v14) = [(UIKeyboardLayoutStar *)self isDeveloperGestureKeybaord];
    uint64_t v15 = +[UIKeyboardPreferencesController sharedPreferencesController];
    uint64_t v16 = [v15 preferencesActions];
    if ([v16 BOOLForPreferenceKey:@"GesturesEnabled"] | v14) {
      double v17 = 0.25;
    }
    else {
      double v17 = 1.0;
    }

    v28[0] = &unk_1ED3F2018;
    v27[0] = &unk_1ED3F4AD0;
    v27[1] = &unk_1ED3F4AE8;
    BOOL v12 = [NSNumber numberWithDouble:v17];
    v28[1] = v12;
    v27[2] = &unk_1ED3F4A88;
    uint64_t v18 = NSNumber;
    uint64_t v19 = [(UIKeyboardLayoutStar *)self renderConfig];
    [v19 lightKeycapOpacity];
    long long v20 = objc_msgSend(v18, "numberWithDouble:");
    v28[2] = v20;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

    goto LABEL_11;
  }
  [(UIKeyboardLayoutStar *)self cancelModalDoubleConsonantKeysTimer];
  self->_isTrackpadMode = a3;
  uint64_t v7 = +[UIKeyboard activeKeyboard];
  [v7 setTypingEnabled:0];

  int64_t v8 = +[UIKeyboardImpl activeInstance];
  [v8 clearLanguageIndicator];

  [(UIKeyboardLayoutStar *)self deactivateActiveKeysClearingTouchInfo:1 clearingDimming:0];
  [(UIKeyboardLayoutStar *)self clearHandwritingStrokesIfNeededAndNotify:1];
  char v9 = [(UIKeyboardLayoutStar *)self renderConfig];
  if ([v9 lightKeyboard]) {
    double v10 = 0.5;
  }
  else {
    double v10 = 0.6;
  }

  v32[0] = &unk_1ED3F1FF8;
  v31[0] = &unk_1ED3F4AB8;
  v31[1] = &unk_1ED3F4A88;
  uint64_t v11 = [NSNumber numberWithDouble:v10];
  v32[1] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];

  if ([(UIKeyboardLayoutStar *)self isEmojiKeyplane])
  {
    v29[0] = &unk_1ED3F4AB8;
    v29[1] = &unk_1ED3F4A88;
    v30[0] = &unk_1ED3F2008;
    v30[1] = &unk_1ED3F2008;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
LABEL_11:

    BOOL v12 = (void *)v13;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__UIKeyboardLayoutStar_setTrackpadMode_animated___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  aBlock[4] = self;
  id v21 = v12;
  id v26 = v21;
  long long v22 = _Block_copy(aBlock);
  long long v23 = v22;
  if (v4)
  {
    +[UIView animateWithDuration:50331648 delay:v22 options:0 animations:0.2 completion:0.0];
    if (a3) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  (*((void (**)(void *))v22 + 2))(v22);
  if (!a3)
  {
LABEL_16:
    id v24 = +[UIKeyboardImpl activeInstance];
    [v24 updateKeyboardConfigurations];

    [(UIKeyboardLayoutStar *)self clearContinuousPathView];
  }
LABEL_17:
}

void __49__UIKeyboardLayoutStar_setTrackpadMode_animated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) useCrescendoLayout];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  if (v2)
  {
    objc_super v5 = (id *)(v4 + 1448);
  }
  else
  {
    [*(id *)(v4 + 688) dimKeys:v3];
    uint64_t v3 = *(void *)(a1 + 40);
    objc_super v5 = (id *)(*(void *)(a1 + 32) + 1344);
  }
  [*v5 dimKeys:v3];
  uint64_t v6 = +[UIKeyboardImpl activeInstance];
  int v7 = [v6 usesCandidateSelection];

  if (v7)
  {
    id v9 = +[UIKeyboardImpl activeInstance];
    int64_t v8 = [v9 candidateController];
    [v8 dimKeys:*(void *)(a1 + 40)];
  }
}

- (BOOL)isHandwritingPlane
{
  uint64_t v3 = [(UIKBTree *)self->_keyboard name];
  if ([v3 _containsSubstring:@"HWR"])
  {
    uint64_t v4 = [(UIKBTree *)self->_keyplane name];
    char v5 = [v4 _containsSubstring:@"Letters"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)updateBackgroundCorners
{
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
  {
    [(UIKeyboardLayoutStar *)self updateBackgroundIfNeeded];
  }
}

- (void)updateBackgroundIfNeeded
{
  uint64_t v3 = [(UIView *)self->_keyplaneView superview];
  if (v3
    && (uint64_t v4 = (void *)v3, v5 = [(UIKBScreenTraits *)self->super._screenTraits idiom], v4, v5 != 2))
  {
    if (!self->_backgroundView)
    {
      int v7 = [UIKBBackgroundView alloc];
      [(UIView *)self bounds];
      int64_t v8 = -[UIKBBackgroundView initWithFrame:](v7, "initWithFrame:");
      backgroundView = self->_backgroundView;
      self->_backgroundView = v8;
    }
    [(UIView *)self->_backgroundView setHidden:[(UIKeyboardLayoutStar *)self isEmojiKeyplane]];
    [(UIView *)self bounds];
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    [(UIKBBackgroundView *)self->_backgroundView setScreenTraits:self->super._screenTraits];
    double v10 = [(UIKeyboardLayoutStar *)self renderConfig];
    [(UIKBBackgroundView *)self->_backgroundView setRenderConfig:v10];

    [(UIKBBackgroundView *)self->_backgroundView refreshStyleForKeyplane:self->_keyplane inputTraits:self->super._inputTraits];
    if (![(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected]) {
      [(UIView *)self->_backgroundView setHidden:0];
    }
    [(UIView *)self setOpaque:0];
  }
  else
  {
    uint64_t v6 = self->_backgroundView;
    [(UIView *)v6 setHidden:1];
  }
}

- (BOOL)shouldShowDictationKey
{
  if ([(UITextInputTraits *)self->super._inputTraits isSecureTextEntry]
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 3
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 4)
  {
    goto LABEL_16;
  }
  uint64_t v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Dictation-Key"];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    BOOL v5 = +[UIDictationController checkTraitsSupportDictation:self->super._inputTraits];

    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
  uint64_t v8 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"NumberPad-Dictation"];
  if (v8)
  {
    id v9 = (void *)v8;
  }
  else
  {
    id v9 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"TenKey-Dictation-Key"];
    if (!v9) {
      return (char)v9;
    }
  }
  BOOL v11 = +[UIDictationController checkTraitsSupportDictation:self->super._inputTraits];

  if (!v11)
  {
LABEL_16:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
LABEL_6:
  uint64_t v6 = +[UIDictationController activeInstance];

  if (!v6)
  {
    LOBYTE(v9) = 1;
    if (!self->_pendingDictationReload)
    {
      self->_pendingDictationReload = 1;
      double v10 = +[UIPeripheralHost sharedInstance];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __46__UIKeyboardLayoutStar_shouldShowDictationKey__block_invoke;
      v12[3] = &unk_1E52D9F70;
      v12[4] = self;
      [v10 queueDelayedTask:v12];
    }
    return (char)v9;
  }
  return +[UIDictationController fetchCurrentInputModeSupportsDictation];
}

void __46__UIKeyboardLayoutStar_shouldShowDictationKey__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 656);
  if (v2)
  {
    id v8 = v2;
    BOOL v3 = +[UIDictationController fetchCurrentInputModeSupportsDictation];
    uint64_t v4 = *(void **)(a1 + 32);
    if (v3)
    {
      [v4 refreshForDictationAvailablityDidChange];
    }
    else
    {
      [v4 setKeyplaneName:0];
      [*(id *)(a1 + 32) setKeyplaneName:v8];
      BOOL v5 = [*(id *)(a1 + 32) candidateList];
      char v6 = objc_opt_respondsToSelector();

      id v2 = v8;
      if ((v6 & 1) == 0) {
        goto LABEL_7;
      }
      int v7 = +[UIKeyboardImpl activeInstance];
      [v7 generateCandidates];
    }
    id v2 = v8;
  }
LABEL_7:
  *(unsigned char *)(*(void *)(a1 + 32) + 1312) = 0;
}

- (BOOL)canReuseKeyplaneView
{
  if (self->_externalDictationAndInternationalKeys != +[UIKeyboardImpl showsGlobeAndDictationKeysExternally])return 0; {
  int HasMultipleActiveSecureInputModes = +[UIKeyboardImpl canShowInternationalKey];
  }
  if (HasMultipleActiveSecureInputModes)
  {
    if ([(UITextInputTraits *)self->super._inputTraits isSecureTextEntry]) {
      int HasMultipleActiveSecureInputModes = UIKeyboardHasMultipleActiveSecureInputModes();
    }
    else {
      int HasMultipleActiveSecureInputModes = (unint64_t)[(id)UIKeyboardActiveUserSelectableInputModes count] > 1;
    }
  }
  if (HasMultipleActiveSecureInputModes != self->_showIntlKey
    || self->_showDictationKey != [(UIKeyboardLayoutStar *)self shouldShowDictationKey]
    || self->_inputTraitsPreventInitialReuse)
  {
    return 0;
  }
  uint64_t v6 = [(UIKeyboardLayoutStar *)self useCrescendoLayout] ? 1448 : 688;
  if (!*(Class *)((char *)&self->super.super.super.super.isa + v6)
    || ![(NSMutableDictionary *)self->_allKeyplaneViews count])
  {
    return 0;
  }
  int v7 = NSString;
  id v8 = UIKeyboardGetCurrentInputMode();
  id v9 = [MEMORY[0x1E4F1CA20] preferredLocale];
  double v10 = [v9 localeIdentifier];
  BOOL v11 = [(UIKBTree *)self->_keyplane name];
  [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
  uint64_t v13 = [v7 stringWithFormat:@"%@^%@^%@^%d", v8, v10, v11, (int)v12];

  if (v13 == self->_localizedInputKey) {
    char v4 = 1;
  }
  else {
    char v4 = -[NSString isEqual:](v13, "isEqual:");
  }

  return v4;
}

- (BOOL)supportsEmoji
{
  return 1;
}

- (BOOL)isResizing
{
  return [(UIKBResizingKeyplaneCoordinator *)self->_resizingKeyplaneCoordinator isResizing];
}

- (BOOL)isResized
{
  [(UIKBResizingKeyplaneCoordinator *)self->_resizingKeyplaneCoordinator resizingOffset];
  if (v3 == 0.0) {
    return 0;
  }
  return [(UIKeyboardLayoutStar *)self keyplaneUsesResizingOffset];
}

- (BOOL)shouldAllowSelectionGestures:(BOOL)a3 atPoint:(CGPoint)a4 toBegin:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  BOOL v8 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UIKeyboardLayoutStar;
  if (-[UIKeyboardLayout shouldAllowSelectionGestures:atPoint:toBegin:](&v29, sel_shouldAllowSelectionGestures_atPoint_toBegin_)&& [(UIView *)self isUserInteractionEnabled])
  {
    if ([(UIKeyboardLayoutStar *)self isHandwritingPlane])
    {
      double v10 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Handwriting-Input"];
      BOOL v11 = [v10 objectAtIndex:0];

      double v12 = [(UIKeyboardLayoutStar *)self viewForKey:v11];
      if ((v8 || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
        && ([v12 numberOfStrokes] > (unint64_t)v5
         || ([v12 shouldAllowSelectionGestures:v8] & 1) == 0))
      {

LABEL_37:
        BOOL v25 = 0;
LABEL_38:

        return v25;
      }
    }
    uint64_t v13 = -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", x, y);
    BOOL v11 = v13;
    if (!v8)
    {
      if ([v13 interactionType] == 14
        || [v11 interactionType] == 11
        || [v11 interactionType] == 4
        || [v11 interactionType] == 10
        || [v11 interactionType] == 9
        || [v11 interactionType] == 5
        || [v11 interactionType] == 44)
      {
        goto LABEL_37;
      }
      goto LABEL_40;
    }
    uint64_t v14 = [(UIKeyboardLayoutStar *)self activeKey];
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      uint64_t v16 = [(UIKeyboardLayoutStar *)self activeKey];
      if ([v16 interactionType] == 1)
      {
LABEL_14:

        goto LABEL_15;
      }
      double v17 = [(UIKeyboardLayoutStar *)self activeKey];
      if ([v17 interactionType] == 2)
      {

        goto LABEL_14;
      }
      id v26 = [(UIKeyboardLayoutStar *)self activeKey];
      int v27 = [v26 interactionType];

      if (v27 == 16)
      {
LABEL_15:
        uint64_t v18 = [(UIKeyboardLayoutStar *)self activeKey];
        unint64_t v19 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v18];

        long long v20 = [(UIKeyboardLayoutStar *)self activeKey];
        if ([v20 state] == 16)
        {
          id v21 = [(UIKeyboardLayoutStar *)self activeKey];
          uint64_t v22 = [v21 selectedVariantIndex];
          long long v23 = [(UIKeyboardLayoutStar *)self activeKey];
          int64_t v24 = [(UIKeyboardLayoutStar *)self defaultSelectedVariantIndexForKey:v23 withActions:v19];

          if (v22 != v24) {
            goto LABEL_37;
          }
        }
        else
        {
        }
      }
    }
    if ([v11 interactionType] == 14
      || [v11 interactionType] == 11
      || [v11 interactionType] == 4
      || [v11 interactionType] == 5
      || [v11 interactionType] == 9
      || [v11 interactionType] == 44
      || [(UIKeyboardLayoutStar *)self hasActiveContinuousPathInput])
    {
      goto LABEL_37;
    }
LABEL_40:
    BOOL v25 = 1;
    goto LABEL_38;
  }
  return 0;
}

- (void)updateGlobeKeyDisplayString
{
  uint64_t v6 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"International-Key"];
  if ((unint64_t)[(id)UIKeyboardActiveUserSelectableInputModes count] < 2
    || ![(UIKeyboardLayoutStar *)self supportsEmoji])
  {
    int64_t v5 = [(UITextInputTraits *)self->super._inputTraits keyboardType];
    double v3 = (void *)v6;
    if (v5 != 122) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  double v3 = (void *)v6;
  if (v6)
  {
    BOOL v4 = [(UIKeyboardLayoutStar *)self globeKeyDisplaysAsEmojiKey];
    double v3 = (void *)v6;
    if (v4)
    {
LABEL_7:
      [v3 setOverrideDisplayString:@"emoji"];
      double v3 = (void *)v6;
    }
  }
LABEL_8:
}

- (BOOL)globeKeyDisplaysAsEmojiKey
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  double v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [v3 currentInputMode];
  int64_t v5 = [v4 normalizedIdentifier];
  char v6 = [v5 isEqualToString:@"emoji"];

  if ((v6 & 1) == 0)
  {
    BOOL v8 = [v3 normalizedEnabledInputModeIdentifiers];
    id v9 = [v3 activeUserSelectableInputModeIdentifiers];
    if ([v8 containsObject:@"emoji"])
    {
      if ([v9 count] == 2)
      {
        if (UIKeyboardHas10KeyChineseKeyboard())
        {
          double v10 = [v3 currentInputMode];
          BOOL v11 = [v10 identifier];
          double v12 = TIInputModeGetLanguage();
          char v7 = [v12 isEqualToString:@"zh"];

LABEL_26:
          goto LABEL_27;
        }
LABEL_8:
        char v7 = 1;
        goto LABEL_26;
      }
      if ([(UIKeyboardLayoutStar *)self showsDedicatedEmojiKeyAlongsideGlobeButton])
      {
        goto LABEL_8;
      }
      if ([v9 count] == 3
        && (([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) == 0x18
         || ([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) == 0x17))
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        obuint64_t j = [v3 activeUserSelectableInputModes];
        uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v25 = 0;
          uint64_t v15 = *(void *)v28;
LABEL_14:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(obj);
            }
            double v17 = *(void **)(*((void *)&v27 + 1) + 8 * v16);
            if (objc_msgSend(v17, "isExtensionInputMode", v25)) {
              break;
            }
            uint64_t v18 = [v17 normalizedIdentifier];
            char v19 = [v18 isEqualToString:@"emoji"];

            if ((v19 & 1) == 0)
            {
              long long v20 = [v17 normalizedIdentifier];
              char IsASCIICapable = UIKeyboardLayoutDefaultTypeForInputModeIsASCIICapable(v20);

              if (IsASCIICapable)
              {
                LODWORD(v25) = 1;
              }
              else
              {
                uint64_t v22 = [v17 normalizedIdentifier];
                int v23 = UIKeyboardLayoutSupportsASCIIToggleKey(v22);

                HIDWORD(v25) |= v23;
              }
            }
            if (v14 == ++v16)
            {
              uint64_t v14 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
              if (v14) {
                goto LABEL_14;
              }
              break;
            }
          }
        }
        else
        {
          uint64_t v25 = 0;
        }

        char v7 = v25 & BYTE4(v25);
        goto LABEL_26;
      }
    }
    char v7 = 0;
    goto LABEL_26;
  }
  char v7 = 0;
LABEL_27:

  return v7 & 1;
}

- (BOOL)showsDedicatedEmojiKeyAlongsideGlobeButton
{
  int64_t v3 = [(UITextInputTraits *)self->super._inputTraits keyboardType];
  if (v3 == 122) {
    unint64_t v4 = 2;
  }
  else {
    unint64_t v4 = 3;
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom]) {
    return 0;
  }
  if (!self->_externalDictationAndInternationalKeys) {
    return 0;
  }
  id v6 = (id)UIKeyboardActiveUserSelectableInputModes;
  unint64_t v7 = [v6 count];

  if (v7 < v4) {
    return 0;
  }
  id v8 = (id)UIKeyboardActiveUserSelectableInputModes;
  uint64_t v9 = [v8 indexOfObjectPassingTest:&__block_literal_global_650];

  return v9 != 0x7FFFFFFFFFFFFFFFLL || v3 == 122;
}

uint64_t __66__UIKeyboardLayoutStar_showsDedicatedEmojiKeyAlongsideGlobeButton__block_invoke()
{
  v0 = TIInputModeGetNormalizedIdentifier();
  uint64_t v1 = [v0 isEqualToString:@"emoji"];

  return v1;
}

- (BOOL)stretchKeyboardToFit
{
  return [(UIKeyboardLayoutStar *)self stretchKeyboardToFitKeyplane:self->_keyplane];
}

- (BOOL)stretchKeyboardToFitKeyplane:(id)a3
{
  id v4 = a3;
  [(UIKBTree *)self->_keyboard frame];
  double v6 = v5;
  [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
  if (v6 == v7
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    && [(UITextInputTraits *)self->super._inputTraits keyboardType] == 127
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 2
    || [v4 isSplit] && (objc_msgSend(v4, "isGenerated") & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    BOOL v8 = ![(UIKeyboardLayoutStar *)self _shouldAttemptToAddSupplementaryControlKeys];
  }

  return v8;
}

- (double)stretchFactorHeight
{
  [(UIKBTree *)self->_keyboard frame];
  double v4 = v3;
  double v5 = UIKeyboardGetCurrentInputMode();
  double v6 = UIKeyboardGetDerivedKeyboard(v5, self->super._screenTraits, [(UITextInputTraits *)self->super._inputTraits keyboardType]);

  if (v6)
  {
    [v6 keyboardSize];
    if (v7 != -1.0)
    {
      [v6 keyboardSize];
      double v4 = v8;
    }
  }
  [(UIKBTree *)self->_keyboard frame];
  if (v9 == 0.0)
  {
    [v6 keyboardSizeBasis];
    double v9 = v10;
  }
  double v11 = 1.0;
  if (v9 > 0.0 && vabdd_f64(v4, v9) > 0.00000011920929) {
    double v11 = v4 / v9;
  }

  return v11;
}

- (CGSize)stretchFactor
{
  double v3 = 1.0;
  if ([(UIKeyboardLayoutStar *)self stretchKeyboardToFit])
  {
    if (self->_keyboard)
    {
      double v4 = [(UIKeyboardLayout *)self sizeDelegate];
      int64_t v5 = [(UIKeyboardLayout *)self orientation];
      double v6 = +[UIKeyboardInputModeController sharedInputModeController];
      double v7 = [v6 currentInputMode];
      [v4 deviceSpecificPaddingForInterfaceOrientation:v5 inputMode:v7];
      double v9 = v8;
      double v11 = v10;

      [(UIKBScreenTraits *)self->super._screenTraits bounds];
      double v13 = v12;
      [(UIKBTree *)self->_keyboard frame];
      if (v14 > 0.0)
      {
        [(UIKBTree *)self->_keyboard frame];
        double v3 = (v13 - (v9 + v11)) / v15;
      }
    }
  }
  [(UIKeyboardLayoutStar *)self stretchFactorHeight];
  double v17 = v16;
  double v18 = v3;
  result.double height = v17;
  result.double width = v18;
  return result;
}

- (BOOL)shouldMergeAssistantBarWithKeyboardLayout
{
  if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 122
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] != 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v3 = [(UIKeyboardLayoutStar *)self hasCandidateKeys];
    if (v3)
    {
      double v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Handwriting-Input"];
      if (v4)
      {
        LOBYTE(v5) = 1;
LABEL_13:

        return v5;
      }
    }
    if (+[UIKeyboard isRemoteEmojiCollectionViewEnabled]&& [(UIKeyboardLayoutStar *)self isEmojiKeyplane]&& ![(UIKeyboardLayout *)self isFloating])
    {
      BOOL v5 = ![(UIKBScreenTraits *)self->super._screenTraits isSplit];
      if (!v3) {
        return v5;
      }
      goto LABEL_12;
    }
    LOBYTE(v5) = 0;
    if (v3)
    {
LABEL_12:
      double v4 = 0;
      goto LABEL_13;
    }
  }
  return v5;
}

- (BOOL)shouldAllowCurrentKeyplaneReload
{
  BOOL v3 = [(NSString *)self->_keyplaneName hasSuffix:@"split"];
  return v3 ^ [(UIKBScreenTraits *)self->super._screenTraits isSplit] ^ 1;
}

- (unint64_t)keyplaneShiftState
{
  BOOL v3 = [(UIKBTree *)self->_keyplane name];
  char v4 = [v3 containsString:@"Uncased"];

  if (v4) {
    return 4;
  }
  double v6 = +[UIKeyboardImpl activeInstance];
  char v7 = [v6 isAutoShifted];

  if (v7) {
    return 2;
  }
  double v8 = +[UIKeyboardImpl activeInstance];
  char v9 = [v8 isShiftLocked];

  if (v9) {
    return 3;
  }
  else {
    return self->_shift;
  }
}

- (BOOL)_allowStartingContinuousPathForTouchInfo:(id)a3 alreadyActiveKeyExisting:(BOOL)a4
{
  id v6 = a3;
  [v6 initialDragPoint];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = [v6 key];
  [v11 frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  if (([v11 allowsStartingContinuousPath] & 1) != 0
    || (BOOL v20 = 0, [v11 allowsDelayedTapForContinuousPathDisambiguation]) && !a4)
  {
    if ([v11 allowsDelayedTapForContinuousPathDisambiguation]) {
      [v6 setDelayed:1];
    }
    if ([v11 interactionType] != 15) {
      goto LABEL_8;
    }
    id v21 = [(UIKeyboardLayout *)self sizeDelegate];
    int64_t v22 = [(UIKeyboardLayout *)self orientation];
    int v23 = +[UIKeyboardInputModeController sharedInputModeController];
    int64_t v24 = [v23 currentInputMode];
    [v21 deviceSpecificPaddingForInterfaceOrientation:v22 inputMode:v24];
    double v26 = v25;

    if (v26 == 0.0)
    {
      v30.origin.double x = v13;
      v30.origin.double y = v15;
      v30.size.double width = v17;
      v30.size.double height = v19;
      CGFloat Width = CGRectGetWidth(v30);
      v31.origin.double x = v13;
      v31.origin.double y = v15;
      v31.size.double width = v17;
      v31.size.double height = v19;
      v32.size.double height = CGRectGetHeight(v31) * 0.7;
      v32.origin.double x = v13;
      v32.origin.double y = v15;
      v32.size.double width = Width;
      v29.double x = v8;
      v29.double y = v10;
      BOOL v20 = CGRectContainsPoint(v32, v29);
    }
    else
    {
LABEL_8:
      BOOL v20 = 1;
    }
  }

  return v20;
}

- (BOOL)shouldIgnoreContinuousPathRequirements
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 inputManagerState];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  BOOL v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 inputManagerState];
  BOOL v7 = [v6 performSelector:sel_ignoreContinuousPathRequirements] != 0;

  return v7;
}

- (BOOL)_allowContinuousPathUI
{
  BOOL v3 = ([(UIKeyboardLayoutStar *)self isAlphabeticPlane]
     || [(UIKeyboardLayoutStar *)self supportsContinuousPath])
    && ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
     && [(UIKeyboardLayout *)self isFloating]
     || ![(UIKBScreenTraits *)self->super._screenTraits idiom]
     || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 4);
  char v4 = +[UIKeyboardImpl activeInstance];
  if ([v4 usesContinuousPath])
  {
    char v5 = v3 & ~[(UITextInputTraits *)self->super._inputTraits isSecureTextEntry];

    if (v5)
    {
      BOOL v6 = 1;
      goto LABEL_16;
    }
  }
  else
  {
  }
  if ([(UIKeyboardLayoutStar *)self shouldIgnoreContinuousPathRequirements]) {
    BOOL v6 = [(UIKeyboardLayoutStar *)self isAlphabeticPlane];
  }
  else {
    BOOL v6 = 0;
  }
LABEL_16:
  BOOL v7 = +[UIKeyboardImpl activeInstance];
  [v7 setLayoutAllowsContinuousPath:v6];

  return v6;
}

- (BOOL)_allowPaddle
{
  BOOL v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v4 = [v3 preferencesActions];
  BOOL v5 = ([v4 BOOLForPreferenceKey:*MEMORY[0x1E4FAE780]] & 1) != 0
    || [(UITextInputTraits *)self->super._inputTraits isSecureTextEntry];

  return v5;
}

- (void)reloadCurrentKeyplane
{
  id v3 = (id)[(NSString *)self->_keyplaneName copy];
  if (![(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
    [(UIKeyboardLayoutStar *)self setKeyplaneName:0];
  }
  [(UIKeyboardLayoutStar *)self setKeyplaneName:v3];
}

- (BOOL)useCrescendoLayout
{
  return self->_layoutSupportsCrescendo;
}

- (void)createLayoutFromName:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  char v4 = (NSString *)a3;
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    keyplaneView = self->_keyplaneView;
    if (keyplaneView)
    {
      [(UIKBKeyplaneView *)keyplaneView removeFromSuperview];
      BOOL v6 = self->_keyplaneView;
      self->_keyplaneView = 0;
    }
    backgroundView = self->_backgroundView;
    if (backgroundView)
    {
      [(UIView *)backgroundView removeFromSuperview];
      CGFloat v8 = self->_backgroundView;
      self->_backgroundView = 0;
    }
    double v9 = +[UIKeyboardImpl activeInstance];
    BOOL v10 = [(UIKeyboardLayoutStar *)self _allowPaddle];
    +[_UIKeyboardUsageTracking showCharacterPreviewPreference:v10];
    if (self->_lastInputIsGestureKey)
    {
      +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount];
      self->_lastInputIsGestureKedouble y = 0;
    }
    self->_dictationUsingServerManualEndpointing = 0;
    p_keyplane = &self->_keyplane;
    BOOL v12 = [(UIKBTree *)self->_keyplane isFloating];
    if (v12 == [(UIKeyboardLayout *)self isFloating])
    {
      keyplaneName = self->_keyplaneName;
      if (keyplaneName == v4
        || v4
        && keyplaneName
        && [(NSString *)keyplaneName caseInsensitiveCompare:v4] == NSOrderedSame)
      {
        inputTraits = self->super._inputTraits;
        CGFloat v15 = [v9 textInputTraits];
        if ([(UITextInputTraits *)inputTraits publicTraitsMatchTraits:v15]
          && [(UIKeyboardLayoutStar *)self canReuseKeyplaneView]
          && [(UIKeyboardLayoutStar *)self shouldAllowCurrentKeyplaneReload])
        {
          [(UIView *)self bounds];
          double v17 = v16;
          double v19 = v18;
          [(TUIKeyplaneView *)self->_liveKeyplaneView bounds];
          double v21 = v20;
          double v23 = v22;

          if (v17 == v21 && v19 == v23)
          {
            objc_msgSend(v9, "setShouldSkipCandidateSelection:", -[UIKBTree shouldSkipCandidateSelection](*p_keyplane, "shouldSkipCandidateSelection"));
            [v9 updateReturnKey:0];
            [(UIKeyboardLayoutStar *)self updateKeyCentroids];
            int64_t v24 = [(TUIKeyplaneView *)self->_liveKeyplaneView factory];
            [v24 setAllowsPaddles:v10];

            unint64_t v25 = [(UIKeyboardLayoutStar *)self keyplaneShiftState];
            double v26 = [(TUIKeyplaneView *)self->_liveKeyplaneView factory];
            [v26 renderingContext];
            long long v28 = v27 = v9;
            [v28 setShiftState:v25];

            CGPoint v29 = UIKeyboardGetCurrentInputMode();
            uint64_t v30 = UIKeyboardUIPreferStringOverImageForInputMode(v29);
            CGRect v31 = [(TUIKeyplaneView *)self->_liveKeyplaneView factory];
            [v31 setPreferStringKeycapOverImage:v30];

            double v9 = v27;
            [(TUIKeyplaneView *)self->_liveKeyplaneView prepareForDisplay];
            CGRect v32 = [(UIView *)self superview];

            if (v32)
            {
              [(UIView *)self bounds];
              uint64_t v35 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v33, v34);
              [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v35];
            }
            goto LABEL_63;
          }
        }
        else
        {
        }
      }
    }
    BOOL v147 = v10;
    self->_externalDictationAndInternationalKeys = [(UIKeyboardLayoutStar *)self showsGlobeAndDictationKeysInDockView];
    BOOL v38 = [(UIKeyboardLayoutStar *)self isShiftKeyPlaneChooser];
    self->_inputTraitsPreventInitialReuse = 0;
    [(UIKeyboardLayoutStar *)self deactivateActiveKeysClearingTouchInfo:0 clearingDimming:1];
    CGRect v39 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:v4];
    int v40 = [(UIKBTree *)self->_keyboard subtreeWithName:v39];
    uint64_t v41 = v40;
    if (!v40)
    {
      long long v60 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
      [v60 setDisabled:0];

      [(TUIKeyplaneView *)self->_liveKeyplaneView removeFromSuperview];
      liveKeyplaneView = self->_liveKeyplaneView;
      self->_liveKeyplaneView = 0;

      long long v62 = self->_keyplaneName;
      self->_keyplaneName = 0;

      long long v63 = *p_keyplane;
      *p_keyplane = 0;

LABEL_62:
LABEL_63:

      goto LABEL_64;
    }
    BOOL v144 = v38;
    v145 = v39;
    v146 = v9;
    uint64_t v42 = [v40 gestureKeyplaneName];

    v148 = v4;
    v149 = v41;
    if (!v42)
    {
LABEL_41:
      long long v64 = [(UIKBTree *)*p_keyplane firstCachedKeyWithName:@"Shift-Key"];
      [v64 behavesAsShiftKey];

      keyboard = self->_keyboard;
      long long v66 = [(UIKBTree *)*p_keyplane shiftAlternateKeyplaneName];
      [(UIKBTree *)keyboard subtreeWithName:v66];

      v67 = [v41 firstCachedKeyWithName:@"Shift-Key"];
      [v67 behavesAsShiftKey];

      v68 = (NSString *)[(NSString *)v4 copy];
      uint64_t v69 = self->_keyplaneName;
      self->_keyplaneName = v68;

      objc_storeStrong((id *)p_keyplane, v41);
      objc_msgSend(v41, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      [v41 cacheNativeIdiomIfNecessaryForScreenTraits:self->super._screenTraits];
      v70 = [(UIKBTree *)self->_keyboard layoutName];
      [v41 precacheLayoutName:v70];

      [(UIKBTree *)*p_keyplane applyDynamicAttributes];
      [(UIKBTree *)*p_keyplane updateKeysForType:[(UITextInputTraits *)self->super._inputTraits keyboardType]];
      v143 = [(UIKBTree *)*p_keyplane firstCachedKeyWithName:@"Dictation-Key"];
      objc_msgSend(v143, "setVisible:", -[UIKeyboardLayoutStar shouldMergeKey:](self, "shouldMergeKey:", v143) ^ 1);
      long long v71 = [(UIKBTree *)*p_keyplane firstCachedKeyWithName:@"International-Key"];
      BOOL v72 = ![(UIKeyboardLayoutStar *)self shouldMergeKey:v71]
         && +[UIKeyboardImpl canShowInternationalKey];
      v142 = v71;
      [v71 setVisible:v72];
      [(UIKeyboardLayoutStar *)self setKeyboardAppearance:self->_appearance];
      long long v73 = [(UIKeyboardLayoutStar *)self cacheTokenForKeyplane:*p_keyplane caseAlternates:0];
      [v73 setTransformationIdentifiers:self->_keyplaneTransformations];
      v141 = [(UIKeyboardLayoutStar *)self defaultKeyplaneForKeyplane:*p_keyplane];
      v140 = -[UIKeyboardLayoutStar cacheTokenForKeyplane:caseAlternates:](self, "cacheTokenForKeyplane:caseAlternates:");
      long long v74 = [(UIKeyboardLayoutStar *)self renderConfig];
      long long v75 = +[UIKBRenderingContext renderingContextForRenderConfig:v74];

      objc_msgSend(v75, "setShiftState:", -[UIKeyboardLayoutStar keyplaneShiftState](self, "keyplaneShiftState"));
      objc_msgSend(v75, "setKeyboardType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"));
      objc_msgSend(v75, "setHandBias:", -[UIKeyboardLayoutStar currentHandBias](self, "currentHandBias"));
      if ([(UIKeyboardLayoutStar *)self _shouldSwapGlobeAndMore])
      {
        long long v76 = [(UIKBTree *)*p_keyplane subtreeWithType:3];
        v158[0] = @"More-Key";
        v158[1] = @"International-Key";
        long long v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:2];
        [v76 swapToggleKeys:v77];
      }
      if ([(UIKeyboardLayout *)self isFloating]) {
        [v75 setIsFloating:1];
      }
      uint64_t v78 = [(UIKBScreenTraits *)self->super._screenTraits idiom];
      if (v78 == 3) {
        uint64_t v78 = [v73 annotateWithBool:UIKeyboardCarPlayIsRightHandDrive()];
      }
      long long v79 = (void *)MEMORY[0x18C108260](v78);
      [(UIKeyboardLayoutStar *)self updateLocalizedKeys:0];
      uint64_t v80 = [(UIKeyboardLayoutStar *)self delegate];
      if (v80)
      {
        long long v81 = (void *)v80;
        long long v82 = [(UIKeyboardLayoutStar *)self delegate];
        char v83 = objc_opt_respondsToSelector();

        if (v83)
        {
          long long v84 = [(UIKeyboardLayoutStar *)self delegate];
          [v84 keyboardLayout:self didSwitchToKeyplane:*p_keyplane];
        }
      }
      long long v85 = self->_liveKeyplaneView;
      if (!v85)
      {
        id v86 = objc_alloc((Class)getTUIKeyplaneViewClass());
        [(UIView *)self bounds];
        long long v87 = objc_msgSend(v86, "initWithFrame:keyplane:", *p_keyplane);
        [v87 setTranslatesAutoresizingMaskIntoConstraints:0];
        long long v88 = self->_liveKeyplaneView;
        self->_liveKeyplaneView = (TUIKeyplaneView *)v87;
        id v89 = v87;

        liveKeyplaneConstraints = self->_liveKeyplaneConstraints;
        self->_liveKeyplaneConstraints = 0;

        long long v85 = self->_liveKeyplaneView;
      }
      long long v91 = [(TUIKeyplaneView *)v85 superview];

      unint64_t v92 = 0x1E4F5B000uLL;
      v139 = v75;
      if (v91 != self)
      {
        [(UIView *)self insertSubview:self->_liveKeyplaneView atIndex:0];
        v127 = (void *)MEMORY[0x1E4F5B268];
        v137 = [(TUIKeyplaneView *)self->_liveKeyplaneView topAnchor];
        v135 = [(UIView *)self topAnchor];
        v133 = [v137 constraintEqualToAnchor:v135];
        v157[0] = v133;
        v131 = [(TUIKeyplaneView *)self->_liveKeyplaneView leadingAnchor];
        v129 = [(UIView *)self leadingAnchor];
        long long v93 = [v131 constraintEqualToAnchor:v129];
        v157[1] = v93;
        long long v94 = [(UIView *)self bottomAnchor];
        v95 = [(TUIKeyplaneView *)self->_liveKeyplaneView bottomAnchor];
        v96 = [v94 constraintEqualToAnchor:v95];
        v157[2] = v96;
        v97 = [(UIView *)self trailingAnchor];
        v98 = [(TUIKeyplaneView *)self->_liveKeyplaneView trailingAnchor];
        v99 = [v97 constraintEqualToAnchor:v98];
        v157[3] = v99;
        v100 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:4];
        [v127 activateConstraints:v100];

        unint64_t v92 = 0x1E4F5B000;
        uint64_t v41 = v149;

        char v4 = v148;
        long long v75 = v139;
      }
      if (!self->_liveKeyplaneConstraints)
      {
        v136 = [(UIView *)self topAnchor];
        v138 = [(UIView *)self superview];
        v134 = [v138 topAnchor];
        v132 = [v136 constraintEqualToAnchor:v134];
        v156[0] = v132;
        v128 = [(UIView *)self leadingAnchor];
        v130 = [(UIView *)self superview];
        v126 = [v130 leadingAnchor];
        v125 = [v128 constraintEqualToAnchor:v126];
        v156[1] = v125;
        v124 = [(UIView *)self superview];
        v101 = [v124 bottomAnchor];
        uint64_t v102 = [(UIView *)self bottomAnchor];
        v103 = [v101 constraintEqualToAnchor:v102];
        v156[2] = v103;
        v104 = [(UIView *)self superview];
        v105 = [v104 trailingAnchor];
        v106 = [(UIView *)self trailingAnchor];
        v107 = [v105 constraintEqualToAnchor:v106];
        v156[3] = v107;
        v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:v156 count:4];
        v109 = self->_liveKeyplaneConstraints;
        self->_liveKeyplaneConstraints = v108;

        uint64_t v41 = v149;
        unint64_t v92 = 0x1E4F5B000uLL;

        char v4 = v148;
        long long v75 = v139;
      }
      [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
      [*(id *)(v92 + 616) activateConstraints:self->_liveKeyplaneConstraints];
      [(TUIKeyplaneView *)self->_liveKeyplaneView setRenderingContext:v75];
      v110 = self->_liveKeyplaneView;
      v111 = [(UIKeyboardLayoutStar *)self renderConfig];
      [(TUIKeyplaneView *)v110 setRenderConfig:v111];

      [(TUIKeyplaneView *)self->_liveKeyplaneView setOverrideScreenTraits:self->super._screenTraits];
      v112 = [(UIKBScreenTraits *)self->super._screenTraits screen];
      [v112 scale];
      double v114 = v113;
      v115 = [(TUIKeyplaneView *)self->_liveKeyplaneView factory];
      [v115 setScale:v114];

      v116 = [(TUIKeyplaneView *)self->_liveKeyplaneView factory];
      [v116 setAllowsPaddles:v147];

      v117 = UIKeyboardGetCurrentInputMode();
      uint64_t v118 = UIKeyboardUIPreferStringOverImageForInputMode(v117);
      v119 = [(TUIKeyplaneView *)self->_liveKeyplaneView factory];
      [v119 setPreferStringKeycapOverImage:v118];

      [(TUIKeyplaneView *)self->_liveKeyplaneView setKeyplane:self->_keyplane];
      [(TUIKeyplaneView *)self->_liveKeyplaneView setNeedsDisplay];
      [(UIKeyboardLayoutStar *)self updateKeyboardForKeyplane:v41];
      [(TUIKeyplaneView *)self->_liveKeyplaneView bounds];
      v122 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v120, v121);
      objc_msgSend(v122, "setSplitWidthsChanged:", -[TUIKeyplaneView isSplit](self->_liveKeyplaneView, "isSplit"));
      [v122 setUpdateAssistantView:1];
      [v122 setIsDynamicLayout:1];
      [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v122];
      [(UIKeyboardLayoutStar *)self _setBiasEscapeButtonVisible:0];
      [(UIKeyboardLayoutStar *)self updateAllKeyStates];
      [(UIKeyboardLayoutStar *)self updateLayoutTags];
      [(UIKeyboardLayoutStar *)self updateCachedKeyplaneKeycaps];
      [(UIKeyboardLayoutStar *)self updateGlobeKeyDisplayString];
      v123 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
      [v123 reset];

      double v9 = v146;
      if (v144 != [(UIKeyboardLayoutStar *)self isShiftKeyPlaneChooser]) {
        [v146 clearShiftState];
      }

      CGRect v39 = v145;
      goto LABEL_62;
    }
    id v43 = self->_keyboard;
    long long v44 = [v41 gestureKeyplaneName];
    long long v45 = [(UIKBTree *)v43 subtreeWithName:v44];

    [(UIKeyboardLayoutStar *)self setCurrencyKeysForCurrentLocaleOnKeyplane:v45];
    [(UIKeyboardLayoutStar *)self setPercentSignKeysForCurrentLocaleOnKeyplane:v45];
    long long v46 = [(UIKeyboardLayoutStar *)self layoutTag];
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    v150 = v45;
    uint64_t v47 = [v45 cachedKeysByKeyName:@"Adaptive-Key"];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v152 objects:v159 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v153;
      do
      {
        for (uint64_t i = 0; i != v49; ++i)
        {
          if (*(void *)v153 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void **)(*((void *)&v152 + 1) + 8 * i);
          v151[0] = MEMORY[0x1E4F143A8];
          v151[1] = 3221225472;
          v151[2] = __45__UIKeyboardLayoutStar_createLayoutFromName___block_invoke;
          v151[3] = &unk_1E52FA4C0;
          v151[4] = self;
          [v52 setLayoutTag:v46 passingKeyTest:v151];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v152 objects:v159 count:16];
      }
      while (v49);
    }

    [(UIKeyboardLayoutStar *)self updateAutolocalizedKeysForKeyplane:v150];
    uint64_t v53 = [v150 subtrees];
    uint64_t v54 = [v53 firstObject];

    long long v55 = [v41 subtrees];
    uint64_t v56 = [v55 firstObject];

    [v56 setCachedGestureLayout:v54];
    if ([v41 intForProperty:@"shift-rendering"] != 31)
    {
      uint64_t v57 = [v41 subtrees];
      if ((unint64_t)[v57 count] <= 1)
      {
      }
      else
      {
        long long v58 = [v41 subtrees];
        long long v59 = [v58 objectAtIndexedSubscript:1];

        if (v59)
        {
          [v59 setCachedGestureLayout:v54];
          uint64_t v56 = v59;
          goto LABEL_40;
        }
      }
      uint64_t v56 = 0;
    }
LABEL_40:
    p_keyplane = &self->_keyplane;
    char v4 = v148;

    goto LABEL_41;
  }
  uint64_t v36 = self->_liveKeyplaneView;
  if (v36)
  {
    [(TUIKeyplaneView *)v36 removeFromSuperview];
    uint64_t v37 = self->_liveKeyplaneView;
    self->_liveKeyplaneView = 0;
  }
  self->_layoutSupportsCrescendo = 0;
LABEL_64:
}

uint64_t __45__UIKeyboardLayoutStar_createLayoutFromName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldMergeKey:a2] ^ 1;
}

- (void)setKeyplaneName:(id)a3
{
  uint64_t v295 = *MEMORY[0x1E4F143B8];
  char v4 = (NSString *)a3;
  if (!self->_isTrackpadMode)
  {
    if (!self->_isContinuousPathUnderway) {
      [(UIKeyboardLayoutStar *)self transitionToPunctuationKeysVisible:0];
    }
    if ([(UIKBTree *)self->_keyboard dynamicLayout])
    {
      BOOL v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
      BOOL v6 = [v5 preferencesActions];
      int v7 = [v6 crescendoEnabled];

      if (v7)
      {
        self->_layoutSupportsCrescendo = 1;
        [(UIKeyboardLayoutStar *)self createLayoutFromName:v4];
        goto LABEL_209;
      }
    }
    self->_layoutSupportsCrescendo = 0;
    if (self->_liveKeyplaneView)
    {
      [(UIKeyboardLayoutStar *)self flushKeyCache:0];
      [(TUIKeyplaneView *)self->_liveKeyplaneView removeFromSuperview];
      liveKeyplaneView = self->_liveKeyplaneView;
      self->_liveKeyplaneView = 0;

      [MEMORY[0x1E4F5B268] deactivateConstraints:self->_liveKeyplaneConstraints];
      [(UIView *)self setTranslatesAutoresizingMaskIntoConstraints:1];
    }
    v257 = +[UIKeyboardImpl activeInstance];
    BOOL v252 = [(UIKeyboardLayoutStar *)self _allowPaddle];
    +[_UIKeyboardUsageTracking showCharacterPreviewPreference:](_UIKeyboardUsageTracking, "showCharacterPreviewPreference:");
    if (self->_lastInputIsGestureKey)
    {
      +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount];
      self->_lastInputIsGestureKedouble y = 0;
    }
    self->_dictationUsingServerManualEndpointing = 0;
    p_keyplane = &self->_keyplane;
    BOOL v10 = [(UIKBTree *)self->_keyplane isFloating];
    if (v10 == [(UIKeyboardLayout *)self isFloating])
    {
      keyplaneName = self->_keyplaneName;
      if (keyplaneName == v4
        || v4
        && keyplaneName
        && [(NSString *)keyplaneName caseInsensitiveCompare:v4] == NSOrderedSame)
      {
        inputTraits = self->super._inputTraits;
        CGFloat v13 = [v257 textInputTraits];
        if ([(UITextInputTraits *)inputTraits publicTraitsMatchTraits:v13]
          && [(UIKeyboardLayoutStar *)self canReuseKeyplaneView]
          && [(UIKeyboardLayoutStar *)self shouldAllowCurrentKeyplaneReload])
        {
          [(UIView *)self bounds];
          double v15 = v14;
          double v17 = v16;
          [(UIView *)self->_keyplaneView bounds];
          double v19 = v18;
          double v21 = v20;

          if (v15 == v19 && v17 == v21)
          {
            objc_msgSend(v257, "setShouldSkipCandidateSelection:", -[UIKBTree shouldSkipCandidateSelection](*p_keyplane, "shouldSkipCandidateSelection"));
            [v257 updateReturnKey:0];
            [(UIKeyboardLayoutStar *)self updateKeyCentroids];
            double v22 = [(UIKBKeyplaneView *)self->_keyplaneView factory];
            [v22 setAllowsPaddles:v252];

            unint64_t v23 = [(UIKeyboardLayoutStar *)self keyplaneShiftState];
            int64_t v24 = [(UIKBKeyplaneView *)self->_keyplaneView factory];
            unint64_t v25 = [v24 renderingContext];
            [v25 setShiftState:v23];

            double v26 = UIKeyboardGetCurrentInputMode();
            uint64_t v27 = UIKeyboardUIPreferStringOverImageForInputMode(v26);
            long long v28 = [(UIKBKeyplaneView *)self->_keyplaneView factory];
            [v28 setPreferStringKeycapOverImage:v27];

            CGPoint v29 = [(UIView *)self superview];

            if (v29)
            {
              [(UIView *)self bounds];
              CGRect v32 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v30, v31);
              [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v32];
            }
            [(UIKeyboardLayout *)self updateTouchProcessingForKeyplaneChange];
            double v33 = v257;
            goto LABEL_208;
          }
        }
        else
        {
        }
      }
    }
    [(UIKBResizingKeyplaneCoordinator *)self->_resizingKeyplaneCoordinator stopResizing];
    self->_externalDictationAndInternationalKeys = [(UIKeyboardLayoutStar *)self showsGlobeAndDictationKeysInDockView];
    v250 = [(UIKeyboardLayoutStar *)self candidateList];

    BOOL v251 = [(UIKeyboardLayoutStar *)self isShiftKeyPlaneChooser];
    BOOL v253 = [(NSString *)self->_keyplaneName hasSuffix:@"split"];
    HIDWORD(v245) = [(UIKBScreenTraits *)self->super._screenTraits isSplit];
    self->_inputTraitsPreventInitialReuse = 0;
    double v34 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
    [v34 setDisabled:1];

    [(UIKeyboardLayoutStar *)self deactivateActiveKeysClearingTouchInfo:0 clearingDimming:1];
    p_keyplaneView = &self->_keyplaneView;
    [(UIKBKeyplaneView *)self->_keyplaneView purgeKeyViews];
    long long v288 = 0u;
    long long v289 = 0u;
    long long v286 = 0u;
    long long v287 = 0u;
    uint64_t v35 = [(UIKBTree *)*p_keyplane keys];
    uint64_t v36 = [v35 countByEnumeratingWithState:&v286 objects:v294 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v287;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v287 != v38) {
            objc_enumerationMutation(v35);
          }
          int v40 = *(void **)(*((void *)&v286 + 1) + 8 * i);
          [v40 setGestureKey:0];
          if ([v40 displayTypeHint] == 10
            && [v40 displayType] != 7)
          {
            [v40 setSecondaryDisplayStrings:0];
            [v40 setSecondaryRepresentedStrings:0];
          }
          if ([v40 displayType] == 21) {
            [v40 setVisible:1];
          }
        }
        uint64_t v37 = [v35 countByEnumeratingWithState:&v286 objects:v294 count:16];
      }
      while (v37);
    }

    v254 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:v4];
    uint64_t v41 = -[UIKBTree subtreeWithName:](self->_keyboard, "subtreeWithName:");
    uint64_t v42 = [v41 gestureKeyplaneName];

    v263 = self;
    v260 = &self->_keyplane;
    if (v42)
    {
      v258 = v4;
      keyboard = self->_keyboard;
      long long v44 = v41;
      long long v45 = [v41 gestureKeyplaneName];
      long long v46 = [(UIKBTree *)keyboard subtreeWithName:v45];

      [(UIKeyboardLayoutStar *)self setCurrencyKeysForCurrentLocaleOnKeyplane:v46];
      [(UIKeyboardLayoutStar *)self setPercentSignKeysForCurrentLocaleOnKeyplane:v46];
      uint64_t v47 = [(UIKeyboardLayoutStar *)self layoutTag];
      long long v282 = 0u;
      long long v283 = 0u;
      long long v284 = 0u;
      long long v285 = 0u;
      uint64_t v48 = [v46 cachedKeysByKeyName:@"Adaptive-Key"];
      uint64_t v49 = [v48 countByEnumeratingWithState:&v282 objects:v293 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v283;
        do
        {
          for (uint64_t j = 0; j != v50; ++j)
          {
            if (*(void *)v283 != v51) {
              objc_enumerationMutation(v48);
            }
            uint64_t v53 = *(void **)(*((void *)&v282 + 1) + 8 * j);
            v281[0] = MEMORY[0x1E4F143A8];
            v281[1] = 3221225472;
            v281[2] = __40__UIKeyboardLayoutStar_setKeyplaneName___block_invoke;
            v281[3] = &unk_1E52FA4C0;
            v281[4] = self;
            [v53 setLayoutTag:v47 passingKeyTest:v281];
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v282 objects:v293 count:16];
        }
        while (v50);
      }

      [(UIKeyboardLayoutStar *)self updateAutolocalizedKeysForKeyplane:v46];
      uint64_t v54 = [v46 subtrees];
      long long v55 = [v54 firstObject];

      uint64_t v41 = v44;
      uint64_t v56 = [v44 subtrees];
      uint64_t v57 = [v56 firstObject];

      [v57 setCachedGestureLayout:v55];
      if ([v44 intForProperty:@"shift-rendering"] != 31)
      {
        long long v58 = [v44 subtrees];
        if ((unint64_t)[v58 count] <= 1)
        {

          uint64_t v57 = 0;
        }
        else
        {
          long long v59 = [v44 subtrees];
          id v60 = [v59 objectAtIndexedSubscript:1];

          if (v60)
          {
            [v60 setCachedGestureLayout:v55];
            uint64_t v57 = v60;
          }
          else
          {
            uint64_t v57 = 0;
          }
          char v4 = v258;
          self = v263;
        }
      }

      p_keyplane = v260;
    }
    long long v61 = [(UIKBTree *)*p_keyplane firstCachedKeyWithName:@"Shift-Key"];
    unsigned int v62 = [v61 behavesAsShiftKey];

    long long v63 = self->_keyboard;
    long long v64 = [(UIKBTree *)*p_keyplane shiftAlternateKeyplaneName];
    long long v65 = [(UIKBTree *)v63 subtreeWithName:v64];

    long long v66 = [v41 firstCachedKeyWithName:@"Shift-Key"];
    LODWORD(v64) = [v66 behavesAsShiftKey];

    if (v64)
    {
      if (v65 == v41) {
        unsigned int v67 = v62;
      }
      else {
        unsigned int v67 = 0;
      }
    }
    else
    {
      unsigned int v67 = 0;
    }
    [(UIKBTree *)*p_keyplane clearManualAddedKey];
    self->_splitTransitionNeedsRebuild = 0;
    if (!v4
      || ![(UIKBScreenTraits *)self->super._screenTraits supportsSplit]
      || [(UIKBTree *)self->_keyboard visualStyle] - 101 > 8)
    {
LABEL_73:
      if (!v41)
      {
        long long v91 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
        [v91 setDisabled:0];

        [(UIKBKeyplaneView *)*p_keyplaneView removeFromSuperview];
        unint64_t v92 = *p_keyplaneView;
        *p_keyplaneView = 0;

        long long v93 = self->_keyplaneName;
        self->_keyplaneName = 0;

        long long v94 = *p_keyplane;
        *p_keyplane = 0;

        [(UIView *)self->_backgroundView removeFromSuperview];
        backgroundView = self->_backgroundView;
        self->_backgroundView = 0;

        [(UIKeyboardLayout *)self updateTouchProcessingForKeyplaneChange];
        double v33 = v257;
LABEL_207:

LABEL_208:
        goto LABEL_209;
      }
      [(UIKBTree *)*p_keyplane frameForKeylayoutName:"frameForKeylayoutName:"];
      double v85 = v84;
      [(UIKBTree *)*p_keyplane frameForKeylayoutName:"frameForKeylayoutName:"];
      double v87 = v86;
      [(UIKBTree *)*p_keyplane clearManualAddedKey];
      long long v88 = (NSString *)[(NSString *)v4 copy];
      id v89 = self->_keyplaneName;
      self->_keyplaneName = v88;

      objc_storeStrong((id *)p_keyplane, v41);
      objc_msgSend(v41, "setVisualStyle:", -[UIKBTree visualStyle](self->_keyboard, "visualStyle"));
      [v41 cacheNativeIdiomIfNecessaryForScreenTraits:self->super._screenTraits];
      long long v90 = [(UIKBTree *)self->_keyboard layoutName];
      [v41 precacheLayoutName:v90];

      unsigned int v249 = v67;
      if ([(UIKeyboardLayoutStar *)self canReuseKeyplaneView]) {
        LODWORD(v245) = [(UIKBKeyplaneView *)*p_keyplaneView validForKeyplane:*p_keyplane withVisualStyle:[(UIKBTree *)self->_keyboard visualStyle]];
      }
      else {
        LODWORD(v245) = 0;
      }
      v256 = v41;
      [(UIKeyboardLayoutStar *)self rollbackKeyplaneTransformations];
      if ([(UIKBScreenTraits *)self->super._screenTraits isInPopover]) {
        BOOL v96 = [(UIKBScreenTraits *)self->super._screenTraits idiom] == 0;
      }
      else {
        BOOL v96 = 0;
      }
      v259 = v4;
      if ([(UIKeyboardLayout *)self isFloating]) {
        goto LABEL_82;
      }
      if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3)
      {
        if (!v96)
        {
LABEL_102:
          [(UIKBScreenTraits *)self->super._screenTraits bounds];
          double v136 = v135;
          int64_t v137 = [(UIKeyboardLayout *)self orientation];
          v138 = +[UIKeyboardInputModeController sharedInputModeController];
          v139 = [v138 currentInputMode];
          +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:v137 inputMode:v139];
          double v141 = v140;
          double v143 = v142;

          double v144 = v136 - (v141 + v143);
          if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3)
          {
            v145 = [(UIView *)self window];
            if (v145)
            {
              id v146 = v145;
            }
            else
            {
              BOOL v147 = +[UIKeyboard activeKeyboard];
              id v146 = [v147 window];

              if (!v146) {
                goto LABEL_108;
              }
            }
            v148 = [v146 safeAreaLayoutGuide];
            [v148 layoutFrame];
            double v144 = v149;
          }
LABEL_108:
          v150 = (double *)MEMORY[0x1E4F1DAD8];
          if ([(UIKeyboardLayoutStar *)self currentHandBias])
          {
            BOOL v151 = [(UIKBTree *)*p_keyplane containsKeyThatIgnoresHandBias];
            [(UIKeyboardLayoutStar *)self biasedKeyboardWidthRatio];
            double v153 = v144 * v152;
            if ([(UIKeyboardLayoutStar *)self currentHandBias] == 1) {
              double v154 = v144 - v153;
            }
            else {
              double v154 = 0.0;
            }
            if (!v151) {
              double v144 = v153;
            }
          }
          else
          {
            BOOL v151 = 0;
            double v154 = *v150;
            double v153 = 0.0;
          }
          [(UIKBTree *)self->_keyboard frame];
          double v156 = v144 / v155;
          [(UIKBTree *)self->_keyboard frame];
          double v158 = v157;
          if ([(UIKeyboardLayout *)self hasPreferredHeight])
          {
            double v159 = v156 * v158;
            [(UIKeyboardLayout *)self preferredHeight];
            if (v159 - v160 > 5.0)
            {
              [(UIKeyboardLayout *)self preferredHeight];
              double v156 = v156 * (v161 / v159);
            }
          }
          if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3)
          {
            double v162 = 1.0;
            if (v156 >= 1.0)
            {
              double v163 = 1.0;
              if (![(UIKBScreenTraits *)self->super._screenTraits knobInput]) {
                goto LABEL_127;
              }
            }
            double v163 = 1.0;
          }
          else
          {
            if (![(UIKeyboardLayoutStar *)self stretchKeyboardToFit])
            {
              double v162 = v156;
              double v163 = v156;
              goto LABEL_127;
            }
            [(UIKeyboardLayoutStar *)self stretchFactorHeight];
            double v163 = v164;
          }
          double v162 = v156;
LABEL_127:
          double v165 = v150[1];
          v166 = *p_keyplane;
          v167 = [(UIKBScreenTraits *)self->super._screenTraits screen];
          [v167 scale];
          if (v151)
          {
            -[UIKBTree elaborateLayoutWithSize:scale:](v166, "elaborateLayoutWithSize:scale:", v162, v163, v168);

            [(UIKBTree *)self->_keyboard frame];
            v169 = *p_keyplane;
            double v171 = v153 / v170;
            v98 = [(UIKBScreenTraits *)self->super._screenTraits screen];
            [v98 scale];
            -[UIKBTree elaborateLayoutWithSize:scale:origin:](v169, "elaborateLayoutWithSize:scale:origin:", v171, v163, v172, v154, v165);
            goto LABEL_129;
          }
          -[UIKBTree elaborateLayoutWithSize:scale:origin:](v166, "elaborateLayoutWithSize:scale:origin:", v162, v163, v168, v154, v165);

LABEL_131:
          [(UIKeyboardLayoutStar *)self _setBiasEscapeButtonVisible:[(UIKeyboardLayoutStar *)self currentHandBias] != 0];
          long long v279 = 0u;
          long long v280 = 0u;
          long long v277 = 0u;
          long long v278 = 0u;
          obuint64_t j = [(UIKBTree *)*p_keyplane subtrees];
          uint64_t v264 = [obj countByEnumeratingWithState:&v277 objects:v292 count:16];
          if (v264)
          {
            uint64_t v262 = *(void *)v278;
            do
            {
              uint64_t v173 = 0;
              do
              {
                if (*(void *)v278 != v262) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v265 = v173;
                v174 = *(void **)(*((void *)&v277 + 1) + 8 * v173);
                long long v273 = 0u;
                long long v274 = 0u;
                long long v275 = 0u;
                long long v276 = 0u;
                v175 = [v174 keySet];
                v176 = [v175 subtrees];

                id v267 = v176;
                uint64_t v177 = [v176 countByEnumeratingWithState:&v273 objects:v291 count:16];
                if (v177)
                {
                  uint64_t v178 = v177;
                  uint64_t v179 = *(void *)v274;
                  do
                  {
                    for (uint64_t k = 0; k != v178; ++k)
                    {
                      if (*(void *)v274 != v179) {
                        objc_enumerationMutation(v267);
                      }
                      v181 = *(void **)(*((void *)&v273 + 1) + 8 * k);
                      v182 = [v181 numberForProperty:@"KBdisplayRowHint"];
                      if (v182)
                      {
                        long long v271 = 0u;
                        long long v272 = 0u;
                        long long v269 = 0u;
                        long long v270 = 0u;
                        v183 = [v181 subtrees];
                        uint64_t v184 = [v183 countByEnumeratingWithState:&v269 objects:v290 count:16];
                        if (v184)
                        {
                          uint64_t v185 = v184;
                          uint64_t v186 = *(void *)v270;
                          do
                          {
                            for (uint64_t m = 0; m != v185; ++m)
                            {
                              if (*(void *)v270 != v186) {
                                objc_enumerationMutation(v183);
                              }
                              objc_msgSend(*(id *)(*((void *)&v269 + 1) + 8 * m), "setDisplayRowHint:", objc_msgSend(v182, "intValue"));
                            }
                            uint64_t v185 = [v183 countByEnumeratingWithState:&v269 objects:v290 count:16];
                          }
                          while (v185);
                        }
                      }
                    }
                    uint64_t v178 = [v267 countByEnumeratingWithState:&v273 objects:v291 count:16];
                  }
                  while (v178);
                }

                uint64_t v173 = v265 + 1;
              }
              while (v265 + 1 != v264);
              uint64_t v264 = [obj countByEnumeratingWithState:&v277 objects:v292 count:16];
            }
            while (v264);
          }

          [(UIKBTree *)*v260 frameForKeylayoutName:@"split-left"];
          double v189 = v188;
          [(UIKBTree *)*v260 frameForKeylayoutName:@"split-right"];
          uint64_t v191 = 1;
          if (v189 == v85)
          {
            char v4 = v259;
            v192 = v263;
            double v33 = v257;
            if (v190 == v87)
            {
              if (UIKeyboardDeviceSupportsSplit()) {
                uint64_t v191 = UIKeyboardSupportsSplit() ^ 1;
              }
              else {
                uint64_t v191 = 0;
              }
            }
          }
          else
          {
            char v4 = v259;
            v192 = v263;
            double v33 = v257;
          }
          [(UIKeyboardLayoutStar *)v192 _addResizeTransformationsIfNecessary];
          [(UIKeyboardLayoutStar *)v192 updateKeyboardForKeyplane:v256];
          [(UIView *)v192 bounds];
          v195 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v193, v194);
          [v195 setSplitWidthsChanged:v191];
          [v195 setUpdateAssistantView:1];
          uint64_t v196 = (v192->_setKeyplaneViewCount + 1) % 100;
          v192->_setKeyplaneViewCount = v196;
          [(UIKeyboardLayoutStar *)v192 _didChangeKeyplaneWithContext:v195];
          if (v196 != v192->_setKeyplaneViewCount)
          {
            v197 = [(UIKeyboardLayoutStar *)v192 keyViewAnimator];
            [v197 setDisabled:0];
LABEL_206:

            uint64_t v41 = v256;
            goto LABEL_207;
          }
          [(UIKeyboardLayoutStar *)v192 setKeyboardAppearance:v192->_appearance];
          v197 = [(UIKeyboardLayoutStar *)v192 cacheTokenForKeyplane:*v260 caseAlternates:0];
          [v197 setTransformationIdentifiers:v192->_keyplaneTransformations];
          uint64_t v198 = [(UIKeyboardLayoutStar *)v192 defaultKeyplaneForKeyplane:*v260];
          v199 = [(UIKeyboardLayoutStar *)v192 cacheTokenForKeyplane:v198 caseAlternates:v249];
          v200 = [(UIKeyboardLayoutStar *)v192 renderConfig];
          v201 = +[UIKBRenderingContext renderingContextForRenderConfig:v200];

          objc_msgSend(v201, "setShiftState:", -[UIKeyboardLayoutStar keyplaneShiftState](v192, "keyplaneShiftState"));
          objc_msgSend(v201, "setKeyboardType:", -[UITextInputTraits keyboardType](v192->super._inputTraits, "keyboardType"));
          objc_msgSend(v201, "setHandBias:", -[UIKeyboardLayoutStar currentHandBias](v192, "currentHandBias"));
          if ([(UIKeyboardLayout *)v192 isFloating]) {
            [v201 setIsFloating:1];
          }
          v202 = (id *)p_keyplaneView;
          if ([(UIKeyboardLayoutStar *)v263 isDeveloperGestureKeybaord]
            && _UIIsPrivateMainBundle())
          {
            v203 = +[UIKBRenderFactory lightweightFactoryForVisualStyle:[(UIKBTree *)*v260 visualStyling] renderingContext:v201];
            [(UIKeyboardLayoutStar *)v263 clearKeyAnnotationsIfNecessary];
            if ([v203 supportsInputTraits:v263->super._inputTraits forKeyplane:*v260])
            {
              objc_msgSend(v197, "annotateWithInt:", -[UITextInputTraits keyboardType](v263->super._inputTraits, "keyboardType"));
              objc_msgSend(v199, "annotateWithInt:", -[UITextInputTraits keyboardType](v263->super._inputTraits, "keyboardType"));
              [(UIKeyboardLayoutStar *)v263 annotateKeysWithDeveloperPunctuation];
            }

            v202 = (id *)p_keyplaneView;
          }
          uint64_t v204 = [(UIKBScreenTraits *)v263->super._screenTraits idiom];
          if (v204 == 3) {
            uint64_t v204 = [v197 annotateWithBool:UIKeyboardCarPlayIsRightHandDrive()];
          }
          if ((v246 & 1) == 0) {
            uint64_t v204 = [*v202 purgeKeyViews];
          }
          v205 = (void *)MEMORY[0x18C108260](v204);
          [(UIKeyboardLayoutStar *)v263 mergeKeysIfNeeded];
          [(UIKeyboardLayoutStar *)v263 updateLocalizedKeys:0];
          uint64_t v206 = [(UIKeyboardLayoutStar *)v263 delegate];
          if (v206)
          {
            v207 = (void *)v206;
            v208 = [(UIKeyboardLayoutStar *)v263 delegate];
            char v209 = objc_opt_respondsToSelector();

            v202 = (id *)p_keyplaneView;
            if (v209)
            {
              v210 = [(UIKeyboardLayoutStar *)v263 delegate];
              [v210 keyboardLayout:v263 didSwitchToKeyplane:*v260];
            }
          }
          [*v202 removeFromSuperview];
          v211 = objc_msgSend(v197, "stringForSplitState:handBias:", -[UIKBTree isSplit](*v260, "isSplit"), -[UIKeyboardLayoutStar currentHandBias](v263, "currentHandBias"));
          uint64_t v212 = [(UIKeyboardLayoutStar *)v263 cacheIdentifierForKeyplaneNamed:v211];

          if (v212)
          {
            id v213 = [(NSMutableDictionary *)v263->_allKeyplaneViews objectForKey:v212];
            objc_storeStrong(v202, v213);
          }
          else
          {
            id v213 = *v202;
            id *v202 = 0;
          }

          id v214 = *v202;
          [(UIView *)v263 bounds];
          double v219 = v217;
          if (v214)
          {
            objc_msgSend(*v202, "setFrame:", v215, v216, v217, v218);
            [*v202 setKeyplane:*v260];
            [*v202 setDefaultKeyplane:v198];
            [*v202 setDefaultKeyplaneCacheToken:v199];
            [*v202 setOverrideScreenTraits:v263->super._screenTraits];
            [*v202 purgeSubviews];
          }
          else
          {
            v241 = -[UIKBKeyplaneView initWithFrame:keyplane:]([UIKBKeyplaneView alloc], "initWithFrame:keyplane:", *v260, v215, v216, v217, v218);
            id v242 = *v202;
            id *v202 = v241;

            [*v202 setDelegate:v263];
            v243 = [(UIKeyboardLayoutStar *)v263 keyViewAnimator];
            [*v202 setKeyViewAnimator:v243];

            [*v202 setCacheToken:v197];
            [*v202 setDefaultKeyplane:v198];
            [*v202 setDefaultKeyplaneCacheToken:v199];
            [*v202 setOverrideScreenTraits:v263->super._screenTraits];
            if (v212)
            {
              [(UIKBScreenTraits *)v263->super._screenTraits keyboardWidth];
              if (v244 == v219) {
                [(NSMutableDictionary *)v263->_allKeyplaneViews setObject:*v202 forKey:v212];
              }
            }
          }
          v220 = [*v202 keyViewAnimator];
          [v220 reset];

          v221 = [*v202 emojiKeyManager];
          if (!v221)
          {
            if (![(UIKeyboardLayoutStar *)v263 isEmojiKeyplane])
            {
LABEL_185:
              id v268 = v201;
              [*v202 setRenderingContext:v201];
              v222 = [(UIKeyboardLayoutStar *)v263 renderConfig];
              [*v202 setRenderConfig:v222];

              if (![(UIKeyboardPinchGestureRecognizer *)v263->_pinchGestureRecognizer pinchDetected]) {
                [*v202 setHidden:0];
              }
              v266 = (void *)v212;
              v223 = v199;
              v224 = v263->_backgroundView;
              if (v224
                && ([(UIView *)v224 superview],
                    v225 = objc_claimAutoreleasedReturnValue(),
                    v225,
                    v225))
              {
                v226 = (void *)v198;
                p_isa = (id *)&v263->super.super.super.super.isa;
                [(UIView *)v263 insertSubview:*v202 above:v263->_backgroundView];
              }
              else
              {
                v226 = (void *)v198;
                p_isa = (id *)&v263->super.super.super.super.isa;
                [(UIView *)v263 insertSubview:*v202 atIndex:0];
              }
              [p_isa updateBackgroundIfNeeded];
              [*v202 prepareForDisplay];
              [*v202 setNeedsDisplay];
              v228 = [p_isa[52] screen];
              [v228 scale];
              double v230 = v229;
              [*v202 factory];
              v232 = v231 = v202;
              [v232 setScale:v230];

              v233 = [*v231 factory];
              [v233 setAllowsPaddles:v252];

              v234 = UIKeyboardGetCurrentInputMode();
              uint64_t v235 = UIKeyboardUIPreferStringOverImageForInputMode(v234);
              v236 = [*v231 factory];
              [v236 setPreferStringKeycapOverImage:v235];

              [p_isa updateAllKeyStates];
              [p_isa _updateSupplementaryKeys];
              [p_isa updateLayoutTags];
              [p_isa updateCachedKeyplaneKeycaps];
              [p_isa updateGlobeKeyDisplayString];
              [p_isa[168] reloadResizingOffset];
              [p_isa[168] updateGestureRecognizers];
              id v237 = p_isa[168];
              v238 = [p_isa renderConfig];
              [v237 setRenderConfig:v238];

              [p_isa[168] updateGrabber];
              if ([(UIKBTree *)*v260 shouldSkipCandidateSelection])
              {
                double v33 = v257;
                [v257 setShouldSkipCandidateSelection:1];
              }
              else
              {
                double v33 = v257;
                [v257 setShouldSkipCandidateSelection:0];
                if ((([p_isa isRotating] | v253 ^ v247) & 1) == 0) {
                  [v257 acceptCurrentCandidateIfSelected];
                }
              }
              objc_msgSend(v33, "setUsesCandidateSelection:", -[UIKBTree notUseCandidateSelection](*v260, "notUseCandidateSelection") ^ 1);
              v239 = [(UIKeyboardLayoutStar *)v263 candidateList];

              if ((v253 ^ [(NSString *)v263->_keyplaneName hasSuffix:@"split"]) == 1
                || (v250 != 0) == (v239 == 0))
              {
                [v33 removeAutocorrectPromptAndCandidateList];
                [v33 updateCandidateDisplay];
              }
              [(UIKeyboardLayoutStar *)v263 refreshForDictationAvailablityDidChange];
              [v33 updateReturnKey:1];
              [(UIKeyboardLayoutStar *)v263 updateKeyCentroids];
              if (v251 != [(UIKeyboardLayoutStar *)v263 isShiftKeyPlaneChooser]) {
                [v33 clearShiftState];
              }
              if ([(UIKeyboardLayout *)v263 disableInteraction]) {
                [(UIKeyboardLayoutStar *)v263 setKeyboardDim:1];
              }
              else {
                [(UIView *)v263 setUserInteractionEnabled:1];
              }
              v240 = [(UIKeyboardLayoutStar *)v263 keyViewAnimator];
              [v240 setDisabled:0];

              if (!v263->_settingShift) {
                [(UIKeyboardLayout *)v263 updateTouchProcessingForKeyplaneChange];
              }

              char v4 = v259;
              goto LABEL_206;
            }
            v221 = [(UIKeyboardLayoutStar *)v263 emojiKeyManager];
            [*v202 setEmojiKeyManager:v221];
          }

          goto LABEL_185;
        }
      }
      else if ([(UIKeyboardLayoutStar *)self stretchKeyboardToFit] && !v96)
      {
        goto LABEL_102;
      }
LABEL_82:
      if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 2
        && [(UIKBScreenTraits *)self->super._screenTraits isLinear])
      {
        v97 = *p_keyplane;
        v98 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v98 scale];
        -[UIKBTree elaborateLayoutWithSize:scale:](v97, "elaborateLayoutWithSize:scale:", 1.0, 1.0, v99);
LABEL_129:

        goto LABEL_131;
      }
      [(UIKBTree *)*p_keyplane zipGeometrySet];
      if ([(UIKeyboardLayoutStar *)self currentHandBias])
      {
        double v100 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
        [(UIKeyboardLayoutStar *)self biasedKeyboardWidthRatio];
        double v102 = v101;
        double v103 = 0.0;
        if ([(UIKeyboardLayoutStar *)self currentHandBias] == 1)
        {
          [v256 frame];
          double v103 = (1.0 - v102) * v104;
        }
        v105 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v105 scale];
        objc_msgSend(v256, "elaborateLayoutWithSize:scale:origin:", v102, 1.0, v106, v103, v100);
      }
      if ([(UIKeyboardLayout *)self isFloating]
        && +[UIKeyboardImpl floatingIdiom] == 1)
      {
        +[UIKeyboardImpl floatingWidth];
        double v108 = v107;
        +[UIKeyboardImpl floatingHeight];
        double v110 = v109;
        [v256 frame];
        double v112 = v108 / v111;
        [v256 frame];
        double v114 = v110 / v113;
        v115 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v115 scale];
        objc_msgSend(v256, "elaborateLayoutWithSize:scale:", v112, v114, v116);

        [v256 setIsFloating:1];
      }
      if (v96)
      {
        [(UIKBScreenTraits *)self->super._screenTraits preferredContentSizeInPopover];
        double v118 = v117;
        double v120 = v119;
        [v256 frame];
        double v122 = v118 / v121;
        [v256 frame];
        double v124 = v120 / v123;
        v125 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v125 bounds];
        double v127 = v126;
        v128 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v128 bounds];
        double v130 = v129;

        double v131 = fmin(v124, 1.0);
        if (v127 <= v130) {
          double v132 = v124;
        }
        else {
          double v132 = v131;
        }
        v133 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v133 scale];
        objc_msgSend(v256, "elaborateLayoutWithSize:scale:", v122, v132, v134);
      }
      [(UIKBTree *)*p_keyplane clearManualAddedKey];
      goto LABEL_131;
    }
    unsigned int v248 = v67;
    v68 = self->_keyboard;
    uint64_t v69 = [(UIKeyboardLayoutStar *)self splitNameForKeyplaneName:v4];
    id v70 = [(UIKBTree *)v68 subtreeWithName:v69];

    if (!v70)
    {
      long long v71 = [(UIKeyboardLayoutStar *)self splitNameForKeyplane:v41];
      id v70 = [(UIKBTree *)self->_keyboard subtreeWithName:v71];

      if (!v70)
      {
        if ([(UIKeyboardLayoutStar *)self stretchKeyboardToFitKeyplane:v41])
        {
          [(UIKBScreenTraits *)self->super._screenTraits bounds];
          double v73 = v72;
          [(UIKBTree *)self->_keyboard frame];
          double v75 = v73 / v74;
          [(UIKeyboardLayoutStar *)self stretchFactorHeight];
          double v77 = v76;
          uint64_t v78 = [(UIKBScreenTraits *)self->super._screenTraits screen];
          [v78 scale];
          objc_msgSend(v41, "elaborateLayoutWithSize:scale:", v75, v77, v79);
        }
        else
        {
          [v41 zipGeometrySet];
        }
        uint64_t v80 = [(id)objc_opt_class() sharedRivenKeyplaneGenerator];
        long long v81 = [v80 generateRivenKeyplaneFromKeyplane:v41 forKeyboard:self->_keyboard];
        id v70 = v81;
        if (!v81) {
          goto LABEL_71;
        }
        [v81 setIsGenerated:1];
        long long v82 = [v41 layoutName];
        [v70 precacheLayoutName:v82];

        char v83 = [(UIKBTree *)self->_keyboard subtrees];
        [v83 addObject:v70];
      }
    }
    if (![(UIKBScreenTraits *)self->super._screenTraits isSplit]
      || ![(UITextInputTraits *)self->super._inputTraits acceptsSplitKeyboard])
    {
      goto LABEL_72;
    }
    id v70 = v70;

    [v70 name];
    uint64_t v80 = v4;
    uint64_t v41 = v70;
    char v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_71:

LABEL_72:
    self->_splitTransitionNeedsRebuild = 1;

    unsigned int v67 = v248;
    goto LABEL_73;
  }
LABEL_209:
}

uint64_t __40__UIKeyboardLayoutStar_setKeyplaneName___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldMergeKey:a2] ^ 1;
}

- (void)rollbackKeyplaneTransformations
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = self->_keyplaneTransformations;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = +[UIKBContinuousPathModalKeysTransformation transformationIdentifier];

        if (v8 == v9 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          keyplane = self->_keyplane;
          double v11 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
          id v12 = +[UIKBContinuousPathModalKeysTransformation rollbackKeyplane:keyplane withTransformationContext:v11];
        }
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_keyplaneTransformations removeAllObjects];
}

- (void)updateAllKeyStates
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(UIKBTree *)self->_keyboard dynamicLayout])
  {
    [(UIKBTree *)self->_keyplane subtreeWithType:3];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    id v3 = [obj keys];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v38;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v38 != v6) {
            objc_enumerationMutation(v3);
          }
          [(UIKeyboardLayoutStar *)self updateStateForKey:*(void *)(*((void *)&v37 + 1) + 8 * v7++)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v5);
    }
  }
  else
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = [(UIKBTree *)self->_keyplane subtrees];
    uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v24)
    {
      uint64_t v23 = *(void *)v34;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v34 != v23) {
            objc_enumerationMutation(obj);
          }
          double v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          BOOL v10 = [v9 keySet];
          double v11 = [v10 subtrees];

          uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v42 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v30;
            do
            {
              uint64_t v15 = 0;
              do
              {
                if (*(void *)v30 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
                long long v25 = 0u;
                long long v26 = 0u;
                long long v27 = 0u;
                long long v28 = 0u;
                double v17 = [v16 subtrees];
                uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v41 count:16];
                if (v18)
                {
                  uint64_t v19 = v18;
                  uint64_t v20 = *(void *)v26;
                  do
                  {
                    uint64_t v21 = 0;
                    do
                    {
                      if (*(void *)v26 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      [(UIKeyboardLayoutStar *)self updateStateForKey:*(void *)(*((void *)&v25 + 1) + 8 * v21++)];
                    }
                    while (v19 != v21);
                    uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v41 count:16];
                  }
                  while (v19);
                }

                ++v15;
              }
              while (v15 != v13);
              uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v42 count:16];
            }
            while (v13);
          }

          ++v8;
        }
        while (v8 != v24);
        uint64_t v24 = [obj countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v24);
    }
  }
}

- (void)updateStateForKey:(id)a3
{
  id v14 = a3;
  if ([v14 displayType] == 23 || objc_msgSend(v14, "displayType") == 51)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForShiftKey:v14];
LABEL_4:
    uint64_t v6 = v5;
    uint64_t v7 = self;
LABEL_5:
    [(UIKeyboardLayoutStar *)v7 setState:v6 forKey:v14];
    goto LABEL_6;
  }
  if ([v14 displayType] == 14)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForKeyplaneSwitchKey:v14];
    goto LABEL_4;
  }
  if ([v14 displayType] == 11)
  {
    uint64_t v7 = self;
    uint64_t v6 = 4;
    goto LABEL_5;
  }
  if ([v14 interactionType] == 21)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForMultitapReverseKey:v14];
    goto LABEL_4;
  }
  if ([v14 interactionType] == 41)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForMultitapForwardKey:v14];
    goto LABEL_4;
  }
  if (([v14 disabled] & 1) != 0
    || [v14 interactionType] == 20
    && ![(UIDelayedAction *)self->_multitapAction scheduled])
  {
    goto LABEL_20;
  }
  if ([v14 displayType] == 1)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForCandidateListKey:v14];
    goto LABEL_4;
  }
  if ([v14 interactionType] == 44)
  {
LABEL_26:
    uint64_t v7 = self;
    uint64_t v6 = 2;
    goto LABEL_5;
  }
  if ([v14 displayType] == 4)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForDictationKey:v14];
    goto LABEL_4;
  }
  if ([v14 displayType] == 39
    || [v14 displayType] == 40
    || [v14 displayType] == 41
    || [v14 displayType] == 49)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForStylingKey:v14];
    goto LABEL_4;
  }
  if ([v14 displayType] == 42
    || [v14 displayType] == 43
    || [v14 displayType] == 44
    || [v14 displayType] == 45
    || [v14 displayType] == 46
    || [v14 interactionType] == 17
    || [v14 interactionType] == 12)
  {
    uint64_t v5 = [(UIKeyboardLayoutStar *)self stateForManipulationKey:v14];
    goto LABEL_4;
  }
  if ([v14 displayType] != 36 && objc_msgSend(v14, "displayType") != 37)
  {
    if ([v14 interactionType] != 9) {
      goto LABEL_56;
    }
    double v9 = [v14 representedString];
    char v10 = [v9 isEqualToString:@"NonASCII"];
    if ((v10 & 1) == 0)
    {
      id v3 = [v14 representedString];
      if (([v3 isEqualToString:@"ASCIICapable"] & 1) == 0)
      {

        goto LABEL_56;
      }
    }
    double v11 = +[UIKeyboardImpl activeInstance];
    uint64_t v12 = [v11 textInputTraits];
    int v13 = [v12 loadKeyboardsForSiriLanguage];

    if (v10)
    {

      if (!v13) {
        goto LABEL_56;
      }
    }
    else
    {

      if ((v13 & 1) == 0)
      {
LABEL_56:
        if ([v14 displayType] == 50)
        {
          uint64_t v7 = self;
          uint64_t v6 = 0;
          goto LABEL_5;
        }
        goto LABEL_26;
      }
    }
LABEL_20:
    uint64_t v7 = self;
    uint64_t v6 = 1;
    goto LABEL_5;
  }
  [(UIKeyboardLayoutStar *)self setState:2 forKey:v14];
  uint64_t v8 = [(UIKeyboardLayoutStar *)self viewForKey:v14];
  if (objc_opt_respondsToSelector()) {
    [v8 setHitTestResponder:self];
  }

LABEL_6:
  if ([v14 displayType] != 8) {
    [v14 setOverrideDisplayString:0];
  }
  [v14 setFlickDirection:-3];
}

- (void)annotateKeysWithDeveloperPunctuation
{
  v46[3] = *MEMORY[0x1E4F143B8];
  v45[0] = &unk_1ED3F4AA0;
  v45[1] = &unk_1ED3F4B00;
  v46[0] = &unk_1ED3F0388;
  v46[1] = &unk_1ED3F0478;
  v45[2] = &unk_1ED3F4B18;
  v46[2] = &unk_1ED3F0538;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:3];
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v40 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obuint64_t j = [(UIKBTree *)self->_keyplane subtrees];
  uint64_t v4 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v37;
    uint64_t v28 = *(void *)v37;
    do
    {
      uint64_t v8 = 0;
      uint64_t v29 = v5;
      do
      {
        if (*(void *)v37 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
        char v10 = objc_msgSend(v9, "name", v28);
        uint64_t v11 = [v10 rangeOfString:@"Letters"];
        uint64_t v31 = v8;
        if (((v11 == 0x7FFFFFFFFFFFFFFFLL) & v6) == 1)
        {
          uint64_t v12 = [v9 name];
          uint64_t v13 = [v12 rangeOfString:@"Punctuation"];

          if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          {
            char v6 = 1;
            goto LABEL_31;
          }
        }
        else
        {
          uint64_t v14 = v11;

          if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_31;
          }
        }
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v15 = [v9 keys];
        uint64_t v16 = [v15 countByEnumeratingWithState:&v32 objects:v43 count:16];
        if (!v16) {
          goto LABEL_30;
        }
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v33 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            uint64_t v21 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v20, "displayRowHint"));
            double v22 = [v3 objectForKeyedSubscript:v21];

            int v23 = [v20 displayRowHint];
            switch(v23)
            {
              case 1:
                uint64_t v24 = (unint64_t *)&v42;
                break;
              case 3:
                uint64_t v24 = (unint64_t *)&v40;
                break;
              case 2:
                uint64_t v24 = (unint64_t *)&v41;
                break;
              default:
                goto LABEL_28;
            }
            unint64_t v25 = *v24;
            unint64_t v26 = [v22 count];
            long long v27 = (void *)MEMORY[0x1E4F1CBF0];
            if (v25 < v26)
            {
              long long v27 = [v22 objectAtIndexedSubscript:*v24];
              ++*v24;
            }
            if ([v20 visible])
            {
              if ([v27 count])
              {
                [v20 setSecondaryDisplayStrings:v27];
                [v20 setSecondaryRepresentedStrings:v27];
              }
              [v20 setDisplayTypeHint:10];
            }

LABEL_28:
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v32 objects:v43 count:16];
        }
        while (v17);
LABEL_30:

        char v6 = 1;
        uint64_t v7 = v28;
        uint64_t v5 = v29;
LABEL_31:
        uint64_t v8 = v31 + 1;
      }
      while (v31 + 1 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v5);
  }
}

- (BOOL)ignoreWriteboard
{
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23
    || (unint64_t)([(UIKeyboardLayout *)self orientation] - 3) > 1)
  {
    return 0;
  }
  return [(UIKeyboardLayoutStar *)self isEmojiKeyplane];
}

- (BOOL)useDismissForMessagesWriteboard
{
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23)
  {
    return 0;
  }
  id v3 = [(UIKBTree *)self->_keyplane rightSpaceKey];
  uint64_t v4 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"More-Key"];
  if ((unint64_t)[v4 count] < 2)
  {
    if ((unint64_t)[v4 count] <= 1)
    {
      uint64_t v11 = [(UIKBTree *)self->_keyplane firstKeyplaneSwitchKey];
      if (v11)
      {
        BOOL v12 = 0;
      }
      else
      {
        uint64_t v20 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Handwriting-Input"];

        BOOL v12 = v20 == 0;
      }

      uint64_t v8 = 0;
      goto LABEL_26;
    }
    uint64_t v8 = 0;
    goto LABEL_23;
  }
  uint64_t v5 = [v4 objectAtIndex:0];
  [v5 frame];
  double MidX = CGRectGetMidX(v22);
  [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
  uint64_t v8 = [v4 objectAtIndex:MidX <= v7 * 0.5];

  BOOL v9 = [(UIKBTree *)self->_keyplane isSplit];
  char v10 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Modify-For-Writeboard-Key"];
  if (v10)
  {

LABEL_23:
    BOOL v12 = 0;
    goto LABEL_26;
  }
  if (v9) {
    double v13 = 4.0;
  }
  else {
    double v13 = 3.0;
  }
  [v8 frame];
  double MinX = CGRectGetMinX(v23);
  [v3 frame];
  double v15 = vabdd_f64(MinX, CGRectGetMaxX(v24));
  uint64_t v16 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v17 = [v16 preferencesActions];
  [v17 rivenSizeFactor:v13];
  double v19 = v18;

  if (v15 <= v19) {
    goto LABEL_23;
  }
  BOOL v12 = 1;
LABEL_26:

  return v12;
}

- (BOOL)useUndoForMessagesWriteboard
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self is10KeyRendering];
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom]) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = !v3;
  }
  BOOL result = 0;
  if (!v4)
  {
    uint64_t v5 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Undo-Key"];

    if (v5) {
      return 1;
    }
  }
  return result;
}

- (void)annotateWriteboardDisplayTypeHintForKeyIfNeeded
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v3 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Dismiss-Key"];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
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
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 126
          && [(UIKeyboardLayoutStar *)self useDismissForMessagesWriteboard])
        {
          uint64_t v9 = 11;
        }
        else
        {
          uint64_t v9 = 0;
        }
        [v8 setDisplayTypeHint:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v5);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  char v10 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Undo-Key", 0];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v17 + 1) + 8 * v14);
        if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 126
          && [(UIKeyboardLayoutStar *)self useUndoForMessagesWriteboard])
        {
          uint64_t v16 = 11;
        }
        else
        {
          uint64_t v16 = 0;
        }
        [v15 setDisplayTypeHint:v16];
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
}

- (void)clearKeyAnnotationsIfNecessary
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = [(UIKBTree *)self->_keyboard subtrees];
  uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v18)
  {
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v3 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v4 = [v3 subtrees];
        uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v6; ++j)
            {
              if (*(void *)v24 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              long long v19 = 0u;
              long long v20 = 0u;
              long long v21 = 0u;
              long long v22 = 0u;
              char v10 = [v9 keys];
              uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v31 count:16];
              if (v11)
              {
                uint64_t v12 = v11;
                uint64_t v13 = *(void *)v20;
                do
                {
                  for (uint64_t k = 0; k != v12; ++k)
                  {
                    if (*(void *)v20 != v13) {
                      objc_enumerationMutation(v10);
                    }
                    double v15 = *(void **)(*((void *)&v19 + 1) + 8 * k);
                    if ([v15 displayTypeHint] == 10)
                    {
                      if ([v15 displayType] != 7)
                      {
                        [v15 setSecondaryDisplayStrings:0];
                        [v15 setSecondaryRepresentedStrings:0];
                      }
                      [v15 setDisplayTypeHint:0];
                    }
                  }
                  uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v31 count:16];
                }
                while (v12);
              }
            }
            uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v32 count:16];
          }
          while (v6);
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)updateTransitionWithFlags:(unint64_t)a3
{
  if ([(UIKBScreenTraits *)self->super._screenTraits supportsSplit]
    && ![(UIKBScreenTraits *)self->super._screenTraits isFloating]
    && ![(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    transitionView = self->_transitionView;
    [(UIKeyboardSplitTransitionView *)transitionView rebuildControlKeys:a3];
  }
}

- (void)setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5
{
  id v8 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__UIKeyboardLayoutStar_setReturnKeyEnabled_withDisplayName_withType___block_invoke;
  v10[3] = &unk_1E52FA4E8;
  BOOL v13 = a3;
  v10[4] = self;
  id v11 = v8;
  int v12 = a5;
  id v9 = v8;
  +[UIView performWithoutAnimation:v10];
}

uint64_t __69__UIKeyboardLayoutStar_setReturnKeyEnabled_withDisplayName_withType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setReturnKeyEnabled:*(unsigned __int8 *)(a1 + 52) withDisplayName:*(void *)(a1 + 40) withType:*(unsigned int *)(a1 + 48)];
}

- (void)_setReturnKeyEnabled:(BOOL)a3 withDisplayName:(id)a4 withType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [(UIKBTree *)self->_keyplane cache];
  char v10 = [v9 objectForKey:@"Return-Key"];

  if (v10)
  {
    id v11 = [MEMORY[0x1E4F1CA80] set];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v28 = v10;
    id v12 = v10;
    uint64_t v30 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (!v30) {
      goto LABEL_29;
    }
    uint64_t v13 = *(void *)v32;
    long long v29 = self;
    while (1)
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v12);
        }
        double v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (([v11 containsObject:v15] & 1) == 0)
        {
          if ([v15 displayTypeHint] == v5)
          {
            [v15 displayString];
            uint64_t v16 = v13;
            uint64_t v17 = v11;
            uint64_t v18 = v5;
            id v19 = v12;
            v21 = BOOL v20 = v6;
            char v22 = [v8 isEqualToString:v21];

            BOOL v6 = v20;
            id v12 = v19;
            uint64_t v5 = v18;
            id v11 = v17;
            uint64_t v13 = v16;
            self = v29;
            if (v22)
            {
              int v23 = 0;
              goto LABEL_13;
            }
          }
          [v11 addObject:v15];
        }
        int v23 = 1;
LABEL_13:
        [v15 setDisplayString:v8];
        [v15 setDisplayTypeHint:v5];
        int v24 = [(UIKeyboardLayoutStar *)self stateForKey:v15];
        if (v6)
        {
          if (v24 == 1) {
            int v25 = 1;
          }
          else {
            int v25 = v23;
          }
          if (v25 == 1)
          {
            uint64_t v26 = 2;
LABEL_26:
            [(UIKeyboardLayoutStar *)self setState:v26 forKey:v15];
            continue;
          }
        }
        else if ((v23 & 1) != 0 || (v24 != 2 ? (BOOL v27 = v24 == 4) : (BOOL v27 = 1), v27))
        {
          uint64_t v26 = 1;
          goto LABEL_26;
        }
      }
      uint64_t v30 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (!v30)
      {
LABEL_29:

        [(UIKeyboardLayoutStar *)self updateTransitionWithFlags:5];
        char v10 = v28;
        break;
      }
    }
  }
}

- (BOOL)_stringContainsCurrencyCharacters:(id)a3
{
  id v3 = a3;
  if (_stringContainsCurrencyCharacters__onceToken != -1) {
    dispatch_once(&_stringContainsCurrencyCharacters__onceToken, &__block_literal_global_855);
  }
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  uint64_t v4 = [v3 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__UIKeyboardLayoutStar__stringContainsCurrencyCharacters___block_invoke_2;
  v7[3] = &unk_1E52FA510;
  v7[4] = &v8;
  objc_msgSend(v3, "_enumerateLongCharactersInRange:usingBlock:", 0, v4, v7);
  char v5 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __58__UIKeyboardLayoutStar__stringContainsCurrencyCharacters___block_invoke()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[1] = 0;
  [@"[\\p{Sc}]" getCharacters:(char *)v1 - ((2 * objc_msgSend(@"[\\p{Sc}]", "length") + 15) & 0x3FFFFFFF0)];
  uint64_t result = uset_openPattern();
  _stringContainsCurrencyCharacters__currencySet = result;
  return result;
}

uint64_t __58__UIKeyboardLayoutStar__stringContainsCurrencyCharacters___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = MEMORY[0x18C109580](_stringContainsCurrencyCharacters__currencySet);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)updateCurrencySymbolForKey:(id)a3 withCurrencyString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 representedString];
  BOOL v9 = [(UIKeyboardLayoutStar *)self _stringContainsCurrencyCharacters:v8];

  if (v9)
  {
    [v6 setDisplayString:v7];
    [v6 setRepresentedString:v7];
  }
  uint64_t v10 = [v6 secondaryRepresentedStrings];
  char v11 = (void *)[v10 mutableCopy];

  id v12 = [v6 secondaryDisplayStrings];
  uint64_t v13 = (void *)[v12 mutableCopy];

  uint64_t v14 = [v6 secondaryRepresentedStrings];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  BOOL v20 = __70__UIKeyboardLayoutStar_updateCurrencySymbolForKey_withCurrencyString___block_invoke;
  long long v21 = &unk_1E52FA538;
  char v22 = self;
  id v23 = v11;
  id v24 = v7;
  id v25 = v13;
  id v15 = v13;
  id v16 = v7;
  id v17 = v11;
  [v14 enumerateObjectsUsingBlock:&v18];

  objc_msgSend(v6, "setSecondaryRepresentedStrings:", v17, v18, v19, v20, v21, v22);
  [v6 setSecondaryDisplayStrings:v15];
}

uint64_t __70__UIKeyboardLayoutStar_updateCurrencySymbolForKey_withCurrencyString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) _stringContainsCurrencyCharacters:a2];
  if (result)
  {
    [*(id *)(a1 + 40) replaceObjectAtIndex:a3 withObject:*(void *)(a1 + 48)];
    uint64_t result = [*(id *)(a1 + 56) replaceObjectAtIndex:a3 withObject:*(void *)(a1 + 48)];
    *a4 = 1;
  }
  return result;
}

- (void)setCurrencyKeysForCurrentLocaleOnKeyplane:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = UIKeyboardGetCurrentInputMode();
  char v5 = [MEMORY[0x1E4F1CA20] preferredLocale];
  long long v32 = [v5 localeIdentifier];

  uint64_t v30 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"$", @"€", @"£", @"¥", @"₩", 0);
  id v6 = [v4 cache];
  id v7 = [v6 objectForKey:@"Primary-Currency-Sign"];

  if (v7)
  {
    uint64_t v8 = UIKeyboardLocalizedObject(@"UI-PrimaryCurrencySign", v32, 0, 0, 0);
    if (!v8)
    {
      uint64_t v8 = UIKeyboardLocalizedString(@"UI-PrimaryCurrencySign", v31, 0, @"$");
    }
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v14 displayType] == 7)
          {
            [(UIKeyboardLayoutStar *)self updateCurrencySymbolForKey:v14 withCurrencyString:v8];
          }
          else
          {
            [v14 setDisplayString:v8];
            [v14 setRepresentedString:v8];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v11);
    }
  }
  long long v29 = v7;
  uint64_t v15 = 0;
  do
  {
    id v16 = [v4 cache];
    uint64_t v17 = v15 + 1;
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"Alternate-Currency-Sign-%d", v15 + 1);
    uint64_t v19 = [v16 objectForKey:v18];

    if (v19)
    {
      BOOL v20 = UIKeyboardStringAlternateCurrencySign[v15];
      long long v21 = UIKeyboardLocalizedObject(v20, v32, 0, 0, 0);
      if (!v21)
      {
        char v22 = [v30 objectAtIndex:v15 + 1];
        long long v21 = UIKeyboardLocalizedString(v20, v31, 0, v22);
      }
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v23 = v19;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v34;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v23);
            }
            long long v28 = *(void **)(*((void *)&v33 + 1) + 8 * j);
            if ([v28 displayType] == 7)
            {
              [(UIKeyboardLayoutStar *)self updateCurrencySymbolForKey:v28 withCurrencyString:v21];
            }
            else
            {
              [v28 setDisplayString:v21];
              [v28 setRepresentedString:v21];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v25);
      }
    }
    uint64_t v15 = v17;
  }
  while (v17 != 4);
}

- (void)setPercentSignKeysForCurrentLocaleOnKeyplane:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = UIKeyboardGetCurrentInputMode();
  char v5 = UIKeyboardInputModeGetNumericLocale(v4);
  id v6 = [v5 localeIdentifier];

  id v7 = [v3 cache];
  uint64_t v8 = [v7 objectForKey:@"Localized-Percent-Sign"];

  if ([v8 count])
  {
    id v34 = v3;
    if (qword_1EB25AB60 != -1) {
      dispatch_once(&qword_1EB25AB60, &__block_literal_global_886_0);
    }
    id v9 = v6;
    if (qword_1EB25AC18 && [(id)qword_1EB25AC10 isEqualToString:v9])
    {
      uint64_t v10 = (__CFString *)(id)qword_1EB25AC18;
    }
    else
    {
      uint64_t v11 = objc_opt_new();
      uint64_t v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
      [v11 setLocale:v12];

      uint64_t v13 = [v11 percentSymbol];
      uint64_t v14 = (void *)v13;
      if (v13) {
        uint64_t v15 = (__CFString *)v13;
      }
      else {
        uint64_t v15 = @"%";
      }
      uint64_t v10 = v15;

      uint64_t v16 = [v9 copy];
      uint64_t v17 = (void *)qword_1EB25AC10;
      qword_1EB25AC10 = v16;

      objc_storeStrong((id *)&qword_1EB25AC18, v15);
    }

    [(id)qword_1EB25AB58 addObject:v10];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v33 = v8;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          id v23 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (objc_msgSend(v23, "displayType", v33) == 7)
          {
            uint64_t v24 = (void *)qword_1EB25AB58;
            uint64_t v25 = [v23 representedString];
            LODWORD(v24) = [v24 containsObject:v25];

            if (v24)
            {
              [v23 setDisplayString:v10];
              [v23 setRepresentedString:v10];
            }
            uint64_t v26 = [v23 secondaryRepresentedStrings];
            BOOL v27 = (void *)[v26 mutableCopy];

            long long v28 = [v23 secondaryDisplayStrings];
            long long v29 = (void *)[v28 mutableCopy];

            uint64_t v30 = [v23 secondaryRepresentedStrings];
            v35[0] = MEMORY[0x1E4F143A8];
            v35[1] = 3221225472;
            v35[2] = __69__UIKeyboardLayoutStar_setPercentSignKeysForCurrentLocaleOnKeyplane___block_invoke_2;
            v35[3] = &unk_1E52FA560;
            id v36 = v27;
            long long v37 = v10;
            id v38 = v29;
            id v31 = v29;
            id v32 = v27;
            [v30 enumerateObjectsUsingBlock:v35];

            [v23 setSecondaryRepresentedStrings:v32];
            [v23 setSecondaryDisplayStrings:v31];
          }
          else
          {
            [v23 setDisplayString:v10];
            [v23 setRepresentedString:v10];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v20);
    }

    id v3 = v34;
    uint64_t v8 = v33;
  }
}

void __69__UIKeyboardLayoutStar_setPercentSignKeysForCurrentLocaleOnKeyplane___block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", @"⁒", 0);
  uint64_t v1 = (void *)qword_1EB25AB58;
  qword_1EB25AB58 = v0;
}

uint64_t __69__UIKeyboardLayoutStar_setPercentSignKeysForCurrentLocaleOnKeyplane___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = [(id)qword_1EB25AB58 containsObject:a2];
  if (result)
  {
    [*(id *)(a1 + 32) replaceObjectAtIndex:a3 withObject:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    return [v6 replaceObjectAtIndex:a3 withObject:v7];
  }
  return result;
}

- (int)displayTypeHintForMoreKey
{
  int result = [(UIKBTree *)self->_keyplane intForProperty:@"more-rendering"];
  if (result <= 25)
  {
    if (result != 6)
    {
      if (result == 8) {
        return 5;
      }
      else {
        return result == 22;
      }
    }
  }
  else
  {
    int v3 = result - 26;
    int result = 2;
    switch(v3)
    {
      case 0:
        return result;
      case 1:
        int result = 4;
        break;
      case 5:
        int result = 3;
        break;
      case 9:
        int result = 8;
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (int)displayTypeHintForShiftKey
{
  int v2 = [(UIKBTree *)self->_keyplane intForProperty:@"shift-rendering"] - 22;
  int result = 2;
  switch(v2)
  {
    case 0:
      int result = 1;
      break;
    case 2:
      int result = 7;
      break;
    case 4:
      return result;
    case 9:
      int result = 3;
      break;
    default:
      int result = 0;
      break;
  }
  return result;
}

- (int)stateForMultitapReverseKey:(id)a3
{
  id v4 = a3;
  char v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v5 markedText];
  uint64_t v7 = [v6 _lastGrapheme];

  if (self->_multitapKey
    || [v7 length]
    && ([(UIKeyboardLayoutStar *)self keyWithRepresentedString:v7],
        id v9 = objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    int v8 = 2;
  }
  else
  {
    int v8 = 1;
  }

  return v8;
}

- (int)stateForCandidateListKey:(id)a3
{
  return 2;
}

- (int)stateForDictationKey:(id)a3
{
  int v3 = +[UIDictationController activeInstance];

  if (!v3) {
    return 1;
  }
  id v4 = +[UIKeyboardInputModeController sharedInputModeController];
  char v5 = [v4 enabledDictationLanguages];
  if (![v5 count]
    || !+[UIDictationController dictationIsFunctional])
  {

    return 1;
  }
  BOOL v6 = +[UIDictationController fetchCurrentInputModeSupportsDictation];

  if (!v6) {
    return 1;
  }
  if (!+[UIDictationController isRunning]) {
    return 2;
  }
  if (!+[UIDictationController isRunning])
  {
    uint64_t v7 = +[UIKeyboardImpl activeInstance];
    int v8 = [v7 isDictationPopoverPresented];

    if (!v8) {
      return 2;
    }
  }
  id v9 = +[UIKeyboardInputMode dictationInputMode];
  char v10 = [v9 isCurrentDictationLanguageOnDevice];

  if ((v10 & 1) != 0 || +[UIDictationController viewMode] == 1) {
    return 4;
  }
  else {
    return 2;
  }
}

- (BOOL)supportStylingWithKey:(id)a3
{
  id v4 = a3;
  if ([(UIKBTextEditingTraits *)self->super._textEditingTraits supportStyling]
    && ([v4 interactionType] != 28
     || [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleBoldface])
    && ([v4 interactionType] != 29
     || [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleItalics])
    && ([v4 interactionType] != 30
     || [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleUnderline]))
  {
    BOOL v5 = [v4 displayType] != 49
      || [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleBoldface]
      || [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleItalics]
      || [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleUnderline];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int)stateForStylingKey:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutStar *)self supportStylingWithKey:v4])
  {
    if ([v4 interactionType] == 28
      && [(UIKBTextEditingTraits *)self->super._textEditingTraits isBold]
      || [v4 interactionType] == 29
      && [(UIKBTextEditingTraits *)self->super._textEditingTraits isItalicized]
      || [v4 interactionType] == 30
      && [(UIKBTextEditingTraits *)self->super._textEditingTraits isUnderlined])
    {
      int v5 = 4;
    }
    else if ([v4 state] == 16)
    {
      int v5 = 16;
    }
    else
    {
      int v5 = 2;
    }
  }
  else
  {
    int v5 = 1;
  }

  return v5;
}

- (id)highlightedVariantListForStylingKey:(id)a3
{
  if ([a3 variantType] == 9)
  {
    id v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
    if ([(UIKBTextEditingTraits *)self->super._textEditingTraits isBold]) {
      [v4 addObject:&unk_1ED3F4B30];
    }
    if ([(UIKBTextEditingTraits *)self->super._textEditingTraits isItalicized]) {
      [v4 addObject:&unk_1ED3F4A88];
    }
    if ([(UIKBTextEditingTraits *)self->super._textEditingTraits isUnderlined]) {
      [v4 addObject:&unk_1ED3F4B48];
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (int)stateForManipulationKey:(id)a3
{
  id v4 = a3;
  if (([v4 interactionType] != 31
     || ![(UIKBTextEditingTraits *)self->super._textEditingTraits canCut])
    && ([v4 interactionType] != 32
     || ![(UIKBTextEditingTraits *)self->super._textEditingTraits canCopy])
    && ([v4 interactionType] != 33
     || ![(UIKBTextEditingTraits *)self->super._textEditingTraits canPaste])
    && ([v4 interactionType] != 34
     || ![(UIKBTextEditingTraits *)self->super._textEditingTraits canMoveCursorLeft])
    && ([v4 interactionType] != 35
     || ![(UIKBTextEditingTraits *)self->super._textEditingTraits canMoveCursorRight]))
  {
    if ([v4 interactionType] != 17
      && [v4 interactionType] != 12)
    {
      int v5 = 1;
      goto LABEL_12;
    }
    uint64_t v7 = +[UIKeyboardImpl activeInstance];
    int v8 = [v7 delegateAsResponder];
    id v9 = [v8 _responderForEditing];
    char v10 = [v9 undoManager];

    if ([v4 interactionType] == 17)
    {
      if ([v10 canUndo]) {
        goto LABEL_20;
      }
    }
    else if ([v10 canRedo])
    {
      goto LABEL_20;
    }
    if ([v4 displayTypeHint] != 11)
    {
      int v5 = 1;
      goto LABEL_23;
    }
LABEL_20:
    int v5 = 2;
LABEL_23:

    goto LABEL_12;
  }
  int v5 = 2;
LABEL_12:

  return v5;
}

- (unint64_t)textEditingKeyMask
{
  int v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Cut-Key"];
  if (v3
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Copy-Key"],
        (int v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    unint64_t v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Paste-Key"];

    if (!v4) {
      goto LABEL_5;
    }
  }
  unint64_t v4 = 2;
LABEL_5:
  int v5 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Bold-Key"];
  if (v5
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Italic-Key"],
        (int v5 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Underline-Key"],
        (int v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    int v8 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"BIU-Key"];

    if (!v8) {
      goto LABEL_10;
    }
  }
  v4 |= 4uLL;
LABEL_10:
  BOOL v6 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"RTL-Left-Arrow-Key"];
  if (v6
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Left-Arrow-Key"],
        (BOOL v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"RTL-Right-Arrow-Key"],
        (BOOL v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v9 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Right-Arrow_key"];

    if (!v9) {
      return v4;
    }
  }
  v4 |= 1uLL;
  return v4;
}

- (void)setTextEditingTraits:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v43 setTextEditingTraits:a3];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  unint64_t v4 = [(UIKBTree *)self->_keyplane subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        char v10 = [v9 name];
        int v11 = [v10 _containsSubstring:@"Assist"];

        if (v11)
        {
          id v12 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v46 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v29 = v12;
  uint64_t v13 = [v12 keySet];
  uint64_t v14 = [v13 subtrees];

  obuint64_t j = v14;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        uint64_t v20 = [v19 subtrees];
        uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v44 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v32;
          do
          {
            uint64_t v24 = 0;
            do
            {
              if (*(void *)v32 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void **)(*((void *)&v31 + 1) + 8 * v24);
              if ([v25 displayType] == 39
                || [v25 displayType] == 40
                || [v25 displayType] == 41
                || [v25 displayType] == 49)
              {
                [v25 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
                uint64_t v26 = [(UIKeyboardLayoutStar *)self highlightedVariantListForStylingKey:v25];
                [v25 setHighlightedVariantsList:v26];

                uint64_t v27 = [(UIKeyboardLayoutStar *)self stateForStylingKey:v25];
LABEL_26:
                [(UIKeyboardLayoutStar *)self setState:v27 forKey:v25];
                goto LABEL_27;
              }
              if ([v25 displayType] == 42
                || [v25 displayType] == 43
                || [v25 displayType] == 44
                || [v25 displayType] == 45
                || [v25 displayType] == 46)
              {
                uint64_t v27 = [(UIKeyboardLayoutStar *)self stateForManipulationKey:v25];
                goto LABEL_26;
              }
LABEL_27:
              ++v24;
            }
            while (v22 != v24);
            uint64_t v28 = [v20 countByEnumeratingWithState:&v31 objects:v44 count:16];
            uint64_t v22 = v28;
          }
          while (v28);
        }
      }
      uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v16);
  }
}

- (int)stateForKeyplaneSwitchKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKBTree *)self->_keyboard name];
  uint64_t v6 = [v5 rangeOfString:@"QWERTY-Japanese"];

  int v7 = 2;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int v8 = [(NSString *)self->_keyplaneName lowercaseString];
    id v9 = [v4 representedString];
    char v10 = [v9 lowercaseString];

    if ([v8 rangeOfString:v10] == 0x7FFFFFFFFFFFFFFFLL) {
      int v7 = 2;
    }
    else {
      int v7 = 4;
    }
    if ([(UIKBTree *)self->_keyboard visualStyle] == 101
      || [(UIKeyboardLayoutStar *)self is10KeyRendering])
    {
      int v11 = [v8 componentsSeparatedByString:@"-"];
      id v12 = [v10 componentsSeparatedByString:@"-"];
      uint64_t v13 = [v12 objectAtIndex:0];
      uint64_t v14 = [v11 objectAtIndex:0];
      int v15 = [v13 isEqualToString:v14];

      if (v15) {
        int v7 = 4;
      }
    }
  }

  return v7;
}

- (id)keylistContainingKey:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(UIKBTree *)self->_keyplane subtrees];
  uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v6 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v5);
        }
        int v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = objc_msgSend(v8, "keySet", v20);
        char v10 = [v9 subtrees];

        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              int v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              uint64_t v16 = [v15 subtrees];
              char v17 = [v16 containsObject:v4];

              if (v17)
              {
                id v18 = v15;

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v6 = v20;
      }
      id v18 = 0;
      uint64_t v21 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)mergeKeysIfNeeded
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"UIKeyboardNeedsUpdatingKeyboardDockViewVisibilityNotification" object:0 userInfo:0];

  [(UIKeyboardLayoutStar *)self _addExtraControlKeysIfNecessary];
  [(UIKeyboardLayoutStar *)self annotateWriteboardDisplayTypeHintForKeyIfNeeded];
  [(UIKeyboardLayoutStar *)self updateMoreAndInternationalKeys];
  [(UIKeyboardLayoutStar *)self _swapGlobeAndMoreKeysIfNecessary];
  [(UIKeyboardLayoutStar *)self relayoutForWriteboardKey];
  [(UIKeyboardLayoutStar *)self updateReturnKeysIfNeeded];
  [(UIKeyboardLayoutStar *)self transitionToModalContinuousPathKeyplane];
  [(UIKeyboardLayoutStar *)self _transformFloatingKeyboardIfNecessary];
  [(UIKeyboardLayoutStar *)self _transformCarPlayIfNecessary];
}

- (BOOL)_shouldSwapGlobeAndMore
{
  uint64_t v3 = UIKeyboardComputeKeyboardIdiomFromScreenTraits(self->super._screenTraits, [(UIKBScreenTraits *)self->super._screenTraits idiom], 0);
  if (![(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    if (v3 == 23)
    {
      if ([(UIKeyboardLayout *)self isFloating]) {
        goto LABEL_23;
      }
    }
    else if (v3 == 24 || v3 == 26 && !+[UIDevice _hasHomeButton])
    {
      goto LABEL_23;
    }
    if ((unint64_t)([(UIKBScreenTraits *)self->super._screenTraits orientation] - 3) > 1) {
      return 0;
    }
    if (self->_externalDictationAndInternationalKeys || (unint64_t)(v3 - 21) > 1) {
      return 0;
    }
    uint64_t v13 = [(UIKBTree *)self->_keyboard name];
    char v14 = [v13 _containsSubstring:@"HWR"];

    if ((v14 & 1) == 0) {
      return 0;
    }
LABEL_23:
    int v8 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"More-Key"];
    uint64_t v15 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"International-Key"];
    id v9 = (void *)v15;
    if (v8) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16 && [v8 visible])
    {
      char v17 = [v9 visible];
LABEL_31:

      return v17;
    }
LABEL_30:
    char v17 = 0;
    goto LABEL_31;
  }
  if (v3 != 26)
  {
    if ((unint64_t)(v3 - 23) < 2 && [(UIKeyboardLayout *)self isFloating]) {
      goto LABEL_23;
    }
    return 0;
  }
  id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v5 = [v4 preferencesActions];
  [v5 rivenSizeFactor:1.0];
  double v7 = v6;

  int v8 = +[UIKeyboardPreferencesController sharedPreferencesController];
  id v9 = [v8 preferencesActions];
  [v9 rivenSizeFactor:1.0];
  if (v10 > 1.0)
  {

    goto LABEL_23;
  }
  if (v7 <= 1.0) {
    goto LABEL_30;
  }
  BOOL v11 = [(UIKeyboardLayout *)self isFloating];

  if (v11) {
    goto LABEL_23;
  }
  return 0;
}

- (void)_swapGlobeAndMoreKeysIfNecessary
{
  v28[1] = *MEMORY[0x1E4F143B8];
  if ([(UIKeyboardLayoutStar *)self _shouldSwapGlobeAndMore])
  {
    uint64_t v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"More-Key"];
    id v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"International-Key"];
    [v3 frame];
    double v6 = v5;
    [v4 frame];
    if (vabdd_f64(v6, v7) < 0.00000011920929)
    {
      int v8 = [v3 shape];
      id v9 = (void *)[v8 copy];

      double v10 = [v4 shape];
      BOOL v11 = (void *)[v10 copy];

      if ([(UIKBScreenTraits *)self->super._screenTraits isSplit])
      {
        uint64_t v12 = [(UIKBScreenTraits *)self->super._screenTraits screen];
        [v12 scale];
        uint64_t v13 = +[UIKBShapeOperator operatorWithScale:](UIKBShapeOperator, "operatorWithScale:");

        [v11 frame];
        double v15 = v14;
        double v16 = v14 * 0.5;
        v28[0] = v11;
        char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
        double v18 = -(v15 * 0.5);
        uint64_t v19 = objc_msgSend(v13, "shapesByRepositioningShapes:withOffset:", v17, v18, 0.0);
        uint64_t v20 = [v19 firstObject];

        long long v27 = v20;
        uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
        long long v22 = objc_msgSend(v13, "shapesByResizingShapes:withOffset:", v21, v16, 0.0);
        BOOL v11 = [v22 firstObject];

        long long v26 = v9;
        long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
        long long v24 = objc_msgSend(v13, "shapesByResizingShapes:withOffset:", v23, v18, 0.0);
        uint64_t v25 = [v24 firstObject];

        id v9 = (void *)v25;
      }
      [v3 setShape:v11];
      [v4 setShape:v9];
    }
  }
}

- (void)_updateSupplementaryKeys
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (![(UIKeyboardLayoutStar *)self _shouldAttemptToAddSupplementaryControlKeys])
  {
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 3) {
      return;
    }
    double v15 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    double v16 = +[UIKBPhoneToCarPlayTransformation cachedKeysForTransformationContext:v15];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v16;
    uint64_t v17 = [v4 countByEnumeratingWithState:&v21 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v4);
          }
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2, *(void *)(*((void *)&v21 + 1) + 8 * i), (void)v21);
        }
        uint64_t v18 = [v4 countByEnumeratingWithState:&v21 objects:v33 count:16];
      }
      while (v18);
    }
    goto LABEL_26;
  }
  uint64_t v3 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
  id v4 = +[UIKeyboardSupplementaryControlKeyTransformation cachedControlKeySetsForTransformationContext:v3];

  if (v4)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = v4;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v6; ++j)
        {
          if (*(void *)v30 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          double v10 = [v9 subtrees];
          uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v26;
            do
            {
              for (uint64_t k = 0; k != v12; ++k)
              {
                if (*(void *)v26 != v13) {
                  objc_enumerationMutation(v10);
                }
                [(UIKeyboardLayoutStar *)self setState:2 forKey:*(void *)(*((void *)&v25 + 1) + 8 * k)];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v34 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v6);
    }
LABEL_26:
  }
}

- (BOOL)_shouldAttemptToAddSupplementaryControlKeys
{
  if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 127) {
    return 0;
  }
  if (self->_layoutSupportsCrescendo) {
    return 0;
  }
  BOOL v4 = +[UIDevice _hasHomeButton];
  if (UIKeyboardComputeKeyboardIdiomFromScreenTraits(self->super._screenTraits, [(UIKBScreenTraits *)self->super._screenTraits idiom], 0) != 24)return 0; {
  if (v4)
  }
    return 0;
  BOOL v5 = [(UIKeyboardLayoutStar *)self isEmojiKeyplane];
  uint64_t v6 = [(UIKBTree *)self->_keyboard name];
  char v7 = [v6 _containsSubstring:@"Kana"];

  unint64_t v8 = [(UIKBTree *)self->_keyplane numberOfRows];
  BOOL v9 = [(UIKeyboardLayoutStar *)self isHandwritingPlane];
  if ([(UIKBTree *)self->_keyboard isFloating]
    || (v7 & 1) != 0
    || v5
    || !v9 && (v8 & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    return 0;
  }
  double v10 = UIKeyboardGetCurrentInputMode();
  uint64_t v11 = UIKeyboardGetDerivedKeyboard(v10, self->super._screenTraits, [(UITextInputTraits *)self->super._inputTraits keyboardType]);

  LOBYTE(v10) = [v11 addsSupplementaryControlKeys];
  return (char)v10;
}

- (id)_currentKeyplaneTransformationContext
{
  uint64_t v3 = objc_alloc_init(UIKBKeyplaneTransformationContext);
  BOOL v4 = [(UIKeyboardLayoutStar *)self keyplaneName];
  [(UIKBKeyplaneTransformationContext *)v3 setCurrentKeyplaneName:v4];

  [(UIKBKeyplaneTransformationContext *)v3 setScreenTraits:self->super._screenTraits];
  BOOL v5 = [(UIKeyboardLayoutStar *)self inputModeToMergeCapsLockKey];
  [(UIKBKeyplaneTransformationContext *)v3 setUsesScriptSwitch:v5 != 0];

  [(UIKBKeyplaneTransformationContext *)v3 setActiveKeyboard:self->_keyboard];
  [(UIKBKeyplaneTransformationContext *)v3 setActiveKeyplane:self->_keyplane];
  if (+[UIKeyboard resizable])
  {
    uint64_t v6 = [(UIView *)self superview];
    [v6 bounds];
    -[UIKBKeyplaneTransformationContext setKeyboardSize:](v3, "setKeyboardSize:", v7, v8);
  }
  else
  {
    [(UIKeyboardLayoutStar *)self sizeForKeyplane:self->_keyplane];
    -[UIKBKeyplaneTransformationContext setKeyboardSize:](v3, "setKeyboardSize:");
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits resizeKeyboardHeight]) {
    [(UIKBScreenTraits *)self->super._screenTraits keyboardHeightAdjustment];
  }
  else {
    [(UIKBResizingKeyplaneCoordinator *)self->_resizingKeyplaneCoordinator resizingOffset];
  }
  -[UIKBKeyplaneTransformationContext setResizingOffset:](v3, "setResizingOffset:");
  return v3;
}

- (void)_addExtraControlKeysIfNecessary
{
  if ([(UIKeyboardLayoutStar *)self _shouldAttemptToAddSupplementaryControlKeys])
  {
    keyplane = self->_keyplane;
    BOOL v4 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    BOOL v5 = +[UIKeyboardSupplementaryControlKeyTransformation transformKeyplane:keyplane withTransformationContext:v4];
    uint64_t v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    id v8 = +[UIKeyboardSupplementaryControlKeyTransformation transformationIdentifier];
    [(NSMutableSet *)keyplaneTransformations addObject:v8];
  }
}

- (void)_addResizeTransformationsIfNecessary
{
  if ([(UIKeyboardLayoutStar *)self keyplaneUsesResizingOffset])
  {
    keyplane = self->_keyplane;
    BOOL v4 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    BOOL v5 = +[UIKBResizingOffsetKeyplaneTransformation transformKeyplane:keyplane withTransformationContext:v4];
    uint64_t v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    id v8 = UIKBResizingOffsetKeyplaneTransformation;
  }
  else
  {
    if (!+[UIKeyboard resizable]
      && !_UIApplicationIsStickerPickerService())
    {
      goto LABEL_7;
    }
    BOOL v9 = self->_keyplane;
    double v10 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    uint64_t v11 = +[UIKBResizableKeyplaneTransformation transformKeyplane:v9 withTransformationContext:v10];
    uint64_t v12 = self->_keyplane;
    self->_keyplane = v11;

    keyplaneTransformations = self->_keyplaneTransformations;
    id v8 = UIKBResizableKeyplaneTransformation;
  }
  uint64_t v13 = [(__objc2_class *)v8 transformationIdentifier];
  [(NSMutableSet *)keyplaneTransformations addObject:v13];

LABEL_7:
  if ([(UIKeyboardLayoutStar *)self isEmojiKeyplane]
    && ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
     || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
     || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
     || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
     || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
    && ![(UIKeyboardLayout *)self isFloating]
    && +[UIKeyboard isRemoteEmojiCollectionViewEnabled])
  {
    double v14 = self->_keyplane;
    double v15 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    double v16 = +[UIKBRemoteEmojiKeyplaneTransformation transformKeyplane:v14 withTransformationContext:v15];
    uint64_t v17 = self->_keyplane;
    self->_keyplane = v16;

    uint64_t v18 = self->_keyplaneTransformations;
    id v19 = +[UIKBRemoteEmojiKeyplaneTransformation transformationIdentifier];
    [(NSMutableSet *)v18 addObject:v19];
  }
}

- (void)_transformFloatingKeyboardIfNecessary
{
  if ([(UIKeyboardLayout *)self isFloating])
  {
    keyplane = self->_keyplane;
    BOOL v4 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    BOOL v5 = +[UIKBFloatingKeyplaneTransformation transformKeyplane:keyplane withTransformationContext:v4];
    uint64_t v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    id v8 = +[UIKBFloatingKeyplaneTransformation transformationIdentifier];
    [(NSMutableSet *)keyplaneTransformations addObject:v8];
  }
}

- (void)_transformCarPlayIfNecessary
{
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3)
  {
    keyplane = self->_keyplane;
    BOOL v4 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
    BOOL v5 = +[UIKBPhoneToCarPlayTransformation transformKeyplane:keyplane withTransformationContext:v4];
    uint64_t v6 = self->_keyplane;
    self->_keyplane = v5;

    keyplaneTransformations = self->_keyplaneTransformations;
    id v8 = +[UIKBPhoneToCarPlayTransformation transformationIdentifier];
    [(NSMutableSet *)keyplaneTransformations addObject:v8];
  }
}

- (void)recenterMonolithKeyplaneSwitchKeys
{
  uint64_t v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Monolith-International-Key"];
  BOOL v4 = [(UIKeyboardLayoutStar *)self keylistContainingKey:v3];
  id v17 = [v4 subtrees];

  BOOL v5 = [v17 sortedArrayUsingComparator:&__block_literal_global_949];
  keyplane = self->_keyplane;
  [(UIView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(UIKBScreenTraits *)self->super._screenTraits screen];
  [v15 scale];
  -[UIKBTree centerKeys:inRect:scale:](keyplane, "centerKeys:inRect:scale:", v5, v8, v10, v12, v14, v16);
}

uint64_t __58__UIKeyboardLayoutStar_recenterMonolithKeyplaneSwitchKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  if (v6 - v8 < 0.0) {
    return -1;
  }
  else {
    return v6 - v8 > 0.0;
  }
}

- (void)updateMoreAndInternationalKeys
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v3 = +[UIKeyboardImpl canShowInternationalKey];
  if (v3)
  {
    if ([(UITextInputTraits *)self->super._inputTraits isSecureTextEntry]) {
      LOBYTE(v3) = UIKeyboardHasMultipleActiveSecureInputModes();
    }
    else {
      LOBYTE(v3) = (unint64_t)[(id)UIKeyboardActiveUserSelectableInputModes count] > 1;
    }
  }
  self->_showIntlKedouble y = v3;
  self->_showDictationKedouble y = [(UIKeyboardLayoutStar *)self shouldShowDictationKey];
  id v4 = [(UIKBTree *)self->_keyplane keysForMergeConditions];
  if (v4)
  {
    double v5 = [MEMORY[0x1E4F1CA80] set];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v42 != v9) {
            objc_enumerationMutation(v6);
          }
          double v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          [v11 setVisible:1];
          if ([(UIKeyboardLayoutStar *)self shouldMergeKey:v11])
          {
            double v12 = [v11 name];
            [v5 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v41 objects:v47 count:16];
      }
      while (v8);
    }

    double v13 = [(UIKBTree *)self->_keyplane mergeKeyNames:v5 inRightToLeft:0];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v38 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:*(void *)(*((void *)&v37 + 1) + 8 * j)];
          [v18 setVisible:0];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v15);
    }
    id v19 = [v5 objectsPassingTest:&__block_literal_global_952];
    if ([v19 count] == 2)
    {
      long long v32 = v4;
      uint64_t v20 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"More-Key"];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v34;
        do
        {
          for (uint64_t k = 0; k != v22; ++k)
          {
            if (*(void *)v34 != v23) {
              objc_enumerationMutation(v20);
            }
            [*(id *)(*((void *)&v33 + 1) + 8 * k) setObject:&unk_1ED3F4B60 forProperty:@"More-Key-Merged"];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v22);
      }

      id v4 = v32;
    }
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 2)
    {
      BOOL v25 = [(UIKBScreenTraits *)self->super._screenTraits isLinear];
      [(UIKeyboardLayoutStar *)self recenterMonolithKeyplaneSwitchKeys];
      if (v25)
      {
        if (+[UIKeyboardCache enabled])
        {
          long long v26 = +[UIKeyboardCache sharedInstance];
          [v26 purge];
        }
      }
    }

    goto LABEL_42;
  }
  showIntlKedouble y = self->_showIntlKey;
  showDictationKedouble y = self->_showDictationKey;
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26)
  {
    int v29 = 4;
  }
  else
  {
    int v29 = 4 * ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 23);
  }
  double v5 = [(UIKBTree *)self->_keyboard name];
  if ([v5 _containsSubstring:@"LandscapeChoco"])
  {
LABEL_42:

    goto LABEL_43;
  }
  long long v30 = [(UIKBTree *)self->_keyboard name];
  char v31 = [v30 _containsSubstring:@"LandscapeTruffle"];

  if ((v31 & 1) == 0) {
    [(UIKBTree *)self->_keyplane updateMoreAndInternationalKeysWithOptions:showIntlKey | (2 * showDictationKey) | v29];
  }
LABEL_43:
}

uint64_t __54__UIKeyboardLayoutStar_updateMoreAndInternationalKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isEqualToString:@"International-Key"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"Dictation-Key"];
  }

  return v3;
}

- (void)updateReturnKeysIfNeeded
{
  id v6 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Return-Key"];
  if ((unint64_t)[v6 count] >= 2)
  {
    keyplane = self->_keyplane;
    id v4 = [v6 objectAtIndex:0];
    double v5 = [v6 objectAtIndex:1];
    [(UIKBTree *)keyplane mergeReturnKey:v4 withReturnKey:v5];
  }
}

- (void)transitionToModalContinuousPathKeyplane
{
  if (self->_showsPunctuationKeysOnPrimaryKeyplane)
  {
    keyplaneTransformations = self->_keyplaneTransformations;
    id v4 = +[UIKBContinuousPathModalKeysTransformation transformationIdentifier];
    LOBYTE(keyplaneTransformations) = [(NSMutableSet *)keyplaneTransformations containsObject:v4];

    if ((keyplaneTransformations & 1) == 0)
    {
      keyplane = self->_keyplane;
      id v6 = [(UIKeyboardLayoutStar *)self _currentKeyplaneTransformationContext];
      uint64_t v7 = +[UIKBContinuousPathModalKeysTransformation transformKeyplane:keyplane withTransformationContext:v6];
      uint64_t v8 = self->_keyplane;
      self->_keyplane = v7;

      uint64_t v9 = self->_keyplaneTransformations;
      id v10 = +[UIKBContinuousPathModalKeysTransformation transformationIdentifier];
      [(NSMutableSet *)v9 addObject:v10];
    }
  }
}

- (void)relayoutForWriteboardKey
{
  BOOL v3 = (unint64_t)([(UIKeyboardLayout *)self orientation] - 3) >= 2
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23
    || [(UIKeyboardLayout *)self isFloating]
    || [(UIKeyboardLayoutStar *)self useDismissForMessagesWriteboard]
    || [(UIKeyboardLayoutStar *)self useUndoForMessagesWriteboard]
    || [(UIKeyboardLayoutStar *)self ignoreWriteboard];
  BOOL v4 = [(UIKeyboardLayoutStar *)self canAddRomanSwitchKey];
  int v5 = [(UITextInputTraits *)self->super._inputTraits keyboardType] == 126 || v4;
  if (v5 == 1
    && !v3
    && ![(UIKBTree *)self->_keyplane addMessagesWriteboardKeyOrRomanSwitch:!v4])
  {
    id v7 = [(UIKBTree *)self->_keyboard name];
    id v6 = [(UIKBTree *)self->_keyplane name];
    NSLog(&cfstr_CanNotAddWrite.isa, v7, v6);
  }
}

- (BOOL)canAddRomanSwitchKey
{
  if ([(NSString *)self->_keyboardName containsString:@"Kana"]
    || ([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) != 0x18
    && ([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) != 0x17
    || [(UIKeyboardLayout *)self isFloating])
  {
    return 0;
  }
  int v5 = [(UIKeyboardLayoutStar *)self inputModeToMergeCapsLockKey];
  if (v5)
  {
    id v6 = [(UIKBTree *)self->_keyplane scriptSwitchKey];
    if (v6)
    {
      BOOL v3 = 0;
    }
    else
    {
      id v7 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Tab-Key"];
      BOOL v3 = v7 == 0;
    }
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)inputModeToMergeCapsLockKey
{
  BOOL v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [v3 inputModeForASCIIToggleWithTraits:self->super._inputTraits];

  return v4;
}

- (BOOL)shouldMergeKey:(id)a3
{
  id v4 = a3;
  int v5 = [v4 interactionType];
  LOBYTE(v6) = 0;
  if (v5 > 37)
  {
    if (v5 == 38)
    {
      uint64_t v9 = [(UIKeyboardLayoutStar *)self inputModeToMergeCapsLockKey];
      LOBYTE(v6) = v9 != 0;

      goto LABEL_19;
    }
    if (v5 == 42)
    {
      LOBYTE(v6) = +[UIKeyboard isRemoteEmojiCollectionViewEnabled];
      goto LABEL_19;
    }
    if (v5 != 44) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (v5 == 5)
  {
LABEL_10:
    if (self->_externalDictationAndInternationalKeys)
    {
      LOBYTE(v6) = 1;
      goto LABEL_19;
    }
    BOOL v10 = [(UIKeyboardLayoutStar *)self shouldShowDictationKey];
LABEL_18:
    LOBYTE(v6) = !v10;
    goto LABEL_19;
  }
  if (v5 == 9)
  {
    id v7 = [v4 representedString];
    if ([v7 isEqualToString:@"ASCIICapable"])
    {
      int v8 = 1;
    }
    else
    {
      double v11 = [v4 representedString];
      int v8 = [v11 isEqualToString:@"NonASCII"];
    }
    if (self->_externalDictationAndInternationalKeys)
    {
      BOOL v10 = [(UIKeyboardLayoutStar *)self showsDedicatedEmojiKeyAlongsideGlobeButton];
      goto LABEL_18;
    }
    if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 122) {
      int v13 = v8;
    }
    else {
      int v13 = 1;
    }
    if (v13 == 1)
    {
      uint64_t v14 = +[UIKeyboardInputModeController sharedInputModeController];
      uint64_t v15 = [v14 normalizedEnabledInputModeIdentifiers];

      int v16 = [v15 containsObject:@"emoji"];
      if ([v15 count] == 2) {
        int v17 = v16;
      }
      else {
        int v17 = 0;
      }
      int64_t v18 = [(UITextInputTraits *)self->super._inputTraits keyboardType];
      int64_t v19 = v18;
      if (v17 == 1 && v18 == 122
        || (int64_t v20 = [(UITextInputTraits *)self->super._inputTraits keyboardType], (v8 & 1) == 0)
        && (int64_t v27 = v20, [(UIKeyboardLayoutStar *)self globeKeyDisplaysAsEmojiKey])
        && v27 == 13)
      {
        LOBYTE(v6) = 1;
      }
      else
      {
        int64_t v31 = v19;
        uint64_t v21 = +[UIKeyboardInputModeController sharedInputModeController];
        uint64_t v22 = [v4 representedString];
        int v23 = [v21 identifierIsValidSystemInputMode:v22];

        if (v23)
        {
          long long v24 = [v4 representedString];
          BOOL v25 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v24];

          long long v26 = [v4 representedString];
          LODWORD(v24) = [v26 containsString:@"emoji"];

          if (v24)
          {
            if ((v17 | v16 ^ 1))
            {
              LOBYTE(v6) = 1;
            }
            else
            {
              BOOL v30 = [(UITextInputTraits *)self->super._inputTraits isSecureTextEntry];
              LOBYTE(v6) = v31 == 122 || v30;
            }
          }
          else
          {
            long long v28 = +[UIKeyboardInputModeController sharedInputModeController];
            int v29 = [v28 activeInputModes];
            LOBYTE(v6) = [v29 containsObject:v25];
          }
        }
        else if (v8)
        {
          BOOL v25 = [(UIKeyboardLayoutStar *)self inputModeToMergeCapsLockKey];
          LOBYTE(v6) = v25 == 0;
        }
        else
        {
          BOOL v25 = +[UIKeyboardImpl activeInstance];
          int v6 = [v25 shouldShowInternationalKey] ^ 1;
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
LABEL_19:

  return v6;
}

- (void)refreshForDictationAvailablityDidChange
{
  if ([(UIKeyboardLayoutStar *)self shouldShowDictationKey])
  {
    id v6 = +[UIKeyboardImpl activeInstance];
    if (([v6 isDictationPopoverPresented] & 1) == 0)
    {
      BOOL v3 = +[UIKeyboardImpl activeInstance];
      id v4 = [v3 inputDelegate];

      if (!v4) {
        return;
      }
      uint64_t v5 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Dictation-Key"];
      if (!v5)
      {
        uint64_t v5 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"NumberPad-Dictation"];
        if (!v5) {
          return;
        }
      }
      id v6 = (id)v5;
      [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutStar *)self stateForDictationKey:v5] forKey:v5];
    }
  }
}

- (id)keyplaneFactory
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self useCrescendoLayout];
  id v4 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
  if (v3) {
    id v4 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
  }
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.isa + *v4) factory];
  return v5;
}

- (id)viewForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardLayoutStar *)self useCrescendoLayout];
  id v6 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
  if (v5) {
    id v6 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
  }
  id v7 = [*(id *)((char *)&self->super.super.super.super.isa + *v6) viewForKey:v4];

  return v7;
}

- (int)stateForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardLayoutStar *)self useCrescendoLayout];
  id v6 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
  if (v5) {
    id v6 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
  }
  int v7 = [*(id *)((char *)&self->super.super.super.super.isa + *v6) stateForKey:v4];

  return v7;
}

- (void)setState:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (v6)
  {
    id v10 = v6;
    if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
    {
      uint64_t v7 = [v10 state];
      [(TUIKeyplaneView *)self->_liveKeyplaneView setState:v4 forKey:v10];
      int v8 = [(UIKeyboardLayoutStar *)self viewForKey:v10];
      if ([v10 displayTypeHint] == 10)
      {
        uint64_t v9 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
        [v9 transitionKeyView:v8 fromState:v7 toState:v4 completion:0];
      }
    }
    else
    {
      [(UIKBKeyplaneView *)self->_keyplaneView setState:v4 forKey:v10];
    }
    id v6 = v10;
  }
}

- (void)updateState:(int)a3 forKey:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  [(UIKeyboardLayoutStar *)self setActiveKey:v6];
  [(UIKeyboardLayoutStar *)self setState:v4 forKey:v6];
}

- (id)keyViewAnimator
{
  keyViewAnimator = self->_keyViewAnimator;
  if (!keyViewAnimator)
  {
    BOOL v4 = [(UIKeyboardLayoutStar *)self isDeveloperGestureKeybaord];
    BOOL v5 = off_1E52D3C90;
    if (!v4) {
      BOOL v5 = off_1E52D3C88;
    }
    id v6 = (UIKBKeyViewAnimator *)objc_alloc_init(*v5);
    uint64_t v7 = self->_keyViewAnimator;
    self->_keyViewAnimator = v6;

    keyViewAnimator = self->_keyViewAnimator;
  }
  return keyViewAnimator;
}

- (UIKeyboardEmojiKeyDisplayController)emojiKeyManager
{
  emojiKeyManager = self->_emojiKeyManager;
  if (!emojiKeyManager)
  {
    BOOL v4 = objc_alloc_init(UIKeyboardEmojiKeyDisplayController);
    BOOL v5 = self->_emojiKeyManager;
    self->_emojiKeyManager = v4;

    emojiKeyManager = self->_emojiKeyManager;
  }
  return emojiKeyManager;
}

- (id)cacheIdentifierForKeyplaneNamed:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardLayoutStar *)self showsInternationalKey];
  LODWORD(self) = [(UIKeyboardLayoutStar *)self showsDictationKey];
  id v6 = [MEMORY[0x1E4F1CA20] preferredLocale];
  uint64_t v7 = [v6 localeIdentifier];
  int v8 = [v4 stringByAppendingFormat:@"-%d-%d-%@", v5, self, v7];

  return v8;
}

- (id)cacheTokenForKeyplane:(id)a3 caseAlternates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v6)
  {
    int v16 = 0;
    goto LABEL_16;
  }
  keyboard = self->_keyboard;
  uint64_t v9 = [v6 name];
  id v10 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:v9];
  double v11 = [(UIKBTree *)keyboard subtreeWithName:v10];

  if (v11)
  {
    double v12 = [v7 name];
    int v13 = [v11 name];
    char v14 = [v12 hasPrefix:v13];

    if (v14)
    {
      if (v4)
      {
        if (([v11 looksLikeShiftAlternate] & 1) == 0) {
          goto LABEL_12;
        }
      }
      else if (![v11 looksExactlyLikeShiftAlternate])
      {
LABEL_12:
        uint64_t v15 = v11;
        goto LABEL_13;
      }
      if ([v11 isShiftKeyplane])
      {
        uint64_t v17 = [v11 visualStyle];
        int64_t v18 = self->_keyboard;
        int64_t v19 = [v11 shiftAlternateKeyplaneName];
        int64_t v20 = [(UIKBTree *)v18 subtreeWithName:v19];

        [v20 setVisualStyle:v17];
        double v11 = v20;
      }
      goto LABEL_12;
    }
  }
  uint64_t v15 = v7;
LABEL_13:
  int v16 = +[UIKBCacheToken tokenForKeyplane:v15];
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3)
  {
    [(UIView *)self contentScaleFactor];
    objc_msgSend(v16, "setScale:");
  }

LABEL_16:
  return v16;
}

- (void)updateCachedKeyplaneKeycaps
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->_allKeyplaneKeycaps removeAllObjects];
  int v16 = [MEMORY[0x1E4F1CA20] preferredLocale];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v3 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v9 = [v8 displayString];
        if (v9)
        {
          id v10 = (void *)v9;
          int v11 = [v8 interactionType];

          if (v11 != 10)
          {
            BOOL v12 = +[UIKeyboardLayout _showSmallDisplayKeyplane];
            int v13 = [v8 displayString];
            char v14 = v13;
            if (!v12)
            {
              uint64_t v15 = [v13 uppercaseStringWithLocale:v16];

              char v14 = (void *)v15;
            }
            [(NSMutableSet *)self->_allKeyplaneKeycaps addObject:v14];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
}

- (BOOL)_shouldInheritScreenScaleAsContentScaleFactor
{
  return 1;
}

- (void)showKeyboardWithInputMode:(id)a3 renderConfig:(id)a4 inputTraits:(id)a5 screenTraits:(id)a6 splitTraits:(id)a7
{
}

- (void)showKeyboardWithInputMode:(id)a3 renderConfig:(id)a4 inputTraits:(id)a5 screenTraits:(id)a6 splitTraits:(id)a7 reload:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (self->_isTrackpadMode) {
    [(UIKeyboardLayoutStar *)self didEndIndirectSelectionGesture:0];
  }
  [(UIKeyboardLayoutStar *)self cleanupPreviousKeyboardWithNewInputTraits:v16];
  inputTraits = self->super._inputTraits;
  if (inputTraits) {
    BOOL v20 = ![(UITextInputTraits *)inputTraits publicTraitsMatchTraits:v16];
  }
  else {
    BOOL v20 = 0;
  }
  self->_inputTraitsPreventInitialReuse = v20;
  v33.receiver = self;
  v33.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v33 showKeyboardWithInputTraits:v16 screenTraits:v17 splitTraits:v18];
  if (!v14)
  {
    UIKeyboardGetCurrentInputMode();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v21 = +[UIKeyboardImpl activeInstance];
  int v22 = [v21 allowsReachableKeyboard];

  if (v22)
  {
    [v17 idiom];
    [v17 orientation];
    int v23 = +[UIKeyboardPreferencesController sharedPreferencesController];
    long long v24 = [v23 preferencesActions];
    self->_currentHandBias = [v24 handBias];
  }
  BOOL v25 = UIKeyboardGetKBStarName(v14, v17, [v16 keyboardType], 0);
  -[UIKeyboardLayoutStar setKeyboardName:appearance:](self, "setKeyboardName:appearance:", v25, [v16 keyboardAppearance]);
  if (self->_keyboard)
  {
    [(UIKeyboardLayoutStar *)self stretchFactor];
    -[UIKBScreenTraits setStretchFactor:](self->super._screenTraits, "setStretchFactor:");
    if (!v15)
    {
      long long v26 = [(UIView *)self _inheritedRenderConfig];
      int64_t v27 = v26;
      if (v26)
      {
        id v28 = v26;
      }
      else
      {
        id v28 = +[UIKBRenderConfig defaultConfig];
      }
      id v15 = v28;
    }
    -[UIKeyboardLayoutStar setRenderConfig:updateKeyplane:](self, "setRenderConfig:updateKeyplane:", v15, 0, v15);
    int v29 = +[UIKeyboardImpl activeInstance];
    self->_shift = [v29 isShifted];

    BOOL v30 = +[UIKeyboardImpl activeInstance];
    self->_autoshift = [v30 isAutoShifted];

    [(UIKeyboardLayoutStar *)self setLayoutTag:@"Default"];
    if (v8) {
      [(UIKeyboardLayoutStar *)self setKeyboardName:0];
    }
    [(UIKeyboardLayoutStar *)self setToInitialKeyplane];
    if ([(UIKeyboardLayoutStar *)self shouldUseDefaultShiftStateFromLayout])
    {
      self->_shift = [(UIKBTree *)self->_keyplane isShiftKeyplane];
      self->_autoshift = 0;
    }
    [(UIKeyboardLayout *)self reloadKeyboardGestureRecognition];
    id v15 = v32;
    if (+[UIKeyboardImpl rivenPreference]) {
      BOOL v31 = [(UIKeyboardLayoutStar *)self pinchSplitGestureEnabled];
    }
    else {
      BOOL v31 = 0;
    }
    [(UIGestureRecognizer *)self->_pinchGestureRecognizer setEnabled:v31];
  }
}

- (void)reloadKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
}

- (void)showKeyboardWithInputTraits:(id)a3 screenTraits:(id)a4 splitTraits:(id)a5
{
}

- (void)setToInitialKeyplane
{
  id v4 = [(UIKBTree *)self->_keyboard name];
  BOOL v3 = [(UIKeyboardLayoutStar *)self initialKeyplaneNameWithKBStarName:v4];
  [(UIKeyboardLayoutStar *)self setKeyplaneName:v3];
}

- (BOOL)shouldUseDefaultShiftStateFromLayout
{
  return 0;
}

- (id)initialKeyplaneNameWithKBStarName:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v25 = a3;
  id v4 = [(UIKBTree *)self->_keyboard subtrees];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_21;
  }
  uint64_t v6 = v5;
  uint64_t v7 = 0;
  uint64_t v8 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v4);
      }
      if (!v7)
      {
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "supportsType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType")))
        {
          uint64_t v7 = [v10 name];
          BOOL shift = self->_shift;
          int v12 = [v10 BOOLForProperty:@"autoshift"];
          if (shift) {
            int v13 = v12;
          }
          else {
            int v13 = 0;
          }
          if (v13 != [v10 isShiftKeyplane])
          {
            id v14 = [v10 firstCachedKeyWithName:@"Emoji-International-Key"];
            if (!v14)
            {
              if ([(UIKeyboardLayoutStar *)self shouldUseDefaultShiftStateFromLayout])
              {
                continue;
              }
              uint64_t v15 = [v10 shiftAlternateKeyplaneName];
              id v14 = v7;
              uint64_t v7 = (void *)v15;
            }
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v6);
LABEL_21:

  preRotateKeyplaneName = self->_preRotateKeyplaneName;
  if (preRotateKeyplaneName)
  {
    id v17 = preRotateKeyplaneName;
    id v18 = [(UIKBTree *)self->_keyboard subtreeWithName:v17];

    if (!v18)
    {
      uint64_t v19 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:self->_preRotateKeyplaneName];

      id v17 = (NSString *)v19;
    }
    BOOL v20 = [(UIKBTree *)self->_keyboard subtreeWithName:v17];

    if (v20)
    {
      if (v17 && v17 != self->_preRotateKeyplaneName)
      {
        BOOL v20 = v17;

        id v17 = self->_preRotateKeyplaneName;
        self->_preRotateKeyplaneName = 0;
        uint64_t v7 = v20;
        goto LABEL_28;
      }
    }
    else
    {
LABEL_28:

      id v17 = v20;
    }
    uint64_t v21 = v25;

    if (!v7)
    {
LABEL_30:
      int v22 = [(UIKBTree *)self->_keyboard subtrees];
      int v23 = [v22 objectAtIndex:0];
      uint64_t v7 = [v23 name];

      NSLog(&cfstr_CanTFindKeypla.isa, [(UITextInputTraits *)self->super._inputTraits keyboardType], v21, v7);
    }
  }
  else
  {
    uint64_t v21 = v25;
    if (!v7) {
      goto LABEL_30;
    }
  }

  return v7;
}

- (void)cleanupPreviousKeyboardWithNewInputTraits:(id)a3
{
  id v5 = a3;
  keyViewAnimator = self->_keyViewAnimator;
  self->_keyViewAnimator = 0;

  if ([(UIKeyboardLayoutStar *)self isEmojiKeyplane]) {
    +[UIKeyboardEmojiKeyDisplayController writeEmojiDefaultsAndReleaseActiveInputView];
  }
  if ([(UIKeyboardLayoutStar *)self isDeveloperGestureKeybaord]
    && [v5 keyboardType] != 12)
  {
    [(UIKeyboardLayoutStar *)self clearKeyAnnotationsIfNecessary];
  }
}

- (void)deactivateActiveKeysClearingTouchInfo:(BOOL)a3 clearingDimming:(BOOL)a4
{
  if (!self->_suppressDeactivateKeys)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    if (self->_liveKeyplaneView)
    {
      uint64_t v7 = +[UIKeyboardImpl activeInstance];
      [v7 clearLongPressTimer];

      [(TUIKeyplaneView *)self->_liveKeyplaneView deactivateKeys];
    }
    [(UIKBKeyplaneView *)self->_keyplaneView deactivateKeys];
    if (v5)
    {
      [(UIKeyboardLayoutStar *)self clearAllTouchInfo];
      [(UIKeyboardLayoutStar *)self handleDismissFlickView:0];
      id touchInfo = self->_touchInfo;
      self->_id touchInfo = 0;

      uint64_t v9 = +[UIKeyboardImpl activeInstance];
      [v9 stopAutoDelete];

      [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:0];
    }
    [(UIKeyboardLayoutStar *)self setActiveKey:0];
    if (v4)
    {
      if (!self->_isTrackpadMode) {
        [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
      }
      id v10 = +[UIKeyboardSplitControlMenu activeInstance];
      [v10 hide];

      id v11 = +[UIKeyboardDictationMenu activeInstance];
      [v11 hide];
    }
  }
}

- (void)deactivateActiveKeys
{
  [(UIKeyboardLayoutStar *)self deactivateActiveKeysClearingTouchInfo:1 clearingDimming:1];
  BOOL v3 = [(UIKeyboardLayoutStar *)self slideBehaviour];
  [v3 deactivate];

  [(UIKeyboardLayoutStar *)self setSlideBehaviour:0];
  if (self->_lastInputIsGestureKey)
  {
    +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount];
    self->_lastInputIsGestureKedouble y = 0;
  }
  if (self->_isTrackpadMode) {
    [(UIKeyboardLayoutStar *)self didEndIndirectSelectionGesture:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v4 deactivateActiveKeys];
}

- (void)deactivateActiveKey
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self activeKey];

  if (v3)
  {
    objc_super v4 = [(UIKeyboardLayoutStar *)self activeKey];
    [(UIKeyboardLayoutStar *)self setState:2 forKey:v4];

    [(UIKeyboardLayoutStar *)self setActiveKey:0];
  }
}

- (BOOL)isTrackpadMode
{
  return self->_isTrackpadMode;
}

- (void)prepareSliderBehaviorFeedback
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self slideBehaviour];

  if (!v3)
  {
    objc_super v4 = objc_alloc_init(UISelectionFeedbackGenerator);
    [(UIKeyboardLayoutStar *)self setSlideBehaviour:v4];

    id v5 = [(UIKeyboardLayoutStar *)self slideBehaviour];
    [v5 userInteractionStarted];
  }
}

- (void)provideSliderBehaviorFeedback
{
  id v2 = [(UIKeyboardLayoutStar *)self slideBehaviour];
  [v2 selectionChanged];
}

- (void)finishSliderBehaviorFeedback
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self slideBehaviour];
  [v3 userInteractionEnded];

  [(UIKeyboardLayoutStar *)self setSlideBehaviour:0];
}

- (BOOL)shouldHitTestKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 visible]
    && (![v4 ghost] || self->_ghostKeysEnabled)
    && [v4 displayType] != 12;

  return v5;
}

- (id)keyViewHitTestForPoint:(CGPoint)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_liveKeyplaneView)
  {
    BOOL v3 = 0;
  }
  else
  {
    CGFloat y = a3.y;
    CGFloat x = a3.x;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v6 = [(UIKBKeyplaneView *)self->_keyplaneView activeKeyViews];
    BOOL v3 = (void *)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v3)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          [v9 variantFrame];
          CGFloat v11 = v10;
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          id v18 = [v9 key];
          if ([v18 state] == 16)
          {
            v29.origin.CGFloat x = v11;
            v29.origin.CGFloat y = v13;
            v29.size.double width = v15;
            v29.size.double height = v17;
            v28.CGFloat x = x;
            v28.CGFloat y = y;
            BOOL v19 = CGRectContainsPoint(v29, v28);

            if (v19)
            {
              BOOL v3 = [v9 key];
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        BOOL v3 = (void *)[v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v3);
    }
LABEL_14:
  }
  return v3;
}

- (id)keyHitTestContainingPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        CGFloat v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([(UIKeyboardLayoutStar *)self shouldHitTestKey:v11])
        {
          [v11 frame];
          v21.CGFloat x = x;
          v21.CGFloat y = y;
          if (CGRectContainsPoint(v22, v21))
          {
            id v12 = v11;
            goto LABEL_12;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_12:

  return v12;
}

- (id)keyHitTestClosestToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v7 = -[UIKeyboardLayoutStar keyHitTestClosestToPoint:inKeys:](self, "keyHitTestClosestToPoint:inKeys:", v6, x, y);

  return v7;
}

- (id)keyHitTestClosestToPoint:(CGPoint)a3 inKeys:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    uint64_t v8 = 0;
    goto LABEL_21;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v10)
  {

    uint64_t v8 = 0;
LABEL_18:
    if ([(UIKeyboardLayoutStar *)self shouldIgnoreDistantKey])
    {
      id v23 = 0;
LABEL_20:

      uint64_t v8 = v23;
    }
    goto LABEL_21;
  }
  uint64_t v11 = v10;
  uint64_t v8 = 0;
  uint64_t v12 = *(void *)v26;
  double v13 = 1.79769313e308;
  while (2)
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v26 != v12) {
        objc_enumerationMutation(v9);
      }
      long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if (-[UIKeyboardLayoutStar shouldHitTestKey:](self, "shouldHitTestKey:", v15, (void)v25))
      {
        [v15 frame];
        UIDistanceBetweenPointAndRect(x, y, v16, v17, v18, v19);
        double v21 = v20;
        if (fabs(v20) < 2.22044605e-16)
        {
          id v23 = v15;

          goto LABEL_20;
        }
        if (v20 < v13)
        {
          id v22 = v15;

          uint64_t v8 = v22;
          double v13 = v21;
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  if (v13 > 17.0) {
    goto LABEL_18;
  }
LABEL_21:

  return v8;
}

- (id)keyHitTestWithoutCharging:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (self->_inactiveLanguageIndicator
    && (-[UIKeyboardLayoutStar viewForKey:](self, "viewForKey:"),
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        [v6 frame],
        v11.double x = x,
        v11.double y = y,
        BOOL v7 = CGRectContainsPoint(v12, v11),
        v6,
        v7))
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
    if (!v8)
    {
      uint64_t v8 = -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:", x, y);
      if (!v8)
      {
        uint64_t v8 = -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", x, y);
      }
    }
  }
  return v8;
}

- (id)keyHitTest:(CGPoint)a3
{
  if (self->_keyboard && self->_keyplane)
  {
    double y = a3.y;
    double x = a3.x;
    BOOL v6 = -[UIKeyboardLayoutStar pointInside:withEvent:](self, "pointInside:withEvent:", 0);
    BOOL v7 = 0;
    if (v6)
    {
      BOOL v7 = -[UIKeyboardLayoutStar keyHitTestWithoutCharging:](self, "keyHitTestWithoutCharging:", x, y);
    }
  }
  else
  {
    BOOL v7 = 0;
  }
  return v7;
}

- (BOOL)isGeometricShiftOrMoreKeyForTouch:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIKeyboardImpl activeInstance];

  if (v5)
  {
    BOOL v6 = +[UIKeyboardImpl activeInstance];
    [v4 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    CGPoint v11 = -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v8, v10);
    LOBYTE(v5) = [v11 displayType] == 23
              || [v11 displayType] == 18;
  }
  return (char)v5;
}

- (BOOL)shouldPreventInputManagerHitTestingForKey:(id)a3
{
  return [a3 isExemptFromInputManagerHitTesting];
}

- (BOOL)shouldIgnoreDistantKey
{
  [(UIKBResizingKeyplaneCoordinator *)self->_resizingKeyplaneCoordinator resizingOffset];
  if (v3 > 0.0 && [(UIKeyboardLayoutStar *)self keyplaneUsesResizingOffset]) {
    return 1;
  }
  BOOL v5 = [(UIKBTree *)self->_keyplane name];
  char v6 = [v5 containsString:@"Korean10KeySplit-Keyboard"];

  return v6;
}

- (int)keycodeForKey:(id)a3
{
  keyplane = self->_keyplane;
  id v4 = a3;
  BOOL v5 = [(UIKBTree *)keyplane keys];
  int v6 = [v5 indexOfObject:v4];

  return v6;
}

- (id)unprocessedTouchEventsForTouchInfo:(id)a3 touchStage:(int)a4 forcedKeyCode:(int)a5
{
  id v7 = a3;
  double v8 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v9 = [v7 processedTouchCount];
  double v10 = [v7 touchHistory];
  unint64_t v11 = [v10 count];

  if (v9 < v11)
  {
    do
    {
      CGRect v12 = [v7 touchHistory];
      double v13 = [v12 objectAtIndexedSubscript:v9];

      if (v9)
      {
        if (a4 == 1
          || ([v7 touchHistory],
              long long v14 = objc_claimAutoreleasedReturnValue(),
              unint64_t v15 = [v14 count],
              v14,
              v9 + 1 < v15))
        {
          uint64_t v16 = 1;
        }
        else
        {
          uint64_t v16 = 2;
        }
      }
      else
      {
        uint64_t v16 = 0;
      }
      CGFloat v17 = (void *)MEMORY[0x1E4FAE3A8];
      [v13 locationInView:self];
      double v19 = v18;
      double v21 = v20;
      [v13 pathMajorRadius];
      double v23 = v22;
      [v13 timestamp];
      double v25 = v24;
      uint64_t v26 = [v13 pathIndex];
      uint64_t v27 = [v7 fingerID];
      unint64_t v28 = [v7 continuousPathState] - 1;
      if (v28 < 6) {
        uint64_t v29 = (v28 + 1);
      }
      else {
        uint64_t v29 = 0;
      }
      uint64_t v30 = objc_msgSend(v17, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", v16, v26, v27, a5, v29, v19, v21, v23, v25);
      [v8 addObject:v30];

      ++v9;
      uint64_t v31 = [v7 touchHistory];
      unint64_t v32 = [v31 count];
    }
    while (v9 < v32);
  }
  objc_super v33 = [v7 touchHistory];
  objc_msgSend(v7, "setProcessedTouchCount:", objc_msgSend(v33, "count"));

  return v8;
}

- (void)playKeyFeedbackIfNecessaryForTouchDownOnKey:(id)a3 touchInfo:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  int v7 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v8];
  if (![v6 didPlayKeyFeedback] && (v7 & 4) != 0 && (v7 & 0x40000000) == 0)
  {
    if (!_AXSZoomTouchEnabled())
    {
      if (+[UIKeyboardImpl rivenPreference]
        && [(UIKeyboardLayoutStar *)self playKeyClickSoundOn])
      {
        [(UIKeyboardLayoutStar *)self performSelector:sel_playKeyClickSoundOnDownForKey_ withObject:v8 afterDelay:0.05];
      }
      else
      {
        [(UIKeyboardLayoutStar *)self playKeyClickSoundOnDownForKey:v8];
      }
    }
    [v6 setDidPlayKeyFeedback:1];
  }
}

- (void)performHitTestForTouchInfo:(id)a3 touchStage:(int)a4 executionContextPassingUIKBTree:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v9 = a3;
  id v10 = a5;
  unint64_t v11 = v10;
  if (v9)
  {
    CGRect v12 = [v9 touch];
    [v12 locationInView:self];
    double v14 = v13;
    double v16 = v15;
    [v12 timestamp];
    double v18 = v17;
    double v19 = +[UIKeyboardImpl activeInstance];
    BOOL v20 = -[UIKeyboardLayoutStar pointInside:withEvent:](self, "pointInside:withEvent:", 0, v14, v16);
    double v21 = -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v14, v16);
    if (!v6) {
      [(UIKeyboardLayoutStar *)self playKeyFeedbackIfNecessaryForTouchDownOnKey:v21 touchInfo:v9];
    }
    if ([v19 canHandleKeyHitTest]) {
      int v22 = [v19 containsView:self];
    }
    else {
      int v22 = 0;
    }
    if ([(UIKeyboardLayoutStar *)self shouldPreventInputManagerHitTestingForKey:v21])
    {
      if ([v21 interactionType] == 5
        && CFAbsoluteTimeGetCurrent() - self->_prevTouchUpTime < 0.325)
      {
        [v21 frame];
        double v24 = -[UIKeyboardLayoutStar keyHitTest:](self, "keyHitTest:", v14 + v23, v16);
        if (![(UIKeyboardLayoutStar *)self shouldPreventInputManagerHitTestingForKey:v24])
        {
          id v25 = v24;

          double v21 = v25;
        }
      }
      else
      {
        if (self->_isTrackpadMode)
        {
          if (!v22) {
            goto LABEL_52;
          }
          goto LABEL_49;
        }
        if ([v21 interactionType] != 18)
        {
          long long v46 = [v21 parentKey];
          int v47 = [v46 interactionType];

          if (v47 == 18) {
            char v48 = 0;
          }
          else {
            char v48 = v22;
          }
          if ((v48 & 1) == 0) {
            goto LABEL_52;
          }
LABEL_49:
          if ([v21 isExemptFromInputManagerLayout])
          {
LABEL_52:
            [v11 returnExecutionToParentWithInfo:v21];
            goto LABEL_53;
          }
          [v9 setStage:v6];
          double v24 = [(UIKeyboardLayoutStar *)self unprocessedTouchEventsForTouchInfo:v9 touchStage:v6 forcedKeyCode:[(UIKeyboardLayoutStar *)self keycodeForKey:v21]];
          [v19 skipHitTestForTouchEvents:v24];
LABEL_51:

          goto LABEL_52;
        }
        double v24 = [(UIKeyboardLayoutStar *)self viewForKey:v21];
        [v24 frame];
        v55.double x = v14;
        v55.double y = v16;
        if (CGRectContainsPoint(v57, v55))
        {
          -[UIView convertPoint:toView:](self, "convertPoint:toView:", v24, v14, v16);
          uint64_t v36 = objc_msgSend(v24, "subTreeHitTest:");
          if (v36)
          {
            long long v37 = (void *)v36;

            double v21 = v37;
            goto LABEL_51;
          }
        }
      }

      if ((v22 & 1) == 0) {
        goto LABEL_52;
      }
      goto LABEL_49;
    }
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23
      || [(UIKBTree *)self->_keyplane usesKeyCharging]
      || ([v21 frame],
          v56.origin.double x = v26 + -20.0,
          v56.size.double width = v27 + 40.0,
          v56.origin.double y = v28 + -20.0,
          v56.size.double height = v29 + 40.0,
          v54.double x = v14,
          v54.double y = v16,
          CGRectContainsPoint(v56, v54)))
    {
      if (!v22) {
        goto LABEL_52;
      }
      uint64_t v30 = [v9 continuousPathState];
      if (v30 == 4) {
        uint64_t v31 = 4294967294;
      }
      else {
        uint64_t v31 = 0xFFFFFFFFLL;
      }
      int v32 = v30 == 4 || v20;
      if (v32 == 1)
      {
        objc_super v33 = [(UIKeyboardLayoutStar *)self unprocessedTouchEventsForTouchInfo:v9 touchStage:v6 forcedKeyCode:v31];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __94__UIKeyboardLayoutStar_performHitTestForTouchInfo_touchStage_executionContextPassingUIKBTree___block_invoke;
        v49[3] = &unk_1E52FA5A8;
        SEL v52 = a2;
        v49[4] = self;
        id v50 = v9;
        int v53 = v6;
        id v34 = v19;
        id v51 = v34;
        long long v35 = [v11 childWithContinuation:v49];
        [v34 performHitTestForTouchEvents:v33 executionContextPassingNSNumber:v35];

LABEL_53:
        goto LABEL_54;
      }
      if (v6 == 1)
      {
        [v9 setStage:3];
        [(UIKeyboardLayoutStar *)self _transitionToContinuousPathState:6 forTouchInfo:v9];
        long long v38 = (void *)MEMORY[0x1E4FAE3A8];
        [v12 pathMajorRadius];
        double v40 = v39;
        uint64_t v41 = [v12 pathIndex];
        uint64_t v42 = [v9 fingerID];
        unint64_t v43 = [v9 continuousPathState] - 1;
        if (v43 < 6) {
          uint64_t v44 = (v43 + 1);
        }
        else {
          uint64_t v44 = 0;
        }
        uint64_t v45 = objc_msgSend(v38, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 3, v41, v42, (int)v31, v44, v14, v16, v40, v18);
        [v19 skipHitTestForTouchEvent:v45];
        [v11 returnExecutionToParent];

        goto LABEL_53;
      }
    }
    [v11 returnExecutionToParent];
    goto LABEL_53;
  }
  [v10 returnExecutionToParent];
LABEL_54:
}

void __94__UIKeyboardLayoutStar_performHitTestForTouchInfo_touchStage_executionContextPassingUIKBTree___block_invoke(uint64_t a1, void *a2)
{
  id v18 = a2;
  uint64_t v3 = [v18 info];
  if (v3)
  {
    id v4 = (void *)v3;
    BOOL v5 = [v18 info];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      int v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = [v18 info];
      [v7 handleFailureInMethod:v8, v9, @"UIKeyboardLayoutStar.m", 5330, @"UIKeyboardTask %s expected NSNumber but received %@", "-[UIKeyboardLayoutStar performHitTestForTouchInfo:touchStage:executionContextPassingUIKBTree:]_block_invoke", v10 object file lineNumber description];
    }
  }
  unint64_t v11 = [v18 info];
  [*(id *)(a1 + 40) setStage:*(unsigned int *)(a1 + 64)];
  if (v11)
  {
    uint64_t v12 = [v11 integerValue];
    if (v12 == -2)
    {
      if ([*(id *)(a1 + 32) _allowContinuousPathUI]
        && [*(id *)(a1 + 40) continuousPathState] == 3)
      {
        [*(id *)(a1 + 32) _transitionToContinuousPathState:4 forTouchInfo:*(void *)(a1 + 40)];
      }
      if ([*(id *)(a1 + 32) _allowContinuousPathUI]
        && [*(id *)(a1 + 48) usesCandidateSelection]
        && [*(id *)(a1 + 40) continuousPathState] == 4)
      {
        [*(id *)(a1 + 48) generateCandidatesWithOptions:4];
      }
    }
    else
    {
      unint64_t v13 = v12;
      if ((v12 & 0x8000000000000000) == 0)
      {
        double v14 = [*(id *)(*(void *)(a1 + 32) + 640) keys];
        unint64_t v15 = [v14 count];

        if (v13 < v15)
        {
          double v16 = [*(id *)(*(void *)(a1 + 32) + 640) keys];
          double v17 = [v16 objectAtIndex:v13];

          [v18 returnExecutionToParentWithInfo:v17];
          goto LABEL_17;
        }
      }
    }
  }
  [v18 returnExecutionToParent];
LABEL_17:
}

- (BOOL)isDeadkeyInput:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutStar *)self diacriticForwardCompose]
    && [v4 length] == 1)
  {
    char v5 = MEMORY[0x18C1068D0]([v4 _firstLongCharacter]);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)updatePhysicalKeyboardEvent:(id)a3 withMarkedInput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    objc_msgSend(v6, "set_inputFlags:", objc_msgSend(v6, "_inputFlags") | 2);
    uint64_t v8 = UIKeyboardGetCurrentInputMode();
    uint64_t v9 = UIKeyboardLocalizedObject(@"CustomDeadkeyComposition", v8, 0, 0, 0);
    id v10 = [v6 _modifiedInput];
    unint64_t v11 = [v7 stringByAppendingString:v10];

    uint64_t v12 = [v9 objectForKey:v11];
    if (!v12)
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __68__UIKeyboardLayoutStar_updatePhysicalKeyboardEvent_withMarkedInput___block_invoke;
      v19[3] = &unk_1E52FA5D0;
      v19[4] = self;
      uint64_t v12 = [v11 _stringByComposingDiacriticsLogicalOrder:0 allowedCharacters:v19];
    }
    if ([v12 isEqualToString:v11])
    {
      uint64_t v13 = [v9 objectForKey:v7];
      double v14 = (void *)v13;
      if (v13) {
        unint64_t v15 = (void *)v13;
      }
      else {
        unint64_t v15 = v7;
      }
      id v16 = v15;

      double v17 = [v6 _modifiedInput];
      id v18 = [v16 stringByAppendingString:v17];

      objc_msgSend(v6, "set_modifiedInput:", v18);
    }
    else
    {
      objc_msgSend(v6, "set_modifiedInput:", v12);
    }
  }
}

uint64_t __68__UIKeyboardLayoutStar_updatePhysicalKeyboardEvent_withMarkedInput___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSString _stringWithUnichar:a2];
  uint64_t v4 = [v2 canProduceString:v3];

  return v4;
}

- (id)currentRepresentedStringForDualDisplayKey:(id)a3
{
  id v4 = a3;
  char v5 = +[UIKeyboardImpl activeInstance];
  id v6 = [v4 secondaryRepresentedStrings];
  id v7 = [v6 firstObject];

  if (![(UIKeyboardLayoutStar *)self isShiftKeyBeingHeld]
    && (!self->_shift || ([v5 isAutoShifted] & 1) != 0 || (objc_msgSend(v5, "isShiftLocked") & 1) != 0)
    || (UIKeyboardCurrentInputModeIsKoreanEnglishBilingual() & 1) != 0)
  {
    uint64_t v9 = [v4 representedString];
    id v8 = v9;
    if (!v7)
    {
      uint64_t v10 = [v9 substringToIndex:1];

      id v8 = (id)v10;
    }
  }
  else if (v7)
  {
    id v8 = v7;
  }
  else
  {
    unint64_t v11 = [v4 representedString];
    id v8 = [v11 substringFromIndex:1];
  }
  return v8;
}

- (id)createKeyEventForStringAction:(id)a3 forKey:(id)a4 touchInfo:(id)a5 inputFlags:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a5;
  id v10 = a3;
  unint64_t v11 = [v9 key];
  uint64_t v12 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v10 forKey:v11 inputFlags:v6];

  uint64_t v13 = [v9 continuousPathState];
  if (v13 >= 4) {
    [v12 setSource:6];
  }
  return v12;
}

- (id)createKeyEventForStringAction:(id)a3 forKey:(id)a4 inputFlags:(int)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = [(UIKeyboardLayoutStar *)self activeKey];
  }
  BOOL v10 = (a5 & 2) != 0
     && [(UIKBTree *)self->_keyplane shouldSkipCandidateSelectionForVariants];
  unint64_t v11 = (UIKBTree *)v9;
  uint64_t v12 = self->_keyplane;
  uint64_t v13 = [(UIKBTree *)v11 gestureKey];
  if (!v13)
  {
    id v18 = v11;
    goto LABEL_17;
  }
  double v14 = (void *)v13;
  BOOL v42 = v10;
  uint64_t v15 = [(UIKBTree *)self->_keyplane gestureKeyplaneName];
  if (v15)
  {
    id v16 = (void *)v15;
    double v17 = [(UIKBTree *)v11 representedString];
    if ([(__CFString *)v8 isEqualToString:v17])
    {

      id v18 = v11;
    }
    else
    {
      uint64_t v41 = v12;
      double v19 = [(UIKBTree *)v11 gestureKey];
      BOOL v20 = [v19 representedString];
      int v40 = [(__CFString *)v8 isEqualToString:v20];

      if (!v40)
      {
        id v18 = v11;
        uint64_t v12 = v41;
        goto LABEL_16;
      }
      id v18 = [(UIKBTree *)v11 gestureKey];

      keyboard = self->_keyboard;
      double v14 = [(UIKBTree *)self->_keyplane gestureKeyplaneName];
      uint64_t v12 = [(UIKBTree *)keyboard subtreeWithName:v14];
      id v16 = v41;
    }
  }
  else
  {
    id v18 = v11;
  }

LABEL_16:
  BOOL v10 = v42;
LABEL_17:
  int v22 = [(UIKBTree *)v18 objectForProperty:@"shouldskipcandidateselection"];

  if (v22) {
    double v23 = v18;
  }
  else {
    double v23 = v12;
  }
  if (v10 | [(UIKBTree *)v23 shouldSkipCandidateSelection]) {
    int v24 = 8;
  }
  else {
    int v24 = 0;
  }
  unsigned int v25 = v24 | a5;
  if ([(__CFString *)v8 _containsEmoji]) {
    uint64_t v26 = v25 | 2;
  }
  else {
    uint64_t v26 = v25;
  }
  if ([(UIKeyboardLayoutStar *)self isLongPressedKey:v11])
  {
    double v27 = [(UIKBTree *)v11 name];
    if (![v27 hasPrefix:@"NumberPad-"])
    {
LABEL_30:

      goto LABEL_31;
    }
    double v28 = [(UIKBTree *)v11 name];
    int v29 = [v28 hasSuffix:@"-0-Plus"];

    if (v29)
    {
      double v27 = v8;
      id v8 = @"+";
      goto LABEL_30;
    }
  }
LABEL_31:
  if ((a5 & 0x102) == 0 && [(UIKBTree *)v11 displayType] == 7)
  {
    uint64_t v30 = [(UIKeyboardLayoutStar *)self currentRepresentedStringForDualDisplayKey:v11];

    id v8 = (__CFString *)v30;
  }
  uint64_t v31 = +[UIKeyboardImpl activeInstance];
  if ([v31 isShiftLocked])
  {
    int v32 = [(UIKBTree *)v11 displayType];

    if (v32 != 7) {
      goto LABEL_38;
    }
    uint64_t v31 = [MEMORY[0x1E4F1CA20] preferredLocale];
    uint64_t v33 = [(__CFString *)v8 uppercaseStringWithLocale:v31];

    id v8 = (__CFString *)v33;
  }

LABEL_38:
  id v34 = +[UIPhysicalKeyboardEvent _eventWithInput:v8 inputFlags:v26];
  [v34 setSource:1];
  long long v35 = [(UIKBTree *)v11 stringForProperty:@"KBhint"];
  objc_msgSend(v34, "set_hint:", v35);

  uint64_t v36 = +[UIKeyboardImpl activeInstance];
  if (([v36 usesCandidateSelection] & 1) == 0)
  {
    if ([(UIKeyboardLayoutStar *)self isDeadkeyInput:v8])
    {
      objc_msgSend(v34, "set_inputFlags:", objc_msgSend(v34, "_inputFlags") | 0x10);
      long long v37 = [v34 _modifiedInput];
      objc_msgSend(v34, "set_markedInput:", v37);

      objc_msgSend(v34, "set_modifiedInput:", &stru_1ED0E84C0);
    }
    long long v38 = [v36 inputForMarkedText];
    if ([v38 length]) {
      [(UIKeyboardLayoutStar *)self updatePhysicalKeyboardEvent:v34 withMarkedInput:v38];
    }
  }
  return v34;
}

- (void)clearHandwritingStrokesIfNeededAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIKeyboardLayoutStar *)self isHandwritingPlane])
  {
    char v5 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Handwriting-Input"];
    id v7 = [v5 objectAtIndex:0];

    uint64_t v6 = [(UIKeyboardLayoutStar *)self viewForKey:v7];
    [v6 clearAndNotify:v3];
    [v6 clearTouches];
  }
}

- (void)deleteHandwritingStrokesAtIndexes:(id)a3
{
  id v7 = a3;
  if ([(UIKeyboardLayoutStar *)self isHandwritingPlane])
  {
    id v4 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Handwriting-Input"];
    char v5 = [v4 objectAtIndex:0];

    uint64_t v6 = [(UIKeyboardLayoutStar *)self viewForKey:v5];
    [v6 deleteStrokesAtIndexes:v7];
  }
}

- (void)logHandwritingData
{
  if ([(UIKeyboardLayoutStar *)self isHandwritingPlane])
  {
    BOOL v3 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Handwriting-Input"];
    id v5 = [v3 objectAtIndex:0];

    id v4 = [(UIKeyboardLayoutStar *)self viewForKey:v5];
    [v4 log];
  }
}

- (id)candidateList
{
  id v2 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Candidate-Selection"];
  BOOL v3 = [v2 objectAtIndex:0];

  if (v3)
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    id v5 = [v4 candidateController];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)hasCandidateKeys
{
  id v2 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Candidate-Selection"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)hasAccentKey
{
  id v2 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Latin-Accents"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)activeMultitapCompleteKey
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardLayoutStar *)self multitapCompleteKeys];
  uint64_t v4 = [v3 count];
  multitapKedouble y = self->_multitapKey;
  if (v4 == 1)
  {
    if ([(UIKBTree *)multitapKey forceMultitap])
    {
      id v6 = 0;
      goto LABEL_16;
    }
  }
  else if (multitapKey)
  {
    [(UIKBTree *)multitapKey frame];
    double v8 = v7;
    [(UIKBTree *)self->_keyboard frame];
    double v10 = v9;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v14 = v10 * 0.5;
      uint64_t v15 = *(void *)v23;
LABEL_7:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v11);
        }
        double v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
        objc_msgSend(v17, "frame", (void)v22);
        double v19 = v18;
        [(UIKBTree *)self->_keyboard frame];
        if (v8 < v14 != v19 >= v20 * 0.5) {
          break;
        }
        if (v13 == ++v16)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v13) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      id v6 = v17;

      if (v6) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_13:
    }
  }
  objc_msgSend(v3, "firstObject", (void)v22);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v6;
}

- (id)multitapCompleteKeys
{
  return [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Multitap-Complete-Key"];
}

- (id)multitapForwardKeys
{
  return [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Multitap-Forward-Key"];
}

- (BOOL)canMultitap
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self multitapCompleteKeys];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(UIKeyboardLayoutStar *)self multitapForwardKeys];
    if ([v5 count]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [(UIKBTree *)self->_keyplane supportsMultitap];
    }
  }
  return v4;
}

- (void)multitapInterrupted
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(UIKeyboardLayoutStar *)self cancelMultitapTimer];
  self->_multitapCount = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v3 = [(UIKeyboardLayoutStar *)self multitapCompleteKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 state] != 1) {
          [(UIKeyboardLayoutStar *)self setState:1 forKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  if (self->_unshiftAfterMultitap)
  {
    double v9 = +[UIKeyboardImpl activeInstance];
    [v9 setShift:0];

    [(UIKeyboardLayoutStar *)self setShift:0];
    self->_unshiftAfterMultitap = 0;
  }
}

- (void)endMultitapForKey:(id)a3
{
  if (a3) {
    [(UIKeyboardLayoutStar *)self setState:2 forKey:a3];
  }
}

- (void)multitapExpired
{
  [(UIKeyboardLayoutStar *)self multitapInterrupted];
  [(UIKeyboardLayoutStar *)self endMultitapForKey:self->_multitapKey];
  multitapKedouble y = self->_multitapKey;
  self->_multitapKedouble y = 0;
}

- (void)handleMultitapTimerFired
{
  BOOL v3 = self->_multitapAction;
  objc_initWeak(&location, self);
  if (qword_1EB25AB70 != -1) {
    dispatch_once(&qword_1EB25AB70, &__block_literal_global_1025);
  }
  uint64_t v4 = [(UIKeyboardLayout *)self taskQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__UIKeyboardLayoutStar_handleMultitapTimerFired__block_invoke_3;
  v6[3] = &unk_1E52FA5F8;
  uint64_t v5 = v3;
  double v7 = v5;
  double v8 = self;
  objc_copyWeak(&v9, &location);
  [v4 addTask:v6 breadcrumb:qword_1EB25AB68];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__UIKeyboardLayoutStar_handleMultitapTimerFired__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1028_0 copy];
  uint64_t v1 = (void *)qword_1EB25AB68;
  qword_1EB25AB68 = v0;
}

uint64_t __48__UIKeyboardLayoutStar_handleMultitapTimerFired__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __48__UIKeyboardLayoutStar_handleMultitapTimerFired__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 1072))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained multitapExpired];
    }

    id v3 = v6;
  }
  [v3 returnExecutionToParent];
}

- (BOOL)isMultitapKey:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutStar *)self canMultitap])
  {
    uint64_t v5 = [v4 fullRepresentedString];
    unint64_t v6 = [v5 length];
    double v7 = [v4 representedString];
    if (v6 <= [v7 length]) {
      char v8 = [v4 forceMultitap];
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = [v4 forceMultitap];
  }

  return v8;
}

- (void)cancelMultitapTimer
{
  [(UIDelayedAction *)self->_multitapAction cancel];
  multitapActiouint64_t n = self->_multitapAction;
  self->_multitapActiouint64_t n = 0;
}

- (void)touchMultitapTimer
{
  multitapActiouint64_t n = self->_multitapAction;
  if (multitapAction)
  {
    [(UIDelayedAction *)multitapAction touch];
  }
  else
  {
    id v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel_handleMultitapTimerFired userInfo:0 delay:1.0];
    uint64_t v5 = self->_multitapAction;
    self->_multitapActiouint64_t n = v4;
  }
  uint64_t v6 = [(UIKeyboardLayoutStar *)self activeMultitapCompleteKey];
  id v8 = (id)v6;
  if (v6)
  {
    int v7 = [(UIKeyboardLayoutStar *)self stateForKey:v6];
    uint64_t v6 = (uint64_t)v8;
    if (v7 != 2)
    {
      self->_multitapCount = 0;
      self->_unshiftAfterMultitap = 0;
    }
  }
  [(UIKeyboardLayoutStar *)self setState:2 forKey:v6];
}

- (void)didClearInput
{
  [(UIKeyboardLayoutStar *)self clearHandwritingStrokesIfNeededAndNotify:0];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v3 didClearInput];
}

- (NSString)layoutTag
{
  return self->_layoutTag;
}

- (void)setLayoutTag:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTag, a3);
  [(UIKeyboardLayoutStar *)self updateLayoutTags];
  [(UIKeyboardLayoutStar *)self updateCachedKeyplaneKeycaps];
}

- (void)updateLayoutTags
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!self->_isTrackpadMode)
  {
    objc_super v3 = [(UIKeyboardLayoutStar *)self layoutTag];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v4 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Adaptive-Key"];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v32 = 0;
      uint64_t v7 = *(void *)v40;
      while (1)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v9 hasLayoutTag:v3])
          {
            long long v10 = [v9 layoutTag];
            if ([v10 isEqualToString:v3])
            {
              BOOL v11 = [(UIKeyboardLayoutStar *)self shouldMergeKey:v9];

              if (!v11)
              {
LABEL_15:
                v38[0] = MEMORY[0x1E4F143A8];
                v38[1] = 3221225472;
                v38[2] = __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke;
                v38[3] = &unk_1E52FA4C0;
                v38[4] = self;
                [v9 setLayoutTag:v3 passingKeyTest:v38];
                [v9 setVisible:1];
                unsigned int v14 = [(UIKeyboardLayoutStar *)self stateForKey:v9];
                if (v14) {
                  uint64_t v15 = v14;
                }
                else {
                  uint64_t v15 = 2;
                }
                [(UIKeyboardLayoutStar *)self setState:v15 forKey:v9];
                continue;
              }
            }
            else
            {
            }
            BOOL v12 = [(UIKeyboardLayoutStar *)self useCrescendoLayout];
            long long v13 = &OBJC_IVAR___UIKeyboardLayoutStar__keyplaneView;
            if (v12) {
              long long v13 = &OBJC_IVAR___UIKeyboardLayoutStar__liveKeyplaneView;
            }
            [*(id *)((char *)&self->super.super.super.super.isa + *v13) deactivateAdaptiveKey:v9];
            char v32 = 1;
            goto LABEL_15;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
        if (!v6) {
          goto LABEL_23;
        }
      }
    }
    char v32 = 0;
LABEL_23:

    uint64_t v16 = [(UIKBTree *)self->_keyplane gestureKeyplaneName];
    if (v16)
    {
      double v17 = (void *)v16;
      double v18 = +[UIKeyboardPreferencesController sharedPreferencesController];
      double v19 = [v18 preferencesActions];
      int v20 = [v19 BOOLForPreferenceKey:@"GesturesEnabled"];

      if (v20)
      {
        keyboard = self->_keyboard;
        long long v22 = [(UIKBTree *)self->_keyplane gestureKeyplaneName];
        long long v23 = [(UIKBTree *)keyboard subtreeWithName:v22];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v24 = [v23 cachedKeysByKeyName:@"Adaptive-Key"];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v34 objects:v43 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v35;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v35 != v27) {
                objc_enumerationMutation(v24);
              }
              int v29 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              if ([v29 hasLayoutTag:v3])
              {
                uint64_t v30 = [v29 layoutTag];
                char v31 = [v30 isEqualToString:v3];

                if ((v31 & 1) == 0)
                {
                  v33[0] = MEMORY[0x1E4F143A8];
                  v33[1] = 3221225472;
                  v33[2] = __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke_2;
                  v33[3] = &unk_1E52FA4C0;
                  v33[4] = self;
                  [v29 setLayoutTag:v3 passingKeyTest:v33];
                  char v32 = 1;
                }
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v34 objects:v43 count:16];
          }
          while (v26);
        }
      }
    }
    if (v32) {
      [(UIKBTree *)self->_keyplane updateFlickKeycapOnKeys];
    }
  }
}

uint64_t __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldMergeKey:a2] ^ 1;
}

uint64_t __40__UIKeyboardLayoutStar_updateLayoutTags__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) shouldMergeKey:a2] ^ 1;
}

- (void)setLabel:(id)a3 forKey:(id)a4
{
  long long v37 = (__CFString *)a3;
  uint64_t v6 = (__CFString *)a4;
  uint64_t v7 = v6;
  if (!self->_isTrackpadMode)
  {
    if (@"_keyid_space_" != v6)
    {
      if (@"_keyid_return_" == v6)
      {
        double v17 = [(UIKBTree *)self->_keyplane cache];
        double v18 = v17;
        double v19 = @"Return-Key";
      }
      else
      {
        if (@"_keyid_accent_" != v6)
        {
          if (@"_keyid_facemark_" == v6) {
            id v8 = @"Facemark";
          }
          else {
            id v8 = v6;
          }
          long long v10 = [(UIKBTree *)self->_keyplane keysWithString:v8];
          goto LABEL_18;
        }
        double v17 = [(UIKBTree *)self->_keyplane cache];
        double v18 = v17;
        double v19 = @"Latin-Accents";
      }
      long long v10 = [v17 objectForKey:v19];

      goto LABEL_18;
    }
    id v9 = [(UIKBTree *)self->_keyplane cache];
    long long v10 = [v9 objectForKey:@"Space-Key"];

    uint64_t v11 = [v10 count];
    BOOL v12 = [(UIKBTree *)self->_keyplane cache];
    long long v13 = [v12 objectForKey:@"Unlabeled-Space-Key"];
    if (v11)
    {

      if (![v13 count]) {
        goto LABEL_11;
      }
      [v10 arrayByAddingObjectsFromArray:v13];
      v13 = BOOL v12 = v13;
    }
    unsigned int v14 = v13;

    long long v13 = v12;
    long long v10 = v14;
LABEL_11:

    if (![v10 count])
    {
      uint64_t v15 = [(UIKBTree *)self->_keyplane cache];
      uint64_t v16 = [v15 objectForKey:@"Ideographic-Space-Key"];

      long long v10 = (void *)v16;
    }
LABEL_18:
    if (![v10 count])
    {
LABEL_55:

      goto LABEL_56;
    }
    int v20 = v37;
    BOOL v21 = @"_keyid_space_" == v7 && @"UI-Space" == v37;
    if (v21
      && (([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) == 1
       && ([(UIKBTree *)self->_keyplane visualStyling] & 0x80) == 0
       && ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF0000) != 0xB0000
       && ![(UIKeyboardLayoutStar *)self isHandwritingPlane]
       || ([(UIKBTree *)self->_keyplane visualStyling] & 0x80) != 0
       && ![(UIKeyboardLayoutStar *)self hasCandidateKeys]
       || (BOOL v22 = [(UIKeyboardLayoutStar *)self useCrescendoLayout], v20 = v37, v22)
       && (char v23 = (char)[(UIKBTree *)self->_keyplane visualStyling], v20 = v37, (v23 & 0x3F) == 1)))
    {
      long long v24 = &stru_1ED0E84C0;
    }
    else
    {
      UIKeyboardLocalizedString(v20, 0, 0, 0);
      uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v25) {
        uint64_t v26 = v25;
      }
      else {
        uint64_t v26 = v37;
      }
      long long v24 = v26;
    }
    uint64_t v27 = [v10 objectAtIndex:0];
    if (@"_keyid_space_" == v7
      && (unint64_t)[v10 count] >= 2
      && [(UIKBTree *)self->_keyplane isSplit])
    {
      uint64_t v28 = [v10 objectAtIndex:1];
    }
    else
    {
      if (@"_keyid_return_" != v7) {
        goto LABEL_46;
      }
      if ((unint64_t)[v10 count] < 2) {
        goto LABEL_46;
      }
      int v29 = [v27 shape];
      uint64_t v30 = [v29 concaveCorner];

      if (!v30) {
        goto LABEL_46;
      }
      uint64_t v28 = [v10 lastObject];
    }
    char v31 = (void *)v28;

    uint64_t v27 = v31;
LABEL_46:
    uint64_t v32 = [v27 overrideDisplayString];
    if ((__CFString *)v32 == v24)
    {
    }
    else
    {
      uint64_t v33 = (void *)v32;
      long long v34 = [v27 overrideDisplayString];
      char v35 = [v34 isEqualToString:v24];

      if ((v35 & 1) == 0)
      {
        [v27 setOverrideDisplayString:v24];
        long long v36 = [(UIKeyboardLayoutStar *)self viewForKey:v27];
        if (v36)
        {
          [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutStar *)self stateForKey:v27] forKey:v27];
        }
        else
        {
          [v27 frame];
          -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
        }

        if (@"_keyid_return_" == v7) {
          [(UIKeyboardLayoutStar *)self updateTransitionWithFlags:5];
        }
      }
    }

    goto LABEL_55;
  }
LABEL_56:
}

- (void)setTarget:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  uint64_t v7 = (__CFString *)a4;
  id v8 = v7;
  if (@"_keyid_space_" == v7)
  {
    id v9 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
  }
  else
  {
    if (@"_keyid_return_" != v7) {
      goto LABEL_6;
    }
    id v9 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
  }
  objc_storeStrong((id *)((char *)&self->super.super.super.super.isa + *v9), a3);
LABEL_6:
}

- (void)setAction:(SEL)a3 forKey:(id)a4
{
  if (@"_keyid_space_" == a4)
  {
    uint64_t v4 = 824;
  }
  else
  {
    if (@"_keyid_return_" != a4) {
      return;
    }
    uint64_t v4 = 848;
  }
  uint64_t v5 = (SEL *)((char *)self + v4);
  if (a3) {
    SEL v6 = a3;
  }
  else {
    SEL v6 = 0;
  }
  *uint64_t v5 = v6;
}

- (void)setLongPressAction:(SEL)a3 forKey:(id)a4
{
  if (@"_keyid_space_" == a4)
  {
    uint64_t v4 = 832;
  }
  else
  {
    if (@"_keyid_return_" != a4) {
      return;
    }
    uint64_t v4 = 856;
  }
  uint64_t v5 = (SEL *)((char *)self + v4);
  if (a3) {
    SEL v6 = a3;
  }
  else {
    SEL v6 = 0;
  }
  *uint64_t v5 = v6;
}

- (void)restoreDefaultsForKey:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  uint64_t v11 = v4;
  if (@"_keyid_space_" == v4)
  {
    [(UIKeyboardLayoutStar *)self setLabel:0 forKey:v4];
    SEL v6 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
  }
  else
  {
    [(UIKeyboardLayoutStar *)self setLabel:0 forKey:v4];
    uint64_t v5 = v11;
    if (@"_keyid_return_" != v11) {
      goto LABEL_6;
    }
    SEL v6 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
  }
  uint64_t v7 = v6 + 4;
  id v8 = v6 + 2;
  uint64_t v9 = *v6;
  id v10 = *(Class *)((char *)&self->super.super.super.super.isa + v9);
  *(Class *)((char *)&self->super.super.super.super.isa + v9) = 0;

  *(Class *)((char *)&self->super.super.super.super.isa + *v8) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + *v7) = 0;
  uint64_t v5 = v11;
LABEL_6:
}

- (void)restoreDefaultsForAllKeys
{
  [(UIKeyboardLayoutStar *)self restoreDefaultsForKey:@"_keyid_space_"];
  [(UIKeyboardLayoutStar *)self restoreDefaultsForKey:@"_keyid_return_"];
}

- (BOOL)supportsSupplementalDisplayString
{
  objc_super v3 = [(UIKBTree *)self->_keyboard name];
  if ([v3 containsString:@"Korean"])
  {
    char v4 = 1;
  }
  else
  {
    uint64_t v5 = [(UIKBTree *)self->_keyboard name];
    char v4 = [v5 containsString:@"Thai"];
  }
  return v4;
}

- (BOOL)isShiftKeyPlaneChooser
{
  if (![(UIKBTree *)self->_keyplane isShiftKeyplane]) {
    goto LABEL_10;
  }
  objc_super v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Shift-Key"];
  if (!v3 || !self->_multitapKey)
  {
LABEL_9:

    goto LABEL_10;
  }
  char v4 = [(UIKBTree *)self->_keyplane keys];
  if (![v4 containsObject:self->_multitapKey]
    || ![(UIDelayedAction *)self->_multitapAction scheduled])
  {

    goto LABEL_9;
  }
  uint64_t v5 = +[UIKeyboardImpl activeInstance];
  char v6 = [v5 isShiftLocked];

  if ((v6 & 1) == 0)
  {
    self->_unshiftAfterMultitap = 1;
    return 1;
  }
LABEL_10:
  if ([(UIKeyboardLayoutStar *)self supportsSupplementalDisplayString]
    && self->_dismissModalDoubleConsonantKeys)
  {
    return 1;
  }
  keyplane = self->_keyplane;
  return [(UIKBTree *)keyplane isShiftKeyPlaneChooser];
}

- (BOOL)isLongPressedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    int v6 = [v4 interactionType];
    if (self->_showDictationKey && v6 == 5)
    {
      char v8 = 1;
      goto LABEL_10;
    }
    if (([(UIKeyboardLayoutStar *)self downActionFlagsForKey:v5] & 0x80) != 0)
    {
      uint64_t v9 = +[UIKeyboardImpl activeInstance];
      char v8 = [v9 isLongPress];

      goto LABEL_10;
    }
  }
  char v8 = 0;
LABEL_10:

  return v8;
}

- (BOOL)showsGlobeAndDictationKeysInDockView
{
  return +[UIKeyboardImpl showsGlobeAndDictationKeysExternally];
}

- (BOOL)shouldShowInternationalMenuForKey:(id)a3
{
  id v4 = a3;
  if ([v4 interactionType] == 9 && objc_msgSend(v4, "displayType") == 13) {
    BOOL v5 = ![(UIKeyboardLayoutStar *)self showsDedicatedEmojiKeyAlongsideGlobeButton];
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)showMenu:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v9 = a3;
  uint64_t v7 = [(UIKeyboardLayoutStar *)self viewForKey:v6];
  [v7 setPopupMenu:v9];

  char v8 = [(UIKeyboardLayoutStar *)self renderConfig];
  [v9 setRenderConfig:v8];

  [v9 showAsPopupForKey:v6 inLayout:self];
}

- (void)longPressAction
{
  objc_super v3 = [(UIKeyboardLayoutStar *)self activeKey];
  if (v3)
  {
    id v4 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v3];
    BOOL v5 = [v4 touch];
    BOOL v6 = [(UIKeyboardLayout *)self _hasRelatedTouchesForTouchState:v5];

    if (v6 || [v4 continuousPathState] == 4 || objc_msgSend(v4, "continuousPathState") == 3)
    {
      [(UIKeyboardLayoutStar *)self deactivateActiveKey];
LABEL_6:

      goto LABEL_7;
    }
    if ([v3 interactionType] == 4
      && [(UIKeyboardLayoutStar *)self isHandwritingPlane])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __39__UIKeyboardLayoutStar_longPressAction__block_invoke;
      block[3] = &unk_1E52D9F70;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    if (![(UIKeyboardLayoutStar *)self isLongPressedKey:v3]
      && ![v4 delayed])
    {
      goto LABEL_6;
    }
    self->_didLongPress = 1;
    unint64_t v7 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v3];
    if ([v4 delayed]
      && ([v3 interactionType] == 4
       || [v3 interactionType] == 14))
    {
      objc_initWeak(&location, self);
      if (qword_1EB25AB80 != -1) {
        dispatch_once(&qword_1EB25AB80, &__block_literal_global_1044);
      }
      char v8 = [(UIKeyboardLayout *)self taskQueue];
      v63[0] = MEMORY[0x1E4F143A8];
      v63[1] = 3221225472;
      v63[2] = __39__UIKeyboardLayoutStar_longPressAction__block_invoke_4;
      v63[3] = &unk_1E52FA620;
      objc_copyWeak(v66, &location);
      id v64 = v4;
      id v65 = v3;
      v66[1] = (id)v7;
      [v8 addTask:v63 breadcrumb:qword_1EB25AB78];

      id v9 = v66;
LABEL_19:
      objc_destroyWeak(v9);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    int v10 = [v3 interactionType];
    if ((v7 & 0x1000F8000) != 0)
    {
      [(UIKeyboardLayoutStar *)self showPopupVariantsForKey:v3];
      if (self->_swipeDetected
        && ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23))
      {
        if ([v3 displayType] == 7) {
          +[_UIKeyboardUsageTracking dualStringsKeyFlickUpCount];
        }
        else {
          +[_UIKeyboardUsageTracking singleStringKeyFlickUpCount];
        }
      }
      goto LABEL_6;
    }
    int v11 = v10;
    if ((v7 & 0x100000) != 0)
    {
      if (v10 == 4)
      {
        uint64_t v26 = 880;
        id deleteTarget = self->_deleteTarget;
      }
      else
      {
        if (v10 == 15)
        {
          unsigned int v14 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
        }
        else
        {
          if (v10 != 13) {
            goto LABEL_6;
          }
          unsigned int v14 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
        }
        id deleteTarget = *(Class *)((char *)&self->super.super.super.super.isa + *v14);
        uint64_t v26 = v14[4];
      }
      if (*(Class *)((char *)&self->super.super.super.super.isa + v26)) {
        uint64_t v28 = *(const char **)((char *)&self->super.super.super.super.isa + v26);
      }
      else {
        uint64_t v28 = 0;
      }
      if (dyld_program_sdk_at_least()) {
        [deleteTarget v28];
      }
      else {
        objc_msgSend(deleteTarget, sel_performSelector_, v28);
      }
      goto LABEL_6;
    }
    if ((v7 & 0x40000000) != 0)
    {
      if (+[UIDictationController isRunning])
      {
        uint64_t v15 = +[UIDictationController activeInstance];
        [v15 cancelDictation];

        uint64_t v16 = +[UIKeyboardImpl activeInstance];
        int v17 = [v16 isDictationPopoverPresented];

        if (v17)
        {
          double v18 = +[UIKeyboardImpl activeInstance];
          [v18 dismissDictationPopover];
        }
      }
      if (v11 != 5 || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 3) {
        goto LABEL_6;
      }
      BOOL v12 = +[UIDictationConnectionPreferences sharedInstance];
      if (([v12 dictationIsEnabled] & 1) == 0) {
        goto LABEL_74;
      }
      double v19 = +[UIKeyboardInputModeController sharedInputModeController];
      int v20 = [v19 enabledDictationLanguages];
      unint64_t v21 = [v20 count];

      if (v21 < 2) {
        goto LABEL_6;
      }
      BOOL v12 = +[UIInputSwitcherView sharedInstance];
      if (([v12 isVisible] & 1) != 0
        || (+[UIKeyboardSplitControlMenu activeInstance],
            BOOL v22 = objc_claimAutoreleasedReturnValue(),
            char v23 = [v22 isVisible],
            v22,
            (v23 & 1) != 0))
      {
LABEL_74:

        goto LABEL_6;
      }
LABEL_92:
      [(UIKeyboardLayoutStar *)self showMenu:v12 forKey:v3];
      goto LABEL_74;
    }
    if (v10 == 38)
    {
      objc_initWeak(&location, self);
      if (qword_1EB25AB90 != -1) {
        dispatch_once(&qword_1EB25AB90, &__block_literal_global_1051_0);
      }
      int v29 = [(UIKeyboardLayout *)self taskQueue];
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __39__UIKeyboardLayoutStar_longPressAction__block_invoke_7;
      v60[3] = &unk_1E52E3FF0;
      objc_copyWeak(&v62, &location);
      id v61 = v3;
      [v29 addTask:v60 breadcrumb:qword_1EB25AB88];

      id v9 = &v62;
      goto LABEL_19;
    }
    if (v10 == 9 && [v3 displayType] == 13)
    {
      if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3
        || ![(UIKeyboardLayoutStar *)self shouldShowInternationalMenuForKey:v3])
      {
        goto LABEL_6;
      }
      BOOL v12 = +[UIInputSwitcherView sharedInstance];
      if ([v12 isVisible]) {
        goto LABEL_74;
      }
      long long v13 = +[UIKeyboardSplitControlMenu activeInstance];
      if ([v13 isVisible])
      {

        goto LABEL_74;
      }
      int v58 = [(UIKeyboardLayoutStar *)self stateForKey:v3];

      if (v58 != 4) {
        goto LABEL_74;
      }
      goto LABEL_92;
    }
    if (!+[UIKeyboardImpl rivenTranslationPreference]
      || self->_swipeDetected)
    {
      if (v11 == 6)
      {
        long long v24 = [(UIView *)self window];
        char v25 = [v24 _isTextEffectsWindow] ^ 1;
      }
      else
      {
        char v25 = 0;
      }
      if ((v25 & 1) != 0 || v11 == 3) {
        goto LABEL_6;
      }
      BOOL v12 = +[UIKeyboardImpl activeInstance];
      [v12 setShift:1];
      [v12 forceShiftUpdate];
      [(UIKeyboardLayoutStar *)self setState:4 forKey:v3];
      goto LABEL_74;
    }
    if (v11 == 6)
    {
      [v3 paddedFrame];
    }
    else
    {
      CGFloat v35 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v34 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      CGFloat v37 = *MEMORY[0x1E4F1DB28];
      CGFloat v36 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      if (![(UIKeyboardLayoutStar *)self isHandwritingPlane] || v11 != 3)
      {
LABEL_81:
        v72.origin.double x = v37;
        v72.origin.double y = v36;
        v72.size.double width = v35;
        v72.size.double height = v34;
        if (CGRectIsEmpty(v72)) {
          goto LABEL_6;
        }
        int v47 = +[UIKeyboardSplitControlMenu sharedInstance];
        char v48 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v3];
        uint64_t v49 = [v48 touch];
        [v49 locationInView:self];
        double v51 = v50;
        double v53 = v52;

        [(UIView *)self bounds];
        if (v51 >= v54 + -60.0)
        {
          [(UIView *)self bounds];
          BOOL v55 = v53 >= v56 + -60.0;
        }
        else
        {
          BOOL v55 = 0;
        }
        if (([v47 isVisible] & 1) == 0)
        {
          CGRect v57 = +[UIInputSwitcherView activeInstance];
          if (![v57 isVisible])
          {
            if ([(UIKeyboardLayoutStar *)self isHandwritingPlane] && v55 && v11 == 3)
            {
            }
            else
            {
              int v59 = [(UIKeyboardLayoutStar *)self stateForKey:v3];

              if (v59 != 4) {
                goto LABEL_95;
              }
            }
            [(UIKeyboardLayoutStar *)self showMenu:v47 forKey:v3];
            goto LABEL_95;
          }
        }
LABEL_95:

        goto LABEL_6;
      }
      [v3 paddedFrame];
      double MaxX = CGRectGetMaxX(v69);
      [v3 paddedFrame];
      CGFloat v40 = MaxX - v39 * 0.25;
      [v3 paddedFrame];
      double MaxY = CGRectGetMaxY(v70);
      [v3 paddedFrame];
      CGFloat v43 = MaxY + v42 * -0.15;
      [v3 paddedFrame];
      CGFloat v45 = v44 * 0.25;
      [v3 paddedFrame];
      v71.size.double height = v46 * 0.25;
      v71.origin.double x = v40;
      v71.origin.double y = v43;
      v71.size.double width = v45;
      *(CGRect *)&CGFloat v30 = CGRectIntegral(v71);
    }
    CGFloat v37 = v30;
    CGFloat v36 = v31;
    CGFloat v35 = v32;
    CGFloat v34 = v33;
    goto LABEL_81;
  }
LABEL_7:
}

uint64_t __39__UIKeyboardLayoutStar_longPressAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clearHandwritingStrokesIfNeededAndNotify:1];
}

void __39__UIKeyboardLayoutStar_longPressAction__block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1046 copy];
  uint64_t v1 = (void *)qword_1EB25AB78;
  qword_1EB25AB78 = v0;
}

uint64_t __39__UIKeyboardLayoutStar_longPressAction__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __39__UIKeyboardLayoutStar_longPressAction__block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _transitionToContinuousPathState:6 forTouchInfo:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) setDelayed:0];
    [v4 completeCommitTouchesPrecedingTouchDownWithKey:*(void *)(a1 + 40) withActions:*(void *)(a1 + 56) executionContext:v5];
  }
}

void __39__UIKeyboardLayoutStar_longPressAction__block_invoke_5()
{
  uint64_t v0 = [&__block_literal_global_1053 copy];
  uint64_t v1 = (void *)qword_1EB25AB88;
  qword_1EB25AB88 = v0;
}

uint64_t __39__UIKeyboardLayoutStar_longPressAction__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __39__UIKeyboardLayoutStar_longPressAction__block_invoke_7(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained playKeyClickSoundForKey:*(void *)(a1 + 32)];
    [v4 completeCommitTouchesPrecedingTouchDownWithKey:*(void *)(a1 + 32) withActions:0x400000000 executionContext:v5];
  }
}

- (id)_keyboardLongPressInteractionRegions
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(UIKBTree *)self->_keyplane cache];
  objc_super v3 = [v2 objectForKey:@"Space-Key"];

  if ([v3 count])
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
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
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "frame", (void)v12);
          int v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:");
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_keyplaneVariantsKeyForString:(id)a3
{
  keyplane = self->_keyplane;
  id v4 = a3;
  id v5 = [(UIKBTree *)keyplane componentName];
  uint64_t v6 = [v4 stringByAppendingFormat:@"-%@", v5];

  return v6;
}

- (id)_appendingSecondaryStringToVariantsTop:(id)a3 secondaryString:(id)a4 withDirection:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)[a3 mutableCopy];
  uint64_t v10 = [v9 indexOfObject:v7];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [v9 removeObjectAtIndex:v10];
  }
  if ([v8 isEqualToString:@"left"]) {
    [v9 addObject:v7];
  }
  else {
    [v9 insertObject:v7 atIndex:0];
  }

  return v9;
}

- (id)_variantsByAppendingDualStringKey:(id)a3 toVariants:(id)a4
{
  void v28[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 displayType] == 7)
  {
    id v8 = [v6 secondaryDisplayStrings];
    id v9 = [v8 objectAtIndex:0];
    uint64_t v10 = v9;
    if (v9)
    {
      id v26 = v9;
    }
    else
    {
      int v11 = [v6 displayString];
      id v26 = [v11 substringFromIndex:1];
    }
    long long v12 = [v6 secondaryRepresentedStrings];
    long long v13 = [v12 objectAtIndex:0];
    long long v14 = v13;
    if (v13)
    {
      id v25 = v13;
    }
    else
    {
      long long v15 = [v6 representedString];
      id v25 = [v15 substringFromIndex:1];
    }
    uint64_t v16 = [v7 objectForKey:@"Keycaps"];
    uint64_t v17 = [v7 objectForKey:@"Strings"];
    double v18 = [v7 objectForKey:@"Direction"];
    double v19 = [(UIKeyboardLayoutStar *)self _appendingSecondaryStringToVariantsTop:v16 secondaryString:v26 withDirection:v18];

    int v20 = [v7 objectForKey:@"Direction"];
    unint64_t v21 = [(UIKeyboardLayoutStar *)self _appendingSecondaryStringToVariantsTop:v17 secondaryString:v25 withDirection:v20];

    v27[0] = @"Direction";
    BOOL v22 = [v7 objectForKey:@"Direction"];
    v28[0] = v22;
    v28[1] = v19;
    v27[1] = @"Keycaps";
    v27[2] = @"Strings";
    void v28[2] = v21;
    uint64_t v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:3];

    id v7 = (id)v23;
  }

  return v7;
}

- (id)_variantsOfCurrencyKey:(id)a3 language:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 representedString];
  uint64_t v9 = [(UIKBTree *)self->_keyplane visualStyling] & 0x3F;
  uint64_t v10 = UIKeyboardCurrencyVariants((uint64_t)v8, v7);
  if (!v10 && v9 == 23)
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v11 = objc_msgSend(v6, "secondaryRepresentedStrings", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = UIKeyboardCurrencyVariants(*(void *)(*((void *)&v20 + 1) + 8 * i), v7);
          if (v16)
          {
            uint64_t v10 = (void *)v16;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    uint64_t v10 = 0;
LABEL_13:
  }
  if (!v10)
  {
    uint64_t v17 = UIKeyboardGetCurrentInputMode();

    uint64_t v10 = UIKeyboardCurrencyVariants((uint64_t)v8, v17);
    id v7 = v17;
  }
  if (v9 == 23)
  {
    uint64_t v18 = [(UIKeyboardLayoutStar *)self _variantsByAppendingDualStringKey:v6 toVariants:v10];

    uint64_t v10 = (void *)v18;
  }

  return v10;
}

- (void)preparePopupVariantsForKey:(id)a3 onKeyplane:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]
    && os_variant_has_internal_diagnostics())
  {
    if (objc_opt_respondsToSelector()) {
      [(TUIKeyplaneView *)self->_liveKeyplaneView updateVariantSelectorFramesForKey:v9];
    }
  }
  else
  {
    id v7 = [(UIKBKeyplaneView *)self->_keyplaneView factory];
    id v8 = (id)[v7 traitsForKey:v9 onKeyplane:v6];
  }
}

- (void)showPopupVariantsForKey:(id)a3
{
  v133[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4 && [(UIKeyboardLayoutStar *)self stateForKey:v4] != 16)
  {
    int v11 = [v4 representedString];
    double v109 = +[UIKeyboardImpl activeInstance];
    uint64_t v12 = UIKeyboardGetCurrentUILanguage();
    double v122 = [MEMORY[0x1E4F1CA20] preferredLocale];
    unint64_t v119 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v4];
    BOOL v13 = UIKeyboardGetCurrentIdiom() == 1
       || UIKeyboardGetCurrentIdiom() == 24
       || UIKeyboardGetCurrentIdiom() == 25
       || UIKeyboardGetCurrentIdiom() == 26
       || UIKeyboardGetCurrentIdiom() == 23;
    int v114 = v13;
    uint64_t v14 = [(UIKBTree *)self->_keyplane visualStyling] & 0x3F;
    double v121 = v4;
    double v118 = self;
    double v108 = v11;
    if ((v119 & 0x8000) == 0)
    {
      if ((v119 & 0x20000) != 0)
      {
        double v31 = [MEMORY[0x1E4F1CA20] preferredLocale];
        double v32 = [v31 localeIdentifier];

        uint64_t v18 = UIKeyboardTopLevelDomainVariants(v32, 15);

        id v4 = v121;
        char v19 = 0;
        int v114 = 1;
      }
      else
      {
        if ((v119 & 0x10000) == 0)
        {
          if ((v119 & 0x40000) != 0)
          {
            if (!self->_shift || v14 == 23)
            {
              uint64_t v18 = [(UIKeyboardLayoutStar *)self _variantsOfCurrencyKey:v4 language:v12];
              char v19 = 0;
            }
            else
            {
              char v19 = 0;
              uint64_t v18 = 0;
            }
            long long v20 = v12;
            unint64_t v15 = v119;
          }
          else
          {
            unint64_t v15 = v119;
            if ((v119 & 0x100000000) != 0)
            {
              uint64_t v18 = 0;
              char v19 = 1;
            }
            else if ([v4 variantType] == 9)
            {
              uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"#BOLD", @"#ITALIC", @"#UNDERLINE", 0);
              uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"popup_bold.png", @"popup_italic.png", @"popup_underline.png", 0);
              uint64_t v18 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v16, @"Strings", v17, @"Keycaps", @"right", @"Direction", 0);
              [v109 updateStylingTraitsIfNeeded];

              id v4 = v121;
              char v19 = 0;
            }
            else
            {
              char v19 = 0;
              uint64_t v18 = 0;
            }
            long long v20 = v12;
          }
LABEL_40:
          CGFloat v35 = [v18 objectForKey:@"Strings"];
          CGFloat v36 = [v18 objectForKey:@"Keycaps"];
          CGFloat v37 = v109;
          long long v38 = v18;
          if ((v19 & 1) != 0 || v18 && [v35 count])
          {
            double v126 = [MEMORY[0x1E4F1CA48] arrayWithArray:v35];
            double v123 = [MEMORY[0x1E4F1CA48] arrayWithArray:v36];
            uint64_t v39 = [v18 objectForKey:@"Direction"];
            CGFloat v40 = (void *)v39;
            double v107 = (void *)v39;
            if ((v19 & 1) != 0 || v126 && v123 && v39)
            {
              char v106 = v19;
              double v102 = v20;
              if ((v15 & 0x20000) != 0)
              {
                long long v41 = (void *)v39;
                [v126 addObject:@"."];
                [v123 addObject:@"."];
                CGFloat v40 = v41;
              }
              v105 = v38;
              if ((objc_msgSend(v40, "isEqualToString:") & 1) != 0
                || ([v107 isEqualToString:@"strictly-left"] & 1) != 0
                || [v107 isEqualToString:@"fixed-left"])
              {
                objc_msgSend(v126, "_kb_reverse");
                objc_msgSend(v123, "_kb_reverse");
              }
              unint64_t v42 = [v126 count];
              if (v42 <= [v123 count]) {
                CGFloat v43 = v126;
              }
              else {
                CGFloat v43 = v123;
              }
              int v44 = [v43 count];
              if ((v44 - 2) > 6)
              {
                double v116 = 0;
                double v110 = @"UI-Fullwidth";
                CGFloat v45 = v108;
              }
              else
              {
                CGFloat v45 = v108;
                if ([v108 _containsFullwidthLettersAndSymbolsOnly])
                {
                  double v116 = [v108 _stringByConvertingFromFullWidthToHalfWidth];
                  double v46 = @"UI-Halfwidth";
                }
                else
                {
                  double v116 = [v108 _stringByConvertingFromHalfWidthToFullWidth];
                  double v46 = @"UI-Fullwidth";
                }
                double v110 = v46;
              }
              double v103 = v36;
              double v104 = v35;
              int v47 = [v109 autocorrectPrompt];

              if (v47) {
                [v109 removeAutocorrectPromptAndCandidateList];
              }
              char v48 = [MEMORY[0x1E4F1CA48] array];
              v115 = [MEMORY[0x1E4F1CA48] array];
              uint64_t v49 = [v109 smartPunctuationController];
              int v111 = [v49 smartQuotesEnabled];

              double v113 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"'\""];
              if ([v4 displayType] == 27
                || ([v121 name],
                    double v50 = objc_claimAutoreleasedReturnValue(),
                    int v51 = [v50 _containsSubstring:@"Email-Dot-"],
                    v50,
                    v51))
              {
                unsigned int v117 = 28;
              }
              else
              {
                unsigned int v117 = 0;
              }
              double v52 = v121;
              double v124 = [v121 representedString];
              if ([v121 displayType] == 7
                && (unint64_t)[v45 length] >= 2)
              {
                __int16 v131 = [v45 characterAtIndex:0];
                uint64_t v53 = [NSString stringWithCharacters:&v131 length:1];

                double v124 = (void *)v53;
              }
              if (v44 >= 1)
              {
                uint64_t v54 = 0;
                uint64_t v120 = v44;
                unint64_t v112 = 1;
                while (1)
                {
                  BOOL v55 = [v126 objectAtIndex:v54];
                  int v56 = [v55 isEqualToString:v124];

                  id v57 = [v123 objectAtIndex:v54];
                  if ([(UIKBTree *)self->_keyplane isShiftKeyplane]
                    || !+[UIKeyboardLayout _showSmallDisplayKeyplane])
                  {
                    int v58 = [v57 uppercaseStringWithLocale:v122];
                  }
                  else
                  {
                    int v58 = [v57 lowercaseStringWithLocale:v122];
                  }
                  id v59 = v58;

                  id v60 = (v15 & 0x40000) != 0 ? v57 : v59;
                  id v61 = v60;
                  id v62 = [v52 displayString];
                  v125 = v61;
                  if (([v62 isEqual:v61] & 1) == 0)
                  {
                    BOOL v63 = [(NSMutableSet *)self->_allKeyplaneKeycaps containsObject:v59]&& (v15 & 0x10000) == 0;
                    if (v63 && [v52 variantType] != 9) {
                      break;
                    }
                  }

                  id v62 = [v126 objectAtIndex:v54];
                  if (!v56)
                  {
                    if ([v116 isEqualToString:v62])
                    {
                      id v64 = UIKeyboardLocalizedString(v110, 0, 0, 0);

                      double v116 = 0;
                    }
                    else
                    {
LABEL_93:
                      id v64 = 0;
                    }
LABEL_95:
                    id v65 = (void *)[v52 copy];
                    [v65 setRepresentedString:v62];
                    [v65 setDisplayString:v57];
                    if (v64)
                    {
                      v133[0] = v64;
                      long long v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:1];
                      [v65 setSecondaryDisplayStrings:v66];
                    }
                    else
                    {
                      [v65 setSecondaryDisplayStrings:0];
                    }
                    [v65 setDisplayType:v117];
                    unsigned int v67 = NSString;
                    v68 = [v52 name];
                    CGRect v69 = [v65 representedString];
                    CGRect v70 = [v67 stringWithFormat:@"%@/%@", v68, v69];
                    [v65 setName:v70];

                    [v65 setOverrideDisplayString:0];
                    if ([v57 length] != 1
                      || (v71 = [v57 characterAtIndex:0], CGRect v72 = v115, v71 != 170)
                      && (v73 = [v57 characterAtIndex:0], CGRect v72 = v115, v73 != 186))
                    {
                      CGRect v72 = v48;
                    }
                    [v72 addObject:v65];

                    double v52 = v121;
                    self = v118;
                    unint64_t v15 = v119;
LABEL_103:

                    goto LABEL_104;
                  }
                  if (!v114)
                  {
                    id v64 = 0;
                    unint64_t v112 = 2;
                    goto LABEL_95;
                  }
                  if (objc_msgSend(v113, "longCharacterIsMember:", objc_msgSend(v124, "_firstLongCharacter")) & v111)goto LABEL_93; {
LABEL_104:
                  }

                  if (v120 == ++v54) {
                    goto LABEL_108;
                  }
                }
                id v64 = [v52 displayString];
                [v64 isEqualToString:v57];
                goto LABEL_103;
              }
              unint64_t v112 = 1;
LABEL_108:
              long long v129 = 0u;
              long long v130 = 0u;
              long long v127 = 0u;
              long long v128 = 0u;
              id v74 = v115;
              uint64_t v75 = [v74 countByEnumeratingWithState:&v127 objects:v132 count:16];
              if (v75)
              {
                uint64_t v76 = v75;
                uint64_t v77 = *(void *)v128;
                do
                {
                  for (uint64_t i = 0; i != v76; ++i)
                  {
                    if (*(void *)v128 != v77) {
                      objc_enumerationMutation(v74);
                    }
                    [v48 addObject:*(void *)(*((void *)&v127 + 1) + 8 * i)];
                  }
                  uint64_t v76 = [v74 countByEnumeratingWithState:&v127 objects:v132 count:16];
                }
                while (v76);
              }

              char v79 = v106;
              if ((v106 & 1) != 0 || [v48 count] >= v112)
              {
                id v4 = v121;
                [v121 updateVariantTypeForActions:v15];
                if ([(UIKBTree *)self->_keyplane isSplit])
                {
                  char v80 = [v107 _containsSubstring:@"strict"];
                  [v121 frame];
                  double v82 = v81;
                  [(UIKBTree *)self->_keyboard frame];
                  double v84 = @"right";
                  if (v82 < v83 * 0.5) {
                    double v84 = @"left";
                  }
                  double v85 = v84;

                  if (v80)
                  {
                    double v86 = [@"strictly-" stringByAppendingString:v85];

                    double v87 = v86;
                  }
                  else
                  {
                    double v87 = v85;
                  }
                  char v79 = v106;
                  double v107 = v87;
                }
                long long v20 = v102;
                if ((v79 & 1) == 0)
                {
                  [v121 setVariantPopupBias:v107];
                  [v121 setSubtrees:v48];
                }
                long long v88 = [(UIKeyboardLayoutStar *)self slideBehaviour];

                if (!v88)
                {
                  id v89 = objc_alloc_init(UISelectionFeedbackGenerator);
                  [(UIKeyboardLayoutStar *)self setSlideBehaviour:v89];

                  long long v90 = [(UIKeyboardLayoutStar *)self slideBehaviour];
                  [v90 userInteractionStarted];
                }
                long long v91 = [(UIKeyboardLayoutStar *)self slideBehaviour];
                [v91 selectionChanged];

                objc_msgSend(v121, "setSelectedVariantIndex:", -[UIKeyboardLayoutStar defaultSelectedVariantIndexForKey:withActions:](self, "defaultSelectedVariantIndexForKey:withActions:", v121, v15));
                unint64_t v92 = [(UIKeyboardLayoutStar *)self highlightedVariantListForStylingKey:v121];
                [v121 setHighlightedVariantsList:v92];

                [(UIKeyboardLayoutStar *)self setState:16 forKey:v121];
              }
              else
              {
                id v4 = v121;
                long long v20 = v102;
              }

              CGFloat v37 = v109;
              CGFloat v35 = v104;
              long long v38 = v105;
              CGFloat v36 = v103;
            }
          }
          goto LABEL_133;
        }
        double v33 = [MEMORY[0x1E4F1CA20] preferredLocale];
        CGFloat v34 = [v33 localeIdentifier];

        uint64_t v18 = UIKeyboardTopLevelDomainVariants(v34, 15);

        id v4 = v121;
        char v19 = 0;
      }
      long long v20 = v12;
      unint64_t v15 = v119;
      goto LABEL_40;
    }
    long long v20 = UIKeyboardGetCurrentInputMode();

    if (self->_swipeDetected) {
      uint64_t v21 = 23;
    }
    else {
      uint64_t v21 = 7;
    }
    id v22 = v11;
    long long v23 = v22;
    if ((v119 & 0x80000) != 0)
    {
      long long v23 = [(UIKeyboardLayoutStar *)self _keyplaneVariantsKeyForString:v22];
    }
    long long v24 = v20;
    if ([v121 displayType] == 7)
    {
      uint64_t v25 = [v121 secondaryRepresentedStrings];
      uint64_t v26 = [v25 count];

      if (v26)
      {
        uint64_t v27 = [v121 secondaryRepresentedStrings];
        uint64_t v28 = [v27 firstObject];
        uint64_t v29 = [v23 stringByAppendingString:v28];

        long long v23 = (void *)v29;
      }
      long long v20 = v24;
    }
    self = v118;
    CGFloat v30 = [(UIKeyboardLayout *)v118 getRomanAccentVariantsForString:v23 inputMode:v20 keyboardVariantIndludes:v21];
    if (v14 == 23)
    {
      unint64_t v15 = v119;
      if ([v121 displayType] == 7
        && [v121 interactionType] == 2)
      {
        if ([v121 variantType] != 3)
        {
          if (v118->_shift && !v118->_autoshift)
          {
            long long v94 = [v121 secondaryRepresentedStrings];
            v95 = [v94 objectAtIndex:0];
            BOOL v96 = v95;
            if (v95)
            {
              id v97 = v95;
            }
            else
            {
              v98 = [v121 representedString];
              id v97 = [v98 substringFromIndex:1];

              unint64_t v15 = v119;
            }

            self = v118;
            if ((v15 & 0x80000) != 0)
            {
              uint64_t v99 = [(UIKeyboardLayoutStar *)v118 _keyplaneVariantsKeyForString:v22];
              double v100 = v97;
              id v97 = (id)v99;
            }
            UIKeyboardRomanAccentVariants((uint64_t)v97, v24, v21);
            uint64_t v93 = v101 = v97;

            CGFloat v30 = v101;
            id v4 = v121;
          }
          else
          {
            id v4 = v121;
            uint64_t v93 = [(UIKeyboardLayoutStar *)v118 _variantsByAppendingDualStringKey:v121 toVariants:v30];
          }

          CGFloat v30 = (void *)v93;
          long long v20 = v24;
          goto LABEL_37;
        }
        id v4 = v121;
      }
      else
      {
        id v4 = v121;
      }
      long long v20 = v24;
    }
    else
    {
      id v4 = v121;
      unint64_t v15 = v119;
    }
LABEL_37:

    char v19 = 0;
    uint64_t v18 = v30;
    goto LABEL_40;
  }
  id v5 = [v4 name];
  int v6 = [v5 isEqualToString:@"EmojiPopupKey"];

  if (v6)
  {
    id v7 = [(UIKeyboardLayoutStar *)self slideBehaviour];

    if (!v7)
    {
      id v8 = objc_alloc_init(UISelectionFeedbackGenerator);
      [(UIKeyboardLayoutStar *)self setSlideBehaviour:v8];

      id v9 = [(UIKeyboardLayoutStar *)self slideBehaviour];
      [v9 userInteractionStarted];
    }
    uint64_t v10 = [(UIKeyboardLayoutStar *)self slideBehaviour];
    [v10 selectionChanged];
  }
LABEL_133:
}

- (BOOL)shouldShowIndicator
{
  if ([(UIKBTree *)self->_keyplane noLanguageIndicator]) {
    return 0;
  }
  id v4 = [(UIKBTree *)self->_keyplane keysByKeyName:@"International-Key"];
  BOOL v3 = [v4 count] != 0;

  return v3;
}

- (void)setHideKeysUnderIndicator:(BOOL)a3
{
  keysUnderIndicator = self->_keysUnderIndicator;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__UIKeyboardLayoutStar_setHideKeysUnderIndicator___block_invoke;
  v6[3] = &__block_descriptor_33_e12_v24__0_8_B16l;
  BOOL v7 = a3;
  [(NSMutableSet *)keysUnderIndicator enumerateObjectsUsingBlock:v6];
  if (!a3) {
    [(NSMutableSet *)self->_keysUnderIndicator removeAllObjects];
  }
}

uint64_t __50__UIKeyboardLayoutStar_setHideKeysUnderIndicator___block_invoke(uint64_t a1, void *a2)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 32)) {
    double v2 = 1.0;
  }
  return [a2 setAlpha:v2];
}

- (id)activationIndicatorView
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v4 = [v3 count];

  if (!v4)
  {
    uint64_t v16 = 0;
    goto LABEL_106;
  }
  inactiveLanguageIndicator = self->_inactiveLanguageIndicator;
  self->_inactiveLanguageIndicator = 0;

  if ((unint64_t)([(UIKeyboardLayout *)self orientation] - 3) > 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
  {
    BOOL v6 = 0;
  }
  else
  {
    double v160 = [(UIKBTree *)self->_keyplane cachedKeysByKeyName:@"Handwriting-Input"];
    BOOL v6 = [v160 count] != 0;
  }
  int v7 = [(UIKBTree *)self->_keyplane isSplit];
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
    int v7 = [(TUIKeyplaneView *)self->_liveKeyplaneView isSplit];
  }
  id v8 = UIKeyboardGetCurrentInputMode();
  id v9 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v8];
  double v164 = [v9 displayName];

  [(UIView *)self center];
  double v165 = v10;
  int64_t v11 = +[UIApplication _classicMode];
  unint64_t v12 = [(UIKeyboardLayout *)self orientation] - 3;
  int64_t v13 = [(UIKBScreenTraits *)self->super._screenTraits idiom];
  if (v12 > 1)
  {
    if (v13 != 1
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23)
    {
      double v15 = 140.0;
      goto LABEL_30;
    }
    double v14 = 320.0;
  }
  else
  {
    double v14 = 440.0;
    if (v13 != 1
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
      && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23)
    {
      double v15 = 150.0;
      goto LABEL_30;
    }
  }
  uint64_t v17 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v18 = [v17 preferencesActions];
  char v19 = v18;
  double v20 = 40.0;
  if (!v11) {
    double v20 = 0.0;
  }
  double v21 = v14 - v20;
  if (v7) {
    double v21 = 150.0;
  }
  [v18 rivenSizeFactor:v21];
  double v15 = v22;

LABEL_30:
  long long v23 = [(UIKBTree *)self->_keyplane keysOrderedByPositionWithoutZip];
  long long v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v23, "count"));
  long long v167 = 0u;
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  id v25 = v23;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v167 objects:v171 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v168;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v168 != v28) {
          objc_enumerationMutation(v25);
        }
        CGFloat v30 = *(void **)(*((void *)&v167 + 1) + 8 * i);
        if ([v30 visible]) {
          [v24 addObject:v30];
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v167 objects:v171 count:16];
    }
    while (v27);
  }

  uint64_t v31 = [v24 count];
  if (v6)
  {
    double v163 = 0;
    double v32 = 0;
  }
  else
  {
    unint64_t v33 = v31;
    float v34 = v15;
    double v162 = [v24 lastObject];
    [v162 frame];
    uint64_t v35 = 0;
    float v37 = v36;
    unint64_t v38 = v33 - 1;
    do
    {
      float v39 = v37;
      uint64_t v40 = v35;
      uint64_t v41 = v33 + v35;
      uint64_t v42 = v41 - 1;
      if (v41 == 1) {
        break;
      }
      CGFloat v43 = [v24 objectAtIndex:v41 - 2];
      [v43 frame];
      float v37 = v44;

      uint64_t v35 = v40 - 1;
    }
    while (v39 >= v37);
    if (v7)
    {
      [v162 frame];
      double v45 = (CGRectGetMaxX(v174) - v39) * 0.5;
      [v162 frame];
      if (v46 > v45)
      {
        do
        {
          int v47 = [v24 objectAtIndex:--v38];
          [v47 frame];
          double v49 = v48;
        }
        while (v49 > v45);
      }
      unint64_t v50 = v38 + 1;
      uint64_t v51 = [v24 objectAtIndex:v38 + 1];
      unint64_t v52 = ~v38;
      uint64_t v53 = (void *)v51;
      uint64_t v54 = objc_msgSend(v24, "subarrayWithRange:", v50, v33 + v52);
    }
    else
    {
      if (v33 <= 1) {
        uint64_t v55 = 1;
      }
      else {
        uint64_t v55 = 1 - v40;
      }
      int v56 = objc_msgSend(v24, "subarrayWithRange:", v42, v55);
      HIDWORD(v57) = HIDWORD(v165);
      *(float *)&double v57 = v165;
      int v58 = objc_msgSend(v56, "sortedArrayUsingFunction:context:", keyPositionSortByHorizontalDistanceFromPoint, objc_msgSend(NSNumber, "numberWithFloat:", v57));
      id v59 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_1115_0];
      uint64_t v54 = [v58 filteredArrayUsingPredicate:v59];

      uint64_t v53 = [v54 firstObject];
    }
    id v60 = (void *)[v53 copy];
    [v60 setName:@"LanguageIndicator"];
    if (([(UIKBTree *)self->_keyplane visualStyling] & 0xFF00) == 0x7F00) {
      uint64_t v61 = 4;
    }
    else {
      uint64_t v61 = 2;
    }
    [v60 setState:v61];
    id v62 = [v53 shape];
    BOOL v63 = (void *)[v62 copy];
    [v60 setShape:v63];

    objc_msgSend(v60, "setDisplayRowHint:", objc_msgSend(v53, "displayRowHint"));
    [v60 setDisplayType:25];
    [v60 setInteractionType:15];
    objc_msgSend(v60, "setGroupNeighbor:", objc_msgSend(v53, "groupNeighbor"));
    [v60 setRepresentedString:&stru_1ED0E84C0];
    [v60 setOverrideDisplayString:&stru_1ED0E84C0];
    [v60 setObject:0 forProperty:@"variant-type"];
    if ([v53 rendering]) {
      objc_msgSend(v60, "setRendering:", objc_msgSend(v53, "rendering"));
    }
    [v60 frame];
    double v64 = v165 - CGRectGetMidX(v175);
    if (v64 >= 0.0) {
      double v65 = v64;
    }
    else {
      double v65 = -v64;
    }
    [(NSMutableSet *)self->_keysUnderIndicator removeAllObjects];
    long long v66 = [(UIKeyboardLayoutStar *)self renderConfig];
    [v66 keycapOpacity];
    double v68 = v67;

    double v163 = v53;
    uint64_t v69 = [(UIKeyboardLayoutStar *)self viewForKey:v53];
    CGRect v70 = (void *)v69;
    if (v68 < 0.5 && v69) {
      [(NSMutableSet *)self->_keysUnderIndicator addObject:v69];
    }
    double v161 = v70;
    float v71 = v65;
    double v72 = v34;
    unint64_t v73 = 1;
    do
    {
      if (v73 >= objc_msgSend(v54, "count", v161)) {
        break;
      }
      id v74 = [v54 objectAtIndex:v73];
      if (([v74 avoidsLanguageIndicator] & 1) != 0
        || [v74 rendering] == 34
        && (unint64_t)([(UIKeyboardLayout *)self orientation] - 3) <= 1
        && ([v74 frame], v76 < v165))
      {
        ++v73;
        int v75 = 8;
      }
      else
      {
        [v60 frame];
        CGFloat v78 = v77;
        CGFloat v80 = v79;
        CGFloat v82 = v81;
        CGFloat v84 = v83;
        [v74 frame];
        v181.origin.double x = v85;
        v181.origin.double y = v86;
        v181.size.double width = v87;
        v181.size.double height = v88;
        v176.origin.double x = v78;
        v176.origin.double y = v80;
        v176.size.double width = v82;
        v176.size.double height = v84;
        CGRect v177 = CGRectUnion(v176, v181);
        double x = v177.origin.x;
        double y = v177.origin.y;
        double width = v177.size.width;
        double height = v177.size.height;
        uint64_t v93 = [(UIKeyboardLayoutStar *)self viewForKey:v74];
        long long v94 = (void *)v93;
        if (v68 < 0.5 && v93) {
          [(NSMutableSet *)self->_keysUnderIndicator addObject:v93];
        }
        v178.origin.double x = x;
        v178.origin.double y = y;
        v178.size.double width = width;
        v178.size.double height = height;
        double v95 = v165 - CGRectGetMidX(v178);
        if (v95 < 0.0) {
          double v95 = -v95;
        }
        float v96 = v95;
        [v60 frame];
        if (v97 < v72 || v71 > v96)
        {
          objc_msgSend(v60, "setFrame:", x, y, width, height);
          [v60 paddedFrame];
          CGFloat v99 = v98;
          CGFloat v101 = v100;
          CGFloat v103 = v102;
          CGFloat v105 = v104;
          [v74 paddedFrame];
          v182.origin.double x = v106;
          v182.origin.double y = v107;
          v182.size.double width = v108;
          v182.size.double height = v109;
          v179.origin.double x = v99;
          v179.origin.double y = v101;
          v179.size.double width = v103;
          v179.size.double height = v105;
          CGRect v180 = CGRectUnion(v179, v182);
          objc_msgSend(v60, "setPaddedFrame:", v180.origin.x, v180.origin.y, v180.size.width, v180.size.height);
          int v75 = 0;
          ++v73;
          float v71 = v96;
        }
        else
        {
          int v75 = 9;
        }
      }
    }
    while (v75 != 9);
    if (v73 == 1 && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 3) {
      [v60 setName:@"EnabledLanguageIndicator"];
    }
    else {
      objc_storeStrong((id *)&self->_inactiveLanguageIndicator, v60);
    }
    double v110 = (double *)UIKBRectsCreate(self->_keyplane, v60, 2);
    double v111 = v110[8];
    double v112 = v110[9];
    double v113 = v110[10];
    double v114 = v110[11];
    +[UIKBRenderFactory _graphicsQuality];
    double v32 = (UIImageView *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:keyplane:key:screenTraits:", self->_keyplane, v60, self->super._screenTraits, v111, v112, v113, v114);
    [(UIImageView *)v32 setScreenTraits:self->super._screenTraits];
    -[UIImageView setDrawFrame:](v32, "setDrawFrame:", v111, v112, v113, v114);
    v115 = [(UIKeyboardLayoutStar *)self renderConfig];
    [(UIImageView *)v32 setRenderConfig:v115];

    [(UIImageView *)v32 prepareForDisplay];
    free(v110);
    double v116 = [(UIView *)v32 layer];
    [v116 setAllowsGroupOpacity:0];
  }
  unsigned int v117 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Space-Key"];
  if (v117
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Unlabeled-Space-Key"],
        (unsigned int v117 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Unlabeled-Space-Key"],
        (unsigned int v117 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Ideographic-Space-Key"],
        (unsigned int v117 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v118 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
    unint64_t v119 = [v118 traitsForKey:v117 onKeyplane:self->_keyplane];
    uint64_t v120 = [v119 symbolStyle];
    [v120 fontSize];
    double v122 = v121;
  }
  else
  {
    double v122 = 16.0;
  }
  double v123 = [off_1E52D39B8 systemFontOfSize:v122];
  double v124 = v164;
  objc_msgSend(v164, "_legacy_sizeWithFont:", v123);
  double v126 = v125;
  double v128 = ceil(v127);
  if (v32 && v122 > 10.0)
  {
    [(UIView *)v32 frame];
    if (v128 + 8.0 <= v129) {
      goto LABEL_97;
    }
    do
    {
      long long v130 = v123;
      double v122 = v122 + -1.0;
      double v123 = [off_1E52D39B8 systemFontOfSize:v122];

      objc_msgSend(v164, "_legacy_sizeWithFont:", v123);
      double v126 = v131;
      double v128 = ceil(v132);
      if (v122 <= 10.0) {
        break;
      }
      [(UIView *)v32 frame];
    }
    while (v128 + 8.0 > v133);
  }
  if (!v32)
  {
    int64_t v138 = [(UIKeyboardLayout *)self orientation];
    v139 = +[UIKeyboardInputModeController sharedInputModeController];
    double v140 = [v139 currentInputMode];
    int64_t v141 = v138;
    double v124 = v164;
    +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:v141 inputMode:v140];
    double v143 = v142;

    double v135 = ceil(v165 + v128 * -0.5);
    [(UIView *)self bounds];
    float v137 = floor(v144 - v126 + -8.0 - v143);
    if ((unint64_t)([(UIKeyboardLayout *)self orientation] - 3) < 2) {
      float v137 = v137 + -1.0;
    }
    goto LABEL_100;
  }
LABEL_97:
  [(UIView *)v32 frame];
  double v135 = (v134 - v128) * 0.5;
  [(UIView *)v32 frame];
  float v137 = (v136 - v126) * 0.5;
LABEL_100:
  float v145 = v135;
  v166 = +[UIKBRenderGeometry geometryWithFrame:paddedFrame:](UIKBRenderGeometry, "geometryWithFrame:paddedFrame:", 0.0, 0.0, v128, v126, 0.0, 0.0, v128, v126);
  id v146 = +[UIKBRenderTraits traitsWithGeometry:](UIKBRenderTraits, "traitsWithGeometry:");
  BOOL v147 = +[UIKBTextStyle styleWithFontName:@"UIKBRenderFactorySystemFontName" withFontSize:v122];
  [v146 setSymbolStyle:v147];

  v148 = [(UIKeyboardLayoutStar *)self renderConfig];
  int v149 = [v148 whiteText];
  v150 = UIKBColorWhite;
  if (!v149) {
    v150 = UIKBColorBlack;
  }
  BOOL v151 = *v150;
  double v152 = [v146 symbolStyle];
  [v152 setTextColor:v151];

  double v153 = +[UIKBKeyDisplayContents displayContents];
  [v153 setDisplayString:v124];
  double v154 = UIKBScale();
  double v155 = +[UIKBRenderer rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:](UIKBRenderer, "rendererWithContext:withSize:withScale:opaque:renderFlags:assetIdiom:", 0, 0, 255, UIKeyboardGetCurrentIdiom(), v128, v126, v154);
  [v155 renderKeyContents:v153 withTraits:v146];
  double v156 = [UIImageView alloc];
  double v157 = [v155 renderedImage];
  double v158 = [(UIImageView *)v156 initWithImage:v157];

  [(UIView *)v158 frame];
  -[UIImageView setFrame:](v158, "setFrame:", v145, v137, v128, v126);
  if (v32) {
    [(UIView *)v32 addSubview:v158];
  }
  else {
    double v32 = v158;
  }

  uint64_t v16 = v32;
LABEL_106:
  return v16;
}

uint64_t __47__UIKeyboardLayoutStar_activationIndicatorView__block_invoke(uint64_t a1, void *a2)
{
  return [a2 avoidsLanguageIndicator] ^ 1;
}

- (BOOL)shouldDeactivateWithoutWindow
{
  return 1;
}

- (unint64_t)targetEdgesForScreenGestureRecognition
{
  return 4 * ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardLayoutStar;
  [(UIView *)&v10 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIView setFrame:](self->_keyplaneTransformationAreaView, "setFrame:");
  if (+[UIKeyboard resizable])
  {
    [(UIView *)self->_keyplaneView frame];
    if (v8 != v4 || v7 != v6) {
      [(UIKeyboardLayoutStar *)self resizeKeyplaneAndRedraw:0];
    }
  }
}

- (unsigned)getHandRestRecognizerState
{
  if (qword_1EB25AB98 != -1) {
    dispatch_once(&qword_1EB25AB98, &__block_literal_global_1134);
  }
  if (!_MergedGlobals_77) {
    return 0;
  }
  if ([(UIKBTree *)self->_keyplane isSplit]) {
    return 0;
  }
  double v3 = +[UIPeripheralHost sharedInstance];
  char v4 = [v3 isUndocked];

  if (v4) {
    return 0;
  }
  double v7 = [(UIKBTree *)self->_keyplane objectForProperty:@"restable"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 isEqualToString:@"nohomerow"])
  {
    unsigned __int8 v5 = 2;
  }
  else
  {
    objc_opt_class();
    unsigned __int8 v5 = (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue] & 1) != 0;
  }

  return v5;
}

void __50__UIKeyboardLayoutStar_getHandRestRecognizerState__block_invoke()
{
  if (_UIInternalPreferencesRevisionOnce != -1) {
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
  }
  int v0 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar < 1) {
    goto LABEL_4;
  }
  int v1 = _UIInternalPreference__UIRestablePadKeyboardsEnabled;
  if (_UIInternalPreferencesRevisionVar == _UIInternalPreference__UIRestablePadKeyboardsEnabled) {
    goto LABEL_4;
  }
  while (v0 >= v1)
  {
    _UIInternalPreferenceSync(v0, &_UIInternalPreference__UIRestablePadKeyboardsEnabled, @"_UIRestablePadKeyboardsEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    int v1 = _UIInternalPreference__UIRestablePadKeyboardsEnabled;
    if (v0 == _UIInternalPreference__UIRestablePadKeyboardsEnabled) {
      goto LABEL_4;
    }
  }
  if (!byte_1EB25769C)
  {
LABEL_4:
    _MergedGlobals_77 = 0;
  }
  else
  {
    id v4 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v2 = [v4 preferencesActions];
    [v2 rivenSizeFactor:1.0];
    _MergedGlobals_77 = v3 <= 1.0;
  }
}

- (BOOL)handRestRecognizerShouldNeverIgnoreTouchState:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 forRestingState:(unint64_t)a6 otherRestedTouchLocations:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  double v11 = a4.y;
  double v12 = a4.x;
  id v14 = a3;
  id v15 = a7;
  if (v14) {
    int v16 = [v14 phase] == 0;
  }
  else {
    int v16 = 0;
  }
  uint64_t v17 = -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", v12, v11);
  if (v17)
  {
    uint64_t v18 = 0x21E00FA0F2;
    if ([v15 count])
    {
      [(UIView *)self bounds];
      if (v12 <= v19 * 0.5)
      {
        double v20 = (double *)v34;
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        double v21 = __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke;
      }
      else
      {
        double v20 = (double *)&v32;
        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        double v21 = __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke_2;
      }
      *((void *)v20 + 2) = v21;
      *((void *)v20 + 3) = &__block_descriptor_56_e24_B32__0__NSValue_8Q16_B24l;
      v20[4] = v12;
      v20[5] = v11;
      v20[6] = v19 * 0.5;
      double v22 = objc_msgSend(v15, "indexesOfObjectsPassingTest:", v32, v33);
      long long v23 = [v15 objectsAtIndexes:v22];

      unint64_t v24 = [v23 count];
      if (v24 > 1) {
        uint64_t v18 = 0x21C00FA052;
      }
      if (v14 && v24 >= 2)
      {
        int v16 = [v14 phase] != 0;
        uint64_t v18 = 0x21C00FA052;
      }
      if ([v17 interactionType] == 15
        || [v17 interactionType] == 13)
      {
        v18 |= 1uLL;
      }
    }
    unint64_t v25 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v17];
    if ([v17 interactionType] == 2)
    {
      if ([(UIKeyboardLayoutStar *)self keyHasAccentedVariants:v17])
      {
        uint64_t v26 = [v17 name];
        int v27 = [v26 hasPrefix:@"Assist"];

        if (!v27) {
          v25 |= 0x8080uLL;
        }
      }
    }
    unint64_t v28 = v25 & v18;
    if (a6 != 1 && !v28) {
      unint64_t v28 = [(UIKeyboardLayoutStar *)self upActionFlagsForKey:v17] & v18;
    }
    if (v28) {
      int v16 = 1;
    }
    if ([v17 displayTypeHint] == 10) {
      int v16 = 1;
    }
    if ([v17 interactionType] == 16) {
      v16 |= ([v17 state] & 0x10) >> 4;
    }
    if (v14 && a6 != 1 && !v16 && [v14 phase])
    {
LABEL_35:
      uint64_t v29 = -[UIKeyboardLayoutStar keyHitTestClosestToPoint:](self, "keyHitTestClosestToPoint:", x, y);
      LOBYTE(v16) = v29 == v17;

      goto LABEL_41;
    }
    char v30 = v16 ^ 1;
    if (a6 == 2) {
      char v30 = 1;
    }
    if ((v30 & 1) == 0)
    {
      if (self->_activeKey
        || [v17 interactionType] != 1
        && [v17 interactionType] != 2)
      {
        LOBYTE(v16) = 1;
        goto LABEL_41;
      }
      goto LABEL_35;
    }
  }
LABEL_41:

  return v16;
}

BOOL __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke(uint64_t a1, void *a2)
{
  [a2 CGPointValue];
  return v4 < *(double *)(a1 + 40) && v3 <= *(double *)(a1 + 48);
}

BOOL __130__UIKeyboardLayoutStar_handRestRecognizerShouldNeverIgnoreTouchState_fromPoint_toPoint_forRestingState_otherRestedTouchLocations___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 CGPointValue];
  return v4 < *(double *)(a1 + 40) && v3 >= *(double *)(a1 + 48);
}

- (id)getSortedKeysForDisplayRowHint:(int)a3
{
  double v4 = [(UIKBTree *)self->_keyplane keys];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke;
  v11[3] = &__block_descriptor_36_e25_B32__0__UIKBTree_8Q16_B24l;
  int v12 = a3;
  unsigned __int8 v5 = [v4 indexesOfObjectsPassingTest:v11];
  double v6 = [v4 objectsAtIndexes:v5];

  double v7 = [v6 indexesOfObjectsPassingTest:&__block_literal_global_1140_0];
  double v8 = [v6 objectsAtIndexes:v7];

  id v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_1142];

  return v9;
}

BOOL __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayRowHint] == *(_DWORD *)(a1 + 32);
}

BOOL __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 interactionType] == 1)
  {
    double v3 = [v2 representedString];
    if ([v3 length]) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = [v2 interactionType] == 2;
    }
  }
  else
  {
    BOOL v4 = [v2 interactionType] == 2;
  }

  return v4;
}

uint64_t __55__UIKeyboardLayoutStar_getSortedKeysForDisplayRowHint___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 frame];
  double v6 = v5;
  [v4 frame];
  double v8 = v7;

  if (v6 - v8 < 0.0) {
    return -1;
  }
  else {
    return v6 - v8 > 0.0;
  }
}

- (id)handRestRecognizerGetHomeRowHint
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  homeRowHint = self->_homeRowHint;
  if (!homeRowHint)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v18[0] = @"Caps-Lock-Key";
    v18[1] = @"Roman-to-Non-Roman-Switch-Key";
    v18[2] = @"Non-Roman-to-Roman-Switch-Key";
    v18[3] = @"Return-Key";
    id v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 4, 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:*(void *)(*((void *)&v14 + 1) + 8 * i)];
          if (v9)
          {
            objc_super v10 = v9;
            objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v9, "displayRowHint"));
            double v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            int v12 = self->_homeRowHint;
            self->_homeRowHint = v11;

            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    homeRowHint = self->_homeRowHint;
  }
  return homeRowHint;
}

- (CGSize)handRestRecognizerStandardKeyPixelSize
{
  double v3 = [(UIKeyboardLayoutStar *)self handRestRecognizerGetHomeRowHint];
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = [v3 intValue];
  int v6 = v5;
  uint64_t v7 = [(UIKeyboardLayoutStar *)self getSortedKeysForDisplayRowHint:v5];
  double v8 = [(UIKeyboardLayoutStar *)self getSortedKeysForDisplayRowHint:(v6 - 1)];
  if ((unint64_t)[v7 count] < 5 || (unint64_t)objc_msgSend(v8, "count") <= 3)
  {

LABEL_6:
    v26.receiver = self;
    v26.super_class = (Class)UIKeyboardLayoutStar;
    [(UIKeyboardLayout *)&v26 handRestRecognizerStandardKeyPixelSize];
    double v20 = v22;
    double v21 = v23;
    goto LABEL_7;
  }
  id v9 = [v8 objectAtIndex:3];
  [v9 frame];
  double v11 = v10;

  int v12 = [v7 objectAtIndex:3];
  [v12 frame];
  double v14 = v13;
  double v16 = v15;

  long long v17 = [v7 objectAtIndex:4];
  [v17 frame];
  double v19 = v18;

  double v20 = v19 - v14;
  double v21 = v16 - v11;

LABEL_7:
  double v24 = v20;
  double v25 = v21;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (id)handRestRecognizerSilenceNextTouchDown
{
  return 0;
}

- (void)handRestRecognizerNotifyRestForBegin:(BOOL)a3 location:(CGPoint)a4 timestamp:(double)a5 pathIndex:(int)a6 touchUUID:(id)a7 context:(id)a8
{
  double y = a4.y;
  double x = a4.x;
  BOOL v13 = a3;
  id v20 = a8;
  id v15 = a7;
  double v16 = +[UIKeyboardImpl activeInstance];
  unint64_t v17 = [(UIKeyboardLayout *)self fingerIDForTouchUUID:v15];

  if (v13) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = 5;
  }
  double v19 = objc_msgSend(MEMORY[0x1E4FAE3A8], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:", v18, a6, v17, -1, x, y, 1.0, a5);
  if (v13)
  {
    [v16 performHitTestForTouchEvent:v19 executionContextPassingNSNumber:v20];
  }
  else
  {
    [v16 skipHitTestForTouchEvent:v19];
    [v20 returnExecutionToParent];
  }
}

- (CGPoint)getCenterForKeyUnderLeftIndexFinger
{
  double v3 = [(UIKeyboardLayoutStar *)self handRestRecognizerGetHomeRowHint];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", [v3 intValue]);
    if ((unint64_t)[v5 count] > 6)
    {
      double v10 = [v5 objectAtIndex:3];
      [v10 frame];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;

      v23.origin.double x = v12;
      v23.origin.double y = v14;
      v23.size.double width = v16;
      v23.size.double height = v18;
      CGFloat MidX = CGRectGetMidX(v23);
      v24.origin.double x = v12;
      v24.origin.double y = v14;
      v24.size.double width = v16;
      v24.size.double height = v18;
      CGFloat MidY = CGRectGetMidY(v24);

      goto LABEL_6;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v21 getCenterForKeyUnderLeftIndexFinger];
  CGFloat MidX = v6;
  CGFloat MidY = v8;
LABEL_6:

  double v19 = MidX;
  double v20 = MidY;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (CGPoint)getCenterForKeyUnderRightIndexFinger
{
  double v3 = [(UIKeyboardLayoutStar *)self handRestRecognizerGetHomeRowHint];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = -[UIKeyboardLayoutStar getSortedKeysForDisplayRowHint:](self, "getSortedKeysForDisplayRowHint:", [v3 intValue]);
    if ((unint64_t)[v5 count] > 6)
    {
      double v10 = [v5 objectAtIndex:6];
      [v10 frame];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;

      v23.origin.double x = v12;
      v23.origin.double y = v14;
      v23.size.double width = v16;
      v23.size.double height = v18;
      CGFloat MidX = CGRectGetMidX(v23);
      v24.origin.double x = v12;
      v24.origin.double y = v14;
      v24.size.double width = v16;
      v24.size.double height = v18;
      CGFloat MidY = CGRectGetMidY(v24);

      goto LABEL_6;
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v21 getCenterForKeyUnderLeftIndexFinger];
  CGFloat MidX = v6;
  CGFloat MidY = v8;
LABEL_6:

  double v19 = MidX;
  double v20 = MidY;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (id)getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow:(int64_t)a3
{
  uint64_t v5 = [(UIKeyboardLayoutStar *)self handRestRecognizerGetHomeRowHint];
  double v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 intValue];
    double v8 = [(UIKeyboardLayoutStar *)self getSortedKeysForDisplayRowHint:v7];
    if ([v8 count])
    {
      uint64_t v9 = [v8 count];
      if ((unint64_t)(v9 - 1) >= 4) {
        uint64_t v10 = 4;
      }
      else {
        uint64_t v10 = v9 - 1;
      }
      double v11 = [v8 objectAtIndex:v10];
      [v11 frame];
      double v13 = v12;
      CGFloat v15 = v14;
      double v17 = v16;
      CGFloat v19 = v18;

      float v20 = v17 * 0.05;
      CGFloat v21 = floorf(v20);
      v36.origin.CGFloat x = v13;
      v36.origin.CGFloat y = v15;
      v36.size.CGFloat width = v17;
      v36.size.CGFloat height = v19;
      CGRect v37 = CGRectInset(v36, v21, 0.0);
      CGFloat x = v37.origin.x;
      CGFloat y = v37.origin.y;
      CGFloat width = v37.size.width;
      CGFloat height = v37.size.height;
      objc_super v26 = [(UIKeyboardLayoutStar *)self getSortedKeysForDisplayRowHint:(v7 + a3)];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __78__UIKeyboardLayoutStar_getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow___block_invoke;
      v34[3] = &__block_descriptor_72_e25_B32__0__UIKBTree_8Q16_B24l;
      v34[4] = a3;
      *(CGFloat *)&v34[5] = x;
      *(CGFloat *)&v34[6] = y;
      *(CGFloat *)&void v34[7] = width;
      *(CGFloat *)&v34[8] = height;
      int v27 = [v26 indexesOfObjectsPassingTest:v34];
      unint64_t v28 = [v26 objectsAtIndexes:v27];

      if ([v28 count])
      {
        uint64_t v29 = NSNumber;
        char v30 = [v28 objectAtIndex:0];
        [v30 frame];
        uint64_t v32 = [v29 numberWithDouble:v31 - v13];
      }
      else
      {
        uint64_t v32 = 0;
      }
    }
    else
    {
      uint64_t v32 = 0;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }

  return v32;
}

BOOL __78__UIKeyboardLayoutStar_getHorizontalOffsetFromHomeRowForRowRelativeToHomeRow___block_invoke(uint64_t a1, void *a2)
{
  [a2 frame];
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v9 = v5;
  CGFloat v10 = v6;
  if ((*(void *)(a1 + 32) & 0x8000000000000000) != 0)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v3);
    if (MinX <= CGRectGetMinX(*(CGRect *)(a1 + 40)))
    {
      double v12 = CGRectGetMinX(*(CGRect *)(a1 + 40));
      goto LABEL_7;
    }
    return 0;
  }
  double v11 = CGRectGetMinX(*(CGRect *)(a1 + 40));
  v15.origin.CGFloat x = v7;
  v15.origin.CGFloat y = v8;
  v15.size.CGFloat width = v9;
  v15.size.CGFloat height = v10;
  if (v11 > CGRectGetMinX(v15)) {
    return 0;
  }
  v16.origin.CGFloat x = v7;
  v16.origin.CGFloat y = v8;
  v16.size.CGFloat width = v9;
  v16.size.CGFloat height = v10;
  double v12 = CGRectGetMinX(v16);
  CGFloat v7 = *(double *)(a1 + 40);
  CGFloat v8 = *(double *)(a1 + 48);
  CGFloat v9 = *(double *)(a1 + 56);
  CGFloat v10 = *(double *)(a1 + 64);
LABEL_7:
  v17.origin.CGFloat x = v7;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v10;
  return v12 <= CGRectGetMaxX(v17);
}

- (BOOL)_handRestRecognizerCancelShouldBeEnd
{
  return [(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected];
}

- (void)setNeedsVirtualDriftUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v3 setNeedsVirtualDriftUpdate];
  if ([(UIKeyboardLayout *)self supportsVirtualDrift]) {
    [(UIKeyboardLayoutStar *)self updateKeyCentroids];
  }
}

- (void)resetHRRLayoutState
{
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v3 resetHRRLayoutState];
  [(UIKeyboardLayoutStar *)self clearAllTouchInfo];
}

- (void)calculateReachabilityScoreWithKey:(id)a3 keyError:(CGPoint)a4
{
  double x = a4.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->_leftSideReachability)
  {
    CGFloat v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    leftSideReachabilitCGFloat y = self->_leftSideReachability;
    self->_leftSideReachabilitCGFloat y = v7;
  }
  if (!self->_rightSideReachability)
  {
    CGFloat v9 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:20];
    rightSideReachabilitCGFloat y = self->_rightSideReachability;
    self->_rightSideReachabilitCGFloat y = v9;
  }
  if ([(NSMutableSet *)self->_leftKeySet containsObject:v6])
  {
    double v11 = self->_leftSideReachability;
LABEL_9:
    double v12 = [NSNumber numberWithDouble:x];
    [(NSMutableArray *)v11 addObject:v12];

    goto LABEL_10;
  }
  if ([(NSMutableSet *)self->_rightKeySet containsObject:v6])
  {
    double v11 = self->_rightSideReachability;
    goto LABEL_9;
  }
LABEL_10:
  if ((unint64_t)[(NSMutableArray *)self->_leftSideReachability count] < 5
    || (unint64_t)[(NSMutableArray *)self->_rightSideReachability count] < 5)
  {
    goto LABEL_42;
  }
  if ((unint64_t)[(NSMutableArray *)self->_leftSideReachability count] >= 0x15) {
    -[NSMutableArray removeObjectsInRange:](self->_leftSideReachability, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_leftSideReachability count] - 20);
  }
  if ((unint64_t)[(NSMutableArray *)self->_rightSideReachability count] >= 0x15) {
    -[NSMutableArray removeObjectsInRange:](self->_rightSideReachability, "removeObjectsInRange:", 0, [(NSMutableArray *)self->_rightSideReachability count] - 20);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  double v13 = self->_leftSideReachability;
  uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
  double v15 = 0.0;
  double v16 = 0.0;
  if (v14)
  {
    uint64_t v17 = v14;
    uint64_t v18 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v37 + 1) + 8 * i) doubleValue];
        double v16 = v16 + v20;
      }
      uint64_t v17 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v17);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  CGFloat v21 = self->_rightSideReachability;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    double v15 = 0.0;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * j), "doubleValue", (void)v33);
        double v15 = v15 + v26;
      }
      uint64_t v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v23);
  }

  double v27 = v16 / (double)(unint64_t)[(NSMutableArray *)self->_leftSideReachability count];
  double v28 = v15 / (double)(unint64_t)[(NSMutableArray *)self->_rightSideReachability count];
  double v29 = fabs(v28);
  if (v27 > 8.0 && v29 < 8.0)
  {
    double v32 = ceil(v27);
    goto LABEL_41;
  }
  if (fabs(v27) < 8.0 && v28 < -8.0)
  {
    double v32 = floor(v28);
LABEL_41:
    +[_UIKeyboardUsageTracking keyboardReachabilityDistribution:](_UIKeyboardUsageTracking, "keyboardReachabilityDistribution:", v32, (void)v33);
  }
LABEL_42:
}

- (double)biasedKeyboardWidthRatio
{
  id v2 = +[UIKeyboardImpl keyboardScreen];
  [v2 _unjailedReferenceBounds];
  double v4 = v3;

  return 320.0 / v4;
}

- (int64_t)currentHandBias
{
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 3)
  {
    screenTraits = self->super._screenTraits;
    if (!screenTraits || !screenTraits->_isStickerPickerServiceCollectionView)
    {
      liveKeyplaneView = self->_liveKeyplaneView;
      CGFloat v7 = +[UIKeyboardImpl activeInstance];
      int v8 = [v7 allowsReachableKeyboard];
      if (liveKeyplaneView)
      {
        if (v8)
        {
          uint64_t currentHandBias = [(TUIKeyplaneView *)self->_liveKeyplaneView currentHandBias];
LABEL_12:

          return currentHandBias;
        }
      }
      else if (v8)
      {
        uint64_t currentHandBias = self->_currentHandBias;
        goto LABEL_12;
      }
      uint64_t currentHandBias = 0;
      goto LABEL_12;
    }
  }
  return 0;
}

- (void)setKeyboardBias:(int64_t)a3
{
  screenTraits = self->super._screenTraits;
  if (!screenTraits || !screenTraits->_isStickerPickerServiceCollectionView)
  {
    if (self->_currentHandBias != a3
      || [(UIKeyboardLayoutStar *)self useCrescendoLayout]
      && (id v6 = self->_liveKeyplaneView) != 0
      && (int64_t currentHandBias = self->_currentHandBias,
          currentHandBias != [(TUIKeyplaneView *)v6 currentHandBias]))
    {
      self->_int64_t currentHandBias = a3;
      if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
      {
        liveKeyplaneView = self->_liveKeyplaneView;
        if (liveKeyplaneView) {
          [(TUIKeyplaneView *)liveKeyplaneView setKeyboardBias:a3];
        }
      }
      [(UIKeyboardLayoutStar *)self reloadCurrentKeyplane];
      +[_UIKeyboardUsageTracking countReachableKeyboardHandBiasChangeToBias:a3];
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 postNotificationName:@"UIKeyboardHandBiasDidChangeNotification" object:0 userInfo:0];
    }
  }
}

- (void)_setBiasEscapeButtonVisible:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(UIKeyboardLayoutStar *)self currentHandBias];
  biasEscapeButtouint64_t n = self->_biasEscapeButton;
  if (v3 && v5)
  {
    if (!biasEscapeButton)
    {
      CGFloat v7 = [UIButton alloc];
      int v8 = -[UIButton initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      id v9 = self->_biasEscapeButton;
      self->_biasEscapeButtouint64_t n = v8;

      [(UIView *)self->_biasEscapeButton setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_biasEscapeButton setContentMode:4];
      [(UIControl *)self->_biasEscapeButton addTarget:self action:sel__didTapBiasEscapeButton_ forControlEvents:64];
      [(UIView *)self addSubview:self->_biasEscapeButton];
      CGFloat v10 = [(UIView *)self->_biasEscapeButton centerYAnchor];
      double v11 = [(UIView *)self centerYAnchor];
      double v12 = [v10 constraintEqualToAnchor:v11];
      [v12 setActive:1];

      biasEscapeButtouint64_t n = self->_biasEscapeButton;
    }
    [(UIView *)biasEscapeButton setHidden:0];
    [(UIView *)self frame];
    double v14 = v13;
    [(UIKeyboardLayoutStar *)self biasedKeyboardWidthRatio];
    double v16 = v14 * (1.0 - v15);
    double v17 = v16 * 0.25 + -15.0;
    id v43 = +[UIColor whiteColor];
    uint64_t v18 = [(UIKeyboardLayoutStar *)self renderConfig];
    char v19 = [v18 lightKeyboard];

    if (v19)
    {
      if (![(UIKeyboardLayoutStar *)self isHandwritingPlane]
        && ![(UIKeyboardLayoutStar *)self isEmojiKeyplane])
      {
LABEL_14:
        uint64_t v22 = +[UIImage kitImageNamed:@"bias_escape_chevron.png"];
        uint64_t v23 = [v22 _flatImageWithColor:v43];

        [(UIKBTree *)self->_keyplane frame];
        double v25 = v24;
        [v23 size];
        double v27 = (v25 - v26) * 0.5 + -15.0;
        [v23 size];
        double v29 = v16 * 3.0 / 5.0 - (v17 + v28 + 15.0);
        if (v29 <= 15.0) {
          double v30 = v29;
        }
        else {
          double v30 = 15.0;
        }
        if (v5 == 1)
        {
          [(UIButton *)self->_biasEscapeButton setImage:v23 forState:0];
          -[UIButton setContentEdgeInsets:](self->_biasEscapeButton, "setContentEdgeInsets:", v27, 15.0, v27, v30);
          biasEscapeButtonLeftConstraint = self->_biasEscapeButtonLeftConstraint;
          if (!biasEscapeButtonLeftConstraint)
          {
            double v32 = [(UIView *)self->_biasEscapeButton leftAnchor];
            long long v33 = [(UIView *)self leftAnchor];
            long long v34 = [v32 constraintEqualToAnchor:v33 constant:v17];
            long long v35 = self->_biasEscapeButtonLeftConstraint;
            self->_biasEscapeButtonLeftConstraint = v34;

            biasEscapeButtonLeftConstraint = self->_biasEscapeButtonLeftConstraint;
          }
          [(NSLayoutConstraint *)biasEscapeButtonLeftConstraint setConstant:v17];
          [(NSLayoutConstraint *)self->_biasEscapeButtonLeftConstraint setActive:1];
          [(NSLayoutConstraint *)self->_biasEscapeButtonRightConstraint setActive:0];
        }
        else
        {
          long long v36 = [v23 imageWithHorizontallyFlippedOrientation];
          [(UIButton *)self->_biasEscapeButton setImage:v36 forState:0];
          -[UIButton setContentEdgeInsets:](self->_biasEscapeButton, "setContentEdgeInsets:", v27, v30, v27, 15.0);
          biasEscapeButtonRightConstraint = self->_biasEscapeButtonRightConstraint;
          if (biasEscapeButtonRightConstraint)
          {
            double v38 = -v17;
          }
          else
          {
            long long v39 = [(UIView *)self->_biasEscapeButton rightAnchor];
            long long v40 = [(UIView *)self rightAnchor];
            double v38 = -v17;
            uint64_t v41 = [v39 constraintEqualToAnchor:v40 constant:v38];
            uint64_t v42 = self->_biasEscapeButtonRightConstraint;
            self->_biasEscapeButtonRightConstraint = v41;

            biasEscapeButtonRightConstraint = self->_biasEscapeButtonRightConstraint;
          }
          [(NSLayoutConstraint *)biasEscapeButtonRightConstraint setConstant:v38];
          [(NSLayoutConstraint *)self->_biasEscapeButtonRightConstraint setActive:1];
          [(NSLayoutConstraint *)self->_biasEscapeButtonLeftConstraint setActive:0];
        }

        return;
      }
      uint64_t v20 = +[UIColor blackColor];
    }
    else
    {
      uint64_t v20 = +[UIColor colorWithWhite:0.353 alpha:1.0];
    }
    CGFloat v21 = (void *)v20;

    id v43 = v21;
    goto LABEL_14;
  }
  [(UIView *)biasEscapeButton setHidden:1];
}

- (void)_didTapBiasEscapeButton:(id)a3
{
  [(UIKeyboardLayoutStar *)self setKeyboardBias:0];
  BOOL v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v4 = [v3 preferencesActions];
  [v4 setHandBias:0];

  id v5 = +[UIKeyboardImpl activeInstance];
  [v5 updateForHandBiasChange];
}

- (BOOL)keyplaneUsesResizingOffset
{
  if ([(UIKBScreenTraits *)self->super._screenTraits resizeKeyboardHeight]) {
    return 1;
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
  {
    return 0;
  }
  id v5 = [(UIKBTree *)self->_keyboard name];
  if ([v5 _containsSubstring:@"HWR"])
  {
    id v6 = [(UIKBTree *)self->_keyplane name];
    char v3 = [v6 containsString:@"Portrait"];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)keyplaneSupportsResizingGesture
{
  BOOL v3 = [(UIKeyboardLayoutStar *)self keyplaneUsesResizingOffset];
  if (v3)
  {
    LOBYTE(v3) = [(UIKeyboardLayoutStar *)self isHandwritingPlane];
  }
  return v3;
}

- (void)resizeKeyplaneAndRedraw:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([(UIKeyboardLayoutStar *)self keyplaneUsesResizingOffset]
    || +[UIKeyboard resizable])
  {
    [(UIKBTree *)self->_keyplane frame];
    double v6 = v5;
    double v8 = v7;
    [(UIKeyboardLayoutStar *)self _addResizeTransformationsIfNecessary];
    [(UIKBTree *)self->_keyplane frame];
    if (v6 != v10 || v8 != v9)
    {
      [(UIKeyboardLayoutStar *)self updateKeyboardForKeyplane:self->_keyplane];
      if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
      {
        liveKeyplaneView = self->_liveKeyplaneView;
        [(UIView *)self bounds];
        -[TUIKeyplaneView updateToSize:](liveKeyplaneView, "updateToSize:", v13, v14);
      }
      else
      {
        BOOL v33 = v3;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        obuint64_t j = [(UIKBTree *)self->_keyplane subtrees];
        uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v36)
        {
          uint64_t v35 = *(void *)v47;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v47 != v35) {
                objc_enumerationMutation(obj);
              }
              uint64_t v37 = v15;
              double v16 = *(void **)(*((void *)&v46 + 1) + 8 * v15);
              long long v42 = 0u;
              long long v43 = 0u;
              long long v44 = 0u;
              long long v45 = 0u;
              double v17 = [v16 keySet];
              uint64_t v18 = [v17 subtrees];

              uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
              if (v19)
              {
                uint64_t v20 = v19;
                uint64_t v21 = *(void *)v43;
                do
                {
                  uint64_t v22 = 0;
                  do
                  {
                    if (*(void *)v43 != v21) {
                      objc_enumerationMutation(v18);
                    }
                    uint64_t v23 = *(void **)(*((void *)&v42 + 1) + 8 * v22);
                    long long v38 = 0u;
                    long long v39 = 0u;
                    long long v40 = 0u;
                    long long v41 = 0u;
                    double v24 = [v23 subtrees];
                    uint64_t v25 = [v24 countByEnumeratingWithState:&v38 objects:v50 count:16];
                    if (v25)
                    {
                      uint64_t v26 = v25;
                      uint64_t v27 = *(void *)v39;
                      do
                      {
                        uint64_t v28 = 0;
                        do
                        {
                          if (*(void *)v39 != v27) {
                            objc_enumerationMutation(v24);
                          }
                          [(UIKBKeyplaneView *)self->_keyplaneView updateFrameForKey:*(void *)(*((void *)&v38 + 1) + 8 * v28++)];
                        }
                        while (v26 != v28);
                        uint64_t v26 = [v24 countByEnumeratingWithState:&v38 objects:v50 count:16];
                      }
                      while (v26);
                    }

                    ++v22;
                  }
                  while (v22 != v20);
                  uint64_t v20 = [v18 countByEnumeratingWithState:&v42 objects:v51 count:16];
                }
                while (v20);
              }

              uint64_t v15 = v37 + 1;
            }
            while (v37 + 1 != v36);
            uint64_t v36 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
          }
          while (v36);
        }

        BOOL v3 = v33;
      }
      [(UIView *)self bounds];
      double v31 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v29, v30);
      if (![(UIKeyboardLayoutStar *)self useCrescendoLayout])
      {
        [(UIKBKeyplaneView *)self->_keyplaneView setSuppressDrawing:!v3];
        [v31 size];
        -[UIView setSize:](self->_keyplaneView, "setSize:");
        [(UIKBKeyplaneView *)self->_keyplaneView setSuppressDrawing:0];
      }
      [(UIKeyboardLayoutStar *)self _didChangeKeyplaneWithContext:v31];
      if (v3)
      {
        double v32 = +[UIKeyboardImpl activeInstance];
        [v32 layoutDidResize];
      }
    }
  }
}

- (CGSize)intrinsicContentSize
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]
    && (liveKeyplaneView = self->_liveKeyplaneView) != 0)
  {
    [(TUIKeyplaneView *)liveKeyplaneView intrinsicContentSize];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKeyboardLayoutStar;
    [(UIView *)&v6 intrinsicContentSize];
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (id)splitTransitionDelegate
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    p_splitKeyplaneTransitionDelegate = &self->_splitKeyplaneTransitionDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_splitKeyplaneTransitionDelegate);

    if (!WeakRetained)
    {
      double v5 = [(UIView *)self window];
      objc_super v6 = [v5 screen];
      double v7 = +[UIKeyboardMotionSupport supportForScreen:v6];
      objc_storeWeak((id *)p_splitKeyplaneTransitionDelegate, v7);
    }
    double v8 = objc_loadWeakRetained((id *)p_splitKeyplaneTransitionDelegate);
  }
  else
  {
    double v8 = [(UIKeyboardSplitTransitionView *)self->_transitionView splitTransitionDelegate];
  }
  return v8;
}

- (void)prepareForSplitTransition
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
    [(TUIKeyplaneView *)self->_liveKeyplaneView prepareForSplitTransition];
  }
  BOOL v3 = [(UIKeyboardLayoutStar *)self splitTransitionDelegate];
  [v3 prepareForTransition];

  [(UIKeyboardLayoutStar *)self flushKeyCache:0];
  [(UIView *)self setUserInteractionEnabled:0];
  double v4 = +[UIKeyboardImpl activeInstance];
  [v4 clearLanguageIndicator];

  +[UIKeyboardImpl persistentSplitProgress];
  if (self->_finalSplitProgress != v5) {
    self->_initialSplitProgress = v5;
  }
  if (+[UIDictationController isRunning])
  {
    id v6 = +[UIDictationController sharedInstance];
    [v6 cancelDictation];
  }
}

- (void)showSplitTransitionView:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3
    && ([(UIView *)self->_transitionView isHidden]
     || [(UIKeyboardLayoutStar *)self useCrescendoLayout]))
  {
    [(UIKeyboardLayoutStar *)self prepareForSplitTransition];
  }
  if ([(UIKeyboardLayoutStar *)self pinchSplitGestureEnabled])
  {
    if (self->_isRebuilding && v3)
    {
      if (![(UIKeyboardSplitTransitionView *)self->_transitionView canDisplayTransition]
        && ![(UIKeyboardLayoutStar *)self useCrescendoLayout])
      {
        [(UIKeyboardLayoutStar *)self rebuildSplitTransitionView];
      }
    }
    else
    {
      [(UIView *)self->_keyplaneView setHidden:v3];
      [(UIView *)self->_backgroundView setHidden:v3];
      double v5 = [(UIView *)self->_dimKeyboardImageView layer];
      [v5 removeAllAnimations];

      [(UIView *)self->_dimKeyboardImageView setHidden:v3];
      BOOL v6 = !v3 || [(UIKeyboardLayoutStar *)self useCrescendoLayout];
      [(UIView *)self->_transitionView setHidden:v6];
    }
  }
  [(UIView *)self setUserInteractionEnabled:v3 ^ 1];
}

- (void)finishSplitWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __50__UIKeyboardLayoutStar_finishSplitWithCompletion___block_invoke;
  double v11 = &unk_1E52DA160;
  double v12 = self;
  id v5 = v4;
  id v13 = v5;
  BOOL v6 = _Block_copy(&v8);
  -[UIKeyboardLayoutStar setPlayKeyClickSoundOn:](self, "setPlayKeyClickSoundOn:", 0, v8, v9, v10, v11, v12);
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
    [(TUIKeyplaneView *)self->_liveKeyplaneView finishSplitTransition];
  }
  double v7 = [(UIKeyboardLayoutStar *)self splitTransitionDelegate];
  [v7 finishTransitionWithCompletion:v6];
}

uint64_t __50__UIKeyboardLayoutStar_finishSplitWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(double **)(a1 + 32);
  if (v2[121] == v2[122])
  {
    [*(id *)(a1 + 32) bounds];
    double v7 = +[UIKBKeyplaneChangeContext keyplaneChangeContextWithSize:](UIKBKeyplaneChangeContext, "keyplaneChangeContextWithSize:", v5, v6);
    [v2 _didChangeKeyplaneWithContext:v7];
  }
  else
  {
    +[UIKeyboardImpl setPersistentSplitProgress:](UIKeyboardImpl, "setPersistentSplitProgress:");
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 656);
    if (*(double *)(v3 + 976) <= 0.0) {
      [(id)v3 defaultNameForKeyplaneName:v4];
    }
    else {
    double v7 = [(id)v3 splitNameForKeyplaneName:v4];
    }
    uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 632) subtreeWithName:v7];

    if (!v8)
    {
      uint64_t v9 = [*(id *)(a1 + 32) splitNameForKeyplane:*(void *)(*(void *)(a1 + 32) + 640)];

      double v7 = (void *)v9;
    }
    [*(id *)(a1 + 32) setKeyplaneName:v7];
    [*(id *)(a1 + 32) updateKeyCentroids];
  }

  [*(id *)(a1 + 32) showSplitTransitionView:0];
  [*(id *)(*(void *)(a1 + 32) + 952) resetPinchCalculations];
  double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"UIKeyboardLayoutDidChangedNotification" object:0];

  double v11 = +[UIKeyboardImpl activeInstance];
  int v12 = [v11 showsCandidateBar];

  if (v12)
  {
    id v13 = +[UIKeyboardImpl activeInstance];
    double v14 = [v13 candidateController];
    [v14 updateStates];
  }
  uint64_t v15 = +[UIKeyboardImpl activeInstance];
  [v15 forceShiftUpdate];

  [*(id *)(a1 + 32) _cleanUpBlinkAssertionIfNecessary];
  double v16 = +[UIKeyboardSplitControlMenu activeInstance];
  [v16 didFinishSplitTransition];

  double v17 = +[UIInputSwitcherView activeInstance];
  [v17 didFinishSplitTransition];

  uint64_t v18 = *(void *)(a1 + 40);
  if (v18) {
    (*(void (**)(void))(v18 + 16))();
  }
  uint64_t v19 = *(void **)(a1 + 32);
  return [v19 updateTouchProcessingForKeyplaneChange];
}

- (void)finishSplitTransition
{
}

- (void)finishSplitTransitionWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected])
  {
    [(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer finalProgressForInitialProgress:self->_initialSplitProgress];
    self->_double finalSplitProgress = v5;
    if (v5 != self->_initialSplitProgress)
    {
      double v6 = +[UIKeyboardImpl activeInstance];
      [v6 setRivenSplitLock:1];
    }
  }
  BOOL v7 = [(UIKeyboardLayoutStar *)self useCrescendoLayout];
  double finalSplitProgress = self->_finalSplitProgress;
  if (v7)
  {
    liveKeyplaneView = self->_liveKeyplaneView;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke;
    v16[3] = &unk_1E52E45A0;
    double v10 = &v17;
    v16[4] = self;
    id v17 = v4;
    id v11 = v4;
    [(TUIKeyplaneView *)liveKeyplaneView transitionWillFinishWithProgress:v16 completion:finalSplitProgress];
  }
  else
  {
    transitionView = self->_transitionView;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke_2;
    v14[3] = &unk_1E52DA160;
    double v10 = &v15;
    void v14[4] = self;
    id v15 = v4;
    id v13 = v4;
    [(UIKeyboardSplitTransitionView *)transitionView finishWithProgress:v14 completionBlock:finalSplitProgress];
  }
}

void __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishSplitWithCompletion:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) splitTransitionDelegate];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(double *)(v3 + 976);
  [*(id *)(v3 + 1448) fullHeightForDockedKeyboard];
  double v6 = v5;
  [*(id *)(*(void *)(a1 + 32) + 1448) leftSplitSize];
  [v2 updateProgress:v4 startHeight:v6 endHeight:v7 + 10.0];

  id v8 = [*(id *)(a1 + 32) splitTransitionDelegate];
  [v8 transitionDidFinish:1];
}

uint64_t __60__UIKeyboardLayoutStar_finishSplitTransitionWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishSplitWithCompletion:*(void *)(a1 + 40)];
}

- (void)finishSplitTransitionWithProgress:(double)a3
{
  self->_double finalSplitProgress = a3;
  [(UIKeyboardLayoutStar *)self finishSplitTransition];
}

- (BOOL)pinchDetected
{
  return [(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected];
}

- (BOOL)pinchSplitGestureEnabled
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    liveKeyplaneView = self->_liveKeyplaneView;
    return [(TUIKeyplaneView *)liveKeyplaneView supportsSplit];
  }
  else
  {
    return UIKeyboardSplitTransitionViewSupportsPinch();
  }
}

- (BOOL)pinchCanBeginWithTouches:(id)a3 andScale:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_isTrackpadMode
    || [(UIKeyboardLayout *)self isFloating]
    || ![(UIView *)self isUserInteractionEnabled]
    || (BOOL v7 = [(UIKBScreenTraits *)self->super._screenTraits isSplit], a4 >= 1.0) && v7
    || (BOOL v8 = [(UIKBScreenTraits *)self->super._screenTraits isSplit], a4 <= 1.0) && !v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    obuint64_t j = v6;
    uint64_t v11 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = +[UIKBTouchState touchUUIDForTouch:*(void *)(*((void *)&v20 + 1) + 8 * i)];
          double v16 = [(UIKeyboardLayoutStar *)self infoForTouchUUID:v15];
          id v17 = [v16 key];
          int v18 = [v17 interactionType];

          if (v18 == 11)
          {
            BOOL v9 = 0;
            goto LABEL_20;
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_20:
  }
  return v9;
}

- (void)didDetectPinchWithSeparation:(double)a3
{
  self->_double finalSplitProgress = self->_initialSplitProgress;
  [(UIView *)self frame];
  double v6 = v5 * -0.3;
  double initialSplitProgress = self->_initialSplitProgress;
  [(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer initialPinchSeparation];
  double v9 = initialSplitProgress + (v8 - a3) / v6;
  [(UIKeyboardLayoutStar *)self setSplitProgress:v9];
}

- (void)pinchDidConsumeTouch:(id)a3
{
  id v6 = +[UIKBTouchState touchUUIDForTouch:a3];
  double v4 = [(UIKeyboardLayoutStar *)self infoForTouchUUID:v6];
  double v5 = [v4 touch];

  [(UIKeyboardLayoutStar *)self clearInfoForTouch:v5];
}

- (void)pinchHandler:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 5)
  {
    char v5 = [v4 pinchDetected];

    if ((v5 & 1) == 0) {
      return;
    }
  }
  else
  {
    uint64_t v6 = [v4 state];

    if (v6 != 3) {
      return;
    }
  }
  [(UIKeyboardLayoutStar *)self finishSplitTransition];
}

- (void)setSplitProgress:(double)a3
{
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    double v5 = 1.0;
    if (a3 <= 1.0) {
      double v5 = a3;
    }
    if (a3 >= 0.0) {
      double v6 = v5;
    }
    else {
      double v6 = 0.0;
    }
    -[UIKeyboardLayoutStar showSplitTransitionView:](self, "showSplitTransitionView:", 1, v5);
    [(TUIKeyplaneView *)self->_liveKeyplaneView updateSplitProgress:v6];
    id v10 = [(UIKeyboardLayoutStar *)self splitTransitionDelegate];
    [(TUIKeyplaneView *)self->_liveKeyplaneView fullHeightForDockedKeyboard];
    double v8 = v7;
    [(TUIKeyplaneView *)self->_liveKeyplaneView leftSplitSize];
    [v10 updateProgress:v6 startHeight:v8 endHeight:v9 + 10.0];
  }
  else
  {
    if (self->_splitTransitionNeedsRebuild) {
      [(UIKeyboardLayoutStar *)self rebuildSplitTransitionView];
    }
    [(UIKeyboardSplitTransitionView *)self->_transitionView updateWithProgress:a3];
    if ([(UIView *)self->_transitionView isHidden])
    {
      [(UIKeyboardLayoutStar *)self showSplitTransitionView:1];
    }
  }
}

- (void)_autoSplit:(id)a3
{
  [a3 timestamp];
  double v5 = v4;
  double v6 = (v4 - self->_autoSplitLastUpdate) * 1000.0;
  double v7 = 1.0;
  if (v6 > 1.0)
  {
    double v8 = v6 / 1000.0 / 0.4 + self->_autoSplitElapsedTime;
    self->_autoSplitElapsedTime = v8;
    double v9 = self->_initialSplitProgress + v8 * (self->_finalSplitProgress - self->_initialSplitProgress);
    if (v9 <= 1.0) {
      double v7 = v9;
    }
    if (v9 >= 0.0) {
      double v10 = v7;
    }
    else {
      double v10 = 0.0;
    }
    [(UIKeyboardLayoutStar *)self setSplitProgress:v10 * v10];
    if (vabdd_f64(v10, self->_finalSplitProgress) < 0.01)
    {
      [(CADisplayLink *)self->_displayLink invalidate];
      displayLinuint64_t k = self->_displayLink;
      self->_displayLinuint64_t k = 0;

      [(UIKeyboardLayoutStar *)self finishSplitTransition];
    }
    self->_autoSplitLastUpdate = v5;
  }
}

- (void)setSplit:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(UIKBScreenTraits *)self->super._screenTraits supportsSplit])
  {
    displayLinuint64_t k = self->_displayLink;
    if (displayLink)
    {
      [(CADisplayLink *)displayLink invalidate];
      double v8 = self->_displayLink;
      self->_displayLinuint64_t k = 0;
    }
    double v9 = 0.0;
    if (v5) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
    self->_double finalSplitProgress = v10;
    if (!v5) {
      double v9 = 1.0;
    }
    self->_double initialSplitProgress = v9;
    if (v4)
    {
      uint64_t v11 = [(UIKBScreenTraits *)self->super._screenTraits screen];
      uint64_t v12 = [v11 displayLinkWithTarget:self selector:sel__autoSplit_];
      uint64_t v13 = self->_displayLink;
      self->_displayLinuint64_t k = v12;

      double v14 = self->_displayLink;
      id v15 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [(CADisplayLink *)v14 addToRunLoop:v15 forMode:*MEMORY[0x1E4F1C4B0]];

      self->_autoSplitLastUpdate = CACurrentMediaTime();
      self->_autoSplitElapsedTime = 0.0;
      double initialSplitProgress = self->_initialSplitProgress;
      [(UIKeyboardLayoutStar *)self setSplitProgress:initialSplitProgress];
    }
    else
    {
      double finalSplitProgress = self->_finalSplitProgress;
      [(UIKeyboardLayoutStar *)self finishSplitTransitionWithProgress:finalSplitProgress];
    }
  }
}

- (void)prepareForFloatingTransition:(BOOL)a3
{
  if (a3)
  {
    [(UIKeyboardLayoutStar *)self flushKeyCache:0];
    [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
    [(UIKeyboardLayout *)self setShiftKeyTouchUUID:0];
    [(UIView *)self setUserInteractionEnabled:0];
  }
  else
  {
    [(UIView *)self setUserInteractionEnabled:1];
    [(UIKeyboardLayout *)self updateTouchProcessingForKeyplaneChange];
    [(UIKeyboardLayout *)self resetTouchProcessingForKeyboardChange];
    if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
    {
      [(TUIKeyplaneView *)self->_liveKeyplaneView transitionToKeyplane:self->_keyplane];
      [(UIKeyboardLayoutStar *)self updateAllKeyStates];
    }
  }
}

- (BOOL)_handleTouchForEmojiInputView
{
  uint64_t v3 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v4 = [v3 currentInputMode];
  BOOL v5 = [v4 normalizedIdentifier];
  if ([v5 isEqualToString:@"emoji"])
  {
    [(UIKBTree *)self->_keyplane frame];
    double v7 = v6;
    [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
    BOOL v9 = v7 < v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (CGRect)_paddedKeyUnionFrame
{
  [(UIView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIKeyboardLayoutStar *)self hitBuffer];
  CGFloat v12 = -v11;
  v35.origin.double x = v4;
  v35.origin.double y = v6;
  v35.size.double width = v8;
  v35.size.CGFloat height = v10;
  CGRect v36 = CGRectInset(v35, 0.0, v12);
  double x = v36.origin.x;
  double y = v36.origin.y;
  double width = v36.size.width;
  CGFloat height = v36.size.height;
  if ([(UIKeyboardLayoutStar *)self _handleTouchForEmojiInputView])
  {
    [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
    CGFloat v18 = (width - v17) * 0.5;
    v37.origin.double x = x;
    v37.origin.double y = y;
    v37.size.double width = width;
    v37.size.CGFloat height = height;
    CGRect v38 = CGRectInset(v37, v18, 0.0);
    double x = v38.origin.x;
    double y = v38.origin.y;
    double width = v38.size.width;
    CGFloat height = v38.size.height;
  }
  if ([(UIKeyboardLayoutStar *)self currentHandBias]
    && ![(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    [(UIKBTree *)self->_keyplane keyUnionFrame];
    CGFloat height = v19;
    double x = v20 + -25.0;
    double width = v21 + 50.0;
    double y = v22 + 0.0;
  }
  long long v23 = [(UIKeyboardLayoutStar *)self activeKey];
  int v24 = [v23 state];

  if (v24 == 16)
  {
    uint64_t v25 = [(UIKeyboardLayoutStar *)self activeKey];
    uint64_t v26 = [(UIKeyboardLayoutStar *)self viewForKey:v25];

    [v26 bounds];
    -[UIView convertRect:fromView:](self, "convertRect:fromView:", v26);
    v42.origin.double x = v27;
    v42.origin.double y = v28;
    v42.size.double width = v29;
    v42.size.CGFloat height = v30;
    v39.origin.double x = x;
    v39.origin.double y = y;
    v39.size.double width = width;
    v39.size.CGFloat height = height;
    CGRect v40 = CGRectUnion(v39, v42);
    double x = v40.origin.x;
    double y = v40.origin.y;
    double width = v40.size.width;
    CGFloat height = v40.size.height;
  }
  double v31 = x;
  double v32 = y;
  double v33 = width;
  double v34 = height;
  result.size.CGFloat height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (double)hitBuffer
{
  [(UIKBScreenTraits *)self->super._screenTraits keyboardBarHeight];
  double v4 = v3;
  double v5 = CFAbsoluteTimeGetCurrent() - self->_prevTouchDownTime;
  double result = 0.0;
  if (v5 < 0.35)
  {
    double result = v4 * 0.6;
    if (v5 >= 0.2)
    {
      float v7 = (0.35 - v5) / 0.15;
      return result * v7;
    }
  }
  return result;
}

- (BOOL)_pointAllowedInStaticHitBuffer:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  CGFloat v6 = +[UIKeyboardInputModeController sharedInputModeController];
  float v7 = [v6 currentInputMode];

  CGFloat v8 = [(UIKeyboardLayout *)self sizeDelegate];
  objc_msgSend(v8, "deviceSpecificStaticHitBufferForInterfaceOrientation:inputMode:", -[UIKeyboardLayout orientation](self, "orientation"), v7);
  double v10 = v9;

  if (v10 <= 0.00000011920929) {
    goto LABEL_7;
  }
  [(UIView *)self bounds];
  double v12 = v11 - v10;
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26)
  {
    if (y <= v12)
    {
LABEL_7:
      BOOL v13 = 1;
      goto LABEL_8;
    }
  }
  else if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 23 || y <= v12)
  {
    goto LABEL_7;
  }
  double v16 = [(UIKBTree *)self->_keyboard name];
  char v17 = [v16 _containsSubstring:@"Kana"];

  if (v17)
  {
    BOOL v13 = 0;
  }
  else
  {
    CGFloat v18 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Space-Key"];
    double v19 = v18;
    if (v18)
    {
      [v18 paddedFrame];
      CGFloat v20 = v24.origin.x;
      CGFloat v21 = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
      if (x <= CGRectGetMinX(v24))
      {
        BOOL v13 = 0;
      }
      else
      {
        v25.origin.double x = v20;
        v25.origin.double y = v21;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        BOOL v13 = x < CGRectGetMaxX(v25);
      }
    }
    else
    {
      BOOL v13 = 1;
    }
  }
LABEL_8:

  return v13;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v7 = [a4 _gsEvent];
  return -[UIKeyboardLayoutStar pointInside:forEvent:](self, "pointInside:forEvent:", v7, x, y);
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(UIKeyboardLayoutStar *)self _pointAllowedInStaticHitBuffer:a4]) {
    goto LABEL_10;
  }
  [(UIView *)self bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [(UIKeyboardLayoutStar *)self hitBuffer];
  CGFloat v16 = -v15;
  v65.origin.double x = v8;
  v65.origin.double y = v10;
  v65.size.CGFloat width = v12;
  v65.size.CGFloat height = v14;
  CGRect v66 = CGRectInset(v65, 0.0, v16);
  v63.double x = x;
  v63.double y = y;
  if (CGRectContainsPoint(v66, v63))
  {
    if ([(UIKBTree *)self->_keyplane isSplit])
    {
      char v17 = -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);

      if (!v17)
      {
        double Current = CFAbsoluteTimeGetCurrent();
        [(UIKeyboardLayoutStar *)self lastTouchUpTimestamp];
        if (Current - v19 > 0.25)
        {
          [(UIKeyboardLayoutStar *)self frameForKeylayoutName:@"split-left"];
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          double v25 = v24;
          CGFloat v27 = v26;
          [(UIKeyboardLayoutStar *)self frameForKeylayoutName:@"split-right"];
          CGFloat rect = v28;
          CGFloat v30 = v29;
          double v32 = v31;
          CGFloat v34 = v33;
          v67.origin.double x = v21;
          v67.origin.double y = v23;
          v67.size.CGFloat width = v25;
          v67.size.CGFloat height = v27;
          if (!CGRectIsEmpty(v67))
          {
            v68.origin.double x = rect;
            v68.origin.double y = v30;
            v68.size.CGFloat width = v32;
            v68.size.CGFloat height = v34;
            BOOL v35 = 1;
            if (!CGRectIsEmpty(v68) && x >= v25 + 24.0)
            {
              [(UIView *)self frame];
              return x > v36 - v32 + -24.0;
            }
            return v35;
          }
        }
      }
      return 1;
    }
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
      || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
      || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
      || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
      || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
    {
      uint64_t v55 = +[UIKeyboardPreferencesController sharedPreferencesController];
      int v56 = [v55 preferencesActions];
      [v56 rivenSizeFactor:1.0];
      double v58 = v57;

      if (v58 > 1.0)
      {
        [(UIView *)self bounds];
        double v60 = (v59 - y) * 0.03125;
        if (x * 0.0625 + v60 <= 1.0) {
          return 0;
        }
        [(UIView *)self bounds];
        return v60 + (v61 - x) * 0.0625 > 1.0;
      }
    }
    char v37 = 1;
  }
  else
  {
LABEL_10:
    char v37 = 0;
  }
  if ([(UIKeyboardLayoutStar *)self _handleTouchForEmojiInputView]
    && ([(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Emoji-InputView-Key"],
        CGRect v38 = objc_claimAutoreleasedReturnValue(),
        [v38 frame],
        double v40 = v39,
        v38,
        y < v40))
  {
    [(UIView *)self bounds];
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;
    CGFloat v48 = v47;
    [(UIKBTree *)self->_keyplane frame];
    double v50 = v49;
    [(UIKBScreenTraits *)self->super._screenTraits keyboardWidth];
    CGFloat v52 = (v50 - v51) * 0.5;
    v69.origin.double x = v42;
    v69.origin.double y = v44;
    v69.size.CGFloat width = v46;
    v69.size.CGFloat height = v48;
    CGRect v70 = CGRectInset(v69, v52, 0.0);
    v64.double x = x;
    v64.double y = y;
    BOOL v35 = CGRectContainsPoint(v70, v64);
    uint64_t v53 = -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
    if (v53) {
      BOOL v35 = 1;
    }
  }
  else
  {
    uint64_t v53 = -[UIKeyboardLayoutStar keyViewHitTestForPoint:](self, "keyViewHitTestForPoint:", x, y);
    if (v53) {
      BOOL v35 = 1;
    }
    else {
      BOOL v35 = v37;
    }
  }

  return v35;
}

- (void)touchDown:(id)a3 executionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [(UIKeyboardLayoutStar *)self activeKey];

  if (v9)
  {
    CGFloat v10 = [(UIKeyboardLayoutStar *)self activeKey];
    double v11 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v10];

    if ([v11 delayed]
      && !self->_didLongPress
      && [v11 continuousPathState] == 1)
    {
      [v11 setDelayed:0];
      CGFloat v12 = [v11 key];
      unint64_t v13 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v12];

      [(UIKeyboardLayoutStar *)self _transitionToContinuousPathState:6 forTouchInfo:v11];
      CGFloat v14 = [v11 key];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke;
      v41[3] = &unk_1E52E3628;
      v41[4] = self;
      id v42 = v7;
      double v15 = [v8 childWithContinuation:v41];
      [(UIKeyboardLayoutStar *)self completeCommitTouchesPrecedingTouchDownWithKey:v14 withActions:v13 executionContext:v15];

LABEL_34:
      goto LABEL_35;
    }
  }
  [v7 locationInView:self];
  double v17 = v16;
  double v19 = v18;
  BOOL v20 = -[UIKeyboardLayoutStar pointInside:forEvent:](self, "pointInside:forEvent:", 0);
  [(UIKeyboardLayoutStar *)self _paddedKeyUnionFrame];
  v43.double x = v17;
  v43.double y = v19;
  BOOL v21 = CGRectContainsPoint(v44, v43);
  double v22 = [(UIKeyboardLayoutStar *)self modalDisplayView];

  BOOL v23 = [(UIKeyboardLayoutStar *)self hasActiveContinuousPathInput];
  if (v20 && v21 && !v22 && !v23)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    [(UIKeyboardLayoutStar *)self lastTwoFingerTapTimestamp];
    double v26 = Current - v25;
    if (v26 >= 0.3 || v26 <= 0.0)
    {
      double v11 = +[UIKeyboardImpl activeInstance];
      [v11 forceShiftUpdateIfKeyboardStateChanged];
      uint64_t v27 = [(NSMutableDictionary *)self->_extendedTouchInfoMap count];
      if (+[UIKeyboardImpl rivenPreference])
      {
        if ([(UIKeyboardLayoutStar *)self getHandRestRecognizerState])
        {
          uint64_t v28 = 0;
        }
        else
        {
          double v29 = Current - self->_prevTouchDownTime;
          if (v27 && v29 < 0.05) {
            uint64_t v28 = 2;
          }
          else {
            uint64_t v28 = v29 >= 0.5;
          }
        }
        [(UIKeyboardLayoutStar *)self setPlayKeyClickSoundOn:v28];
      }
      self->_prevTouchDownTime = Current;
      self->_hasPeekedGestureKedouble y = 0;
      CGFloat v30 = [(UIKeyboardLayoutStar *)self generateInfoForTouch:v7];
      [v30 setKeyplane:self->_keyplane];
      objc_msgSend(v30, "setInitialPoint:", v17, v19);
      double v31 = [v7 touchUUID];
      objc_msgSend(v30, "setFingerID:", -[UIKeyboardLayout fingerIDForTouchUUID:](self, "fingerIDForTouchUUID:", v31));

      [v30 setContinuousPathState:0];
      if (([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
         || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
        && [(UIKeyboardLayout *)self isFloating])
      {
        double v32 = [(UIKeyboardLayout *)self currentTouchDownEvent];
        double v33 = [v32 allTouches];
        BOOL v34 = (unint64_t)[v33 count] > 1;
      }
      else
      {
        BOOL v34 = 0;
      }
      if ([(UIKeyboardLayoutStar *)self _allowContinuousPathUI] && !v34)
      {
        [v7 timestamp];
        -[UIKeyboardLayoutStar addContinuousPathPoint:withTimestamp:](self, "addContinuousPathPoint:withTimestamp:", v17, v19, v35);
      }
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke_2;
      v38[3] = &unk_1E52E3CD0;
      id v39 = v30;
      SEL v40 = a2;
      v38[4] = self;
      id v36 = v30;
      char v37 = [v8 childWithContinuation:v38];
      [(UIKeyboardLayoutStar *)self performHitTestForTouchInfo:v36 touchStage:0 executionContextPassingUIKBTree:v37];

      goto LABEL_34;
    }
  }
  [v8 returnExecutionToParent];
LABEL_35:
}

uint64_t __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) touchDown:*(void *)(a1 + 40) executionContext:a2];
}

void __51__UIKeyboardLayoutStar_touchDown_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 info];
  if (v3)
  {
    double v4 = (void *)v3;
    double v5 = [v12 info];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      CGFloat v10 = [v12 info];
      [v7 handleFailureInMethod:v8, v9, @"UIKeyboardLayoutStar.m", 7823, @"UIKeyboardTask %s expected UIKBTree but received %@", "-[UIKeyboardLayoutStar touchDown:executionContext:]_block_invoke_2", v10 object file lineNumber description];
    }
  }
  double v11 = [v12 info];
  [*(id *)(a1 + 40) setKey:v11];
  objc_msgSend(*(id *)(a1 + 40), "setInitialKeyState:", objc_msgSend(v11, "state"));
  [*(id *)(a1 + 32) completeHitTestForTouchDown:*(void *)(a1 + 40) executionContext:v12];
}

- (void)completeHitTestForTouchDown:(id)a3 executionContext:(id)a4
{
  id v46 = a3;
  id v7 = a4;
  uint64_t v8 = [v46 touch];
  [v46 initialPoint];
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [v46 key];
  [v13 frame];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  double v22 = &OBJC_IVAR___UIKeyboardLayoutStar__leftDriftOffset;
  if (([(NSMutableSet *)self->_leftKeySet containsObject:v13] & 1) != 0
    || (double v22 = &OBJC_IVAR___UIKeyboardLayoutStar__rightDriftOffset,
        [(NSMutableSet *)self->_rightKeySet containsObject:v13]))
  {
    BOOL v23 = (double *)((char *)self + *v22);
  }
  else
  {
    BOOL v23 = (double *)MEMORY[0x1E4F1DAD8];
  }
  double v24 = *v23;
  double v25 = v23[1];
  v48.origin.double x = v15;
  v48.origin.double y = v17;
  v48.size.CGFloat width = v19;
  v48.size.CGFloat height = v21;
  double v26 = v10 - CGRectGetMidX(v48) - v24;
  v49.origin.double x = v15;
  v49.origin.double y = v17;
  v49.size.CGFloat width = v19;
  v49.size.CGFloat height = v21;
  double v27 = v12 - CGRectGetMidY(v49) - v25;
  if ([(UIKeyboardLayout *)self supportsVirtualDrift])
  {
    uint64_t v28 = [(UIKeyboardLayoutStar *)self handRestRecognizerGetHomeRowHint];
    if (v28
      && ([v13 interactionType] == 1
       || [v13 interactionType] == 2))
    {
      -[UIKeyboardLayout _updateTouchState:errorVector:rowOffsetFromHomeRow:](self, "_updateTouchState:errorVector:rowOffsetFromHomeRow:", v8, (int)[v13 displayRowHint] - objc_msgSend(v28, "integerValue"), v26, v27);
    }
    else
    {
      [(UIKeyboardLayout *)self _ignoreTouchState:v8];
    }
  }
  else if ([(UIKeyboardLayout *)self isReachableDevice])
  {
    -[UIKeyboardLayoutStar calculateReachabilityScoreWithKey:keyError:](self, "calculateReachabilityScoreWithKey:keyError:", v13, v26, v27);
  }
  if (self->_lastInputIsGestureKey)
  {
    if ([v13 interactionType] != 4) {
      +[_UIKeyboardUsageTracking panAlternateKeyFlickDownCount];
    }
    self->_lastInputIsGestureKedouble y = 0;
  }
  if ([v13 state] == 1) {
    goto LABEL_28;
  }
  double v29 = [(UIKeyboardLayoutStar *)self activeKey];
  uint64_t v30 = [v29 parentKey];
  if (v30)
  {
    double v31 = (void *)v30;
    double v32 = [(UIKeyboardLayoutStar *)self activeKey];

    if (v32 != v13)
    {
      [(UIKeyboardLayoutStar *)self deactivateActiveKey];
      double v33 = [v13 parentKey];

      if (v33) {
        goto LABEL_28;
      }
    }
  }
  else
  {
  }
  BOOL v34 = [(UIKeyboardLayoutStar *)self activeKey];

  [(UIKeyboardLayoutStar *)self setActiveKey:v13];
  self->_didLongPress = 0;
  if (!v13)
  {
LABEL_28:
    [(UIKeyboardLayoutStar *)self clearInfoForTouch:v8];
    [v7 returnExecutionToParent];
    goto LABEL_42;
  }
  objc_msgSend(v46, "setInitialDragPoint:", v10, v12);
  if ([(UIKeyboardLayoutStar *)self _allowContinuousPathUI]
    && [(UIKeyboardLayoutStar *)self _allowStartingContinuousPathForTouchInfo:v46 alreadyActiveKeyExisting:v34 != 0])
  {
    uint64_t v35 = 1;
  }
  else
  {
    uint64_t v35 = 2;
  }
  [(UIKeyboardLayoutStar *)self _transitionToContinuousPathState:v35 forTouchInfo:v46];
  [(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer resetPinchCalculations];
  if ([v13 interactionType] == 16
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 3)
  {
    [v13 setFlickDirection:-3];
    self->_isOutOfBounds = 0;
    [(UIKeyboardLayoutStar *)self setState:2 forKey:v13];
    [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
    flickPopuptimer = self->_flickPopuptimer;
    if (flickPopuptimer)
    {
      [(NSTimer *)flickPopuptimer invalidate];
      char v37 = self->_flickPopuptimer;
      self->_flickPopuptimer = 0;
    }
    id touchInfo = self->_touchInfo;
    if (touchInfo)
    {
      self->_id touchInfo = 0;
    }
    flickPopupView = self->_flickPopupView;
    if (flickPopupView)
    {
      [(UIView *)flickPopupView removeFromSuperview];
      SEL v40 = self->_flickPopupView;
      self->_flickPopupView = 0;

      [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
    }
    double v41 = [v13 displayString];
    id v42 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v13 withString:v41];
    CGPoint v43 = getFlickPopupInfoArray(v42, @"Keycaps");

    if (v43)
    {
      objc_storeStrong(&self->_touchInfo, a3);
      CGRect v44 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_handlePopupView_ selector:0 userInfo:0 repeats:0.375];
      double v45 = self->_flickPopuptimer;
      self->_flickPopuptimer = v44;
    }
  }
  -[UIKeyboardLayoutStar touchDownWithKey:withTouchInfo:atPoint:executionContext:](self, "touchDownWithKey:withTouchInfo:atPoint:executionContext:", v13, v46, v7, v10, v12);
LABEL_42:
}

- (void)playKeyReleaseSoundForKey:(id)a3
{
  id v4 = a3;
  id v18 = +[UIKeyboardImpl activeInstance];
  [v4 frame];
  double MidX = CGRectGetMidX(v20);
  [v4 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.double x = v7;
  v21.origin.double y = v9;
  v21.size.CGFloat width = v11;
  v21.size.CGFloat height = v13;
  double MidY = CGRectGetMidY(v21);
  LODWORD(self) = [(UIKeyboardLayoutStar *)self hasActiveContinuousPathInput];
  CGFloat v15 = [v18 feedbackGenerator];
  double v16 = v15;
  if (self) {
    uint64_t v17 = 9;
  }
  else {
    uint64_t v17 = 8;
  }
  objc_msgSend(v15, "actionOccurred:atLocation:", v17, MidX, MidY);
}

- (void)playKeyClickSoundForKey:(id)a3
{
  id v4 = a3;
  screenTraits = self->super._screenTraits;
  if (!screenTraits || !screenTraits->_isFirstPartyStickers)
  {
    id v11 = v4;
    if ([(UIKeyboardLayoutStar *)self muteNextKeyClickSound])
    {
      [(UIKeyboardLayoutStar *)self setMuteNextKeyClickSound:0];
LABEL_23:
      id v4 = v11;
      goto LABEL_24;
    }
    double v6 = +[UIKeyboardImpl activeInstance];
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3)
    {
      CGFloat v7 = +[UIDevice currentDevice];
      [v7 _playSystemSound:1123];
LABEL_21:

      goto LABEL_22;
    }
    if ([v11 interactionType] == 4)
    {
LABEL_22:

      goto LABEL_23;
    }
    int v8 = [v11 interactionType];
    uint64_t v9 = 1;
    if (v8 > 8)
    {
      if (v8 == 9)
      {
        uint64_t v9 = 6;
        goto LABEL_18;
      }
      if (v8 == 15)
      {
        uint64_t v9 = 2;
        goto LABEL_18;
      }
      if (v8 != 16) {
        goto LABEL_15;
      }
    }
    else if ((v8 - 1) >= 2)
    {
      if (v8 == 4)
      {
        uint64_t v9 = 3;
        goto LABEL_18;
      }
LABEL_15:
      uint64_t v9 = 7;
    }
LABEL_18:
    if ([(UITextInputTraits *)self->super._inputTraits isSecureTextEntry]) {
      uint64_t v9 = 1;
    }
    CGFloat v7 = [v6 feedbackGenerator];
    [v11 frame];
    double MidX = CGRectGetMidX(v13);
    [v11 frame];
    objc_msgSend(v7, "actionOccurred:atLocation:", v9, MidX, CGRectGetMidY(v14));
    goto LABEL_21;
  }
LABEL_24:
}

- (void)playKeyClickSoundOnDownForKey:(id)a3
{
  id v4 = a3;
  if ([(UIKeyboardLayoutStar *)self playKeyClickSoundOn] != 2) {
    [(UIKeyboardLayoutStar *)self playKeyClickSoundForKey:v4];
  }
}

- (BOOL)shouldSkipResponseToGlobeKey:(id)a3 atPoint:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v6 = [(UIKeyboardLayoutStar *)self viewForKey:a3];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v17.origin.CGFloat x = v8 + v12 * 0.15;
  v17.size.CGFloat width = v12 + v12 * -0.4;
  v17.origin.CGFloat y = v10 + v14 * 0.15;
  v17.size.CGFloat height = v14 - v14 * 0.15;
  v16.CGFloat x = x;
  v16.CGFloat y = y;
  return !CGRectContainsPoint(v17, v16);
}

- (BOOL)isKeyScriptSwitchKey:(id)a3
{
  id v3 = a3;
  if ([v3 interactionType] == 9)
  {
    id v4 = [v3 name];
    char v5 = [v4 hasSuffix:@"Switch-Key"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_cleanUpBlinkAssertionIfNecessary
{
  id v3 = [(UIKeyboardLayoutStar *)self blinkAssertion];
  [v3 invalidate];

  [(UIKeyboardLayoutStar *)self setBlinkAssertion:0];
}

- (void)touchDownWithKey:(id)a3 withTouchInfo:(id)a4 atPoint:(CGPoint)a5 executionContext:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  double v14 = CFAbsoluteTimeGetCurrent() - self->_prevTouchUpTime;
  CGFloat v15 = +[UIKeyboardImpl activeInstance];
  [v15 forceShiftUpdateIfKeyboardStateChanged];
  CGFloat v88 = [v11 representedString];
  unsigned int v16 = [v11 interactionType];
  unint64_t v87 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v11];
  if (v16 == 5)
  {
    if (![(UIKBScreenTraits *)self->super._screenTraits idiom]
      && +[UIDictationController usingServerManualEndpointingThreshold])
    {
      self->_dictationUsingServerManualEndpointing = 1;
      +[UIDictationController serverManualEndpointingThreshold];
      dispatch_time_t v18 = dispatch_time(0, (uint64_t)(v17 * 1000000000.0));
      CGFloat v19 = MEMORY[0x1E4F14428];
      id v20 = MEMORY[0x1E4F14428];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke;
      block[3] = &unk_1E52D9F98;
      block[4] = self;
      id v101 = v11;
      dispatch_after(v18, v19, block);
    }
    [v15 touchLongPressTimerWithDelay:0.25];
  }
  else
  {
    [v15 touchLongPressTimer];
    int v21 = [v11 interactionType];
    double v22 = +[UIKeyboardImpl activeInstance];
    BOOL v23 = v22;
    if (v21 == 4) {
      uint64_t v24 = 6;
    }
    else {
      uint64_t v24 = 0;
    }
    [v22 updateIdleDetection:v24];
  }
  BOOL v26 = v14 >= 0.5 || v16 > 0x11 || ((1 << v16) & 0x21040) == 0;
  if (!v26) {
    goto LABEL_27;
  }
  BOOL v27 = [(UIKeyboardLayoutStar *)self isKeyScriptSwitchKey:v11];
  BOOL v28 = v27;
  if (v16 != 9 || v27)
  {
    if (v16 == 38) {
      goto LABEL_26;
    }
  }
  else
  {
    if (v14 < 0.325
      && -[UIKeyboardLayoutStar shouldSkipResponseToGlobeKey:atPoint:](self, "shouldSkipResponseToGlobeKey:atPoint:", v11, x, y))
    {
      goto LABEL_27;
    }
    [v15 clearLongPressTimer];
    [v15 touchLongPressTimerWithDelay:0.3];
  }
  if (!v28 || [(UIKeyboardLayoutStar *)self is10KeyRendering])
  {
LABEL_29:
    if ([v12 delayed])
    {
      [v15 clearLongPressTimer];
      [v15 touchLongPressTimerWithDelay:0.08];
    }
    if (v16 == 15) {
      [v15 clearLanguageIndicator];
    }
    uint64_t v29 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"International-Key"];
    if (v29)
    {
      uint64_t v30 = +[UIInputSwitcherView activeInstance];
      [v30 hide];

      if ((id)v29 != v11)
      {
        double v31 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v29];
        [v31 setMaySuppressUpAction:1];
      }
    }
    CGFloat v86 = (void *)v29;
    if ([v11 interactionType] == 28
      || [v11 interactionType] == 29
      || [v11 interactionType] == 30)
    {
      if ([v11 interactionType] == 28
        && [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleBoldface])
      {
        double v32 = v15;
        double v33 = [v15 delegateAsResponder];
        BOOL v34 = [v33 _responderForEditing];
        [v34 toggleBoldface:0];
LABEL_48:

        CGFloat v15 = v32;
        goto LABEL_49;
      }
      if ([v11 interactionType] == 29
        && [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleItalics])
      {
        double v32 = v15;
        double v33 = [v15 delegateAsResponder];
        BOOL v34 = [v33 _responderForEditing];
        [v34 toggleItalics:0];
        goto LABEL_48;
      }
      if ([v11 interactionType] == 30
        && [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleUnderline])
      {
        double v32 = v15;
        double v33 = [v15 delegateAsResponder];
        BOOL v34 = [v33 _responderForEditing];
        [v34 toggleUnderline:0];
        goto LABEL_48;
      }
    }
LABEL_49:
    if ((v87 & 1) != 0
      && ([v11 interactionType] == 31
       || [v11 interactionType] == 32
       || [v11 interactionType] == 33
       || [v11 interactionType] == 34
       || [v11 interactionType] == 35))
    {
      if ([v11 interactionType] == 31)
      {
        [v15 cutOperation];
        if (![(UIKBTextEditingTraits *)self->super._textEditingTraits canCut]) {
          goto LABEL_64;
        }
LABEL_63:
        [(UIKeyboardLayoutStar *)self setState:4 forKey:v11];
        goto LABEL_64;
      }
      if ([v11 interactionType] == 32)
      {
        [v15 copyOperation];
        if ([(UIKBTextEditingTraits *)self->super._textEditingTraits canCopy]) {
          goto LABEL_63;
        }
      }
      else
      {
        if ([v11 interactionType] == 33)
        {
          [v15 pasteOperation];
          if (![(UIKBTextEditingTraits *)self->super._textEditingTraits canPaste]) {
            goto LABEL_64;
          }
          goto LABEL_63;
        }
        if ([v11 interactionType] == 34
          && [(UIKBTextEditingTraits *)self->super._textEditingTraits canMoveCursorLeft])
        {
          objc_msgSend(v15, "moveCursorLeftShifted:", objc_msgSend(v15, "isShiftLocked"));
          if ([(UIKBTextEditingTraits *)self->super._textEditingTraits canMoveCursorLeft]) {
            goto LABEL_63;
          }
        }
        else if ([v11 interactionType] == 35)
        {
          if ([(UIKBTextEditingTraits *)self->super._textEditingTraits canMoveCursorRight])
          {
            objc_msgSend(v15, "moveCursorRightShifted:", objc_msgSend(v15, "isShiftLocked"));
            if ([(UIKBTextEditingTraits *)self->super._textEditingTraits canMoveCursorRight]) {
              goto LABEL_63;
            }
          }
        }
      }
    }
LABEL_64:
    if (([v15 acceptInputString:v88] & 1) == 0)
    {
      long long v98 = 0u;
      long long v99 = 0u;
      long long v97 = 0u;
      long long v96 = 0u;
      uint64_t v35 = [v11 secondaryRepresentedStrings];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v96 objects:v103 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v97;
        while (2)
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v97 != v38) {
              objc_enumerationMutation(v35);
            }
            if ([v15 acceptInputString:*(void *)(*((void *)&v96 + 1) + 8 * i)])
            {

              goto LABEL_75;
            }
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v96 objects:v103 count:16];
          if (v37) {
            continue;
          }
          break;
        }
      }

      SEL v40 = +[UIDevice currentDevice];
      [v40 _playSystemSound:1103];

      goto LABEL_90;
    }
LABEL_75:
    if (v16 == 13 && ([v15 returnKeyEnabled] & 1) == 0)
    {
LABEL_90:
      [v13 returnExecutionToParent];
LABEL_131:

      goto LABEL_132;
    }
    if (!+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled])
    {
      [(UIKeyboardLayoutStar *)self _cleanUpBlinkAssertionIfNecessary];
      double v41 = [v15 _activeAssertionController];
      id v42 = [v41 nonBlinkingAssertionWithReason:@"Keyboard Key Press"];
      [(UIKeyboardLayoutStar *)self setBlinkAssertion:v42];
    }
    objc_msgSend(v15, "setInputPoint:", x, y);
    unint64_t v43 = v87;
    if ((v87 & 1) != 0 && [v11 state] != 1)
    {
      if ([(UIKeyboardLayoutStar *)self preventPaddlesForPointerTouches])
      {
        CGRect v44 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
        int v45 = [v44 allowsPaddles];

        if (v45)
        {
          id v46 = v15;
          double v47 = [v12 touch];
          CGRect v48 = [v47 touchUUID];
          CGRect v49 = +[UIKBTouchState touchForTouchUUID:v48];

          if ([v49 _isPointerTouch]) {
            [v11 setPreventPaddle:1];
          }

          CGFloat v15 = v46;
        }
      }
      if ([v11 state] == 16
        || [v11 state] == 4 && objc_msgSend(v11, "hasSemiStickyVariant"))
      {
        [v15 clearLongPressTimer];
        double v50 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
        int v51 = [v50 popupKeyUsesCustomKeyContentView:v11];

        if (v51)
        {
          BOOL v52 = -[UIKBKeyplaneView retestSelectedVariantIndexForKey:atPoint:phase:](self->_keyplaneView, "retestSelectedVariantIndexForKey:atPoint:phase:", v11, 0, x, y)|| self->_selectedVariantIndexChanged;
          self->_selectedVariantIndexChanged = v52;
        }
        else
        {
          -[UIKeyboardLayoutStar updateSelectedVariantIndexForKey:withActions:withPoint:](self, "updateSelectedVariantIndexForKey:withActions:withPoint:", v11, v87, x, y);
        }
        uint64_t v66 = 16;
      }
      else
      {
        long long v94 = 0u;
        long long v95 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        uint64_t v53 = [(UIKBKeyplaneView *)self->_keyplaneView activeKeyViews];
        uint64_t v54 = [v53 countByEnumeratingWithState:&v92 objects:v102 count:16];
        if (v54)
        {
          uint64_t v55 = v54;
          uint64_t v56 = *(void *)v93;
          do
          {
            for (uint64_t j = 0; j != v55; ++j)
            {
              if (*(void *)v93 != v56) {
                objc_enumerationMutation(v53);
              }
              double v58 = *(void **)(*((void *)&v92 + 1) + 8 * j);
              double v59 = [v58 key];
              double v60 = [v59 name];
              int v61 = [v60 isEqual:@"EmojiPopupKey"];

              if (v61)
              {
                [v58 removeFromSuperview];
              }
              else
              {
                id v62 = [v58 key];
                if ([v62 state] == 16)
                {
                  CGPoint v63 = [v58 key];
                  CGPoint v64 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v63];

                  if (!v64)
                  {
                    CGRect v65 = [v58 key];
                    [(UIKeyboardLayoutStar *)self setState:2 forKey:v65];
                  }
                }
                else
                {
                }
              }
            }
            uint64_t v55 = [v53 countByEnumeratingWithState:&v92 objects:v102 count:16];
          }
          while (v55);
        }

        uint64_t v66 = 4;
        id v12 = v84;
        id v11 = v85;
        CGFloat v15 = v82;
        id v13 = v83;
        unint64_t v43 = v87;
      }
      [(UIKeyboardLayoutStar *)self setState:v66 forKey:v11];
      [(UIKeyboardLayoutStar *)self setActiveKey:v11];
      if (self->_multitapKey)
      {
        CGRect v67 = [(UIKeyboardLayoutStar *)self activeKey];
        CGRect v68 = v67;
        if (v67 == self->_multitapKey)
        {

          goto LABEL_128;
        }
        CGRect v69 = [(UIKeyboardLayoutStar *)self activeKey];
        [(UIKeyboardLayoutStar *)self activeMultitapCompleteKey];
        float v71 = v70 = v13;

        BOOL v26 = v69 == v71;
        id v13 = v70;
        if (v26) {
          goto LABEL_128;
        }
        [(UIKeyboardLayoutStar *)self setState:2 forKey:self->_multitapKey];
        multitapKedouble y = self->_multitapKey;
        self->_multitapKedouble y = 0;

        unint64_t v73 = [(UIKeyboardLayoutStar *)self activeKey];
        if ([(UIKeyboardLayoutStar *)self isMultitapKey:v73])
        {
          BOOL unshiftAfterMultitap = self->_unshiftAfterMultitap;

          if (!unshiftAfterMultitap) {
            goto LABEL_128;
          }
        }
        else
        {
        }
        [(UIKeyboardLayoutStar *)self multitapInterrupted];
      }
    }
LABEL_128:
    [(UIKeyboardLayoutStar *)self playKeyFeedbackIfNecessaryForTouchDownOnKey:v11 touchInfo:v12];
    if ([(UIKeyboardLayoutStar *)self shouldCommitPrecedingTouchesForTouchDownWithActions:v43])
    {
      int v75 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v11];
      [v75 touch];
      v77 = double v76 = v13;
      CGFloat v78 = [v77 touchUUID];
      double v79 = [(UIKeyboardLayout *)self touchUUIDsToCommitBeforeTouchUUID:v78];

      CGFloat v80 = +[UIKBTouchState touchesForTouchUUIDs:v79];
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke_2;
      v89[3] = &unk_1E52E3CD0;
      v89[4] = self;
      id v90 = v11;
      unint64_t v91 = v43;
      double v81 = [v76 childWithContinuation:v89];
      [(UIKeyboardLayout *)self commitTouches:v80 executionContext:v81];

      id v13 = v76;
    }
    else
    {
      [(UIKeyboardLayoutStar *)self completeCommitTouchesPrecedingTouchDownWithKey:v11 withActions:v43 executionContext:v13];
    }
    goto LABEL_131;
  }
LABEL_26:
  [v15 clearLongPressTimer];
  if (v14 >= 0.5)
  {
    [v15 touchLongPressTimerWithDelay:0.01];
    goto LABEL_29;
  }
LABEL_27:
  [v13 returnExecutionToParent];
LABEL_132:
}

void __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1328))
  {
    id v2 = +[UIDictationController sharedInstance];
    [v2 setReasonType:7];

    id v7 = +[UIDictationController sharedInstance];
    id v3 = [*(id *)(a1 + 32) touchInfoForKey:*(void *)(a1 + 40)];
    id v4 = [v3 touch];
    char v5 = [v4 touchUUID];
    double v6 = +[UIKBTouchState touchForTouchUUID:v5];
    [v7 switchToDictationInputModeWithTouch:v6];
  }
}

uint64_t __80__UIKeyboardLayoutStar_touchDownWithKey_withTouchInfo_atPoint_executionContext___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeCommitTouchesPrecedingTouchDownWithKey:*(void *)(a1 + 40) withActions:*(void *)(a1 + 48) executionContext:a2];
}

- (BOOL)shouldCommitPrecedingTouchesForTouchDownWithActions:(unint64_t)a3
{
  if ((a3 & 0x20000012) != 0 || (a3 & 0x800000) != 0 && (a3 & 0x78000) != 0)
  {
    LOBYTE(v5) = 1;
  }
  else if ((a3 & 0x20) == 0 {
         || (uint64_t v5 = [(NSMutableDictionary *)self->_extendedTouchInfoMap count], v5 != 1))
  }
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (id)sharedPunctuationCharacterSet
{
  if (qword_1EB25ABA8 != -1) {
    dispatch_once(&qword_1EB25ABA8, &__block_literal_global_1184);
  }
  id v2 = (void *)qword_1EB25ABA0;
  return v2;
}

void __53__UIKeyboardLayoutStar_sharedPunctuationCharacterSet__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  int v1 = (void *)qword_1EB25ABA0;
  qword_1EB25ABA0 = v0;
}

- (void)incrementPunctuationIfNeeded:(id)a3
{
  id v6 = a3;
  if ([v6 length])
  {
    uint64_t v3 = [(id)objc_opt_class() sharedPunctuationCharacterSet];
    if (qword_1EB25ABB8 != -1) {
      dispatch_once(&qword_1EB25ABB8, &__block_literal_global_1186);
    }
    uint64_t v4 = [v6 characterAtIndex:0];
    if (([v3 characterIsMember:v4] & 1) != 0
      || [(id)qword_1EB25ABB0 characterIsMember:v4])
    {
      uint64_t v5 = UIKeyboardGetCurrentInputMode();
      TIStatisticScalarIncrementInputStringCount();
    }
  }
}

void __53__UIKeyboardLayoutStar_incrementPunctuationIfNeeded___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  int v1 = (void *)qword_1EB25ABB0;
  qword_1EB25ABB0 = v0;
}

- (void)completeCommitTouchesPrecedingTouchDownWithKey:(id)a3 withActions:(unint64_t)a4 executionContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v8];
  if ([v10 delayed])
  {
    [v9 returnExecutionToParent];
  }
  else if ((a4 & 2) != 0)
  {
    id v11 = [v8 representedString];
    id v12 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v11 forKey:v8 touchInfo:v10 inputFlags:0];
    id v13 = [v12 _modifiedInput];
    [(UIKeyboardLayoutStar *)self incrementPunctuationIfNeeded:v13];

    double v14 = +[UIKeyboardImpl activeInstance];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __100__UIKeyboardLayoutStar_completeCommitTouchesPrecedingTouchDownWithKey_withActions_executionContext___block_invoke;
    v16[3] = &unk_1E52E3CD0;
    v16[4] = self;
    id v17 = v8;
    unint64_t v18 = a4;
    CGFloat v15 = [v9 childWithContinuation:v16];
    [v14 _handleKeyEvent:v12 executionContext:v15];
  }
  else
  {
    [(UIKeyboardLayoutStar *)self completeSendStringActionForTouchDownWithKey:v8 withActions:a4 executionContext:v9];
  }
}

uint64_t __100__UIKeyboardLayoutStar_completeCommitTouchesPrecedingTouchDownWithKey_withActions_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeSendStringActionForTouchDownWithKey:*(void *)(a1 + 40) withActions:*(void *)(a1 + 48) executionContext:a2];
}

- (id)keyplaneNameForRevertAfterTouch
{
  if ([(UIKBTree *)self->_keyplane isShiftKeyplane]
    && [(UIKBTree *)self->_keyplane looksLikeShiftAlternate])
  {
    uint64_t v3 = [(UIKBTree *)self->_keyplane shiftAlternateKeyplaneName];
  }
  else
  {
    uint64_t v3 = self->_keyplaneName;
  }
  return v3;
}

- (id)synthesizeTouchUpEventForKey:(id)a3
{
  uint64_t v3 = self;
  uint64_t v4 = [(UIKeyboardLayoutStar *)self touchInfoForKey:a3];
  uint64_t v5 = [v4 touch];
  [v4 initialPoint];
  double v7 = v6;
  double v9 = v8;
  [v5 timestamp];
  double v11 = v10;
  id v12 = [v4 key];
  LODWORD(v3) = [(UIKeyboardLayoutStar *)v3 keycodeForKey:v12];

  id v13 = (void *)MEMORY[0x1E4FAE3A8];
  [v5 pathMajorRadius];
  CGFloat v15 = objc_msgSend(v13, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, objc_msgSend(v5, "pathIndex"), (int)v3, v7, v9, v14, v11);

  return v15;
}

- (BOOL)shouldShowGestureKeyboardIntroduction
{
  if ([(UITextInputTraits *)self->super._inputTraits keyboardAppearance] == 127
    || (+[UIKeyboardPreferencesController sharedPreferencesController](UIKeyboardPreferencesController, "sharedPreferencesController"), v2 = objc_claimAutoreleasedReturnValue(), [v2 preferencesActions], v3 = objc_claimAutoreleasedReturnValue(), int v4 = objc_msgSend(v3, "BOOLForPreferenceKey:", @"GesturesEnabled"), v3, v2, !v4))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    uint64_t v5 = +[UIKeyboard keyboardBundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.purplebuddy"] ^ 1;
  }
  return v6;
}

- (BOOL)showGestureKeyboardIntroductionIfNeeded
{
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23
    || [(UIKeyboardLayout *)self isFloating]
    || [(UIKBTree *)self->_keyplane isSplit]
    || ([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) == 0x17
    || [(UITextInputTraits *)self->super._inputTraits keyboardType] == 12)
  {
    return 0;
  }
  uint64_t v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
  int v4 = [v3 preferencesActions];
  if ([v4 oneTimeActionCompleted:@"DidShowGestureKeyboardIntroduction"])
  {

    return 0;
  }
  BOOL v5 = [(UIKeyboardLayoutStar *)self shouldShowGestureKeyboardIntroduction];

  if (!v5) {
    return 0;
  }
  int v6 = [[UIGestureKeyboardIntroduction alloc] initWithLayoutStar:self completion:&__block_literal_global_1192_0];
  gestureKeyboardIntroductiouint64_t n = self->_gestureKeyboardIntroduction;
  self->_gestureKeyboardIntroductiouint64_t n = v6;

  double v8 = self->_gestureKeyboardIntroduction;
  return [(UIGestureKeyboardIntroduction *)v8 showGestureKeyboardIntroduction];
}

void __63__UIKeyboardLayoutStar_showGestureKeyboardIntroductionIfNeeded__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v2 = [v3 preferencesActions];
    [v2 didTriggerOneTimeAction:@"DidShowGestureKeyboardIntroduction"];
  }
}

- (void)completeSendStringActionForTouchDownWithKey:(id)a3 withActions:(unint64_t)a4 executionContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = +[UIKeyboardImpl activeInstance];
  if ((a4 & 0x800000) != 0) {
    [(UIKeyboardLayoutStar *)self showPopupVariantsForKey:v8];
  }
  double v11 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];

  if (v11) {
    self->_revertKeyplaneAfterTouch = 1;
  }
  if ((a4 & 0x10) != 0)
  {
    [(UIKeyboardLayoutStar *)self transitionToPunctuationKeysVisible:0];
    id v12 = [(UIKeyboardLayoutStar *)self keyplaneNameForRevertAfterTouch];
    [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:v12];

    self->_revertKeyplaneAfterTouch = 0;
    [(UIKeyboardLayoutStar *)self downActionShiftWithKey:v8];
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1)
    {
      if ([(UIKBTree *)self->_keyplane isShiftKeyplane])
      {
        id v13 = UIKeyboardGetCurrentInputMode();
        TIStatisticScalarIncrementInputStringCount();
      }
    }
  }
  if ((a4 & 0x400000000) != 0)
  {
    [(UIKeyboardLayoutStar *)self transitionToPunctuationKeysVisible:0];
    double v14 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Caps-Lock-Key"];
    CGFloat v15 = +[UIKeyboardImpl activeInstance];
    int v16 = [v15 isShiftLocked];

    keyplane = self->_keyplane;
    if (v16)
    {
      unint64_t v18 = [(UIKBTree *)keyplane shiftAlternateKeyplaneName];
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v18];

      CGFloat v19 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
      id v20 = [v19 renderingContext];
      [v20 setShiftState:0];

      [v10 setShift:0];
      [v10 setShiftPreventAutoshift:1];
      [v10 forceShiftUpdate];
      uint64_t v21 = 2;
    }
    else
    {
      double v22 = [(UIKBTree *)keyplane name];
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v22];

      BOOL v23 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
      uint64_t v24 = [v23 renderingContext];
      [v24 setShiftState:3];

      [v10 setShiftLockedForced:1];
      [(UIKBTree *)self->_keyplane updateFlickKeycapOnKeys];
      [(UIKeyboardLayoutStar *)self refreshDualStringKeys];
      uint64_t v21 = 8;
    }
    [(UIKeyboardLayoutStar *)self setState:v21 forKey:v14];
  }
  if ((a4 & 0x20) != 0 && [(NSMutableDictionary *)self->_extendedTouchInfoMap count] == 1)
  {
    [(UIView *)self bounds];
    double v26 = v25;
    BOOL v27 = [(UIKeyboardLayoutStar *)self keyplaneNameForRevertAfterTouch];
    [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:v27];

    self->_revertKeyplaneAfterTouch = 0;
    [v10 keyActivated];
    self->_suppressShiftKeyplaneAnimatiouint64_t n = 1;
    [(UIKeyboardLayoutStar *)self transitionToPunctuationKeysVisible:0];
    BOOL v28 = [(UIKBTree *)self->_keyplane isShiftKeyPlaneChooser];
    keyboard = self->_keyboard;
    uint64_t v30 = [(UIKBTree *)self->_keyplane alternateKeyplaneName];
    double v31 = [(UIKBTree *)keyboard subtreeWithName:v30];

    if ([v31 intForProperty:@"shift-rendering"] != 31
      || (TIStatisticGetKey(),
          double v32 = objc_claimAutoreleasedReturnValue(),
          TIStatisticScalarIncrement(),
          v32,
          ![(UIKeyboardLayoutStar *)self showGestureKeyboardIntroductionIfNeeded]))
    {
      double v33 = [(UIKBTree *)self->_keyplane alternateKeyplaneName];
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v33];
    }
    if (v28)
    {
      autoBOOL shift = self->_autoshift;
      BOOL v34 = v31;
      BOOL shift = self->_shift;
      [v10 forceShiftUpdate];
      BOOL v36 = shift == self->_shift;
      double v31 = v34;
      if (v36 && autoshift != self->_autoshift)
      {
        uint64_t v37 = [(UIKBTree *)self->_keyplane shiftAlternateKeyplaneName];
        [(UIKeyboardLayoutStar *)self setKeyplaneName:v37];
      }
    }
    self->_suppressShiftKeyplaneAnimatiouint64_t n = 0;
    [(UIKeyboardLayoutStar *)self setActiveKey:0];
    [(UIView *)self bounds];
    double v39 = v38 - v26;
    SEL v40 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v8];
    [v40 initialDragPoint];
    double v42 = v41;
    [v40 initialDragPoint];
    objc_msgSend(v40, "setInitialDragPoint:", v42, v39 + v43);
    if (v39 != 0.0)
    {
      CGRect v44 = [(UIView *)self window];
      [v44 layoutIfNeeded];
    }
    self->_preferredTrackingChangeCount = [v10 changeCount];
    if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
      && ![(UIKBTree *)self->_keyplane looksLikeShiftAlternate])
    {
      int v45 = UIKeyboardGetCurrentInputMode();
      TIStatisticScalarIncrementInputStringCount();
    }
    id v46 = [MEMORY[0x1E4F1C9C8] date];
    [v46 timeIntervalSinceDate:self->_prevTouchMoreKeyTime];
    double v48 = v47;

    if (v48 != 0.0 && v48 <= 0.300000012)
    {
      CGRect v49 = UIKeyboardGetCurrentInputMode();
      double v50 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
    prevTouchMoreKeyTime = self->_prevTouchMoreKeyTime;
    if (prevTouchMoreKeyTime)
    {
      self->_prevTouchMoreKeyTime = 0;
    }
    BOOL v52 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v53 = self->_prevTouchMoreKeyTime;
    self->_prevTouchMoreKeyTime = v52;
  }
  if ((a4 & 0x20000000) != 0)
  {
    [(UIView *)self bounds];
    double v55 = v54;
    uint64_t v56 = [v8 representedString];
    [(UIKeyboardLayoutStar *)self switchKeyplane:v56];

    [(UIView *)self bounds];
    double v58 = v57 - v55;
    double v59 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v8];
    [v59 initialDragPoint];
    double v61 = v60;
    [v59 initialDragPoint];
    objc_msgSend(v59, "setInitialDragPoint:", v61, v58 + v62);
    if (v58 != 0.0)
    {
      CGPoint v63 = [(UIView *)self window];
      [v63 layoutIfNeeded];
    }
    self->_preferredTrackingChangeCount = [v10 changeCount];
  }
  if ((a4 & 0x40) != 0)
  {
    CGPoint v64 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v8];
    CGRect v65 = [v64 touch];

    if ([v65 inputSource] == 8) {
      uint64_t v66 = 8;
    }
    else {
      uint64_t v66 = 1;
    }
    CGRect v67 = [v65 touchUUID];
    CGRect v68 = [(UIKeyboardLayout *)self touchUUIDsToCommitBeforeTouchUUID:v67];

    CGRect v69 = +[UIKBTouchState touchesForTouchUUIDs:v68];
    v72[0] = MEMORY[0x1E4F143A8];
    v72[1] = 3221225472;
    v72[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke;
    v72[3] = &unk_1E52E3D20;
    v72[4] = self;
    id v73 = v8;
    id v74 = v10;
    unint64_t v75 = a4;
    uint64_t v76 = v66;
    id v70 = [v9 childWithContinuation:v72];
    [(UIKeyboardLayout *)self commitTouches:v69 executionContext:v70];
  }
  else
  {
    [(UIKeyboardLayoutStar *)self completeDeleteActionForTouchDownWithActions:a4 executionContext:v9];
  }
}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) keyplaneNameForRevertAfterTouch];
  [*(id *)(a1 + 32) setPreTouchKeyplaneName:v4];

  *(unsigned char *)(*(void *)(a1 + 32) + 904) = 0;
  BOOL v5 = [*(id *)(a1 + 32) synthesizeTouchUpEventForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) skipHitTestForTouchEvent:v5 delayed:1];
  int v6 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v7 = [v6 forceTouchCapability];

  id v8 = *(void **)(a1 + 48);
  if (v7 == 2)
  {
    id v9 = [*(id *)(a1 + 32) touchInfoForKey:*(void *)(a1 + 40)];
    double v10 = [v9 touch];
    double v11 = [v10 touchUUID];
    id v12 = +[UIKBTouchState touchForTouchUUID:v11];
    [v12 force];
    objc_msgSend(v8, "startAutoDeleteTimerForForce:");
  }
  else
  {
    [*(id *)(a1 + 48) startAutoDeleteTimer];
  }
  id v13 = *(void **)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_2;
  v18[3] = &unk_1E52ED900;
  id v19 = v13;
  id v20 = v3;
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  uint64_t v21 = v14;
  uint64_t v22 = v15;
  id v17 = v3;
  [v19 performOperations:v18 withTextInputSource:v16];
}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldUseAdaptiveDelete];
  int v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_3;
    v9[3] = &unk_1E52E3F00;
    uint64_t v5 = *(void *)(a1 + 56);
    v9[4] = *(void *)(a1 + 48);
    v9[5] = v5;
    int v6 = [v3 childWithContinuation:v9];
    [v4 handleDeleteWordWithExecutionContext:v6];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_4;
    v8[3] = &unk_1E52E3F00;
    uint64_t v7 = *(void *)(a1 + 56);
    v8[4] = *(void *)(a1 + 48);
    v8[5] = v7;
    int v6 = [v3 childWithContinuation:v8];
    [v4 handleDeleteWithExecutionContext:v6];
  }
}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 multitapExpired];
  [*(id *)(a1 + 32) completeDeleteActionForTouchDownWithActions:*(void *)(a1 + 40) executionContext:v4];
}

void __97__UIKeyboardLayoutStar_completeSendStringActionForTouchDownWithKey_withActions_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 multitapExpired];
  [*(id *)(a1 + 32) completeDeleteActionForTouchDownWithActions:*(void *)(a1 + 40) executionContext:v4];
}

- (void)completeDeleteActionForTouchDownWithActions:(unint64_t)a3 executionContext:(id)a4
{
  int v4 = a3;
  id v10 = a4;
  int v6 = +[UIKeyboardImpl activeInstance];
  if ((v4 & 0x40000000) != 0)
  {
    int v7 = +[UIDictationController viewMode];
    id v8 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Dictation-Key"];
    if (v7 == 1)
    {
      [v6 acceptAutocorrectionWithCompletionHandler:0];
      id v9 = +[UIKeyboardDictationMenu sharedInstance];
      [(UIKeyboardLayoutStar *)self showMenu:v9 forKey:v8];
    }
  }
  [v10 returnExecutionToParent];
}

- (BOOL)canForceTouchUUIDCommit:(id)a3 inWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIKeyboardLayoutStar *)self infoForTouchUUID:v6];
  id v9 = v8;
  if (v7
    && v8
    && ([v8 key],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 modifiesKeyplane],
        v10,
        (v11 & 1) != 0)
    || [v9 continuousPathState] == 4)
  {
    BOOL v12 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)UIKeyboardLayoutStar;
    BOOL v12 = [(UIKeyboardLayout *)&v14 canForceTouchUUIDCommit:v6 inWindow:v7];
  }

  return v12;
}

- (BOOL)touchPassesDragThreshold:(id)a3
{
  id v4 = a3;
  if ([v4 dragged]) {
    float v5 = 12.0;
  }
  else {
    float v5 = 18.0;
  }
  id v6 = [v4 key];
  int v7 = [(UIKeyboardLayoutStar *)self stateForKey:v6];

  int v8 = [(UIKBTree *)self->_keyplane dragThreshold];
  if (v7 != 16 && v8 == 41)
  {
    if ([v4 dragged]) {
      float v5 = 36.0;
    }
    else {
      float v5 = 45.0;
    }
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
    || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
    || (float v9 = 5.0, [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23))
  {
    float v9 = 5.0;
    if (![(UIKeyboardLayout *)self isFloating])
    {
      if ([v4 dragged]) {
        float v5 = 34.0;
      }
      else {
        float v5 = 42.0;
      }
      float v9 = 15.0;
    }
  }
  id v10 = [v4 key];

  if (v10) {
    BOOL v11 = v7 == 16;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11) {
    float v12 = v9;
  }
  else {
    float v12 = 0.0;
  }
  float v13 = v5 - v12;
  uint64_t v14 = [v4 key];
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    uint64_t v16 = [v4 key];
    if ([v16 interactionType] == 16)
    {

      if ((v7 & 0x10) != 0) {
        float v13 = v13 / 3.0;
      }
    }
    else
    {
    }
  }
  id v17 = +[UIKeyboardSplitControlMenu activeInstance];
  int v18 = [v17 isVisible];

  if (v18) {
    float v19 = 0.0;
  }
  else {
    float v19 = v13;
  }
  id v20 = [v4 touch];
  [v20 locationInView:self];
  double v22 = v21;
  double v24 = v23;

  [v4 initialDragPoint];
  *(float *)&double v25 = v22 - v25;
  float v26 = fabsf(*(float *)&v25);
  [v4 initialDragPoint];
  float v28 = v24 - v27;
  BOOL v29 = v19 <= fabsf(v28) || v19 <= v26;

  return v29;
}

- (void)touchDragged:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v12 touchDragged:v4];
  float v5 = +[UIKBTouchState touchUUIDForTouch:v4];
  id v6 = [(UIKeyboardLayoutStar *)self infoForTouchUUID:v5];
  if ([(UIKeyboardLayoutStar *)self _allowContinuousPathUI]
    && [v6 continuousPathState] == 4)
  {
    [v4 locationInView:self];
    double v8 = v7;
    double v10 = v9;
    [v4 timestamp];
    -[UIKeyboardLayoutStar addContinuousPathPoint:withTimestamp:](self, "addContinuousPathPoint:withTimestamp:", v8, v10, v11);
  }
}

- (void)touchDragged:(id)a3 executionContext:(id)a4
{
  uint64_t v170 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  double v9 = [(UIKeyboardLayoutStar *)self infoForTouch:v7];
  double v10 = v9;
  if (v9)
  {
    [v9 addTouch:v7];
    double v11 = off_1E52D4000;
    objc_super v12 = +[UIKeyboardImpl activeInstance];
    BOOL v13 = [(UIKeyboardLayoutStar *)self touchPassesDragThreshold:v10];
    uint64_t v14 = [v10 touch];
    [v14 locationInView:self];
    double v16 = v15;
    double v18 = v17;

    [v10 initialDragPoint];
    double v20 = v19;
    double v21 = [v10 key];
    *(void *)&v158.origin.CGFloat x = a2;
    if ([v21 displayTypeHint] == 10)
    {
      double v22 = [v10 key];
      if ([v22 state] != 20)
      {
        double v23 = self;
        id v24 = v7;
        id v25 = v8;
        float v26 = v12;
        double v27 = [v10 key];
        if ([v27 state] != 2)
        {
          double v43 = [v10 slidOffKey];

          objc_super v12 = v26;
          id v8 = v25;
          id v7 = v24;
          self = v23;
          double v11 = off_1E52D4000;
          if (!v43)
          {
            [v10 initialPoint];
            double v45 = v44;
            id v46 = [v10 key];
            [v46 paddedFrame];
            double v48 = v47;

            CGRect v49 = [v10 key];
            int v50 = [v49 state];

            if (v50 != 16 || (v18 - v45) / v48 > 0.25)
            {
              int v51 = [v10 key];
              int v52 = [v51 state];

              if (v52 == 16)
              {
                uint64_t v53 = [v10 key];
                [(UIKeyboardLayoutStar *)self setState:4 forKey:v53];
              }
              objc_msgSend(v10, "setInitialDragPoint:", v16, v18);
              [v10 setDragged:1];
              [(UIKeyboardLayoutStar *)self updatePanAlternativesForTouchInfo:v10];
              goto LABEL_29;
            }
          }
LABEL_8:
          float v28 = [v10 key];
          int v29 = [v28 interactionType];

          if (v29 == 4)
          {
            uint64_t v30 = [(__objc2_class *)v11[12] activeInstance];
            [v7 touchUUID];
            double v31 = self;
            id v32 = v7;
            id v33 = v8;
            v35 = BOOL v34 = v12;
            BOOL v36 = +[UIKBTouchState touchForTouchUUID:v35];
            [v36 force];
            objc_msgSend(v30, "adjustAutoDeleteTimerForForce:");

            objc_super v12 = v34;
            id v8 = v33;
            id v7 = v32;
            self = v31;
          }
          if (![(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected] && v13)
          {
            objc_msgSend(v10, "setInitialDragPoint:", v16, v18);
            [v10 setDragged:1];
            [v12 touchLongPressTimer];
            if (v29 != 16
              || ([(UIKeyboardLayoutStar *)self multitapInterrupted],
                  multitapKeCGFloat y = self->_multitapKey,
                  self->_multitapKeCGFloat y = 0,
                  multitapKey,
                  ![(UIKeyboardLayoutStar *)self handleFlick:v10])
              && self->_preTouchKeyplaneName
              && !-[NSString isEqualToString:](self->_keyplaneName, "isEqualToString:"))
            {
              double v38 = [v10 key];
              BOOL v39 = [(UIKeyboardLayoutStar *)self shouldShowInternationalMenuForKey:v38];

              if (v39)
              {
                SEL v40 = +[UIInputSwitcherView sharedInstance];
                goto LABEL_41;
              }
              if (v29 == 5)
              {
                if (+[UIDictationController viewMode] == 1)
                {
                  double v41 = +[UIKeyboardDictationMenu sharedInstance];
                  if ([v41 isVisible])
                  {
                    double v42 = UIKeyboardDictationMenu;
                    goto LABEL_33;
                  }
LABEL_34:
                  SEL v40 = 0;
                  goto LABEL_35;
                }
                double v54 = +[UIDictationConnectionPreferences sharedInstance];
                if ([v54 dictationIsEnabled])
                {
                  double v55 = v12;
                  uint64_t v56 = +[UIKeyboardInputModeController sharedInputModeController];
                  double v57 = [v56 enabledDictationLanguages];
                  unint64_t v58 = [v57 count];

                  if (v58 < 2)
                  {
                    SEL v40 = 0;
                  }
                  else
                  {
                    SEL v40 = +[UIInputSwitcherView sharedInstance];
                  }
                  objc_super v12 = v55;
LABEL_41:
                  uint64_t v59 = [v10 key];
                  if (v59)
                  {
                    double v60 = (void *)v59;
                    double v61 = [v10 key];
                    double v157 = v12;
                    int v62 = [(UIKeyboardLayoutStar *)self stateForKey:v61];

                    BOOL v63 = v62 == 16;
                    objc_super v12 = v157;
                    if (v63 && !v40)
                    {
                      [v157 clearLongPressTimer];
                      CGPoint v64 = [v10 key];
                      [v64 frame];
                      CGFloat x = v65;
                      CGFloat y = v67;
                      CGFloat width = v69;
                      CGFloat height = v71;

                      long long v165 = 0u;
                      long long v166 = 0u;
                      long long v163 = 0u;
                      long long v164 = 0u;
                      id v73 = [v10 key];
                      id v74 = [v73 subtrees];

                      uint64_t v75 = [v74 countByEnumeratingWithState:&v163 objects:v169 count:16];
                      if (v75)
                      {
                        uint64_t v76 = v75;
                        uint64_t v77 = *(void *)v164;
                        do
                        {
                          for (uint64_t i = 0; i != v76; ++i)
                          {
                            if (*(void *)v164 != v77) {
                              objc_enumerationMutation(v74);
                            }
                            [*(id *)(*((void *)&v163 + 1) + 8 * i) frame];
                            v183.origin.CGFloat x = v79;
                            v183.origin.CGFloat y = v80;
                            v183.size.CGFloat width = v81;
                            v183.size.CGFloat height = v82;
                            v172.origin.CGFloat x = x;
                            v172.origin.CGFloat y = y;
                            v172.size.CGFloat width = width;
                            v172.size.CGFloat height = height;
                            CGRect v173 = CGRectUnion(v172, v183);
                            CGFloat x = v173.origin.x;
                            CGFloat y = v173.origin.y;
                            CGFloat width = v173.size.width;
                            CGFloat height = v173.size.height;
                          }
                          uint64_t v76 = [v74 countByEnumeratingWithState:&v163 objects:v169 count:16];
                        }
                        while (v76);
                      }

                      double v83 = [v10 key];
                      [v83 frame];
                      CGFloat v85 = v84 * -0.5;
                      CGFloat v86 = [v10 key];
                      [v86 frame];
                      CGFloat v88 = v87 * -0.5;
                      v174.origin.CGFloat x = x;
                      v174.origin.CGFloat y = y;
                      v174.size.CGFloat width = width;
                      v174.size.CGFloat height = height;
                      CGRect v175 = CGRectInset(v174, v85, v88);
                      CGFloat v89 = v175.origin.x;
                      CGFloat v90 = v175.origin.y;
                      CGFloat v91 = v175.size.width;
                      CGFloat v92 = v175.size.height;

                      long long v93 = [v10 key];
                      long long v94 = [v93 subtrees];
                      uint64_t v95 = [v94 count];

                      if (v95 == 1)
                      {
                        v176.origin.CGFloat x = v89;
                        v176.origin.CGFloat y = v90;
                        v176.size.CGFloat width = v91;
                        v176.size.CGFloat height = v92;
                        if (v16 < CGRectGetMinX(v176)) {
                          goto LABEL_88;
                        }
                        v177.origin.CGFloat x = v89;
                        v177.origin.CGFloat y = v90;
                        v177.size.CGFloat width = v91;
                        v177.size.CGFloat height = v92;
                        if (v16 > CGRectGetMaxX(v177)) {
                          goto LABEL_88;
                        }
                      }
                      else
                      {
                        CGFloat v108 = [v10 key];
                        CGFloat v109 = [v108 subtrees];
                        unint64_t v110 = [v109 count];

                        if (v110 < 2) {
                          goto LABEL_97;
                        }
                        double v111 = [v10 key];
                        double v112 = [v111 name];
                        int v113 = [v112 isEqual:@"EmojiPopupKey"];

                        if (v113)
                        {
                          double v114 = [v10 key];
                          v115 = [(UIKBKeyplaneView *)self->_keyplaneView existingVariantsKeyViewForKey:v114];
                          if (v115)
                          {
                            [v114 frame];
                            v158.origin.CGFloat x = v116;
                            CGFloat r1 = v117;
                            double v119 = v118;
                            double v121 = v120;
                            [v115 frame];
                            double v123 = v122;
                            double v125 = v124;
                            double v127 = v126;
                            double v129 = v128;
                            long long v130 = [v115 superview];
                            -[UIView convertRect:fromView:](self, "convertRect:fromView:", v130, v123, v125, v127, v129);
                            CGFloat v132 = v131;
                            CGFloat v134 = v133;
                            CGFloat v136 = v135;
                            CGFloat v138 = v137;

                            v178.origin.CGFloat x = v158.origin.x;
                            v178.origin.CGFloat y = r1;
                            v178.size.CGFloat width = v119;
                            v178.size.CGFloat height = v121;
                            v184.origin.CGFloat x = v132;
                            v184.origin.CGFloat y = v134;
                            v184.size.CGFloat width = v136;
                            v184.size.CGFloat height = v138;
                            CGRect v179 = CGRectUnion(v178, v184);
                            CGRect v180 = CGRectInset(v179, v119 * -0.5, v121 * -0.5);
                            CGFloat v89 = v180.origin.x;
                            CGFloat v90 = v180.origin.y;
                            CGFloat v91 = v180.size.width;
                            CGFloat v92 = v180.size.height;
                          }
                          v181.origin.CGFloat x = v89;
                          v181.origin.CGFloat y = v90;
                          v181.size.CGFloat width = v91;
                          v181.size.CGFloat height = v92;
                          v171.CGFloat x = v16;
                          v171.CGFloat y = v18;
                          if (!CGRectContainsPoint(v181, v171) && (_os_feature_enabled_impl() & 1) != 0)
                          {
                            v139 = [MEMORY[0x1E4F28EB8] defaultCenter];
                            v167[0] = @"key";
                            v167[1] = @"touch";
                            v168[0] = v114;
                            double v140 = [v7 uiTouch];
                            v168[1] = v140;
                            int64_t v141 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v168 forKeys:v167 count:2];
                            [v139 postNotificationName:@"UIKeyboardWillCancelEmojiVariants" object:self userInfo:v141];

                            objc_super v12 = v157;
LABEL_88:
                            [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
                            if ([v12 caretVisible]) {
                              [(UIKeyboardLayoutStar *)self _cleanUpBlinkAssertionIfNecessary];
                            }
                            if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
                              || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
                              || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
                              || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26
                              || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 23)
                            {
                              [(UIKeyboardLayoutStar *)self setKeyboardDim:0 amount:0.0 withDuration:0.3];
                            }
                            goto LABEL_103;
                          }

LABEL_97:
                          id v146 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
                          BOOL v147 = [v10 key];
                          int v148 = [v146 popupKeyUsesCustomKeyContentView:v147];

                          if (v148)
                          {
                            keyplaneView = self->_keyplaneView;
                            v150 = [v10 key];
                            BOOL selectedVariantIndexChanged = 1;
                            if (!-[UIKBKeyplaneView retestSelectedVariantIndexForKey:atPoint:phase:](keyplaneView, "retestSelectedVariantIndexForKey:atPoint:phase:", v150, 1, v16, v18))BOOL selectedVariantIndexChanged = self->_selectedVariantIndexChanged; {
                            self->_BOOL selectedVariantIndexChanged = selectedVariantIndexChanged;
                            }
                          }
                          else
                          {
                            v150 = [v10 key];
                            -[UIKeyboardLayoutStar updateSelectedVariantIndexForKey:withActions:withPoint:](self, "updateSelectedVariantIndexForKey:withActions:withPoint:", v150, 0, v16, v18);
                          }

                          double v152 = [v10 key];
                          [(UIKeyboardLayoutStar *)self setState:16 forKey:v152];

                          goto LABEL_103;
                        }
                      }
                      v182.origin.CGFloat x = v89;
                      v182.origin.CGFloat y = v90;
                      v182.size.CGFloat width = v91;
                      v182.size.CGFloat height = v92;
                      if (v18 > CGRectGetMaxY(v182)) {
                        goto LABEL_88;
                      }
                      goto LABEL_97;
                    }
                  }
                  if (v40 && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 3)
                  {
                    double v102 = [v40 superview];

                    if (v102)
                    {
                      [v7 locationInView:self];
                      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v40);
                      double v104 = v103;
                      double v106 = v105;
                      [v40 size];
                      if (v106 - v107 < 0.0) {
                        self->_dictationUsingServerManualEndpointing = 0;
                      }
                      objc_msgSend(v40, "updateSelectionWithPoint:", v104, v106);
                      goto LABEL_103;
                    }
                    float v142 = v18 - v20;
                    double v143 = fabsf(v142);
                    [(UIKeyboardLayout *)self flickDistance];
                    if (v144 < v143 && [(NSMutableDictionary *)self->_extendedTouchInfoMap count] == 1)
                    {
                      if (![(UIKeyboardLayoutStar *)self isHandwritingPlane] || v29 != 3)
                      {
                        float v145 = [v10 key];
                        if ([(UIKeyboardLayoutStar *)self stateForKey:v145] == 4)
                        {
                        }
                        else
                        {
                          double v153 = [v10 key];
                          int v154 = [v153 interactionType];

                          if (v154 != 5) {
                            goto LABEL_103;
                          }
                        }
                      }
                      double v155 = [v10 key];
                      [(UIKeyboardLayoutStar *)self showMenu:v40 forKey:v155];

                      [v7 locationInView:v40];
                      objc_msgSend(v40, "updateSelectionWithPoint:");
                      self->_dictationUsingServerManualEndpointing = 0;
                    }
                  }
                  else
                  {
                    if ([(UIKeyboardLayoutStar *)self _allowContinuousPathUI]
                      && [v10 continuousPathState] == 1)
                    {
                      [(UIKeyboardLayoutStar *)self _transitionToContinuousPathState:3 forTouchInfo:v10];
                    }
                    BOOL v96 = [v10 continuousPathState] == 3 || objc_msgSend(v10, "continuousPathState") == 4;
                    BOOL v97 = [(UIKBTree *)self->_keyplane shouldSuppressDragRetest];
                    if (!v97 && !v96)
                    {
                      long long v98 = [v10 key];
                      BOOL v99 = [(UIKeyboardLayoutStar *)self shouldRetestTouchDraggedFromKey:v98];

                      if (!v99) {
                        goto LABEL_103;
                      }
LABEL_69:
                      *(void *)&v158.origin.CGFloat y = MEMORY[0x1E4F143A8];
                      *(void *)&v158.size.CGFloat width = 3221225472;
                      *(void *)&v158.size.CGFloat height = __54__UIKeyboardLayoutStar_touchDragged_executionContext___block_invoke;
                      double v159 = &unk_1E52E3CD0;
                      CGFloat v162 = v158.origin.x;
                      double v160 = self;
                      id v100 = v10;
                      id v161 = v100;
                      id v101 = [v8 childWithContinuation:&v158.origin.y];
                      [(UIKeyboardLayoutStar *)self performHitTestForTouchInfo:v100 touchStage:1 executionContextPassingUIKBTree:v101];

LABEL_104:
                      goto LABEL_105;
                    }
                    if (!v97) {
                      goto LABEL_69;
                    }
                  }
LABEL_103:
                  [v8 returnExecutionToParent];
                  goto LABEL_104;
                }
              }
              else if (v29 == 6)
              {
                double v41 = +[UIKeyboardSplitControlMenu sharedInstance];
                if ([v41 isVisible])
                {
                  double v42 = UIKeyboardSplitControlMenu;
LABEL_33:
                  SEL v40 = [(__objc2_class *)v42 sharedInstance];
LABEL_35:

                  goto LABEL_41;
                }
                goto LABEL_34;
              }
              SEL v40 = 0;
              goto LABEL_41;
            }
          }
LABEL_29:
          [v8 returnExecutionToParent];
LABEL_105:

          goto LABEL_106;
        }

        objc_super v12 = v26;
        id v8 = v25;
        id v7 = v24;
        self = v23;
        double v11 = off_1E52D4000;
      }
    }
    goto LABEL_8;
  }
  [v8 returnExecutionToParent];
LABEL_106:
}

void __54__UIKeyboardLayoutStar_touchDragged_executionContext___block_invoke(uint64_t *a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [v12 info];
  if (v3)
  {
    id v4 = (void *)v3;
    float v5 = [v12 info];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[4];
      double v10 = [v12 info];
      [v7 handleFailureInMethod:v8, v9, @"UIKeyboardLayoutStar.m", 8808, @"UIKeyboardTask %s expected UIKBTree but received %@", "-[UIKeyboardLayoutStar touchDragged:executionContext:]_block_invoke", v10 object file lineNumber description];
    }
  }
  double v11 = [v12 info];
  [(id)a1[4] completeHitTestForTouchDragged:a1[5] hitKey:v11];
  [v12 returnExecutionToParent];
}

- (void)completeHitTestForTouchDragged:(id)a3 hitKey:(id)a4
{
  uint64_t v120 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 initialDragPoint];
  double v9 = v8;
  double v11 = v10;
  id v12 = +[UIKeyboardImpl activeInstance];
  if ([(UIKeyboardLayout *)self supportsVirtualDrift])
  {
    [v7 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    double v21 = &OBJC_IVAR___UIKeyboardLayoutStar__leftDriftOffset;
    if (([(NSMutableSet *)self->_leftKeySet containsObject:v7] & 1) != 0
      || (double v21 = &OBJC_IVAR___UIKeyboardLayoutStar__rightDriftOffset,
          [(NSMutableSet *)self->_rightKeySet containsObject:v7]))
    {
      double v22 = (double *)((char *)self + *v21);
    }
    else
    {
      double v22 = (double *)MEMORY[0x1E4F1DAD8];
    }
    double v23 = *v22;
    double v24 = v22[1];
    v121.origin.CGFloat x = v14;
    v121.origin.CGFloat y = v16;
    v121.size.CGFloat width = v18;
    v121.size.CGFloat height = v20;
    double v25 = v9 - CGRectGetMidX(v121) - v23;
    v122.origin.CGFloat x = v14;
    v122.origin.CGFloat y = v16;
    v122.size.CGFloat width = v18;
    v122.size.CGFloat height = v20;
    double v26 = v11 - CGRectGetMidY(v122) - v24;
    double v27 = [(UIKeyboardLayoutStar *)self handRestRecognizerGetHomeRowHint];
    float v28 = [v6 touch];
    -[UIKeyboardLayout _updateTouchState:errorVector:rowOffsetFromHomeRow:](self, "_updateTouchState:errorVector:rowOffsetFromHomeRow:", v28, (int)[v7 displayRowHint] - objc_msgSend(v27, "integerValue"), v25, v26);
  }
  id v29 = [v6 key];

  if (v29 == v7) {
    goto LABEL_91;
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
    && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23
    || ([v12 usesContinuousPath] & 1) != 0)
  {
    uint64_t v30 = [v6 key];
    if ([v30 state] != 1)
    {
      double v31 = [v6 key];
      if ([v31 interactionType] == 11)
      {
LABEL_18:

        goto LABEL_19;
      }
      id v32 = [v6 key];
      if ([v32 interactionType] == 14)
      {

        goto LABEL_18;
      }
      uint64_t v76 = [v6 key];
      if ([v76 state] == 4)
      {
        uint64_t v77 = [v6 key];
        int v78 = [v77 interactionType];

        if (v78 == 10) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      uint64_t v30 = [v6 key];
      [(UIKeyboardLayoutStar *)self setState:2 forKey:v30];
    }
LABEL_19:

LABEL_20:
    id v33 = [v6 key];
    if (([(UIKeyboardLayoutStar *)self upActionFlagsForKey:v33] & 0x400) != 0)
    {
      BOOL shift = self->_shift;

      if (shift)
      {
        [v12 setShift:0];
        [(UIKeyboardLayoutStar *)self setShift:0];
      }
    }
    else
    {
    }
    [v12 stopAutoDelete];
    if (v7)
    {
      if ([v7 interactionType] == 13) {
        goto LABEL_91;
      }
      if ([v7 interactionType] == 4) {
        goto LABEL_91;
      }
      if ([v7 displayType] == 49) {
        goto LABEL_91;
      }
      if (([(UIKeyboardLayoutStar *)self upActionFlagsForKey:v7] & 2) == 0) {
        goto LABEL_91;
      }
      self->_revertKeyplaneAfterTouch = 1;
      objc_msgSend(v12, "setInputPoint:", v9, v11);
      [(UIKeyboardLayoutStar *)self setActiveKey:v7];
      double v69 = [v6 key];
      [v6 setSlidOffKey:v69];

      [v6 setKey:v7];
      [v6 setKeyplane:self->_keyplane];
      if ([(UIKeyboardLayoutStar *)self _allowContinuousPathUI])
      {
        if ([v6 continuousPathState] != 2) {
          goto LABEL_91;
        }
      }
LABEL_70:
      [(UIKeyboardLayoutStar *)self setState:4 forKey:v7];
      goto LABEL_91;
    }
    [(UIKeyboardLayoutStar *)self setActiveKey:0];
    id v70 = [v6 key];
    [v6 setSlidOffKey:v70];

LABEL_90:
    [v6 setKey:0];
    [v6 setKeyplane:self->_keyplane];
    goto LABEL_91;
  }
  [v12 stopAutoDelete];
  BOOL v34 = [v6 key];
  [v6 setSlidOffKey:v34];

  id v35 = [v6 slidOffKey];
  if (([(UIKeyboardLayoutStar *)self downActionFlagsForKey:v35] & 0x10) != 0)
  {
    char v36 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v7];

    if ((v36 & 0x10) != 0) {
      goto LABEL_33;
    }
    [(UIKeyboardLayout *)self setShiftKeyTouchUUID:0];
    keyplane = self->_keyplane;
    double v38 = [v6 slidOffKey];
    BOOL v39 = [v38 name];
    SEL v40 = [(UIKBTree *)keyplane keysByKeyName:v39];

    double v41 = [v6 slidOffKey];
    int v42 = [(UIKeyboardLayoutStar *)self stateForShiftKey:v41];

    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id v35 = v40;
    uint64_t v43 = [v35 countByEnumeratingWithState:&v114 objects:v119 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = v42 ^ 4u;
      uint64_t v46 = *(void *)v115;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v115 != v46) {
            objc_enumerationMutation(v35);
          }
          [(UIKeyboardLayoutStar *)self setState:v45 forKey:*(void *)(*((void *)&v114 + 1) + 8 * i)];
        }
        uint64_t v44 = [v35 countByEnumeratingWithState:&v114 objects:v119 count:16];
      }
      while (v44);
    }
  }
LABEL_33:
  uint64_t v48 = [v6 key];
  if (v48)
  {
    CGRect v49 = (void *)v48;
    int v50 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
    if (v50
      || ([v6 keyplane], int v50 = (UIKBTree *)objc_claimAutoreleasedReturnValue(), v50 == self->_keyplane))
    {
    }
    else
    {
      double v71 = [v6 keyplane];
      int v72 = [v71 looksLikeShiftAlternate];

      if (v72)
      {
        [(UIKeyboardLayoutStar *)self setActiveKey:v7];
        [v6 setKey:v7];
        [v6 setKeyplane:self->_keyplane];
        goto LABEL_70;
      }
    }
  }
  uint64_t v51 = [v6 key];
  if (v51)
  {
    int v52 = (void *)v51;
    uint64_t v53 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
    if (v53)
    {
      double v54 = (void *)v53;
      BOOL v55 = [(UIKeyboardLayoutStar *)self isShiftKeyBeingHeld];

      if (!v55) {
        goto LABEL_39;
      }
    }
    else
    {
    }
    id v73 = [v6 key];
    if ([v73 state] == 1) {
      goto LABEL_87;
    }
    id v74 = [v6 key];
    if ([v74 interactionType] != 14)
    {
      uint64_t v75 = [v6 key];
      if ([v75 interactionType] != 38)
      {
        CGFloat v79 = [v6 key];
        if ([v79 state] == 4)
        {
          CGFloat v80 = [v6 key];
          int v81 = [v80 interactionType];

          if (v81 == 10) {
            goto LABEL_88;
          }
        }
        else
        {
        }
        id v73 = [v6 key];
        [(UIKeyboardLayoutStar *)self setState:2 forKey:v73];
LABEL_87:

LABEL_88:
        [v6 initialPoint];
        float v83 = v9 - v82;
        [v6 initialPoint];
        float v85 = v11 - v84;
        if ((float)((float)(v83 * v83) + (float)(v85 * v85)) <= 10000.0) {
          goto LABEL_91;
        }
        [(UIKeyboardLayoutStar *)self setActiveKey:0];
        goto LABEL_90;
      }
    }
    goto LABEL_87;
  }
LABEL_39:
  uint64_t v56 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];

  if (v56)
  {
    self->_revertKeyplaneAfterTouch = 1;
    if ([v7 interactionType] != 13
      && [v7 interactionType] != 4
      && ([(UIKeyboardLayoutStar *)self upActionFlagsForKey:v7] & 2) != 0)
    {
      objc_msgSend(v12, "setInputPoint:", v9, v11);
      [(UIKeyboardLayoutStar *)self setActiveKey:v7];
      [v6 setKey:v7];
      [v6 setKeyplane:self->_keyplane];
      id v57 = [v6 slidOffKey];
      if ([v57 interactionType] != 11)
      {
        unint64_t v58 = [v6 slidOffKey];
        int v59 = [v58 interactionType];

        if (v59 == 14) {
          goto LABEL_54;
        }
        double v60 = self->_keyplane;
        double v61 = [v6 slidOffKey];
        int v62 = [v61 name];
        BOOL v63 = [(UIKBTree *)v60 keysByKeyName:v62];

        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        id v57 = v63;
        uint64_t v64 = [v57 countByEnumeratingWithState:&v110 objects:v118 count:16];
        if (v64)
        {
          uint64_t v65 = v64;
          uint64_t v66 = *(void *)v111;
          do
          {
            for (uint64_t j = 0; j != v65; ++j)
            {
              if (*(void *)v111 != v66) {
                objc_enumerationMutation(v57);
              }
              [(UIKeyboardLayoutStar *)self setState:2 forKey:*(void *)(*((void *)&v110 + 1) + 8 * j)];
            }
            uint64_t v65 = [v57 countByEnumeratingWithState:&v110 objects:v118 count:16];
          }
          while (v65);
        }
      }
LABEL_54:
      if ([v6 continuousPathState] == 4) {
        goto LABEL_91;
      }
      goto LABEL_70;
    }
  }
LABEL_91:
  if ([v12 usesContinuousPathProgressiveCandidates]
    && [v6 continuousPathState] == 4)
  {
    if (self->_prevProgressiveCandidateRequestTime)
    {
      CGFloat v86 = [MEMORY[0x1E4F1C9C8] date];
      [v86 timeIntervalSinceDate:self->_prevProgressiveCandidateRequestTime];
      double v88 = v87;

      if (v88 > 0.2)
      {
        [v12 generateCandidatesWithOptions:12];
        progressiveCandidateUpdateTimer = self->_progressiveCandidateUpdateTimer;
        if (progressiveCandidateUpdateTimer) {
          [(NSTimer *)progressiveCandidateUpdateTimer invalidate];
        }
        CGFloat v90 = [MEMORY[0x1E4F1C9C8] date];
        prevProgressiveCandidateRequestTime = self->_prevProgressiveCandidateRequestTime;
        self->_prevProgressiveCandidateRequestTime = v90;
      }
    }
    if (![(NSTimer *)self->_progressiveCandidateUpdateTimer isValid])
    {
      CGFloat v92 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v104 = MEMORY[0x1E4F143A8];
      uint64_t v105 = 3221225472;
      double v106 = __62__UIKeyboardLayoutStar_completeHitTestForTouchDragged_hitKey___block_invoke;
      double v107 = &unk_1E52DAA48;
      CGFloat v108 = self;
      id v109 = v12;
      long long v93 = [v92 scheduledTimerWithTimeInterval:0 repeats:&v104 block:0.2];
      long long v94 = self->_progressiveCandidateUpdateTimer;
      self->_progressiveCandidateUpdateTimer = v93;
    }
  }
  uint64_t v95 = objc_msgSend(v6, "key", v104, v105, v106, v107, v108);
  if (v95)
  {
    BOOL v96 = (void *)v95;
    BOOL v97 = [v6 key];
    if ([v97 interactionType] == 9)
    {
    }
    else
    {
      long long v98 = [v6 key];
      int v99 = [v98 interactionType];

      if (v99 != 5)
      {
        id v100 = [(UIKeyboardLayoutStar *)self activeKey];
        if ([v100 interactionType] == 13)
        {
          char v101 = [v12 returnKeyEnabled];

          if ((v101 & 1) == 0) {
            goto LABEL_110;
          }
        }
        else
        {
        }
        double v102 = [v6 key];
        char v103 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v102];

        if (v103 < 0) {
          [v12 touchLongPressTimerWithDelay:1.5];
        }
      }
    }
  }
LABEL_110:
}

void __62__UIKeyboardLayoutStar_completeHitTestForTouchDragged_hitKey___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1408))
  {
    [*(id *)(a1 + 40) generateCandidatesWithOptions:12];
    uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 1288);
    *(void *)(v3 + 1288) = v2;
  }
}

- (int64_t)defaultSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  if ([v6 variantType] != 10)
  {
    if ([v6 variantType] == 11 || objc_msgSend(v6, "variantType") == 13)
    {
      int64_t v7 = [v6 selectedVariantIndex];
      goto LABEL_6;
    }
    if ((v4 & 0x80000000) == 0
      && ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 1
       && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 24
       && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 25
       && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 26
       && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 23
       || [(UIKeyboardLayout *)self isFloating]
       || [v6 displayType] == 7))
    {
      int64_t v7 = 0;
      goto LABEL_6;
    }
  }
  int64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_6:

  return v7;
}

- (void)updateSelectedVariantIndexForKey:(id)a3 withActions:(unint64_t)a4 withPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = [v9 selectedVariantIndex];
  objc_msgSend(v9, "setSelectedVariantIndex:", -[UIKeyboardLayoutStar defaultSelectedVariantIndexForKey:withActions:](self, "defaultSelectedVariantIndexForKey:withActions:", v9, a4));
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout])
  {
    -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:isDragging:](self->_liveKeyplaneView, "changingSelectedVariantForKey:atPoint:isDragging:", v9, a4 == 0, x, y);
  }
  else
  {
    if ((a4 & 0x80000000) != 0
      || [v9 variantType] == 10
      || [v9 variantType] == 12)
    {
      [v9 frame];
      v35.double x = x;
      v35.double y = y;
      if (CGRectContainsPoint(v36, v35))
      {
        [v9 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
        goto LABEL_23;
      }
    }
    uint64_t v28 = v10;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v11 = [v9 subtrees];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      int v14 = 0;
      uint64_t v15 = *(void *)v30;
      float v16 = 80.0;
LABEL_10:
      uint64_t v17 = 0;
      uint64_t v18 = v14;
      while (1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v11);
        }
        double v19 = *(void **)(*((void *)&v29 + 1) + 8 * v17);
        if ([v19 state] != 1)
        {
          [v19 frame];
          UIDistanceBetweenPointAndRect(x, y, v20, v21, v22, v23);
          float v25 = v24;
          if (v16 > v25)
          {
            double v26 = [v19 displayString];

            if (!v26) {
              NSLog(&cfstr_NilKey.isa);
            }
            [v9 setSelectedVariantIndex:v18 + v17];
            float v16 = v25;
            if (fabsf(v25) < 2.2204e-16) {
              break;
            }
          }
        }
        if (v13 == ++v17)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
          int v14 = v18 + v17;
          if (v13) {
            goto LABEL_10;
          }
          break;
        }
      }
    }

    uint64_t v10 = v28;
  }
  if (v10 != [v9 selectedVariantIndex])
  {
    self->_BOOL selectedVariantIndexChanged = 1;
    double v27 = [(UIKeyboardLayoutStar *)self slideBehaviour];
    [v27 selectionChanged];
  }
LABEL_23:
}

- (void)updatePanAlternativesForTouchInfo:(id)a3
{
  id v4 = a3;
  id v30 = [v4 key];
  [v30 paddedFrame];
  double v6 = v5;
  double v8 = v7;
  [v4 initialDragPoint];
  double v10 = v9;
  [v4 initialPoint];
  double v12 = v10 - v11;
  [v4 initialDragPoint];
  double v14 = v13;
  [v4 initialPoint];
  double v16 = v15;

  double v17 = v14 - v16;
  double v18 = v12 / v6;
  double v19 = v17 / v8;
  double v20 = 45.0 / v8;
  if ([v30 displayType] == 7) {
    double v20 = 0.6;
  }
  CGFloat v21 = [v30 secondaryDisplayStrings];
  uint64_t v22 = [v21 count];

  if (v22 != 1)
  {
    CGFloat v23 = [v30 secondaryDisplayStrings];
    uint64_t v24 = [v23 count];

    if (v24 != 2) {
      goto LABEL_14;
    }
    if (v19 > v20)
    {
      if (v18 <= -0.3)
      {
        float v25 = v30;
        uint64_t v26 = 1;
      }
      else
      {
        if (v18 < 0.3) {
          goto LABEL_14;
        }
        float v25 = v30;
        uint64_t v26 = 0;
      }
      goto LABEL_13;
    }
LABEL_12:
    float v25 = v30;
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    [v25 setSelectedVariantIndex:v26];
    goto LABEL_14;
  }
  if (v19 <= v20) {
    goto LABEL_12;
  }
  [v30 setSelectedVariantIndex:0];
  if (![(UIKeyboardLayoutStar *)self isDeveloperGestureKeybaord]) {
    self->_hasPeekedGestureKedouble y = 1;
  }
LABEL_14:
  if (v19 > 0.25)
  {
    double v27 = +[UIKeyboardImpl activeInstance];
    [v27 clearLongPressTimer];
  }
  if (self->_keyboardImageViewIsDim && [v30 selectedVariantIndex] != 0x7FFFFFFFFFFFFFFFLL) {
    [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
  }
  uint64_t v28 = [(UIKeyboardLayoutStar *)self viewForKey:v30];
  long long v29 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
  objc_msgSend(v29, "updateTransitionForKeyView:normalizedDragSize:", v28, -v18, v19);
}

- (void)resetPanAlternativesForEndedTouch:(id)a3
{
  id v6 = [a3 key];
  id v4 = [(UIKeyboardLayoutStar *)self viewForKey:v6];
  double v5 = [(UIKeyboardLayoutStar *)self keyViewAnimator];
  [v5 endTransitionForKeyView:v4];
}

- (BOOL)performReturnAction
{
  const char *returnAction;
  id returnTarget;

  if (!self->_returnAction) {
    return 0;
  }
  returnActiouint64_t n = self->_returnAction;
  returnTarget = self->_returnTarget;
  if (dyld_program_sdk_at_least()) {
    [returnTarget returnAction];
  }
  else {
    objc_msgSend(returnTarget, sel_performSelector_, returnAction);
  }
  return 1;
}

- (BOOL)performSpaceAction
{
  if (!self->_spaceAction) {
    return 0;
  }
  spaceActiouint64_t n = self->_spaceAction;
  id spaceTarget = self->_spaceTarget;
  if (dyld_program_sdk_at_least()) {
    [spaceTarget spaceAction];
  }
  else {
    objc_msgSend(spaceTarget, sel_performSelector_, spaceAction);
  }
  return 1;
}

- (void)refreshGhostKeyState
{
  if ([(UIKBTree *)self->_keyplane isSplit])
  {
    if (!self->_ghostKeysEnabled) {
      [(UIKeyboardLayoutStar *)self updateKeyCentroids];
    }
    delayedCentroidUpdate = self->_delayedCentroidUpdate;
    if (!delayedCentroidUpdate)
    {
      id v4 = [[UIDelayedAction alloc] initWithTarget:self action:sel_updateKeyCentroids userInfo:0 delay:1.0];
      double v5 = self->_delayedCentroidUpdate;
      self->_delayedCentroidUpdate = v4;

      delayedCentroidUpdate = self->_delayedCentroidUpdate;
    }
    [(UIDelayedAction *)delayedCentroidUpdate touch];
  }
  else if (self->_delayedCentroidUpdate)
  {
    [(UIKeyboardLayoutStar *)self cancelDelayedCentroidUpdate];
  }
}

- (void)cancelDelayedCentroidUpdate
{
  [(UIDelayedAction *)self->_delayedCentroidUpdate cancel];
  delayedCentroidUpdate = self->_delayedCentroidUpdate;
  self->_delayedCentroidUpdate = 0;
}

- (void)handleDelayedCentroidUpdate
{
  uint64_t v3 = self->_delayedCentroidUpdate;
  objc_initWeak(&location, self);
  if (qword_1EB25ABC8 != -1) {
    dispatch_once(&qword_1EB25ABC8, &__block_literal_global_1215);
  }
  id v4 = [(UIKeyboardLayout *)self taskQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__UIKeyboardLayoutStar_handleDelayedCentroidUpdate__block_invoke_3;
  v6[3] = &unk_1E52FA5F8;
  double v5 = v3;
  double v7 = v5;
  double v8 = self;
  objc_copyWeak(&v9, &location);
  [v4 addTask:v6 breadcrumb:qword_1EB25ABC0];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__UIKeyboardLayoutStar_handleDelayedCentroidUpdate__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1217_0 copy];
  int v1 = (void *)qword_1EB25ABC0;
  qword_1EB25ABC0 = v0;
}

uint64_t __51__UIKeyboardLayoutStar_handleDelayedCentroidUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __51__UIKeyboardLayoutStar_handleDelayedCentroidUpdate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 1016))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained updateKeyCentroids];
    }

    id v3 = v6;
  }
  [v3 returnExecutionToParent];
}

- (BOOL)shouldRetestTouchUp:(id)a3
{
  id v4 = a3;
  double v5 = [v4 key];
  id v6 = v5;
  BOOL v7 = 0;
  if (!v4 || !v5) {
    goto LABEL_36;
  }
  if (![v5 allowRetestAfterCommittingDownActions])
  {
LABEL_35:
    BOOL v7 = 0;
    goto LABEL_36;
  }
  double v8 = [v4 key];
  if ([v8 displayTypeHint] != 10) {
    goto LABEL_9;
  }
  id v9 = [v4 key];
  if ([v9 state] == 20)
  {
LABEL_8:

LABEL_9:
    goto LABEL_10;
  }
  double v10 = [v4 key];
  if ([v10 state] == 2)
  {

    goto LABEL_8;
  }
  double v17 = [v4 slidOffKey];

  if (!v17) {
    goto LABEL_35;
  }
LABEL_10:
  if ([(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer pinchDetected]) {
    goto LABEL_35;
  }
  double v11 = [v4 key];
  int v12 = [v11 interactionType];

  if (v12 != 5)
  {
    if (v12 != 6)
    {
      if (v12 == 9)
      {
        double v13 = [v4 key];
        int v14 = [v13 displayType];

        if (v14 == 13) {
          goto LABEL_15;
        }
      }
      goto LABEL_26;
    }
    double v15 = +[UIKeyboardSplitControlMenu sharedInstance];
    if ([v15 isVisible])
    {
      double v18 = UIKeyboardSplitControlMenu;
LABEL_23:
      double v16 = [(__objc2_class *)v18 sharedInstance];

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (+[UIDictationController viewMode] == 1)
  {
    double v15 = +[UIKeyboardDictationMenu sharedInstance];
    if ([v15 isVisible])
    {
      double v18 = UIKeyboardDictationMenu;
      goto LABEL_23;
    }
LABEL_27:
    double v16 = 0;
    goto LABEL_28;
  }
  double v15 = +[UIDictationConnectionPreferences sharedInstance];
  if (![v15 dictationIsEnabled]) {
    goto LABEL_27;
  }
  double v19 = +[UIKeyboardInputModeController sharedInputModeController];
  double v20 = [v19 enabledDictationLanguages];
  unint64_t v21 = [v20 count];

  if (v21 >= 2)
  {
LABEL_15:
    double v15 = +[UIInputSwitcherView sharedInstance];
    double v16 = v15;
LABEL_28:

    goto LABEL_29;
  }
LABEL_26:
  double v16 = 0;
LABEL_29:
  uint64_t v22 = [v4 key];
  if (v22)
  {
    CGFloat v23 = (void *)v22;
    uint64_t v24 = [v4 key];
    int v25 = [(UIKeyboardLayoutStar *)self stateForKey:v24];

    if (v25 == 16 && !v16) {
      goto LABEL_35;
    }
  }
  if (v16 && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 3
    || [(UIKBTree *)self->_keyplane shouldSuppressDragRetest])
  {
    goto LABEL_35;
  }
  double v27 = [v4 key];
  uint64_t v28 = [v4 slidOffKey];
  long long v29 = [v4 keyplane];
  BOOL v30 = [(UIKeyboardLayoutStar *)self shouldRetestKey:v27 slidOffKey:v28 withKeyplane:v29];

  BOOL v7 = v30 || [v4 continuousPathState] == 4;
LABEL_36:

  return v7;
}

- (void)touchUp:(id)a3 executionContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    id v9 = [(UIKeyboardLayoutStar *)self infoForTouch:v7];
    if ([(UIKeyboardLayoutStar *)self preventPaddlesForPointerTouches])
    {
      double v10 = [v9 key];
      [v10 setPreventPaddle:0];
    }
    if ([v9 delayed]
      && !self->_didLongPress
      && [v9 continuousPathState] == 1)
    {
      double v11 = [v9 key];
      unint64_t v12 = [(UIKeyboardLayoutStar *)self downActionFlagsForKey:v11];

      double v13 = +[UIKeyboardImpl activeInstance];
      [v13 clearLongPressTimer];

      [v9 setDelayed:0];
      int v14 = [v9 key];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke;
      v51[3] = &unk_1E52E3628;
      v51[4] = self;
      id v52 = v7;
      double v15 = [v8 childWithContinuation:v51];
      [(UIKeyboardLayoutStar *)self completeCommitTouchesPrecedingTouchDownWithKey:v14 withActions:v12 executionContext:v15];

LABEL_51:
      goto LABEL_52;
    }
    [v9 addTouch:v7];
    if (v9) {
      goto LABEL_10;
    }
  }
  [v7 locationInView:self];
  id v9 = 0;
  if (-[UIKeyboardLayoutStar pointInside:forEvent:](self, "pointInside:forEvent:", 0))
  {
LABEL_10:
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v17 = Current - self->_prevTouchUpTime;
    [(_UIKeyboardTypingSpeedLogger *)self->_typingSpeedLogger recordTypingDelay:v17];
    if (![(UIKeyboardLayoutStar *)self hasActiveContinuousPathInput]
      && [v9 continuousPathState] != 4)
    {
      double v18 = [(UIKeyboardLayout *)self typingStyleEstimator];
      [v18 tapTypedKey];

      [(UIKeyboardLayoutStar *)self clearContinuousPathView];
    }
    double v19 = [v9 key];
    if ([v19 interactionType] != 17)
    {
      double v20 = [v9 key];
      if ([v20 interactionType] != 12)
      {
        unint64_t v21 = [v9 key];
        if ([v21 interactionType] != 38)
        {
          CGRect v36 = [v9 key];
          int v45 = [v36 interactionType];

          if (v45 != 9) {
            self->_prevTouchUpTime = Current;
          }
LABEL_19:
          uint64_t v22 = +[UIKeyboardImpl activeInstance];
          [(UIKeyboardLayoutStar *)self refreshGhostKeyState];
          if (_AXSZoomTouchEnabled()
            || [(UIKeyboardLayoutStar *)self playKeyClickSoundOn] == 2)
          {
            CGFloat v23 = [v9 key];
            int v24 = [v23 interactionType];

            if (v24 == 13)
            {
              if (([v22 returnKeyEnabled] & 1) == 0) {
                goto LABEL_27;
              }
            }
            else if (!v7)
            {
              double v27 = [v9 key];
              [(UIKeyboardLayoutStar *)self playKeyReleaseSoundForKey:v27];

              goto LABEL_30;
            }
            int v25 = [v9 key];
            [(UIKeyboardLayoutStar *)self playKeyClickSoundForKey:v25];
          }
LABEL_27:
          uint64_t v26 = [v9 key];
          [(UIKeyboardLayoutStar *)self playKeyReleaseSoundForKey:v26];

          if (v7)
          {
LABEL_31:
            [v22 setShiftNeedsUpdate];
            long long v29 = [(UIKeyboardLayoutStar *)self slideBehaviour];
            [v29 userInteractionEnded];

            [(UIKeyboardLayoutStar *)self setSlideBehaviour:0];
            BOOL v30 = [v9 key];
            int v31 = [v30 interactionType];

            if (v31 == 16)
            {
              if (([v9 dragged] & 1) == 0)
              {
                long long v32 = [v9 key];
                if ([v32 flickDirection] == -3)
                {
                  BOOL v33 = [(UIKeyboardLayoutStar *)self touchPassesDragThreshold:v9];

                  if (v33) {
                    [(UIKeyboardLayoutStar *)self handleFlick:v9];
                  }
                }
                else
                {
                }
              }
              id touchInfo = self->_touchInfo;
              if (touchInfo)
              {
                self->_id touchInfo = 0;
              }
              [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
              flickPopuptimer = self->_flickPopuptimer;
              if (flickPopuptimer)
              {
                [(NSTimer *)flickPopuptimer invalidate];
                BOOL v39 = self->_flickPopuptimer;
                self->_flickPopuptimer = 0;
              }
            }
            else
            {
              uint64_t v34 = [v9 key];
              int v35 = [v34 displayTypeHint];

              if (v35 == 10) {
                [(UIKeyboardLayoutStar *)self resetPanAlternativesForEndedTouch:v9];
              }
            }
            if ([(UIKeyboardLayoutStar *)self shouldRetestTouchUp:v9])
            {
              v46[0] = MEMORY[0x1E4F143A8];
              v46[1] = 3221225472;
              v46[2] = __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke_2;
              v46[3] = &unk_1E52FA6C8;
              SEL v48 = a2;
              v46[4] = self;
              id v40 = v9;
              id v47 = v40;
              CFAbsoluteTime v49 = Current;
              double v50 = v17;
              double v41 = [v8 childWithContinuation:v46];
              [(UIKeyboardLayoutStar *)self performHitTestForTouchInfo:v40 touchStage:1 executionContextPassingUIKBTree:v41];
            }
            else
            {
              if (objc_opt_respondsToSelector())
              {
                liveKeyplaneView = self->_liveKeyplaneView;
                uint64_t v43 = [v9 key];
                uint64_t v44 = [v9 touch];
                [v44 locationInView:self];
                -[TUIKeyplaneView finishedSelectingVariantForKey:atPoint:](liveKeyplaneView, "finishedSelectingVariantForKey:atPoint:", v43);
              }
              [(UIKeyboardLayoutStar *)self completeRetestForTouchUp:v9 timestamp:v8 interval:Current executionContext:v17];
            }

            goto LABEL_51;
          }
LABEL_30:
          uint64_t v28 = [(UIKeyboardLayoutStar *)self activeKey];
          [(UIKeyboardLayoutStar *)self setState:2 forKey:v28];

          [(UIKeyboardLayoutStar *)self setActiveKey:0];
          goto LABEL_31;
        }
      }
    }

    goto LABEL_19;
  }
  [v8 returnExecutionToParent];
LABEL_52:
}

uint64_t __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) touchUp:*(void *)(a1 + 40) executionContext:a2];
}

void __49__UIKeyboardLayoutStar_touchUp_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v21 = a2;
  uint64_t v3 = [v21 info];
  if (v3)
  {
    id v4 = (void *)v3;
    double v5 = [v21 info];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 32);
      double v10 = [v21 info];
      [v7 handleFailureInMethod:v8, v9, @"UIKeyboardLayoutStar.m", 9320, @"UIKeyboardTask %s expected UIKBTree but received %@", "-[UIKeyboardLayoutStar touchUp:executionContext:]_block_invoke_2", v10 object file lineNumber description];
    }
  }
  double v11 = [v21 info];
  unint64_t v12 = [*(id *)(a1 + 32) activeTouchInfoForShift];

  if (!v12)
  {
    double v13 = *(void **)(a1 + 32);
    int v14 = [*(id *)(a1 + 40) key];
    [v13 setState:2 forKey:v14];
  }
  double v15 = [*(id *)(a1 + 32) preTouchKeyplaneName];
  double v16 = *(void **)(a1 + 40);
  if (v15)
  {
    double v17 = [v16 key];
    if ([v17 modifiesKeyplane] && (objc_msgSend(v11, "modifiesKeyplane") & 1) == 0)
    {
      double v18 = [*(id *)(a1 + 40) slidOffKey];
      [*(id *)(a1 + 40) setMaySuppressUpAction:v18 == 0];
    }
    else
    {
      [*(id *)(a1 + 40) setMaySuppressUpAction:0];
    }
  }
  else
  {
    [v16 setMaySuppressUpAction:0];
  }

  double v19 = [*(id *)(a1 + 40) key];
  if ([v19 interactionType] != 11)
  {

    goto LABEL_17;
  }
  int v20 = [v11 interactionType];

  if (v20 != 6) {
LABEL_17:
  }
    [*(id *)(a1 + 40) setKey:v11];
  [*(id *)(a1 + 40) setKeyplane:*(void *)(*(void *)(a1 + 32) + 640)];
  [*(id *)(a1 + 32) completeRetestForTouchUp:*(void *)(a1 + 40) timestamp:v21 interval:*(double *)(a1 + 56) executionContext:*(double *)(a1 + 64)];
}

- (void)handleKeyboardMenusForTouch:(id)a3
{
  id v26 = a3;
  id v4 = [v26 key];
  int v5 = [v4 interactionType];

  id v6 = [v26 key];
  if ([v6 interactionType] == 9)
  {
    id v7 = [v26 key];
    if ([v7 displayType] == 13 && objc_msgSend(v26, "dragged"))
    {

      goto LABEL_7;
    }
  }
  if (v5 != 5)
  {
    uint64_t v9 = 0;
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v8 = +[UIInputSwitcherView sharedInstance];
  uint64_t v9 = v8;
  self->_dictationUsingServerManualEndpointing = 0;
  if (v8)
  {
    double v10 = [v8 superview];

    if (v10)
    {
      double v11 = [v26 touch];
      unint64_t v12 = [v26 key];
      double v13 = [(UIKeyboardLayoutStar *)self viewForKey:v12];

      [v11 locationInView:v13];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      [v11 locationInView:v9];
      double v19 = v18;
      double v21 = v20;
      if (v5 == 5 && ([v9 bounds], v28.double x = v19, v28.y = v21, !CGRectContainsPoint(v30, v28)))
      {
        [v13 bounds];
        v29.double x = v15;
        v29.double y = v17;
        if (CGRectContainsPoint(v31, v29))
        {
          unint64_t v23 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard];
          int v24 = +[UIDictationController sharedInstance];
          [v24 setReasonType:v23];

          int v25 = +[UIDictationController sharedInstance];
          [v25 switchToDictationInputModeWithTouch:0];
        }
      }
      else
      {
        objc_msgSend(v9, "selectItemAtPoint:", v19, v21);
      }
      uint64_t v22 = [v26 key];
      [(UIKeyboardLayoutStar *)self setState:2 forKey:v22];
    }
  }
LABEL_14:
}

- (BOOL)shouldSendTouchUpToInputManager:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  if (![v4 canHandleKeyHitTest]) {
    goto LABEL_4;
  }
  int v5 = [v3 key];
  char v6 = [v5 isExemptFromInputManagerLayout];

  if ((v6 & 1) != 0
    || ([v3 key],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 interactionType],
        v7,
        v8 == 4))
  {
LABEL_4:
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = ![v4 canHandleKeyHitTest]
      || ![v3 stage]
      || [v3 stage] == 1;
  }

  return v9;
}

- (void)_recordKeystrokeStatisticForKeyPress
{
  if ([(UIKeyboardLayoutStar *)self currentHandBias])
  {
    int64_t v3 = [(UIKeyboardLayoutStar *)self currentHandBias];
    +[_UIKeyboardUsageTracking countKeystrokeForReachableKeyboardWithBias:v3];
  }
}

- (void)completeRetestForTouchUp:(id)a3 timestamp:(double)a4 interval:(double)a5 executionContext:(id)a6
{
  id v10 = a3;
  id v281 = a6;
  double v11 = +[UIKeyboardImpl activeInstance];
  unint64_t v12 = [v10 touch];
  BOOL didLongPress = self->_didLongPress;
  self->_BOOL didLongPress = 0;
  [v11 stopAutoDelete];
  [(UIKeyboardLayoutStar *)self _cleanUpBlinkAssertionIfNecessary];
  double v14 = [v10 key];

  if ([v10 continuousPathState] == 4)
  {
    [(UIKeyboardLayoutStar *)self _transitionToContinuousPathState:5 forTouchInfo:v10];
    goto LABEL_4;
  }
  if (v14)
  {
LABEL_4:
    if ([(UIKeyboardLayoutStar *)self shouldSendTouchUpToInputManager:v10])
    {
      [v12 locationInView:self];
      double v16 = v15;
      double v18 = v17;
      [v12 timestamp];
      double v20 = v19;
      if ([v10 continuousPathState] == 5)
      {
        int v21 = -2;
      }
      else
      {
        uint64_t v23 = [v10 key];
        if (v23
          && (int v24 = (void *)v23,
              [v10 key],
              int v25 = objc_claimAutoreleasedReturnValue(),
              int v26 = [v25 interactionType],
              v25,
              v24,
              v26 != 11))
        {
          double v27 = [v10 key];
          int v21 = [(UIKeyboardLayoutStar *)self keycodeForKey:v27];
        }
        else
        {
          int v21 = -1;
        }
      }
      CGPoint v28 = (void *)MEMORY[0x1E4FAE3A8];
      [v12 pathMajorRadius];
      double v30 = v29;
      uint64_t v31 = [v12 pathIndex];
      uint64_t v32 = [v10 fingerID];
      unint64_t v33 = [v10 continuousPathState] - 1;
      if (v33 < 6) {
        uint64_t v34 = (v33 + 1);
      }
      else {
        uint64_t v34 = 0;
      }
      uint64_t v22 = objc_msgSend(v28, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 2, v31, v32, v21, v34, v16, v18, v30, v20);
      [v10 setStage:2];
    }
    else
    {
      uint64_t v22 = 0;
    }
    if ([v10 continuousPathState] == 5)
    {
      [v11 skipHitTestForTouchEvent:v22];
      if ([v11 usesContinuousPathProgressiveCandidates]) {
        uint64_t v35 = 0x1000000000;
      }
      else {
        uint64_t v35 = 0x1001000000;
      }
      [(UIKeyboardLayoutStar *)self completeSendStringActionForTouchUp:v10 withActions:v35 timestamp:didLongPress interval:0 didLongPress:v281 prevActions:a4 executionContext:a5];
      goto LABEL_220;
    }
    CGRect v36 = [v10 key];
    int v37 = [(UIKeyboardLayoutStar *)self stateForKey:v36];

    double v38 = [v10 key];
    long long v274 = [v38 subtrees];

    BOOL v39 = [v10 key];
    unint64_t v40 = [(UIKeyboardLayoutStar *)self upActionFlagsForKey:v39];

    unint64_t prevUpActions = self->_prevUpActions;
    self->_unint64_t prevUpActions = v40;
    int v269 = v37;
    BOOL v273 = didLongPress;
    unint64_t v272 = prevUpActions;
    if (v37 != 16 || (v40 & 0x2080000000) == 0) {
      goto LABEL_56;
    }
    int v42 = [v10 initialKeyState];
    uint64_t v43 = [v10 key];
    uint64_t v44 = [v43 selectedVariantIndex];

    int v45 = &OBJC_IVAR____UIEventSessionHoverAction__tapDragState;
    if (v42 != 16)
    {
      if (v44 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v40 &= 0xFFFFFFFFFFFFFFF5;
      }
      else if ((v40 & 0x2000000000) != 0 && !self->_selectedVariantIndexChanged)
      {
        v40 &= 0xFFFFFFFFFFFFFFF5;
      }
      goto LABEL_55;
    }
    if (v44 == 0x7FFFFFFFFFFFFFFFLL) {
      v40 &= ~2uLL;
    }
    unint64_t v275 = v40;
    uint64_t v46 = [v10 touch];
    [v46 locationInView:self];
    double v48 = v47;
    double v50 = v49;

    uint64_t v51 = [v10 key];
    [v51 frame];
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    CGFloat v59 = v58;

    double v60 = [v10 key];
    if ([v60 variantType] == 9)
    {
      v292.origin.double x = v53;
      v292.origin.double y = v55;
      v292.size.CGFloat width = v57;
      v292.size.CGFloat height = v59;
      v291.double x = v48;
      v291.double y = v50;
      BOOL v61 = CGRectContainsPoint(v292, v291);

      if (!v61)
      {
        v40 &= ~8uLL;
LABEL_54:
        int v45 = &OBJC_IVAR____UIEventSessionHoverAction__tapDragState;
        goto LABEL_55;
      }
    }
    else
    {
    }
    int v62 = [v10 key];
    if ([v62 variantType] == 10)
    {
      BOOL v63 = v12;
      BOOL v64 = 1;
    }
    else
    {
      long long v278 = v22;
      uint64_t v65 = v12;
      uint64_t v66 = [v10 key];
      if ([v66 variantType] == 12)
      {
        BOOL v64 = 1;
      }
      else
      {
        double v67 = [v10 key];
        BOOL v64 = [v67 variantType] == 13;
      }
      BOOL v63 = v65;
      uint64_t v22 = v278;
    }

    if (!v64)
    {
      unint64_t v40 = v275;
      unint64_t v12 = v63;
      goto LABEL_54;
    }
    unint64_t v40 = v275;
    unint64_t v12 = v63;
    int v45 = &OBJC_IVAR____UIEventSessionHoverAction__tapDragState;
    if (v44 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v40 = v275 & 0xFFFFFFFFFFFFFFF7;
      if ([(UIKeyboardEmojiKeyDisplayController *)self->_emojiKeyManager userHasSelectedSkinToneEmoji])
      {
        CGRect v68 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
        double v69 = [v10 key];
        if (![v68 popupKeyUsesCustomKeyContentView:v69])
        {

          goto LABEL_54;
        }
        unint64_t v276 = v275 & 0xFFFFFFFFFFFFFFF7;
        screenTraits = self->super._screenTraits;
        if (screenTraits)
        {
          BOOL isFirstPartyStickers = screenTraits->_isFirstPartyStickers;

          if (isFirstPartyStickers)
          {
            unint64_t v40 = v276;
            goto LABEL_54;
          }
        }
        else
        {
        }
        keyplaneView = self->_keyplaneView;
        int v72 = [v10 key];
        BOOL v262 = -[UIKBKeyplaneView retestSelectedVariantIndexForKey:atPoint:phase:](keyplaneView, "retestSelectedVariantIndexForKey:atPoint:phase:", v72, 3, v48, v50);
        int v45 = &OBJC_IVAR____UIEventSessionHoverAction__tapDragState;
        BOOL v263 = v262 || self->_selectedVariantIndexChanged;
        unint64_t v40 = v276;
        self->_BOOL selectedVariantIndexChanged = v263;
      }
      else
      {
        int v72 = [v10 key];
        [(UIKeyboardLayoutStar *)self presentModalDisplayForKey:v72];
      }
    }
LABEL_55:
    *((unsigned char *)&self->super.super.super.super.isa + v45[143]) = 0;
LABEL_56:
    if ((v40 & 8) != 0)
    {
      id v73 = [v10 keyplane];
      keyplane = self->_keyplane;

      if (v73 == keyplane)
      {
        CGFloat v80 = [v10 key];
        int v81 = [v80 interactionType];

        if (v81 == 44)
        {
          double v82 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          float v83 = [v82 responder];
          [v83 inputAssistantItem];
          double v84 = v12;
          v86 = unint64_t v85 = v40;
          [v86 _dictationReplacementAction];
          long long v279 = v22;
          v88 = double v87 = v84;

          unint64_t v40 = v85;
          CGFloat v89 = [v88 sender];
          [v88 performWithSender:v89 target:0];

          unint64_t v12 = v87;
          uint64_t v22 = v279;
        }
        if (!didLongPress) {
          goto LABEL_280;
        }
        CGFloat v90 = [v10 key];
        if ([(UIKeyboardLayoutStar *)self shouldShowInternationalMenuForKey:v90])
        {

          goto LABEL_58;
        }
        long long v93 = [v10 key];
        unint64_t v94 = v40;
        int v95 = [v93 interactionType];

        BOOL v96 = v95 == 5;
        unint64_t v40 = v94;
        if (!v96)
        {
LABEL_280:
          if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
            uint64_t v97 = 1448;
          }
          else {
            uint64_t v97 = 688;
          }
          long long v98 = *(Class *)((char *)&self->super.super.super.super.isa + v97);
          int v99 = [v10 key];
          [v98 addKeyToDelayedDeactivationSet:v99];

          if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 1
            || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 24
            || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 25
            || [(UIKBScreenTraits *)self->super._screenTraits idiom] == 26)
          {
            if (v269 != 16) {
              goto LABEL_58;
            }
            goto LABEL_86;
          }
          int64_t v233 = [(UIKBScreenTraits *)self->super._screenTraits idiom];
          if (v269 == 16 && v233 == 23) {
LABEL_86:
          }
            [(UIKeyboardLayoutStar *)self setKeyboardDim:0 amount:0.0 withDuration:0.3];
        }
      }
    }
LABEL_58:
    uint64_t v75 = [v10 key];
    if ([v75 interactionType] == 13)
    {
      char v76 = [v11 returnKeyEnabled];

      if ((v76 & 1) == 0)
      {
        [v11 skipHitTestForTouchEvent:v22];
        [v11 clearLongPressTimer];
        [v10 setDragged:0];
        [(UIKeyboardLayoutStar *)self setActiveKey:0];
        [(UIKeyboardLayoutStar *)self clearInfoForTouch:v12];
        [v281 returnExecutionToParent];
LABEL_219:

LABEL_220:
        goto LABEL_221;
      }
    }
    else
    {
    }
    if (!didLongPress && (v40 & 0x100000) != 0 && ([v10 maySuppressUpAction] & 1) == 0)
    {
      [v11 skipHitTestForTouchEvent:v22];

      uint64_t v77 = [v10 key];
      int v78 = [v77 interactionType];

      uint64_t v22 = 0;
      if (v78 > 14)
      {
        if (v78 == 15)
        {
          CGFloat v79 = &OBJC_IVAR___UIKeyboardLayoutStar__spaceTarget;
          goto LABEL_89;
        }
        if (v78 == 42)
        {
          CGFloat v91 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          CGFloat v92 = [v91 systemInputAssistantViewController];
          [v92 showEmojiSearch:1];

LABEL_96:
          uint64_t v22 = 0;
        }
      }
      else
      {
        if (v78 == 4)
        {
          id deleteTarget = self->_deleteTarget;
          uint64_t v101 = 872;
LABEL_90:
          if (*(Class *)((char *)&self->super.super.super.super.isa + v101)) {
            double v102 = *(const char **)((char *)&self->super.super.super.super.isa + v101);
          }
          else {
            double v102 = 0;
          }
          if (dyld_program_sdk_at_least()) {
            [deleteTarget v102];
          }
          else {
            objc_msgSend(deleteTarget, sel_performSelector_, v102);
          }
          goto LABEL_96;
        }
        if (v78 == 13)
        {
          CGFloat v79 = &OBJC_IVAR___UIKeyboardLayoutStar__returnTarget;
LABEL_89:
          id deleteTarget = *(Class *)((char *)&self->super.super.super.super.isa + *v79);
          uint64_t v101 = v79[2];
          goto LABEL_90;
        }
      }
    }
    if ((v40 & 0x200000000) != 0
      && !objc_msgSend(v11, "handleTabWithShift:", -[UIKeyboardLayoutStar isShiftKeyBeingHeld](self, "isShiftKeyBeingHeld")))
    {
      v40 |= 2uLL;
    }
    unint64_t v277 = v40;
    char v103 = [v10 key];
    int v104 = [v103 interactionType];

    long long v280 = v22;
    if (v104 != 16) {
      goto LABEL_127;
    }
    uint64_t v105 = 1096;
    if (self->_flickPopupView)
    {
      double v106 = [v10 key];
      int v107 = [v106 state];

      if (v107 == 16)
      {
        [(UIView *)self->_flickPopupView removeFromSuperview];
        flickPopupView = self->_flickPopupView;
        self->_flickPopupView = 0;
      }
    }
    id v109 = [v10 key];
    if (([v109 state] & 0x10) != 0)
    {
    }
    else
    {
      long long v110 = [v10 key];
      uint64_t v105 = [v110 flickDirection];

      if (v105 != -1)
      {
        long long v111 = [v10 key];
        BOOL v112 = [(UIKeyboardLayoutStar *)self isMultitapKey:v111];

        long long v113 = off_1E52D4000;
        if (!v112)
        {
          char v127 = 0;
          goto LABEL_128;
        }
        long long v114 = [(UIKeyboardLayoutStar *)self multitapCompleteKeys];
        if (![v114 count])
        {
          long long v115 = [v10 key];
          if (![v115 forceMultitap])
          {
            BOOL v218 = [(UIKBTree *)self->_keyplane supportsMultitap];

            if (!v218)
            {
              int v119 = 0;
              char v118 = 0;
              self->_multitapCount = 0;
LABEL_224:
              double v219 = [v10 key];
              multitapKedouble y = self->_multitapKey;
              self->_multitapKedouble y = v219;

              if (v119)
              {
                v221 = [v10 key];
                [(UIKeyboardLayoutStar *)self setState:8 forKey:v221];

                [(UIKeyboardLayoutStar *)self touchMultitapTimer];
              }
              char v127 = v118;
LABEL_128:
              double v128 = [v10 key];
              if ([v128 interactionType] == 41)
              {
              }
              else
              {
                double v129 = [v10 key];
                int v130 = [v129 interactionType];

                if (v130 != 21)
                {
                  v150 = 0;
                  goto LABEL_148;
                }
              }
              id v268 = v11;
              double v131 = [(__objc2_class *)v113[12] activeInstance];
              CGFloat v132 = [v131 inputDelegate];
              unint64_t v133 = [v132 _selectedRangeWithinMarkedText];

              CGFloat v134 = [(__objc2_class *)v113[12] activeInstance];
              double v135 = [v134 markedText];

              if (v133 && v133 != 0x7FFFFFFFFFFFFFFFLL && v133 <= [v135 length])
              {
                BOOL v151 = [v135 substringToIndex:v133];
                CGFloat v136 = [v151 _lastGrapheme];
              }
              else
              {
                CGFloat v136 = [v135 _lastGrapheme];
              }
              if ([v136 length]
                && ([(UIKeyboardLayoutStar *)self keyWithRepresentedString:v136],
                    id v137 = (id)objc_claimAutoreleasedReturnValue(),
                    v137,
                    v137))
              {
                char v264 = v127;
                v266 = v12;
                CGFloat v138 = [v137 fullRepresentedString];
                uint64_t v139 = [v138 rangeOfString:v136];
                uint64_t v141 = v140;
                if ([v138 length])
                {
                  float v142 = [v10 key];
                  int v143 = [v142 interactionType];

                  uint64_t v144 = [v138 length];
                  unint64_t v145 = [v138 length];
                  if (v143 == 41) {
                    uint64_t v146 = v141;
                  }
                  else {
                    uint64_t v146 = -v141;
                  }
                  uint64_t v147 = [v138 rangeOfComposedCharacterSequenceAtIndex:(v146 + v139 + v144) % v145];
                  int v149 = objc_msgSend(v138, "substringWithRange:", v147, v148);
                  v150 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v149 forKey:v137 touchInfo:v10 inputFlags:6];
                }
                else
                {
                  v150 = 0;
                }

                unint64_t v12 = v266;
                char v127 = v264;
              }
              else
              {
                v150 = 0;
              }

              double v11 = v268;
LABEL_148:
              unint64_t v152 = v277;
              if (v277 & 2) == 0 || ([v10 maySuppressUpAction]) {
                goto LABEL_208;
              }
              char v265 = v127;
              double v153 = [v10 key];
              int v154 = [v153 representedString];

              if (v269 != 16)
              {
                double v155 = [v10 key];
                int v156 = [v155 displayTypeHint];

                if (v156 != 10)
                {
                  BOOL v163 = 0;
                  BOOL v270 = 0;
                  goto LABEL_170;
                }
              }
              id v267 = v12;
              double v157 = v11;
              CGRect v158 = [v10 key];
              unint64_t v159 = [v158 selectedVariantIndex];

              if ((v159 & 0x8000000000000000) != 0)
              {
                uint64_t v162 = 0;
                BOOL v163 = 0;
                BOOL v270 = 0;
              }
              else
              {
                unint64_t v160 = [v274 count];
                if (v269 == 16 && v159 < v160)
                {
                  id v161 = [v274 objectAtIndex:v159];
                  uint64_t v162 = [(__CFString *)v161 representedString];
                  BOOL v270 = 0;
                  BOOL v163 = 1;
                }
                else
                {
                  long long v164 = [v10 key];
                  long long v165 = [v164 secondaryRepresentedStrings];
                  unint64_t v166 = [v165 count];

                  if (v159 >= v166)
                  {
                    BOOL v163 = 0;
                    if (!self->_hasPeekedGestureKey)
                    {
                      BOOL v270 = 0;
                      goto LABEL_165;
                    }
                    uint64_t v162 = 0;
                    BOOL v270 = 0;
                    goto LABEL_163;
                  }
                  long long v167 = [v10 key];
                  int v168 = [v167 displayTypeHint];
                  BOOL v163 = v168 != 10;
                  BOOL v270 = v168 == 10;

                  long long v169 = [v10 key];
                  uint64_t v170 = [v169 secondaryRepresentedStrings];
                  uint64_t v162 = [v170 objectAtIndex:v159];

                  CGPoint v171 = [v10 key];
                  CGRect v172 = [v171 gestureKey];

                  if (!v172)
                  {
LABEL_164:
                    int v154 = (__CFString *)v162;
LABEL_165:
                    CGRect v173 = [v10 key];
                    int v174 = [v173 displayTypeHint];

                    if (v174 == 10)
                    {
                      if (v159 != 0x7FFFFFFFFFFFFFFFLL) {
                        self->_lastInputIsGestureKedouble y = 1;
                      }
                    }
                    else
                    {
                      CGRect v175 = [v10 key];
                      [v175 setDisplayTypeHint:0];
                    }
                    double v11 = v157;
                    unint64_t v12 = v267;
LABEL_170:
                    CGRect v176 = +[UIKeyboardPreferencesController sharedPreferencesController];
                    CGRect v177 = [v176 preferencesActions];
                    if ([v177 BOOLForPreferenceKey:@"GesturesEnabled"]
                      && v154
                      && !self->_lastInputIsGestureKey)
                    {
                      int64_t v191 = [(UIKBTree *)self->_keyplane intForProperty:@"shift-rendering"];

                      if (v191 != 8) {
                        +[_UIKeyboardUsageTracking normalPunctuationKeyCount];
                      }
                    }
                    else
                    {
                    }
                    CGRect v178 = [v10 key];
                    int v179 = [v178 displayTypeHint];

                    unint64_t v152 = v277;
                    if (v179 == 10)
                    {
                      CGRect v180 = [v10 key];
                      [v180 setSelectedVariantIndex:0x7FFFFFFFFFFFFFFFLL];
                    }
                    CGRect v181 = [v10 key];
                    int v182 = [v181 variantType];

                    if (v182 == 9)
                    {

                      CGRect v183 = [v10 key];
                      uint64_t v184 = [v183 selectedVariantIndex];

                      if (v184 == 2)
                      {
                        if (![(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleUnderline])goto LABEL_204; {
                        uint64_t v185 = [v11 delegateAsResponder];
                        }
                        uint64_t v186 = [v185 _responderForEditing];
                        [v186 toggleUnderline:0];
                        goto LABEL_197;
                      }
                      if (v184 == 1)
                      {
                        if (![(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleItalics])goto LABEL_204; {
                        uint64_t v185 = [v11 delegateAsResponder];
                        }
                        uint64_t v186 = [v185 _responderForEditing];
                        [v186 toggleItalics:0];
                        goto LABEL_197;
                      }
                      if (!v184
                        && [(UIKBTextEditingTraits *)self->super._textEditingTraits canToggleBoldface])
                      {
                        uint64_t v185 = [v11 delegateAsResponder];
                        uint64_t v186 = [v185 _responderForEditing];
                        [v186 toggleBoldface:0];
LABEL_197:

LABEL_198:
                        goto LABEL_204;
                      }
                      goto LABEL_204;
                    }
                    if (v154 == @"UIButtonBarKeyboardCut.png")
                    {

                      [v11 cutOperation];
                      goto LABEL_204;
                    }
                    if (v154 == @"UIButtonBarKeyboardCopy.png")
                    {

                      [v11 copyOperation];
                      goto LABEL_204;
                    }
                    if (v154 == @"UIButtonBarKeyboardPaste.png")
                    {

                      [v11 pasteOperation];
                      goto LABEL_204;
                    }
                    if (v154 == @"UIButtonBarKeyboardUndo.png"
                      || [(__CFString *)v154 isEqualToString:@"undo"]
                      && ([v10 key],
                          v187 = objc_claimAutoreleasedReturnValue(),
                          int v188 = [v187 displayTypeHint],
                          v187,
                          v188 == 10))
                    {

                      double v189 = [v11 delegateAsResponder];
                      double v190 = [v189 _responderForEditing];
                      uint64_t v185 = [v190 undoManager];

                      if ([v185 canUndo]) {
                        [v185 undo];
                      }
                      goto LABEL_198;
                    }
                    if ([(__CFString *)v154 isEqualToString:@"redo"])
                    {
                      v222 = [v10 key];
                      int v223 = [v222 displayTypeHint];

                      if (v223 == 10)
                      {

                        v224 = [v11 delegateAsResponder];
                        v225 = [v224 _responderForEditing];
                        uint64_t v185 = [v225 undoManager];

                        if ([v185 canRedo]) {
                          [v185 redo];
                        }
                        goto LABEL_198;
                      }
                    }
                    if (!v154)
                    {
LABEL_204:
                      int v154 = [v10 key];
                      uint64_t v197 = [(__CFString *)v154 displayImage];
                      if (v197)
                      {
                        uint64_t v198 = (void *)v197;
                        v199 = [v10 key];
                        v200 = [v199 parentKey];

                        if (!v200)
                        {
LABEL_208:
                          if ((v152 & 0x20000000) != 0)
                          {
                            uint64_t v204 = [v10 key];
                            v205 = [v204 representedString];
                            [(UIKeyboardLayoutStar *)self switchKeyplane:v205];
                          }
                          uint64_t v206 = +[UIKBAnalyticsDispatcher sharedInstance];
                          [v206 setAnalyticsSkipDidKeyPress:0];

                          uint64_t v207 = [v12 inputSource];
                          if (v150)
                          {
                            [v150 setSource:v207];
                            uint64_t v208 = [v150 _modifiedInput];
                            [(UIKeyboardLayoutStar *)self incrementPunctuationIfNeeded:v208];

                            [v11 skipHitTestForTouchEvent:v280 delayed:1];
                            v282[0] = MEMORY[0x1E4F143A8];
                            v282[1] = 3221225472;
                            v282[2] = __85__UIKeyboardLayoutStar_completeRetestForTouchUp_timestamp_interval_executionContext___block_invoke;
                            v282[3] = &unk_1E52FA6F0;
                            id v283 = v10;
                            long long v284 = self;
                            uint64_t v285 = v207;
                            unint64_t v286 = v152;
                            double v287 = a4;
                            double v288 = a5;
                            BOOL v290 = v273;
                            unint64_t v289 = v272;
                            char v209 = [v281 childWithContinuation:v282];
                            [v11 _handleKeyEvent:v150 executionContext:v209];

                            v210 = [(UIKeyboardLayoutStar *)self delegate];
                            LOBYTE(v208) = objc_opt_respondsToSelector();

                            if (v208)
                            {
                              v211 = [(UIKeyboardLayoutStar *)self delegate];
                              [v211 handleKeyUIEvent:v150 dismiss:1];
                            }
                            uint64_t v22 = v280;
                          }
                          else
                          {
                            if ([v10 continuousPathState] != 5)
                            {
                              uint64_t v212 = +[UIKBAnalyticsDispatcher sharedInstance];
                              char v213 = [v212 analyticsSkipDidKeyPress];

                              if ((v213 & 1) == 0)
                              {
                                id v214 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
                                double v215 = [v214 _textInputSessionAnalytics];
                                [v10 key];
                                v217 = unint64_t v216 = v152;
                                [v215 didKeyPress:v217 inputSource:v207];

                                unint64_t v152 = v216;
                              }
                            }
                            uint64_t v22 = v280;
                            [v11 skipHitTestForTouchEvent:v280];
                            [(UIKeyboardLayoutStar *)self completeSendStringActionForTouchUp:v10 withActions:v152 timestamp:v273 interval:v272 didLongPress:v281 prevActions:a4 executionContext:a5];
                          }

                          goto LABEL_219;
                        }
                        v201 = [v10 key];
                        v202 = [v201 parentKey];
                        int v154 = [(UIKeyboardLayoutStar *)self viewForKey:v202];

                        v203 = [v10 key];
                        [(__CFString *)v154 didInputSubTree:v203];
                      }
LABEL_207:

                      goto LABEL_208;
                    }
                    v226 = [v10 key];
                    int v227 = [v226 interactionType];

                    if (v227 == 16)
                    {
                      if (![(UIKeyboardLayoutStar *)self shouldSendStringForFlick:v10]) {
                        goto LABEL_251;
                      }
                      v228 = v11;
                      double v229 = [v10 key];
                      double v230 = [v10 key];
                      v231 = -[UIKeyboardLayoutStar flickStringForInputKey:direction:](self, "flickStringForInputKey:direction:", v229, [v230 flickDirection]);

                      if (![v231 length])
                      {
LABEL_250:

                        double v11 = v228;
                        unint64_t v152 = v277;
LABEL_251:
                        if (v150)
                        {
                          v238 = [v10 key];
                          v239 = [v238 parentKey];

                          if (v239)
                          {
                            v240 = [v10 key];
                            v241 = [v240 parentKey];
                            id v242 = [(UIKeyboardLayoutStar *)self viewForKey:v241];

                            v243 = [v10 key];
                            uint64_t v244 = [v242 didInputSubTree:v243];

                            if (v244 == 1)
                            {
                              if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
                                uint64_t v245 = 1448;
                              }
                              else {
                                uint64_t v245 = 688;
                              }
                              char v246 = *(Class *)((char *)&self->super.super.super.super.isa + v245);
                              int v247 = [v10 key];
                              [v246 addKeyToDelayedDeactivationSet:v247];

                              unsigned int v248 = [v10 key];
                              [(UIKeyboardLayoutStar *)self presentModalDisplayForKey:v248];
                            }
                          }
                        }
                        [(UIKeyboardLayoutStar *)self _recordKeystrokeStatisticForKeyPress];
                        goto LABEL_207;
                      }
                      if (v265)
                      {
                        uint64_t v232 = 6;
                      }
                      else
                      {
                        unsigned int v249 = [v10 key];
                        if ([v249 flickDirection] <= -2) {
                          uint64_t v232 = 2;
                        }
                        else {
                          uint64_t v232 = 66;
                        }
                      }
                      v250 = [v10 key];
                      uint64_t v237 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v231 forKey:v250 touchInfo:v10 inputFlags:v232];

                      if (!TIStatisticShouldSample()
                        || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
                      {
LABEL_249:
                        v150 = (void *)v237;
                        goto LABEL_250;
                      }
                      uint64_t v271 = v237;
                      BOOL v251 = UIKeyboardGetCurrentInputMode();
                      v150 = UIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v251);

                      BOOL v252 = [v10 key];
                      uint64_t v253 = [v252 flickDirection];

                      if ((v253 & 0x8000000000000000) == 0)
                      {
                        v254 = [(id)objc_opt_class() sharedPunctuationCharacterSet];
                        [v231 rangeOfCharacterFromSet:v254];
                        uint64_t v256 = v255;

                        if (v256)
                        {
                          v257 = TIStatisticGetKeyForTenKeyFlickPunctuation();
                          TIStatisticScalarIncrement();
                        }
                        v258 = TIStatisticGetKeyForTenKeyFlick();
                        TIStatisticScalarIncrement();
                      }
                      if ([(NSString *)self->_keyplaneName length])
                      {
                        v259 = [(UIKBTree *)self->_keyplane componentName];
                        v260 = TIStatisticGetKeyForTenKeyKeyTappedInKeyplane();
                        TIStatisticScalarIncrement();
                      }
                      uint64_t v237 = v271;
                    }
                    else
                    {
                      v228 = v11;
                      if (v163) {
                        int v234 = 2;
                      }
                      else {
                        int v234 = 0;
                      }
                      if (v270) {
                        int v235 = 256;
                      }
                      else {
                        int v235 = 0;
                      }
                      uint64_t v236 = v235 | v234;
                      v231 = [v10 key];
                      uint64_t v237 = [(UIKeyboardLayoutStar *)self createKeyEventForStringAction:v154 forKey:v231 touchInfo:v10 inputFlags:v236];
                    }

                    goto LABEL_249;
                  }
                  id v161 = [v10 key];
                  int v154 = [(__CFString *)v161 gestureKey];
                  unint64_t v277 = -[UIKeyboardLayoutStar upActionFlagsForKey:](self, "upActionFlagsForKey:");
                }

                int v154 = v161;
              }
LABEL_163:

              goto LABEL_164;
            }
LABEL_111:
            long long v116 = self->_multitapKey;
            long long v117 = [v10 key];

            if (v116 == v117)
            {
              v192 = [(UIKBTree *)self->_multitapKey fullRepresentedString];
              [v192 rangeOfComposedCharacterSequenceAtIndex:self->_multitapCount];
              uint64_t v194 = v193;

              unint64_t v195 = v194 + self->_multitapCount;
              uint64_t v196 = [(UIKBTree *)self->_multitapKey fullRepresentedString];
              self->_multitapCount = v195 % [v196 length];

              int v119 = 1;
              char v118 = 1;
            }
            else
            {
              if (self->_multitapKey) {
                -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", 2);
              }
              char v118 = 0;
              self->_multitapCount = 0;
              int v119 = 1;
            }
            goto LABEL_224;
          }
        }
        goto LABEL_111;
      }
    }
    if (didLongPress)
    {
      uint64_t v120 = [v10 key];
      int v121 = [v120 interactionType];
      if (v121 == 9)
      {
        uint64_t v105 = [v10 key];
        if ([(id)v105 displayType] == 13)
        {

LABEL_127:
          char v127 = 0;
          long long v113 = off_1E52D4000;
          goto LABEL_128;
        }
      }
      CGRect v122 = [v10 key];
      int v123 = [v122 interactionType];

      if (v121 == 9) {
      if (v123 == 5)
      }
        goto LABEL_127;
    }
    if ([(UIKeyboardLayoutStar *)self useCrescendoLayout]) {
      uint64_t v124 = 1448;
    }
    else {
      uint64_t v124 = 688;
    }
    double v125 = *(Class *)((char *)&self->super.super.super.super.isa + v124);
    double v126 = [v10 key];
    [v125 addKeyToDelayedDeactivationSet:v126];

    goto LABEL_127;
  }
  [v11 clearLongPressTimer];
  [v10 setDragged:0];
  [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:0];
  [(UIKeyboardLayoutStar *)self clearInfoForTouch:v12];
  [v281 returnExecutionToParent];
LABEL_221:
}

void __85__UIKeyboardLayoutStar_completeRetestForTouchUp_timestamp_interval_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([*(id *)(a1 + 32) continuousPathState] != 5)
  {
    int64_t v3 = +[UIKBAnalyticsDispatcher sharedInstance];
    char v4 = [v3 analyticsSkipDidKeyPress];

    if ((v4 & 1) == 0)
    {
      int v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      char v6 = [v5 _textInputSessionAnalytics];
      id v7 = [*(id *)(a1 + 32) key];
      [v6 didKeyPress:v7 inputSource:*(void *)(a1 + 48)];
    }
  }
  [*(id *)(a1 + 40) completeSendStringActionForTouchUp:*(void *)(a1 + 32) withActions:*(void *)(a1 + 56) timestamp:*(unsigned __int8 *)(a1 + 88) interval:*(void *)(a1 + 80) didLongPress:v8 prevActions:*(double *)(a1 + 64) executionContext:*(double *)(a1 + 72)];
}

- (void)presentModalDisplayForKey:(id)a3
{
  id v4 = a3;
  int v5 = [v4 parentKey];
  char v6 = [(UIKeyboardLayoutStar *)self viewForKey:v5];

  id v7 = [UIView alloc];
  [(UIView *)self bounds];
  id v8 = -[UIView initWithFrame:](v7, "initWithFrame:");
  [(UIKeyboardLayoutStar *)self setModalDisplayView:v8];

  BOOL v9 = [(UIKeyboardLayoutStar *)self modalDisplayView];
  [(UIView *)self addSubview:v9];

  [(TUIKeyplaneView *)self->_liveKeyplaneView setHidden:1];
  [(UIView *)self->_keyplaneView setHidden:1];
  id v10 = [(UIKeyboardLayoutStar *)self viewForKey:v4];

  if (v10)
  {
    double v11 = [(UIKeyboardLayoutStar *)self modalDisplayView];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    double v15 = __50__UIKeyboardLayoutStar_presentModalDisplayForKey___block_invoke;
    double v16 = &unk_1E52D9F98;
    double v17 = self;
    id v12 = v10;
    id v18 = v12;
    [v6 willDisplayModalActionView:v11 withSubTreeKeyView:v12 completion:&v13];

    objc_msgSend(v12, "setHidden:", 1, v13, v14, v15, v16, v17);
  }
}

uint64_t __50__UIKeyboardLayoutStar_presentModalDisplayForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) modalDisplayView];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) setModalDisplayView:0];
  if ([*(id *)(a1 + 32) useCrescendoLayout]) {
    [*(id *)(*(void *)(a1 + 32) + 1448) setHidden:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 688) setHidden:0];
  int64_t v3 = *(void **)(a1 + 40);
  return [v3 setHidden:0];
}

- (BOOL)shouldYieldToControlCenterForFlickWithInitialPoint:(CGPoint)a3 finalPoint:(CGPoint)a4
{
  double y = a4.y;
  double v5 = a3.y;
  id v7 = +[UIPeripheralHost sharedInstance];
  int v8 = [v7 _isCoordinatingWithSystemGestures];

  if (!v8) {
    return 0;
  }
  [(UIView *)self bounds];
  double Height = CGRectGetHeight(v14);
  id v10 = +[UIPeripheralHost sharedInstance];
  [v10 ambiguousControlCenterActivationMargin];
  double v12 = v11;

  return y < Height - v12 && v5 > Height + -30.0;
}

- (BOOL)shouldSendStringForFlick:(id)a3
{
  id v4 = a3;
  [v4 initialPoint];
  double v6 = v5;
  double v8 = v7;
  BOOL v9 = [v4 touch];
  [v9 locationInView:self];
  double v11 = v10;
  double v13 = v12;

  CGRect v14 = [v4 key];

  if ([v14 state] == 16)
  {
    BOOL v15 = isFlickOutOfBounds(v6, v8, v11, v13);

    if (v15) {
      return 0;
    }
  }
  else
  {
  }
  return !-[UIKeyboardLayoutStar shouldYieldToControlCenterForFlickWithInitialPoint:finalPoint:](self, "shouldYieldToControlCenterForFlickWithInitialPoint:finalPoint:", v6, v8, v11, v13);
}

- (void)completeSendStringActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9
{
  id v16 = a3;
  id v17 = a9;
  id v18 = +[UIKeyboardImpl activeInstance];
  double v19 = &xmmword_186B92000;
  if ([v16 dragged])
  {
    double v20 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];

    if (v20) {
      goto LABEL_6;
    }
  }
  if ((a4 & 0x20) != 0)
  {
    int v21 = [(UIKBTree *)self->_keyplane alternateKeyplaneName];
    [(UIKeyboardLayoutStar *)self setKeyplaneName:v21];

    self->_preferredTrackingChangeCount = [v18 changeCount];
  }
  if ((a4 & 0x1000) == 0)
  {
LABEL_6:
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    goto LABEL_20;
  }
  int v24 = +[UIInputSwitcherView sharedInstance];
  int v25 = [v16 key];
  BOOL v26 = [v25 displayType] == 21
     && [(UITextInputTraits *)self->super._inputTraits keyboardType] == 122
     && [(UITextInputTraits *)self->super._inputTraits returnKeyType] == 9;
  CGFloat v57 = v25;
  CGFloat v59 = v24;
  if ([(UIKeyboardLayoutStar *)self stateForKey:v25] != 4
    || [(NSMutableDictionary *)self->_extendedTouchInfoMap count] != 1)
  {
    uint64_t v23 = 0;
    self->_prevTouchUpTime = a5 - a6;
    goto LABEL_17;
  }
  if ([v24 mode] != 1)
  {
    BOOL v39 = [v16 key];
    double v56 = self;
    if ([(UIKeyboardLayoutStar *)self isKeyScriptSwitchKey:v39]
      || [(UIKeyboardLayoutStar *)self showsDedicatedEmojiKeyAlongsideGlobeButton])
    {
    }
    else
    {
      uint64_t v45 = [v16 key];
      uint64_t v46 = self;
      double v47 = (void *)v45;
      BOOL v54 = [(UIKeyboardLayoutStar *)v46 isLongPressedKey:v45];

      if (v54)
      {
        uint64_t v23 = 0;
        self = v56;
        goto LABEL_17;
      }
    }
    HIDWORD(v52) = v26;
    unint64_t v40 = +[UIKeyboardInputModeController sharedInputModeController];
    double v41 = [v16 key];
    int v42 = [v41 representedString];
    int v53 = [v40 identifierIsValidSystemInputMode:v42];

    if (v53)
    {
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_2;
      v80[3] = &unk_1E52E3628;
      id v81 = v16;
      id v82 = v18;
      uint64_t v23 = (void (**)(void *, void *))_Block_copy(v80);

      self = v56;
      goto LABEL_17;
    }
    uint64_t v43 = [v16 key];
    uint64_t v44 = [v43 representedString];
    if ([v44 isEqualToString:@"ASCIICapable"])
    {
    }
    else
    {
      double v48 = [v16 key];
      [v48 representedString];
      double v49 = v55 = v43;
      LODWORD(v52) = [v49 isEqualToString:@"NonASCII"];

      if (!v52)
      {
        self = v56;
        if (__PAIR64__(HIDWORD(v52), 0) == [(UIKeyboardLayoutStar *)v56 globeKeyDisplaysAsEmojiKey])
        {
          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_6;
          v69[3] = &unk_1E52E3628;
          id v70 = v16;
          id v71 = v18;
          uint64_t v23 = (void (**)(void *, void *))_Block_copy(v69);

          double v27 = v70;
        }
        else
        {
          v72[0] = MEMORY[0x1E4F143A8];
          v72[1] = 3221225472;
          v72[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_4;
          v72[3] = &unk_1E52E3560;
          id v73 = v16;
          char v75 = BYTE4(v52);
          id v74 = v18;
          uint64_t v23 = (void (**)(void *, void *))_Block_copy(v72);

          double v27 = v73;
        }
        goto LABEL_15;
      }
    }
    self = v56;
    double v50 = [(UIKeyboardLayoutStar *)v56 inputModeToMergeCapsLockKey];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_3;
    v76[3] = &unk_1E52E3678;
    id v77 = v16;
    id v78 = v18;
    id v79 = v50;
    id v51 = v50;
    uint64_t v23 = (void (**)(void *, void *))_Block_copy(v76);

    goto LABEL_17;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke;
  aBlock[3] = &unk_1E52E3678;
  id v84 = v16;
  id v85 = v18;
  id v86 = v24;
  uint64_t v23 = (void (**)(void *, void *))_Block_copy(aBlock);

  double v27 = v84;
LABEL_15:

LABEL_17:
  v68[0] = MEMORY[0x1E4F143A8];
  v68[1] = 3221225472;
  v68[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_7;
  v68[3] = &unk_1E52D9F70;
  v68[4] = self;
  uint64_t v22 = _Block_copy(v68);
  if (!self->_lastInputMode)
  {
    UIKeyboardGetCurrentInputMode();
    CGPoint v28 = (NSString *)objc_claimAutoreleasedReturnValue();
    lastInputMode = self->_lastInputMode;
    self->_lastInputMode = v28;
  }
  double v19 = &xmmword_186B92000;
LABEL_20:
  if (self->_prevUpActions != 4104)
  {
    double v58 = v23;
    double v30 = self->_lastInputMode;
    uint64_t v31 = UIKeyboardGetCurrentInputMode();
    LODWORD(v30) = [(NSString *)v30 isEqualToString:v31];

    if (v30)
    {
      uint64_t v32 = TIStatisticGetKeyForInputMode();
      TIStatisticScalarIncrement();
    }
    unint64_t v33 = self->_lastInputMode;
    self->_lastInputMode = 0;

    uint64_t v23 = v58;
    double v19 = &xmmword_186B92000;
  }
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = *((void *)v19 + 137);
  v60[2] = __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_8;
  v60[3] = &unk_1E52FA718;
  id v34 = v22;
  void v60[4] = self;
  id v61 = v16;
  id v62 = v34;
  unint64_t v63 = a4;
  double v64 = a5;
  double v65 = a6;
  BOOL v67 = a7;
  unint64_t v66 = a8;
  id v35 = v16;
  CGRect v36 = _Block_copy(v60);
  int v37 = v36;
  if (v23)
  {
    double v38 = [v17 childWithContinuation:v36];
    v23[2](v23, v38);
  }
  else
  {
    (*((void (**)(void *, id))v36 + 2))(v36, v17);
  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) maySuppressUpAction])
  {
    [v5 returnExecutionToParent];
  }
  else
  {
    int64_t v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 48) selectedInputMode];
    [v3 setInputMode:v4 userInitiated:1 updateIndicator:0 executionContext:v5];
  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([*(id *)(a1 + 32) maySuppressUpAction])
  {
    [v12 returnExecutionToParent];
  }
  else
  {
    int64_t v3 = +[UIKeyboardInputModeController sharedInputModeController];
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 currentInputMode];
    [v3 updateLastUsedInputMode:v5];

    double v6 = *(void **)(a1 + 40);
    double v7 = [*(id *)(a1 + 32) key];
    double v8 = [v7 representedString];
    [v6 setInputMode:v8 userInitiated:1 updateIndicator:0 executionContext:v12];

    BOOL v9 = +[UIKeyboardInputModeController sharedInputModeController];
    double v10 = +[UIKeyboardInputModeController sharedInputModeController];
    double v11 = [v10 currentInputMode];
    [v9 updateLastUsedInputMode:v11];
  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v12 = a2;
  if ([*(id *)(a1 + 32) maySuppressUpAction])
  {
    [v12 returnExecutionToParent];
  }
  else
  {
    int64_t v3 = +[UIKeyboardInputModeController sharedInputModeController];
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 currentInputMode];
    [v3 updateLastUsedInputMode:v5];

    double v6 = *(void **)(a1 + 40);
    double v7 = [*(id *)(a1 + 48) identifier];
    [v6 setInputMode:v7 userInitiated:1 updateIndicator:1 executionContext:v12];

    double v8 = +[UIKeyboardInputModeController sharedInputModeController];
    [v8 setLastInputModeSwitchTriggeredByASCIIToggle:1];

    BOOL v9 = +[UIKeyboardInputModeController sharedInputModeController];
    double v10 = +[UIKeyboardInputModeController sharedInputModeController];
    double v11 = [v10 currentInputMode];
    [v9 updateLastUsedInputMode:v11];
  }
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_4(uint64_t a1, void *a2)
{
  id v17 = a2;
  if ([*(id *)(a1 + 32) maySuppressUpAction])
  {
    [v17 returnExecutionToParent];
  }
  else
  {
    int64_t v3 = +[UIKeyboardInputModeController sharedInputModeController];
    id v4 = +[UIKeyboardInputModeController sharedInputModeController];
    id v5 = [v4 currentInputMode];
    [v3 updateLastUsedInputMode:v5];

    if (*(unsigned char *)(a1 + 48))
    {
      double v6 = [*(id *)(a1 + 40) inputDelegateManager];
      double v7 = [v6 delegateRespectingForwardingDelegate:0];

      if (v7)
      {
        [*(id *)(a1 + 40) selectionWillChange:v7];
        [*(id *)(a1 + 40) selectionDidChange:v7];
      }
      double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"UITextInputDidSwitchFromEmojiSearchNotification" object:0 userInfo:0];

      [v17 returnExecutionToParent];
    }
    else
    {
      BOOL v9 = +[UIKeyboardInputModeController sharedInputModeController];
      double v10 = [v9 activeInputModeIdentifiers];
      uint64_t v11 = [v10 indexOfObjectPassingTest:&__block_literal_global_1231];

      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        double v7 = @"emoji";
      }
      else
      {
        id v12 = +[UIKeyboardInputModeController sharedInputModeController];
        double v13 = [v12 activeInputModeIdentifiers];
        double v7 = [v13 objectAtIndex:v11];
      }
      CGRect v14 = +[UIKeyboardInputModeController sharedInputModeController];
      BOOL v15 = [v14 currentInputMode];
      id v16 = +[UIKeyboardInputModeController sharedInputModeController];
      [v16 setInputModeThatInvokeEmoji:v15];

      [*(id *)(a1 + 40) setInputMode:v7 userInitiated:1 updateIndicator:0 executionContext:v17];
    }
  }
}

uint64_t __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_5()
{
  uint64_t v0 = TIInputModeGetNormalizedIdentifier();
  uint64_t v1 = [v0 isEqualToString:@"emoji"];

  return v1;
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_6(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) maySuppressUpAction])
  {
    [v7 returnExecutionToParent];
  }
  else
  {
    int64_t v3 = +[UIKeyboardInputModeController sharedInputModeController];
    id v4 = [v3 inputModeThatInvokeEmoji];

    id v5 = *(void **)(a1 + 40);
    if (v4)
    {
      double v6 = [v4 identifier];
      [v5 setInputMode:v6 userInitiated:1 updateIndicator:0 executionContext:v7];
    }
    else
    {
      [v5 setInputModeToNextInPreferredListWithExecutionContext:v7];
    }
  }
}

uint64_t __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActiveKey:0];
}

void __132__UIKeyboardLayoutStar_completeSendStringActionForTouchUp_withActions_timestamp_interval_didLongPress_prevActions_executionContext___block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  [*(id *)(a1 + 32) continueFromInternationalActionForTouchUp:*(void *)(a1 + 40) withActions:*(void *)(a1 + 56) timestamp:*(unsigned __int8 *)(a1 + 88) interval:*(void *)(a1 + 80) didLongPress:v4 prevActions:*(double *)(a1 + 64) executionContext:*(double *)(a1 + 72)];
}

- (void)continueFromInternationalActionForTouchUp:(id)a3 withActions:(unint64_t)a4 timestamp:(double)a5 interval:(double)a6 didLongPress:(BOOL)a7 prevActions:(unint64_t)a8 executionContext:(id)a9
{
  int v11 = a8;
  BOOL v12 = a7;
  id v66 = a3;
  id v17 = a9;
  id v18 = +[UIKeyboardImpl activeInstance];
  double v19 = [v66 touch];
  if ([v66 dragged])
  {
    double v20 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];

    if (v20) {
      goto LABEL_25;
    }
  }
  if ((a4 & 0x2000000) != 0
    || (BOOL v21 = [(UIKeyboardLayoutStar *)self isHandwritingPlane], (a4 & 0x80) != 0) && v21)
  {
    uint64_t v22 = +[UIKeyboardSplitControlMenu activeInstance];
    uint64_t v23 = v22;
    if (a6 > 0.5 || (v11 & 0x2000000) != 0)
    {
      if (v12 && [v22 isVisible])
      {
        [v19 locationInView:v23];
        objc_msgSend(v23, "selectItemAtPoint:");
      }
      else
      {
        char v31 = [v23 isVisible];
        if ((a4 & 0x2000000) != 0
          && (v31 & 1) == 0
          && [(NSMutableDictionary *)self->_extendedTouchInfoMap count] == 1)
        {
          if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 126
            && [(UIKeyboardLayoutStar *)self useDismissForMessagesWriteboard])
          {
            [v18 lookUpResponderChainForCustomInputView];
          }
          else
          {
            [v18 dismissKeyboard];
          }
        }
      }
    }
    else
    {
      self->_prevTouchUpTime = a5 - a6;
    }
    [v23 hide];
    goto LABEL_10;
  }
  uint64_t v23 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
  if (v23)
  {
    uint64_t v9 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
    char v47 = [(id)v9 isEqualToString:self->_keyplaneName];
    if ((a4 & 0x800000000) == 0 || (v47 & 1) == 0)
    {

LABEL_10:
      goto LABEL_11;
    }
  }
  else if ((a4 & 0x800000000) == 0)
  {
    goto LABEL_11;
  }
  int64_t v55 = [(UITextInputTraits *)self->super._inputTraits keyboardType];
  if (v23)
  {
  }
  if (v55 == 126) {
    [v18 lookUpResponderChainForCustomInputView];
  }
LABEL_11:
  if ((a4 & 0x8000000) == 0
    || a6 <= 0.5 && (v11 & 0x8000000) == 0
    || ([v66 key],
        int v24 = objc_claimAutoreleasedReturnValue(),
        int v25 = [(UIKeyboardLayoutStar *)self stateForKey:v24],
        v24,
        v25 != 4))
  {
LABEL_18:
    if ((a4 & 0x10000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_81;
  }
  if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 126
    && [(UIKeyboardLayoutStar *)self useUndoForMessagesWriteboard])
  {
    [v18 lookUpResponderChainForCustomInputView];
    goto LABEL_18;
  }
  id v51 = +[UIWindow _applicationKeyWindow];
  uint64_t v52 = [v51 firstResponder];
  uint64_t v9 = [v52 undoManager];
  [(id)v9 undo];

  +[_UIKeyboardUsageTracking undoKeyCount];
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Undo" trigger:@"SWKeyboard"];
  +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:0];
  if ((a4 & 0x10000000) == 0)
  {
LABEL_19:
    if ((a4 & 0x2000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_82;
  }
LABEL_81:
  int v53 = +[UIWindow _applicationKeyWindow];
  BOOL v54 = [v53 firstResponder];
  uint64_t v9 = [v54 undoManager];
  [(id)v9 redo];

  +[_UIKeyboardUsageTracking redoKeyCount];
  +[UIKBAnalyticsDispatcher analyticsDispatchEventTextEditingOperation:@"Redo" trigger:@"SWKeyboard"];
  +[UIUndoGestureInteraction presentProductivityGestureTutorialInlineWithCompletion:0];
  if ((a4 & 0x2000) == 0)
  {
LABEL_20:
    if ((a4 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v18 revealHiddenCandidates];
  if ((a4 & 0x4000) == 0)
  {
LABEL_21:
    if ((a4 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v18 showNextCandidates];
  if ((a4 & 0x200000) == 0)
  {
LABEL_22:
    if ((a4 & 0x1000000) == 0) {
      goto LABEL_23;
    }
LABEL_85:
    [v18 acceptAutocorrectionAndEndComposition];
    if ((a4 & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_84:
  [v18 showPreviousCandidate];
  if ((a4 & 0x1000000) != 0) {
    goto LABEL_85;
  }
LABEL_23:
  if ((a4 & 0x4000000) != 0)
  {
LABEL_24:
    BOOL v26 = [v66 key];
    double v27 = [v26 representedString];
    [(UIKeyboardLayoutStar *)self setLayoutTag:v27];

    [(UIKeyboardLayoutStar *)self updateKeyCentroids];
  }
LABEL_25:
  if ((a4 & 0x100) == 0
    || -[UIKBTree supportsType:](self->_keyplane, "supportsType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType"))|| ([v66 key], CGPoint v28 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v28, "representedString"), v29 = objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v29, "isEqualToString:", @"-"), v29, v28, (v9 & 1) != 0))
  {
    char v30 = 0;
    if ((a4 & 0x400) == 0) {
      goto LABEL_45;
    }
  }
  else
  {
    double v48 = [v66 key];
    double v49 = [v48 representedString];
    uint64_t v9 = [v49 _isSpaceOrReturn];

    if (v9) {
      ++self->_preferredTrackingChangeCount;
    }
    if ((int)[v18 changeCount] > self->_preferredTrackingChangeCount)
    {
      double v50 = [(UIKBTree *)self->_keyplane alternateKeyplaneName];
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v50];

      [(UIKeyboardLayoutStar *)self setShift:[(UIKBTree *)self->_keyplane isShiftKeyplane]];
    }
    char v30 = 1;
    if ((a4 & 0x400) == 0) {
      goto LABEL_45;
    }
  }
  if (self->_shift)
  {
    if (v30) {
      goto LABEL_45;
    }
LABEL_44:
    [v18 setShift:0];
    [(UIKeyboardLayoutStar *)self setShift:0];
    [(UIKeyboardLayoutStar *)self setAutoshift:0];
    goto LABEL_45;
  }
  if (!self->_autoshift) {
    char v30 = 1;
  }
  if ((v30 & 1) == 0) {
    goto LABEL_44;
  }
LABEL_45:
  if ((a4 & 0x400000) != 0)
  {
    [v18 toggleShift];
    [v18 setShiftPreventAutoshift:1];
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", [v18 isShifted]);
    [(UIKeyboardLayoutStar *)self setAutoshift:0];
    goto LABEL_49;
  }
  uint64_t v32 = v66;
  if ((a4 & 0x10) != 0)
  {
    [(UIKeyboardLayoutStar *)self upActionShift];
LABEL_49:
    uint64_t v32 = v66;
  }
  if (self->_revertKeyplaneAfterTouch)
  {
    unint64_t v33 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
    uint64_t v32 = v66;
    if (v33)
    {
      id v34 = [v66 key];
      if ([v34 modifiesKeyplane])
      {
      }
      else
      {
        uint64_t v9 = [v66 slidOffKey];

        uint64_t v32 = v66;
        if (!v9) {
          goto LABEL_61;
        }
      }
      id v35 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v35];

      BOOL v36 = [(UIKBTree *)self->_keyplane isShiftKeyplane];
      if (v36 != [v18 isShifted] || self->_shift != v36)
      {
        [v18 setShift:v36];
        [v18 setShiftPreventAutoshift:1];
        [(UIKeyboardLayoutStar *)self setShift:v36];
      }
      int v37 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Caps-Lock-Key"];

      if (v37)
      {
        double v38 = [(UIKBTree *)self->_keyplane name];
        [(UIKeyboardLayoutStar *)self setKeyplaneName:v38];
      }
      self->_revertKeyplaneAfterTouch = 0;
      uint64_t v32 = v66;
    }
  }
LABEL_61:
  BOOL v39 = [v32 key];
  if ((a4 & 0x40000000) != 0)
  {
    uint64_t v9 = (uint64_t)&off_1E52D3000;
    if (+[UIDictationController viewMode] == 1)
    {
      if (a6 > 3.0 && v12)
      {
        unint64_t v40 = +[UIKeyboardDictationMenu activeInstance];
        [v40 hide];
LABEL_93:
      }
    }
    else
    {
      double v41 = +[UIInputSwitcherView activeInstance];
      char v42 = [v41 isVisible];

      if ((v42 & 1) == 0)
      {
        if (!+[UIDictationController isRunning])
        {
          unint64_t v56 = +[UIDictationController specificReasonTypeMicButtonOnKeyboard];
          CGFloat v57 = +[UIDictationController sharedInstance];
          [v57 setReasonType:v56];

          unint64_t v40 = +[UIDictationController sharedInstance];
          [v40 switchToDictationInputModeWithTouch:0];
          goto LABEL_93;
        }
        uint64_t v43 = +[UIDictationController sharedInstance];
        [v43 setReasonType:1];

        uint64_t v44 = +[UIDictationController sharedInstance];
        [v44 stopDictation];

        uint64_t v45 = +[UIKeyboardImpl activeInstance];
        int v46 = [v45 isDictationPopoverPresented];

        if (v46)
        {
          unint64_t v40 = +[UIKeyboardImpl activeInstance];
          [v40 dismissDictationPopover];
          goto LABEL_93;
        }
      }
    }
  }
  if (!self->_multitapKey && [v39 state] == 20) {
    [(UIKeyboardLayoutStar *)self setMultitapReverseKeyState];
  }
  if ((a4 & 0x200) != 0) {
    [(UIKeyboardLayoutStar *)self multitapExpired];
  }
  [(UIKeyboardLayoutStar *)self handleKeyboardMenusForTouch:v66];
  if ((a4 & 0x1000000000) != 0) {
    [v18 generateCandidatesWithOptions:4];
  }
  [v18 clearLongPressTimer];
  objc_msgSend(v66, "setInitialDragPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [v66 setDragged:0];
  if (!self->_revertKeyplaneAfterTouch) {
    [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:0];
  }
  double v58 = [(UIKeyboardLayoutStar *)self activeKey];
  CGFloat v59 = [v58 parentKey];
  if (v59
    || ([(UIKeyboardLayoutStar *)self activeKey],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        ([(id)v9 hasSemiStickyVariant] & 1) != 0))
  {
    double v60 = [(UIKeyboardLayoutStar *)self activeKey];
    id v61 = [v60 parentKey];
    unsigned int v62 = (v61 != 0) & (a4 >> 3);

    if (v59)
    {

      if (!v62) {
        goto LABEL_112;
      }
    }
    else
    {

      if ((v62 & 1) == 0) {
        goto LABEL_112;
      }
    }
  }
  else
  {
  }
  [(UIKeyboardLayoutStar *)self setActiveKey:0];
LABEL_112:
  self->_prevTouchUpFinishedTime = CFAbsoluteTimeGetCurrent();
  [(UIKeyboardLayoutStar *)self clearInfoForTouch:v19];
  [v18 deleteWordLastDelete];
  if (v63 > 0.0
    && ([v66 key],
        double v64 = objc_claimAutoreleasedReturnValue(),
        int v65 = [v64 interactionType],
        v64,
        v65 == 4))
  {
    [v18 setDeleteWordLastDelete:0.0];
    [v18 handleDeleteWithExecutionContext:v17];
  }
  else
  {
    [v17 returnExecutionToParent];
  }
}

- (void)touchCancelled:(id)a3 executionContext:(id)a4
{
}

- (void)touchCancelled:(id)a3 forResting:(BOOL)a4 executionContext:(id)a5
{
  BOOL v6 = a4;
  id v37 = a3;
  id v8 = a5;
  uint64_t v9 = [(UIKeyboardLayoutStar *)self infoForTouch:v37];
  [v9 addTouch:v37];
  double v10 = +[UIKeyboardImpl activeInstance];
  if ([v9 initialKeyState] != 16
    || !_os_feature_enabled_impl()
    || ([v9 key],
        int v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 variantType],
        v11,
        (v12 - 10) >= 4))
  {
    uint64_t v13 = [v9 key];
    if (v13)
    {
      CGRect v14 = (void *)v13;
      BOOL v15 = [v9 key];
      int v16 = [v15 interactionType];

      if (v16 != 18)
      {
        id v17 = [v9 key];
        [(UIKeyboardLayoutStar *)self setState:2 forKey:v17];
      }
    }
    id v18 = [v9 key];
    int v19 = [v18 interactionType];

    if (v19 == 9)
    {
      double v20 = +[UIInputSwitcherView activeInstance];
      [v20 hide];
    }
    BOOL v21 = [v9 key];
    int v22 = [v21 interactionType];

    if (v22 == 4) {
      [v10 stopAutoDelete];
    }
    [v10 clearLongPressTimer];
    if (self->_keyboardImageViewIsDim) {
      [(UIKeyboardLayoutStar *)self setKeyboardDim:0];
    }
    uint64_t v23 = [v9 key];
    if ([v23 interactionType] == 6)
    {
    }
    else
    {
      int v24 = [v9 key];
      int v25 = [v24 interactionType];

      if (v25 != 3) {
        [(UIKeyboardLayoutStar *)self clearHandwritingStrokesIfNeededAndNotify:0];
      }
    }
    [(UIKeyboardLayoutStar *)self clearInfoForTouch:v37 forResting:v6];
    BOOL v26 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];

    if (v26)
    {
      if ([v37 tapCount] == 1
        && self->_prevTouchMoreKeyTime
        && ([MEMORY[0x1E4F1C9C8] date],
            double v27 = objc_claimAutoreleasedReturnValue(),
            [v27 timeIntervalSinceDate:self->_prevTouchMoreKeyTime],
            double v29 = v28,
            v27,
            v29 <= 0.25))
      {
        BOOL v36 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
        [(UIKeyboardLayoutStar *)self setKeyplaneName:v36];
      }
      else
      {
        [(UIKeyboardLayoutStar *)self updateShiftKeyState];
      }
    }
    [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:0];
    [(UIKeyboardLayoutStar *)self handleDismissFlickView:0];
    if (+[UIDictationController isRunning])
    {
      char v30 = +[UIKeyboardInputMode dictationInputMode];
      char v31 = [v30 usingTypeAndTalk];

      if ((v31 & 1) == 0)
      {
        uint64_t v32 = +[UIDictationController sharedInstance];
        [v32 cancelDictation];

        unint64_t v33 = +[UIKeyboardImpl activeInstance];
        int v34 = [v33 isDictationPopoverPresented];

        if (v34)
        {
          id v35 = +[UIKeyboardImpl activeInstance];
          [v35 dismissDictationPopover];
        }
      }
    }
    [(UIKeyboardLayoutStar *)self _cleanUpBlinkAssertionIfNecessary];
  }
  [v8 returnExecutionToParent];
}

- (void)touchChanged:(id)a3 executionContext:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(UIKeyboardLayoutStar *)self infoForTouch:v13];
  id v8 = [v7 key];
  int v9 = [v8 interactionType];

  if (v9 == 4)
  {
    double v10 = +[UIKeyboardImpl activeInstance];
    int v11 = [v13 touchUUID];
    int v12 = +[UIKBTouchState touchForTouchUUID:v11];
    [v12 force];
    objc_msgSend(v10, "adjustAutoDeleteTimerForForce:");
  }
  [v6 returnExecutionToParent];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UISwipeGestureRecognizer *)a3;
  id v5 = v4;
  if (self->_rightSwipeRecognizer == v4 || self->_leftSwipeRecognizer == v4)
  {
    id v7 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Space-Key"];
    id v8 = [(UIKeyboardLayoutStar *)self viewForKey:v7];

    if (v8)
    {
      [(UISwipeGestureRecognizer *)v5 locationInView:v8];
      char v6 = objc_msgSend(v8, "pointInside:withEvent:", 0);
    }
    else
    {
      char v6 = 0;
    }
    goto LABEL_11;
  }
  if (self->_upSwipeRecognizer == v4)
  {
    if ([(UIKeyboardLayoutStar *)self _allowContinuousPathUI])
    {
      char v6 = 0;
      goto LABEL_12;
    }
    id v8 = -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:", -[UISwipeGestureRecognizer startPoint]((double *)self->_upSwipeRecognizer));
    char v6 = v8 != 0;
LABEL_11:

    goto LABEL_12;
  }
  char v6 = 1;
LABEL_12:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (self->_upSwipeRecognizer == a3)
  {
    id v6 = a4;
    id v7 = [v6 view];
    [v6 locationInView:v7];
    double v9 = v8;
    double v11 = v10;

    int v12 = -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:", v9, v11);
    int v4 = [v12 behavesAsShiftKey] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_pinchGestureRecognizer == a3) {
    -[UIKeyboardLayoutStar pinchHandler:](self, "pinchHandler:");
  }
}

- (void)installGestureRecognizers
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v3 = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:sel_swipeDetected_];
    upSwipeRecognizer = self->_upSwipeRecognizer;
    self->_upSwipeRecognizer = v3;

    [(UIGestureRecognizer *)self->_upSwipeRecognizer setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)self->_upSwipeRecognizer setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)self->_upSwipeRecognizer setDelaysTouchesEnded:0];
    [(UISwipeGestureRecognizer *)self->_upSwipeRecognizer setDirection:4];
    id v5 = self->_upSwipeRecognizer;
    if (v5)
    {
      v5->_minimumPrimaryMovement = 40.0;
      id v6 = self->_upSwipeRecognizer;
    }
    else
    {
      id v6 = 0;
    }
    [(UIGestureRecognizer *)v6 setDelegate:self];
    [(UIView *)self addGestureRecognizer:self->_upSwipeRecognizer];
    id v7 = [[UIKeyboardPinchGestureRecognizer alloc] initWithTarget:self action:sel_pinchHandler_];
    pinchGestureRecognizer = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = v7;

    [(UIGestureRecognizer *)self->_pinchGestureRecognizer setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)self->_pinchGestureRecognizer setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)self->_pinchGestureRecognizer setDelaysTouchesEnded:0];
    [(UIKeyboardPinchGestureRecognizer *)self->_pinchGestureRecognizer setPinchDelegate:self];
    [(UIGestureRecognizer *)self->_pinchGestureRecognizer setDelegate:self];
    double v9 = self->_pinchGestureRecognizer;
    [(UIView *)self addGestureRecognizer:v9];
  }
}

- (void)uninstallGestureRecognizers
{
  upSwipeRecognizer = self->_upSwipeRecognizer;
  if (upSwipeRecognizer)
  {
    int v4 = [(UIGestureRecognizer *)upSwipeRecognizer view];

    if (v4) {
      [(UIView *)self removeGestureRecognizer:self->_upSwipeRecognizer];
    }
    id v5 = self->_upSwipeRecognizer;
    self->_upSwipeRecognizer = 0;
  }
  pinchGestureRecognizer = self->_pinchGestureRecognizer;
  if (pinchGestureRecognizer)
  {
    id v7 = [(UIGestureRecognizer *)pinchGestureRecognizer view];

    if (v7) {
      [(UIView *)self removeGestureRecognizer:self->_pinchGestureRecognizer];
    }
    double v8 = self->_pinchGestureRecognizer;
    self->_pinchGestureRecognizer = 0;
  }
  rightSwipeRecognizer = self->_rightSwipeRecognizer;
  if (rightSwipeRecognizer)
  {
    double v10 = [(UIGestureRecognizer *)rightSwipeRecognizer view];

    if (v10) {
      [(UIView *)self removeGestureRecognizer:self->_rightSwipeRecognizer];
    }
    double v11 = self->_rightSwipeRecognizer;
    self->_rightSwipeRecognizer = 0;
  }
  leftSwipeRecognizer = self->_leftSwipeRecognizer;
  if (leftSwipeRecognizer)
  {
    id v13 = [(UIGestureRecognizer *)leftSwipeRecognizer view];

    if (v13) {
      [(UIView *)self removeGestureRecognizer:self->_leftSwipeRecognizer];
    }
    CGRect v14 = self->_leftSwipeRecognizer;
    self->_leftSwipeRecognizer = 0;
  }
  resizingKeyplaneCoordinator = self->_resizingKeyplaneCoordinator;
  [(UIKBResizingKeyplaneCoordinator *)resizingKeyplaneCoordinator uninstallGestureRecognizers];
}

- (void)swipeDetected:(id)a3
{
  if (([a3 direction] & 4) != 0)
  {
    int v4 = [(UIKeyboardLayoutStar *)self activeKey];
    int v5 = [v4 interactionType];

    if (v5 != 6)
    {
      self->_swipeDetected = 1;
      id v6 = +[UIKeyboardImpl activeInstance];
      [v6 longPressAction];

      self->_swipeDetected = 0;
    }
  }
}

- (id)infoForTouchUUID:(id)a3
{
  if (a3)
  {
    int v4 = -[NSMutableDictionary objectForKey:](self->_extendedTouchInfoMap, "objectForKey:");
  }
  else
  {
    int v4 = 0;
  }
  return v4;
}

- (id)infoForTouch:(id)a3
{
  int v4 = [a3 touchUUID];
  int v5 = [(UIKeyboardLayoutStar *)self infoForTouchUUID:v4];

  return v5;
}

- (id)generateInfoForTouch:(id)a3
{
  id v4 = a3;
  int v5 = objc_alloc_init(UIKeyboardTouchInfo);
  [(UIKeyboardTouchInfo *)v5 addTouch:v4];
  [(UIKeyboardTouchInfo *)v5 setStage:3];
  id v6 = [v4 touchUUID];

  if (v6)
  {
    extendedTouchInfoMap = self->_extendedTouchInfoMap;
    double v8 = [v4 touchUUID];
    [(NSMutableDictionary *)extendedTouchInfoMap setObject:v5 forKey:v8];
  }
  return v5;
}

- (void)cancelTouchIfNecessaryForInfo:(id)a3 forResting:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    double v8 = [v6 key];
    int v9 = [v8 interactionType];

    if (v9 != 4)
    {
      double v10 = +[UIKeyboardImpl activeInstance];
      if ([v10 canHandleKeyHitTest])
      {
        [v10 clearLongPressTimer];
        if (qword_1EB25ABD8 != -1) {
          dispatch_once(&qword_1EB25ABD8, &__block_literal_global_1242);
        }
        double v11 = [v10 taskQueue];
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __65__UIKeyboardLayoutStar_cancelTouchIfNecessaryForInfo_forResting___block_invoke_3;
        v12[3] = &unk_1E52E35D8;
        id v13 = v7;
        CGRect v14 = self;
        BOOL v16 = a4;
        id v15 = v10;
        [v11 addTask:v12 breadcrumb:qword_1EB25ABD0];
      }
    }
  }
}

void __65__UIKeyboardLayoutStar_cancelTouchIfNecessaryForInfo_forResting___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1244 copy];
  uint64_t v1 = (void *)qword_1EB25ABD0;
  qword_1EB25ABD0 = v0;
}

uint64_t __65__UIKeyboardLayoutStar_cancelTouchIfNecessaryForInfo_forResting___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __65__UIKeyboardLayoutStar_cancelTouchIfNecessaryForInfo_forResting___block_invoke_3(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (![*(id *)(a1 + 32) stage]
    || [*(id *)(a1 + 32) stage] == 1)
  {
    [*(id *)(a1 + 32) setStage:3];
    uint64_t v3 = [*(id *)(a1 + 32) touch];
    [v3 locationInView:*(void *)(a1 + 40)];
    double v5 = v4;
    double v7 = v6;
    [v3 timestamp];
    double v9 = v8;
    double v10 = (void *)MEMORY[0x1E4FAE3A8];
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 3;
    }
    [v3 pathMajorRadius];
    id v13 = objc_msgSend(v10, "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:", v11, objc_msgSend(v3, "pathIndex"), objc_msgSend(*(id *)(a1 + 32), "fingerID"), -1, v5, v7, v12, v9);
    [*(id *)(a1 + 48) skipHitTestForTouchEvent:v13];
  }
  [v14 returnExecutionToParent];
}

- (void)clearInfoForTouch:(id)a3
{
}

- (void)clearInfoForTouch:(id)a3 forResting:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = a3;
  double v6 = -[UIKeyboardLayoutStar infoForTouch:](self, "infoForTouch:");
  [(UIKeyboardLayoutStar *)self cancelTouchIfNecessaryForInfo:v6 forResting:v4];
  if (!v4)
  {
    double v7 = [v10 touchUUID];

    if (v7)
    {
      extendedTouchInfoMap = self->_extendedTouchInfoMap;
      double v9 = [v10 touchUUID];
      [(NSMutableDictionary *)extendedTouchInfoMap removeObjectForKey:v9];
    }
  }
}

- (void)clearAllTouchInfo
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableDictionary *)self->_extendedTouchInfoMap allValues];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
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
        [(UIKeyboardLayoutStar *)self cancelTouchIfNecessaryForInfo:*(void *)(*((void *)&v8 + 1) + 8 * v7++) forResting:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableDictionary *)self->_extendedTouchInfoMap removeAllObjects];
}

- (id)touchInfoForKey:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [(NSMutableDictionary *)self->_extendedTouchInfoMap allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = [(NSMutableDictionary *)self->_extendedTouchInfoMap objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * v9)];
      id v11 = [v10 key];

      if (v11 == v4) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    long long v10 = 0;
  }

  return v10;
}

- (id)activeTouchInfoForShift
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_extendedTouchInfoMap allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [(NSMutableDictionary *)self->_extendedTouchInfoMap objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        uint64_t v9 = [v8 key];
        if ([v9 interactionType] == 14)
        {
          shiftKeyTouchUUID = self->super._shiftKeyTouchUUID;

          if (shiftKeyTouchUUID) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  uint64_t v8 = 0;
LABEL_13:

  return v8;
}

- (BOOL)hasActiveContinuousPathInput
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(NSMutableDictionary *)self->_extendedTouchInfoMap allKeys];
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
        uint64_t v8 = [(NSMutableDictionary *)self->_extendedTouchInfoMap objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        uint64_t v9 = [v8 continuousPathState];

        if (v9 == 4)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)keyHasAccentedVariants:(id)a3
{
  id v4 = a3;
  if ([(UIKBTree *)self->_keyboard visualStyle] == 301
    || ([v4 name],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasPrefix:@"NumberPad"],
        v5,
        (v6 & 1) != 0)
    || [(UIKBTree *)self->_keyboard visualStyle] == 101)
  {
    char v7 = 0;
  }
  else
  {
    if (!self->_accentInfo)
    {
      uint64_t v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      accentInfo = self->_accentInfo;
      self->_accentInfo = v9;

      id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      hasAccents = self->_hasAccents;
      self->_hasAccents = v11;
    }
    long long v13 = [v4 representedString];
    if ([v4 variantType] == 8)
    {
      uint64_t v14 = [(UIKeyboardLayoutStar *)self _keyplaneVariantsKeyForString:v13];

      long long v13 = (void *)v14;
    }
    if ([v4 displayType] == 7)
    {
      long long v15 = [v4 secondaryRepresentedStrings];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        uint64_t v17 = [v4 secondaryRepresentedStrings];
        uint64_t v18 = [v17 firstObject];
        uint64_t v19 = [v13 stringByAppendingString:v18];

        long long v13 = (void *)v19;
      }
    }
    if (v13 && ([(NSMutableSet *)self->_accentInfo containsObject:v13] & 1) == 0)
    {
      [(NSMutableSet *)self->_accentInfo addObject:v13];
      double v20 = UIKeyboardGetCurrentInputMode();
      BOOL v21 = [(UIKeyboardLayout *)self getRomanAccentVariantsForString:v13 inputMode:v20 keyboardVariantIndludes:7];

      int v22 = [v21 objectForKey:@"Strings"];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __47__UIKeyboardLayoutStar_keyHasAccentedVariants___block_invoke;
      v25[3] = &unk_1E52F33B0;
      v25[4] = self;
      uint64_t v23 = [v22 indexesOfObjectsPassingTest:v25];
      int v24 = [v22 objectsAtIndexes:v23];

      if ([v24 count]) {
        [(NSMutableSet *)self->_hasAccents addObject:v13];
      }
    }
    char v7 = [(NSMutableSet *)self->_hasAccents containsObject:v13];
  }
  return v7;
}

uint64_t __47__UIKeyboardLayoutStar_keyHasAccentedVariants___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 768) containsObject:a2] ^ 1;
}

- (unint64_t)downActionFlagsForKey:(id)a3
{
  id v4 = a3;
  if (![v4 visible] || -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v4) == 1)
  {
    unint64_t v5 = 0;
    goto LABEL_50;
  }
  int v6 = [v4 interactionType];
  int v7 = [v4 variantType];
  if (v6 != 4)
  {
    if (v6 == 13)
    {
      if (self->_returnTarget)
      {
        uint64_t v8 = 856;
LABEL_14:
        if (*(Class *)((char *)&self->super.super.super.super.isa + v8))
        {
          uint64_t v9 = 1048709;
          goto LABEL_43;
        }
      }
    }
    else
    {
      if (v6 != 15)
      {
        if ((v6 - 1) > 1)
        {
          uint64_t v9 = 5;
          switch(v6)
          {
            case 3:
            case 38:
              uint64_t v9 = 128;
              break;
            case 5:
              if (+[UIDictationController viewMode] == 1) {
                uint64_t v9 = 1073741957;
              }
              else {
                uint64_t v9 = 1073741829;
              }
              break;
            case 6:
              if (+[UIKeyboardImpl rivenTranslationPreference])
              {
                uint64_t v9 = 133;
              }
              else
              {
                uint64_t v9 = 5;
              }
              break;
            case 7:
              uint64_t v9 = 1048581;
              break;
            case 9:
              uint64_t v9 = 4229;
              break;
            case 10:
              uint64_t v9 = 536870916;
              break;
            case 11:
              uint64_t v9 = 36;
              break;
            case 12:
            case 16:
            case 17:
            case 20:
            case 21:
            case 24:
            case 25:
            case 26:
            case 27:
            case 31:
            case 32:
            case 33:
            case 34:
            case 35:
            case 36:
            case 37:
            case 40:
            case 41:
              goto LABEL_43;
            case 14:
              uint64_t v9 = 20;
              break;
            case 28:
            case 29:
            case 30:
              uint64_t v9 = 4;
              break;
            case 44:
              uint64_t v9 = 1;
              break;
            default:
              uint64_t v9 = 0;
              break;
          }
        }
        else
        {
          int v10 = v7;
          if (([(UIKBTree *)self->_keyplane visualStyling] & 0x3F) == 0x17)
          {
            int v11 = [v4 displayType];
            if (v10 != 3 && v11 == 7) {
              uint64_t v13 = 32901;
            }
            else {
              uint64_t v13 = 5;
            }
          }
          else
          {
            uint64_t v13 = 5;
          }
          uint64_t v9 = 32901;
          switch(v10)
          {
            case 1:
              break;
            case 3:
              uint64_t v14 = 262272;
              goto LABEL_37;
            case 4:
              uint64_t v14 = 131200;
              goto LABEL_37;
            case 5:
            case 10:
            case 12:
              uint64_t v14 = 8421376;
              goto LABEL_37;
            case 7:
              uint64_t v14 = 65664;
              goto LABEL_37;
            case 8:
              uint64_t v9 = 557189;
              break;
            case 9:
              uint64_t v14 = 2155872261;
              goto LABEL_37;
            case 11:
            case 13:
              uint64_t v14 = 0x100000080;
LABEL_37:
              uint64_t v9 = v13 | v14;
              break;
            default:
              BOOL v21 = +[UIKeyboardImpl activeInstance];
              if ([v21 isLongPress]
                && [(UIKeyboardLayoutStar *)self keyHasAccentedVariants:v4])
              {
                int v22 = [v4 name];
                int v23 = [v22 hasPrefix:@"Assist"];

                if (v23) {
                  uint64_t v9 = v13;
                }
                else {
                  uint64_t v9 = 32901;
                }
              }
              else
              {

                uint64_t v9 = v13;
              }
              break;
          }
          long long v15 = [v4 name];
          if ([v15 hasPrefix:@"NumberPad-"])
          {
            uint64_t v16 = [v4 name];
            int v17 = [v16 hasSuffix:@"-0-Plus"];

            if (v17) {
              v9 |= 0x80uLL;
            }
          }
          else
          {
          }
        }
        goto LABEL_43;
      }
      if (self->_spaceTarget)
      {
        uint64_t v8 = 832;
        goto LABEL_14;
      }
    }
    uint64_t v9 = 5;
    goto LABEL_43;
  }
  if (self->_deleteTarget && self->_deleteLongAction) {
    uint64_t v9 = 1048773;
  }
  else {
    uint64_t v9 = 69;
  }
LABEL_43:
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] != 2
    && [(UITextInputTraits *)self->super._inputTraits keyboardType] == 7)
  {
    uint64_t v18 = [v4 representedString];
    int v19 = [v18 isEqualToString:@"@"];

    if (v19) {
      v9 &= 0x1FFFF7F7FuLL;
    }
  }
  if ([(UIKBScreenTraits *)self->super._screenTraits idiom] == 3) {
    unint64_t v5 = v9 & 0xFFFFFFFFFFFFFF7FLL;
  }
  else {
    unint64_t v5 = v9;
  }
LABEL_50:

  return v5;
}

- (unint64_t)upActionFlagsForKey:(id)a3
{
  id v4 = a3;
  if ([v4 visible] && -[UIKeyboardLayoutStar stateForKey:](self, "stateForKey:", v4) != 1)
  {
    if ([v4 BOOLForProperty:@"more-after"]) {
      uint64_t v7 = 256;
    }
    else {
      uint64_t v7 = 0;
    }
    if ([v4 BOOLForProperty:@"shift-after"]) {
      uint64_t v8 = v7 | 0x400000;
    }
    else {
      uint64_t v8 = v7;
    }
    unint64_t v5 = v8;
    switch([v4 interactionType])
    {
      case 1u:
      case 2u:
      case 0x10u:
        if ([v4 variantType] == 9
          || [v4 variantType] == 10
          || [v4 variantType] == 12
          || [v4 variantType] == 13)
        {
          uint64_t v9 = 2147483658;
          goto LABEL_48;
        }
        unint64_t v5 = v8 | 0xA;
        if ([v4 variantType] == 11 && _os_feature_enabled_impl()) {
          unint64_t v5 = v8 | 0x200000000ALL;
        }
        break;
      case 3u:
        unint64_t v5 = v8 | 0x80;
        break;
      case 4u:
        unint64_t v5 = v8 | 0x808;
        if (self->_deleteTarget && self->_deleteAction)
        {
          uint64_t v10 = v8 & 0x400000 | 0x808;
          goto LABEL_40;
        }
        break;
      case 5u:
        unint64_t v5 = v8 | 0x40000000;
        break;
      case 6u:
        uint64_t v9 = 33554440;
        goto LABEL_48;
      case 9u:
        uint64_t v9 = 4104;
        goto LABEL_48;
      case 0xBu:
        if ([(UIKBTree *)self->_keyplane isShiftKeyPlaneChooser]) {
          unint64_t v5 = v8 | 0x400;
        }
        else {
          unint64_t v5 = v8;
        }
        break;
      case 0xCu:
        uint64_t v9 = 268435464;
        goto LABEL_48;
      case 0xDu:
        unint64_t v5 = v8 | 0xA;
        if (self->_returnTarget && self->_returnAction) {
          goto LABEL_39;
        }
        if ([(UITextInputTraits *)self->super._inputTraits keyboardType] == 122
          && [(UITextInputTraits *)self->super._inputTraits returnKeyType] == 9)
        {
          unint64_t v5 = v8 | 0x100A;
        }
        break;
      case 0xEu:
        unint64_t v5 = v8 | 0x10;
        break;
      case 0xFu:
        unint64_t v5 = v8 | 0xA;
        if (self->_spaceTarget && self->_spaceAction)
        {
LABEL_39:
          uint64_t v10 = v5 & 0x400008;
LABEL_40:
          unint64_t v5 = v10 | 0x100000;
        }
        break;
      case 0x11u:
        uint64_t v9 = 134217736;
        goto LABEL_48;
      case 0x14u:
      case 0x15u:
      case 0x29u:
        uint64_t v9 = 520;
        goto LABEL_48;
      case 0x18u:
        uint64_t v9 = 8200;
        goto LABEL_48;
      case 0x19u:
        uint64_t v9 = 16392;
        goto LABEL_48;
      case 0x1Au:
        uint64_t v9 = 2097160;
        goto LABEL_48;
      case 0x1Bu:
        uint64_t v9 = 16777736;
        goto LABEL_48;
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x2Cu:
        unint64_t v5 = v8 | 8;
        break;
      case 0x24u:
        uint64_t v9 = 67108872;
        goto LABEL_48;
      case 0x25u:
        uint64_t v9 = 0x200000008;
LABEL_48:
        unint64_t v5 = v8 | v9;
        break;
      case 0x28u:
        unint64_t v5 = v8 | 0x800000008;
        break;
      case 0x2Au:
        unint64_t v5 = v8 | 0x100000;
        break;
      default:
        break;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)refreshDualStringKeys
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 displayType] == 7) {
          -[UIKeyboardLayoutStar setState:forKey:](self, "setState:forKey:", [v8 state], v8);
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)downActionShiftWithKey:(id)a3
{
  id v13 = a3;
  uint64_t v4 = +[UIKeyboardImpl activeInstance];
  double Current = CFAbsoluteTimeGetCurrent();
  double v6 = Current;
  if (!self->_shiftLockReady
    || Current - self->_shiftLockFirstTapTime >= 0.3
    || ![v4 shiftLockedEnabled]
    || [(UIKeyboardLayoutStar *)self ignoresShiftState])
  {
    self->_shiftLockReaddouble y = 1;
    self->_shiftLockFirstTapTime = v6;
    self->_wasShifted = [v4 isShifted];
    self->_BOOL holdingShift = 1;
    if (self->_wasShifted)
    {
      BOOL v7 = [(UIKBTree *)self->_keyplane looksLikeShiftAlternate];
      [v4 setShiftLocked:0];
      if (!v7)
      {
        BOOL holdingShift = self->_holdingShift;
LABEL_10:
        [v4 setShift:holdingShift];
        BOOL v9 = 1;
        [v4 setShiftPreventAutoshift:1];
        if (([v4 isShifted] & 1) == 0) {
          BOOL v9 = self->_holdingShift;
        }
        [(UIKeyboardLayoutStar *)self setShift:v9];
        long long v10 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v13];
        long long v11 = [v10 touch];
        long long v12 = [v11 touchUUID];
        [(UIKeyboardLayout *)self setShiftKeyTouchUUID:v12];

        self->_shiftTrackingChangeCount = [v4 changeCount];
        goto LABEL_13;
      }
    }
    else
    {
      [v4 setShiftLocked:0];
    }
    BOOL holdingShift = 1;
    goto LABEL_10;
  }
  self->_shiftLockReaddouble y = 0;
  [v4 setShiftLocked:1];
  [(UIKBTree *)self->_keyplane updateFlickKeycapOnKeys];
  [(UIKeyboardLayoutStar *)self refreshDualStringKeys];
  [(UIKeyboardLayout *)self setShiftKeyTouchUUID:0];
  [(UIKeyboardLayoutStar *)self setShift:1];
  if (![(UIKBTree *)self->_keyplane isShiftKeyPlaneChooser]) {
    [(UIKeyboardLayoutStar *)self setState:8 forKey:v13];
  }
LABEL_13:
  [(UIKeyboardLayoutStar *)self setActiveKey:0];
}

- (void)upActionShift
{
  uint64_t v3 = +[UIKeyboardImpl activeInstance];
  self->_BOOL holdingShift = 0;
  int shiftTrackingChangeCount = self->_shiftTrackingChangeCount;
  id v7 = v3;
  if (shiftTrackingChangeCount == [v3 changeCount])
  {
    uint64_t v5 = v7;
    if (self->_wasShifted)
    {
      uint64_t v6 = [v7 isShiftLocked];
      uint64_t v5 = v7;
    }
    else
    {
      uint64_t v6 = 1;
    }
    [v5 setShift:v6];
    [v7 setShiftPreventAutoshift:1];
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", [v7 isShifted]);
    self->_revertKeyplaneAfterTouch = 0;
  }
  else
  {
    [v7 setShift:0];
    [v7 setShiftPreventAutoshift:1];
    -[UIKeyboardLayoutStar setShift:](self, "setShift:", [v7 isShifted]);
  }
}

- (BOOL)usesAutoShift
{
  return [(UIKBTree *)self->_keyplane BOOLForProperty:@"autoshift"];
}

- (BOOL)ignoresShiftState
{
  return [(UIKBTree *)self->_keyplane BOOLForProperty:@"ignore-shift-state"];
}

- (BOOL)isAlphabeticPlane
{
  return [(UIKBTree *)self->_keyplane BOOLForProperty:@"is-alphabetic-plane"];
}

- (BOOL)isKanaPlane
{
  return [(UIKBTree *)self->_keyplane isKanaPlane];
}

- (BOOL)supportsContinuousPath
{
  return [(UIKBTree *)self->_keyplane BOOLForProperty:@"supports-continuous-path"];
}

- (BOOL)diacriticForwardCompose
{
  return [(UIKBTree *)self->_keyplane BOOLForProperty:@"diacritic-forward-compose"];
}

- (int)stateForShiftKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Caps-Lock-Key"];
  uint64_t v6 = v5;
  if (!v5)
  {
    if (![v4 behavesAsShiftKey])
    {
      int v8 = 2;
      goto LABEL_19;
    }
    int v7 = 0;
    goto LABEL_9;
  }
  int v7 = [v5 visible];
  if ([v4 behavesAsShiftKey])
  {
LABEL_9:
    long long v11 = +[UIKeyboardImpl activeInstance];
    int v12 = [v11 isShiftLocked];

    if (v12)
    {
      if (v7) {
        int v8 = 2;
      }
      else {
        int v8 = 8;
      }
    }
    else if (self->_autoshift)
    {
      int v8 = 64;
    }
    else if (self->_shift)
    {
      int v8 = 32;
    }
    else
    {
      int v8 = 2;
    }
    goto LABEL_19;
  }
  int v8 = 2;
  if (v7)
  {
    BOOL v9 = +[UIKeyboardImpl activeInstance];
    int v10 = [v9 isShiftLocked];

    if (v10) {
      int v8 = 8;
    }
    else {
      int v8 = 2;
    }
  }
LABEL_19:
  id v13 = [(UIKBTree *)self->_keyplane shiftAlternateKeyplaneName];
  uint64_t v14 = [(UIKeyboardLayoutStar *)self activeTouchInfoForShift];
  if (v14 && [v4 behavesAsShiftKey])
  {
    long long v15 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
    if ([v15 isEqualToString:self->_keyplaneName])
    {

LABEL_25:
      v8 |= 4u;
      goto LABEL_26;
    }
    uint64_t v16 = [(UIKeyboardLayoutStar *)self preTouchKeyplaneName];
    int v17 = [v16 isEqualToString:v13];

    if (v17) {
      goto LABEL_25;
    }
  }
  else
  {
  }
LABEL_26:

  return v8;
}

- (void)updateShiftKeyState
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!self->_isTrackpadMode)
  {
    uint64_t v3 = (void *)updateShiftKeyState_shiftKeyNames;
    if (!updateShiftKeyState_shiftKeyNames)
    {
      uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"Shift-Key", @"Caps-Lock-Key", 0);
      uint64_t v5 = (void *)updateShiftKeyState_shiftKeyNames;
      updateShiftKeyState_shiftKeyNames = v4;

      uint64_t v3 = (void *)updateShiftKeyState_shiftKeyNames;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = v3;
    uint64_t v21 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v21)
    {
      BOOL v7 = 0;
      uint64_t v20 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v6);
          }
          uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          int v10 = [(UIKBTree *)self->_keyplane cache];
          long long v11 = [v10 objectForKey:v9];

          if (v11)
          {
            int v22 = v11;
            uint64_t v23 = i;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v12 = v11;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v25;
              do
              {
                for (uint64_t j = 0; j != v14; ++j)
                {
                  if (*(void *)v25 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * j);
                  if ([(UIKeyboardLayoutStar *)self stateForKey:v17] != 1)
                  {
                    uint64_t v18 = [(UIKeyboardLayoutStar *)self stateForShiftKey:v17];
                    if ([(UIKeyboardLayoutStar *)self stateForKey:v17] != v18)
                    {
                      [(UIKeyboardLayoutStar *)self setState:v18 forKey:v17];
                      if (v18 == 8)
                      {
                        int v19 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Caps-Lock-Key"];
                        [(UIKeyboardLayoutStar *)self setState:8 forKey:v19];
                      }
                      BOOL v7 = [(UIKBScreenTraits *)self->super._screenTraits supportsSplit];
                    }
                  }
                }
                uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              }
              while (v14);
            }

            long long v11 = v22;
            uint64_t i = v23;
          }
        }
        uint64_t v21 = [v6 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v21);

      if (v7) {
        [(UIKeyboardLayoutStar *)self updateTransitionWithFlags:6];
      }
    }
    else
    {
    }
  }
}

- (void)setShift:(BOOL)a3
{
  if (!self->_gestureKeyboardIntroduction)
  {
    int v5 = a3;
    if (![(UIKeyboardLayoutStar *)self isEmojiKeyplane])
    {
      BOOL v6 = [(UIKeyboardLayout *)self ignoringKeyplaneChange];
      if (!self->_settingShift && !v6)
      {
        self->_settingShift = 1;
        if ((v5 & 1) == 0) {
          [(UIKeyboardLayout *)self setShiftKeyTouchUUID:0];
        }
        BOOL shift = self->_shift;
        self->_BOOL shift = v5;
        int v8 = [(UIKBTree *)self->_keyplane isShiftKeyplane];
        keyplane = self->_keyplane;
        if (v8 != v5)
        {
          uint64_t v10 = [(UIKBTree *)keyplane shiftAlternateKeyplaneName];
LABEL_20:
          uint64_t v16 = (void *)v10;
          goto LABEL_21;
        }
        long long v11 = [(UIKBTree *)keyplane firstCachedKeyWithName:@"Caps-Lock-Key"];
        if (v11)
        {
          int v12 = 0;
        }
        else
        {
          uint64_t v13 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Non-Roman-to-Roman-Switch-Key"];
          if (v13)
          {
            uint64_t v3 = (void *)v13;
            int v12 = 0;
          }
          else
          {
            uint64_t v17 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Roman-to-Non-Roman-Switch-Key"];
            if (!v17) {
              goto LABEL_26;
            }
            uint64_t v23 = (void *)v17;
            uint64_t v3 = 0;
            int v12 = 1;
          }
        }
        uint64_t v14 = +[UIKeyboardImpl activeInstance];
        int v15 = [v14 isShiftLocked];

        if (v12) {
        if (v11)
        }
        {

          if (v15) {
            goto LABEL_19;
          }
        }
        else
        {

          if (v15)
          {
LABEL_19:
            uint64_t v10 = [(UIKBTree *)self->_keyplane name];
            goto LABEL_20;
          }
        }
LABEL_26:
        if (self->_shift == shift)
        {
          uint64_t v16 = 0;
        }
        else
        {
          uint64_t v16 = [(UIKBTree *)self->_keyplane name];

          if (v16)
          {
            keyboard = self->_keyboard;
            int v19 = [(UIKBTree *)self->_keyplane shiftAlternateKeyplaneName];
            uint64_t v20 = [(UIKBTree *)keyboard subtreeWithName:v19];
            uint64_t v21 = [v20 name];

            int v22 = [(UIKBTree *)self->_keyplane name];
            LODWORD(v19) = [v21 isEqualToString:v22];

            if (v19)
            {
              uint64_t v16 = [(UIKBTree *)self->_keyplane shiftAlternateKeyplaneName];
            }
            else
            {
              uint64_t v16 = 0;
            }

LABEL_21:
            if (!self->_isContinuousPathUnderway && v16) {
              [(UIKeyboardLayoutStar *)self setKeyplaneName:v16];
            }
          }
        }
        [(UIKeyboardLayoutStar *)self updateShiftKeyState];
        self->_settingShift = 0;
      }
    }
  }
  [(UIKeyboardLayoutStar *)self setMultitapReverseKeyState];
}

- (void)setMultitapReverseKeyState
{
  uint64_t v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Multitap-Reverse-Key"];
  uint64_t v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Multitap-Forward-Key"];
  if (v3 | v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__UIKeyboardLayoutStar_setMultitapReverseKeyState__block_invoke;
    v5[3] = &unk_1E52DCB30;
    id v6 = (id)v3;
    BOOL v7 = self;
    id v8 = (id)v4;
    +[UIView performWithoutAnimation:v5];
  }
}

uint64_t __50__UIKeyboardLayoutStar_setMultitapReverseKeyState__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32)) {
    double result = objc_msgSend(*(id *)(result + 40), "setState:forKey:", objc_msgSend(*(id *)(result + 40), "stateForMultitapReverseKey:"), *(void *)(result + 32));
  }
  if (*(void *)(v1 + 48))
  {
    uint64_t v2 = *(void **)(v1 + 40);
    uint64_t v3 = objc_msgSend(v2, "stateForMultitapForwardKey:");
    uint64_t v4 = *(void *)(v1 + 48);
    return [v2 setState:v3 forKey:v4];
  }
  return result;
}

- (void)updateUndoKeyState
{
  id v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Undo-Key"];
  if (v4) {
    [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutStar *)self stateForManipulationKey:v4] forKey:v4];
  }
  uint64_t v3 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Redo-Key"];
  if (v3) {
    [(UIKeyboardLayoutStar *)self setState:[(UIKeyboardLayoutStar *)self stateForManipulationKey:v3] forKey:v3];
  }
}

- (void)setAutoshift:(BOOL)a3
{
  if (!self->_settingShift)
  {
    self->_settingShift = 1;
    self->_autoBOOL shift = a3;
    [(UIKeyboardLayoutStar *)self updateShiftKeyState];
    self->_settingShift = 0;
  }
}

- (BOOL)isShiftKeyBeingHeld
{
  return self->_holdingShift && self->super._shiftKeyTouchUUID != 0;
}

- (void)divideKeysIntoLeft:(id)a3 right:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6 && v7)
  {
    uint64_t v9 = [(UIKBTree *)self->_keyplane subtrees];
    uint64_t v10 = [v9 firstObject];

    uint64_t v38 = 0;
    BOOL v39 = (double *)&v38;
    uint64_t v40 = 0x4010000000;
    double v41 = &unk_186D7DBA7;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v42 = *MEMORY[0x1E4F1DB20];
    long long v43 = v11;
    uint64_t v32 = 0;
    unint64_t v33 = (double *)&v32;
    uint64_t v34 = 0x4010000000;
    id v35 = &unk_186D7DBA7;
    long long v36 = v42;
    long long v37 = v11;
    int v12 = [v10 keys];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    void v31[2] = __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke;
    v31[3] = &unk_1E52FA740;
    v31[4] = &v38;
    v31[5] = &v32;
    [v12 enumerateObjectsUsingBlock:v31];

    double v13 = v39[4];
    double v14 = v39[5];
    double v16 = v39[6];
    uint64_t v15 = *((void *)v39 + 7);
    double v17 = v33[6];
    uint64_t v18 = [(UIKBTree *)self->_keyplane keys];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke_2;
    v19[3] = &unk_1E52FA768;
    double v23 = v13 + v17 * -0.5;
    double v24 = v14 + 0.0;
    double v25 = v16 * 0.5 - (v17 * -0.5 + 0.0);
    uint64_t v26 = v15;
    int v22 = &v38;
    id v20 = v6;
    double v27 = v16 * 0.5 + 0.0;
    double v28 = v14 + 0.0;
    double v29 = v25;
    uint64_t v30 = v15;
    id v21 = v8;
    [v18 enumerateObjectsUsingBlock:v19];

    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(&v38, 8);
  }
}

void __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke(uint64_t a1, void *a2)
{
  [a2 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  int v12 = *(CGRect **)(*(void *)(a1 + 32) + 8);
  if (IsNull)
  {
    v12[1].origin.double x = v4;
    v12[1].origin.double y = v6;
    v12[1].size.CGFloat width = v8;
    v12[1].size.CGFloat height = v10;
    double v13 = *(CGFloat **)(*(void *)(a1 + 40) + 8);
    v13[4] = v4;
    v13[5] = v6;
    v13[6] = v8;
    v13[7] = v10;
  }
  else
  {
    v14.origin.double x = v4;
    v14.origin.double y = v6;
    v14.size.CGFloat width = v8;
    v14.size.CGFloat height = v10;
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v12[1], v14);
  }
}

void __49__UIKeyboardLayoutStar_divideKeysIntoLeft_right___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v23.origin.double x = v3;
  v23.origin.double y = v5;
  v23.size.CGFloat width = v7;
  v23.size.CGFloat height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v23)) {
    goto LABEL_4;
  }
  v24.origin.double x = v4;
  v24.origin.double y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v24))
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v19.origin.double x = v4;
    v19.origin.double y = v6;
    v19.size.CGFloat width = v8;
    v19.size.CGFloat height = v10;
    double v12 = MaxX - CGRectGetMinX(v19);
    v20.origin.double x = v4;
    v20.origin.double y = v6;
    v20.size.CGFloat width = v8;
    v20.size.CGFloat height = v10;
    double v13 = CGRectGetMaxX(v20);
    if (v12 > v13 - CGRectGetMaxX(*(CGRect *)(a1 + 56))) {
LABEL_4:
    }
      [*(id *)(a1 + 32) addObject:v17];
  }
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 88), v25)) {
    goto LABEL_8;
  }
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v26))
  {
    v21.origin.double x = v4;
    v21.origin.double y = v6;
    v21.size.CGFloat width = v8;
    v21.size.CGFloat height = v10;
    double v14 = CGRectGetMaxX(v21);
    double v15 = v14 - CGRectGetMinX(*(CGRect *)(a1 + 88));
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
    v22.origin.double x = v4;
    v22.origin.double y = v6;
    v22.size.CGFloat width = v8;
    v22.size.CGFloat height = v10;
    if (v15 > MinX - CGRectGetMinX(v22)) {
LABEL_8:
    }
      [*(id *)(a1 + 40) addObject:v17];
  }
}

- (void)updateKeyCentroids
{
  self->_ghostKeysEnabled = CFAbsoluteTimeGetCurrent() - self->_prevTouchUpTime < 1.0;
  if ([(UIKeyboardLayout *)self supportsVirtualDrift]
    || [(UIKeyboardLayout *)self isReachableDevice])
  {
    CGFloat v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    leftKeySet = self->_leftKeySet;
    self->_leftKeySet = v3;

    CGFloat v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    rightKeySet = self->_rightKeySet;
    self->_rightKeySet = v5;

    [(UIKeyboardLayoutStar *)self divideKeysIntoLeft:self->_leftKeySet right:self->_rightKeySet];
    [(UIKeyboardLayout *)self leftVirtualDriftOffset];
    self->_leftDriftOffset.double x = v7;
    self->_leftDriftOffset.double y = v8;
    [(UIKeyboardLayout *)self rightVirtualDriftOffset];
    self->_rightDriftOffset.double x = v9;
    self->_rightDriftOffset.double y = v10;
  }
  else
  {
    long long v11 = self->_leftKeySet;
    self->_leftKeySet = 0;

    double v12 = self->_rightKeySet;
    self->_rightKeySet = 0;

    CGPoint v13 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_leftDriftOffset = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_rightDriftOffset = v13;
  }
  id v55 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v14 = [v55 count];
  double v15 = (void *)[objc_alloc(MEMORY[0x1E4FAE360]) initWithCapacity:v14];
  objc_msgSend(v15, "setUsesTwoHands:", -[UIKeyboardLayout supportsVirtualDrift](self, "supportsVirtualDrift"));
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v15, "setShifted:", -[UIKBTree isShiftKeyplane](self->_keyplane, "isShiftKeyplane"));
  }
  if (v14)
  {
    uint64_t v16 = 0;
    double v17 = *MEMORY[0x1E4F1DB20];
    double v18 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v54 = *MEMORY[0x1E4F1DB20];
    do
    {
      CGRect v21 = objc_msgSend(v55, "objectAtIndex:", v16, *(void *)&v54);
      [v21 paddedFrame];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      if (([v21 isExemptFromInputManagerLayout] & 1) != 0
        || ![(UIKeyboardLayoutStar *)self shouldHitTestKey:v21])
      {
        objc_msgSend(v15, "addKeyWithString:frame:", &stru_1ED0E84C0, v17, v18, v19, v20);
      }
      else
      {
        if ([v21 interactionType] == 15 && self->_showDictationKey)
        {
          uint64_t v30 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"More-Key"];
          int v31 = [v30 interactionType];

          if (v31 != 10)
          {
            uint64_t v32 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Dictation-Key"];
            unint64_t v33 = [v32 shape];

            [v21 paddedFrame];
            double MinY = CGRectGetMinY(v57);
            [v33 paddedFrame];
            if (MinY == CGRectGetMinY(v58)
              && ([v21 paddedFrame],
                  double v35 = CGRectGetMinX(v59),
                  [v33 paddedFrame],
                  v35 > CGRectGetMaxX(v60)))
            {
              [v21 paddedFrame];
              double MinX = CGRectGetMinX(v61);
              [v33 paddedFrame];
              double v37 = MinX - CGRectGetMaxX(v62);
              [v33 paddedFrame];
              BOOL v39 = v37 < v38;
              double v17 = v54;
              if (v39)
              {
                uint64_t v40 = [v21 shape];
                double v41 = +[UIKBShape shapeByCombining:v40 withShape:v33];

                [v41 paddedFrame];
                double v23 = v42;
                double v25 = v43;
                double v27 = v44;
                double v29 = v45;
              }
            }
            else
            {
              double v17 = v54;
            }
          }
        }
        int v46 = [v21 representedString];
        if ([v21 displayType] == 7
          && ([v21 supportsSupplementalDisplayString] & 1) == 0)
        {
          uint64_t v47 = [(UIKeyboardLayoutStar *)self currentRepresentedStringForDualDisplayKey:v21];

          int v46 = (void *)v47;
        }
        double v48 = @"undo";
        if ([v21 interactionType] == 12
          || (double v48 = @"international", [v21 interactionType] == 9)
          || (double v48 = @"delete", [v21 interactionType] == 4))
        {

          int v46 = v48;
        }
        char v49 = [(NSMutableSet *)self->_leftKeySet containsObject:v21];
        int v50 = 1216;
        if ((v49 & 1) != 0
          || (v51 = [(NSMutableSet *)self->_rightKeySet containsObject:v21], int v50 = 1232, v51))
        {
          uint64_t v52 = (double *)((char *)self + v50);
          double v23 = v23 + *v52;
          double v25 = v25 + v52[1];
        }
        objc_msgSend(v15, "addKeyWithString:frame:", v46, v23, v25, v27, v29);
      }
      ++v16;
    }
    while (v14 != v16);
  }
  int v53 = +[UIKeyboardImpl activeInstance];
  [v53 setLayoutForKeyHitTest:v15];
}

- (void)willRotate:(int64_t)a3
{
  self->_preRotateShift = self->_shift;
  CGFloat v5 = (NSString *)[(NSString *)self->_keyplaneName copy];
  preRotateKeyplaneName = self->_preRotateKeyplaneName;
  self->_preRotateKeyplaneName = v5;

  CGFloat v7 = [(UIKeyboardLayoutStar *)self modalDisplayView];

  if (v7)
  {
    CGFloat v8 = [(UIKeyboardLayoutStar *)self modalDisplayView];
    [v8 removeFromSuperview];

    [(UIKeyboardLayoutStar *)self setModalDisplayView:0];
    [(UIView *)self->_keyplaneView setHidden:0];
  }
  if (self->_isTrackpadMode)
  {
    [(UIKeyboardLayoutStar *)self didEndIndirectSelectionGesture:0];
    self->_preRotateTrackpadMode = 1;
  }
  if ([(UIKeyboardLayoutStar *)self useCrescendoLayout] && self->_liveKeyplaneView)
  {
    CGFloat v9 = +[UIKeyboardImpl keyboardScreen];
    id v10 = +[UIKBScreenTraits traitsWithScreen:v9 orientation:a3 ignoreRemoteKeyboard:1];

    [(TUIKeyplaneView *)self->_liveKeyplaneView setOverrideScreenTraits:v10];
  }
}

- (void)didRotate
{
  preRotateKeyplaneName = self->_preRotateKeyplaneName;
  if (preRotateKeyplaneName)
  {
    CGFloat v4 = preRotateKeyplaneName;
    CGFloat v5 = [(UIKBTree *)self->_keyboard subtreeWithName:v4];

    if (!v5)
    {
      uint64_t v6 = [(UIKeyboardLayoutStar *)self defaultNameForKeyplaneName:self->_preRotateKeyplaneName];

      CGFloat v4 = (NSString *)v6;
    }
    CGFloat v7 = [(UIKBTree *)self->_keyboard subtreeWithName:v4];

    if (!v7)
    {
      uint64_t v8 = [(UIKeyboardLayoutStar *)self initialKeyplaneNameWithKBStarName:0];

      CGFloat v4 = (NSString *)v8;
    }
    if (![(UIKeyboardLayout *)self isFloating]
      || ([(UIKeyboardLayoutStar *)self keyplaneName],
          CGFloat v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = [v9 isEqualToString:v4],
          v9,
          (v10 & 1) == 0))
    {
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v4];
    }
    long long v11 = self->_preRotateKeyplaneName;
    self->_preRotateKeyplaneName = 0;
  }
  [(UIKeyboardLayoutStar *)self deactivateActiveKeys];
  [(UIKeyboardLayoutStar *)self updateShiftKeyState];
  if (self->_preRotateShift) {
    [(UIKeyboardLayoutStar *)self setAutoshift:1];
  }
  if (self->_preRotateTrackpadMode)
  {
    [(UIKeyboardLayoutStar *)self willBeginIndirectSelectionGesture:0];
    self->_preRotateTrackpadMode = 0;
  }
  [(UIKeyboardLayoutStar *)self rebuildSplitTransitionView];
}

- (BOOL)shouldRetestTouchDraggedFromKey:(id)a3
{
  return [a3 allowRetestAfterCommittingDownActions];
}

- (BOOL)shouldRetestKey:(id)a3 slidOffKey:(id)a4 withKeyplane:(id)a5
{
  id v8 = a3;
  CGFloat v9 = (UIKBTree *)a5;
  BOOL v10 = 0;
  if ([v8 interactionType] != 4 && self->_keyplane != v9)
  {
    if (![v8 modifiesKeyplane]
      || [v8 interactionType] != 10
      && ([(UIKeyboardLayoutStar *)self preTouchKeyplaneName],
          double v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          a4)
      && v12)
    {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (id)baseKeyForString:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat v5 = [(UIKeyboardLayoutStar *)self keyboard];
  uint64_t v6 = [v5 subtrees];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v7 = v6;
  uint64_t v53 = [v7 countByEnumeratingWithState:&v71 objects:v79 count:16];
  if (v53)
  {
    uint64_t v8 = *(void *)v72;
    uint64_t v52 = *(void *)v72;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v7);
        }
        id v10 = v7;
        long long v11 = *(void **)(*((void *)&v71 + 1) + 8 * i);
        long long v67 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        double v12 = [v11 keys];
        uint64_t v13 = [v12 countByEnumeratingWithState:&v67 objects:v78 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v68;
          while (2)
          {
            for (uint64_t j = 0; j != v14; ++j)
            {
              if (*(void *)v68 != v15) {
                objc_enumerationMutation(v12);
              }
              double v17 = *(void **)(*((void *)&v67 + 1) + 8 * j);
              double v18 = [v17 representedString];
              char v19 = [v18 isEqualToString:v4];

              if (v19)
              {
                id v44 = v17;

                id v7 = v10;
                id v23 = v10;
                goto LABEL_46;
              }
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v67 objects:v78 count:16];
            if (v14) {
              continue;
            }
            break;
          }
        }

        id v7 = v10;
        uint64_t v8 = v52;
      }
      uint64_t v53 = [v7 countByEnumeratingWithState:&v71 objects:v79 count:16];
    }
    while (v53);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v20 = v7;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v63 objects:v77 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    id v23 = 0;
    uint64_t v24 = *(void *)v64;
    id v49 = v7;
    int v50 = v20;
    uint64_t v46 = *(void *)v64;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v64 != v24) {
          objc_enumerationMutation(v20);
        }
        double v26 = *(void **)(*((void *)&v63 + 1) + 8 * k);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        double v27 = [v26 keys];
        uint64_t v51 = [v27 countByEnumeratingWithState:&v59 objects:v76 count:16];
        if (v51)
        {
          uint64_t v28 = *(void *)v60;
          uint64_t v47 = v22;
          uint64_t v48 = *(void *)v60;
          double v54 = v27;
          do
          {
            for (uint64_t m = 0; m != v51; ++m)
            {
              if (*(void *)v60 != v28) {
                objc_enumerationMutation(v27);
              }
              uint64_t v30 = *(void **)(*((void *)&v59 + 1) + 8 * m);
              int v31 = [v30 representedString];
              if ([v30 displayType] == 7)
              {
                uint64_t v32 = [v30 secondaryRepresentedStrings];
                uint64_t v33 = [v32 count];

                if (v33)
                {
                  uint64_t v34 = [v30 secondaryRepresentedStrings];
                  double v35 = [v34 firstObject];
                  uint64_t v36 = [v31 stringByAppendingString:v35];

                  int v31 = (void *)v36;
                }
              }
              double v37 = UIKeyboardGetCurrentInputMode();
              double v38 = UIKeyboardRomanAccentVariants((uint64_t)v31, v37, 7);
              BOOL v39 = [v38 objectForKey:@"Strings"];

              long long v57 = 0u;
              long long v58 = 0u;
              long long v55 = 0u;
              long long v56 = 0u;
              id v23 = v39;
              uint64_t v40 = [v23 countByEnumeratingWithState:&v55 objects:v75 count:16];
              if (v40)
              {
                uint64_t v41 = v40;
                uint64_t v42 = *(void *)v56;
                while (2)
                {
                  for (uint64_t n = 0; n != v41; ++n)
                  {
                    if (*(void *)v56 != v42) {
                      objc_enumerationMutation(v23);
                    }
                    if ([*(id *)(*((void *)&v55 + 1) + 8 * n) isEqualToString:v4])
                    {
                      id v44 = v30;

                      id v7 = v49;
                      goto LABEL_46;
                    }
                  }
                  uint64_t v41 = [v23 countByEnumeratingWithState:&v55 objects:v75 count:16];
                  if (v41) {
                    continue;
                  }
                  break;
                }
              }

              double v27 = v54;
              uint64_t v28 = v48;
            }
            id v20 = v50;
            uint64_t v24 = v46;
            uint64_t v22 = v47;
            uint64_t v51 = [v54 countByEnumeratingWithState:&v59 objects:v76 count:16];
          }
          while (v51);
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v63 objects:v77 count:16];
      id v7 = v49;
    }
    while (v22);
  }
  else
  {
    id v23 = 0;
  }

  NSLog(&cfstr_CouldnTFindKey.isa, v4);
  id v44 = 0;
LABEL_46:

  return v44;
}

- (id)keyplaneForKey:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UIKeyboardLayoutStar *)self keyboard];
  uint64_t v6 = [v5 keyplaneForKey:v4];

  return v6;
}

- (id)keyplaneNamed:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [(UIKeyboardLayoutStar *)self keyboard];
  uint64_t v6 = [v5 subtreeWithName:v4];

  return v6;
}

- (void)changeToKeyplane:(id)a3
{
  id v4 = [a3 name];
  [(UIKeyboardLayoutStar *)self setKeyplaneName:v4];

  BOOL v5 = [(UIKBTree *)self->_keyplane isShiftKeyplane];
  id v6 = +[UIKeyboardImpl activeInstance];
  if (v5 != [v6 isShifted])
  {
    [v6 setShift:v5];
    [v6 setShiftPreventAutoshift:1];
    [v6 forceShiftUpdate];
  }
}

- (void)switchKeyplane:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardLayoutStar *)self keyplaneNameForRevertAfterTouch];
  [(UIKeyboardLayoutStar *)self setPreTouchKeyplaneName:v5];

  self->_revertKeyplaneAfterTouch = 0;
  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 keyActivated];

  [(UIKeyboardLayoutStar *)self setKeyplaneName:v4];
  [(UIKeyboardLayoutStar *)self setActiveKey:0];
}

- (CGPoint)applyError:(CGPoint)a3 toKey:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [a4 frame];
  double v11 = x + v8 + v7 * 0.5;
  double v12 = y + v10 + v9 * 0.5;
  [(UIView *)self bounds];
  double MinX = CGRectGetMinX(v28);
  [(UIView *)self bounds];
  if (v11 >= MinX)
  {
    if (v11 <= CGRectGetMaxX(*(CGRect *)&v14)) {
      goto LABEL_6;
    }
    [(UIView *)self bounds];
    double MaxX = CGRectGetMaxX(v29);
  }
  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v14);
  }
  double v11 = MaxX;
LABEL_6:
  [(UIView *)self bounds];
  double MinY = CGRectGetMinY(v30);
  [(UIView *)self bounds];
  if (v12 < MinY)
  {
    double MaxY = CGRectGetMinY(*(CGRect *)&v20);
LABEL_10:
    double v12 = MaxY;
    goto LABEL_11;
  }
  if (v12 > CGRectGetMaxY(*(CGRect *)&v20))
  {
    [(UIView *)self bounds];
    double MaxY = CGRectGetMaxY(v31);
    goto LABEL_10;
  }
LABEL_11:
  double v25 = v11;
  double v26 = v12;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (id)simulateTouch:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:");
  double v7 = v6;
  if (v6)
  {
    double v8 = [v6 representedString];
  }
  else
  {
    double v8 = @"<no key>";
  }
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, x, y);
  double v10 = v9;
  double v12 = v11;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v14 = [(UIView *)self window];
  uint64_t v15 = +[UIKeyboardSyntheticTouch syntheticTouchWithPoint:timestamp:window:](UIKeyboardSyntheticTouch, "syntheticTouchWithPoint:timestamp:window:", v14, v10, v12, Current);

  uint64_t v16 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  [(UIKeyboardLayout *)self touchesBegan:v16 withEvent:0];

  [v15 setPhase:3];
  double v17 = [MEMORY[0x1E4F1CAD0] setWithObject:v15];
  [(UIKeyboardLayout *)self touchesEnded:v17 withEvent:0];

  return v8;
}

- (id)simulateTouchForCharacter:(id)a3 errorVector:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6
{
  double y = a4.y;
  double x = a4.x;
  id v11 = a3;
  double v12 = [(UIKeyboardLayoutStar *)self baseKeyForString:v11];
  uint64_t v13 = v12;
  if (v12)
  {
    if (a5)
    {
      if (!a6)
      {
        uint64_t v14 = [v12 representedString];
        char v15 = [v14 isEqualToString:v11];

        if ((v15 & 1) == 0)
        {
          NSLog(&cfstr_InsertingVaria.isa, v11);
          uint64_t v16 = +[UIKeyboardImpl activeInstance];
          [v16 addInputString:v11 withFlags:2];

          double v17 = (__CFString *)v11;
          goto LABEL_12;
        }
      }
LABEL_7:
      uint64_t v20 = [(UIKeyboardLayoutStar *)self keyplaneForKey:v13];
      [(UIKeyboardLayoutStar *)self changeToKeyplane:v20];
      -[UIKeyboardLayoutStar applyError:toKey:](self, "applyError:toKey:", v13, x, y);
      double v22 = v21;
      double v24 = v23;
      double v25 = -[UIKeyboardLayoutStar keyHitTestContainingPoint:](self, "keyHitTestContainingPoint:");
      double v26 = v25;
      if (v25)
      {
        double v17 = [v25 representedString];
      }
      else
      {
        double v17 = @"<no key>";
      }
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", 0, v22, v24);
      double v28 = v27;
      double v30 = v29;
      double Current = CFAbsoluteTimeGetCurrent();
      uint64_t v32 = [(UIView *)self window];
      uint64_t v33 = +[UIKeyboardSyntheticTouch syntheticTouchWithPoint:timestamp:window:](UIKeyboardSyntheticTouch, "syntheticTouchWithPoint:timestamp:window:", v32, v28, v30, Current);

      uint64_t v34 = [MEMORY[0x1E4F1CAD0] setWithObject:v33];
      [(UIKeyboardLayout *)self touchesBegan:v34 withEvent:0];

      [v33 setPhase:3];
      double v35 = [MEMORY[0x1E4F1CAD0] setWithObject:v33];
      [(UIKeyboardLayout *)self touchesEnded:v35 withEvent:0];

      goto LABEL_12;
    }
    double v18 = [v12 representedString];
    char v19 = [v18 isEqualToString:v11];

    if (v19) {
      goto LABEL_7;
    }
  }
  double v17 = 0;
LABEL_12:

  return v17;
}

- (void)fadeWithInvocation:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke;
  v8[3] = &unk_1E52D9F70;
  v8[4] = self;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke_2;
  v6[3] = &unk_1E52DA660;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  +[UIView animateWithDuration:117571584 delay:v8 options:v6 animations:0.2 completion:0.0];
}

uint64_t __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __43__UIKeyboardLayoutStar_fadeWithInvocation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 start];
}

- (id)currentKeyplane
{
  return self->_keyplane;
}

- (id)currentKeyplaneView
{
  return self->_keyplaneView;
}

- (void)updateGlobeKeyAndLayoutOriginBeforeSnapshotForInputView:(id)a3
{
  id v10 = a3;
  if (-[UIView isDescendantOfView:](self, "isDescendantOfView:"))
  {
    id v4 = [(UIKeyboardLayoutStar *)self activeKey];
    [(UIKeyboardLayoutStar *)self setState:2 forKey:v4];

    [v10 size];
    double v6 = v5;
    [(UIView *)self frame];
    if (v6 != CGRectGetMaxY(v12))
    {
      [(UIView *)self frame];
      double MinX = CGRectGetMinX(v13);
      [v10 size];
      double v9 = v8;
      [(UIView *)self frame];
      -[UIView setFrameOrigin:](self, "setFrameOrigin:", MinX, v9 - CGRectGetMaxY(v14));
    }
  }
}

- (BOOL)keyplaneContainsDismissKey
{
  uint64_t v2 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Dismiss-Key"];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)keyplaneContainsEmojiKey
{
  if ([(UIKeyboardLayoutStar *)self showsDedicatedEmojiKeyAlongsideGlobeButton])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    id v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:@"Emoji"];
    if (v4) {
      BOOL v3 = ![(UIKeyboardLayoutStar *)self shouldMergeKey:v4];
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)isEmojiKeyplane
{
  if (_UIApplicationIsStickerPickerService()) {
    BOOL v3 = @"Emoji-InputView-Key";
  }
  else {
    BOOL v3 = @"Emoji-International-Key";
  }
  id v4 = [(UIKBTree *)self->_keyplane firstCachedKeyWithName:v3];

  return v4 != 0;
}

- (BOOL)is10KeyRendering
{
  return ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF0000) == 0x10000
      || ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF0000) == 0x210000
      || ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF0000) == 2228224;
}

- (void)triggerSpaceKeyplaneSwitchIfNecessary
{
  if (!self->_isContinuousPathUnderway)
  {
    id v6 = [(UIKeyboardLayoutStar *)self currentKeyplane];
    BOOL v3 = [v6 firstCachedKeyWithName:@"Space-Key"];
    if (([(UIKeyboardLayoutStar *)self upActionFlagsForKey:v3] & 0x100) != 0
      && (objc_msgSend(v6, "supportsType:", -[UITextInputTraits keyboardType](self->super._inputTraits, "keyboardType")) & 1) == 0)
    {
      id v4 = [v6 alternateKeyplaneName];
      [(UIKeyboardLayoutStar *)self setKeyplaneName:v4];

      double v5 = [(UIKeyboardLayoutStar *)self keyplane];
      -[UIKeyboardLayoutStar setShift:](self, "setShift:", [v5 isShiftKeyplane]);
    }
  }
}

- (void)typingStyleEstimator:(id)a3 didChangeTypingStyleEstimate:(unint64_t)a4
{
  if ([(UIKeyboardLayoutStar *)self _allowPaddle])
  {
    id v10 = [(UIKeyboardLayoutStar *)self keyplaneFactory];
    BOOL v6 = (a4 != 3) == [v10 allowsPaddles];
    id v7 = v10;
    if (!v6)
    {
      [v10 setAllowsPaddles:a4 != 3];
      double v8 = [(UIKeyboardLayoutStar *)self activeKey];
      double v9 = [(UIKeyboardLayoutStar *)self touchInfoForKey:v8];
      if (![v9 delayed] || objc_msgSend(v8, "interactionType") != 4) {
        [(UIKBKeyplaneView *)self->_keyplaneView purgeActiveKeyViews];
      }

      id v7 = v10;
    }
  }
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (NSString)keyboardName
{
  return self->_keyboardName;
}

- (void)setKeyboardName:(id)a3
{
}

- (NSString)keyplaneName
{
  return self->_keyplaneName;
}

- (UIKBTree)activeKey
{
  return self->_activeKey;
}

- (void)setActiveKey:(id)a3
{
}

- (BOOL)shift
{
  return self->_shift;
}

- (BOOL)autoShift
{
  return self->_autoshift;
}

- (void)setAutoShift:(BOOL)a3
{
  self->_autoBOOL shift = a3;
}

- (BOOL)didLongPress
{
  return self->_didLongPress;
}

- (void)setDidLongPress:(BOOL)a3
{
  self->_BOOL didLongPress = a3;
}

- (BOOL)showsInternationalKey
{
  return self->_showIntlKey;
}

- (BOOL)showsDictationKey
{
  return self->_showDictationKey;
}

- (NSString)localizedInputKey
{
  return self->_localizedInputKey;
}

- (void)setLocalizedInputKey:(id)a3
{
}

- (int)playKeyClickSoundOn
{
  return self->playKeyClickSoundOn;
}

- (void)setPlayKeyClickSoundOn:(int)a3
{
  self->playKeyClickSoundOuint64_t n = a3;
}

- (NSString)preTouchKeyplaneName
{
  return self->_preTouchKeyplaneName;
}

- (void)setPreTouchKeyplaneName:(id)a3
{
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIView)modalDisplayView
{
  return self->_modalDisplayView;
}

- (void)setModalDisplayView:(id)a3
{
}

- (UISelectionFeedbackGenerator)slideBehaviour
{
  return self->_slideBehaviour;
}

- (void)setSlideBehaviour:(id)a3
{
}

- (UIKeyboardLayoutStarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UIKeyboardLayoutStarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)lastTwoFingerTapTimestamp
{
  return self->_lastTwoFingerTapTimestamp;
}

- (void)setLastTwoFingerTapTimestamp:(double)a3
{
  self->_lastTwoFingerTapTimestamp = a3;
}

- (BOOL)preventPaddlesForPointerTouches
{
  return self->_preventPaddlesForPointerTouches;
}

- (void)setPreventPaddlesForPointerTouches:(BOOL)a3
{
  self->_preventPaddlesForPointerTouches = a3;
}

- (BOOL)muteNextKeyClickSound
{
  return self->_muteNextKeyClickSound;
}

- (void)setMuteNextKeyClickSound:(BOOL)a3
{
  self->_muteNextKeyClickSound = a3;
}

- (UITextCursorAssertion)blinkAssertion
{
  return self->_blinkAssertion;
}

- (void)setBlinkAssertion:(id)a3
{
}

- (UIKeyboardKeyplaneTransitionDelegate)splitKeyplaneTransitionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_splitKeyplaneTransitionDelegate);
  return (UIKeyboardKeyplaneTransitionDelegate *)WeakRetained;
}

- (void)setSplitKeyplaneTransitionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_splitKeyplaneTransitionDelegate);
  objc_storeStrong((id *)&self->_blinkAssertion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slideBehaviour, 0);
  objc_storeStrong((id *)&self->_modalDisplayView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_liveKeyplaneConstraints, 0);
  objc_storeStrong((id *)&self->_liveKeyplaneView, 0);
  objc_storeStrong((id *)&self->_dictationReplacementKeycap, 0);
  objc_storeStrong((id *)&self->_keyplaneTransformationAreaView, 0);
  objc_storeStrong((id *)&self->_pathEffectViewConstraints, 0);
  objc_storeStrong((id *)&self->_pathEffectView, 0);
  objc_storeStrong((id *)&self->_pathEffectGlowView, 0);
  objc_storeStrong((id *)&self->_keyplaneTransformations, 0);
  objc_storeStrong((id *)&self->_biasEscapeButtonRightConstraint, 0);
  objc_storeStrong((id *)&self->_biasEscapeButtonLeftConstraint, 0);
  objc_storeStrong((id *)&self->_biasEscapeButton, 0);
  objc_storeStrong((id *)&self->_resizingKeyplaneCoordinator, 0);
  objc_storeStrong((id *)&self->_extendedTouchInfoMap, 0);
  objc_storeStrong((id *)&self->_gestureKeyboardIntroduction, 0);
  objc_storeStrong((id *)&self->_lastInputMode, 0);
  objc_storeStrong((id *)&self->_progressiveCandidateUpdateTimer, 0);
  objc_storeStrong((id *)&self->_prevProgressiveCandidateRequestTime, 0);
  objc_storeStrong((id *)&self->_prevTouchMoreKeyTime, 0);
  objc_storeStrong((id *)&self->_homeRowHint, 0);
  objc_storeStrong((id *)&self->_rightSideReachability, 0);
  objc_storeStrong((id *)&self->_leftSideReachability, 0);
  objc_storeStrong((id *)&self->_rightKeySet, 0);
  objc_storeStrong((id *)&self->_leftKeySet, 0);
  objc_storeStrong((id *)&self->_passcodeRenderConfig, 0);
  objc_storeStrong((id *)&self->_typingSpeedLogger, 0);
  objc_storeStrong((id *)&self->_keysUnderIndicator, 0);
  objc_storeStrong((id *)&self->_dismissModalDoubleConsonantKeys, 0);
  objc_storeStrong((id *)&self->_dimKeyboardImageView, 0);
  objc_storeStrong(&self->_touchInfo, 0);
  objc_storeStrong((id *)&self->_flickPopuptimer, 0);
  objc_storeStrong((id *)&self->_compositeImages, 0);
  objc_storeStrong((id *)&self->_flickPopupView, 0);
  objc_storeStrong((id *)&self->_multitapKey, 0);
  objc_storeStrong((id *)&self->_multitapAction, 0);
  objc_storeStrong((id *)&self->_preRotateKeyplaneName, 0);
  objc_storeStrong((id *)&self->_layoutTag, 0);
  objc_storeStrong((id *)&self->_delayedCentroidUpdate, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_upSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_leftSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_rightSwipeRecognizer, 0);
  objc_storeStrong((id *)&self->_preTouchKeyplaneName, 0);
  objc_storeStrong(&self->_deleteTarget, 0);
  objc_storeStrong(&self->_returnTarget, 0);
  objc_storeStrong(&self->_spaceTarget, 0);
  objc_storeStrong((id *)&self->_hasAccents, 0);
  objc_storeStrong((id *)&self->_accentInfo, 0);
  objc_storeStrong((id *)&self->_localizedInputKey, 0);
  objc_storeStrong((id *)&self->_validInputStrings, 0);
  objc_storeStrong((id *)&self->_allKeyplaneKeycaps, 0);
  objc_storeStrong((id *)&self->_allKeyplaneViews, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
  objc_storeStrong((id *)&self->_emojiKeyManager, 0);
  objc_storeStrong((id *)&self->_keyViewAnimator, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_keyplaneView, 0);
  objc_storeStrong((id *)&self->_inactiveLanguageIndicator, 0);
  objc_storeStrong((id *)&self->_activeKey, 0);
  objc_storeStrong((id *)&self->_keyplaneName, 0);
  objc_storeStrong((id *)&self->_keyboardName, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
}

- (id)keyWithRepresentedString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v5 = [(UIKBTree *)self->_keyplane keys];
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 interactionType] == 16)
        {
          id v10 = [v9 fullRepresentedString];
          char v11 = [v10 _containsSubstring:v4];

          if (v11) {
            goto LABEL_12;
          }
        }
        CGRect v12 = [v9 representedString];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
LABEL_12:
          id v6 = v9;
          goto LABEL_13;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v6;
}

- (CGRect)frameForKeyWithRepresentedString:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  double v5 = [(UIView *)self->_keyplaneView subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        char v11 = [v10 key];
        CGRect v12 = [v11 representedString];
        if ([v12 isEqualToString:v4])
        {
          char v13 = [v10 superview];

          if (v13)
          {
            [v10 bounds];
            -[UIView convertRect:fromView:](self, "convertRect:fromView:", v10);
            double v23 = v22;
            double v25 = v24;
            double v27 = v26;
            double v29 = v28;

            goto LABEL_22;
          }
        }
        else
        {
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v7);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  CGRect v14 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v39;
    while (2)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v39 != v17) {
          objc_enumerationMutation(v14);
        }
        char v19 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v20 = [v19 representedString];
        char v21 = [v20 isEqualToString:v4];

        if (v21)
        {
          [v19 frame];
          double v23 = v30;
          double v25 = v31;
          double v27 = v32;
          double v29 = v33;

          goto LABEL_22;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  double v23 = *MEMORY[0x1E4F1DB20];
  double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v29 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_22:

  double v34 = v23;
  double v35 = v25;
  double v36 = v27;
  double v37 = v29;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)frameForLastKeyWithRepresentedString:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v5 = [(UIKBTree *)self->_keyplane keys];
  uint64_t v6 = [v5 reverseObjectEnumerator];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        CGRect v12 = [v11 representedString];
        char v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          [v11 frame];
          double v14 = v18;
          double v15 = v19;
          double v16 = v20;
          double v17 = v21;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  double v14 = *MEMORY[0x1E4F1DB20];
  double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
LABEL_11:

  double v22 = v14;
  double v23 = v15;
  double v24 = v16;
  double v25 = v17;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)popupKeyViews
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [(UIView *)self->_keyplaneView subviews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 superview];
        char v11 = [v9 window];
        if (v10 == v11)
        {
          CGRect v12 = [v9 window];
          int v13 = [v12 _isTextEffectsWindow];

          if (v13) {
            [v3 addObject:v9];
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setKeyForTouchInfo:(id)a3 key:(id)a4
{
}

- (id)flickPopupStringForKey:(id)a3 withString:(id)a4
{
  id v6 = a4;
  int v7 = [a3 variantType];
  uint64_t v8 = v6;
  if (v7 == 8)
  {
    uint64_t v8 = [(UIKeyboardLayoutStar *)self _keyplaneVariantsKeyForString:v6];
  }
  return v8;
}

- (id)flickStringForInputKey:(id)a3 direction:(int64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (v6)
  {
    int v8 = [v6 state];
    if ((unint64_t)(a4 + 3) > 1 || v8 == 16)
    {
      uint64_t v9 = [v7 displayString];
      int v13 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v7 withString:v9];
      CGRect v12 = getFlickString(v13, a4);
    }
    else
    {
      uint64_t v9 = [v7 fullRepresentedString];
      if ([v9 length])
      {
        uint64_t v10 = objc_msgSend(v9, "rangeOfComposedCharacterSequenceAtIndex:", self->_multitapCount % (unint64_t)objc_msgSend(v9, "length"));
        CGRect v12 = objc_msgSend(v9, "substringWithRange:", v10, v11);
      }
      else
      {
        CGRect v12 = 0;
      }
    }
  }
  else
  {
    CGRect v12 = 0;
  }

  return v12;
}

- (void)populateFlickPopupsForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v34 = v4;
    uint64_t v5 = [v4 displayString];
    id v6 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v34 withString:v5];
    if (v6)
    {
      int v7 = UIKeyboardGetCurrentInputMode();
      int v8 = TIInputModeGetNormalizedIdentifier();

      uint64_t v9 = UIKeyboardRomanAccentVariants((uint64_t)v6, v8, 38);
      uint64_t v10 = [v9 objectForKey:@"Direction"];
      int v11 = [v10 isEqualToString:@"flick"];

      if (v11) {
        id v12 = v9;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }

    if (v12)
    {
      int v13 = [v12 objectForKey:@"Strings"];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        long long v15 = [v12 objectForKey:@"Strings"];
        long long v16 = [v12 objectForKey:@"Keycaps"];
        long long v17 = [v12 objectForKey:@"Direction"];
        unint64_t v18 = [v15 count];
        if (v18 <= [v16 count]) {
          double v19 = v15;
        }
        else {
          double v19 = v16;
        }
        int v20 = [v19 count];
        if (v15 && v16 && v17)
        {
          int v21 = v20;
          double v32 = v17;
          id v33 = v12;
          double v22 = [MEMORY[0x1E4F1CA48] array];
          if (v21 >= 1)
          {
            uint64_t v23 = 0;
            uint64_t v24 = v21;
            do
            {
              double v25 = [v16 objectAtIndex:v23];
              if ([v25 length])
              {
                long long v26 = (void *)[v34 copy];
                [v26 setState:2];
                long long v27 = [v15 objectAtIndex:v23];
                [v26 setRepresentedString:v27];

                [v26 setDisplayString:v25];
                [v26 setDisplayType:0];
                long long v28 = NSString;
                long long v29 = [v34 name];
                double v30 = [v26 representedString];
                uint64_t v31 = [v28 stringWithFormat:@"%@/%@", v29, v30];
                [v26 setName:v31];

                [v26 setOverrideDisplayString:0];
              }
              else
              {
                long long v26 = [MEMORY[0x1E4F1CA98] null];
              }
              [v22 addObject:v26];

              ++v23;
            }
            while (v24 != v23);
          }
          [v34 setSubtrees:v22];

          long long v17 = v32;
          id v12 = v33;
        }
      }
    }

    id v4 = v34;
  }
}

- (BOOL)handleFlick:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 touch];
  id v6 = [self->_touchInfo touch];

  if (v5 == v6 && [(UIKBScreenTraits *)self->super._screenTraits idiom] != 3)
  {
    uint64_t v9 = [v4 key];
    uint64_t v10 = [v9 displayString];
    [v4 initialPoint];
    double v12 = v11;
    double v14 = v13;
    long long v15 = [v4 touch];
    [v15 locationInView:self];
    double v17 = v16;
    double v19 = v18;

    uint64_t v20 = UIKBGetFlickDirection(v12, v14, v17, v19);
    if (v20 == -3)
    {
      self->_isOutOfBounds = 0;
      if ([v9 state] == 16)
      {
        int v21 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v9 withString:v10];
        double v22 = getFlickPopupInfoArray(v21, @"Keycaps");

        [(UIKeyboardLayoutStar *)self showPopupView:-1 withKey:v9 popupInfo:v22 force:0];
      }
      else
      {
        if ([v9 state] != 20) {
          goto LABEL_35;
        }
        uint64_t v32 = [v9 flickDirection] >= 0 ? -1 : -3;
        [v9 setFlickDirection:v32];
        [(UIKeyboardLayoutStar *)self setState:8 forKey:v9];
        flickPopupView = self->_flickPopupView;
        if (!flickPopupView) {
          goto LABEL_35;
        }
        [(UIView *)flickPopupView removeFromSuperview];
        double v22 = self->_flickPopupView;
        self->_flickPopupView = 0;
      }
LABEL_34:

LABEL_35:
      BOOL v7 = 1;
      goto LABEL_4;
    }
    uint64_t v23 = v20;
    flickPopuptimer = self->_flickPopuptimer;
    if (flickPopuptimer)
    {
      [(NSTimer *)flickPopuptimer invalidate];
      double v25 = self->_flickPopuptimer;
      self->_flickPopuptimer = 0;
    }
    long long v26 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v9 withString:v10];
    double v22 = getFlickString(v26, v23);

    if ([v9 state] == 16)
    {
      long long v27 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v9 withString:v10];
      long long v28 = getFlickPopupInfoArray(v27, @"Keycaps");

      self->_isOutOfBounds = isFlickOutOfBounds(v12, v14, v17, v19);
      if ([(UIKeyboardLayoutStar *)self useCrescendoLayout] && self->_liveKeyplaneView)
      {
        uint64_t v29 = [v9 selectedVariantIndex];
        char v30 = objc_opt_respondsToSelector();
        liveKeyplaneView = self->_liveKeyplaneView;
        if (v30) {
          -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:isDragging:](liveKeyplaneView, "changingSelectedVariantForKey:atPoint:isDragging:", v9, 1, v17, v19);
        }
        else {
          -[TUIKeyplaneView changingSelectedVariantForKey:atPoint:](liveKeyplaneView, "changingSelectedVariantForKey:atPoint:", v9, v17, v19);
        }
        if ([v9 selectedVariantIndex] != v29) {
          self->_BOOL selectedVariantIndexChanged = 1;
        }
      }
      if (!v22 || ![v22 length]) {
        uint64_t v23 = -1;
      }
      [(UIKeyboardLayoutStar *)self showPopupView:v23 withKey:v9 popupInfo:v28 force:0];
    }
    else if (v22 && [v22 length])
    {
      long long v28 = [v4 key];
      [(UIKeyboardLayoutStar *)self showFlickView:v23 withKey:v28 flickString:v22];
    }
    else
    {
      [v9 setFlickDirection:-3];
      [(UIKeyboardLayoutStar *)self setState:2 forKey:v9];
      id v34 = self->_flickPopupView;
      if (!v34) {
        goto LABEL_34;
      }
      [(UIView *)v34 removeFromSuperview];
      long long v28 = self->_flickPopupView;
      self->_flickPopupView = 0;
    }

    goto LABEL_34;
  }
  BOOL v7 = 0;
LABEL_4:

  return v7;
}

- (void)showFlickView:(int64_t)a3 withKey:(id)a4 flickString:(id)a5
{
  id v7 = a4;
  if ([v7 flickDirection] != a3)
  {
    [(UIKeyboardLayoutStar *)self populateFlickPopupsForKey:v7];
    [v7 setFlickDirection:a3];
    [(UIKeyboardLayoutStar *)self setState:20 forKey:v7];
  }
}

- (void)handlePopupView:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  if (qword_1EB25ABE8 != -1) {
    dispatch_once(&qword_1EB25ABE8, &__block_literal_global_1975);
  }
  uint64_t v5 = [(UIKeyboardLayout *)self taskQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handlePopupView___block_invoke_3;
  v7[3] = &unk_1E52FA5F8;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  objc_copyWeak(&v10, &location);
  [v5 addTask:v7 breadcrumb:qword_1EB25ABE0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __75__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handlePopupView___block_invoke()
{
  uint64_t v0 = [&__block_literal_global_1977 copy];
  uint64_t v1 = (void *)qword_1EB25ABE0;
  qword_1EB25ABE0 = v0;
}

uint64_t __75__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handlePopupView___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __75__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handlePopupView___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 1112))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained handlePopupView];
    }

    id v3 = v6;
  }
  [v3 returnExecutionToParent];
}

- (void)handlePopupView
{
  [(NSTimer *)self->_flickPopuptimer invalidate];
  flickPopuptimer = self->_flickPopuptimer;
  self->_flickPopuptimer = 0;

  id v7 = [self->_touchInfo key];
  id v4 = [v7 displayString];
  uint64_t v5 = [(UIKeyboardLayoutStar *)self flickPopupStringForKey:v7 withString:v4];
  id v6 = getFlickPopupInfoArray(v5, @"Keycaps");

  if (v6) {
    [(UIKeyboardLayoutStar *)self showPopupView:-1 withKey:v7 popupInfo:v6 force:1];
  }
}

- (void)handleDismissFlickView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_inDealloc)
  {
    [(UIKeyboardLayoutStar *)self handleDismissFlickView];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke;
    v6[3] = &unk_1E52D9F98;
    void v6[4] = self;
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

void __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1EB25ABF8 != -1) {
    dispatch_once(&qword_1EB25ABF8, &__block_literal_global_1979_0);
  }
  uint64_t v2 = [*(id *)(a1 + 32) taskQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke_4;
  v5[3] = &unk_1E52FA5F8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  objc_copyWeak(&v8, &location);
  [v2 addTask:v5 breadcrumb:qword_1EB25ABF0];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke_2()
{
  uint64_t v0 = [&__block_literal_global_1981 copy];
  uint64_t v1 = (void *)qword_1EB25ABF0;
  qword_1EB25ABF0 = v0;
}

uint64_t __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __82__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__handleDismissFlickView___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 1112))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained handleDismissFlickView];
    }

    id v3 = v6;
  }
  [v3 returnExecutionToParent];
}

- (void)handleDismissFlickView
{
  [(NSTimer *)self->_flickPopuptimer invalidate];
  flickPopuptimer = self->_flickPopuptimer;
  self->_flickPopuptimer = 0;

  [(UIView *)self->_flickPopupView removeFromSuperview];
  flickPopupView = self->_flickPopupView;
  self->_flickPopupView = 0;
}

- (void)dismissGestureKeyboardIntroduction
{
  gestureKeyboardIntroductiouint64_t n = self->_gestureKeyboardIntroduction;
  if (gestureKeyboardIntroduction)
  {
    [(UIGestureKeyboardIntroduction *)gestureKeyboardIntroduction dismissGestureKeyboardIntroduction];
    uint64_t v4 = self->_gestureKeyboardIntroduction;
    self->_gestureKeyboardIntroductiouint64_t n = 0;
  }
}

- (void)setKeyboardDim:(BOOL)a3 amount:(double)a4 withDuration:(double)a5
{
  BOOL v7 = a3;
  BOOL v9 = ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF00) != 0x7F00 && v7;
  dimKeyboardImageView = self->_dimKeyboardImageView;
  if (v9)
  {
    if (!dimKeyboardImageView)
    {
      double v11 = [UIKBDimmingView alloc];
      double v12 = [(UIView *)self superview];
      [v12 bounds];
      double v13 = -[UIKBDimmingView initWithFrame:](v11, "initWithFrame:");
      double v14 = self->_dimKeyboardImageView;
      self->_dimKeyboardImageView = v13;

      [(UIView *)self->_dimKeyboardImageView setAlpha:0.0];
      [(UIView *)self->_dimKeyboardImageView setHidden:1];
      long long v15 = [(UIView *)self superview];
      [v15 addSubview:self->_dimKeyboardImageView];

      dimKeyboardImageView = self->_dimKeyboardImageView;
    }
  }
  else if (!dimKeyboardImageView)
  {
    return;
  }
  [(UIView *)dimKeyboardImageView setScreenTraits:self->super._screenTraits];
  [(UIView *)self->_dimKeyboardImageView refreshStyleForKeyplane:self->_keyplane];
  double v16 = self->_dimKeyboardImageView;
  if (v16 && self->_keyboardImageViewIsDim != v9)
  {
    double v17 = [(UIView *)self superview];
    [v17 bounds];
    -[UIView setFrame:](v16, "setFrame:");

    [(UIView *)self->_dimKeyboardImageView setNeedsDisplay];
    if (v9)
    {
      if ([(UIView *)self->_dimKeyboardImageView isHidden])
      {
        [(UIView *)self->_dimKeyboardImageView setAlpha:0.0];
        [(UIView *)self->_dimKeyboardImageView setHidden:0];
      }
    }
    double v18 = [(UIView *)self superview];
    [v18 bringSubviewToFront:self->_dimKeyboardImageView];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke;
    v21[3] = &unk_1E52E8040;
    v21[4] = self;
    BOOL v22 = v9;
    *(double *)&void v21[5] = a4;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke_2;
    v19[3] = &unk_1E52E0478;
    void v19[4] = self;
    BOOL v20 = v9;
    +[UIView animateWithDuration:117440512 delay:v21 options:v19 animations:a5 completion:0.0];
    self->_keyboardImageViewIsDiuint64_t m = v9;
  }
}

uint64_t __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v1 = *(double *)(a1 + 40);
  }
  else {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1128) setAlpha:v1];
}

uint64_t __94__UIKeyboardLayoutStar_UIKeyboardLayoutJapanese50OnFlick__setKeyboardDim_amount_withDuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1128) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (void)setDisableInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  -[UIKeyboardLayout setDisableInteraction:](&v5, sel_setDisableInteraction_);
  [(UIKeyboardLayoutStar *)self setKeyboardDim:v3];
}

- (void)setPreferredHeight:(double)a3
{
  BOOL v5 = [(UIKeyboardLayout *)self hasPreferredHeight];
  [(UIKeyboardLayout *)self preferredHeight];
  double v7 = v6;
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v16 setPreferredHeight:a3];
  uint64_t v8 = [(UIView *)self window];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    id v10 = [(UIKeyboardLayoutStar *)self keyplane];
    double v11 = [(UIKeyboardLayoutStar *)self currentKeyplaneView];
    double v12 = [v11 keyplane];

    if (v10 == v12)
    {
      if (v5 != [(UIKeyboardLayout *)self hasPreferredHeight]
        || v5 && ([(UIKeyboardLayout *)self preferredHeight], v7 != v13))
      {
        keyplaneName = self->_keyplaneName;
        self->_keyplaneName = 0;
        long long v15 = keyplaneName;

        [(UIKeyboardLayoutStar *)self setKeyplaneName:v15];
      }
    }
  }
}

- (void)setKeyboardDim:(BOOL)a3
{
  BOOL v3 = a3;
  v17[3] = *MEMORY[0x1E4F143B8];
  BOOL v5 = ([(UIKBTree *)self->_keyplane visualStyling] & 0xFF00) != 0x7F00 && v3;
  if (v5)
  {
    [(UIKBScreenTraits *)self->super._screenTraits idiom];
    double v6 = 0.55;
    double v7 = 0.15;
    double v8 = 0.55;
  }
  else
  {
    double v6 = 1.0;
    if ([(UIKeyboardLayoutStar *)self isDeveloperGestureKeybaord]) {
      double v8 = 0.25;
    }
    else {
      double v8 = 1.0;
    }
    double v7 = 0.0;
  }
  v16[0] = &unk_1ED3F4AD0;
  BOOL v9 = [NSNumber numberWithDouble:v6];
  v17[0] = v9;
  v16[1] = &unk_1ED3F4AE8;
  id v10 = [NSNumber numberWithDouble:v8];
  v17[1] = v10;
  v16[2] = &unk_1ED3F4A88;
  double v11 = NSNumber;
  double v12 = [(UIKeyboardLayoutStar *)self renderConfig];
  [v12 lightKeycapOpacity];
  double v13 = objc_msgSend(v11, "numberWithDouble:");
  v17[2] = v13;
  double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

  liveKeyplaneView = self->_liveKeyplaneView;
  if (liveKeyplaneView) {
    [(TUIKeyplaneView *)liveKeyplaneView dimKeys:v14];
  }
  [(UIKBKeyplaneView *)self->_keyplaneView dimKeys:v14];
  [(UIKBResizingKeyplaneCoordinator *)self->_resizingKeyplaneCoordinator dimKeys:v14];
  if (!v5) {
    [(UIKeyboardLayoutStar *)self setKeyboardDim:0 amount:v6 withDuration:v7];
  }
}

- (void)showPopupView:(int64_t)a3 withKey:(id)a4 popupInfo:(id)a5 force:(BOOL)a6
{
  id v15 = a4;
  id v10 = a5;
  if (self->_isOutOfBounds) {
    a3 = -2;
  }
  if (a6 || [v15 flickDirection] != a3)
  {
    double v11 = [(UIKeyboardLayoutStar *)self slideBehaviour];

    if (!v11)
    {
      double v12 = objc_alloc_init(UISelectionFeedbackGenerator);
      [(UIKeyboardLayoutStar *)self setSlideBehaviour:v12];

      double v13 = [(UIKeyboardLayoutStar *)self slideBehaviour];
      [v13 userInteractionStarted];
    }
    double v14 = [(UIKeyboardLayoutStar *)self slideBehaviour];
    [v14 selectionChanged];

    [(UIKeyboardLayoutStar *)self populateFlickPopupsForKey:v15];
    [v15 setFlickDirection:a3];
    [(UIKeyboardLayoutStar *)self setKeyboardDim:1];
    [(UIKeyboardLayoutStar *)self setState:16 forKey:v15];
  }
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4 = a3;
  if ([v4 sizeDidChange])
  {
    [v4 size];
    -[UIView setSize:](self, "setSize:");
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  [(UIView *)&v5 _didChangeKeyplaneWithContext:v4];
}

- (id)keyplaneView:(id)a3 containingViewForActiveKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIKeyboardLayoutStar *)self delegate];
  if (v8
    && (BOOL v9 = (void *)v8,
        [(UIKeyboardLayoutStar *)self delegate],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    double v12 = [(UIKeyboardLayoutStar *)self delegate];
    double v13 = [v12 keyboardLayout:self containingViewForActiveKey:v7 inKeyplaneView:v6];
  }
  else
  {
    double v13 = 0;
  }

  return v13;
}

- (BOOL)_continuousPathSpotlightEffectEnabled
{
  uint64_t v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  char v3 = [v2 BOOLForPreferenceKey:*MEMORY[0x1E4FAE7D8]];

  return v3;
}

- (BOOL)_continuousPathModalPunctuationPlaneEnabled
{
  uint64_t v2 = UIKeyboardGetCurrentInputMode();
  char v3 = KBStarLayoutString(v2);

  if (([v3 isEqualToString:@"Korean"] & 1) != 0
    || ([v3 isEqualToString:@"Korean-With-QWERTY"] & 1) != 0
    || ([v3 isEqualToString:@"Thai"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    id v6 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    char v4 = [v6 BOOLForPreferenceKey:*MEMORY[0x1E4FAE7D0]];
  }
  return v4;
}

- (void)didMoveToWindow
{
  char v3 = [(UIView *)self _rootInputWindowController];

  if (v3)
  {
    [(UIKeyboardLayoutStar *)self removePathEffectViewConstraintsIfNeeded];
    pathEffectView = self->_pathEffectView;
    self->_pathEffectView = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardLayoutStar;
  [(UIKeyboardLayout *)&v5 didMoveToWindow];
}

- (UIKeyboardPathEffectView)pathEffectView
{
  v45[8] = *MEMORY[0x1E4F143B8];
  if (!self->_pathEffectView)
  {
    char v3 = [(UIView *)self _rootInputWindowController];

    if (v3)
    {
      char v4 = [(UIView *)self _rootInputWindowController];
      objc_super v5 = [v4 _pathEffectView];
      pathEffectView = self->_pathEffectView;
      self->_pathEffectView = v5;

      [(UIKeyboardLayoutStar *)self removePathEffectViewConstraintsIfNeeded];
      id v7 = [(UIView *)self->_pathEffectView topAnchor];
      uint64_t v8 = [(UIView *)self topAnchor];
      BOOL v9 = [v7 constraintEqualToAnchor:v8 constant:-100.0];

      id v10 = [(UIView *)self->_pathEffectView leftAnchor];
      char v11 = [(UIView *)self leftAnchor];
      long long v44 = [v10 constraintEqualToAnchor:v11 constant:-100.0];

      double v12 = [(UIView *)self->_pathEffectView bottomAnchor];
      double v13 = [(UIView *)self bottomAnchor];
      long long v43 = [v12 constraintEqualToAnchor:v13 constant:100.0];

      double v14 = [(UIView *)self->_pathEffectView rightAnchor];
      id v15 = [(UIView *)self rightAnchor];
      objc_super v16 = [v14 constraintEqualToAnchor:v15 constant:100.0];

      double v17 = v9;
      LODWORD(v18) = 1132068864;
      [v9 setPriority:v18];
      LODWORD(v19) = 1132068864;
      [v44 setPriority:v19];
      LODWORD(v20) = 1132068864;
      [v43 setPriority:v20];
      LODWORD(v21) = 1132068864;
      [v16 setPriority:v21];
      BOOL v22 = [(UIView *)self->_pathEffectView topAnchor];
      uint64_t v23 = [(UIView *)self window];
      uint64_t v24 = [v23 topAnchor];
      long long v42 = [v22 constraintGreaterThanOrEqualToAnchor:v24];

      double v25 = [(UIView *)self->_pathEffectView leftAnchor];
      long long v26 = [(UIView *)self window];
      long long v27 = [v26 leftAnchor];
      long long v28 = [v25 constraintGreaterThanOrEqualToAnchor:v27];

      uint64_t v29 = [(UIView *)self->_pathEffectView bottomAnchor];
      char v30 = [(UIView *)self window];
      uint64_t v31 = [v30 bottomAnchor];
      uint64_t v32 = [v29 constraintLessThanOrEqualToAnchor:v31];

      id v33 = [(UIView *)self->_pathEffectView rightAnchor];
      id v34 = [(UIView *)self window];
      double v35 = [v34 rightAnchor];
      double v36 = [v33 constraintLessThanOrEqualToAnchor:v35];

      v45[0] = v17;
      v45[1] = v44;
      v45[2] = v43;
      void v45[3] = v16;
      v45[4] = v42;
      v45[5] = v28;
      v45[6] = v32;
      v45[7] = v36;
      double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:8];
      pathEffectViewConstraints = self->_pathEffectViewConstraints;
      self->_pathEffectViewConstraints = v37;

      [MEMORY[0x1E4F5B268] activateConstraints:self->_pathEffectViewConstraints];
      long long v39 = [(UIView *)self window];
      [v39 layoutIfNeeded];
    }
  }
  long long v40 = self->_pathEffectView;
  return v40;
}

- (void)setPathEffectView:(id)a3
{
}

- (void)_transitionToContinuousPathState:(int64_t)a3 forTouchInfo:(id)a4
{
  id v10 = a4;
  BOOL v6 = [(UIKeyboardLayoutStar *)self _allowContinuousPathUI];
  id v7 = v10;
  if (v6)
  {
    [v10 setContinuousPathState:a3];
    if (a3 == 6)
    {
      uint64_t v8 = self;
      uint64_t v9 = 1;
    }
    else
    {
      if (a3 != 5)
      {
        id v7 = v10;
        if (a3 != 4) {
          goto LABEL_10;
        }
        [(UIKeyboardLayoutStar *)self didBeginContinuousPath];
        goto LABEL_9;
      }
      uint64_t v8 = self;
      uint64_t v9 = 0;
    }
    [(UIKeyboardLayoutStar *)v8 finishContinuousPathView:v9];
LABEL_9:
    id v7 = v10;
  }
LABEL_10:
}

- (void)transitionToPunctuationKeysVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v33[3] = *MEMORY[0x1E4F143B8];
  if (!self->_keyplaneTransformationAreaView)
  {
    objc_super v5 = [UIView alloc];
    [(UIView *)self bounds];
    BOOL v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
    keyplaneTransformationAreaView = self->_keyplaneTransformationAreaView;
    self->_keyplaneTransformationAreaView = v6;

    [(UIView *)self->_keyplaneTransformationAreaView setUserInteractionEnabled:0];
    [(UIView *)self addSubview:self->_keyplaneTransformationAreaView];
  }
  BOOL v19 = v3;
  if ([(UIKeyboardLayoutStar *)self _continuousPathModalPunctuationPlaneEnabled]&& self->_showsPunctuationKeysOnPrimaryKeyplane != v3)
  {
    [(UIKeyboardLayoutStar *)self cancelModalDoubleConsonantKeysTimer];
    uint64_t v9 = [(UIView *)self _rootInputWindowController];
    uint64_t v8 = [v9 inputViewSnapshotOfView:self->_keyplaneView afterScreenUpdates:0];

    [(UIView *)self->_keyplaneTransformationAreaView addSubview:v8];
    self->_showsPunctuationKeysOnPrimaryKeyplane = v3;
    [(UIKeyboardLayoutStar *)self reloadCurrentKeyplane];
    [(UIView *)self->_keyplaneView forceDisplayIfNeeded];
  }
  else
  {
    uint64_t v8 = 0;
  }
  v32[0] = &unk_1ED3F4B78;
  v32[1] = &unk_1ED3F4B48;
  v33[0] = &unk_1ED3F2018;
  v33[1] = &unk_1ED3F1FF8;
  v32[2] = &unk_1ED3F4A88;
  v33[2] = &unk_1ED3F2018;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:3];
  v30[0] = &unk_1ED3F4B78;
  v30[1] = &unk_1ED3F4B48;
  v31[0] = &unk_1ED3F1FF8;
  v31[1] = &unk_1ED3F1FF8;
  void v30[2] = &unk_1ED3F4A88;
  void v31[2] = &unk_1ED3F1FF8;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];
  v28[0] = &unk_1ED3F4B78;
  v28[1] = &unk_1ED3F4B48;
  v29[0] = &unk_1ED3F2018;
  v29[1] = &unk_1ED3F2018;
  void v28[2] = &unk_1ED3F4A88;
  double v12 = NSNumber;
  double v13 = [(UIKeyboardLayoutStar *)self renderConfig];
  [v13 lightKeycapOpacity];
  double v14 = objc_msgSend(v12, "numberWithDouble:");
  void v29[2] = v14;
  id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke;
  v22[3] = &unk_1E52E5B08;
  id v23 = v8;
  uint64_t v24 = self;
  BOOL v27 = v19;
  id v25 = v10;
  id v26 = v15;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke_2;
  v20[3] = &unk_1E52DC3A0;
  id v21 = v23;
  id v16 = v23;
  id v17 = v15;
  id v18 = v10;
  +[UIView animateWithDuration:6 delay:v22 options:v20 animations:0.23 completion:0.0];
}

uint64_t __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 688);
  uint64_t v3 = 48;
  if (!*(unsigned char *)(a1 + 64)) {
    uint64_t v3 = 56;
  }
  uint64_t v4 = *(void *)(a1 + v3);
  return [v2 dimKeys:v4];
}

uint64_t __75__UIKeyboardLayoutStar_ContinuousPath__transitionToPunctuationKeysVisible___block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) removeFromSuperview];
  }
  return result;
}

- (void)didBeginContinuousPath
{
  liveKeyplaneView = self->_liveKeyplaneView;
  if (liveKeyplaneView) {
    [(TUIKeyplaneView *)liveKeyplaneView deactivateKeys];
  }
  if ([(UIKeyboardLayoutStar *)self supportsSupplementalDisplayString])
  {
    uint64_t v4 = [(UIKBTree *)self->_keyboard name];
    if ([v4 containsString:@"Thai"])
    {
      BOOL shift = self->_shift;

      if (shift)
      {
        BOOL v6 = +[UIKeyboardImpl activeInstance];
        [v6 setShift:0];

        [(UIKeyboardLayoutStar *)self setShift:0];
      }
    }
    else
    {
    }
    [(UIKeyboardLayoutStar *)self cancelModalDoubleConsonantKeysTimer];
  }
  id v7 = [(UIKBKeyplaneView *)self->_keyplaneView activeKeyViews];

  if (v7) {
    [(UIKBKeyplaneView *)self->_keyplaneView deactivateKeys];
  }
  uint64_t v8 = [(UIKeyboardLayout *)self typingStyleEstimator];
  [v8 beganContinuousPath];

  id v9 = [(UIKeyboardLayoutStar *)self pathEffectView];
  self->_isContinuousPathUnderwadouble y = 1;
  [(UIKeyboardLayoutStar *)self transitionToPunctuationKeysVisible:1];
  if (self->_pathEffectGlowView) {
    goto LABEL_15;
  }
  if ([(UIKeyboardLayoutStar *)self _continuousPathSpotlightEffectEnabled])
  {
    id v10 = +[UIImage kitImageNamed:@"UIKeyboardContinuousPathEffectGlow.png"];
    char v11 = [[UIImageView alloc] initWithImage:v10];
    pathEffectGlowView = self->_pathEffectGlowView;
    self->_pathEffectGlowView = v11;

    [(UIView *)self->_pathEffectGlowView setUserInteractionEnabled:0];
  }
  if (self->_pathEffectGlowView)
  {
LABEL_15:
    double v13 = [(UIKBKeyplaneView *)self->_keyplaneView keyplaneMaskView];
    [v13 addSubview:self->_pathEffectGlowView];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke;
  v17[3] = &unk_1E52D9F70;
  void v17[4] = self;
  +[UIView animateWithDuration:50331648 delay:v17 options:0 animations:0.2 completion:0.0];
  double v14 = self->_pathEffectGlowView;
  if (v14)
  {
    [(UIView *)v14 setAlpha:0.0];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke_2;
    void v16[3] = &unk_1E52D9F70;
    v16[4] = self;
    id v15 = _Block_copy(v16);
    +[UIView animateWithDuration:50331648 delay:v15 options:0 animations:0.45 completion:0.0];
  }
}

void __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) renderConfig];
  int v3 = [v2 lightKeyboard];

  uint64_t v4 = [*(id *)(a1 + 32) pathEffectView];
  id v6 = v4;
  double v5 = 0.4;
  if (!v3) {
    double v5 = 0.5;
  }
  [v4 setAlpha:v5];
}

uint64_t __62__UIKeyboardLayoutStar_ContinuousPath__didBeginContinuousPath__block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _continuousPathSpotlightEffectEnabled];
  if (result)
  {
    int v3 = *(void **)(*(void *)(a1 + 32) + 1384);
    return [v3 setAlpha:1.0];
  }
  return result;
}

- (void)addContinuousPathPoint:(CGPoint)a3 withTimestamp:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if (self->_pathEffectGlowView)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__UIKeyboardLayoutStar_ContinuousPath__addContinuousPathPoint_withTimestamp___block_invoke;
    v9[3] = &unk_1E52DA520;
    v9[4] = self;
    *(double *)&v9[5] = a3.x + -150.0;
    *(double *)&void v9[6] = a3.y + -150.0;
    int64x2_t v10 = vdupq_n_s64(0x4072C00000000000uLL);
    +[UIView animateWithDuration:v9 animations:0.1];
  }
  id v7 = [(UIKeyboardLayoutStar *)self pathEffectView];
  uint64_t v8 = [(UIKeyboardLayoutStar *)self pathEffectView];
  -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
  objc_msgSend(v7, "addPoint:force:timestamp:");
}

uint64_t __77__UIKeyboardLayoutStar_ContinuousPath__addContinuousPathPoint_withTimestamp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1384), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)clearContinuousPathView
{
  self->_isContinuousPathUnderwadouble y = 0;
  [(UIKeyboardLayoutStar *)self transitionToPunctuationKeysVisible:0];
  int v3 = [(UIKeyboardLayoutStar *)self pathEffectView];
  [v3 buildOut];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__UIKeyboardLayoutStar_ContinuousPath__clearContinuousPathView__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.2];
}

void __63__UIKeyboardLayoutStar_ContinuousPath__clearContinuousPathView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pathEffectView];
  [v1 setAlpha:0.0];
}

- (void)finishContinuousPathView:(BOOL)a3
{
  BOOL v3 = a3;
  v17[3] = *MEMORY[0x1E4F143B8];
  double v5 = [(UIKeyboardLayout *)self typingStyleEstimator];
  id v6 = v5;
  if (v3) {
    [v5 cancelContinuousPath];
  }
  else {
    [v5 endedContinuousPath];
  }

  if (self->_isContinuousPathUnderway)
  {
    self->_isContinuousPathUnderwadouble y = 0;
    id v7 = +[UIKeyboardImpl activeInstance];
    [v7 updateChangeTimeAndIncrementCount];

    [(UIKeyboardLayoutStar *)self touchModalDoubleConsonantKeysTimer];
    uint64_t v8 = [(UIKeyboardLayoutStar *)self pathEffectView];
    [v8 buildOut];

    v16[0] = &unk_1ED3F4B78;
    v16[1] = &unk_1ED3F4B48;
    v17[0] = &unk_1ED3F2018;
    v17[1] = &unk_1ED3F2018;
    v16[2] = &unk_1ED3F4A88;
    id v9 = NSNumber;
    int64x2_t v10 = [(UIKeyboardLayoutStar *)self renderConfig];
    [v10 lightKeycapOpacity];
    char v11 = objc_msgSend(v9, "numberWithDouble:");
    v17[2] = v11;
    double v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__UIKeyboardLayoutStar_ContinuousPath__finishContinuousPathView___block_invoke;
    v14[3] = &unk_1E52D9F98;
    void v14[4] = self;
    id v15 = v12;
    id v13 = v12;
    +[UIView animateWithDuration:v14 animations:0.3];
  }
}

uint64_t __65__UIKeyboardLayoutStar_ContinuousPath__finishContinuousPathView___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 688) dimKeys:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1384);
  return [v2 setAlpha:0.0];
}

- (void)touchModalDoubleConsonantKeysTimer
{
  dismissModalDoubleConsonantKeys = self->_dismissModalDoubleConsonantKeys;
  if (!dismissModalDoubleConsonantKeys)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    double v5 = [v4 objectForKey:@"UIContinuousPathGuideTimer"];

    if (v5)
    {
      [v5 doubleValue];
      if (v6 == 0.0)
      {
        [(UIKeyboardLayoutStar *)self handleDoubleConsonantKeysTimerFired];
LABEL_8:

        dismissModalDoubleConsonantKeys = self->_dismissModalDoubleConsonantKeys;
        goto LABEL_9;
      }
      double v7 = v6;
    }
    else
    {
      double v7 = 2.0;
    }
    uint64_t v8 = [[UIDelayedAction alloc] initWithTarget:self action:sel_handleDoubleConsonantKeysTimerFired userInfo:0 delay:v7];
    id v9 = self->_dismissModalDoubleConsonantKeys;
    self->_dismissModalDoubleConsonantKeys = v8;

    goto LABEL_8;
  }
LABEL_9:
  [(UIDelayedAction *)dismissModalDoubleConsonantKeys touch];
}

- (void)handleDoubleConsonantKeysTimerFired
{
  BOOL v3 = self->_dismissModalDoubleConsonantKeys;
  objc_initWeak(&location, self);
  if (qword_1EB25AC08 != -1) {
    dispatch_once(&qword_1EB25AC08, &__block_literal_global_2026);
  }
  uint64_t v4 = [(UIKeyboardLayout *)self taskQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__UIKeyboardLayoutStar_ContinuousPath__handleDoubleConsonantKeysTimerFired__block_invoke_3;
  v6[3] = &unk_1E52FA5F8;
  double v5 = v3;
  double v7 = v5;
  uint64_t v8 = self;
  objc_copyWeak(&v9, &location);
  [v4 addTask:v6 breadcrumb:qword_1EB25AC00];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __75__UIKeyboardLayoutStar_ContinuousPath__handleDoubleConsonantKeysTimerFired__block_invoke()
{
  uint64_t v0 = [&__block_literal_global_2028_0 copy];
  id v1 = (void *)qword_1EB25AC00;
  qword_1EB25AC00 = v0;
}

uint64_t __75__UIKeyboardLayoutStar_ContinuousPath__handleDoubleConsonantKeysTimerFired__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
}

void __75__UIKeyboardLayoutStar_ContinuousPath__handleDoubleConsonantKeysTimerFired__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (*(void *)(a1 + 32) == *(void *)(*(void *)(a1 + 40) + 1144))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v5 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained transitionToPunctuationKeysVisible:0];
      [v5 cancelModalDoubleConsonantKeysTimer];
    }

    id v3 = v6;
  }
  [v3 returnExecutionToParent];
}

- (void)cancelModalDoubleConsonantKeysTimer
{
  [(UIDelayedAction *)self->_dismissModalDoubleConsonantKeys cancel];
  dismissModalDoubleConsonantKeys = self->_dismissModalDoubleConsonantKeys;
  self->_dismissModalDoubleConsonantKeys = 0;
}

@end