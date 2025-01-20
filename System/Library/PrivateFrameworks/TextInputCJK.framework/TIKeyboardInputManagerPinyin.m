@interface TIKeyboardInputManagerPinyin
- (BOOL)acceptAutocorrectionCommitsInline;
- (BOOL)currentShuangpinTypeUsesSemicolon;
- (BOOL)isShuangpinSemicolon:(id)a3;
- (BOOL)isSpecialInput:(id)a3;
- (BOOL)shouldResample;
- (BOOL)shouldRescaleTouchPoints;
- (BOOL)shouldSearchCompletionForSubstrings;
- (BOOL)supportsPairedPunctutationInput;
- (BOOL)usesAutoDeleteWord;
- (BOOL)usesGeometryModelData;
- (BOOL)usesPunctuationKeysForRowNavigation;
- (id)keyboardBehaviors;
- (id)remapInput:(id)a3 isFacemarkInput:(BOOL *)a4;
- (id)validCharacterSetForAutocorrection;
- (unint64_t)initialSelectedIndex;
- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4;
@end

@implementation TIKeyboardInputManagerPinyin

- (id)remapInput:(id)a3 isFacemarkInput:(BOOL *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)TIKeyboardInputManagerPinyin;
  v5 = [(TIKeyboardInputManagerChinesePhonetic *)&v9 remapInput:a3 isFacemarkInput:a4];
  if ([(__CFString *)v5 isEqualToString:@"；"])
  {
    if ([(TIKeyboardInputManagerPinyin *)self currentShuangpinTypeUsesSemicolon])
    {
      v6 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
      uint64_t v7 = [v6 length];

      if (v7)
      {

        v5 = @";";
      }
    }
  }
  return v5;
}

- (BOOL)isSpecialInput:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManagerPinyin;
  BOOL v5 = [(TIKeyboardInputManagerChinesePhonetic *)&v7 isSpecialInput:v4]
    || [(TIKeyboardInputManagerPinyin *)self isShuangpinSemicolon:v4];

  return v5;
}

- (BOOL)isShuangpinSemicolon:(id)a3
{
  if (![a3 isEqualToString:@";"]
    || ![(TIKeyboardInputManagerPinyin *)self currentShuangpinTypeUsesSemicolon])
  {
    return 0;
  }
  id v4 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
  BOOL v5 = [v4 length] != 0;

  return v5;
}

- (BOOL)currentShuangpinTypeUsesSemicolon
{
  v2 = [(TIKeyboardInputManagerChinese *)self wordSearch];
  int v3 = [v2 shuangpinType];

  return v3 == 7 || v3 == 2;
}

- (void)adjustPhraseBoundaryInForwardDirection:(BOOL)a3 granularity:(int)a4
{
  BOOL v4 = a3;
  if (a4 == 1)
  {
    unint64_t v6 = [(TIKeyboardInputManagerChinesePhonetic *)self phraseBoundary];
    if (v6 <= [(TIKeyboardInputManagerChinesePhonetic *)self inputCount]
      && [(TIKeyboardInputManagerChinesePhonetic *)self supportsSetPhraseBoundary])
    {
      if (v4) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = -1;
      }
      if (v4) {
        unint64_t v8 = [(TIKeyboardInputManagerChinesePhonetic *)self inputCount];
      }
      else {
        unint64_t v8 = 0;
      }
      unsigned int v9 = [(TIKeyboardInputManagerChinesePhonetic *)self inputCount];
      id v20 = [(TIKeyboardInputManagerChinesePhonetic *)self inputString];
      v10 = [(TIKeyboardInputManagerChinesePhonetic *)self convertedInput];
      unint64_t v11 = [v10 length];

      if (v11 <= v8) {
        unint64_t v12 = v8;
      }
      else {
        unint64_t v12 = v11;
      }
      uint64_t v19 = v12;
      unint64_t v13 = v6 - v9;
      uint64_t v14 = v7;
      uint64_t v15 = v6;
      while (1)
      {
        if (v6 == v12)
        {
          uint64_t v15 = v19;
          goto LABEL_26;
        }
        if (!(v13 + v14) || !(v6 + v14))
        {
          uint64_t v15 = v6 + v14;
          goto LABEL_26;
        }
        if (!(v6 - 0x7FFFFFFFFFFFFFFFLL + v14)) {
          break;
        }
        v15 += v7;
        if (v6 + v14 + 1 <= [v20 length])
        {
          v16 = objc_msgSend(v20, "substringWithRange:", v6 + v14, 1);
          v17 = [(TIKeyboardInputManagerMecabra *)self syllableSeparator];
          char v18 = [v16 isEqualToString:v17];

          v14 += v7;
          v12 -= v7;
          if ((v18 & 1) == 0) {
            continue;
          }
        }
        goto LABEL_26;
      }
      uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_26:
      [(TIKeyboardInputManagerChinesePhonetic *)self setPhraseBoundary:v15];
    }
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManagerPinyin;
    -[TIKeyboardInputManagerMecabra adjustPhraseBoundaryInForwardDirection:granularity:](&v21, sel_adjustPhraseBoundaryInForwardDirection_granularity_, a3);
  }
}

