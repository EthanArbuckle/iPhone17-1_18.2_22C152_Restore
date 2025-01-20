@interface TIKeyboardInputManager_zh_RetroCorrection
- (BOOL)supportsCandidateGeneration;
- (BOOL)supportsSetPhraseBoundary;
- (TIKeyboardCandidate)defaultCandidate;
- (TIKeyboardInputManager_zh_RetroCorrection)initWithInputMode:(id)a3 keyboardState:(id)a4 inputString:(id)a5;
- (TIZhuyinInputManager)zhuyinInputManager;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)internalInputString;
- (id)keyboardConfigurationLayoutTag;
- (id)rawInputString;
- (id)validCharacterSetForAutocorrection;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (void)_addInputToInternal:(id)a3;
- (void)addInputToInternal:(id)a3;
- (void)clearInput;
- (void)setDefaultCandidate:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setZhuyinInputManager:(id)a3;
- (void)updateInlineCandidate;
@end

@implementation TIKeyboardInputManager_zh_RetroCorrection

- (TIKeyboardInputManager_zh_RetroCorrection)initWithInputMode:(id)a3 keyboardState:(id)a4 inputString:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  v9 = [(TIKeyboardInputManagerBase *)&v13 initWithInputMode:a3 keyboardState:a4];
  if (v9)
  {
    v10 = objc_alloc_init(TIZhuyinInputManager);
    zhuyinInputManager = v9->_zhuyinInputManager;
    v9->_zhuyinInputManager = v10;

    [(TIKeyboardInputManager_zh_RetroCorrection *)v9 addInputToInternal:v8];
  }

  return v9;
}

- (id)rawInputString
{
  v2 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  v3 = [v2 inputBuffer];

  return v3;
}

- (id)internalInputString
{
  v2 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  v3 = [v2 inputBuffer];

  return v3;
}

