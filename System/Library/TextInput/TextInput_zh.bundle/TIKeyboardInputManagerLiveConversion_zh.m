@interface TIKeyboardInputManagerLiveConversion_zh
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)_shouldCommitInputDirectly:(id)a3;
- (BOOL)closeCandidateGenerationContextWithResults:(id)a3;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)revertTonlessZhuyin;
- (BOOL)shouldClearInputOnMarkedTextOutOfSync;
- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3;
- (BOOL)shouldSearchCompletionForSubstrings;
- (BOOL)skipSetMarkedTextDuringInput;
- (BOOL)supportsNumberKeySelection;
- (BOOL)updateCandidatesByWaitingForResults:(BOOL)a3;
- (BOOL)usesLiveConversion;
- (NSString)cachedInputString;
- (TIKeyboardCandidate)currentCandidate;
- (TIKeyboardCandidate)topCandidate;
- (TIKeyboardInputManagerLiveConversion_zh)initWithConfig:(id)a3 keyboardState:(id)a4;
- (TIZhuyinInputManager)zhuyinInputManager;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)internalInputString;
- (id)keyBehaviorsForState:(id)a3;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)markedText;
- (id)phoneticSortingMethod;
- (id)rawInputString;
- (id)validCharacterSetForAutocorrection;
- (id)wordCharacters;
- (int)inputMethodType;
- (unint64_t)initialSelectedIndex;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)_addInputToInternal:(id)a3;
- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)addInputToInternal:(id)a3;
- (void)clearInput;
- (void)commitComposition;
- (void)initImplementation;
- (void)presentSegmentAdjuster;
- (void)presentSegmentPickerIfNeeded;
- (void)setCachedInputString:(id)a3;
- (void)setCurrentCandidate:(id)a3;
- (void)setRevertTonlessZhuyin:(BOOL)a3;
- (void)setTopCandidate:(id)a3;
- (void)setZhuyinInputManager:(id)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
@end

@implementation TIKeyboardInputManagerLiveConversion_zh

- (TIKeyboardInputManagerLiveConversion_zh)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  v4 = [(TIKeyboardInputManagerChinesePhonetic *)&v8 initWithConfig:a3 keyboardState:a4];
  if (v4)
  {
    v5 = objc_alloc_init(TIZhuyinInputManager);
    zhuyinInputManager = v4->_zhuyinInputManager;
    v4->_zhuyinInputManager = v5;
  }
  return v4;
}

- (BOOL)skipSetMarkedTextDuringInput
{
  return 1;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5C0] sharedInstance];
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] zhuyinWordCharacters];
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E620]);
  return v2;
}

- (unint64_t)initialSelectedIndex
{
  v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  v5 = [v4 candidates];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    id v2 = [(TIKeyboardInputManagerLiveConversion_zh *)self inputString];
    if ([v2 length])
    {
      id v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  id v7 = [(TIKeyboardInputManagerChinese *)&v9 initialSelectedIndex];
  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  return (unint64_t)v7;
}

- (BOOL)supportsNumberKeySelection
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

- (BOOL)commitsAcceptedCandidate
{
  return 1;
}

- (id)keyBehaviorsForState:(id)a3
{
  return (id)[MEMORY[0x263F7E660] behaviorForSpaceKey:100 forReturnKey:2];
}

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9F0];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  return [(TIKeyboardInputManagerChinese *)&v4 initImplementationWithMode:@"Zhuyin" andLanguage:v2];
}

