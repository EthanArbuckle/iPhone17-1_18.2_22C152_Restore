@interface TIKeyboardInputManager_ja_Inline
- (BOOL)isEditMode;
- (BOOL)romajiMode;
- (BOOL)shouldSkipCandidateGeneration;
- (NSArray)segments;
- (TIKeyboardCandidate)inlineCandidate;
- (TIKeyboardInputManager_ja_Inline)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5 romajiMode:(BOOL)a6;
- (TIMarkedTextBuffer)markedTextBuffer;
- (id)candidateResultSet;
- (id)convertString;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)geometryModelData;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)keyboardConfigurationLayoutTag;
- (id)rawInputString;
- (id)searchStringForMarkedText;
- (id)wordCharacters;
- (id)wordSearch;
- (unint64_t)phraseBoundary;
- (unsigned)inputCount;
- (unsigned)rawInputIndex;
- (void)abortComposition;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)commitComposition;
- (void)deleteLastCharacter:(unint64_t *)a3;
- (void)generateInlineCandidate;
- (void)invokeEditMode;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)removeInlineCandidate:(id)a3;
- (void)setInlineCandidate:(id)a3;
- (void)setMarkedText;
- (void)setMarkedTextBuffer:(id)a3;
- (void)setRomajiMode:(BOOL)a3;
- (void)setSegments:(id)a3;
- (void)syncToKeyboardState:(id)a3;
- (void)syncWithEditMode:(id)a3;
@end

@implementation TIKeyboardInputManager_ja_Inline

- (TIKeyboardInputManager_ja_Inline)initWithConfig:(id)a3 keyboardState:(id)a4 wordSearch:(id)a5 romajiMode:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  v12 = [(TIKeyboardInputManagerMecabra *)&v19 initWithConfig:a3 keyboardState:a4];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_wordSearch, a5);
    if (v6) {
      v14 = TIMarkedTextBuffer_ja_Romaji;
    }
    else {
      v14 = TIMarkedTextBuffer_ja_Kana;
    }
    uint64_t v15 = [[v14 alloc] initWithInternalString:&stru_26F5DD710];
    markedTextBuffer = v13->_markedTextBuffer;
    v13->_markedTextBuffer = (TIMarkedTextBuffer *)v15;

    v13->_romajiMode = v6;
    [(TIMarkedTextBuffer *)v13->_markedTextBuffer setHardwareKeyboard:0];
    segments = v13->_segments;
    v13->_segments = (NSArray *)MEMORY[0x263EFFA68];
  }
  return v13;
}

