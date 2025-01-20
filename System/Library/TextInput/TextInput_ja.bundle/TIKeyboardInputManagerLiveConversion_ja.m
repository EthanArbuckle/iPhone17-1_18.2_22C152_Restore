@interface TIKeyboardInputManagerLiveConversion_ja
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)autoSelectFirstCandidate;
- (BOOL)conversionEnabled;
- (BOOL)delayedCandidateList;
- (BOOL)inSearchField;
- (BOOL)makeCandidatesWithWordSearch:(id)a3;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)shouldCancelLiveConversionOnBackspace;
- (BOOL)shouldClearInputOnMarkedTextOutOfSync;
- (BOOL)shouldCommitHeadSegment;
- (BOOL)shouldShowPredictionCandidate:(id)a3;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSArray)committedSegments;
- (NSArray)segments;
- (NSArray)segmentsForPicker;
- (NSString)committedSurface;
- (NSString)currentDictionaryReading;
- (NSString)displayStringForSearch;
- (NSString)inputStringForHiraganaMode;
- (NSString)rawInputStringForPrediction;
- (NSTimer)timer;
- (TIKeyboardCandidate)currentCandidate;
- (TIKeyboardCandidate)remainingCandidate;
- (TIKeyboardCandidate)topCandidate;
- (TIKeyboardInputManagerLiveConversion_ja)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TISmartPunctuationController)smartPunctuationController;
- (_NSRange)analysisStringRange;
- (double)predictionThreshold;
- (id)candidateResultSet;
- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4;
- (id)didAcceptCandidate:(id)a3;
- (id)handleKeyboardInput:(id)a3;
- (id)hiraganaStringFor:(id)a3;
- (id)inputString;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)markedText;
- (id)rawInputString;
- (id)rawInputStringForAutoCommit;
- (id)rawInputStringFrom:(id)a3;
- (id)segmentAdjustInputManager:(unint64_t)a3;
- (id)stringByConvertingPunctuationForInput:(id)a3 isLockedInput:(BOOL)a4;
- (id)syncKeyboardStateHandler;
- (id)validCharacterSetForAutocorrection;
- (id)wordCharacters;
- (id)wordSearch;
- (int64_t)transliterationType;
- (unint64_t)candidateBehavior;
- (unint64_t)candidateOffset;
- (unint64_t)preferCandidateBehavior;
- (unint64_t)segmentIndex;
- (unsigned)inputCount;
- (void)_cancelCandidatesThread;
- (void)_deleteFromInput;
- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)_selectPartialCandidate:(id)a3 forOperation:(id)a4;
- (void)addInlineCandidateIfNeeded:(id)a3;
- (void)clearInput;
- (void)commitComposition;
- (void)commitCurrentCandidate;
- (void)commitCurrentCandidate:(BOOL)a3;
- (void)deleteFromInputWithContext:(id)a3;
- (void)initImplementation;
- (void)inputLocationChanged;
- (void)invokeEditMode;
- (void)loadDictionaries;
- (void)loadFavoniusTypingModel;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)preferencesDidChange:(id)a3;
- (void)pushCandidateGenerationContextWithResults:(id)a3;
- (void)selectPartialCandidate:(id)a3;
- (void)setAutoSelectFirstCandidate:(BOOL)a3;
- (void)setCandidateBehavior:(unint64_t)a3;
- (void)setCommittedSegments:(id)a3;
- (void)setCurrentCandidate:(id)a3;
- (void)setCurrentDictionaryReading:(id)a3;
- (void)setInput:(id)a3;
- (void)setPredictionThreshold:(double)a3;
- (void)setRemainingCandidate:(id)a3;
- (void)setSegmentIndex:(unint64_t)a3;
- (void)setSegments:(id)a3;
- (void)setSyncKeyboardStateHandler:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTopCandidate:(id)a3;
- (void)setTransliterationType:(int64_t)a3;
- (void)startPrediction;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
@end

@implementation TIKeyboardInputManagerLiveConversion_ja

- (TIKeyboardInputManagerLiveConversion_ja)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  v4 = [(TIKeyboardInputManagerMecabra *)&v16 initWithConfig:a3 keyboardState:a4];
  v5 = v4;
  if (v4)
  {
    [(TIKeyboardInputManagerLiveConversion_ja *)v4 setSegmentIndex:0x7FFFFFFFFFFFFFFFLL];
    v6 = [MEMORY[0x263EFF8C0] array];
    [(TIKeyboardInputManagerLiveConversion_ja *)v5 setCommittedSegments:v6];

    v7 = (TISmartPunctuationController *)objc_alloc_init(MEMORY[0x263F7E6D0]);
    smartPunctuationController = v5->_smartPunctuationController;
    v5->_smartPunctuationController = v7;

    v9 = [(TIKeyboardInputManagerLiveConversion_ja *)v5 smartPunctuationController];
    [v9 setAutoQuoteType:1];

    v10 = [(TIKeyboardInputManagerLiveConversion_ja *)v5 smartPunctuationController];
    [v10 setSmartDashesEnabled:0];

    v11 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
    v12 = [v11 valueForPreferenceKey:*MEMORY[0x263F7E850]];
    [v12 floatValue];
    v5->_predictionThreshold = v13;

    [(TIKeyboardInputManagerLiveConversion_ja *)v5 setCandidateBehavior:[(TIKeyboardInputManagerLiveConversion_ja *)v5 preferCandidateBehavior]];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v5 selector:sel_preferencesDidChange_ name:*MEMORY[0x263F7E858] object:0];

    [(TIKeyboardInputManagerLiveConversion_ja *)v5 preferencesDidChange:0];
    TIInputManager::sync_with_input_from_UI(*(TIInputManager **)((char *)&v5->super.super.super.super.super.isa
                                                               + (int)*MEMORY[0x263F7EB98]));
  }
  return v5;
}

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (id)keyEventMap
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E580]);
  return v2;
}

