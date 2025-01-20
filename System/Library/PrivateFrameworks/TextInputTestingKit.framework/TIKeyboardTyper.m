@interface TIKeyboardTyper
- (ACTKeyboardController)keyboardController;
- (ACTUserActionStreaming)userActionStream;
- (BOOL)asyncPredictions;
- (BOOL)attemptToTapAutocorrectionWithString:(id)a3;
- (BOOL)attemptToTapPredictionBarCandidateWithString:(id)a3;
- (BOOL)attemptToTapPredictionWithString:(id)a3;
- (BOOL)changeToNearestAlphabeticPlane;
- (BOOL)changeToNearestKeyplaneWithString:(id)a3;
- (BOOL)hardwareKeyboardMode;
- (BOOL)hasPrediction:(id)a3;
- (BOOL)inPartialCandidateSelection;
- (BOOL)inlineCompletionEnabled;
- (BOOL)insertsSpaceAfterPredictiveInput;
- (BOOL)isAutoshifted;
- (BOOL)isShifted;
- (BOOL)lastInputWasSelection;
- (BOOL)logDocumentContext;
- (BOOL)longPredictionListEnabled;
- (BOOL)nextKeyIsMultitap;
- (BOOL)postTokenisString:(id)a3 i:(unint64_t)a4;
- (BOOL)printTranslitSummaries;
- (BOOL)printTypingTranscript;
- (BOOL)priorTokenisString:(id)a3 i:(unint64_t)a4;
- (BOOL)shouldDecomposeInputString;
- (BOOL)shouldSkipCandidateSelection;
- (BOOL)showsCandidateBar;
- (BOOL)usePartialCandidates;
- (BOOL)usesAutocapitalization;
- (BOOL)usesAutocorrection;
- (BOOL)usesPrediction;
- (BOOL)usesTransliteration;
- (BOOL)warnIfSelectingPopupVariant;
- (BOOL)wordLearningEnabled;
- (CGPoint)pointForAttemptedTapOnKey:(id)a3 withError:(id)a4;
- (NSArray)inlineCompletionCandidates;
- (NSArray)predictionBarCandidates;
- (NSArray)predictions;
- (NSDictionary)shiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
- (NSLocale)locale;
- (NSString)badSentenceLogFilePath;
- (NSString)clientIdentifier;
- (NSString)inputModeIdentifier;
- (NSString)markedText;
- (NSString)recipientIdentifier;
- (NSString)text;
- (TIAutocorrectionList)autocorrectionList;
- (TIErrorGenerator)errorGenerator;
- (TIInputContextHistory)inputContextHistory;
- (TIInputMode)inputMode;
- (TIKeyboardCandidate)autocorrection;
- (TIKeyboardCandidateResultSet)candidateResultSet;
- (TIKeyboardInputManager)inputManager;
- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory;
- (TIKeyboardTyper)init;
- (TIKeyboardTyper)initWithInputMode:(id)a3;
- (TIKeyboardTyperUserModel)userModel;
- (TITestUserPersona)userPersona;
- (UIKBTree)keyboard;
- (UIKBTree)keyplane;
- (_NSRange)selectedRange;
- (double)interTouchTimestampInterval;
- (double)lastTimestamp;
- (id)_keyplaneCloserToKeyWithString:(id)a3;
- (id)_logStringForTouchedKey:(id)a3;
- (id)_performGestureKeyInput:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 fingerID:(int)a5 secondaryString:(BOOL)a6;
- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 intendedKey:(id)a5 touchedKey:(id)a6 secondaryString:(BOOL)a7 touchError:(id)a8 typingLog:(id)a9;
- (id)_performTouchEvent:(id)a3 typingLog:(id)a4;
- (id)_performVariantKey:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (id)candidateBarCandidates;
- (id)candidatesForString:(id)a3;
- (id)displayStringOverrideForKey:(id)a3;
- (id)externalStringToInternal:(id)a3;
- (id)inputSegmentsForContinuousPathString:(id)a3;
- (id)inputSegmentsForString:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4;
- (id)keyToAccessKeyplaneCloserToKeyString:(id)a3;
- (id)keyWithString:(id)a3 inKeyplane:(id)a4;
- (id)keyWithString:(id)a3 inKeyplane:(id)a4 includeSecondaryStrings:(BOOL)a5;
- (id)mapShiftedKeyToUnShiftedKeyExcludeCapitalization:(id)a3;
- (id)mergeHyphenatedWord:(id)a3 string:(id)a4;
- (id)performTapAtKey:(id)a3 biasedTowards:(id)a4 biasWeight:(float)a5;
- (id)performTapAtLocation:(CGPoint)a3;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8;
- (id)predictationBarDebugString;
- (id)shiftKeyToAccessKeyplaneCloserToKeyString:(id)a3;
- (id)splitDigraphsInString:(id)a3;
- (id)tokensForString:(id)a3;
- (id)transliteratedTokensForString:(id)a3;
- (int)maxPredictionsReported;
- (int64_t)maxPredictions;
- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (unint64_t)autocapitalizationType;
- (unint64_t)autocorrectionType;
- (unint64_t)cursorLocationInMarkedText;
- (unint64_t)learnWordContextIndex;
- (void)_bumpTouchPathID;
- (void)_finishKeystrokeAndRecordPredictionsInTypingLog:(id)a3 touchedKey:(id)a4 insertedKey:(id)a5 typingLog:(id)a6;
- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6;
- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6 intendedTransliteration:(id)a7;
- (void)_performAcceptPredictiveCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (void)_performRejectCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5;
- (void)_skipTapTimestamp:(double)a3 intendedKey:(id)a4 typingLog:(id)a5;
- (void)acceptAutocorrection;
- (void)acceptCandidate:(id)a3;
- (void)acceptCandidateFromPredictionBar:(id)a3;
- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4;
- (void)acceptCandidateViaKeyboard:(id)a3;
- (void)acceptPredictiveCandidate:(id)a3;
- (void)adjustCursorByOffset:(int64_t)a3;
- (void)adjustPhraseBoundaryByOffset:(int64_t)a3 granularity:(int)a4;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (void)attemptGestureKeyInput:(id)a3;
- (void)attemptTapOnKeyWithString:(id)a3;
- (void)attemptTapOnKeyWithString:(id)a3 withErrorGenerator:(id)a4 typingLog:(id)a5;
- (void)attemptToDelete;
- (void)attemptToDeleteWithCount:(unsigned int)a3;
- (void)attemptToRapidDeleteCharacters:(unsigned int)a3;
- (void)attemptToShift;
- (void)attemptToStrokeWord:(id)a3;
- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 duration:(double)a5 typingLog:(id)a6 callback:(id)a7;
- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 typingLog:(id)a5 callback:(id)a6;
- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4;
- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4 callback:(id)a5;
- (void)attemptToStrokeWord:(id)a3 withCallback:(id)a4;
- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4;
- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4 duration:(double)a5;
- (void)attemptToTapKeys:(id)a3;
- (void)attemptToTapMoreKey;
- (void)attemptToTapPredictionWithLiteral:(id)a3;
- (void)attemptToTypeIntended:(id)a3 expected:(id)a4 typingLog:(id)a5;
- (void)attemptToTypeText:(id)a3;
- (void)attemptToTypeText:(id)a3 typingLog:(id)a4;
- (void)attemptToTypeWithLog:(id)a3;
- (void)attemptVariantKey:(id)a3;
- (void)candidateRejected:(id)a3;
- (void)commitText;
- (void)dealloc;
- (void)generateAutocorrectionsWithShiftState:(int)a3;
- (void)generateCandidates;
- (void)insertText:(id)a3;
- (void)learnWord:(id)a3 withCount:(unint64_t)a4;
- (void)linkWithUserActionStream:(id)a3;
- (void)performStrokeForPath:(id)a3 typingLog:(id)a4 callback:(id)a5;
- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 mode:(id)a5;
- (void)rejectAutocorrection;
- (void)reset;
- (void)setAsyncPredictions:(BOOL)a3;
- (void)setAutocapitalizationType:(unint64_t)a3;
- (void)setAutocorrectionList:(id)a3;
- (void)setAutocorrectionType:(unint64_t)a3;
- (void)setBadSentenceLogFilePath:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setHardwareKeyboardMode:(BOOL)a3;
- (void)setInlineCompletionEnabled:(BOOL)a3;
- (void)setInputContextHistory:(id)a3;
- (void)setInputMode:(id)a3;
- (void)setInputModeIdentifier:(id)a3;
- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3;
- (void)setInterTouchTimestampInterval:(double)a3;
- (void)setKeyboard:(id)a3;
- (void)setKeyboardInputManagerFactory:(id)a3;
- (void)setLastInputWasSelection:(BOOL)a3;
- (void)setLastTimestamp:(double)a3;
- (void)setLearnWordContextIndex:(unint64_t)a3;
- (void)setLocale:(id)a3;
- (void)setLogDocumentContext:(BOOL)a3;
- (void)setLongPredictionListEnabled:(BOOL)a3;
- (void)setMaxPredictions:(int64_t)a3;
- (void)setMaxPredictionsReported:(int)a3;
- (void)setNextKeyIsMultitap:(BOOL)a3;
- (void)setPrintTranslitSummaries:(BOOL)a3;
- (void)setPrintTypingTranscript:(BOOL)a3;
- (void)setRecipientIdentifier:(id)a3;
- (void)setSelectedRange:(_NSRange)a3;
- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:(id)a3;
- (void)setShouldDecomposeInputString:(BOOL)a3;
- (void)setShouldSkipCandidateSelection:(BOOL)a3;
- (void)setShowsCandidateBar:(BOOL)a3;
- (void)setUserModel:(id)a3;
- (void)setUserPersona:(id)a3;
- (void)setUsesAutocapitalization:(BOOL)a3;
- (void)setUsesAutocorrection:(BOOL)a3;
- (void)setUsesPrediction:(BOOL)a3;
- (void)setUsesTransliteration:(BOOL)a3;
- (void)setWarnIfSelectingPopupVariant:(BOOL)a3;
- (void)setWordLearningEnabled:(BOOL)a3;
- (void)suspendAndResume;
- (void)syncToDocumentState:(id)a3;
- (void)syncToEmptyDocument;
- (void)tearDown;
@end

@implementation TIKeyboardTyper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_inputMode, 0);
  objc_storeStrong((id *)&self->_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap, 0);
  objc_storeStrong((id *)&self->_badSentenceLogFilePath, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_userPersona, 0);
  objc_storeStrong((id *)&self->_userActionStream, 0);
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLearnWordContextIndex:(unint64_t)a3
{
  self->_learnWordContextIndex = a3;
}

