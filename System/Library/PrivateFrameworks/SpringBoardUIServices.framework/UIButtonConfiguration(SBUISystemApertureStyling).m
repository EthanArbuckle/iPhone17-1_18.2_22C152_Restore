@interface UIButtonConfiguration(SBUISystemApertureStyling)
+ (id)_sbui_titleTextAttributesTransformerForTitleFont:()SBUISystemApertureStyling;
+ (id)sbui_systemApertureSymbolButtonConfiguration;
+ (id)sbui_systemApertureTextButtonConfiguration;
+ (id)sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:()SBUISystemApertureStyling;
@end

@implementation UIButtonConfiguration(SBUISystemApertureStyling)

+ (id)sbui_systemApertureTextButtonConfiguration
{
  v2 = objc_msgSend(MEMORY[0x1E4F42F80], "sbui_bestTraitCollection");
  v3 = objc_msgSend(a1, "sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:", v2);

  return v3;
}

+ (id)sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:()SBUISystemApertureStyling
{
  id v4 = a3;
  v5 = [a1 tintedButtonConfiguration];
  [v5 setCornerStyle:4];
  v6 = [MEMORY[0x1E4F428B8] systemExtraLightGrayColor];
  [v5 setBaseBackgroundColor:v6];

  v7 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v5 setBaseForegroundColor:v7];

  v8 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:", v4);

  v9 = objc_msgSend(a1, "_sbui_titleTextAttributesTransformerForTitleFont:", v8);
  [v5 setTitleTextAttributesTransformer:v9];
  v10 = [MEMORY[0x1E4F42A98] configurationWithFont:v8 scale:2];
  [v5 setPreferredSymbolConfigurationForImage:v10];

  [v5 setButtonSize:3];
  [v5 contentInsets];
  [v5 setContentInsets:v11 + -5.0];
  [v5 setImagePadding:7.0];
  v12 = [v5 background];
  [v12 setBackgroundColorTransformer:&__block_literal_global_4];

  return v5;
}

+ (id)sbui_systemApertureSymbolButtonConfiguration
{
  v1 = [a1 tintedButtonConfiguration];
  [v1 setCornerStyle:4];
  v2 = [MEMORY[0x1E4F428B8] systemExtraLightGrayColor];
  [v1 setBaseBackgroundColor:v2];

  v3 = [MEMORY[0x1E4F428B8] systemWhiteColor];
  [v1 setBaseForegroundColor:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4F42A98], "sbui_systemApertureControlConfiguration");
  [v1 setPreferredSymbolConfigurationForImage:v4];

  [v1 setButtonSize:3];
  v5 = [v1 background];
  [v5 setBackgroundColorTransformer:&__block_literal_global_16];

  return v1;
}

+ (id)_sbui_titleTextAttributesTransformerForTitleFont:()SBUISystemApertureStyling
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __101__UIButtonConfiguration_SBUISystemApertureStyling___sbui_titleTextAttributesTransformerForTitleFont___block_invoke;
  v7[3] = &unk_1E5CCCE38;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x1AD0CF1C0](v7);

  return v5;
}

@end