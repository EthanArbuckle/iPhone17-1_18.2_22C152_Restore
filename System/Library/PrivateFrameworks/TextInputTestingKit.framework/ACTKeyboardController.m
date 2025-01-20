@interface ACTKeyboardController
- (ACTKeyboardController)init;
- (ACTKeyboardController)initWithInputMode:(id)a3;
- (ACTKeyboardLayoutUtils)layoutUtils;
- (BOOL)asyncPredictions;
- (BOOL)canSuggestSupplementalItemsForCurrentSelection;
- (BOOL)generatesCandidates;
- (BOOL)hardwareKeyboardMode;
- (BOOL)hasPrediction:(id)a3;
- (BOOL)inlineCompletionEnabled;
- (BOOL)inputIsPunctuationFollowingContinuousPath;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isAutoshifted;
- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3;
- (BOOL)isKeyStringAboveSpaceBar:(id)a3;
- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4;
- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4;
- (BOOL)isScreenLocked;
- (BOOL)isShifted;
- (BOOL)justAcceptedAutocorrection;
- (BOOL)lastInputWasContinuousPath;
- (BOOL)lastInputWasSelection;
- (BOOL)longPredictionListEnabled;
- (BOOL)nextKeyIsFlick;
- (BOOL)nextKeyIsMultitap;
- (BOOL)secureTextEntry;
- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3;
- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4;
- (BOOL)usesAutocapitalization;
- (BOOL)usesAutocorrection;
- (BOOL)usesPrediction;
- (BOOL)usesTransliteration;
- (BOOL)wordLearningEnabled;
- (NSArray)keys;
- (NSArray)predictions;
- (NSCondition)requestCondition;
- (NSLock)cpRequestTokenLock;
- (NSMutableDictionary)activeTouchState;
- (NSMutableSet)leftKeys;
- (NSMutableSet)rightKeys;
- (NSString)clientIdentifier;
- (NSString)inputModeIdentifier;
- (NSString)lastCommittedText;
- (NSString)markedText;
- (NSString)recipientIdentifier;
- (NSString)text;
- (NSUUID)documentIdentifier;
- (TIAutocorrectionList)autocorrectionList;
- (TICandidateRequestToken)currentRequestToken;
- (TICandidateRequestToken)lastCPRequestToken;
- (TIInputContextHistory)inputContextHistory;
- (TIInputMode)inputMode;
- (TIKeyboardCandidate)autocorrection;
- (TIKeyboardCandidate)inlineCompletion;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TIKeyboardInputManager)existingInputManager;
- (TIKeyboardInputManager)inputManager;
- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory;
- (TIKeyboardInputManagerState)inputManagerState;
- (TIKeyboardInputManagerWrapper)inputManagerWrapper;
- (TIKeyboardIntermediateText)intermediateText;
- (TIKeyboardState)keyboardState;
- (TISmartPunctuationController)smartPunctuationController;
- (TTKSimpleKeyboardPlane)ttkLayout;
- (UIKBTree)keyboard;
- (UIKBTree)keyplane;
- (_NSRange)selectedRange;
- (_NSRange)selectedRangeForText:(id)a3;
- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4;
- (id)adjustContinuousPathCandidate:(id)a3;
- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3;
- (id)candidateToConfirmInputString;
- (id)candidatesForString:(id)a3;
- (id)clonedKeyboardState;
- (id)createKeyboardInputManagerWrapper;
- (id)displayStringOverrideForKey:(id)a3;
- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4;
- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4;
- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8;
- (id)trimmedCandidate:(id)a3;
- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4;
- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (unint64_t)autocapitalizationType;
- (unint64_t)autocorrectionType;
- (unint64_t)supplementalLexiconIdentifier;
- (void)acceptAutocorrection;
- (void)acceptCandidate:(id)a3;
- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4;
- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6;
- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5;
- (void)addStringFromGestureKeyInput:(id)a3;
- (void)addStringFromVariantKey:(id)a3;
- (void)adjustCursorByOffset:(int64_t)a3;
- (void)adjustKeyplaneEmulatingKBStar:(id)a3;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)alternateKeyplane;
- (void)closeRequestToken:(id)a3;
- (void)commitText;
- (void)dealloc;
- (void)deleteBackwards;
- (void)deleteInput;
- (void)deleteInput:(id)a3;
- (void)deleteText:(id)a3 rawText:(id)a4;
- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5;
- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4;
- (void)generateAutocorrectionsOrCandidates;
- (void)generateAutocorrectionsWithCount:(unint64_t)a3;
- (void)generateAutocorrectionsWithKeyboardState:(id)a3;
- (void)generateAutocorrectionsWithShiftState:(int)a3;
- (void)generateCandidates;
- (void)generateCandidatesWithKeyboardState:(id)a3;
- (void)handleKeyboardInput:(id)a3;
- (void)insertText:(id)a3;
- (void)insertTextAfterSelection:(id)a3;
- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4;
- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)pushAutocorrections:(id)a3 requestToken:(id)a4;
- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4;
- (void)registerLayoutWithFavonius;
- (void)rejectCandidate:(id)a3;
- (void)reset;
- (void)setActiveTouchState:(id)a3;
- (void)setAsyncPredictions:(BOOL)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutocorrectionType:(unint64_t)a3;
- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3;
- (void)setCandidateResultSet:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setCpRequestTokenLock:(id)a3;
- (void)setCurrentRequestToken:(id)a3;
- (void)setDocumentIdentifier:(id)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInitialKeyplane;
- (void)setInlineCompletionEnabled:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3;
- (void)setInputManagerState:(id)a3;
- (void)setInputManagerWrapper:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setIntermediateText:(id)a3;
- (void)setIsScreenLocked:(BOOL)a3;
- (void)setJustAcceptedAutocorrection:(BOOL)a3;
- (void)setKeyboard:(id)a3;
- (void)setKeyboardConfiguration:(id)a3;
- (void)setKeyboardInputManagerFactory:(id)a3;
- (void)setKeyboardState:(id)a3;
- (void)setKeyplane:(id)a3;
- (void)setKeys:(id)a3;
- (void)setLastCPRequestToken:(id)a3;
- (void)setLastInputWasContinuousPath:(BOOL)a3;
- (void)setLastInputWasSelection:(BOOL)a3;
- (void)setLeftKeys:(id)a3;
- (void)setLongPredictionListEnabled:(BOOL)a3;
- (void)setMarkedText:(id)a3;
- (void)setNextKeyIsFlick:(BOOL)a3;
- (void)setNextKeyIsMultitap:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setRightKeys:(id)a3;
- (void)setSecureTextEntry:(BOOL)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setSupplementalLexiconIdentifier:(unint64_t)a3;
- (void)setTtkLayout:(id)a3;
- (void)setUsesAutocapitalization:(BOOL)a3;
- (void)setUsesAutocorrection:(BOOL)a3;
- (void)setUsesPrediction:(BOOL)a3;
- (void)setUsesTransliteration:(BOOL)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
- (void)shiftKeyplane;
- (void)syncToDocumentState:(id)a3;
- (void)syncToEmptyDocument;
- (void)syncToKeyboardState;
- (void)tearDown;
- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4;
- (void)updateAutoshift;
- (void)updateDocumentState;
- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4;
@end

@implementation ACTKeyboardController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentIdentifier, 0);
  objc_storeStrong((id *)&self->_lastCPRequestToken, 0);
  objc_storeStrong((id *)&self->_cpRequestTokenLock, 0);
  objc_storeStrong((id *)&self->_currentRequestToken, 0);
  objc_storeStrong((id *)&self->_requestCondition, 0);
  objc_storeStrong((id *)&self->_activeTouchState, 0);
  objc_storeStrong((id *)&self->_intermediateText, 0);
  objc_storeStrong((id *)&self->_inputManagerWrapper, 0);
  objc_storeStrong((id *)&self->_keys, 0);
  objc_storeStrong((id *)&self->_candidateResultSet, 0);
  objc_storeStrong((id *)&self->_lastCommittedText, 0);
  objc_storeStrong((id *)&self->_markedText, 0);
  objc_storeStrong((id *)&self->_ttkLayout, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_inputManagerState, 0);
  objc_storeStrong((id *)&self->_inputContextHistory, 0);
  objc_storeStrong((id *)&self->_recipientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_rightKeys, 0);
  objc_storeStrong((id *)&self->_leftKeys, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_inputModeIdentifier, 0);
  objc_storeStrong((id *)&self->_layoutUtils, 0);
  objc_storeStrong((id *)&self->_autocorrectionList, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_keyplane, 0);
  objc_storeStrong((id *)&self->_keyboard, 0);
}

- (void)setDocumentIdentifier:(id)a3
{
}

- (NSUUID)documentIdentifier
{
  return self->_documentIdentifier;
}

- (void)setLastCPRequestToken:(id)a3
{
}

- (TICandidateRequestToken)lastCPRequestToken
{
  return self->_lastCPRequestToken;
}

- (void)setCpRequestTokenLock:(id)a3
{
}

- (NSLock)cpRequestTokenLock
{
  return self->_cpRequestTokenLock;
}

- (void)setCurrentRequestToken:(id)a3
{
}

- (TICandidateRequestToken)currentRequestToken
{
  return self->_currentRequestToken;
}

- (NSCondition)requestCondition
{
  return self->_requestCondition;
}

- (void)setActiveTouchState:(id)a3
{
}

- (NSMutableDictionary)activeTouchState
{
  return self->_activeTouchState;
}

- (TIKeyboardIntermediateText)intermediateText
{
  return self->_intermediateText;
}

- (void)setInputManagerWrapper:(id)a3
{
}

- (void)setKeys:(id)a3
{
}

- (NSArray)keys
{
  return self->_keys;
}

- (void)setJustAcceptedAutocorrection:(BOOL)a3
{
  self->_justAcceptedAutocorrection = a3;
}

- (BOOL)justAcceptedAutocorrection
{
  return self->_justAcceptedAutocorrection;
}

- (void)setCandidateResultSet:(id)a3
{
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  return self->_candidateResultSet;
}

- (void)setIsScreenLocked:(BOOL)a3
{
  self->_isScreenLocked = a3;
}

