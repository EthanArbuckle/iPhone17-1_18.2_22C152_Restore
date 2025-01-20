@interface UIColor
@end

@implementation UIColor

id __51__UIColor_PencilPairingUI___pnp_betaLabelTextColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] blackColor];
  }
  else {
  v2 = [MEMORY[0x263F1C550] whiteColor];
  }
  return v2;
}

id __64__UIColor_PencilPairingUI___pnp_betaLabelTextEncapsulationColor__block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.552941203;
    double v3 = 0.576470613;
  }
  else
  {
    double v2 = 0.533333361;
    double v3 = 0.549019635;
  }
  v4 = [MEMORY[0x263F1C550] colorWithRed:v2 green:v2 blue:v3 alpha:1.0];
  return v4;
}

@end