@interface UITraitCollectionFromThemeKey
@end

@implementation UITraitCollectionFromThemeKey

uint64_t ___UITraitCollectionFromThemeKey_block_invoke(uint64_t a1, void *a2)
{
  [a2 setUserInterfaceStyle:*(void *)(a1 + 32)];
  [a2 setUserInterfaceIdiom:*(void *)(a1 + 40)];
  [a2 setAccessibilityContrast:*(unsigned __int8 *)(a1 + 56)];
  [a2 setDisplayGamut:*(unsigned __int8 *)(a1 + 57)];
  BOOL v4 = *(void *)(a1 + 48) == 1;
  return [a2 setUserInterfaceLevel:v4];
}

@end