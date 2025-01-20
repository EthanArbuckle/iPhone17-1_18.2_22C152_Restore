@interface CACSpokenCommand
+ (double)defaultDelayBetweenCommands;
+ (id)attributedStringFromRecognizedCommandParameters:(id)a3 variantOverrides:(id)a4;
+ (id)languageModelFromCommandDictionary:(id)a3 tokenResolution:(id)a4 containsBuiltInIdentifier:(BOOL *)a5 error:(id *)a6;
+ (id)stringFromContextEvaluationDictionary:(id)a3 isCustom:(BOOL)a4;
+ (void)displayRecognizedMessageUsingAttributedString:(id)a3;
- (BOOL)_endDragForLabeledElement:(id)a3;
- (BOOL)_handleDisambiguationIfNeededWithBlock:(id)a3;
- (BOOL)_performActionOnTextSegment:(id)a3;
- (BOOL)_performActionOnTextSegmentRange:(id)a3;
- (BOOL)_performScrollingAction:(int)a3;
- (BOOL)_performUncheckedScrollAction:(int)a3 forScrollAreaSupportingAction:(int)a4;
- (BOOL)_startDragForLabeledElement:(id)a3;
- (BOOL)_updateGridWithNumberOfColumnsAndRows:(BOOL)a3;
- (BOOL)executedIndirectly;
- (BOOL)isCompletionDeterminedManually;
- (BOOL)isCustomCommand;
- (BOOL)isExectuting;
- (BOOL)isListening;
- (BOOL)isRestrictedForAAC;
- (BOOL)scrollToLandmark;
- (CACCommandRecognizer)commandRecognizer;
- (CACLanguageModel)languageModel;
- (CACLanguageModel)languageModelCache;
- (CACSpokenCommand)initWithProperties:(id)a3;
- (CACSpokenCommand)initWithSpokenCommand:(id)a3;
- (NSArray)strings;
- (NSDictionary)recognizedParameters;
- (NSMutableDictionary)contextEvaluation;
- (NSString)identifier;
- (SEL)action;
- (_NSRange)_rangeFromPreviousTextInsertionForAXElement:(id)a3;
- (id)_axActionOfType:(int64_t)a3 forElement:(id)a4;
- (id)_dragActionForLabeledElement:(id)a3;
- (id)_dropActionForLabeledElement:(id)a3;
- (id)_elementActionManager;
- (id)_markerRangeForTextSegment;
- (id)_markerRangeForTextSegmentRange;
- (id)_nBestListFromPreviousTextInsertionForAXElement:(id)a3;
- (id)_scrollAncestorsFromTopLevelElementsForAction:(int)a3 categorizedElements:(id *)a4;
- (id)_strippedPhraseStringsFromStrings:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_textSegmentCardinalNumber;
- (int64_t)_textSegmentCardinalNumberEnd;
- (int64_t)_textSegmentCardinalNumberStart;
- (unsigned)_getModifierFlag;
- (void)_activateKeyboardReturnKey:(id)a3;
- (void)_didShowOverlayWithHintIdentifier:(id)a3 hint:(id)a4;
- (void)_displayNumberedGridAtCurrentNumberOfColumnsAndRows;
- (void)_handleGestureWithBlock:(id)a3;
- (void)_handleTwoPointGestureWithBlock:(id)a3;
- (void)_postKeyboardEventsForModifierFlags:(unsigned int)a3 isKeyDown:(BOOL)a4;
- (void)_scrollWithCount:(unint64_t)a3 forAction:(int)a4;
- (void)_selectTextSegment:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5;
- (void)_selectTextSegmentRange:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5;
- (void)_updateGridWithNumberOfRows:(BOOL)a3;
- (void)activateAppLibrary;
- (void)activateAppSwitcher;
- (void)activateApplePay;
- (void)activateControlCenter;
- (void)activateDock;
- (void)activateHomeButton;
- (void)activateLockButton;
- (void)activateNotificationCenter;
- (void)activateSOS;
- (void)activateScreenItem;
- (void)activateSiri;
- (void)activateSpeakScreen;
- (void)activateSpotlight;
- (void)activateSysdiagnose;
- (void)activateTripleClick;
- (void)addSelectionToVocabulary:(id)a3;
- (void)alwaysShowOverlayGrid;
- (void)alwaysShowOverlayGridWithNumberOfColumns;
- (void)alwaysShowOverlayGridWithNumberOfRows;
- (void)alwaysShowOverlayNames;
- (void)alwaysShowOverlayNumbers;
- (void)applyFormat:(id)a3;
- (void)armApplePay;
- (void)boldTextSegment:(id)a3;
- (void)boldTextSegmentRange:(id)a3;
- (void)cancelGesture;
- (void)capitalizeTextSegment:(id)a3;
- (void)capitalizeTextSegmentRange:(id)a3;
- (void)changeTextSegment:(id)a3;
- (void)changeTextSegmentRange:(id)a3;
- (void)chooseAllOverlayItems;
- (void)chooseOverlayItem;
- (void)closeApplication;
- (void)closeFrontApplication;
- (void)copyTextSegment:(id)a3;
- (void)copyTextSegmentRange:(id)a3;
- (void)correctSelection:(id)a3;
- (void)correctTextSegment:(id)a3;
- (void)correctTextSegmentRange:(id)a3;
- (void)createCustomCommand;
- (void)cutTextSegment:(id)a3;
- (void)cutTextSegmentRange:(id)a3;
- (void)decreaseVolume;
- (void)decreaseZoomLevel;
- (void)decrementItem;
- (void)delete:(id)a3;
- (void)deleteAll:(id)a3;
- (void)deleteCurrentCharacter:(id)a3;
- (void)deleteCurrentLine:(id)a3;
- (void)deleteCurrentParagraph:(id)a3;
- (void)deleteCurrentSentence:(id)a3;
- (void)deleteCurrentWord:(id)a3;
- (void)deleteNextCharacter:(id)a3;
- (void)deleteNextLine:(id)a3;
- (void)deleteNextParagraph:(id)a3;
- (void)deleteNextSentence:(id)a3;
- (void)deleteNextWord:(id)a3;
- (void)deletePreviousCharacter:(id)a3;
- (void)deletePreviousLine:(id)a3;
- (void)deletePreviousParagraph:(id)a3;
- (void)deletePreviousSentence:(id)a3;
- (void)deletePreviousWord:(id)a3;
- (void)deleteTextSegment:(id)a3;
- (void)deleteTextSegmentRange:(id)a3;
- (void)disableAssistiveTouch;
- (void)disableAttentionAwareness;
- (void)disableClassicInvertColors;
- (void)disableColorFilters;
- (void)disableCommandAndControl;
- (void)disableFullKeyboardAccess;
- (void)disableReduceWhitePoint;
- (void)disableSmartInvertColors;
- (void)disableSwitchControl;
- (void)disableVoiceOver;
- (void)disableWatchMirroring;
- (void)disableWatchRemoteControl;
- (void)disableZoom;
- (void)doubleTap;
- (void)dragFromPointToPoint;
- (void)enableAssistiveTouch;
- (void)enableAttentionAwareness;
- (void)enableClassicInvertColors;
- (void)enableColorFilters;
- (void)enableFullKeyboardAccess;
- (void)enableReduceWhitePoint;
- (void)enableSmartInvertColors;
- (void)enableSwitchControl;
- (void)enableVoiceOver;
- (void)enableWatchMirroring;
- (void)enableWatchRemoteControl;
- (void)enableZoom;
- (void)endDrag;
- (void)extendSelectionBackwardCharactersUsingCardinalNumber:(id)a3;
- (void)extendSelectionBackwardLinesUsingCardinalNumber:(id)a3;
- (void)extendSelectionBackwardParagraphsUsingCardinalNumber:(id)a3;
- (void)extendSelectionBackwardSentencesUsingCardinalNumber:(id)a3;
- (void)extendSelectionBackwardWordsUsingCardinalNumber:(id)a3;
- (void)extendSelectionForwardCharactersUsingCardinalNumber:(id)a3;
- (void)extendSelectionForwardLinesUsingCardinalNumber:(id)a3;
- (void)extendSelectionForwardParagraphsUsingCardinalNumber:(id)a3;
- (void)extendSelectionForwardSentencesUsingCardinalNumber:(id)a3;
- (void)extendSelectionForwardWordsUsingCardinalNumber:(id)a3;
- (void)extendSelectionToBeginning:(id)a3;
- (void)extendSelectionToEnd:(id)a3;
- (void)extendSelectionToTextSegment:(id)a3;
- (void)goBack;
- (void)goToEndOfDocument:(id)a3;
- (void)goToEndOfLine:(id)a3;
- (void)goToEndOfParagraph:(id)a3;
- (void)goToEndOfSelection:(id)a3;
- (void)goToEndOfSentence:(id)a3;
- (void)goToEndOfWord:(id)a3;
- (void)goToStartOfDocument:(id)a3;
- (void)goToStartOfLine:(id)a3;
- (void)goToStartOfParagraph:(id)a3;
- (void)goToStartOfSelection:(id)a3;
- (void)goToStartOfSentence:(id)a3;
- (void)goToStartOfWord:(id)a3;
- (void)handleLabeledElementFromNameOrNumberWithBlock:(id)a3;
- (void)handleLabeledElementsFromTwoNumbersWithBlock:(id)a3;
- (void)handleSleepListening;
- (void)handleWakeListening;
- (void)hangUp;
- (void)hideControlCenter;
- (void)hideElementNames;
- (void)hideNotificationCenter;
- (void)hideNumberedElements;
- (void)hideNumberedGrid;
- (void)hideSearch;
- (void)hideVirtualKeyboard;
- (void)increaseVolume;
- (void)increaseZoomLevel;
- (void)incrementItem;
- (void)insertDate:(id)a3;
- (void)insertEmoji:(id)a3;
- (void)insertPhraseAfterTextSegment:(id)a3;
- (void)insertPhraseBeforeTextSegment:(id)a3;
- (void)italicizeTextSegment:(id)a3;
- (void)italicizeTextSegmentRange:(id)a3;
- (void)lockScreen;
- (void)longPress;
- (void)lowercaseTextSegment:(id)a3;
- (void)lowercaseTextSegmentRange:(id)a3;
- (void)maximizeZoomLevel;
- (void)minimizeZoomLevel;
- (void)moveBackwardCharactersUsingCardinalNumber:(id)a3;
- (void)moveBackwardLinesUsingCardinalNumber:(id)a3;
- (void)moveBackwardParagraphsUsingCardinalNumber:(id)a3;
- (void)moveBackwardSentencesUsingCardinalNumber:(id)a3;
- (void)moveBackwardWordsUsingCardinalNumber:(id)a3;
- (void)moveDown:(id)a3;
- (void)moveForwardCharactersUsingCardinalNumber:(id)a3;
- (void)moveForwardLinesUsingCardinalNumber:(id)a3;
- (void)moveForwardParagraphsUsingCardinalNumber:(id)a3;
- (void)moveForwardSentencesUsingCardinalNumber:(id)a3;
- (void)moveForwardWordsUsingCardinalNumber:(id)a3;
- (void)moveToEndOfTextSegment:(id)a3;
- (void)moveToStartOfTextSegment:(id)a3;
- (void)moveUp:(id)a3;
- (void)openApplication;
- (void)panDown;
- (void)panLeft;
- (void)panRight;
- (void)panUp;
- (void)panZoomDown;
- (void)panZoomLeft;
- (void)panZoomRight;
- (void)panZoomUp;
- (void)pasteboardCopy:(id)a3;
- (void)pasteboardCut:(id)a3;
- (void)pasteboardPaste:(id)a3;
- (void)performAction;
- (void)postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierFlags:(unsigned int)a4 isKeyDown:(BOOL)a5;
- (void)pressKeyboardKey;
- (void)pressOverlayItem;
- (void)putCurlyBracesAroundTextSegment:(id)a3;
- (void)putCurlyBracesAroundTextSegmentRange:(id)a3;
- (void)putDoubleCurlyQuotesAroundTextSegment:(id)a3;
- (void)putDoubleCurlyQuotesAroundTextSegmentRange:(id)a3;
- (void)putDoubleQuotesAroundTextSegment:(id)a3;
- (void)putDoubleQuotesAroundTextSegmentRange:(id)a3;
- (void)putParenthesesAroundTextSegment:(id)a3;
- (void)putParenthesesAroundTextSegmentRange:(id)a3;
- (void)putSingleCurlyQuotesAroundTextSegment:(id)a3;
- (void)putSingleCurlyQuotesAroundTextSegmentRange:(id)a3;
- (void)putSingleQuotesAroundTextSegment:(id)a3;
- (void)putSingleQuotesAroundTextSegmentRange:(id)a3;
- (void)putSquareBracketsAroundTextSegment:(id)a3;
- (void)putSquareBracketsAroundTextSegmentRange:(id)a3;
- (void)reboot;
- (void)repeatPreviousCommand;
- (void)rotateLeft;
- (void)rotateRight;
- (void)rotateToLandscape;
- (void)rotateToPortrait;
- (void)scrollPageDown;
- (void)scrollPageLeft;
- (void)scrollPageRight;
- (void)scrollPageUp;
- (void)scrollToBottom;
- (void)scrollToLeftEdge;
- (void)scrollToRightEdge;
- (void)scrollToTop;
- (void)searchSpotlight;
- (void)searchWeb;
- (void)selectAll:(id)a3;
- (void)selectCurrentCharacter:(id)a3;
- (void)selectCurrentLine:(id)a3;
- (void)selectCurrentParagraph:(id)a3;
- (void)selectCurrentSentence:(id)a3;
- (void)selectCurrentWord:(id)a3;
- (void)selectNext:(id)a3;
- (void)selectNextCharacter:(id)a3;
- (void)selectNextLine:(id)a3;
- (void)selectNextParagraph:(id)a3;
- (void)selectNextSentence:(id)a3;
- (void)selectNextWord:(id)a3;
- (void)selectPhrase:(id)a3;
- (void)selectPhraseThroughPhrase:(id)a3;
- (void)selectPrevious:(id)a3;
- (void)selectPreviousCharacter:(id)a3;
- (void)selectPreviousLine:(id)a3;
- (void)selectPreviousParagraph:(id)a3;
- (void)selectPreviousSentence:(id)a3;
- (void)selectPreviousTextInsertion:(id)a3;
- (void)selectPreviousWord:(id)a3;
- (void)selectTextSegment:(id)a3;
- (void)selectTextSegment:(id)a3 postAction:(id)a4;
- (void)selectTextSegmentRange:(id)a3;
- (void)selectTextSegmentRange:(id)a3 postAction:(id)a4;
- (void)setAction:(SEL)a3;
- (void)setCommandRecognizer:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCompletionDeterminedManually:(BOOL)a3;
- (void)setContextEvaluation:(id)a3;
- (void)setExecutedIndirectly:(BOOL)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setRecognizedParameters:(id)a3;
- (void)setStrings:(id)a3;
- (void)shake;
- (void)showAccessibilityActions;
- (void)showActiveCommands;
- (void)showCommands;
- (void)showElementNames;
- (void)showGridWithNumberOfColumns;
- (void)showNumberedCharacters;
- (void)showNumberedElements;
- (void)showNumberedGrid;
- (void)showNumberedLines;
- (void)showNumberedParagraphs;
- (void)showNumberedSentences;
- (void)showNumberedWords;
- (void)showTraining;
- (void)showVirtualKeyboard;
- (void)showVocabulary;
- (void)sleepCarPlay;
- (void)start3DTouch;
- (void)startCommandMode;
- (void)startDictationMode;
- (void)startDrag;
- (void)startHoldAndDrag;
- (void)startNumberMode;
- (void)startRecordingGesture;
- (void)startRecordingUserActions;
- (void)startSpellingMode;
- (void)stopRecordingGesture;
- (void)stopRecordingUserActions;
- (void)surroundSelectionWithPunctuation:(id)a3;
- (void)swipeDown;
- (void)swipeLeft;
- (void)swipeRight;
- (void)swipeUp;
- (void)systemDoubleLightPressCameraButton;
- (void)systemLightPressCameraButton;
- (void)systemLongPressCameraButton;
- (void)systemPressCameraButton;
- (void)takeScreenshot;
- (void)tap;
- (void)toggleDock;
- (void)toggleMute;
- (void)toggleRingerSwitchOff;
- (void)toggleRingerSwitchOn;
- (void)tripleClick;
- (void)twoFingerDoubleTap;
- (void)twoFingerLongPress;
- (void)twoFingerPanDown;
- (void)twoFingerPanLeft;
- (void)twoFingerPanRight;
- (void)twoFingerPanUp;
- (void)twoFingerSwipeDown;
- (void)twoFingerSwipeLeft;
- (void)twoFingerSwipeRight;
- (void)twoFingerSwipeUp;
- (void)twoFingerTap;
- (void)underlineTextSegment:(id)a3;
- (void)underlineTextSegmentRange:(id)a3;
- (void)unselect:(id)a3;
- (void)uppercaseTextSegment:(id)a3;
- (void)uppercaseTextSegmentRange:(id)a3;
- (void)voActivate;
- (void)voMagicTap;
- (void)voReadAll;
- (void)voSelect;
- (void)voSelectFirstItem;
- (void)voSelectLastItem;
- (void)voSelectNextApp;
- (void)voSelectNextItem;
- (void)voSelectNextRotor;
- (void)voSelectNextRotorOption;
- (void)voSelectPreviousApp;
- (void)voSelectPreviousItem;
- (void)voSelectPreviousRotor;
- (void)voSelectPreviousRotorOption;
- (void)voSelectStatusBar;
- (void)voShowItemChooser;
- (void)voSpeakSummary;
- (void)voStopSpeaking;
- (void)voToggleScreenCurtain;
- (void)wakeCarPlay;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation CACSpokenCommand

- (id)_elementActionManager
{
  if (_elementActionManager_onceToken != -1) {
    dispatch_once(&_elementActionManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)_elementActionManager_sElementActionManager;
  return v2;
}

void __67__CACSpokenCommand_CACSpokenCommandGestures___elementActionManager__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F22250]);
  id v3 = +[CACAXDragManager sharedManager];
  uint64_t v1 = [v0 initWithDragManager:v3];
  v2 = (void *)_elementActionManager_sElementActionManager;
  _elementActionManager_sElementActionManager = v1;
}

- (void)_handleGestureWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke;
  v6[3] = &unk_264D11708;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self handleLabeledElementFromNameOrNumberWithBlock:v6];
}

void __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke_2;
  v5[3] = &unk_264D116E0;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __70__CACSpokenCommand_CACSpokenCommandGestures___handleGestureWithBlock___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) element];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 element];
    [v4 visibleFrame];
    AX_CGRectGetCenter();
    unint64_t v6 = v5;
    unint64_t v8 = v7;
  }
  else
  {
    [v3 rectangle];
    AX_CGRectGetCenter();
    unint64_t v6 = v9;
    unint64_t v8 = v10;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [*(id *)(a1 + 32) displayID];
  v13 = *(uint64_t (**)(uint64_t, uint64_t, __n128, __n128))(v11 + 16);
  v14.n128_u64[0] = v6;
  v15.n128_u64[0] = v8;
  return v13(v11, v12, v14, v15);
}

- (void)_handleTwoPointGestureWithBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke;
  v6[3] = &unk_264D11758;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self handleLabeledElementsFromTwoNumbersWithBlock:v6];
}

void __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke_2;
  block[3] = &unk_264D11730;
  id v10 = v5;
  id v11 = v6;
  id v12 = *(id *)(a1 + 32);
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __78__CACSpokenCommand_CACSpokenCommandGestures___handleTwoPointGestureWithBlock___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) element];

  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 element];
    [v4 visibleFrame];
    AX_CGRectGetCenter();
    unint64_t v6 = v5;
    unint64_t v8 = v7;
  }
  else
  {
    [v3 rectangle];
    AX_CGRectGetCenter();
    unint64_t v6 = v9;
    unint64_t v8 = v10;
  }
  id v11 = [*(id *)(a1 + 40) element];

  id v12 = *(void **)(a1 + 40);
  if (v11)
  {
    v13 = [v12 element];
    [v13 visibleFrame];
    AX_CGRectGetCenter();
    unint64_t v15 = v14;
    unint64_t v17 = v16;
  }
  else
  {
    [v12 rectangle];
    AX_CGRectGetCenter();
    unint64_t v15 = v18;
    unint64_t v17 = v19;
  }
  uint64_t v20 = *(void *)(a1 + 48);
  uint64_t v21 = [*(id *)(a1 + 32) displayID];
  uint64_t v22 = [*(id *)(a1 + 40) displayID];
  v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, __n128, __n128, __n128, __n128))(v20 + 16);
  v24.n128_u64[0] = v6;
  v25.n128_u64[0] = v8;
  v26.n128_u64[0] = v15;
  v27.n128_u64[0] = v17;
  return v23(v20, v21, v22, v24, v25, v26, v27);
}

- (void)zoomIn
{
}

void __52__CACSpokenCommand_CACSpokenCommandGestures__zoomIn__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performPinchOutGestureAtPoint:", a1, a2);
}

- (void)zoomOut
{
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__zoomOut__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performPinchInGestureAtPoint:", a1, a2);
}

- (void)rotateRight
{
}