- (void)loadDictionaries
{
  v3 = [MEMORY[0x263F7EB70] sharedWordSearchController];
  v4 = [(TIKeyboardInputManagerBase *)self inputMode];
  v5 = [v3 wordSearchForInputMode:v4];
  wordSearch = self->_wordSearch;
  self->_wordSearch = v5;

  id v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  [v7 setInsertKatakanaAtIndex:4];
}

- (void)loadFavoniusTypingModel
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  v3 = *(std::__shared_weak_count **)(v2 + 240);
  *(void *)(v2 + 232) = 0;
  *(void *)(v2 + 240) = 0;
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v3);
  }
}

- (BOOL)usesCandidateSelection
{
  uint64_t v2 = [(TIKeyboardInputManagerLiveConversion_ja *)self keyboardState];
  char v3 = [v2 suppressingCandidateSelection] ^ 1;

  return v3;
}

- (void)preferencesDidChange:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F7E6C8], "sharedPreferencesController", a3);
  uint64_t v5 = [v4 BOOLForPreferenceKey:*MEMORY[0x263F7E878]];
  v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self smartPunctuationController];
  [v6 setSmartQuotesEnabled:v5];

  id v9 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v7 = [v9 BOOLForPreferenceKey:*MEMORY[0x263F7E868]];
  v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self smartPunctuationController];
  [v8 setSmartDashesEnabled:v7];
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] romajiWordCharacters];
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5E8]);
  return v2;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  if (TICanLogMessageAtLevel())
  {
    uint64_t v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManagerLiveConversion_ja handleKeyboardInput:](v5);
    }
  }
  uint64_t v6 = [v4 acceptedCandidate];
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

    if (v8) {
      goto LABEL_12;
    }
  }
  if (([v4 isExpandSegment] & 1) != 0 || objc_msgSend(v4, "isShrinkSegment"))
  {
    uint64_t v9 = [v4 isExpandSegment];
    if ((v9 & 1) != 0 || [v4 isShrinkSegment]) {
      [(TIKeyboardInputManagerLiveConversion_ja *)self _adjustPhraseBoundaryInForwardDirection:v9 granularity:1];
    }
    goto LABEL_12;
  }
  v12 = [v4 string];
  if ([v12 isEqualToString:@"\n"])
  {

LABEL_19:
    v15 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    uint64_t v16 = [v15 length];

    id v17 = objc_alloc_init(MEMORY[0x263F7E678]);
    v18 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];

    if (v18)
    {
      v19 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
      [v17 insertText:v19];
    }
    v20 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
    v21 = [v20 candidate];

    if (v21)
    {
      v22 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
      v23 = [v22 candidate];
      [v17 insertText:v23];
    }
    [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
    if (v16) {
      v24 = v17;
    }
    else {
      v24 = 0;
    }
    id v10 = v24;
LABEL_27:

    goto LABEL_13;
  }
  float v13 = [v4 string];
  int v14 = [v13 isEqualToString:@"\r"];

  if (v14) {
    goto LABEL_19;
  }
  v25 = [v4 string];
  if ([v25 isEqualToString:@" "])
  {

    goto LABEL_31;
  }
  v26 = [v4 string];
  int v27 = [v26 isEqualToString:@"　"];

  if (!v27)
  {
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCandidateBehavior:[(TIKeyboardInputManagerLiveConversion_ja *)self preferCandidateBehavior]];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setAutoSelectFirstCandidate:0];
    v29 = [v4 string];
    int v30 = [v29 isEqualToString:@"\x1B"];

    if (([v4 isBackspace] & 1) == 0 && !v30) {
      goto LABEL_35;
    }
    v35 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    id v10 = [v35 handleKeyboardInput:v4];

    v36 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

    if (!v36)
    {
      if (v30)
      {
        v37 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
        [(TIKeyboardInputManagerLiveConversion_ja *)self commitCurrentCandidate:v37 != 0];
      }
      else
      {
        [(TIKeyboardInputManagerLiveConversion_ja *)self commitCurrentCandidate:0];
      }
      if (![v4 isBackspace]
        || [(TIKeyboardInputManagerLiveConversion_ja *)self shouldCancelLiveConversionOnBackspace])
      {
        v38 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentsForPicker];
        uint64_t v39 = [v38 count];

        if (v39)
        {
          [(TIKeyboardInputManagerLiveConversion_ja *)self invokeEditMode];
          v40 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
          uint64_t v41 = [v40 handleKeyboardInput:v4];

          id v10 = (id)v41;
        }
      }
    }
    if (v10)
    {
      id v42 = v10;
    }
    else
    {
      if ([(TIKeyboardInputManagerLiveConversion_ja *)self inputCount])
      {
LABEL_35:
        -[TIKeyboardInputManagerLiveConversion_ja setTransliterationType:](self, "setTransliterationType:", [v4 transliterationType]);
        if ([v4 transliterationType])
        {
          [(TIKeyboardInputManagerLiveConversion_ja *)self setCandidateBehavior:2];
          [(TIKeyboardInputManagerLiveConversion_ja *)self setAutoSelectFirstCandidate:1];
          v31 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
          v32 = [v31 handleKeyboardInput:v4];
          v33 = v32;
          if (v32) {
            id v34 = v32;
          }
          else {
            id v34 = objc_alloc_init(MEMORY[0x263F7E678]);
          }
          id v10 = v34;

          goto LABEL_13;
        }
        [(TIKeyboardInputManagerLiveConversion_ja *)self commitCurrentCandidate];
        [(TIKeyboardInputManagerLiveConversion_ja *)self setTopCandidate:0];
        v43.receiver = self;
        v43.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
        id v10 = [(TIKeyboardInputManagerMecabra *)&v43 handleKeyboardInput:v4];
        id v17 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
        [(TIKeyboardInputManagerLiveConversion_ja *)self makeCandidatesWithWordSearch:v17];
        goto LABEL_27;
      }
      [(TIKeyboardInputManagerMecabra *)self completeComposition];
    }

    goto LABEL_13;
  }
LABEL_31:
  v28 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v10 = [v28 handleKeyboardInput:v4];

  if (!v10)
  {
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCandidateBehavior:2];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setAutoSelectFirstCandidate:1];
LABEL_12:
    id v10 = objc_alloc_init(MEMORY[0x263F7E678]);
  }
