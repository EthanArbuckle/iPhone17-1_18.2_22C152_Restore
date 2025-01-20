@interface TIKeyboardInputManager_ja_Edit
- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
- (BOOL)delayedCandidateList;
- (BOOL)handleBackspace:(id)a3;
- (BOOL)handleCancelEditMode:(id)a3;
- (BOOL)handleEsc:(id)a3;
- (BOOL)handleSpaceKey:(id)a3;
- (BOOL)shouldCancelIfPhraseBoundaryChanged;
- (BOOL)supportsSetPhraseBoundary;
- (BOOL)usesCandidateSelection;
- (BOOL)usesLiveConversion;
- (NSArray)segments;
- (NSMutableArray)mutableSegments;
- (NSString)prefixString;
- (NSString)rawInputString;
- (TIKeyboardCandidate)inlineCandidate;
- (TIKeyboardInputManager_ja_Edit)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 wordSearch:(id)a6 romajiMode:(BOOL)a7 conversionEnabled:(BOOL)a8;
- (TIMarkedTextBuffer)kanaString;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)transliterate:(id)a3;
- (id)wordCharacters;
- (id)wordSearch;
- (int64_t)escapeKeyPressed;
- (unint64_t)phraseBoundary;
- (unsigned)inputCount;
- (unsigned)inputIndex;
- (unsigned)rawInputIndex;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)dealloc;
- (void)revertLastSegment;
- (void)setEscapeKeyPressed:(int64_t)a3;
- (void)setInputIndex:(unsigned int)a3;
- (void)setKanaString:(id)a3;
- (void)setMutableSegments:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)setRawInputString:(id)a3;
- (void)setShouldCancelIfPhraseBoundaryChanged:(BOOL)a3;
@end

@implementation TIKeyboardInputManager_ja_Edit

- (TIKeyboardInputManager_ja_Edit)initWithConfig:(id)a3 keyboardState:(id)a4 segments:(id)a5 wordSearch:(id)a6 romajiMode:(BOOL)a7 conversionEnabled:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a5;
  id v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  v16 = [(TIKeyboardInputManagerMecabra *)&v27 initWithConfig:a3 keyboardState:a4];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wordSearch, a6);
    [(TIKeyboardInputManager_ja_Edit *)v17 setEscapeKeyPressed:0];
    if (v8)
    {
      v18 = objc_msgSend(v14, "subarrayWithRange:", 0, objc_msgSend(v14, "count") - 1);
      v19 = (void *)[v18 mutableCopy];
      [(TIKeyboardInputManager_ja_Edit *)v17 setMutableSegments:v19];

      v20 = [v14 lastObject];
      v21 = [v20 reading];
    }
    else
    {
      v22 = [MEMORY[0x263EFF980] array];
      [(TIKeyboardInputManager_ja_Edit *)v17 setMutableSegments:v22];

      v21 = objc_msgSend(v14, "_readingStringWithin:", 0, objc_msgSend(v14, "count"));
    }
    v26.receiver = v17;
    v26.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    [(TIKeyboardInputManager_ja_Edit *)&v26 setInput:v21];
    v23 = &off_2650FA140;
    if (!v9) {
      v23 = off_2650FA138;
    }
    v24 = (void *)[objc_alloc(*v23) initWithInternalString:v21];
    [(TIKeyboardInputManager_ja_Edit *)v17 setKanaString:v24];
  }
  return v17;
}

- (void)dealloc
{
  if (_romanAlphabetCharacterSet)
  {
    CFRelease((CFTypeRef)_romanAlphabetCharacterSet);
    _romanAlphabetCharacterSet = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  [(TIKeyboardInputManagerMecabra *)&v3 dealloc];
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

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] romajiWordCharacters];
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_ja_Edit *)self handleBackspace:v4]
    || [(TIKeyboardInputManager_ja_Edit *)self handleSpaceKey:v4]
    || [(TIKeyboardInputManager_ja_Edit *)self handleEsc:v4])
  {
    v5 = objc_opt_new();
  }
  else if ([(TIKeyboardInputManager_ja_Edit *)self handleCancelEditMode:v4])
  {
    v5 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    v7 = [(TIKeyboardInputManagerMecabra *)&v10 handleKeyboardInput:v4];
    BOOL v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_opt_new();
    }
    v5 = v9;
  }
  return v5;
}