void __57__CACSpokenCommand_CACSpokenCommandGestures__rotateRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performRotateRightGestureAtPoint:", a1, a2);
}

- (void)rotateLeft
{
}

void __56__CACSpokenCommand_CACSpokenCommandGestures__rotateLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performRotateLeftGestureAtPoint:", a1, a2);
}

- (void)swipeUp
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = +[CACSpokenCommandGestureManager allManagers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isIn3DTouchGesture])
        {
          [v8 reveal3DTouchActions];

          return;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  [(CACSpokenCommand *)self _handleGestureWithBlock:&__block_literal_global_280];
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__swipeUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 1, 1, a1, a2);
}

- (void)swipeDown
{
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__swipeDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 1, 1, a1, a2);
}

- (void)swipeLeft
{
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__swipeLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 1, 1, a1, a2);
}

- (void)swipeRight
{
}

void __56__CACSpokenCommand_CACSpokenCommandGestures__swipeRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 1, 1, a1, a2);
}

- (void)panUp
{
}

void __51__CACSpokenCommand_CACSpokenCommandGestures__panUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 0, 1, a1, a2);
}

- (void)panDown
{
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__panDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 0, 1, a1, a2);
}

- (void)panLeft
{
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__panLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 0, 1, a1, a2);
}

- (void)panRight
{
}

void __54__CACSpokenCommand_CACSpokenCommandGestures__panRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 0, 1, a1, a2);
}

- (void)twoFingerSwipeUp
{
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 1, 2, a1, a2);
}

- (void)twoFingerSwipeDown
{
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 1, 2, a1, a2);
}

- (void)twoFingerSwipeLeft
{
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 1, 2, a1, a2);
}

- (void)twoFingerSwipeRight
{
}

void __65__CACSpokenCommand_CACSpokenCommandGestures__twoFingerSwipeRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 1, 2, a1, a2);
}

- (void)twoFingerPanUp
{
}

void __60__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanUp__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 2, 0, 2, a1, a2);
}

- (void)twoFingerPanDown
{
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanDown__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 3, 0, 2, a1, a2);
}

- (void)twoFingerPanLeft
{
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanLeft__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 0, 0, 2, a1, a2);
}

- (void)twoFingerPanRight
{
}

void __63__CACSpokenCommand_CACSpokenCommandGestures__twoFingerPanRight__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performSwipeGestureAtPoint:inDirection:fast:numberOfFingers:", 1, 0, 2, a1, a2);
}

- (void)doubleTap
{
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__doubleTap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performDoubleTapAtPoint:numberOfFingers:", 1, a1, a2);
}

- (void)twoFingerDoubleTap
{
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerDoubleTap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performDoubleTapAtPoint:numberOfFingers:", 2, a1, a2);
}

- (void)tap
{
}

void __49__CACSpokenCommand_CACSpokenCommandGestures__tap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performTapAtPoint:numberOfFingers:", 1, a1, a2);
}

- (void)twoFingerTap
{
}

void __58__CACSpokenCommand_CACSpokenCommandGestures__twoFingerTap__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performTapAtPoint:numberOfFingers:", 2, a1, a2);
}

- (id)_dragActionForLabeledElement:(id)a3
{
  uint64_t v4 = [a3 element];
  uint64_t v5 = [(CACSpokenCommand *)self _axActionOfType:1 forElement:v4];

  return v5;
}

- (id)_dropActionForLabeledElement:(id)a3
{
  uint64_t v4 = [a3 element];
  uint64_t v5 = [(CACSpokenCommand *)self _axActionOfType:2 forElement:v4];

  return v5;
}

- (id)_axActionOfType:(int64_t)a3 forElement:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    unint64_t v7 = [(CACSpokenCommand *)self _elementActionManager];
    unint64_t v8 = [v7 actionsForElement:v6];

    if ([v8 count]
      && (v12[0] = MEMORY[0x263EF8330],
          v12[1] = 3221225472,
          v12[2] = __73__CACSpokenCommand_CACSpokenCommandGestures___axActionOfType_forElement___block_invoke,
          v12[3] = &__block_descriptor_40_e32_B32__0__AXElementAction_8Q16_B24l,
          v12[4] = a3,
          uint64_t v9 = [v8 indexOfObjectPassingTest:v12],
          v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      long long v10 = [v8 objectAtIndexedSubscript:v9];
    }
    else
    {
      long long v10 = 0;
    }
  }
  else
  {
    long long v10 = 0;
  }
  return v10;
}

BOOL __73__CACSpokenCommand_CACSpokenCommandGestures___axActionOfType_forElement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (BOOL)_startDragForLabeledElement:(id)a3
{
  uint64_t v4 = [(CACSpokenCommand *)self _dragActionForLabeledElement:a3];
  if (v4)
  {
    uint64_t v5 = [(CACSpokenCommand *)self _elementActionManager];
    char v6 = [v5 performAction:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_endDragForLabeledElement:(id)a3
{
  uint64_t v4 = [(CACSpokenCommand *)self _dropActionForLabeledElement:a3];
  if (v4)
  {
    uint64_t v5 = [(CACSpokenCommand *)self _elementActionManager];
    char v6 = [v5 performAction:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)startDrag
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke;
  v2[3] = &unk_264D117E8;
  v2[4] = self;
  [(CACSpokenCommand *)self handleLabeledElementFromNameOrNumberWithBlock:v2];
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _dragActionForLabeledElement:v3];
  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke_2;
    v5[3] = &unk_264D117C0;
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
  else
  {
    [*(id *)(a1 + 32) _handleGestureWithBlock:&__block_literal_global_321];
  }
}

uint64_t __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startDragForLabeledElement:*(void *)(a1 + 40)];
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__startDrag__block_invoke_3(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "startDragAtPoint:", a1, a2);
}

- (void)startHoldAndDrag
{
}

void __62__CACSpokenCommand_CACSpokenCommandGestures__startHoldAndDrag__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "startHoldAndDragAtPoint:", a1, a2);
}

- (void)endDrag
{
  id v3 = +[CACAXDragManager sharedManager];
  int v4 = [v3 isDragActive];

  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke;
    v5[3] = &unk_264D117E8;
    void v5[4] = self;
    [(CACSpokenCommand *)self handleLabeledElementFromNameOrNumberWithBlock:v5];
  }
  else
  {
    [(CACSpokenCommand *)self _handleGestureWithBlock:&__block_literal_global_328];
  }
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _dropActionForLabeledElement:v3];
  if (v4)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_2;
    v5[3] = &unk_264D117C0;
    void v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
  else
  {
    [*(id *)(a1 + 32) _handleGestureWithBlock:&__block_literal_global_325];
  }
}

uint64_t __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDragForLabeledElement:*(void *)(a1 + 40)];
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_3(double a1, double a2)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_4;
  v2[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v2[4] = a1;
  *(double *)&void v2[5] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_4(uint64_t a1)
{
  id v2 = +[CACAXDragManager sharedManager];
  objc_msgSend(v2, "moveToAndDropAtPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_5(double a1, double a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  int v8 = [v7 isInGesture];

  if (v8)
  {
    id v10 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
    objc_msgSend(v10, "endDragAtPoint:", a1, a2);
  }
  else
  {
    uint64_t v9 = CACLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_5_cold_1(v9);
    }
  }
}

- (void)dragFromPointToPoint
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke;
  v2[3] = &unk_264D11878;
  v2[4] = self;
  [(CACSpokenCommand *)self handleLabeledElementsFromTwoNumbersWithBlock:v2];
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) _dragActionForLabeledElement:v5];
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_2;
    block[3] = &unk_264D11850;
    void block[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v10 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    [*(id *)(a1 + 32) _handleTwoPointGestureWithBlock:&__block_literal_global_333];
  }
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _startDragForLabeledElement:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_3;
  v3[3] = &unk_264D117C0;
  v3[4] = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 48);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2 = +[CACAXDragManager sharedManager];
  int v3 = [v2 isDragActive];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _dropActionForLabeledElement:*(void *)(a1 + 40)];
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_4;
      v6[3] = &unk_264D117C0;
      id v5 = *(void **)(a1 + 40);
      void v6[4] = *(void *)(a1 + 32);
      id v7 = v5;
      dispatch_async(MEMORY[0x263EF83A0], v6);
    }
    else
    {
      [*(id *)(a1 + 32) _handleTwoPointGestureWithBlock:&__block_literal_global_331];
    }
  }
}

uint64_t __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endDragForLabeledElement:*(void *)(a1 + 40)];
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_5(double a1, double a2, double a3, double a4)
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_6;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  *(double *)&v4[4] = a3;
  *(double *)&v4[5] = a4;
  dispatch_async(MEMORY[0x263EF83A0], v4);
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_6(uint64_t a1)
{
  id v2 = +[CACAXDragManager sharedManager];
  objc_msgSend(v2, "moveToAndDropAtPoint:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

void __66__CACSpokenCommand_CACSpokenCommandGestures__dragFromPointToPoint__block_invoke_7(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6)
{
  long long v11 = +[CACSpokenCommandGestureManager managerForDisplayID:a6];
  objc_msgSend(v11, "startDragAtPoint:", a1, a2);

  long long v12 = +[CACSpokenCommandGestureManager managerForDisplayID:a6];
  int v13 = [v12 isInGesture];

  if (v13)
  {
    id v14 = +[CACSpokenCommandGestureManager managerForDisplayID:a6];
    objc_msgSend(v14, "endDragAtPoint:", a3, a4);
  }
}

- (void)cancelGesture
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = +[CACSpokenCommandGestureManager allManagers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v6++) resetState];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  id v7 = +[CACAXDragManager sharedManager];
  int v8 = [v7 isDragActive];

  if (v8) {
    dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_335);
  }
}

void __59__CACSpokenCommand_CACSpokenCommandGestures__cancelGesture__block_invoke()
{
  id v0 = +[CACAXDragManager sharedManager];
  [v0 cancelDrag];
}

- (void)longPress
{
}

void __55__CACSpokenCommand_CACSpokenCommandGestures__longPress__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performLongPressAtPoint:numberOfFingers:", 1, a1, a2);
}

- (void)twoFingerLongPress
{
}

void __64__CACSpokenCommand_CACSpokenCommandGestures__twoFingerLongPress__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v6 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  objc_msgSend(v6, "performLongPressAtPoint:numberOfFingers:", 2, a1, a2);
}

- (void)start3DTouch
{
}

void __58__CACSpokenCommand_CACSpokenCommandGestures__start3DTouch__block_invoke(double a1, double a2, uint64_t a3, uint64_t a4)
{
  id v7 = +[CACSpokenCommandGestureManager managerForDisplayID:a4];
  id v6 = objc_msgSend(MEMORY[0x263F22900], "forceTouchGestureAtPoint:", a1, a2);
  [v7 performGesture:v6];
}

- (void)_postKeyboardEventsForModifierFlags:(unsigned int)a3 isKeyDown:(BOOL)a4
{
  BOOL v4 = a4;
  v25[5] = *MEMORY[0x263EF8340];
  v24[0] = &unk_26EB4CC78;
  v24[1] = &unk_26EB4CCA8;
  v25[0] = &unk_26EB4CC90;
  v25[1] = &unk_26EB4CCC0;
  v24[2] = &unk_26EB4CCD8;
  v24[3] = &unk_26EB4CD08;
  v25[2] = &unk_26EB4CCF0;
  v25[3] = &unk_26EB4CD20;
  v24[4] = &unk_26EB4CD38;
  v25[4] = &unk_26EB4CD50;
  id v6 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
  id v7 = v6;
  if (a3)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [v6 allKeys];
    uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      if (v4) {
        LODWORD(v10) = 0;
      }
      else {
        LODWORD(v10) = a3;
      }
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          int v14 = [v13 unsignedIntValue];
          unint64_t v15 = [v7 objectForKey:v13];
          unsigned __int16 v16 = [v15 unsignedIntValue];

          if ((v14 & a3) != 0)
          {
            if (v4) {
              uint64_t v10 = v14 | v10;
            }
            else {
              uint64_t v10 = v10 & ~v14;
            }
            [(CACSpokenCommand *)self postKeyboardEventWithKeyCode:v16 modifierFlags:v10 isKeyDown:v4];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }
  }
}

- (void)postKeyboardEventWithKeyCode:(unsigned __int16)a3 modifierFlags:(unsigned int)a4 isKeyDown:(BOOL)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = a3;
  if (a5) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = 11;
  }
  id v10 = [MEMORY[0x263F228A8] keyRepresentationWithType:v7];
  uint64_t v8 = [v10 keyInfo];
  [v8 setKeyCode:v6];
  [v8 setModifierState:v5];
  [v8 setUnmodifiedInput:&stru_26EB332F0];
  [v8 setModifiedInput:&stru_26EB332F0];
  uint64_t v9 = [MEMORY[0x263F22838] server];
  [v9 postEvent:v10 systemEvent:0];

  usleep(0x3E8u);
}

- (void)pressKeyboardKey
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACSpokenCommand *)self recognizedParameters];
  BOOL v4 = [v3 objectForKey:*MEMORY[0x263F78C08]];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v10 hasPrefix:@"KeyboardKeyName."])
        {
          long long v12 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          [v12 setRecognizedCommandIdentifier:v10];

          uint64_t v11 = [v4 objectForKey:v10];
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  uint64_t v11 = 0;
LABEL_11:

  uint64_t v13 = [(CACSpokenCommand *)self _getModifierFlag];
  int v14 = [(CACSpokenCommand *)self recognizedParameters];
  unint64_t v15 = [v14 objectForKey:*MEMORY[0x263F78C18]];
  unsigned __int16 v16 = [v15 objectForKey:kCACCommandParameterText];

  if (v16) {
    uint64_t v17 = (int)[v16 intValue];
  }
  else {
    uint64_t v17 = 1;
  }
  unint64_t v18 = [v11 objectForKey:kCACCommandParameterHIDKeyCode];

  if (v18 && v17 >= 1)
  {
    uint64_t v19 = v17;
    do
    {
      long long v20 = [v11 objectForKey:kCACCommandParameterHIDKeyCode];
      unsigned __int16 v21 = [v20 integerValue];

      if (v13)
      {
        [(CACSpokenCommand *)self _postKeyboardEventsForModifierFlags:v13 isKeyDown:1];
        [(CACSpokenCommand *)self postKeyboardEventWithKeyCode:v21 modifierFlags:v13 isKeyDown:1];
        [(CACSpokenCommand *)self postKeyboardEventWithKeyCode:v21 modifierFlags:v13 isKeyDown:0];
        [(CACSpokenCommand *)self _postKeyboardEventsForModifierFlags:v13 isKeyDown:0];
      }
      else
      {
        [(CACSpokenCommand *)self postKeyboardEventWithKeyCode:v21 modifierFlags:0 isKeyDown:1];
        [(CACSpokenCommand *)self postKeyboardEventWithKeyCode:v21 modifierFlags:0 isKeyDown:0];
      }
      if ((unint64_t)v17 >= 2) {
        usleep(0xC350u);
      }
      --v19;
    }
    while (v19);
  }
}

- (unsigned)_getModifierFlag
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACSpokenCommand *)self recognizedParameters];
  unsigned __int16 v21 = [v3 objectForKey:*MEMORY[0x263F78C10]];

  BOOL v4 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v5 = [v4 objectForKey:kCACCommandParameterTextSequence];

  id v6 = objc_alloc_init(MEMORY[0x263F089D8]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKey:kCACCommandParameterBuiltInIdentifier];
        if (v12)
        {
          [v6 appendString:v12];
          [v6 appendString:@","];
        }
        if (([v12 hasPrefix:@"ModifierKeyName."] & 1) != 0
          || [v12 hasPrefix:@"ClickModifierName."])
        {
          uint64_t v13 = [v21 objectForKey:v12];
          int v14 = [v13 objectForKey:kCACCommandParameterAXModifierFlag];
          int v15 = [v14 unsignedIntegerValue];

          v9 |= v15;
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned int v9 = 0;
  }

  if ([v6 length])
  {
    unsigned __int16 v16 = objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
    uint64_t v17 = [v16 mutableCopy];

    unint64_t v18 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v18 setRecognizedCommandIdentifier:v17];

    id v6 = (id)v17;
  }

  return v9;
}

- (void)voSelect
{
}

void __39__CACSpokenCommand_VoiceOver__voSelect__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v2 = [v6 element];

  if (v2)
  {
    UIAccessibilityNotifications v3 = *MEMORY[0x263F812F8];
    BOOL v4 = [v6 element];
    uint64_t v5 = [v4 uiElement];
    UIAccessibilityPostNotification(v3, (id)[v5 axElement]);
  }
}

- (void)voSelectFirstItem
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:10];
}

- (void)voSelectLastItem
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:11];
}

- (void)voSelectNextApp
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:36];
}

- (void)voSelectPreviousApp
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:37];
}

- (void)voToggleScreenCurtain
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:2];
}

- (void)voStopSpeaking
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:20];
}

- (void)voShowItemChooser
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:18];
}

- (void)voSelectStatusBar
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:12];
}

- (void)voSpeakSummary
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:7];
}

- (void)voMagicTap
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:28];
}

- (void)voActivate
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:19];
}

- (void)voSelectNextItem
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:9];
}

- (void)voSelectPreviousItem
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:8];
}

- (void)voSelectNextRotor
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:14];
}

- (void)voSelectPreviousRotor
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:15];
}

- (void)voSelectNextRotorOption
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:17];
}

- (void)voSelectPreviousRotorOption
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:16];
}

- (void)voReadAll
{
  id v2 = [MEMORY[0x263F229E8] server];
  [v2 triggerCommand:38];
}

+ (double)defaultDelayBetweenCommands
{
  return 0.75;
}

+ (id)stringFromContextEvaluationDictionary:(id)a3 isCustom:(BOOL)a4
{
  BOOL v19 = a4;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v4 allKeys];
  uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = NSString;
        long long v12 = [v4 objectForKey:v10];
        uint64_t v13 = [v12 description];
        int v14 = [v11 stringWithFormat:@"%@_%@", v10, v13];
        [v5 addObject:v14];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  if (![v5 count])
  {
    if (v19) {
      int v15 = @"CustomDefaultRecognizer";
    }
    else {
      int v15 = @"DefaultRecognizer";
    }
    [v5 addObject:v15];
  }
  unsigned __int16 v16 = [v5 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  uint64_t v17 = [v16 componentsJoinedByString:@"_"];

  return v17;
}

+ (id)attributedStringFromRecognizedCommandParameters:(id)a3 variantOverrides:(id)a4
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v39 = a4;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = [v5 objectForKey:kCACCommandParameterTextSequence];
  if ([v7 count])
  {
    v37 = v7;
    v38 = v5;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (!v9) {
      goto LABEL_29;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v41;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v41 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        int v14 = [v13 objectForKey:kCACCommandParameterBuiltInIdentifier];
        uint64_t v15 = [v13 objectForKey:kCACCommandParameterText];
        unsigned __int16 v16 = (void *)v15;
        if (v14)
        {
          uint64_t v17 = [v39 objectForKey:v14];
          if (v17)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v18 = v17;

              unsigned __int16 v16 = v18;
LABEL_22:
              if ([v6 length])
              {
                uint64_t v26 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
                int v27 = [v26 doesCurrentLanguageSupportInterWordSpaces];

                if (v27)
                {
                  v28 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
                  [v6 appendAttributedString:v28];
                }
              }
              id v29 = objc_alloc(MEMORY[0x263F086A0]);
              v30 = [NSString stringWithFormat:@"\x1B‘%@’", v16];
              v31 = (void *)[v29 initWithString:v30 attributes:0];
              [v6 appendAttributedString:v31];

              goto LABEL_26;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              unsigned int v22 = [v17 BOOLValue];
              long long v23 = [v38 objectForKey:kCACCommandParameterTextVariants];
              long long v24 = v23;
              if (v22 && [v23 count] > (unint64_t)v22)
              {
                uint64_t v25 = [v24 objectAtIndex:v22];

                unsigned __int16 v16 = (void *)v25;
              }
            }
          }
          if (v16) {
            goto LABEL_22;
          }
        }
        else
        {
          if (!v15) {
            goto LABEL_27;
          }
          if ([v6 length])
          {
            BOOL v19 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
            int v20 = [v19 doesCurrentLanguageSupportInterWordSpaces];

            if (v20)
            {
              long long v21 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" " attributes:0];
              [v6 appendAttributedString:v21];
            }
          }
          uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v16 attributes:0];
          [v6 appendAttributedString:v17];
        }
LABEL_26:

LABEL_27:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (!v10)
      {
LABEL_29:

        uint64_t v7 = v37;
        id v5 = v38;
        goto LABEL_32;
      }
    }
  }
  v32 = [v5 objectForKey:kCACCommandParameterText];

  if (v32)
  {
    id v33 = objc_alloc(MEMORY[0x263F089B8]);
    v34 = [v5 objectForKey:kCACCommandParameterText];
    uint64_t v35 = [v33 initWithString:v34];

    uint64_t v6 = (void *)v35;
  }
LABEL_32:

  return v6;
}

+ (void)displayRecognizedMessageUsingAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = +[CACPreferences sharedPreferences];
  if ([v4 playSoundUponRecognition])
  {
  }
  else
  {
    id v5 = +[CACDisplayManager sharedManager];
    if (([v5 carPlayConnected] & 1) == 0)
    {

      goto LABEL_15;
    }
    uint64_t v6 = +[CACDisplayManager sharedManager];
    char v7 = [v6 carPlayConnectedWirelessly];

    if (v7) {
      goto LABEL_15;
    }
  }
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v9 = [v8 URLForResource:@"DefaultRecognitionSound" withExtension:@"aiff"];

  uint64_t v10 = +[CACDisplayManager sharedManager];
  int v11 = [v10 carPlayConnected];

  if (v11)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke;
    block[3] = &unk_264D115D0;
    long long v12 = &v26;
    id v26 = v9;
    if (displayRecognizedMessageUsingAttributedString__recSoundInit != -1) {
      dispatch_once(&displayRecognizedMessageUsingAttributedString__recSoundInit, block);
    }
    AudioServicesPlaySystemSoundWithOptions();
  }
  else
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_3;
    v23[3] = &unk_264D115D0;
    long long v12 = &v24;
    id v24 = v9;
    if (displayRecognizedMessageUsingAttributedString__recSoundInit_479 != -1) {
      dispatch_once(&displayRecognizedMessageUsingAttributedString__recSoundInit_479, v23);
    }
    if (displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer) {
      [(id)displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer play];
    }
  }

LABEL_15:
  uint64_t v13 = +[CACPreferences sharedPreferences];
  if (![v13 showTextResponseUponRecognition])
  {
LABEL_22:

    goto LABEL_23;
  }
  int v14 = +[CACDisplayManager sharedManager];
  char v15 = [v14 carPlayConnected];

  if ((v15 & 1) == 0)
  {
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0);
    uint64_t v17 = +[CACDisplayManager sharedManager];
    id v18 = [v3 string];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_4;
    v21[3] = &unk_264D115D0;
    uint64_t v13 = v16;
    unsigned int v22 = v13;
    [v17 displayMessageString:v18 type:2 announcementCompletion:v21];

    dispatch_time_t v19 = dispatch_time(0, 15000000000);
    if (dispatch_semaphore_wait(v13, v19))
    {
      int v20 = CACLogAccessibility();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:](v3, v20);
      }
    }
    goto LABEL_22;
  }
LABEL_23:
}

void __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke(uint64_t a1)
{
  objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *(void *)(a1 + 32), *MEMORY[0x263EFC0E0], 0);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  AudioServicesCreateSystemSoundIDWithOptions();
  uint64_t v1 = NSDictionary;
  id v2 = [NSNumber numberWithUnsignedInt:1111];
  uint64_t v3 = *MEMORY[0x263EFC0F0];
  id v4 = [NSNumber numberWithUnsignedInteger:2];
  uint64_t v5 = objc_msgSend(v1, "dictionaryWithObjectsAndKeys:", v2, v3, v4, *MEMORY[0x263EFC0F8], 0);
  uint64_t v6 = (void *)displayRecognizedMessageUsingAttributedString__playSSOptions;
  displayRecognizedMessageUsingAttributedString__playSSOptions = v5;
}

void __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(MEMORY[0x263EF93B8]) initWithContentsOfURL:*(void *)(a1 + 32) error:0];
  id v2 = (void *)displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer;
  displayRecognizedMessageUsingAttributedString__gRecognizedAudioPlayer = v1;

  id v3 = [MEMORY[0x263EF93E0] sharedInstance];
  [v3 setCategory:*MEMORY[0x263EF9048] error:0];
}

intptr_t __66__CACSpokenCommand_displayRecognizedMessageUsingAttributedString___block_invoke_4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)languageModelFromCommandDictionary:(id)a3 tokenResolution:(id)a4 containsBuiltInIdentifier:(BOOL *)a5 error:(id *)a6
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  int v11 = [v9 objectForKey:*MEMORY[0x263F78C88]];
  int v12 = [v11 BOOLValue];

  if (!v12)
  {
    dispatch_semaphore_t v16 = [v9 objectForKey:*MEMORY[0x263F78C90]];
    unsigned int v22 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    long long v23 = [v16 stringByTrimmingCharactersInSet:v22];

    if ([v23 length]
      || ([v9 objectForKey:*MEMORY[0x263F78C78]],
          id v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v24 count],
          v24,
          v25))
    {
      id v26 = [CACLanguageModel alloc];
      int v27 = [v9 objectForKey:*MEMORY[0x263F78C80]];
      v28 = [v9 objectForKey:*MEMORY[0x263F78C70]];
      char v15 = [(CACLanguageModel *)v26 initWithText:v23 identifier:v27 attributes:v28];

      if (v15)
      {
        v36 = v16;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v37 = v9;
        id v29 = [v9 objectForKey:*MEMORY[0x263F78C78]];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v39 != v32) {
                objc_enumerationMutation(v29);
              }
              v34 = +[CACSpokenCommand languageModelFromCommandDictionary:*(void *)(*((void *)&v38 + 1) + 8 * i) tokenResolution:v10 containsBuiltInIdentifier:a5 error:a6];
              if (v34) {
                [(CACLanguageModel *)v15 addChildLanguageModel:v34];
              }
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v31);
        }

        dispatch_semaphore_t v16 = v36;
        id v9 = v37;
      }
    }
    else
    {
      char v15 = 0;
    }

    goto LABEL_31;
  }
  if (a5) {
    *a5 = 1;
  }
  uint64_t v13 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v14 = [v9 objectForKey:*MEMORY[0x263F78C80]];
  char v15 = [v13 languageModelForBuiltInLMIdentifier:v14];

  if (v10 && ![v10 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    dispatch_semaphore_t v16 = [(CACLanguageModel *)v15 children];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
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
          long long v21 = [*(id *)(*((void *)&v42 + 1) + 8 * j) text];
          if (v21) {
            [v10 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v18);
    }
LABEL_31:
  }
  return v15;
}

- (CACSpokenCommand)initWithProperties:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CACSpokenCommand;
  uint64_t v5 = [(CACSpokenCommand *)&v35 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    [(CACSpokenCommand *)v5 setContextEvaluation:v6];

    if (v4)
    {
      id v7 = [v4 objectForKey:kCACCommandPropertyIdentifier];
      [(CACSpokenCommand *)v5 setIdentifier:v7];

      id v8 = [v4 objectForKey:kCACCommandPropertyStrings];
      [(CACSpokenCommand *)v5 setStrings:v8];

      id v9 = [v4 objectForKey:@"ActionMethod"];
      id v10 = v9;
      if (v9) {
        [(CACSpokenCommand *)v5 setAction:NSSelectorFromString(v9)];
      }
      int v11 = [v4 objectForKey:@"ContextEvaluation"];

      if (v11)
      {
        int v12 = [(CACSpokenCommand *)v5 contextEvaluation];
        id v30 = v4;
        uint64_t v13 = [v4 objectForKey:@"ContextEvaluation"];
        [v12 addEntriesFromDictionary:v13];

        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        int v14 = [(CACSpokenCommand *)v5 contextEvaluation];
        char v15 = [v14 allKeys];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v32 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8 * i);
              long long v21 = +[CACSpokenCommandManager hardwareEvaluatorKeys];
              int v22 = [v21 containsObject:v20];

              if (v22)
              {
                long long v23 = [(CACSpokenCommand *)v5 contextEvaluation];
                id v24 = [v23 objectForKey:v20];
                BOOL v25 = +[CACSpokenCommandManager doesEvaluatorKey:v20 matchValue:v24];

                if (!v25)
                {
                  v28 = CACLogAccessibility();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    identifier = v5->_identifier;
                    *(_DWORD *)buf = 138412546;
                    id v37 = identifier;
                    __int16 v38 = 2112;
                    uint64_t v39 = v20;
                    _os_log_impl(&dword_238377000, v28, OS_LOG_TYPE_INFO, "Removing command %@ for failing evaluator %@", buf, 0x16u);
                  }

                  id v26 = 0;
                  id v4 = v30;
                  goto LABEL_18;
                }
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v31 objects:v40 count:16];
            if (v17) {
              continue;
            }
            break;
          }
        }

        id v4 = v30;
      }
    }
  }
  id v26 = v5;
LABEL_18:

  return v26;
}

- (CACSpokenCommand)initWithSpokenCommand:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CACSpokenCommand;
  uint64_t v5 = [(CACSpokenCommand *)&v14 init];
  if (v5)
  {
    uint64_t v6 = [v4 identifier];
    [(CACSpokenCommand *)v5 setIdentifier:v6];

    id v7 = [v4 strings];
    [(CACSpokenCommand *)v5 setStrings:v7];

    -[CACSpokenCommand setAction:](v5, "setAction:", [v4 action]);
    id v8 = [v4 commandRecognizer];
    [(CACSpokenCommand *)v5 setCommandRecognizer:v8];

    id v9 = [v4 recognizedParameters];
    [(CACSpokenCommand *)v5 setRecognizedParameters:v9];

    id v10 = [v4 contextEvaluation];
    [(CACSpokenCommand *)v5 setContextEvaluation:v10];

    uint64_t v11 = [v4 languageModelCache];
    languageModelCache = v5->_languageModelCache;
    v5->_languageModelCache = (CACLanguageModel *)v11;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v4 initWithSpokenCommand:self];
}

- (CACLanguageModel)languageModel
{
  id v2 = self;
  uint64_t v66 = *MEMORY[0x263EF8340];
  languageModelCache = self->_languageModelCache;
  if (!languageModelCache)
  {
    id v4 = [CACLanguageModel alloc];
    uint64_t v5 = [(CACSpokenCommand *)v2 identifier];
    uint64_t v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v2->_identifier, kCACLanguageModelAttributeCommandIdentifier, 0);
    uint64_t v7 = [(CACLanguageModel *)v4 initWithText:&stru_26EB332F0 identifier:v5 attributes:v6];
    id v8 = v2->_languageModelCache;
    v2->_languageModelCache = (CACLanguageModel *)v7;

    id v9 = [(CACSpokenCommand *)v2 identifier];
    LODWORD(v5) = [v9 isEqualToString:@"System.IgnoreSiriKeywordAndOptionalPhrase"];

    if (v5)
    {
      id v10 = [MEMORY[0x263F85AF0] sharedPreferences];
      uint64_t v11 = +[CACPreferences sharedPreferences];
      int v12 = [v11 bestLocaleIdentifier];
      uint64_t v13 = [v10 localizedTriggerPhraseForLanguageCode:v12];

      if (![(__CFString *)v13 length])
      {

        uint64_t v13 = @"Hey Siri";
      }
      objc_super v14 = [CACLanguageModel alloc];
      char v15 = [(CACSpokenCommand *)v2 identifier];
      uint64_t v16 = *MEMORY[0x263EFFB40];
      uint64_t v17 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", *MEMORY[0x263EFFB40], *MEMORY[0x263F78C68], 0);
      uint64_t v18 = [(CACLanguageModel *)v14 initWithText:&stru_26EB332F0 identifier:v15 attributes:v17];

      uint64_t v19 = [[CACLanguageModel alloc] initWithText:v13 identifier:0 attributes:0];
      uint64_t v20 = [CACLanguageModel alloc];
      uint64_t v21 = *MEMORY[0x263F78BF8];
      int v22 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v16, *MEMORY[0x263F78C60], 0);
      long long v23 = [(CACLanguageModel *)v20 initWithText:&stru_26EB332F0 identifier:v21 attributes:v22];

      [(CACLanguageModel *)v18 addChildLanguageModel:v19];
      [(CACLanguageModel *)v18 addChildLanguageModel:v23];
      [(CACLanguageModel *)v2->_languageModelCache addChildLanguageModel:v18];
      uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", &stru_26EB332F0, 0);
      strings = v2->_strings;
      v2->_strings = (NSArray *)v24;
    }
    else if ([(CACSpokenCommand *)v2 isCustomCommand])
    {
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      v55 = v2;
      id v26 = v2->_strings;
      uint64_t v27 = [(NSArray *)v26 countByEnumeratingWithState:&v58 objects:v65 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v59 != v29) {
              objc_enumerationMutation(v26);
            }
            uint64_t v31 = *(void *)(*((void *)&v58 + 1) + 8 * i);
            id v57 = 0;
            long long v32 = [MEMORY[0x263F78BC8] languageModelDictionaryFromCommandText:v31 parsingErrorString:&v57];
            id v33 = v57;
            long long v34 = 0;
            if (![v33 length])
            {
              long long v34 = +[CACSpokenCommand languageModelFromCommandDictionary:v32 tokenResolution:0 containsBuiltInIdentifier:0 error:0];
            }
            if ([v33 length]) {
              NSLog(&cfstr_ErrorCreatingL_0.isa, v31, v33);
            }
            else {
              [(CACLanguageModel *)v55->_languageModelCache addChildLanguageModel:v34];
            }
          }
          uint64_t v28 = [(NSArray *)v26 countByEnumeratingWithState:&v58 objects:v65 count:16];
        }
        while (v28);
      }

      id v2 = v55;
    }
    else
    {
      objc_super v35 = +[CACPreferences sharedPreferences];
      v36 = [v35 bestLocaleIdentifier];
      id v37 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
      __int16 v38 = [v37 commandStringsTableForLocaleIdentifier:v36];

      uint64_t v39 = [(CACSpokenCommand *)v2 identifier];
      long long v40 = [MEMORY[0x263F78BC8] activeTargetTypes];
      id v64 = 0;
      uint64_t v41 = [v38 languageModelDictionaryForCommandIdentifier:v39 targetTypes:v40 parsingErrorString:&v64];
      id v42 = v64;

      if (!v2->_strings)
      {
        long long v43 = [v35 builtInCommandsStringsTableForLocaleIdentifier:v36];
        long long v44 = [v38 spokenStringPermutationsOfLanguageModelDictionary:v41 stringsTable:v43];
        if ([v44 count])
        {
          id v45 = objc_alloc(MEMORY[0x263EFF8C0]);
          v46 = [v44 firstObject];
          uint64_t v47 = objc_msgSend(v45, "initWithObjects:", v46, 0);
          uint64_t v48 = v2->_strings;
          v2->_strings = (NSArray *)v47;
        }
        else
        {
          v46 = v2->_strings;
          v2->_strings = 0;
        }
      }
      if (v41 && ![v42 length])
      {
        v49 = objc_opt_new();
        char v63 = 0;
        id v62 = 0;
        v51 = +[CACSpokenCommand languageModelFromCommandDictionary:v41 tokenResolution:v49 containsBuiltInIdentifier:&v63 error:&v62];
        id v50 = v62;
        if (v50)
        {
          v52 = [(CACSpokenCommand *)v2 identifier];
          [v50 localizedDescription];
          v53 = v56 = v51;
          NSLog(&cfstr_ErrorCreatingL.isa, v52, v53);

          v51 = v56;
        }
        else
        {
          [(CACLanguageModel *)v2->_languageModelCache addChildLanguageModel:v51];
        }
      }
      else
      {
        v49 = [(CACSpokenCommand *)v2 identifier];
        NSLog(&cfstr_ErrorCreatingL.isa, v49, v42);
        id v50 = 0;
      }
    }
    languageModelCache = v2->_languageModelCache;
  }
  return languageModelCache;
}

- (BOOL)isListening
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
  char v3 = [WeakRetained isListening];

  return v3;
}

- (BOOL)isExectuting
{
  return self->_exectutionStartTime != 0.0;
}

- (void)setExecuting:(BOOL)a3
{
  if (a3)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    self->_exectutionStartTime = v4;
  }
  else
  {
    self->_exectutionStartTime = 0.0;
    self->_executionCompletionDeterminedManually = 0;
    executionCompletionBlock = (void (**)(id, CACSpokenCommand *))self->_executionCompletionBlock;
    if (executionCompletionBlock)
    {
      executionCompletionBlock[2](executionCompletionBlock, self);
      id v6 = self->_executionCompletionBlock;
    }
    else
    {
      id v6 = 0;
    }
    self->_executionCompletionBlock = 0;

    id v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v7 didFinishExecutingSpokenCommand:self];
  }
}

- (BOOL)isCompletionDeterminedManually
{
  return self->_executionCompletionDeterminedManually;
}

- (void)setCompletionDeterminedManually:(BOOL)a3
{
  self->_executionCompletionDeterminedManually = a3;
}

- (void)setCompletionBlock:(id)a3
{
  self->_executionCompletionBlock = (id)MEMORY[0x23EC8F1E0](a3, a2);
  MEMORY[0x270F9A758]();
}

- (void)performAction
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  char v3 = RXSignpostLog();
  double v4 = &off_238415000;
  if (os_signpost_enabled(v3))
  {
    uint64_t v5 = [(NSString *)self->_identifier UTF8String];
    *(_DWORD *)buf = 136315138;
    v73 = v5;
    _os_signpost_emit_with_name_impl(&dword_238377000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdRec: Performing action.", "%s", buf, 0xCu);
  }

  id v6 = +[CACDisplayManager sharedManager];
  [v6 hideDictationRecognizerModeOverlayNow];

  id v7 = [(CACSpokenCommand *)self identifier];
  int v8 = [v7 hasPrefix:@"Dictation."];

  if (!v8)
  {
    objc_super v14 = +[CACSpokenCommandGestureManager defaultGestureManager];
    char v15 = +[CACDisplayManager sharedManager];
    [v15 defaultPortraitUpPointForGestures];
    objc_msgSend(v14, "setDefaultPortraitUpPointForGestures:");

    if (![(NSString *)self->_identifier isEqualToString:@"VoiceOver.StopSpeaking"])
    {
      uint64_t v16 = [(CACSpokenCommand *)self contextEvaluation];
      uint64_t v17 = [v16 objectForKey:kCACCommandContextDeferRecognizedStringDisplay];
      char v18 = [v17 BOOLValue];

      if ((v18 & 1) == 0)
      {
        uint64_t v19 = [(CACSpokenCommand *)self recognizedParameters];
        uint64_t v20 = +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:v19 variantOverrides:0];
        +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:v20];
      }
    }
    uint64_t v21 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v22 = [v21 isActiveOverlayType:@"NumberedGrid"];

    if (v22)
    {
      double v4 = &off_238415000;
      if (![(NSString *)self->_identifier isEqualToString:@"System.ShowGrid"]
        && ![(NSString *)self->_identifier isEqualToString:@"System.HideGrid"]
        && ![(NSString *)self->_identifier isEqualToString:@"System.OverlayChooseLabel"]
        && ![(NSString *)self->_identifier isEqualToString:@"System.OverlayChooseLabelWithoutPrefix"])
      {
        long long v23 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        [v23 cancelAnyTransientOverlay];
      }
      uint64_t v24 = +[CACDisplayManager sharedManager];
      [v24 resetGridIdleTimer];
      goto LABEL_41;
    }
    BOOL v25 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v26 = [v25 isActiveOverlayType:@"NumberedElements"];

    if (v26)
    {
      if (![(NSString *)self->_identifier isEqualToString:@"System.ShowLabels"])
      {
        double v4 = &off_238415000;
        if ([(NSString *)self->_identifier isEqualToString:@"System.HideLabels"]) {
          goto LABEL_42;
        }
        if ([(NSString *)self->_identifier isEqualToString:@"System.GoHome"])
        {
          uint64_t v27 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          [v27 setNextFetchDelayFactor:8.0];
        }
        uint64_t v28 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        BOOL v29 = [(NSString *)self->_identifier isEqualToString:@"System.OverlayChooseLabel"]
           || [(NSString *)self->_identifier isEqualToString:@"System.OverlayChooseLabelWithoutPrefix"]|| [(NSString *)self->_identifier isEqualToString:@"System.OverlayChooseAllLabels"];
        [v28 setShouldPreserveDisambiguationHandler:v29];

        v36 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        [v36 cancelAnyTransientOverlay];

        uint64_t v24 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        [v24 setShouldPreserveDisambiguationHandler:0];
LABEL_41:

        goto LABEL_42;
      }
      goto LABEL_26;
    }
    id v30 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    int v31 = [v30 isActiveOverlayType:@"NamedElements"];

    if (v31)
    {
      if (![(NSString *)self->_identifier isEqualToString:@"System.ShowElementNames"])
      {
        double v4 = &off_238415000;
        if ([(NSString *)self->_identifier isEqualToString:@"System.HideElementNames"]) {
          goto LABEL_42;
        }
        uint64_t v24 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        [v24 cancelAnyTransientOverlay];
        goto LABEL_41;
      }
LABEL_26:
      double v4 = &off_238415000;
      goto LABEL_42;
    }
    long long v32 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    if ([v32 isActiveOverlayType:@"NumberedWords"]) {
      goto LABEL_34;
    }
    id v33 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    if ([v33 isActiveOverlayType:@"NumberedLines"])
    {
LABEL_33:

LABEL_34:
LABEL_35:
      uint64_t v24 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v24 cancelAnyTransientOverlay];
      goto LABEL_36;
    }
    long long v34 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    if ([v34 isActiveOverlayType:@"NumberedCharacters"])
    {
LABEL_32:

      goto LABEL_33;
    }
    objc_super v35 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    if ([v35 isActiveOverlayType:@"NumberedSentences"])
    {

      goto LABEL_32;
    }
    id v64 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    char v65 = [v64 isActiveOverlayType:@"NumberedParagraphs"];

    if (v65) {
      goto LABEL_35;
    }
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v24 = +[CACSpokenCommandGestureManager allManagers];
    uint64_t v57 = [v24 countByEnumeratingWithState:&v67 objects:v71 count:16];
    if (!v57) {
      goto LABEL_36;
    }
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v68;
LABEL_82:
    uint64_t v60 = 0;
    while (1)
    {
      if (*(void *)v68 != v59) {
        objc_enumerationMutation(v24);
      }
      long long v61 = *(void **)(*((void *)&v67 + 1) + 8 * v60);
      if ([v61 isInDragGesture]) {
        break;
      }
      if ([v61 isIn3DTouchGesture])
      {
        identifier = self->_identifier;
        char v63 = &unk_26EB4D010;
LABEL_89:
        if (([v63 containsObject:identifier] & 1) == 0) {
          [v61 resetState];
        }
      }
      if (v58 == ++v60)
      {
        uint64_t v58 = [v24 countByEnumeratingWithState:&v67 objects:v71 count:16];
        if (!v58)
        {
LABEL_36:
          double v4 = &off_238415000;
          goto LABEL_41;
        }
        goto LABEL_82;
      }
    }
    identifier = self->_identifier;
    char v63 = &unk_26EB4CFF8;
    goto LABEL_89;
  }
  id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v10 = [v9 disambiguationHandler];
  uint64_t v11 = [v10 labeledElements];
  int v12 = [v11 firstObject];
  uint64_t v13 = [v12 textMarkerRange];

  if (!v13) {
    goto LABEL_43;
  }
  objc_super v14 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v14 cancelAnyTransientOverlay];