LABEL_13:

  return v10;
}

- (unsigned)inputCount
{
  id v2 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (id)inputString
{
  if ([(TIKeyboardInputManagerLiveConversion_ja *)self candidateBehavior] == 1
    && ![(TIKeyboardInputManagerLiveConversion_ja *)self conversionEnabled])
  {
    v12 = [(TIKeyboardInputManagerLiveConversion_ja *)self displayStringForSearch];
  }
  else
  {
    unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
    id v4 = [v3 candidate];

    if (v4)
    {
      uint64_t v5 = NSString;
      uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
      uint64_t v7 = [v6 candidate];
      v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self remainingCandidate];
      uint64_t v9 = [v8 candidate];
      id v10 = (void *)v9;
      v11 = &stru_26F5DD710;
      if (v9) {
        v11 = (__CFString *)v9;
      }
      v12 = [v5 stringWithFormat:@"%@%@", v7, v11];

LABEL_7:
      goto LABEL_17;
    }
    uint64_t v13 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
    if (v13)
    {
      int v14 = (void *)v13;
      v15 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];

      if (v15)
      {
        uint64_t v16 = NSString;
        uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
        uint64_t v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
        uint64_t v17 = [v7 candidate];
        v8 = (void *)v17;
        v18 = &stru_26F5DD710;
        if (v17) {
          v18 = (__CFString *)v17;
        }
        v12 = [v16 stringWithFormat:@"%@%@", v6, v18];
        goto LABEL_7;
      }
    }
    v19 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
    uint64_t v20 = [v19 count];

    if (v20)
    {
      v21 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
      v22 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
      v12 = objc_msgSend(v21, "_surfaceStringWithin:", 0, objc_msgSend(v22, "count"));
    }
    else
    {
      v12 = 0;
    }
  }
LABEL_17:
  return v12;
}

- (NSString)inputStringForHiraganaMode
{
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentDictionaryReading];

  if (v3)
  {
    id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringForAutoCommit];
    uint64_t v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentDictionaryReading];
    uint64_t v6 = [v4 stringByAppendingString:v5];
  }
  else
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
  }
  uint64_t v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
  v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
  objc_msgSend(v7, "_readingStringWithin:", 0, objc_msgSend(v8, "count"));
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (!v9) {
    uint64_t v9 = &stru_26F5DD710;
  }
  v11 = [(__CFString *)v9 stringByAppendingString:v6];

  return (NSString *)v11;
}

- (NSString)displayStringForSearch
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TIKeyboardInputManagerLiveConversion_ja.mm", 294, @"%s must be overridden in subclass", "-[TIKeyboardInputManagerLiveConversion_ja displayStringForSearch]");

  return 0;
}

- (unint64_t)candidateOffset
{
  unsigned int v3 = (void *)MEMORY[0x263F7EB10];
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  id v10 = 0;
  [v3 splitSegments:v4 at:2 forPrefix:&v10 forSuffix:0];
  id v5 = v10;

  uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
  uint64_t v7 = [v6 length];
  uint64_t v8 = [v5 length];

  if (v8 + v7) {
    return v8 + v7;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManagerLiveConversion_ja *)self _cancelCandidatesThread];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setSegments:MEMORY[0x263EFFA68]];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v5 setInput:v4];
}

- (id)markedText
{
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputString];
  unsigned int v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputIndex];
  uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self searchStringForMarkedText];
  unint64_t v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self candidateOffset];
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  uint64_t v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self lastInputString];
  id v10 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];

  if (!v10)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0, objc_msgSend(v4, "length"));
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    [v8 addObject:v16];

    goto LABEL_11;
  }
  v11 = [(TIKeyboardInputManagerLiveConversion_ja *)self remainingCandidate];
  v12 = [v11 candidate];
  uint64_t v13 = [v12 length];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0, v7);
    [v8 addObject:v14];
  }
  if (v13 < 1) {
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v15 = [v8 count];
  }
  uint64_t v17 = (void *)MEMORY[0x263F08D40];
  [v4 length];
  v18 = objc_msgSend(v17, "valueWithRange:");
  [v8 addObject:v18];

  if (v13 >= 1)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", objc_msgSend(v4, "length") - v13, v13);
    goto LABEL_10;
  }
LABEL_11:
  v19 = (void *)MEMORY[0x263F7E658];
  uint64_t v20 = (void *)[v8 copy];
  v21 = [v19 intermediateTextWithInputString:v3 displayString:v4 selectionLocation:v5 searchString:v6 candidateOffset:v7 liveConversionSegments:v20 highlightSegmentIndex:v15 lastInputString:v9];

  return v21;
}

- (id)rawInputString
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  id v2 = [(TIKeyboardInputManagerLiveConversion_ja *)&v4 inputString];
  return v2;
}

- (id)rawInputStringForAutoCommit
{
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  unint64_t v4 = [v3 count];

  if (v4 >= 3)
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
    unint64_t v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
    objc_msgSend(v6, "_readingStringWithin:", 0, objc_msgSend(v7, "count") - 2);
    unsigned int v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned int v5 = &stru_26F5DD710;
  }
  return v5;
}

- (NSString)rawInputStringForPrediction
{
  id v2 = (void *)MEMORY[0x263F7EB10];
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  id v6 = 0;
  [v2 splitSegments:v3 at:2 forPrefix:0 forSuffix:&v6];
  id v4 = v6;

  return (NSString *)v4;
}

