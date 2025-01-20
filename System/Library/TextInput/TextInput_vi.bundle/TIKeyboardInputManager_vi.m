@interface TIKeyboardInputManager_vi
+ (void)cleanupUnikey;
+ (void)setupUnikey;
- (BOOL)canHandleCharacter:(unsigned __int16)a3;
- (BOOL)doesComposeText;
- (BOOL)emphasizesAlternativeInput;
- (BOOL)inputTypeSupportsDecomposition;
- (BOOL)shouldFreezeInputMethodChoiceForPopupVariants;
- (BOOL)usesRetrocorrection;
- (TIKeyboardInputManager_vi)initWithConfig:(id)a3 keyboardState:(id)a4;
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (id)decomposeTelex:(id)a3;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)externalStringToInternal:(id)a3;
- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4;
- (id)initImplementation;
- (id)internalStringToExternal:(id)a3;
- (id)internalStringToExternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4;
- (int)vietnameseType;
- (uint64_t)initImplementation;
- (unint64_t)deleteLengthForString:(id)a3;
- (unsigned)inputIndex;
- (unsigned)lexiconID;
- (void)acceptInput;
- (void)createTransliterator;
- (void)dealloc;
- (void)initImplementation;
- (void)setInput:(id)a3 withIndex:(unsigned int)a4;
- (void)setInputIndex:(unsigned int)a3;
- (void)updateUnikeyWithVietnameseType:(int)a3;
@end

@implementation TIKeyboardInputManager_vi

- (TIKeyboardInputManager_vi)initWithConfig:(id)a3 keyboardState:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  +[TIKeyboardInputManager_vi setupUnikey];
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManager_vi;
  v8 = [(TIKeyboardInputManager_mul *)&v10 initWithConfig:v7 keyboardState:v6];

  if (v8) {
    (*(unsigned char **)((char *)&v8->super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]))[697] = 0;
  }
  else {
    +[TIKeyboardInputManager_vi cleanupUnikey];
  }
  return v8;
}

- (void)initImplementation
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v7 = KB::ns_string(a2, v6);
  v9 = [WeakRetained internalStringToExternal:v7];

  KB::utf8_string(a3, v9, v8);
}

- (void)dealloc
{
  [(id)objc_opt_class() cleanupUnikey];
  if (self->m_transliterator)
  {
    utrans_close();
    self->m_transliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_vi;
  [(TIKeyboardInputManager_vi *)&v3 dealloc];
}

- (unsigned)lexiconID
{
  m_lexiconID = self->m_lexiconID;
  if (!m_lexiconID)
  {
    v4 = NSNumber;
    v5 = [(TIKeyboardInputManagerBase *)self inputMode];
    id v6 = [v5 locale];
    id v7 = [v6 localeIdentifier];
    [v7 UTF8String];
    v8 = [v4 numberWithUnsignedInt:TILexiconIDForLocaleIdentifier()];
    v9 = self->m_lexiconID;
    self->m_lexiconID = v8;

    m_lexiconID = self->m_lexiconID;
  }
  return [(NSNumber *)m_lexiconID unsignedIntValue];
}

- (BOOL)usesRetrocorrection
{
  return ![(TIKeyboardInputManager_mul *)self isUsingMultilingual];
}

- (BOOL)emphasizesAlternativeInput
{
  return 0;
}

+ (void)setupUnikey
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!__UnikeyRefCount++)
  {
    UnikeySetup();
    UnikeySetInputMethod();
    UnikeyGetOptions();
    UnikeySetOptions();
  }
  objc_sync_exit(v2);
}

+ (void)cleanupUnikey
{
  id obj = a1;
  objc_sync_enter(obj);
  if (__UnikeyRefCount)
  {
    if (!--__UnikeyRefCount) {
      UnikeyCleanup();
    }
  }
  objc_sync_exit(obj);
}

- (BOOL)doesComposeText
{
  return 1;
}

