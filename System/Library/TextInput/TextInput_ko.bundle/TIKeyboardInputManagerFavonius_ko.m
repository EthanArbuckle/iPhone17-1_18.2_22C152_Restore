@interface TIKeyboardInputManagerFavonius_ko
- (BOOL)acceptsCharacter:(unsigned int)a3;
- (BOOL)canHandleKeyHitTest;
- (BOOL)dictionaryUsesExternalEncoding;
- (BOOL)doesComposeText;
- (BOOL)shouldExtendPriorWord;
- (BOOL)supportsLearning;
- (Hangul2SetAutomata)batchConverter;
- (TIKeyboardInputManagerFavonius_ko)initWithConfig:(id)a3 keyboardState:(id)a4;
- (id)composeJamo:(id)a3;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)externalStringToInternal:(id)a3;
- (void)acceptInput;
- (void)addInput:(id)a3 withContext:(id)a4;
- (void)clearInput;
- (void)dealloc;
- (void)initImplementation;
- (void)setInput:(id)a3;
- (void)setInputIndex:(unsigned int)a3;
- (void)syncToLayoutState:(id)a3;
- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5;
@end

@implementation TIKeyboardInputManagerFavonius_ko

- (TIKeyboardInputManagerFavonius_ko)initWithConfig:(id)a3 keyboardState:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  result = [(TIKeyboardInputManagerFavonius_ko *)&v5 initWithConfig:a3 keyboardState:a4];
  if (result) {
    result->_deleteSyllable = 1;
  }
  return result;
}

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (Hangul2SetAutomata)batchConverter
{
  result = self->_batchConverter;
  if (!result) {
    operator new();
  }
  return result;
}

- (void)syncToLayoutState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  id v4 = a3;
  [(TIKeyboardInputManagerFavonius_ko *)&v6 syncToLayoutState:v4];
  objc_super v5 = objc_msgSend(v4, "softwareLayout", v6.receiver, v6.super_class);

  LODWORD(v4) = [v5 isEqualToString:@"Korean10Key"];
  *(unsigned char *)([(TIKeyboardInputManagerFavonius_ko *)self batchConverter] + 36) = (_BYTE)v4;
  TIInputManager_ko::set_is_10key(*(uint64_t *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]), (int)v4);
}

- (void)dealloc
{
  batchConverter = self->_batchConverter;
  if (batchConverter)
  {
    Hangul2SetAutomata::~Hangul2SetAutomata(batchConverter);
    MEMORY[0x24563CA00]();
    self->_batchConverter = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerFavonius_ko *)&v4 dealloc];
}

- (id)composeJamo:(id)a3
{
  objc_super v4 = (__CFString *)a3;
  objc_super v5 = _composeJamo(v4, [(TIKeyboardInputManagerFavonius_ko *)self batchConverter]);

  return v5;
}

- (BOOL)canHandleKeyHitTest
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  unsigned int v3 = [(TIKeyboardInputManagerFavonius_ko *)&v5 canHandleKeyHitTest];
  if (v3) {
    LOBYTE(v3) = TIInputManager_ko::is_10key(*(TIInputManager_ko **)((char *)&self->super.super.super.isa
  }
                                                                   + (int)*MEMORY[0x263F7EB98])) ^ 1;
  return v3;
}

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return 0;
}

- (id)externalStringToInternal:(id)a3
{
  return DecomposeHangul((NSString *)a3);
}

- (void)clearInput
{
  self->_deleteSyllable = 1;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerFavonius_ko *)&v2 clearInput];
}

- (void)acceptInput
{
  self->_deleteSyllable = 1;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerFavonius_ko *)&v2 acceptInput];
}

- (void)setInput:(id)a3
{
  id v4 = a3;
  [(TIKeyboardInputManagerFavonius_ko *)self clearInput];
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerFavonius_ko *)&v5 setInput:v4];
}

- (void)setInputIndex:(unsigned int)a3
{
  self->_deleteSyllable = 1;
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerFavonius_ko *)&v3 setInputIndex:*(void *)&a3];
}