- (void)clearInput
{
  [(TIKeyboardInputManagerLiveConversion_ja *)self _cancelCandidatesThread];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setCurrentCandidate:0];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setCurrentDictionaryReading:0];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setTopCandidate:0];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setSegmentIndex:0x7FFFFFFFFFFFFFFFLL];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setRemainingCandidate:0];
  unsigned int v3 = [MEMORY[0x263EFF8C0] array];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setSegments:v3];

  id v4 = [MEMORY[0x263EFF8C0] array];
  [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v4];

  unsigned int v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self timer];
  [v5 invalidate];

  [(TIKeyboardInputManagerLiveConversion_ja *)self setTimer:0];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerMecabra *)&v6 clearInput];
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  unsigned int v3 = +[TIWordSearch sharedOperationQueue];
  if ([v3 operationCount])
  {
    char isKindOfClass = 0;
  }
  else
  {
    unsigned int v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (BOOL)inSearchField
{
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self keyboardState];
  id v4 = [v3 textInputTraits];
  if ([v4 returnKeyType] == 6)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_super v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self keyboardState];
    unint64_t v7 = [v6 textInputTraits];
    if ([v7 keyboardType] == 10)
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self keyboardState];
      uint64_t v9 = [v8 textInputTraits];
      BOOL v5 = [v9 keyboardType] == 18;
    }
  }

  return v5;
}

- (BOOL)conversionEnabled
{
  if (![(TIKeyboardInputManagerLiveConversion_ja *)self inSearchField]) {
    return 1;
  }
  id v2 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  char v3 = [v2 BOOLForPreferenceKey:*MEMORY[0x263F7E720]];

  return v3;
}

- (BOOL)shouldCommitHeadSegment
{
  char v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
  uint64_t v4 = [v3 count];
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  BOOL v6 = (unint64_t)([v5 count] + v4) >= 5
    && [(TIKeyboardInputManagerLiveConversion_ja *)self conversionEnabled];

  return v6;
}

- (BOOL)shouldCancelLiveConversionOnBackspace
{
  char v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  uint64_t v4 = [v3 count];

  if (v4 < 2) {
    return 1;
  }
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  BOOL v6 = [v5 objectAtIndexedSubscript:v4 - 1];
  unint64_t v7 = [v6 surface];
  BOOL v8 = [v7 length] != 1;

  return v8;
}

- (unint64_t)preferCandidateBehavior
{
  return [(TIKeyboardInputManagerLiveConversion_ja *)self inSearchField];
}

- (void)invokeEditMode
{
  char v3 = [TIKeyboardInputManager_ja_Edit alloc];
  id v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self config];
  uint64_t v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self keyboardState];
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentsForPicker];
  BOOL v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  objc_opt_class();
  unint64_t v7 = [(TIKeyboardInputManager_ja_Edit *)v3 initWithConfig:v8 keyboardState:v4 segments:v5 wordSearch:v6 romajiMode:objc_opt_isKindOfClass() & 1 conversionEnabled:[(TIKeyboardInputManagerLiveConversion_ja *)self conversionEnabled]];
  [(TIKeyboardInputManagerMecabra *)self composeTextWith:v7];
}

- (id)stringByConvertingPunctuationForInput:(id)a3 isLockedInput:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unint64_t v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self smartPunctuationController];
  id v8 = [v7 smartPunctuationOutputForInput:v6 isLockedInput:v4 documentState:0];

  uint64_t v9 = [v8 insertionText];

  if (v9)
  {
    id v10 = [v8 insertionText];
  }
  else
  {
    id v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (_NSRange)analysisStringRange
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_ja *)&v8 inputIndex];
  if (v3)
  {
    uint64_t v4 = v3;
  }
  else
  {
    BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    uint64_t v4 = [v5 length];
  }
  NSUInteger v6 = 0;
  NSUInteger v7 = v4;
  result.length = v7;
  result.location = v6;
  return result;
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)-[TIKeyboardInputManagerLiveConversion_ja validCharacterSetForAutocorrection]::__validCharSet;
  return v2;
}

- (void)inputLocationChanged
{
  [(TIKeyboardInputManagerLiveConversion_ja *)self _cancelCandidatesThread];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v3 inputLocationChanged];
}

- (void)_deleteFromInput
{
  [(TIKeyboardInputManagerLiveConversion_ja *)self _cancelCandidatesThread];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  id v3 = [(TIKeyboardInputManagerLiveConversion_ja *)&v4 deleteFromInput:0];
}

- (void)deleteFromInputWithContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerMecabra *)&v3 deleteFromInputWithContext:a3];
}

- (void)selectPartialCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringForPrediction];
  NSUInteger v6 = [v4 input];

  objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length"));
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  NSUInteger v7 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  objc_super v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  uint64_t v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self contextBeforeWithDesiredLength:20];
  id v10 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
  BYTE2(v15) = 1;
  LOWORD(v15) = 0;
  LOBYTE(v14) = 1;
  v11 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v7, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v8, v16, 0, v9, 0x7FFFFFFFFFFFFFFFLL, 1, v14, 0, self, sel__selectPartialCandidate_forOperation_, v10, v15, 0);

  [(TIWordSearchJapaneseOperationGetCandidates *)v11 setReferenceMode:1];
  [(TIWordSearchJapaneseOperationGetCandidates *)v11 setSinglePhrase:1];
  v12 = [(TIWordSearchJapaneseOperationGetCandidates *)v11 results];

  if (v12)
  {
    uint64_t v13 = [(TIWordSearchJapaneseOperationGetCandidates *)v11 results];
    [(TIKeyboardInputManagerLiveConversion_ja *)self _selectPartialCandidate:v13 forOperation:v11];
  }
  else
  {
    uint64_t v13 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
    [v13 performOperationAsync:v11];
  }
}

- (void)_selectPartialCandidate:(id)a3 forOperation:(id)a4
{
  BOOL v5 = [a3 candidates];
  id obj = [v5 firstObject];

  if (obj)
  {
    NSUInteger v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
    unint64_t v7 = [v6 count];

    if (v7 < 3)
    {
      v11 = [MEMORY[0x263EFF980] array];
    }
    else
    {
      objc_super v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
      uint64_t v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
      id v10 = objc_msgSend(v8, "subarrayWithRange:", 0, objc_msgSend(v9, "count") - 2);
      v11 = (void *)[v10 mutableCopy];
    }
    id v12 = objc_alloc_init(MEMORY[0x263F7EB10]);
    uint64_t v13 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
    uint64_t v14 = [v13 input];
    [v12 setReading:v14];

    uint64_t v15 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
    id v16 = [v15 label];
    [v12 setSurface:v16];

    [v11 addObject:v12];
    id v17 = objc_alloc_init(MEMORY[0x263F7EB10]);
    v18 = [obj input];
    [v17 setReading:v18];

    v19 = [obj candidate];
    [v17 setSurface:v19];

    [v11 addObject:v17];
    uint64_t v20 = (NSArray *)[v11 copy];
    segments = self->_segments;
    self->_segments = v20;

    objc_storeStrong((id *)&self->_remainingCandidate, obj);
    if (self->_syncKeyboardStateHandler)
    {
      v22 = [(TIKeyboardInputManagerLiveConversion_ja *)self syncKeyboardStateHandler];
      v23 = [(TIKeyboardInputManagerMecabra *)self keyboardConfiguration];
      ((void (**)(void, void *))v22)[2](v22, v23);

      id syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
      self->_id syncKeyboardStateHandler = 0;
    }
  }
}

