@interface TIKeyboardInputManager_ja_SegmentPicker
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)closeCandidateGenerationContextWithResults:(id)a3;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)shouldShowCandidateWindow;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSArray)segments;
- (TIKeyboardCandidate)currentCandidate;
- (TIKeyboardInputManager_ja_SegmentPicker)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 wordSearch:(id)a7;
- (TILiveConversionSegments)liveConversionSegments;
- (id)candidateResultSet;
- (id)didAcceptCandidate:(id)a3;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)markedText;
- (id)rawInputString;
- (id)syncKeyboardStateHandler;
- (id)wordCharacters;
- (id)wordSearch;
- (int64_t)transliterationType;
- (unint64_t)index;
- (unint64_t)phraseBoundary;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)_selectPartialCandidate:(id)a3 forOperation:(id)a4;
- (void)finishSyncToKeyboardState;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)selectCandidate:(id)a3;
- (void)setCurrentCandidate:(id)a3;
- (void)setLiveConversionSegments:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setShouldShowCandidateWindow:(BOOL)a3;
- (void)setSupportsSetPhraseBoundary:(BOOL)a3;
- (void)setSyncKeyboardStateHandler:(id)a3;
- (void)setTransliterationType:(int64_t)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
@end

@implementation TIKeyboardInputManager_ja_SegmentPicker

- (TIKeyboardInputManager_ja_SegmentPicker)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 wordSearch:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_ja_SegmentPicker;
  v14 = [(TIKeyboardInputManagerMecabra *)&v18 initWithConfig:a3 keyboardState:a4];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_wordSearch, a7);
    v16 = [[TILiveConversionSegments alloc] initWithSegments:v12 at:a6];
    [(TIKeyboardInputManager_ja_SegmentPicker *)v15 setLiveConversionSegments:v16];

    [(TIKeyboardInputManager_ja_SegmentPicker *)v15 setSupportsSetPhraseBoundary:1];
    [(TIKeyboardInputManager_ja_SegmentPicker *)v15 setShouldShowCandidateWindow:1];
  }

  return v15;
}

- (BOOL)usesCandidateSelection
{
  return 1;
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

- (id)keyEventMap
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E580]);
  return v2;
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
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  if ([v4 transliterationType])
  {
    uint64_t v5 = [v4 transliterationType];

    [(TIKeyboardInputManager_ja_SegmentPicker *)self setTransliterationType:v5];
LABEL_5:
    id v8 = objc_alloc_init(MEMORY[0x263F7E678]);
    goto LABEL_7;
  }
  v6 = [v4 string];

  int v7 = [v6 _isSpace];
  if (v7)
  {
    [(TIKeyboardInputManager_ja_SegmentPicker *)self setShouldShowCandidateWindow:1];
    goto LABEL_5;
  }
  v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  [v9 commit];

  [(TIKeyboardInputManagerMecabra *)self completeComposition];
  id v8 = 0;
LABEL_7:
  return v8;
}

- (id)markedText
{
  v3 = [(TIKeyboardInputManager_ja_SegmentPicker *)self rawInputString];
  id v4 = [(TIKeyboardInputManager_ja_SegmentPicker *)self inputString];
  uint64_t v5 = [(TIKeyboardInputManager_ja_SegmentPicker *)self inputIndex];
  v6 = [(TIKeyboardInputManager_ja_SegmentPicker *)self searchStringForMarkedText];
  int v7 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  id v8 = [v7 segmentRanges];

  v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  v10 = [v9 autoCommitString];
  uint64_t v11 = [v10 length];

  id v12 = (void *)MEMORY[0x263F7E658];
  id v13 = (void *)[v8 copy];
  unint64_t v14 = [(TIKeyboardInputManager_ja_SegmentPicker *)self index];
  v15 = [(TIKeyboardInputManager_ja_SegmentPicker *)self lastInputString];
  v16 = [v12 intermediateTextWithInputString:v3 displayString:v4 selectionLocation:v5 searchString:v6 candidateOffset:v11 liveConversionSegments:v13 highlightSegmentIndex:v14 lastInputString:v15];

  return v16;
}

- (id)rawInputString
{
  id v2 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  v3 = [v2 rawInputString];

  return v3;
}

- (id)inputString
{
  id v2 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  v3 = [v2 inputString];

  return v3;
}

- (unsigned)inputIndex
{
  id v2 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  unsigned int v3 = [v2 inputIndex];

  return v3;
}