LABEL_42:

LABEL_43:
  id v37 = +[CACRecordedUserActionManager sharedManager];
  if ([v37 isRecording])
  {
    if ([(NSString *)self->_identifier isEqualToString:@"System.LockScreen"]
      || [(NSString *)self->_identifier isEqualToString:@"Accessibility.DisableCommandAndControl"])
    {

LABEL_47:
      __int16 v38 = +[CACDisplayManager sharedManager];
      uint64_t v39 = +[CACLocaleUtilities localizedUIStringForKey:@"CommandRecording.Warning.StoppedBecauseOfCommandIdentifier"];
      [v38 displayMessageString:v39 type:0];

      dispatch_time_t v40 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __33__CACSpokenCommand_performAction__block_invoke;
      block[3] = &unk_264D115D0;
      void block[4] = self;
      dispatch_after(v40, MEMORY[0x263EF83A0], block);
      goto LABEL_74;
    }
    BOOL v45 = [(NSString *)self->_identifier isEqualToString:@"System.SleepListening"];

    if (v45) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  uint64_t v41 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v42 = [v41 focusedElement];

  [(CACSpokenCommand *)self setExecuting:1];
  p_SEL action = &self->_action;
  if (objc_opt_respondsToSelector())
  {
    if (self->_action) {
      SEL action = self->_action;
    }
    else {
      SEL action = 0;
    }
    v46 = self;
    uint64_t v47 = v42;
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      uint64_t v48 = [MEMORY[0x263F21668] systemWideElement];
      char v49 = objc_opt_respondsToSelector();

      if (v49)
      {
        id v50 = [MEMORY[0x263F21668] systemWideElement];
      }
      else
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
        char v52 = objc_opt_respondsToSelector();

        if ((v52 & 1) == 0)
        {
          [(CACSpokenCommand *)self handleSpokenCommand:0];
          goto LABEL_73;
        }
        id v50 = objc_loadWeakRetained((id *)&self->_commandRecognizer);
      }
      v53 = v50;
      if (*p_action) {
        SEL v54 = *p_action;
      }
      else {
        SEL v54 = 0;
      }
      [v50 performSelector:v54 withObject:self];

      goto LABEL_73;
    }
    if (*p_action) {
      SEL action = *p_action;
    }
    else {
      SEL action = 0;
    }
    v46 = v42;
    uint64_t v47 = self;
  }
  [(CACSpokenCommand *)v46 performSelector:action withObject:v47];
LABEL_73:

LABEL_74:
  if (!self->_executionCompletionDeterminedManually) {
    [(CACSpokenCommand *)self setExecuting:0];
  }
  v55 = RXSignpostLog();
  if (os_signpost_enabled(v55))
  {
    v56 = [(NSString *)self->_identifier UTF8String];
    *(_DWORD *)buf = *((void *)v4 + 389);
    v73 = v56;
    _os_signpost_emit_with_name_impl(&dword_238377000, v55, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CAC, CmdRec: Performing action.", "%s", buf, 0xCu);
  }
}

uint64_t __33__CACSpokenCommand_performAction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopRecordingUserActions];
}

- (void)openApplication
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_238377000, v0, v1, "Ambiguous spoken command recognized parameters for openApplication", v2, v3, v4, v5, v6);
}

- (void)closeApplication
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_238377000, v0, OS_LOG_TYPE_DEBUG, "Close Application", v1, 2u);
}

- (void)closeFrontApplication
{
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_238377000, v0, OS_LOG_TYPE_DEBUG, "Close Front Application", v1, 2u);
}

- (void)_didShowOverlayWithHintIdentifier:(id)a3 hint:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  uint8_t v6 = +[CACPreferences sharedPreferences];
  if (([v6 userHintsFeatures] & 2) != 0)
  {
    id v7 = +[CACUserHintsManager sharedManager];
    int v8 = [v7 shouldDisplayUserHintAfterRegisteringIdentifier:v10];

    if (v8)
    {
      id v9 = +[CACDisplayManager sharedManager];
      [v9 displayMessageString:v5 type:0 announcementCompletion:&__block_literal_global_616];
      goto LABEL_6;
    }
  }
  else
  {
  }
  id v9 = +[CACDisplayManager sharedManager];
  [v9 speakVoiceOverDescriptionForActiveOverlayIfNeeded];
LABEL_6:
}

void __59__CACSpokenCommand__didShowOverlayWithHintIdentifier_hint___block_invoke()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 speakVoiceOverDescriptionForActiveOverlayIfNeeded];
}

- (BOOL)_handleDisambiguationIfNeededWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(CACSpokenCommand *)self recognizedParameters];
  uint8_t v6 = [v5 objectForKey:*MEMORY[0x263F78C58]];

  id v7 = [v6 objectForKey:kCACCommandParameterLabeledElementForDisambiguation];
  int v8 = +[CACDisplayManager sharedManager];
  char v9 = [v8 carPlayConnected];
  if (v7) {
    char v10 = v9;
  }
  else {
    char v10 = 1;
  }

  if ((v10 & 1) == 0)
  {
    uint64_t v28 = self;
    uint64_t v11 = [v6 objectForKey:kCACCommandParameterText];
    int v12 = v11;
    if (!v11 || ![v11 length])
    {
      uint64_t v13 = [v7 label];

      int v12 = (void *)v13;
    }
    objc_super v14 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    uint64_t v15 = [v14 labeledElementsFromScreenWithTitle:v12];

    uint64_t v27 = (void *)v15;
    uint64_t v16 = [[CACDisambiguationHandler alloc] initWithLabeledElements:v15];
    [(CACDisambiguationHandler *)v16 setChosenLabeledElementHandler:v4];
    uint64_t v17 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v17 setDisambiguationHandler:v16];

    char v18 = +[CACDisplayManager sharedManager];
    [v18 startShowingTransientOverlayForType:@"NumberedElements"];

    uint64_t v19 = +[CACPreferences sharedPreferences];
    if ([v19 isEnabledForCommandIdentifier:@"System.OverlayChooseLabelWithoutPrefix"])
    {
      uint64_t v20 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.DisambiguationPrompt"];
    }
    else
    {
      uint64_t v21 = NSString;
      +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.DisambiguationPromptWithCommandAsArgument"];
      int v22 = v26 = v4;
      long long v23 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      uint64_t v24 = [v23 primaryStringForCommandIdentifier:@"System.OverlayChooseLabel"];
      uint64_t v20 = [v21 stringWithValidatedFormat:v22, @"%@", 0, v24 validFormatSpecifiers error];

      id v4 = v26;
    }

    [(CACSpokenCommand *)v28 _didShowOverlayWithHintIdentifier:@"DisambiguationPrompt" hint:v20];
  }

  return v10 ^ 1;
}

- (void)activateScreenItem
{
  if (![(CACSpokenCommand *)self _handleDisambiguationIfNeededWithBlock:0])
  {
    uint64_t v3 = [(CACSpokenCommand *)self recognizedParameters];
    id v4 = [v3 objectForKey:*MEMORY[0x263F78C58]];

    id v5 = [v4 objectForKey:kCACCommandParameterText];
    if (v5)
    {
      uint8_t v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      id v7 = [v6 labeledElementsFromScreenWithTitle:v5];

      int v8 = [v7 firstObject];
      id v9 = v8;
      if (v8)
      {
        char v10 = [v8 element];
        char v11 = objc_opt_respondsToSelector();

        if (v11)
        {
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __38__CACSpokenCommand_activateScreenItem__block_invoke;
          block[3] = &unk_264D115D0;
          id v9 = v9;
          id v17 = v9;
          dispatch_async(MEMORY[0x263EF83A0], block);
        }
      }
    }
    else
    {
      id v7 = [v4 objectForKey:kCACCommandParameterLabeledElement];
      int v12 = [v7 element];
      char v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) == 0)
      {
LABEL_9:

        return;
      }
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __38__CACSpokenCommand_activateScreenItem__block_invoke_2;
      v14[3] = &unk_264D115D0;
      id v7 = v7;
      id v15 = v7;
      dispatch_async(MEMORY[0x263EF83A0], v14);
      id v9 = v15;
    }

    goto LABEL_9;
  }
}

void __38__CACSpokenCommand_activateScreenItem__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) element];
  [v1 cacActivate];
}

void __38__CACSpokenCommand_activateScreenItem__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) element];
  [v1 cacActivate];
}

- (void)handleLabeledElementFromNameOrNumberWithBlock:(id)a3
{
  id v9 = (void (**)(id, void *))a3;
  if (!-[CACSpokenCommand _handleDisambiguationIfNeededWithBlock:](self, "_handleDisambiguationIfNeededWithBlock:"))
  {
    id v4 = [(CACSpokenCommand *)self recognizedParameters];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F78C58]];
    uint8_t v6 = [v5 objectForKeyedSubscript:kCACCommandParameterLabeledElement];

    if (!v6)
    {
      id v7 = [(CACSpokenCommand *)self recognizedParameters];
      int v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F78C28]];
      uint8_t v6 = [v8 objectForKeyedSubscript:kCACCommandParameterLabeledElement];
    }
    v9[2](v9, v6);
  }
}

- (void)handleLabeledElementsFromTwoNumbersWithBlock:(id)a3
{
  id v5 = a3;
  id v11 = [(CACSpokenCommand *)self recognizedParameters];
  uint8_t v6 = [v11 objectForKeyedSubscript:*MEMORY[0x263F78C28]];
  id v7 = [v6 objectForKeyedSubscript:kCACCommandParameterLabeledElement];
  int v8 = [(CACSpokenCommand *)self recognizedParameters];
  id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F78C30]];
  char v10 = [v9 objectForKeyedSubscript:kCACCommandParameterLabeledElement];
  (*((void (**)(id, void *, void *))a3 + 2))(v5, v7, v10);
}

- (void)incrementItem
{
  uint64_t v3 = [(CACSpokenCommand *)self recognizedParameters];
  id v4 = [v3 objectForKey:*MEMORY[0x263F78C18]];
  id v5 = [v4 objectForKey:kCACCommandParameterText];

  if (v5) {
    uint64_t v6 = (int)[v5 intValue];
  }
  else {
    uint64_t v6 = 1;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__CACSpokenCommand_incrementItem__block_invoke;
  v7[3] = &__block_descriptor_40_e27_v16__0__CACLabeledElement_8l;
  v7[4] = v6;
  [(CACSpokenCommand *)self handleLabeledElementFromNameOrNumberWithBlock:v7];
}

void __33__CACSpokenCommand_incrementItem__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 element];
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  [v4 performAction:2004 withValue:v3];
}

- (void)decrementItem
{
  uint64_t v3 = [(CACSpokenCommand *)self recognizedParameters];
  id v4 = [v3 objectForKey:*MEMORY[0x263F78C18]];
  id v5 = [v4 objectForKey:kCACCommandParameterText];

  if (v5) {
    uint64_t v6 = (int)[v5 intValue];
  }
  else {
    uint64_t v6 = 1;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__CACSpokenCommand_decrementItem__block_invoke;
  v7[3] = &__block_descriptor_40_e27_v16__0__CACLabeledElement_8l;
  v7[4] = v6;
  [(CACSpokenCommand *)self handleLabeledElementFromNameOrNumberWithBlock:v7];
}

void __33__CACSpokenCommand_decrementItem__block_invoke(uint64_t a1, void *a2)
{
  id v4 = [a2 element];
  uint64_t v3 = [NSNumber numberWithInteger:*(void *)(a1 + 32)];
  [v4 performAction:2005 withValue:v3];
}

- (void)showVocabulary
{
  uint64_t v2 = [MEMORY[0x263F22968] server];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = MEMORY[0x263EF83A0];
    dispatch_async(v4, &__block_literal_global_638);
  }
}

void __34__CACSpokenCommand_showVocabulary__block_invoke()
{
  id v0 = [MEMORY[0x263F22968] server];
  [v0 performSelector:sel_openCommandAndControlVocabulary withObject:0 afterDelay:0.0];
}

- (void)showTraining
{
  uint64_t v2 = CACLogAccessibility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_238377000, v2, OS_LOG_TYPE_INFO, "Opening Voice Control training.", v4, 2u);
  }

  char v3 = [MEMORY[0x263F22968] server];
  [v3 launchOnboardingViewService:@"voicecontrol"];
}

- (void)showCommands
{
  uint64_t v2 = [MEMORY[0x263F22968] server];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = MEMORY[0x263EF83A0];
    dispatch_async(v4, &__block_literal_global_645);
  }
}

void __32__CACSpokenCommand_showCommands__block_invoke()
{
  id v0 = [MEMORY[0x263F22968] server];
  [v0 performSelector:sel_openCommandAndControlCommands withObject:0 afterDelay:0.0];
}

- (void)showActiveCommands
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v3 = [v2 activeCommandIdentifiers];

  id v4 = +[CACUserHintsManager sharedManager];
  id v30 = (void *)v3;
  id v5 = [v4 suggestedCommandIdentifiersFromActiveCommandIdentifiers:v3 maximumCount:10];

  long long v34 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = +[CACPreferences sharedPreferences];
  uint64_t v7 = [v6 bestLocaleIdentifier];

  int v8 = [MEMORY[0x263F78BD0] sharedSpokenCommandUtilities];
  id v9 = [v8 commandStringsTableForLocaleIdentifier:v7];

  char v10 = +[CACPreferences sharedPreferences];
  BOOL v29 = (void *)v7;
  long long v32 = [v10 builtInCommandsStringsTableForLocaleIdentifier:v7];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v33 = *(void *)v36;
    unint64_t v13 = 0x263F08000uLL;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * v14);
        uint64_t v16 = [MEMORY[0x263F78BC8] activeTargetTypes];
        id v17 = [v9 descriptionStringForCommandIdentifier:v15 descriptionType:@"SUMM" targetTypes:v16];

        uint64_t v18 = [v17 length];
        id v19 = objc_alloc(MEMORY[0x263F089B8]);
        if (v18)
        {
          uint64_t v20 = (void *)[v19 initWithString:v17];
          [v9 resolveReferencesInMutableAttributedString:v20 stringsTable:v32];
        }
        else
        {
          uint64_t v20 = (void *)[v19 initWithString:&stru_26EB332F0];
        }
        uint64_t v21 = *(void **)(v13 + 2880);
        int v22 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
        long long v23 = [v22 primaryStringForCommandIdentifier:v15];
        uint64_t v24 = [v21 stringWithFormat:@"“%@”", v23];

        BOOL v25 = [v20 string];
        if ([v25 length])
        {
          id v26 = [*(id *)(v13 + 2880) stringWithFormat:@"%@", v25];
        }
        else
        {
          id v26 = 0;
        }
        uint64_t v27 = +[CACOnboardingFeature featureWithTitleText:v24 helperText:v26 imageBundleName:@"onboarding-gestures"];
        [v34 addObject:v27];

        ++v14;
        unint64_t v13 = 0x263F08000;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v12);
  }

  uint64_t v28 = +[CACDisplayManager sharedManager];
  [v28 showContextCluesViewWithCommands:v34];
}

- (void)showNumberedElements
{
  uint64_t v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v3 setDisambiguationHandler:0];

  id v4 = +[CACPreferences sharedPreferences];
  id v5 = [v4 alwaysShowOverlayType];
  int v6 = [v5 isEqualToString:@"NumberedElements"];

  if (v6)
  {
    uint64_t v7 = +[CACDisplayManager sharedManager];
    int v8 = v7;
    id v9 = 0;
  }
  else
  {
    char v10 = +[CACPreferences sharedPreferences];
    uint64_t v11 = [v10 alwaysShowOverlayType];
    int v12 = [v11 isEqualToString:@"NumberedGrid"];

    if (v12)
    {
      unint64_t v13 = +[CACDisplayManager sharedManager];
      [v13 hideAnyNonInteractiveOverlay];
    }
    uint64_t v7 = +[CACDisplayManager sharedManager];
    int v8 = v7;
    id v9 = @"NumberedElements";
  }
  [v7 startShowingTransientOverlayForType:v9];

  uint64_t v14 = +[CACPreferences sharedPreferences];
  if ([v14 isEnabledForCommandIdentifier:@"System.OverlayChooseLabelWithoutPrefix"])
  {
    id v19 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ShowNumbersPrompt"];
  }
  else
  {
    uint64_t v15 = NSString;
    uint64_t v16 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ShowNumbersPromptWithCommandAsArgument"];
    id v17 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    uint64_t v18 = [v17 primaryStringForCommandIdentifier:@"System.OverlayChooseLabel"];
    id v19 = [v15 stringWithValidatedFormat:v16, @"%@", 0, v18 validFormatSpecifiers error];
  }
  [(CACSpokenCommand *)self _didShowOverlayWithHintIdentifier:@"ShowNumbersPrompt" hint:v19];
}

- (void)hideNumberedElements
{
  uint64_t v2 = +[CACPreferences sharedPreferences];
  uint64_t v3 = [v2 alwaysShowOverlayType];
  int v4 = [v3 isEqualToString:@"NumberedElements"];

  if (v4)
  {
    id v5 = +[CACPreferences sharedPreferences];
    [v5 setAlwaysShowOverlayType:@"None"];
  }
  int v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v7 = [v6 transientOverlayType];
  int v8 = [v7 isEqualToString:@"NumberedElements"];

  if (v8)
  {
    id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v9 setTransientOverlayType:0];
  }
  char v10 = +[CACDisplayManager sharedManager];
  [v10 hideAnyOverlayAnimated:1 includeInteractiveOverlays:0];

  id v11 = +[CACDisplayManager sharedManager];
  [v11 refreshOverlays];
}

- (void)alwaysShowOverlayNumbers
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 setAlwaysShowOverlayType:@"NumberedElements"];

  [(CACSpokenCommand *)self showNumberedElements];
}

- (void)showNumberedWords
{
}

void __37__CACSpokenCommand_showNumberedWords__block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  id v1 = [v0 alwaysShowOverlayType];
  int v2 = [v1 isEqualToString:@"NumberedGrid"];

  if (v2)
  {
    uint64_t v3 = +[CACDisplayManager sharedManager];
    [v3 hideAnyNonInteractiveOverlay];
  }
  id v4 = +[CACDisplayManager sharedManager];
  [v4 startShowingTransientOverlayForType:@"NumberedWords"];
}

- (void)showNumberedLines
{
}

void __37__CACSpokenCommand_showNumberedLines__block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  id v1 = [v0 alwaysShowOverlayType];
  int v2 = [v1 isEqualToString:@"NumberedGrid"];

  if (v2)
  {
    uint64_t v3 = +[CACDisplayManager sharedManager];
    [v3 hideAnyNonInteractiveOverlay];
  }
  id v4 = +[CACDisplayManager sharedManager];
  [v4 startShowingTransientOverlayForType:@"NumberedLines"];
}

- (void)showNumberedCharacters
{
}

void __42__CACSpokenCommand_showNumberedCharacters__block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  id v1 = [v0 alwaysShowOverlayType];
  int v2 = [v1 isEqualToString:@"NumberedGrid"];

  if (v2)
  {
    uint64_t v3 = +[CACDisplayManager sharedManager];
    [v3 hideAnyNonInteractiveOverlay];
  }
  id v4 = +[CACDisplayManager sharedManager];
  [v4 startShowingTransientOverlayForType:@"NumberedCharacters"];
}

- (void)showNumberedParagraphs
{
}

void __42__CACSpokenCommand_showNumberedParagraphs__block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  id v1 = [v0 alwaysShowOverlayType];
  int v2 = [v1 isEqualToString:@"NumberedGrid"];

  if (v2)
  {
    uint64_t v3 = +[CACDisplayManager sharedManager];
    [v3 hideAnyNonInteractiveOverlay];
  }
  id v4 = +[CACDisplayManager sharedManager];
  [v4 startShowingTransientOverlayForType:@"NumberedParagraphs"];
}