- (BOOL)isScreenLocked
{
  return self->_isScreenLocked;
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (BOOL)secureTextEntry
{
  return self->_secureTextEntry;
}

- (NSString)lastCommittedText
{
  return self->_lastCommittedText;
}

- (void)setMarkedText:(id)a3
{
}

- (NSString)markedText
{
  return self->_markedText;
}

- (_NSRange)selectedRange
{
  NSUInteger length = self->_selectedRange.length;
  NSUInteger location = self->_selectedRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setTtkLayout:(id)a3
{
}

- (TTKSimpleKeyboardPlane)ttkLayout
{
  return self->_ttkLayout;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  self->_usesTransliteration = a3;
}

- (BOOL)usesTransliteration
{
  return self->_usesTransliteration;
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  self->_longPredictionListEnabled = a3;
}

- (BOOL)longPredictionListEnabled
{
  return self->_longPredictionListEnabled;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  self->_inlineCompletionEnabled = a3;
}

- (BOOL)inlineCompletionEnabled
{
  return self->_inlineCompletionEnabled;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  self->_wordLearningEnabled = a3;
}

- (BOOL)wordLearningEnabled
{
  return self->_wordLearningEnabled;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  self->_usesAutocapitalization = a3;
}

- (BOOL)usesAutocapitalization
{
  return self->_usesAutocapitalization;
}

- (void)setUsesPrediction:(BOOL)a3
{
  self->_usesPrediction = a3;
}

- (BOOL)usesPrediction
{
  return self->_usesPrediction;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (unint64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  self->_autocorrectionType = a3;
}

- (unint64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  self->_usesAutocorrection = a3;
}

- (BOOL)usesAutocorrection
{
  return self->_usesAutocorrection;
}

- (void)setKeyboardState:(id)a3
{
}

- (TIKeyboardState)keyboardState
{
  return self->_keyboardState;
}

- (void)setNextKeyIsFlick:(BOOL)a3
{
  self->_nextKeyIsFlick = a3;
}

- (BOOL)nextKeyIsFlick
{
  return self->_nextKeyIsFlick;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  self->_nextKeyIsMultitap = a3;
}

- (BOOL)nextKeyIsMultitap
{
  return self->_nextKeyIsMultitap;
}

- (void)setInputIsPunctuationFollowingContinuousPath:(BOOL)a3
{
  self->_inputIsPunctuationFollowingContinuousPath = a3;
}

- (BOOL)inputIsPunctuationFollowingContinuousPath
{
  return self->_inputIsPunctuationFollowingContinuousPath;
}

- (void)setLastInputWasContinuousPath:(BOOL)a3
{
  self->_lastInputWasContinuousPath = a3;
}

- (BOOL)lastInputWasContinuousPath
{
  return self->_lastInputWasContinuousPath;
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  self->_lastInputWasSelection = a3;
}

- (BOOL)lastInputWasSelection
{
  return self->_lastInputWasSelection;
}

- (void)setInputManagerState:(id)a3
{
}

- (TIKeyboardInputManagerState)inputManagerState
{
  return self->_inputManagerState;
}

- (void)setInputContextHistory:(id)a3
{
}

- (TIInputContextHistory)inputContextHistory
{
  return self->_inputContextHistory;
}

- (void)setRecipientIdentifier:(id)a3
{
}

- (NSString)recipientIdentifier
{
  return self->_recipientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setRightKeys:(id)a3
{
}

- (NSMutableSet)rightKeys
{
  return self->_rightKeys;
}

- (void)setLeftKeys:(id)a3
{
}

- (NSMutableSet)leftKeys
{
  return self->_leftKeys;
}

- (UIKBTree)keyplane
{
  return self->_keyplane;
}

- (UIKBTree)keyboard
{
  return self->_keyboard;
}

- (void)setAsyncPredictions:(BOOL)a3
{
  self->_asyncPredictions = a3;
}

- (BOOL)asyncPredictions
{
  return self->_asyncPredictions;
}

- (void)setCanSuggestSupplementalItemsForCurrentSelection:(BOOL)a3
{
  self->_canSuggestSupplementalItemsForCurrentSelection = a3;
}

- (BOOL)canSuggestSupplementalItemsForCurrentSelection
{
  return self->_canSuggestSupplementalItemsForCurrentSelection;
}

- (void)setSupplementalLexiconIdentifier:(unint64_t)a3
{
  self->_supplementalLexiconIdentifier = a3;
}

- (unint64_t)supplementalLexiconIdentifier
{
  return self->_supplementalLexiconIdentifier;
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setInputModeIdentifier:(id)a3
{
}

- (NSString)inputModeIdentifier
{
  return self->_inputModeIdentifier;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  self->_keyboardInputManagerFactory = (TIKeyboardInputManagerFactory *)a3;
}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  return self->_keyboardInputManagerFactory;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  self->_insertsSpaceAfterPredictiveInput = a3;
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  return self->_insertsSpaceAfterPredictiveInput;
}

- (ACTKeyboardLayoutUtils)layoutUtils
{
  return self->_layoutUtils;
}

- (NSString)text
{
  return &self->_text->super;
}

- (void)deleteInput:(id)a3
{
  id v4 = a3;
  [(ACTKeyboardController *)self setAutocorrectionList:0];
  id v5 = objc_alloc_init(MEMORY[0x263F7E648]);
  [v5 setBackspace:1];
  [(ACTKeyboardController *)self handleKeyboardInput:v5];
  [v5 setTouchEvent:v4];

  [(ACTKeyboardController *)self updateAutoshift];
}

- (void)deleteInput
{
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5 touchEvent:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v42 = a3;
  id v10 = a6;
  v11 = [(ACTKeyboardController *)self inputManagerState];
  int v12 = [v11 stringEndsWord:v42];

  if (!v12) {
    goto LABEL_11;
  }
  if ([(ACTKeyboardController *)self usesAutocorrection]
    && ([(ACTKeyboardController *)self inputManagerState],
        v14 = objc_claimAutoreleasedReturnValue(),
        char v15 = [v14 usesCandidateSelection],
        v14,
        (v15 & 1) == 0))
  {
    v19 = [(ACTKeyboardController *)self inlineCompletion];
    id v13 = v42;
    if (!v19)
    {
      uint64_t v20 = [(ACTKeyboardController *)self autocorrection];
      id v13 = v42;
      v19 = (void *)v20;
      if (!v20) {
        goto LABEL_12;
      }
    }
  }
  else
  {
    v16 = [(ACTKeyboardController *)self inputManagerState];
    int v17 = [v16 usesCandidateSelection];

    if (!v17)
    {
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    v18 = [(ACTKeyboardController *)self candidateResultSet];
    v19 = [v18 defaultCandidate];

    id v13 = v42;
    if (!v19) {
      goto LABEL_12;
    }
  }
  if (![(ACTKeyboardController *)self shouldAcceptCandidate:v19 beforeInputString:v13])
  {

    goto LABEL_11;
  }
LABEL_12:
  -[ACTKeyboardController setInputIsPunctuationFollowingContinuousPath:](self, "setInputIsPunctuationFollowingContinuousPath:", 0, v13);
  if ([(ACTKeyboardController *)self lastInputWasContinuousPath])
  {
    int v21 = [(NSMutableString *)self->_text length];
    uint64_t v22 = [v42 length] == 1 ? objc_msgSend(v42, "_firstLongCharacter") : 0;
    if (-[ACTKeyboardController isContinuousPathNonSpacePunctuation:](self, "isContinuousPathNonSpacePunctuation:", v22)&& ((v21 - 1) & 0x80000000) == 0&& -[NSMutableString characterAtIndex:](self->_text, "characterAtIndex:") == 32)
    {
      [(ACTKeyboardController *)self setInputIsPunctuationFollowingContinuousPath:1];
    }
  }
  [(ACTKeyboardController *)self setLastInputWasContinuousPath:0];
  if (v19)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [v19 performSelector:sel_isContinuousPathConversion])
    {
      v23 = (void *)MEMORY[0x263F7E518];
      v24 = [(ACTKeyboardController *)self autocorrectionList];
      v25 = [v24 predictions];
      v26 = [v23 listWithCorrections:0 predictions:v25];
      [(ACTKeyboardController *)self setAutocorrectionList:v26];

      [(ACTKeyboardController *)self setLastInputWasContinuousPath:1];
    }
    else
    {
      [(ACTKeyboardController *)self setAutocorrectionList:0];
    }
    v27 = [(ACTKeyboardController *)self inputManagerState];
    int v28 = [v27 usesCandidateSelection];

    if (v28)
    {
      [(ACTKeyboardController *)self acceptCandidate:v19];
      goto LABEL_46;
    }
  }
  else
  {
    [(ACTKeyboardController *)self setAutocorrectionList:0];
  }
  id v29 = objc_alloc_init(MEMORY[0x263F7E648]);
  [v29 setString:v42];
  objc_msgSend(v29, "setUppercase:", -[ACTKeyboardController isShifted](self, "isShifted"));
  objc_msgSend(v29, "setAutoshifted:", -[ACTKeyboardController isAutoshifted](self, "isAutoshifted"));
  [v29 setPopupVariant:v8];
  if (objc_opt_respondsToSelector()) {
    [v29 setGesture:v7];
  }
  [v29 setTouchEvent:v10];
  [v29 setAcceptedCandidate:v19];
  if ([(ACTKeyboardController *)self nextKeyIsMultitap])
  {
    [v29 setMultitap:1];
    [(ACTKeyboardController *)self setNextKeyIsMultitap:0];
  }
  if ([(ACTKeyboardController *)self nextKeyIsFlick])
  {
    [v29 setFlick:1];
    [(ACTKeyboardController *)self setNextKeyIsFlick:0];
  }
  if (v10)
  {
    v30 = [(ACTKeyboardController *)self keys];
    v31 = objc_msgSend(v30, "objectAtIndex:", objc_msgSend(v10, "forcedKeyCode"));

    v32 = [v31 stringForProperty:*MEMORY[0x263F1D3B8]];
    [v29 setInputManagerHint:v32];
  }
  v33 = [v29 acceptedCandidate];
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    v35 = [v29 acceptedCandidate];
    int v36 = [v35 isContinuousPathConversion];
  }
  else
  {
    int v36 = 0;
  }
  v37 = [(ACTKeyboardController *)self inputManagerState];
  v38 = [v37 wordSeparator];
  int v39 = [v42 isEqualToString:v38];

  if (v39)
  {
    BOOL v40 = [(ACTKeyboardController *)self lastInputWasSelection];
    BOOL v41 = !v10 && v40;
    if ((v41 | v36) == 1) {
      [v29 setSynthesizedByAcceptingCandidate:1];
    }
  }
  [(ACTKeyboardController *)self handleKeyboardInput:v29];

LABEL_46:
  [(ACTKeyboardController *)self setLastInputWasSelection:0];
}

- (BOOL)shouldAcceptCandidate:(id)a3 beforeInputString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 candidate];
  if ([v8 length] || objc_msgSend(v6, "slotID"))
  {
  }
  else
  {
    uint64_t v19 = [v6 customInfoType];

    if (!v19) {
      goto LABEL_5;
    }
  }
  v9 = [(ACTKeyboardController *)self inputManagerState];
  char v10 = [v9 shouldSuppressAutocorrectionWithTerminator:v7];

  if (v10)
  {
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  if ([v7 length] && (objc_msgSend(v6, "input"), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v13 = (void *)v12;
    uint64_t v14 = [v6 candidate];
    if (v14)
    {
      char v15 = (void *)v14;
      v16 = [v6 input];
      int v17 = [v16 stringByAppendingString:v7];
      v18 = [v6 candidate];
      BOOL v11 = [v18 rangeOfString:v17 options:9] == 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_15:

  return v11;
}

- (BOOL)isContinuousPathNonSpacePunctuation:(unsigned int)a3
{
  unsigned __int16 v3 = a3;
  id v4 = [(ACTKeyboardController *)self inputManager];
  id v5 = [v4 terminatorsDeletingAutospace];

  id v6 = [v5 characterSet];
  LOBYTE(v3) = [v6 characterIsMember:v3];

  return v3;
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 touchEvent:(id)a5
{
}

- (void)addInput:(id)a3 fromVariantKey:(BOOL)a4 fromGestureKey:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  [(ACTKeyboardController *)self addInput:v8 fromVariantKey:v6 fromGestureKey:v5 touchEvent:0];
  LOBYTE(v5) = [v8 isEqualToString:@"Shift"];

  if ((v5 & 1) == 0) {
    [(ACTKeyboardController *)self updateAutoshift];
  }
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
}

- (void)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 acceptedCandidate];

  if (!v5) {
    goto LABEL_9;
  }
  BOOL v6 = [v4 acceptedCandidate];
  id v7 = [(ACTKeyboardController *)self candidateByApplyingSmartPunctuationToCandidate:v6];
  [v4 setAcceptedCandidate:v7];

  id v8 = [v4 acceptedCandidate];
  v9 = [v8 input];
  char v10 = [v4 acceptedCandidate];
  BOOL v11 = [v10 rawInput];
  [(ACTKeyboardController *)self deleteText:v9 rawText:v11];

  uint64_t v12 = [v4 acceptedCandidate];
  id v13 = [v12 candidate];

  uint64_t v14 = [v4 acceptedCandidate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  char v15 = [v4 acceptedCandidate];
  int v16 = [v15 isContinuousPathConversion];

  if (v16)
  {
    [(ACTKeyboardController *)self adjustContinuousPathCandidate:v13];
    id v13 = v14 = v13;
LABEL_5:
  }
  [(ACTKeyboardController *)self insertText:v13];
  int v17 = [v4 acceptedCandidate];
  int v18 = [v17 isAutocorrection];

  if (v18) {
    [(ACTKeyboardController *)self setJustAcceptedAutocorrection:1];
  }

LABEL_9:
  uint64_t v19 = [(ACTKeyboardController *)self inputManagerWrapper];
  uint64_t v20 = [(ACTKeyboardController *)self clonedKeyboardState];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__ACTKeyboardController_handleKeyboardInput___block_invoke;
  v22[3] = &unk_265050618;
  v22[4] = self;
  id v23 = v4;
  id v21 = v4;
  [v19 handleKeyboardInput:v21 keyboardState:v20 completionHandler:v22];
}

void __45__ACTKeyboardController_handleKeyboardInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) updateKeyboardOutput:v15 withInputForSmartPunctuation:*(void *)(a1 + 40)];
  if ([v15 deletionCount])
  {
    unint64_t v6 = 0;
    do
    {
      [*(id *)(a1 + 32) deleteBackwards];
      ++v6;
    }
    while (v6 < [v15 deletionCount]);
  }
  id v7 = [v15 insertionText];

  if (v7)
  {
    if ([*(id *)(a1 + 32) inputIsPunctuationFollowingContinuousPath]) {
      [*(id *)(a1 + 32) deleteBackwards];
    }
    id v8 = *(void **)(a1 + 32);
    v9 = [v15 insertionText];
    [v8 insertText:v9];
  }
  char v10 = [v15 shortcutConversion];

  if (v10)
  {
    id v11 = objc_alloc(MEMORY[0x263F7E538]);
    uint64_t v12 = [v15 shortcutConversion];
    id v13 = (void *)[v11 initWithAutocorrection:v12 alternateCorrections:0];

    uint64_t v14 = [MEMORY[0x263F7E518] listWithCorrections:v13 predictions:0];
    [*(id *)(a1 + 32) setAutocorrectionList:v14];
  }
  [*(id *)(a1 + 32) setKeyboardConfiguration:v5];
}

- (void)updateKeyboardOutput:(id)a3 withInputForSmartPunctuation:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  id v7 = [(ACTKeyboardController *)self smartPunctuationController];

  if (v7)
  {
    if ([v6 isPopupVariant]) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = [v6 isFlick];
    }
    v9 = [(ACTKeyboardController *)self smartPunctuationController];
    char v10 = [v6 string];
    id v11 = [(ACTKeyboardController *)self keyboardState];
    uint64_t v12 = [v11 documentState];
    id v13 = [v9 smartPunctuationOutputForInput:v10 isLockedInput:v8 documentState:v12];

    if ([v13 deletionCount]) {
      objc_msgSend(v17, "setDeletionCount:", objc_msgSend(v13, "deletionCount"));
    }
    uint64_t v14 = [v13 insertionText];
    if ([v14 length])
    {
      id v15 = [v17 insertionText];
      uint64_t v16 = [v15 length];

      if (!v16)
      {
LABEL_11:

        goto LABEL_12;
      }
      uint64_t v14 = [v13 insertionText];
      [v17 setInsertionText:v14];
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (id)candidatesForString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__6193;
  id v15 = __Block_byref_object_dispose__6194;
  id v16 = 0;
  id v5 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v6 = [(ACTKeyboardController *)self keyboardState];
  id v7 = [v6 keyLayout];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__ACTKeyboardController_candidatesForString___block_invoke;
  v10[3] = &unk_2650505F0;
  v10[4] = &v11;
  [v5 generateReplacementsForString:v4 keyLayout:v7 continuation:v10];

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __45__ACTKeyboardController_candidatesForString___block_invoke(uint64_t a1, void *a2)
{
}

- (void)generateCandidatesWithKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  [(ACTKeyboardController *)self setCandidateResultSet:0];
  id v5 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v6 = [(ACTKeyboardController *)self clonedKeyboardState];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__ACTKeyboardController_generateCandidatesWithKeyboardState___block_invoke;
  v19[3] = &unk_2650505C8;
  v19[4] = self;
  v19[5] = &v20;
  objc_msgSend(v5, "generateCandidatesWithKeyboardState:candidateRange:completionHandler:", v6, 0, 0x7FFFFFFFLL, v19);

  id v7 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.5];
  if (*((unsigned char *)v21 + 24)) {
    goto LABEL_7;
  }
  uint64_t v8 = *MEMORY[0x263EFF478];
  while (1)
  {
    [v7 timeIntervalSinceNow];
    if (v9 <= 0.0) {
      break;
    }
    char v10 = [MEMORY[0x263EFF9F0] currentRunLoop];
    [v10 acceptInputForMode:v8 beforeDate:v7];

    if (*((unsigned char *)v21 + 24)) {
      goto LABEL_7;
    }
  }
  if (*((unsigned char *)v21 + 24))
  {
LABEL_7:
    uint64_t v11 = [(ACTKeyboardController *)self candidateResultSet];
    uint64_t v12 = [v11 uncommittedText];

    if (v12)
    {
      uint64_t v13 = [(ACTKeyboardController *)self candidateResultSet];
      uint64_t v14 = [v13 uncommittedText];
      [(ACTKeyboardController *)self setIntermediateText:v14];
    }
    id v15 = [(ACTKeyboardController *)self candidateResultSet];
    id v16 = [v15 committedText];

    if (v16)
    {
      id v17 = [(ACTKeyboardController *)self candidateResultSet];
      int v18 = [v17 committedText];
      [(ACTKeyboardController *)self insertText:v18];
    }
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __61__ACTKeyboardController_generateCandidatesWithKeyboardState___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    _NSRange result = [*(id *)(result + 32) setCandidateResultSet:a2];
    *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  uint64_t v12 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 acceptedCandidate];
    double v9 = [v8 candidate];
    if ([v9 length])
    {

      id v7 = v12;
LABEL_5:
      [(ACTKeyboardController *)self handleKeyboardInput:v7];
      [(ACTKeyboardController *)self setLastInputWasSelection:1];
      goto LABEL_8;
    }
    char v10 = [v12 acceptedCandidate];
    int v11 = [v10 isSecureContentCandidate];

    id v7 = v12;
    if (v11) {
      goto LABEL_5;
    }
  }
  if (![v7 isDoubleSpace]) {
    goto LABEL_9;
  }
  [(ACTKeyboardController *)self handleKeyboardInput:v12];
LABEL_8:
  [(ACTKeyboardController *)self updateAutoshift];
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
LABEL_9:
  MEMORY[0x270F9A790]();
}

- (void)generateCandidates
{
  id v3 = [(ACTKeyboardController *)self clonedKeyboardState];
  [(ACTKeyboardController *)self generateCandidatesWithKeyboardState:v3];
}

