@interface PXInfoMenuElementSelectedTextColor
@end

@implementation PXInfoMenuElementSelectedTextColor

void ___PXInfoMenuElementSelectedTextColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1618] colorWithDynamicProvider:&__block_literal_global_61_294007];
  v1 = (void *)_PXInfoMenuElementSelectedTextColor_color;
  _PXInfoMenuElementSelectedTextColor_color = v0;
}

id ___PXInfoMenuElementSelectedTextColor_block_invoke_2(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2)
  {
    double v2 = 0.9;
    double v3 = 0.0;
  }
  else
  {
    double v2 = 0.86;
    double v3 = 1.0;
  }
  v4 = [MEMORY[0x1E4FB1618] colorWithWhite:v3 alpha:v2];
  return v4;
}

@end