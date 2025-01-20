@interface UIColor(NewsUI)
+ (id)nu_darkStyleDividerColor;
+ (id)nu_dividerColor;
+ (id)nu_dynamicColor:()NewsUI withDarkStyleVariant:;
+ (id)nu_lightStyleDividerColor;
+ (uint64_t)nu_defaultSystemTintColor;
+ (uint64_t)nu_defaultTitleTextColor;
@end

@implementation UIColor(NewsUI)

+ (uint64_t)nu_defaultTitleTextColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (id)nu_dynamicColor:()NewsUI withDarkStyleVariant:
{
  v14[2] = *MEMORY[0x263EF8340];
  v5 = (void *)MEMORY[0x263F1CB00];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 traitCollectionWithUserInterfaceStyle:0];
  v9 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v13[0] = v8;
  v13[1] = v9;
  v14[0] = v7;
  v14[1] = v6;
  v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [MEMORY[0x263F1C550] _dynamicColorWithColorsByTraitCollection:v10];

  return v11;
}

+ (uint64_t)nu_defaultSystemTintColor
{
  return [MEMORY[0x263F1C550] systemPinkColor];
}

+ (id)nu_dividerColor
{
  if (nu_dividerColor_onceToken != -1) {
    dispatch_once(&nu_dividerColor_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)nu_dividerColor_dividerColor;

  return v0;
}

+ (id)nu_lightStyleDividerColor
{
  if (nu_lightStyleDividerColor_onceToken != -1) {
    dispatch_once(&nu_lightStyleDividerColor_onceToken, &__block_literal_global_4_0);
  }
  v0 = (void *)nu_lightStyleDividerColor_dividerColor;

  return v0;
}

+ (id)nu_darkStyleDividerColor
{
  if (nu_darkStyleDividerColor_onceToken != -1) {
    dispatch_once(&nu_darkStyleDividerColor_onceToken, &__block_literal_global_6_1);
  }
  v0 = (void *)nu_darkStyleDividerColor_dividerColor;

  return v0;
}

@end