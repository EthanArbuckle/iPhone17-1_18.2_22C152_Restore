@interface TIKeyboardFeatureSpecialization
@end

@implementation TIKeyboardFeatureSpecialization

void __66__TIKeyboardFeatureSpecialization_en_terminatorsDeletingAutospace__block_invoke(uint64_t a1)
{
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)TIKeyboardFeatureSpecialization_en;
  v1 = objc_msgSendSuper2(&v4, sel_terminatorsDeletingAutospace);
  v2 = (void *)[v1 mutableCopy];

  [v2 addCharactersInString:@"'’"];
  v3 = (void *)terminatorsDeletingAutospace_result;
  terminatorsDeletingAutospace_result = (uint64_t)v2;
}

@end