- (id)keyboardConfigurationLayoutTag
{
  return @"VoicedSoundMarkAndSemiVoicedSoundMarkAndSmallVariation";
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (id)wordCharacters
{
  return (id)[MEMORY[0x263F7E520] kanaWordCharacters];
}

- (id)inputString
{
  v2 = [(TIKeyboardInputManager_ja_Inline *)self inlineCandidate];
  v3 = [v2 label];
  v4 = v3;
  if (!v3) {
    v3 = &stru_26F5DD710;
  }
  v5 = v3;

  return v5;
}

- (id)searchStringForMarkedText
{
  v2 = [(TIKeyboardInputManager_ja_Inline *)self markedTextBuffer];
  v3 = [v2 externalString];

  return v3;
}

- (unsigned)inputCount
{
  v2 = [(TIKeyboardInputManager_ja_Inline *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (id)rawInputString
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  v2 = [(TIKeyboardInputManager_ja_Inline *)&v4 inputString];
  return v2;
}

- (unsigned)rawInputIndex
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  return [(TIKeyboardInputManager_ja_Inline *)&v3 inputIndex];
}

- (unint64_t)phraseBoundary
{
  return [(TIKeyboardInputManager_ja_Inline *)self inputIndex];
}

- (id)handleKeyboardInput:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  objc_super v4 = [(TIKeyboardInputManagerMecabra *)&v6 handleKeyboardInput:a3];
  [(TIKeyboardInputManager_ja_Inline *)self generateInlineCandidate];
  return v4;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 string];
  if ([v8 length]
    && ([v8 characterAtIndex:0] != 8616
     || [(TIKeyboardInputManager_ja_Inline *)self inputCount]))
  {
    v9 = [(TIKeyboardInputManager_ja_Inline *)self segments];
    unint64_t v10 = [v9 count];

    if (v10 >= 4)
    {
      id v11 = [(TIKeyboardInputManager_ja_Inline *)self segments];
      v12 = [v11 firstObject];
      v13 = [v12 surface];

      if (v13)
      {
        v14 = [v7 output];
        [v14 insertText:v13];
      }
      id v15 = objc_alloc_init(MEMORY[0x263F089D8]);
      v16 = [(TIKeyboardInputManager_ja_Inline *)self segments];
      unint64_t v17 = [v16 count];

      if (v17 >= 2)
      {
        unint64_t v18 = 1;
        do
        {
          objc_super v19 = [(TIKeyboardInputManager_ja_Inline *)self segments];
          v20 = [v19 objectAtIndexedSubscript:v18];
          v21 = [v20 reading];
          [v15 appendString:v21];

          ++v18;
          v22 = [(TIKeyboardInputManager_ja_Inline *)self segments];
          unint64_t v23 = [v22 count];
        }
        while (v18 < v23);
      }
      [(TIKeyboardInputManager_ja_Inline *)self setInput:v15];
    }
    if ([v6 isMultitap]) {
      [(TIKeyboardInputManager_ja_Inline *)self deleteLastCharacter:0];
    }
    if ([v8 length])
    {
      unint64_t v24 = 0;
      double v25 = *MEMORY[0x263F00148];
      double v26 = *(double *)(MEMORY[0x263F00148] + 8);
      do
      {
        v27 = objc_msgSend(v8, "substringWithRange:", v24, 1);
        v29.receiver = self;
        v29.super_class = (Class)TIKeyboardInputManager_ja_Inline;
        uint64_t v30 = 0;
        id v28 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v29, sel_addInput_flags_point_firstDelete_, v27, 0, &v30, v25, v26);

        ++v24;
      }
      while (v24 < [v8 length]);
    }
    [(TIKeyboardInputManager_ja_Inline *)self setMarkedText];
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  [(TIKeyboardInputManager_ja_Inline *)self deleteLastCharacter:a3];
  objc_super v4 = [(TIKeyboardInputManager_ja_Inline *)self segments];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  else
  {
    [(TIKeyboardInputManager_ja_Inline *)self invokeEditMode];
    id v6 = objc_opt_new();
    [v6 setBackspace:1];
    id v7 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    id v8 = (id)[v7 handleKeyboardInput:v6];
  }
  return 0;
}

- (void)clearInput
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  [(TIKeyboardInputManagerMecabra *)&v4 clearInput];
  [(TIKeyboardInputManager_ja_Inline *)self setInlineCandidate:0];
  objc_super v3 = [(TIKeyboardInputManager_ja_Inline *)self markedTextBuffer];
  [v3 clear];

  [(TIKeyboardInputManager_ja_Inline *)self setSegments:MEMORY[0x263EFFA68]];
  [(TIKeyboardInputManager_ja_Inline *)self setMarkedText];
}