- (unint64_t)learnWordContextIndex
{
  return self->_learnWordContextIndex;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setInputMode:(id)a3
{
}

- (TIInputMode)inputMode
{
  return self->_inputMode;
}

- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:(id)a3
{
}

- (NSDictionary)shiftedKeyToUnShiftedKeyExcludeCapitalizationMap
{
  return self->_shiftedKeyToUnShiftedKeyExcludeCapitalizationMap;
}

- (void)setPrintTranslitSummaries:(BOOL)a3
{
  self->_printTranslitSummaries = a3;
}

- (BOOL)printTranslitSummaries
{
  return self->_printTranslitSummaries;
}

- (void)setShowsCandidateBar:(BOOL)a3
{
  self->_showsCandidateBar = a3;
}

- (BOOL)showsCandidateBar
{
  return self->_showsCandidateBar;
}

- (void)setPrintTypingTranscript:(BOOL)a3
{
  self->_printTypingTranscript = a3;
}

- (BOOL)printTypingTranscript
{
  return self->_printTypingTranscript;
}

- (void)setBadSentenceLogFilePath:(id)a3
{
}

- (NSString)badSentenceLogFilePath
{
  return self->_badSentenceLogFilePath;
}

- (void)setWarnIfSelectingPopupVariant:(BOOL)a3
{
  self->_warnIfSelectingPopupVariant = a3;
}

- (BOOL)warnIfSelectingPopupVariant
{
  return self->_warnIfSelectingPopupVariant;
}

- (void)setLogDocumentContext:(BOOL)a3
{
  self->_logDocumentContext = a3;
}

- (BOOL)logDocumentContext
{
  return self->_logDocumentContext;
}

- (void)setMaxPredictions:(int64_t)a3
{
  self->_maxPredictions = a3;
}

- (int64_t)maxPredictions
{
  return self->_maxPredictions;
}

- (void)setMaxPredictionsReported:(int)a3
{
  self->_maxPredictionsReported = a3;
}

- (int)maxPredictionsReported
{
  return self->_maxPredictionsReported;
}

- (void)setShouldDecomposeInputString:(BOOL)a3
{
  self->_shouldDecomposeInputString = a3;
}

- (BOOL)shouldDecomposeInputString
{
  return self->_shouldDecomposeInputString;
}

- (void)setInterTouchTimestampInterval:(double)a3
{
  self->_interTouchTimestampInterval = a3;
}

- (double)interTouchTimestampInterval
{
  return self->_interTouchTimestampInterval;
}

- (ACTKeyboardController)keyboardController
{
  return self->_keyboardController;
}

- (void)setUserPersona:(id)a3
{
}

- (TITestUserPersona)userPersona
{
  return self->_userPersona;
}

- (ACTUserActionStreaming)userActionStream
{
  return self->_userActionStream;
}

- (BOOL)inPartialCandidateSelection
{
  v2 = [(TIKeyboardTyper *)self userActionStream];
  char v3 = [v2 inPartialCandidateSelection];

  return v3;
}

- (BOOL)usePartialCandidates
{
  v2 = [(TIKeyboardTyper *)self userModel];
  char v3 = [v2 usePartialCandidates];

  return v3;
}

- (void)learnWord:(id)a3 withCount:(unint64_t)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__TIKeyboardTyper_learnWord_withCount___block_invoke;
  v10[3] = &unk_265050078;
  v10[4] = self;
  id v11 = &unk_26F2C9E40;
  v7 = (void (**)(void))MEMORY[0x2455C2CF0](v10);
  [(TIKeyboardTyper *)self syncToEmptyDocument];
  [(TIKeyboardTyper *)self attemptToTypeText:@"- -  - - . "];
  [(TIKeyboardTyper *)self syncToEmptyDocument];
  for (; a4; --a4)
  {
    v8 = v7[2](v7);
    [(TIKeyboardTyper *)self attemptToTypeText:v8];

    [(TIKeyboardTyper *)self attemptToTypeText:@" "];
    [(TIKeyboardTyper *)self attemptToTypeText:v6];
    [(TIKeyboardTyper *)self rejectAutocorrection];
    [(TIKeyboardTyper *)self attemptToTypeText:@" "];
    v9 = v7[2](v7);
    [(TIKeyboardTyper *)self attemptToTypeText:v9];

    [(TIKeyboardTyper *)self attemptToTypeText:@". "];
    [(TIKeyboardTyper *)self syncToEmptyDocument];
  }
}

id __39__TIKeyboardTyper_learnWord_withCount___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) learnWordContextIndex];
  char v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v2];
  unint64_t v4 = v2 + 1;
  if ([*(id *)(a1 + 40) count] <= v4) {
    unint64_t v5 = 0;
  }
  else {
    unint64_t v5 = v4;
  }
  [*(id *)(a1 + 32) setLearnWordContextIndex:v5];
  return v3;
}

- (id)splitDigraphsInString:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardTyper *)self inputMode];
  id v6 = [v5 languageWithRegion];
  int v7 = [v6 hasPrefix:@"de_"];

  if (v7)
  {
    v8 = [v4 stringByReplacingOccurrencesOfString:@"ß" withString:@"ss"];

    v9 = [(TIKeyboardTyper *)self keyboard];
    v10 = [v9 subtrees];
    id v11 = [v10 objectAtIndex:0];

    if ([v11 isShiftKeyplane])
    {
      v12 = [(TIKeyboardTyper *)self keyboard];
      v13 = [v11 shiftAlternateKeyplaneName];
      uint64_t v14 = [v12 subtreeWithName:v13];

      id v11 = (void *)v14;
    }
    v15 = [(TIKeyboardTyper *)self keyboardController];
    uint64_t v16 = [v15 keyCodeWithString:@"ü" inKeyplane:v11];

    if (v16 == -1)
    {
      v17 = [v8 stringByReplacingOccurrencesOfString:@"Ä" withString:@"Ae"];

      v18 = [v17 stringByReplacingOccurrencesOfString:@"Ö" withString:@"Oe"];

      v19 = [v18 stringByReplacingOccurrencesOfString:@"Ü" withString:@"Ue"];

      v20 = [v19 stringByReplacingOccurrencesOfString:@"ä" withString:@"ae"];

      v21 = [v20 stringByReplacingOccurrencesOfString:@"ö" withString:@"oe"];

      v8 = [v21 stringByReplacingOccurrencesOfString:@"ü" withString:@"ue"];
    }
  }
  else
  {
    v22 = [(TIKeyboardTyper *)self inputMode];
    v23 = [v22 languageWithRegion];
    int v24 = [v23 hasPrefix:@"fr_"];

    if (!v24) {
      goto LABEL_9;
    }
    v25 = [v4 stringByReplacingOccurrencesOfString:@"æ" withString:@"ae"];

    v26 = [v25 stringByReplacingOccurrencesOfString:@"œ" withString:@"oe"];

    id v11 = [v26 stringByReplacingOccurrencesOfString:@"Æ" withString:@"AE"];

    v8 = [v11 stringByReplacingOccurrencesOfString:@"Œ" withString:@"OE"];
  }

  id v4 = v8;
LABEL_9:
  return v4;
}

- (id)internalStringToExternal:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardTyper *)self keyboardController];
  id v6 = [v5 inputManager];
  int v7 = [v6 internalStringToExternal:v4];

  return v7;
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardTyper *)self keyboardController];
  id v6 = [v5 inputManager];
  int v7 = [v6 externalStringToInternal:v4];

  return v7;
}

- (id)transliteratedTokensForString:(id)a3
{
  return TITestTyperTokensForString(a3, 0);
}

- (id)inputSegmentsForContinuousPathString:(id)a3
{
  id v4 = TITestTyperTokensForString(a3, 0);
  unint64_t v5 = [MEMORY[0x263EFF980] array];
  if ([v4 count])
  {
    unint64_t v6 = 0;
    char v7 = 0;
    do
    {
      v8 = [v4 objectAtIndex:v6];
      if (v7)
      {
        uint64_t v9 = [(TIKeyboardTyper *)self mergeHyphenatedWord:v5 string:v8];

        v8 = (void *)v9;
      }
      if ([v8 isEqualToString:@"-"]
        && [(TIKeyboardTyper *)self priorTokenisString:v4 i:v6]
        && [(TIKeyboardTyper *)self postTokenisString:v4 i:v6])
      {
        uint64_t v10 = [(TIKeyboardTyper *)self mergeHyphenatedWord:v5 string:v8];

        char v7 = 1;
        v8 = (void *)v10;
      }
      else
      {
        char v7 = 0;
      }
      [v5 addObject:v8];

      ++v6;
    }
    while (v6 < [v4 count]);
  }

  return v5;
}

- (id)mergeHyphenatedWord:(id)a3 string:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    char v7 = [v5 lastObject];
    [v5 removeLastObject];
    id v8 = [v7 stringByAppendingString:v6];
  }
  else
  {
    id v8 = v6;
  }

  return v8;
}

- (BOOL)postTokenisString:(id)a3 i:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] - 1 <= a4)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    id v6 = [v5 objectAtIndex:a4 + 1];
    uint64_t v7 = [v6 characterAtIndex:0];
    id v8 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    if ([v8 characterIsMember:v7])
    {
      LOBYTE(v9) = 0;
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263F08708] punctuationCharacterSet];
      unsigned int v9 = (v7 != 32) & ~[v10 characterIsMember:v7];
    }
  }

  return v9;
}

- (BOOL)priorTokenisString:(id)a3 i:(unint64_t)a4
{
  if (a4)
  {
    id v4 = [a3 objectAtIndex:a4 - 1];
    uint64_t v5 = objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1);
    id v6 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
    if ([v6 characterIsMember:v5])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      id v8 = [MEMORY[0x263F08708] punctuationCharacterSet];
      unsigned int v7 = (v5 != 32) & ~[v8 characterIsMember:v5];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)inputSegmentsForString:(id)a3
{
  return TITestTyperTokensForString(a3, 0);
}

- (id)tokensForString:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardTyper *)self userModel];
  int v6 = [v5 prefersTransliteration];

  if (v6)
  {
    v12[0] = v4;
    uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  else
  {
    id v8 = [(TIKeyboardTyper *)self userModel];
    int v9 = [v8 prefersContinuousPath];

    if (v9) {
      [(TIKeyboardTyper *)self inputSegmentsForContinuousPathString:v4];
    }
    else {
    uint64_t v7 = [(TIKeyboardTyper *)self inputSegmentsForString:v4];
    }
  }
  uint64_t v10 = (void *)v7;

  return v10;
}

