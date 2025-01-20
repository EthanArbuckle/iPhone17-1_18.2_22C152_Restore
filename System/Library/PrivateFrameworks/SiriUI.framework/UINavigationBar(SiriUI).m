@interface UINavigationBar(SiriUI)
- (void)siriui_customizeAppearanceGivenSAEEnabled:()SiriUI;
@end

@implementation UINavigationBar(SiriUI)

- (void)siriui_customizeAppearanceGivenSAEEnabled:()SiriUI
{
  v17[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if ((SiriSharedUIDeviceIsPad() & 1) == 0)
    {
      id v15 = objc_alloc_init(MEMORY[0x263F1C7E8]);
      [a1 setStandardAppearance:v15];
      [a1 setScrollEdgeAppearance:v15];
      [a1 setCompactAppearance:v15];
      [a1 setCompactScrollEdgeAppearance:v15];
      v4 = [a1 _backgroundView];
      v5 = [v4 layer];
      v6 = [MEMORY[0x263F1C920] mainScreen];
      v7 = [v6 traitCollection];
      [v7 displayCornerRadius];
      objc_msgSend(v5, "setCornerRadius:");

      v8 = [a1 _backgroundView];
      v9 = [v8 layer];
      [v9 setMaskedCorners:3];

      v10 = [a1 _backgroundView];
      [v10 setClipsToBounds:1];
    }
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F1C6B0]);
    [a1 setBackgroundImage:v11 forBarMetrics:0];

    v12 = [MEMORY[0x263F1C550] whiteColor];
    [a1 setTintColor:v12];
    uint64_t v16 = *MEMORY[0x263F1C240];
    v17[0] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [a1 setTitleTextAttributes:v13];

    v14 = [a1 backItem];
    [v14 setTitle:&stru_26D647E48];

    [a1 _setHidesShadow:1];
  }
}

@end