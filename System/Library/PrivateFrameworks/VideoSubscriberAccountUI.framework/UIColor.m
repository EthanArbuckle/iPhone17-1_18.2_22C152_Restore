@interface UIColor
@end

@implementation UIColor

id __75__UIColor_VSAdditions__vsa_dynamicColorWithLightStyleColor_darkStyleColor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 userInterfaceStyle];
  uint64_t v4 = 40;
  if (v3 == 2) {
    uint64_t v4 = 32;
  }
  id v5 = *(id *)(a1 + v4);
  return v5;
}

uint64_t __45__UIColor_VSAdditions__vsa_opacityADarkColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
  uint64_t v1 = vsa_opacityADarkColor___color;
  vsa_opacityADarkColor___color = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __46__UIColor_VSAdditions__vsa_opacityALightColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:1.0];
  uint64_t v1 = vsa_opacityALightColor___color;
  vsa_opacityALightColor___color = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __45__UIColor_VSAdditions__vsa_opacityBDarkColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.5];
  uint64_t v1 = vsa_opacityBDarkColor___color;
  vsa_opacityBDarkColor___color = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __46__UIColor_VSAdditions__vsa_opacityBLightColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.6];
  uint64_t v1 = vsa_opacityBLightColor___color;
  vsa_opacityBLightColor___color = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __45__UIColor_VSAdditions__vsa_opacityCDarkColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.3];
  uint64_t v1 = vsa_opacityCDarkColor___color;
  vsa_opacityCDarkColor___color = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t __46__UIColor_VSAdditions__vsa_opacityCLightColor__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.4];
  uint64_t v1 = vsa_opacityCLightColor___color;
  vsa_opacityCLightColor___color = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end