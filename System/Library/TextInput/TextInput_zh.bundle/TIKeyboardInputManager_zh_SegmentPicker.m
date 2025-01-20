@interface TIKeyboardInputManager_zh_SegmentPicker
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)closeCandidateGenerationContextWithResults:(id)a3;
- (BOOL)commitsAcceptedCandidate;
- (BOOL)delayedCandidateList;
- (BOOL)shouldShowCandidateWindow;
- (BOOL)supportsNumberKeySelection;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSArray)segments;
- (NSMutableArray)originalSegments;
- (NSString)alternateDisplayString;
- (NSString)autoCommitString;
- (NSString)inputString;
- (NSString)rawInputString;
- (TIKeyboardInputManager_zh_SegmentPicker)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 wordSearch:(id)a7;
- (TIWordSearch)kbws;
- (id)candidateResultSet;
- (id)convertString;
- (id)didAcceptCandidate:(id)a3;
- (id)handleKeyboardInput:(id)a3;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)markedText;
- (id)wordCharacters;
- (unint64_t)index;
- (unint64_t)phraseBoundary;
- (unsigned)inputIndex;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)selectCandidate:(id)a3;
- (void)setAlternateDisplayString:(id)a3;
- (void)setAutoCommitString:(id)a3;
- (void)setInputIndex:(unsigned int)a3;
- (void)setInputString:(id)a3;
- (void)setKbws:(id)a3;
- (void)setOriginalSegments:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setRawInputString:(id)a3;
- (void)setShouldShowCandidateWindow:(BOOL)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)updateMarkedText;
@end

@implementation TIKeyboardInputManager_zh_SegmentPicker

- (NSArray)segments
{
  return (NSArray *)self->_segments;
}

- (TIKeyboardInputManager_zh_SegmentPicker)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 at:(unint64_t)a6 wordSearch:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardInputManager_zh_SegmentPicker;
  v14 = [(TIKeyboardInputManagerMecabra *)&v20 initWithConfig:a3 keyboardState:a4];
  if (v14)
  {
    uint64_t v15 = [v12 mutableCopy];
    segments = v14->_segments;
    v14->_segments = (NSMutableArray *)v15;

    v14->_index = a6;
    objc_storeStrong((id *)&v14->_kbws, a7);
    uint64_t v17 = [v12 mutableCopy];
    originalSegments = v14->_originalSegments;
    v14->_originalSegments = (NSMutableArray *)v17;

    v14->_shouldShowCandidateWindow = 1;
    [(TIKeyboardInputManager_zh_SegmentPicker *)v14 updateMarkedText];
  }

  return v14;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)supportsNumberKeySelection
{
  return 1;
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E620]);
  return v2;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5C0] sharedInstance];
}

- (BOOL)usesLiveConversion
{
  return 1;
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] zhuyinWordCharacters];
}

- (BOOL)commitsAcceptedCandidate
{
  return 0;
}

- (id)handleKeyboardInput:(id)a3
{
  v4 = [a3 string];
  int v5 = [v4 _isSpace];

  if (v5) {
    [(TIKeyboardInputManager_zh_SegmentPicker *)self setShouldShowCandidateWindow:1];
  }
  else {
    [(TIKeyboardInputManagerMecabra *)self cancelComposition];
  }
  return 0;
}

- (NSString)inputString
{
  v3 = self->_inputString;
  v4 = [(TIKeyboardInputManager_zh_SegmentPicker *)self alternateDisplayString];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManager_zh_SegmentPicker *)self alternateDisplayString];

    v3 = (NSString *)v5;
  }
  return v3;
}