- (unsigned)inputCount
{
  id v2 = [(TIKeyboardInputManager_ja_SegmentPicker *)self rawInputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  id v4 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  [v4 setPhraseBoundary:a3];
}

- (unint64_t)phraseBoundary
{
  return [(TIKeyboardInputManager_ja_SegmentPicker *)self inputIndex];
}

- (unint64_t)index
{
  id v2 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  unint64_t v3 = [v2 index];

  return v3;
}

- (NSArray)segments
{
  id v2 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  unint64_t v3 = [v2 rawSegments];

  return (NSArray *)v3;
}

- (id)candidateResultSet
{
  unint64_t v3 = [(TIKeyboardInputManager_ja_SegmentPicker *)self index];
  id v4 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
  if (v3 >= [v4 count]) {
    goto LABEL_7;
  }
  BOOL v5 = [(TIKeyboardInputManager_ja_SegmentPicker *)self shouldShowCandidateWindow];

  if (v5)
  {
    v6 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
    int v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));
    id v4 = [v7 reading];

    if ([v4 length])
    {
      id v8 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
      objc_msgSend(v8, "setAutoSelectTransliterateCandidate:", -[TIKeyboardInputManager_ja_SegmentPicker transliterationType](self, "transliterationType"));
      v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
      v10 = objc_msgSend(v9, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));
      uint64_t v11 = [v10 surface];
      [v8 setAutoSelectCandidate:v11];

      id v12 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
      id v13 = [v12 autoCommitString];
      unint64_t v14 = [(TIKeyboardInputManager_ja_SegmentPicker *)self contextBeforeWithDesiredLength:20];
      v15 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      int v16 = [v8 makeCandidatesWithInputString:v4 autoCommitString:v13 contextString:v14 predictionEnabled:0 reanalysisMode:1 singlePhrase:1 geometoryModelData:v15];

      v17 = [MEMORY[0x263F7E638] dummySet];
      if (v16)
      {
        objc_super v18 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
        v19 = [(TIKeyboardInputManager_ja_SegmentPicker *)self rawInputString];
        [(TIKeyboardInputManagerMecabra *)self updateProactiveCandidatesForCandidateResultSet:v18 withInput:v19];

        v20 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
        uint64_t v21 = [(TIKeyboardInputManagerMecabra *)self candidateResultSetFromWordSearchCandidateResultSet:v20];

        v17 = (void *)v21;
      }

      goto LABEL_8;
    }
LABEL_7:
    v17 = 0;
LABEL_8:

    goto LABEL_10;
  }
  v17 = 0;
LABEL_10:
  return v17;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (!v5)
  {
    v6 = [TIKeyboardInputManager_ja_Candidates alloc];
    int v7 = [(TIKeyboardInputManager_ja_SegmentPicker *)self config];
    id v8 = [(TIKeyboardInputManager_ja_SegmentPicker *)self keyboardState];
    v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self wordSearch];
    v10 = [(TIKeyboardInputManager_ja_Candidates *)v6 initWithConfig:v7 keyboardState:v8 wordSearch:v9];
    [(TIKeyboardInputManagerMecabra *)self composeTextWith:v10];

    uint64_t v11 = [(TIKeyboardInputManager_ja_SegmentPicker *)self candidateRange];
    uint64_t v13 = v12;
    unint64_t v14 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_msgSend(v14, "setCandidateRange:", v11, v13);
  }
  [v4 open];
  v15 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v16 = objc_alloc(MEMORY[0x263F7EA38]);
  uint64_t v19 = MEMORY[0x263EF8330];
  uint64_t v20 = 3221225472;
  uint64_t v21 = __94__TIKeyboardInputManager_ja_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke;
  v22 = &unk_2650FA8E8;
  v23 = self;
  id v24 = v4;
  id v17 = v4;
  objc_super v18 = (void *)[v16 initWithWrappedCandidateHandler:v17 resultSetHandlerBlock:&v19];
  objc_msgSend(v15, "openCandidateGenerationContextWithCandidateHandler:", v18, v19, v20, v21, v22, v23);
}

- (BOOL)closeCandidateGenerationContextWithResults:(id)a3
{
  unint64_t v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  [v3 cancelComposition];

  return 1;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [v4 isTransliterationCandidate] ^ 1;
  }
  else {
    char v5 = 0;
  }
  BOOL v6 = [(TIKeyboardInputManager_ja_SegmentPicker *)self shouldShowCandidateWindow];
  int v7 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
  id v8 = v7;
  if (!v6 || (v5 & 1) != 0)
  {
    [v7 clear];

    [(TIKeyboardInputManagerMecabra *)self completeComposition];
    uint64_t v13 = [v4 candidate];
  }
  else
  {
    v9 = [v7 currentCandidate];
    char v10 = [v9 isEqual:v4];

    if ((v10 & 1) == 0) {
      [(TIKeyboardInputManager_ja_SegmentPicker *)self selectCandidate:v4];
    }
    uint64_t v11 = [(TIKeyboardInputManager_ja_SegmentPicker *)self rawInputString];
    uint64_t v12 = [(TIKeyboardInputManager_ja_SegmentPicker *)self keyboardState];
    [v12 setInputForMarkedText:v11];

    [(TIKeyboardInputManager_ja_SegmentPicker *)self setShouldShowCandidateWindow:0];
    uint64_t v13 = &stru_26F5DD710;
  }

  return v13;
}