- (void)generateAutocorrectionsWithKeyboardState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ACTKeyboardController *)self autocorrection];
  if (!v5
    || (id v6 = (void *)v5,
        [(ACTKeyboardController *)self autocorrection],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isForShortcutConversion],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    if ([(ACTKeyboardController *)self asyncPredictions]
      && ([(ACTKeyboardController *)self inputManagerWrapper],
          double v9 = objc_claimAutoreleasedReturnValue(),
          char v10 = objc_opt_respondsToSelector(),
          v9,
          (v10 & 1) != 0))
    {
      int v11 = [NSClassFromString(&cfstr_Ticandidatereq.isa) tokenForKeyboardState:v4];
      uint64_t v12 = [(ACTKeyboardController *)self requestCondition];
      [v12 lock];

      [(ACTKeyboardController *)self setAutocorrectionList:0];
      [(ACTKeyboardController *)self setCurrentRequestToken:v11];
      uint64_t v13 = [(ACTKeyboardController *)self requestCondition];
      [v13 unlock];

      uint64_t v14 = [(ACTKeyboardController *)self inputManagerWrapper];
      id v15 = [(ACTKeyboardController *)self clonedKeyboardState];
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke;
      v31[3] = &unk_2650505A0;
      v31[4] = self;
      id v16 = v11;
      id v32 = v16;
      objc_msgSend(v14, "generateAutocorrectionsWithKeyboardState:candidateRange:requestToken:completionHandler:", v15, 0, 3, v16, v31);

      id v17 = [(ACTKeyboardController *)self requestCondition];
      [v17 lock];

      int v18 = [(ACTKeyboardController *)self currentRequestToken];

      if (v18)
      {
        uint64_t v19 = *MEMORY[0x263EFF478];
        do
        {
          if ([v4 needAutofill])
          {
            uint64_t v20 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.5];
            id v21 = [(ACTKeyboardController *)self requestCondition];
            char v22 = [v21 waitUntilDate:v20];

            if ((v22 & 1) == 0)
            {
              char v23 = [(ACTKeyboardController *)self requestCondition];
              [v23 unlock];

              v24 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.5];
              v25 = [MEMORY[0x263EFF9F0] currentRunLoop];
              [v25 acceptInputForMode:v19 beforeDate:v24];

              v26 = [(ACTKeyboardController *)self requestCondition];
              [v26 lock];
            }
          }
          else
          {
            uint64_t v20 = [(ACTKeyboardController *)self requestCondition];
            [v20 wait];
          }

          v27 = [(ACTKeyboardController *)self currentRequestToken];
        }
        while (v27);
      }
      int v28 = [(ACTKeyboardController *)self requestCondition];
      [v28 unlock];
    }
    else
    {
      id v16 = [(ACTKeyboardController *)self inputManagerWrapper];
      id v29 = [(ACTKeyboardController *)self clonedKeyboardState];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke_2;
      v30[3] = &unk_265050578;
      v30[4] = self;
      [v16 generateAutocorrectionsWithKeyboardState:v29 completionHandler:v30];
    }
  }
}

void __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionList:v4];
  uint64_t v5 = [v4 corrections];

  id v6 = [v5 autocorrection];
  int v7 = [v6 isContinuousPathConversion];

  if (v7)
  {
    char v8 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v8 lock];

    [*(id *)(a1 + 32) setLastCPRequestToken:*(void *)(a1 + 40)];
    double v9 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v9 unlock];

    char v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    [v10 closeRequestToken:v11];
  }
}

void __66__ACTKeyboardController_generateAutocorrectionsWithKeyboardState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setAutocorrectionList:v4];
  uint64_t v5 = [v4 corrections];

  id v6 = [v5 autocorrection];
  int v7 = [v6 isContinuousPathConversion];

  if (v7)
  {
    char v8 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v8 lock];

    [*(id *)(a1 + 32) setLastCPRequestToken:0];
    id v9 = [*(id *)(a1 + 32) cpRequestTokenLock];
    [v9 unlock];
  }
}

- (void)closeRequestToken:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v10 = v4;
    uint64_t v5 = [(ACTKeyboardController *)self currentRequestToken];
    int v6 = [v5 isSameRequestAs:v10];

    id v4 = v10;
    if (v6)
    {
      int v7 = [(ACTKeyboardController *)self requestCondition];
      [v7 lock];

      [(ACTKeyboardController *)self setCurrentRequestToken:0];
      char v8 = [(ACTKeyboardController *)self requestCondition];
      [v8 signal];

      id v9 = [(ACTKeyboardController *)self requestCondition];
      [v9 unlock];

      id v4 = v10;
    }
  }
}

- (void)pushCandidateResultSet:(id)a3 requestToken:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  int v7 = [v13 firstCandidate];
  int v8 = [v7 isContinuousPathConversion];

  if (v8)
  {
    id v9 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v9 lock];

    id v10 = [(ACTKeyboardController *)self lastCPRequestToken];
    int v11 = [v10 isSameRequestAs:v6];

    if (v11)
    {
      [(ACTKeyboardController *)self setCandidateResultSet:v13];
      [(ACTKeyboardController *)self setLastCPRequestToken:0];
    }
    uint64_t v12 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v12 unlock];
  }
  else
  {
    [(ACTKeyboardController *)self setCandidateResultSet:v13];
  }
}

- (void)pushAutocorrections:(id)a3 requestToken:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  int v7 = [v14 corrections];
  int v8 = [v7 autocorrection];
  int v9 = [v8 isContinuousPathConversion];

  if (v9)
  {
    id v10 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v10 lock];

    int v11 = [(ACTKeyboardController *)self lastCPRequestToken];
    int v12 = [v11 isSameRequestAs:v6];

    if (v12)
    {
      [(ACTKeyboardController *)self setAutocorrectionList:v14];
      [(ACTKeyboardController *)self setLastCPRequestToken:0];
    }
    id v13 = [(ACTKeyboardController *)self cpRequestTokenLock];
    [v13 unlock];
  }
  else
  {
    [(ACTKeyboardController *)self setAutocorrectionList:v14];
  }
}

- (void)generateAutocorrectionsWithCount:(unint64_t)a3
{
  uint64_t v5 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v6 = [(ACTKeyboardController *)self clonedKeyboardState];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__ACTKeyboardController_generateAutocorrectionsWithCount___block_invoke;
  v7[3] = &unk_265050578;
  v7[4] = self;
  objc_msgSend(v5, "generateAutocorrectionsWithKeyboardState:candidateRange:completionHandler:", v6, 0, a3, v7);
}

uint64_t __58__ACTKeyboardController_generateAutocorrectionsWithCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAutocorrectionList:a2];
}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v5 setShiftState:v3];
  id v6 = [(ACTKeyboardController *)self inputManagerWrapper];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__ACTKeyboardController_generateAutocorrectionsWithShiftState___block_invoke;
  v7[3] = &unk_265050578;
  v7[4] = self;
  [v6 generateAutocorrectionsWithKeyboardState:v5 completionHandler:v7];
}

uint64_t __63__ACTKeyboardController_generateAutocorrectionsWithShiftState___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setAutocorrectionList:a2];
}

- (void)generateAutocorrectionsOrCandidates
{
  BOOL v3 = [(ACTKeyboardController *)self generatesCandidates];
  id v4 = [(ACTKeyboardController *)self clonedKeyboardState];
  if (v3) {
    [(ACTKeyboardController *)self generateCandidatesWithKeyboardState:v4];
  }
  else {
    [(ACTKeyboardController *)self generateAutocorrectionsWithKeyboardState:v4];
  }
}

- (BOOL)generatesCandidates
{
  BOOL v3 = [(ACTKeyboardController *)self keyboardState];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(ACTKeyboardController *)self keyboardState];
    char v5 = [v4 longPredictionListEnabled];
  }
  else
  {
    char v5 = 0;
  }

  id v6 = [(ACTKeyboardController *)self inputManagerState];
  char v7 = [v6 usesCandidateSelection] | v5;

  return v7;
}

- (id)trimmedCandidate:(id)a3
{
  id v3 = a3;
  id v4 = [v3 input];
  char v5 = [v3 rawInput];
  id v6 = [v3 candidate];
  unint64_t v7 = [v4 length];
  unint64_t v8 = [v6 length];
  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  id v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  uint64_t v29 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __42__ACTKeyboardController_trimmedCandidate___block_invoke;
  v22[3] = &unk_265050550;
  id v11 = v4;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  v25 = &v26;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 2, v22);
  id v13 = v3;
  id v14 = v13;
  if (v27[3])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = objc_alloc(MEMORY[0x263F7E6F8]);
      id v16 = [v6 substringFromIndex:v27[3]];
      id v17 = [v11 substringFromIndex:v27[3]];
      id v14 = objc_msgSend(v15, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v16, v17, v5, objc_msgSend(v13, "wordOriginFeedbackID"), objc_msgSend(v13, "usageTrackingMask"), objc_msgSend(v13, "sourceMask"));

      objc_msgSend(v14, "setContinuousPathConversion:", objc_msgSend(v13, "isContinuousPathConversion"));
      int v18 = v13;
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x263F7E640];
      int v18 = [v6 substringFromIndex:v27[3]];
      uint64_t v20 = [v11 substringFromIndex:v27[3]];
      id v14 = [v19 candidateWithCandidate:v18 forInput:v20];
    }
  }

  _Block_object_dispose(&v26, 8);
  return v14;
}

void __42__ACTKeyboardController_trimmedCandidate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v13 = a2;
  id v11 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  char v12 = [v13 isEqualToString:v11];

  if (v12)
  {
    if (a4 == 1
      && objc_msgSend(*(id *)(a1 + 40), "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", 0)))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3 + 1;
    }
  }
  else
  {
    *a7 = 1;
  }
}

- (id)candidateToConfirmInputString
{
  id v3 = [(ACTKeyboardController *)self inputManager];
  id v4 = [v3 defaultCandidate];

  char v5 = [(ACTKeyboardController *)self trimmedCandidate:v4];

  return v5;
}

- (NSArray)predictions
{
  id v3 = [(ACTKeyboardController *)self candidateResultSet];
  id v4 = [v3 candidates];

  if (!v4 || ![v4 count])
  {
    char v5 = [(ACTKeyboardController *)self autocorrectionList];
    uint64_t v6 = [v5 predictions];
    unint64_t v7 = (void *)v6;
    unint64_t v8 = (void *)MEMORY[0x263EFFA68];
    if (v6) {
      unint64_t v8 = (void *)v6;
    }
    id v9 = v8;

    id v4 = v9;
  }
  return (NSArray *)v4;
}

- (TIKeyboardCandidate)autocorrection
{
  id v3 = [(ACTKeyboardController *)self autocorrectionList];
  int v4 = [v3 shouldAcceptTopCandidate];

  if (!v4) {
    goto LABEL_4;
  }
  char v5 = [(ACTKeyboardController *)self autocorrectionList];
  uint64_t v6 = [v5 candidates];
  unint64_t v7 = [v6 firstObject];

  if (v7)
  {
    unint64_t v8 = [(ACTKeyboardController *)self trimmedCandidate:v7];
  }
  else
  {
LABEL_4:
    unint64_t v8 = [(ACTKeyboardController *)self candidateToConfirmInputString];
  }
  id v9 = [(ACTKeyboardController *)self text];
  uint64_t v10 = [(ACTKeyboardController *)self selectedRange];
  char v12 = [v9 substringToIndex:v10 + v11];

  id v13 = [v8 input];
  if (![v13 length]) {
    goto LABEL_13;
  }
  id v14 = [v8 input];
  if ([v12 hasSuffix:v14])
  {

LABEL_13:
    goto LABEL_14;
  }
  id v15 = [v8 rawInput];
  if (![v15 length])
  {

    goto LABEL_12;
  }
  id v16 = [v8 rawInput];
  char v17 = [v12 hasSuffix:v16];

  if ((v17 & 1) == 0)
  {
LABEL_12:
    [MEMORY[0x263F7E640] candidateWithUnchangedInput:&stru_26F2B7E50];
    unint64_t v8 = v13 = v8;
    goto LABEL_13;
  }
LABEL_14:

  return (TIKeyboardCandidate *)v8;
}

- (TIKeyboardCandidate)inlineCompletion
{
  id v3 = [(ACTKeyboardController *)self autocorrectionList];
  int v4 = [v3 shouldAcceptInlineCompletion];

  if (!v4)
  {
    id v16 = 0;
    goto LABEL_10;
  }
  char v5 = [(ACTKeyboardController *)self autocorrectionList];
  uint64_t v6 = [v5 inlineCompletions];
  unint64_t v7 = [v6 firstObject];

  unint64_t v8 = [v7 candidate];
  id v9 = [v8 componentsSeparatedByString:@" "];

  uint64_t v10 = [(ACTKeyboardController *)self text];
  uint64_t v11 = [(ACTKeyboardController *)self selectedRange];
  id v13 = [v10 substringFromIndex:v12 + v11 - 1];

  if ([v13 isEqualToString:@" "])
  {
    if ((unint64_t)[v9 count] < 2)
    {
      id v16 = 0;
      goto LABEL_9;
    }
    uint64_t v14 = [v9 objectAtIndexedSubscript:1];
    uint64_t v15 = [v7 candidateByReplacingWithCandidate:v14 input:&stru_26F2B7E50 rawInput:&stru_26F2B7E50];
  }
  else
  {
    uint64_t v14 = [v9 firstObject];
    uint64_t v15 = [v7 candidateByReplacingWithCandidate:v14];
  }
  id v16 = (void *)v15;

  unint64_t v7 = (void *)v14;
LABEL_9:

LABEL_10:
  return (TIKeyboardCandidate *)v16;
}

- (void)textAccepted:(id)a3 predictiveCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [v6 candidate];
  uint64_t v8 = [v7 length];

  if (!v8)
  {
    id v9 = v6;
    goto LABEL_15;
  }
  id v9 = [(ACTKeyboardController *)self candidateByApplyingSmartPunctuationToCandidate:v6];

  uint64_t v10 = [(ACTKeyboardController *)self inputManagerWrapper];
  char v11 = objc_opt_respondsToSelector();

  uint64_t v12 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v13 = v12;
  if (v11)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__ACTKeyboardController_textAccepted_predictiveCandidate___block_invoke;
    v21[3] = &unk_265050448;
    v21[4] = self;
    [v12 textAccepted:v9 completionHandler:v21];
  }
  else
  {
    [v12 textAccepted:v9];
  }

  if (v4)
  {
    uint64_t v14 = [(ACTKeyboardController *)self inputManager];
    [v14 dropInput];
  }
  if (![v9 isContinuousPathConversion]) {
    goto LABEL_12;
  }
  uint64_t v15 = [v9 input];
  if ([v15 length])
  {

LABEL_12:
    int v18 = [v9 input];
    uint64_t v19 = [v9 rawInput];
    [(ACTKeyboardController *)self deleteText:v18 rawText:v19];

    goto LABEL_13;
  }
  id v16 = [v9 rawInput];
  uint64_t v17 = [v16 length];

  if (v17) {
    goto LABEL_12;
  }
  -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", self->_selectedRange.location, self->_selectedRange.length);
  self->_selectedRange.NSUInteger length = 0;
  [(ACTKeyboardController *)self updateDocumentState];
LABEL_13:
  uint64_t v20 = [v9 candidate];
  [(ACTKeyboardController *)self insertText:v20];

  if ([v9 shouldInsertSpaceAfterSelection]) {
    [(ACTKeyboardController *)self insertTextAfterSelection:@" "];
  }
LABEL_15:
}

uint64_t __58__ACTKeyboardController_textAccepted_predictiveCandidate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

- (id)candidateByApplyingSmartPunctuationToCandidate:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(ACTKeyboardController *)self smartPunctuationController];

  id v6 = v4;
  unint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [(ACTKeyboardController *)self smartPunctuationController];
    id v9 = [v6 candidate];
    uint64_t v10 = [v8 smartPunctuationResultsForString:v9];

    unint64_t v7 = v6;
    if ([v10 count])
    {
      char v11 = (void *)MEMORY[0x263F089D8];
      uint64_t v12 = [v6 candidate];
      id v13 = [v11 stringWithString:v12];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      uint64_t v14 = objc_msgSend(v10, "reverseObjectEnumerator", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v29 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            uint64_t v20 = [v19 range];
            uint64_t v22 = v21;
            id v23 = [v19 replacementString];
            objc_msgSend(v13, "replaceCharactersInRange:withString:", v20, v22, v23);
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v16);
      }

      id v24 = objc_alloc(MEMORY[0x263F7E640]);
      v25 = [v6 input];
      uint64_t v26 = [v6 rawInput];
      unint64_t v7 = (void *)[v24 initWithCandidate:v13 forInput:v25 rawInput:v26];
    }
  }

  return v7;
}

