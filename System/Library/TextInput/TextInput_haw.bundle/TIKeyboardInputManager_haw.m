@interface TIKeyboardInputManager_haw
- (BOOL)doesComposeText;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)sentencePrefixingCharacters;
- (void)initImplementation;
@end

@implementation TIKeyboardInputManager_haw

- (void)initImplementation
{
  if (!*(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98])) {
    operator new();
  }
  return *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x263F7EB98]);
}

- (BOOL)doesComposeText
{
  return 1;
}

- (id)externalStringToInternal:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (KB *)a3;
  __p = operator new(4uLL);
  _DWORD *__p = 175;
  KB::utf8_string(v10, v4, v5);

  [(TIKeyboardInputManager_haw *)self precomposedCharacterSet];
  KB::decompose_diacritics();
  v7 = KB::ns_string((KB *)v11, v6);
  KB::String::~String((KB::String *)v11);
  KB::String::~String((KB::String *)v10);
  if (__p) {
    operator delete(__p);
  }
  return v7;
}

- (id)internalStringToExternal:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  KB::utf8_string(v7, (KB *)a3, (NSString *)a2);
  [(TIKeyboardInputManager_haw *)self precomposedCharacterSet];
  KB::compose_diacritics();
  v5 = KB::ns_string((KB *)v8, v4);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);
  return v5;
}

- (id)sentencePrefixingCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardInputManager_haw;
  v2 = [(TIKeyboardInputManager_haw *)&v5 sentencePrefixingCharacters];
  v3 = [v2 stringByAppendingString:@"ʻ"];

  return v3;
}

@end