- (id)candidateResultSet
{
  if ([(TIKeyboardInputManagerLiveConversion_ja *)self shouldSkipCandidateSelection])
  {
    objc_super v3 = 0;
  }
  else
  {
    id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
    if ([v4 length])
    {
      objc_super v3 = [MEMORY[0x263F7E638] dummySet];
    }
    else
    {
      objc_super v3 = 0;
    }
  }
  return v3;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self timer];
  [v5 invalidate];

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v10 openCandidateGenerationContextWithCandidateHandler:v4];

  if ([(TIKeyboardInputManagerLiveConversion_ja *)self candidateBehavior] != 1)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __94__TIKeyboardInputManagerLiveConversion_ja_openCandidateGenerationContextWithCandidateHandler___block_invoke;
    v9[3] = &unk_2650FA7D8;
    v9[4] = self;
    NSUInteger v6 = (void (**)(void, void))MEMORY[0x24563C640](v9);
    if ([(TIKeyboardInputManagerLiveConversion_ja *)self candidateBehavior] == 2
      || [(TIKeyboardInputManagerLiveConversion_ja *)self transliterationType]
      || [(TIKeyboardInputManagerLiveConversion_ja *)self autoSelectFirstCandidate])
    {
      v6[2](v6, 0);
    }
    else
    {
      unint64_t v7 = (void *)MEMORY[0x263EFFA20];
      [(TIKeyboardInputManagerLiveConversion_ja *)self predictionThreshold];
      objc_super v8 = objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
      [(TIKeyboardInputManagerLiveConversion_ja *)self setTimer:v8];
    }
  }
}

- (void)pushCandidateGenerationContextWithResults:(id)a3
{
  id v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  BOOL v5 = [(TIKeyboardInputManagerMecabra *)self candidateResultSetFromWordSearchCandidateResultSet:v4];

  NSUInteger v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self markedText];
  [v5 setUncommittedText:v6];

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerLiveConversion_ja *)&v7 pushCandidateGenerationContextWithResults:v5];
}

- (id)candidateResultSetFromCandidates:(id)a3 proactiveTriggers:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)&v6 candidateResultSetFromCandidates:MEMORY[0x263EFFA68] proactiveTriggers:a4];
  return v4;
}

- (BOOL)makeCandidatesWithWordSearch:(id)a3
{
  id v4 = a3;
  BOOL v5 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  objc_super v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  objc_super v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self contextBeforeWithDesiredLength:20];
  objc_super v8 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
  BYTE2(v15) = 1;
  LOWORD(v15) = 0;
  LOBYTE(v14) = 1;
  uint64_t v9 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v5, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v6, v4, 0, v7, 0x7FFFFFFFFFFFFFFFLL, 1, v14, 0, 0, 0, v8, v15, 0);

  [(TIWordSearchJapaneseOperationGetCandidates *)v9 setAllowIncompleteRomaji:1];
  [(TIWordSearchJapaneseOperationGetCandidates *)v9 setReferenceMode:1];
  objc_super v10 = [(TIWordSearchJapaneseOperationGetCandidates *)v9 results];

  if (!v10)
  {
    v11 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
    [v11 performOperationAsync:v9];

    [(TIWordSearchJapaneseOperationGetCandidates *)v9 waitUntilFinished];
  }
  id v12 = [(TIWordSearchJapaneseOperationGetCandidates *)v9 results];
  [(TIKeyboardInputManagerLiveConversion_ja *)self _notifyUpdateCandidates:v12 forOperation:v9];

  return 0;
}

- (void)_cancelCandidatesThread
{
  id v2 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  [v2 cancel];
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v10 = a3;
  if (-[TIKeyboardInputManagerLiveConversion_ja shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection")|| ([v10 candidates], BOOL v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "count"), v5, !v6))
  {
    objc_super v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v8 cancelComposition];
  }
  else
  {
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v10];
    objc_super v7 = [v10 candidates];
    objc_super v8 = [v7 firstObject];

    [(TIKeyboardInputManagerLiveConversion_ja *)self setTopCandidate:v8];
    uint64_t v9 = [(TIKeyboardInputManagerMecabra *)self segmentsFromCandidate:v8 phraseBoundary:1];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setSegments:v9];

    [(TIKeyboardInputManagerLiveConversion_ja *)self setMarkedText];
  }
}

- (void)startPrediction
{
  objc_super v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputString];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x263F7EB10];
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
    id v18 = 0;
    id v19 = 0;
    [v5 splitSegments:v6 at:2 forPrefix:&v19 forSuffix:&v18];
    objc_super v7 = (__CFString *)v19;
    id v8 = v18;

    uint64_t v9 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
      objc_msgSend(v11, "setAutoSelectFirstCandidate:", -[TIKeyboardInputManagerLiveConversion_ja autoSelectFirstCandidate](self, "autoSelectFirstCandidate"));
      objc_msgSend(v11, "setAutoSelectTransliterateCandidate:", -[TIKeyboardInputManagerLiveConversion_ja transliterationType](self, "transliterationType"));
      objc_msgSend(v11, "setShowsPartialCandidate:", -[TIKeyboardInputManagerLiveConversion_ja inSearchField](self, "inSearchField"));
      id v12 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
      uint64_t v13 = v12;
      if (v7) {
        uint64_t v14 = v7;
      }
      else {
        uint64_t v14 = &stru_26F5DD710;
      }
      uint64_t v15 = [v12 stringByAppendingString:v14];
      id v16 = [(TIKeyboardInputManagerLiveConversion_ja *)self contextBeforeWithDesiredLength:20];
      id v17 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      [v11 makeCandidatesWithInputString:v8 autoCommitString:v15 contextString:v16 predictionEnabled:1 reanalysisMode:0 singlePhrase:0 geometoryModelData:v17];
    }
  }
}

