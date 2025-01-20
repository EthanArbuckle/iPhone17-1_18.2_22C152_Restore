@interface TIKeyboardInputManager_ja_SegmentAdjust
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)closeCandidateGenerationContextWithResults:(id)a3;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)romajiEnabled;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSArray)contextSegments;
- (NSArray)segments;
- (NSString)composingInputString;
- (NSString)contextString;
- (NSString)inputString;
- (TIKeyboardInputManager_ja_SegmentAdjust)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 romajiEnabled:(BOOL)a7 wordSearch:(id)a8;
- (id)candidateResultSet;
- (id)handleKeyboardInput:(id)a3;
- (id)keyboardBehaviors;
- (id)markedText;
- (id)wordSearch;
- (unint64_t)breaktAt;
- (unint64_t)index;
- (unint64_t)segmentLength;
- (unsigned)inputIndex;
- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)commitComposition;
- (void)composeTextWith:(id)a3;
- (void)generateNewSegments:(unint64_t)a3;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)setBreaktAt:(unint64_t)a3;
- (void)setContextSegments:(id)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setRomajiEnabled:(BOOL)a3;
- (void)setSegmentLength:(unint64_t)a3;
- (void)setSegments:(id)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)updateInputString;
@end

@implementation TIKeyboardInputManager_ja_SegmentAdjust

- (TIKeyboardInputManager_ja_SegmentAdjust)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 romajiEnabled:(BOOL)a7 wordSearch:(id)a8
{
  id v15 = a5;
  id v16 = a8;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  v17 = [(TIKeyboardInputManagerMecabra *)&v20 initWithConfig:a3 keyboardState:a4];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_segments, a5);
    v18->_index = a6;
    objc_storeStrong((id *)&v18->_wordSearch, a8);
    v18->_romajiEnabled = a7;
    [(TIKeyboardInputManager_ja_SegmentAdjust *)v18 updateInputString];
  }

  return v18;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5E0]);
  return v2;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  [v10 syncToKeyboardState:v9 from:v8 afterContextChange:v5];
}

- (id)markedText
{
  return 0;
}

- (BOOL)commitsAcceptedCandidate
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  v6 = [v5 handleKeyboardInput:v4];

  if (![v4 transliterationType])
  {
    v7 = [v4 string];
    char v8 = [v7 _isSpace];

    if ((v8 & 1) == 0) {
      [(TIKeyboardInputManagerMecabra *)self completeComposition];
    }
  }

  return v6;
}

- (void)updateInputString
{
  v3 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  id v4 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));
  BOOL v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  inputString = self->_inputString;
  self->_inputString = v5;

  v7 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  unint64_t v8 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self index];
  id v9 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  objc_msgSend(v7, "_readingStringWithin:", v8, objc_msgSend(v9, "count") - -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  composingInputString = self->_composingInputString;
  self->_composingInputString = v10;

  v12 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  objc_msgSend(v12, "_surfaceStringWithin:", 0, -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  contextString = self->_contextString;
  self->_contextString = v13;

  id v15 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  objc_msgSend(v15, "subarrayWithRange:", 0, -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  id v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  contextSegments = self->_contextSegments;
  self->_contextSegments = v16;

  v18 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentAdjust index](self, "index"));
  id v21 = [v19 reading];

  if ([(TIKeyboardInputManager_ja_SegmentAdjust *)self romajiEnabled])
  {
    objc_super v20 = +[Romakana hiraganaString:v21 mappingArray:0];
    self->_segmentLength = [v20 length];
  }
  else
  {
    self->_segmentLength = [v21 length];
  }
}

- (unsigned)inputIndex
{
  v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v3)
  {
    id v4 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    unsigned int v5 = [v4 inputIndex];
  }
  else
  {
    id v4 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self contextString];
    int v6 = [v4 length];
    unsigned int v5 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segmentLength] + v6;
  }

  return v5;
}

- (void)generateNewSegments:(unint64_t)a3
{
  id v25 = 0;
  v26 = 0;
  if ([(TIKeyboardInputManager_ja_SegmentAdjust *)self romajiEnabled])
  {
    unsigned int v5 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self composingInputString];
    id v25 = (id)+[Romakana splitRomaji:v5 at:a3];
    v26 = v6;
  }
  else
  {
    v7 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self composingInputString];
    id v23 = [v7 substringToIndex:a3];
    unint64_t v8 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self composingInputString];
    id v24 = [v8 substringFromIndex:a3];
    __copy_assignment_8_8_s0_s8(&v25, (uint64_t)&v23);
  }
  id v9 = [TIWordSearchJapaneseOperationGetCandidates alloc];
  wordSearch = self->_wordSearch;
  if (v26) {
    v11 = v26;
  }
  else {
    v11 = &stru_26F5DD710;
  }
  v12 = [v25 stringByAppendingString:v11];
  v13 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self contextBeforeWithDesiredLength:20];
  v14 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self contextString];
  id v15 = [v13 stringByAppendingString:v14];
  uint64_t v16 = [v25 length];
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
  BYTE2(v22) = 1;
  LOWORD(v22) = 0;
  LOBYTE(v21) = 1;
  v19 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v9, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", wordSearch, v12, 0, v15, v17, 0, v21, 0, self, sel__notifyUpdateCandidates_forOperation_, v18, v22, 0);

  [(TIWordSearchJapaneseOperationGetCandidates *)v19 setSinglePhrase:1];
  objc_super v20 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self wordSearch];
  [v20 performOperationAsync:v19];
}