- (BOOL)syncToKeyboardState:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 currentCandidate];
  unint64_t v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self index];
  char v10 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
  unint64_t v11 = [v10 count];

  if (v9 >= v11) {
    goto LABEL_6;
  }
  uint64_t v12 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
  uint64_t v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));

  if (!v8)
  {

LABEL_6:
    [(TIKeyboardInputManager_ja_SegmentPicker *)self setTransliterationType:0];
    goto LABEL_7;
  }
  unint64_t v14 = [v13 reading];
  unint64_t v15 = [v14 length];
  id v16 = [v8 input];
  unint64_t v17 = [v16 length];

  [(TIKeyboardInputManager_ja_SegmentPicker *)self setTransliterationType:0];
  if (v15 <= v17)
  {
LABEL_7:
    BOOL v20 = 0;
    goto LABEL_8;
  }
  objc_super v18 = (void *)MEMORY[0x24563C640](v7);
  id syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
  self->_id syncKeyboardStateHandler = v18;

  [(TIKeyboardInputManager_ja_SegmentPicker *)self setSupportsSetPhraseBoundary:0];
  v22.receiver = self;
  v22.super_class = (Class)TIKeyboardInputManager_ja_SegmentPicker;
  [(TIKeyboardInputManagerBase *)&v22 syncToKeyboardState:v6];
  BOOL v20 = 1;
  [(TIKeyboardInputManager_ja_SegmentPicker *)self setSupportsSetPhraseBoundary:1];
LABEL_8:

  return v20;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  char v10 = [v9 currentCandidate];
  unint64_t v11 = [v10 candidate];
  uint64_t v12 = [v11 length];
  uint64_t v13 = [v10 label];
  uint64_t v14 = [v13 length];

  unint64_t v15 = [(TIKeyboardInputManager_ja_SegmentPicker *)self index];
  if (v10)
  {
    unint64_t v16 = v12 - v14;
    if ((v16 & 0x8000000000000000) != 0)
    {
LABEL_9:
      [(TIKeyboardInputManager_ja_SegmentPicker *)self finishSyncToKeyboardState];
      goto LABEL_10;
    }
    unint64_t v17 = v15;
    objc_super v18 = [v10 candidate];
    if (v16 > [v18 length])
    {
LABEL_4:

      goto LABEL_9;
    }
    uint64_t v19 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
    unint64_t v20 = [v19 count];

    if (v17 >= v20) {
      goto LABEL_9;
    }
    uint64_t v21 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
    objc_super v18 = objc_msgSend(v21, "_surfaceStringWithin:", 0, v17);

    objc_super v22 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
    v23 = [v22 objectAtIndexedSubscript:v17];
    id v24 = [v23 reading];

    v25 = [v10 candidate];
    v26 = [v25 substringToIndex:v16];

    v27 = [v10 input];
    if (![v24 hasPrefix:v27])
    {

      goto LABEL_4;
    }
    int v28 = [v18 isEqualToString:v26];

    if (!v28) {
      goto LABEL_9;
    }
    [(TIKeyboardInputManager_ja_SegmentPicker *)self selectCandidate:v10];
  }
LABEL_10:
  [(TIKeyboardInputManager_ja_SegmentPicker *)self setSupportsSetPhraseBoundary:0];
  v29.receiver = self;
  v29.super_class = (Class)TIKeyboardInputManager_ja_SegmentPicker;
  [(TIKeyboardInputManagerMecabra *)&v29 syncToKeyboardState:v9 from:v8 afterContextChange:v5];

  [(TIKeyboardInputManager_ja_SegmentPicker *)self setSupportsSetPhraseBoundary:1];
}