- (id)didAcceptCandidate:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringForPrediction];
  unint64_t v6 = [v5 length];
  objc_super v7 = [v4 input];
  if (v6 <= [v7 length])
  {
    char v8 = 0;
  }
  else
  {
    objc_opt_class();
    char v8 = objc_opt_isKindOfClass() ^ 1;
  }

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 136315394;
    v26 = "-[TIKeyboardInputManagerLiveConversion_ja didAcceptCandidate:]";
    __int16 v27 = 1024;
    int v28 = v8 & 1;
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  candidate is partial: %d", (uint8_t *)&v25, 0x12u);
  }
  uint64_t v9 = [v4 candidate];
  if ([v9 length])
  {
    int v10 = [(TIKeyboardInputManagerLiveConversion_ja *)self isTypologyEnabled];

    if (v10) {
      [(TIKeyboardInputManagerMecabra *)self logCommittedCandidate:v4 partial:v8 & 1];
    }
  }
  else
  {
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:v8 & 1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v13 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
      uint64_t v14 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v13];

      uint64_t v15 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
      [v15 performAccept:v14 isPartial:0];
    }
  }
  if ((v8 & 1) != 0
    || ([(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager],
        id v16 = objc_claimAutoreleasedReturnValue(),
        v16,
        v16))
  {
    [(TIKeyboardInputManagerMecabra *)self savePartialGeometryData];
    id v17 = [v4 input];
    unint64_t v18 = [v17 length];
    unint64_t v19 = [v5 length];

    if (v18 < v19)
    {
      uint64_t v20 = [v4 input];
      v21 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v20, "length"));
      [(TIKeyboardInputManagerMecabra *)self setRemainingInput:v21];
    }
    v22 = &stru_26F5DD710;
  }
  else
  {
    [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
    v24 = [MEMORY[0x263EFF8C0] array];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v24];

    [(TIKeyboardInputManagerMecabra *)self completeComposition];
    v22 = 0;
  }

  return v22;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  if ([(TIKeyboardInputManagerMecabra *)&v20 syncToKeyboardState:v6 completionHandler:v7])
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v9 = [v6 currentCandidate];
    if (!v9) {
      goto LABEL_7;
    }
    int v10 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringForPrediction];
    unint64_t v11 = [v10 length];
    id v12 = [v9 input];
    unint64_t v13 = [v12 length];

    if (v11 <= v13) {
      goto LABEL_7;
    }
    uint64_t v14 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v16 = (void *)MEMORY[0x24563C640](v7);
      id syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
      self->_id syncKeyboardStateHandler = v16;

      v19.receiver = self;
      v19.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
      [(TIKeyboardInputManagerBase *)&v19 syncToKeyboardState:v6];
      BOOL v8 = 1;
    }
    else
    {
LABEL_7:
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerMecabra *)&v26 syncToKeyboardState:v8 from:v9 afterContextChange:v5];
  int v10 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v12 = [v8 currentCandidate];
    if (v12
      && ([(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate],
          unint64_t v13 = objc_claimAutoreleasedReturnValue(),
          char v14 = [v12 isEqual:v13],
          v13,
          (v14 & 1) == 0))
    {
      [(TIKeyboardInputManagerLiveConversion_ja *)self setTransliterationType:0];
      [(TIKeyboardInputManagerLiveConversion_ja *)self setAutoSelectFirstCandidate:0];
      objc_super v20 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringForPrediction];
      unint64_t v21 = [v20 length];
      v22 = [v12 input];
      unint64_t v23 = [v22 length];

      v24 = [v8 currentCandidate];
      [(TIKeyboardInputManagerLiveConversion_ja *)self setCurrentCandidate:v24];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v25 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringFrom:v12];
        [(TIKeyboardInputManagerLiveConversion_ja *)self setCurrentDictionaryReading:v25];
      }
      else
      {
        [(TIKeyboardInputManagerLiveConversion_ja *)self setCurrentDictionaryReading:0];
      }
      [(TIKeyboardInputManagerLiveConversion_ja *)self setRemainingCandidate:0];
      if (v21 > v23) {
        [(TIKeyboardInputManagerLiveConversion_ja *)self selectPartialCandidate:v12];
      }
    }
    else
    {
      id syncKeyboardStateHandler = (void (**)(id, void *))self->_syncKeyboardStateHandler;
      if (syncKeyboardStateHandler)
      {
        id v16 = [(TIKeyboardInputManagerMecabra *)self keyboardConfiguration];
        syncKeyboardStateHandler[2](syncKeyboardStateHandler, v16);

        id v17 = self->_syncKeyboardStateHandler;
        self->_id syncKeyboardStateHandler = 0;
      }
    }
  }
  else
  {
    id v12 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v12 syncToKeyboardState:v8 from:v9 afterContextChange:v5];
  }

  unint64_t v18 = [v8 inputForMarkedText];
  uint64_t v19 = [v18 length];

  if (!v19)
  {
    [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
}

- (NSString)committedSurface
{
  objc_super v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
  objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));
  BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (!v5) {
    BOOL v5 = &stru_26F5DD710;
  }
  id v7 = v5;

  return v7;
}

- (void)commitCurrentCandidate
{
}

