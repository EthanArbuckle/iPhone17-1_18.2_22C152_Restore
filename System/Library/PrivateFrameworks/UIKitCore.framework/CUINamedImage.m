@interface CUINamedImage
@end

@implementation CUINamedImage

void __46__CUINamedImage_UIKitAdditions__configuration__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setUserInterfaceIdiom:", +[_UIAssetManager _userInterfaceIdiomForDeviceClass:](_UIAssetManager, "_userInterfaceIdiomForDeviceClass:", objc_msgSend(v3, "themeIdiom")));
  [*(id *)(a1 + 40) scale];
  objc_msgSend(v4, "setDisplayScale:");
  objc_msgSend(v4, "setDisplayGamut:", objc_msgSend(*(id *)(a1 + 32), "themeDisplayGamut"));
  objc_msgSend(v4, "setHorizontalSizeClass:", objc_msgSend(*(id *)(a1 + 32), "themeSizeClassHorizontal"));
  objc_msgSend(v4, "setVerticalSizeClass:", objc_msgSend(*(id *)(a1 + 32), "themeSizeClassVertical"));
  objc_msgSend(v4, "setLayoutDirection:", __UITraitEnvironmentLayoutDirectionFromCUILayoutDirection(objc_msgSend(*(id *)(a1 + 40), "layoutDirection")));
}

@end