- (void)showNumberedSentences
{
}

void __41__CACSpokenCommand_showNumberedSentences__block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  id v1 = [v0 alwaysShowOverlayType];
  int v2 = [v1 isEqualToString:@"NumberedGrid"];

  if (v2)
  {
    uint64_t v3 = +[CACDisplayManager sharedManager];
    [v3 hideAnyNonInteractiveOverlay];
  }
  id v4 = +[CACDisplayManager sharedManager];
  [v4 startShowingTransientOverlayForType:@"NumberedSentences"];
}

- (void)showNumberedGrid
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CACSpokenCommand_showNumberedGrid__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __36__CACSpokenCommand_showNumberedGrid__block_invoke(uint64_t a1)
{
  int v2 = +[CACDisplayManager sharedManager];
  [v2 updateGridLayoutFromPreferences];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 _displayNumberedGridAtCurrentNumberOfColumnsAndRows];
}

- (void)_displayNumberedGridAtCurrentNumberOfColumnsAndRows
{
  int v2 = +[CACPreferences sharedPreferences];
  uint64_t v3 = [v2 alwaysShowOverlayType];
  int v4 = [v3 isEqualToString:@"NumberedGrid"];

  id v5 = +[CACDisplayManager sharedManager];
  int v6 = v5;
  if (v4)
  {
    [v5 startShowingTransientOverlayForType:0];

    int v6 = +[CACDisplayManager sharedManager];
    [v6 resetGrid];
  }
  else
  {
    [v5 startShowingTransientOverlayForType:@"NumberedGrid"];
  }

  id v10 = +[CACPreferences sharedPreferences];
  if (([v10 userHintsFeatures] & 2) != 0)
  {
    uint64_t v7 = +[CACUserHintsManager sharedManager];
    int v8 = [v7 shouldDisplayUserHintAfterRegisteringIdentifier:@"ShowGridPrompt"];

    if (!v8) {
      return;
    }
    id v10 = +[CACDisplayManager sharedManager];
    id v9 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ShowGridPrompt"];
    [v10 displayMessageString:v9 type:0];
  }
}

- (void)hideNumberedGrid
{
  int v2 = +[CACPreferences sharedPreferences];
  uint64_t v3 = [v2 alwaysShowOverlayType];
  int v4 = [v3 isEqualToString:@"NumberedGrid"];

  if (v4)
  {
    id v5 = +[CACPreferences sharedPreferences];
    [v5 setAlwaysShowOverlayType:@"None"];
  }
  int v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v7 = [v6 transientOverlayType];
  int v8 = [v7 isEqualToString:@"NumberedGrid"];

  if (v8)
  {
    id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v9 setTransientOverlayType:0];
  }
  id v10 = +[CACDisplayManager sharedManager];
  [v10 hideAnyOverlayAnimated:1 includeInteractiveOverlays:0];

  id v11 = +[CACDisplayManager sharedManager];
  [v11 refreshOverlays];

  id v12 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v12 forceSynchronizeRecognizersForBuiltInLMIdentifier:*MEMORY[0x263F78C58]];
}

- (void)alwaysShowOverlayGrid
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 setAlwaysShowOverlayType:@"NumberedGrid"];

  [(CACSpokenCommand *)self showNumberedGrid];
}

- (void)alwaysShowOverlayGridWithNumberOfColumns
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 setAlwaysShowOverlayType:@"NumberedGrid"];

  BOOL v4 = [(CACSpokenCommand *)self _updateGridWithNumberOfColumnsAndRows:0];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CACSpokenCommand_alwaysShowOverlayGridWithNumberOfColumns__block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  BOOL v6 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__CACSpokenCommand_alwaysShowOverlayGridWithNumberOfColumns__block_invoke(uint64_t a1)
{
  id v2 = +[CACDisplayManager sharedManager];
  [v2 updatePreferencesFromCurrentGridLayoutForRows:*(unsigned __int8 *)(a1 + 32) forColumns:1];
}

- (void)alwaysShowOverlayGridWithNumberOfRows
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 setAlwaysShowOverlayType:@"NumberedGrid"];

  [(CACSpokenCommand *)self _updateGridWithNumberOfRows:0];
  BOOL v4 = MEMORY[0x263EF83A0];
  dispatch_async(v4, &__block_literal_global_686);
}

void __57__CACSpokenCommand_alwaysShowOverlayGridWithNumberOfRows__block_invoke()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 updatePreferencesFromCurrentGridLayoutForRows:1 forColumns:0];
}

- (void)showElementNames
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  BOOL v4 = [v3 alwaysShowOverlayType];
  int v5 = [v4 isEqualToString:@"NamedElements"];

  if (v5)
  {
    BOOL v6 = +[CACDisplayManager sharedManager];
    uint64_t v7 = v6;
    int v8 = 0;
  }
  else
  {
    id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    id v10 = [v9 activeOverlayType];
    int v11 = [v10 isEqualToString:@"NumberedGrid"];

    if (v11)
    {
      id v12 = +[CACDisplayManager sharedManager];
      [v12 hideAnyNonInteractiveOverlay];
    }
    BOOL v6 = +[CACDisplayManager sharedManager];
    uint64_t v7 = v6;
    int v8 = @"NamedElements";
  }
  [v6 startShowingTransientOverlayForType:v8];

  unint64_t v13 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v20 = [v13 primaryStringForCommandIdentifier:@"System.PressItem"];

  uint64_t v14 = +[CACPreferences sharedPreferences];
  int v15 = [v14 isEnabledForCommandIdentifier:@"System.PressItemWithoutPrefix"];

  uint64_t v16 = v20;
  if (v15)
  {
    id v17 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ShowNamesPrompt"];
  }
  else
  {
    if (!v20) {
      goto LABEL_12;
    }
    uint64_t v18 = NSString;
    id v19 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ShowNamesPromptWithCommandAsArgument"];
    id v17 = [v18 stringWithValidatedFormat:v19, @"%@", 0, v20 validFormatSpecifiers error];
  }
  uint64_t v16 = v20;
  if (v17)
  {
    [(CACSpokenCommand *)self _didShowOverlayWithHintIdentifier:@"ShowNamesPrompt" hint:v17];

    uint64_t v16 = v20;
  }
LABEL_12:
}

- (void)hideElementNames
{
  id v2 = +[CACPreferences sharedPreferences];
  uint64_t v3 = [v2 alwaysShowOverlayType];
  int v4 = [v3 isEqualToString:@"NamedElements"];

  if (v4)
  {
    int v5 = +[CACPreferences sharedPreferences];
    [v5 setAlwaysShowOverlayType:@"None"];
  }
  BOOL v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v7 = [v6 transientOverlayType];
  int v8 = [v7 isEqualToString:@"NamedElements"];

  if (v8)
  {
    id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v9 setTransientOverlayType:0];
  }
  id v10 = +[CACDisplayManager sharedManager];
  [v10 hideAnyOverlayAnimated:1 includeInteractiveOverlays:0];

  id v11 = +[CACDisplayManager sharedManager];
  [v11 refreshOverlays];
}

- (void)alwaysShowOverlayNames
{
  uint64_t v3 = +[CACPreferences sharedPreferences];
  [v3 setAlwaysShowOverlayType:@"NamedElements"];

  [(CACSpokenCommand *)self showElementNames];
}

- (void)showGridWithNumberOfColumns
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__CACSpokenCommand_showGridWithNumberOfColumns__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __47__CACSpokenCommand_showGridWithNumberOfColumns__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateGridWithNumberOfColumnsAndRows:1];
}

- (BOOL)_updateGridWithNumberOfColumnsAndRows:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CACSpokenCommand *)self recognizedParameters];
  BOOL v6 = [v5 objectForKey:*MEMORY[0x263F78C18]];
  uint64_t v7 = [v6 objectForKey:kCACCommandParameterText];

  if (v7)
  {
    uint64_t v8 = [v7 integerValue];
    id v9 = [(CACSpokenCommand *)self recognizedParameters];
    id v10 = [v9 objectForKey:*MEMORY[0x263F78C20]];
    id v11 = [v10 objectForKey:kCACCommandParameterText];

    uint64_t v12 = [v11 integerValue];
    unint64_t v13 = +[CACDisplayManager sharedManager];
    [v13 updateGridLayoutWithNumberOfRows:v12 numberOfColumns:v8 shouldPreferRows:0];

    if (v3) {
      [(CACSpokenCommand *)self _displayNumberedGridAtCurrentNumberOfColumnsAndRows];
    }
    BOOL v14 = [v11 length] != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)_updateGridWithNumberOfRows:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CACSpokenCommand *)self recognizedParameters];
  BOOL v6 = [v5 objectForKey:*MEMORY[0x263F78C18]];
  id v10 = [v6 objectForKey:kCACCommandParameterText];

  uint64_t v7 = v10;
  if (v10)
  {
    uint64_t v8 = [v10 integerValue];
    id v9 = +[CACDisplayManager sharedManager];
    [v9 updateGridLayoutWithNumberOfRows:v8 numberOfColumns:0 shouldPreferRows:1];

    uint64_t v7 = v10;
    if (v3)
    {
      [(CACSpokenCommand *)self _displayNumberedGridAtCurrentNumberOfColumnsAndRows];
      uint64_t v7 = v10;
    }
  }
}

- (void)chooseOverlayItem
{
  BOOL v3 = [(CACSpokenCommand *)self recognizedParameters];
  int v4 = [v3 objectForKey:*MEMORY[0x263F78C28]];
  id v27 = [v4 objectForKey:kCACCommandParameterLabeledElement];

  int v5 = [v27 element];
  if (v5)
  {
    BOOL v6 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    uint64_t v7 = [v6 disambiguationHandler];

    uint64_t v8 = [v27 textMarkerRange];
    id v9 = v8;
    if (v8) {
      BOOL v10 = v7 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      long long v23 = [v8 startMarker];
      uint64_t v24 = [v9 startMarker];
      BOOL v25 = +[CACTextMarkerRange markerRangeWithStartMarker:v23 endMarker:v24];

      [v5 cacSetTextSelectionToCACTextMarkerRange:v25];
      id v26 = +[CACDisplayManager sharedManager];
      [v26 refreshOverlays];
    }
    else
    {
      [(CACSpokenCommand *)self pressOverlayItem];
    }
  }
  else
  {
    id v11 = +[CACDisplayManager sharedManager];
    [v27 rectangle];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    id v20 = [v27 label];
    char v21 = objc_msgSend(v11, "updateGridWithPortraitUpRect:gridContainingLabel:", v20, v13, v15, v17, v19);

    if ((v21 & 1) == 0)
    {
      int v22 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v22 cancelAnyTransientOverlay];

      [(CACSpokenCommand *)self pressOverlayItem];
    }
  }
}

- (void)pressOverlayItem
{
  BOOL v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 disambiguationHandler];

  int v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v5 cancelAnyTransientOverlay];

  BOOL v6 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v7 = [v6 objectForKey:*MEMORY[0x263F78C28]];
  uint64_t v8 = [v7 objectForKey:kCACCommandParameterLabeledElement];

  if (v4)
  {
    [v4 handleChosenLabeledElement:v8];
    id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v9 setDisambiguationHandler:0];
  }
  else
  {
    id v9 = [v8 element];
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __36__CACSpokenCommand_pressOverlayItem__block_invoke;
      block[3] = &unk_264D115D0;
      id v16 = v9;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
    else
    {
      [(CACSpokenCommand *)self tap];
      BOOL v10 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      int v11 = [v10 isActiveOverlayType:@"NumberedGrid"];

      if (v11)
      {
        double v12 = +[CACDisplayManager sharedManager];
        int v13 = [v12 updateGridLayoutFromPreferences];

        if (v13)
        {
          double v14 = +[CACDisplayManager sharedManager];
          [v14 resetGrid];
        }
      }
    }
  }
}

uint64_t __36__CACSpokenCommand_pressOverlayItem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacActivate];
}

- (void)chooseAllOverlayItems
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  BOOL v3 = [v2 disambiguationHandler];

  if (v3)
  {
    int v4 = [v3 chosenLabeledElementHandler];

    if (v4)
    {
      int v5 = [v3 labeledElements];
      uint64_t v6 = [v5 count] - 1;
      if (v6 >= 0)
      {
        uint64_t v7 = MEMORY[0x263EF83A0];
        do
        {
          uint64_t v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
          [v8 cancelAnyTransientOverlay];

          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __41__CACSpokenCommand_chooseAllOverlayItems__block_invoke;
          block[3] = &unk_264D11CA8;
          id v11 = v3;
          id v12 = v5;
          uint64_t v13 = v6;
          dispatch_async(v7, block);
          usleep(0x7A120u);

          --v6;
        }
        while (v6 != -1);
      }
      id v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v9 setDisambiguationHandler:0];
    }
  }
}

void __41__CACSpokenCommand_chooseAllOverlayItems__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(a1 + 48)];
  [v1 handleChosenLabeledElement:v2];
}

- (void)handleSleepListening
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 enterSleepInteractionLevel];
}

- (void)handleWakeListening
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 exitSleepInteractionLevel];
}

- (void)disableCommandAndControl
{
  dispatch_time_t v2 = dispatch_time(0, 1500000000);
  BOOL v3 = MEMORY[0x263EF83A0];
  dispatch_after(v2, v3, &__block_literal_global_704);
}

void __44__CACSpokenCommand_disableCommandAndControl__block_invoke()
{
  id v0 = +[CACPreferences sharedPreferences];
  [v0 setCommandAndControlEnabled:0];
}

- (void)sleepCarPlay
{
  [(CACSpokenCommand *)self handleWakeListening];
  dispatch_time_t v2 = MEMORY[0x263EF83A0];
  dispatch_async(v2, &__block_literal_global_706);
}

void __32__CACSpokenCommand_sleepCarPlay__block_invoke()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 carPlayDidConnect:0];
}

- (void)wakeCarPlay
{
  [(CACSpokenCommand *)self handleWakeListening];
  dispatch_time_t v2 = MEMORY[0x263EF83A0];
  dispatch_async(v2, &__block_literal_global_708);
}

void __31__CACSpokenCommand_wakeCarPlay__block_invoke()
{
  id v0 = +[CACDisplayManager sharedManager];
  [v0 carPlayDidConnect:1];
}

- (void)startDictationMode
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 setDictationRecognizerMode:0];
}

- (void)startCommandMode
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 setDictationRecognizerMode:1];

  BOOL v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 dictationRecognizerMode];

  if (v4)
  {
    id v6 = +[CACDisplayManager sharedManager];
    int v5 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ExitingDictationMode"];
    [v6 displayMessageString:v5 type:0];
  }
}

- (void)startSpellingMode
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 setDictationRecognizerMode:3];

  BOOL v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 dictationRecognizerMode];

  if (v4)
  {
    id v6 = +[CACDisplayManager sharedManager];
    int v5 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ExitingDictationMode"];
    [v6 displayMessageString:v5 type:0];
  }
}

- (void)startNumberMode
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 setDictationRecognizerMode:2];

  BOOL v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  int v4 = [v3 dictationRecognizerMode];

  if (v4)
  {
    id v6 = +[CACDisplayManager sharedManager];
    int v5 = +[CACLocaleUtilities localizedUIStringForKey:@"InfoMessage.ExitingDictationMode"];
    [v6 displayMessageString:v5 type:0];
  }
}

- (void)goBack
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  BOOL v3 = [v2 labeledElementsFromScreenWithTrait:*MEMORY[0x263F219B0]];

  if (![v3 count])
  {
    uint64_t v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    id v9 = +[CACLocaleUtilities localizedUIStringForKey:@"SafariBackButtonLabel"];
    id v6 = [v8 labeledElementsFromScreenWithTitle:v9];

    if ([v6 count])
    {
      BOOL v10 = [v6 firstObject];
      id v11 = [v10 element];

      id v12 = (id *)v15;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __26__CACSpokenCommand_goBack__block_invoke_2;
      v15[3] = &unk_264D115D0;
      v15[4] = v11;
      id v7 = v11;
    }
    else
    {
      uint64_t v13 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      id v7 = [v13 screenElementsForEscape];

      if (![v7 count]) {
        goto LABEL_8;
      }
      id v12 = (id *)v14;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __26__CACSpokenCommand_goBack__block_invoke_3;
      v14[3] = &unk_264D115D0;
      id v7 = v7;
      void v14[4] = v7;
    }
    dispatch_async(MEMORY[0x263EF83A0], v12);

    goto LABEL_8;
  }
  int v4 = [v3 firstObject];
  int v5 = [v4 element];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__CACSpokenCommand_goBack__block_invoke;
  block[3] = &unk_264D115D0;
  double v17 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v7 = v17;
LABEL_8:
}

uint64_t __26__CACSpokenCommand_goBack__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacActivate];
}

uint64_t __26__CACSpokenCommand_goBack__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacActivate];
}

void __26__CACSpokenCommand_goBack__block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
LABEL_3:
    uint64_t v5 = 0;
    while (1)
    {
      if (*(void *)v7 != v4) {
        objc_enumerationMutation(v1);
      }
      if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5), "cacPerformExcapeAction", (void)v6)) {
        break;
      }
      if (v3 == ++v5)
      {
        uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)showAccessibilityActions
{
}

void __44__CACSpokenCommand_showAccessibilityActions__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v12 = +[CACDisplayManager sharedManager];
  uint64_t v3 = [v2 element];
  [v2 rectangle];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  objc_msgSend(v12, "showElementActionsForElement:usingPortraitUpRect:", v3, v5, v7, v9, v11);
}

- (void)showVirtualKeyboard
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v4 = [v2 focusedElement];

  uint64_t v3 = v4;
  if (v4)
  {
    [v4 performAction:2066];
    uint64_t v3 = v4;
  }
}

- (void)hideVirtualKeyboard
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v4 = [v2 focusedElement];

  uint64_t v3 = v4;
  if (v4)
  {
    [v4 performAction:2067];
    uint64_t v3 = v4;
  }
}

- (void)createCustomCommand
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v12 = [v2 focusedElement];

  if (!v12 || ((uint64_t v3 = [v12 selectedTextRange], v3 != 0x7FFFFFFF) ? (v5 = v4 == 0) : (v5 = 1), v5))
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = v3;
    uint64_t v8 = v4;
    double v9 = [v12 value];
    double v10 = objc_msgSend(v9, "substringWithRange:", v7, v8);

    if ([v10 length]) {
      id v6 = v10;
    }
    else {
      id v6 = 0;
    }
  }
  double v11 = +[CACDisplayManager sharedManager];
  [v11 showCustomCommandEditorWithTextToInsert:v6];
}

- (void)repeatPreviousCommand
{
  uint64_t v3 = 1;
  [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
  uint64_t v4 = [(CACSpokenCommand *)self recognizedParameters];
  BOOL v5 = [v4 objectForKey:*MEMORY[0x263F78C18]];
  id v6 = [v5 objectForKey:kCACCommandParameterText];

  uint64_t v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  if (v6) {
    uint64_t v3 = (int)[v6 intValue];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__CACSpokenCommand_repeatPreviousCommand__block_invoke;
  v8[3] = &unk_264D11CD0;
  v8[4] = self;
  [v7 beginExecutingRepeatingSpokenCommandNumberOfTimes:v3 completionBlock:v8];
}

void __41__CACSpokenCommand_repeatPreviousCommand__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  [*(id *)(a1 + 32) setExecuting:0];
  if ([v7 code])
  {
    uint64_t v3 = [v7 localizedDescription];
    uint64_t v4 = [v3 length];

    if (v4)
    {
      BOOL v5 = +[CACDisplayManager sharedManager];
      id v6 = [v7 localizedDescription];
      [v5 displayMessageString:v6 type:1];
    }
  }
}

- (void)startRecordingGesture
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 startRecordingGesture];

  id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v3 updateStatusIndicatorView];
}

- (void)stopRecordingGesture
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v9 = [v2 stopRecordingGesture];

  uint64_t v3 = [v9 numberOfEvents];
  uint64_t v4 = +[CACDisplayManager sharedManager];
  BOOL v5 = v4;
  if (v3)
  {
    [v4 showCustomCommandEditorWithGesture:v9];
  }
  else
  {
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"CustomCommand.Error.RecordedEmptyGesture" value:&stru_26EB332F0 table:0];
    [v5 displayMessageString:v7 type:1];
  }
  uint64_t v8 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v8 updateStatusIndicatorView];
}

- (void)startRecordingUserActions
{
  id v2 = +[CACRecordedUserActionManager sharedManager];
  [v2 startRecordingUserActions];

  id v3 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v3 updateStatusIndicatorView];
}

- (void)stopRecordingUserActions
{
  id v2 = +[CACRecordedUserActionManager sharedManager];
  int v3 = [v2 isRecording];

  if (v3)
  {
    uint64_t v4 = +[CACRecordedUserActionManager sharedManager];
    [v4 stopRecordingUserActions];

    BOOL v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v5 updateStatusIndicatorView];

    id v6 = +[CACRecordedUserActionManager sharedManager];
    id v8 = [v6 recordedUserActionFlow];

    id v7 = +[CACDisplayManager sharedManager];
    [v7 showCustomCommandEditorWithRecordedUserActionFlow:v8];
  }
}