- (id)_logStringForTouchedKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 interactionType];
    if (v6 <= 0x10 && ((1 << v6) & 0x1A006) != 0)
    {
      uint64_t v7 = [(TIKeyboardTyper *)self keyboardController];
      id v8 = [v7 layoutUtils];
      int v9 = [(TIKeyboardTyper *)self keyplane];
      objc_msgSend(v8, "representedStringForKey:shifted:", v5, objc_msgSend(v9, "isShiftKeyplane"));
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = NSString;
      uint64_t v7 = [v5 representedString];
      uint64_t v10 = [v12 stringWithFormat:@"<%@>", v7];
    }
  }
  else
  {
    uint64_t v10 = @"<NoKey>";
  }

  return v10;
}

- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 fingerID:(int)a5 secondaryString:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  double y = a3.y;
  double x = a3.x;
  v12 = [(TIKeyboardTyper *)self keyboardController];
  LODWORD(v13) = 5.0;
  objc_msgSend(v12, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", self->_touchPathID, v7, x, y, v13, a4);

  uint64_t v14 = [(TIKeyboardTyper *)self keyboardController];
  LODWORD(v15) = 5.0;
  uint64_t v16 = objc_msgSend(v14, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", self->_touchPathID, v7, v6, x, y, v15, a4);

  [(TIKeyboardTyper *)self _bumpTouchPathID];
  v17 = [(TIKeyboardTyper *)self userPersona];
  v18 = [(TIKeyboardTyper *)self keyboardController];
  v19 = [v18 keyplane];
  [v17 updateFromKeyplane:v19];

  return v16;
}

- (void)_bumpTouchPathID
{
  unint64_t touchPathID = self->_touchPathID;
  if (touchPathID + 1 <= 0x14) {
    unint64_t v3 = touchPathID + 1;
  }
  else {
    unint64_t v3 = 1;
  }
  self->_unint64_t touchPathID = v3;
}

- (void)performStrokeForPath:(id)a3 typingLog:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, unsigned char *))a5;
  unsigned __int8 v39 = 0;
  id v11 = [v8 samples];
  unint64_t v12 = [v11 count];

  if (v12 < 2)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = [v8 samples];
      double v15 = [v14 objectAtIndexedSubscript:v13];

      uint64_t v16 = [(TIKeyboardTyper *)self keyboardController];
      [v15 point];
      double v18 = v17;
      double v20 = v19;
      [v15 timeStamp];
      LODWORD(v22) = 5.0;
      if (v13) {
        objc_msgSend(v16, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", 0, 0, v18, v20, v22, v21);
      }
      else {
        objc_msgSend(v16, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", 0, 0, v18, v20, v22, v21);
      }

      if (v10)
      {
        v10[2](v10, v15, &v39);
        if (v39) {
          break;
        }
      }

      v23 = [v8 samples];
      unint64_t v24 = [v23 count];

      uint64_t v25 = v13 + 1;
      unint64_t v26 = v13 + 2;
      ++v13;
      if (v26 >= v24) {
        goto LABEL_12;
      }
    }

    uint64_t v25 = v13;
  }
LABEL_12:
  int v27 = v39;
  v28 = [v8 samples];
  v29 = v28;
  if (v27) {
    [v28 objectAtIndexedSubscript:v25];
  }
  else {
  v30 = [v28 lastObject];
  }

  v31 = [(TIKeyboardTyper *)self keyboardController];
  [v30 point];
  double v33 = v32;
  double v35 = v34;
  [v30 timeStamp];
  LODWORD(v36) = 5.0;
  v38 = objc_msgSend(v31, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", 0, 0, 0, v33, v35, v36, v37);

  [v9 registerPathStringAsKeyStrokes:v38 path:v8 predictionBarState:0];
}

- (void)_performRejectCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v8 = a3;
  [a5 logRejectedAutocorrection];
  id v9 = [(TIKeyboardTyper *)self keyboardController];
  [v9 rejectCandidate:v8];

  [(TIKeyboardTyper *)self setLastTimestamp:a4];
}

- (void)_performAcceptPredictiveCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6
{
}

- (void)_performAcceptCandidate:(id)a3 timestamp:(double)a4 typingLog:(id)a5 predictiveCandidate:(BOOL)a6 intendedTransliteration:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a3;
  double v15 = [v14 candidate];
  [v13 logAcceptedCandidate:v15 intendedTransliterationCandidate:v12];

  uint64_t v16 = [(TIKeyboardTyper *)self keyboardController];
  [v16 acceptCandidate:v14 predictiveCandidate:v7];

  [(TIKeyboardTyper *)self setLastTimestamp:a4];
  id v17 = [(TIKeyboardTyper *)self keyboardController];
  [v17 generateAutocorrectionsOrCandidates];
}

- (id)_performGestureKeyInput:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v8 beginKeystrokeWithIntendedKey:v7 touchEvent:0 touchError:0];
  id v9 = [(TIKeyboardTyper *)self keyboardController];
  [v9 addStringFromGestureKeyInput:v7];

  uint64_t v10 = [NSString stringWithFormat:@"<%@>", v7];
  [v8 finishKeystrokeWithTouchedKey:v10 touchEvent:0 insertedKey:v7];

  return v7;
}

- (id)_performVariantKey:(id)a3 timestamp:(double)a4 typingLog:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  [v8 beginKeystrokeWithIntendedKey:v7 touchEvent:0 touchError:0];
  id v9 = [(TIKeyboardTyper *)self keyboardController];
  [v9 addStringFromVariantKey:v7];

  uint64_t v10 = [NSString stringWithFormat:@"<%@>", v7];
  [v8 finishKeystrokeWithTouchedKey:v10 touchEvent:0 insertedKey:v7];

  return v7;
}

- (void)_skipTapTimestamp:(double)a3 intendedKey:(id)a4 typingLog:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 0, 0, -1);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, 0, -1, v11, v13, 5.0, a3);
  double v15 = [v9 representedString];

  [v8 beginKeystrokeWithIntendedKey:v15 touchEvent:v16 touchError:0];
  [(TIKeyboardTyper *)self setLastTimestamp:a3];
  [v8 finishKeystrokeWithTouchedKey:@"<NoKey>" touchEvent:v14 insertedKey:&stru_26F2B7E50];
}

- (id)_performTouchEvent:(id)a3 typingLog:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 stage];
  [v6 location];
  double v10 = v9;
  double v12 = v11;
  [v6 radius];
  float v14 = v13;
  [v6 timestamp];
  double v16 = v15;
  uint64_t v17 = [v6 pathIndex];
  uint64_t v18 = [v6 fingerID];
  switch(v8)
  {
    case 2:
      double v21 = [(TIKeyboardTyper *)self keyboardController];
      *(float *)&double v22 = v14;
      objc_msgSend(v21, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", v17, v18, 0, v10, v12, v22, v16);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      unint64_t v24 = [(TIKeyboardTyper *)self predictionBarCandidates];
      if ([(TIKeyboardTyper *)self maxPredictionsReported] >= 1)
      {
        unint64_t v25 = 0;
        do
        {
          if ([v24 count] <= v25) {
            break;
          }
          unint64_t v26 = [v24 objectAtIndexedSubscript:v25];
          int v27 = [v26 candidate];
          [v19 addObject:v27];

          ++v25;
        }
        while ((uint64_t)v25 < [(TIKeyboardTyper *)self maxPredictionsReported]);
      }
      [v7 registerPathStringAsKeyStrokes:v23 path:0 predictionBarState:v19];

      goto LABEL_12;
    case 1:
      id v19 = [(TIKeyboardTyper *)self keyboardController];
      *(float *)&double v28 = v14;
      objc_msgSend(v19, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", v17, v18, v10, v12, v28, v16);
      goto LABEL_11;
    case 0:
      id v19 = [(TIKeyboardTyper *)self keyboardController];
      *(float *)&double v20 = v14;
      objc_msgSend(v19, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", v17, v18, v10, v12, v20, v16);
LABEL_11:
      v23 = &stru_26F2B7E50;
LABEL_12:

      goto LABEL_14;
  }
  v23 = &stru_26F2B7E50;
LABEL_14:
  [v6 timestamp];
  -[TIKeyboardTyper setLastTimestamp:](self, "setLastTimestamp:");

  return v23;
}

- (id)_performTapAtLocation:(CGPoint)a3 timestamp:(double)a4 intendedKey:(id)a5 touchedKey:(id)a6 secondaryString:(BOOL)a7 touchError:(id)a8 typingLog:(id)a9
{
  BOOL v11 = a7;
  double y = a3.y;
  double x = a3.x;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  if (v11)
  {
    double v21 = [v17 secondaryRepresentedStrings];
    double v22 = [v21 firstObject];
  }
  else
  {
    double v22 = [v17 representedString];
  }
  v23 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 0, 0, -1, x, y, 5.0, a4);
  int v47 = [v22 isEqualToString:@"Delete"];
  unint64_t v24 = [(TIKeyboardTyper *)self text];
  v48 = v19;
  [v20 beginKeystrokeWithIntendedKey:v22 touchEvent:v23 touchError:v19 documentBefore:v24];

  unint64_t v25 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v26 = [v25 leftKeys];
  char v27 = [v26 containsObject:v17];

  if (v27)
  {
    uint64_t v28 = 3;
  }
  else
  {
    v29 = [(TIKeyboardTyper *)self keyboardController];
    v30 = [v29 rightKeys];
    int v31 = [v30 containsObject:v17];

    if (v31) {
      uint64_t v28 = 9;
    }
    else {
      uint64_t v28 = 0;
    }
  }
  if ([v18 interactionType] == 11)
  {
    double v32 = [(TIKeyboardTyper *)self keyboardController];
    double v33 = [(TIKeyboardTyper *)self keyplane];
    uint64_t v34 = [v32 keyCodeWithString:@"More" inKeyplane:v33];

    [(TIKeyboardTyper *)self lastTimestamp];
    double v36 = v35;
    [(TIKeyboardTyper *)self interTouchTimestampInterval];
    double v38 = v36 + v37;
    unsigned __int8 v39 = [(TIKeyboardTyper *)self keyboardController];
    LODWORD(v40) = 5.0;
    objc_msgSend(v39, "performSkipTapAtLocation:radius:timestamp:pathIndex:fingerID:forcedKeyCode:", 0, v28, v34, x, y, v40, v38);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v42 = [(TIKeyboardTyper *)self userPersona];
    v43 = [(TIKeyboardTyper *)self keyboardController];
    v44 = [v43 keyplane];
    [v42 updateFromKeyplane:v44];
  }
  else
  {
    -[TIKeyboardTyper _performTapAtLocation:timestamp:fingerID:secondaryString:](self, "_performTapAtLocation:timestamp:fingerID:secondaryString:", v28, v11, x, y, a4);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!v41) {
    v41 = &stru_26F2B7E50;
  }
  if ((([(__CFString *)v41 isEqualToString:@"\\b"] ^ 1 | v47) & 1) == 0)
  {

    v41 = @"\\B";
  }
  [(TIKeyboardTyper *)self setLastTimestamp:a4];
  v45 = objc_msgSend(MEMORY[0x263F7E688], "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", 2, 0, -1, x, y, 5.0, a4);
  [(TIKeyboardTyper *)self _finishKeystrokeAndRecordPredictionsInTypingLog:v45 touchedKey:v18 insertedKey:v41 typingLog:v20];

  return v41;
}

- (void)_finishKeystrokeAndRecordPredictionsInTypingLog:(id)a3 touchedKey:(id)a4 insertedKey:(id)a5 typingLog:(id)a6
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v30 = a3;
  id v10 = a4;
  id v11 = a5;
  id v29 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  float v14 = [(TIKeyboardTyper *)self predictionBarCandidates];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * v18), "candidate", v29);
        [v12 addObject:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v16);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v20 = [(TIKeyboardTyper *)self inlineCompletionCandidates];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
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
        unint64_t v25 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v24), "candidate", v29);
        [v13 addObject:v25];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v22);
  }

  if (v10)
  {
    id v26 = [(TIKeyboardTyper *)self _logStringForTouchedKey:v10];
  }
  else
  {
    id v26 = v11;
  }
  char v27 = v26;
  uint64_t v28 = v29;
  objc_msgSend(v29, "finishKeystrokeWithTouchedKey:touchEvent:insertedKey:predictionBarState:inlineCompletionBarState:", v26, v30, v11, v12, v13, v29);
}