- (BOOL)shouldExtendPriorWord
{
  return 0;
}

- (BOOL)supportsLearning
{
  return 1;
}

- (BOOL)acceptsCharacter:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (-[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::onceToken != -1) {
    dispatch_once(&-[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::onceToken, &__block_literal_global);
  }
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  return [(TIKeyboardInputManagerFavonius_ko *)&v6 acceptsCharacter:v3]
      || MEMORY[0x24563CC90](-[TIKeyboardInputManagerFavonius_ko acceptsCharacter:]::hangul_set, v3) != 0;
}

- (void)textAccepted:(id)a3 fromPredictiveInputBar:(BOOL)a4 withInput:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerBase *)&v6 textAccepted:a3 fromPredictiveInputBar:a4 withInput:a5];
  [(TIKeyboardInputManagerFavonius_ko *)self clearInput];
}

- (void)addInput:(id)a3 withContext:(id)a4
{
  v16[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 string];
  self->_deleteSyllable = 0;
  [v6 setAutoshifted:0];
  [v6 setUppercase:0];
  int v9 = [v6 isMultitap];
  if (![v8 isEqualToString:@"ㆍ"])
  {
    if (!v9) {
      goto LABEL_10;
    }
    uint64_t v14 = 1;
    goto LABEL_9;
  }
  TIInputManager::input_string(v16, *(TIInputManager **)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]));
  v11 = KB::ns_string((KB *)v16, v10);
  KB::String::~String((KB::String *)v16);
  int v12 = [v11 hasSuffix:@"ㆍㆍ"];

  char v13 = v12 | v9;
  if (v12) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = 1;
  }
  if (v13)
  {
    do
    {
LABEL_9:
      [(TIKeyboardInputManagerFavonius_ko *)self deleteFromInputWithContext:v7];
      --v14;
    }
    while (v14);
  }
LABEL_10:
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
  [(TIKeyboardInputManagerFavonius_ko *)&v15 addInput:v6 withContext:v7];
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  if (!a3)
  {
    if (!self->_deleteSyllable) {
      goto LABEL_6;
    }
LABEL_5:
    v15.receiver = self;
    v15.super_class = (Class)TIKeyboardInputManagerFavonius_ko;
    objc_super v5 = [(TIKeyboardInputManagerFavonius_ko *)&v15 deleteFromInput:a3];
    goto LABEL_12;
  }
  *a3 = 0;
  if (self->_deleteSyllable) {
    goto LABEL_5;
  }
  *a3 = 1;
LABEL_6:
  uint64_t v6 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.isa + v6)
    && (unsigned int v7 = [(TIKeyboardInputManagerFavonius_ko *)self inputIndex],
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.isa + v6)),
        uint64_t v8 = (int)*MEMORY[0x263F7EB90],
        *(Class *)((char *)&self->super.super.super.isa + v8)))
  {
    TIInputManager::input_string(v16, *(TIInputManager **)((char *)&self->super.super.super.isa + v6));
    v10 = KB::ns_string((KB *)v16, v9);
    KB::String::~String((KB::String *)v16);
    v11 = [(TIKeyboardInputManagerFavonius_ko *)self internalStringToExternal:v10];
    int v12 = objc_msgSend(v10, "substringToIndex:", objc_msgSend(v10, "_indexFromStartingIndex:byIncrementingComposedCharacterSequenceCount:", 0, (*(unsigned int **)((char *)&self->super.super.super.isa + v6))[24]));
    char v13 = [(TIKeyboardInputManagerFavonius_ko *)self internalStringToExternal:v12];

    objc_super v5 = [(TIKeyboardInputManagerFavonius_ko *)self suffixOfDesiredString:v13 toAppendToInputString:*(Class *)((char *)&self->super.super.super.isa + v8) withInputIndex:v7 afterDeletionCount:a3];
    [*(id *)((char *)&self->super.super.super.isa + v8) setString:v11];
    if (![v5 length])
    {

      objc_super v5 = 0;
    }
  }
  else
  {
    objc_super v5 = 0;
  }
LABEL_12:

  return v5;
}

@end