- (void)searchSpotlight
{
  OUTLINED_FUNCTION_3(a1, a2);
  OUTLINED_FUNCTION_2(&dword_238377000, v2, v3, "Search Spotlight 2.2. Forcing element fetch.", v4);
}

uint64_t __35__CACSpokenCommand_searchSpotlight__block_invoke(uint64_t a1, void *a2)
{
  int v2 = [a2 element];
  uint64_t v3 = [v2 hasAnyTraits:*MEMORY[0x263F219B8]];

  return v3;
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_732(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v3 = [v2 focusedElement];

  uint64_t v4 = CACLogDictationCommands();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v15[0] = 67109120;
    v15[1] = [v3 hasTextEntry];
    _os_log_impl(&dword_238377000, v4, OS_LOG_TYPE_DEFAULT, "Search Spotlight 6. Trying to input text. hasTextEntry: %d", (uint8_t *)v15, 8u);
  }

  if (v3)
  {
    BOOL v5 = [v3 value];
    char v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

    if (v6)
    {
      id v7 = CACLogDictationCommands();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_238377000, v7, OS_LOG_TYPE_DEFAULT, "Search Spotlight 6.4. Search phrase already entered.", (uint8_t *)v15, 2u);
      }
    }
    else
    {
      id v8 = [v3 value];
      uint64_t v9 = [v8 length];

      double v10 = CACLogDictationCommands();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v11)
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl(&dword_238377000, v10, OS_LOG_TYPE_DEFAULT, "Search Spotlight 6.1. Has existing text. Deleting all.", (uint8_t *)v15, 2u);
        }

        id v12 = [[CACTextEditingProvider alloc] initWithSpokenCommand:*(void *)(a1 + 40) axElement:v3];
        uint64_t v13 = [(CACTextEditingProvider *)v12 textEditingEngine];
        [v13 deleteAll];

        usleep(0x61A80u);
      }
      else
      {
        if (v11)
        {
          LOWORD(v15[0]) = 0;
          _os_log_impl(&dword_238377000, v10, OS_LOG_TYPE_DEFAULT, "Search Spotlight 6.2. Already empty.", (uint8_t *)v15, 2u);
        }
      }
      double v14 = CACLogDictationCommands();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_238377000, v14, OS_LOG_TYPE_DEFAULT, "Search Spotlight 6.3. Entering dictated text.", (uint8_t *)v15, 2u);
      }

      id v7 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
      [v7 enterDictatedString:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v7 = CACLogDictationCommands();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __35__CACSpokenCommand_searchSpotlight__block_invoke_732_cold_1();
    }
  }

  [*(id *)(a1 + 40) setExecuting:0];
}

- (void)hideSearch
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleSpotlight];
}

- (void)enableAttentionAwareness
{
  id v2 = +[CACPreferences sharedPreferences];
  [v2 setSleepOnAttentionLost:1];

  id v3 = +[CACPreferences sharedPreferences];
  [v3 setWakeOnAttentionGained:1];
}

- (void)disableAttentionAwareness
{
  id v2 = +[CACPreferences sharedPreferences];
  [v2 setSleepOnAttentionLost:0];

  id v3 = +[CACPreferences sharedPreferences];
  [v3 setWakeOnAttentionGained:0];
}

- (void)searchWeb
{
  id v2 = [(CACSpokenCommand *)self recognizedParameters];
  id v3 = [v2 objectForKey:*MEMORY[0x263F78BF8]];
  id v11 = [v3 objectForKey:kCACCommandParameterText];

  if ([v11 length])
  {
    uint64_t v4 = NSURL;
    BOOL v5 = NSString;
    char v6 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
    id v7 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v6];
    id v8 = [v5 stringWithFormat:@"x-web-search://?%@", v7];
    uint64_t v9 = [v4 URLWithString:v8];

    double v10 = [MEMORY[0x263F82438] sharedApplication];
    [v10 openURL:v9 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

- (void)hangUp
{
  id v2 = dispatch_queue_create("com.apple.speech.CallCenterQueue", 0);
  id v3 = [MEMORY[0x263F7E1A0] callCenterWithQueue:v2];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__CACSpokenCommand_hangUp__block_invoke;
  block[3] = &unk_264D115D0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(v2, block);
}

void __26__CACSpokenCommand_hangUp__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) incomingCall];
  if (v2 || ([*(id *)(a1 + 32) incomingVideoCall], (uint64_t v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (id)v2;
    [*(id *)(a1 + 32) disconnectCall:v2 withReason:2];
  }
  else if ([*(id *)(a1 + 32) hasCurrentCalls])
  {
    id v3 = *(void **)(a1 + 32);
    [v3 disconnectCurrentCallAndActivateHeld];
  }
}

- (BOOL)isCustomCommand
{
  return 0;
}

- (id)description
{
  id v3 = NSString;
  id v4 = [(CACSpokenCommand *)self identifier];
  BOOL v5 = [(CACSpokenCommand *)self strings];
  id v6 = [v3 stringWithFormat:@"%@, %@, Rec Params: %@", v4, v5, self->_recognizedParameters];

  return v6;
}

- (NSArray)strings
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setStrings:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_SEL action = v3;
}

- (NSDictionary)recognizedParameters
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRecognizedParameters:(id)a3
{
}

- (CACCommandRecognizer)commandRecognizer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognizer);
  return (CACCommandRecognizer *)WeakRetained;
}

- (void)setCommandRecognizer:(id)a3
{
}

- (NSMutableDictionary)contextEvaluation
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContextEvaluation:(id)a3
{
}

- (BOOL)executedIndirectly
{
  return self->_executedIndirectly;
}

- (void)setExecutedIndirectly:(BOOL)a3
{
  self->_executedIndirectly = a3;
}

- (CACLanguageModel)languageModelCache
{
  return (CACLanguageModel *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_contextEvaluation, 0);
  objc_destroyWeak((id *)&self->_commandRecognizer);
  objc_storeStrong((id *)&self->_languageModelCache, 0);
  objc_storeStrong((id *)&self->_recognizedParameters, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

- (void)_scrollWithCount:(unint64_t)a3 forAction:(int)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CACSpokenCommand_CACSpokenCommandScrolling___scrollWithCount_forAction___block_invoke;
  block[3] = &unk_264D11DE8;
  void block[4] = self;
  void block[5] = a3;
  int v5 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__CACSpokenCommand_CACSpokenCommandScrolling___scrollWithCount_forAction___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    uint64_t v2 = result;
    do
    {
      result = [*(id *)(v2 + 32) _performScrollingAction:*(unsigned int *)(v2 + 48)];
      if (!result) {
        break;
      }
      --v1;
      result = usleep(0x186A0u);
    }
    while (v1);
  }
  return result;
}

- (void)scrollPageUp
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageUp__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __59__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageUp__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performScrollingAction:2007];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _performScrollingAction:2020];
  }
  return result;
}

- (void)scrollPageDown
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageDown__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __61__CACSpokenCommand_CACSpokenCommandScrolling__scrollPageDown__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _performScrollingAction:2006];
  if ((result & 1) == 0)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _performScrollingAction:2019];
  }
  return result;
}

- (void)scrollToTop
{
  if (![(CACSpokenCommand *)self _performUncheckedScrollAction:2068 forScrollAreaSupportingAction:2007])
  {
    [(CACSpokenCommand *)self _scrollWithCount:6 forAction:2007];
  }
}

- (void)scrollToBottom
{
  if (![(CACSpokenCommand *)self _performUncheckedScrollAction:2069 forScrollAreaSupportingAction:2006])
  {
    [(CACSpokenCommand *)self _scrollWithCount:24 forAction:2006];
  }
}

- (BOOL)scrollToLandmark
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(CACSpokenCommand *)self recognizedParameters];
  id v3 = [v2 objectForKey:*MEMORY[0x263F78C58]];

  id v4 = [v3 objectForKey:kCACCommandParameterText];
  int v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v6 = [v5 labeledElementsFromScreenWithTrait:*MEMORY[0x263F21B58]];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    uint64_t v25 = *(void *)v32;
    id v26 = v3;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "element", v25);
        double v14 = [v13 uiElement];
        double v15 = [v14 arrayWithAXAttribute:2239];

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v28;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v28 != v19) {
                objc_enumerationMutation(v16);
              }
              char v21 = *(void **)(*((void *)&v27 + 1) + 8 * j);
              if (![v21 compare:v4 options:129])
              {
                long long v23 = [v12 element];
                [v23 performAction:2022 withValue:v21];

                BOOL v22 = 1;
                id v3 = v26;
                goto LABEL_19;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v35 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v10 = v25;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
      BOOL v22 = 0;
      id v3 = v26;
    }
    while (v9);
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_19:

  return v22;
}

- (void)scrollPageLeft
{
}

- (void)scrollPageRight
{
}

- (void)scrollToLeftEdge
{
}

- (void)scrollToRightEdge
{
}

- (id)_scrollAncestorsFromTopLevelElementsForAction:(int)a3 categorizedElements:(id *)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v5 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v6 = [v5 screenElementsForScrolling];

  id v7 = [MEMORY[0x263EFF9B0] orderedSet];
  uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 supportsAction:v4])
        {
          uint64_t v15 = [v14 scrollAncestorForScrollAction:v4];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = [v7 indexOfObject:v15];
            if (v17 == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v17 = [v7 count];
              [v7 addObject:v16];
            }
            uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", v17);
            uint64_t v19 = [v8 objectForKey:v18];
            if (!v19)
            {
              uint64_t v19 = [MEMORY[0x263EFF980] array];
              [v8 setObject:v19 forKey:v18];
            }
            [v19 addObject:v14];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  if (a4) {
    *a4 = v8;
  }
  id v20 = [v7 array];

  return v20;
}

- (BOOL)_performUncheckedScrollAction:(int)a3 forScrollAreaSupportingAction:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v19 = 0;
  id v5 = [(CACSpokenCommand *)self _scrollAncestorsFromTopLevelElementsForAction:*(void *)&a4 categorizedElements:&v19];
  id v6 = v19;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = objc_msgSend(v6, "allValues", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
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
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) lastObject];
        char v13 = [v12 performAction:v4];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_performScrollingAction:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v31 = 0;
  id v4 = [(CACSpokenCommand *)self _scrollAncestorsFromTopLevelElementsForAction:*(void *)&a3 categorizedElements:&v31];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v20 = v31;
  id obj = [v20 allValues];
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        uint64_t v11 = [v10 reverseObjectEnumerator];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              if ([v16 supportsAction:v3]
                && [v16 performAction:v3])
              {
                long long v17 = [v10 lastObject];

                if (v16 != v17)
                {
                  long long v18 = CACLogElementEvaluation();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_238377000, v18, OS_LOG_TYPE_DEFAULT, "Reproduced rdar://132435403.  Fell back to alternate element for scrolling.", buf, 2u);
                  }
                }
                char v7 = 1;
                goto LABEL_21;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v32 count:16];
            if (v13) {
              continue;
            }
            break;
          }
          char v7 = 0;
        }
LABEL_21:
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v6);
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (void)enableAssistiveTouch
{
  if (!_AXSAssistiveTouchEnabled())
  {
    _AXSAssistiveTouchSetEnabled();
    MEMORY[0x270F905D8](1);
  }
}

- (void)disableAssistiveTouch
{
  if (_AXSAssistiveTouchEnabled())
  {
    _AXSAssistiveTouchSetEnabled();
    MEMORY[0x270F905D8](0);
  }
}

- (void)enableClassicInvertColors
{
  uint64_t v2 = [MEMORY[0x263F22938] sharedInstance];
  char v3 = [v2 classicInvertColors];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x263F22938] sharedInstance];
    [v4 setClassicInvertColors:1];
  }
}

- (void)disableClassicInvertColors
{
  uint64_t v2 = [MEMORY[0x263F22938] sharedInstance];
  int v3 = [v2 classicInvertColors];

  if (v3)
  {
    id v4 = [MEMORY[0x263F22938] sharedInstance];
    [v4 setClassicInvertColors:0];
  }
}

- (void)enableSmartInvertColors
{
  if (!_AXSInvertColorsEnabled())
  {
    uint64_t v2 = MEMORY[0x263EF83A0];
    dispatch_async(v2, &__block_literal_global_17);
  }
}

uint64_t __74__CACSpokenCommand_CACSpokenCommandAccessibility__enableSmartInvertColors__block_invoke()
{
  id v0 = [MEMORY[0x263F22938] sharedInstance];
  int v1 = [v0 classicInvertColors];

  if (v1)
  {
    uint64_t v2 = [MEMORY[0x263F22938] sharedInstance];
    [v2 setClassicInvertColors:0];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  id v4 = [MEMORY[0x263F22938] sharedInstance];
  [v4 setLastSmartInvertColorsEnablement:Current];

  return MEMORY[0x270F90898](1);
}

- (void)disableSmartInvertColors
{
  if (_AXSInvertColorsEnabled())
  {
    uint64_t v2 = MEMORY[0x263EF83A0];
    dispatch_async(v2, &__block_literal_global_267);
  }
}

uint64_t __75__CACSpokenCommand_CACSpokenCommandAccessibility__disableSmartInvertColors__block_invoke()
{
  id v0 = [MEMORY[0x263F22938] sharedInstance];
  int v1 = [v0 classicInvertColors];

  if (v1)
  {
    uint64_t v2 = [MEMORY[0x263F22938] sharedInstance];
    [v2 setClassicInvertColors:0];
  }
  return MEMORY[0x270F90898](0);
}

- (void)enableColorFilters
{
  if (!_AXSDisplayFilterColorEnabled())
  {
    uint64_t v2 = MEMORY[0x263EF83A0];
    dispatch_async(v2, &__block_literal_global_269);
  }
}

uint64_t __69__CACSpokenCommand_CACSpokenCommandAccessibility__enableColorFilters__block_invoke()
{
  return MEMORY[0x270F90728](1);
}

- (void)disableColorFilters
{
  if (_AXSDisplayFilterColorEnabled())
  {
    uint64_t v2 = MEMORY[0x263EF83A0];
    dispatch_async(v2, &__block_literal_global_271_0);
  }
}

uint64_t __70__CACSpokenCommand_CACSpokenCommandAccessibility__disableColorFilters__block_invoke()
{
  return MEMORY[0x270F90728](0);
}

- (void)enableReduceWhitePoint
{
  if (!_AXSReduceWhitePointEnabled())
  {
    MEMORY[0x270F90A78](1);
  }
}

- (void)disableReduceWhitePoint
{
  if (_AXSReduceWhitePointEnabled())
  {
    MEMORY[0x270F90A78](0);
  }
}

- (void)enableSwitchControl
{
  if (!_AXSAssistiveTouchScannerEnabled())
  {
    MEMORY[0x270F905B8](1);
  }
}

- (void)disableSwitchControl
{
  if (_AXSAssistiveTouchScannerEnabled())
  {
    MEMORY[0x270F905B8](0);
  }
}

- (void)enableVoiceOver
{
  if (!_AXSVoiceOverTouchEnabled())
  {
    if (!_AXSVoiceOverTouchUsageConfirmed()) {
      _AXSVoiceOverTouchSetUsageConfirmed();
    }
    if (_AXSCanDisableApplicationAccessibility()) {
      _AXSApplicationAccessibilitySetEnabled();
    }
    _AXSVoiceOverTouchSetEnabled();
    MEMORY[0x270F90BB0](1);
  }
}

- (void)disableVoiceOver
{
  if (_AXSVoiceOverTouchEnabled())
  {
    if (!_AXSVoiceOverTouchUsageConfirmed()) {
      _AXSVoiceOverTouchSetUsageConfirmed();
    }
    _AXSVoiceOverTouchSetEnabled();
    MEMORY[0x270F90BB0](0);
  }
}

- (void)enableWatchMirroring
{
  if (!_AXSTwiceRemoteScreenEnabled())
  {
    MEMORY[0x270F90B40](1);
  }
}

- (void)disableWatchMirroring
{
  if (_AXSTwiceRemoteScreenEnabled())
  {
    MEMORY[0x270F90B40](0);
  }
}

- (void)enableWatchRemoteControl
{
  if (!_AXSWatchControlEnabled())
  {
    MEMORY[0x270F90BF0](1);
  }
}

- (void)disableWatchRemoteControl
{
  if (_AXSWatchControlEnabled())
  {
    MEMORY[0x270F90BF0](0);
  }
}

- (void)enableZoom
{
  if (!_AXSZoomTouchEnabled())
  {
    MEMORY[0x270F90C18](1);
  }
}

- (void)disableZoom
{
  if (_AXSZoomTouchEnabled())
  {
    MEMORY[0x270F90C18](0);
  }
}

- (void)enableFullKeyboardAccess
{
  if (!_AXSFullKeyboardAccessEnabled())
  {
    MEMORY[0x270F90770](1);
  }
}

- (void)disableFullKeyboardAccess
{
  if (_AXSFullKeyboardAccessEnabled())
  {
    MEMORY[0x270F90770](0);
  }
}

- (BOOL)isRestrictedForAAC
{
  uint64_t v2 = [MEMORY[0x263F22838] server];
  if ([v2 isRestrictedForAAC])
  {
    char v3 = 1;
  }
  else
  {
    id v4 = objc_opt_new();
    char v3 = [v4 isActive];
  }
  return v3;
}

- (void)activateSiri
{
  uint64_t v2 = [(CACSpokenCommand *)self recognizedParameters];
  char v3 = [v2 objectForKey:*MEMORY[0x263F78BF8]];
  id v8 = [v3 objectForKey:kCACCommandParameterText];

  if ([v8 length])
  {
    id v4 = (void *)activateSiri_sAssistantServicesConnection;
    if (!activateSiri_sAssistantServicesConnection)
    {
      uint64_t v5 = objc_opt_new();
      uint64_t v6 = (void *)activateSiri_sAssistantServicesConnection;
      activateSiri_sAssistantServicesConnection = v5;

      id v4 = (void *)activateSiri_sAssistantServicesConnection;
    }
    [v4 startUIRequestWithText:v8];
  }
  else
  {
    char v7 = [MEMORY[0x263F21F20] sharedInstance];
    [v7 activateSiri];
  }
}

- (void)activateHomeButton
{
}

void __64__CACSpokenCommand_CACSpokenCommandHardware__activateHomeButton__block_invoke()
{
  id v0 = +[CACDisplayManager sharedManager];
  int v1 = [v0 carPlayConnected];

  if (v1)
  {
    id v4 = [MEMORY[0x263F3F790] dashboardService];
    [v4 openApplication:@"com.apple.CarPlayApp" withOptions:0 completion:0];
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263F22968] server];
    int v3 = [v2 dismissBuddyIfNecessary];

    if (v3) {
      return;
    }
    id v4 = [MEMORY[0x263F21F20] sharedInstance];
    [v4 activateHomeButton];
  }
}

- (void)armApplePay
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 armApplePay];
}

- (void)toggleDock
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleDock];
}

- (void)activateAppLibrary
{
  id v2 = [MEMORY[0x263F22968] server];
  char v3 = [v2 isShowingHomescreen];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x263F21F20] sharedInstance];
    [v4 activateHomeButton];
  }
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  uint64_t v6 = MEMORY[0x263EF83A0];
  dispatch_after(v5, v6, &__block_literal_global_274_1);
}

void __64__CACSpokenCommand_CACSpokenCommandHardware__activateAppLibrary__block_invoke()
{
  id v0 = [MEMORY[0x263F21F20] sharedInstance];
  [v0 toggleAppLibrary];
}

- (void)activateAppSwitcher
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleAppSwitcher];
}

- (void)activateLockButton
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 activateLockButton];
}

- (void)toggleRingerSwitchOn
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleRingerSwitch:1];
}

- (void)toggleRingerSwitchOff
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleRingerSwitch:0];
}

- (void)toggleMute
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleMute];
}

- (void)decreaseVolume
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 decreaseVolume];
}

- (void)increaseVolume
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 increaseVolume];
}

- (void)activateSpotlight
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 revealSpotlight];
}

- (void)activateTripleClick
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 activateTripleClick];
}

- (void)takeScreenshot
{
  [(CACSpokenCommand *)self setCompletionDeterminedManually:1];
  char v3 = [MEMORY[0x263F21F20] sharedInstance];
  [v3 takeScreenshot];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CACSpokenCommand_CACSpokenCommandHardware__takeScreenshot__block_invoke;
  block[3] = &unk_264D115D0;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __60__CACSpokenCommand_CACSpokenCommandHardware__takeScreenshot__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contextEvaluation];
  char v3 = [v2 objectForKey:kCACCommandContextDeferRecognizedStringDisplay];
  int v4 = [v3 BOOLValue];

  if (v4)
  {
    dispatch_time_t v5 = [*(id *)(a1 + 32) recognizedParameters];
    uint64_t v6 = +[CACSpokenCommand attributedStringFromRecognizedCommandParameters:v5 variantOverrides:0];
    +[CACSpokenCommand displayRecognizedMessageUsingAttributedString:v6];
  }
  char v7 = *(void **)(a1 + 32);
  return [v7 setExecuting:0];
}

- (void)activateControlCenter
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleControlCenter];
}

- (void)hideControlCenter
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleControlCenter];
}

- (void)activateNotificationCenter
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleNotificationCenter];
}

- (void)hideNotificationCenter
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleNotificationCenter];
}

