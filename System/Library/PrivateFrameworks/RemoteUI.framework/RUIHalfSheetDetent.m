@interface RUIHalfSheetDetent
+ (BOOL)shouldUsePadHeightForTraitCollection:(id)a3;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (RUIHalfSheetDetent)init;
@end

@implementation RUIHalfSheetDetent

- (RUIHalfSheetDetent)init
{
  v3 = +[_UISheetDetent _detentWithContainerViewBlock:&__block_literal_global_4];

  return v3;
}

double __26__RUIHalfSheetDetent_init__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 traitCollection];
  BOOL v4 = +[RUIHalfSheetDetent shouldUsePadHeightForTraitCollection:v3];

  if (v4)
  {
    double v5 = 648.0;
  }
  else
  {
    [v2 safeAreaInsets];
    double v5 = 500.0 - v6;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)shouldUsePadHeightForTraitCollection:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 horizontalSizeClass] == 2 && objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v4;
}

@end