- (id)keyContainingPoint:(CGPoint)a3 inKeyplane:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  int v8 = [(TIKeyboardTyper *)self keyboardController];
  double v9 = objc_msgSend(v8, "keyContainingPoint:inKeyplane:", v7, x, y);

  return v9;
}

- (CGPoint)pointForAttemptedTapOnKey:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 paddedFrame];
  CGFloat x = v37.origin.x;
  CGFloat y = v37.origin.y;
  CGFloat width = v37.size.width;
  CGFloat height = v37.size.height;
  double MidX = CGRectGetMidX(v37);
  v38.origin.CGFloat x = x;
  v38.origin.CGFloat y = y;
  v38.size.CGFloat width = width;
  v38.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v38);
  float v14 = [(TIKeyboardTyper *)self userPersona];

  if (v14)
  {
    uint64_t v15 = [(TIKeyboardTyper *)self userPersona];
    [v15 userPointForKey:v7];
    double MidX = v16;
    double MidY = v17;
  }
  else
  {
    uint64_t v18 = [(TIKeyboardTyper *)self keyboardController];
    id v19 = [v18 layoutUtils];
    id v20 = [(TIKeyboardTyper *)self keyplane];
    uint64_t v15 = objc_msgSend(v19, "representedStringForKey:shifted:", v7, objc_msgSend(v20, "isShiftKeyplane"));

    if (v6 && ([v15 isEqualToString:@"\n"] & 1) == 0)
    {
      objc_msgSend(v6, "applyToPoint:", MidX, MidY);
      double MidX = v21;
      double MidY = v22;
    }
    uint64_t v23 = [(TIKeyboardTyper *)self keyboard];
    uint64_t v24 = [v23 name];
    char v25 = [v24 hasPrefix:@"Dynamic"];

    if ((v25 & 1) == 0)
    {
      if (MidX < 0.0) {
        double MidX = 0.0;
      }
      if (MidY < 0.0) {
        double MidY = 0.0;
      }
      id v26 = [(TIKeyboardTyper *)self keyboard];
      [v26 frame];
      double v28 = v27;

      if (MidX > v28)
      {
        id v29 = [(TIKeyboardTyper *)self keyboard];
        [v29 frame];
        double MidX = CGRectGetMaxX(v39);
      }
      id v30 = [(TIKeyboardTyper *)self keyboard];
      [v30 frame];
      double v32 = v31;

      if (MidY > v32)
      {
        long long v33 = [(TIKeyboardTyper *)self keyboard];
        [v33 frame];
        double MidY = CGRectGetMaxY(v40);
      }
    }
  }

  double v34 = MidX;
  double v35 = MidY;
  result.CGFloat y = v35;
  result.CGFloat x = v34;
  return result;
}

- (id)_keyplaneCloserToKeyWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardTyper *)self keyplane];
  id v6 = [v5 componentName];
  id v7 = [v6 lowercaseString];

  int v8 = [MEMORY[0x263EFF9A0] dictionaryWithObject:v7 forKey:v7];
  double v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v7, 0);
  while ([v9 count])
  {
    id v10 = [v9 objectAtIndex:0];
    [v9 removeObjectAtIndex:0];
    id v11 = [(TIKeyboardTyper *)self keyboard];
    id v12 = [v11 subtreeWithName:v10];

    id v13 = [(TIKeyboardTyper *)self keyWithString:v4 inKeyplane:v12];

    if (v13)
    {
      id v14 = v10;
      uint64_t v15 = v14;
      do
      {
        double v16 = v14;
        id v14 = v15;

        uint64_t v15 = [v8 valueForKey:v14];
      }
      while (![v15 isEqualToString:v7]);
      double v17 = [(TIKeyboardTyper *)self keyboard];
      uint64_t v18 = [v17 subtreeWithName:v14];
    }
    else
    {
      id v19 = [(TIKeyboardTyper *)self keyboardController];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __50__TIKeyboardTyper__keyplaneCloserToKeyWithString___block_invoke;
      v21[3] = &unk_265050050;
      id v22 = v8;
      id v14 = v10;
      id v23 = v14;
      id v24 = v9;
      [v19 enumerateKeyplaneNamesAdjacentToKeyplane:v12 usingBlock:v21];

      uint64_t v18 = 0;
      uint64_t v15 = v22;
    }

    if (v18) {
      goto LABEL_11;
    }
  }
  uint64_t v18 = 0;
LABEL_11:

  return v18;
}

void __50__TIKeyboardTyper__keyplaneCloserToKeyWithString___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  unint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "valueForKey:");

  if (!v3)
  {
    [*(id *)(a1 + 32) setValue:*(void *)(a1 + 40) forKey:v4];
    [*(id *)(a1 + 48) addObject:v4];
  }
}

- (BOOL)changeToNearestAlphabeticPlane
{
  unint64_t v3 = [(TIKeyboardTyper *)self keyplane];
  char v4 = [v3 isAlphabeticPlane];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = [(TIKeyboardTyper *)self keyboard];
    id v6 = [(TIKeyboardTyper *)self keyplane];
    id v7 = [v6 alternateKeyplaneName];
    int v8 = [v5 subtreeWithName:v7];

    if ([v8 isAlphabeticPlane]) {
      [(TIKeyboardTyper *)self attemptToTapMoreKey];
    }
  }
  double v9 = [(TIKeyboardTyper *)self keyplane];
  char v10 = [v9 isAlphabeticPlane];

  return v10;
}

- (BOOL)changeToNearestKeyplaneWithString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardTyper *)self keyplane];
  uint64_t v6 = [(TIKeyboardTyper *)self keyWithString:v4 inKeyplane:v5];
  if (v6)
  {
    id v7 = (void *)v6;
LABEL_7:
  }
  else
  {
    int v8 = 0;
    while (1)
    {
      double v9 = v8;
      int v8 = [(TIKeyboardTyper *)self keyToAccessKeyplaneCloserToKeyString:v4];

      if (!v8) {
        break;
      }
      char v10 = [v8 representedString];
      [(TIKeyboardTyper *)self attemptTapOnKeyWithString:v10 withErrorGenerator:0 typingLog:0];

      uint64_t v5 = [(TIKeyboardTyper *)self keyplane];
      uint64_t v11 = [(TIKeyboardTyper *)self keyWithString:v4 inKeyplane:v5];
      if (v11)
      {
        id v7 = (void *)v11;

        goto LABEL_7;
      }
    }
  }
  id v12 = [(TIKeyboardTyper *)self keyplane];
  id v13 = [(TIKeyboardTyper *)self keyWithString:v4 inKeyplane:v12];
  BOOL v14 = v13 != 0;

  return v14;
}

- (id)keyToAccessKeyplaneCloserToKeyString:(id)a3
{
  id v4 = [(TIKeyboardTyper *)self _keyplaneCloserToKeyWithString:a3];
  uint64_t v5 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v6 = [(TIKeyboardTyper *)self keyplane];
  id v7 = [v5 keyToAccessKeyplane:v4 fromKeyplane:v6];

  return v7;
}

- (id)shiftKeyToAccessKeyplaneCloserToKeyString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TIKeyboardTyper *)self keyplane];
  if (![v5 isAlphabeticPlane]) {
    goto LABEL_6;
  }
  uint64_t v6 = [(TIKeyboardTyper *)self keyplane];
  char v7 = [v6 isShiftKeyplane];

  if (v7)
  {
    int v8 = 0;
    goto LABEL_8;
  }
  double v9 = [(TIKeyboardTyper *)self keyboardController];
  char v10 = [v9 layoutUtils];
  uint64_t v11 = [(TIKeyboardTyper *)self keyplane];
  uint64_t v5 = [v10 exactKeyForString:v4 keyplane:v11 includeSecondaryStrings:1];

  if (v5)
  {
    id v12 = [(TIKeyboardTyper *)self keyboardController];
    id v13 = [v12 keyplane];
    int v8 = [v13 firstCachedKeyWithName:@"Shift-Key"];
  }
  else
  {
LABEL_6:
    int v8 = 0;
  }

LABEL_8:
  return v8;
}

- (id)keyWithString:(id)a3 inKeyplane:(id)a4 includeSecondaryStrings:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v11 = [v10 layoutUtils];
  id v12 = [v11 exactKeyForString:v9 keyplane:v8 includeSecondaryStrings:v5];

  return v12;
}

- (id)keyWithString:(id)a3 inKeyplane:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIKeyboardTyper *)self keyboardController];
  id v9 = [v8 layoutUtils];
  char v10 = [v9 exactKeyForString:v7 keyplane:v6 includeSecondaryStrings:0];

  return v10;
}