- (void)acceptCandidate:(id)a3 predictiveCandidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(ACTKeyboardController *)self inputManagerState];
  int v8 = [v7 usesCandidateSelection];

  if (v8)
  {
    id v9 = [(ACTKeyboardController *)self inputManagerState];
    int v10 = [v9 commitsAcceptedCandidate];

    if (v10)
    {
      char v11 = [v6 candidate];
      uint64_t v12 = [v11 length];

      if (v12)
      {
        id v13 = [(ACTKeyboardController *)self inputManagerWrapper];
        [v13 textAccepted:v6];
      }
      [(ACTKeyboardController *)self setMarkedText:0];
      uint64_t v14 = [v6 candidate];
      [(ACTKeyboardController *)self insertText:v14];
    }
    uint64_t v15 = [(ACTKeyboardController *)self inputManagerWrapper];
    uint64_t v16 = [(ACTKeyboardController *)self clonedKeyboardState];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__ACTKeyboardController_acceptCandidate_predictiveCandidate___block_invoke;
    v17[3] = &unk_265050528;
    v17[4] = self;
    [v15 handleAcceptedCandidate:v6 keyboardState:v16 completionHandler:v17];
  }
  else
  {
    [(ACTKeyboardController *)self textAccepted:v6 predictiveCandidate:v4];
  }
  [(ACTKeyboardController *)self setLastInputWasSelection:v4];
  [(ACTKeyboardController *)self setCandidateResultSet:0];
  [(ACTKeyboardController *)self setAutocorrectionList:0];
}

void __61__ACTKeyboardController_acceptCandidate_predictiveCandidate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v11 = a2;
  uint64_t v6 = [v5 textToCommit];
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 208);
  *(void *)(v7 + 208) = v6;

  id v9 = *(void **)(a1 + 32);
  int v10 = [v5 textToCommit];

  [v9 insertText:v10];
  [*(id *)(a1 + 32) setKeyboardConfiguration:v11];
}

- (void)acceptCandidate:(id)a3
{
}

- (BOOL)hasPrediction:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(ACTKeyboardController *)self autocorrectionList];
  uint64_t v6 = [v5 predictions];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) candidate];
        BOOL v13 = [v12 compare:v4] == 0;

        v9 |= v13;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)rejectCandidate:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ACTKeyboardController *)self inputManagerWrapper];
    [v5 candidateRejected:v4];
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v27 = self;
  uint64_t v6 = [(ACTKeyboardController *)self autocorrectionList];
  uint64_t v7 = [v6 predictions];

  id obj = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  long long v28 = v4;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v31;
    uint64_t v12 = &stru_26F2B7E50;
    BOOL v13 = &stru_26F2B7E50;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v16 = [v15 input];
        long long v17 = v16;
        if (v13)
        {
          unint64_t v18 = [(__CFString *)v16 length];
          unint64_t v19 = [(__CFString *)v13 length];

          if (v18 <= v19) {
            continue;
          }
          long long v17 = [v15 input];
        }
        uint64_t v20 = [v15 rawInput];

        uint64_t v10 = [v15 typingEngine];
        uint64_t v12 = (__CFString *)v20;
        BOOL v13 = v17;
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (!v9) {
        goto LABEL_16;
      }
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = &stru_26F2B7E50;
  BOOL v13 = &stru_26F2B7E50;
LABEL_16:

  uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F7E640]) initWithCandidate:v13 forInput:v13 rawInput:v12];
  [v21 setTypingEngine:v10];
  uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F7E538]) initWithAutocorrection:v21 alternateCorrections:0];
  id v23 = (void *)MEMORY[0x263F7E518];
  id v24 = [(ACTKeyboardController *)v27 autocorrectionList];
  v25 = [v24 predictions];
  uint64_t v26 = [v23 listWithCorrections:v22 predictions:v25];
  [(ACTKeyboardController *)v27 setAutocorrectionList:v26];
}

- (void)acceptAutocorrection
{
  id v3 = [(ACTKeyboardController *)self autocorrectionList];
  int v4 = [v3 shouldAcceptTopCandidate];

  if (v4)
  {
    id v5 = [(ACTKeyboardController *)self autocorrectionList];
    uint64_t v6 = [v5 candidates];
    id v7 = [v6 firstObject];
  }
  else
  {
    id v7 = 0;
  }
  [(ACTKeyboardController *)self textAccepted:v7 predictiveCandidate:0];
  [(ACTKeyboardController *)self setAutocorrectionList:0];
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(ACTKeyboardController *)self layoutUtils];
  uint64_t v6 = [v5 keyOverrides];
  id v7 = [v6 objectForKey:v4];

  return v7;
}

- (id)keyToAccessKeyplane:(id)a3 fromKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(ACTKeyboardController *)self isKeyplane:v6 shiftAlternateOfKeyplane:v7])
  {
    uint64_t v8 = @"Shift";
LABEL_5:
    uint64_t v9 = [(ACTKeyboardLayoutUtils *)self->_layoutUtils exactKeyForString:v8 keyplane:v7 includeSecondaryStrings:0];
    goto LABEL_7;
  }
  if ([(ACTKeyboardController *)self isKeyplane:v6 alternateOfKeyplane:v7])
  {
    uint64_t v8 = @"More";
    goto LABEL_5;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (BOOL)isKeyplane:(id)a3 alternateOfKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ACTKeyboardController *)self keyboard];
  uint64_t v9 = [v6 alternateKeyplaneName];

  id v10 = [v8 subtreeWithName:v9];

  return v10 == v7;
}

- (BOOL)isKeyplane:(id)a3 shiftAlternateOfKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ACTKeyboardController *)self keyboard];
  uint64_t v9 = [v6 shiftAlternateKeyplaneName];

  id v10 = [v8 subtreeWithName:v9];

  return v10 == v7;
}

- (void)enumerateKeyplaneNamesAdjacentToKeyplane:(id)a3 usingBlock:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v5 = objc_msgSend(a3, sel_shiftAlternateKeyplaneName);
  v7[2](v7, v5);

  id v6 = objc_msgSend(a3, sel_alternateKeyplaneName);
  v7[2](v7, v6);
}

- (BOOL)isKeyStringAboveSpaceBar:(id)a3
{
  id v4 = a3;
  id v5 = [(ACTKeyboardController *)self keyplane];
  int64_t v6 = [(ACTKeyboardController *)self keyCodeWithString:@" " inKeyplane:v5];

  if (v6 == -1)
  {
    BOOL v19 = 0;
  }
  else
  {
    id v7 = [(ACTKeyboardController *)self keyplane];
    uint64_t v8 = [v7 keys];
    uint64_t v9 = [v8 objectAtIndexedSubscript:v6];

    id v10 = [(ACTKeyboardController *)self keyplane];
    int64_t v11 = [(ACTKeyboardController *)self keyCodeWithString:v4 inKeyplane:v10];

    if (v11 == -1)
    {
      BOOL v19 = 0;
    }
    else
    {
      uint64_t v12 = [(ACTKeyboardController *)self keyplane];
      BOOL v13 = [v12 keys];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v11];

      [v9 frame];
      double v16 = v15;
      [v14 frame];
      CGFloat MidX = CGRectGetMidX(v22);
      [v14 frame];
      CGFloat v18 = v16 + CGRectGetMidY(v23);
      [v9 frame];
      v21.x = MidX;
      v21.y = v18;
      BOOL v19 = CGRectContainsPoint(v24, v21);
    }
  }

  return v19;
}

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [v7 frame];
  v29.double x = x;
  v29.double y = y;
  if (CGRectContainsPoint(v30, v29)
    || ([v7 name],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 hasPrefix:@"Dynamic"],
        v8,
        v9))
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = objc_msgSend(v7, "keys", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      BOOL v13 = 0;
      uint64_t v14 = *(void *)v23;
      double v15 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v10);
          }
          long long v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v17 visible])
          {
            -[ACTKeyboardController distanceFromKey:toPoint:](self, "distanceFromKey:toPoint:", v17, x, y);
            double v19 = v18;
            if (v15 > v18)
            {
              id v20 = v17;

              BOOL v13 = v20;
              double v15 = v19;
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (float)distanceFromKey:(id)a3 toPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v6 = a3;
  [v6 frame];
  double MinX = CGRectGetMinX(v24);
  [v6 frame];
  if (x >= MinX)
  {
    float v13 = 0.0;
    if (x <= CGRectGetMaxX(*(CGRect *)&v8)) {
      goto LABEL_6;
    }
    [v6 frame];
    double MaxX = CGRectGetMaxX(v25);
  }
  else
  {
    double MaxX = CGRectGetMinX(*(CGRect *)&v8);
  }
  float v13 = x - MaxX;
LABEL_6:
  [v6 frame];
  double MinY = CGRectGetMinY(v26);
  [v6 frame];
  if (y < MinY)
  {
    double v19 = CGRectGetMinY(*(CGRect *)&v15);
LABEL_10:
    float v21 = y - v19;
    goto LABEL_11;
  }
  CGFloat MaxY = CGRectGetMaxY(*(CGRect *)&v15);
  float v21 = 0.0;
  if (y > MaxY)
  {
    [v6 frame];
    double v19 = CGRectGetMaxY(v27);
    goto LABEL_10;
  }
LABEL_11:
  float v22 = sqrtf((float)(v21 * v21) + (float)(v13 * v13));

  return v22;
}

- (int64_t)keyCodeWithString:(id)a3 inKeyplane:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  float v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = -1;
  uint64_t v8 = [v7 keys];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__ACTKeyboardController_keyCodeWithString_inKeyplane___block_invoke;
  v13[3] = &unk_265050500;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  double v16 = &v17;
  [v8 enumerateObjectsUsingBlock:v13];

  int64_t v11 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__ACTKeyboardController_keyCodeWithString_inKeyplane___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 layoutUtils];
  objc_msgSend(v9, "representedStringForKey:shifted:", v8, objc_msgSend(*(id *)(a1 + 40), "isShiftKeyplane"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if ([*(id *)(a1 + 48) isEqualToString:v10])
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)addStringFromGestureKeyInput:(id)a3
{
}

- (void)addStringFromVariantKey:(id)a3
{
}

- (id)performSkipTapAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 forcedKeyCode:(int64_t)a8
{
  id v10 = [(ACTKeyboardController *)self keys];
  int64_t v11 = [v10 objectAtIndex:a8];

  if ([v11 interactionType] == 11)
  {
    uint64_t v12 = &stru_26F2B7E50;
  }
  else
  {
    uint64_t v12 = 0;
    float v13 = 0;
    if (![v11 BOOLForProperty:@"more-after"]) {
      goto LABEL_5;
    }
  }
  [(ACTKeyboardController *)self alternateKeyplane];
  float v13 = v12;
LABEL_5:
  if ([v11 BOOLForProperty:@"shift-after"]) {
    [(ACTKeyboardController *)self shiftKeyplane];
  }
  if ([v11 interactionType] != 14) {
    [(ACTKeyboardController *)self updateAutoshift];
  }
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];

  return v13;
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v16 = [(ACTKeyboardController *)self activeTouchState];
  unint64_t v17 = 0x263F08000uLL;
  float v18 = [NSNumber numberWithUnsignedInteger:a6];
  uint64_t v19 = [v16 objectForKey:v18];

  uint64_t v20 = [v19 lastTouchEvent];
  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:](self, "touchPassesDragThresholdAtPoint:pathIndex:", a6, x, y)|| [v20 continuousPathState] == 3|| objc_msgSend(v20, "continuousPathState") == 4)
  {
    *(float *)&double v21 = a4;
    -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:](self, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v9, x, y, v21, a5);
    float v22 = [(ACTKeyboardController *)self activeTouchState];
    long long v23 = [NSNumber numberWithUnsignedInteger:a6];
    CGRect v24 = [v22 objectForKey:v23];

    uint64_t v25 = [v24 lastTouchEvent];

    uint64_t v20 = (void *)v25;
    uint64_t v19 = v24;
  }
  uint64_t v26 = [v20 forcedKeyCode];
  if ([v20 continuousPathState] == 4) {
    uint64_t v27 = 5;
  }
  else {
    uint64_t v27 = [v20 continuousPathState];
  }
  long long v28 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 2, a6, v9, v26, v27, x, y, a4, a5);
  if (v26 == -2)
  {
    if (![(ACTKeyboardController *)self insertsSpaceAfterPredictiveInput]
      && ![(ACTKeyboardController *)self usesTransliteration])
    {
      CGPoint v29 = [(ACTKeyboardController *)self autocorrection];
      if (![v29 isAutocorrection])
      {
LABEL_32:

        goto LABEL_33;
      }
      CGRect v30 = [(ACTKeyboardController *)self autocorrection];
      long long v31 = [v30 candidate];
      if (![v31 length])
      {

        goto LABEL_31;
      }
      [(ACTKeyboardController *)self autocorrection];
      v33 = long long v32 = v28;
      char v34 = [v33 isContinuousPathConversion];

      long long v28 = v32;
      if ((v34 & 1) == 0)
      {
        [(ACTKeyboardController *)self setLastInputWasSelection:1];
        CGPoint v29 = [(ACTKeyboardController *)self inputManagerState];
        CGRect v30 = [v29 wordSeparator];
        [(ACTKeyboardController *)self addInput:v30 fromVariantKey:0 touchEvent:0];
LABEL_31:

        goto LABEL_32;
      }
    }
LABEL_33:
    v55 = [(ACTKeyboardController *)self inputManagerWrapper];
    v56 = [(ACTKeyboardController *)self clonedKeyboardState];
    [v55 skipHitTestForTouchEvent:v28 keyboardState:v56];

    [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
    v57 = [(ACTKeyboardController *)self autocorrection];
    v44 = [v57 candidate];

    if ([(ACTKeyboardController *)self usesTransliteration]
      || [(ACTKeyboardController *)self generatesCandidates])
    {
      v43 = 0;
      unint64_t v58 = 0x263F08000;
LABEL_48:
      [(ACTKeyboardController *)self updateAutoshift];
      v78 = [(ACTKeyboardController *)self activeTouchState];
      v79 = [*(id *)(v58 + 2584) numberWithUnsignedInteger:a6];
      [v78 removeObjectForKey:v79];

      goto LABEL_49;
    }
    v86 = v28;
    v59 = (void *)MEMORY[0x263F7E518];
    v60 = [(ACTKeyboardController *)self autocorrectionList];
    v61 = [v60 predictions];
    v62 = [(ACTKeyboardController *)self autocorrectionList];
    v63 = [v62 emojiList];
    v64 = [v59 listWithCorrections:0 predictions:v61 emojiList:v63];

    if (![v44 length])
    {
      v43 = 0;
      goto LABEL_40;
    }
    if ([(ACTKeyboardController *)self insertsSpaceAfterPredictiveInput])
    {
      v65 = [(ACTKeyboardController *)self inputManagerState];
      v43 = [v65 wordSeparator];

      v66 = [(ACTKeyboardController *)self inputManagerState];
      v67 = [v66 wordSeparator];
      uint64_t v68 = [v44 stringByAppendingString:v67];

      id v69 = [(ACTKeyboardController *)self adjustContinuousPathCandidate:v68];
      [(ACTKeyboardController *)self addInput:v43 fromVariantKey:0 touchEvent:0];
      v44 = (void *)v68;
LABEL_40:
      unint64_t v58 = 0x263F08000;
LABEL_47:
      long long v28 = v86;
      [(ACTKeyboardController *)self setAutocorrectionList:v64];

      goto LABEL_48;
    }
    v70 = [(ACTKeyboardController *)self autocorrection];
    v71 = [v70 candidate];
    if ([v71 hasPrefix:@" "])
    {
      v72 = [(ACTKeyboardController *)self text];
      int v73 = [v72 hasSuffix:@"..."];

      if (!v73)
      {
        unint64_t v58 = 0x263F08000uLL;
        goto LABEL_46;
      }
      id v81 = objc_alloc(MEMORY[0x263F7E6F8]);
      v84 = [v70 candidate];
      v74 = [v84 substringFromIndex:1];
      v75 = [v70 input];
      v76 = [v70 rawInput];
      v82 = objc_msgSend(v81, "initWithCandidate:forInput:rawInput:wordOriginFeedbackID:usageTrackingMask:sourceMask:", v74, v75, v76, objc_msgSend(v70, "wordOriginFeedbackID"), objc_msgSend(v70, "usageTrackingMask"), objc_msgSend(v70, "sourceMask"));

      [v82 setContinuousPathConversion:1];
      v71 = v70;
      v70 = v82;
    }
    unint64_t v58 = 0x263F08000;

LABEL_46:
    uint64_t v77 = [v70 candidate];

    [(ACTKeyboardController *)self acceptCandidate:v70];
    v43 = 0;
    v44 = (void *)v77;
    goto LABEL_47;
  }
  uint64_t v35 = [(ACTKeyboardController *)self keys];
  int v36 = [v35 objectAtIndex:v26];

  v37 = [(ACTKeyboardController *)self layoutUtils];
  v38 = objc_msgSend(v37, "representedStringForKey:shifted:includeSecondaryStrings:", v36, -[ACTKeyboardController isShifted](self, "isShifted"), v8);

  int v39 = 0;
  BOOL v40 = &stru_26F2B7E50;
  switch([v36 interactionType])
  {
    case 1u:
    case 2u:
    case 0xDu:
    case 0x10u:
      [(ACTKeyboardController *)self addInput:v38 fromVariantKey:0 touchEvent:v28];
      int v39 = v38;
      goto LABEL_17;
    case 4u:
      v45 = [(ACTKeyboardController *)self inputManagerWrapper];
      v46 = [(ACTKeyboardController *)self clonedKeyboardState];
      [v45 skipHitTestForTouchEvent:v28 keyboardState:v46];

      [(ACTKeyboardController *)self deleteInput:v28];
      int v39 = @"\\b";
      goto LABEL_17;
    case 0xBu:
      goto LABEL_18;
    case 0xEu:
      v47 = [(ACTKeyboardController *)self inputManagerWrapper];
      v48 = [(ACTKeyboardController *)self clonedKeyboardState];
      [v47 skipHitTestForTouchEvent:v28 keyboardState:v48];

      [(ACTKeyboardController *)self shiftKeyplane];
      int v39 = &stru_26F2B7E50;
      goto LABEL_17;
    case 0xFu:
      v85 = v28;
      [(ACTKeyboardController *)self addInput:v38 fromVariantKey:0 touchEvent:v28];
      int v39 = v38;
      v49 = [(ACTKeyboardController *)self keyplane];
      v50 = [v49 name];
      char v51 = [v50 containsString:@"Wildcat"];

      if (v51)
      {
        v52 = [(ACTKeyboardController *)self keyplane];
        v53 = [v52 name];
        v54 = [v53 uppercaseString];
        int v83 = [v54 containsString:@"-ALTERNATE"];

        unint64_t v17 = 0x263F08000;
        long long v28 = v85;
        if (!v83) {
          goto LABEL_19;
        }
      }
      else
      {
        unint64_t v17 = 0x263F08000;
        long long v28 = v85;
      }
LABEL_17:
      BOOL v40 = v39;
      if ([v36 BOOLForProperty:@"more-after"])
      {
LABEL_18:
        [(ACTKeyboardController *)self alternateKeyplane];
        int v39 = v40;
      }
LABEL_19:
      if ([v36 BOOLForProperty:@"shift-after"]) {
        [(ACTKeyboardController *)self shiftKeyplane];
      }
      if ([v36 interactionType] != 14) {
        [(ACTKeyboardController *)self updateAutoshift];
      }
      [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];

      BOOL v41 = [(ACTKeyboardController *)self activeTouchState];
      id v42 = [*(id *)(v17 + 2584) numberWithUnsignedInteger:a6];
      [v41 removeObjectForKey:v42];

      v43 = v39;
      v44 = v43;
      break;
    default:
      goto LABEL_17;
  }
LABEL_49:

  return v44;
}

