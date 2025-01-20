@interface TIKeyboardInputManager_th
+ (Class)wordSearchClass;
- (BOOL)canTrimInputAtIndex:(unsigned int)a3;
- (BOOL)canTypeAndPathSimultaneously;
- (BOOL)deletesComposedTextByComposedCharacterSequence;
- (BOOL)shouldAutocommitForInput:(id)a3;
- (BOOL)shouldExtendPriorWord;
- (BOOL)shouldResample;
- (BOOL)supportsLearning;
- (BOOL)usesComposingInput;
- (BOOL)usesMarkedTextForInput;
- (BOOL)usesRetrocorrection;
- (TIKeyboardInputManager_th)initWithConfig:(id)a3 keyboardState:(id)a4;
- (USet)validUSetForAutocorrection;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)firstMecabraCandidateOccurranceFromLastAutocorrectionList;
- (id)keyboardBehaviors;
- (id)trimmedInputStem;
- (id)validCharacterSetForAutocorrection;
- (id)wordSearch;
- (id)wordSeparator;
- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)candidateRejected:(id)a3;
- (void)dropInputPrefix:(unsigned int)a3;
- (void)dropInputPrefix:(unsigned int)a3 commitToWordSearch:(BOOL)a4;
- (void)initImplementation;
- (void)loadDictionaries;
- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6;
- (void)setAutoCorrects:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setInput:(id)a3 withIndex:(unsigned int)a4;
- (void)setWordBoundary;
- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5;
@end

@implementation TIKeyboardInputManager_th

+ (Class)wordSearchClass
{
  return (Class)objc_opt_class();
}

- (TIKeyboardInputManager_th)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_th;
  v8 = [(TIKeyboardInputManagerMecabra *)&v14 initWithConfig:v6 keyboardState:v7];
  if (v8)
  {
    v9 = [MEMORY[0x263F7EB70] sharedWordSearchController];
    v10 = [v6 inputMode];
    uint64_t v11 = [v9 wordSearchForInputMode:v10];
    wordSearch = v8->_wordSearch;
    v8->_wordSearch = (TIWordSearch *)v11;

    TIInputManager::set_search_algorithm();
  }

  return v8;
}

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (void)loadDictionaries
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManager_mul *)&v4 loadDictionaries];
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (v3) {
    *(unsigned char *)(*(void *)(v3 + 224) + 64) = 1;
  }
}

- (BOOL)shouldExtendPriorWord
{
  return 1;
}

- (BOOL)supportsLearning
{
  return 0;
}

- (BOOL)usesMarkedTextForInput
{
  return 0;
}

- (BOOL)usesRetrocorrection
{
  return 1;
}

- (id)wordSeparator
{
  return &stru_26F5E4DB8;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E600]);

  return v2;
}

- (void)setAutoCorrects:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(TIKeyboardInputManager_th *)self wordSearch];
  [v4 setAutoCorrects:v3];
}

- (id)firstMecabraCandidateOccurranceFromLastAutocorrectionList
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = [(TIKeyboardInputManager_th *)self lastAutocorrectionList];
  id v4 = [v3 corrections];
  v5 = [v4 autocorrection];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v5;
  if (!v6)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(TIKeyboardInputManager_th *)self lastAutocorrectionList];
    v9 = [v8 predictions];

    id v7 = (id)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v9);
          }
          v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v7 = v12;
            goto LABEL_15;
          }
        }
        id v7 = (id)[v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_15:
  }

  return v7;
}

