@interface UIResponder(_NTKResponderFix)
- (uint64_t)_ntk_becomeFirstResponder;
@end

@implementation UIResponder(_NTKResponderFix)

- (uint64_t)_ntk_becomeFirstResponder
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  char v9 = [a1 becomeFirstResponder];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__UIResponder__NTKResponderFix___ntk_becomeFirstResponder__block_invoke;
  v5[3] = &unk_1E62C3040;
  v5[4] = a1;
  v5[5] = &v6;
  v2 = (void (**)(void))_Block_copy(v5);
  v2[2]();
  ((void (*)(void (**)(void)))v2[2])(v2);
  ((void (*)(void (**)(void)))v2[2])(v2);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

@end