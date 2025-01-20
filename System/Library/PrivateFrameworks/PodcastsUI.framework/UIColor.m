@interface UIColor
@end

@implementation UIColor

void __36__UIColor_MTAdditions__appTintColor__block_invoke()
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithRed:0.447058824 green:0.141176471 blue:0.847058824 alpha:1.0];
  v1 = (void *)appTintColor_tintColor;
  appTintColor_tintColor = v0;

  uint64_t v2 = [MEMORY[0x1E4FB1618] colorWithRed:0.611764706 green:0.352941176 blue:0.949019608 alpha:1.0];
  v3 = (void *)appTintColor_lightTintColor;
  appTintColor_lightTintColor = v2;

  v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:0];
  v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:2];
  v8[0] = v4;
  v8[1] = v5;
  v9[0] = appTintColor_tintColor;
  v9[1] = appTintColor_lightTintColor;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v7 = (void *)appTintColor_colorsByTraitCollection;
  appTintColor_colorsByTraitCollection = v6;
}

void __51__UIColor_MTAdditions__cellEmpahsisBackgroundColor__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) appTintColor];
  uint64_t v1 = [v3 colorWithAlphaComponent:0.1];
  uint64_t v2 = (void *)cellEmpahsisBackgroundColor_color;
  cellEmpahsisBackgroundColor_color = v1;
}

uint64_t __53__UIColor_MTAdditions__cellEmpahsisSwitchBorderColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithWhite:0.800000012 alpha:1.0];
  uint64_t v1 = cellEmpahsisSwitchBorderColor_color;
  cellEmpahsisSwitchBorderColor_color = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end