- (id)candidateResultSet
{
  if ([(TIKeyboardInputManager_ja_Inline *)self shouldSkipCandidateGeneration])
  {
    v2 = 0;
  }
  else
  {
    v2 = [MEMORY[0x263F7E638] dummySet];
  }
  return v2;
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  if (!v5)
  {
    id v6 = [TIKeyboardInputManager_ja_Candidates alloc];
    id v7 = [(TIKeyboardInputManager_ja_Inline *)self config];
    id v8 = [(TIKeyboardInputManager_ja_Inline *)self keyboardState];
    v9 = [(TIKeyboardInputManager_ja_Inline *)self wordSearch];
    unint64_t v5 = [(TIKeyboardInputManager_ja_Candidates *)v6 initWithConfig:v7 keyboardState:v8 wordSearch:v9];

    uint64_t v10 = [(TIKeyboardInputManager_ja_Inline *)self candidateRange];
    -[TIKeyboardInputManager_ja_Candidates setCandidateRange:](v5, "setCandidateRange:", v10, v11);
    [(TIKeyboardInputManager_ja_Candidates *)v5 setHardwareKeyboardMode:0];
    [(TIKeyboardInputManager_ja_Candidates *)v5 setShowsPartialCandidate:1];
    [(TIKeyboardInputManagerMecabra *)self composeTextWith:v5];
  }
  objc_initWeak(&location, self);
  [v4 open];
  id v12 = objc_alloc(MEMORY[0x263F7EA38]);
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __87__TIKeyboardInputManager_ja_Inline_openCandidateGenerationContextWithCandidateHandler___block_invoke;
  v21 = &unk_2650FA828;
  objc_copyWeak(&v23, &location);
  id v22 = v4;
  id v13 = v4;
  v14 = (void *)[v12 initWithWrappedCandidateHandler:v13 resultSetHandlerBlock:&v18];
  [(TIKeyboardInputManager_ja_Candidates *)v5 openCandidateGenerationContextWithCandidateHandler:v14];

  id v15 = [(TIKeyboardInputManager_ja_Inline *)self convertString];
  v16 = [(TIKeyboardInputManager_ja_Inline *)self contextBeforeWithDesiredLength:20];
  unint64_t v17 = [(TIKeyboardInputManager_ja_Inline *)self geometryModelData];
  -[TIKeyboardInputManager_ja_Candidates makeCandidatesWithInputString:autoCommitString:contextString:predictionEnabled:reanalysisMode:singlePhrase:geometoryModelData:](v5, "makeCandidatesWithInputString:autoCommitString:contextString:predictionEnabled:reanalysisMode:singlePhrase:geometoryModelData:", v15, &stru_26F5DD710, v16, 1, 0, 0, v17, v18, v19, v20, v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)setMarkedText
{
  objc_super v3 = [(TIKeyboardInputManager_ja_Inline *)self markedTextBuffer];
  id v4 = [(TIKeyboardInputManager_ja_Inline *)self rawInputString];
  objc_msgSend(v3, "setInternalString:withInputIndex:", v4, -[TIKeyboardInputManager_ja_Inline rawInputIndex](self, "rawInputIndex"));

  unint64_t v5 = [(TIKeyboardInputManager_ja_Inline *)self markedTextBuffer];
  id v6 = [v5 internalString];
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  [(TIKeyboardInputManager_ja_Inline *)&v8 setInput:v6];

  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  [(TIKeyboardInputManager_ja_Inline *)&v7 setMarkedText];
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  unint64_t v5 = [(TIKeyboardInputManagerMecabra *)&v9 handleAcceptedCandidate:a3 keyboardState:a4];
  id v6 = [(TIKeyboardInputManagerMecabra *)self remainingInput];
  uint64_t v7 = [v6 length];

  if (v7) {
    [(TIKeyboardInputManager_ja_Inline *)self generateInlineCandidate];
  }
  return v5;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 input];
  unint64_t v6 = [v5 length];

  uint64_t v7 = [(TIKeyboardInputManager_ja_Inline *)self convertString];
  if (v6 >= [v7 length] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(TIKeyboardInputManager_ja_Inline *)self clearInput];
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
    objc_super v8 = 0;
  }
  else
  {
    objc_super v9 = [v7 substringFromIndex:v6];
    [(TIKeyboardInputManagerMecabra *)self setRemainingInput:v9];

    objc_super v8 = &stru_26F5DD710;
  }

  return v8;
}

- (void)syncToKeyboardState:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_ja_Inline *)self isEditMode])
  {
    unint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v5 syncToKeyboardState:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_ja_Inline;
    [(TIKeyboardInputManagerBase *)&v6 syncToKeyboardState:v4];
    [(TIKeyboardInputManager_ja_Inline *)self setPhraseBoundaryIfNecessary];
  }
}