- (void)updateMarkedText
{
  id v17 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  uint64_t v5 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    do
    {
      v9 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
      v10 = [v9 objectAtIndexedSubscript:v7];

      v11 = [v10 reading];
      [v17 appendString:v11];

      id v12 = [v10 surface];
      [v3 appendString:v12];

      if ([(TIKeyboardInputManager_zh_SegmentPicker *)self index] >= v7)
      {
        id v13 = [v10 surface];
        uint64_t v8 = v8 + [v13 length];
      }
      if ([(TIKeyboardInputManager_zh_SegmentPicker *)self index] > v7)
      {
        v14 = [v10 surface];
        [v4 appendString:v14];
      }
      ++v7;
      uint64_t v15 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
      unint64_t v16 = [v15 count];
    }
    while (v16 > v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  [(TIKeyboardInputManager_zh_SegmentPicker *)self setRawInputString:v17];
  [(TIKeyboardInputManager_zh_SegmentPicker *)self setInputString:v3];
  [(TIKeyboardInputManager_zh_SegmentPicker *)self setInputIndex:v8];
  [(TIKeyboardInputManager_zh_SegmentPicker *)self setAutoCommitString:v4];
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  uint64_t v5 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__TIKeyboardInputManager_zh_SegmentPicker_setPhraseBoundary___block_invoke;
  v6[3] = &unk_2650FE6E0;
  v6[5] = v7;
  v6[6] = a3;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];

  [(TIKeyboardInputManager_zh_SegmentPicker *)self updateMarkedText];
  _Block_object_dispose(v7, 8);
}

- (unint64_t)phraseBoundary
{
  return [(TIKeyboardInputManager_zh_SegmentPicker *)self inputIndex];
}

- (id)markedText
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v25 = [(TIKeyboardInputManager_zh_SegmentPicker *)self rawInputString];
  v24 = [(TIKeyboardInputManager_zh_SegmentPicker *)self inputString];
  unsigned int v21 = [(TIKeyboardInputManager_zh_SegmentPicker *)self inputIndex];
  v23 = [(TIKeyboardInputManager_zh_SegmentPicker *)self searchStringForMarkedText];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v22 = self;
  id v4 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
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
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v11 = [v10 surface];
        uint64_t v12 = [v11 length];

        id v13 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v7, v12);
        [v3 addObject:v13];

        v14 = [v10 surface];
        v7 += [v14 length];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v15 = (void *)MEMORY[0x263F7E658];
  unint64_t v16 = [(TIKeyboardInputManager_zh_SegmentPicker *)v22 autoCommitString];
  uint64_t v17 = [v16 length];
  v18 = (void *)[v3 copy];
  v19 = objc_msgSend(v15, "intermediateTextWithInputString:displayString:selectionLocation:searchString:candidateOffset:liveConversionSegments:highlightSegmentIndex:lastInputString:", v25, v24, v21, v23, v17, v18, -[TIKeyboardInputManager_zh_SegmentPicker index](v22, "index"), 0);

  return v19;
}