- (void)createTransliterator
{
  v29[1] = *(id *)MEMORY[0x263EF8340];
  id v2 = TIBundleForInputMode();
  objc_super v3 = [v2 pathForResource:@"vi_TelexTransliterator" ofType:@"txt"];
  if (v3)
  {
    v29[0] = 0;
    v4 = [NSString stringWithContentsOfFile:v3 encoding:4 error:v29];
    id v5 = v29[0];
    id v6 = v5;
    if (!v4)
    {
      if (v5) {
        NSLog(&cfstr_ErrorOpeningTr.isa, v5);
      }
      objc_super v10 = 0;
      goto LABEL_29;
    }
    id v7 = (unsigned __int16 *)malloc_type_malloc(2 * (int)[v4 length], 0x1000040BDFB0063uLL);
    uint64_t v8 = [@"vi_TelexTransliterator" length];
    if (v7) {
      BOOL v9 = (int)v8 < 1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      objc_super v10 = 0;
      if (!v7) {
        goto LABEL_29;
      }
    }
    else
    {
      int v28 = 0;
      MEMORY[0x270FA5388](v8);
      [@"vi_TelexTransliterator" getCharacters:(char *)&v21 - ((v11 + 15) & 0x3FFFFFFF0) range:0];
      [v4 getCharacters:v7];
      objc_super v10 = (void **)utrans_openU();
      UErrorCode v12 = v28;
      if (v28 >= 1)
      {
        uint64_t v13 = 32;
        if (v26 >= 1 && v25 <= 0) {
          uint64_t v13 = v7[v26];
        }
        uint64_t v14 = 8;
        uint64_t v23 = v26;
        v24 = &v21;
        uint64_t v22 = v13;
        do
        {
          if (!*(_WORD *)((char *)&v25 + v14)) {
            break;
          }
          v14 += 2;
        }
        while (v14 != 40);
        v15 = objc_msgSend(NSString, "stringWithCharacters:length:");
        v16 = &v28;
        uint64_t v17 = 40;
        while (*(_WORD *)((char *)&v25 + v17))
        {
          v17 += 2;
          if (v17 == 72) {
            goto LABEL_26;
          }
        }
        v16 = (int *)((char *)&v25 + v17);
LABEL_26:
        v18 = [NSString stringWithCharacters:v27 length:((unint64_t)((char *)v16 - v27) >> 1)];
        v19 = u_errorName(v12);
        NSLog(&cfstr_ParseErrorSFor.isa, v19, @"vi_TelexTransliterator", v25, v23, v15, v22, v18);
      }
      if (!v7) {
        goto LABEL_29;
      }
    }
    free(v7);
LABEL_29:

    goto LABEL_30;
  }
  NSLog(&cfstr_CanTFindTransl.isa);
  objc_super v10 = 0;
LABEL_30:

  return v10;
}

- (id)decomposeTelex:(id)a3
{
  id v4 = a3;
  if (!self->m_transliterator) {
    self->m_transliterator = [(TIKeyboardInputManager_vi *)self createTransliterator];
  }
  int v9 = [v4 length];
  id v5 = malloc_type_malloc(6 * v9, 0x1000040BDFB0063uLL);
  if (v5)
  {
    id v6 = v5;
    objc_msgSend(v4, "getCharacters:range:", v5, 0, objc_msgSend(v4, "length"));
    utrans_transUChars();
    id v7 = [NSString stringWithCharacters:v6 length:v9];
    free(v6);
  }
  else
  {
    NSLog(&cfstr_CouldnTCreateU.isa);
    id v7 = 0;
  }

  return v7;
}

- (BOOL)shouldFreezeInputMethodChoiceForPopupVariants
{
  return 0;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = *(void *)&a4;
  v22[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  BOOL v12 = [(TIKeyboardInputManager_vi *)self compositionDisabled];
  uint64_t v13 = *(int **)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  unint64_t v14 = v13[24];
  TIInputManager::input_string(v22, (TIInputManager *)v13);
  v16 = KB::ns_string((KB *)v22, v15);
  KB::String::~String((KB::String *)v22);
  if (v12)
  {
    [(TIKeyboardInputManager_vi *)self setCompositionDisabled:1];
    if (![(TIKeyboardInputManager_vi *)self compositionDisabled])
    {
      BOOL v17 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]) != 0;
      goto LABEL_6;
    }
  }
  else
  {
    -[TIKeyboardInputManager_vi setCompositionDisabled:](self, "setCompositionDisabled:", [v16 length] > v14);
  }
  BOOL v17 = 0;
LABEL_6:
  self->m_useInternalIndedouble x = v17;
  if ((v9 & 0x80) != 0)
  {
    v18 = (KB *)v11;
    KB::utf8_string(v22, v18, v19);
    TIInputManager::add_input();
    KB::String::~String((KB::String *)v22);
    [*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7EB90]) setString:v18];
  }
  else
  {
    v21.receiver = self;
    v21.super_class = (Class)TIKeyboardInputManager_vi;
    -[TIKeyboardInputManager_vi addInput:flags:point:firstDelete:](&v21, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);
    v18 = (KB *)objc_claimAutoreleasedReturnValue();
  }
  self->m_useInternalIndedouble x = 0;
  if ([v11 isEqualToString:@" "]) {
    [(TIKeyboardInputManager_vi *)self setCompositionDisabled:0];
  }

  return v18;
}