- (void)clearInput
{
  [(TIKeyboardInputManagerLiveConversion_zh *)self setCachedInputString:0];
  [(TIKeyboardInputManagerLiveConversion_zh *)self setCurrentCandidate:0];
  [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:0];
  v3 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  [v3 reset];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  [(TIKeyboardInputManagerChinesePhonetic *)&v4 clearInput];
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  if (TICanLogMessageAtLevel())
  {
    v5 = TIOSLogFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManagerLiveConversion_zh handleKeyboardInput:]();
    }
  }
  uint64_t v6 = [v4 acceptedCandidate];
  if (v6)
  {
    id v7 = (void *)v6;
    objc_super v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

    if (v8) {
      goto LABEL_7;
    }
  }
  v10 = [(TIKeyboardInputManagerLiveConversion_zh *)self currentCandidate];

  if (v10)
  {
    v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    v12 = [(TIKeyboardInputManagerLiveConversion_zh *)self currentCandidate];
    uint64_t v13 = [v11 mecabraCandidateRefFromCandidate:v12];

    v14 = [MEMORY[0x263F7E6A0] dictionaryReadingFromMecabraCandidate:v13];
    unint64_t v15 = [v14 length];
    v16 = [(TIKeyboardInputManagerLiveConversion_zh *)self rawInputString];
    unint64_t v17 = [v16 length];

    if (v15 > v17) {
      [(TIKeyboardInputManagerLiveConversion_zh *)self clearInput];
    }
    [(TIKeyboardInputManagerLiveConversion_zh *)self addInputToInternal:v14];
    [(TIKeyboardInputManagerLiveConversion_zh *)self setCurrentCandidate:0];
  }
  v18 = [v4 string];
  int v19 = [v18 isEqualToString:@"\x1B"];

  if (v19)
  {
    id v9 = objc_alloc_init(MEMORY[0x263F7E678]);
    v20 = [(TIKeyboardInputManagerLiveConversion_zh *)self inputString];
    [v9 insertText:v20];

    [(TIKeyboardInputManagerMecabra *)self cancelComposition];
    goto LABEL_30;
  }
  v21 = [v4 string];
  int v22 = [v21 isEqualToString:@"\n"];

  if (v22)
  {
    v23 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

    if (!v23) {
      [(TIKeyboardInputManagerMecabra *)self completeComposition];
    }
LABEL_7:
    id v9 = objc_alloc_init(MEMORY[0x263F7E678]);
    goto LABEL_30;
  }
  if ([v4 isBackspace]) {
    uint64_t v24 = [v4 isShiftDown];
  }
  else {
    uint64_t v24 = 0;
  }
  [(TIKeyboardInputManagerLiveConversion_zh *)self setRevertTonlessZhuyin:v24];
  v34.receiver = self;
  v34.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  v25 = [(TIKeyboardInputManagerChinesePhonetic *)&v34 handleKeyboardInput:v4];
  v26 = [v4 string];
  if (([v26 _isSpace] & 1) == 0)
  {

    goto LABEL_24;
  }
  v27 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  char v28 = [v27 syllableBuffersOccupied];

  if (v28)
  {
LABEL_24:
    [(TIKeyboardInputManagerLiveConversion_zh *)self updateCandidatesByWaitingForResults:1];
    v30 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
    if ([v30 syllableBuffersOccupied])
    {
    }
    else
    {
      v31 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
      char v32 = [v31 isCursorAtEnd];

      if ((v32 & 1) == 0) {
        [(TIKeyboardInputManagerLiveConversion_zh *)self presentSegmentAdjuster];
      }
    }
    id v29 = v25;
    goto LABEL_29;
  }
  [(TIKeyboardInputManagerLiveConversion_zh *)self presentSegmentPickerIfNeeded];
  id v29 = objc_alloc_init(MEMORY[0x263F7E678]);
LABEL_29:
  id v9 = v29;

LABEL_30:
  return v9;
}

- (id)markedText
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = [(TIKeyboardInputManagerLiveConversion_zh *)self rawInputString];
  id v4 = [(TIKeyboardInputManagerLiveConversion_zh *)self inputString];
  uint64_t v5 = [(TIKeyboardInputManagerLiveConversion_zh *)self inputIndex];
  uint64_t v6 = [(TIKeyboardInputManagerChinesePhonetic *)self searchStringForMarkedText];
  id v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", 0, objc_msgSend(v4, "length"));
  v12[0] = v7;
  objc_super v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  id v9 = [(TIKeyboardInputManagerLiveConversion_zh *)self lastInputString];
  v10 = [MEMORY[0x263F7E658] intermediateTextWithInputString:v3 displayString:v4 selectionLocation:v5 searchString:v6 candidateOffset:0 liveConversionSegments:v8 highlightSegmentIndex:0x7FFFFFFFFFFFFFFFLL lastInputString:v9];

  return v10;
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3
{
  return 0;
}

- (id)validCharacterSetForAutocorrection
{
  return (id)[MEMORY[0x263F08708] zhuyinCharacterSet];
}