- (id)convertString
{
  id v3 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
  id v4 = objc_msgSend(v3, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"));
  uint64_t v5 = [v4 reading];

  return v5;
}

- (id)candidateResultSet
{
  unint64_t v3 = [(TIKeyboardInputManager_zh_SegmentPicker *)self index];
  id v4 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
  if (v3 >= [v4 count]) {
    goto LABEL_6;
  }
  BOOL v5 = [(TIKeyboardInputManager_zh_SegmentPicker *)self shouldShowCandidateWindow];

  if (v5)
  {
    id v4 = [(TIKeyboardInputManager_zh_SegmentPicker *)self convertString];
    if ([v4 length])
    {
      uint64_t v6 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
      uint64_t v7 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
      uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"));
      v9 = [v8 surface];

      if ((unint64_t)[v9 length] < 2)
      {
        v10 = [MEMORY[0x263EFFA08] setWithObject:v9];
        [v6 setAutoSelectCandidates:v10];
      }
      else
      {
        v10 = [v9 _lastGrapheme];
        v11 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", v9, v10, 0);
        [v6 setAutoSelectCandidates:v11];
      }
      v14 = [(TIKeyboardInputManager_zh_SegmentPicker *)self rawInputString];
      [v6 setSyntheticCandidate:v14];

      uint64_t v15 = [(TIKeyboardInputManager_zh_SegmentPicker *)self autoCommitString];
      unint64_t v16 = [(TIKeyboardInputManagerMecabra *)self geometryDataArray];
      int v17 = [v6 makeCandidatesWithInputString:v4 autoCommitString:v15 predictionEnabled:0 reanalysisMode:1 geometoryModelData:v16];

      uint64_t v12 = [MEMORY[0x263F7E638] dummySet];
      if (v17)
      {
        v18 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
        v19 = [(TIKeyboardInputManager_zh_SegmentPicker *)self rawInputString];
        [(TIKeyboardInputManagerMecabra *)self updateProactiveCandidatesForCandidateResultSet:v18 withInput:v19];

        objc_super v20 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
        uint64_t v21 = [(TIKeyboardInputManagerMecabra *)self candidateResultSetFromWordSearchCandidateResultSet:v20];

        uint64_t v12 = (void *)v21;
      }

      goto LABEL_7;
    }
LABEL_6:
    uint64_t v12 = 0;
LABEL_7:

    goto LABEL_9;
  }
  uint64_t v12 = 0;
LABEL_9:
  return v12;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];

  if (!v5)
  {
    uint64_t v6 = [TIKeyboardInputManager_zh_Candidates alloc];
    uint64_t v7 = [(TIKeyboardInputManager_zh_SegmentPicker *)self config];
    uint64_t v8 = [(TIKeyboardInputManager_zh_SegmentPicker *)self keyboardState];
    v9 = [(TIKeyboardInputManager_zh_Candidates *)v6 initWithConfig:v7 keyboardState:v8 wordSearch:self->_kbws];
    [(TIKeyboardInputManagerMecabra *)self composeTextWith:v9];

    uint64_t v10 = [(TIKeyboardInputManager_zh_SegmentPicker *)self candidateRange];
    uint64_t v12 = v11;
    id v13 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    objc_msgSend(v13, "setCandidateRange:", v10, v12);
  }
  [v4 open];
  v14 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  id v15 = objc_alloc(MEMORY[0x263F7EA38]);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  objc_super v20 = __94__TIKeyboardInputManager_zh_SegmentPicker_openCandidateGenerationContextWithCandidateHandler___block_invoke;
  uint64_t v21 = &unk_2650FE708;
  v22 = self;
  id v23 = v4;
  id v16 = v4;
  int v17 = (void *)[v15 initWithWrappedCandidateHandler:v16 resultSetHandlerBlock:&v18];
  objc_msgSend(v14, "openCandidateGenerationContextWithCandidateHandler:", v17, v18, v19, v20, v21, v22);
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
  BOOL v5 = [(TIKeyboardInputManager_zh_SegmentPicker *)self rawInputString];
  unint64_t v6 = [v5 length];
  uint64_t v7 = [v4 input];
  if (v6 <= [v7 length])
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  if (![(TIKeyboardInputManager_zh_SegmentPicker *)self shouldShowCandidateWindow]
    || (isKindOfClass & 1) != 0)
  {
    uint64_t v11 = [(TIKeyboardInputManager_zh_SegmentPicker *)self inputString];
    [(NSMutableArray *)self->_segments removeAllObjects];
    [(NSMutableArray *)self->_originalSegments removeAllObjects];
    self->_index = 0;
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  else
  {
    [(TIKeyboardInputManager_zh_SegmentPicker *)self selectCandidate:v4];
    v9 = [(TIKeyboardInputManager_zh_SegmentPicker *)self inputString];
    uint64_t v10 = [(TIKeyboardInputManager_zh_SegmentPicker *)self keyboardState];
    [v10 setInputForMarkedText:v9];

    [(TIKeyboardInputManager_zh_SegmentPicker *)self setShouldShowCandidateWindow:0];
    uint64_t v11 = &stru_26F5E6580;
  }

  return v11;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_zh_SegmentPicker;
  id v8 = a3;
  [(TIKeyboardInputManagerMecabra *)&v10 syncToKeyboardState:v8 from:a4 afterContextChange:v5];
  v9 = objc_msgSend(v8, "currentCandidate", v10.receiver, v10.super_class);

  if (v9) {
    [(TIKeyboardInputManager_zh_SegmentPicker *)self selectCandidate:v9];
  }
}

- (void)selectCandidate:(id)a3
{
  id v19 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263F7EB10]);
  [(TIKeyboardInputManager_zh_SegmentPicker *)self setAlternateDisplayString:0];
  BOOL v5 = [v19 candidate];
  int v6 = [v5 _containsBopomofoOnly];

  if (v6)
  {
    uint64_t v7 = [v19 candidate];
    [(TIKeyboardInputManager_zh_SegmentPicker *)self setAlternateDisplayString:v7];
  }
  id v8 = [v19 input];
  unint64_t v9 = [v8 length];
  objc_super v10 = [(TIKeyboardInputManager_zh_SegmentPicker *)self convertString];
  unint64_t v11 = [v10 length];

  if (v9 >= v11)
  {
    v14 = [v19 label];
    [v4 setSurface:v14];
  }
  else
  {
    uint64_t v12 = [(TIKeyboardInputManager_zh_SegmentPicker *)self originalSegments];
    id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", -[TIKeyboardInputManager_zh_SegmentPicker index](self, "index"));
    v14 = [v13 surface];

    id v15 = [v14 _stringByTrimmingLastCharacter];
    id v16 = [v19 label];
    int v17 = [v15 stringByAppendingString:v16];
    [v4 setSurface:v17];
  }
  uint64_t v18 = [(TIKeyboardInputManager_zh_SegmentPicker *)self convertString];
  [v4 setReading:v18];

  [(NSMutableArray *)self->_segments replaceObjectAtIndex:[(TIKeyboardInputManager_zh_SegmentPicker *)self index] withObject:v4];
  [(TIKeyboardInputManager_zh_SegmentPicker *)self updateMarkedText];
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (TICanLogMessageAtLevel())
  {
    uint64_t v7 = TIOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManager_zh_SegmentPicker _adjustPhraseBoundaryInForwardDirection:granularity:](a3, v4, v7);
    }
  }
  if (v4 == 4) {
    goto LABEL_15;
  }
  if (!v4
    && [(TIKeyboardInputManager_zh_SegmentPicker *)self shouldShowCandidateWindow])
  {
    unint64_t v8 = [(TIKeyboardInputManager_zh_SegmentPicker *)self index];
    unint64_t v9 = v8;
    if (a3)
    {
      objc_super v10 = [(TIKeyboardInputManager_zh_SegmentPicker *)self segments];
      uint64_t v11 = [v10 count] - 1;

      uint64_t v12 = 1;
      if (v9 == v11) {
        return v12;
      }
    }
    else
    {
      if (!v8)
      {
LABEL_15:
        LOBYTE(v12) = 1;
        return v12;
      }
      uint64_t v12 = -1;
    }
    self->_index = [(TIKeyboardInputManager_zh_SegmentPicker *)self index] + v12;
    [(TIKeyboardInputManager_zh_SegmentPicker *)self updateMarkedText];
    goto LABEL_15;
  }
  [(TIKeyboardInputManagerMecabra *)self completeComposition];
  LOBYTE(v12) = 0;
  return v12;
}