- (BOOL)canHandleCharacter:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = [MEMORY[0x263F08708] letterCharacterSet];
  char v6 = [v5 characterIsMember:v3];

  if (v6) {
    return 1;
  }
  int v8 = [(TIKeyboardInputManager_vi *)self vietnameseType];
  switch(v8)
  {
    case 3:
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08708], "TI_vietnameseVIQRSpecialsCharacterSet");
      goto LABEL_9;
    case 2:
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08708], "TI_vietnameseVNISpecialsCharacterSet");
      goto LABEL_9;
    case 1:
      uint64_t v9 = objc_msgSend(MEMORY[0x263F08708], "TI_vietnameseTelexSpecialsCharacterSet");
LABEL_9:
      objc_super v10 = v9;
      char v11 = [v9 characterIsMember:v3];

      return v11;
  }
  return 0;
}

- (id)externalStringToInternal:(id)a3
{
  return [(TIKeyboardInputManager_vi *)self externalStringToInternal:a3 ignoreCompositionDisabled:0];
}

- (id)externalStringToInternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if ([(TIKeyboardInputManager_vi *)self inputTypeSupportsDecomposition])
  {
    if (a4 || (id v7 = v6, ![(TIKeyboardInputManager_vi *)self compositionDisabled]))
    {
      id v7 = [(TIKeyboardInputManager_vi *)self decomposeTelex:v6];
    }
  }

  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  return [(TIKeyboardInputManager_vi *)self internalStringToExternal:a3 ignoreCompositionDisabled:0];
}

- (id)internalStringToExternal:(id)a3 ignoreCompositionDisabled:(BOOL)a4
{
  id v6 = a3;
  if (a4 || ![(TIKeyboardInputManager_vi *)self compositionDisabled])
  {
    uint64_t v8 = [v6 length];
    id v7 = [MEMORY[0x263F089D8] stringWithCapacity:v8];
    UnikeyResetBuf();
    [(TIKeyboardInputManager_vi *)self updateUnikeyWithVietnameseType:[(TIKeyboardInputManager_vi *)self vietnameseType]];
    if (v8)
    {
      uint64_t v9 = 0;
      objc_super v10 = (int *)MEMORY[0x263F7EBB8];
      char v11 = (int *)MEMORY[0x263F7EBA8];
      uint64_t v12 = MEMORY[0x263F7EBB0];
      do
      {
        UniChar chars = 0;
        uint64_t v13 = [v6 characterAtIndex:v9];
        UniChar chars = v13;
        if ([(TIKeyboardInputManager_vi *)self canHandleCharacter:v13])
        {
          UnikeySetCapsState();
          UnikeyFilter();
          uint64_t v14 = *v10;
          if (v14 | *v11)
          {
            if (v14) {
              BOOL v15 = *v11 < 1;
            }
            else {
              BOOL v15 = 1;
            }
            if (v15)
            {
              if (v14)
              {
                *(unsigned char *)(v12 + v14) = 0;
                v16 = [NSString stringWithUTF8String:v12];
                [(__CFString *)v7 appendString:v16];
              }
            }
            else
            {
              *(unsigned char *)(v12 + v14) = 0;
              if ([(__CFString *)v7 length] >= (unint64_t)*v11) {
                uint64_t v17 = [(__CFString *)v7 length] - *v11;
              }
              else {
                uint64_t v17 = 0;
              }
              uint64_t v18 = [(__CFString *)v7 length] - v17;
              v19 = [NSString stringWithUTF8String:v12];
              -[__CFString replaceCharactersInRange:withString:](v7, "replaceCharactersInRange:withString:", v17, v18, v19);

              objc_super v10 = (int *)MEMORY[0x263F7EBB8];
            }
          }
          else
          {
            CFStringAppendCharacters(v7, &chars, 1);
          }
        }
        else
        {
          CFStringAppendCharacters(v7, &chars, 1);
          UnikeyResetBuf();
        }
        ++v9;
      }
      while (v8 != v9);
    }
  }
  else
  {
    id v7 = (__CFString *)v6;
  }

  return v7;
}

- (void)acceptInput
{
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManager_vi;
  [(TIKeyboardInputManager_vi *)&v2 acceptInput];
}

- (void)setInput:(id)a3 withIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (![(TIKeyboardInputManager_vi *)self compositionDisabled]) {
    -[TIKeyboardInputManager_vi setCompositionDisabled:](self, "setCompositionDisabled:", [v6 length] > (unint64_t)v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)TIKeyboardInputManager_vi;
  [(TIKeyboardInputManager_vi *)&v7 setInput:v6 withIndex:v4];
}

