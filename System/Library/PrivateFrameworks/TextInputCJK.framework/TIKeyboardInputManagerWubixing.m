@interface TIKeyboardInputManagerWubixing
+ (Class)wordSearchClass;
- (BOOL)acceptAutocorrectionCommitsInline;
- (BOOL)isValidWubiInput:(id)a3;
- (BOOL)supportsNumberKeySelection;
- (BOOL)usesPunctuationKeysForRowNavigation;
- (TIKeyboardCandidate)autoConfirmationCandidate;
- (id)keyboardBehaviors;
- (id)sortingMethods;
- (int)inputMethodType;
- (unint64_t)initialSelectedIndex;
- (unsigned)inputIndex;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4;
- (void)setAutoConfirmationCandidate:(id)a3;
- (void)updateMarkedText;
@end

@implementation TIKeyboardInputManagerWubixing

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

- (BOOL)isValidWubiInput:(id)a3
{
  id v4 = a3;
  if (-[TIKeyboardInputManagerWubixing isValidWubiInput:]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManagerWubixing isValidWubiInput:]::onceToken, &__block_literal_global_610);
  }
  v5 = [(TIKeyboardInputManagerShapeBased *)self searchString];
  if (![v5 length])
  {

    goto LABEL_7;
  }
  char v6 = [v4 isEqualToString:@"."];

  if ((v6 & 1) == 0)
  {
LABEL_7:
    BOOL v7 = [v4 rangeOfCharacterFromSet:-[TIKeyboardInputManagerWubixing isValidWubiInput:]::notWubiSet] == 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_8;
  }
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

void __51__TIKeyboardInputManagerWubixing_isValidWubiInput___block_invoke()
{
  v0 = [MEMORY[0x263F08708] lowercaseLetterCharacterSet];
  id v4 = (id)[v0 mutableCopy];

  v1 = [MEMORY[0x263F08708] uppercaseLetterCharacterSet];
  [v4 formUnionWithCharacterSet:v1];

  uint64_t v2 = [v4 invertedSet];
  v3 = (void *)-[TIKeyboardInputManagerWubixing isValidWubiInput:]::notWubiSet;
  -[TIKeyboardInputManagerWubixing isValidWubiInput:]::notWubiSet = v2;
}

- (void)notifyUpdateCandidates:(id)a3 forOperation:(id)a4
{
  id v5 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__TIKeyboardInputManagerWubixing_notifyUpdateCandidates_forOperation___block_invoke;
  v7[3] = &unk_265535530;
  objc_copyWeak(&v9, &location);
  id v8 = v5;
  id v6 = v5;
  [(TIKeyboardInputManagerMecabra *)self addStickers:v6 withCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __70__TIKeyboardInputManagerWubixing_notifyUpdateCandidates_forOperation___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained setWordSearchCandidateResultSet:v4];

  id v5 = [WeakRetained searchString];
  id v6 = [WeakRetained wordSearchCandidateResultSet];
  BOOL v7 = [v6 candidates];
  if (![v7 count])
  {
    uint64_t v8 = [v5 length];

    if (!v8) {
      goto LABEL_5;
    }
    id v6 = [WeakRetained markedTextWithAutoconvertedCandidates];
    BOOL v7 = [WeakRetained wordSearchCandidateResultSet];
    [v7 addSyntheticMecabraCandidateWithSurface:v6 input:v5];
  }

LABEL_5:
  [WeakRetained updateMarkedText];
  id v9 = [WeakRetained candidateResultSetFromWordSearchCandidateResultSet:*(void *)(a1 + 32)];
  [WeakRetained closeCandidateGenerationContextWithResults:v9];
}

- (unsigned)inputIndex
{
  uint64_t v2 = [(TIKeyboardInputManagerWubixing *)self inputString];
  unsigned int v3 = [v2 length];

  return v3;
}

- (void)updateMarkedText
{
  id v3 = [(TIKeyboardInputManagerShapeBased *)self markedTextWithAutoconvertedCandidates];
  [(TIKeyboardInputManagerChinese *)self setInput:v3];
  [(TIKeyboardInputManagerWubixing *)self setMarkedText];
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 string];
  if ([v8 length])
  {
    [(TIKeyboardInputManagerShapeBased *)self cancelCandidatesThread];
    if ([v8 isEqualToString:@"☻"])
    {
      int v9 = 1;
    }
    else
    {
      v10 = [(TIKeyboardInputManagerWubixing *)self keyboardState];
      if ([v10 hardwareKeyboardMode]) {
        int v9 = [v8 isEqualToString:*MEMORY[0x263F7EBE8]];
      }
      else {
        int v9 = 0;
      }
    }
    if ([(TIKeyboardInputManagerWubixing *)self isValidWubiInput:v8]
      || [(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v8])
    {
      if ([(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates]) {
        [(TIKeyboardInputManagerWubixing *)self acceptCurrentCandidateWithContext:v7];
      }
      v11 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      [v11 appendString:v8];

      [(TIKeyboardInputManagerWubixing *)self updateMarkedText];
    }
    else if (v9)
    {
      if ([v8 isEqualToString:@"☻"])
      {
        id v12 = (id)*MEMORY[0x263F7EBF8];

        uint64_t v8 = v12;
      }
      [(TIKeyboardInputManagerWubixing *)self acceptCurrentCandidateWithContext:v7];
      v13 = [(TIKeyboardInputManagerShapeBased *)self searchString];
      [v13 appendString:v8];

      [v6 setString:v8];
      v15.receiver = self;
      v15.super_class = (Class)TIKeyboardInputManagerWubixing;
      [(TIKeyboardInputManagerWubixing *)&v15 addInput:v6 withContext:v7];
    }
    else
    {
      [(TIKeyboardInputManagerWubixing *)self acceptCurrentCandidateWithContext:v7];
      uint64_t v14 = [(TIKeyboardInputManagerChinese *)self outputByConvertingDecimalPointForInput:v8];

      [v7 insertText:v14];
      uint64_t v8 = (void *)v14;
    }
  }
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  return 1;
}

- (id)sortingMethods
{
  if ([(TIKeyboardInputManagerChinese *)self showingFacemarkCandidates]) {
    return &unk_270B8AFE8;
  }
  if ([(TIKeyboardInputManagerChinese *)self hasIdeographicCandidates]) {
    return &unk_270B8B018;
  }
  return &unk_270B8B000;
}

- (int)inputMethodType
{
  return 10;
}

- (BOOL)supportsNumberKeySelection
{
  uint64_t v2 = [(TIKeyboardInputManagerWubixing *)self inputString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (unint64_t)initialSelectedIndex
{
  BOOL v3 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v4 = [v3 BOOLForPreferenceKey:*MEMORY[0x263F7E888]];

  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerWubixing;
  return [(TIKeyboardInputManagerShapeBased *)&v6 initialSelectedIndex];
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E610]);
  return v2;
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return 1;
}

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

@end