- (BOOL)shouldAutocommitForInput:(id)a3
{
  id v4 = a3;
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]))
  {
    v5 = [(TIKeyboardInputManager_th *)self keyboardState];
    if ([v5 autocorrectionEnabled])
    {
      id v6 = [(TIKeyboardInputManager_th *)self keyboardState];
      id v7 = [v6 textInputTraits];
      BOOL v8 = [v7 autocorrectionType] != 1;
    }
    else
    {
      BOOL v8 = 0;
    }

    uint64_t v10 = [(TIKeyboardInputManager_th *)self firstMecabraCandidateOccurranceFromLastAutocorrectionList];
    if (v10)
    {
      [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v10];
      uint64_t v11 = MecabraCandidateGetAnalysisString();
      unint64_t WordCount = (int)MecabraCandidateGetWordCount();
    }
    else if (v8)
    {
      uint64_t v11 = 0;
      unint64_t WordCount = 0;
    }
    else
    {
      uint64_t v11 = [(TIKeyboardInputManager_th *)self inputStem];
      if (v4)
      {
        v13 = [v4 string];
        uint64_t v14 = [v11 stringByAppendingString:v13];

        uint64_t v11 = (void *)v14;
      }
      v22.receiver = self;
      v22.super_class = (Class)TIKeyboardInputManager_th;
      unint64_t WordCount = (unint64_t)[(TIKeyboardInputManager_th *)&v22 countOfWordsIninputStem:v11];
    }
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManager_th;
    long long v15 = (char *)[(TIKeyboardInputManager_th *)&v21 maxPriorWordTokensAfterTrimming]+ 1;
    if (WordCount) {
      double v16 = (float)((float)(unint64_t)[v11 length] / (float)WordCount);
    }
    else {
      double v16 = 1.0;
    }
    unint64_t v17 = [v11 length];
    BOOL v19 = v16 > 2.5 && WordCount > (unint64_t)v15;
    BOOL v9 = v17 > 0xC || v19;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)trimmedInputStem
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]))
  {
    BOOL v3 = [(TIKeyboardInputManager_th *)self inputStem];
    uint64_t v4 = [(__CFString *)v3 _lastLongCharacter];
    if (v4)
    {
      v5 = [NSString _stringWithUnichar:v4];
    }
    else
    {
      v5 = &stru_26F5E4DB8;
    }
    if ([(TIKeyboardInputManagerMecabra *)self stringEndsWord:v5])
    {

      id v6 = &stru_26F5E4DB8;
    }
    else
    {
      id v6 = v3;
      if ([(TIKeyboardInputManager_th *)self shouldAutocommitForInput:0])
      {
        id v7 = [(TIKeyboardInputManager_th *)self firstMecabraCandidateOccurranceFromLastAutocorrectionList];
        if (v7)
        {
          BOOL v8 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v7];
          BOOL v9 = [MEMORY[0x263F7EB00] getWordFromAnalysisStringOf:v8 atIndex:0];
          if ([(__CFString *)v3 hasPrefix:v9])
          {
            uint64_t v10 = -[__CFString substringFromIndex:](v3, "substringFromIndex:", [v9 length]);
          }
          else
          {
            v13.receiver = self;
            v13.super_class = (Class)TIKeyboardInputManager_th;
            uint64_t v10 = [(TIKeyboardInputManager_th *)&v13 trimmedInputStem];
          }
          id v6 = (__CFString *)v10;

          [(TIKeyboardInputManager_th *)self setLastAutocorrectionList:0];
        }
        else
        {
          v12.receiver = self;
          v12.super_class = (Class)TIKeyboardInputManager_th;
          id v6 = [(TIKeyboardInputManager_th *)&v12 trimmedInputStem];
          BOOL v9 = v3;
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)canTrimInputAtIndex:(unsigned int)a3
{
  return TIInputManager::LockedInput::locked_length((TIInputManager::LockedInput *)(*(char **)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98])
                                                                                                + 172)) <= a3;
}

- (void)dropInputPrefix:(unsigned int)a3
{
}

- (void)dropInputPrefix:(unsigned int)a3 commitToWordSearch:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (v7)
  {
    TIInputManager::input_substring(v7);
    BOOL v9 = KB::ns_string((KB *)v15, v8);
    uint64_t v10 = [(TIKeyboardInputManager_mul *)self internalStringToExternal:v9];

    KB::String::~String((KB::String *)v15);
  }
  else
  {
    uint64_t v10 = 0;
  }
  if ([v10 length] && v4)
  {
    uint64_t v11 = [(TIKeyboardInputManager_th *)self wordSearch];
    [v11 commitSurface:v10];
  }
  if (v5)
  {
    int v12 = v5;
    do
    {
      objc_super v13 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v13 removeInputAtIndex:0];

      --v12;
    }
    while (v12);
  }
  v14.receiver = self;
  v14.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManagerMecabra *)&v14 dropInputPrefix:v5];
}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (!a4) {
    a3 = &stru_26F5E4DB8;
  }
  [(TIKeyboardInputManager_th *)self setInput:a3];

  [(TIKeyboardInputManager_th *)self setInputIndex:v4];
}