- (BOOL)shouldClearInputOnMarkedTextOutOfSync
{
  uint64_t v2 = [MEMORY[0x263F7EB60] sharedOperationQueue];
  BOOL v3 = [v2 operationCount] == 0;

  return v3;
}

- (int)inputMethodType
{
  return 5;
}

- (id)phoneticSortingMethod
{
  return &unk_26F5E8FB8;
}

- (BOOL)_shouldCommitInputDirectly:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08708] zhuyinCharacterSet];
  if (TIStringContainsCharacterFromSet(v4, (uint64_t)v5)) {
    goto LABEL_4;
  }
  uint64_t v6 = [MEMORY[0x263F08708] punctuationAndSymbolCharacterSet];
  if (TIStringContainsCharacterFromSet(v4, (uint64_t)v6))
  {

LABEL_4:
    goto LABEL_5;
  }
  id v9 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  BOOL v10 = TIStringContainsCharacterFromSet(v4, (uint64_t)v9);

  if (!v10)
  {
    v11.receiver = self;
    v11.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
    BOOL v7 = [(TIKeyboardInputManagerChinesePhonetic *)&v11 _shouldCommitInputDirectly:v4];
    goto LABEL_6;
  }
LABEL_5:
  BOOL v7 = 0;
LABEL_6:

  return v7;
}

- (void)addInputToInternal:(id)a3
{
  id v8 = a3;
  if ([v8 length] == 1)
  {
    unint64_t v4 = [(TIKeyboardInputManagerLiveConversion_zh *)self _addInputToInternal:v8];
    uint64_t v5 = v8;
  }
  else
  {
    unint64_t v4 = [v8 length];
    uint64_t v5 = v8;
    if (v4)
    {
      for (unint64_t i = 0; i < v4; ++i)
      {
        BOOL v7 = objc_msgSend(v5, "substringWithRange:", i, 1);
        [(TIKeyboardInputManagerLiveConversion_zh *)self _addInputToInternal:v7];

        unint64_t v4 = [v8 length];
        uint64_t v5 = v8;
      }
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_addInputToInternal:(id)a3
{
  id v11 = a3;
  unint64_t v4 = [MEMORY[0x263F08708] zhuyinCharacterSet];
  BOOL v5 = TIStringContainsCharacterFromSet(v11, (uint64_t)v4);

  if (v5)
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
    BOOL v7 = [v6 composedText];
    cachedInputString = self->_cachedInputString;
    self->_cachedInputString = v7;

    id v9 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
    [v9 addZhuyinInput:v11];

    [(TIKeyboardInputManagerLiveConversion_zh *)self updateCandidatesByWaitingForResults:1];
  }
  else if (([v11 isEqualToString:@" "] & 1) == 0)
  {
    BOOL v10 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
    [v10 addNonZhuyinInput:v11];
  }
}

- (id)rawInputString
{
  uint64_t v2 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  BOOL v3 = [v2 inputBuffer];

  return v3;
}

- (id)internalInputString
{
  uint64_t v2 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  BOOL v3 = [v2 inputBuffer];

  return v3;
}

- (unsigned)inputCount
{
  uint64_t v2 = [(TIKeyboardInputManagerLiveConversion_zh *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (id)inputString
{
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_zh *)self currentCandidate];

  if (v3)
  {
    unint64_t v4 = [(TIKeyboardInputManagerLiveConversion_zh *)self currentCandidate];
    uint64_t v5 = [v4 candidate];
LABEL_3:
    uint64_t v6 = (__CFString *)v5;

    goto LABEL_6;
  }
  BOOL v7 = [(TIKeyboardInputManagerLiveConversion_zh *)self cachedInputString];

  if (v7)
  {
    uint64_t v6 = [(TIKeyboardInputManagerLiveConversion_zh *)self cachedInputString];
  }
  else
  {
    id v9 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
    BOOL v10 = [v9 composedText];

    if (v10)
    {
      unint64_t v4 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
      uint64_t v5 = [v4 composedText];
      goto LABEL_3;
    }
    uint64_t v6 = &stru_26F5E6580;
  }
LABEL_6:
  return v6;
}

- (unsigned)inputIndex
{
  unsigned int v3 = [(TIKeyboardInputManagerLiveConversion_zh *)self currentCandidate];

  if (v3)
  {
    return [(TIKeyboardInputManagerLiveConversion_zh *)self inputCount];
  }
  else
  {
    uint64_t v5 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
    unsigned int v6 = [v5 cursorLocation];

    return v6;
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_zh *)self revertTonlessZhuyin];
  unsigned int v6 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  BOOL v7 = v6;
  if (v5) {
    [v6 revertCurrentCharacterToTonelessZhuyin];
  }
  else {
    [v6 deleteFromInput];
  }

  if (a3) {
    *a3 = 1;
  }
  id v8 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  id v9 = [v8 inputBuffer];
  uint64_t v10 = [v9 length];

  if (!v10) {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  return 0;
}

- (BOOL)updateCandidatesByWaitingForResults:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(TIKeyboardInputManagerLiveConversion_zh *)self rawInputString];
  uint64_t v6 = [v5 length];
  if (TICanLogMessageAtLevel())
  {
    BOOL v7 = TIOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:]((uint64_t)v5);
    }
  }
  if (!v6)
  {
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
    BOOL v17 = 1;
    goto LABEL_18;
  }
  id v8 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
  id v9 = objc_alloc(MEMORY[0x263F7E980]);
  uint64_t v10 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  id v11 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  if (v3) {
    v12 = 0;
  }
  else {
    v12 = self;
  }
  if (v3) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = sel_wordSearchEngineDidFindCandidates_forOperation_;
  }
  v14 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
  LOBYTE(v22) = 1;
  BYTE2(v21) = 0;
  LOWORD(v21) = 1;
  unint64_t v15 = objc_msgSend(v9, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v10, v5, v11, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v21, v12, v13, v8, v22, v14);

  v16 = [v15 results];
  BOOL v17 = v16 == 0;

  if (!v16)
  {
    v18 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v18 performOperationAsync:v15];

    if (!v3)
    {
      BOOL v17 = 0;
      goto LABEL_16;
    }
    [v15 waitUntilFinished];
  }
  int v19 = [v15 results];
  [(TIKeyboardInputManagerLiveConversion_zh *)self _notifyUpdateCandidates:v19 forOperation:v15];