- (id)adjustContinuousPathCandidate:(id)a3
{
  id v4 = a3;
  id v5 = [(ACTKeyboardController *)self text];
  int v6 = [v5 length];
  if (v6 >= 3
    && [v4 length]
    && [v5 characterAtIndex:(v6 - 1)] == 46
    && [v5 characterAtIndex:(v6 - 2)] == 46
    && [v5 characterAtIndex:(v6 - 3)] == 46
    && [v4 characterAtIndex:0])
  {
    uint64_t v7 = [v4 substringFromIndex:1];

    id v4 = (id)v7;
  }

  return v4;
}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  id v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  id v26 = [v14 objectForKey:v15];

  double v16 = [v26 lastTouchEvent];
  int v17 = [v16 continuousPathState];
  if (v17 == 2) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = 6;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [v16 forcedKeyCode];
  double v21 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 5, a6, v7, v20, v19, x, y, a4, a5);
  float v22 = [(ACTKeyboardController *)self inputManagerWrapper];
  long long v23 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v22 performHitTestForTouchEvent:v21 keyboardState:v23 continuation:&__block_literal_global_143];

  CGRect v24 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a6];
  [v24 removeObjectForKey:v25];
}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  id v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  id v28 = [v14 objectForKey:v15];

  double v16 = [v28 lastTouchEvent];
  int v17 = v16;
  if (v16)
  {
    int v18 = [v16 continuousPathState];
    if (v18 == 2) {
      unsigned int v19 = 2;
    }
    else {
      unsigned int v19 = 6;
    }
    if (v18) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = 0;
    }
    uint64_t v21 = [v17 forcedKeyCode];
  }
  else
  {
    uint64_t v20 = 0;
    uint64_t v21 = -1;
  }
  float v22 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 4, a6, v7, v21, v20, x, y, a4, a5);
  long long v23 = [(ACTKeyboardController *)self inputManagerWrapper];
  CGRect v24 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v23 skipHitTestForTouchEvent:v22 keyboardState:v24];

  uint64_t v25 = objc_alloc_init(_ACTKeyboardTouchState);
  [(_ACTKeyboardTouchState *)v25 setLastTouchEvent:v22];
  -[_ACTKeyboardTouchState setDragged:](v25, "setDragged:", [v28 dragged]);
  [v28 initialDragPoint];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:");
  id v26 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:a6];
  [v26 setObject:v25 forKey:v27];
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  id v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  id v26 = [v14 objectForKey:v15];

  double v16 = [v26 lastTouchEvent];
  int v17 = [v16 continuousPathState];
  if (v17 == 2) {
    unsigned int v18 = 2;
  }
  else {
    unsigned int v18 = 6;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 0;
  }
  if ([v16 forcedKeyCode] == -2) {
    uint64_t v20 = -2;
  }
  else {
    uint64_t v20 = -1;
  }
  uint64_t v21 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 3, a6, v7, v20, v19, x, y, a4, a5);
  float v22 = [(ACTKeyboardController *)self inputManagerWrapper];
  long long v23 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v22 skipHitTestForTouchEvent:v21 keyboardState:v23];

  CGRect v24 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v25 = [NSNumber numberWithUnsignedInteger:a6];
  [v24 removeObjectForKey:v25];
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  id v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  double v16 = [v14 objectForKey:v15];

  if (-[ACTKeyboardController touchPassesDragThresholdAtPoint:pathIndex:](self, "touchPassesDragThresholdAtPoint:pathIndex:", a6, x, y))
  {
    *(float *)&double v17 = a4;
    int64_t v18 = -[ACTKeyboardController retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:](self, "retestTouchAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v17, a5);
  }
  else
  {
    uint64_t v19 = [v16 lastTouchEvent];
    int64_t v18 = [v19 forcedKeyCode];
  }
  return v18;
}

- (int64_t)retestTouchAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  id v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  double v16 = [v14 objectForKey:v15];

  double v17 = [v16 lastTouchEvent];
  if ([v17 continuousPathState] == 1) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = [v17 continuousPathState];
  }
  if ([v17 forcedKeyCode] == -2) {
    uint64_t v19 = -2;
  }
  else {
    uint64_t v19 = -1;
  }
  double v20 = a4;
  uint64_t v21 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 1, a6, v7, v19, v18, x, y, v20, a5);
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = v19;
  float v22 = [(ACTKeyboardController *)self inputManagerWrapper];
  long long v23 = [(ACTKeyboardController *)self clonedKeyboardState];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __83__ACTKeyboardController_retestTouchAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke;
  v30[3] = &unk_2650504B8;
  v30[4] = &v31;
  [v22 performHitTestForTouchEvent:v21 keyboardState:v23 continuation:v30];

  CGRect v24 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 1, a6, v7, x, y, v20, a5);
  uint64_t v25 = objc_alloc_init(_ACTKeyboardTouchState);
  [(_ACTKeyboardTouchState *)v25 setLastTouchEvent:v24];
  [(_ACTKeyboardTouchState *)v25 setDragged:1];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v25, "setInitialDragPoint:", x, y);
  id v26 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:a6];
  [v26 setObject:v25 forKey:v27];

  int64_t v28 = v32[3];
  _Block_object_dispose(&v31, 8);

  return v28;
}

uint64_t __83__ACTKeyboardController_retestTouchAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)touchPassesDragThresholdAtPoint:(CGPoint)a3 pathIndex:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  BOOL v8 = [(ACTKeyboardController *)self activeTouchState];
  uint64_t v9 = [NSNumber numberWithUnsignedInteger:a4];
  id v10 = [v8 objectForKey:v9];

  [v10 initialDragPoint];
  double v12 = v11;
  double v14 = v13;
  id v15 = [(ACTKeyboardController *)self keyboardState];
  double v16 = [v15 layoutState];
  uint64_t v17 = [v16 userInterfaceIdiom];

  int v18 = [v10 dragged];
  float v19 = 42.0;
  if (v18) {
    float v19 = 34.0;
  }
  float v20 = 18.0;
  if (v18) {
    float v20 = 12.0;
  }
  if (v17 != 1) {
    float v19 = v20;
  }
  float v21 = y - v14;
  float v22 = x - v12;
  BOOL v23 = fabsf(v22) >= v19;
  BOOL v24 = fabsf(v21) >= v19 || v23;

  return v24;
}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  double v14 = [(ACTKeyboardController *)self activeTouchState];
  id v15 = [NSNumber numberWithUnsignedInteger:a6];
  double v16 = [v14 objectForKey:v15];

  uint64_t v17 = [(ACTKeyboardController *)self keyplane];
  int v18 = -[ACTKeyboardController keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v17, x, y);

  if ([v18 interactionType] == 14)
  {
    float v19 = [(ACTKeyboardController *)self keyplane];
    float v20 = @"Shift";
LABEL_5:
    int64_t v21 = [(ACTKeyboardController *)self keyCodeWithString:v20 inKeyplane:v19];

    goto LABEL_7;
  }
  if ([v18 interactionType] == 11)
  {
    float v19 = [(ACTKeyboardController *)self keyplane];
    float v20 = @"More";
    goto LABEL_5;
  }
  int64_t v21 = -1;
LABEL_7:
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000;
  int64_t v36 = v21;
  double v22 = a4;
  if ([v18 interactionType] != 11)
  {
    BOOL v23 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 0, a6, v7, v21, 1, x, y, v22, a5);
    BOOL v24 = [(ACTKeyboardController *)self inputManagerWrapper];
    uint64_t v25 = [(ACTKeyboardController *)self clonedKeyboardState];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __88__ACTKeyboardController_performTouchDownAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke;
    v32[3] = &unk_2650504B8;
    v32[4] = &v33;
    [v24 performHitTestForTouchEvent:v23 keyboardState:v25 continuation:v32];
  }
  id v26 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:fingerID:forcedKeyCode:continuousPathState:", 0, a6, v7, v34[3], 1, x, y, v22, a5);
  uint64_t v27 = objc_alloc_init(_ACTKeyboardTouchState);
  [(_ACTKeyboardTouchState *)v27 setLastTouchEvent:v26];
  [(_ACTKeyboardTouchState *)v27 setDragged:0];
  -[_ACTKeyboardTouchState setInitialDragPoint:](v27, "setInitialDragPoint:", x, y);
  int64_t v28 = [(ACTKeyboardController *)self activeTouchState];
  CGPoint v29 = [NSNumber numberWithUnsignedInteger:a6];
  [v28 setObject:v27 forKey:v29];

  int64_t v30 = v34[3];
  _Block_object_dispose(&v33, 8);

  return v30;
}

uint64_t __88__ACTKeyboardController_performTouchDownAtLocation_radius_timestamp_pathIndex_fingerID___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)adjustCursorByOffset:(int64_t)a3
{
  id v5 = [(ACTKeyboardController *)self keyboardState];
  int v6 = [v5 documentState];
  uint64_t v7 = [v6 documentStateAfterCursorAdjustment:a3];
  BOOL v8 = [(ACTKeyboardController *)self keyboardState];
  [v8 setDocumentState:v7];

  id v10 = [(ACTKeyboardController *)self inputManagerWrapper];
  uint64_t v9 = [(ACTKeyboardController *)self clonedKeyboardState];
  [v10 syncToKeyboardState:v9 completionHandler:&__block_literal_global_131];
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v7 = [(ACTKeyboardController *)self inputManagerWrapper];
  BOOL v8 = [(ACTKeyboardController *)self clonedKeyboardState];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __76__ACTKeyboardController_adjustPhraseBoundaryInForwardDirection_granularity___block_invoke;
  v9[3] = &unk_265050448;
  v9[4] = self;
  [v7 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4 keyboardState:v8 completionHandler:v9];
}

uint64_t __76__ACTKeyboardController_adjustPhraseBoundaryInForwardDirection_granularity___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

- (void)setSelectedRange:(_NSRange)a3
{
  if (a3.location != self->_selectedRange.location || a3.length != self->_selectedRange.length)
  {
    self->_selectedRange = a3;
    [(ACTKeyboardController *)self setAutocorrectionList:0];
    [(ACTKeyboardController *)self updateDocumentState];
    BOOL v5 = [(ACTKeyboardController *)self inputManagerWrapper];
    int v6 = [(ACTKeyboardController *)self clonedKeyboardState];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __42__ACTKeyboardController_setSelectedRange___block_invoke;
    v7[3] = &unk_265050448;
    v7[4] = self;
    [v5 syncToKeyboardState:v6 completionHandler:v7];
  }
}

uint64_t __42__ACTKeyboardController_setSelectedRange___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 updateAutoshift];
}

- (void)deleteText:(id)a3 rawText:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t location = [(ACTKeyboardController *)self selectedRangeForText:v15];
  NSUInteger length = v8;
  NSUInteger v10 = [(ACTKeyboardController *)self selectedRangeForText:v6];
  NSUInteger v12 = v11;
  double v13 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", location, length);
  if (v6)
  {
    double v14 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v10, v12);
  }
  else
  {
    double v14 = 0;
  }
  if ([v13 isEqualToString:v15]) {
    goto LABEL_5;
  }
  if ([v14 isEqualToString:v6])
  {
    self->_selectedRange.uint64_t location = v10;
    self->_selectedRange.NSUInteger length = v12;
    NSUInteger length = v12;
    uint64_t location = v10;
  }
  else
  {
    if (v15 && !v14)
    {
LABEL_5:
      self->_selectedRange.uint64_t location = location;
      self->_selectedRange.NSUInteger length = length;
      goto LABEL_11;
    }
    uint64_t location = self->_selectedRange.location;
    NSUInteger length = self->_selectedRange.length;
  }