- (void)commitCurrentCandidate:(BOOL)a3
{
  uint64_t v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
  if (v5)
  {
    id v33 = (id)v5;
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
      id v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self topCandidate];
      char v10 = [v8 isEqual:v9];

      if (v10) {
        return;
      }
      unint64_t v11 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
      id v33 = (id)[v11 mutableCopy];

      id v12 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];
      unint64_t v13 = [v12 candidate];
      char v14 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSurface];
      uint64_t v15 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", 0, objc_msgSend(v14, "length"), &stru_26F5DD710);

      id v16 = [(TIKeyboardInputManagerLiveConversion_ja *)self remainingCandidate];

      id v17 = objc_alloc_init(MEMORY[0x263F7EB10]);
      [v17 setSurface:v15];
      if (v16)
      {
        unint64_t v18 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
        uint64_t v19 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
        uint64_t v20 = [v19 length];
        unint64_t v21 = [(TIKeyboardInputManagerLiveConversion_ja *)self remainingCandidate];
        v22 = [v21 input];
        unint64_t v23 = objc_msgSend(v18, "substringToIndex:", v20 - objc_msgSend(v22, "length"));
        [v17 setReading:v23];

        [v33 addObject:v17];
        id v24 = objc_alloc_init(MEMORY[0x263F7EB10]);
        int v25 = [(TIKeyboardInputManagerLiveConversion_ja *)self remainingCandidate];
        objc_super v26 = [v25 candidate];
        [v24 setSurface:v26];

        __int16 v27 = [(TIKeyboardInputManagerLiveConversion_ja *)self remainingCandidate];
        int v28 = [v27 input];
        [v24 setReading:v28];

        [v33 addObject:v24];
      }
      else
      {
        uint64_t v29 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentDictionaryReading];

        if (!v29 || a3)
        {
          int v30 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
          [v17 setReading:v30];
        }
        else
        {
          int v30 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputStringForAutoCommit];
          v31 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentDictionaryReading];
          v32 = [v30 stringByAppendingString:v31];
          [v17 setReading:v32];
        }
        [v33 addObject:v17];
      }

      [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
      [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v33];
    }
  }
}

- (void)addInlineCandidateIfNeeded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x263F7E640];
  uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputString];
  id v7 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
  id v8 = [v5 candidateWithCandidate:v6 forInput:v7];
  [v4 setDefaultCandidate:v8];

  id v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputString];
  char v10 = [v4 sortMethodGroups];
  unint64_t v11 = [v10 objectForKeyedSubscript:@"UI-Sort-Common"];
  id v12 = [v11 firstObject];

  if (v12)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v24 = 0;
    int v25 = &v24;
    uint64_t v26 = 0x2020000000;
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v13 = [v12 candidates];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __70__TIKeyboardInputManagerLiveConversion_ja_addInlineCandidateIfNeeded___block_invoke;
    v20[3] = &unk_2650FA800;
    id v21 = v9;
    v22 = &v24;
    unint64_t v23 = &v28;
    [v13 enumerateObjectsUsingBlock:v20];

    if (v25[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      char v14 = [v4 candidates];
      uint64_t v15 = [v14 objectAtIndexedSubscript:v25[3]];

      [v15 setInlineCandidate:1];
      uint64_t v16 = v25[3];
      if (v16 != 0x7FFFFFFFFFFFFFFFLL && v16 > v29[3])
      {
        id v17 = [v12 candidates];
        unint64_t v18 = (void *)[v17 mutableCopy];

        [v18 exchangeObjectAtIndex:v25[3] withObjectAtIndex:v29[3]];
        uint64_t v19 = (void *)[v18 copy];
        [v12 setCandidates:v19];
      }
    }

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
  }
}

- (BOOL)shouldShowPredictionCandidate:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(TIKeyboardInputManagerLiveConversion_ja *)self candidateBehavior] == 2)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_ja *)self inputString];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = objc_msgSend(v4, "candidates", 0);
    uint64_t v5 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v7);
          }
          char v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (([v10 isTransliterationCandidate] & 1) == 0)
          {
            char v11 = [v10 isPartialCandidate];
            if ((v11 & 1) != 0
              || ([v10 candidate],
                  id v12 = objc_claimAutoreleasedReturnValue(),
                  int v13 = [v12 isEqual:v6],
                  v12,
                  !v13))
            {
              LOBYTE(v5) = v11 ^ 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v5 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }
  return v5;
}

- (double)predictionThreshold
{
  double predictionThreshold = self->_predictionThreshold;
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self rawInputString];
  uint64_t v5 = [(TIKeyboardInputManagerLiveConversion_ja *)self hiraganaStringFor:v4];

  if ((unint64_t)[v5 length] < 4) {
    double predictionThreshold = predictionThreshold + predictionThreshold;
  }

  return predictionThreshold;
}

- (NSArray)segmentsForPicker
{
  objc_super v3 = [(TIKeyboardInputManagerLiveConversion_ja *)self committedSegments];
  id v4 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
  uint64_t v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return (NSArray *)v5;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v26 = "-[TIKeyboardInputManagerLiveConversion_ja _adjustPhraseBoundaryInForwardDirection:granularity:]";
    __int16 v27 = 1024;
    BOOL v28 = v5;
    __int16 v29 = 1024;
    int v30 = v4;
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", buf, 0x18u);
  }
  v24.receiver = self;
  v24.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  if ([(TIKeyboardInputManagerMecabra *)&v24 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4])
  {
    return 1;
  }
  if (![(TIKeyboardInputManagerLiveConversion_ja *)self conversionEnabled]
    && [(TIKeyboardInputManagerLiveConversion_ja *)self candidateBehavior] != 2)
  {
    [(TIKeyboardInputManagerLiveConversion_ja *)self invokeEditMode];
LABEL_23:
    v22 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    char v20 = [v22 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];

    return v20;
  }
  if (v4 == 4)
  {
    if (v5) {
      [(TIKeyboardInputManagerLiveConversion_ja *)self setAutoSelectFirstCandidate:1];
    }
    else {
      [(TIKeyboardInputManagerLiveConversion_ja *)self setTransliterationType:4];
    }
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCandidateBehavior:2];
    return 1;
  }
  if (v4)
  {
    uint64_t v15 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentIndex];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      long long v16 = [(TIKeyboardInputManagerLiveConversion_ja *)self currentCandidate];

      long long v17 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
      uint64_t v18 = [v17 count];
      if (v16)
      {
        if (v18 < 2)
        {
          uint64_t v15 = 0;
        }
        else
        {
          uint64_t v19 = [(TIKeyboardInputManagerLiveConversion_ja *)self segments];
          uint64_t v15 = [v19 count] - 2;
        }
      }
      else
      {
        uint64_t v15 = v18 - 1;
      }
    }
    id v21 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentAdjustInputManager:v15];
    [(TIKeyboardInputManagerMecabra *)self composeTextWith:v21];

    goto LABEL_23;
  }
  id v7 = [TIKeyboardInputManager_ja_SegmentPicker alloc];
  uint64_t v8 = [(TIKeyboardInputManagerLiveConversion_ja *)self config];
  id v9 = [(TIKeyboardInputManagerLiveConversion_ja *)self keyboardState];
  char v10 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentsForPicker];
  char v11 = [(TIKeyboardInputManagerLiveConversion_ja *)self segmentsForPicker];
  uint64_t v12 = [v11 count] - 1;
  int v13 = [(TIKeyboardInputManagerLiveConversion_ja *)self wordSearch];
  char v14 = [(TIKeyboardInputManager_ja_SegmentPicker *)v7 initWithConfig:v8 keyboardState:v9 segments:v10 at:v12 wordSearch:v13];
  [(TIKeyboardInputManagerMecabra *)self composeTextWith:v14];

  return 1;
}