LABEL_16:
LABEL_18:

  return v17;
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v24 = a4;
  if (-[TIKeyboardInputManagerLiveConversion_zh shouldSkipCandidateSelection](self, "shouldSkipCandidateSelection")|| ([v6 candidates], v7 = objc_claimAutoreleasedReturnValue(), uint64_t v8 = objc_msgSend(v7, "count"), v7, !v8))
  {
    v20 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v20 cancelComposition];

    goto LABEL_21;
  }
  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v6];
  cachedInputString = self->_cachedInputString;
  self->_cachedInputString = 0;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v23 = v6;
  uint64_t v10 = [v6 candidates];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v11) {
    goto LABEL_20;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v26;
  while (2)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v10);
      }
      unint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      if ([v15 containPunctuationOnly])
      {
LABEL_19:
        uint64_t v21 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
        [v21 updateWithCandidate:v15 isWholeInputCandidate:1];

        [(TIKeyboardInputManagerLiveConversion_zh *)self setTopCandidate:v15];
        uint64_t v22 = [(TIKeyboardInputManagerMecabra *)self segmentsFromCandidate:v15 phraseBoundary:0];
        [(TIKeyboardInputManagerChinesePhonetic *)self setSegments:v22];

        goto LABEL_20;
      }
      v16 = [v15 candidate];
      if ([v16 _containsBopomofoOnly]) {
        goto LABEL_14;
      }
      BOOL v17 = [v15 input];
      v18 = [v24 inputString];
      if (([v17 isEqualToString:v18] & 1) == 0)
      {

LABEL_14:
        continue;
      }
      char v19 = [v15 hasUnsupportedReading];

      if ((v19 & 1) == 0) {
        goto LABEL_19;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12) {
      continue;
    }
    break;
  }
LABEL_20:

  [(TIKeyboardInputManagerLiveConversion_zh *)self setMarkedText];
  id v6 = v23;
LABEL_21:
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  [(TIKeyboardInputManagerLiveConversion_zh *)&v4 closeCandidateGenerationContextWithResults:0];
  return 1;
}