- (UIKBTree)keyplane
{
  unsigned int v2 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v3 = [v2 keyplane];

  return (UIKBTree *)v3;
}

- (UIKBTree)keyboard
{
  unsigned int v2 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v3 = [v2 keyboard];

  return (UIKBTree *)v3;
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7 secondaryString:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self setLastTimestamp:a5];
  double v16 = [(TIKeyboardTyper *)self keyboardController];
  *(float *)&double v17 = a4;
  uint64_t v18 = objc_msgSend(v16, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", a6, v9, v8, x, y, v17, a5);

  return v18;
}

- (id)performTouchUpAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  return -[TIKeyboardTyper performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:](self, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", a6, *(void *)&a7, 0, a3.x, a3.y);
}

- (void)performTouchEndRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self setLastTimestamp:a5];
  id v15 = [(TIKeyboardTyper *)self keyboardController];
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "performTouchEndRestAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);
}

- (void)performTouchRestAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self setLastTimestamp:a5];
  id v15 = [(TIKeyboardTyper *)self keyboardController];
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "performTouchRestAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);
}

- (void)performTouchCancelAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self setLastTimestamp:a5];
  id v15 = [(TIKeyboardTyper *)self keyboardController];
  *(float *)&double v14 = a4;
  objc_msgSend(v15, "performTouchCancelAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v14, a5);
}

- (int64_t)performTouchDragAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self setLastTimestamp:a5];
  double v14 = [(TIKeyboardTyper *)self keyboardController];
  *(float *)&double v15 = a4;
  int64_t v16 = objc_msgSend(v14, "performTouchDragAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v15, a5);

  return v16;
}

- (int64_t)performTouchDownAtLocation:(CGPoint)a3 radius:(float)a4 timestamp:(double)a5 pathIndex:(unint64_t)a6 fingerID:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self setLastTimestamp:a5];
  double v14 = [(TIKeyboardTyper *)self keyboardController];
  *(float *)&double v15 = a4;
  int64_t v16 = objc_msgSend(v14, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", a6, v7, x, y, v15, a5);

  return v16;
}

- (TIKeyboardCandidateResultSet)candidateResultSet
{
  unsigned int v2 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v3 = [v2 candidateResultSet];

  return (TIKeyboardCandidateResultSet *)v3;
}

- (NSArray)inlineCompletionCandidates
{
  unsigned int v2 = [(TIKeyboardTyper *)self autocorrectionList];
  unint64_t v3 = [v2 inlineCompletions];

  return (NSArray *)v3;
}

- (id)predictationBarDebugString
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(TIKeyboardTyper *)self predictionBarCandidates];
  if ([v3 count] && -[TIKeyboardTyper showsCandidateBar](self, "showsCandidateBar"))
  {
    id v4 = objc_opt_new();
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    double v27 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v31;
      unint64_t v8 = 0x263F7E000uLL;
      uint64_t v9 = &stru_26F2B7E50;
      do
      {
        uint64_t v10 = 0;
        uint64_t v28 = v6;
        do
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          objc_opt_class();
          id v12 = v9;
          if (objc_opt_isKindOfClass())
          {
            id v13 = v11;
            double v14 = [v13 lexiconLocale];

            if (v14)
            {
              double v15 = NSString;
              [v13 lexiconLocale];
              uint64_t v16 = v7;
              double v17 = v4;
              uint64_t v18 = v9;
              v20 = unint64_t v19 = v8;
              double v21 = [v20 substringToIndex:2];
              id v12 = [v15 stringWithFormat:@" (%@)", v21];

              unint64_t v8 = v19;
              uint64_t v9 = v18;
              id v4 = v17;
              uint64_t v7 = v16;
              uint64_t v6 = v28;
            }
            else
            {
              id v12 = v9;
            }
          }
          id v22 = [v11 candidate];
          id v23 = [v22 stringByAppendingString:v12];
          [v4 addObject:v23];

          ++v10;
        }
        while (v6 != v10);
        uint64_t v6 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v6);
    }

    id v24 = [v4 componentsJoinedByString:@"\t"];
    char v25 = [v24 stringByAppendingString:@"\n"];

    unint64_t v3 = v27;
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (NSArray)predictionBarCandidates
{
  unint64_t v3 = [(TIKeyboardTyper *)self candidateBarCandidates];
  if (v3)
  {
    if ([(TIKeyboardTyper *)self inPartialCandidateSelection]) {
      uint64_t v4 = [v3 count];
    }
    else {
      uint64_t v4 = [(TIKeyboardTyper *)self maxPredictions];
    }
    unint64_t v10 = v4;
    unint64_t v11 = [v3 count];
    if (v10 >= v11) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = v10;
    }
    uint64_t v5 = objc_msgSend(v3, "subarrayWithRange:", 0, v12);
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[TIKeyboardTyper maxPredictions](self, "maxPredictions"));
    uint64_t v6 = [(TIKeyboardTyper *)self autocorrection];
    uint64_t v7 = [(TIKeyboardTyper *)self autocorrection];
    unsigned int v8 = [v7 isAutocorrection];

    if (v8)
    {
      unsigned int v9 = 1;
    }
    else
    {
      id v13 = [v6 input];
      unsigned int v9 = [v13 length] != 0;
    }
    objc_opt_class();
    v50 = v6;
    if (objc_opt_isKindOfClass())
    {
      double v14 = [(TIKeyboardTyper *)self locale];
      double v15 = [v14 languageCode];
      if ([v15 isEqualToString:@"ko"])
      {
        int v16 = 0;
      }
      else
      {
        double v17 = [(TIKeyboardTyper *)self locale];
        uint64_t v18 = [v17 languageCode];
        int v19 = [v18 isEqualToString:@"th"] ^ 1;

        int v16 = v19;
      }
    }
    else
    {
      int v16 = 0;
    }
    id v20 = [(TIKeyboardTyper *)self autocorrectionList];
    double v21 = [v20 predictions];

    if ([v21 count])
    {
      id v22 = [v21 objectAtIndex:0];
      int v23 = [v22 isContinuousPathConversion];
      v9 &= v23 ^ 1;
      v8 &= v23 ^ 1;
    }
    int64_t v24 = [(TIKeyboardTyper *)self maxPredictions];
    if (v24) {
      uint64_t v25 = v9;
    }
    else {
      uint64_t v25 = 0;
    }
    uint64_t v26 = v24 - v25;
    if (v26) {
      uint64_t v27 = v8;
    }
    else {
      uint64_t v27 = 0;
    }
    unint64_t v28 = v26 - v27;
    id v29 = [(TIKeyboardTyper *)self autocorrectionList];
    long long v30 = [v29 emojiList];

    unint64_t v31 = [v30 count];
    if (v28 >= v31) {
      unint64_t v32 = v31;
    }
    else {
      unint64_t v32 = v28;
    }
    unint64_t v33 = v28 - v32;
    unint64_t v34 = [v21 count];
    if (v33 >= v34) {
      unint64_t v35 = v34;
    }
    else {
      unint64_t v35 = v33;
    }
    if (v9)
    {
      long long v36 = (void *)MEMORY[0x263F7E640];
      CGRect v37 = [v50 input];
      CGRect v38 = [v36 candidateWithUnchangedInput:v37];

      [v5 addObject:v38];
    }
    if ((v8 | v16) == 1) {
      [v5 addObject:v50];
    }
    if (v35)
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        CGRect v40 = [v21 objectAtIndex:i];
        uint64_t v41 = v40;
        if (v40 && [v40 slotID])
        {
          v42 = [MEMORY[0x263F7EA40] sharedInstance];
          v43 = [v42 secureCandidateRenderer];

          if (v43)
          {
            id v44 = [v43 cachedCandidateForSecureCandidate:v41];
          }
          else
          {
            id v44 = v41;
          }
          v45 = v44;
          [v5 addObject:v44];
        }
        else
        {
          [v5 addObject:v41];
        }
      }
    }
    if (v32)
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        int v47 = [v30 objectAtIndex:j];
        [v5 addObject:v47];
      }
    }

    unint64_t v3 = v49;
  }

  return (NSArray *)v5;
}

- (id)candidateBarCandidates
{
  unsigned int v2 = [(TIKeyboardTyper *)self candidateResultSet];
  unint64_t v3 = [v2 candidates];

  return v3;
}

- (TIKeyboardCandidate)autocorrection
{
  unsigned int v2 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v3 = [v2 autocorrection];

  return (TIKeyboardCandidate *)v3;
}

- (void)acceptCandidateViaKeyboard:(id)a3
{
  id v4 = a3;
  [(TIKeyboardTyper *)self lastTimestamp];
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:](self, "_performAcceptCandidate:timestamp:typingLog:", v4, 0);

  id v9 = objc_alloc_init(MEMORY[0x263F7E648]);
  [v9 setString:@"\n"];
  uint64_t v5 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v6 = [v5 inputManager];
  id v7 = (id)[v6 handleKeyboardInput:v9];

  unsigned int v8 = [(TIKeyboardTyper *)self keyboardController];
  [v8 generateAutocorrectionsOrCandidates];
}

- (void)acceptCandidate:(id)a3
{
  id v4 = a3;
  [(TIKeyboardTyper *)self lastTimestamp];
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:](self, "_performAcceptCandidate:timestamp:typingLog:", v4, 0);
}

- (void)acceptPredictiveCandidate:(id)a3
{
  id v4 = a3;
  [(TIKeyboardTyper *)self lastTimestamp];
  -[TIKeyboardTyper _performAcceptPredictiveCandidate:timestamp:typingLog:](self, "_performAcceptPredictiveCandidate:timestamp:typingLog:", v4, 0);
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 mode:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v13 = [(TIKeyboardTyper *)self inputManager];
  unint64_t v11 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v12 = [v11 keyboardState];
  [v13 registerLearning:v10 fullCandidate:v9 keyboardState:v12 mode:v8];
}

- (void)candidateRejected:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self inputManager];
  [v5 candidateRejected:v4];
}

- (void)rejectAutocorrection
{
  id v3 = [(TIKeyboardTyper *)self autocorrection];
  [(TIKeyboardTyper *)self lastTimestamp];
  -[TIKeyboardTyper _performRejectCandidate:timestamp:typingLog:](self, "_performRejectCandidate:timestamp:typingLog:", v3, 0);
}

- (void)acceptAutocorrection
{
  id v3 = [(TIKeyboardTyper *)self autocorrection];
  [(TIKeyboardTyper *)self lastTimestamp];
  -[TIKeyboardTyper _performAcceptCandidate:timestamp:typingLog:](self, "_performAcceptCandidate:timestamp:typingLog:", v3, 0);
}