- (id)segmentAdjustInputManager:(unint64_t)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TIKeyboardInputManagerLiveConversion_ja.mm", 983, @"%s must be overridden in subclass", "-[TIKeyboardInputManagerLiveConversion_ja segmentAdjustInputManager:]");

  return 0;
}

- (id)rawInputStringFrom:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TIKeyboardInputManagerLiveConversion_ja.mm", 988, @"%s must be overridden in subclass", "-[TIKeyboardInputManagerLiveConversion_ja rawInputStringFrom:]");

  return 0;
}

- (id)hiraganaStringFor:(id)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"TIKeyboardInputManagerLiveConversion_ja.mm", 994, @"%s must be overridden in subclass", "-[TIKeyboardInputManagerLiveConversion_ja hiraganaStringFor:]");

  return 0;
}

- (void)commitComposition
{
  objc_super v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
    -[TIKeyboardInputManagerLiveConversion_ja setSegmentIndex:](self, "setSegmentIndex:", [v5 index]);
    uint64_t v6 = [v5 segments];
    id v7 = (void *)[v6 copy];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v7];

    segments = self->_segments;
    self->_segments = 0;
  }
  id v9 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char v10 = objc_opt_isKindOfClass();

  if (v10)
  {
    char v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
    -[TIKeyboardInputManagerLiveConversion_ja setSegmentIndex:](self, "setSegmentIndex:", [v11 index]);
    uint64_t v12 = [v11 segments];
    int v13 = (void *)[v12 copy];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v13];

    char v14 = self->_segments;
    self->_segments = 0;
  }
  uint64_t v15 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    long long v17 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [(TIKeyboardInputManagerLiveConversion_ja *)self clearInput];
    uint64_t v18 = [v17 rawInputString];
    v25.receiver = self;
    v25.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
    [(TIKeyboardInputManagerLiveConversion_ja *)&v25 setInput:v18];

    uint64_t v19 = [v17 segments];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setCommittedSegments:v19];

    char v20 = [v17 inlineCandidate];
    [(TIKeyboardInputManagerLiveConversion_ja *)self setTopCandidate:v20];

    id v21 = [v17 inlineCandidate];
    v22 = [v17 segmentsFromCandidate:v21 phraseBoundary:1];
    unint64_t v23 = self->_segments;
    self->_segments = v22;

    [(TIKeyboardInputManagerLiveConversion_ja *)self setCandidateBehavior:2];
  }
  v24.receiver = self;
  v24.super_class = (Class)TIKeyboardInputManagerLiveConversion_ja;
  [(TIKeyboardInputManagerMecabra *)&v24 commitComposition];
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (NSArray)committedSegments
{
  return self->_committedSegments;
}

- (void)setCommittedSegments:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (TISmartPunctuationController)smartPunctuationController
{
  return self->_smartPunctuationController;
}

- (unint64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(unint64_t)a3
{
  self->_segmentIndex = a3;
}

- (TIKeyboardCandidate)topCandidate
{
  return self->_topCandidate;
}

- (void)setTopCandidate:(id)a3
{
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
}

- (NSString)currentDictionaryReading
{
  return self->_currentDictionaryReading;
}

- (void)setCurrentDictionaryReading:(id)a3
{
}

- (TIKeyboardCandidate)remainingCandidate
{
  return self->_remainingCandidate;
}

- (void)setRemainingCandidate:(id)a3
{
}

- (id)syncKeyboardStateHandler
{
  return self->_syncKeyboardStateHandler;
}

- (void)setSyncKeyboardStateHandler:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void)setPredictionThreshold:(double)a3
{
  self->_double predictionThreshold = a3;
}

- (unint64_t)candidateBehavior
{
  return self->_candidateBehavior;
}

- (void)setCandidateBehavior:(unint64_t)a3
{
  self->_candidateBehavior = a3;
}

- (int64_t)transliterationType
{
  return self->_transliterationType;
}

- (void)setTransliterationType:(int64_t)a3
{
  self->_transliterationType = a3;
}

- (BOOL)autoSelectFirstCandidate
{
  return self->_autoSelectFirstCandidate;
}

- (void)setAutoSelectFirstCandidate:(BOOL)a3
{
  self->_autoSelectFirstCandidate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_syncKeyboardStateHandler, 0);
  objc_storeStrong((id *)&self->_remainingCandidate, 0);
  objc_storeStrong((id *)&self->_currentDictionaryReading, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_topCandidate, 0);
  objc_storeStrong((id *)&self->_smartPunctuationController, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_committedSegments, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

- (void)handleKeyboardInput:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s handleKeyboardInput", "-[TIKeyboardInputManagerLiveConversion_ja handleKeyboardInput:]");
  *(_DWORD *)buf = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_241DFD000, a1, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

@end