- (void)lockScreen
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  char v3 = MEMORY[0x263EF83A0];
  dispatch_after(v2, v3, &__block_literal_global_277);
}

void __56__CACSpokenCommand_CACSpokenCommandHardware__lockScreen__block_invoke()
{
  id v0 = [MEMORY[0x263F21F20] sharedInstance];
  [v0 activateLockButton];
}

- (void)rotateToPortrait
{
  dispatch_time_t v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 orientation];

  int v4 = [MEMORY[0x263F21F20] sharedInstance];
  id v5 = v4;
  if (v3 == 5) {
    [v4 rotateUpsideDown];
  }
  else {
    [v4 rotatePortrait];
  }
}

- (void)rotateToLandscape
{
  dispatch_time_t v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 orientation];

  int v4 = [MEMORY[0x263F21F20] sharedInstance];
  id v5 = v4;
  if (v3 == 3) {
    [v4 rotateRight];
  }
  else {
    [v4 rotateLeft];
  }
}

- (void)tripleClick
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 activateTripleClick];
}

- (void)shake
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 shake];
}

- (void)increaseZoomLevel
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 zoomLevel];
  double v4 = v3;

  id v5 = [MEMORY[0x263F88140] sharedInstance];
  [v5 setZoomLevel:v4 * 1.2];
}

- (void)decreaseZoomLevel
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 zoomLevel];
  double v4 = v3;

  id v5 = [MEMORY[0x263F88140] sharedInstance];
  [v5 setZoomLevel:v4 / 1.2];
}

- (void)minimizeZoomLevel
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 setZoomLevel:1.0];
}

- (void)maximizeZoomLevel
{
  id v2 = [MEMORY[0x263F22938] sharedInstance];
  [v2 zoomPreferredMaximumZoomScale];
  double v4 = v3;

  id v5 = [MEMORY[0x263F88140] sharedInstance];
  [v5 setZoomLevel:v4];
}

- (void)panZoomLeft
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 panLeft];
}

- (void)panZoomRight
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 panRight];
}

- (void)panZoomUp
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 panUp];
}

- (void)panZoomDown
{
  id v2 = [MEMORY[0x263F88140] sharedInstance];
  [v2 panDown];
}

- (void)activateSpeakScreen
{
  id v2 = [MEMORY[0x263F78B80] sharedInstance];
  [v2 speakThisWithOptions:12 errorHandler:&__block_literal_global_284_0];
}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSpeakScreen__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = CACLogDictationCommands();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __65__CACSpokenCommand_CACSpokenCommandHardware__activateSpeakScreen__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)activateSOS
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 activateSOSMode];
}

- (void)activateDock
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 toggleDock];
}

- (void)activateApplePay
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 armApplePay];
}

- (void)systemPressCameraButton
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 pressCameraButton];
}

- (void)systemLightPressCameraButton
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 lightPressCameraButton];
}

- (void)systemDoubleLightPressCameraButton
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 doubleLightPressCameraButton];
}

- (void)systemLongPressCameraButton
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [MEMORY[0x263F21F20] sharedInstance];
    [v4 performSelector:sel_openVisualIntelligence];
  }
}

- (void)activateSysdiagnose
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 performSysdiagnoseWithStatusUpdateHandler:&__block_literal_global_287];
}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSysdiagnose__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CACSpokenCommand_CACSpokenCommandHardware__activateSysdiagnose__block_invoke_2;
  block[3] = &unk_264D115D0;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSysdiagnose__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = CACLogAccessibility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_238377000, v2, OS_LOG_TYPE_INFO, "sysdiagnose status: %@", (uint8_t *)&v7, 0xCu);
  }

  id v4 = +[CACDisplayManager sharedManager];
  char v5 = [v4 carPlayConnected];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = +[CACDisplayManager sharedManager];
    [v6 displayMessageString:*(void *)(a1 + 32) type:0];
  }
}

- (void)reboot
{
  id v2 = [MEMORY[0x263F21F20] sharedInstance];
  [v2 rebootDevice];
}

- (void)selectCurrentCharacter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 selectCurrentCharacter];
}

- (void)selectPreviousCharacter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectPreviousCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectNextCharacter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectNextCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectCurrentWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 selectCurrentWord];
}

- (void)selectPreviousWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectPreviousWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectNextWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectNextWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectCurrentSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 selectCurrentSentence];
}

- (void)selectPreviousSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectPreviousSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectNextSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectNextSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectCurrentParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 selectCurrentParagraph];
}

- (void)selectPreviousParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectPreviousParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectNextParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectNextParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectCurrentLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 selectCurrentLine];
}

- (void)selectPreviousLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectPreviousLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectNextLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "selectNextLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionToEnd:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 extendSelectionToEnd];
}

- (void)extendSelectionToBeginning:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 extendSelectionToBeginning];
}

- (void)extendSelectionForwardCharactersUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionForwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionBackwardCharactersUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionBackwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionForwardWordsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionForwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionBackwardWordsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionBackwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionForwardSentencesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionForwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionBackwardSentencesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionBackwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionForwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionForwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionBackwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionBackwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionForwardLinesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionForwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)extendSelectionBackwardLinesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  char v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "extendSelectionBackwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)selectPhrase:(id)a3
{
  id v4 = a3;
  id v15 = [(CACSpokenCommand *)self recognizedParameters];
  char v5 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v6 = [(CACTextEditingProvider *)v5 textEditingEngine];
  int v7 = [v15 objectForKey:*MEMORY[0x263F78BF8]];
  uint64_t v8 = [v7 objectForKey:*MEMORY[0x263F78C50]];
  uint64_t v9 = [v15 objectForKey:*MEMORY[0x263F78C00]];
  uint64_t v10 = [v9 objectForKey:*MEMORY[0x263F78C40]];
  uint64_t v11 = [(CACSpokenCommand *)self contextEvaluation];
  uint64_t v12 = [v11 objectForKey:kCACCommandContextDeferRecognizedStringDisplay];
  if ([v12 BOOLValue]) {
    id v13 = v15;
  }
  else {
    id v13 = 0;
  }
  uint64_t v14 = [(CACSpokenCommand *)self identifier];
  [v6 selectFromPhraseVariants:v8 insertionString:v10 recognizedParameters:v13 commandIdentifer:v14];
}

- (void)selectPhraseThroughPhrase:(id)a3
{
  id v4 = a3;
  id v16 = [(CACSpokenCommand *)self recognizedParameters];
  char v5 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v6 = [(CACTextEditingProvider *)v5 textEditingEngine];
  int v7 = [v16 objectForKey:*MEMORY[0x263F78BF8]];
  uint64_t v8 = (void *)MEMORY[0x263F78C50];
  uint64_t v9 = [v7 objectForKey:*MEMORY[0x263F78C50]];
  uint64_t v10 = [v16 objectForKey:*MEMORY[0x263F78C00]];
  uint64_t v11 = [v10 objectForKey:*v8];
  uint64_t v12 = [(CACSpokenCommand *)self contextEvaluation];
  id v13 = [v12 objectForKey:kCACCommandContextDeferRecognizedStringDisplay];
  if ([v13 BOOLValue]) {
    id v14 = v16;
  }
  else {
    id v14 = 0;
  }
  id v15 = [(CACSpokenCommand *)self identifier];
  [v6 selectFromPhraseVariants:v9 throughPhraseVariants:v11 recognizedParameters:v14 commandIdentifer:v15];
}

- (void)selectNext:(id)a3
{
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v10 = [v4 resolvedNextSpokenCommand];

  if (v10)
  {
    char v5 = objc_opt_new();
    uint64_t v6 = [v10 recognizedParameters];
    [v5 addEntriesFromDictionary:v6];

    int v7 = [(CACSpokenCommand *)self recognizedParameters];
    uint64_t v8 = [v7 objectForKey:kCACCommandParameterText];
    [v5 setObject:v8 forKey:kCACCommandParameterText];

    [v10 setRecognizedParameters:v5];
    uint64_t v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v9 handleRecognizedCommand:v10];
  }
  else
  {
    char v5 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.NextNotFound"];
    uint64_t v9 = +[CACDisplayManager sharedManager];
    [v9 displayMessageString:v5 type:1];
  }
}

- (void)selectPrevious:(id)a3
{
  id v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  id v10 = [v4 resolvedPreviousSpokenCommand];

  if (v10)
  {
    char v5 = objc_opt_new();
    uint64_t v6 = [v10 recognizedParameters];
    [v5 addEntriesFromDictionary:v6];

    int v7 = [(CACSpokenCommand *)self recognizedParameters];
    uint64_t v8 = [v7 objectForKey:kCACCommandParameterText];
    [v5 setObject:v8 forKey:kCACCommandParameterText];

    [v10 setRecognizedParameters:v5];
    uint64_t v9 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
    [v9 handleRecognizedCommand:v10];
  }
  else
  {
    char v5 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.PreviousNotFound"];
    uint64_t v9 = +[CACDisplayManager sharedManager];
    [v9 displayMessageString:v5 type:1];
  }
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  char v5 = [v4 cacTextSelectionCACTextMarkerRange];
  uint64_t v6 = [v4 cacStringForCACTextMarkerRange:v5];

  if ([v6 length])
  {
    [(CACSpokenCommand *)self goToStartOfDocument:v4];
    dispatch_time_t v7 = dispatch_time(0, 250000000);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke_2;
    v11[3] = &unk_264D115D0;
    uint64_t v8 = &v12;
    id v12 = v4;
    id v9 = v4;
    dispatch_after(v7, MEMORY[0x263EF83A0], v11);
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke;
    block[3] = &unk_264D115D0;
    uint64_t v8 = &v14;
    id v14 = v4;
    id v10 = v4;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacPerformTextSelectAll];
}

uint64_t __59__CACSpokenCommand_CACSpokenCommandTextEditing__selectAll___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cacPerformTextSelectAll];
}

- (void)selectPreviousTextInsertion:(id)a3
{
  id v7 = a3;
  [v7 selectedTextRange];
  if (!v4)
  {
    uint64_t v5 = [(CACSpokenCommand *)self _rangeFromPreviousTextInsertionForAXElement:v7];
    if (v6) {
      objc_msgSend(v7, "cacSetTextSelectionToRange:", v5, v6);
    }
  }
}

- (void)unselect:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 moveToStartOfSelection];
}

- (void)moveUp:(id)a3
{
  v13[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 cacTextSelectionCACTextMarkerRange];
  uint64_t v5 = [v4 nsRange];

  uint64_t v6 = [v3 uiElement];
  id v7 = [NSNumber numberWithUnsignedInteger:v5];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 4, v7);
  v13[1] = v8;
  v13[2] = &unk_26EB4CF78;
  id v9 = objc_msgSend(v6, "objectWithAXAttribute:parameter:", 94015, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v13, 3));

  if (v9 && [v9 unsignedIntegerValue] != 0x7FFFFFFF)
  {
    uint64_t v11 = +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", [v9 unsignedIntegerValue], 0);
    [v3 cacSetTextSelectionToCACTextMarkerRange:v11];
  }
  else
  {
    id v10 = [v3 uiElement];
    uint64_t v11 = [v10 objectWithAXAttribute:2011];

    id v12 = [MEMORY[0x263F21690] uiElementWithAXElement:v11];
    [v12 performAXAction:2012 withValue:*MEMORY[0x263F21BB8]];
  }
}

- (void)moveDown:(id)a3
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 cacTextSelectionCACTextMarkerRange];
  uint64_t v5 = [v4 nsRange];
  uint64_t v7 = v6;

  uint64_t v8 = [v3 uiElement];
  id v9 = [NSNumber numberWithUnsignedInteger:v5 + v7];
  id v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 5, v9);
  v15[1] = v10;
  _DWORD v15[2] = &unk_26EB4CF78;
  uint64_t v11 = objc_msgSend(v8, "objectWithAXAttribute:parameter:", 94015, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v15, 3));

  if (v11 && [v11 unsignedIntegerValue] != 0x7FFFFFFF)
  {
    id v13 = +[CACTextMarkerRange markerRangeWithNSRange:](CACTextMarkerRange, "markerRangeWithNSRange:", [v11 unsignedIntegerValue], 0);
    [v3 cacSetTextSelectionToCACTextMarkerRange:v13];
  }
  else
  {
    id v12 = [v3 uiElement];
    id v13 = [v12 objectWithAXAttribute:2011];

    id v14 = [MEMORY[0x263F21690] uiElementWithAXElement:v13];
    [v14 performAXAction:2012 withValue:*MEMORY[0x263F21BB0]];
  }
}

- (void)goToStartOfSelection:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 moveToStartOfSelection];
}

- (void)goToEndOfSelection:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 moveToEndOfSelection];
}

- (void)goToStartOfWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToStartOfWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToEndOfWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToEndOfWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToStartOfSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToStartOfSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToEndOfSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToEndOfSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToStartOfParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToStartOfParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToEndOfParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToEndOfParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToStartOfLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToStartOfLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToEndOfLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveToEndOfLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)goToStartOfDocument:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 moveToStartOfTextArea];
}

- (void)goToEndOfDocument:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 moveToEndOfTextArea];
}

- (void)moveForwardCharactersUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveForwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveBackwardCharactersUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveBackwardCharactersWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveForwardWordsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveForwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveBackwardWordsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveBackwardWordsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveForwardSentencesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveForwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveBackwardSentencesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveBackwardSentencesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveForwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveForwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveBackwardParagraphsUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveBackwardParagraphsWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveForwardLinesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveForwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)moveBackwardLinesUsingCardinalNumber:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "moveBackwardLinesWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteCurrentCharacter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteCurrentCharacter];
}

- (void)deletePreviousCharacter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deletePreviousCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteNextCharacter:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deleteNextCharacterWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteCurrentWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteCurrentWord];
}

- (void)deletePreviousWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deletePreviousWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteNextWord:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deleteNextWordWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteCurrentSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteCurrentSentence];
}

- (void)deletePreviousSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deletePreviousSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteNextSentence:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deleteNextSentenceWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteCurrentParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteCurrentParagraph];
}

- (void)deletePreviousParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deletePreviousParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteNextParagraph:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deleteNextParagraphWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteCurrentLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteCurrentLine];
}

- (void)deletePreviousLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deletePreviousLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteNextLine:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  objc_msgSend(v5, "deleteNextLineWithCount:", -[CACSpokenCommand _textSegmentCardinalNumber](self, "_textSegmentCardinalNumber"));
}

- (void)deleteAll:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteAll];
}

- (void)delete:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 deleteSelection];
}

- (void)surroundSelectionWithPunctuation:(id)a3
{
  id v4 = a3;
  uint64_t v7 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v7 textEditingEngine];
  uint64_t v6 = [(CACSpokenCommand *)self identifier];
  [v5 surroundSelectionWithPunctuationForCommandIdentifier:v6];
}

- (void)applyFormat:(id)a3
{
  id v4 = a3;
  uint64_t v7 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v7 textEditingEngine];
  uint64_t v6 = [(CACSpokenCommand *)self identifier];
  [v5 applyFormatWithCommandIdentifier:v6];
}

- (void)pasteboardPaste:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 pasteboardPaste];
}

- (void)pasteboardCopy:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 pasteboardCopy];
}

- (void)pasteboardCut:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 pasteboardCut];
}

- (void)correctSelection:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  uint64_t v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 correctSelection];
}

- (void)addSelectionToVocabulary:(id)a3
{
  id v3 = a3;
  id v6 = +[CACPreferences sharedPreferences];
  id v4 = [v3 cacTextSelectionCACTextMarkerRange];
  uint64_t v5 = [v3 cacStringForCACTextMarkerRange:v4];

  [v6 addVocabularyEntryWithString:v5];
}

- (void)_activateKeyboardReturnKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__CACSpokenCommand_CACSpokenCommandTextEditing___activateKeyboardReturnKey___block_invoke;
  v6[3] = &unk_264D117C0;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __76__CACSpokenCommand_CACSpokenCommandTextEditing___activateKeyboardReturnKey___block_invoke(uint64_t a1)
{
  if (AXUIKeyboardIsOOP())
  {
    id v2 = [MEMORY[0x263F21668] systemWideElement];
    id v5 = [v2 uiElement];

    id v3 = [v5 uiElementsWithAttribute:1011];
    id v4 = [v3 lastObject];

    if (([v4 performAXAction:2054] & 1) == 0)
    {
      [*(id *)(a1 + 40) postKeyboardEventWithKeyCode:40 modifierFlags:0 isKeyDown:1];
      [*(id *)(a1 + 40) postKeyboardEventWithKeyCode:40 modifierFlags:0 isKeyDown:0];
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) uiElement];
    [v5 performAXAction:2054];
  }
}

- (void)insertDate:(id)a3
{
  id v3 = +[CACPreferences sharedPreferences];
  CFLocaleRef v4 = CFLocaleCreate(0, (CFLocaleIdentifier)[v3 bestLocaleIdentifier]);

  if (v4)
  {
    CFDateFormatterRef v5 = CFDateFormatterCreate(0, v4, kCFDateFormatterFullStyle, kCFDateFormatterNoStyle);
    if (v5)
    {
      id v6 = v5;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      StringWithAbsoluteTime = (__CFString *)CFDateFormatterCreateStringWithAbsoluteTime(0, v6, Current);
      if ([(__CFString *)StringWithAbsoluteTime length])
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __60__CACSpokenCommand_CACSpokenCommandTextEditing__insertDate___block_invoke;
        block[3] = &unk_264D115D0;
        id v10 = StringWithAbsoluteTime;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

void __60__CACSpokenCommand_CACSpokenCommandTextEditing__insertDate___block_invoke(uint64_t a1)
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 insertDictatedString:*(void *)(a1 + 32)];
}

- (void)insertEmoji:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v22 = a3;
  CFLocaleRef v4 = [(CACSpokenCommand *)self recognizedParameters];
  CFDateFormatterRef v5 = (void *)MEMORY[0x263F78BF8];
  id v6 = [v4 objectForKey:*MEMORY[0x263F78BF8]];
  long long v23 = [v6 objectForKey:kCACCommandParameterText];

  if ([v23 length])
  {
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2020000000;
    char v39 = 0;
    id v7 = objc_alloc_init(MEMORY[0x263F089B8]);
    uint64_t v8 = +[CACEmojiManager sharedManager];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke;
    v33[3] = &unk_264D12A20;
    long long v35 = &v36;
    id v9 = v7;
    id v34 = v9;
    [v8 enumerateEmojisInText:v23 skinToneFilter:0 usingBlock:v33];

    if (*((unsigned char *)v37 + 24)) {
      goto LABEL_12;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = [(CACSpokenCommand *)self recognizedParameters];
    uint64_t v11 = [v10 objectForKey:*v5];
    id v12 = [v11 objectForKey:kCACCommandParameterTextVariants];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v30;
LABEL_5:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * v15);
        uint64_t v17 = +[CACEmojiManager sharedManager];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_2;
        v26[3] = &unk_264D12A20;
        long long v28 = &v36;
        id v27 = v9;
        [(id)v17 enumerateEmojisInText:v16 skinToneFilter:0 usingBlock:v26];

        LOBYTE(v17) = *((unsigned char *)v37 + 24) == 0;
        if ((v17 & 1) == 0) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v40 count:16];
          if (v13) {
            goto LABEL_5;
          }
          break;
        }
      }
    }

    if (*((unsigned char *)v37 + 24))
    {
LABEL_12:
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_3;
      block[3] = &unk_264D115D0;
      id v25 = v9;
      dispatch_async(MEMORY[0x263EF83A0], block);
      long long v18 = v25;
    }
    else
    {
      id v19 = NSString;
      id v20 = +[CACLocaleUtilities localizedUIStringForKey:@"ErrorMessage.NamedEmojiNotFound"];
      long long v18 = [v19 stringWithValidatedFormat:v20, @"%@", 0, v23 validFormatSpecifiers error];

      uint64_t v21 = +[CACDisplayManager sharedManager];
      [v21 displayMessageString:v18 type:1];
    }
    _Block_object_dispose(&v36, 8);
  }
}

void __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v4 = objc_alloc(MEMORY[0x263F089B8]);
  CFDateFormatterRef v5 = [v3 firstObject];
  if ((unint64_t)[v3 count] <= 1)
  {
    uint64_t v8 = (void *)[v4 initWithString:v5 attributes:0];
  }
  else
  {
    id v9 = @"AXTextAlternatives";
    id v6 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v10[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v8 = (void *)[v4 initWithString:v5 attributes:v7];
  }
  [*(id *)(a1 + 32) appendAttributedString:v8];
}

void __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_2(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v4 = objc_alloc(MEMORY[0x263F089B8]);
  CFDateFormatterRef v5 = [v3 firstObject];
  if ((unint64_t)[v3 count] <= 1)
  {
    uint64_t v8 = (void *)[v4 initWithString:v5 attributes:0];
  }
  else
  {
    id v9 = @"AXTextAlternatives";
    id v6 = objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v10[0] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    uint64_t v8 = (void *)[v4 initWithString:v5 attributes:v7];
  }
  [*(id *)(a1 + 32) appendAttributedString:v8];
}