- (id)didAcceptCandidate:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  id v6 = [(TIKeyboardInputManagerChinesePhonetic *)self remainingInput];
  uint64_t v7 = [v6 length];

  if (!v7 || (isKindOfClass & 1) != 0)
  {
    uint64_t v8 = [(TIKeyboardInputManagerLiveConversion_zh *)self rawInputString];
    unint64_t v9 = [v8 length];
    uint64_t v10 = [v4 input];
    uint64_t v11 = (v9 > [v10 length]) & (isKindOfClass ^ 1u);

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315394;
      uint64_t v21 = "-[TIKeyboardInputManagerLiveConversion_zh didAcceptCandidate:]";
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl(&dword_241E5B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  candidate is partial: %d", (uint8_t *)&v20, 0x12u);
    }
    uint64_t v12 = [v4 candidate];
    if ([v12 length])
    {
      int v13 = [(TIKeyboardInputManagerLiveConversion_zh *)self isTypologyEnabled];

      if (v13) {
        [(TIKeyboardInputManagerMecabra *)self logCommittedCandidate:v4 partial:v11];
      }
    }
    else
    {
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:v11];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [(TIKeyboardInputManagerLiveConversion_zh *)self topCandidate];
      objc_opt_class();
      char v15 = objc_opt_isKindOfClass();

      if (v15)
      {
        v16 = [(TIKeyboardInputManagerLiveConversion_zh *)self topCandidate];
        BOOL v17 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v16];

        v18 = [(TIKeyboardInputManagerChinese *)self wordSearch];
        [v18 performAccept:v17 isPartial:0];
      }
    }
    [(TIKeyboardInputManagerLiveConversion_zh *)self clearInput];
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  return &stru_26F5E6580;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  BOOL v5 = [(TIKeyboardInputManagerChinesePhonetic *)&v9 handleAcceptedCandidate:a3 keyboardState:a4];
  id v6 = [(TIKeyboardInputManagerLiveConversion_zh *)self rawInputString];
  uint64_t v7 = [v6 length];

  if (v7) {
    [(TIKeyboardInputManagerLiveConversion_zh *)self updateCandidatesByWaitingForResults:1];
  }
  else {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  return v5;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (TICanLogMessageAtLevel())
  {
    uint64_t v7 = TIOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManagerLiveConversion_zh _adjustPhraseBoundaryInForwardDirection:granularity:](v5, v4);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  if ([(TIKeyboardInputManagerMecabra *)&v13 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4])
  {
    return 1;
  }
  uint64_t v8 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  char v9 = [v8 syllableBuffersOccupied];

  if (v9) {
    return 1;
  }
  if (v4 == 4) {
    [(TIKeyboardInputManagerLiveConversion_zh *)self presentSegmentPickerIfNeeded];
  }
  else {
    [(TIKeyboardInputManagerLiveConversion_zh *)self presentSegmentAdjuster];
  }
  uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  char v10 = [v11 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4];

  return v10;
}

- (void)presentSegmentAdjuster
{
  BOOL v3 = [TIKeyboardInputManager_zh_SegmentAdjust alloc];
  id v9 = [(TIKeyboardInputManagerLiveConversion_zh *)self config];
  uint64_t v4 = [(TIKeyboardInputManagerLiveConversion_zh *)self keyboardState];
  BOOL v5 = [(TIKeyboardInputManagerChinesePhonetic *)self segments];
  id v6 = [(TIKeyboardInputManagerLiveConversion_zh *)self zhuyinInputManager];
  uint64_t v7 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  uint64_t v8 = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 initWithConfig:v9 keyboardState:v4 segments:v5 inputManager:v6 wordSearch:v7];
  [(TIKeyboardInputManagerMecabra *)self composeTextWith:v8];
}

- (void)presentSegmentPickerIfNeeded
{
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = 0;
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0;
    BOOL v5 = [(TIKeyboardInputManagerChinesePhonetic *)self segments];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __71__TIKeyboardInputManagerLiveConversion_zh_presentSegmentPickerIfNeeded__block_invoke;
    v15[3] = &unk_2650FE5C8;
    v15[4] = self;
    v15[5] = v16;
    v15[6] = &v17;
    [v5 enumerateObjectsUsingBlock:v15];

    if (v18[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = [(TIKeyboardInputManagerChinesePhonetic *)self segments];
      uint64_t v7 = [v6 count];
      v18[3] = v7 - 1;
    }
    uint64_t v8 = [TIKeyboardInputManager_zh_SegmentPicker alloc];
    id v9 = [(TIKeyboardInputManagerLiveConversion_zh *)self config];
    char v10 = [(TIKeyboardInputManagerLiveConversion_zh *)self keyboardState];
    uint64_t v11 = [(TIKeyboardInputManagerChinesePhonetic *)self segments];
    uint64_t v12 = v18[3];
    objc_super v13 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    v14 = [(TIKeyboardInputManager_zh_SegmentPicker *)v8 initWithConfig:v9 keyboardState:v10 segments:v11 at:v12 wordSearch:v13];

    [(TIKeyboardInputManagerMecabra *)self composeTextWith:v14];
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(&v17, 8);
  }
}