LABEL_11:
  -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", location, length);
  self->_selectedRange.NSUInteger length = 0;
  [(ACTKeyboardController *)self updateDocumentState];
}

- (_NSRange)selectedRangeForText:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = self->_selectedRange.length + self->_selectedRange.location;
  if (v5 <= [v4 length]) {
    NSUInteger v6 = 0;
  }
  else {
    NSUInteger v6 = v5 - [v4 length];
  }

  NSUInteger v7 = v6;
  NSUInteger v8 = v5 - v6;
  result.NSUInteger length = v8;
  result.uint64_t location = v7;
  return result;
}

- (void)deleteBackwards
{
  if (self->_selectedRange.length)
  {
    [(NSMutableString *)self->_text deleteCharactersInRange:self->_selectedRange.location];
  }
  else
  {
    NSUInteger location = self->_selectedRange.location;
    if (!location) {
      goto LABEL_6;
    }
    NSUInteger v4 = [(NSMutableString *)self->_text _rangeOfBackwardDeletionClusterAtIndex:location - 1];
    -[NSMutableString deleteCharactersInRange:](self->_text, "deleteCharactersInRange:", v4, v5);
    self->_selectedRange.NSUInteger location = v4;
  }
  self->_selectedRange.NSUInteger length = 0;
LABEL_6:
  [(ACTKeyboardController *)self updateDocumentState];
}

- (void)insertTextAfterSelection:(id)a3
{
  if (a3)
  {
    -[NSMutableString replaceCharactersInRange:withString:](self->_text, "replaceCharactersInRange:withString:", self->_selectedRange.location, self->_selectedRange.length, a3);
    [(ACTKeyboardController *)self updateDocumentState];
  }
}

- (void)insertText:(id)a3
{
  if (a3)
  {
    text = self->_text;
    NSUInteger location = self->_selectedRange.location;
    NSUInteger length = self->_selectedRange.length;
    id v7 = a3;
    -[NSMutableString replaceCharactersInRange:withString:](text, "replaceCharactersInRange:withString:", location, length, v7);
    uint64_t v8 = [v7 length];

    self->_selectedRange.location += v8;
    self->_selectedRange.NSUInteger length = 0;
    [(ACTKeyboardController *)self updateDocumentState];
  }
}

- (void)updateDocumentState
{
  id v3 = [(ACTKeyboardController *)self text];
  NSUInteger location = self->_selectedRange.location;
  NSUInteger length = self->_selectedRange.length;
  id v23 = v3;
  if ((unint64_t)[v3 length] <= 0x1000)
  {
    uint64_t v8 = v23;
  }
  else
  {
    uint64_t v6 = objc_msgSend(v23, "rangeOfComposedCharacterSequenceAtIndex:", objc_msgSend(v23, "length") - 2048);
    uint64_t v7 = [v23 substringFromIndex:v6];

    location -= v6;
    uint64_t v8 = (void *)v7;
  }
  id v24 = v8;
  if (location)
  {
    uint64_t v9 = [v8 substringToIndex:location];
    if (length)
    {
LABEL_6:
      NSUInteger v10 = objc_msgSend(v24, "substringWithRange:", location, length);
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = &stru_26F2B7E50;
    if (length) {
      goto LABEL_6;
    }
  }
  NSUInteger v10 = 0;
LABEL_9:
  unint64_t v11 = location + length;
  if (v11 >= [v24 length])
  {
    NSUInteger v12 = 0;
  }
  else
  {
    NSUInteger v12 = [v24 substringFromIndex:v11];
  }
  double v13 = [MEMORY[0x263F7E540] documentStateWithContextBefore:v9 selectedText:v10 contextAfter:v12];
  double v14 = [(ACTKeyboardController *)self markedText];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    double v16 = [(ACTKeyboardController *)self intermediateText];
    uint64_t v17 = [v16 displayString];
    int v18 = [(ACTKeyboardController *)self intermediateText];
    uint64_t v19 = [v18 selectedRange];
    uint64_t v21 = objc_msgSend(v13, "documentStateAfterSettingMarkedText:selectedRange:", v17, v19, v20);

    double v13 = (void *)v21;
  }
  double v22 = [(ACTKeyboardController *)self keyboardState];
  [v22 setDocumentState:v13];
}

- (BOOL)syncToKeyboardStateByWaitingForResults:(BOOL)a3
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x2020000000;
  BOOL v16 = !a3;
  NSUInteger v4 = [(ACTKeyboardController *)self inputManagerWrapper];
  uint64_t v5 = [(ACTKeyboardController *)self clonedKeyboardState];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __64__ACTKeyboardController_syncToKeyboardStateByWaitingForResults___block_invoke;
  v12[3] = &unk_265050470;
  v12[4] = self;
  v12[5] = &v13;
  [v4 syncToKeyboardState:v5 completionHandler:v12];

  uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:0.5];
  if (*((unsigned char *)v14 + 24))
  {
LABEL_5:
    BOOL v10 = 1;
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263EFF478];
    while (1)
    {
      [v6 timeIntervalSinceNow];
      if (v8 <= 0.0) {
        break;
      }
      uint64_t v9 = [MEMORY[0x263EFF9F0] currentRunLoop];
      [v9 acceptInputForMode:v7 beforeDate:v6];

      if (*((unsigned char *)v14 + 24)) {
        goto LABEL_5;
      }
    }
    BOOL v10 = *((unsigned char *)v14 + 24) != 0;
  }

  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t __64__ACTKeyboardController_syncToKeyboardStateByWaitingForResults___block_invoke(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

- (void)syncToKeyboardState
{
}

- (void)syncToEmptyDocument
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7E540]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_26F2B7E50, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  [(ACTKeyboardController *)self syncToDocumentState:v3];
}

- (void)syncToDocumentState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (TIKeyboardState *)objc_alloc_init(MEMORY[0x263F7E680]);
  keyboardState = self->_keyboardState;
  self->_keyboardState = v5;

  uint64_t v7 = [(ACTKeyboardController *)self documentIdentifier];
  [(TIKeyboardState *)self->_keyboardState setDocumentIdentifier:v7];

  id v8 = objc_alloc_init(MEMORY[0x263F7E6D8]);
  [(TIKeyboardState *)self->_keyboardState setTextInputTraits:v8];

  text = self->_text;
  uint64_t v10 = [v4 contextBeforeInput];
  unint64_t v11 = (void *)v10;
  if (v10) {
    NSUInteger v12 = (__CFString *)v10;
  }
  else {
    NSUInteger v12 = &stru_26F2B7E50;
  }
  [(NSMutableString *)text setString:v12];

  NSUInteger v13 = [(NSMutableString *)self->_text length];
  double v14 = [v4 selectedText];
  NSUInteger v15 = [v14 length];
  self->_selectedRange.NSUInteger location = v13;
  self->_selectedRange.NSUInteger length = v15;

  BOOL v16 = self->_text;
  uint64_t v17 = [v4 selectedText];
  int v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  else {
    uint64_t v19 = &stru_26F2B7E50;
  }
  [(NSMutableString *)v16 appendString:v19];

  uint64_t v20 = self->_text;
  uint64_t v21 = [v4 contextAfterInput];
  double v22 = (void *)v21;
  if (v21) {
    id v23 = (__CFString *)v21;
  }
  else {
    id v23 = &stru_26F2B7E50;
  }
  [(NSMutableString *)v20 appendString:v23];

  id v24 = [(ACTKeyboardController *)self autocorrectionList];
  uint64_t v25 = [v24 corrections];
  uint64_t v26 = [v25 autocorrection];
  if (v26)
  {
    uint64_t v27 = (void *)v26;
    int v28 = TISwearWordPolicyV1Enabled();

    if (!v28) {
      goto LABEL_14;
    }
    id v24 = [(ACTKeyboardController *)self inputManagerWrapper];
    uint64_t v25 = [(ACTKeyboardController *)self autocorrectionList];
    CGPoint v29 = [v25 corrections];
    int64_t v30 = [v29 autocorrection];
    v110[0] = MEMORY[0x263EF8330];
    v110[1] = 3221225472;
    v110[2] = __45__ACTKeyboardController_syncToDocumentState___block_invoke;
    v110[3] = &unk_265050448;
    v110[4] = self;
    [v24 textAccepted:v30 completionHandler:v110];
  }
LABEL_14:
  [(ACTKeyboardController *)self setAutocorrectionList:0];
  [(ACTKeyboardController *)self setCandidateResultSet:0];
  uint64_t v31 = [v4 markedText];
  [(ACTKeyboardController *)self setMarkedText:v31];

  if ([v4 documentIsEmpty])
  {
    [(ACTKeyboardController *)self setIntermediateText:0];
  }
  else
  {
    long long v32 = (void *)MEMORY[0x263F7E658];
    uint64_t v33 = [v4 markedText];
    uint64_t v34 = [v4 markedText];
    uint64_t v35 = objc_msgSend(v32, "intermediateTextWithInputString:displayString:selectionLocation:lastInputString:", v33, v34, objc_msgSend(v4, "selectedRangeInMarkedText"), 0);
    [(ACTKeyboardController *)self setIntermediateText:v35];
  }
  [(ACTKeyboardController *)self updateDocumentState];
  int64_t v36 = [(ACTKeyboardController *)self inputModeIdentifier];
  v37 = [(ACTKeyboardController *)self keyboardState];
  [v37 setInputMode:v36];

  v38 = [(ACTKeyboardController *)self keyboardState];
  [v38 setAutocorrectionEnabled:1];

  unint64_t v39 = [(ACTKeyboardController *)self autocorrectionType];
  BOOL v40 = [(ACTKeyboardController *)self keyboardState];
  BOOL v41 = [v40 textInputTraits];
  [v41 setAutocorrectionType:v39];

  BOOL v42 = [(ACTKeyboardController *)self usesPrediction];
  v43 = [(ACTKeyboardController *)self keyboardState];
  [v43 setAutocorrectionListUIDisplayed:v42];

  BOOL v44 = [(ACTKeyboardController *)self usesAutocapitalization];
  v45 = [(ACTKeyboardController *)self keyboardState];
  [v45 setAutocapitalizationEnabled:v44];

  unint64_t v46 = [(ACTKeyboardController *)self autocapitalizationType];
  v47 = [(ACTKeyboardController *)self keyboardState];
  [v47 setAutocapitalizationType:v46];

  BOOL hardwareKeyboardMode = self->_hardwareKeyboardMode;
  v49 = [(ACTKeyboardController *)self keyboardState];
  [v49 setHardwareKeyboardMode:hardwareKeyboardMode];

  v50 = [(ACTKeyboardController *)self keyboardState];
  [v50 setShortcutConversionEnabled:1];

  BOOL v51 = [(ACTKeyboardController *)self wordLearningEnabled];
  v52 = [(ACTKeyboardController *)self keyboardState];
  [v52 setWordLearningEnabled:v51];

  BOOL v53 = [(ACTKeyboardController *)self inlineCompletionEnabled];
  v54 = [(ACTKeyboardController *)self keyboardState];
  [v54 setInlineCompletionEnabled:v53];

  v55 = [(ACTKeyboardController *)self clientIdentifier];
  v56 = [(ACTKeyboardController *)self keyboardState];
  [v56 setClientIdentifier:v55];

  v57 = [(ACTKeyboardController *)self recipientIdentifier];
  unint64_t v58 = [(ACTKeyboardController *)self keyboardState];
  [v58 setRecipientIdentifier:v57];

  v59 = [(ACTKeyboardController *)self inputContextHistory];
  v60 = [(ACTKeyboardController *)self keyboardState];
  [v60 setInputContextHistory:v59];

  unint64_t v61 = [(ACTKeyboardController *)self supplementalLexiconIdentifier];
  v62 = [(ACTKeyboardController *)self keyboardState];
  [v62 setSupplementalLexiconIdentifier:v61];

  BOOL v63 = [(ACTKeyboardController *)self canSuggestSupplementalItemsForCurrentSelection];
  uint64_t v64 = [(ACTKeyboardController *)self keyboardState];
  [(id)v64 setCanSuggestSupplementalItemsForCurrentSelection:v63];

  v65 = [(ACTKeyboardController *)self keyboardState];
  LOBYTE(v64) = objc_opt_respondsToSelector();

  if (v64)
  {
    BOOL v66 = [(ACTKeyboardController *)self longPredictionListEnabled];
    v67 = [(ACTKeyboardController *)self keyboardState];
    [v67 setLongPredictionListEnabled:v66];
  }
  id v68 = objc_alloc_init(MEMORY[0x263F7E670]);
  id v69 = [(ACTKeyboardController *)self keyboardState];
  [v69 setLayoutState:v68];

  v70 = [(ACTKeyboardController *)self inputModeIdentifier];
  v71 = [(ACTKeyboardController *)self keyboardState];
  v72 = [v71 layoutState];
  [v72 setInputMode:v70];

  int v73 = [(ACTKeyboardController *)self keyplane];
  v74 = [v73 cachedKeysByKeyName:@"Candidate-Selection"];
  BOOL v75 = [v74 count] != 0;
  v76 = [(ACTKeyboardController *)self keyboardState];
  uint64_t v77 = [v76 layoutState];
  [v77 setHasCandidateKey:v75];

  v78 = [(ACTKeyboardController *)self keyplane];
  v79 = [v78 cachedKeysByKeyName:@"Latin-Accents"];
  BOOL v80 = [v79 count] != 0;
  id v81 = [(ACTKeyboardController *)self keyboardState];
  v82 = [v81 layoutState];
  [v82 setHasAccentKey:v80];

  int v83 = [(ACTKeyboardController *)self keyplane];
  v84 = [v83 cachedKeysByKeyName:@"Multitap-Complete-Key"];
  BOOL v85 = [v84 count] != 0;
  v86 = [(ACTKeyboardController *)self keyboardState];
  v87 = [v86 layoutState];
  [v87 setCanMultitap:v85];

  v88 = [(ACTKeyboardController *)self keyplane];
  uint64_t v89 = [v88 isAlphabeticPlane];
  v90 = [(ACTKeyboardController *)self keyboardState];
  v91 = [v90 layoutState];
  [v91 setIsAlphabeticPlane:v89];

  v92 = [(ACTKeyboardController *)self keyplane];
  uint64_t v93 = [v92 isKanaPlane];
  v94 = [(ACTKeyboardController *)self keyboardState];
  v95 = [v94 layoutState];
  [v95 setIsKanaPlane:v93];

  v96 = [(ACTKeyboardController *)self keyplane];
  v97 = [v96 name];
  LODWORD(v94) = [v97 containsString:@"Wildcat"];

  v98 = [(ACTKeyboardController *)self keyboardState];
  v99 = [v98 layoutState];
  [v99 setUserInterfaceIdiom:v94];

  BOOL v100 = [(ACTKeyboardController *)self secureTextEntry];
  v101 = [(ACTKeyboardController *)self keyboardState];
  [v101 setSecureTextEntry:v100];

  BOOL v102 = [(ACTKeyboardController *)self isScreenLocked];
  v103 = [(ACTKeyboardController *)self keyboardState];
  [v103 setIsScreenLocked:v102];

  [(ACTKeyboardController *)self setInitialKeyplane];
  v104 = [(ACTKeyboardController *)self layoutUtils];
  v105 = [v104 keyOverrides];
  [v105 removeAllObjects];

  v106 = [(ACTKeyboardController *)self activeTouchState];
  [v106 removeAllObjects];

  v107 = [(ACTKeyboardController *)self inputManagerWrapper];
  v108 = [(ACTKeyboardController *)self clonedKeyboardState];
  v109[0] = MEMORY[0x263EF8330];
  v109[1] = 3221225472;
  v109[2] = __45__ACTKeyboardController_syncToDocumentState___block_invoke_2;
  v109[3] = &unk_265050448;
  v109[4] = self;
  [v107 syncToKeyboardState:v108 completionHandler:v109];

  [(ACTKeyboardController *)self setLastInputWasSelection:0];
  [(ACTKeyboardController *)self setLastInputWasContinuousPath:0];
  [(ACTKeyboardController *)self setInputIsPunctuationFollowingContinuousPath:0];
  [(ACTKeyboardController *)self updateAutoshift];
  [(ACTKeyboardController *)self generateAutocorrectionsOrCandidates];
}

