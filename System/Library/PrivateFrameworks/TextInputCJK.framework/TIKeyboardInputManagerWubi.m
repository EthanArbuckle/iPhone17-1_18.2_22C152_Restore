@interface TIKeyboardInputManagerWubi
+ (Class)wordSearchClass;
- (BOOL)acceptInputString:(id)a3;
- (BOOL)isWubi:(id)a3;
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (BOOL)supportsPairedPunctutationInput;
- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4;
- (TIKeyboardCandidate)autoConfirmationCandidate;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)formattedSearchString;
- (id)inputsToReject;
- (int)inputMethodType;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3;
- (void)pushCandidateGenerationContextWithResults:(id)a3;
- (void)setAutoConfirmationCandidate:(id)a3;
@end

@implementation TIKeyboardInputManagerWubi

- (void).cxx_destruct
{
}

- (void)setAutoConfirmationCandidate:(id)a3
{
}

- (TIKeyboardCandidate)autoConfirmationCandidate
{
  return self->_autoConfirmationCandidate;
}

- (BOOL)supportsPairedPunctutationInput
{
  v3 = [(TIKeyboardInputManagerWubi *)self keyboardState];
  if ([v3 hardwareKeyboardMode])
  {
    char v4 = 0;
  }
  else
  {
    v5 = [(TIKeyboardInputManagerWubi *)self keyboardState];
    v6 = [v5 layoutState];
    if ([v6 userInterfaceIdiom] == 1)
    {
      v7 = [(TIKeyboardInputManagerWubi *)self keyboardState];
      v8 = [v7 layoutState];
      char v4 = [v8 hasCandidateKey];
    }
    else
    {
      char v4 = 1;
    }
  }
  return v4;
}

- (BOOL)isWubi:(id)a3
{
  id v3 = a3;
  if (!-[TIKeyboardInputManagerWubi isWubi:]::notWubiSet)
  {
    char v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"⼀⼁⼃⼂乛問匹"];
    uint64_t v5 = [v4 invertedSet];
    v6 = (void *)-[TIKeyboardInputManagerWubi isWubi:]::notWubiSet;
    -[TIKeyboardInputManagerWubi isWubi:]::notWubiSet = v5;
  }
  BOOL v7 = objc_msgSend(v3, "rangeOfCharacterFromSet:") == 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (id)inputsToReject
{
  BOOL v3 = [(TIKeyboardInputManagerShapeBased *)self hasCandidates];
  if (v3) {
    char v4 = 0;
  }
  else {
    char v4 = @"⼀⼁⼃⼂乛問匹";
  }
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerWubi;
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)&v10 inputsToReject];
  v6 = v5;
  if (v3)
  {
    id v7 = v5;
  }
  else
  {
    if (v5)
    {
      v8 = (void *)[v5 mutableCopy];
      [v8 addCharactersInString:v4];
      goto LABEL_10;
    }
    id v7 = (id)[objc_alloc(MEMORY[0x263F7E520]) initWithCharactersInString:v4];
  }
  v8 = v7;
LABEL_10:

  return v8;
}

- (BOOL)acceptInputString:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManagerWubi *)self isWubi:v4])
  {
    v7.receiver = self;
    v7.super_class = (Class)TIKeyboardInputManagerWubi;
    BOOL v5 = [(TIKeyboardInputManagerShapeBased *)&v7 acceptInputString:v4];
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (void)pushCandidateGenerationContextWithResults:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TIKeyboardInputManagerWubi *)self autoConfirmationCandidate];
  [v4 setAcceptedCandidate:v5];

  [(TIKeyboardInputManagerWubi *)self setAutoConfirmationCandidate:0];
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerWubi;
  [(TIKeyboardInputManagerWubi *)&v6 pushCandidateGenerationContextWithResults:v4];
}

- (void)openCandidateGenerationContextWithCandidateHandler:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerWubi;
  [(TIKeyboardInputManagerWubi *)&v4 openCandidateGenerationContextWithCandidateHandler:a3];
  [(TIKeyboardInputManagerWubi *)self setAutoConfirmationCandidate:0];
}

- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerWubi;
  BOOL v5 = [(TIKeyboardInputManagerShapeBased *)&v8 updateCandidatesWithTIWordSearch:a3 predictionEnabled:a4];
  if (v5)
  {
    objc_super v6 = [(TIKeyboardInputManagerShapeBased *)self markedTextWithAutoconvertedCandidates];
    [(TIKeyboardInputManagerChinese *)self setInput:v6];
  }
  return v5;
}

- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5 = a3;
  if ([(TIKeyboardInputManagerWubi *)self shouldSkipCandidateSelection])
  {
    [(TIKeyboardInputManagerWubi *)self closeCandidateGenerationContextWithResults:0];
  }
  else
  {
    objc_super v6 = [v5 candidates];
    if ([v6 count])
    {
      objc_initWeak(&location, self);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __66__TIKeyboardInputManagerWubi_notifyUpdateCandidates_forOperation___block_invoke;
      v24[3] = &unk_265535530;
      objc_copyWeak(&v26, &location);
      id v25 = v6;
      [(TIKeyboardInputManagerMecabra *)self addStickers:v5 withCompletionHandler:v24];

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      unsigned int v7 = [(TIKeyboardInputManagerShapeBased *)self inputCount];
      if (v7 < 2)
      {
        v12 = 0;
      }
      else
      {
        uint64_t v8 = v7;
        v9 = NSString;
        objc_super v10 = [(TIKeyboardInputManagerWubi *)self inputString];
        v11 = [v10 substringFromIndex:v8 - 1];
        v12 = [v9 stringWithString:v11];
      }
      [(TIKeyboardInputManagerMecabra *)self setRemainingInput:v12];
      self->super._keepRemainingInput = 1;
      id v13 = objc_alloc(MEMORY[0x263F7EAB8]);
      v14 = [(TIKeyboardInputManagerWubi *)self keyboardState];
      v15 = (void *)[v13 initWithKeyboardState:v14];

      [(TIKeyboardInputManagerWubi *)self acceptCurrentCandidateWithContext:v15];
      v16 = [v15 output];
      v17 = [v16 acceptedCandidate];
      [(TIKeyboardInputManagerWubi *)self setAutoConfirmationCandidate:v17];

      [(TIKeyboardInputManagerMecabra *)self setRemainingInput:0];
      self->super._keepRemainingInput = 0;
      v18 = [(TIKeyboardInputManagerWubi *)self keyboardState];
      v19 = [v18 currentCandidate];

      if (v19)
      {
        [(TIKeyboardInputManagerShapeBased *)self setPreviousActionWasAutoConfirmation:1];
        v20 = [(TIKeyboardInputManagerWubi *)self keyboardState];
        v21 = [v20 inputMode];
        v22 = TIStatisticGetKeyForCandidateAccepted();
        TIStatisticScalarIncrement();
      }
      v23 = [(TIKeyboardInputManagerShapeBased *)self candidateResultSet];
      if (([v23 isDummySet] & 1) == 0)
      {
        [(TIKeyboardInputManagerWubi *)self setMarkedText];
        [(TIKeyboardInputManagerWubi *)self closeCandidateGenerationContextWithResults:v23];
      }
    }
  }
}

void __66__TIKeyboardInputManagerWubi_notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setWordSearchCandidateResultSet:v4];

  id v5 = [WeakRetained markedTextWithAutoconvertedCandidates];
  [WeakRetained setInput:v5];

  [WeakRetained setMarkedText];
  uint64_t v6 = *(void *)(a1 + 32);
  unsigned int v7 = [WeakRetained wordSearchCandidateResultSet];
  uint64_t v8 = [v7 proactiveTriggers];
  v9 = [WeakRetained candidateResultSetFromCandidates:v6 proactiveTriggers:v8];
  [WeakRetained closeCandidateGenerationContextWithResults:v9];
}

