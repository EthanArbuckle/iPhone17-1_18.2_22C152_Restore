@interface TIKeyboardInputManager_ta
- (Class)scriptComposerClass;
- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)keyboardFeatureSpecialization;
- (void)closeTransliterators;
- (void)configureTransliterators;
- (void)dealloc;
- (void)initTransliteratorsWithID:(id)a3;
- (void)syncToLayoutState:(id)a3;
@end

@implementation TIKeyboardInputManager_ta

- (void)syncToLayoutState:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TIKeyboardInputManager_ta;
  [(TIKeyboardInputManagerIndic *)&v8 syncToLayoutState:v4];
  if (![(TIKeyboardInputManagerIndic *)self alphabeticLayout])
  {
    v5 = [v4 softwareLayout];
    if ([v5 isEqualToString:@"QWERTY-Tamil"])
    {
      self->_isQWERTYLayout = 1;
    }
    else
    {
      v6 = [(TIKeyboardInputManager_ta *)self keyboardState];
      if ([v6 hardwareKeyboardMode])
      {
        v7 = [v4 hardwareLayout];
        self->_isQWERTYLayout = [v7 isEqualToString:@"Tamil99"] ^ 1;
      }
      else
      {
        self->_isQWERTYLayout = 0;
      }
    }
    [(TIKeyboardInputManager_ta *)self configureTransliterators];
  }
}

- (id)keyboardFeatureSpecialization
{
  [(TIKeyboardInputManagerIndic *)self alphabeticLayout];
  v3 = (objc_class *)objc_opt_class();
  tamilFeatureSpecialization = self->_tamilFeatureSpecialization;
  if (!tamilFeatureSpecialization)
  {
    id v5 = [v3 alloc];
    v6 = [(TIKeyboardInputManagerBase *)self inputMode];
    v7 = (TIKeyboardFeatureSpecialization_ta *)[v5 initWithInputMode:v6];
    objc_super v8 = self->_tamilFeatureSpecialization;
    self->_tamilFeatureSpecialization = v7;

    v9 = [(TIKeyboardInputManager_ta *)self config];
    -[TIKeyboardFeatureSpecialization setUseRelaxedOVSPolicy:](self->_tamilFeatureSpecialization, "setUseRelaxedOVSPolicy:", [v9 allowRelaxedOVSPolicy]);

    v10 = [(TIKeyboardInputManager_ta *)self config];
    -[TIKeyboardFeatureSpecialization setSkipCandidateQualityFilter:](self->_tamilFeatureSpecialization, "setSkipCandidateQualityFilter:", [v10 skipCandidateQualityFilter]);

    tamilFeatureSpecialization = self->_tamilFeatureSpecialization;
  }

  return tamilFeatureSpecialization;
}

- (void)dealloc
{
  [(TIKeyboardInputManager_ta *)self closeTransliterators];
  v3.receiver = self;
  v3.super_class = (Class)TIKeyboardInputManager_ta;
  [(TIKeyboardInputManager_ta *)&v3 dealloc];
}

- (void)closeTransliterators
{
  if (self->_internalToExternalTransliterator)
  {
    utrans_close();
    self->_internalToExternalTransliterator = 0;
  }
  if (self->_externalToInternalTransliterator)
  {
    utrans_close();
    self->_externalToInternalTransliterator = 0;
  }
}

- (void)configureTransliterators
{
  [(TIKeyboardInputManager_ta *)self closeTransliterators];
  if (self->_isQWERTYLayout) {
    objc_super v3 = @"AnjalTransliterator";
  }
  else {
    objc_super v3 = @"Tamil99Transliterator";
  }

  [(TIKeyboardInputManager_ta *)self initTransliteratorsWithID:v3];
}

- (void)initTransliteratorsWithID:(id)a3
{
  v15[1] = *(id *)MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = TIBundleForInputMode();
  v6 = [v5 pathForResource:v4 ofType:@"txt"];
  if (v6)
  {
    v15[0] = 0;
    v7 = [NSString stringWithContentsOfFile:v6 encoding:4 error:v15];
    id v8 = v15[0];
    if (v7)
    {
      v9 = malloc_type_malloc(2 * (int)[v7 length], 0x1000040BDFB0063uLL);
      uint64_t v10 = [v4 length];
      if (v9) {
        BOOL v11 = (int)v10 < 1;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        if (!v9) {
          goto LABEL_14;
        }
      }
      else
      {
        v13[1] = v13;
        int v14 = 0;
        MEMORY[0x270FA5388](v10);
        [v4 getCharacters:(char *)v13 - ((v12 + 15) & 0x3FFFFFFF0) range:0];
        [v7 getCharacters:v9];
        self->_internalToExternalTransliterator = (void **)utrans_openU();
        if (v14 <= 0)
        {
          self->_externalToInternalTransliterator = (void **)utrans_openU();
          if (v14 >= 1)
          {
            utrans_close();
            self->_internalToExternalTransliterator = 0;
          }
        }
      }
      free(v9);
    }
LABEL_14:
  }
}

