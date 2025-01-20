@interface UIColor
@end

@implementation UIColor

void __34__UIColor_NewsUI__nu_dividerColor__block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C550];
  objc_msgSend(MEMORY[0x263F1C550], "nu_lightStyleDividerColor");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(MEMORY[0x263F1C550], "nu_darkStyleDividerColor");
  uint64_t v2 = objc_msgSend(v0, "nu_dynamicColor:withDarkStyleVariant:", v4, v1);
  v3 = (void *)nu_dividerColor_dividerColor;
  nu_dividerColor_dividerColor = v2;
}

uint64_t __44__UIColor_NewsUI__nu_lightStyleDividerColor__block_invoke()
{
  nu_lightStyleDividerColor_dividerColor = [MEMORY[0x263F1C550] colorWithWhite:0.901960784 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

uint64_t __43__UIColor_NewsUI__nu_darkStyleDividerColor__block_invoke()
{
  nu_darkStyleDividerColor_dividerColor = [MEMORY[0x263F1C550] colorWithWhite:0.0980392157 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

@end