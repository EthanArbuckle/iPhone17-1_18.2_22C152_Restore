@interface UIButtonConfiguration
@end

@implementation UIButtonConfiguration

uint64_t __124__UIButtonConfiguration_SBUISystemApertureStyling__sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 colorWithAlphaComponent:0.25];
}

uint64_t __96__UIButtonConfiguration_SBUISystemApertureStyling__sbui_systemApertureSymbolButtonConfiguration__block_invoke(uint64_t a1, void *a2)
{
  return [a2 colorWithAlphaComponent:0.25];
}

id __101__UIButtonConfiguration_SBUISystemApertureStyling___sbui_titleTextAttributesTransformerForTitleFont___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKey:*MEMORY[0x1E4F42508]];
  return v3;
}

@end