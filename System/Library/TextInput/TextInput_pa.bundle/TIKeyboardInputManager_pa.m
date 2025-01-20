@interface TIKeyboardInputManager_pa
- (BOOL)isPhoneticLayout;
- (Class)scriptComposerClass;
- (id)deleteFromInput:(unint64_t *)a3;
- (void)initImplementation;
- (void)setIsPhoneticLayout:(BOOL)a3;
- (void)syncToLayoutState:(id)a3;
@end

@implementation TIKeyboardInputManager_pa

- (void)initImplementation
{
  result = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
  if (!result) {
    operator new();
  }
  return result;
}

- (void)syncToLayoutState:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TIKeyboardInputManager_pa;
  id v4 = a3;
  [(TIKeyboardInputManagerIndic *)&v6 syncToLayoutState:v4];
  v5 = objc_msgSend(v4, "softwareLayout", v6.receiver, v6.super_class);

  -[TIKeyboardInputManager_pa setIsPhoneticLayout:](self, "setIsPhoneticLayout:", [v5 isEqualToString:@"Punjabi-Phonetic"]);
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 1;
  }
  uint64_t v5 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.super.isa + v5))
  {
    unsigned int v6 = [(TIKeyboardInputManager_pa *)self inputIndex];
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
      v27.receiver = self;
      v27.super_class = (Class)TIKeyboardInputManager_pa;
      v10 = [(TIKeyboardInputManager_pa *)&v27 deleteFromInput:a3];
    }
    else
    {
      uint64_t v11 = v8;
      TIInputManager::input_string(v28, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      v13 = KB::ns_string((KB *)v28, v12);
      v14 = [(TIKeyboardInputManager_pa *)self internalStringToExternal:v13];

      KB::String::~String((KB::String *)v28);
      if ((unint64_t)[v14 length] >= 2
        && (uint64_t v15 = v8 - 2, v8 >= 2)
        && ([v14 characterAtIndex:v15] == 2637
         || [v14 characterAtIndex:v8 - 1] == 2620))
      {
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
        TIInputManager::delete_from_favonius_stroke_history(*(TIInputManager **)((char *)&self->super.super.super.super.isa
                                                                               + v5));
      }
      else if ([(TIKeyboardInputManager_pa *)self isPhoneticLayout])
      {
        if ((unint64_t)[v14 length] >= 3
          && v8 >= 3
          && ([v14 characterAtIndex:v8 - 2] == 2622
           || [v14 characterAtIndex:v8 - 2] == 2566)
          && [v14 characterAtIndex:v8 - 1] == 2562)
        {
          v16 = [(TIKeyboardInputManager_pa *)self externalStringToInternal:@"ਾਂ"];
          KB::utf8_string(v28, v16, v17);
          TIInputManager::delete_suffix_from_input();
          KB::String::~String((KB::String *)v28);
        }
        else
        {
          TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
        }
      }
      else
      {
        v18 = (KB *)[v14 characterAtIndex:v8 - 1];
        KB::lower_character(v18, 0, v19);
        TIInputManager::delete_suffix_from_input();
        KB::String::~String((KB::String *)v28);
      }
      TIInputManager::input_string(v28, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      v21 = KB::ns_string((KB *)v28, v20);
      v22 = [(TIKeyboardInputManager_pa *)self internalStringToExternal:v21];

      KB::String::~String((KB::String *)v28);
      TIInputManager::input_stem(v28, *(TIInputManager **)((char *)&self->super.super.super.super.isa + v5));
      v24 = KB::ns_string((KB *)v28, v23);
      v25 = [(TIKeyboardInputManager_pa *)self internalStringToExternal:v24];

      KB::String::~String((KB::String *)v28);
      v10 = [(TIKeyboardInputManager_pa *)self suffixOfDesiredString:v25 toAppendToInputString:*(Class *)((char *)&self->super.super.super.super.isa + v9) withInputIndex:v11 afterDeletionCount:a3];
      [*(id *)((char *)&self->super.super.super.super.isa + v9) setString:v22];
      if (![v10 length])
      {

        v10 = 0;
      }
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (Class)scriptComposerClass
{
  return (Class)MEMORY[0x270F9A6F8](MEMORY[0x263F7EA78], a2);
}

- (BOOL)isPhoneticLayout
{
  return self->_isPhoneticLayout;
}

- (void)setIsPhoneticLayout:(BOOL)a3
{
  self->_isPhoneticLayout = a3;
}

@end