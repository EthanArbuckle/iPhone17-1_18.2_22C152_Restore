@interface TIKeyboardInputManager_zh_hant_Zhuyin
- (BOOL)delayedCandidateList;
- (BOOL)isAssertDefaultKeyPlane;
- (BOOL)isDynamic;
- (BOOL)liveConversionEnabled;
- (BOOL)liveConversionForceDisabled;
- (BOOL)liveConversionForceEnabled;
- (BOOL)shouldInsertFirstToneMark;
- (BOOL)shouldInvokeLiveConverison:(id)a3;
- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3;
- (BOOL)shouldResample;
- (BOOL)supportsCandidateGeneration;
- (BOOL)usesComposingInput;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)didAcceptCandidate:(id)a3;
- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4;
- (id)handleKeyboardInput:(id)a3;
- (id)keyboardConfigurationLayoutTag;
- (id)syllableSeparator;
- (id)validCharacterSetForAutocorrection;
- (unint64_t)initialSelectedIndex;
- (unsigned)mapKeyboardLayoutKey:(unsigned __int16)a3;
- (void)commitComposition;
- (void)setAssertDefaultKeyPlane:(BOOL)a3;
- (void)setDynamic:(BOOL)a3;
- (void)setLiveConversionForceDisabled:(BOOL)a3;
- (void)setLiveConversionForceEnabled:(BOOL)a3;
- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5;
- (void)syncToLayoutState:(id)a3;
@end

@implementation TIKeyboardInputManager_zh_hant_Zhuyin

- (BOOL)usesComposingInput
{
  return MEMORY[0x270ED8070]("TextInputCore", "zhuyin_quickpath");
}

- (BOOL)shouldResample
{
  return 1;
}

- (unint64_t)initialSelectedIndex
{
  v4 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
  v5 = [v4 candidates];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    v2 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
    if ([v2 length])
    {
      id v7 = 0;
LABEL_5:

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  id v7 = [(TIKeyboardInputManagerChinese *)&v9 initialSelectedIndex];
  if (v6) {
    goto LABEL_5;
  }
LABEL_6:

  return (unint64_t)v7;
}

- (id)didAcceptCandidate:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  v4 = [(TIKeyboardInputManagerChinesePhonetic *)&v8 didAcceptCandidate:a3];
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self isDynamic])
  {
    v5 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    uint64_t v6 = [v5 candidates];
    -[TIKeyboardInputManager_zh_hant_Zhuyin setAssertDefaultKeyPlane:](self, "setAssertDefaultKeyPlane:", [v6 count] != 0);
  }
  return v4;
}

- (id)handleAcceptedCandidate:(id)a3 keyboardState:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  v4 = [(TIKeyboardInputManagerChinesePhonetic *)&v8 handleAcceptedCandidate:a3 keyboardState:a4];
  if ([v4 length]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)syncToKeyboardState:(id)a3 from:(id)a4 afterContextChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  [(TIKeyboardInputManager_zh_hant_Zhuyin *)self setAssertDefaultKeyPlane:0];
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  [(TIKeyboardInputManagerChinesePhonetic *)&v10 syncToKeyboardState:v9 from:v8 afterContextChange:v5];
}

- (void)syncToLayoutState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  id v4 = a3;
  [(TIKeyboardInputManagerChinesePhonetic *)&v6 syncToLayoutState:v4];
  BOOL v5 = objc_msgSend(v4, "softwareLayout", v6.receiver, v6.super_class);

  -[TIKeyboardInputManager_zh_hant_Zhuyin setDynamic:](self, "setDynamic:", [v5 isEqualToString:@"ZhuyinDynamic"]);
  [(TIKeyboardInputManager_zh_hant_Zhuyin *)self setAssertDefaultKeyPlane:[(TIKeyboardInputManager_zh_hant_Zhuyin *)self isDynamic]];
}

- (unsigned)mapKeyboardLayoutKey:(unsigned __int16)a3
{
  if (a3 == 32) {
    return 713;
  }
  else {
    return a3;
  }
}