- (void)attemptGestureKeyInput:(id)a3
{
  id v3 = [(TIKeyboardTyper *)self _performGestureKeyInput:a3 timestamp:0 typingLog:0.0];
}

- (void)attemptVariantKey:(id)a3
{
  id v3 = [(TIKeyboardTyper *)self _performVariantKey:a3 timestamp:0 typingLog:0.0];
}

- (void)attemptToTapMoreKey
{
}

- (void)attemptToShift
{
}

- (void)attemptToRapidDeleteCharacters:(unsigned int)a3
{
  if (a3)
  {
    [(TIKeyboardTyper *)self attemptToDelete];
    unsigned int v5 = a3 - 1;
    if (a3 != 1)
    {
      while (1)
      {
        uint64_t v6 = [(TIKeyboardTyper *)self inputManager];
        id v7 = [v6 keyboardState];
        id v13 = [v7 documentState];

        id v8 = [v13 contextBeforeInput];
        if (![v8 length]) {
          break;
        }
        id v9 = (void *)MEMORY[0x263F7E540];
        id v10 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "length") - 1);
        unint64_t v11 = [v13 contextAfterInput];
        unint64_t v12 = [v9 documentStateWithContextBefore:v10 selectedText:&stru_26F2B7E50 contextAfter:v11];

        [(TIKeyboardTyper *)self syncToDocumentState:v12];
        if (!--v5) {
          return;
        }
      }
    }
  }
}

- (void)attemptToDeleteWithCount:(unsigned int)a3
{
  if (a3)
  {
    unsigned int v3 = a3;
    do
    {
      [(TIKeyboardTyper *)self attemptTapOnKeyWithString:@"Delete" withErrorGenerator:0 typingLog:0];
      --v3;
    }
    while (v3);
  }
}

- (void)attemptToDelete
{
}

- (id)performTapAtKey:(id)a3 biasedTowards:(id)a4 biasWeight:(float)a5
{
  id v8 = a4;
  id v9 = a3;
  [(TIKeyboardTyper *)self lastTimestamp];
  double v11 = v10;
  [(TIKeyboardTyper *)self interTouchTimestampInterval];
  double v13 = v12;
  double v14 = [(TIKeyboardTyper *)self keyboardController];
  double v15 = [v14 keyplane];

  int v16 = [(TIKeyboardTyper *)self keyWithString:v9 inKeyplane:v15];

  [(TIKeyboardTyper *)self pointForAttemptedTapOnKey:v16 withError:0];
  double v18 = v17;
  double v20 = v19;
  double v21 = [(TIKeyboardTyper *)self keyWithString:v8 inKeyplane:v15];

  [(TIKeyboardTyper *)self pointForAttemptedTapOnKey:v21 withError:0];
  double v23 = v22;
  double v25 = v24;
  uint64_t v26 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v27 = [v26 leftKeys];
  char v28 = [v27 containsObject:v16];

  if (v28)
  {
    uint64_t v29 = 3;
  }
  else
  {
    long long v30 = [(TIKeyboardTyper *)self keyboardController];
    unint64_t v31 = [v30 rightKeys];
    int v32 = [v31 containsObject:v16];

    if (v32) {
      uint64_t v29 = 9;
    }
    else {
      uint64_t v29 = 0;
    }
  }
  double v33 = a5;
  double v34 = v20 + a5 * (v25 - v20);
  double v35 = v18 + v33 * (v23 - v18);
  double v36 = v11 + v13;
  CGRect v37 = [(TIKeyboardTyper *)self keyboardController];
  LODWORD(v38) = 5.0;
  objc_msgSend(v37, "performTouchDownAtLocation:radius:timestamp:pathIndex:fingerID:", 0, v29, v35, v34, v38, v36);

  CGRect v39 = [(TIKeyboardTyper *)self keyboardController];
  LODWORD(v40) = 5.0;
  uint64_t v41 = objc_msgSend(v39, "performTouchUpAtLocation:radius:timestamp:pathIndex:fingerID:secondaryString:", 0, v29, 0, v35, v34, v40, v36);

  [(TIKeyboardTyper *)self setLastTimestamp:v36];
  return v41;
}

- (id)performTapAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TIKeyboardTyper *)self lastTimestamp];
  double v7 = v6;
  [(TIKeyboardTyper *)self interTouchTimestampInterval];
  double v9 = v7 + v8;
  double v10 = -[TIKeyboardTyper _performTapAtLocation:timestamp:fingerID:secondaryString:](self, "_performTapAtLocation:timestamp:fingerID:secondaryString:", 0, 0, x, y, v9);
  [(TIKeyboardTyper *)self setLastTimestamp:v9];
  return v10;
}

- (void)attemptTapOnKeyWithString:(id)a3 withErrorGenerator:(id)a4 typingLog:(id)a5
{
  id v24 = a5;
  id v7 = a3;
  double v8 = [(TIKeyboardTyper *)self keyplane];
  double v9 = [(TIKeyboardTyper *)self keyWithString:v7 inKeyplane:v8];

  if (v9)
  {
    [(TIKeyboardTyper *)self lastTimestamp];
    double v11 = v10;
    [(TIKeyboardTyper *)self interTouchTimestampInterval];
    double v13 = v11 + v12;
    double v14 = [(TIKeyboardTyper *)self errorGenerator];
    double v15 = [v9 representedString];
    [v9 paddedFrame];
    int v16 = objc_msgSend(v14, "errorForKeyString:rect:", v15);

    [(TIKeyboardTyper *)self pointForAttemptedTapOnKey:v9 withError:v16];
    double v18 = v17;
    double v20 = v19;
    double v21 = [(TIKeyboardTyper *)self keyplane];
    double v22 = -[TIKeyboardTyper keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v21, v18, v20);

    if (v22) {
      id v23 = -[TIKeyboardTyper _performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:](self, "_performTapAtLocation:timestamp:intendedKey:touchedKey:secondaryString:touchError:typingLog:", v9, v22, 0, v16, v24, v18, v20, v13);
    }
    else {
      [(TIKeyboardTyper *)self _skipTapTimestamp:v9 intendedKey:v24 typingLog:v13];
    }
    [(TIKeyboardTyper *)self setLastTimestamp:v13];
  }
}

- (void)attemptTapOnKeyWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self errorGenerator];
  [(TIKeyboardTyper *)self attemptTapOnKeyWithString:v4 withErrorGenerator:v5 typingLog:0];
}

- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 duration:(double)a5 typingLog:(id)a6 callback:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  double v15 = objc_msgSend(v14, "substringWithRange:", 0, 1);
  [(TIKeyboardTyper *)self changeToNearestKeyplaneWithString:v15];

  id v21 = +[TTKDefaultContinuousPathGenerator pathGeneratorWithAttributes:MEMORY[0x263EFFA78]];
  int v16 = [(TIKeyboardTyper *)self keyboardController];
  double v17 = [v16 layoutUtils];
  double v18 = [(TIKeyboardTyper *)self keyplane];
  double v19 = [v17 createTTKPlane:v18];

  double v20 = [v21 generatePathFromString:v14 timestamp:v19 duration:a4 layout:a5];

  [(TIKeyboardTyper *)self performStrokeForPath:v20 typingLog:v13 callback:v12];
}

- (void)attemptToStrokeWord:(id)a3 startTime:(double)a4 typingLog:(id)a5 callback:(id)a6
{
}

- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4 callback:(id)a5
{
}

- (void)attemptToStrokeWord:(id)a3 typingLog:(id)a4
{
}

- (void)attemptToStrokeWord:(id)a3 withCallback:(id)a4
{
}

- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4 duration:(double)a5
{
}

- (void)attemptToStrokeWord:(id)a3 withStartTime:(double)a4
{
}

- (void)attemptToStrokeWord:(id)a3
{
}

- (void)attemptToTapKeys:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        double v10 = [(TIKeyboardTyper *)self errorGenerator];
        [(TIKeyboardTyper *)self attemptTapOnKeyWithString:v9 withErrorGenerator:v10 typingLog:0];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)attemptToTypeIntended:(id)a3 expected:(id)a4 typingLog:(id)a5
{
  id v18 = a4;
  id v8 = a5;
  id v9 = a3;
  double v10 = [v9 componentsJoinedByString:&stru_26F2B7E50];
  long long v11 = [v18 componentsJoinedByString:&stru_26F2B7E50];
  long long v12 = [NSString stringWithFormat:@"----->> %@ -> %@", v10, v11];
  char v13 = TIPrintTypingTranscriptToStdout();
  long long v14 = (FILE **)MEMORY[0x263EF8358];
  if ((v13 & 1) != 0 || [(TIKeyboardTyper *)self printTypingTranscript]) {
    fprintf(*v14, "%s\n", (const char *)[v12 UTF8String]);
  }
  double v15 = [(TIKeyboardTyper *)self userActionStream];
  [v15 resetForIntendedSegments:v9 expectedSegments:v18];

  [(TIKeyboardTyper *)self attemptToTypeWithLog:v8];
  if ([(TIKeyboardTyper *)self printTranslitSummaries])
  {
    fprintf(*v14, "input : %s\n", (const char *)[v10 UTF8String]);
    fprintf(*v14, "expected: %s\n", (const char *)[v11 UTF8String]);
    uint64_t v16 = *v14;
    id v17 = [(TIKeyboardTyper *)self text];
    fprintf(v16, "actual  : %s\n\n", (const char *)[v17 UTF8String]);
  }
}

- (void)attemptToTypeText:(id)a3 typingLog:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(TIKeyboardTyper *)self userActionStream];
  [v7 setIntendedText:v8];

  if ((TIPrintTypingTranscriptToStdout() & 1) != 0
    || [(TIKeyboardTyper *)self printTypingTranscript])
  {
    fprintf((FILE *)*MEMORY[0x263EF8358], "----->> %s\n", (const char *)[v8 UTF8String]);
  }
  [(TIKeyboardTyper *)self attemptToTypeWithLog:v6];
}