- (BOOL)handleCancelEditMode:(id)a3
{
  unsigned int v4 = [(TIKeyboardInputManager_ja_Edit *)self inputCount];
  unsigned int v5 = [(TIKeyboardInputManager_ja_Edit *)self inputIndex];
  if (v4 == v5) {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  return v4 == v5;
}

- (BOOL)handleBackspace:(id)a3
{
  id v4 = a3;
  int v5 = [v4 isBackspace];
  if (v5)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    id v6 = [(TIKeyboardInputManagerMecabra *)&v8 handleKeyboardInput:v4];
    if (![(TIKeyboardInputManager_ja_Edit *)self inputCount]) {
      [(TIKeyboardInputManagerMecabra *)self completeComposition];
    }
  }

  return v5;
}

- (BOOL)handleEsc:(id)a3
{
  id v4 = [a3 string];
  int v5 = [v4 isEqualToString:@"\x1B"];

  if (v5)
  {
    if ([(TIKeyboardInputManager_ja_Edit *)self escapeKeyPressed] >= 1)
    {
      [(TIKeyboardInputManager_ja_Edit *)self clearInput];
      [(TIKeyboardInputManagerMecabra *)self completeComposition];
    }
    [(TIKeyboardInputManager_ja_Edit *)self setEscapeKeyPressed:[(TIKeyboardInputManager_ja_Edit *)self escapeKeyPressed] + 1];
  }
  return v5;
}

- (BOOL)handleSpaceKey:(id)a3
{
  id v4 = [a3 string];
  int v5 = [v4 _isSpace];

  if (v5)
  {
    id v6 = [(TIKeyboardInputManager_ja_Edit *)self rawInputString];
    v7 = [(TIKeyboardInputManager_ja_Edit *)self contextBeforeWithDesiredLength:20];
    objc_super v8 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];

    if (v8)
    {
      id v9 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];
      uint64_t v10 = [v7 stringByAppendingString:v9];

      v7 = (void *)v10;
    }
    v11 = [TIWordSearchJapaneseOperationGetCandidates alloc];
    v12 = [(TIKeyboardInputManager_ja_Edit *)self wordSearch];
    BYTE2(v23) = 1;
    LOWORD(v23) = 0;
    LOBYTE(v22) = 1;
    v13 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v11, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v12, v6, 0, v7, 0x7FFFFFFFFFFFFFFFLL, 1, v22, 0, 0, 0, 0, v23, 0);

    [(TIWordSearchJapaneseOperationGetCandidates *)v13 setAllowIncompleteRomaji:1];
    [(TIWordSearchJapaneseOperationGetCandidates *)v13 setReferenceMode:1];
    id v14 = [(TIWordSearchJapaneseOperationGetCandidates *)v13 results];

    if (!v14)
    {
      id v15 = [(TIKeyboardInputManager_ja_Edit *)self wordSearch];
      [v15 performOperationAsync:v13];

      [(TIWordSearchJapaneseOperationGetCandidates *)v13 waitUntilFinished];
    }
    v16 = [(TIWordSearchJapaneseOperationGetCandidates *)v13 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v16];

    v17 = [(TIWordSearchJapaneseOperationGetCandidates *)v13 results];
    v18 = [v17 candidates];
    v19 = [v18 firstObject];

    if (v19)
    {
      objc_storeStrong((id *)&self->_inlineCandidate, v19);
      v20 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
      [v20 setInternalString:&stru_26F5DD710 withInputIndex:0];

      [(TIKeyboardInputManagerMecabra *)self completeComposition];
    }
  }
  return v5;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  int v5 = [a3 string];
  id v6 = v5;
  if (v5 && [v5 length])
  {
    if ([v6 length])
    {
      unint64_t v7 = 0;
      double v8 = *MEMORY[0x263F00148];
      double v9 = *(double *)(MEMORY[0x263F00148] + 8);
      do
      {
        uint64_t v10 = objc_msgSend(v6, "substringWithRange:", v7, 1);
        v11 = [(TIKeyboardInputManager_ja_Edit *)self transliterate:v10];

        v20.receiver = self;
        v20.super_class = (Class)TIKeyboardInputManager_ja_Edit;
        uint64_t v21 = 0;
        id v12 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v20, sel_addInput_flags_point_firstDelete_, v11, 0, &v21, v8, v9);

        ++v7;
      }
      while (v7 < [v6 length]);
    }
    v13 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    id v14 = [(TIKeyboardInputManager_ja_Edit *)self rawInputString];
    objc_msgSend(v13, "setInternalString:withInputIndex:", v14, -[TIKeyboardInputManager_ja_Edit rawInputIndex](self, "rawInputIndex"));

    id v15 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    v16 = [v15 internalString];
    v19.receiver = self;
    v19.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    [(TIKeyboardInputManager_ja_Edit *)&v19 setInput:v16];

    v17 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    v18.receiver = self;
    v18.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v18, sel_setInputIndex_, [v17 internalIndex]);
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  int v5 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
  if ([v5 externalIndex] >= 2)
  {
  }
  else
  {
    id v6 = [(TIKeyboardInputManager_ja_Edit *)self segments];
    uint64_t v7 = [v6 count];

    if (v7) {
      [(TIKeyboardInputManager_ja_Edit *)self revertLastSegment];
    }
  }
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  double v8 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
  id v23 = 0;
  [v8 deleteFromInput:&v24 newInput:&v23 inputIndex:&v25];
  id v9 = v23;

  if (v24 >= 1)
  {
    for (uint64_t i = 0; i < v24; ++i)
    {
      v22.receiver = self;
      v22.super_class = (Class)TIKeyboardInputManager_ja_Edit;
      id v11 = [(TIKeyboardInputManager_ja_Edit *)&v22 deleteFromInput:a3];
    }
  }
  if ([v9 length])
  {
    unint64_t v12 = 0;
    double v13 = *MEMORY[0x263F00148];
    double v14 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      id v15 = objc_msgSend(v9, "substringWithRange:", v12, 1);
      v21.receiver = self;
      v21.super_class = (Class)TIKeyboardInputManager_ja_Edit;
      id v16 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v21, sel_addInput_flags_point_firstDelete_, v15, 0, a3, v13, v14);

      ++v12;
    }
    while (v12 < [v9 length]);
  }
  if (v25 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v20.receiver = self;
    v20.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v20, sel_setInputIndex_);
  }
  v17 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
  objc_super v18 = [(TIKeyboardInputManager_ja_Edit *)self rawInputString];
  objc_msgSend(v17, "setInternalString:withInputIndex:", v18, -[TIKeyboardInputManager_ja_Edit rawInputIndex](self, "rawInputIndex"));

  return 0;
}

