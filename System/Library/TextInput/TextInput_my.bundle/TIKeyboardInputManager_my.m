@interface TIKeyboardInputManager_my
- (BOOL)deletesComposedTextByComposedCharacterSequence;
- (BOOL)doesComposeText;
- (id)deleteFromInput:(unint64_t *)a3;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
@end

@implementation TIKeyboardInputManager_my

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)deletesComposedTextByComposedCharacterSequence
{
  return 0;
}

- (id)internalStringToExternal:(id)a3
{
  id v3 = a3;
  v4 = (void *)[v3 mutableCopy];
  if ((unint64_t)[v4 length] >= 2
    && objc_msgSend(v4, "characterAtIndex:", objc_msgSend(v4, "length") - 1) == 4145)
  {
    objc_msgSend(v4, "insertString:atIndex:", @"​", objc_msgSend(v4, "length") - 1);
  }
  if (InternalToExternalRegex(void)::__onceToken != -1) {
    dispatch_once(&InternalToExternalRegex(void)::__onceToken, &__block_literal_global_53);
  }
  id v5 = (id)InternalToExternalRegex(void)::__regex;
  uint64_t v6 = [v3 length];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __54__TIKeyboardInputManager_my_internalStringToExternal___block_invoke;
  v15 = &unk_2650FD4B0;
  id v16 = v3;
  id v7 = v4;
  id v17 = v7;
  id v8 = v3;
  objc_msgSend(v5, "enumerateMatchesInString:options:range:usingBlock:", v8, 0, 0, v6, &v12);
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"ဦ", @"ဦ", 2, 0, objc_msgSend(v7, "length", v12, v13, v14, v15));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"ဥ်", @"ဉ်", 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"သြ", @"ဩ", 2, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "replaceOccurrencesOfString:withString:options:range:", @"ဩော်", @"ဪ", 2, 0, objc_msgSend(v7, "length"));
  v9 = v17;
  id v10 = v7;

  return v10;
}

- (id)externalStringToInternal:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    id v5 = (void *)[v3 mutableCopy];
    if (ExternalToInternalRegex(void)::__onceToken != -1) {
      dispatch_once(&ExternalToInternalRegex(void)::__onceToken, &__block_literal_global_59);
    }
    id v6 = (id)ExternalToInternalRegex(void)::__regex;
    uint64_t v7 = [v4 length];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__TIKeyboardInputManager_my_externalStringToInternal___block_invoke;
    v12[3] = &unk_2650FD4B0;
    id v13 = v4;
    id v8 = v5;
    id v14 = v8;
    objc_msgSend(v6, "enumerateMatchesInString:options:range:usingBlock:", v13, 0, 0, v7, v12);
    v9 = v14;
    id v10 = v8;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)deleteFromInput:(unint64_t *)a3
{
  v22[4] = *MEMORY[0x263EF8340];
  if (a3) {
    *a3 = 1;
  }
  uint64_t v5 = (int)*MEMORY[0x263F7EB98];
  if (*(Class *)((char *)&self->super.super.super.isa + v5))
  {
    unsigned int v6 = [(TIKeyboardInputManager_my *)self inputIndex];
    if (v6 >= 3
      && (unsigned int v7 = v6,
          uint64_t v8 = (int)*MEMORY[0x263F7EB90],
          [*(id *)((char *)&self->super.super.super.isa + v8) length] >= (unint64_t)v6))
    {
      uint64_t v10 = v7;
      TIInputManager::input_string(v22, *(TIInputManager **)((char *)&self->super.super.super.isa + v5));
      uint64_t v12 = KB::ns_string((KB *)v22, v11);
      KB::String::~String((KB::String *)v22);
      if ([v12 hasSuffix:@"င်္"])
      {
        KB::utf8_string(v22, (KB *)@"င်္", v13);
        TIInputManager::delete_suffix_from_input();
        KB::String::~String((KB::String *)v22);
      }
      else
      {
        TIInputManager::delete_from_input(*(TIInputManager **)((char *)&self->super.super.super.isa + v5));
      }
      TIInputManager::input_string(v22, *(TIInputManager **)((char *)&self->super.super.super.isa + v5));
      v15 = KB::ns_string((KB *)v22, v14);
      id v16 = [(TIKeyboardInputManager_my *)self internalStringToExternal:v15];

      KB::String::~String((KB::String *)v22);
      TIInputManager::input_stem(v22, *(TIInputManager **)((char *)&self->super.super.super.isa + v5));
      v18 = KB::ns_string((KB *)v22, v17);
      v19 = [(TIKeyboardInputManager_my *)self internalStringToExternal:v18];

      KB::String::~String((KB::String *)v22);
      v9 = [(TIKeyboardInputManager_my *)self suffixOfDesiredString:v19 toAppendToInputString:*(Class *)((char *)&self->super.super.super.isa + v8) withInputIndex:v10 afterDeletionCount:a3];
      [*(id *)((char *)&self->super.super.super.isa + v8) setString:v16];
      if (![v9 length])
      {

        v9 = 0;
      }
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)TIKeyboardInputManager_my;
      v9 = [(TIKeyboardInputManager_my *)&v21 deleteFromInput:a3];
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end