- (void)setInputIndex:(unsigned int)a3
{
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_vi;
  [(TIKeyboardInputManager_vi *)&v3 setInputIndex:*(void *)&a3];
}

- (unsigned)inputIndex
{
  if (self->m_useInternalIndex)
  {
    uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
    if (v2) {
      return *(_DWORD *)(v2 + 96);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardInputManager_vi;
  return [(TIKeyboardInputManager_vi *)&v4 inputIndex];
}

- (unint64_t)deleteLengthForString:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [v4 length];
  unint64_t v6 = v5 != 0;
  uint64_t v7 = (int)*MEMORY[0x263F7EB98];
  TIInputManager::input_string(v14, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v7));
  uint64_t v9 = KB::ns_string((KB *)v14, v8);
  KB::String::~String((KB::String *)v14);
  unint64_t v10 = (*(unsigned int **)((char *)&self->super.super.super.super.isa + v7))[24];
  if (v10 >= v5 && [v9 length] >= v10)
  {
    char v11 = objc_msgSend(v9, "substringWithRange:", v10 - v5, v5);
    int v12 = [v4 isEqualToString:v11];

    if (v12) {
      unint64_t v6 = v5;
    }
  }

  return v6;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v30[4] = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 1;
  }
  uint64_t v5 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.super.isa + v5))
  {
    unsigned int v6 = [(TIKeyboardInputManager_vi *)self inputIndex];
    if (*(Class *)((char *)&self->super.super.super.super.isa + v5)) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7
      || (unsigned int v8 = v6,
          uint64_t v9 = (int)*MEMORY[0x263F7EB90],
          [*(id *)((char *)&self->super.super.super.super.isa + v9) length] < (unint64_t)v6))
    {
      v29.receiver = self;
      v29.super_class = (Class)TIKeyboardInputManager_vi;
      unint64_t v10 = [(TIKeyboardInputManager_vi *)&v29 deleteFromInput:a3];
    }
    else
    {
      uint64_t v28 = v8;
      TIInputManager::input_string(v30, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      int v12 = KB::ns_string((KB *)v30, v11);
      uint64_t v13 = [(TIKeyboardInputManager_vi *)self internalStringToExternal:v12];

      KB::String::~String((KB::String *)v30);
      uint64_t v14 = [v13 rangeOfComposedCharacterSequenceAtIndex:v8 - 1];
      v16 = objc_msgSend(v13, "substringWithRange:", v14, v15);
      uint64_t v17 = [(TIKeyboardInputManager_vi *)self externalStringToInternal:v16];
      unint64_t v18 = [(TIKeyboardInputManager_vi *)self deleteLengthForString:v17];
      if (v18)
      {
        unint64_t v19 = v18;
        unsigned int v20 = 1;
        do
        {
          TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
          if (v20 != 1) {
            TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.isa
          }
                                                                                   + v5));
        }
        while (v19 > v20++);
      }
      TIInputManager::input_string(v30, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      uint64_t v23 = KB::ns_string((KB *)v30, v22);
      KB::String::~String((KB::String *)v30);
      v24 = [(TIKeyboardInputManager_vi *)self internalStringToExternal:v23];
      int v25 = [v23 substringToIndex:(*(unsigned int **)((char *)&self->super.super.super.super.isa + v5))[24]];
      int v26 = [(TIKeyboardInputManager_vi *)self internalStringToExternal:v25];

      unint64_t v10 = [(TIKeyboardInputManager_vi *)self suffixOfDesiredString:v26 toAppendToInputString:*(Class *)((char *)&self->super.super.super.super.isa + v9) withInputIndex:v28 afterDeletionCount:a3];
      [*(id *)((char *)&self->super.super.super.super.isa + v9) setString:v24];
      if (![v10 length])
      {

        unint64_t v10 = 0;
      }
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  return v10;
}

- (void)updateUnikeyWithVietnameseType:(int)a3
{
  if (a3 <= 3) {
    UnikeySetInputMethod();
  }
}

- (int)vietnameseType
{
  return 0;
}

- (BOOL)inputTypeSupportsDecomposition
{
  return 1;
}

- (void).cxx_destruct
{
}

- (uint64_t)initImplementation
{
  return a1;
}

- (id)initImplementation
{
  v1 = (id *)(a1 + 8);
  uint64_t v2 = (id *)operator new(0x10uLL);
  *uint64_t v2 = &unk_26F5E58C8;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end