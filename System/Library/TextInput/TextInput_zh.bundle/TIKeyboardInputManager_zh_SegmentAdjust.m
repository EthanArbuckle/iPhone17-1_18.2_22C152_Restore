@interface TIKeyboardInputManager_zh_SegmentAdjust
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)delayedCandidateList;
- (BOOL)supportsNumberKeySelection;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSArray)segments;
- (TIKeyboardCandidate)currentCandidate;
- (TIKeyboardInputManager_zh_SegmentAdjust)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 inputManager:(id)a6 wordSearch:(id)a7;
- (TIMecabraIMLogger)logger;
- (TIZhuyinInputManager)inputManager;
- (id)convertString;
- (id)didAcceptCandidate:(id)a3;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)wordCharacters;
- (id)wordSearch;
- (int64_t)segmentIndex;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)clearInput;
- (void)setCurrentCandidate:(id)a3;
- (void)setInputManager:(id)a3;
- (void)setSegmentIndex:(int64_t)a3;
- (void)setSegments:(id)a3;
@end

@implementation TIKeyboardInputManager_zh_SegmentAdjust

- (TIKeyboardInputManager_zh_SegmentAdjust)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 inputManager:(id)a6 wordSearch:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardInputManager_zh_SegmentAdjust;
  v16 = [(TIKeyboardInputManagerMecabra *)&v21 initWithConfig:a3 keyboardState:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wordSearch, a7);
    objc_storeStrong((id *)&v17->_inputManager, a6);
    objc_storeStrong((id *)&v17->_segments, a5);
    if ([MEMORY[0x263F7EB08] isLoggingEnabled])
    {
      v18 = (TIMecabraIMLogger *)objc_alloc_init(MEMORY[0x263F7EB08]);
      logger = v17->_logger;
      v17->_logger = v18;
    }
  }

  return v17;
}

- (BOOL)supportsSetPhraseBoundary
{
  return 1;
}

- (BOOL)supportsNumberKeySelection
{
  return 1;
}

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5C0] sharedInstance];
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

- (id)wordSearch
{
  return self->_wordSearch;
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] zhuyinWordCharacters];
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
  v3 = self;
  uint64_t v54 = *MEMORY[0x263EF8340];
  v4 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
  v5 = [v4 composedText];

  v6 = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 inputManager];
  v7 = [v6 inputBuffer];

  v8 = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 inputManager];
  if ([v8 cursorLocation])
  {
    v9 = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 inputManager];
    unint64_t v10 = [v9 cursorLocation];
  }
  else
  {
    unint64_t v10 = 1;
  }

  v11 = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 inputManager];
  int64_t v12 = [v11 inputBufferIndexOf:v10];

  if (v10 < [v5 length] && v12 < (unint64_t)objc_msgSend(v7, "length"))
  {
    int64_t v46 = v10;
    v40 = v7;
    v41 = v5;
    id v13 = (void *)MEMORY[0x263EFF980];
    id v14 = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 segments];
    v47 = objc_msgSend(v13, "arrayWithCapacity:", objc_msgSend(v14, "count") + 1);

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v42 = v3;
    id obj = [(TIKeyboardInputManager_zh_SegmentAdjust *)v3 segments];
    uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v48)
    {
      int64_t v15 = 0;
      int64_t v16 = 0;
      uint64_t v45 = *(void *)v50;
      int64_t v43 = v12;
      do
      {
        uint64_t v17 = 0;
        int64_t v18 = v15;
        int64_t v19 = v16;
        do
        {
          if (*(void *)v50 != v45) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v49 + 1) + 8 * v17);
          objc_super v21 = [v20 surface];
          uint64_t v22 = [v21 length];

          v23 = [v20 reading];
          uint64_t v24 = [v23 length];

          int64_t v15 = v22 + v18;
          int64_t v16 = v24 + v19;
          uint64_t v25 = v46 - v18;
          if (v46 > v18 && (v46 < v15 ? (BOOL v26 = v12 <= v19) : (BOOL v26 = 1), !v26 ? (v27 = v12 < v16) : (v27 = 0), v27))
          {
            id v28 = objc_alloc_init(MEMORY[0x263F7EB10]);
            v29 = [v20 surface];
            v30 = [v29 substringToIndex:v25];
            [v28 setSurface:v30];

            v31 = [v20 reading];
            int64_t v32 = v12 - v19;
            v33 = [v31 substringToIndex:v12 - v19];
            [v28 setReading:v33];

            [v47 addObject:v28];
            id v34 = objc_alloc_init(MEMORY[0x263F7EB10]);
            v35 = [v20 surface];
            v36 = [v35 substringFromIndex:v25];
            [v34 setSurface:v36];

            v37 = [v20 reading];
            v38 = [v37 substringFromIndex:v32];
            [v34 setReading:v38];

            int64_t v12 = v43;
            [v47 addObject:v34];
          }
          else
          {
            [v47 addObject:v20];
          }
          ++v17;
          int64_t v18 = v15;
          int64_t v19 = v16;
        }
        while (v48 != v17);
        uint64_t v48 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      }
      while (v48);
    }

    v3 = v42;
    [(TIKeyboardInputManager_zh_SegmentAdjust *)v42 setSegments:v47];

    v7 = v40;
    v5 = v41;
  }
  [(TIKeyboardInputManagerMecabra *)v3 completeComposition];

  return 0;
}