- (void)attemptToTypeWithLog:(id)a3
{
  id v34 = a3;
  if ((TILogProblemSentencesToStdout() & 1) != 0
    || ([(TIKeyboardTyper *)self badSentenceLogFilePath],
        id v4 = (TIProgressTracker *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    uint64_t v5 = [TIProgressTracker alloc];
    id v6 = [(TIKeyboardTyper *)self userActionStream];
    uint64_t v7 = [v6 intendedText];
    id v8 = [(TIKeyboardTyper *)self badSentenceLogFilePath];
    id v4 = [(TIProgressTracker *)v5 initWithIntendedString:v7 repeatLimit:4 timeout:v8 badSentencePath:1500.0];
  }
  id v9 = 0;
  double v10 = (FILE **)MEMORY[0x263EF8358];
  do
  {
    long long v11 = v9;
    long long v12 = [(TIKeyboardTyper *)self userActionStream];
    id v9 = [v12 nextUserAction];

    if (!v9) {
      break;
    }
    char v13 = (void *)MEMORY[0x2455C2B00]();
    objc_msgSend(v34, "setTokenIndex:", objc_msgSend(v9, "inputSegment"));
    if ([(TIKeyboardTyper *)self warnIfSelectingPopupVariant])
    {
      NSClassFromString(&cfstr_Actselectpopup.isa);
      if (objc_opt_isKindOfClass())
      {
        long long v14 = (FILE *)*MEMORY[0x263EF8348];
        id v15 = [v9 description];
        fprintf(v14, "WARNING! Typer is selecting a pop-up key variant: %s. This may indicate a keyboard layout mis-configuration.\n", (const char *)[v15 UTF8String]);
      }
    }
    uint64_t v16 = [(TIKeyboardTyper *)self predictationBarDebugString];
    if (v16
      && ((TIPrintTypingTranscriptToStdout() & 1) != 0
       || [(TIKeyboardTyper *)self printTypingTranscript]))
    {
      fputs((const char *)[v16 UTF8String], *v10);
    }
    if ((TIPrintTypingTranscriptToStdout() & 1) != 0
      || [(TIKeyboardTyper *)self printTypingTranscript])
    {
      id v17 = *v10;
      id v18 = [v9 shortDescription];
      double v19 = [v9 shortDescription];
      unint64_t v20 = [v19 length] - 1;

      if (v20 >= 0x2D) {
        uint64_t v21 = 45;
      }
      else {
        uint64_t v21 = v20;
      }
      id v22 = [v18 substringToIndex:v21];
      fprintf(v17, "%-45s\t", (const char *)[v22 UTF8String]);
    }
    [v9 applyWithTyper:self log:v34];
    if ((TIPrintTypingTranscriptToStdout() & 1) != 0
      || [(TIKeyboardTyper *)self printTypingTranscript])
    {
      id v23 = *v10;
      id v24 = [(TIKeyboardTyper *)self text];
      fprintf(v23, ">>> %s", (const char *)[v24 UTF8String]);
    }
    double v25 = [(TIKeyboardTyper *)self keyboardController];
    int v26 = [v25 justAcceptedAutocorrection];

    if (v26)
    {
      if ((TIPrintTypingTranscriptToStdout() & 1) != 0
        || [(TIKeyboardTyper *)self printTypingTranscript])
      {
        fwrite("\t\t\t<autocorrect>", 0x10uLL, 1uLL, *v10);
      }
      uint64_t v27 = [(TIKeyboardTyper *)self keyboardController];
      [v27 setJustAcceptedAutocorrection:0];

      [v34 logAutocorrectionInserted];
    }
    if ((TIPrintTypingTranscriptToStdout() & 1) != 0
      || [(TIKeyboardTyper *)self printTypingTranscript])
    {
      fputc(10, *v10);
    }
    char v28 = NSString;
    uint64_t v29 = [(TIKeyboardTyper *)self text];
    long long v30 = [v28 stringWithString:v29];
    BOOL v31 = [(TIProgressTracker *)v4 shouldStopAfterAddingStateString:v30];
  }
  while (!v31);
  if ([(TIProgressTracker *)v4 stoppageReason] == 3) {
    [(TIProgressTracker *)v4 saveBadSentenceAndTranscript:[(TIProgressTracker *)v4 stoppageReason]];
  }
  if ((TIPrintTypingTranscriptToStdout() & 1) != 0
    || [(TIKeyboardTyper *)self printTypingTranscript])
  {
    int v32 = *v10;
    id v33 = [(TIKeyboardTyper *)self text];
    fprintf(v32, "%-45s\t>>> %s。\t\t END\n\n", " ", (const char *)[v33 UTF8String]);
  }
}

- (void)attemptToTypeText:(id)a3
{
}

- (void)suspendAndResume
{
  unsigned int v3 = [(TIKeyboardTyper *)self inputManager];
  [v3 suspend];

  id v4 = [(TIKeyboardTyper *)self inputManager];
  [v4 resume];
}

- (void)syncToEmptyDocument
{
  id v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F7E540]), "initWithContextBefore:markedText:selectedText:contextAfter:selectedRangeInMarkedText:", &stru_26F2B7E50, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  [(TIKeyboardTyper *)self syncToDocumentState:v3];
}

- (void)syncToDocumentState:(id)a3
{
  id v4 = a3;
  [(TIKeyboardTyper *)self setLastTimestamp:0.0];
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 syncToDocumentState:v4];
}

- (void)reset
{
  id v3 = (void *)MEMORY[0x2455C2B00](self, a2);
  [(TIKeyboardTyper *)self setLastTimestamp:0.0];
  id v4 = [(TIKeyboardTyper *)self userActionStream];
  [v4 setIntendedText:&stru_26F2B7E50];

  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 reset];

  id v6 = [(TIKeyboardTyper *)self userPersona];
  uint64_t v7 = [(TIKeyboardTyper *)self keyboardController];
  id v8 = [v7 keyplane];
  [v6 updateFromKeyplane:v8];
}

- (void)setLastInputWasSelection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setLastInputWasSelection:v3];
}

- (BOOL)lastInputWasSelection
{
  unsigned int v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 lastInputWasSelection];

  return v3;
}

- (void)setErrorGenerator:(id)a3
{
  id v5 = a3;
  id v4 = [(TIKeyboardTyper *)self userActionStream];
  [v4 setErrorGenerator:v5];

  [v5 setKeyboardInfoDelgate:self->_keyboardController];
}

- (TIErrorGenerator)errorGenerator
{
  unsigned int v2 = [(TIKeyboardTyper *)self userActionStream];
  char v3 = [v2 errorGenerator];

  return (TIErrorGenerator *)v3;
}

- (void)setUserModel:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self userActionStream];
  [v5 setUserModel:v4];
}

- (TIKeyboardTyperUserModel)userModel
{
  unsigned int v2 = [(TIKeyboardTyper *)self userActionStream];
  char v3 = [v2 userModel];

  return (TIKeyboardTyperUserModel *)v3;
}

- (void)linkWithUserActionStream:(id)a3
{
  id v5 = (ACTUserActionStreaming *)a3;
  userActionStream = self->_userActionStream;
  if (userActionStream != v5)
  {
    [(ACTUserActionStreaming *)userActionStream setDelegate:0];
    objc_storeStrong((id *)&self->_userActionStream, a3);
    [(ACTUserActionStreaming *)self->_userActionStream setDelegate:self];
    keyboardController = self->_keyboardController;
    id v8 = [(ACTUserActionStreaming *)self->_userActionStream errorGenerator];
    [v8 setKeyboardInfoDelgate:keyboardController];
  }
  MEMORY[0x270F9A758]();
}

- (void)tearDown
{
  char v3 = [(TIKeyboardTyper *)self keyboardController];
  [v3 tearDown];

  keyboardController = self->_keyboardController;
  self->_keyboardController = 0;
}

- (void)dealloc
{
  char v3 = [(TIKeyboardTyper *)self inputManager];
  [v3 suspend];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardTyper;
  [(TIKeyboardTyper *)&v4 dealloc];
}

- (TIKeyboardTyper)initWithInputMode:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardTyper;
  id v6 = [(TIKeyboardTyper *)&v16 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputMode, a3);
    id v8 = [[ACTKeyboardController alloc] initWithInputMode:v5];
    keyboardController = v7->_keyboardController;
    v7->_keyboardController = v8;

    double v10 = [v5 locale];
    uint64_t v11 = [v10 copy];
    locale = v7->_locale;
    v7->_locale = (NSLocale *)v11;

    v7->_maxPredictions = 3;
    v7->_unint64_t touchPathID = 1;
    uint64_t v13 = +[ACTUserActionStreamFactory userActionStreamWithParameters:&unk_26F2C9EF8 delegate:v7];
    userActionStream = v7->_userActionStream;
    v7->_userActionStream = (ACTUserActionStreaming *)v13;

    [(ACTUserActionStreaming *)v7->_userActionStream setDelegate:v7];
    [(TIKeyboardTyper *)v7 setClientIdentifier:@"testTyper"];
  }

  return v7;
}

- (TIKeyboardTyper)init
{
  return [(TIKeyboardTyper *)self initWithInputMode:0];
}

- (void)attemptToTapPredictionWithLiteral:(id)a3
{
  id v4 = [MEMORY[0x263F7E640] candidateWithUnchangedInput:a3];
  [(TIKeyboardTyper *)self acceptCandidateFromPredictionBar:v4];
}

- (BOOL)attemptToTapAutocorrectionWithString:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self autocorrection];
  id v6 = [(TIKeyboardTyper *)self autocorrection];
  int v7 = [v6 isAutocorrection];

  if (v7
    && ([v5 candidate],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqualToString:v4],
        v8,
        v9))
  {
    [(TIKeyboardTyper *)self acceptCandidateFromPredictionBar:v5];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)attemptToTapPredictionBarCandidateWithString:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(TIKeyboardTyper *)self predictionBarCandidates];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 candidate];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          [(TIKeyboardTyper *)self acceptCandidateFromPredictionBar:v10];
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)attemptToTapPredictionWithString:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(TIKeyboardTyper *)self predictions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 candidate];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          [(TIKeyboardTyper *)self acceptCandidateFromPredictionBar:v10];
          BOOL v13 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)acceptCandidateFromPredictionBar:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F7E648];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setString:@" "];
  [v6 setAcceptedCandidate:v5];

  [v6 setSynthesizedByAcceptingCandidate:1];
  [(TIKeyboardTyper *)self acceptCandidateInputEvent:v6 fromCandidateBar:1];
}

- (void)acceptCandidateInputEvent:(id)a3 fromCandidateBar:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(TIKeyboardTyper *)self keyboardController];
  [v7 acceptCandidateInputEvent:v6 fromCandidateBar:v4];
}

- (BOOL)hasPrediction:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  char v6 = [v5 hasPrediction:v4];

  return v6;
}

- (id)candidatesForString:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  char v6 = [v5 candidatesForString:v4];

  return v6;
}

- (void)generateAutocorrectionsWithShiftState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 generateAutocorrectionsWithShiftState:v3];
}

- (void)generateCandidates
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  [v2 generateAutocorrectionsOrCandidates];
}