- (void)selectCandidate:(id)a3
{
  id v26 = a3;
  unint64_t v4 = [(TIKeyboardInputManager_ja_SegmentPicker *)self index];
  BOOL v5 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
  unint64_t v6 = [v5 count];

  if (v4 < v6)
  {
    id v7 = [(TIKeyboardInputManager_ja_SegmentPicker *)self segments];
    id v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_ja_SegmentPicker index](self, "index"));

    id v9 = [v8 reading];
    unint64_t v10 = [v9 length];
    unint64_t v11 = [v26 input];
    unint64_t v12 = [v11 length];

    if (v10 <= v12)
    {
      unint64_t v15 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
      [v15 didUpdateCandidate:v26 with:0];
    }
    else
    {
      [(TIKeyboardInputManager_ja_SegmentPicker *)self setCurrentCandidate:v26];
      uint64_t v13 = [v8 reading];
      uint64_t v14 = [v26 input];
      unint64_t v15 = objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v14, "length"));

      unint64_t v16 = [TIWordSearchJapaneseOperationGetCandidates alloc];
      unint64_t v17 = [(TIKeyboardInputManager_ja_SegmentPicker *)self wordSearch];
      objc_super v18 = [(TIKeyboardInputManager_ja_SegmentPicker *)self contextBeforeWithDesiredLength:20];
      uint64_t v19 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
      BYTE2(v25) = 1;
      LOWORD(v25) = 0;
      LOBYTE(v24) = 1;
      unint64_t v20 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v16, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v17, v15, 0, v18, 0x7FFFFFFFFFFFFFFFLL, 0, v24, 0, 0, 0, v19, v25, 0);

      [(TIWordSearchJapaneseOperationGetCandidates *)v20 setSinglePhrase:1];
      uint64_t v21 = [(TIWordSearchJapaneseOperationGetCandidates *)v20 results];

      if (!v21)
      {
        objc_super v22 = [(TIKeyboardInputManager_ja_SegmentPicker *)self wordSearch];
        [v22 performOperationAsync:v20];

        [(TIWordSearchJapaneseOperationGetCandidates *)v20 waitUntilFinished];
      }
      v23 = [(TIWordSearchJapaneseOperationGetCandidates *)v20 results];
      [(TIKeyboardInputManager_ja_SegmentPicker *)self _selectPartialCandidate:v23 forOperation:v20];
    }
  }
}

- (void)_selectPartialCandidate:(id)a3 forOperation:(id)a4
{
  BOOL v5 = [a3 candidates];
  id v11 = [v5 firstObject];

  if (v11)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F7EB10]);
    id v7 = [v11 input];
    [v6 setReading:v7];

    id v8 = [v11 candidate];
    [v6 setSurface:v8];

    id v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
    unint64_t v10 = [(TIKeyboardInputManager_ja_SegmentPicker *)self currentCandidate];
    [v9 didUpdateCandidate:v10 with:v6];

    [(TIKeyboardInputManager_ja_SegmentPicker *)self setCurrentCandidate:0];
    [(TIKeyboardInputManager_ja_SegmentPicker *)self finishSyncToKeyboardState];
  }
}

- (void)finishSyncToKeyboardState
{
  if (self->_syncKeyboardStateHandler)
  {
    unint64_t v3 = [(TIKeyboardInputManager_ja_SegmentPicker *)self syncKeyboardStateHandler];
    unint64_t v4 = [(TIKeyboardInputManagerMecabra *)self keyboardConfiguration];
    ((void (**)(void, void *))v3)[2](v3, v4);

    id syncKeyboardStateHandler = self->_syncKeyboardStateHandler;
    self->_id syncKeyboardStateHandler = 0;
  }
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  BOOL v5 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[TIKeyboardInputManager_ja_SegmentPicker _adjustPhraseBoundaryInForwardDirection:granularity:]";
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    int v17 = a4;
    _os_log_impl(&dword_241DFD000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  adjust phrase: %d %d", (uint8_t *)&v12, 0x18u);
  }
  if (a4)
  {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  else
  {
    id v7 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
    int v8 = [v7 canMove:v5];

    if (v8)
    {
      id v9 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
      [v9 commit];

      unint64_t v10 = [(TIKeyboardInputManager_ja_SegmentPicker *)self liveConversionSegments];
      [v10 move:v5];
    }
  }
  return a4 == 0;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (id)syncKeyboardStateHandler
{
  return self->_syncKeyboardStateHandler;
}

- (void)setSyncKeyboardStateHandler:(id)a3
{
}

- (TILiveConversionSegments)liveConversionSegments
{
  return self->_liveConversionSegments;
}

- (void)setLiveConversionSegments:(id)a3
{
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
}

- (BOOL)supportsSetPhraseBoundary
{
  return self->_supportsSetPhraseBoundary;
}

- (void)setSupportsSetPhraseBoundary:(BOOL)a3
{
  self->_supportsSetPhraseBoundary = a3;
}

- (BOOL)shouldShowCandidateWindow
{
  return self->_shouldShowCandidateWindow;
}

- (void)setShouldShowCandidateWindow:(BOOL)a3
{
  self->_shouldShowCandidateWindow = a3;
}

- (int64_t)transliterationType
{
  return self->_transliterationType;
}

- (void)setTransliterationType:(int64_t)a3
{
  self->_transliterationType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_liveConversionSegments, 0);
  objc_storeStrong(&self->_syncKeyboardStateHandler, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end