@interface UITraitCollection(SBUIAdditions)
+ (id)traitCollectionWithUserInterfaceStyleCompatibleWithLegibilitySettings:()SBUIAdditions;
@end

@implementation UITraitCollection(SBUIAdditions)

+ (id)traitCollectionWithUserInterfaceStyleCompatibleWithLegibilitySettings:()SBUIAdditions
{
  id v3 = a3;
  v4 = v3;
  double v9 = 0.0;
  if (!v3
    || (([v3 primaryColor],
         v5 = objc_claimAutoreleasedReturnValue(),
         [v5 getWhite:&v9 alpha:0],
         v5,
         v9 <= 0.5)
      ? (uint64_t v6 = 1)
      : (uint64_t v6 = 2),
        objc_msgSend(MEMORY[0x263F1CB00], "traitCollectionWithUserInterfaceStyle:", v6, v9),
        (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:0];
  }

  return v7;
}

@end