- (id)deleteFromInput:(unint64_t *)a3
{
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self usesComposingInput])
  {
    BOOL v5 = [(TIKeyboardInputManagerChinese *)self wordSearch];
    [v5 cancel];

    objc_super v6 = [(TIKeyboardInputManagerMecabra *)self composingInput];
    id v7 = [v6 asInlineText];
    int v8 = [v7 isEqualToString:*MEMORY[0x263F7EBF8]];

    if (v8)
    {
      [(TIKeyboardInputManagerChinesePhonetic *)self clearInput];
    }
    else
    {
      objc_super v10 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v11 = [v10 composingInput];
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v13 = [(TIKeyboardInputManagerChinese *)self wordSearch];
        [v13 revertInlineCandidate];
      }
      id v14 = objc_alloc(MEMORY[0x263F7EA08]);
      v15 = [(TIKeyboardInputManagerMecabra *)self previouslyDeletedTypeInput];
      v16 = [(TIKeyboardInputManagerMecabra *)self previouslyProcessedDeleteInput];
      v17 = (void *)[v14 initWithDeletedText:0 deleteBySyllable:v15 == 0 shouldDeleteAcceptCandidateInput:v16 == 0];

      v18 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      [v18 composeNew:v17];

      [(TIKeyboardInputManagerMecabra *)self processDeleteInputs];
      [(TIKeyboardInputManagerMecabra *)self setPreviouslyProcessedDeleteInput:v17];
      TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                           + (int)*MEMORY[0x263F7EB98]));
      v19 = [(TIKeyboardInputManagerMecabra *)self composingInput];
      v20 = [v19 composingInput];

      if (!v20) {
        [(TIKeyboardInputManagerMecabra *)self setWordSearchCandidateResultSet:0];
      }
    }
    id v9 = 0;
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
    id v9 = [(TIKeyboardInputManagerChinesePhonetic *)&v22 deleteFromInput:a3];
  }
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self isDynamic]) {
    [(TIKeyboardInputManager_zh_hant_Zhuyin *)self setAssertDefaultKeyPlane:[(TIKeyboardInputManagerChinesePhonetic *)self inputCount] == 0];
  }
  return v9;
}

- (BOOL)shouldInsertFirstToneMark
{
  v3 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
  unsigned int v4 = [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
  if ([v3 length] >= (unint64_t)v4)
  {
    [v3 characterAtIndex:v4 - 1];
    BOOL v5 = uscript_getScript() == 5;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)keyboardConfigurationLayoutTag
{
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self isDynamic])
  {
    id v3 = (id)*MEMORY[0x263F7E9D0];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
    id v3 = [(TIKeyboardInputManagerChinesePhonetic *)&v5 keyboardConfigurationLayoutTag];
  }
  return v3;
}

- (id)syllableSeparator
{
  return (id)*MEMORY[0x263F7E508];
}

- (BOOL)shouldReplaceCharacterOfInputStringBeforeCursorForInput:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex];
  objc_super v6 = [v4 substringToIndex:1];

  char v7 = 0;
  if ([v6 _containsBopomofoToneOnly] && v5)
  {
    uint64_t v8 = (int)*MEMORY[0x263F7EB90];
    if ((unint64_t)[*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v8) length] < 2)
    {
      char v7 = 0;
    }
    else
    {
      id v9 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v8), "substringWithRange:", v5 - 1, 1);
      char v7 = [v9 _containsBopomofoToneOnly];
    }
  }

  return v7;
}

- (id)validCharacterSetForAutocorrection
{
  return (id)[MEMORY[0x263F08708] zhuyinCharacterSet];
}

- (BOOL)delayedCandidateList
{
  return 1;
}

- (BOOL)shouldInvokeLiveConverison:(id)a3
{
  id v4 = a3;
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self liveConversionEnabled])
  {
    unsigned int v5 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
    uint64_t v6 = [v5 length];
    if (v6 == [(TIKeyboardInputManagerChinesePhonetic *)self inputIndex])
    {
      char v7 = [v4 string];
      char v8 = [v7 length] != 0;
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }
  if (([(TIKeyboardInputManager_zh_hant_Zhuyin *)self inHardwareKeyboardMode] & 1) == 0)
  {
    id v9 = [v4 string];
    if ([v9 isEqualToString:*MEMORY[0x263F7E9D8]])
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      v11 = [v4 string];
      int v10 = [v11 isEqualToString:*MEMORY[0x263F7EBF8]] ^ 1;
    }
    v8 &= v10;
  }

  return v8;
}