- (void)setInput:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManager_th *)&v18 setInput:v4];
  uint64_t v5 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  [v5 removeAllInputs];

  id v6 = [v4 _asTypeInputs];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = objc_msgSend(v6, "inputs", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
        objc_super v13 = [(TIKeyboardInputManagerMecabra *)self composingInput];
        [v13 composeNew:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)setWordBoundary
{
  uint64_t v2 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + v2))
  {
    [(TIKeyboardInputManager_th *)self dropInput];
    uint64_t v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v2);
    MEMORY[0x270F7CE08](v4, 0);
  }
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v23.receiver = self;
  v23.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManagerMecabra *)&v23 textAccepted:v8 fromPredictiveInputBar:v6 withInput:v9];
  uint64_t v10 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v8];
  uint64_t v11 = [(TIKeyboardInputManager_th *)self wordSearch];
  uint64_t v12 = v11;
  if (v10)
  {
    [v11 performAccept:v10 isPartial:0];
  }
  else
  {
    objc_super v13 = [v8 candidate];
    [v12 commitSurface:v13];
  }
  long long v14 = [v9 string];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    long long v16 = [(TIKeyboardInputManager_th *)self wordSearch];
    long long v17 = [v9 string];
    [v16 commitSurface:v17];
  }
  if (_os_feature_enabled_impl())
  {
    objc_super v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    BOOL v19 = [v18 composingInput];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v20 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      objc_super v21 = [v20 composingInput];

      if (v21 && ([v21 isCompleting] & 1) == 0 && !objc_msgSend(v21, "isComplete")) {
        goto LABEL_15;
      }
    }
    else
    {

      objc_super v21 = 0;
    }
    objc_super v22 = [(TIKeyboardInputManager_th *)self lastAcceptedText];
    [(TIKeyboardInputManagerMecabra *)self clearInput];
    [(TIKeyboardInputManager_th *)self setLastAcceptedText:v22];

LABEL_15:
    goto LABEL_16;
  }
  [(TIKeyboardInputManagerMecabra *)self clearInput];
LABEL_16:
}

- (int64_t)addTouch:(id)a3 shouldHitTest:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![v6 stage] && !objc_msgSend(v6, "continuousPathState"))
  {
    id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v8 = [v7 composingInput];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      uint64_t v10 = [v9 composingInput];

      if (!v10 || ([v10 isCompleting] & 1) == 0 && !objc_msgSend(v10, "isComplete")) {
        goto LABEL_10;
      }
      id v7 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v7 removeAllInputs];
    }
    else
    {

      uint64_t v10 = 0;
    }

LABEL_10:
  }
  v13.receiver = self;
  v13.super_class = (Class)TIKeyboardInputManager_th;
  id v11 = [(TIKeyboardInputManagerMecabra *)&v13 addTouch:v6 shouldHitTest:v4];

  return (int64_t)v11;
}

- (void)candidateRejected:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManagerMecabra *)&v4 candidateRejected:a3];
  [(TIKeyboardInputManager_th *)self setWordBoundary];
}

- (void)registerLearning:(id)a3 fullCandidate:(id)a4 keyboardState:(id)a5 mode:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManagerMecabra *)&v7 registerLearning:a3 fullCandidate:a4 keyboardState:a5 mode:a6];
  [(TIKeyboardInputManager_th *)self setWordBoundary];
}

- (id)validCharacterSetForAutocorrection
{
  return 0;
}