- (NSString)rawInputString
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  id v2 = [(TIKeyboardInputManager_ja_Edit *)&v4 inputString];
  return (NSString *)v2;
}

- (unsigned)rawInputIndex
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  return [(TIKeyboardInputManager_ja_Edit *)&v3 inputIndex];
}

- (id)inputString
{
  objc_super v3 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];
  objc_super v4 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
  uint64_t v5 = [v4 externalString];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = &stru_26F5DD710;
  }
  double v8 = [v3 stringByAppendingString:v7];

  return v8;
}

- (unsigned)inputCount
{
  id v2 = [(TIKeyboardInputManager_ja_Edit *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (unsigned)inputIndex
{
  unsigned int v3 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];
  int v4 = [v3 length];
  uint64_t v5 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
  unsigned int v6 = [v5 externalIndex] + v4;

  return v6;
}

- (BOOL)_adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  unsigned __int8 v7 = -[TIKeyboardInputManagerMecabra _adjustPhraseBoundaryInForwardDirection:granularity:](&v17, sel__adjustPhraseBoundaryInForwardDirection_granularity_);
  if (a4 <= 1 && (v7 & 1) == 0)
  {
    unsigned int v8 = [(TIKeyboardInputManager_ja_Edit *)self inputIndex];
    if (a3)
    {
      int v9 = 1;
    }
    else
    {
      unsigned int v10 = v8;
      id v11 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];
      uint64_t v12 = [v11 length];

      if (v12 == v10) {
        [(TIKeyboardInputManager_ja_Edit *)self revertLastSegment];
      }
      int v9 = -1;
    }
    unsigned int v13 = [(TIKeyboardInputManager_ja_Edit *)self inputCount];
    unsigned int v14 = [(TIKeyboardInputManager_ja_Edit *)self inputIndex] + v9;
    if (v13 >= v14) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = v13;
    }
    [(TIKeyboardInputManager_ja_Edit *)self setInputIndex:v15];
  }
  return 1;
}

- (void)setRawInputString:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  [(TIKeyboardInputManager_ja_Edit *)&v3 setInput:a3];
}

- (void)setInputIndex:(unsigned int)a3
{
  uint64_t v5 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];
  unint64_t v6 = [v5 length];

  if (v6 <= a3)
  {
    uint64_t v7 = a3;
    unsigned int v8 = [(TIKeyboardInputManager_ja_Edit *)self prefixString];
    uint64_t v9 = v7 - [v8 length];
    unsigned int v10 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    [v10 setExternalIndex:v9];

    id v11 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    v12.receiver = self;
    v12.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v12, sel_setInputIndex_, [v11 internalIndex]);
  }
}

