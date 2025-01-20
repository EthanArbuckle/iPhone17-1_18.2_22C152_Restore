@interface TIKeyboardInputManager_zh_Base
- (BOOL)_shouldCommitInputDirectly:(id)a3;
- (BOOL)acceptInputString:(id)a3;
- (BOOL)shouldSearchCompletionForSubstrings;
- (BOOL)supportsNumberKeySelection;
- (id)inputsToReject;
- (id)keyEventMap;
- (id)keyboardBehaviors;
- (id)phoneticSortingMethod;
- (id)validCharacterSetForSegmentation;
- (int)inputMethodType;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManager_zh_Base

- (id)keyEventMap
{
  return (id)[MEMORY[0x263F7E5B8] sharedInstance];
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E618]);
  return v2;
}

- (BOOL)supportsNumberKeySelection
{
  return 0;
}

- (BOOL)acceptInputString:(id)a3
{
  id v4 = a3;
  if ([v4 length] && objc_msgSend(v4, "_containsBopomofoOnly"))
  {
    v5 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
    v6 = [(TIKeyboardInputManagerChinesePhonetic *)self externalStringToInternal:v5];

    v7 = [v4 substringToIndex:1];
    int v8 = [v7 _containsBopomofoToneOnly];

    if (v8
      && (![v6 length]
       || (objc_msgSend(v6, "substringWithRange:", -[TIKeyboardInputManagerChinesePhonetic inputIndex](self, "inputIndex") - 1, 1), v9 = objc_claimAutoreleasedReturnValue(), char v10 = objc_msgSend(v9, "_containsBopomofoToneOnly"), v9, (v10 & 1) != 0)))
    {
      char v11 = 0;
    }
    else
    {
      v12 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
      v13 = [v12 candidates];

      if ([v13 count] == 1)
      {
        v14 = [v13 objectAtIndex:0];
        v15 = [v14 candidate];
        char v16 = [v6 isEqualToString:v15];

        char v11 = v16 ^ 1;
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)initImplementation
{
  uint64_t v2 = *MEMORY[0x263F7E9F0];
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_zh_Base;
  return [(TIKeyboardInputManagerChinese *)&v4 initImplementationWithMode:@"Zhuyin" andLanguage:v2];
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (int)inputMethodType
{
  return 5;
}

- (id)phoneticSortingMethod
{
  return &unk_26F5E8F88;
}

- (BOOL)_shouldCommitInputDirectly:(id)a3
{
  id v4 = a3;
  if (![(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
  {
    v6 = [(TIKeyboardInputManagerChinesePhonetic *)self conversionHistory];
    if ([v6 convertedLength])
    {
      unint64_t v7 = [v4 length];

      if (v7 > 1) {
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_zh_Base;
  if (![(TIKeyboardInputManagerChinesePhonetic *)&v9 _shouldCommitInputDirectly:v4])
  {
    if (([v4 _containsBopomofoOnly] & 1) == 0
      && ![(TIKeyboardInputManagerChinesePhonetic *)self isSpecialInput:v4])
    {
      BOOL v5 = ![(TIKeyboardInputManagerMecabra *)self stringContainsActiveSupplementalLexiconSearchPrefix:v4];
      goto LABEL_10;
    }
LABEL_9:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  LOBYTE(v5) = 1;
LABEL_10:

  return v5;
}

- (id)inputsToReject
{
  v3 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
  id v4 = [(TIKeyboardInputManagerChinesePhonetic *)self externalStringToInternal:v3];

  unsigned int v5 = [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
  v6 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  unint64_t v7 = [v6 candidates];

  if (v5 == [(TIKeyboardInputManagerChinesePhonetic *)self inputCount]
    && [v7 count] == 1
    && ([v7 objectAtIndex:0],
        int v8 = objc_claimAutoreleasedReturnValue(),
        [v8 candidate],
        objc_super v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v4 isEqualToString:v9],
        v9,
        v8,
        (v10 & 1) != 0))
  {
    BOOL v11 = 0;
    v12 = @"ㄅㄆㄇㄈㄉㄊㄋㄌㄍㄎㄏㄐㄑㄒㄓㄔㄕㄖㄗㄘㄙㄧㄨㄩㄚㄛㄜㄝㄞㄟㄠㄡㄢㄣㄤㄥㄦ";
  }
  else
  {
    BOOL v11 = v5 != 0;
    if (v5) {
      v12 = 0;
    }
    else {
      v12 = @"ˉˊˇˋ˙";
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)TIKeyboardInputManager_zh_Base;
  v13 = [(TIKeyboardInputManagerMecabra *)&v18 inputsToReject];
  v14 = v13;
  if (v11)
  {
    id v15 = v13;
  }
  else
  {
    if (v13)
    {
      char v16 = (void *)[v13 mutableCopy];
      [v16 addCharactersInString:v12];
      goto LABEL_14;
    }
    id v15 = (id)[objc_alloc(MEMORY[0x263F7E520]) initWithCharactersInString:v12];
  }
  char v16 = v15;
LABEL_14:

  return v16;
}

- (id)validCharacterSetForSegmentation
{
  return (id)[MEMORY[0x263F08708] zhuyinCharacterSet];
}

@end