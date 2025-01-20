@interface TIKeyboardInputManagerCangjie
+ (Class)wordSearchClass;
- (BOOL)firstCandidateIsEnglish;
- (BOOL)isPunctuationInput;
- (BOOL)selectedCandidateIsEnglish;
- (BOOL)suchengEnabled;
- (BOOL)supportsEnglish;
- (BOOL)supportsNumberKeySelection;
- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4;
- (id)cangjieAlphabetSet;
- (id)cangjieSet;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)formattedSearchString;
- (id)keyboardBehaviors;
- (id)nonstopPunctuationCharacters;
- (id)sortingMethods;
- (unint64_t)cangjieInputType:(id)a3 fromPopupVariant:(BOOL)a4;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)setSuchengEnabled:(BOOL)a3;
- (void)setSupportsEnglish:(BOOL)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)syncToLayoutState:(id)a3;
- (void)syncWordSearch;
- (void)updateMarkedText;
@end

@implementation TIKeyboardInputManagerCangjie

- (void)setSupportsEnglish:(BOOL)a3
{
  *(&self->super._previousActionWasAutoConfirmation + 2) = a3;
}

- (BOOL)supportsEnglish
{
  return *(&self->super._previousActionWasAutoConfirmation + 2);
}

- (void)setSuchengEnabled:(BOOL)a3
{
  *(&self->super._previousActionWasAutoConfirmation + 1) = a3;
}

- (BOOL)suchengEnabled
{
  return *(&self->super._previousActionWasAutoConfirmation + 1);
}

- (id)sortingMethods
{
  if ([(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates])
  {
    v3 = &unk_270B8AF40;
  }
  else if ([(TIKeyboardInputManagerCangjie *)self isPunctuationInput])
  {
    v3 = &unk_270B8AF58;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManagerCangjie;
    v3 = [(TIKeyboardInputManagerShapeBased *)&v5 sortingMethods];
  }
  return v3;
}

- (BOOL)isPunctuationInput
{
  v2 = [(TIKeyboardInputManagerCangjie *)self inputString];
  ASCIIFromInputKeyString = (void *)MecabraInputKeyPropertiesCreateASCIIFromInputKeyString();

  if (([ASCIIFromInputKeyString isEqualToString:@"z"] & 1) != 0
    || ([ASCIIFromInputKeyString hasPrefix:@"zx"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [ASCIIFromInputKeyString hasPrefix:@"yyy"];
  }

  return v4;
}

- (id)cangjieAlphabetSet
{
  v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet;
  if (!-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet)
  {
    v3 = objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 65, 26);
    objc_msgSend(v3, "addCharactersInRange:", 97, 26);
    uint64_t v4 = [v3 copy];
    objc_super v5 = (void *)-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet;
    -[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet = v4;

    v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieAlphabetSet]::cangjieAlphabetSet;
  }
  return v2;
}

- (id)cangjieSet
{
  v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet;
  if (!-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet)
  {
    v3 = MecabraInputKeyPropertiesGetInputKeys();
    uint64_t v4 = [MEMORY[0x263F08708] characterSetWithCharactersInString:v3];
    objc_super v5 = (void *)-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet;
    -[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet = v4;

    v2 = (void *)-[TIKeyboardInputManagerCangjie cangjieSet]::cangjieSet;
  }
  return v2;
}

- (unint64_t)cangjieInputType:(id)a3 fromPopupVariant:(BOOL)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6
    && [v6 length]
    && ([(TIKeyboardInputManagerCangjie *)self shouldSkipCandidateSelection] & 1) == 0)
  {
    if (([v7 isEqualToString:@"☻"] & 1) != 0
      || [(TIKeyboardInputManagerChinese *)self isFacemarkInput:v7])
    {
      unint64_t v8 = 2;
      goto LABEL_5;
    }
    if (!a4)
    {
      v10 = [(TIKeyboardInputManagerCangjie *)self cangjieSet];
      char v11 = objc_msgSend(v10, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", 0));

      unint64_t v8 = 0;
      if (v11) {
        goto LABEL_5;
      }
      v12 = [(TIKeyboardInputManagerCangjie *)self cangjieAlphabetSet];
      char v13 = objc_msgSend(v12, "characterIsMember:", objc_msgSend(v7, "characterAtIndex:", 0));

      if (v13)
      {
        unint64_t v8 = 1;
        goto LABEL_5;
      }
    }
  }
  unint64_t v8 = 3;
LABEL_5:

  return v8;
}

- (id)nonstopPunctuationCharacters
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerCangjie;
  v2 = [(TIKeyboardInputManagerCangjie *)&v9 nonstopPunctuationCharacters];
  v3 = [(id)objc_opt_class() pairedPunctuationDictionary];
  uint64_t v4 = [v3 allKeys];
  objc_super v5 = [v4 componentsJoinedByString:&stru_270B867F0];
  id v6 = [v2 stringByAppendingString:v5];

  v7 = [v6 stringByAppendingString:@"☻"];

  return v7;
}

- (BOOL)updateCandidatesWithTIWordSearch:(id)a3 predictionEnabled:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerCangjie;
  BOOL v5 = [(TIKeyboardInputManagerShapeBased *)&v7 updateCandidatesWithTIWordSearch:a3 predictionEnabled:a4];
  if (v5) {
    [(TIKeyboardInputManagerCangjie *)self updateMarkedText];
  }
  return v5;
}

- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5 = a3;
  if ([(TIKeyboardInputManagerCangjie *)self shouldSkipCandidateSelection])
  {
    [(TIKeyboardInputManagerCangjie *)self closeCandidateGenerationContextWithResults:0];
  }
  else
  {
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __69__TIKeyboardInputManagerCangjie_notifyUpdateCandidates_forOperation___block_invoke;
    v6[3] = &unk_265535530;
    objc_copyWeak(&v8, &location);
    id v7 = v5;
    [(TIKeyboardInputManagerMecabra *)self addStickers:v7 withCompletionHandler:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __69__TIKeyboardInputManagerCangjie_notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [*(id *)(a1 + 32) candidates];
  [WeakRetained setWordSearchCandidateResultSet:v4];

  [WeakRetained updateMarkedText];
  [WeakRetained setMarkedText];
  id v6 = [WeakRetained wordSearchCandidateResultSet];
  id v7 = [v6 proactiveTriggers];
  id v8 = [WeakRetained candidateResultSetFromCandidates:v5 proactiveTriggers:v7];
  [WeakRetained closeCandidateGenerationContextWithResults:v8];
}

- (BOOL)selectedCandidateIsEnglish
{
  v3 = [(TIKeyboardInputManagerCangjie *)self keyboardState];
  id v4 = [v3 currentCandidate];
  id v5 = [v4 candidate];

  if ([v5 length])
  {
    id v6 = [v5 substringToIndex:1];
    BOOL v7 = [(TIKeyboardInputManagerCangjie *)self cangjieInputType:v6 fromPopupVariant:0] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)firstCandidateIsEnglish
{
  v3 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  id v4 = [v3 candidates];
  id v5 = [v4 firstObject];

  id v6 = [v5 candidate];
  if ([v6 length])
  {
    BOOL v7 = [v6 substringToIndex:1];
    BOOL v8 = [(TIKeyboardInputManagerCangjie *)self cangjieInputType:v7 fromPopupVariant:0] == 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)updateMarkedText
{
  id v9 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  if (![v9 length])
  {
    [(TIKeyboardInputManagerChinese *)self setInput:v9];
    goto LABEL_13;
  }
  if (![(TIKeyboardInputManagerCangjie *)self supportsEnglish]) {
    goto LABEL_8;
  }
  v3 = [v9 lowercaseString];
  if (![v3 isEqualToString:v9])
  {

    goto LABEL_10;
  }
  BOOL v4 = [(TIKeyboardInputManagerCangjie *)self firstCandidateIsEnglish];

  if (v4)
  {
LABEL_10:
    id v8 = v9;
    goto LABEL_11;
  }
  if (![(TIKeyboardInputManagerCangjie *)self selectedCandidateIsEnglish])
  {
LABEL_8:
    id v8 = [(TIKeyboardInputManagerShapeBased *)self markedTextWithAutoconvertedCandidates];
LABEL_11:
    BOOL v7 = v8;
    goto LABEL_12;
  }
  id v5 = [(TIKeyboardInputManagerCangjie *)self keyboardState];
  id v6 = [v5 currentCandidate];
  BOOL v7 = [v6 candidate];

LABEL_12:
  [(TIKeyboardInputManagerChinese *)self setInput:v7];

LABEL_13:
}

- (id)formattedSearchString
{
  v2 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  InputKeyFromASCIIString = (void *)MecabraInputKeyPropertiesCreateInputKeyFromASCIIString();

  return InputKeyFromASCIIString;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerCangjie;
  id v4 = [(TIKeyboardInputManagerShapeBased *)&v6 deleteFromInput:a3];
  [(TIKeyboardInputManagerCangjie *)self updateMarkedText];
  return 0;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerCangjie;
  [(TIKeyboardInputManagerChinese *)&v8 syncToKeyboardState:a3 from:a4 afterContextChange:a5];
  [(TIKeyboardInputManagerCangjie *)self syncWordSearch];
  objc_super v6 = [(TIKeyboardInputManagerCangjie *)self keyboardState];
  BOOL v7 = [v6 currentCandidate];

  if (v7)
  {
    [(TIKeyboardInputManagerCangjie *)self updateMarkedText];
    [(TIKeyboardInputManagerCangjie *)self setMarkedText];
  }
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 string];
  if ([v6 isPopupVariant]) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = [v6 isGesture];
  }
  if ([v8 length])
  {
    [(TIKeyboardInputManagerShapeBased *)self setPreviousActionWasAutoConfirmation:0];
    if ([v8 isEqualToString:@"☻"])
    {
      id v10 = (id)*MEMORY[0x263F7EBF8];
    }
    else
    {
      id v10 = [(TIKeyboardInputManagerChinese *)self outputByConvertingDecimalPointForInput:v8];
    }
    char v11 = v10;

    [(TIKeyboardInputManagerShapeBased *)self cancelCandidatesThread];
    v12 = [v6 string];
    unint64_t v13 = [(TIKeyboardInputManagerCangjie *)self cangjieInputType:v12 fromPopupVariant:v9];

    if (v13 == 2)
    {
      [(TIKeyboardInputManagerCangjie *)self acceptCurrentCandidateWithContext:v7];
      v16 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      [v16 appendString:v11];

      [v6 setString:v11];
      v21.receiver = self;
      v21.super_class = (Class)TIKeyboardInputManagerCangjie;
      [(TIKeyboardInputManagerCangjie *)&v21 addInput:v6 withContext:v7];
      goto LABEL_20;
    }
    if (v13 == 3)
    {
      v14 = [v6 string];
      BOOL v15 = [(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v14];

      if (!v15)
      {
        [(TIKeyboardInputManagerCangjie *)self acceptCurrentCandidateWithContext:v7];
        [v7 insertText:v11];
        goto LABEL_20;
      }
    }
    else
    {
      v17 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      BOOL v18 = [(TIKeyboardInputManagerChinese *)self isFacemarkInput:v17];

      if (v18) {
        [(TIKeyboardInputManagerCangjie *)self acceptCurrentCandidateWithContext:v7];
      }
    }
    v19 = [(TIKeyboardInputManagerShapeBased *)self searchString];
    if ([(TIKeyboardInputManagerCangjie *)self supportsEnglish])
    {
      [v19 appendString:v11];
    }
    else
    {
      v20 = [v11 lowercaseString];
      [v19 appendString:v20];
    }
    [(TIKeyboardInputManagerCangjie *)self updateMarkedText];
    [(TIKeyboardInputManagerCangjie *)self setMarkedText];
  }
  else
  {
    char v11 = v8;
  }
LABEL_20:
}

- (void)syncWordSearch
{
  id v3 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  objc_msgSend(v3, "setSuchengEnabled:", -[TIKeyboardInputManagerCangjie suchengEnabled](self, "suchengEnabled"));
  objc_msgSend(v3, "setSupportsEnglish:", -[TIKeyboardInputManagerCangjie supportsEnglish](self, "supportsEnglish"));
}

- (void)syncToLayoutState:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManagerCangjie;
  id v4 = a3;
  [(TIKeyboardInputManagerChinese *)&v8 syncToLayoutState:v4];
  id v5 = objc_msgSend(v4, "inputMode", v8.receiver, v8.super_class);
  id v6 = TIInputModeGetVariant();
  -[TIKeyboardInputManagerCangjie setSuchengEnabled:](self, "setSuchengEnabled:", [v6 isEqualToString:@"Sucheng"]);

  id v7 = [v4 softwareLayout];

  -[TIKeyboardInputManagerCangjie setSupportsEnglish:](self, "setSupportsEnglish:", [v7 hasSuffix:@"QWERTY"]);
  [(TIKeyboardInputManagerCangjie *)self syncWordSearch];
}

- (BOOL)supportsNumberKeySelection
{
  v2 = [(TIKeyboardInputManagerCangjie *)self inputString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5D0]);
  return v2;
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

@end