uint64_t __45__ACTKeyboardController_syncToDocumentState___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

uint64_t __45__ACTKeyboardController_syncToDocumentState___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setKeyboardConfiguration:a2];
}

- (void)commitText
{
  id v3 = [(ACTKeyboardController *)self inputManagerState];
  int v4 = [v3 usesCandidateSelection];

  if (!v4)
  {
    if (![(ACTKeyboardController *)self usesAutocorrection]) {
      return;
    }
    uint64_t v7 = [(ACTKeyboardController *)self autocorrectionList];
    id v8 = [v7 candidates];
    id v33 = [v8 firstObject];

    uint64_t v9 = [v33 rawInput];
    if (!v9) {
      goto LABEL_8;
    }
    uint64_t v10 = (void *)v9;
    unint64_t v11 = [v33 rawInput];
    NSUInteger v12 = [v33 input];
    if ([v11 isEqualToString:v12])
    {

LABEL_8:
      [(ACTKeyboardController *)self acceptAutocorrection];
      goto LABEL_16;
    }
    NSUInteger v13 = [v33 input];
    double v14 = [v33 candidate];
    if ([v13 isEqualToString:v14])
    {
    }
    else
    {
      NSUInteger v15 = [v33 rawInput];
      BOOL v16 = [v33 candidate];
      char v17 = [v15 isEqualToString:v16];

      if ((v17 & 1) == 0) {
        goto LABEL_8;
      }
    }
    int v18 = [v33 input];
    uint64_t v19 = [(ACTKeyboardController *)self selectedRangeForText:v18];
    uint64_t v21 = v20;

    double v22 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v19, v21);
    id v23 = [v33 input];
    LOBYTE(v21) = [v22 isEqualToString:v23];

    if ((v21 & 1) == 0)
    {
      id v24 = [v33 rawInput];
      uint64_t v25 = [(ACTKeyboardController *)self selectedRangeForText:v24];
      uint64_t v27 = v26;

      uint64_t v28 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:", v25, v27);

      double v22 = (void *)v28;
    }
    id v29 = objc_alloc(MEMORY[0x263F7E640]);
    int64_t v30 = [v33 input];
    uint64_t v31 = [v33 rawInput];
    long long v32 = (void *)[v29 initWithCandidate:v22 forInput:v30 rawInput:v31];

    [(ACTKeyboardController *)self textAccepted:v32 predictiveCandidate:0];
    [(ACTKeyboardController *)self setAutocorrectionList:0];

    goto LABEL_16;
  }
  uint64_t v5 = [(ACTKeyboardController *)self candidateResultSet];
  id v33 = [v5 firstCandidate];

  uint64_t v6 = v33;
  if (v33)
  {
    [(ACTKeyboardController *)self acceptCandidate:v33];
LABEL_16:
    uint64_t v6 = v33;
  }
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ACTKeyboardController *)self keyboardState];
  [v4 setShouldSkipCandidateSelection:v3];
}

- (BOOL)shouldSkipCandidateSelection
{
  uint64_t v2 = [(ACTKeyboardController *)self keyboardState];
  char v3 = [v2 shouldSkipCandidateSelection];

  return v3;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL hardwareKeyboardMode = a3;
  id v4 = [(ACTKeyboardController *)self keyboardState];
  [v4 setHardwareKeyboardMode:v3];
}

- (BOOL)hardwareKeyboardMode
{
  BOOL v3 = [(ACTKeyboardController *)self keyboardState];

  if (!v3) {
    return self->_hardwareKeyboardMode;
  }
  id v4 = [(ACTKeyboardController *)self keyboardState];
  char v5 = [v4 hardwareKeyboardMode];

  return v5;
}

- (TIKeyboardInputManagerWrapper)inputManagerWrapper
{
  inputManagerWrapper = self->_inputManagerWrapper;
  if (!inputManagerWrapper)
  {
    id v4 = [(ACTKeyboardController *)self createKeyboardInputManagerWrapper];
    if (objc_opt_respondsToSelector())
    {
      char v5 = [[ACTClientProxy alloc] initWithClient:self];
      [v4 setClientProxy:v5];
    }
    [(ACTKeyboardController *)self setInputManagerWrapper:v4];

    inputManagerWrapper = self->_inputManagerWrapper;
  }
  return inputManagerWrapper;
}

- (id)createKeyboardInputManagerWrapper
{
  id v3 = objc_alloc_init(MEMORY[0x263F7EAC8]);
  id v4 = [(ACTKeyboardController *)self keyboardInputManagerFactory];

  if (v4)
  {
    char v5 = [(ACTKeyboardController *)self keyboardInputManagerFactory];
    uint64_t v6 = [v5 newKeyboardInputManager];
  }
  else
  {
    id v7 = objc_alloc(MEMORY[0x263F7EAA8]);
    char v5 = [(ACTKeyboardController *)self inputMode];
    uint64_t v6 = [v7 initWithInputMode:v5 keyboardState:0];
  }
  id v8 = (void *)v6;

  [v3 setInputManager:v8];
  [v3 changingContextWithTrigger:*MEMORY[0x263F7E718]];

  return v3;
}

- (TIKeyboardInputManager)existingInputManager
{
  uint64_t v2 = [(TIKeyboardInputManagerWrapper *)self->_inputManagerWrapper inputManager];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (TIKeyboardInputManager *)v3;
}

- (TIKeyboardInputManager)inputManager
{
  uint64_t v2 = [(ACTKeyboardController *)self inputManagerWrapper];
  id v3 = [v2 inputManager];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (TIKeyboardInputManager *)v4;
}

- (void)tearDown
{
  id v2 = [(ACTKeyboardController *)self inputManager];
  [v2 tearDown];
}

- (void)reset
{
  [MEMORY[0x263F7EAE0] clearDynamicLearningCaches];
  if (self->_inputManagerWrapper)
  {
    id v3 = [(ACTKeyboardController *)self inputManager];
    [v3 clearSoftLearning];

    id v4 = [(ACTKeyboardController *)self inputManager];
    [v4 suspend];

    inputManagerWrapper = self->_inputManagerWrapper;
    self->_inputManagerWrapper = 0;
  }
  uint64_t v6 = [(ACTKeyboardController *)self inputManager];
  [v6 resume];

  id v7 = [MEMORY[0x263F08C38] UUID];
  [(ACTKeyboardController *)self setDocumentIdentifier:v7];

  [(ACTKeyboardController *)self syncToEmptyDocument];
}

- (id)clonedKeyboardState
{
  id v2 = [(ACTKeyboardController *)self keyboardState];
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)registerLayoutWithFavonius
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F7E668]);
  id v4 = [(ACTKeyboardController *)self keys];
  uint64_t v26 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  if (self->_leftKeys && self->_rightKeys) {
    [v26 setUsesTwoHands:1];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [(ACTKeyboardController *)self keys];
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
    double v8 = *MEMORY[0x263F001A0];
    double v9 = *(double *)(MEMORY[0x263F001A0] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A0] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A0] + 24);
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(obj);
        }
        NSUInteger v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ([v13 visible])
        {
          double v14 = [(ACTKeyboardController *)self layoutUtils];
          uint64_t v15 = objc_msgSend(v14, "representedStringForKey:shifted:", v13, -[ACTKeyboardController isShifted](self, "isShifted"));

          if (v15) {
            BOOL v16 = (__CFString *)v15;
          }
          else {
            BOOL v16 = &stru_26F2B7E50;
          }
          char v17 = (void *)MEMORY[0x263EFF960];
          int v18 = [(ACTKeyboardController *)self inputModeIdentifier];
          uint64_t v19 = TIInputModeGetLanguageWithRegion();
          uint64_t v20 = [v17 localeWithLocaleIdentifier:v19];

          uint64_t v21 = [(__CFString *)v16 lowercaseStringWithLocale:v20];
          double v22 = (void *)v21;
          if (v21) {
            uint64_t v23 = v21;
          }
          else {
            uint64_t v23 = (uint64_t)v16;
          }
          [v13 paddedFrame];
          objc_msgSend(v26, "addKeyWithExactString:frame:", v23);
        }
        else
        {
          objc_msgSend(v26, "addKeyWithExactString:frame:", &stru_26F2B7E50, v8, v9, v10, v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v6);
  }

  id v24 = [(ACTKeyboardController *)self keyboardState];
  [v24 setKeyLayout:v26];
}

- (void)setIntermediateText:(id)a3
{
  objc_storeStrong((id *)&self->_intermediateText, a3);
  id v5 = a3;
  uint64_t v6 = [v5 displayString];
  [(ACTKeyboardController *)self setMarkedText:v6];

  uint64_t v7 = [v5 inputString];
  double v8 = [(ACTKeyboardController *)self keyboardState];
  [v8 setInputForMarkedText:v7];

  id v10 = [v5 searchString];

  double v9 = [(ACTKeyboardController *)self keyboardState];
  [v9 setSearchStringForMarkedText:v10];
}

- (void)setKeyboardConfiguration:(id)a3
{
  id v9 = a3;
  id v4 = [v9 inputManagerState];
  [(ACTKeyboardController *)self setInputManagerState:v4];

  id v5 = [v9 intermediateText];

  if (v5)
  {
    uint64_t v6 = [v9 intermediateText];
    [(ACTKeyboardController *)self setIntermediateText:v6];
  }
  layoutUtils = self->_layoutUtils;
  double v8 = [v9 accentKeyString];
  [(ACTKeyboardLayoutUtils *)layoutUtils setLayoutKeyOverride:v8 forKey:*MEMORY[0x263F1D448] uiKeyboardStringNothing:*MEMORY[0x263F1D458]];

  [(ACTKeyboardController *)self registerLayoutWithFavonius];
  [(ACTKeyboardController *)self updateDocumentState];
}

- (void)setInitialKeyplane
{
  id v3 = [(ACTKeyboardController *)self keyboard];
  id v9 = [v3 subtrees];

  id v4 = [v9 objectAtIndex:0];
  if ([v4 isShiftKeyplane])
  {
    id v5 = [(ACTKeyboardController *)self keyboard];
    uint64_t v6 = [v4 shiftAlternateKeyplaneName];
    uint64_t v7 = [v5 subtreeWithName:v6];

    id v4 = (void *)v7;
  }
  [(ACTKeyboardController *)self setKeyplane:v4];
  double v8 = [(ACTKeyboardController *)self keyboardState];
  [v8 setShiftState:0];
}

- (void)updateAutoshift
{
  if ([(ACTKeyboardController *)self isShifted])
  {
    id v3 = [(ACTKeyboardController *)self keyplane];
    char v4 = [v3 BOOLForProperty:@"shift-is-plane-chooser"];

    if ((v4 & 1) == 0) {
      [(ACTKeyboardController *)self shiftKeyplane];
    }
  }
  if (![(ACTKeyboardController *)self isShifted])
  {
    id v13 = [(ACTKeyboardController *)self keyplane];
    if (![v13 usesAutoShift]) {
      goto LABEL_16;
    }
    BOOL v5 = [(ACTKeyboardController *)self usesAutocapitalization];

    if (!v5) {
      return;
    }
    id v13 = [(ACTKeyboardController *)self text];
    unint64_t v6 = [(ACTKeyboardController *)self autocapitalizationType];
    if (v6 == 1)
    {
      if ([v13 length])
      {
        id v9 = [(ACTKeyboardController *)self inputManagerState];
        id v10 = objc_msgSend(NSString, "_stringWithUnichar:", objc_msgSend(v13, "_lastLongCharacter"));
        int v11 = [v9 stringEndsWord:v10];

        if (!v11)
        {
LABEL_16:

          return;
        }
      }
    }
    else if (v6 != 3)
    {
      if (v6 != 2) {
        goto LABEL_16;
      }
      uint64_t v7 = [(ACTKeyboardController *)self inputManagerState];
      char v8 = [v7 nextInputWouldStartSentence];

      if ((v8 & 1) == 0) {
        goto LABEL_16;
      }
    }
    [(ACTKeyboardController *)self shiftKeyplane];
    NSUInteger v12 = [(ACTKeyboardController *)self keyboardState];
    [v12 setShiftState:2];

    goto LABEL_16;
  }
}

- (void)alternateKeyplane
{
  id v3 = [(ACTKeyboardController *)self keyboard];
  char v4 = [(ACTKeyboardController *)self keyplane];
  BOOL v5 = [v4 alternateKeyplaneName];
  unint64_t v6 = [v3 subtreeWithName:v5];
  [(ACTKeyboardController *)self setKeyplane:v6];

  uint64_t v7 = [(ACTKeyboardController *)self keyplane];
  uint64_t v8 = [v7 isShiftKeyplane];

  id v9 = [(ACTKeyboardController *)self keyboardState];
  [v9 setShiftState:v8];

  [(ACTKeyboardController *)self updateAutoshift];
}

- (void)shiftKeyplane
{
  id v3 = [(ACTKeyboardController *)self keyboard];
  char v4 = [(ACTKeyboardController *)self keyplane];
  BOOL v5 = [v4 shiftAlternateKeyplaneName];
  unint64_t v6 = [v3 subtreeWithName:v5];
  [(ACTKeyboardController *)self setKeyplane:v6];

  uint64_t v7 = [(ACTKeyboardController *)self keyplane];
  uint64_t v8 = [v7 isShiftKeyplane];

  id v9 = [(ACTKeyboardController *)self keyboardState];
  [v9 setShiftState:v8];
}

- (BOOL)isAutoshifted
{
  id v2 = [(ACTKeyboardController *)self keyboardState];
  BOOL v3 = [v2 shiftState] == 2;

  return v3;
}

- (BOOL)isShifted
{
  id v2 = [(ACTKeyboardController *)self keyplane];
  char v3 = [v2 isShiftKeyplane];

  return v3;
}

