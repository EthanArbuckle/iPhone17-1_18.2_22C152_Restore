@interface TIKeyboardFeatureSpecialization_es
- (void)createInputManager:(id)a3;
@end

@implementation TIKeyboardFeatureSpecialization_es

- (void)createInputManager:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardFeatureSpecialization_es;
  v4 = [(TIKeyboardQuickTypeSpecialization *)&v12 createInputManager:a3];
  v5 = [(TIKeyboardFeatureSpecialization *)self inputMode];
  CFLocaleRef v6 = [v5 locale];

  v7 = (std::__shared_weak_count *)operator new(0x28uLL);
  v7->__shared_weak_owners_ = 0;
  v7->__shared_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DC130;
  uint64_t v8 = KB::InputManagerSpecialization::InputManagerSpecialization((KB::InputManagerSpecialization *)&v7[1], v6);
  v7[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_26F5DC168;
  uint64_t v10 = v8;
  v11 = v7;
  atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  TIInputManager::set_input_manager_specialization(v4, &v10);
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v11);
  }
  std::__shared_weak_count::__release_shared[abi:nn180100](v7);

  return v4;
}

@end