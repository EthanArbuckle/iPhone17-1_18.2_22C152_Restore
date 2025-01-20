@interface UINavigationControllerDefaultVisualStyleProvider
@end

@implementation UINavigationControllerDefaultVisualStyleProvider

void __79___UINavigationControllerDefaultVisualStyleProvider_idiomToVisualStyleClassMap__block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v3[0] = &unk_1ED3F2B98;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1ED3F2BB0;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1ED3F2BC8;
  v4[2] = objc_opt_class();
  v3[3] = &unk_1ED3F2BE0;
  v4[3] = objc_opt_class();
  v3[4] = &unk_1ED3F2BF8;
  v4[4] = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:5];
  uint64_t v1 = [v0 mutableCopy];
  v2 = (void *)qword_1EB25EF60;
  qword_1EB25EF60 = v1;
}

@end