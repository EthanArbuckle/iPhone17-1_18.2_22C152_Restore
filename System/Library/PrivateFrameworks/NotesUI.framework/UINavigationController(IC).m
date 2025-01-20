@interface UINavigationController(IC)
- (uint64_t)_canShowWhileLocked;
- (uint64_t)ic_configureBarsHideBackground:()IC hideHairlines:prefersLargeTitles:;
- (void)ic_configureBarsHideBackground:()IC hideHairlines:prefersLargeTitles:blurEffectMatchesBackground:;
- (void)ic_hideBackground:()IC;
- (void)ic_hideHairlines:()IC;
- (void)ic_pushViewControllerAfterActiveTransition:()IC animated:;
- (void)ic_useSingleLineA;
@end

@implementation UINavigationController(IC)

- (uint64_t)_canShowWhileLocked
{
  return 1;
}

- (void)ic_configureBarsHideBackground:()IC hideHairlines:prefersLargeTitles:blurEffectMatchesBackground:
{
  v11 = [a1 navigationBar];
  [v11 setPrefersLargeTitles:a5];

  id v12 = objc_alloc_init(MEMORY[0x1E4FB19D8]);
  id v20 = v12;
  if (!a3)
  {
    [v12 configureWithDefaultBackground];
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  [v12 configureWithTransparentBackground];
  if (a4)
  {
LABEL_5:
    [v20 setShadowColor:0];
    [v20 setShadowImage:0];
  }
LABEL_6:
  if (a6)
  {
    v13 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    [v20 setBackgroundEffect:v13];
  }
  v14 = [a1 navigationBar];
  [v14 setStandardAppearance:v20];

  if ((a5 & 1) == 0)
  {
    v15 = [a1 navigationBar];
    [v15 setScrollEdgeAppearance:v20];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4FB1DF8]);
  v17 = v16;
  if (!a3)
  {
    [v16 configureWithDefaultBackground];
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  [v16 configureWithTransparentBackground];
  if (a4)
  {
LABEL_14:
    [v17 setShadowColor:0];
    [v17 setShadowImage:0];
  }
LABEL_15:
  if (a6)
  {
    v18 = [MEMORY[0x1E4FB14C8] effectWithStyle:4];
    [v20 setBackgroundEffect:v18];
  }
  v19 = [a1 toolbar];
  [v19 setStandardAppearance:v17];
}

- (uint64_t)ic_configureBarsHideBackground:()IC hideHairlines:prefersLargeTitles:
{
  return objc_msgSend(a1, "ic_configureBarsHideBackground:hideHairlines:prefersLargeTitles:blurEffectMatchesBackground:", a3, a4, a5, 0);
}

- (void)ic_hideHairlines:()IC
{
  v5 = [a1 navigationBar];
  int v6 = [v5 _hidesShadow];

  if (v6 != a3)
  {
    v7 = [a1 navigationBar];
    [v7 _setHidesShadow:a3];
  }
  v8 = [a1 toolbar];
  int v9 = [v8 _hidesShadow];

  if (v9 != a3)
  {
    id v10 = [a1 toolbar];
    [v10 _setHidesShadow:a3];
  }
}

- (void)ic_hideBackground:()IC
{
  v5 = [a1 navigationBar];
  id v7 = v5;
  if (a3)
  {
    int v6 = objc_opt_new();
    [v7 setBackgroundImage:v6 forBarMetrics:0];

    id v7 = [a1 navigationBar];
    [v7 setBarTintColor:0];
  }
  else
  {
    [v5 setBackgroundImage:0 forBarMetrics:0];
  }
}

- (void)ic_useSingleLineA
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 navigationBar];
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  uint64_t v3 = v15;
  v4 = [a1 navigationBar];
  v5 = [v4 _defaultTitleFont];
  int v6 = objc_msgSend(v5, "ic_fontWithSingleLineA");
  v16[0] = v6;
  id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  [v2 setTitleTextAttributes:v7];

  v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2980] addingSymbolicTraits:2 options:0];
  int v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];
  id v10 = [a1 navigationBar];
  uint64_t v13 = v3;
  v11 = objc_msgSend(v9, "ic_fontWithSingleLineA");
  v14 = v11;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  [v10 setLargeTitleTextAttributes:v12];
}

- (void)ic_pushViewControllerAfterActiveTransition:()IC animated:
{
  id v6 = a3;
  id v7 = [a1 transitionCoordinator];

  if (v7)
  {
    v8 = [a1 transitionCoordinator];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __82__UINavigationController_IC__ic_pushViewControllerAfterActiveTransition_animated___block_invoke;
    v9[3] = &unk_1E5FDD088;
    v9[4] = a1;
    id v10 = v6;
    char v11 = a4;
    [v8 animateAlongsideTransition:0 completion:v9];
  }
  else
  {
    [a1 pushViewController:v6 animated:a4];
  }
}

@end