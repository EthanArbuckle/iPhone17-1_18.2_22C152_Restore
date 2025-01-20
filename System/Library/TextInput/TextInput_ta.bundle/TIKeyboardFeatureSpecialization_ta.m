@interface TIKeyboardFeatureSpecialization_ta
- (BOOL)allowsAutocorrectionOfValidWords;
- (BOOL)dictionaryUsesExternalEncoding;
- (BOOL)doesComposeText;
- (BOOL)isQwertyLayout;
- (id)nonstopPunctuationCharacters;
- (void)setQwertyLayout:(BOOL)a3;
- (void)specializeInputManager:(void *)a3 forLayoutState:(id)a4;
@end

@implementation TIKeyboardFeatureSpecialization_ta

- (void)specializeInputManager:(void *)a3 forLayoutState:(id)a4
{
  v6 = [a4 softwareLayout];
  -[TIKeyboardFeatureSpecialization_ta setQwertyLayout:](self, "setQwertyLayout:", [v6 isEqualToString:@"QWERTY-Tamil"]);

  v7 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  CFLocaleRef v8 = [v7 locale];
  LOBYTE(self) = [(TIKeyboardFeatureSpecialization_ta *)self isQwertyLayout];
  v9 = (std::__shared_weak_count *)operator new(0x30uLL);
  v9->__shared_owners_ = 0;
  v9->__shared_weak_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E45E8;
  uint64_t v10 = KB::InputManagerSpecialization::InputManagerSpecialization((KB::InputManagerSpecialization *)&v9[1], v8);
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5E4620;
  LOBYTE(v9[1].__shared_weak_owners_) = (_BYTE)self;
  uint64_t v11 = v10;
  v12 = v9;
  TIInputManager::set_input_manager_specialization((TIInputManager *)a3, &v11);
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v12);
  }
}

- (BOOL)doesComposeText
{
  return 1;
}

- (BOOL)dictionaryUsesExternalEncoding
{
  return ![(TIKeyboardFeatureSpecialization_ta *)self isQwertyLayout];
}

- (id)nonstopPunctuationCharacters
{
}

- (BOOL)allowsAutocorrectionOfValidWords
{
  return ![(TIKeyboardFeatureSpecialization_ta *)self isQwertyLayout];
}

- (BOOL)isQwertyLayout
{
  return self->_qwertyLayout;
}

- (void)setQwertyLayout:(BOOL)a3
{
  self->_qwertyLayout = a3;
}

@end