- (unsigned)inputCount
{
  v2 = [(TIKeyboardInputManager_zh_RetroCorrection *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (BOOL)supportsSetPhraseBoundary
{
  v2 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  char v3 = [v2 syllableBuffersOccupied] ^ 1;

  return v3;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  -[TIKeyboardInputManagerChinesePhonetic setPhraseBoundary:](&v11, sel_setPhraseBoundary_);
  v5 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  unint64_t v6 = [v5 cursorLocation];

  unint64_t v7 = v6 - a3;
  if (v6 >= a3)
  {
    if (v6 > a3)
    {
      do
      {
        v10 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
        [v10 moveCursorBackward];

        --v7;
      }
      while (v7);
    }
  }
  else
  {
    unint64_t v8 = a3 - v6;
    do
    {
      v9 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
      [v9 moveCursorForward];

      --v8;
    }
    while (v8);
  }
}

- (id)inputString
{
  char v3 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  v4 = [v3 composedText];

  if (v4)
  {
    v5 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
    unint64_t v6 = [v5 composedText];
  }
  else
  {
    unint64_t v6 = &stru_26F5E6580;
  }
  return v6;
}

- (unsigned)inputIndex
{
  v2 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  unsigned int v3 = [v2 cursorLocation];

  return v3;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  unint64_t v6 = [v5 handleKeyboardInput:v4];

  if (!v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
    unint64_t v6 = [(TIKeyboardInputManagerChinesePhonetic *)&v8 handleKeyboardInput:v4];
  }

  return v6;
}

- (void)clearInput
{
  [(TIKeyboardInputManager_zh_RetroCorrection *)self setDefaultCandidate:0];
  unsigned int v3 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  [v3 reset];

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  [(TIKeyboardInputManagerChinesePhonetic *)&v4 clearInput];
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  unint64_t v7 = [(TIKeyboardInputManagerChinese *)&v28 groupedCandidatesFromCandidates:a3 usingSortingMethod:v6];
  objc_super v8 = [(TIKeyboardInputManager_zh_RetroCorrection *)self inputString];
  if ([v6 integerValue] == 1 && v8)
  {
    v19 = v7;
    id v20 = v6;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(obj);
          }
          objc_super v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v14 = objc_msgSend(v13, "candidates", v19, v20);
          v15 = (void *)MEMORY[0x263F08A98];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __96__TIKeyboardInputManager_zh_RetroCorrection_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke;
          v22[3] = &unk_2650FE5A0;
          id v23 = v8;
          v16 = [v15 predicateWithBlock:v22];
          v17 = [v14 filteredOrderedSetUsingPredicate:v16];
          [v13 setCandidates:v17];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }

    unint64_t v7 = v19;
    id v6 = v20;
  }

  return v7;
}

- (id)didAcceptCandidate:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_zh_RetroCorrection;
  objc_super v4 = [(TIKeyboardInputManagerChinesePhonetic *)&v10 didAcceptCandidate:a3];
  v5 = [(TIKeyboardInputManagerChinesePhonetic *)self remainingInput];
  uint64_t v6 = [v5 length];

  if (!v6) {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  if (v4) {
    unint64_t v7 = v4;
  }
  else {
    unint64_t v7 = &stru_26F5E6580;
  }
  objc_super v8 = v7;

  return v8;
}

- (void)addInputToInternal:(id)a3
{
  id v8 = a3;
  if ([v8 length] == 1)
  {
    unint64_t v4 = [(TIKeyboardInputManager_zh_RetroCorrection *)self _addInputToInternal:v8];
    v5 = v8;
  }
  else
  {
    unint64_t v4 = [v8 length];
    v5 = v8;
    if (v4)
    {
      for (unint64_t i = 0; i < v4; ++i)
      {
        unint64_t v7 = objc_msgSend(v5, "substringWithRange:", i, 1);
        [(TIKeyboardInputManager_zh_RetroCorrection *)self _addInputToInternal:v7];

        unint64_t v4 = [v8 length];
        v5 = v8;
      }
    }
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v5 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  [v5 deleteFromInput];

  if (a3) {
    *a3 = 1;
  }
  uint64_t v6 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
  unint64_t v7 = [v6 inputBuffer];
  uint64_t v8 = [v7 length];

  if (!v8) {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  return 0;
}

- (id)keyboardConfigurationLayoutTag
{
  return (id)*MEMORY[0x263F7E9D0];
}

- (id)validCharacterSetForAutocorrection
{
  return (id)[MEMORY[0x263F08708] zhuyinCharacterSet];
}

- (BOOL)supportsCandidateGeneration
{
  v2 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  BOOL v3 = v2 == 0;

  return v3;
}

- (void)_addInputToInternal:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [MEMORY[0x263F08708] zhuyinCharacterSet];
  BOOL v5 = TIStringContainsCharacterFromSet(v7, (uint64_t)v4);

  if (v5)
  {
    uint64_t v6 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
    [v6 addZhuyinInput:v7];
  }
  else
  {
    if ([v7 isEqualToString:@" "]) {
      goto LABEL_6;
    }
    uint64_t v6 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
    [v6 addNonZhuyinInput:v7];
  }

LABEL_6:
  [(TIKeyboardInputManager_zh_RetroCorrection *)self updateInlineCandidate];
}

- (void)updateInlineCandidate
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ([(TIKeyboardInputManager_zh_RetroCorrection *)self shouldSkipCandidateSelection]) {
    return;
  }
  BOOL v3 = [(TIKeyboardInputManager_zh_RetroCorrection *)self rawInputString];
  if (![v3 length]) {
    goto LABEL_25;
  }
  unint64_t v4 = [(TIKeyboardInputManagerMecabra *)self geometryModelData];
  id v5 = objc_alloc(MEMORY[0x263F7E980]);
  uint64_t v6 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  uint64_t v8 = [(TIKeyboardInputManagerChinesePhonetic *)self logger];
  LOBYTE(v30) = 1;
  BYTE2(v29) = 0;
  LOWORD(v29) = 1;
  uint64_t v9 = objc_msgSend(v5, "initWithWordSearch:inputString:keyboardInput:segmentBreakIndex:disambiguationCandidates:unambiguousSyllableCount:selectedDisambiguationCandidateIndex:regenerateDisambiguationCandidates:predictionEnabled:reanalysisMode:target:action:geometryModelData:hardwareKeyboardMode:logger:", v6, v3, v7, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, v29, 0, 0, v4, v30, v8);

  objc_super v10 = [v9 results];

  if (!v10)
  {
    uint64_t v11 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v11 performOperationAsync:v9];

    [v9 waitUntilFinished];
  }
  v12 = [v9 results];
  objc_super v13 = [v12 candidates];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    objc_super v28 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v28 cancelComposition];

    goto LABEL_24;
  }
  v31 = v4;
  v32 = v3;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v15 = [v9 results];
  v16 = [v15 candidates];

  id obj = v16;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v17) {
    goto LABEL_22;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v35;
  while (2)
  {
    for (uint64_t i = 0; i != v18; ++i)
    {
      if (*(void *)v35 != v19) {
        objc_enumerationMutation(obj);
      }
      v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
      if ([v21 containPunctuationOnly])
      {
LABEL_21:
        [(TIKeyboardInputManager_zh_RetroCorrection *)self setDefaultCandidate:v21];
        long long v27 = [(TIKeyboardInputManager_zh_RetroCorrection *)self zhuyinInputManager];
        [v27 updateWithCandidate:v21 isWholeInputCandidate:1];

        goto LABEL_22;
      }
      v22 = [v21 candidate];
      if ([v22 _containsBopomofoOnly]) {
        goto LABEL_17;
      }
      id v23 = [v21 input];
      long long v24 = v9;
      long long v25 = [v9 inputString];
      if (([v23 isEqualToString:v25] & 1) == 0)
      {

        uint64_t v9 = v24;
LABEL_17:

        continue;
      }
      char v26 = [v21 hasUnsupportedReading];

      uint64_t v9 = v24;
      if ((v26 & 1) == 0) {
        goto LABEL_21;
      }
    }
    uint64_t v18 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_22:

  [(TIKeyboardInputManager_zh_RetroCorrection *)self setMarkedText];
  unint64_t v4 = v31;
  BOOL v3 = v32;
LABEL_24:

LABEL_25:
}

- (TIZhuyinInputManager)zhuyinInputManager
{
  return self->_zhuyinInputManager;
}

- (void)setZhuyinInputManager:(id)a3
{
}

- (TIKeyboardCandidate)defaultCandidate
{
  return self->_defaultCandidate;
}

- (void)setDefaultCandidate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultCandidate, 0);
  objc_storeStrong((id *)&self->_zhuyinInputManager, 0);
}

@end