- (USet)validUSetForAutocorrection
{
  if (-[TIKeyboardInputManager_th validUSetForAutocorrection]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManager_th validUSetForAutocorrection]::onceToken, &__block_literal_global);
  }
  return (USet *)-[TIKeyboardInputManager_th validUSetForAutocorrection]::thai_alphabet_set;
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(TIKeyboardInputManager_th *)self lastAutocorrectionList];
  id v9 = [v8 corrections];
  uint64_t v10 = [v9 autocorrection];

  if (v10)
  {
    id v11 = [v10 input];
    uint64_t v12 = [v10 candidate];
    char v13 = [v11 isEqualToString:v12];

    if ([(TIKeyboardInputManager_th *)self shouldAutocommitForInput:v6] && (v13 & 1) == 0)
    {
      long long v14 = [(TIKeyboardInputManagerMecabra *)self mecabraCandidateRefFromCandidate:v10];
      uint64_t v15 = [MEMORY[0x263F7EB00] getWordFromSurfaceOf:v14 atIndex:0];
      long long v16 = [MEMORY[0x263F7EB00] getWordFromAnalysisStringOf:v14 atIndex:0];
      long long v17 = MecabraCandidateGetAnalysisString();
      objc_super v18 = [(TIKeyboardInputManager_th *)self inputStem];
      BOOL v19 = objc_msgSend(v17, "substringFromIndex:", objc_msgSend(v16, "length"));
      [v7 deleteTextBackward:v18];
      [v7 insertText:v15];
      [v7 insertText:v19];
      uint64_t v20 = [(TIKeyboardInputManager_th *)self wordSearch];
      [v20 commitSurface:v15];

      uint64_t v21 = [(TIKeyboardInputManager_th *)self internalIndexOfInputStemSuffix:v19];
      if (v21 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [(TIKeyboardInputManagerMecabra *)self clearInput];
        [(TIKeyboardInputManager_th *)self setInput:v19];
      }
      else
      {
        [(TIKeyboardInputManager_th *)self dropInputPrefix:v21 commitToWordSearch:0];
      }
      [(TIKeyboardInputManager_th *)self setLastAutocorrectionList:0];
    }
  }
  else
  {
    [(TIKeyboardInputManager_th *)self shouldAutocommitForInput:v6];
  }
  v26.receiver = self;
  v26.super_class = (Class)TIKeyboardInputManager_th;
  [(TIKeyboardInputManager_th *)&v26 addInput:v6 withContext:v7];
  uint64_t v22 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (v22)
  {
    if (-858993459 * ((*(void *)(v22 + 16) - *(void *)(v22 + 8)) >> 3))
    {
      uint64_t v23 = *(unsigned int *)(v22 + 96);
      v24 = [v6 string];
      uint64_t v25 = [v24 length];

      if (v25) {
        [(TIKeyboardInputManagerMecabra *)self saveGeometryForInput:v6 atIndex:v23];
      }
    }
  }
  [(TIKeyboardInputManager_th *)self setLastAutocorrectionList:0];
  [(TIKeyboardInputManager_th *)self usesComposingInput];
}

- (id)deleteFromInput:(unint64_t *)a3
{
  if (![(TIKeyboardInputManager_th *)self usesComposingInput]) {
    goto LABEL_11;
  }
  uint64_t v5 = [(TIKeyboardInputManager_th *)self wordSearch];
  [v5 cancel];

  id v6 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  id v7 = [v6 composingInput];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v9 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  uint64_t v10 = v9;
  if (isKindOfClass)
  {
    [v9 removeComposingInput];
LABEL_4:

    goto LABEL_9;
  }
  id v11 = [v9 composingInput];
  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();

  if ((v12 & 1) != 0 && TICanLogMessageAtLevel())
  {
    uint64_t v10 = TIOSLogFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[TIKeyboardInputManager_th deleteFromInput:](v10);
    }
    goto LABEL_4;
  }
LABEL_9:
  char v13 = [(TIKeyboardInputManagerMecabra *)self composingInput];
  long long v14 = [v13 composingInput];

  if (!v14) {
    [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
  }
LABEL_11:
  v17.receiver = self;
  v17.super_class = (Class)TIKeyboardInputManager_th;
  uint64_t v15 = [(TIKeyboardInputManager_th *)&v17 deleteFromInput:a3];

  return v15;
}

- (BOOL)usesComposingInput
{
  char v3 = _os_feature_enabled_impl();
  objc_super v4 = [(TIKeyboardInputManager_th *)self keyboardState];
  uint64_t v5 = [v4 layoutState];
  id v6 = [v5 softwareLayout];
  char v7 = [v6 isEqualToString:@"Thai"];

  return v3 & v7;
}

- (BOOL)canTypeAndPathSimultaneously
{
  return 0;
}

- (BOOL)shouldResample
{
  return 1;
}

- (id)wordSearch
{
  return self->_wordSearch;
}

- (void).cxx_destruct
{
}

- (void)deleteFromInput:(NSObject *)a1 .cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", @"%s Thai input doesn't expect MCSyntethicInput in any case", "-[TIKeyboardInputManager_th deleteFromInput:]");
  *(_DWORD *)buf = 138412290;
  objc_super v4 = v2;
  _os_log_debug_impl(&dword_241E49000, a1, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
}

@end