@interface TIKeyboardInputManager_intl_HWR
- (BOOL)canHandleKeyHitTest;
- (BOOL)isDummyCandidate:(id)a3;
- (BOOL)shouldExtendPriorWord;
- (BOOL)suppliesCompletions;
- (BOOL)supportsLearning;
- (BOOL)supportsReversionUI;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesCandidateSelection;
- (CHRecognizer)recognizer;
- (NSArray)candidates;
- (TIHandwritingStrokes)userDrawing;
- (id)addInputObject:(id)a3 withContext:(id)a4;
- (id)candidateResultSet;
- (id)defaultCandidate;
- (id)handleKeyboardInput:(id)a3;
- (id)keyboardBehaviors;
- (id)recognitionResultsForStrokes:(id)a3 context:(id)a4;
- (unint64_t)initialSelectedIndex;
- (unsigned)inputCount;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)deleteFromInputWithContext:(id)a3;
- (void)setCandidates:(id)a3;
- (void)setUserDrawing:(id)a3;
- (void)updateCandidates;
@end

@implementation TIKeyboardInputManager_intl_HWR

- (CHRecognizer)recognizer
{
  if (recognizer___onceToken != -1) {
    dispatch_once(&recognizer___onceToken, &__block_literal_global);
  }
  v2 = (void *)recognizer___recognizer;
  return (CHRecognizer *)v2;
}

- (id)recognitionResultsForStrokes:(id)a3 context:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F35C88]);
  if ([v6 numberOfStrokes])
  {
    unint64_t v9 = 0;
    do
    {
      if ([v6 numberOfPointsInStrokeAtIndex:v9])
      {
        unint64_t v10 = 0;
        do
        {
          [v6 pointAtIndex:v10 inStrokeAtIndex:v9];
          objc_msgSend(v8, "addPoint:");
          ++v10;
        }
        while (v10 < [v6 numberOfPointsInStrokeAtIndex:v9]);
      }
      [v8 endStroke];
      ++v9;
    }
    while (v9 < [v6 numberOfStrokes]);
  }
  if (v7)
  {
    uint64_t v15 = *MEMORY[0x263F35C78];
    v16[0] = v7;
    v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  }
  else
  {
    v11 = 0;
  }
  v12 = [(TIKeyboardInputManager_intl_HWR *)self recognizer];
  v13 = [v12 recognitionResultsForDrawing:v8 options:v11];

  return v13;
}

- (void)updateCandidates
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];

  if (v3)
  {
    v4 = [(TIKeyboardInputManager_intl_HWR *)self contextBeforeWithDesiredLength:10];
    v5 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
    id v6 = [(TIKeyboardInputManager_intl_HWR *)self recognitionResultsForStrokes:v5 context:v4];

    id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = (void *)MEMORY[0x263F7E640];
          v14 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "string", (void)v18);
          uint64_t v15 = [v13 candidateWithUnchangedInput:v14];
          [v7 addObject:v15];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
    }

    if ([v7 count])
    {
      [(TIKeyboardInputManager_intl_HWR *)self setCandidates:v7];
      v16 = [(TIKeyboardInputManager_intl_HWR *)self candidateResultSet];
      [(TIKeyboardInputManager_intl_HWR *)self closeCandidateGenerationContextWithResults:v16];
    }
    else
    {
      v16 = [MEMORY[0x263EFF9D0] null];
      v22 = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v22 count:1];
      [(TIKeyboardInputManager_intl_HWR *)self setCandidates:v17];
    }
  }
}

- (id)candidateResultSet
{
  uint64_t v3 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
  if (!v3) {
    goto LABEL_4;
  }
  v4 = (void *)v3;
  v5 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
  id v6 = [v5 firstObject];
  id v7 = [MEMORY[0x263EFF9D0] null];

  if (v6 == v7)
  {
LABEL_4:
    uint64_t v9 = [MEMORY[0x263F7E638] dummySet];
  }
  else
  {
    id v8 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
    uint64_t v9 = [(TIKeyboardInputManager_intl_HWR *)self candidateResultSetFromCandidates:v8];
  }
  return v9;
}

