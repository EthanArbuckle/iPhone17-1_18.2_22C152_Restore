@interface TIKeyboardFeatureSpecialization_de
- (BOOL)shouldLearnLowercaseAtBeginningOfSentence;
- (id)externalStringToInternal:(id)a3;
- (id)internalStringToExternal:(id)a3;
- (void)createInputManager:(id)a3;
@end

@implementation TIKeyboardFeatureSpecialization_de

- (void)createInputManager:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardFeatureSpecialization_de;
  v4 = [(TIKeyboardQuickTypeSpecialization *)&v11 createInputManager:a3];
  v5 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  CFLocaleRef v6 = [v5 locale];

  v7 = (std::__shared_weak_count *)operator new(0x30uLL);
  v7->__shared_weak_owners_ = 0;
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DB9D8;
  uint64_t v9 = KB::InputManagerSpecialization_de::InputManagerSpecialization_de((KB::InputManagerSpecialization_de *)&v7[1], v6);
  v10 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  TIInputManager::set_input_manager_specialization(v4, &v9);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v10);
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v7);

  return v4;
}

- (BOOL)shouldLearnLowercaseAtBeginningOfSentence
{
  return 0;
}

- (id)externalStringToInternal:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v4 = (KB *)a3;
  __p = operator new(8uLL);
  void *__p = 0x2CB000000B4;
  KB::utf8_string(v10, v4, v5);

  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
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
  [(TIKeyboardFeatureSpecialization *)self precomposedCharacterSet];
  KB::compose_diacritics();
  v5 = KB::ns_string((KB *)v8, v4);
  KB::String::~String((KB::String *)v8);
  KB::String::~String((KB::String *)v7);

  return v5;
}

@end