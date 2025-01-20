@interface TIKeyboardInputManager_zh_Toneless
- (BOOL)assertDefaultKeyPlane;
- (BOOL)dynamic;
- (BOOL)shouldSearchCompletionForSubstrings;
- (BOOL)supportsCandidateGeneration;
- (TIKeyboardInputManager_zh_Toneless)initWithInputMode:(id)a3 keyboardState:(id)a4 dynamic:(BOOL)a5;
- (TIMecabraCandidate)inlineCandidate;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)inputString;
- (id)keyboardConfigurationLayoutTag;
- (id)validCharacterSetForAutocorrection;
- (void)activateRetroCorrection;
- (void)clearInput;
- (void)commitComposition;
- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5;
- (void)setAssertDefaultKeyPlane:(BOOL)a3;
- (void)setDynamic:(BOOL)a3;
- (void)setInlineCandidate:(id)a3;
- (void)setPhraseBoundary:(unint64_t)a3;
- (void)updateComposedText;
@end

@implementation TIKeyboardInputManager_zh_Toneless

- (TIKeyboardInputManager_zh_Toneless)initWithInputMode:(id)a3 keyboardState:(id)a4 dynamic:(BOOL)a5
{
  BOOL v5 = a5;
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  v6 = [(TIKeyboardInputManagerBase *)&v9 initWithInputMode:a3 keyboardState:a4];
  v7 = v6;
  if (v6)
  {
    [(TIKeyboardInputManager_zh_Toneless *)v6 setDynamic:v5];
    [(TIKeyboardInputManager_zh_Toneless *)v7 setAssertDefaultKeyPlane:v5];
  }
  return v7;
}

- (void)setPhraseBoundary:(unint64_t)a3
{
  if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount] == a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    [(TIKeyboardInputManagerChinesePhonetic *)&v6 setPhraseBoundary:a3];
  }
  else
  {
    [(TIKeyboardInputManager_zh_Toneless *)self activateRetroCorrection];
    id v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    [v5 setPhraseBoundary:a3];
  }
}

- (void)generateCandidatesWithKeyboardState:(id)a3 candidateRange:(_NSRange)a4 candidateHandler:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  [(TIKeyboardInputManager_zh_Toneless *)self setPhraseBoundaryIfNecessary];
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  -[TIKeyboardInputManagerMecabra generateCandidatesWithKeyboardState:candidateRange:candidateHandler:](&v11, sel_generateCandidatesWithKeyboardState_candidateRange_candidateHandler_, v10, location, length, v9);
}

- (void)commitComposition
{
  v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    [(TIKeyboardInputManager_zh_Toneless *)self clearInput];
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  [(TIKeyboardInputManagerMecabra *)&v5 commitComposition];
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (id)keyboardConfigurationLayoutTag
{
  if ([(TIKeyboardInputManager_zh_Toneless *)self dynamic])
  {
    id v3 = (id)*MEMORY[0x263F7E9D0];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    id v3 = [(TIKeyboardInputManagerChinesePhonetic *)&v5 keyboardConfigurationLayoutTag];
  }
  return v3;
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

- (id)handleKeyboardInput:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_super v6 = [v5 handleKeyboardInput:v4];

  if (!v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    objc_super v6 = [(TIKeyboardInputManagerChinesePhonetic *)&v14 handleKeyboardInput:v4];
    uint64_t v7 = [(TIKeyboardInputManager_zh_Toneless *)self candidateRange];
    uint64_t v9 = v8;
    -[TIKeyboardInputManager_zh_Toneless setCandidateRange:](self, "setCandidateRange:", 0, 1);
    id v10 = [(TIKeyboardInputManagerChinesePhonetic *)self candidateResultSetByWaitingForResults:1];
    -[TIKeyboardInputManager_zh_Toneless setCandidateRange:](self, "setCandidateRange:", v7, v9);
    objc_super v11 = [(TIKeyboardInputManager_zh_Toneless *)self inputString];
    if ((unint64_t)[v11 _graphemeCount] <= 2)
    {
    }
    else
    {
      v12 = [(TIKeyboardInputManager_zh_Toneless *)self inlineCandidate];

      if (v12) {
        [(TIKeyboardInputManager_zh_Toneless *)self activateRetroCorrection];
      }
    }
  }

  return v6;
}

- (void)updateComposedText
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  [(TIKeyboardInputManagerChinesePhonetic *)&v6 updateComposedText];
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  id v4 = [v3 candidates];
  objc_super v5 = [v4 firstObject];
  [(TIKeyboardInputManager_zh_Toneless *)self setInlineCandidate:v5];

  [(TIKeyboardInputManager_zh_Toneless *)self setMarkedText];
}