- (void)setAutocorrectionList:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setAutocorrectionList:v4];
}

- (TIAutocorrectionList)autocorrectionList
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v3 = [v2 autocorrectionList];

  return (TIAutocorrectionList *)v3;
}

- (NSArray)predictions
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v3 = [v2 predictions];

  return (NSArray *)v3;
}

- (id)displayStringOverrideForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  char v6 = [v5 displayStringOverrideForKey:v4];

  return v6;
}

- (unint64_t)cursorLocationInMarkedText
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v3 = [v2 keyboardState];
  id v4 = [v3 documentState];
  unint64_t v5 = [v4 selectedRangeInMarkedText];

  return v5;
}

- (void)adjustPhraseBoundaryByOffset:(int64_t)a3 granularity:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    if ((int)a3 >= 0) {
      int v6 = a3;
    }
    else {
      int v6 = -(int)a3;
    }
    BOOL v7 = a3 >= 0;
    do
    {
      [(TIKeyboardTyper *)self adjustPhraseBoundaryInForwardDirection:v7 granularity:v4];
      --v6;
    }
    while (v6);
  }
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  BOOL v7 = [(TIKeyboardTyper *)self keyboardController];
  [v7 adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];

  id v8 = [(TIKeyboardTyper *)self keyboardController];
  [v8 generateAutocorrectionsOrCandidates];
}

- (void)adjustCursorByOffset:(int64_t)a3
{
  BOOL v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 adjustCursorByOffset:a3];

  id v6 = [(TIKeyboardTyper *)self keyboardController];
  [v6 generateAutocorrectionsOrCandidates];
}

- (void)commitText
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  [v2 commitText];
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 insertText:v4];
}

- (NSString)markedText
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v3 = [v2 markedText];

  return (NSString *)v3;
}

- (void)setSelectedRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = [(TIKeyboardTyper *)self keyboardController];
  objc_msgSend(v6, "setSelectedRange:", location, length);

  id v7 = [(TIKeyboardTyper *)self keyboardController];
  [v7 generateAutocorrectionsOrCandidates];
}

- (_NSRange)selectedRange
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v3 = [v2 selectedRange];
  NSUInteger v5 = v4;

  NSUInteger v6 = v3;
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (NSString)text
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  uint64_t v3 = [v2 text];

  return (NSString *)v3;
}

- (id)mapShiftedKeyToUnShiftedKeyExcludeCapitalization:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(TIKeyboardTyper *)self shiftedKeyToUnShiftedKeyExcludeCapitalizationMap];

  if (v5)
  {
    NSUInteger v6 = [(TIKeyboardTyper *)self shiftedKeyToUnShiftedKeyExcludeCapitalizationMap];
    NSUInteger v7 = [v6 objectForKey:v4];
  }
  else
  {
    NSUInteger v7 = 0;
  }

  return v7;
}

- (void)setInsertsSpaceAfterPredictiveInput:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setInsertsSpaceAfterPredictiveInput:v3];
}

- (BOOL)insertsSpaceAfterPredictiveInput
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 insertsSpaceAfterPredictiveInput];

  return v3;
}

- (void)setUsesTransliteration:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setUsesTransliteration:v3];
}

- (BOOL)usesTransliteration
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 usesTransliteration];

  return v3;
}

- (void)setLongPredictionListEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setLongPredictionListEnabled:v3];
}

- (BOOL)longPredictionListEnabled
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 longPredictionListEnabled];

  return v3;
}

- (void)setShouldSkipCandidateSelection:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(TIKeyboardTyper *)self acceptAutocorrection];
  }
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setShouldSkipCandidateSelection:v3];
}

- (BOOL)shouldSkipCandidateSelection
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 shouldSkipCandidateSelection];

  return v3;
}

- (void)setHardwareKeyboardMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setHardwareKeyboardMode:v3];
}

- (BOOL)hardwareKeyboardMode
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 hardwareKeyboardMode];

  return v3;
}

- (void)setInlineCompletionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setInlineCompletionEnabled:v3];
}

- (BOOL)inlineCompletionEnabled
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 inlineCompletionEnabled];

  return v3;
}

- (void)setWordLearningEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setWordLearningEnabled:v3];
}

- (BOOL)wordLearningEnabled
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 wordLearningEnabled];

  return v3;
}

- (void)setAutocapitalizationType:(unint64_t)a3
{
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setAutocapitalizationType:a3];
}

- (unint64_t)autocapitalizationType
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v3 = [v2 autocapitalizationType];

  return v3;
}

- (void)setUsesAutocapitalization:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setUsesAutocapitalization:v3];
}

- (BOOL)usesAutocapitalization
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 usesAutocapitalization];

  return v3;
}

- (void)setUsesPrediction:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setUsesPrediction:v3];
}

- (BOOL)usesPrediction
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 usesPrediction];

  return v3;
}

- (void)setAutocorrectionType:(unint64_t)a3
{
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setAutocorrectionType:a3];
}

- (unint64_t)autocorrectionType
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  unint64_t v3 = [v2 autocorrectionType];

  return v3;
}

- (void)setUsesAutocorrection:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setUsesAutocorrection:v3];
}

- (BOOL)usesAutocorrection
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 usesAutocorrection];

  return v3;
}

- (TIKeyboardInputManager)inputManager
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 inputManager];

  return (TIKeyboardInputManager *)v3;
}

- (void)setNextKeyIsMultitap:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setNextKeyIsMultitap:v3];
}

- (BOOL)nextKeyIsMultitap
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 nextKeyIsMultitap];

  return v3;
}

- (void)setInputContextHistory:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setInputContextHistory:v4];
}

- (TIInputContextHistory)inputContextHistory
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 inputContextHistory];

  return (TIInputContextHistory *)v3;
}

- (void)setRecipientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setRecipientIdentifier:v4];
}

- (NSString)recipientIdentifier
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 recipientIdentifier];

  return (NSString *)v3;
}

- (void)setClientIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setClientIdentifier:v4];
}

- (NSString)clientIdentifier
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 clientIdentifier];

  return (NSString *)v3;
}

- (BOOL)isAutoshifted
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 isAutoshifted];

  return v3;
}

- (BOOL)isShifted
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 isShifted];

  return v3;
}

- (void)setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap
{
  char v3 = [(TIKeyboardTyper *)self inputMode];
  id v4 = [v3 languageWithRegion];
  char v5 = [v4 isEqualToString:@"th_TH"];

  if ((v5 & 1) == 0)
  {
    NSUInteger v6 = [(TIKeyboardTyper *)self keyboard];
    NSUInteger v7 = [(TIKeyboardTyper *)self keyplane];
    id v8 = [v7 shiftAlternateKeyplaneName];
    id v40 = [v6 subtreeWithName:v8];

    int v9 = [v40 name];
    BOOL v10 = [(TIKeyboardTyper *)self keyplane];
    uint64_t v11 = [v10 name];
    char v12 = [v9 isEqualToString:v11];

    if ((v12 & 1) == 0)
    {
      id v36 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      BOOL v13 = [v40 keys];
      if ([v13 count])
      {
        uint64_t v14 = 0;
        while (1)
        {
          long long v15 = [v13 objectAtIndex:v14];
          [v15 paddedFrame];
          CGFloat x = v42.origin.x;
          CGFloat y = v42.origin.y;
          CGFloat width = v42.size.width;
          CGFloat height = v42.size.height;
          double MidX = CGRectGetMidX(v42);
          v43.origin.CGFloat x = x;
          v43.origin.CGFloat y = y;
          v43.size.CGFloat width = width;
          v43.size.CGFloat height = height;
          double MidY = CGRectGetMidY(v43);
          id v22 = [(TIKeyboardTyper *)self keyplane];
          id v23 = -[TIKeyboardTyper keyContainingPoint:inKeyplane:](self, "keyContainingPoint:inKeyplane:", v22, MidX, MidY);

          if (!v23) {
            goto LABEL_16;
          }
          [v23 paddedFrame];
          CGFloat v24 = v44.origin.x;
          CGFloat v25 = v44.origin.y;
          CGFloat v26 = v44.size.width;
          CGFloat v27 = v44.size.height;
          double v28 = CGRectGetMidX(v44);
          v45.origin.CGFloat x = v24;
          v45.origin.CGFloat y = v25;
          v45.size.CGFloat width = v26;
          v45.size.CGFloat height = v27;
          double v29 = CGRectGetMidY(v45);
          if (v28 != MidX || v29 != MidY) {
            goto LABEL_16;
          }
          BOOL v31 = objc_msgSend(v23, "representedString", v29);
          int v32 = [v15 representedString];
          if ([v31 isEqualToString:v32]) {
            break;
          }
          double v38 = [v23 representedString];
          CGRect v39 = [(TIKeyboardTyper *)self inputMode];
          id v33 = [v39 locale];
          id v34 = [v38 uppercaseStringWithLocale:v33];
          double v35 = [v15 representedString];
          char v37 = [v34 isEqualToString:v35];

          if ((v37 & 1) == 0)
          {
            BOOL v31 = [v15 representedString];
            [v36 setValue:v23 forKey:v31];
            goto LABEL_15;
          }
LABEL_16:

          if (++v14 >= (unint64_t)[v13 count]) {
            goto LABEL_17;
          }
        }

LABEL_15:
        goto LABEL_16;
      }
LABEL_17:
      if ([v36 count]) {
        [(TIKeyboardTyper *)self setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap:v36];
      }
    }
  }
}

- (void)setKeyboard:(id)a3
{
  id v4 = a3;
  char v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setKeyboard:v4];

  [(TIKeyboardTyper *)self setShiftedKeyToUnShiftedKeyExcludeCapitalizationMap];
}

- (void)setAsyncPredictions:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardTyper *)self keyboardController];
  [v4 setAsyncPredictions:v3];
}

- (BOOL)asyncPredictions
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 asyncPredictions];

  return v3;
}

- (void)setInputModeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setInputModeIdentifier:v4];
}

- (NSString)inputModeIdentifier
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 inputModeIdentifier];

  return (NSString *)v3;
}

- (void)setKeyboardInputManagerFactory:(id)a3
{
  id v4 = a3;
  id v5 = [(TIKeyboardTyper *)self keyboardController];
  [v5 setKeyboardInputManagerFactory:v4];
}

- (TIKeyboardInputManagerFactory)keyboardInputManagerFactory
{
  id v2 = [(TIKeyboardTyper *)self keyboardController];
  char v3 = [v2 keyboardInputManagerFactory];

  return (TIKeyboardInputManagerFactory *)v3;
}

@end