- (id)transliterate:(id)a3
{
  id v3 = a3;
  CFCharacterSetRef v4 = (const __CFCharacterSet *)_romanAlphabetCharacterSet;
  if (!_romanAlphabetCharacterSet)
  {
    CFCharacterSetRef v4 = CFCharacterSetCreateWithCharactersInString(0, @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz");
    _romanAlphabetCharacterSet = (uint64_t)v4;
  }
  if (!CFCharacterSetIsCharacterMember(v4, [v3 characterAtIndex:0]))
  {
    uint64_t v5 = +[Romakana kanaSymbol:v3];

    id v3 = (id)v5;
  }
  return v3;
}

- (NSArray)segments
{
  id v2 = [(TIKeyboardInputManager_ja_Edit *)self mutableSegments];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSString)prefixString
{
  id v3 = [(TIKeyboardInputManager_ja_Edit *)self segments];
  CFCharacterSetRef v4 = [(TIKeyboardInputManager_ja_Edit *)self segments];
  uint64_t v5 = objc_msgSend(v3, "_surfaceStringWithin:", 0, objc_msgSend(v4, "count"));

  return (NSString *)v5;
}

- (void)revertLastSegment
{
  id v3 = [(TIKeyboardInputManager_ja_Edit *)self mutableSegments];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = [(TIKeyboardInputManager_ja_Edit *)self segments];
    unint64_t v6 = [v5 lastObject];
    uint64_t v7 = [v6 reading];

    unsigned int v8 = [(TIKeyboardInputManager_ja_Edit *)self mutableSegments];
    [v8 removeLastObject];

    uint64_t v9 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    unsigned int v10 = [v9 internalString];

    if (v10)
    {
      uint64_t v11 = [v7 stringByAppendingString:v10];

      uint64_t v7 = (void *)v11;
    }
    objc_super v12 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    unsigned int v13 = [v12 externalString];
    uint64_t v14 = [v13 length];
    uint64_t v15 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    uint64_t v16 = [v15 externalIndex] - v14;

    objc_super v17 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    objc_msgSend(v17, "setInternalString:withInputIndex:", v7, objc_msgSend(v7, "length"));

    objc_super v18 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    objc_super v19 = [v18 externalString];
    uint64_t v20 = v16 + [v19 length];
    objc_super v21 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    [v21 setExternalIndex:v20];

    objc_super v22 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    id v23 = [v22 internalString];
    [(TIKeyboardInputManager_ja_Edit *)self setRawInputString:v23];

    uint64_t v24 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
    v25.receiver = self;
    v25.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    -[TIKeyboardInputManager_ja_Edit setInputIndex:](&v25, sel_setInputIndex_, [v24 internalIndex]);
  }
}

- (void)clearInput
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  [(TIKeyboardInputManagerMecabra *)&v5 clearInput];
  id v3 = objc_opt_new();
  [(TIKeyboardInputManager_ja_Edit *)self setMutableSegments:v3];

  uint64_t v4 = [(TIKeyboardInputManager_ja_Edit *)self kanaString];
  [v4 setInternalString:&stru_26F5DD710 withInputIndex:0];
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  if ([(TIKeyboardInputManager_ja_Edit *)self shouldCancelIfPhraseBoundaryChanged])
  {
    [(TIKeyboardInputManagerMecabra *)self cancelComposition];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_ja_Edit;
    [(TIKeyboardInputManager_ja_Edit *)&v5 setPhraseBoundary:a3];
  }
}

- (unint64_t)phraseBoundary
{
  if ([(TIKeyboardInputManager_ja_Edit *)self shouldCancelIfPhraseBoundaryChanged])
  {
    return [(TIKeyboardInputManager_ja_Edit *)self inputIndex];
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Edit;
  return [(TIKeyboardInputManager_ja_Edit *)&v4 phraseBoundary];
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (TIKeyboardCandidate)inlineCandidate
{
  return self->_inlineCandidate;
}

- (BOOL)shouldCancelIfPhraseBoundaryChanged
{
  return self->_shouldCancelIfPhraseBoundaryChanged;
}

- (void)setShouldCancelIfPhraseBoundaryChanged:(BOOL)a3
{
  self->_shouldCancelIfPhraseBoundaryChanged = a3;
}

- (NSMutableArray)mutableSegments
{
  return self->_mutableSegments;
}

- (void)setMutableSegments:(id)a3
{
}

- (TIMarkedTextBuffer)kanaString
{
  return self->_kanaString;
}

- (void)setKanaString:(id)a3
{
}

- (int64_t)escapeKeyPressed
{
  return self->_escapeKeyPressed;
}

- (void)setEscapeKeyPressed:(int64_t)a3
{
  self->_escapeKeyPressed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kanaString, 0);
  objc_storeStrong((id *)&self->_mutableSegments, 0);
  objc_storeStrong((id *)&self->_inlineCandidate, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end