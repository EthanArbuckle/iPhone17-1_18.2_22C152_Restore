@interface TIKeyboardFeatureSpecialization_el
- (BOOL)shouldAddModifierSymbolsToWordCharacters;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (id)nonstopPunctuationCharacters;
- (id)sentenceDelimitingCharacters;
- (id)sentencePrefixingCharacters;
- (id)sentenceTrailingCharacters;
- (void)createInputManager:(id)a3;
@end

@implementation TIKeyboardFeatureSpecialization_el

- (void)createInputManager:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  v4 = [(TIKeyboardQuickTypeSpecialization *)&v11 createInputManager:a3];
  v5 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  CFLocaleRef v6 = [v5 locale];

  v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_weak_owners_ = 0;
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DBC28;
  v9 = KB::InputManagerSpecialization_el::InputManagerSpecialization_el((KB::InputManagerSpecialization_el *)&v7[1], v6);
  v10 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  TIInputManager::set_input_manager_specialization(v4, (uint64_t *)&v9);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v10);
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v7);

  return v4;
}

- (id)sentencePrefixingCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 sentencePrefixingCharacters];
  v3 = [v2 stringByAppendingString:@"«"];

  return v3;
}

- (id)sentenceDelimitingCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 sentenceDelimitingCharacters];
  v3 = [v2 stringByAppendingString:@";"];

  return v3;
}

- (id)sentenceTrailingCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 sentenceTrailingCharacters];
  v3 = [v2 stringByAppendingString:@"»"];

  return v3;
}

- (id)externalStringToInternal:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v4 = (KB *)a3;
  objc_super v5 = operator new(0xCuLL);
  *(void *)objc_super v5 = 0xB400000385;
  v5[2] = 168;
  __p = v5;
  KB::utf8_string(v11, v4, v6);

  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::decompose_diacritics();
  v8 = KB::ns_string((KB *)v12, v7);
  KB::String::~String((KB::String *)v12);
  KB::String::~String((KB::String *)v11);
  if (__p) {
    operator delete(__p);
  }

  return v8;
}

- (id)internalStringToExternal:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  KB::utf8_string(v26, (KB *)a3, (NSString *)a2);
  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::compose_diacritics();
  KB::String::~String((KB::String *)v26);
  KB::String::String(v4);
  objc_super v5 = v28;
  if (!v28) {
    objc_super v5 = v29;
  }
  v22 = v5;
  int v23 = 0;
  int v24 = v27;
  int v25 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v22);
  CFLocaleRef v6 = v28;
  if (!v28) {
    CFLocaleRef v6 = v29;
  }
  v18 = v6;
  int v19 = v27;
  int v20 = v27;
  int v21 = 0;
  KB::String::iterator::initialize((KB::String::iterator *)&v18);
  while (v23 != v19)
  {
    if (v25 == 963)
    {
      v8 = v28;
      if (!v28) {
        v8 = v29;
      }
      v18 = v8;
      int v19 = 0;
      int v20 = v27;
      int v21 = 0;
      KB::String::iterator::initialize((KB::String::iterator *)&v18);
      if (v23 != v19)
      {
        KB::String::iterator::operator-();
        if (((0x40001FEu >> u_charType(c)) & 1) == 0) {
          KB::String::iterator::operator-();
        }
      }
      KB::String::iterator::operator+();
      v9 = v28;
      if (!v28) {
        v9 = v29;
      }
      v14 = v9;
      int v15 = v27;
      int v16 = v27;
      UChar32 c = 0;
      KB::String::iterator::initialize((KB::String::iterator *)&v14);
      if (v19 != v15)
      {
        KB::String::iterator::operator+();
        if (((0x40001FEu >> u_charType(v13)) & 1) == 0) {
          KB::String::iterator::operator+();
        }
      }
    }
    KB::String::append((KB::String *)v26);
    KB::String::iterator::operator++();
    v10 = v28;
    if (!v28) {
      v10 = v29;
    }
    v18 = v10;
    int v19 = v27;
    int v20 = v27;
    int v21 = 0;
    KB::String::iterator::initialize((KB::String::iterator *)&v18);
  }
  objc_super v11 = KB::ns_string((KB *)v26, v7);
  KB::String::~String((KB::String *)v26);
  KB::String::~String((KB::String *)&v27);

  return v11;
}

- (BOOL)shouldAddModifierSymbolsToWordCharacters
{
  return 0;
}

- (id)nonstopPunctuationCharacters
{
  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardFeatureSpecialization_el;
  v2 = [(TIKeyboardFeatureSpecialization *)&v5 nonstopPunctuationCharacters];
  v3 = [v2 stringByAppendingString:@"´¨΅"];

  return v3;
}

@end