- (id)externalStringToInternal:(id)a3
{
  id v4 = (NSString *)a3;
  if ([(TIKeyboardInputManagerIndic *)self alphabeticLayout])
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ta;
    uint64_t v5 = [(TIKeyboardInputManager_ta *)&v8 externalStringToInternal:v4];
  }
  else
  {
    uint64_t v5 = Transliterate(v4, self->_externalToInternalTransliterator);
  }
  v6 = (void *)v5;

  return v6;
}

- (id)internalStringToExternal:(id)a3
{
  id v4 = (NSString *)a3;
  if ([(TIKeyboardInputManagerIndic *)self alphabeticLayout])
  {
    v8.receiver = self;
    v8.super_class = (Class)TIKeyboardInputManager_ta;
    uint64_t v5 = [(TIKeyboardInputManager_ta *)&v8 internalStringToExternal:v4];
  }
  else
  {
    uint64_t v5 = Transliterate(v4, self->_internalToExternalTransliterator);
  }
  v6 = (void *)v5;

  return v6;
}

- (id)addInput:(id)a3 flags:(unsigned int)a4 point:(CGPoint)a5 firstDelete:(unint64_t *)a6
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v9 = *(void *)&a4;
  id v11 = a3;
  if (![(TIKeyboardInputManagerIndic *)self alphabeticLayout]
    && !self->_isQWERTYLayout
    && [v11 isEqualToString:@"க்ஷ"])
  {
    uint64_t v12 = [NSString _stringWithUnichar:3005];

    id v11 = (id)v12;
  }
  v15.receiver = self;
  v15.super_class = (Class)TIKeyboardInputManager_ta;
  v13 = -[TIKeyboardInputManager_ta addInput:flags:point:firstDelete:](&v15, sel_addInput_flags_point_firstDelete_, v11, v9, a6, x, y);

  return v13;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v32[4] = *MEMORY[0x263EF8340];
  if ([(TIKeyboardInputManagerIndic *)self alphabeticLayout])
  {
    v31.receiver = self;
    v31.super_class = (Class)TIKeyboardInputManager_ta;
    [(TIKeyboardInputManager_ta *)&v31 deleteFromInput:a3];
    id v11 = LABEL_11:;
    goto LABEL_12;
  }
  if (a3) {
    *a3 = 0;
  }
  uint64_t v6 = [(TIKeyboardInputManager_ta *)self inputIndex];
  uint64_t v7 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.super.isa + v7)) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8
    || (uint64_t v9 = v6,
        uint64_t v10 = (int)*MEMORY[0x263F7EB90],
        [*(id *)((char *)&self->super.super.super.super.isa + v10) length] < (unint64_t)v6))
  {
    v30.receiver = self;
    v30.super_class = (Class)TIKeyboardInputManager_ta;
    [(TIKeyboardInputManager_ta *)&v30 deleteFromInput:a3];
    goto LABEL_11;
  }
  uint64_t v27 = v9;
  SEL v28 = a2;
  uint64_t v29 = v9;
  v13 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v10), "substringToIndex:");
  char v14 = 0;
  id v11 = 0;
  objc_super v15 = *(Class *)((char *)&self->super.super.super.super.isa + v7);
  do
  {
    TIInputManager::delete_from_input(v15);
    if (v14) {
      TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.isa
    }
                                                                             + v7));
    TIInputManager::input_string(v32, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v7));
    v17 = KB::ns_string((KB *)v32, v16);
    KB::String::~String((KB::String *)v32);
    v18 = [v17 substringToIndex:(*(unsigned int **)((char *)&self->super.super.super.super.isa + v7))[24]];
    v19 = [(TIKeyboardInputManager_ta *)self internalStringToExternal:v18];

    if (v19
      && (unint64_t v20 = [v13 length], v20 > objc_msgSend(v19, "length"))
      && [v13 hasPrefix:v19])
    {
      uint64_t v21 = [(TIKeyboardInputManager_ta *)self suffixOfDesiredString:v19 toAppendToInputString:*(Class *)((char *)&self->super.super.super.super.isa + v10) withInputIndex:v29 afterDeletionCount:a3];

      v22 = [(TIKeyboardInputManager_ta *)self internalStringToExternal:v17];
      [*(id *)((char *)&self->super.super.super.super.isa + v10) setString:v22];

      char v23 = 1;
      id v11 = (void *)v21;
    }
    else
    {
      char v23 = 0;
    }

    objc_super v15 = *(Class *)((char *)&self->super.super.super.super.isa + v7);
    int v24 = *((_DWORD *)v15 + 24);
    if (v23) {
      break;
    }
    char v14 = 1;
  }
  while (v24);
  if ((v23 & 1) == 0)
  {
    if (v24)
    {
      v26 = [MEMORY[0x263F08690] currentHandler];
      [v26 handleFailureInMethod:v28, self, @"TIKeyboardInputManager_ta.mm", 286, @"Wrong deletion for Tamil input %@ from index %d", *(Class *)((char *)&self->super.super.super.super.isa + v10), v27 object file lineNumber description];
    }
    uint64_t v25 = [(TIKeyboardInputManager_ta *)self suffixOfDesiredString:&stru_26F5E4888 toAppendToInputString:*(Class *)((char *)&self->super.super.super.super.isa + v10) withInputIndex:v29 afterDeletionCount:a3];

    id v11 = (void *)v25;
  }

LABEL_12:

  return v11;
}

- (Class)scriptComposerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

@end