- (id)geometryModelData
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)commitComposition
{
  if ([(TIKeyboardInputManager_ja_Inline *)self isEditMode])
  {
    objc_super v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [(TIKeyboardInputManager_ja_Inline *)self syncWithEditMode:v3];
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  [(TIKeyboardInputManagerMecabra *)&v4 commitComposition];
}

- (void)abortComposition
{
  if ([(TIKeyboardInputManager_ja_Inline *)self isEditMode])
  {
    objc_super v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [(TIKeyboardInputManager_ja_Inline *)self syncWithEditMode:v3];
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  [(TIKeyboardInputManagerMecabra *)&v4 abortComposition];
}

- (void)deleteLastCharacter:(unint64_t *)a3
{
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  unint64_t v5 = [(TIKeyboardInputManager_ja_Inline *)self markedTextBuffer];
  id v17 = 0;
  [v5 deleteFromInput:&v18 newInput:&v17 inputIndex:&v19];
  id v6 = v17;

  if (v18 >= 1)
  {
    for (uint64_t i = 0; i < v18; ++i)
    {
      v16.receiver = self;
      v16.super_class = (Class)TIKeyboardInputManager_ja_Inline;
      id v8 = [(TIKeyboardInputManager_ja_Inline *)&v16 deleteFromInput:a3];
    }
  }
  if ([v6 length])
  {
    unint64_t v9 = 0;
    double v10 = *MEMORY[0x263F00148];
    double v11 = *(double *)(MEMORY[0x263F00148] + 8);
    do
    {
      id v12 = objc_msgSend(v6, "substringWithRange:", v9, 1);
      v15.receiver = self;
      v15.super_class = (Class)TIKeyboardInputManager_ja_Inline;
      id v13 = -[TIKeyboardInputManagerMecabra addInput:flags:point:firstDelete:](&v15, sel_addInput_flags_point_firstDelete_, v12, 0, a3, v10, v11);

      ++v9;
    }
    while (v9 < [v6 length]);
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14.receiver = self;
    v14.super_class = (Class)TIKeyboardInputManager_ja_Inline;
    -[TIKeyboardInputManager_ja_Inline setInputIndex:](&v14, sel_setInputIndex_);
  }
}

- (void)generateInlineCandidate
{
  if (![(TIKeyboardInputManager_ja_Inline *)self shouldSkipCandidateGeneration])
  {
    objc_super v3 = [TIWordSearchJapaneseOperationGetCandidates alloc];
    objc_super v4 = [(TIKeyboardInputManager_ja_Inline *)self wordSearch];
    unint64_t v5 = [(TIKeyboardInputManager_ja_Inline *)self convertString];
    id v6 = [(TIKeyboardInputManager_ja_Inline *)self contextBeforeWithDesiredLength:20];
    uint64_t v7 = [(TIKeyboardInputManager_ja_Inline *)self geometryModelData];
    BYTE2(v16) = 1;
    LOWORD(v16) = 0;
    LOBYTE(v15) = 1;
    id v17 = -[TIWordSearchJapaneseOperationGetCandidates initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:](v3, "initWithWordSearch:inputString:keyboardInput:contextString:segmentBreakIndex:predictionEnabled:reanalysisMode:autocapitalizationType:target:action:geometryModelData:flickUsed:phraseBoundarySet:hardwareKeyboardMode:logger:", v4, v5, 0, v6, 0x7FFFFFFFFFFFFFFFLL, 1, v15, 0, 0, 0, v7, v16, 0);

    [(TIWordSearchJapaneseOperationGetCandidates *)v17 setReferenceMode:1];
    id v8 = [(TIWordSearchJapaneseOperationGetCandidates *)v17 results];

    if (!v8)
    {
      unint64_t v9 = [(TIKeyboardInputManager_ja_Inline *)self wordSearch];
      [v9 performOperationAsync:v17];

      [(TIWordSearchJapaneseOperationGetCandidates *)v17 waitUntilFinished];
    }
    double v10 = [(TIWordSearchJapaneseOperationGetCandidates *)v17 results];
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:v10];
    double v11 = [v10 candidates];
    id v12 = [v11 firstObject];
    [(TIKeyboardInputManager_ja_Inline *)self setInlineCandidate:v12];

    id v13 = [(TIKeyboardInputManager_ja_Inline *)self inlineCandidate];
    objc_super v14 = [(TIKeyboardInputManagerMecabra *)self segmentsFromCandidate:v13 phraseBoundary:1];
    [(TIKeyboardInputManager_ja_Inline *)self setSegments:v14];

    [(TIKeyboardInputManager_ja_Inline *)self setMarkedText];
  }
}

- (BOOL)shouldSkipCandidateGeneration
{
  if ([(TIKeyboardInputManager_ja_Inline *)self shouldSkipCandidateSelection]) {
    return 1;
  }
  objc_super v4 = [(TIKeyboardInputManager_ja_Inline *)self convertString];
  BOOL v3 = [v4 length] == 0;

  return v3;
}

- (void)removeInlineCandidate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TIKeyboardInputManager_ja_Inline *)self inlineCandidate];
  if (v5)
  {
    id v6 = [v4 sortMethodGroups];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"UI-Sort-Common"];
    id v8 = [v7 firstObject];

    if (v8)
    {
      unint64_t v9 = [v8 candidates];
      double v10 = (void *)MEMORY[0x263F08A98];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __58__TIKeyboardInputManager_ja_Inline_removeInlineCandidate___block_invoke;
      v13[3] = &unk_2650FA850;
      id v14 = v5;
      double v11 = [v10 predicateWithBlock:v13];
      id v12 = [v9 filteredOrderedSetUsingPredicate:v11];
      [v8 setCandidates:v12];
    }
  }
}