- (id)defaultCandidate
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (![(TIKeyboardInputManager_intl_HWR *)self isDummyCandidate:v10])
          {
            id v11 = v10;
            goto LABEL_12;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_12:
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (unint64_t)initialSelectedIndex
{
  uint64_t v3 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
  if ([v3 count] && -[TIKeyboardInputManager_intl_HWR inputCount](self, "inputCount"))
  {
    id v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_intl_HWR;
    id v4 = [(TIKeyboardInputManager_intl_HWR *)&v6 initialSelectedIndex];
  }

  return (unint64_t)v4;
}

- (BOOL)isDummyCandidate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF9D0];
  id v4 = a3;
  v5 = [v3 null];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F7EAB8]);
  char v6 = [(TIKeyboardInputManager_intl_HWR *)self keyboardState];
  uint64_t v7 = (void *)[v5 initWithKeyboardState:v6];

  if ([v4 isBackspace]) {
    [(TIKeyboardInputManager_intl_HWR *)self deleteFromInputWithContext:v7];
  }
  else {
    [(TIKeyboardInputManager_intl_HWR *)self addInput:v4 withContext:v7];
  }
  uint64_t v8 = [v7 output];

  return v8;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  uint64_t v7 = [(TIKeyboardInputManager_intl_HWR *)self candidates];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [v14 object];

    if (v9)
    {
      [(TIKeyboardInputManager_intl_HWR *)self acceptCurrentCandidateWithContext:v6];
      [(TIKeyboardInputManager_intl_HWR *)self setCandidates:0];
    }
  }
  uint64_t v10 = [v14 object];

  if (v10)
  {
    id v11 = [v14 object];
    uint64_t v12 = [(TIKeyboardInputManager_intl_HWR *)self addInputObject:v11 withContext:v6];
    [v14 setString:v12];
  }
  long long v13 = [v14 string];
  if (v13) {
    [v6 insertText:v13];
  }
}

- (id)addInputObject:(id)a3 withContext:(id)a4
{
  v30[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  [(TIKeyboardInputManager_intl_HWR *)self setUserDrawing:a3];
  uint64_t v7 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
  uint64_t v8 = [v7 numberOfStrokes];

  if (!v8)
  {
    [(TIKeyboardInputManager_intl_HWR *)self clearInput];
    v25 = &stru_26F5DCE28;
    goto LABEL_12;
  }
  [(TIKeyboardInputManager_intl_HWR *)self updateCandidates];
  uint64_t v9 = [(TIKeyboardInputManager_intl_HWR *)self defaultCandidate];
  uint64_t v10 = [v9 candidate];

  id v11 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"-_一"];
  uint64_t v12 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
  if ([v12 numberOfStrokes] == 1)
  {
    int v13 = objc_msgSend(v11, "characterIsMember:", objc_msgSend(v10, "_firstChar"));

    if (v13)
    {
      id v14 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
      uint64_t v15 = [v14 numberOfPointsInStrokeAtIndex:0];

      long long v16 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
      [v16 pointAtIndex:0 inStrokeAtIndex:0];
      double v18 = v17;

      long long v19 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
      [v19 pointAtIndex:v15 - 1 inStrokeAtIndex:0];
      double v21 = v20;

      if (v18 >= v21)
      {
        [v6 deleteBackward:1];
        v22 = [MEMORY[0x263F7E640] candidateWithUnchangedInput:@"DELETE"];
        v29 = v22;
        v23 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v24 = &v29;
      }
      else
      {
        [v6 insertText:@" "];
        v22 = [MEMORY[0x263F7E640] candidateWithUnchangedInput:&stru_26F5DCE28];
        v30[0] = v22;
        v23 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v24 = (void **)v30;
      }
      v27 = [v23 arrayWithObjects:v24 count:1];
      [(TIKeyboardInputManager_intl_HWR *)self setCandidates:v27];

      id v26 = 0;
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v26 = v10;
LABEL_11:
  v25 = (__CFString *)v26;

LABEL_12:
  return v25;
}

- (void)clearInput
{
  [(TIKeyboardInputManager_intl_HWR *)self setUserDrawing:0];
  [(TIKeyboardInputManager_intl_HWR *)self setCandidates:0];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_intl_HWR;
  [(TIKeyboardInputManager_intl_HWR *)&v3 clearInput];
}

- (void)deleteFromInputWithContext:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManager_intl_HWR *)self clearInput];
  [v4 deleteBackward:1];
}

- (BOOL)usesCandidateSelection
{
  return 1;
}

- (BOOL)usesAutoDeleteWord
{
  return 0;
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsReversionUI
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (BOOL)canHandleKeyHitTest
{
  return 0;
}

- (BOOL)suppliesCompletions
{
  return 0;
}

- (id)keyboardBehaviors
{
  return 0;
}

- (unsigned)inputCount
{
  v2 = [(TIKeyboardInputManager_intl_HWR *)self userDrawing];
  unsigned int v3 = [v2 numberOfStrokes];

  return v3;
}

- (TIHandwritingStrokes)userDrawing
{
  return self->_userDrawing;
}

- (void)setUserDrawing:(id)a3
{
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_userDrawing, 0);
}

@end