- (unsigned)inputIndex
{
  v3 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self currentCandidate];

  if (v3)
  {
    v4 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self currentCandidate];
    v5 = [v4 candidate];
    unsigned int v6 = [v5 length];
  }
  else
  {
    v4 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
    unsigned int v6 = [v4 cursorLocation];
  }

  return v6;
}

- (unsigned)inputCount
{
  id v2 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (id)inputString
{
  unsigned int v3 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self segments];
  v4 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self segments];
  v5 = objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));

  return v5;
}

- (void)clearInput
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_zh_SegmentAdjust;
  [(TIKeyboardInputManagerMecabra *)&v3 clearInput];
  [(TIKeyboardInputManager_zh_SegmentAdjust *)self setCurrentCandidate:0];
  [(TIKeyboardInputManagerMecabra *)self setRemainingInput:0];
}

- (id)convertString
{
  objc_super v3 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
  unint64_t v4 = [v3 inputCursorLocation];

  if (!v4)
  {
    v5 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
    unint64_t v4 = [v5 inputBufferIndexOf:1];
  }
  unsigned int v6 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
  v7 = [v6 inputBuffer];
  if (v4 >= [v7 length])
  {
    v8 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
    v9 = [v8 inputBuffer];
    unint64_t v4 = [v9 length];
  }
  unint64_t v10 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
  v11 = [v10 inputBuffer];
  int64_t v12 = [v11 substringToIndex:v4];

  return v12;
}

- (id)didAcceptCandidate:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self convertString];
  unint64_t v6 = [v5 length];
  v7 = [v4 input];
  unint64_t v8 = [v7 length];

  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136315394;
    uint64_t v24 = "-[TIKeyboardInputManager_zh_SegmentAdjust didAcceptCandidate:]";
    __int16 v25 = 1024;
    BOOL v26 = v6 > v8;
    _os_log_impl(&dword_241E5B000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s  candidate is partial: %d", (uint8_t *)&v23, 0x12u);
  }
  v9 = [v4 candidate];
  if ([v9 length])
  {
    int v10 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self isTypologyEnabled];

    if (v10) {
      [(TIKeyboardInputManagerMecabra *)self logCommittedCandidate:v4 partial:v6 > v8];
    }
  }
  else
  {
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v11 = v6 > v8;
    int64_t v12 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v4];
    id v13 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self wordSearch];
    [v13 performAccept:v12 isPartial:v11];

    [(TIKeyboardInputManagerMecabra *)self updateUsageStatisticsForCandidate:v4 isPartial:v11];
  }
  id v14 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
  int64_t v15 = [v14 inputBuffer];
  int64_t v16 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
  unint64_t v17 = [v16 inputCursorLocation];
  int64_t v18 = [v4 input];
  if (v17 <= [v18 length])
  {
    int64_t v19 = [v4 input];
    uint64_t v20 = [v19 length];
  }
  else
  {
    int64_t v19 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
    uint64_t v20 = [v19 inputCursorLocation];
  }
  objc_super v21 = [v15 substringFromIndex:v20];
  [(TIKeyboardInputManagerMecabra *)self setRemainingInput:v21];

  [(TIKeyboardInputManagerMecabra *)self completeComposition];
  return 0;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v5 = a3;
  if (TICanLogMessageAtLevel())
  {
    v7 = TIOSLogFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManager_zh_SegmentAdjust _adjustPhraseBoundaryInForwardDirection:granularity:](v5, v4, v7);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_SegmentAdjust;
  if (![(TIKeyboardInputManagerMecabra *)&v11 _adjustPhraseBoundaryInForwardDirection:v5 granularity:v4])
  {
    unint64_t v8 = [(TIKeyboardInputManager_zh_SegmentAdjust *)self inputManager];
    v9 = v8;
    if (v5) {
      [v8 moveCursorForward];
    }
    else {
      [v8 moveCursorBackward];
    }
  }
  return 1;
}

- (int64_t)segmentIndex
{
  return self->_segmentIndex;
}

- (void)setSegmentIndex:(int64_t)a3
{
  self->_segmentIndex = a3;
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (TIZhuyinInputManager)inputManager
{
  return self->_inputManager;
}

- (void)setInputManager:(id)a3
{
}

- (TIMecabraIMLogger)logger
{
  return self->_logger;
}

- (TIKeyboardCandidate)currentCandidate
{
  return self->_currentCandidate;
}

- (void)setCurrentCandidate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCandidate, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_inputManager, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

- (void)_adjustPhraseBoundaryInForwardDirection:(NSObject *)a3 granularity:.cold.1(char a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s adjust phrase: %d %d", "-[TIKeyboardInputManager_zh_SegmentAdjust _adjustPhraseBoundaryInForwardDirection:granularity:]", a1 & 1, a2);
  *(_DWORD *)buf = 138412290;
  unint64_t v6 = v4;
  _os_log_debug_impl(&dword_241E5B000, a3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

@end