- (void)clearInput
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  [(TIKeyboardInputManagerChinesePhonetic *)&v3 clearInput];
  [(TIKeyboardInputManager_zh_Toneless *)self setInlineCandidate:0];
}

- (id)inputString
{
  objc_super v3 = [(TIKeyboardInputManager_zh_Toneless *)self inlineCandidate];
  id v4 = [v3 candidate];
  if (v4)
  {
    objc_super v5 = [(TIKeyboardInputManager_zh_Toneless *)self inlineCandidate];
    objc_super v6 = [v5 candidate];
    uint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)self stringByPrependingConvertedCandidateTextToString:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
    uint64_t v7 = [(TIKeyboardInputManagerChinesePhonetic *)&v9 inputString];
  }

  return v7;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  id v4 = [(TIKeyboardInputManagerChinesePhonetic *)&v8 deleteFromInput:a3];
  objc_super v5 = [(TIKeyboardInputManagerChinesePhonetic *)self inputStringForSearch];
  uint64_t v6 = [v5 length];

  if (!v6) {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  return v4;
}

- (id)groupedCandidatesFromCandidates:(id)a3 usingSortingMethod:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v28.receiver = self;
  v28.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  uint64_t v7 = [(TIKeyboardInputManagerChinese *)&v28 groupedCandidatesFromCandidates:a3 usingSortingMethod:v6];
  objc_super v8 = [(TIKeyboardInputManager_zh_Toneless *)self inlineCandidate];
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
          v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          objc_super v14 = objc_msgSend(v13, "candidates", v19, v20);
          v15 = (void *)MEMORY[0x263F08A98];
          v22[0] = MEMORY[0x263EF8330];
          v22[1] = 3221225472;
          v22[2] = __89__TIKeyboardInputManager_zh_Toneless_groupedCandidatesFromCandidates_usingSortingMethod___block_invoke;
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

    uint64_t v7 = v19;
    id v6 = v20;
  }

  return v7;
}

- (id)didAcceptCandidate:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManager_zh_Toneless *)self setInlineCandidate:0];
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_zh_Toneless;
  objc_super v5 = [(TIKeyboardInputManagerChinesePhonetic *)&v13 didAcceptCandidate:v4];

  id v6 = [(TIKeyboardInputManagerChinesePhonetic *)self remainingInput];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    if ([(TIKeyboardInputManager_zh_Toneless *)self dynamic])
    {
      objc_super v8 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      uint64_t v9 = [v8 candidates];
      -[TIKeyboardInputManager_zh_Toneless setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", [v9 count] != 0);
    }
  }
  else
  {
    [(TIKeyboardInputManagerMecabra *)self completeComposition];
  }
  if (v5) {
    uint64_t v10 = v5;
  }
  else {
    uint64_t v10 = &stru_26F5E6580;
  }
  uint64_t v11 = v10;

  return v11;
}

- (void)activateRetroCorrection
{
  objc_super v3 = [(TIKeyboardInputManager_zh_Toneless *)self inlineCandidate];
  id v4 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v3];

  id v9 = [MEMORY[0x263F7E6A0] dictionaryReadingFromMecabraCandidate:v4];
  objc_super v5 = [TIKeyboardInputManager_zh_RetroCorrection alloc];
  id v6 = [(TIKeyboardInputManagerBase *)self inputMode];
  uint64_t v7 = [(TIKeyboardInputManager_zh_Toneless *)self keyboardState];
  objc_super v8 = [(TIKeyboardInputManager_zh_RetroCorrection *)v5 initWithInputMode:v6 keyboardState:v7 inputString:v9];
  [(TIKeyboardInputManagerMecabra *)self composeTextWith:v8];
}

- (TIMecabraCandidate)inlineCandidate
{
  return self->_inlineCandidate;
}

- (void)setInlineCandidate:(id)a3
{
}

- (BOOL)dynamic
{
  return *(&self->_assertDefaultKeyPlane + 3);
}

- (void)setDynamic:(BOOL)a3
{
  *(&self->_assertDefaultKeyPlane + 3) = a3;
}

- (BOOL)assertDefaultKeyPlane
{
  return *(&self->_assertDefaultKeyPlane + 4);
}

- (void)setAssertDefaultKeyPlane:(BOOL)a3
{
  *(&self->_assertDefaultKeyPlane + 4) = a3;
}

- (void).cxx_destruct
{
}

@end