- (BOOL)isEditMode
{
  v2 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)invokeEditMode
{
  BOOL v3 = [TIKeyboardInputManager_ja_Edit alloc];
  id v4 = [(TIKeyboardInputManager_ja_Inline *)self config];
  unint64_t v5 = [(TIKeyboardInputManager_ja_Inline *)self keyboardState];
  id v6 = [(TIKeyboardInputManager_ja_Inline *)self segments];
  uint64_t v7 = [(TIKeyboardInputManager_ja_Inline *)self wordSearch];
  id v8 = [(TIKeyboardInputManager_ja_Edit *)v3 initWithConfig:v4 keyboardState:v5 segments:v6 wordSearch:v7 romajiMode:[(TIKeyboardInputManager_ja_Inline *)self romajiMode] conversionEnabled:1];

  [(TIKeyboardInputManager_ja_Edit *)v8 setShouldCancelIfPhraseBoundaryChanged:1];
  [(TIKeyboardInputManagerMecabra *)self composeTextWith:v8];
}

- (void)syncWithEditMode:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManager_ja_Inline *)self clearInput];
  unint64_t v5 = [v4 segments];
  id v6 = objc_msgSend(v5, "_readingStringWithin:", 0, objc_msgSend(v5, "count"));
  uint64_t v7 = [v4 rawInputString];
  id v8 = [v6 stringByAppendingString:v7];

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_ja_Inline;
  [(TIKeyboardInputManager_ja_Inline *)&v10 setInput:v8];
  [(TIKeyboardInputManager_ja_Inline *)self setSegments:v5];
  unint64_t v9 = [v4 inlineCandidate];

  [(TIKeyboardInputManager_ja_Inline *)self setInlineCandidate:v9];
}

- (id)convertString
{
  v2 = [(TIKeyboardInputManager_ja_Inline *)self markedTextBuffer];
  BOOL v3 = [v2 internalString];

  return v3;
}

- (TIMarkedTextBuffer)markedTextBuffer
{
  return self->_markedTextBuffer;
}

- (void)setMarkedTextBuffer:(id)a3
{
}

- (TIKeyboardCandidate)inlineCandidate
{
  return self->_inlineCandidate;
}

- (void)setInlineCandidate:(id)a3
{
}

- (NSArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
}

- (BOOL)romajiMode
{
  return self->_romajiMode;
}

- (void)setRomajiMode:(BOOL)a3
{
  self->_romajiMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_inlineCandidate, 0);
  objc_storeStrong((id *)&self->_markedTextBuffer, 0);
  objc_storeStrong((id *)&self->_wordSearch, 0);
}

@end