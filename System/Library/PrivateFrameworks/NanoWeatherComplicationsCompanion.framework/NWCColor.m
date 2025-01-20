@interface NWCColor
+ (UIColor)conditionsBackgroundColor;
+ (UIColor)conditionsBlueTintColor;
+ (UIColor)conditionsNoDataColor;
+ (UIColor)conditionsYellowTintColor;
+ (UIColor)systemGrayTextColor;
+ (UIColor)tintColor;
+ (UIColor)titleNoDataColor;
@end

@implementation NWCColor

+ (UIColor)systemGrayTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.7];
}

+ (UIColor)conditionsBackgroundColor
{
  if (conditionsBackgroundColor_onceToken != -1) {
    dispatch_once(&conditionsBackgroundColor_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)conditionsBackgroundColor_ConditionsBackgroundColor;

  return (UIColor *)v2;
}

void __37__NWCColor_conditionsBackgroundColor__block_invoke()
{
  id v2 = +[NWCColor tintColor];
  uint64_t v0 = [v2 colorWithAlphaComponent:0.2];
  v1 = (void *)conditionsBackgroundColor_ConditionsBackgroundColor;
  conditionsBackgroundColor_ConditionsBackgroundColor = v0;
}

+ (UIColor)conditionsBlueTintColor
{
  if (conditionsBlueTintColor_onceToken != -1) {
    dispatch_once(&conditionsBlueTintColor_onceToken, &__block_literal_global_2);
  }
  id v2 = (void *)conditionsBlueTintColor_ConditionsBlueTintColor;

  return (UIColor *)v2;
}

uint64_t __35__NWCColor_conditionsBlueTintColor__block_invoke()
{
  conditionsBlueTintColor_ConditionsBlueTintColor = [MEMORY[0x263F1C550] colorWithRed:0.376470588 green:0.788235294 blue:0.97254902 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

+ (UIColor)conditionsYellowTintColor
{
  if (conditionsYellowTintColor_onceToken != -1) {
    dispatch_once(&conditionsYellowTintColor_onceToken, &__block_literal_global_5);
  }
  id v2 = (void *)conditionsYellowTintColor_ConditionsYellowTintColor;

  return (UIColor *)v2;
}

uint64_t __37__NWCColor_conditionsYellowTintColor__block_invoke()
{
  conditionsYellowTintColor_ConditionsYellowTintColor = [MEMORY[0x263F1C550] colorWithRed:0.992156863 green:0.839215686 blue:0.270588235 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

+ (UIColor)tintColor
{
  return (UIColor *)[MEMORY[0x263F1C550] systemCyanColor];
}

+ (UIColor)conditionsNoDataColor
{
  if (conditionsNoDataColor_onceToken != -1) {
    dispatch_once(&conditionsNoDataColor_onceToken, &__block_literal_global_7);
  }
  id v2 = (void *)conditionsNoDataColor_ConditionsNoDataColor;

  return (UIColor *)v2;
}

uint64_t __33__NWCColor_conditionsNoDataColor__block_invoke()
{
  conditionsNoDataColor_ConditionsNoDataColor = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.25];

  return MEMORY[0x270F9A758]();
}

+ (UIColor)titleNoDataColor
{
  if (titleNoDataColor_onceToken != -1) {
    dispatch_once(&titleNoDataColor_onceToken, &__block_literal_global_9);
  }
  id v2 = (void *)titleNoDataColor_TitleNoDataColor;

  return (UIColor *)v2;
}

uint64_t __28__NWCColor_titleNoDataColor__block_invoke()
{
  titleNoDataColor_TitleNoDataColor = [MEMORY[0x263F1C550] colorWithRed:0.501960784 green:0.501960784 blue:0.501960784 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

@end