- (id)validCharacterSetForAutocorrection
{
  if (-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__onceToken, &__block_literal_global_84);
  }
  v2 = (void *)-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__validCharSet;
  return v2;
}

void __66__TIKeyboardInputManagerPinyin_validCharacterSetForAutocorrection__block_invoke()
{
  objc_msgSend(MEMORY[0x263F089C0], "characterSetWithRange:", 97, 26);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addCharactersInString:@"➋➌➍➎➏➐➑➒"];
  uint64_t v0 = [v2 copy];
  v1 = (void *)-[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__validCharSet;
  -[TIKeyboardInputManagerPinyin validCharacterSetForAutocorrection]::__validCharSet = v0;
}

- (BOOL)acceptAutocorrectionCommitsInline
{
  if (!self->super._isInAmbiguousMode) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerPinyin;
  return [(TIKeyboardInputManagerPinyin *)&v3 acceptAutocorrectionCommitsInline];
}

- (BOOL)usesGeometryModelData
{
  if (self->super._isInAmbiguousMode) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerPinyin;
  return [(TIKeyboardInputManagerChinesePhonetic *)&v3 usesGeometryModelData];
}

- (BOOL)usesAutoDeleteWord
{
  return 1;
}

- (unint64_t)initialSelectedIndex
{
  objc_super v3 = [MEMORY[0x263F7E6C8] sharedPreferencesController];
  int v4 = [v3 BOOLForPreferenceKey:*MEMORY[0x263F7E888]];

  BOOL v5 = [(TIKeyboardInputManagerPinyin *)self keyboardState];
  unint64_t v6 = (void *)[v5 hardwareKeyboardMode];

  if (v6 && v4)
  {
    uint64_t v7 = [(TIKeyboardInputManagerMecabra *)self wordSearchCandidateResultSet];
    unint64_t v8 = [v7 candidates];
    uint64_t v9 = [v8 count];
    if (v9
      && ([(TIKeyboardInputManagerChinesePhonetic *)self inputString],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          [v6 length]))
    {
      id v10 = 0;
    }
    else
    {
      v13.receiver = self;
      v13.super_class = (Class)TIKeyboardInputManagerPinyin;
      id v10 = [(TIKeyboardInputManagerChinese *)&v13 initialSelectedIndex];
      if (!v9)
      {
LABEL_11:

        return (unint64_t)v10;
      }
    }

    goto LABEL_11;
  }
  if (!v4) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardInputManagerPinyin;
  return [(TIKeyboardInputManagerChinese *)&v12 initialSelectedIndex];
}

- (id)keyboardBehaviors
{
  id v2 = objc_alloc_init(MEMORY[0x263F7E5F0]);
  return v2;
}

- (BOOL)shouldRescaleTouchPoints
{
  return 1;
}

- (BOOL)shouldResample
{
  return 1;
}

- (BOOL)shouldSearchCompletionForSubstrings
{
  return 0;
}

- (BOOL)usesPunctuationKeysForRowNavigation
{
  return 1;
}

- (BOOL)supportsPairedPunctutationInput
{
  return 0;
}

@end