- (unint64_t)index
{
  return self->_index;
}

- (TIWordSearch)kbws
{
  return self->_kbws;
}

- (void)setKbws:(id)a3
{
}

- (NSString)rawInputString
{
  return self->_rawInputString;
}

- (void)setRawInputString:(id)a3
{
}

- (void)setInputString:(id)a3
{
}

- (NSString)autoCommitString
{
  return self->_autoCommitString;
}

- (void)setAutoCommitString:(id)a3
{
}

- (unsigned)inputIndex
{
  return self->_inputIndex;
}

- (void)setInputIndex:(unsigned int)a3
{
  self->_inputIndex = a3;
}

- (NSMutableArray)originalSegments
{
  return self->_originalSegments;
}

- (void)setOriginalSegments:(id)a3
{
}

- (NSString)alternateDisplayString
{
  return self->_alternateDisplayString;
}

- (void)setAlternateDisplayString:(id)a3
{
}

- (BOOL)shouldShowCandidateWindow
{
  return self->_shouldShowCandidateWindow;
}

- (void)setShouldShowCandidateWindow:(BOOL)a3
{
  self->_shouldShowCandidateWindow = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDisplayString, 0);
  objc_storeStrong((id *)&self->_originalSegments, 0);
  objc_storeStrong((id *)&self->_autoCommitString, 0);
  objc_storeStrong((id *)&self->_inputString, 0);
  objc_storeStrong((id *)&self->_rawInputString, 0);
  objc_storeStrong((id *)&self->_kbws, 0);
  objc_storeStrong((id *)&self->_segments, 0);
}

- (void)_adjustPhraseBoundaryInForwardDirection:(NSObject *)a3 granularity:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s adjust phrase: %d %d", "-[TIKeyboardInputManager_zh_SegmentPicker _adjustPhraseBoundaryInForwardDirection:granularity:]", a1 & 1, a2);
  *(_DWORD *)buf = 138412290;
  int v6 = v4;
  _os_log_debug_impl(&dword_241E5B000, a3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

@end