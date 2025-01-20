@interface UIBarItemAppearanceStorage
@end

@implementation UIBarItemAppearanceStorage

void __64___UIBarItemAppearanceStorage_enumerateTextAttributesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 integerValue], v5);
}

@end