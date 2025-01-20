@interface CUINamedVectorGlyph
@end

@implementation CUINamedVectorGlyph

void __52__CUINamedVectorGlyph_UIKitAdditions__configuration__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 scale];
  objc_msgSend(v4, "setDisplayScale:");
  objc_msgSend(v4, "setDisplayGamut:", objc_msgSend(*(id *)(a1 + 32), "displayGamut"));
  objc_msgSend(v4, "setLayoutDirection:", __UITraitEnvironmentLayoutDirectionFromCUILayoutDirection(objc_msgSend(*(id *)(a1 + 32), "layoutDirection")));
}

@end