- (void)adjustKeyplaneEmulatingKBStar:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v45 = a3;
  char v4 = [v45 keys];
  BOOL v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v55 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        int v11 = self;
        NSUInteger v12 = [(ACTKeyboardController *)self layoutUtils];
        id v13 = objc_msgSend(v12, "representedStringForKey:shifted:", v10, objc_msgSend(v45, "isShiftKeyplane"));
        double v14 = [v13 lowercaseString];

        if (v14)
        {
          id v15 = [v5 objectForKey:v14];
          if (!v15)
          {
            id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
            [v5 setObject:v15 forKey:v14];
          }
          [v15 addObject:v10];
        }
        [v10 setVisible:1];

        self = v11;
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v7);
  }

  if (self->_ttkLayout)
  {
    BOOL v16 = objc_opt_new();
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    BOOL v42 = self;
    id v43 = [(TTKSimpleKeyboardPlane *)self->_ttkLayout keys];
    uint64_t v17 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v51 != v19) {
            objc_enumerationMutation(v43);
          }
          uint64_t v21 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          double v22 = [v21 string];
          uint64_t v23 = @" ";
          if (([v22 isEqualToString:@"space"] & 1) == 0)
          {
            uint64_t v23 = [v21 string];
          }

          id v24 = [v5 valueForKey:v23];

          if (v24)
          {
            uint64_t v25 = [v5 objectForKeyedSubscript:v23];
            uint64_t v26 = [v25 firstObject];

            long long v27 = [v26 name];
            [v16 setObject:v21 forKey:v27];
          }
        }
        uint64_t v18 = [v43 countByEnumeratingWithState:&v50 objects:v59 count:16];
      }
      while (v18);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v28 = [v5 allValues];
    uint64_t v29 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v47 != v31) {
            objc_enumerationMutation(v28);
          }
          id v33 = [*(id *)(*((void *)&v46 + 1) + 8 * k) firstObject];
          uint64_t v34 = [v33 name];
          uint64_t v35 = [v16 objectForKey:v34];

          if (v35)
          {
            int64_t v36 = [v33 name];
            v37 = [v16 objectForKey:v36];

            [v37 frame];
            objc_msgSend(v33, "setFrame:");
            [v37 frame];
            objc_msgSend(v33, "setPaddedFrame:");
          }
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v46 objects:v58 count:16];
      }
      while (v30);
    }

    self = v42;
  }
  v38 = [v5 objectForKey:@"dictation"];
  unint64_t v39 = [v5 objectForKey:@" "];
  [(ACTKeyboardController *)self mergeFrameFromKey:v38 intoKey:v39];

  BOOL v40 = [v5 objectForKey:@"international"];
  BOOL v41 = [v5 objectForKey:@"more"];
  [(ACTKeyboardController *)self mergeFrameFromKey:v40 intoKey:v41];
}

- (void)mergeFrameFromKey:(id)a3 intoKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5 && v6 && [v5 count] == 1)
  {
    uint64_t v8 = [v5 lastObject];
    uint64_t v49 = 0;
    long long v50 = &v49;
    uint64_t v51 = 0x3032000000;
    long long v52 = __Block_byref_object_copy__6193;
    long long v53 = __Block_byref_object_dispose__6194;
    id v54 = [v7 firstObject];
    uint64_t v45 = 0;
    long long v46 = (double *)&v45;
    uint64_t v47 = 0x2020000000;
    uint64_t v48 = 0x7FEFFFFFFFFFFFFFLL;
    if ([v7 count])
    {
      [v8 frame];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __51__ACTKeyboardController_mergeFrameFromKey_intoKey___block_invoke;
      v37[3] = &unk_265050420;
      uint64_t v41 = v9;
      uint64_t v42 = v10;
      uint64_t v43 = v11;
      uint64_t v44 = v12;
      id v38 = v8;
      unint64_t v39 = &v45;
      BOOL v40 = &v49;
      [v7 enumerateObjectsUsingBlock:v37];
    }
    if (v46[3] < 2.0)
    {
      [v8 frame];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(id)v50[5] frame];
      v59.origin.double x = v21;
      v59.origin.double y = v22;
      v59.size.width = v23;
      v59.size.height = v24;
      v55.origin.double x = v14;
      v55.origin.double y = v16;
      v55.size.width = v18;
      v55.size.height = v20;
      CGRect v56 = CGRectUnion(v55, v59);
      objc_msgSend((id)v50[5], "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
      [v8 paddedFrame];
      CGFloat v26 = v25;
      CGFloat v28 = v27;
      CGFloat v30 = v29;
      CGFloat v32 = v31;
      [(id)v50[5] paddedFrame];
      v60.origin.double x = v33;
      v60.origin.double y = v34;
      v60.size.width = v35;
      v60.size.height = v36;
      v57.origin.double x = v26;
      v57.origin.double y = v28;
      v57.size.width = v30;
      v57.size.height = v32;
      CGRect v58 = CGRectUnion(v57, v60);
      objc_msgSend((id)v50[5], "setPaddedFrame:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
    }
    [v8 setVisible:0];
    _Block_object_dispose(&v45, 8);
    _Block_object_dispose(&v49, 8);
  }
}

void __51__ACTKeyboardController_mergeFrameFromKey_intoKey___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  [v16 frame];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double MinX = CGRectGetMinX(v18);
  double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
  [v16 frame];
  double v11 = v10;
  [*(id *)(a1 + 32) frame];
  if (v11 >= v12)
  {
    double v14 = MinX - MaxX;
  }
  else
  {
    double v13 = CGRectGetMinX(*(CGRect *)(a1 + 56));
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v14 = v13 - CGRectGetMaxX(v19);
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v14 < *(double *)(v15 + 24))
  {
    *(double *)(v15 + 24) = v14;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

- (void)divideKeyplane:(id)a3 intoLeft:(id)a4 right:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = v9;
  if (v8 && v9)
  {
    [v8 removeAllObjects];
    [v10 removeAllObjects];
    double v11 = [v7 subtrees];
    double v12 = [v11 firstObject];

    v48[0] = 0;
    v48[1] = v48;
    v48[2] = 0x4010000000;
    v48[3] = &unk_23F0564DE;
    long long v13 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
    long long v49 = *MEMORY[0x263F001A0];
    long long v50 = v13;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x4010000000;
    v45[3] = &unk_23F0564DE;
    long long v46 = v49;
    long long v47 = v13;
    double v14 = [v12 keys];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke;
    v44[3] = &unk_2650503D0;
    v44[4] = v48;
    v44[5] = v45;
    [v14 enumerateObjectsUsingBlock:v44];

    UIRectInset();
    uint64_t v31 = v15;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    UIRectInset();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    CGFloat v30 = [v7 keys];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke_2;
    v32[3] = &unk_2650503F8;
    uint64_t v36 = v31;
    uint64_t v37 = v17;
    uint64_t v38 = v19;
    uint64_t v39 = v21;
    CGFloat v35 = v48;
    id v33 = v8;
    uint64_t v40 = v23;
    uint64_t v41 = v25;
    uint64_t v42 = v27;
    uint64_t v43 = v29;
    id v34 = v10;
    [v30 enumerateObjectsUsingBlock:v32];

    _Block_object_dispose(v45, 8);
    _Block_object_dispose(v48, 8);
  }
}

void __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke(uint64_t a1, void *a2)
{
  [a2 frame];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  uint64_t v11 = a1 + 32;
  BOOL IsNull = CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  long long v13 = *(CGRect **)(*(void *)(a1 + 32) + 8);
  if (IsNull)
  {
    v13[1].origin.CGFloat x = x;
    v13[1].origin.CGFloat y = y;
    uint64_t v11 = a1 + 40;
    v13[1].size.CGFloat width = width;
    v13[1].size.CGFloat height = height;
  }
  else
  {
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    CGRect v15 = CGRectUnion(v13[1], v16);
    CGFloat x = v15.origin.x;
    CGFloat y = v15.origin.y;
    CGFloat width = v15.size.width;
    CGFloat height = v15.size.height;
  }
  double v14 = *(CGFloat **)(*(void *)v11 + 8);
  v14[4] = x;
  v14[5] = y;
  v14[6] = width;
  v14[7] = height;
}

void __55__ACTKeyboardController_divideKeyplane_intoLeft_right___block_invoke_2(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  v23.origin.CGFloat x = v3;
  v23.origin.CGFloat y = v5;
  v23.size.CGFloat width = v7;
  v23.size.CGFloat height = v9;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 56), v23)) {
    goto LABEL_4;
  }
  v24.origin.CGFloat x = v4;
  v24.origin.CGFloat y = v6;
  v24.size.CGFloat width = v8;
  v24.size.CGFloat height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v24))
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 56));
    v19.origin.CGFloat x = v4;
    v19.origin.CGFloat y = v6;
    v19.size.CGFloat width = v8;
    v19.size.CGFloat height = v10;
    double v12 = MaxX - CGRectGetMinX(v19);
    v20.origin.CGFloat x = v4;
    v20.origin.CGFloat y = v6;
    v20.size.CGFloat width = v8;
    v20.size.CGFloat height = v10;
    double v13 = CGRectGetMaxX(v20);
    if (v12 > v13 - CGRectGetMaxX(*(CGRect *)(a1 + 56))) {
LABEL_4:
    }
      [*(id *)(a1 + 32) addObject:v17];
  }
  v25.origin.CGFloat x = v4;
  v25.origin.CGFloat y = v6;
  v25.size.CGFloat width = v8;
  v25.size.CGFloat height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 88), v25)) {
    goto LABEL_8;
  }
  v26.origin.CGFloat x = v4;
  v26.origin.CGFloat y = v6;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), v26))
  {
    v21.origin.CGFloat x = v4;
    v21.origin.CGFloat y = v6;
    v21.size.CGFloat width = v8;
    v21.size.CGFloat height = v10;
    double v14 = CGRectGetMaxX(v21);
    double v15 = v14 - CGRectGetMinX(*(CGRect *)(a1 + 88));
    double MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
    v22.origin.CGFloat x = v4;
    v22.origin.CGFloat y = v6;
    v22.size.CGFloat width = v8;
    v22.size.CGFloat height = v10;
    if (v15 > MinX - CGRectGetMinX(v22)) {
LABEL_8:
    }
      [*(id *)(a1 + 40) addObject:v17];
  }
}

- (void)setKeyplane:(id)a3
{
  CGRect v22 = (UIKBTree *)a3;
  if (self->_keyplane != v22)
  {
    objc_storeStrong((id *)&self->_keyplane, a3);
    [(UIKBTree *)self->_keyplane zipGeometrySet];
    [(ACTKeyboardController *)self adjustKeyplaneEmulatingKBStar:self->_keyplane];
    CGFloat v5 = [(ACTKeyboardController *)self keyplane];
    CGFloat v6 = [v5 keys];
    [(ACTKeyboardController *)self setKeys:v6];

    CGFloat v7 = [(ACTKeyboardController *)self keyplane];
    CGFloat v8 = [v7 cachedKeysByKeyName:@"Latin-Accents"];
    CGFloat v9 = [(ACTKeyboardController *)self keyboardState];
    CGFloat v10 = [v9 layoutState];
    [v10 setHasAccentKey:v8 != 0];

    uint64_t v11 = [(ACTKeyboardController *)self keyplane];
    uint64_t v12 = [v11 isAlphabeticPlane];
    double v13 = [(ACTKeyboardController *)self keyboardState];
    double v14 = [v13 layoutState];
    [v14 setIsAlphabeticPlane:v12];

    leftKeys = self->_leftKeys;
    self->_leftKeys = 0;

    rightKeys = self->_rightKeys;
    self->_rightKeys = 0;

    id v17 = [(UIKBTree *)self->_keyplane name];
    LODWORD(v12) = [v17 containsString:@"Wildcat"];

    if (v12)
    {
      uint64_t v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      CGRect v19 = self->_leftKeys;
      self->_leftKeys = v18;

      CGRect v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
      CGRect v21 = self->_rightKeys;
      self->_rightKeys = v20;

      [(ACTKeyboardController *)self divideKeyplane:self->_keyplane intoLeft:self->_leftKeys right:self->_rightKeys];
    }
  }
  [(ACTKeyboardController *)self registerLayoutWithFavonius];
}

- (void)setKeyboard:(id)a3
{
  CGFloat v5 = (UIKBTree *)a3;
  p_keyboard = &self->_keyboard;
  if (self->_keyboard != v5)
  {
    CGFloat v9 = v5;
    objc_storeStrong((id *)p_keyboard, a3);
    CGFloat v7 = [(UIKBTree *)self->_keyboard subtrees];
    CGFloat v8 = [v7 objectAtIndex:0];
    [(ACTKeyboardController *)self setKeyplane:v8];

    [(ACTKeyboardController *)self setInitialKeyplane];
    p_keyboard = (UIKBTree **)[(ACTKeyboardController *)self updateAutoshift];
    CGFloat v5 = v9;
  }
  MEMORY[0x270F9A758](p_keyboard, v5);
}

- (TIAutocorrectionList)autocorrectionList
{
  id v2 = self;
  objc_sync_enter(v2);
  CGFloat v3 = v2->_autocorrectionList;
  objc_sync_exit(v2);

  return v3;
}

- (void)setAutocorrectionList:(id)a3
{
  CGFloat v4 = (TIAutocorrectionList *)a3;
  id obj = self;
  objc_sync_enter(obj);
  autocorrectionList = obj->_autocorrectionList;
  obj->_autocorrectionList = v4;

  objc_sync_exit(obj);
}

- (void)dealloc
{
  CGFloat v3 = [(ACTKeyboardController *)self inputManager];
  [v3 suspend];

  v4.receiver = self;
  v4.super_class = (Class)ACTKeyboardController;
  [(ACTKeyboardController *)&v4 dealloc];
}

- (ACTKeyboardController)initWithInputMode:(id)a3
{
  id v5 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ACTKeyboardController;
  CGFloat v6 = [(ACTKeyboardController *)&v31 init];
  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    CGFloat v8 = (void *)*((void *)v6 + 31);
    *((void *)v6 + 31) = v7;

    objc_storeStrong((id *)v6 + 12, a3);
    CGFloat v9 = [v5 normalizedIdentifier];
    uint64_t v10 = [v9 copy];
    uint64_t v11 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = v10;

    v6[49] = 1;
    v6[60] = 1;
    id v12 = objc_alloc_init(MEMORY[0x263F089D8]);
    double v13 = (void *)*((void *)v6 + 4);
    *((void *)v6 + 4) = v12;

    double v14 = [ACTKeyboardLayoutUtils alloc];
    double v15 = [v5 locale];
    uint64_t v16 = [(ACTKeyboardLayoutUtils *)v14 initWithLocale:v15];
    id v17 = (void *)*((void *)v6 + 9);
    *((void *)v6 + 9) = v16;

    *(_OWORD *)(v6 + 168) = xmmword_23F04A510;
    v6[56] = 1;
    uint64_t v18 = NSClassFromString(&cfstr_Tismartpunctua.isa);
    if (v18)
    {
      id v19 = objc_alloc_init(v18);
      CGRect v20 = (void *)*((void *)v6 + 23);
      *((void *)v6 + 23) = v19;

      Class v21 = NSClassFromString(&cfstr_Tismartpunctua_0.isa);
      CGRect v22 = [v5 locale];
      CGRect v23 = [(objc_class *)v21 smartPunctuationOptionsForLocale:v22];
      [*((id *)v6 + 23) setSmartPunctuationOptions:v23];

      [*((id *)v6 + 23) setSmartQuotesEnabled:0];
      [*((id *)v6 + 23) setSmartDashesEnabled:0];
    }
    id v24 = objc_alloc_init(MEMORY[0x263F08740]);
    CGRect v25 = (void *)*((void *)v6 + 32);
    *((void *)v6 + 32) = v24;

    id v26 = objc_alloc_init(MEMORY[0x263F08958]);
    uint64_t v27 = (void *)*((void *)v6 + 34);
    *((void *)v6 + 34) = v26;

    uint64_t v28 = [MEMORY[0x263F08C38] UUID];
    uint64_t v29 = (void *)*((void *)v6 + 36);
    *((void *)v6 + 36) = v28;

    [MEMORY[0x263F7EAA8] swizzleTestingParameters];
  }

  return (ACTKeyboardController *)v6;
}

- (ACTKeyboardController)init
{
  return [(ACTKeyboardController *)self initWithInputMode:0];
}

@end