- (id)candidateResultSet
{
  v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v3)
  {
    id v4 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    unsigned int v5 = [v4 candidateResultSet];
  }
  else
  {
    unsigned int v5 = [MEMORY[0x263F7E638] dummySet];
  }
  return v5;
}

- (void)_notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v5];
  int v6 = [v5 candidates];
  v7 = [v6 firstObject];

  id v8 = objc_alloc_init(MEMORY[0x263F7EB10]);
  id v9 = [v7 input];
  [v8 setReading:v9];

  id v10 = [v7 candidate];
  [v8 setSurface:v10];

  v11 = [v5 candidateAfterSegmentBreak];

  v12 = [(TIKeyboardInputManagerMecabra *)self segmentsFromCandidate:v11 phraseBoundary:1];

  v13 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self contextSegments];
  v24[0] = v8;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
  id v15 = [v14 arrayByAddingObjectsFromArray:v12];
  uint64_t v16 = [v13 arrayByAddingObjectsFromArray:v15];
  segments = self->_segments;
  self->_segments = v16;

  v18 = [TIKeyboardInputManager_ja_SegmentPicker alloc];
  v19 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self config];
  objc_super v20 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self keyboardState];
  uint64_t v21 = self->_segments;
  uint64_t v22 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self contextSegments];
  id v23 = -[TIKeyboardInputManager_ja_SegmentPicker initWithConfig:keyboardState:segments:at:wordSearch:](v18, "initWithConfig:keyboardState:segments:at:wordSearch:", v19, v20, v21, [v22 count], self->_wordSearch);
  [(TIKeyboardInputManager_ja_SegmentAdjust *)self composeTextWith:v23];
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v10 = a3;
  id v4 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self candidateRange];
    uint64_t v7 = v6;
    id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_msgSend(v8, "setCandidateRange:", v5, v7);

    id v9 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v9 openCandidateGenerationContextWithCandidateHandler:v10];
  }
  else
  {
    [(TIKeyboardInputManager_ja_SegmentAdjust *)self setCandidateHandlerForOpenRequest:v10];
  }
}

- (void)composeTextWith:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  [(TIKeyboardInputManagerMecabra *)&v13 composeTextWith:a3];
  id v4 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self candidateHandlerForOpenRequest];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self candidateRange];
    uint64_t v7 = v6;
    id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_msgSend(v8, "setCandidateRange:", v5, v7);

    id v9 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    id v10 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self candidateHandlerForOpenRequest];
    [v9 openCandidateGenerationContextWithCandidateHandler:v10];

    [(TIKeyboardInputManager_ja_SegmentAdjust *)self setCandidateHandlerForOpenRequest:0];
    v11 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    id v12 = (id)[v11 candidateResultSet];
  }
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
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

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    objc_super v13 = "-[TIKeyboardInputManager_ja_SegmentAdjust _adjustPhraseBoundaryInForwardDirection:granularity:]";
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    int v17 = v4;
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", buf, 0x18u);
  }
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  if (![(TIKeyboardInputManagerMecabra *)&v11 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4])
  {
    unint64_t v7 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segmentLength];
    unint64_t v8 = v7 - 1;
    if (v5) {
      unint64_t v8 = v7 + 1;
    }
    if (v8 <= 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    [(TIKeyboardInputManager_ja_SegmentAdjust *)self generateNewSegments:v9];
  }
  return 1;
}

- (void)commitComposition
{
  v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    -[TIKeyboardInputManager_ja_SegmentAdjust setIndex:](self, "setIndex:", [v5 index]);

    uint64_t v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    unint64_t v7 = [v6 segments];
    [(TIKeyboardInputManager_ja_SegmentAdjust *)self setSegments:v7];
  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_SegmentAdjust;
  [(TIKeyboardInputManagerMecabra *)&v10 commitComposition];
  unint64_t v8 = [(TIKeyboardInputManager_ja_SegmentAdjust *)self segments];
  uint64_t v9 = [v8 count];

  if (v9) {
    [(TIKeyboardInputManager_ja_SegmentAdjust *)self updateInputString];
  }
  else {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (unint64_t)breaktAt
{
  return self->_breaktAt;
}

- (void)setBreaktAt:(unint64_t)a3
{
  self->_breaktAt = a3;
}

- (NSString)inputString
{
  return self->_inputString;
}

- (NSString)composingInputString
{
  return self->_composingInputString;
}

- (NSString)contextString
{
  return self->_contextString;
}

- (NSArray)contextSegments
{
  return self->_contextSegments;
}

- (void)setContextSegments:(id)a3
{
}

- (unint64_t)segmentLength
{
  return self->_segmentLength;
}

- (void)setSegmentLength:(unint64_t)a3
{
  self->_segmentLength = a3;
}

- (BOOL)romajiEnabled
{
  return self->_romajiEnabled;
}

- (void)setRomajiEnabled:(BOOL)a3
{
  self->_romajiEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextSegments, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
  objc_storeStrong((id *)&self->_composingInputString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end