void __61__CACSpokenCommand_CACSpokenCommandTextEditing__insertEmoji___block_invoke_3(uint64_t a1)
{
  id v2 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  [v2 insertDictatedAttributedString:*(void *)(a1 + 32)];
}

- (int64_t)_textSegmentCardinalNumberStart
{
  id v2 = [(CACSpokenCommand *)self recognizedParameters];
  id v3 = [v2 objectForKey:*MEMORY[0x263F78C28]];
  id v4 = [v3 objectForKey:kCACCommandParameterText];

  int64_t v5 = [v4 integerValue];
  return v5;
}

- (int64_t)_textSegmentCardinalNumberEnd
{
  id v2 = [(CACSpokenCommand *)self recognizedParameters];
  id v3 = [v2 objectForKey:*MEMORY[0x263F78C30]];
  id v4 = [v3 objectForKey:kCACCommandParameterText];

  int64_t v5 = [v4 integerValue];
  return v5;
}

- (id)_markerRangeForTextSegment
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(CACSpokenCommand *)self _textSegmentCardinalNumber];
  id v3 = +[CACDisplayManager sharedManager];
  id v4 = [v3 labeledTextSegmentElements];

  if (v2 < 1)
  {
    uint64_t v14 = 0;
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v16 = v4;
      uint64_t v7 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v10 = objc_msgSend(v9, "numberedLabel", v16);
          uint64_t v11 = [NSNumber numberWithInteger:v2];
          id v12 = [v11 stringValue];
          char v13 = [v10 isEqualToString:v12];

          if (v13)
          {
            uint64_t v14 = [v9 textMarkerRange];
            goto LABEL_12;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      uint64_t v14 = 0;
LABEL_12:
      id v4 = v16;
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  return v14;
}

- (id)_markerRangeForTextSegmentRange
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CACSpokenCommand *)self _textSegmentCardinalNumberStart];
  uint64_t v4 = [(CACSpokenCommand *)self _textSegmentCardinalNumberEnd];
  uint64_t v5 = +[CACDisplayManager sharedManager];
  uint64_t v6 = [v5 labeledTextSegmentElements];

  uint64_t v7 = 0;
  uint64_t v32 = v3;
  if (v3 >= 1 && v4 >= 1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v6;
    uint64_t v7 = (CACTextMarkerRange *)[v8 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v7)
    {
      id obj = v8;
      long long v30 = 0;
      long long v31 = 0;
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v7; uint64_t i = (CACTextMarkerRange *)((char *)i + 1))
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          id v12 = [v11 numberedLabel];
          char v13 = [NSNumber numberWithInteger:v32];
          uint64_t v14 = [v13 stringValue];
          int v15 = [v12 isEqualToString:v14];

          if (v15)
          {
            id v16 = v11;

            long long v30 = v16;
          }
          uint64_t v17 = [v11 numberedLabel];
          long long v18 = [NSNumber numberWithInteger:v4];
          long long v19 = [v18 stringValue];
          int v20 = [v17 isEqualToString:v19];

          if (v20)
          {
            id v21 = v11;

            long long v31 = v21;
          }
        }
        uint64_t v7 = (CACTextMarkerRange *)[obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v7);

      id v22 = v30;
      if (!v30)
      {
        uint64_t v23 = v31;
        goto LABEL_19;
      }
      uint64_t v23 = v31;
      if (!v31)
      {
LABEL_19:

        goto LABEL_20;
      }
      long long v24 = [CACTextMarkerRange alloc];
      id v8 = [v30 textMarkerRange];
      id v25 = [v8 startMarker];
      long long v26 = [v31 textMarkerRange];
      id v27 = [v26 endMarker];
      uint64_t v7 = [(CACTextMarkerRange *)v24 initWithStartMarker:v25 endMarker:v27];

      uint64_t v23 = v31;
    }
    else
    {
      uint64_t v23 = 0;
      id v22 = 0;
    }

    goto LABEL_19;
  }
LABEL_20:

  return v7;
}

- (BOOL)_performActionOnTextSegment:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(CACSpokenCommand *)self _markerRangeForTextSegment];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5 != 0;
}

- (BOOL)_performActionOnTextSegmentRange:(id)a3
{
  uint64_t v4 = (void (**)(id, void *))a3;
  uint64_t v5 = [(CACSpokenCommand *)self _markerRangeForTextSegmentRange];
  if (v5) {
    v4[2](v4, v5);
  }

  return v5 != 0;
}

- (void)deleteTextSegment:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegment___block_invoke;
  v6[3] = &unk_264D12A48;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegment:v6];
}

uint64_t __67__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegment___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteTextAtTextMarkerRange:a2];
}

- (void)deleteTextSegmentRange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegmentRange___block_invoke;
  v6[3] = &unk_264D12A48;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegmentRange:v6];
}

uint64_t __72__CACSpokenCommand_CACSpokenCommandTextEditing__deleteTextSegmentRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteTextAtTextMarkerRange:a2];
}

- (void)correctTextSegment:(id)a3
{
  id v4 = a3;
  [(CACSpokenCommand *)self selectTextSegment:v4];
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  id v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 correctSelection];
}

- (void)correctTextSegmentRange:(id)a3
{
  id v4 = a3;
  [(CACSpokenCommand *)self selectTextSegmentRange:v4];
  uint64_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v4];

  id v5 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v5 correctSelection];
}

- (void)selectTextSegment:(id)a3
{
}

- (void)selectTextSegment:(id)a3 postAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __78__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegment_postAction___block_invoke;
  v10[3] = &unk_264D12A90;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CACSpokenCommand *)self _performActionOnTextSegment:v10];
}

uint64_t __78__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegment_postAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 nsRange];
  objc_msgSend(v3, "cacSetTextSelectionToRange:", v5, v6);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v4 nsRange];
  uint64_t v10 = v9;

  id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  return v11(v7, v8, v10);
}

- (void)selectTextSegmentRange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange___block_invoke;
  v6[3] = &unk_264D12A48;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegmentRange:v6];
}

uint64_t __72__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 nsRange];
  return objc_msgSend(v2, "cacSetTextSelectionToRange:", v4, v3);
}

- (void)selectTextSegmentRange:(id)a3 postAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __83__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange_postAction___block_invoke;
  v10[3] = &unk_264D12A90;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(CACSpokenCommand *)self _performActionOnTextSegmentRange:v10];
}

uint64_t __83__CACSpokenCommand_CACSpokenCommandTextEditing__selectTextSegmentRange_postAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 nsRange];
  objc_msgSend(v3, "cacSetTextSelectionToRange:", v5, v6);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = [v4 nsRange];
  uint64_t v10 = v9;

  id v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  return v11(v7, v8, v10);
}

- (void)_selectTextSegment:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke;
  v14[3] = &unk_264D12AB8;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CACSpokenCommand *)self _performActionOnTextSegment:v14];
}

void __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) value];
  uint64_t v5 = [v3 nsRange];
  uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  if ([v7 length])
  {
    id v8 = [[CACTextEditingProvider alloc] initWithSpokenCommand:*(void *)(a1 + 40) axElement:*(void *)(a1 + 32)];
    id v9 = [(CACTextEditingProvider *)v8 textEditingEngine];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = [*(id *)(a1 + 40) recognizedParameters];
    [v9 selectFromRange:v3 insertionString:v11 commandIdentifier:v10 recognizedParamaters:v12];
  }
  dispatch_time_t v13 = dispatch_time(0, 300000000);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _DWORD v15[2] = __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke_2;
  v15[3] = &unk_264D117C0;
  id v16 = *(id *)(a1 + 32);
  id v17 = v3;
  id v14 = v3;
  dispatch_after(v13, MEMORY[0x263EF83A0], v15);
}

uint64_t __102__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegment_insertionString_commandIdentifier___block_invoke_2(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) nsRange];
  return objc_msgSend(v1, "cacSetTextSelectionToRange:", v2, 0);
}

- (void)_selectTextSegmentRange:(id)a3 insertionString:(id)a4 commandIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke;
  v14[3] = &unk_264D12AB8;
  id v15 = v8;
  id v16 = self;
  id v17 = v9;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(CACSpokenCommand *)self _performActionOnTextSegmentRange:v14];
}

void __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) value];
  uint64_t v5 = [v3 nsRange];
  uint64_t v7 = objc_msgSend(v4, "substringWithRange:", v5, v6);

  if ([v7 length])
  {
    id v8 = [[CACTextEditingProvider alloc] initWithSpokenCommand:*(void *)(a1 + 40) axElement:*(void *)(a1 + 32)];
    id v9 = [(CACTextEditingProvider *)v8 textEditingEngine];
    uint64_t v11 = *(void *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v12 = [*(id *)(a1 + 40) recognizedParameters];
    [v9 selectFromRange:v3 insertionString:v11 commandIdentifier:v10 recognizedParamaters:v12];
  }
  dispatch_time_t v13 = dispatch_time(0, 300000000);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  _DWORD v15[2] = __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke_2;
  v15[3] = &unk_264D117C0;
  id v16 = *(id *)(a1 + 32);
  id v17 = v3;
  id v14 = v3;
  dispatch_after(v13, MEMORY[0x263EF83A0], v15);
}

uint64_t __107__CACSpokenCommand_CACSpokenCommandTextEditing___selectTextSegmentRange_insertionString_commandIdentifier___block_invoke_2(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) nsRange];
  return objc_msgSend(v1, "cacSetTextSelectionToRange:", v2, 0);
}

- (void)insertPhraseAfterTextSegment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F78BF8]];
  id v7 = [v6 objectForKey:kCACCommandParameterText];

  [(CACSpokenCommand *)self _selectTextSegment:v4 insertionString:v7 commandIdentifier:@"Text.InsertPhraseAfterPhrase"];
}

- (void)insertPhraseBeforeTextSegment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F78BF8]];
  id v7 = [v6 objectForKey:kCACCommandParameterText];

  [(CACSpokenCommand *)self _selectTextSegment:v4 insertionString:v7 commandIdentifier:@"Text.InsertPhraseBeforePhrase"];
}

- (void)changeTextSegment:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F78BF8]];
  id v7 = [v6 objectForKey:kCACCommandParameterText];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __67__CACSpokenCommand_CACSpokenCommandTextEditing__changeTextSegment___block_invoke;
  v10[3] = &unk_264D12AE0;
  id v11 = v4;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegment:v10];
}

void __67__CACSpokenCommand_CACSpokenCommandTextEditing__changeTextSegment___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) value];
  uint64_t v4 = [v11 nsRange];
  uint64_t v6 = objc_msgSend(v3, "substringWithRange:", v4, v5);

  if ([v6 length])
  {
    id v7 = [[CACTextEditingProvider alloc] initWithSpokenCommand:*(void *)(a1 + 40) axElement:*(void *)(a1 + 32)];
    id v8 = [(CACTextEditingProvider *)v7 textEditingEngine];
    uint64_t v9 = *(void *)(a1 + 48);
    uint64_t v10 = [*(id *)(a1 + 40) recognizedParameters];
    [v8 selectFromRange:v11 insertionString:v9 commandIdentifier:@"Text.ChangePhrase" recognizedParamaters:v10];
  }
}

- (void)changeTextSegmentRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v6 = [v5 objectForKey:*MEMORY[0x263F78BF8]];
  id v7 = [v6 objectForKey:kCACCommandParameterText];

  [(CACSpokenCommand *)self _selectTextSegmentRange:v4 insertionString:v7 commandIdentifier:@"Text.ChangePhrase"];
}

- (void)capitalizeTextSegment:(id)a3
{
}

- (void)capitalizeTextSegmentRange:(id)a3
{
}

- (void)lowercaseTextSegment:(id)a3
{
}

- (void)lowercaseTextSegmentRange:(id)a3
{
}

- (void)uppercaseTextSegment:(id)a3
{
}

- (void)uppercaseTextSegmentRange:(id)a3
{
}

- (void)boldTextSegment:(id)a3
{
}

- (void)boldTextSegmentRange:(id)a3
{
}

- (void)italicizeTextSegment:(id)a3
{
}

- (void)italicizeTextSegmentRange:(id)a3
{
}

- (void)underlineTextSegment:(id)a3
{
}

- (void)underlineTextSegmentRange:(id)a3
{
}

- (void)putDoubleQuotesAroundTextSegment:(id)a3
{
}

- (void)putDoubleQuotesAroundTextSegmentRange:(id)a3
{
}

- (void)putDoubleCurlyQuotesAroundTextSegment:(id)a3
{
}

- (void)putDoubleCurlyQuotesAroundTextSegmentRange:(id)a3
{
}

- (void)putSingleQuotesAroundTextSegment:(id)a3
{
}

- (void)putSingleQuotesAroundTextSegmentRange:(id)a3
{
}

- (void)putSingleCurlyQuotesAroundTextSegment:(id)a3
{
}

- (void)putSingleCurlyQuotesAroundTextSegmentRange:(id)a3
{
}

- (void)putParenthesesAroundTextSegment:(id)a3
{
}

- (void)putParenthesesAroundTextSegmentRange:(id)a3
{
}

- (void)putSquareBracketsAroundTextSegment:(id)a3
{
}

- (void)putSquareBracketsAroundTextSegmentRange:(id)a3
{
}

- (void)putCurlyBracesAroundTextSegment:(id)a3
{
}

- (void)putCurlyBracesAroundTextSegmentRange:(id)a3
{
}

- (void)moveToEndOfTextSegment:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CACSpokenCommand_CACSpokenCommandTextEditing__moveToEndOfTextSegment___block_invoke;
  v6[3] = &unk_264D12A48;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegment:v6];
}

uint64_t __72__CACSpokenCommand_CACSpokenCommandTextEditing__moveToEndOfTextSegment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 nsRange];
  return objc_msgSend(v2, "cacSetTextSelectionToRange:", v3 + v4, 0);
}

- (void)moveToStartOfTextSegment:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __74__CACSpokenCommand_CACSpokenCommandTextEditing__moveToStartOfTextSegment___block_invoke;
  v6[3] = &unk_264D12A48;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegment:v6];
}

uint64_t __74__CACSpokenCommand_CACSpokenCommandTextEditing__moveToStartOfTextSegment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 nsRange];
  return objc_msgSend(v2, "cacSetTextSelectionToRange:", v3, 0);
}

- (void)extendSelectionToTextSegment:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__CACSpokenCommand_CACSpokenCommandTextEditing__extendSelectionToTextSegment___block_invoke;
  v6[3] = &unk_264D12A48;
  id v7 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self _performActionOnTextSegmentRange:v6];
}

uint64_t __78__CACSpokenCommand_CACSpokenCommandTextEditing__extendSelectionToTextSegment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  NSUInteger v5 = [v3 selectedTextRange];
  NSUInteger v7 = v6;
  id v8 = *(void **)(a1 + 32);
  NSUInteger v9 = [v4 nsRange];

  v13.location = v5;
  v13.length = v7;
  v14.location = v9;
  v14.length = 0;
  NSRange v10 = NSUnionRange(v13, v14);
  return objc_msgSend(v8, "cacSetTextSelectionToRange:", v10.location, v10.length);
}

- (void)cutTextSegment:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke;
  v8[3] = &unk_264D12B30;
  id v9 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self selectTextSegment:v5 postAction:v8];
  NSUInteger v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v5];
  NSUInteger v7 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v7 pasteboardCut];
}

void __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke_2;
  block[3] = &unk_264D12B08;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __64__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(void *)(a1 + 40), 0);
}

- (void)cutTextSegmentRange:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke;
  v8[3] = &unk_264D12B30;
  id v9 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self selectTextSegmentRange:v5 postAction:v8];
  dispatch_time_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v5];
  NSUInteger v7 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v7 pasteboardCut];
}

void __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke_2;
  block[3] = &unk_264D12B08;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __69__CACSpokenCommand_CACSpokenCommandTextEditing__cutTextSegmentRange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(void *)(a1 + 40), 0);
}

- (void)copyTextSegment:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke;
  v8[3] = &unk_264D12B30;
  id v9 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self selectTextSegment:v5 postAction:v8];
  dispatch_time_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v5];
  NSUInteger v7 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v7 pasteboardCopy];
}

void __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke_2;
  block[3] = &unk_264D12B08;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __65__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegment___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(void *)(a1 + 40), 0);
}

- (void)copyTextSegmentRange:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke;
  v8[3] = &unk_264D12B30;
  id v9 = v4;
  id v5 = v4;
  [(CACSpokenCommand *)self selectTextSegmentRange:v5 postAction:v8];
  dispatch_time_t v6 = [[CACTextEditingProvider alloc] initWithSpokenCommand:self axElement:v5];
  NSUInteger v7 = [(CACTextEditingProvider *)v6 textEditingEngine];
  [v7 pasteboardCopy];
}

void __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  dispatch_time_t v6 = dispatch_time(0, 126000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke_2;
  block[3] = &unk_264D12B08;
  id v8 = *(id *)(a1 + 32);
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  dispatch_after(v6, MEMORY[0x263EF83A0], block);
}

uint64_t __70__CACSpokenCommand_CACSpokenCommandTextEditing__copyTextSegmentRange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cacSetTextSelectionToRange:", *(void *)(a1 + 40), 0);
}

- (id)_strippedPhraseStringsFromStrings:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v20 = [MEMORY[0x263EFF980] array];
  long long v19 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v9 = [&unk_26EB4D130 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (!v9) {
          goto LABEL_17;
        }
        uint64_t v10 = v9;
        uint64_t v11 = 0;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v10; ++j)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(&unk_26EB4D130);
            }
            NSRange v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
            if ([v8 hasPrefix:v14]) {
              uint64_t v11 = [v14 length];
            }
          }
          uint64_t v10 = [&unk_26EB4D130 countByEnumeratingWithState:&v21 objects:v29 count:16];
        }
        while (v10);
        if (v11)
        {
          id v15 = [v8 substringFromIndex:v11];
          id v16 = [v15 stringByTrimmingCharactersInSet:v19];
          [v20 addObject:v16];
        }
        else
        {
LABEL_17:
          id v15 = [v8 stringByTrimmingCharactersInSet:v19];
          [v20 addObject:v15];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v5);
  }

  return v20;
}

- (_NSRange)_rangeFromPreviousTextInsertionForAXElement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v5 = [v4 previousTextInsertionSpecifier];

  uint64_t v6 = [v5 axElement];
  int v7 = [v3 isEqual:v6];

  if (v7)
  {
    uint64_t v8 = [v5 insertedRange];
    NSUInteger v10 = v9;
  }
  else
  {
    NSUInteger v10 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v11 = v8;
  NSUInteger v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (id)_nBestListFromPreviousTextInsertionForAXElement:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[CACSpokenCommandManager sharedCACSpokenCommandManager];
  uint64_t v5 = [v4 previousTextInsertionSpecifier];

  uint64_t v6 = [v5 insertedCategoryID];
  int v7 = [v5 axElement];
  int v8 = [v3 isEqual:v7];

  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    NSUInteger v10 = 0;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    NSUInteger v11 = [v5 recognizedParams];
    NSUInteger v12 = [v11 objectForKey:kCACCommandParameterTextSequence];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    NSUInteger v10 = (void *)v13;
    if (v13)
    {
      id v20 = v3;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        id v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          id v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v15);
          id v17 = [v16 objectForKey:kCACCommandParameterBuiltInIdentifier];
          int v18 = [v17 isEqualToString:v6];

          if (v18)
          {
            NSUInteger v10 = [v16 objectForKey:kCACCommandParameterTextVariants];
            goto LABEL_17;
          }
          id v15 = (char *)v15 + 1;
        }
        while (v10 != v15);
        NSUInteger v10 = (void *)[v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v10) {
          continue;
        }
        break;
      }
LABEL_17:
      id v3 = v20;
    }
  }
  return v10;
}

- (int64_t)_textSegmentCardinalNumber
{
  id v3 = [(CACSpokenCommand *)self recognizedParameters];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x263F78C48]];
  uint64_t v5 = [v4 objectForKey:kCACCommandParameterText];

  if (v5) {
    goto LABEL_3;
  }
  uint64_t v6 = [(CACSpokenCommand *)self recognizedParameters];
  int v7 = [v6 objectForKey:*MEMORY[0x263F78C28]];
  uint64_t v5 = [v7 objectForKey:kCACCommandParameterText];

  if (!v5) {
    return 1;
  }
LABEL_3:
  int64_t v8 = (int)[v5 intValue];

  return v8;
}

void __53__CACSpokenCommand_CACSpokenCommandGestures__endDrag__block_invoke_5_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_238377000, log, OS_LOG_TYPE_ERROR, "Attempted to end drag, but was neither in a drag gesture nor in a drag and drop session.", v1, 2u);
}

+ (void)displayRecognizedMessageUsingAttributedString:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 string];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Did not receive a completion callback within the timeout for VoiceOver announcement: %@", (uint8_t *)&v4, 0xCu);
}

void __35__CACSpokenCommand_searchSpotlight__block_invoke_732_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_238377000, v0, v1, "Search Spotlight 6.5. Failed to find focus.", v2, v3, v4, v5, v6);
}

void __65__CACSpokenCommand_CACSpokenCommandHardware__activateSpeakScreen__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_238377000, a2, OS_LOG_TYPE_ERROR, "Failed to activate Speak Screen: %@", (uint8_t *)&v2, 0xCu);
}

@end