- (BOOL)liveConversionEnabled
{
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self liveConversionForceEnabled]) {
    return 1;
  }
  if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self liveConversionForceDisabled]) {
    return 0;
  }
  int v4 = [(TIKeyboardInputManager_zh_hant_Zhuyin *)self inHardwareKeyboardMode];
  unsigned int v5 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  uint64_t v6 = v5;
  char v7 = (void *)MEMORY[0x263F7E840];
  if (!v4) {
    char v7 = (void *)MEMORY[0x263F7E880];
  }
  char v8 = [v5 BOOLForPreferenceKey:*v7];

  return v8;
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
  unsigned int v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  uint64_t v6 = [v5 handleKeyboardInput:v4];

  if (!v6)
  {
    char v7 = [v4 string];
    if ([v7 isEqualToString:@"\n"])
    {
LABEL_5:

LABEL_6:
      v28.receiver = self;
      id v9 = &v28;
LABEL_7:
      v9->super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
      uint64_t v6 = -[objc_super handleKeyboardInput:](v9, sel_handleKeyboardInput_, v4, v27);
      goto LABEL_8;
    }
    char v8 = [v4 string];
    if ([v8 isEqualToString:@" "])
    {

      goto LABEL_5;
    }
    v11 = [v4 string];
    char v12 = [v11 isEqualToString:@"　"];

    if (v12) {
      goto LABEL_6;
    }
    v13 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    if (v13)
    {

LABEL_21:
      v27 = self;
      id v9 = (objc_super *)&v27;
      goto LABEL_7;
    }
    if (![(TIKeyboardInputManager_zh_hant_Zhuyin *)self shouldInvokeLiveConverison:v4]) {
      goto LABEL_21;
    }
    if ([(TIKeyboardInputManager_zh_hant_Zhuyin *)self inHardwareKeyboardMode])
    {
      id v14 = [TIKeyboardInputManagerLiveConversion_zh alloc];
      v15 = [(TIKeyboardInputManagerBase *)self inputMode];
      v16 = [(TIKeyboardInputManager_zh_hant_Zhuyin *)self keyboardState];
      uint64_t v17 = [(TIKeyboardInputManagerBase *)v14 initWithInputMode:v15 keyboardState:v16];
    }
    else
    {
      v18 = [TIKeyboardInputManager_zh_Toneless alloc];
      v15 = [(TIKeyboardInputManagerBase *)self inputMode];
      v16 = [(TIKeyboardInputManager_zh_hant_Zhuyin *)self keyboardState];
      uint64_t v17 = [(TIKeyboardInputManager_zh_Toneless *)v18 initWithInputMode:v15 keyboardState:v16 dynamic:[(TIKeyboardInputManager_zh_hant_Zhuyin *)self isDynamic]];
    }
    v19 = (void *)v17;
    [(TIKeyboardInputManagerMecabra *)self composeTextWith:v17];

    if ([(TIKeyboardInputManagerChinesePhonetic *)self inputCount])
    {
      id v20 = objc_alloc_init(MEMORY[0x263F7E648]);
      v21 = [(TIKeyboardInputManagerChinesePhonetic *)self rawInputString];
      [v20 setString:v21];

      id v22 = objc_alloc(MEMORY[0x263F7EAB8]);
      v23 = [(TIKeyboardInputManager_zh_hant_Zhuyin *)self keyboardState];
      v24 = (void *)[v22 initWithKeyboardState:v23];

      v25 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
      [v25 addInput:v20 withContext:v24];
    }
    v26 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    uint64_t v6 = [v26 handleKeyboardInput:v4];

    if (!v6) {
      goto LABEL_21;
    }
  }
LABEL_8:

  return v6;
}

- (void)commitComposition
{
  BOOL v3 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v5 = [(TIKeyboardInputManagerMecabra *)self composingKeyboardInputManager];
    uint64_t v6 = [v5 rawInputString];

    id v7 = objc_alloc_init(MEMORY[0x263F7E648]);
    [v7 setString:v6];
    id v8 = objc_alloc(MEMORY[0x263F7EAB8]);
    id v9 = [(TIKeyboardInputManager_zh_hant_Zhuyin *)self keyboardState];
    int v10 = (void *)[v8 initWithKeyboardState:v9];

    [(TIKeyboardInputManagerChinesePhonetic *)self clearInput];
    TIInputManager::sync_with_input_from_UI(*(TIInputManager **)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                               + (int)*MEMORY[0x263F7EB98]));
    [(TIKeyboardInputManagerChinesePhonetic *)self addInput:v7 withContext:v10];
  }
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardInputManager_zh_hant_Zhuyin;
  [(TIKeyboardInputManagerMecabra *)&v11 commitComposition];
}

- (BOOL)liveConversionForceEnabled
{
  return self->_liveConversionForceEnabled;
}

- (void)setLiveConversionForceEnabled:(BOOL)a3
{
  self->_liveConversionForceEnabled = a3;
}

- (BOOL)liveConversionForceDisabled
{
  return self->_liveConversionForceDisabled;
}

- (void)setLiveConversionForceDisabled:(BOOL)a3
{
  self->_liveConversionForceDisabled = a3;
}

- (BOOL)isDynamic
{
  return self->_dynamic;
}

- (void)setDynamic:(BOOL)a3
{
  self->_dynamic = a3;
}

- (BOOL)isAssertDefaultKeyPlane
{
  return self->_assertDefaultKeyPlane;
}

- (void)setAssertDefaultKeyPlane:(BOOL)a3
{
  self->_assertDefaultKeyPlane = a3;
}

@end