- (void)commitComposition
{
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    id v6 = [v5 segments];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [v5 segments];
      [(TIKeyboardInputManagerChinesePhonetic *)self setSegments:v8];

      id v9 = [v5 inputString];
      [(TIKeyboardInputManagerLiveConversion_zh *)self setCachedInputString:v9];

      char v10 = [v5 remainingInput];
      [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:v10];
    }
    else
    {
      [(TIKeyboardInputManagerLiveConversion_zh *)self clearInput];
    }
  }
  uint64_t v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if (v12)
  {
    objc_super v13 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    v14 = [v13 segments];
    [(TIKeyboardInputManagerChinesePhonetic *)self setSegments:v14];

    char v15 = [v13 inputString];
    [(TIKeyboardInputManagerLiveConversion_zh *)self setCachedInputString:v15];

    v16 = [v13 remainingInput];
    [(TIKeyboardInputManagerChinesePhonetic *)self setRemainingInput:v16];
  }
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  [(TIKeyboardInputManagerMecabra *)&v17 commitComposition];
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManagerLiveConversion_zh;
  [(TIKeyboardInputManagerChinesePhonetic *)&v13 syncToKeyboardState:v8 from:a4 afterContextChange:v5];
  id v9 = [v8 currentCandidate];

  if (v9)
  {
    char v10 = [v8 currentCandidate];
    [(TIKeyboardInputManagerLiveConversion_zh *)self setCurrentCandidate:v10];
  }
  uint64_t v11 = [v8 inputForMarkedText];
  uint64_t v12 = [v11 length];

  if (!v12) {
    [(TIKeyboardInputManagerMecabra *)self cancelComposition];
  }
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

- (TIZhuyinInputManager)zhuyinInputManager
{
  return self->_zhuyinInputManager;
}

- (void)setZhuyinInputManager:(id)a3
{
}

- (NSString)cachedInputString
{
  return self->_cachedInputString;
}

- (void)setCachedInputString:(id)a3
{
}

- (BOOL)revertTonlessZhuyin
{
  return *(&self->_revertTonlessZhuyin + 4);
}

- (void)setRevertTonlessZhuyin:(BOOL)a3
{
  *(&self->_revertTonlessZhuyin + 4) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedInputString, 0);
  objc_storeStrong((id *)&self->_zhuyinInputManager, 0);
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_topCandidate, 0);
}

- (void)handleKeyboardInput:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend(NSString, "stringWithFormat:", @"%s handleKeyboardInput", "-[TIKeyboardInputManagerLiveConversion_zh handleKeyboardInput:]");
  int v3 = 138412290;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_0(&dword_241E5B000, v1, v2, "%@", (uint8_t *)&v3);
}

- (void)updateCandidatesByWaitingForResults:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v1 = [NSString stringWithFormat:@"%s updateCandidates for %@", "-[TIKeyboardInputManagerLiveConversion_zh updateCandidatesByWaitingForResults:]", a1];
  int v4 = 138412290;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_0(&dword_241E5B000, v2, v3, "%@", (uint8_t *)&v4);
}

- (void)_adjustPhraseBoundaryInForwardDirection:(char)a1 granularity:(uint64_t)a2 .cold.1(char a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s adjust phrase: %d %d", "-[TIKeyboardInputManagerLiveConversion_zh _adjustPhraseBoundaryInForwardDirection:granularity:]", a1 & 1, a2);
  int v5 = 138412290;
  uint64_t v6 = v2;
  OUTLINED_FUNCTION_0(&dword_241E5B000, v3, v4, "%@", (uint8_t *)&v5);
}

@end