- (id)formattedSearchString
{
  [(TIKeyboardInputManagerWubi *)self inputMethodType];
  BOOL v3 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  InputKeyFromASCIIString = (void *)MecabraInputKeyPropertiesCreateInputKeyFromASCIIString();

  return InputKeyFromASCIIString;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerWubi;
  id v4 = [(TIKeyboardInputManagerShapeBased *)&v7 deleteFromInput:a3];
  id v5 = [(TIKeyboardInputManagerShapeBased *)self markedTextWithAutoconvertedCandidates];
  [(TIKeyboardInputManagerChinese *)self setInput:v5];

  return 0;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:0];
  if (![(TIKeyboardInputManagerChinese *)self handlePairedPunctuationInput:v6 context:v7])
  {
    uint64_t v8 = [v6 string];
    if ([v8 length])
    {
      if ([v8 isEqualToString:@"☻"])
      {
        id v9 = (id)*MEMORY[0x263F7EBF8];
      }
      else
      {
        id v9 = [(TIKeyboardInputManagerChinese *)self outputByConvertingDecimalPointForInput:v8];
      }
      objc_super v10 = v9;

      [(TIKeyboardInputManagerShapeBased *)self cancelCandidatesThread];
      [(TIKeyboardInputManagerShapeBased *)self setPreviousActionWasAutoConfirmation:0];
      if ([v6 isMultitap])
      {
        uint64_t v22 = 0;
        id v11 = [(TIKeyboardInputManagerWubi *)self deleteFromInput:&v22];
        if (v22) {
          objc_msgSend(v7, "deleteBackward:");
        }
      }
      if ([(TIKeyboardInputManagerWubi *)self shouldSkipCandidateSelection])
      {
        v21.receiver = self;
        v21.super_class = (Class)TIKeyboardInputManagerWubi;
        [(TIKeyboardInputManagerWubi *)&v21 addInput:v6 withContext:v7];
      }
      else
      {
        if ([v10 length]
          && ([(TIKeyboardInputManagerWubi *)self isWubi:v10]
           || [(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v10]))
        {
          v12 = [(TIKeyboardInputManagerShapeBased *)self searchString];
          int v13 = [v12 isEqualToString:*MEMORY[0x263F7EBF8]];

          if (v13)
          {
            [(TIKeyboardInputManagerMecabra *)self setRemainingInput:0];
            [(TIKeyboardInputManagerWubi *)self acceptCurrentCandidateWithContext:v7];
          }
          v14 = [v10 stringByReplacingOccurrencesOfString:@"問" withString:@"＊"];
          [(TIKeyboardInputManagerWubi *)self inputMethodType];
          ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();
          v16 = [(TIKeyboardInputManagerShapeBased *)self searchString];
          [v16 appendString:ASCIIFromInputKeyString];

          [v6 setString:v14];
          v17 = [(TIKeyboardInputManagerShapeBased *)self markedTextWithAutoconvertedCandidates];
          [(TIKeyboardInputManagerChinese *)self setInput:v17];

          [(TIKeyboardInputManagerWubi *)self setMarkedText];
        }
        else if ([v10 isEqualToString:*MEMORY[0x263F7EBF8]])
        {
          [(TIKeyboardInputManagerWubi *)self acceptCurrentCandidateWithContext:v7];
          v18 = [(TIKeyboardInputManagerShapeBased *)self searchString];
          [v18 appendString:v10];

          [v6 setString:v10];
          v20.receiver = self;
          v20.super_class = (Class)TIKeyboardInputManagerWubi;
          [(TIKeyboardInputManagerWubi *)&v20 addInput:v6 withContext:v7];
        }
        else
        {
          [(TIKeyboardInputManagerMecabra *)self setRemainingInput:0];
          [(TIKeyboardInputManagerWubi *)self acceptCurrentCandidateWithContext:v7];
          [v7 insertText:v10];
        }
        if (([v6 isFlick] & 1) == 0 && (objc_msgSend(v6, "isMultitap") & 1) == 0)
        {
          v19 = [v6 inputManagerHint];
          [(TIKeyboardInputManagerChinese *)self setCurrentKeyHint:v19];
        }
      }
    }
    else
    {
      objc_super v10 = v8;
    }
  }
}

- (int)inputMethodType
{
  return 0;
}

+ (Class)wordSearchClass
{
  return 0;
}

@end