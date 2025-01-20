@interface UIButton(SBUISystemApertureStyling)
- (void)sbui_updateConfiguration;
@end

@implementation UIButton(SBUISystemApertureStyling)

- (void)sbui_updateConfiguration
{
  v2 = [a1 configuration];
  id v7 = (id)[v2 copy];

  v3 = (void *)MEMORY[0x1E4F42A30];
  v4 = [a1 traitCollection];
  v5 = objc_msgSend(v3, "sbui_systemAperturePreferredTextButtonFontCompatibleWithTraitCollection:", v4);

  v6 = objc_msgSend(MEMORY[0x1E4F427E8], "_sbui_titleTextAttributesTransformerForTitleFont:", v5);
  [v7 setTitleTextAttributesTransformer:v6];
  [a1 setConfiguration:v7];
}

@end